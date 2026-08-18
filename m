Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0EC240EBA7
	for <dmaengine@vger.kernel.org>; Tue, 18 Aug 2026 07:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787039716; cv=none; b=fu54vv3qQTTs+0ut4kbFq3/WGQkty0rXmKHqTPl5YZAf4RYcH7eOfYhpZNCTetj+yYBm+KG10fk7A+Top3OSv6cGU5Mu86xyX5Xb69u0noWYMfHwwyf6jLn7uM3QJmp60bbHZ3FsgRvT/vNFogig38RhE2tm0oCrX9LOl1PSAQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787039716; c=relaxed/simple;
	bh=I0ZrDpMUMB/uwSz9ttU60LFbJhx2wEdiIO8THx2mIuI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fGky4e3nEHKzi4uw0csfA7v3wudApVB5uig0iHNSJ+tQ4RR5kYTS8JxRFtlfI8RurC1myaaq23AP8nVzK5AlgONYcMUItA0KDYPBIV7hN2NSn72gzFgo+zthQ0Zkhtotf2pTLaPU4HLE9PWPZmuyeG+HenCXDrMY4k1OtzzXYNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZHtd/JvP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZHtd/JvP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 071181F000E9;
	Tue, 18 Aug 2026 07:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787039710;
	bh=rI83OdMSekvqq/D1Pa7rC6Pw1Syyocj/ct+lB0W6QPA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZHtd/JvPleGdjqXJTat9UBsuxxQCOlfnMWyMBazuZAOI2XKeQIeVpxZp6gQPVdYiD
	 P/d9PXhh9or9bCD5ykqyrViDYhEp2b+85G5/hXGhmQewblF1ILbMlSw6QpFwXmGdIK
	 szf3gHqQadjraV39lWFo8VSxJDk+03dsR+oZBetwJHx7JjN8ZutIKVZVKY1MJCywbx
	 mv/LKN4dgJV8iSK4y3YKfe1cv1ZKMJrWy7kA06uP/HbkG+EjUvRlKoWAvY+4rV233F
	 1qb+ZPnxjo0/UGIBSFUSWriSw7G7puXJF1vxSrUzwiWEckrOwUNHrnOwzhE6J9t8yi
	 PlbGn7qhl1HwQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] dmaengine: xilinx_dma: Fix hardware buffer
 descriptor chain after cyclic DMA
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alex Bereza" <alex@bereza.email>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260818-fix-hw-buf-desc-after-cyclic-mode-v2-1-530ff44c6a81@bereza.email>
References: <20260818-fix-hw-buf-desc-after-cyclic-mode-v2-1-530ff44c6a81@bereza.email>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 07:55:09 +0000
Message-Id: <20260818075510.071181F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Hardware executes physically non-contiguous multi-segment tran=
sfers out of order, causing silent data corruption.
- [High] Concurrent lockless modifications to chan->free_seg_list directly =
corrupt list pointers and trigger kernel panics.
- [High] Multiple cyclic descriptors are simultaneously queued, violating h=
ardware limits and breaking cyclic execution.
--

--- Patch [1]: [PATCH v2] dmaengine: xilinx_dma: Fix hardware buffer descri=
ptor chain after cyclic DMA ---
commit 9ccc605c4c1fab881ccb3335638f86979c8c66c7
Author: Alex Bereza <alex@bereza.email>

dmaengine: xilinx_dma: Fix hardware buffer descriptor chain after cyclic DMA

Using the DMA in cyclic mode modifies the hardware buffer descriptor chain =
so
that the last descriptor used by the cyclic transfer points back to the fir=
st
descriptor. However, it never restores the original descriptor ring. This
breaks using non-cyclic mode after cyclic mode.

Link: https://patch.msgid.link/20260817-fix-hw-buf-desc-after-cyclic-mode-v=
1-1-1fe47e701d6c@bereza.email

> diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_=
dma.c
> index bef2b031dba19..650e078fcdb74 100644
> --- a/drivers/dma/xilinx/xilinx_dma.c
> +++ b/drivers/dma/xilinx/xilinx_dma.c

[ ... ]

> @@ -786,7 +796,7 @@ static void xilinx_mcdma_clean_hw_desc(struct xilinx_=
aximcdma_desc_hw *hw)
>  static void xilinx_dma_free_tx_segment(struct xilinx_dma_chan *chan,
>  				struct xilinx_axidma_tx_segment *segment)
>  {
> -	xilinx_dma_clean_hw_desc(&segment->hw);
> +	xilinx_dma_clean_hw_desc(chan, segment);
> =20
>  	list_add_tail(&segment->node, &chan->free_seg_list);
>  }

[Severity: High]
This isn't a bug introduced by this patch, but does this list manipulation
require locking to avoid concurrent modifications?

Looking at xilinx_dma_tx_submit(), it can call into this function on an err=
or
path without acquiring chan->lock:

xilinx_dma_tx_submit() {
	...
	if (chan->cyclic) {
		xilinx_dma_free_tx_descriptor(chan, desc);
		return -EBUSY;
	}
	...
}

xilinx_dma_prep_slave_sg() also has a similar unlocked error path:

xilinx_dma_prep_slave_sg() {
	...
error:
	xilinx_dma_free_tx_descriptor(chan, desc);
	return NULL;
}

If another thread simultaneously allocates descriptors via
xilinx_axidma_alloc_tx_segment() (which acquires chan->lock and calls
list_del()), could this corrupt the free_seg_list pointers and lead to a
kernel panic?

[Severity: Critical]
This is a pre-existing issue, but can the hardware execute descriptors in t=
he
wrong order here and cause silent data corruption?

xilinx_dma_prep_slave_sg() dynamically allocates segments from the
free_seg_list without explicitly updating their hw->next_desc links:

xilinx_dma_prep_slave_sg() {
	...
	/* Get a free segment */
	segment =3D xilinx_axidma_alloc_tx_segment(chan);
	...
}

If the free_seg_list becomes fragmented from aborted transfers freeing segm=
ents
out of order, or concurrent allocations, the allocated segments for a trans=
fer
may not be physically contiguous.

Since this relies entirely on the static next_desc linkages programmed duri=
ng
allocation, will the hardware blindly follow the static next_desc into a
physically adjacent element that might belong to another transaction?

[Severity: High]
This is a pre-existing issue, but can multiple cyclic descriptors be queued
simultaneously and break the cyclic descriptor ring?

In xilinx_dma_tx_submit(), the check for chan->cyclic is performed before
acquiring chan->lock:

xilinx_dma_tx_submit() {
	...
	if (chan->cyclic) {
		xilinx_dma_free_tx_descriptor(chan, desc);
		return -EBUSY;
	}
	...
}

If two cyclic descriptors are submitted simultaneously, they could both byp=
ass
this check and then serialize on chan->lock.

Once serialized, append_desc_queue() alters the next_desc of the first
descriptor's tail segment:

append_desc_queue() {
	...
	axidma_tail_segment->hw.next_desc =3D (u32)desc->async_tx.phys;
	...
}

Could this overwrite the tail descriptor of the first cyclic transfer to po=
int
to the second descriptor, completely breaking the cyclic ring?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818-fix-hw-buf=
-desc-after-cyclic-mode-v2-1-530ff44c6a81@bereza.email?part=3D1
