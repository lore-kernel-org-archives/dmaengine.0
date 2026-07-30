Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECFB3914ED
	for <dmaengine@vger.kernel.org>; Thu, 30 Jul 2026 14:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785422614; cv=none; b=F4TQi2w8PBC1mI7CD12WNq0uebGGfEkP6juv628Rh2tO91c/ccaBcP+lUMSwG70BsND4++ATFSuZNsnzQDbmLBkibe3hVGgtkbDICxD1aTUIalU9PB6EFcTtbqDUjwtSMHfH13XSYjfHyomuu7ZPgXP+OhySZ+GQYnqslJ9YiNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785422614; c=relaxed/simple;
	bh=NjUD2XGsqggTZVLXxCuVN09pJzDvAWb6DfSXgv+EUGs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uPpSh72H7MkiUpHueMf19W+IOu7zaSQIWSfLlYR5FndQWBrUM3Yv8foijqb7nKBCNiapJvJhEyPShHbq+7NzRYCSuN/3v1YwgO5PmqAkVFDMhL1OPCtdq0etMRlF/kjNDofbJ23HOF4BdXBzM+xShUKIklQur9oa9dn6iV+nFwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BXA5PWZs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BXA5PWZs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9656F1F00A3D;
	Thu, 30 Jul 2026 14:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785422612;
	bh=2XtZDRqskzGk/Hj6MVCnALLMOl//jdmpp8QIYODfvZs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BXA5PWZsp0py7YyQQJxLRQf0nDnND9eIsj89BpllO1kraOde+CUKqi80VDdHtRfnM
	 Z0dLzgbV1bsqrndjIvxA2LYSO7DFSmw3OzK5xZZ0uUQC/CKz+eefaMdaFz5i+3/Z0N
	 WlpoydR2fxvfIB1xaTtCpMeJR4vePOt48yWRyUvoYXJ2/04hju68kqYdvPUwh/CBfo
	 O2HH1JeFylbkSnhEVqUWfhxZ21xFNf/CBaEHUkxTzMVTrFeooH3cb9Q+HRhnhMdtZY
	 Whw77/lKPxa+CPQZPen3jj8KCzKSUwxqLx/K99MrZmBTcLMMSkX0fCp9XUR0z95ru2
	 T+Cifn6mEjVyQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/9] dmaengine: qcom: gpi: Use bus width capability
 helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TnVubyBTw6E=?= <nuno.sa@analog.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260730-dmaengine-support-wider-dma-masks-v1-4-3732f1f9d9ca@analog.com>
References: <20260730-dmaengine-support-wider-dma-masks-v1-0-3732f1f9d9ca@analog.com>
 <20260730-dmaengine-support-wider-dma-masks-v1-4-3732f1f9d9ca@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 14:43:32 +0000
Message-Id: <20260730144332.9656F1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing dma_async_device_unregister() in the probe error path and =
lack of a .remove callback leads to Use-After-Free.
- [High] Error cleanup paths in gpi_ch_init() reset the wrong channel.
- [Medium] Out-of-bounds bitwise shift when processing the `dma-channels` p=
roperty.
- [Medium] DMA coherent memory allocated for channel rings is leaked if cha=
nnel initialization fails.
- [Medium] Potential integer overflow in devm_kzalloc when allocating gpiis=
 array.
--

--- Patch [4]: [PATCH 4/9] dmaengine: qcom: gpi: Use bus width capability h=
elpers ---
commit 359e67a23cc93b4c7bc48fb679da1cdd39760273
Author: Nuno S=C3=A1 <nuno.sa@analog.com>

dmaengine: qcom: gpi: Use bus width capability helpers

Advertise the single supported source and destination bus width through
the new dma_set_src_bus_width() and dma_set_dst_bus_width() helpers
instead of assigning the legacy u32 fields directly.

> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
> index a5055a6273af6..fd45cadce91fd 100644
> --- a/drivers/dma/qcom/gpi.c
> +++ b/drivers/dma/qcom/gpi.c

[ ... ]

> @@ -1994,11 +1994,11 @@ static int gpi_ch_init(struct gchan *gchan)
> =20
>  error_start_chan:
>  	for (i =3D i - 1; i >=3D 0; i--) {
>  		gpi_stop_chan(&gpii->gchan[i]);
>  		gpi_send_cmd(gpii, gchan, GPI_CH_CMD_RESET);
                                   ^^^^^

[Severity: High]
This is a pre-existing issue, but does this pass the correct channel to
gpi_send_cmd()? It looks like the error cleanup paths are passing the
function parameter gchan instead of the iterated channel &gpii->gchan[i],
which might leave previously started channels running while resetting the
wrong one.

>  	}
>  	i =3D 2;
>  error_alloc_chan:
>  	for (i =3D i - 1; i >=3D 0; i--)
>  		gpi_reset_chan(gchan, GPI_CH_CMD_DE_ALLOC);
                               ^^^^^

