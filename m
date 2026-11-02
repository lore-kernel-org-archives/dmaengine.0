Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793602942;
	b=R0PGo0YFgMYVAxAoTEoeigvX50WAaNBSVv+BC5obbbIfYeWJ27bKssdBhvGwnkr/GKiS
	 udPGAO7mfT50dqtjIYElL3P9BbdTLgaZDVbnigiVOghYP02377ePib/oKD89JVWKjKEjv
	 WpUuOuYtGH8zrnSTfbN1faDHlPuVaUL1IJ3iOPcSLUDWf1W2i5j0xeHpqzybUqEeulob6
	 gp1dKj2BGedCok/539P9CiMW6ltGd7bMRW11iZDZiCMZ3sWBKedlKoIy+DvXD7BL/kfb4
	 pa/mW8pZs4dwiqqD+ze4pNif/sj91kfkpbBvY80SOZaHmhXXtcJQhJWLkS6/yQTO5XQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793602942;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=kvankmk2QFXC2vUWQQIwHDpzEngj0wySdroAo3N/rgg=;
	b=2cpYi1B6V8om8shvhLREH1I64C6rXWfhkIjYDUPaKul2z1b/pkbY/zDi8d6lz5ysT45L
	 PFcSTwYAXLUn44FYPiuK+D3WmXJ25At2L02CO7KH7uziyN2c+ogU4cMVQhiVcQ4mvbmx5
	 MagC9O1RwGL+jRc5oi3ttWmXA3i+DFzsilLSpVQUysKa7ciE81KcdtDua7PA/i9Zs3Bco
	 MpcU7B5YbjepaF/Qvlh7HxlrrmBm8pi1a5kPH6hkRfoKITeWYS5kc9Gl4xTgUJH6gDuSr
	 lT6eSrfQsfCoKJ5dECjPrLe7Q/t9b44g+U42SMPqczteOpQPyLX2zQ/dSo/IWjVaMkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nuJQynR2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1BD2606A324;
	Mon,  2 Nov 2026 07:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nuJQynR2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB52E1F000C1;
	Mon,  2 Nov 2026 07:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793602942;
	bh=kvankmk2QFXC2vUWQQIwHDpzEngj0wySdroAo3N/rgg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nuJQynR2ng6XCCV3Z1nG3dCTO8JGO/aCpCP2nF008o3i/xjDaJnBv5eQJqRO1Oejw
	 iH2xAyHsA/T6p9auMpsgLuImCVve+FTKqpIg5u1ePLcFj37lzpZPHB/JSMoiL5h54p
	 xOaip9FrgzF9rVENles7o6NhwGcTXGQ/aXKjEq1++KPqR1XoObBvPJkE5QMEdygqsV
	 Uku5QmiDGofBqWDrkQhNO6Z2DCIWJb7+wtdCKxAkikTkczZ8wQsWQjmmxLwjEAymch
	 hsdFTX0Y61hB8jU0TI30BbA15tWapsJOOJOQcM7RfLZIa3YLn7o8018JzxNfvFqjRL
	 zzINP3NSUUSUg==
Message-ID: <sashiko-outbox-192994@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/7] dmaengine: add a bus for DMA channel devices
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: imx@lists.linux.dev, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261102-edma-iommu-v3-v3-2-9d0e62a954eb@Example.Com>
References: <20261102-edma-iommu-v3-v3-0-9d0e62a954eb@Example.Com>
 <20261102-edma-iommu-v3-v3-2-9d0e62a954eb@Example.Com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 07:02:21 +0000
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
- [Medium] dmaengine: unmap pool leak on error return in dma_bus_init()
--

commit 3da3c262ba473326c89ad5f74821c3da53e57669
Author: Peng Fan <peng.fan@nxp.com>

dmaengine: add a bus for DMA channel devices

This commit adds a dedicated dma_chan_bus_type bus for DMA channel devices
and registers it in dma_bus_init() so that per-channel IOMMU configuration
can work properly.

> diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
> index 34be53487a21d..6fea67f088b35 100644
> --- a/drivers/dma/dmaengine.c
> +++ b/drivers/dma/dmaengine.c
> @@ -1643,17 +1643,35 @@ void dma_run_dependencies(struct dma_async_tx_des=
criptor *tx)
>  }
>  EXPORT_SYMBOL_GPL(dma_run_dependencies);
> =20
> +static int dma_chan_bus_match(struct device *dev,
> +			      const struct device_driver *drv)
> +{
> +	return 0;
> +}
> +
> +const struct bus_type dma_chan_bus_type =3D {
> +	.name  =3D "dma",
> +	.match =3D dma_chan_bus_match,
> +};
> +
>  static int __init dma_bus_init(void)
>  {
>  	int err =3D dmaengine_init_unmap_pool();
> =20
> +	if (err)
> +		return err;
> +
> +	err =3D bus_register(&dma_chan_bus_type);
>  	if (err)
>  		return err;
> =20
>  	err =3D class_register(&dma_devclass);
> -	if (!err)
> -		dmaengine_debugfs_init();
> +	if (err) {
> +		bus_unregister(&dma_chan_bus_type);
> +		return err;
> +	}

[Severity: Medium]
If bus_register(&dma_chan_bus_type) or class_register(&dma_devclass) fails =
in
dma_bus_init(), does this leak the slab caches and mempools allocated in
unmap_pool[] by dmaengine_init_unmap_pool()?

Previously, class_register(&dma_devclass) failure also missed calling
dmaengine_destroy_unmap_pool(), and the new bus_register() error path and
updated class_register() rollback path both return without calling
dmaengine_destroy_unmap_pool() to clean up unmap_pool[].

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-edma-iommu=
-v3-v3-0-9d0e62a954eb@Example.Com?part=3D2
