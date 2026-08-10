Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA82B43710B;
	Mon, 10 Aug 2026 18:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786386649; cv=none; b=Acv3iFLaZGi5T2fd/7w1NdO9SuNb+0ftoWMWbbLiNttp1gze7Rsz92I3mrI1N7PLL5kPdgAn/oDtGWaM89hfE4dS7lommc0NshzLXX4MRZUtr01IiqHj5BVWSKkgDgwUPhSJRA1AA1Y32UnP3m+dLe5XKUICrfhLqzCV8I4L0ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786386649; c=relaxed/simple;
	bh=3MTznWCBHcuD28TJVXemw0xZGW/L27e1+DqmNPRzul8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oIuORGdgSWKL2cAx1QZ717bTpzvfi8F9/NUPMxacDLD+o3ZRYm3N/XyOxYnGC98VAOOPnHc/jOgV6h3VHbWzT1t/ZOL0S+8EiMsE3gT5ixxajm85quhWWLotm4CiI+NICm6iQeUrZhudnCDP+kC8t5uMMGcAPKqimwDfBYT2blo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NZC4SdcP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NZC4SdcP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBDBF1F000E9;
	Mon, 10 Aug 2026 18:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786386648;
	bh=Wdb8s0ReChtry1TvBeLFzaW/OTCXpDHpqN8sXotSyys=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NZC4SdcPR9sJcXWtEn1inmGJZKHGem/KCKbKYh44DpzVwSkrCirNAu0UEKD//Xi1I
	 CmR2l33oS6OyHDAiV4gs4rXLVsY20zrlmyCGlTLi1+sxLd76E1vU+j9KYzYQoxaNKy
	 cFa5ZAz/kYA6endnAF+oNqG/pIJ1sV6gdTZgmuYrt0INuH0DS1w7IymhufUfLvZOpl
	 24OFzXIkyfS0QY3qbuBwxqDPZxSGs+lAznMyouxLxs3B7Iw3dnCUhhAZBri8EuDV1g
	 AU/SvO8qhS7/z75z7fRPH1W90q9zfkwOaXbfd2BCJ5gQ75E8In2pX36Pc9cr4tnkZf
	 Bpgh+DjtBRSnQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 01/34] dmaengine: add tasklet-backed channel BH
 helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, dmaengine@vger.kernel.org, vkoul@kernel.org, linux-sunxi@lists.linux.dev
In-Reply-To: <2c62c39cafc0df59eb5381d3da82b1616a58fa20.1786384168.git.allen.lkml@gmail.com>
References: <cover.1785183549.git.allen.lkml@gmail.com>
 <cover.1786384168.git.allen.lkml@gmail.com>
 <2c62c39cafc0df59eb5381d3da82b1616a58fa20.1786384168.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 18:30:46 +0000
Message-Id: <20260810183047.DBDBF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Use-After-Free due to channel bottom-half (tasklet) being killed b=
efore hardware interrupts are disabled and synchronized during device remov=
al.
--

--- Patch [1]: [PATCH v3 01/34] dmaengine: add tasklet-backed channel BH he=
lpers ---
commit 552ba608049b66637e1d6db5b616db6c9c33204d
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: add tasklet-backed channel BH helpers

This commit introduces backend-independent helpers to initialize, schedule,
and kill channel bottom halves. It converts virt-dma and updates various
drivers to use the new API instead of directly overriding or killing
tasklets.

> diff --git a/drivers/dma/mediatek/mtk-cqdma.c b/drivers/dma/mediatek/mtk-=
cqdma.c
> --- a/drivers/dma/mediatek/mtk-cqdma.c
> +++ b/drivers/dma/mediatek/mtk-cqdma.c
> @@ -895,7 +895,7 @@ static void mtk_cqdma_remove(struct platform_device *=
pdev)
>  		vc =3D &cqdma->vc[i];
> =20
>  		list_del(&vc->vc.chan.device_node);
> -		tasklet_kill(&vc->vc.task);
> +		dmaengine_kill_bh(&vc->vc.chan);
>  	}
> =20
>  	/* disable interrupt */

[Severity: High]
This is a pre-existing issue, but could this teardown sequence result in a
use-after-free?

In mtk_cqdma_remove(), the channel bottom-halves are killed before the
physical channel interrupts are masked and synchronized. If an interrupt fi=
res
within this window, the interrupt handler processes descriptors and can
reschedule the BH via dmaengine_schedule_bh().=20

Since the device is being removed, devres will subsequently free the channel
memory, potentially causing the recently scheduled BH to execute on freed
memory.

[ ... ]

> diff --git a/drivers/dma/mediatek/mtk-hsdma.c b/drivers/dma/mediatek/mtk-=
hsdma.c
> --- a/drivers/dma/mediatek/mtk-hsdma.c
> +++ b/drivers/dma/mediatek/mtk-hsdma.c
> @@ -1020,7 +1020,7 @@ static void mtk_hsdma_remove(struct platform_device=
 *pdev)
>  		vc =3D &hsdma->vc[i];
> =20
>  		list_del(&vc->vc.chan.device_node);
> -		tasklet_kill(&vc->vc.task);
> +		dmaengine_kill_bh(&vc->vc.chan);
>  	}
> =20
>  	/* Disable DMA interrupt */

[Severity: High]
This is a pre-existing issue, but is it safe to kill the BH here before
disabling and synchronizing the DMA interrupts?=20

Similar to mtk_cqdma_remove() above, this opens a window where an incoming
interrupt in mtk_hsdma_remove() can reschedule the BH just before the device
is torn down.

[ ... ]

> diff --git a/drivers/dma/pxa_dma.c b/drivers/dma/pxa_dma.c
> --- a/drivers/dma/pxa_dma.c
> +++ b/drivers/dma/pxa_dma.c
> @@ -1215,7 +1215,7 @@ static void pxad_free_channels(struct dma_device *d=
madev)
>  	list_for_each_entry_safe(c, cn, &dmadev->channels,
>  				 vc.chan.device_node) {
>  		list_del(&c->vc.chan.device_node);
> -		tasklet_kill(&c->vc.task);
> +		dmaengine_kill_bh(&c->vc.chan);
>  	}
>  }

[Severity: High]
This is a pre-existing issue, but does pxad_free_channels() suffer from a
similar race?=20

This function is called from pxad_remove(). The driver relies entirely on
devres to free the IRQ after the remove function returns, meaning interrupts
remain fully active during and after the BH is killed.=20

A triggered interrupt could reschedule the BH right before devres tears down
the channel structures.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1786384168.gi=
t.allen.lkml@gmail.com?part=3D1
