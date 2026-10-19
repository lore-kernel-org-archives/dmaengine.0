Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792436179;
	b=1S3dHR4rxeUp1fC/2BbKaHD74z2yLbSAjDs+iTSYC05F6D1i9tasioYOFDELr2R/sW7O
	 UbZo05WHB+hKEpw+xUuCrWo9bgQdVmT+dH0QQ4kwFl0c31txaiaUrHMur2lEo9LeHr4lk
	 dNAoJ0YUR5HUj4s1zzYDgVv1oxBBwik0WksCgoCv3GBCf3UzlwlALznd+Q6yZA48l0LY4
	 LBSKH1YbKG3w5cLylUp2WgFK3ajAowVF/wmr5Tmv0CaGl5/fI7Tjw0AAmkFUqHdeoHEYQ
	 kBT06Odh5K3LAfxLVxe8wrTu/kQsWf4NVyPSERMcuhycvxO6sCyfgxN55qNHNaPg3Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792436179;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/nziCvbd1cTn7JyTXSA+ZRh5590FViyXvsFRRw1wgGc=;
	b=b159XRwej3WGe59yQUOuxx6JGHANKm7qgczGRzh7XYfhxwXiZParR5JHGP3s+GPy1xXv
	 IbAyqwwkccIw4NXM7SRulXX52v6vypyPC6yKZuiy8i59+hb0z52pAOb47P/siu4Xf7+hQ
	 +6rnYacHCfMQKj0WzBsSt0HurZX3SgrQDooamxppwGtG/Eq/b2HPyCiJdYae0n48WI9lq
	 7BxPvQ745Mc1zRB7CyshaVWQWuXAeF5ZP5Ye5Va1COHo5LcWfH8OoebVf6lGRxgWo3vHd
	 h209UjOnP8Lo201axEKtce1ePDWkn07DZ+2PgBrUdLzmb3PRbMUzCvyCL9mGaJqcAMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WwRyH+K+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E39606A32C
	for <dmaengine@vger.kernel.org>; Mon, 19 Oct 2026 18:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WwRyH+K+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0BC41F000C6;
	Mon, 19 Oct 2026 18:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792436178;
	bh=/nziCvbd1cTn7JyTXSA+ZRh5590FViyXvsFRRw1wgGc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WwRyH+K+CdgS9bC13ys1QCUgMOfuslTbhUraHA63YklmkcRAeG2cbj8z32g275rWF
	 Gna25cXRW8pH5q/iGWAwRStR+57Q+/42UMT/MXkt1toz7bKNIoGMS/q3L/zZEElfkc
	 eV08WphmwNwyoOgTnoZuiks9CsBn0ES4fHDc8nz+M5ho8JgeQJbsY9fcF0B+Yk48lG
	 T5WwgzoeAy3SvYs0yYwXjx3OBmAHfgG4qgDLpYmzATwYWJt34xQ9k3BS6YwYg+PNK0
	 XDHONpBkY+MjOr3WuW75599nk62ONf6ymdPGD14Oak5pIhaoPgRcq6OGW5p97Wg6K9
	 9TLf9KRnX/yNg==
Message-ID: <sashiko-outbox-178117@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 14/17] dmaengine: idxd: complete an iaa_crypto
 descriptor through its own driver on abort and flush
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Byrne" <daniel1.byrne@intel.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261019150630.4026341-15-daniel1.byrne@intel.com>
References: <20261019150630.4026341-1-daniel1.byrne@intel.com>
 <20261019150630.4026341-15-daniel1.byrne@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 18:56:18 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] dmaengine: idxd: active DMA unmap and UAF in idxd_flush_pendin=
g_descs()
--

commit 17311ece6ccc1def94a5c98267c599339eae70ce
Author: Daniel Byrne <daniel1.byrne@intel.com>

dmaengine: idxd: complete an iaa_crypto descriptor through its own driver o=
n abort and flush

This commit updates idxd_flush_pending_descs() and llist_abort_desc() to
complete or skip non-dmaengine descriptors via their own driver's completion
handler rather than treating them as dmaengine transactions, and avoids
blocking in idxd_alloc_desc() when a workqueue is permanently dying.

