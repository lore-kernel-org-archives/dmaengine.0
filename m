Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1057449B5A5;
	Fri,  9 Oct 2026 15:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791559807; cv=none; b=JUz30PLear3HmAICC50hZ/XxXSyi+1F5LGol5xmdw47TNj2UboaO9hEGczFJhIb0R2kqEJQz3oJVHqgav5Sbx/jKiJvArK3MAZzoKrPQDoCFpfp2tfySs/72pt2ULmupcm2gahTUURjj9qflNGsmeBja8YEu4xfODbnQ8Pe5a74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791559807; c=relaxed/simple;
	bh=m0RhGxev/BhsWz7QzzazxcVZzwWiWxWC2wyl9VcpJcs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rrqJc4KyheHvrJyVXiglzsPH2lk3YQN9hAFJO9U0oXoml4HuSpvhmkr67SWQRMmnG9vDdYlQvbaCD7R/IqkM4CpMxPbVVHHict1tGXvZ7rhhkuKa2WGscFPRzGhf6LFfIJyf9PjMCAUrhAgZquN0OfeKaUwr5EAu5/I8bTbJ6kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O/fhp2Po; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O/fhp2Po"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 286931F00893;
	Fri,  9 Oct 2026 15:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791559805;
	bh=ooYYuk1Cy4x+W8huu6O7UYsT7otaLLBYI4dQg9LYTtk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O/fhp2PoLqu3C4wVKPpP56enw6aXaDmI5AT+evyiXKdFAbbW0QMTn2RBwiFX+H++h
	 fPVx1+XxoW4xvcfLXjNEcMIOrVvvVrKkxRhPG1hb0Po0SnDnVNc3BoyIYrXmNTPpKW
	 0DQrrkTWowVk0MwnfI3B95jchRgX+hOgbW/dIGRe1FYcLEs4qfVBK4jzKwnBXi/sXA
	 iamxUMLjrvR9jifPvR49+DTthL2LerWNTdGR449AqHKURTyjOub7I0H20gWN6jWd5o
	 gBsfKfxJvt2Caof0aItD68krwlclaY/O5FZi7j0dW6AzKgt8sIBwMm5KaoiawJnmZq
	 nAkOEf2+tVMKw==
Date: Fri, 9 Oct 2026 16:29:57 +0100
From: Conor Dooley <conor@kernel.org>
To: Jelly Jia <Jelly.Jia@cixtech.com>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, robin.murphy@arm.com,
	devicetree@vger.kernel.org, Frank.Li@kernel.org,
	cix-kernel-upstream@cixtech.com, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/6] dmaengine: arm-dma350: Add CIX Sky1 integration
 support
Message-ID: <20261009-9c6b706f0d1a46183205dd08@squawk>
References: <20260907033404.596839-1-Jelly.Jia@cixtech.com>
 <20261009051846.1115962-1-Jelly.Jia@cixtech.com>
 <20261009051846.1115962-6-Jelly.Jia@cixtech.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VwPst8/3K+MyQlA1"
Content-Disposition: inline
In-Reply-To: <20261009051846.1115962-6-Jelly.Jia@cixtech.com>

