Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793797719;
	b=Cx3EvIlB8axxyg5GOE+wqB3Zc/SSBW2KcqXVDLzF8Yz7wWBe/j5gPdyDSSy1avzKtnCf
	 Fvx03OrItjChO0JxVKanrQKc5QPdq6NDea2n4bss9wybssgQlj+vReGUgNtoI6yDdiQoF
	 RXFFxumsujq+VQmbv/LoO5bSigkccTMyaeeB6D5/qLko0p6w0EX7kTXRv5WT2Lx20HB0g
	 niKMB7OfrJNSYjtLjArbt/PJhh1m+gdf21tTPEM6IPUgXQJBrqPSF0LOd32RELWJn+i0F
	 WkDV3CgRdlf/vqIDNTXWGBvSA/DXhKSCLeuQfRfpXN+/wz3Mu9ro9akZWafc102u/Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793797719;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=iSfIUyfCKRc55EWDt6I8EFOvGiqA3QTQENqRfeCCvks=;
	b=xvpUx5ojOZAqSrewX25YT1dGt3p4LEq0fC9SFCnqW8w28/ldsK+z/X2p3jVPwywVlFzD
	 DTuyMavL91HYjW78y1IE1nC010xXW55tDXRrgXfLF7s/Z4xhUGDyUlGQRqwr3/wXcTPK7
	 ld0Hc/6qTp0a+qKi1zW25YeNtVB6XSffxe+11sZWEsz2deAao+kes5cx5tmS1sOqaL5R2
	 8pAr+TcEP/5WvBQnIHYRX1/0xNjl0KU2lxREj73P+eI4r4zLUmDAD6DnmfBsGLSTgfSeb
	 g66BC9mhS8upGohcwRSeCh1GyrtB9dmkIKzFrydlasUnL6Ikkmp9BObwdxCizXWSdPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V9sZd8bJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC183606A328;
	Wed,  4 Nov 2026 13:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V9sZd8bJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 162851F000C1;
	Wed,  4 Nov 2026 13:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793797718;
	bh=iSfIUyfCKRc55EWDt6I8EFOvGiqA3QTQENqRfeCCvks=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V9sZd8bJIFxMrU7+WNcU0VPC7l3364cc6ALuq7BG2BwHJvDC8+wA2Spdou3w+EpG1
	 /wLJrYKBUz2KeQQ4kWKWHIJ7ISG3lh1m5QxbQlJ4OZra119sh1wic2hhYZvlsSsWZu
	 46vppfPBHAos0S1f/3AY0aUcJ9b0AXl7ra9wDpo9o3M7YetQpnlyDnvem39vdQseaZ
	 D1PuKZWR4JS+x8shlCkPKeRUL2snRyWKy8SE14qhT0wdBw4Tmz+kbUdfuqASryLTBj
	 eHlORmOISZSBpY2NUIq5egOGtgXSsvjReS0K39hoBP/Qf9HQd+qMNmt7EHObmajOXo
	 HOQhtYjsSy2EA==
Message-ID: <sashiko-outbox-197326@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/5] dmaengine: arm-dma350: Add slave and cyclic
 transfer support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jelly Jia" <Jelly.Jia@cixtech.com>
Cc: devicetree@vger.kernel.org, dmaengine@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261104124411.296640-3-Jelly.Jia@cixtech.com>
References: <20261104124411.296640-1-Jelly.Jia@cixtech.com>
 <20261104124411.296640-3-Jelly.Jia@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 13:08:36 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] dmaengine: arm-dma350: uninitialized sentinel and reset for dch-=
>req
- [Medium] dmaengine: arm-dma350: clearing dch->desc on error in d350_irq()=
 loses error
--

commit 84e756dbc528524c6cc746a33846d36d67c475ad
Author: Jelly Jia <Jelly.Jia@cixtech.com>

dmaengine: arm-dma350: Add slave and cyclic transfer support

This commit adds peripheral scatter-gather and cyclic DMA transfer support =
to
the arm-dma350 driver, including trigger configuration, coherent command po=
ol
management, period callbacks, and residue calculation.

> diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
> index fdc4cd2245798..cfe3bacfab687 100644
> --- a/drivers/dma/arm-dma350.c
> +++ b/drivers/dma/arm-dma350.c

[ ... ]

> @@ -207,14 +252,489 @@ static inline struct d350_chan *to_d350_chan(struc=
t dma_chan *chan)

[ ... ]

