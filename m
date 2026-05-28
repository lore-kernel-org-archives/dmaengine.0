Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26EB3BE175
	for <dmaengine@vger.kernel.org>; Thu, 28 May 2026 10:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779965020; cv=none; b=mBZGU4JSYxOQNJ0faQ2BsruS/ypRnH9yYPlHYjJOqsH/IIwKP2Ae8yF1S9+gkg1oPMrJHporyKeTW5AYLTdI9WnHqbfg/wHDI0frUT8c4XH1uttmqbCXtVyqZ0e/vaelFg/T/eC4DMoFB3fCJFAzXDRhl3ggEmo7nM0AmrQqpew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779965020; c=relaxed/simple;
	bh=Bz3+wGDWauvFsAIayKZJ++bfPlG8tKunVHxqrJzrSDY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Aa5MFrLobhpLET/db4hcVLREKaqglTG3y0nzS1pf81h15oaShhZxEInSvN6zQNcjazhqp0BpGEwwkVqDmnOzaNo520OxsCTc5InKgeZe3bCsIXFyCOVXze+zJSvXFXN9kUBoUamOPtE0ySmGYub5yY7ytrID/++wIahYFM0kWMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OdaFsRO0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OdaFsRO0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92F7E1F000E9;
	Thu, 28 May 2026 10:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779965008;
	bh=wTVneOPpMOBMfufnEaMrYirQyA6dfiTVqJCnlS0lymM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OdaFsRO0c54AzjHvjPuUB7D4zOt25992Vs6YaTTkl+5yAFb40pNUjlGp47myZjS0A
	 hMQxR/7xdeCtpBTKOolqt8FAjakb3Y12DyXP9bUuPMSycTpKzGk8URjy8rAYr2AXWQ
	 yeqeJS72yH6Tf6pkgDwnnBCViXNliiqO/z32nRHe81zfRYW+u0gHEaqtJfCfkGJVEO
	 S5WXXM+zO63w0CJT+BtXlwPEo3qyYx30wk9wUvNMgKkQGHpuEFkyzwcYIYFoh9NodP
	 bYIxB7fAA7Ia3MPabHMGAojZcCX87PSrM1vJZpWWJTCCT1J5xXRe5TUdhYV+9JM3co
	 qZmd5H042t6iA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1] dmaengine: dw-edma: Add Xilinx CPM6 DMA Device ID
Reply-To: sashiko-reviews@lists.linux.dev
To: "Devendra K Verma" <devendra.verma@amd.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260528101202.1244624-1-devendra.verma@amd.com>
References: <20260528101202.1244624-1-devendra.verma@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 May 2026 10:43:28 +0000
Message-Id: <20260528104328.92F7E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] Configuring 64 read and write channels for the new Xilinx CPM6=
 DMA device causes severe heap out-of-bounds reads during probe.
--

commit f926ec7cda085a4bb6bcd59ed57d0e183c1d998f
Author: Devendra K Verma <devverma@amd.com>

dmaengine: dw-edma: Add Xilinx CPM6 DMA Device ID

This commit adds the device ID and configuration for the Xilinx CPM6 DMA IP.
It sets up the device data to support 64 read and 64 write channels.

> diff --git a/drivers/dma/dw-edma/dw-edma-pcie.c b/drivers/dma/dw-edma/dw-=
edma-pcie.c
> index 0b30ce1385036..c5e0411428693 100644
> --- a/drivers/dma/dw-edma/dw-edma-pcie.c
> +++ b/drivers/dma/dw-edma/dw-edma-pcie.c
[ ... ]
> @@ -125,6 +126,19 @@ static const struct dw_edma_pcie_data xilinx_mdb_dat=
a =3D {
>  	.rd_ch_cnt			=3D 8,
>  };
> =20
> +static const struct dw_edma_pcie_data xilinx_cpm6_dma_data =3D {
> +	/* MDB registers location */
> +	.rg.bar				=3D BAR_0,
> +	.rg.off				=3D SZ_4K,	/*  4 Kbytes */
> +	.rg.sz				=3D SZ_8K,	/*  8 Kbytes */
> +
> +	/* Other */
> +	.mf				=3D EDMA_MF_HDMA_NATIVE,
> +	.irqs				=3D 1,
> +	.wr_ch_cnt			=3D 64,
> +	.rd_ch_cnt			=3D 64,

[Severity: Critical]
Will setting these channel counts to 64 cause out-of-bounds reads during pr=
obe?

Looking at struct dw_edma_pcie_data, the ll_wr array is statically sized
to EDMA_MAX_WR_CH (which is 8).

While out-of-bounds writes are prevented because Xilinx devices implicitly =
set
non_ll =3D true, several loops in dw_edma_pcie_probe() unconditionally iter=
ate
up to wr_ch_cnt and rd_ch_cnt without checking non_ll.

For example, the loop computing the PCI BAR region mask executes
mask |=3D BIT(vsec_data->ll_wr[i].bar) for i up to 63. This will read
significantly past the end of the vsec_data structure.

Can this corrupt the BAR mask with garbage data and lead to an immediate
kernel panic if the allocation is near a page boundary or has KASAN redzone=
s?

> +};
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260528101202.1244=
624-1-devendra.verma@amd.com?part=3D1