--VwPst8/3K+MyQlA1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 09, 2026 at 01:18:45PM +0800, Jelly Jia wrote:
> The CIX Sky1 SoC integrates DMA-350 controllers whose DMA masters see
> peripheral resources at different addresses than the CPU, and whose
> channel interrupts are gated by a subsystem register block before they
> reach the AP interrupt controller.
>=20
> Add match data for the "cix,sky1-dma350" compatible, describing the
> interrupt routing register, and use it to bring the controller up:
> enable the clock, reset the controller, and route the channel
> interrupts through the register block. Routing is redone after system
> resume because that block may lose its state.
>=20
> The address translation is described in the device tree, not in the
> driver: a bus node wrapping the controller carries the dma-ranges of
> the integration, the OF core builds dev->dma_range_map from them, and
> the DMA API applies the translation to both buffers and resources, so
> slave resources are mapped with dma_map_resource() like on any other
> device. Integrations without such a bus node keep the identity mapping.
>=20
> The controller may also be attached to a reserved memory region, for
> integrations whose DMA master cannot reach all of system memory.
>=20
> Assisted-by: LLM checkpatch sparse dt_binding_check dtbs_check
> Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
> ---
> v1 -> v2:
> - Merged the Sky1 integration into arm-dma350.c: the SoC resources are
>   managed by the DMA-350 driver itself, matched through the
>   "cix,sky1-dma350" compatible.
> - Slave resources are mapped with dma_map_resource() and translated by
>   the standard DMA API through the dma-ranges of the parent bus node.
> - Dropped drivers/dma/cix-sky1-dma350.c and its MAINTAINERS entry.
> - ARM_DMA350 now selects MFD_SYSCON for the interrupt router syscon.
>  drivers/dma/Kconfig      |  4 ++
>  drivers/dma/arm-dma350.c | 92 ++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 96 insertions(+)
>=20
> diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
> index ae6a682c9f76..efa6d280bb36 100644
> --- a/drivers/dma/Kconfig
> +++ b/drivers/dma/Kconfig
> @@ -97,9 +97,13 @@ config ARM_DMA350
>  	depends on ARM || ARM64 || COMPILE_TEST
>  	select DMA_ENGINE
>  	select DMA_VIRTUAL_CHANNELS
> +	select MFD_SYSCON
>  	help
>  	  Enable support for the Arm DMA-350 controller.
> =20
> +	  Some integrations need to poke a syscon to route the channel
> +	  interrupts, so MFD_SYSCON is selected here.
> +
>  config AT_HDMAC
>  	tristate "Atmel AHB DMA support"
>  	depends on ARCH_AT91 || COMPILE_TEST
> diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
> index e3fbfcce66e8..e443a9c3189b 100644
> --- a/drivers/dma/arm-dma350.c
> +++ b/drivers/dma/arm-dma350.c
> @@ -4,14 +4,21 @@
> =20
>  #include <linux/bitfield.h>
>  #include <linux/bitops.h>
> +#include <linux/clk.h>
>  #include <linux/dmaengine.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/io.h>
> +#include <linux/mfd/syscon.h>
>  #include <linux/of.h>
>  #include <linux/of_dma.h>
> +#include <linux/of_reserved_mem.h>
>  #include <linux/module.h>
>  #include <linux/overflow.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>
> +#include <linux/reset.h>
>  #include <linux/scatterlist.h>
>  #include <linux/slab.h>
> =20
> @@ -158,6 +165,9 @@
> =20
>  #define D350_SLAVE_CMD_WORDS	14
> =20
> +#define SKY1_DMA350_CRU_DMAC_AP_IRQ	0x54
> +#define SKY1_DMA350_IRQ_ROUTE_MASK	0xff
> +
>  enum ch_ctrl_donetype {
>  	CH_CTRL_DONETYPE_NONE =3D 0,
>  	CH_CTRL_DONETYPE_CMD =3D 1,
> @@ -222,6 +232,13 @@ struct d350_chan_map {
>  	bool needs_unmap;
>  };
> =20
> +struct d350;
> +
> +struct d350_data {
> +	u32 irq_route_reg;
> +	u32 irq_route_mask;

Since this is a fixed value, there's little point having it as part of
your match data. Ditto the reg value, for the same reason. The user is
called directly from your probe code, so you can use the defines
directly.

That said, should you actually be doing this from here? It feels like
a bit of a problem with abstractions where you're fiddling with another
device. Syscon stuff is okay when you're changing something internal to
your device's functionality or something "downstream" of your device -
between you and the output pins. But this is something "upstream" of our
device and I dunno if this is the right way to do it. If you need to set
some sort of interrupt routing, should you actually do something like
microchip,mpfs-irqmux or renesas,rzn1-gpioirqmux and preserve the
abstraction/separation between devices?

Cheers,
Conor.

> +};
> +
>  struct d350_chan {
>  	struct virt_dma_chan vc;
>  	struct d350_desc *desc;
> @@ -241,6 +258,8 @@ struct d350_chan {
> =20
>  struct d350 {
>  	struct dma_device dma;
> +	const struct d350_data *data;
> +	struct regmap *irq_router;
>  	int nchan;
>  	int nreq;
>  	struct d350_chan channels[] __counted_by(nchan);
> @@ -256,6 +275,16 @@ static inline struct d350_desc *to_d350_desc(struct =
virt_dma_desc *vd)
>  	return container_of(vd, struct d350_desc, vd);
>  }
> =20
> +static int d350_route_irqs(struct d350 *dmac)
> +{
> +	if (!dmac->irq_router)
> +		return 0;
> +
> +	return regmap_update_bits(dmac->irq_router, dmac->data->irq_route_reg,
> +				  dmac->data->irq_route_mask,
> +				  dmac->data->irq_route_mask);
> +}
> +
>  static void d350_free_cmds(struct device *dev, struct d350_desc *desc)
>  {
>  	if (desc->cmds) {
> @@ -1089,12 +1118,40 @@ static void d350_free_chan_resources(struct dma_c=
han *chan)
>  static int d350_probe(struct platform_device *pdev)
>  {
>  	struct device *dev =3D &pdev->dev;
> +	const struct d350_data *data =3D device_get_match_data(dev);
> +	struct reset_control *reset;
> +	struct regmap *irq_router =3D NULL;
> +	struct clk *clk;
>  	struct d350 *dmac;
>  	void __iomem *base;
>  	u32 reg;
>  	int ret, nchan, dw, aw, r, p;
>  	bool coherent, memset;
> =20
> +	clk =3D devm_clk_get_optional_enabled(dev, NULL);
> +	if (IS_ERR(clk))
> +		return dev_err_probe(dev, PTR_ERR(clk),
> +				     "failed to enable clock\n");
> +
> +	reset =3D devm_reset_control_get_optional_exclusive(dev, NULL);
> +	if (IS_ERR(reset))
> +		return dev_err_probe(dev, PTR_ERR(reset),
> +				     "failed to get reset\n");
> +
> +	if (data && data->irq_route_mask &&
> +	    of_property_present(dev->of_node, "cix,irq-router")) {
> +		irq_router =3D
> +			syscon_regmap_lookup_by_phandle(dev->of_node,
> +							"cix,irq-router");
> +		if (IS_ERR(irq_router))
> +			return dev_err_probe(dev, PTR_ERR(irq_router),
> +					     "failed to get IRQ router\n");
> +	}
> +
> +	ret =3D reset_control_reset(reset);
> +	if (ret)
> +		return ret;
> +
>  	base =3D devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(base))
>  		return PTR_ERR(base);
> @@ -1118,8 +1175,14 @@ static int d350_probe(struct platform_device *pdev)
>  	if (!dmac)
>  		return -ENOMEM;
> =20
> +	dmac->data =3D data;
> +	dmac->irq_router =3D irq_router;
>  	dmac->nchan =3D nchan;
> =20
> +	ret =3D d350_route_irqs(dmac);
> +	if (ret)
> +		return ret;
> +
>  	reg =3D readl_relaxed(base + DMAINFO + DMA_BUILDCFG1);
>  	dmac->nreq =3D FIELD_GET(DMA_CFG_NUM_TRIGGER_IN, reg);
> =20
> @@ -1201,6 +1264,13 @@ static int d350_probe(struct platform_device *pdev)
>  		dmac->dma.device_prep_dma_memset =3D d350_prep_memset;
>  	}
> =20
> +	if (of_property_present(dev->of_node, "memory-region")) {
> +		ret =3D of_reserved_mem_device_init(dev);
> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "failed to attach reserved memory\n");
> +	}
> +
>  	platform_set_drvdata(pdev, dmac);
> =20
>  	ret =3D dma_async_device_register(&dmac->dma);
> @@ -1223,9 +1293,30 @@ static void d350_remove(struct platform_device *pd=
ev)
> =20
>  	of_dma_controller_free(pdev->dev.of_node);
>  	dma_async_device_unregister(&dmac->dma);
> +	of_reserved_mem_device_release(&pdev->dev);
> +}
> +
> +static int __maybe_unused d350_resume_noirq(struct device *dev)
> +{
> +	struct d350 *dmac =3D dev_get_drvdata(dev);
> +
> +	if (!dmac)
> +		return 0;
> +
> +	return d350_route_irqs(dmac);
>  }
> =20
> +static const struct dev_pm_ops d350_pm =3D {
> +	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(NULL, d350_resume_noirq)
> +};
> +
> +static const struct d350_data d350_sky1_data =3D {
> +	.irq_route_reg =3D SKY1_DMA350_CRU_DMAC_AP_IRQ,
> +	.irq_route_mask =3D SKY1_DMA350_IRQ_ROUTE_MASK,
> +};
> +
>  static const struct of_device_id d350_of_match[] __maybe_unused =3D {
> +	{ .compatible =3D "cix,sky1-dma350", .data =3D &d350_sky1_data },
>  	{ .compatible =3D "arm,dma-350" },
>  	{}
>  };
> @@ -1235,6 +1326,7 @@ static struct platform_driver d350_driver =3D {
>  	.driver =3D {
>  		.name =3D "arm-dma350",
>  		.of_match_table =3D of_match_ptr(d350_of_match),
> +		.pm =3D pm_sleep_ptr(&d350_pm),
>  	},
>  	.probe =3D d350_probe,
>  	.remove =3D d350_remove,
> --=20
> 2.54.0
>=20

--VwPst8/3K+MyQlA1
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaskIdQAKCRB4tDGHoIJi
0r7sAP9M+VO4g4x2/yu88IbmEjE4Ju1MtashQbBxdSJRuiN4UQD9FGJTCm0kEyWZ
a5TyZPXwo5ZRmeg0TbpLWTOCR5claA0=
=dSs+
-----END PGP SIGNATURE-----

--VwPst8/3K+MyQlA1--
