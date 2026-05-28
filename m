Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F053F1A0B15
	for <dmaengine@vger.kernel.org>; Thu, 28 May 2026 14:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779977070; cv=none; b=rJUlXcHc5H5ZIwLXwrychPXekHhxy20NOPA6kNfm6qXHmBSWy414PqeNcIjM+g5eRSF2LxWlztvzhFuOiE4FrO6vyP22QPr1RgMHmUtwVrOq4WCk5j6IS3PXSwykunHK+S/3vFfwGQjJ3ADOgXz1qiFwf3G6IW8ZsVr70tcQ5HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779977070; c=relaxed/simple;
	bh=0qNNmoT9DuGqnlZjH8xv3yekInhluiloIANceJ70Zac=;
	h=From:Subject:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ph1khoK7KogllfV9gGnNUquT18yfiaaAHfP1HPD9lNkg0UDyzo2ouKqA7+PT+ck6Y6w5wREoA2arUoNkgFqhViFx91YWB1PFMulBDR3kK+B/2YeZz+lnJjfXu/LRWmgiNrT0NVd3VncDRHNBt3vVDlTrgdPoCpPc9/6KO6+Q55E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kl1yNmsJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kl1yNmsJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFB191F000E9;
	Thu, 28 May 2026 14:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779977068;
	bh=A6gR0U9UCsY2wt0t/YbHZ7DWwwf8BEpKdaoSl/NUIrQ=;
	h=From:Subject:Reply-To:Cc:In-Reply-To:References:Date;
	b=kl1yNmsJC4DBAMfOE/JfQMJGQTWERyXxL6LJJc/c/V1/JjVGLtJZwKfN3NLy/d8W5
	 q4+K/NtHu6ZsH4pHPKh6xZl7amxIjprkwTsOCovN3gvVLJ0yDbF4cQnzS7gwYkkujD
	 mSGnvBoe5aDFmsg2IkVtqHyFNQ6NxLXP2vx8RGon7QXs1SHPuqSkMIOJRxqx8KbH2J
	 tTip2T0YNOP1MWyMBDTKWsmofBxkXZPZ7+Jkk2W2ZjSquE+5N22DGZ6fvxVTVjfW5/
	 /wE7W/UkIDLygI0wRs5bGkQCjg9lUQgB9YYrIBJrdyhNQ1m/LvRjkjKuf/Mv/oYHz7
	 ja38cdeeaozxQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1] dmaengine: cirrus: Drop left-over from platform
 probing
Reply-To: sashiko-reviews@lists.linux.dev
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <c3830cb95b0bb939f9cc9543dfa3047e41532c47.1779976024.git.ukleinek@kernel.org>
References: <c3830cb95b0bb939f9cc9543dfa3047e41532c47.1779976024.git.ukleinek@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 May 2026 14:04:13 +0000
Message-Id: <20260528140428.AFB191F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The platform driver lacks a `.remove` callback to unregister the D=
MA device and OF controller, leading to resource leaks and Use-After-Free o=
n driver unbind.
--

commit 844ada15c68c774c951ecb59e9621ff3d60b26db
Author: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@baylibre.c=
om>

dmaengine: cirrus: Drop left-over from platform probing

This commit drops the traditional platform device ID table from the ep93xx
DMA driver. Since the driver was previously converted to use Device Tree for
probing, the id_table is obsolete and can be removed.

> diff --git a/drivers/dma/ep93xx_dma.c b/drivers/dma/ep93xx_dma.c
> index 8eceb96d058c9..a3395cfcf5dd5 100644
> --- a/drivers/dma/ep93xx_dma.c
> +++ b/drivers/dma/ep93xx_dma.c
[ ... ]
> @@ -1587,18 +1587,11 @@ static const struct of_device_id ep93xx_dma_of_id=
s[] =3D {
>  };
>  MODULE_DEVICE_TABLE(of, ep93xx_dma_of_ids);
> =20
> -static const struct platform_device_id ep93xx_dma_driver_ids[] =3D {
> -	{ "ep93xx-dma-m2p", 0 },
> -	{ "ep93xx-dma-m2m", 1 },
> -	{ },
> -};
> -
>  static struct platform_driver ep93xx_dma_driver =3D {
>  	.driver		=3D {
>  		.name	=3D "ep93xx-dma",
>  		.of_match_table =3D ep93xx_dma_of_ids,
>  	},
> -	.id_table	=3D ep93xx_dma_driver_ids,
>  	.probe		=3D ep93xx_dma_probe,
>  };

[Severity: High]
This is a pre-existing issue, but does this platform driver need a .remove
callback to prevent resource leaks and use-after-free conditions on unbind?

In ep93xx_dma_probe(), the driver registers the DMA engine and OF controlle=
r:

    dma_async_device_register(&edmac->dma_dev);
    of_dma_controller_register(pdev->dev.of_node, ep93xx_dma_of_xlate, edma=
c);

The edmac context structure is allocated via devm_kzalloc(). Since there is
no .remove callback, dma_async_device_unregister() and
of_dma_controller_free() are never called.

When the driver is unbound, devres automatically frees the memory, leaving
the DMA and OF core subsystems with dangling pointers. Would adding a
.remove callback resolve this?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/c3830cb95b0bb939f9c=
c9543dfa3047e41532c47.1779976024.git.ukleinek@kernel.org?part=3D1
