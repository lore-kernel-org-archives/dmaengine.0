Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A503F44C1;
	Wed,  1 Jul 2026 09:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782898818; cv=none; b=ATAYj9NpH9HqsXwyOsGjU2WV/S2fSwPmhKInojfJ54qskTTUGzgHJJL6votd6ptrCjbRScH4xCfdi47TiKt335IHqPNseLvhCdIAMCxfcCLue63xxiKtYv5C5q6sGXwDY1wnGudV5TQZ06TnXBVkaNxm7R93Aa4/60dC8IHZZug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782898818; c=relaxed/simple;
	bh=4Zvhc7ro/iV8uYMZPY5wetHw4hO98oBXxeYj2TMiW8Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YGE2MAYy/EWoQIDs9lvPAR2i7gzX9y3RdZz9S3N/uUS97PZd7kMfnvXaMuMA0Q3GtAKbRqkqvlaFc0PfJ9fKnUY9+3odcNW6Y8QqZmjRF7oIlI43LCWkJUs8Gn1ujodC9fsK2EHTE/z30ymCCWjvWeZCPwjqxYs3vxqbMcUlAhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UJYyHxVy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UJYyHxVy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A569D1F000E9;
	Wed,  1 Jul 2026 09:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782898815;
	bh=J1tZhdK70GWlwise02fchZ/dXtCCl1SVkffw9J7oFcU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UJYyHxVypgGbWFX48v+iymWF4zNYGFx9VVv8NIShzW25DBqqzINuvs2It+dECK57+
	 mrkvJj3u/5AbPKex5XVKjLF1S/wi2pCgLmi4LjJTMVJDaOvYMnMt3vtkv8NFtymZUe
	 ScFPm+SXtugdtS6LBLHsEcDfSJxqxHH/byiBT66rlWd88qP+jYhK52FQLo2W0J4rsK
	 vZVxA5BfkFYr8oF2O6XYCa/lfytlbzCfGKvAAmv+UTASezwd3uGS6Z2j8xjeidUMHC
	 j6GHaoAKCWFTP/RiUh9JOpcXYnuYeyaeZBs2c/7BVT/TPvTW5IePx9GRWeKVZVKZ++
	 CseVNqIU9F21g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/5] dmaengine: fsl-edma: use devm_clk_get_optional()
 for DMA engine clock
Reply-To: sashiko-reviews@lists.linux.dev
To: joy.zou@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260701-b4-edma-runtime-opt-v6-2-354ff4229c00@oss.nxp.com>
References: <20260701-b4-edma-runtime-opt-v6-0-354ff4229c00@oss.nxp.com>
 <20260701-b4-edma-runtime-opt-v6-2-354ff4229c00@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 09:40:15 +0000
Message-Id: <20260701094015.A569D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The patch introduces calls to a non-existent function `devm_clk_pre=
pare_enable()`, resulting in a build failure.
--

commit 52e4c7b7c140f88bd3ed6ad6e10c3513c2941e5c
Author: Joy Zou <joy.zou@nxp.com>

dmaengine: fsl-edma: use devm_clk_get_optional() for DMA engine clock

This commit updates the eDMA engine clock handling to treat it as optional,
removing the FSL_EDMA_DRV_HAS_DMACLK flag and replacing
devm_clk_get_enabled() with separate get and enable calls.

> diff --git a/drivers/dma/fsl-edma-main.c b/drivers/dma/fsl-edma-main.c
> --- a/drivers/dma/fsl-edma-main.c
> +++ b/drivers/dma/fsl-edma-main.c

[ ... ]

> @@ -733,13 +733,15 @@ static int fsl_edma_probe(struct platform_device *p=
dev)
>  		regs =3D &fsl_edma->regs;
>  	}
> =20
> -	if (drvdata->flags & FSL_EDMA_DRV_HAS_DMACLK) {
> -		fsl_edma->dmaclk =3D devm_clk_get_enabled(&pdev->dev, "dma");
> -		if (IS_ERR(fsl_edma->dmaclk))
> -			return dev_err_probe(&pdev->dev,
> -					     PTR_ERR(fsl_edma->dmaclk),
> -					     "Missing DMA block clock.\n");
> -	}
> +	fsl_edma->dmaclk =3D devm_clk_get_optional(&pdev->dev, "dma");
> +	if (IS_ERR(fsl_edma->dmaclk))
> +		return dev_err_probe(&pdev->dev,
> +				     PTR_ERR(fsl_edma->dmaclk),
> +				     "Failed to get/enable DMA clock.\n");
> +
> +	ret =3D devm_clk_prepare_enable(&pdev->dev, fsl_edma->dmaclk);

[Severity: Low]
Does this function call cause a build regression? It appears that
devm_clk_prepare_enable() is not defined in the standard clock API, which
might result in an implicit declaration error and break git bisect.

I noticed that this is resolved later in the series in commit
a5800ff547600d938eb443a21684d6291b4658d1 (dmaengine: fsl-edma: add runtime
suspend/resume support), where these undefined function calls are removed
for both the engine clock and the channel clocks.

Is it possible to reorganize the patch series so that the build does not
fail at this intermediate step?

> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "Failed to enable clock\n");
> =20
>  	ret =3D of_property_read_variable_u32_array(np, "dma-channel-mask", cha=
n_mask, 1, 2);
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701-b4-edma-ru=
ntime-opt-v6-0-354ff4229c00@oss.nxp.com?part=3D2
