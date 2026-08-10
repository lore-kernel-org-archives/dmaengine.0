Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39807366067;
	Mon, 10 Aug 2026 16:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786379255; cv=none; b=hOx4n6XNrtIQGrtfGTDp9BE0aZMEM9zExZXbNTi9vlXMg28gN64EfPNb65KV9Md7bi0DYshA+L+PR7t7s6LBBqCgV7MIDSRxYY4G44oCeVg0hzRLdpB7529Ao4vL3OjMoIhheL87GAsJrOK77aevQpYfmw2Yx6+ex01m1w7TH3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786379255; c=relaxed/simple;
	bh=LqxxeEMSjyK8vAcXvti/bX9KGGGhe5Ly2SqSWNWYsVg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aH2iVMnQN1m+VjMryPB91gn0ZCB6Wh6rmvla1tUsv5ajyiRXX9XoXhvsR7PQ7pUqhaPPS6PhE4TM1Xv0NwGKJiFX0gYm3d0Pq+IfbAjN7MFoaZlbVA/xDncm3pMVK8OpGt1+tMZqC/n5LxNHEP1QPOYc7tAlksaqAfYfNO+ZQn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DjA24kuB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DjA24kuB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A335D1F000E9;
	Mon, 10 Aug 2026 16:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786379254;
	bh=a4NIp7UWSdI1PDM9FLC35eZGqUtSlnKFAiqVC4Tdb5c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DjA24kuBBd3wDRL8Z7+Ywbzu6gNQChBSS3+Cb+VR8sN1+MauwV8yx6Fpom26Yd7L0
	 jIOH/ksVtKnAA7xhRddHt2E+bUvanVmzBMeXAr9kx5GEt2W4tNKZgSXDn+8RvBlFAF
	 pWmvrEXUjfO1yut2pmKa9ZeHl5/6BXtfTky2MeoWDxOtT8cW8vJf4rwmI9U7CCqOLO
	 e027qZVJ33zJAsyAs6qL4Kl5PYwHb+PLbSltyXcxcIwICh9BX5E6PJL/MNVzdx5Yt4
	 NhLV6YJf6l29OGAbmAZLOUIaiYQP2ewLPuIi7TNVSxA2sp2fVudiXY8zO4Atw+x2lj
	 6svsvUMtSfdeA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 11/19] dmaengine: ti: k3-udma: move inclusion of
 k3-udma-private.c to k3-udma-common.c
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sai Sree Kartheek Adivi" <s-adivi@ti.com>
Cc: robh@kernel.org, vkoul@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260810151423.1948224-12-s-adivi@ti.com>
References: <20260810151423.1948224-1-s-adivi@ti.com>
 <20260810151423.1948224-12-s-adivi@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 16:27:33 +0000
Message-Id: <20260810162733.A335D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Moving `xudma_*` exports to `k3-udma-common.c` severs the module d=
ependency between the glue layer and the `k3-udma` driver, allowing trivial=
 module unload and subsequent use-after-free.

Pre-existing issues:
- [High] `of_xudma_dev_get` returns a pointer to devres-managed memory with=
out establishing a device link, allowing use-after-free via sysfs unbind.
--

--- Patch [11]: [PATCH v8 11/19] dmaengine: ti: k3-udma: move inclusion of =
k3-udma-private.c to k3-udma-common.c ---
commit d7f9cc34a06f8d7304b5d1021da68dd8f487667c
Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>

dmaengine: ti: k3-udma: move inclusion of k3-udma-private.c to k3-udma-comm=
on.c

This commit relocates the inclusion of k3-udma-private.c from k3-udma.c to
k3-udma-common.c to allow sharing the code with other udma variants.

> diff --git a/drivers/dma/ti/k3-udma-common.c b/drivers/dma/ti/k3-udma-com=
mon.c
> index b9d3cac5eb9d0..01b66e9f026b4 100644
> --- a/drivers/dma/ti/k3-udma-common.c
> +++ b/drivers/dma/ti/k3-udma-common.c
[ ... ]
> @@ -2535,3 +2535,6 @@ EXPORT_SYMBOL_GPL(k3_udma_setup_resources);
> =20
>  MODULE_DESCRIPTION("Texas Instruments K3 UDMA Common Library");
>  MODULE_LICENSE("GPL v2");
> +
> +/* Private interfaces to UDMA */
> +#include "k3-udma-private.c"

[Severity: High]
Does moving this include introduce a regression by shifting the xudma_*
exports from the k3-udma module to the k3-udma-common module?

The k3-udma-glue.ko module bypasses the standard dma engine framework and
relies on these xudma_* functions. Previously, these functions were exported
by the k3-udma.ko driver, establishing a module dependency that prevented
k3-udma.ko from being unloaded while active.

By moving the exports to k3-udma-common.ko, k3-udma-glue.ko no longer holds
a reference to k3-udma.ko. If an administrator runs rmmod k3-udma, could it
successfully unbind the driver and free the devm-allocated struct udma_dev,
causing a use-after-free in the networking drivers on their next operation?

[Severity: High]
This is a pre-existing issue in k3-udma-private.c, but looking at how
of_xudma_dev_get() is implemented:

drivers/dma/ti/k3-udma-private.c:of_xudma_dev_get() {
    ...
    ud =3D platform_get_drvdata(pdev);
    put_device(&pdev->dev);
    if (!ud) {
    ...
}

Since of_xudma_dev_get() drops the device reference before returning the
pointer to the devres-managed struct udma_dev, and does not establish a
supplier-consumer relationship via device_link_add(), can this lead to a
use-after-free if a privileged user unbinds the driver via sysfs?

The driver core would be unaware of the glue layer's dependency, allowing t=
he
unbind to succeed and free udma_dev while consumers hold a dangling pointer.

> diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
> index 9a261747c8709..ddedd51ab26d9 100644
> --- a/drivers/dma/ti/k3-udma.c
> +++ b/drivers/dma/ti/k3-udma.c
[ ... ]
> @@ -2857,5 +2857,3 @@ module_platform_driver(udma_driver);
>  MODULE_DESCRIPTION("Texas Instruments UDMA support");
>  MODULE_LICENSE("GPL v2");
> =20
> -/* Private interfaces to UDMA */
> -#include "k3-udma-private.c"

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810151423.1948=
224-1-s-adivi@ti.com?part=3D11
