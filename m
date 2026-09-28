Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D68B3655F6;
	Mon, 28 Sep 2026 03:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790565217; cv=none; b=YWpBRwrrwb7Idv88C7emjtiOyqI+IDe+J38Jj20y+5MRQgoY/PnjDvhF0OFbz5s5EtpW0S97R2TdbQImJf+ArbSBq9KAyFcWTMas78+nmcLEeOjkZd3LKipttv72Kcb8hnaWqKigZZB6oTDvv+nMWK5XhD4N8ObNnnXAIhovX2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790565217; c=relaxed/simple;
	bh=ahP6JL2dA41o4bpWi+gFyn/8UTlNwpd/YuEkRrWrQmY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nuPeAwooIFraDbUkjNM/GlBedNSMvndZp1nNVq9GGvCIPXI43GBmDz4DKgXfvFasgBVtdR6ALYF5JHizY/uNqtnYudahhjZB4/KTSBhltX7CVB3nShErgjveXPkNqWb3Q9/f8CvPj8qP55EdIx89LaPvY5S/WbpaOJjzpIVWM88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J6eIX1OQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J6eIX1OQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3427B1F000FF;
	Mon, 28 Sep 2026 03:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790565215;
	bh=bOdjr7K48KIWw307A8+MbCPIgeDM++eGytTxXfdTKbs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J6eIX1OQ6OKtG48F92rDLNa5wOZEHyMZBBWrA24Sd6aGkmrPvKwHyc05XS+qNHA04
	 FaadtmVGttLNXt0Tw7epHBdimztoM6HsMMscoyrwJ6GWOnFgIhTE25F+zUHCCsX7Op
	 m4CjmiNzkL5+N1yD5l9rIB7EBPAfBbIdRVFc8PmJJhVLAh8rGhPrNV9eZRYJCvghJw
	 4m+du6Q58o9o/oJH8ZL3UkFefJcv4epYZcSKLoYWfomtXVZ1nUWSJN5Djyu4K3MFTc
	 hLdAIs6Hm05J3bdA0xn9RmiFxJiuZVEiSWfzD14T4vXojqmJa5Vt5D5MIwHisbEL9m
	 EYjVOdvlWGbWg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 11/19] dmaengine: ti: k3-udma: move inclusion of
 k3-udma-private.c to k3-udma-common.c
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sai Sree Kartheek Adivi" <s-adivi@ti.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, vkoul@kernel.org, robh@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260928025749.1055383-12-s-adivi@ti.com>
References: <20260928025749.1055383-1-s-adivi@ti.com>
 <20260928025749.1055383-12-s-adivi@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 03:13:33 +0000
Message-Id: <20260928031335.3427B1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dmaengine: ti: k3-udma: UAF due to broken module dependency
--

commit f3615f5a550ae951b71ca33c0cf4afbecff775f7
Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>

dmaengine: ti: k3-udma: move inclusion of k3-udma-private.c to k3-udma-comm=
on.c

Relocates the inclusion of k3-udma-private.c to k3-udma-common.c so that
the code can be shared between other UDMA variants. This is intended to
improve modularity without introducing functional changes.

> diff --git a/drivers/dma/ti/k3-udma-common.c b/drivers/dma/ti/k3-udma-com=
mon.c
> index d0afbab01786f..eb555cc08347d 100644
> --- a/drivers/dma/ti/k3-udma-common.c
> +++ b/drivers/dma/ti/k3-udma-common.c
> @@ -2536,3 +2536,6 @@ EXPORT_SYMBOL_GPL(k3_udma_setup_resources);
> =20
>  MODULE_DESCRIPTION("Texas Instruments K3 UDMA Common Library");
>  MODULE_LICENSE("GPL v2");
> +
> +/* Private interfaces to UDMA */
> +#include "k3-udma-private.c"

[Severity: High]
Does moving this include into k3-udma-common.c inadvertently break the modu=
le
dependency that keeps k3-udma.c from being unloaded while in use?

By moving the exported symbols from k3-udma-private.c into k3-udma-common.k=
o,
the dependency of client modules (like k3-udma-glue) shifts away from the
main hardware driver k3-udma.ko.

If a client uses k3-udma-glue APIs to obtain the devm-allocated context via
of_xudma_dev_get(), the device reference is explicitly dropped:

drivers/dma/ti/k3-udma-private.c:of_xudma_dev_get() {
    ...
	ud =3D platform_get_drvdata(pdev);
	put_device(&pdev->dev);
    ...
}

Because these APIs bypass the standard DMA engine core which normally calls
try_module_get(), k3-udma.ko is left with a module reference count of 0.

Could this allow k3-udma.ko to be unloaded while the client still actively
uses the dangling pointer, resulting in a use-after-free when the devm
resources are released?

> diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
> index 9a261747c8709..ddedd51ab26d9 100644
> --- a/drivers/dma/ti/k3-udma.c
> +++ b/drivers/dma/ti/k3-udma.c
> @@ -2857,5 +2857,3 @@ module_platform_driver(udma_driver);
>  MODULE_DESCRIPTION("Texas Instruments UDMA support");
>  MODULE_LICENSE("GPL v2");
> =20
> -/* Private interfaces to UDMA */
> -#include "k3-udma-private.c"

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928025749.1055=
383-1-s-adivi@ti.com?part=3D11
