Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794436354;
	b=Toui9sh6gKNtcOMtCobMj0beJhPpxhQhdDRdqQBHwLRBFCSXn0c+iGQuHUV8PBR8BwNF
	 uW9nU07v2yvcqm2NRN4JU0+ftrbw+vhJLHkvyOkuoD1WnqdOFf85a5r7KzPKmYwRYSpl3
	 6ma/U+utzExFnSPWdzjyJeSkG85EE7m4NDQ2mQxKHSnsVgBbZRruraqF/u0jyDIgElf9q
	 LKZ14OKeC+wFawRC1FhnZf6mdOPBPj/uwx+aq6i10YNScMTCJyYKouTRVNObkO0wX65Yu
	 +CNZV3cb5ITxcSosDdwnsKzsPodd+t/ctLDI15MPBgqtStneO5MhXV6heeIg9v/lElQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794436354;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=v28KcM/2RhO1bv2euoRw0Eg3jQVVNM4hsOYgnqGSjb0=;
	b=iNgtmQ7FPT3qnl4TViSxKgbYfg0dGclz1jN1tvoD4u8C7Up3yMsSRzYY7xl7teQbZWvw
	 e//Jm5Qv8SsH+yb23V2n/f7vLONl68HjbPFNfEcB/5sAgQM2nmPRqs9SL4cpsSIIwpodM
	 9HYUQ4NBc3fdY5aDAy8UqJ0BJP0WpHDgfL85q+LEUZMQUzAf8ljt/sprG7LW4dOY/AJdZ
	 VmkUT66SHNW1chdEJFC5DJw0LsPUDZs+mAW4Nemzpm7w84yAmTjxWFbM7p6vnCSwM/eNN
	 6i00nFpoqGIkFNmY5gM28k26r5pkYELjFJN2sUkOfy+wGetbx+17KmvsY/TgVQt71DA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GKOJupiC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80B3606A321
	for <dmaengine@vger.kernel.org>; Wed, 11 Nov 2026 22:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GKOJupiC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FD5B1F00A05;
	Wed, 11 Nov 2026 22:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794436354;
	bh=v28KcM/2RhO1bv2euoRw0Eg3jQVVNM4hsOYgnqGSjb0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GKOJupiCdz9LZedXjASmxW3C0u60tyIcHTdAUBp3m+mDn0tu0MQdErMXbCHQ+Xrzf
	 Jp5c048mOofW9vGp1BxvRcOuKkAG8cqDDWCUjDMgd0+5fOJw/7Bq8fWRX4CB0cDIbX
	 XkR0YiMYBrW/1QGXCvnxVhF3TEjN5EUPTqCpDKnEkFuCVdsa+GjvqA9YK5mRrn1pjy
	 ihZFtOJs1A7Qc5arJ/kWa/xWS2DpsD+hzmFGHcf2WbI2v7kr8GutpxiVpUIvNcFCl4
	 xKQj07xCn0+4yaKrwddw6LDuIs8bqoM776PyS40CxsR9KztAlLzX4zBehJIyS30K2U
	 mFcCTiHUpKOwA==
Message-ID: <sashiko-outbox-209802@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 02/10] dmaengine: ae4dma: Unregister DMA engine in
 ae4_pci_remove()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lee Jones" <lee@kernel.org>, dmaengine@vger.kernel.org
Cc: vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261111215349.1983909-3-lee@kernel.org>
References: <20261111215349.1983909-1-lee@kernel.org>
 <20261111215349.1983909-3-lee@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 22:32:32 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] dmaengine: ae4dma: slab use-after-free in ae4_pci_remove()
  teardown order
--

commit d190c73fccb945a036c5abd1d18c37ce271e68d8
Author: Lee Jones <lee@kernel.org>

dmaengine: ae4dma: Unregister DMA engine in ae4_pci_remove()

This commit exports pt_dmaengine_unregister() and calls it in
ae4_pci_remove() to unregister the DMA device and destroy its descriptor
slab cache on removal.

> diff --git a/drivers/dma/amd/ae4dma/ae4dma-pci.c b/drivers/dma/amd/ae4dma=
/ae4dma-pci.c
> index 8ca34d4457cc0..7f48ebc5b10c6 100644
> --- a/drivers/dma/amd/ae4dma/ae4dma-pci.c
> +++ b/drivers/dma/amd/ae4dma/ae4dma-pci.c
> @@ -132,6 +132,7 @@ static void ae4_pci_remove(struct pci_dev *pdev)
>  {
>  	struct ae4_device *ae4 =3D dev_get_drvdata(&pdev->dev);
> =20
> +	pt_dmaengine_unregister(&ae4->pt);
>  	ae4_destroy_work(ae4);
>  	ae4_deinit(ae4);
>  }

[Severity: Medium]
Can calling pt_dmaengine_unregister() before ae4_destroy_work() cause a
use-after-free on pt->dma_desc_cache?

pt_dmaengine_unregister() calls dma_async_device_unregister() and then
immediately destroys pt->dma_desc_cache, while the per-queue delayed work
items on ae4cmd_q->pws are only stopped afterwards by ae4_destroy_work().
dma_async_device_unregister() does not drain ae4cmd_q->pws, and
pt_synchronize() only synchronizes the vchan tasklet.  If ae4_pending_work()
is still running when the device is unbound, it can free a completed
descriptor into pt->dma_desc_cache after the cache is destroyed:

CPU0                                  kworker
ae4_pci_remove()                      ae4_pending_work()
  pt_dmaengine_unregister()             cmd->pt_cmd_callback()
    dma_async_device_unregister()         pt_cmd_callback_work()
    kmem_cache_destroy(                     ...
      pt->dma_desc_cache)                   vchan_vdesc_fini()
                                              pt_do_cleanup()
                                                kmem_cache_free(
                                                  pt->dma_desc_cache, desc)
                                                  <-- use-after-free
  ae4_destroy_work()

Stopping the workqueues before pt_dmaengine_unregister(), or destroying
pt->dma_desc_cache after ae4_destroy_work(), would avoid this race.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111215349.1983=
909-1-lee@kernel.org?part=3D2
