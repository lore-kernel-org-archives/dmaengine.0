Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4105628E0F
	for <dmaengine@vger.kernel.org>; Mon, 15 Jun 2026 03:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781492570; cv=none; b=FaZZogesXg3hL6DNzpT9Se1pLhXrQJXUah5dxZSLsUSZm1rSpA6uyKmgUIQwLLKYEqPaB5izDxvCqtg7ZHOBdAt+MKSsL9IFzRbnQdFF92/DaFNcDOGL99dCn20Nl3fc7myUFhjc7Q+ntQVPz+uctZ2gYhSOgZSO64qOX1mpZsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781492570; c=relaxed/simple;
	bh=vkbD/ixQWr0uzQd9TaocHdG2IvOuuKXjPQfoMqt2IJU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fprW3y7fSeNOgnp8uCHUIOCJF4y/54RlCVT9Tub9KgVaPskgxa8ZONF5o+WlsaszzmE/48FeHohbSABUO9qf1u9roAJBgooyu3ZMbOZZgNO1tGIQReYGJI5d06NXXvHU89WNsmEOvjUOCUzjdqN4xiPBITviSQ+emW42SRYS+t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jwbe9Iak; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jwbe9Iak"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E8161F000E9;
	Mon, 15 Jun 2026 03:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781492568;
	bh=b3AF9REz26/KmmnFS5GLDc3N/2JzwRuHoQQoOwssECs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jwbe9IakTpX+unuf5Gl0/qzEygEaKEkzjtp0NMK/Ok2gJ8XXn9TabwokPwVyrr5hk
	 9X/T+yN3TMOqOM8bTjpBoFbp7kk/TfpGu0V3VcQnbe/sEZNmTlAqrm3/3BO4cTLnMX
	 RNAQVKRHTJjJulFiHopYza9V2GgnabiY8EQlkkGqlOpgRVNdEN1r7zTvr4eZMjK1lm
	 TIzQxwOkv/J1Ig7CVWcqQTOXIsFgu7NFJoXMYT2P/mtKGwBDTYq5xjOGGvflkZkLqg
	 rCtvLdl9pOnY6137sD811t/anvT3nBHPWv1nvFZ62lZvq5Lh7vR+nXxNOYFI1rLHOV
	 sizLFVjiZQwRg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: mmp_pdma: fix wrong extended DRCMR base for
 SpacemiT K3
Reply-To: sashiko-reviews@lists.linux.dev
To: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260615-k3-pdma-fix-drcmr-base-v1-1-ee1af124199f@linux.spacemit.com>
References: <20260615-k3-pdma-fix-drcmr-base-v1-1-ee1af124199f@linux.spacemit.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 03:02:48 +0000
Message-Id: <20260615030248.7E8161F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The interrupt handler `mmp_pdma_chan_handler` dereferences `phy->v=
chan` without checking if it is NULL, leading to a kernel panic.
- [High] Disabling a DMA channel by clearing all `run_bits` simultaneously =
drops 64-bit addressing capabilities, potentially corrupting DMA transfers =
while the hardware halts.
- [High] The driver destroys the DMA descriptor pool without synchronously =
killing the channel's tasklet, allowing a running tasklet to access freed r=
esources.
--

commit 8ee69ab96e073f81f565ee82dce7689d911272ac
Author: Troy Mitchell <troy.mitchell@linux.spacemit.com>

dmaengine: mmp_pdma: fix wrong extended DRCMR base for SpacemiT K3

K3 PDMA shares the same DRCMR layout as K1, where the extended DRCMR
base address is 0x1100. Commit 6587b8661a0b ("dmaengine: mmp_pdma: add
SpacemiT K3 support") incorrectly defined DRCMR_EXT_BASE_K3 as 0x1000,
causing all DRCMR accesses for channels >=3D 64 to be off by 0x100. Drop the
bogus DRCMR_EXT_BASE_K3 macro and reuse DRCMR_EXT_BASE_DEFAULT for the K3 o=
ps.

> diff --git a/drivers/dma/mmp_pdma.c b/drivers/dma/mmp_pdma.c
> index 386e85cd4882a..78e3e07e681df 100644
> --- a/drivers/dma/mmp_pdma.c
> +++ b/drivers/dma/mmp_pdma.c

[ ... ]

> @@ -1219,7 +1218,7 @@ static const struct mmp_pdma_ops spacemit_k3_pdma_o=
ps =3D {
>  	.get_desc_dst_addr =3D get_desc_dst_addr_64,
>  	.run_bits =3D (DCSR_RUN | DCSR_LPAEEN | DCSR_EORIRQEN | DCSR_EORSTOPEN),

[Severity: High]
This is a pre-existing issue, but can clearing all run_bits simultaneously
corrupt DMA transfers?

In disable_chan(), the driver stops the DMA by clearing pdev->ops->run_bits
from the DCSR register:

drivers/dma/mmp_pdma.c:disable_chan() {
    ...
	if (phy->vchan) {
		struct mmp_pdma_device *pdev;

		pdev =3D to_mmp_pdma_dev(phy->vchan->chan.device);
		writel(dcsr & ~pdev->ops->run_bits, phy->base + reg);
    ...
}

Since a DMA channel does not halt instantaneously when the RUN bit is
cleared, simultaneously clearing DCSR_LPAEEN strips the upper 32 bits from
the DMA addresses of any remaining in-flight bursts.

This causes the final bursts to overwrite unintended memory in the lower 4G=
B.

Should only DCSR_RUN be toggled when stopping a channel?

>  	.dma_width =3D 64,
> -	.drcmr_ext_base =3D DRCMR_EXT_BASE_K3,
> +	.drcmr_ext_base =3D DRCMR_EXT_BASE_DEFAULT,
>  };

[Severity: High]
This is a pre-existing issue, but can this code cause a kernel panic due
to a NULL pointer dereference?

In mmp_pdma_probe(), IRQs are requested for all channels while phy->vchan
is initialized to NULL. It is only set later when a client allocates a
channel.

If the hardware has pending interrupts from boot, or a spurious interrupt
fires, mmp_pdma_chan_handler() executes this:

drivers/dma/mmp_pdma.c:mmp_pdma_chan_handler() {
    ...
	if (clear_chan_irq(phy) !=3D 0)
		return IRQ_NONE;

	tasklet_schedule(&phy->vchan->tasklet);
    ...
}

Since clear_chan_irq() returns 0 even if vchan is NULL, does the
unconditional dereference of phy->vchan->tasklet trigger a crash?


[Severity: High]
This is a pre-existing issue, but does this code allow a tasklet to access
freed resources?

In mmp_pdma_free_chan_resources(), the descriptor pool is destroyed:

drivers/dma/mmp_pdma.c:mmp_pdma_free_chan_resources() {
    ...
	dma_pool_destroy(chan->desc_pool);
	chan->desc_pool =3D NULL;
	chan->idle =3D true;
    ...
}

However, the driver never calls tasklet_kill(&chan->tasklet) to synchronize
with the tasklet.

If dma_do_tasklet() is running concurrently on another CPU, it may block
until mmp_pdma_free_chan_resources() completes. Once it resumes, it attempts
to free descriptors using dma_pool_free() on the destroyed pool.

Can this lead to a use-after-free or a kernel oops?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615-k3-pdma-fi=
x-drcmr-base-v1-1-ee1af124199f@linux.spacemit.com?part=3D1
