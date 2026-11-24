Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795521196;
	b=4e/f4P9f3zHRBKT3oo6KVSvIiqxgWECvp61zXUUnxm+UjEzYeWPtscPT7Q3IvxLriR9E
	 Wr7LSqlmcBMBN3CEoB7UKwuh2yBRAVNGZHVMaVVLO3Mh+u0F71SY0qM+/5YQgvLdtDZfq
	 aRh4+xIbCBPRlCApkuJUkcjBQSIQQcKmnGR2JRgdczYR/krLvJi+/GNvyKPJNgaMXRlMv
	 BXG1ekbAwyRBt4cXuRYkbMjilTWJipKW92AynRq9YbacffOsTmkLRxzsok2EkfSrB9J26
	 bBBFERGjyO4c03mKrdgB8YAMIo7Y4PVY2WR6AQhSYRVjBb6+ppJAQjoB5hJxT9lsYlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795521196;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=oaFayEffo3MNcarTb+o/kmKAw3G1OmHyenhLFmobEjU=;
	b=w3Ipbba35Num6Q3akfFXYp57Zfg4kYCeRKcW60Rmj3Y7nBPddehOx88enndh5t0fQSLh
	 0VYinAPsaBECE6lc5mNr1JbJ8/mWMmg3Gm6SZo1ZctrrETvaHe1OTBhQrKNH8tdUK2VcC
	 YOICwWBcV+WeBR3J3Inro5ZFHNNB7SyrqXK34wn2yY45F77Z4mNh9lAa/HcVj8Pke/vva
	 zrmTzXnczrCns+gKKLjPpwUvBJV36nQr48gPVsi/SFktrmEGaqmX18F3SzpreI3s5Tud2
	 MXVU8gXggazcu+8adFRgQgHimToXuvJOg09hmjz9Vn0fLNZZpG/l+gX/dT7pesUdvxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AH+wuiTd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46EB606A321;
	Tue, 24 Nov 2026 11:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AH+wuiTd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC45B1F000C0;
	Tue, 24 Nov 2026 11:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795521196;
	bh=oaFayEffo3MNcarTb+o/kmKAw3G1OmHyenhLFmobEjU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AH+wuiTdc+djy4ELLDomlF/88bWKuX22cYDJteyK1N/v1dvcMmmB6JqMEVeNiFoUB
	 ng+qvi+yctM05dW24QcE4WYV6Bpm6DKOl+BJxFo6Zsi+PeH1kQ54hJMEQ7yYaRkPlJ
	 6dkWtXfB7VGnSFQ69zVyVxeIsqxqFPSO6AwdFHBVszJTwJtI17eIgpkSIC2IoKbJni
	 H5FopboTuuWz1Xe1x4zsl0Y2GjT91au9FNDQvM2plApOOBBE/J1nbvM1t0fMBEIICu
	 ROgh4NgN4oC01s6nKpE9MURRYGeaJgf4FzJldjwn9bxE1MGwVkvB6zqc5zweKMQHD2
	 e2De+2XpHupBg==
Message-ID: <sashiko-outbox-231081@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 10/20] dmaengine: ti: k3-udma: refactor resource
 setup functions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sai Sree Kartheek Adivi" <s-adivi@ti.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261124-dma-upstream-v13-v13-10-bd4251fdc6d4@ti.com>
References: <20261124-dma-upstream-v13-v13-0-bd4251fdc6d4@ti.com>
 <20261124-dma-upstream-v13-v13-10-bd4251fdc6d4@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 11:53:15 +0000
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
- [Low] dmaengine: ti: k3-udma: udma_setup_resources() needlessly made
  non-static
--

commit fe1c2360284c2a56f16caad6fa61721dca412855
Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>

dmaengine: ti: k3-udma: refactor resource setup functions

This commit moves the common resource setup logic for K3 UDMA variants into
k3-udma-common.c and invokes the variant-specific SCI and UDMA resource
setup helpers through function pointers on struct udma_dev.

> diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
> index 9805650df3d09..c5de54d2a24a6 100644
> --- a/drivers/dma/ti/k3-udma.c
> +++ b/drivers/dma/ti/k3-udma.c
> @@ -2083,7 +2083,7 @@ static const char * const range_names[] =3D {
>  	[RM_RANGE_TFLOW] =3D "ti,sci-rm-range-tflow",
>  };
> =20
> -static int udma_setup_resources(struct udma_dev *ud)
> +int udma_setup_resources(struct udma_dev *ud)
>  {
>  	int ret, i, j;
>  	struct device *dev =3D ud->dev;

[ ... ]

> @@ -2730,6 +2567,9 @@ static int udma_probe(struct platform_device *pdev)
>  	ud->decrement_byte_counters =3D udma_decrement_byte_counters;
>  	ud->psil_pair =3D navss_psil_pair;
>  	ud->psil_unpair =3D navss_psil_unpair;
> +	ud->udma_setup_resources =3D udma_setup_resources;
> +	ud->bcdma_setup_sci_resources =3D bcdma_setup_sci_resources;
> +	ud->pktdma_setup_sci_resources =3D pktdma_setup_sci_resources;
> =20
>  	ret =3D udma_get_mmrs(pdev, ud);
>  	if (ret)

[ ... ]

> diff --git a/drivers/dma/ti/k3-udma.h b/drivers/dma/ti/k3-udma.h
> index 0b0626b67ad19..4dd597ef435b8 100644
> --- a/drivers/dma/ti/k3-udma.h
> +++ b/drivers/dma/ti/k3-udma.h

[ ... ]

> @@ -644,6 +647,9 @@ struct udma_bchan *__udma_reserve_bchan(struct udma_d=
ev *ud, enum udma_tp_level
>  struct udma_tchan *__udma_reserve_tchan(struct udma_dev *ud, enum udma_t=
p_level tpl, int id);
>  struct udma_rchan *__udma_reserve_rchan(struct udma_dev *ud, enum udma_t=
p_level tpl, int id);
> =20
> +int udma_setup_resources(struct udma_dev *ud);
> +int k3_udma_setup_resources(struct udma_dev *ud);
> +
>  /* Direct access to UDMA low lever resources for the glue layer */
>  int xudma_navss_psil_pair(struct udma_dev *ud, u32 src_thread, u32 dst_t=
hread);
>  int xudma_navss_psil_unpair(struct udma_dev *ud, u32 src_thread,

[Severity: Low]
Can udma_setup_resources() remain static in drivers/dma/ti/k3-udma.c
without being declared in k3-udma.h?  It is only referenced in udma_probe()
to populate ud->udma_setup_resources, just like bcdma_setup_sci_resources()
and pktdma_setup_sci_resources().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-dma-upstre=
am-v13-v13-0-bd4251fdc6d4@ti.com?part=3D10
