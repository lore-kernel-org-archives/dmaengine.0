Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22883DEFFE
	for <dmaengine@vger.kernel.org>; Mon, 17 Aug 2026 09:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786959610; cv=none; b=DHVIVOx4oQaUng3uHas2smV/mAmG9aHdtDbi8Hq4O9YCG4ev5csp9+A9A4hQ7CUb/l5jk7ETmIk7JSQmtaGsrZYI/YU60THpJAd0qF+7G9h2w9boEhzjMfI2xGIrjf79wmFAlVAr5GH7OW/M3ElvYTKPPragTmH/FNO8n/8QI84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786959610; c=relaxed/simple;
	bh=9/F5Q3FwsDuKOfeBcy3JWp47e+xouaM07yGD2nBjgBg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lNocXtAH8jlykFkAOfWq9m+jFY74u0XghduRJHHGDre1hGc8+r4ZnHruX2yanLo/bPr+U3RhhRULWuAHSEGzooy45Oal77UHagU1Ft/ami4N2sRa7WEKqIR4Fkl5CRCim8ZyhrFdVU0ojVDac3/dpo5cauB/tb9l1uII7Kovc5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eYjRWZ/5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eYjRWZ/5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A74621F000E9;
	Mon, 17 Aug 2026 09:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786959604;
	bh=FmXh+mir61PDYir76abCqe1e8ZDrsWyxojrSVFnSouc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eYjRWZ/5sub+tkdc/q96Bd6knw9xQAnXLjz0o5MZWHxR+n2y6wzR7eqSFnAPDK5/D
	 OpJhl7CpIr/G/MhXHbkxJuyzIy5rbkMJdIM8RhY9ZePu7rA0JjCOJXvXKKHgY0Pdvj
	 aNIeWbdOQAf3dMEEC0f976QoEX71QCSS2L/kVL/UuFdKO6fusvC04PoKBFUNrED2zj
	 jpgexY9D9uVNhbZsR3h9txDDbkBIxKEYvMSmIkHNrapiMlP80dc4ylqNjNFpdjH7VY
	 e2A0eAvM7OX1QM97MxXi0lMH8J/NxUem+qISf9+L6BaDgi/L/UstyjPTwNuU0xs1Si
	 Q5phmLBiWr8KA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: xilinx_dma: Fix hardware buffer descriptor
 reuse order
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alex Bereza" <alex@bereza.email>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260817-fix-hw-buf-desc-reuse-v1-1-d79827a844c7@bereza.email>
References: <20260817-fix-hw-buf-desc-reuse-v1-1-d79827a844c7@bereza.email>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 09:40:04 +0000
Message-Id: <20260817094004.A74621F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Missing `chan->lock` protection when freeing descriptors in er=
ror paths leads to data corruption in `chan->free_seg_list`.
- [Critical] Race condition between dmaengine_terminate_all() and dmaengine=
_submit() overwrites the chan->terminating flag, leading to a Use-After-Fre=
e.
- [High] Race condition between xilinx_dma_chan_desc_cleanup and xilinx_dma=
_terminate_all corrupts the static descriptor ring order, defeating the pur=
pose of this patch.
- [High] Rejecting a transaction in xilinx_dma_tx_submit() due to cyclic mo=
de frees descriptors out of order, permanently breaking the hardware static=
 ring.
- [High] Calling dma_run_dependencies() while holding chan->lock causes a d=
eadlock if the dependent transaction is on the same channel.
--

--- Patch [1]: [PATCH] dmaengine: xilinx_dma: Fix hardware buffer descripto=
r reuse order ---
commit 55ac771a816780299793bc5e59ad89b6ef3446b0
Author: Alex Bereza <alex@bereza.email>

dmaengine: xilinx_dma: Fix hardware buffer descriptor reuse order
   =20
This patch corrects the order in which hardware buffer descriptors are retu=
rned
to the free segment list during channel cleanup. By freeing the pending list
last, it ensures descriptors are returned in chronological order to maintain
the hardware static ring structure.

> diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_=
dma.c
> index bef2b031dba19..0817b74f74505 100644
> --- a/drivers/dma/xilinx/xilinx_dma.c
> +++ b/drivers/dma/xilinx/xilinx_dma.c
> @@ -920,9 +920,9 @@ static void xilinx_dma_free_descriptors(struct xilinx=
_dma_chan *chan)
> =20
>  	spin_lock_irqsave(&chan->lock, flags);
> =20
> -	xilinx_dma_free_desc_list(chan, &chan->pending_list);
>  	xilinx_dma_free_desc_list(chan, &chan->done_list);
>  	xilinx_dma_free_desc_list(chan, &chan->active_list);
> +	xilinx_dma_free_desc_list(chan, &chan->pending_list);
> =20
>  	spin_unlock_irqrestore(&chan->lock, flags);
>  }

[Severity: High]
This is a pre-existing issue, but does a race condition between
xilinx_dma_chan_desc_cleanup() and xilinx_dma_terminate_all() corrupt the
static descriptor ring order, defeating the purpose of this patch?

