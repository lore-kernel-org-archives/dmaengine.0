Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793719818;
	b=bbEmT9aZr4gkAhHCgI7vD7Rkr9DIm98mgwv6WWLKbO53ldKDa88ZrIPEYXGkZuluK9mB
	 AE4xWK9v5scsl54sYGCV5tVOt811xa+o2wZhjiURQTN2ziTbrJqvFoN0/fnRw3EV6V/Ar
	 Qk3If6VHGto6IaBdUi2SM0FmWzs+nz6fLpsGQmBAbgYPwXRtcOfGH1x7Nn0Lwie9fCQP5
	 4UyHUIJOHm2ZbkueUDhK1PIcosVkK1M/qfIXHkqNHCcJjhAakaZf5hhzr8BZa/YYoiJnj
	 PYFLbkauwf9bzoXPA26Txhw9G6dm12TC3usOcPXhK/LC9LLI5ZMTNS/RU1NMLwxkKSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793719818;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=5USuSpAY6BqKBJXRkghIPtIuqHJ67CoBJXg16mpKvCA=;
	b=Y6B/ImDTzw/mjfqB0dpRePtZ+F7yX9dxl9AYyVL3PAMHwmXuMruJolXxsAwLmiVWi2bT
	 /ifEVfYBWfIR1nLyNstIe0oED18jq/ZjxzWrHugqQ954Nu6oJLfSIEKrEeZM2fgP3CaKQ
	 UoXKLmAfaKoALu0DK/7hOWtK2XwbQjmbkiiwJjltN1EH4XXb0moIaYXA43rarDUdIAVci
	 IV51n7SaW30cCIeWBA27TGkWw+M17P3jlVVP8CqVpRAQD00as13VA8/13ojoU3WVRM6+s
	 Vv6h8yehJ/KGm+MyYvI9uuOfsFaMP3WgOl8cMRisyI5zTFDZMXf2C8pqSCUuFkS7a5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V564JMZ1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AFFD606A331;
	Tue,  3 Nov 2026 15:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V564JMZ1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE1271F00919;
	Tue,  3 Nov 2026 15:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793719818;
	bh=5USuSpAY6BqKBJXRkghIPtIuqHJ67CoBJXg16mpKvCA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V564JMZ18rp3LLDtaoKcHIMWvfu2Wa279rjZfWf84BoQnNDu2Qv4dBAgwNQQuN8d/
	 7emhaWmKX5l4YFg6BvTkDYOqYLIj+1lXCTS8Vm02kkx+qE4Ap/ZihOW3AJDeBf6k7p
	 NRlRhU1qWoTz8qdAqSv6tcZV4RgYIM9Pt3hxspsR2hMwdcqpTDXrS7z8DVuUy2TTIi
	 B9dIW8qdCki0Z1SlMgKVNmrX6GpjiRgzUYW3OLEPBX9qjnXB2/yWXRhfSF2yV/kIBc
	 gMQB2l4hDi6Wl3X5c+VC62Z9NadcwuF8uNrXoiDcJinWeQbsfDCx4ja1UwHx7T5I6a
	 M1QTKa0Li5maQ==
Message-ID: <sashiko-outbox-195621@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/7] dmaengine: add a bus for DMA channel devices
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: imx@lists.linux.dev, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261103-edma-iommu-v3-v4-2-470415d418c5@Example.Com>
References: <20261103-edma-iommu-v3-v4-0-470415d418c5@Example.Com>
 <20261103-edma-iommu-v3-v4-2-470415d418c5@Example.Com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 15:30:17 +0000
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
- [Medium] dmaengine: bus name collision with SuperH dma_subsys in dma_bus_=
init()
--

commit 6400cfe74e7a9d7882031548be64a3d0e53cb075
Author: Peng Fan <peng.fan@nxp.com>

dmaengine: add a bus for DMA channel devices

This commit adds a dedicated dma_chan_bus_type bus for DMA channel devices =
and
registers it at core_initcall so that per-channel IOMMU configuration can be
performed properly. It also cleans up the unmap pools on initialization
failure.

> diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
> index 34be53487a21d..3a297f2754915 100644
> --- a/drivers/dma/dmaengine.c
> +++ b/drivers/dma/dmaengine.c
> @@ -1643,6 +1643,17 @@ void dma_run_dependencies(struct dma_async_tx_desc=
riptor *tx)
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
> @@ -1650,10 +1661,21 @@ static int __init dma_bus_init(void)
>  	if (err)
>  		return err;
> =20
> +	err =3D bus_register(&dma_chan_bus_type);
> +	if (err)
> +		goto err_destroy_unmap_pool;

[Severity: Medium]
Does registering dma_chan_bus_type with the name "dma" collide with the
existing SuperH DMA subsystem bus?

In arch/sh/drivers/dma/dma-sysfs.c, SuperH already defines and registers a
bus_type with the same name:

    static const struct bus_type dma_subsys =3D {
            .name =3D "dma",
            .dev_name =3D "dma",
    };

    static int __init dma_subsys_init(void)
    {
            ...
            ret =3D subsys_system_register(&dma_subsys, NULL);
            if (unlikely(ret))
                    return ret;
    ...
    }
    postcore_initcall(dma_subsys_init);

On SuperH configurations where both CONFIG_DMA_ENGINE=3Dy and CONFIG_SH_DMA=
_API=3Dy
are enabled (such as sh2007_defconfig), dma_bus_init() runs at core_initcall
and registers /sys/bus/dma first. When dma_subsys_init() subsequently runs =
at
postcore_initcall, subsys_system_register() -> subsys_register() ->
bus_register() fails with -EEXIST and triggers a sysfs duplicate filename
warning, which then causes register_dmac() -> dma_create_sysfs_files() ->
device_register() to fail with -EINVAL when registering SuperH DMA channels.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103-edma-iommu=
-v3-v4-0-470415d418c5@Example.Com?part=3D2
