Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8470E4718D6
	for <dmaengine@vger.kernel.org>; Thu, 10 Sep 2026 21:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789076895; cv=none; b=HQkIhkj1QU8Xm21l/FoxO8YMM/CpTiuCKYM18PKd4cSLaMBCd8K+mapuxY13l+eEnucan34dq+egLPYhpvptsxQd5HPBV/ktCCdHtBA8cnwOktCxH8nPhb8qyCs8KUor03jMGEb5bpw1v2/zraOtPjed1vGSj+UPTW+CGSRHMts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789076895; c=relaxed/simple;
	bh=HRCsCtwIUQqDmgLlTgWF/j8Xgup77y9HKaE5Tccl4Ig=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=alJ44zwGvTScFeqfbpFSvj7G4iTuBS1j+Kppls21/lAXZO6W/qp+WP3jvGfDD4DFdqWo/KbMQpJheZYI4eYk4jMnnOGzUjdOVyePDaTtJIxkD4X9BmNHXpJbtZlxd589/vTRxxC0SHN0WHVvNBbxZX0epwPuPm007j35vo3wHgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RmnSWcaL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RmnSWcaL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B7C91F00893;
	Thu, 10 Sep 2026 21:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789076894;
	bh=1llVMbMZKNAqODNnDOr5CcIoQXVDNdXZY0I4TeW8klI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RmnSWcaLBwjvvxrxTklkpQwBjaxc1XJ/qH5ldu5AlhtYdPxWB/wQBtYI90/BOmC3Z
	 /xg+AwKljaEt0Wk/8cviNd1FeeYtzWgivw55AF6TGLZXkzJSkik2kB0DTBmlxKzg1P
	 tORnWUrlSsKaNEh2Tj9Q2o5mc57Nc0UPNQo9OYpkTmA7Ppd07MCJHKj5Df8IIkX8V4
	 QEi5rURI65IV4EdqUU6ChUbDNl8lTykLjWbGxSDU4BFK7kJ6AL2fukBJD7VHanSD7s
	 yNZIJS+WCmW0cE98YWeX7vnombG6BXgqz7DGzR2DjAPkcUpQxcPRCLb5icbNDkpMVC
	 t3BU0UX13uXnw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: ppc4xx: check dma_map_page() errors in probe
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260910214334.86689-1-rosenp@gmail.com>
References: <20260910214334.86689-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 21:48:13 +0000
Message-Id: <20260910214814.0B7C91F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The error paths for dma_map_page() failures use `goto out;`, bypas=
sing all resource cleanup and causing a massive memory and resource leak.
--

commit e542c1430356273e51891dbcad4333a7ba32009f
Author: Rosen Penev <rosenp@gmail.com>

dmaengine: ppc4xx: check dma_map_page() errors in probe
   =20
This commit adds validation for the DMA addresses returned by dma_map_page(=
) in
ppc440spe_adma_probe(). It fails the probe and frees the pages when a mappi=
ng
error occurs to avoid corrupting data.

> diff --git a/drivers/dma/ppc4xx/adma.c b/drivers/dma/ppc4xx/adma.c
> index 279a431ccae38..89e778896d7a5 100644
> --- a/drivers/dma/ppc4xx/adma.c
> +++ b/drivers/dma/ppc4xx/adma.c
[ ... ]
> @@ -4156,8 +4156,22 @@ static int ppc440spe_adma_probe(struct platform_de=
vice *ofdev)
>  		}
>  		chan->pdest =3D dma_map_page(&ofdev->dev, chan->pdest_page, 0,
>  					   PAGE_SIZE, DMA_BIDIRECTIONAL);
> +		if (dma_mapping_error(&ofdev->dev, chan->pdest)) {
> +			__free_page(chan->pdest_page);
> +			__free_page(chan->qdest_page);
> +			ret =3D -ENOMEM;
> +			goto out;

[Severity: High]
Does jumping directly to out bypass the necessary cleanup for chan, adev, t=
he=20
dma_desc_pool, and the ioremap regions?

It looks like earlier errors in ppc440spe_adma_probe() jump to specific err=
or=20
labels (such as err_page_alloc) to unwind and free these resources. If the=
=20
pdest mapping fails, jumping directly to out instead of the proper error la=
bels=20
appears to leak the channel structure and device resources.

> +		}
>  		chan->qdest =3D dma_map_page(&ofdev->dev, chan->qdest_page, 0,
>  					   PAGE_SIZE, DMA_BIDIRECTIONAL);
> +		if (dma_mapping_error(&ofdev->dev, chan->qdest)) {
> +			dma_unmap_page(&ofdev->dev, chan->pdest,
> +				       PAGE_SIZE, DMA_BIDIRECTIONAL);
> +			__free_page(chan->pdest_page);
> +			__free_page(chan->qdest_page);
> +			ret =3D -ENOMEM;
> +			goto out;

[Severity: High]
Similarly, does this goto also leak the chan structure, adev, dma_desc_pool=
,=20
and ioremap regions when the qdest mapping fails?=20

Jumping to err_page_alloc might correctly unwind the allocations made earli=
er=20
in the probe function after the pages are freed.

> +		}
>  	}
> =20
>  	ref =3D kmalloc_obj(*ref);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910214334.8668=
9-1-rosenp@gmail.com?part=3D1