> +static int d350_slave_params(struct d350_chan *dch,
> +			     enum dma_transfer_direction direction,
> +			     phys_addr_t *dev_cpu_addr,
> +			     enum dma_data_direction *dev_dir,
> +			     enum dma_slave_buswidth *width, u32 *maxburst)
> +{
> +	struct dma_slave_config config;
> +	unsigned long flags;
> +	int ret;
> +
> +	spin_lock_irqsave(&dch->vc.lock, flags);
> +	config =3D dch->sconfig;
> +	spin_unlock_irqrestore(&dch->vc.lock, flags);
> +
> +	ret =3D d350_check_slave_config(dch, &config);
> +	if (ret)
> +		return ret;
> +	if (dch->req >=3D d350_chan_to_dmac(dch)->nreq)
> +		return -EINVAL;

[Severity: Medium]
Can this check in d350_slave_params() ever evaluate to true?

In d350_probe(), dmac is allocated with devm_kzalloc(), which zero-initiali=
zes
dch->req to 0 for all channels. Because d350_check_slave_config() already
verifies d350_slave_supported(dch) (which requires nreq > 0), and the only
place that updates dch->req is d350_of_xlate() after checking req < dmac->n=
req,
dch->req is always less than dmac->nreq. If a channel is requested without
d350_of_xlate(), slave and cyclic transfers will silently use hardware trig=
ger
request line 0 instead of being rejected here.

In addition, d350_free_chan_resources() does not reset dch->req or clear
dch->sconfig when freeing channel resources:

static void d350_free_chan_resources(struct dma_chan *chan)
{
	struct d350_chan *dch =3D to_d350_chan(chan);

	writel_relaxed(0, dch->base + CH_INTREN);
	d350_terminate_all(chan);
	d350_wait_for_stop(dch);

	free_irq(dch->irq, dch);
	vchan_synchronize(&dch->vc);
	vchan_free_chan_resources(&dch->vc);
}

Should dch->req be initialized to an invalid sentinel such as U32_MAX (or
dmac->nreq) in d350_probe(), and should d350_free_chan_resources() reset
dch->req and clear dch->sconfig so stale request and slave configuration st=
ate
is not retained across channel release and reallocation?

[ ... ]

> @@ -487,22 +1193,28 @@ static irqreturn_t d350_irq(int irq, void *data)
>  		else
>  			vd->tx_result.result =3D DMA_TRANS_ABORTED;
> =20
> -		vd->tx_result.residue =3D d350_get_residue(dch);
> -	} else if (!(ch_status & CH_STAT_INTR_DONE)) {
> -		dev_warn(dev, "Unexpected IRQ source? 0x%08x\n", ch_status);
> -	}
> -	writel_relaxed(ch_status, dch->base + CH_STATUS);
> -
> -	spin_lock(&dch->vc.lock);
> -	vchan_cookie_complete(vd);
> -	if (ch_status & CH_STAT_INTR_DONE) {
> -		dch->status =3D DMA_COMPLETE;
> -		dch->residue =3D 0;
> -		d350_start_next(dch);
> -	} else {
> +		residue =3D d350_get_active_residue(dch);
> +		vd->tx_result.residue =3D residue;
>  		dch->status =3D DMA_ERROR;
> -		dch->residue =3D vd->tx_result.residue;
> +		dch->residue =3D residue;
> +		dch->desc =3D NULL;
> +		if (desc->cyclic)
> +			vchan_terminate_vdesc(vd);
> +		else
> +			vchan_cookie_complete(vd);

[Severity: Medium]
Does clearing dch->desc =3D NULL on the error path in d350_irq() cause error
status to be lost?

When CH_STAT_INTR_ERR is raised for a non-cyclic descriptor, d350_irq() sets
dch->status =3D DMA_ERROR and dch->desc =3D NULL, and calls
vchan_cookie_complete(vd), which sets chan->completed_cookie to the failed
descriptor's cookie.

Because dch->desc is now NULL, a subsequent call to d350_issue_pending() se=
es
!dch->desc and starts the next descriptor:

	spin_lock_irqsave(&dch->vc.lock, flags);
	if (vchan_issue_pending(&dch->vc) && !dch->desc)
		d350_start_next(dch);
	spin_unlock_irqrestore(&dch->vc.lock, flags);

d350_start_next() overwrites dch->cookie and sets dch->status =3D
DMA_IN_PROGRESS. If the consumer then queries d350_tx_status() for the fail=
ed
cookie, dma_cookie_status() returns DMA_COMPLETE, cookie =3D=3D dch->cookie=
 is
false, and d350_find_queued_desc() returns NULL, so d350_tx_status() reports
DMA_COMPLETE with a residue of 0 for the failed transfer.

Clearing dch->desc in d350_irq() also prevents d350_terminate_all() from
resetting dch->status back to DMA_COMPLETE:

	if (dch->desc) {
		if (dch->status !=3D DMA_ERROR)
			vchan_terminate_vdesc(&dch->desc->vd);
		dch->desc =3D NULL;
		dch->status =3D DMA_COMPLETE;
	}

Should dch->desc remain set (or should d350_issue_pending() and
d350_terminate_all() check dch->status =3D=3D DMA_ERROR) so that the error =
state
is preserved until the channel is terminated or queried?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104124411.2966=
40-1-Jelly.Jia@cixtech.com?part=3D2
