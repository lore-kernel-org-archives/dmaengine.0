Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13A83E8C77
	for <dmaengine@vger.kernel.org>; Mon, 31 Aug 2026 11:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788177501; cv=none; b=sh3gGpW/A/+AaWXssr51fU/65p0s1ZYM8Mbs0+55tkIRfPaA2Xx/K/yECJtQZhiwYfnwivTwVnsKP8T6cZ1TGDmiaomfIRNEzu5mNK/OjXVgTKg94/o+wgfoDuMoy9TLMqcvIYn2rW7tgh5R2IqXS3wGKZcM3vOjCfYpVIPUS1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788177501; c=relaxed/simple;
	bh=WgciEymir9Z5e4WoXku2jutsIpdIjwOp6HXvXD/0pNE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uJIdO2x7z0xIynaqyWNRF09Rc27mzW0jJl7ZxKyL/r/aj1p5X9rSTGJXQD4SXzztqsscicBRYnPIMA2QOLV19k9JBhoBqqmbmQtxtC5xCfNnUp0ExT1jIRMvp7P6M61i7SIft4qK/pAwAQzjYTveHe138nOaJt9fWoMld0EV0Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LAvM1CCB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LAvM1CCB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F17781F000E9;
	Mon, 31 Aug 2026 11:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788177500;
	bh=GAHAAz0vR0+EAIETZV62sOJS476uR5w0Kqxpff4PHNo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LAvM1CCBDSTxwBCtC1NQ2umYZUDFqVuGYIytW/Dt28Jx5GAHOGVQTADaXPzS3843I
	 Vhf7WJgtgnho6iXNp7ur5OlzrrpY/SIWoxkCZ9UA4rvKOMLTqwUb77G+/gNkUh0ooy
	 OzpiL5N+3XdZH/FCBJhLJBexfvr2RIN+aH7exIGzaSETrzFfTM1ZFsze487RGzzQM0
	 vaMAdn/UWseqgPrHlWlGiQiFCFS2pXAJCAiWRGoOY1KLM/XCkq1dclz2O3b8FSj3/H
	 gsGP9Z5IoHAiQ6E6gHNEEAecZBYj/7it0YrKIPbKWQf2CaUPhCmDIk7Vzq5SvndSlA
	 iFaZ5f9epwvng==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/9] dmaengine: dw-axi-dmac: Use bus width capability
 helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TnVubyBTw6E=?= <nuno.sa@analog.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260831-dmaengine-support-wider-dma-masks-v3-3-507d97496f2d@analog.com>
References: <20260831-dmaengine-support-wider-dma-masks-v3-0-507d97496f2d@analog.com>
 <20260831-dmaengine-support-wider-dma-masks-v3-3-507d97496f2d@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 11:58:19 +0000
Message-Id: <20260831115819.F17781F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Mismatch between commit message claims and actual function calls.
--

commit d65f8f1318d2325009bb83a6877e70b0e20de0ed
Author: Nuno S=C3=A1 <nuno.sa@analog.com>

dmaengine: dw-axi-dmac: Use bus width capability helpers

This commit updates the dw-axi-dmac driver to advertise supported bus widths
using capability helpers instead of assigning legacy u32 masks directly.

> Advertise the supported bus widths through dma_set_src_bus_widths()
> and dma_set_dst_bus_widths() instead of assigning the legacy u32 masks
> directly. This keeps the driver using the new bitmap representation
> while preserving legacy fields during the transition.

[Severity: Medium]
Is this description accurate regarding the functions being used?

The commit message explicitly states that the patch uses
dma_set_src_bus_widths() and dma_set_dst_bus_widths(), but the actual
implementation in dw_probe() uses dma_bus_width_set_many():

> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma=
/dw-axi-dmac/dw-axi-dmac-platform.c
> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
[ ... ]
> @@ -1565,8 +1566,13 @@ static int dw_probe(struct platform_device *pdev)
> =20
>  	/* DMA capabilities */
>  	dw->dma.max_burst =3D hdata->axi_rw_burst_len;
> -	dw->dma.src_addr_widths =3D AXI_DMA_BUSWIDTHS;
> -	dw->dma.dst_addr_widths =3D AXI_DMA_BUSWIDTHS;
> +	ret =3D dma_bus_width_set_many(dw->dma.src_bus_widths, buswidths, ARRAY=
_SIZE(buswidths));
> +	if (ret)
> +		return ret;
> +
> +	ret =3D dma_bus_width_set_many(dw->dma.dst_bus_widths, buswidths, ARRAY=
_SIZE(buswidths));

Could the commit message be updated to match the API that is actually called
in the driver?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831-dmaengine-=
support-wider-dma-masks-v3-0-507d97496f2d@analog.com?part=3D3
