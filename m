Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C6E38F934;
	Thu, 14 May 2026 05:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778735922; cv=none; b=DYf34qAvtuxNNOEDW2GPTPUnNCND73X3PxEqrnxyOns0oGq1C3T8E6M1ssQI2peCKpbPrrtcCpvh5IEZajP14gKssb4bMxLK4d6tGvaW/fGE7C3TudoRbWIsnRI1yrjIa93T1MFQOrzBT5lUaCHE3Ron5Te9+mCGc6wcNPZRmT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778735922; c=relaxed/simple;
	bh=sYwbwqRF98uuFyhlJII/S/CDAenAqNuV3CAHUgEgjew=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=d25RQGAd1ULbNA2lA48viclOX1eLhlgCiq1Vo3ETiH9+MEX/wDfkTIrYzNp4cfFBTKUSVwrEbjkyv4IMQVFQuAGvBCHvaRtNmbYY06d6BK390OtCoXY4ZvZDZGQHd24Zdw4GR2/vwVbcEIWc+MYzKTmB0MgLJFXl9FqY1+EaMDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U/op5/0w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U/op5/0w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B727C2BCB7;
	Thu, 14 May 2026 05:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778735922;
	bh=sYwbwqRF98uuFyhlJII/S/CDAenAqNuV3CAHUgEgjew=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=U/op5/0w3y/zN3rz33jMyASMvSLyZ58VjKkS95U8AhEZPn9pVH+t3qixejR94DwzB
	 YJZKWHhNJ69wf/wNXog+KwyEibkkP5oT7ia+uAvV0LyPM88Kvrx4Obbnu6ZyJnN1Hl
	 V+R3lEDyYls17yCyu4UtnLrIVjHSz3Y2f0grYzhfG+khB/91D/jBL51RS805PnpX81
	 r0mulOZ/mmSwGpUObAoRzfs+YNfAKUmI6D2XSL4MjO8d9Bi71M6vaG4BQOjPjFs6ss
	 zU3+iuQ5R79oafQL01+qIMfO8juufTx6IHnUmng1gv7A0gAaT28A6rv3yWW9PH0LlF
	 nY+v+BuWeFgmw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/4] dmaengine: fsl-edma: convert DMAMUX clock
 handling to bulk clock API
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joy Zou" <joy.zou@nxp.com>
Cc: Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org, imx@lists.linux.dev
In-Reply-To: <20260513-b4-b4-edma-runtime-opt-v5-3-1e595bfb8423@nxp.com>
References: <20260513-b4-b4-edma-runtime-opt-v5-3-1e595bfb8423@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 05:18:41 +0000
Message-Id: <20260514051842.1B727C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Switching to `devm_clk_bulk_get_optional_enable()` silently drops =
validation for missing DMAMUX clocks, leading to a system bus hang during p=
robe on misconfigured device trees.
--

commit ac85fd72d931ccb00828f78ca0682e23cee58abe
Author: Joy Zou <joy.zou@nxp.com>

dmaengine: fsl-edma: convert DMAMUX clock handling to bulk clock API

This commit converts the DMAMUX clock management from individual clock
operations to the bulk clock API to simplify the code. This is in
preparation for adding runtime PM support.

> diff --git a/drivers/dma/fsl-edma-main.c b/drivers/dma/fsl-edma-main.c
> index ecd14967bfbc0..c12126ea6552d 100644
> --- a/drivers/dma/fsl-edma-main.c
> +++ b/drivers/dma/fsl-edma-main.c

[ ... ]

> @@ -747,23 +739,28 @@ static int fsl_edma_probe(struct platform_device *p=
dev)
>  		fsl_edma->chan_masked |=3D chan_mask[0];
>  	}
> =20
> -	for (i =3D 0; i < fsl_edma->drvdata->dmamuxs; i++) {
> -		char clkname[32];
> -
> -		fsl_edma->muxbase[i] =3D devm_platform_ioremap_resource(pdev,
> -								      1 + i);
> -		if (IS_ERR(fsl_edma->muxbase[i])) {
> -			/* on error: disable all previously enabled clks */
> -			fsl_disable_clocks(fsl_edma, i);
> -			return PTR_ERR(fsl_edma->muxbase[i]);
> +	if (fsl_edma->drvdata->dmamuxs) {
> +		fsl_edma->muxclk =3D devm_kcalloc(&pdev->dev, fsl_edma->drvdata->dmamu=
xs,
> +						sizeof(*fsl_edma->muxclk), GFP_KERNEL);
> +		if (!fsl_edma->muxclk)
> +			return -ENOMEM;
> +
> +		for (i =3D 0; i < fsl_edma->drvdata->dmamuxs; i++) {
> +			fsl_edma->muxbase[i] =3D devm_platform_ioremap_resource(pdev, 1 + i);
> +			if (IS_ERR(fsl_edma->muxbase[i]))
> +				return PTR_ERR(fsl_edma->muxbase[i]);
> +
> +			fsl_edma->muxclk[i].id =3D devm_kasprintf(&pdev->dev, GFP_KERNEL,
> +								"dmamux%d", i);
> +			if (!fsl_edma->muxclk[i].id)
> +				return -ENOMEM;
>  		}
> =20
> -		sprintf(clkname, "dmamux%d", i);
> -		fsl_edma->muxclk[i] =3D devm_clk_get_enabled(&pdev->dev, clkname);
> -		if (IS_ERR(fsl_edma->muxclk[i]))
> -			return dev_err_probe(&pdev->dev,
> -					     PTR_ERR(fsl_edma->muxclk[i]),
> -					     "Missing DMAMUX block clock.\n");
> +		ret =3D devm_clk_bulk_get_optional_enable(&pdev->dev, fsl_edma->drvdat=
a->dmamuxs,
> +							fsl_edma->muxclk);

Does using devm_clk_bulk_get_optional_enable() silently drop validation for
missing DMAMUX clocks?

The previous code used devm_clk_get_enabled(), which safely aborted the pro=
be
if clocks were missing. Because the optional variant returns 0 when the clo=
cks
are missing in the device tree, the probe will continue.

If the probe continues without the clocks enabled, the driver later calls
fsl_edma_chan_mux() which accesses the unclocked muxbase registers. On NXP
SoCs, accessing unclocked registers can trigger a system bus hang or
asynchronous external abort.

Should this use a mandatory bulk clock API to ensure the clocks are actually
present and enabled?

> +		if (ret)
> +			return dev_err_probe(&pdev->dev, ret,
> +					     "Failed to enable DMAMUX block clock.\n");
>  	}
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513-b4-b4-edma=
-runtime-opt-v5-0-1e595bfb8423@nxp.com?part=3D3
