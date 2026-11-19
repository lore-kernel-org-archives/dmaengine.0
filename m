Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795104751;
	b=OVZ65onRBbD/q5t4hiwZKHMOY53WCXe3mpIJf/IRMu+FFP7H2fzTC5K1HvFa1KVWhmyL
	 AeGUYkLKAgGg8XbqxiKcfTFTYaNtEzad0d74HpqTaEWqq21sGYG3LcpGdB5+U5ZMbin/I
	 1XAyUggNZvzWJTt/JpMFeBJSYVIKjXiVWYAa+kqE1LSrw2ObSje2+w3izCnTIRtpzOqvR
	 U59jb9tuXwo8tCxsNsML5mfCajuGQw0JEQClcXthGJh5DpIOx02BLBL5dxf5i1viFbOVg
	 7pRCbpkWIGX2lzE5aFwGZamfRJq0WVPejRp6kwFq7HsR9Jq+/2eu4g8vKB4mOdd4TAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795104751;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=daeIyvoPiEeNkIHrGC8xLfw7X3rR7qMBTKbzcHY9WDM=;
	b=NsiUBT7A1aII5v8MC+P08NES6kse1KDY4HOgnpPKPENHtRoGS/BDQi39Q6x7D9yxL2jI
	 3BGTbFzjokzJWop3mW1X7aaBKEC7v6Cr0dqMR60bL3/XjOQhcRCPffmf2PQ36dO/sl3gf
	 /CvyMNaQZB5gH2jEqfFIHZHcRvKPr8Xh8ufNaO/lJsTf+mvxtKS1Z0ObGHQ3mx6qk4m4h
	 8K1VjHt9kHZWQUDHA5HgWEnginteay4KKFVUNu2Kct/Eyb0fAdXnNQVBROHR2SjXuaXsk
	 ZxNbd2g2VGGVBpafbrYkgH8rDNskCAaTy6nxoWOtwboZ1gagI5FlUjEG+zCv9TdcPng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="L/oCFEKU";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC63606A32C
	for <dmaengine@vger.kernel.org>; Thu, 19 Nov 2026 16:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L/oCFEKU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B42D91F000C5;
	Thu, 19 Nov 2026 16:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795104751;
	bh=daeIyvoPiEeNkIHrGC8xLfw7X3rR7qMBTKbzcHY9WDM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=L/oCFEKUtdpCnBd/fvJPdAS1vWbxZL/RFyhj2TpPuos2jC1wDqCpLSB9wnq5fxWfK
	 QVCAX0vYnF7JVc7Z5K/jgo9p8HkkLd6iqyknMTQn46g+l2vB4WnuJPFSzYvqOTb5R1
	 LsqWEP1gDEGYAHbrD7yuAOdWW3sdomlEzdWOXxBYimdh+h1mWVf9kI6h1u4zLudM9T
	 nFV9doNP9iH9sxWT9uY6Ja4qbFBDaloYkCDJTTlWI+/qmBx5+UiZ7kyaYFQVd8ZB1h
	 Vnzg2+/ZtGUaSta7c2zEHNNjsbOV1UrH4LTlAtuiShuwo8bsyF0nskBq+uf6xBRZo6
	 eGXOW5qnpK8Rg==
Message-ID: <sashiko-outbox-223487@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: dw: Use devm_clk_get_optional_enabled() in
 dw_probe()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Elfring" <Markus.Elfring@web.de>, dmaengine@vger.kernel.org
Cc: vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <8e3534b7-ae64-4c1f-819d-0ba390737b84@web.de>
References: <8e3534b7-ae64-4c1f-819d-0ba390737b84@web.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 16:12:30 +0000
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
- [High] dmaengine: dw: double clk_disable_unprepare() in dw_probe() and
  dw_remove()
--

commit ff07f5838666895fdb235cca7d9f7155e7085b00
Author: Markus Elfring <elfring@users.sourceforge.net>

dmaengine: dw: Use devm_clk_get_optional_enabled() in dw_probe()

This commit replaces devm_clk_get_optional() and clk_prepare_enable() in
dw_probe() with devm_clk_get_optional_enabled().

> diff --git a/drivers/dma/dw/platform.c b/drivers/dma/dw/platform.c
> index 7e76391475ac1..9bb3c2cd08570 100644
> --- a/drivers/dma/dw/platform.c
> +++ b/drivers/dma/dw/platform.c
> @@ -64,12 +64,9 @@ static int dw_probe(struct platform_device *pdev)
> =20
>  	data->chip =3D chip;
> =20
> -	chip->clk =3D devm_clk_get_optional(chip->dev, "hclk");
> +	chip->clk =3D devm_clk_get_optional_enabled(chip->dev, "hclk");
>  	if (IS_ERR(chip->clk))
>  		return PTR_ERR(chip->clk);
> -	ret =3D clk_prepare_enable(chip->clk);
> -	if (ret)
> -		return ret;
> =20
>  	pm_runtime_enable(&pdev->dev);
> =20

[Severity: High]
Does this cause a double clk_disable_unprepare() on chip->clk?

devm_clk_get_optional_enabled() registers a devres cleanup that disables
and unprepares chip->clk automatically, but both the err_dw_dma_probe
error path in dw_probe() and dw_remove() still call
clk_disable_unprepare(chip->clk) manually.  When data->probe() fails or
the device is unbound, chip->clk is disabled and unprepared twice,
underflowing the clock reference counts and triggering WARN() splats in
the clock core.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/8e3534b7-ae64-4c1f-=
819d-0ba390737b84@web.de?part=3D1
