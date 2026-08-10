Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918953F823D
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 18:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786387853; cv=none; b=epXrbZy1ImEJb3L48tQsjgHhbBWWHMFvlf815n0NRhFsh61zE+AmIx9pVwnEhnTsjxgYabGM/XvWL1takKyFnyY3H7oe7Ts4k/KKapB1hkrHAOqAsCC7sV+v3M7yx6xWE/oIUEjP13B9cBZX0mSfcxZdUKbb9h9NQZ2DgLk3S30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786387853; c=relaxed/simple;
	bh=dUPAV2PRj+vjYVHysRZVZRjL5Ossrr+vEBmUrmGTr9w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VwcMN/luSf00TD5GHyIu9djhTDZIk5mEtNm3qSZcxkyZpt2LGI2l3mqxgu+WjfD9L3ctYLNCizLEN0QF9DbIIJL9kYkADO8l0JLBnRRw/+/ZS1Ys8MM2W51dvTXoy4BOig8HhzvgtYYxC9VHAZrAEOkMbjPoPUiVqXy/60hNVnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GhvB9EFP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GhvB9EFP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15AAC1F000E9;
	Mon, 10 Aug 2026 18:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786387852;
	bh=i0CGRqg5SB4rXAJN200lJc63f8UjJztysWjCAO3BCOk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GhvB9EFPLwnDF4efTW2DZ2l8Vb2coMqqLV6GpUZWMMGpx5UvKOUEe657vKA9TA8rr
	 xHJIursmg7nOni2/mqkOlPidl/aMA0dD2ouU92wDlHc+HxdhAva8QKz9XjdnUpMEUF
	 C1eSwocaqFGAtU0Ei2VLjtEVgJnorXTT+at3bZ212mNLRCFqUx7t4bN3ElTgo/Cdgw
	 1MA8Fjhx/meFSkrZi+rbKZjOs5EjHyQ9Ut0rXnuc5xasKRGqA84MrcdNaGAtzEiS1R
	 MdnzgphXN981A8aXZvWuePxBOP1zL7g3SgQnRS8IMwsRtqtllqSpMVSbAl6HECP7gh
	 /D53nEGJKnLUg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 33/34] dmaengine: qcom-gpi: defer callbacks via vchan
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <c575a24c789317a5ec330a4be0a6ea1ece60b5ae.1786384169.git.allen.lkml@gmail.com>
References: <cover.1785183549.git.allen.lkml@gmail.com>
 <cover.1786384168.git.allen.lkml@gmail.com>
 <c575a24c789317a5ec330a4be0a6ea1ece60b5ae.1786384169.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 18:50:51 +0000
Message-Id: <20260810185052.15AAC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] The driver defers completion callbacks to a bottom-half (virt-dma =
BH) but fails to implement the `device_synchronize` callback. This breaks `=
dmaengine_terminate_sync()`, allowing client callbacks to execute concurren=
tly with client resource freeing, leading to potential use-after-free bugs.
- [High] dmaengine_kill_bh() is called after gpi_free_ring(), allowing the =
virt-dma bottom half to execute client callbacks while the channel's hardwa=
re ring buffer is already freed and zeroed, leading to a divide-by-zero ker=
nel panic.

Pre-existing issues:
- [High] If a client submits multiple descriptors before calling `dma_async=
_issue_pending()`, `gpi_issue_pending` drops all but the last descriptor.
--

--- Patch [33]: [PATCH v3 33/34] dmaengine: qcom-gpi: defer callbacks via v=
chan ---
commit b8f9701fb8c3295335854c36b7913f03c0929404
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: qcom-gpi: defer callbacks via vchan

Complete descriptors through virt-dma instead of invoking callbacks
directly from event processing. This preserves the transfer result for
the shared vchan BH, which invokes the callback and frees the descriptor;
drain that BH before releasing channel resources.

> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
> index a5055a6273af6..2bc3a07ef0920 100644
> --- a/drivers/dma/qcom/gpi.c
> +++ b/drivers/dma/qcom/gpi.c
[ ... ]
> @@ -2009,6 +2017,7 @@ static void gpi_free_chan_resources(struct dma_chan=
 *chan)
> =20
>  	/* free all allocated memory */
>  	gpi_free_ring(&gchan->ch_ring, gpii);
> +	dmaengine_kill_bh(&gchan->vc.chan);

[Severity: High]
Does this sequence leave a race window where the bottom half tasklet
can access freed structures?

If dmaengine_kill_bh() is called after gpi_free_ring(), the virt-dma
bottom half could execute client callbacks while the channel's hardware
ring buffer is already freed and zeroed. If the client callback submits
a new transfer, gpi_prep_slave_sg() will invoke
gpi_ring_num_elements_avail(), which divides by ring->el_size. Since
the ring is zeroed, would this cause a divide-by-zero kernel panic?

Could dmaengine_kill_bh() be called before tearing down hardware
resources?


[Severity: High]
Since this patch defers completion callbacks to a virt-dma bottom half,
how does the driver synchronize these callbacks during channel teardown?

drivers/dma/qcom/gpi.c:gpi_probe() {
    ...
	gpi_dev->dma_device.device_free_chan_resources =3D gpi_free_chan_resources;
	gpi_dev->dma_device.device_tx_status =3D dma_cookie_status;
    ...
}

Without implementing the device_synchronize callback, does
dmaengine_terminate_sync() operate as a no-op regarding synchronization
of deferred callbacks? If a client terminates a channel and immediately
frees its buffers, could the still-running bottom-half callback access
freed memory?

Before this patch, gpi_terminate_all() acquired gpii->pm_lock, which
natively synchronized with the event tasklet. Is it necessary to assign
vchan_synchronize to gpi_dev->dma_device.device_synchronize to restore
this safety guarantee?


[Severity: High]
This isn't a bug introduced by this patch, but looking at batched
submissions in gpi_issue_pending():

drivers/dma/qcom/gpi.c:gpi_issue_pending() {
    ...
	/* move all submitted descriptors to issued list */
	spin_lock_irqsave(&gchan->vc.lock, flags);
	if (vchan_issue_pending(&gchan->vc))
		vd =3D list_last_entry(&gchan->vc.desc_issued,
				     struct virt_dma_desc, node);
    ...
}

If a client submits multiple descriptors before calling
dma_async_issue_pending(), does this logic drop all but the last
descriptor?

Extracting only the last descriptor and queueing its TREs to the
hardware ring would mean when the hardware completes this single
transfer, the driver's event handler pops the first descriptor from
the issued list. Could this mismatch between hardware transfers and
software completions leave the remaining descriptors permanently
uncompleted and corrupt data?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1786384168.gi=
t.allen.lkml@gmail.com?part=3D33