The tasklet xilinx_dma_chan_desc_cleanup() drops chan->lock to execute clie=
nt
callbacks:

drivers/dma/xilinx/xilinx_dma.c:xilinx_dma_chan_desc_cleanup() {
        ...
        spin_unlock_irqrestore(&chan->lock, flags);
        dmaengine_desc_get_callback_invoke(&desc->async_tx, &result);
        spin_lock_irqsave(&chan->lock, flags);
        ...
        xilinx_dma_free_tx_descriptor(chan, desc);
}

During this window, xilinx_dma_terminate_all() can execute concurrently,
acquire the lock, and free newer descriptors into chan->free_seg_list
by calling xilinx_dma_free_descriptors(chan).

When the tasklet resumes and frees its older descriptor, it appends it after
the newer ones, which scrambles the static ring order the patch intended to
preserve. Can this lead to a fatal dma internal error when the channel
is reused?

[Severity: High]
This is a pre-existing issue, but does rejecting a transaction in
xilinx_dma_tx_submit() due to cyclic mode also break the hardware static ri=
ng?

If a normal transfer is submitted while chan->cyclic is true, the descripto=
rs
are immediately freed:

drivers/dma/xilinx/xilinx_dma.c:xilinx_dma_tx_submit() {
        ...
        if (chan->cyclic) {
                xilinx_dma_free_tx_descriptor(chan, desc);
                return -EBUSY;
        }
        ...
}

Because older cyclic segments are still active and will be freed later, this
appends newer segments before older ones into chan->free_seg_list. Could th=
is
permanently break the chronological order required by the hardware?

[Severity: Critical]
This is a pre-existing issue, but does missing chan->lock protection when
freeing descriptors in error paths lead to linked list corruption?

In the cyclic check above and in the error path of xilinx_dma_prep_slave_sg=
():

drivers/dma/xilinx/xilinx_dma.c:xilinx_dma_prep_slave_sg() {
        ...
error:
        xilinx_dma_free_tx_descriptor(chan, desc);
        return NULL;
}

The function xilinx_dma_free_tx_descriptor() is called without acquiring
chan->lock. This leads to an unlocked list_add_tail():

drivers/dma/xilinx/xilinx_dma.c:xilinx_dma_free_tx_segment() {
        ...
        xilinx_dma_clean_hw_desc(&segment->hw);
        list_add_tail(&segment->node, &chan->free_seg_list);
}

Could this race against other contexts like the tasklet or normal allocatio=
ns
that modify the list under the lock, causing list corruption in
chan->free_seg_list?

[Severity: High]
This is a pre-existing issue, but does calling dma_run_dependencies() while
holding chan->lock cause a deadlock if the dependent transaction is on the
same channel?

The tasklet re-acquires the lock before running dependencies:

drivers/dma/xilinx/xilinx_dma.c:xilinx_dma_chan_desc_cleanup() {
        ...
        spin_lock_irqsave(&chan->lock, flags);

        /* Run any dependencies, then free the descriptor */
        dma_run_dependencies(&desc->async_tx);
        ...
}

If CONFIG_ASYNC_TX_ENABLE_CHANNEL_SWITCH is enabled and there is a dependent
descriptor on the same channel, dma_run_dependencies() invokes the submit
callback, routing back to xilinx_dma_tx_submit():

drivers/dma/xilinx/xilinx_dma.c:xilinx_dma_tx_submit() {
        ...
        spin_lock_irqsave(&chan->lock, flags);
        ...
}

Since spinlocks are not recursive, won't this attempt to acquire chan->lock
again result in an immediate deadlock?

[Severity: Critical]
This is a pre-existing issue, but does a race condition between
dmaengine_terminate_all() and dmaengine_submit() overwrite the
chan->terminating flag, causing a use-after-free?

A concurrent xilinx_dma_terminate_all() sets the flag without the lock:

drivers/dma/xilinx/xilinx_dma.c:xilinx_dma_terminate_all() {
        ...
        if (!chan->cyclic)
                chan->terminating =3D true;
        ...
}

Then xilinx_dma_tx_submit() unconditionally clears it under the lock:

drivers/dma/xilinx/xilinx_dma.c:xilinx_dma_tx_submit() {
        ...
        chan->terminating =3D false;

        spin_unlock_irqrestore(&chan->lock, flags);
        ...
}

If the tasklet xilinx_dma_chan_desc_cleanup() dropped the lock to run
callbacks, and a client terminates and then submits a new transfer,
chan->terminating becomes false.

drivers/dma/xilinx/xilinx_dma.c:xilinx_dma_chan_desc_cleanup() {
        ...
        /*
         * While we ran a callback the user called a terminate function,
         * which takes care of cleaning up any remaining descriptors
         */
        if (chan->terminating)
                break;
        ...
}

When the tasklet resumes, it fails to break out of the loop. Does this resu=
lt
in dereferencing a freed and recycled next pointer from the safe list
iterator?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817-fix-hw-buf=
-desc-reuse-v1-1-d79827a844c7@bereza.email?part=3D1
