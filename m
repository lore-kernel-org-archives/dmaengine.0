Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FEE03612EC
	for <dmaengine@vger.kernel.org>; Fri, 17 Jul 2026 05:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784265460; cv=none; b=b90BAXSXSyEdyFjqP0p22LuzlF6SwIvhrWfkw7SCNRFncPPfR4IO57Djfs8HX/MOG0cZa+imT7Ld+Ffqk3RGkIH+lTIOvgYPBsWpoEyxBcTIjyzkPonv6V79BYslbRdgs9CGgTfExY3PQIbl/3ViJ7L9qMu0Cp9wLZoMQO4y6hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784265460; c=relaxed/simple;
	bh=qaEm1z299SYmAfPHVP753osyjRelKxorGOtG9Mv26OE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bYGWEhSx6FOPr5tsmDz0ZMRP6DTSXX0fKbQQTB/DG71dkx1iYplq8zurc/B55IzH47UjjT/FjAqhSQM/J9gBQvyIsptt9kNyQEYRC1CIIolDyIR+0RdhzDts/pUoJFIMoZzo40phPI2uAfR1gh6eJlDtEP5KDY6lvTQ67fpfyIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K/Y/dek7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K/Y/dek7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDC921F000E9;
	Fri, 17 Jul 2026 05:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784265459;
	bh=CIqfpjof5KiKXTceTRRsJJSO0VwtAaOC3ZXmtRdWPSo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K/Y/dek7hrBUyG33rTF29SmVOI8+LXltQ5Eu1/Wcrb9ofXTzXr2v6eG/mLv90Sa94
	 NIkF3zMmP7p397y4tdAY30m8Wv/aUDdzT7xVz8S1jys2wGCwe2j12/57tQPpHHMyC4
	 2iwqVrbPqM00LylT6N/pHBany6GEnr5hpt81Wj3QlfnlTUo/ik30u4xwK/hO56j3uT
	 1cOIhEII13RJlvUZ26x06w+u1v+RcSgxcqASyutLweLXEEakvc2pCaScwZUzG8LU/M
	 1HnpMOE75G4V6u/TTJ4TRYAEvI7Ethaeneipr8AQdw7cpWgHsFZkxJyoPGXsuNOUI4
	 9MbKoB8W9drBw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 03/14] dmaengine: dw-edma: Add core quiesce
 operations
Reply-To: sashiko-reviews@lists.linux.dev
To: "Koichiro Den" <den@valinux.co.jp>
Cc: Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260717050308.2144108-4-den@valinux.co.jp>
References: <20260717050308.2144108-1-den@valinux.co.jp>
 <20260717050308.2144108-4-den@valinux.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 05:17:38 +0000
Message-Id: <20260717051738.EDC921F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] dw_edma_v0_core_off() fails to actually stop the DMA engines in HD=
MA compatibility mode because it relies on the non-existent ENGINE_EN regis=
ter.
--

--- Patch [3]: [PATCH v5 03/14] dmaengine: dw-edma: Add core quiesce operat=
ions ---
commit b74cbf35e0d2a9867f8a66e3ed4776b896fc6152
Author: Koichiro Den <den@valinux.co.jp>

dmaengine: dw-edma: Add core quiesce operations

This commit adds core operations to quiesce only the resources represented
by a dw-edma instance. It implements specific handling for unrolled eDMA
and HDMA compatibility mode.

> diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/=
dw-edma-v0-core.c
> --- a/drivers/dma/dw-edma/dw-edma-v0-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-v0-core.c
[ ... ]
>  static void dw_edma_v0_core_off(struct dw_edma *dw)
>  {
>  	SET_BOTH_32(dw, int_mask,
>  		    EDMA_V0_DONE_INT_MASK | EDMA_V0_ABORT_INT_MASK);
>  	SET_BOTH_32(dw, int_clear,
>  		    EDMA_V0_DONE_INT_MASK | EDMA_V0_ABORT_INT_MASK);
>  	SET_BOTH_32(dw, engine_en, 0);
>  }

[Severity: High]
This isn't a bug introduced by this patch, but looking at
dw_edma_v0_core_off() in drivers/dma/dw-edma/dw-edma-v0-core.c, does it
fail to actually stop the DMA engines in HDMA compatibility mode?

Since HDMA compatibility mode does not implement the ENGINE_EN register (as
noted in the commit message and addressed in the new quiesce path), writing
0 to engine_en here doesn't seem to stop the channels.

If a user unbinds the driver or unloads the module, could the DMA controller
continue executing transfers into memory that is subsequently unmapped and
freed, since chX_pwr_en is never cleared during the remove path?

> =20
> +static int dw_edma_v0_core_quiesce(struct dw_edma *dw)
> +{
> +	int ret =3D 0;
> +	int err;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717050308.2144=
108-1-den@valinux.co.jp?part=3D3
