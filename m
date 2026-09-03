Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38574B2CA0
	for <dmaengine@vger.kernel.org>; Thu,  3 Sep 2026 17:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788455513; cv=none; b=eWAsLXd3QYYgszK1SLbu62H/uygx8gruU3L1i6Qz61Qey702v3wu62gqXpoSb2hbpvfUm0ErqaNsfG12VM8YsP7Zn5wGwAmAbeP5+5k2VftkBoMi/coGf9NwE++k/dMyTBOjtJhocjw5ZMZ7gDuQ1OJaG/4nYInqdv2/i/JX9x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788455513; c=relaxed/simple;
	bh=Dvvv93Cj8KpxbJ5v1ebedxy5cLqIujDn6Fe0WoMjKtg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Kvw/fSaYybyftHDIXfvOmpmzgUoX/nQ/pOW7FrMmp/xSru57SpBh3C/8XQT5pCRJHlPIwtxn64JuEmjnkrC21VnibOPJq5zocthegjtJ5CeXJDO6sBXejHqoOIE9tOTitqRyJzUty7ySqKugM9V/hwFecYNf+XOlAGr0H5fPm4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iJ21NqxV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iJ21NqxV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52D051F000E9;
	Thu,  3 Sep 2026 17:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788455512;
	bh=DSvdUYHR0RvEOmhJQrcnd1SeiVrhoJpzufWqrwZq+nA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iJ21NqxV0ifGYF9JhdgS4IuvQAWUkmabfSg3EAlRhn9LbLuE1Ds4Nod6KsounZz9J
	 Y9ka9wlV5CqJ7zp88HUR1rXIWLwmS0oHGbcfmHkWIwD21Vz8OPTaTzn3BoQOjSL3rv
	 DdGEiemi7ebhvlYy41gDv4eosK/WniaPRydnIeeIb5PdhR12493ZWC68UFbP7AuPn5
	 YyaRO0gjDB4970k1H1iBe+/+Y3hLA1TXI+Xt1CcG86/N0avsA0BfA+MvctiwEZ6dJo
	 UciZkXgsozYWjrXT9NkIKfgBjgFveJQltFeHNDFQZxHyAJ4XW+0jgrIBXm1i6OQE+v
	 lOWusW6VPd40Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: zynqmp_dma: drop redundant label
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vinod Koul" <vkoul@kernel.org>
Cc: dmaengine@vger.kernel.org, Frank.Li@kernel.org, vkoul@kernel.org
In-Reply-To: <20260903170357.1711462-1-vkoul@kernel.org>
References: <20260903170357.1711462-1-vkoul@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 17:11:51 +0000
Message-Id: <20260903171152.52D051F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Removing the `err_disable_pm` label causes a compilation failure be=
cause a `goto err_disable_pm;` statement remains in `zynqmp_dma_probe()`.
--

commit b231b06f7a09316d1f0854b835d97d063a04395f
Author: Vinod Koul <vkoul@kernel.org>

dmaengine: zynqmp_dma: drop redundant label

This commit removes the err_disable_pm label from zynqmp_dma_probe() to fix
an unused label warning reported after an earlier runtime PM update.

> diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_=
dma.c
> index 2b03584102acf..71a310d50ee33 100644
> --- a/drivers/dma/xilinx/zynqmp_dma.c
> +++ b/drivers/dma/xilinx/zynqmp_dma.c
> @@ -1149,7 +1149,6 @@ static int zynqmp_dma_probe(struct platform_device =
*pdev)
> =20
>  free_chan_resources:
>  	zynqmp_dma_chan_remove(zdev->chan);
> -err_disable_pm:

[Severity: Low]
Does this change cause a build failure?

Looking at zynqmp_dma_probe(), it appears there is still a jump to this
label earlier in the function:

	ret =3D zynqmp_dma_chan_probe(zdev, pdev);
	if (ret) {
		dev_err_probe(&pdev->dev, ret, "Probing channel failed\n");
		goto err_disable_pm;
	}

If the label is removed, won't the compiler fail with an undeclared label
error during compilation?

>  	if (!pm_runtime_enabled(zdev->dev))
>  		zynqmp_dma_runtime_suspend(zdev->dev);
>  	pm_runtime_disable(zdev->dev);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903170357.1711=
462-1-vkoul@kernel.org?part=3D1