> diff --git a/drivers/dma/idxd/device.c b/drivers/dma/idxd/device.c
> index 222c201669bdd..a33c4309f5d42 100644
> --- a/drivers/dma/idxd/device.c
> +++ b/drivers/dma/idxd/device.c
> @@ -1534,10 +1534,25 @@ static void idxd_flush_pending_descs(struct idxd_=
irq_entry *ie,
>  		list_del(&desc->list);
>  		ctype =3D desc->completion->status ? IDXD_COMPLETE_NORMAL : IDXD_COMPL=
ETE_ABORT;
>  		/*
> -		 * wq is being disabled. Any remaining descriptors are
> -		 * likely to be stuck and can be dropped. callback could
> -		 * point to code that is no longer accessible, for example
> -		 * if dmatest module has been unloaded.
> +		 * Another driver's descriptor carries that driver's request
> +		 * in place of a txd, and a client may still wait for it, so it
> +		 * goes back through that driver's completion. The completion
> +		 * reads the outcome from the record, which the device never
> +		 * wrote for an unfinished descriptor. Only a dmaengine channel
> +		 * terminates, so nothing of such a queue is quarantined.
> +		 */
> +		if (!idxd_wq_has_txd(wq)) {
> +			if (ctype =3D=3D IDXD_COMPLETE_ABORT)
> +				desc->completion->status =3D IDXD_COMP_DESC_ABORT;
> +			idxd_desc_complete(desc, ctype, true);
> +			continue;
> +		}

[Severity: Critical]
When an iaa_crypto workqueue with in-flight interrupt-armed requests is
disabled via iaa_crypto_remove() -> idxd_drv_disable_wq(), idxd_wq_free_irq=
()
calls idxd_flush_pending_descs() unconditionally even if idxd_wq_drain()
timed out:

drivers/dma/idxd/device.c:idxd_drv_disable_wq() {
	...
	idxd_wq_unmap_portal(wq);
	rc =3D idxd_wq_drain(wq);
	idxd_wq_free_irq(wq);
	rc |=3D idxd_wq_reset(wq);
	...
}

If idxd_wq_drain() returns -ETIMEDOUT (either because DRAIN_WQ timed out or
because an earlier command set IDXD_FLAG_CMD_TIMEDOUT), the hardware engine=
 is
still active and processing unfinished descriptors when
idxd_flush_pending_descs() runs.

For an unfinished descriptor (ctype =3D=3D IDXD_COMPLETE_ABORT), calling
idxd_desc_complete() invokes iaa_desc_complete():

drivers/crypto/intel/iaa/iaa_crypto_main.c:iaa_desc_complete() {
	...
err:
	dma_unmap_sg(dev, ctx->req->dst, sg_nents(ctx->req->dst), DMA_FROM_DEVICE);
	iaa_unmap_src(dev, ctx->req);
out:
	if (ret !=3D 0)
		dev_dbg(dev, "asynchronous compress failed ret=3D%d\n", ret);

	if (ctx->req->base.complete)
		acomp_request_complete(ctx->req, err);

	if (free_desc)
		idxd_free_desc(idxd_desc->wq, idxd_desc);
	iaa_wq_put(idxd_desc->wq);
}

Doesn't completing an unfinished descriptor here while the device is still
active cause active DMA unmapping and use-after-free? Specifically:

1. iaa_desc_complete() unmaps ctx->req->dst and ctx->req->src (and via
iaa_unmap_src() unmaps req_ctx->bounce_src_dma and frees req_ctx->bounce_src
back to iaa_bounce_pool) while the hardware engine may still be DMA-reading
src1_addr and DMA-writing dst_addr.

2. acomp_request_complete() notifies the caller, which can free or reuse the
request and scatterlist buffers while hardware DMA is still in flight.

3. iaa_wq_put() drops the iaa_wq reference. During iaa_crypto_remove(),
iaa_wq->remove is set to true, so dropping the last reference calls
__free_iaa_wq() -> free_iaa_device() -> remove_device_compression_modes() ->
free_device_compression_mode(), freeing device_mode->aecs_comp_table via
dma_free_coherent() while an in-flight compression descriptor in hardware
still reads src2_addr (aecs_comp_table_dma_addr).

4. Because iaa_desc_complete() ignores comp_type and inspects
idxd_desc->iax_completion->status via check_completion(), can a concurrent
hardware completion write between setting desc->completion->status =3D
IDXD_COMP_DESC_ABORT and check_completion() overwrite IDXD_COMP_DESC_ABORT
with IAX_COMP_SUCCESS or IAA_ANALYTICS_ERROR, causing iaa_desc_complete() to
treat the aborted descriptor as succeeded or retryable during teardown?

>  		/*
> -		 * wq is being disabled. Any remaining descriptors are
[ ... ]
>  		tx =3D &desc->txd;
>  		tx->callback =3D NULL;

[ ... ]

>
> --=20
> 2.51.2
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019150630.4026=
341-1-daniel1.byrne@intel.com?part=3D14