[Severity: High]
This is a pre-existing issue, but does this also reset the wrong channel
for the same reason?

[ ... ]

> @@ -2058,11 +2058,11 @@ static int gpi_alloc_chan_resources(struct dma_ch=
an *chan)
> =20
>  	/* allocate memory for transfer ring */
>  	ret =3D gpi_alloc_ring(&gchan->ch_ring, CHAN_TRES,
>  			     sizeof(struct gpi_tre), gpii);
>  	if (ret)
>  		goto xfer_alloc_err;
> =20
>  	ret =3D gpi_ch_init(gchan);
> =20
>  	mutex_unlock(&gpii->ctrl_lock);
> =20
>  	return ret;

[Severity: Medium]
This is a pre-existing issue, but does this error path leak the DMA coherent
memory allocated for gchan->ch_ring if gpi_ch_init() fails? It looks like it
exits without calling gpi_free_ring().

[ ... ]

> @@ -2218,17 +2218,17 @@ static int gpi_probe(struct platform_device *pdev)
> =20
>  	gpi_dev->gpiis =3D devm_kzalloc(gpi_dev->dev, sizeof(*gpi_dev->gpiis) *
>  				      gpi_dev->max_gpii, GFP_KERNEL);

[Severity: Medium]
This is a pre-existing issue, but can this unchecked multiplication overflow
before being passed to devm_kzalloc()?

If a malformed Device Tree provides an excessively large max_gpii value, th=
is
could result in a significantly smaller allocation and out-of-bounds writes=
 in
the initialization loop. Should this use devm_kcalloc() instead?

>  	if (!gpi_dev->gpiis)
>  		return -ENOMEM;
> =20
>  	/* setup all the supported gpii */
>  	INIT_LIST_HEAD(&gpi_dev->dma_device.channels);
>  	for (i =3D 0; i < gpi_dev->max_gpii; i++) {
>  		struct gpii *gpii =3D &gpi_dev->gpiis[i];
>  		int chan;
> =20
>  		if (!((1 << i) & gpi_dev->gpii_mask))
>  			continue;

[Severity: Medium]
This is a pre-existing issue, but can this bitwise shift (1 << i) overflow a
32-bit integer if i >=3D 32? Since max_gpii is parsed from the Device Tree
without bounds checking, it seems this could invoke undefined behavior.

[ ... ]

>  	/* configure dmaengine apis */
>  	gpi_dev->dma_device.directions =3D BIT(DMA_DEV_TO_MEM) | BIT(DMA_MEM_TO=
_DEV);
>  	gpi_dev->dma_device.residue_granularity =3D DMA_RESIDUE_GRANULARITY_DES=
CRIPTOR;
> -	gpi_dev->dma_device.src_addr_widths =3D DMA_SLAVE_BUSWIDTH_8_BYTES;
> -	gpi_dev->dma_device.dst_addr_widths =3D DMA_SLAVE_BUSWIDTH_8_BYTES;
> +	ret =3D dma_set_src_bus_width(&gpi_dev->dma_device,
> +				    DMA_SLAVE_BUSWIDTH_8_BYTES);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D dma_set_dst_bus_width(&gpi_dev->dma_device,
> +				    DMA_SLAVE_BUSWIDTH_8_BYTES);
> +	if (ret)
> +		return ret;
>  	gpi_dev->dma_device.device_alloc_chan_resources =3D gpi_alloc_chan_reso=
urces;

[ ... ]

>  	ret =3D of_dma_controller_register(gpi_dev->dev->of_node,
>  					 gpi_of_dma_xlate, gpi_dev);
>  	if (ret) {
>  		dev_err(gpi_dev->dev, "of_dma_controller_reg failed ret:%d", ret);
>  		return ret;
>  	}
> =20
>  	return ret;
>  }

[Severity: High]
This isn't a bug introduced by this patch, but does the probe function retu=
rn
here without unregistering the previously registered DMA device?

If of_dma_controller_register() fails, dma_async_device_unregister() is
missing, which could leave dangling pointers in the DMA and OF framework li=
sts,
causing a Use-After-Free.

[ ... ]

> @@ -2319,9 +2319,9 @@ static const struct of_device_id gpi_of_match[] =3D=
 {
>  MODULE_DEVICE_TABLE(of, gpi_of_match);
> =20
>  static struct platform_driver gpi_driver =3D {
>  	.probe =3D gpi_probe,
>  	.driver =3D {
>  		.name =3D KBUILD_MODNAME,
>  		.of_match_table =3D gpi_of_match,
>  	},
>  };

[Severity: High]
This is a pre-existing issue, but does this platform driver lack a .remove
callback?

Without it, sysfs unbind invokes devres cleanup while leaving the DMA device
registered, which can lead to a Use-After-Free.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-dmaengine-=
support-wider-dma-masks-v1-0-3732f1f9d9ca@analog.com?part=3D4
