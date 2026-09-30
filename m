Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013013.outbound.protection.outlook.com [40.107.162.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C513E49EB;
	Wed, 30 Sep 2026 21:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790805186; cv=fail; b=H5I89eBbTaT2/31a3Izc1QpR71peTm8oaKinm6CCYVXBj32MRiw2ffD6Nlwx/7F2YMKacCxl36U+qS7clzBlmuzAmpdWzunhMbtGlgqZ/80rcBp1V0djp1/TLqh+1+KeJ7Srz1i9yIvyBULlBxxPVc8DUJubs1+qTAevmRV3oFQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790805186; c=relaxed/simple;
	bh=LaSeD193CljjVFYB71koCfFIwzRZK/JtWgGXjdP1Id0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=p5iraxSoEKE2K4UEKBJxK7JEZt+hQvVTwFmAEQHuQ6p18KFO/74SHLEK86RdOXdnpyWd1RZqdPyxZQvM+yhrAZjM/pSfMO1/UGZbAX55X96utHly5Hhaxg8d3KHXr6ZoPuYQSA8UiG0YEwwK/oj6b7OoFkxabNaZsRP6uFiUHOI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=buLvmrf+; arc=fail smtp.client-ip=40.107.162.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="buLvmrf+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zLNya7pPxdOPhI9ZCnx20o+lXxQz2lihCXxTv5m6mIxy14fu8GZOS3Dk2n1uwOakZwihrORUwcW9PI2Tw7fjNxA+F6lyuhhSOV/7fdBp3aK8ei1+ab06Xr8kzipKAYSNHtKiXvLw6BWCCz+zv55qN/bzwCq5NXLLHigpmXxSBMpRcRy1ZisnD50jHkBQUeDWtUm0DjlmxTrlP7mvUbk/SA7SfiXbo9smX/DyqReLFHhb+Bd55mx6vJJFf8IPomqKs6NOPL23qTpEw7nyGlN9w3Jbrgjj2TTnk+ZatLIDk5sfguW0d1NvXPyw3xU4zl2LUyrYm4kDdNpWSNPEfs3xPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T3aTAh0LYmPppMsocV5oIWFydxQs4imnfi8eqxMz3h8=;
 b=L+tyNT2OULEyNL8yGEQzgL4VmLeSoIRQM0/L51b24852sdTlQegv8dPzMm8NBvTaxZwIRSCpFj13+m9H9hmA3lgt+U1g31BJ3mnZaRbBsh4Yj3J5On5MtwSqpqMHuYffEPPtpj6qxZpyeyet+GLanQQ0TmzXe6sqa9INLPABq8v6JnyW32jD5ZH9eMP7Q3v0XLInkwEMVhLhvcJwlFoR3BuLEY2BNne/zvWjOtZILU4rEf5v3q39aZMPlZ1stfv765B38EHxZx2wjBLmWUy3cgXNx8iKoyprx5r3CPqy7aHqiNAybsLMxaMXRmgBUjhDC3Kv3ELI+RiKi6MW6lnBew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T3aTAh0LYmPppMsocV5oIWFydxQs4imnfi8eqxMz3h8=;
 b=buLvmrf+8ckX03j212AGzBuCIRgx+Z+zpb3yqqMZtauewB42UGTfj4zN89gJnK+K782bDfXo/w0MRtZ7qX+EI7ubVqp6Ewx32x5LylBR3wpBXvNSVRLQogBTPjkMr8/6PHxv+4/ZRU6TxOYCOyaFFTmzW0iWAtQ24fGMs34LOGobvzqEm3uXNUM1hbDAz6dBfudsVAne1lN6uszLADtwBqwuTIbrOn1YgzbdA5NoYhlortWzcpdLNt3GwpCkqGDxHVi8xd6r0VBi/R9T/TNTATVdRUFiksmaHX8Z5xE0QGoGoBTzr7QLHZcdGFMfVonE8bxFcGBZ+COZrYPo+gNtjg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB5PR04MB11255.eurprd04.prod.outlook.com (2603:10a6:10:5e6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 21:53:02 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.022; Wed, 30 Sep 2026
 21:53:02 +0000
Date: Wed, 30 Sep 2026 17:52:47 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>, devicetree@vger.kernel.org,
	Keguang Zhang <keguang.zhang@gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: dma: loongson: Add Loongson-2 DMA mux
 request IDs
Message-ID: <ar2Er9RkFYfaNUY2@lizhi-Precision-Tower-5810>
References: <cover.1790068409.git.zhoubinbin@loongson.cn>
 <d8762c697fee7c2184f26968109162d59aef1514.1790068409.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d8762c697fee7c2184f26968109162d59aef1514.1790068409.git.zhoubinbin@loongson.cn>
X-ClientProxiedBy: PH7P220CA0047.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32b::6) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB5PR04MB11255:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bfe53a0-d444-41d1-b98d-08df1f3d3324
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|19092799006|23010399003|1800799024|4143699003|18002099003|22082099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	eHkUatmXWrANNDn7AB81ge3/JVMfOU107n/EeV1ILO6un40Ho36rr2J1WbfsgnSPFrMxPHH9FxCV1MTt2vIcj2MOGXIQ9htegAUM19aOUPS/j37+h7O1GBLKDz+p6GrDs8OK5tr67p1npN4yYRZpEMYfyJW70NswcFN20DxSH5E1fIRJxOVeIlXNiX9LPjnwUkhYk3KU/erUozJjPGMM+4yWXdIU6NyOoHh+knkUyI2X42xAb06p+f5qb0fA/3X5rgP/tQHTvDoSGfzneNQXoXjQBtrk/UftlL3u7NGmvuQ0mTlPCoMzG4Y/OydPzWOjJg8DELY6p4ouv6qF5DQ5VN2oVAn50AtfYY7G2199YTSzyF69IpL02JjJ9RpNr//3Iz151jx4H6stlu2XbTXbVBlPD57mRHgDtS3zR9y27GJtyWL+6vU/Wi9LfSleHM/+I8mFzl/bI8bH06ZT/iZqCUfV2DTvrlJyPEoc5BLs0XB3lgo9oUhsS29lNrYH7tI4xtPw5qeA/j6Np2K/moiegLQCRZ9QELNDoywXsx9d+2cwG54tyrCtzth84Pxway6eXUtoqcqhb31bCf/58/JIPEiPyKXUmV0LNzFjGtQHFlAv7bMm7znYzdOPO2Cn+4A5vpvZg6uhtmM+Y/4cqAymAMq4cWUDZubsTMqjhzAHCBM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(19092799006)(23010399003)(1800799024)(4143699003)(18002099003)(22082099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?m4zNqlqPaJH1HrQ1//wVzSCcOSYGNi9A64hVooswT2mlzC6URqu5AV63h3kb?=
 =?us-ascii?Q?5llBiLeZeRH0RiAxKA3M4OEm35JVdAxKnEjhthDoU8MzDsssDB/5Sxg6jHaB?=
 =?us-ascii?Q?YDut2BqzI5+JJGnPRYnxwiQV9h/cXVvJrhbKP70EZ+68DFiWSSXNFMiFgznJ?=
 =?us-ascii?Q?M4w+5GrzfTFVsCSCwUQbZPHwz9vK09T3KGD1t76YBGRIyRIOVzvWXqxUm7Cv?=
 =?us-ascii?Q?u3BUln0gwpUAVOTl2BbYje3aGg9QwqOyfK/uIAlobu4SWO6evWRfLuxmOeXM?=
 =?us-ascii?Q?o0sjfHzNfBHYuDsyxFKuBPgQLybUSXddlkDry0uv6NODAiaJr61Q1/0TH/fq?=
 =?us-ascii?Q?RWBAom79AsaCjMzRnoKXkmrLCnMPeHjxxJ81jo2A1Tv99t8s6IrNs3YOShaS?=
 =?us-ascii?Q?DE8UoO86IfNsKttJu2Zf1gmI10JWrKoC5A2G9x6cxEUH/L2EiEnkqzWnE3X5?=
 =?us-ascii?Q?jeS6oaBdlmuJ2Pf6o6ImZfHsuzKZ1WCWwKaMWXuuJZeSwR4SZOGtAWoaG/pC?=
 =?us-ascii?Q?rPOtLPjoqiWO4NFOEJZWB0Ei4qrgcJKmz3XxAGRjsje7zmuK4MypW//ZUGWX?=
 =?us-ascii?Q?fZTJsduer9EGE2fPcDN6NuL/A4k2mX2kKLgEMiXBinycwwAuEGCMwwzH0Fe0?=
 =?us-ascii?Q?mAVT9Ya1lQjRvqJ20aKr2+iYTTboy1MQ1UBymkIDksWWmmxiNFz3+nfA/cG5?=
 =?us-ascii?Q?iyLnnwRmFIuEp72W3iJt5wnVjS3Ry+33IwjlVY8k5yOUvxdYS+17yFRyM18J?=
 =?us-ascii?Q?Ha8T1x4KCIGhIkLOscB2BJmfnmgb2uCtG0XH7JfdE5kjRhBSNeYf0vrWrQKT?=
 =?us-ascii?Q?PPfyt6YrIMlQsUDzlPBrj5Mti3LL+uAzsm+edV5kyhknMgwEflLqjTHJb3H8?=
 =?us-ascii?Q?IB/I782zw/jZttZ3ddhfpj89ca5HDcRU2sIFIh/uMe0FcHJ+u4H2hiLb1aTK?=
 =?us-ascii?Q?Ct8zGCI6FojZx/jmaWBOfYJ0dCnAT2OrYo+mDeUsq9sfyv7LDQv3eSo1oQF8?=
 =?us-ascii?Q?JFLWZNs2hiSPk+mrBZ9XS23kKA0jdIfd2fnWosm704/APef+ZvEvat6z4PoS?=
 =?us-ascii?Q?I44wi0w23/TgA5f6088bL16gNxCXrAUIzExeUceR705qPsKwj7Q8EKVwwu+5?=
 =?us-ascii?Q?13NBRILKfkBqIW+BmcQx58Gp7srg7T6qy5iAmy33oqT+/PqHmwd+jq3J5vZi?=
 =?us-ascii?Q?RESDuHncTUKXqn+S1D0NF9asRZPs2gvcdnKTV4xuUMGUKXeAunqhIFxNveYy?=
 =?us-ascii?Q?6AUX/d6p9/7jhh2W3C7qaZQPNfFA1sTDB4UgiwLIx88YyZgEE9CCz8XV/GMA?=
 =?us-ascii?Q?qknwOo9PGoHoowjOtvo7oRowe3XJaG0zO9aheU1zMO885Mu7P+VIEga6Vf4y?=
 =?us-ascii?Q?9qpvES+BR72w7sMXDHdHw0cRvLLcHrTFTnnBaw4YUrIzOdDRGj8Qow8iqzDq?=
 =?us-ascii?Q?vkVL8Ew7Uxxc6LT4d/OkfneS4GUFzmAw4dNdqoX+8ndbuTCiXc7TxpxRyEJV?=
 =?us-ascii?Q?a66p4OGzcIPAV+r8B02brXB3gcM7l14J49STi48Fu94iaGkhjGDRhrwGxZ0J?=
 =?us-ascii?Q?Tb5BCJPW05jG6Ymik3vJ1tGGplzMNrO9F7J6hEg2VMvzALn6aDo1yu6Ws5wC?=
 =?us-ascii?Q?aviLj7UViPf78ylBsPxGIeSpPitOMqL85d1prlTAL625M3HvxhOZPc6CgCxo?=
 =?us-ascii?Q?NwAaTRacPvgU3FuIMZZBX0f9QzTzn7GA6ACXoEwHQULK6OkgzEMZ+t/pj66y?=
 =?us-ascii?Q?hHcg0/0uSnhVlTHKKcxc9IFJ53z5U/LvFfxJy0gLSm/wL6S1/z8i?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bfe53a0-d444-41d1-b98d-08df1f3d3324
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 21:53:02.3859
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L2Nl+w6P6nKOCEcJmIVXmCEor6g8O0AVCw59qEMC8v6syDZrV0uvu83pL+mgrICksi2oZxNUcNGz5dwKxS2tUdKAcriHkw85BbnAlJSiPiV070nnB5IRhtuf4DOMBHCo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR04MB11255

On Tue, Sep 22, 2026 at 05:25:42PM +0800, Binbin Zhou wrote:
> Add DT binding constants for the Loongson-2 DMA mux.
>
> The header defines the peripheral request IDs used in the DMA specifier
> <request channel flags> for Loongson-2K0300, covering UART0-9, I2C0-3,
> SPI2/3, I2S, ADC and CAN0-3. It also documents the channel-pair semantics
> for peripherals that use paired DMA channels.
>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  MAINTAINERS                                   |  1 +
>  .../dt-bindings/dma/loongson,ls2k-dmamux.h    | 56 +++++++++++++++++++
>  2 files changed, 57 insertions(+)
>  create mode 100644 include/dt-bindings/dma/loongson,ls2k-dmamux.h
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c31b81eb42d7..b021fb623446 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15347,6 +15347,7 @@ F:	Documentation/devicetree/bindings/dma/loongson,ls2k0300-dma.yaml
>  F:	Documentation/devicetree/bindings/dma/loongson,ls2x-apbdma.yaml
>  F:	drivers/dma/loongson/loongson2-apb-cmc-dma.c
>  F:	drivers/dma/loongson/loongson2-apb-dma.c
> +F:	include/dt-bindings/dma/loongson,ls2k-dmamux.h
>
>  LOONGSON LS2X I2C DRIVER
>  M:	Binbin Zhou <zhoubinbin@loongson.cn>
> diff --git a/include/dt-bindings/dma/loongson,ls2k-dmamux.h b/include/dt-bindings/dma/loongson,ls2k-dmamux.h
> new file mode 100644
> index 000000000000..dcc8df86befb
> --- /dev/null
> +++ b/include/dt-bindings/dma/loongson,ls2k-dmamux.h
> @@ -0,0 +1,56 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Loongson-2 SoC DMA Mux dt-bindings
> + *
> + * DMA specifier format:
> + *   dmas = <&dma_mux <request> <channel> <flags>>;
> + *
> + * The <channel> cell selects a physical CMC DMA channel (0-7)
> + * For peripherals using channel pairs (UART, I2C, SPI2/3, I2S),
> + * the channel number selects the pair: 0/1 -> pair 0, 2/3 -> pair 1,
> + * 4/5 -> pair 2, 6/7 -> pair 3.
> + *
> + * Copyright (C) 2026 Loongson Technology Corporation Limited
> + */
> +
> +#ifndef _DT_BINDINGS_DMA_LOONGSON_LS2K_DMAMUX_H
> +#define _DT_BINDINGS_DMA_LOONGSON_LS2K_DMAMUX_H
> +
> +/* UART controllers */
> +#define LS2K0300_DMA_UART0		0
> +#define LS2K0300_DMA_UART1		1
> +#define LS2K0300_DMA_UART2		2
> +#define LS2K0300_DMA_UART3		3
> +#define LS2K0300_DMA_UART4		4
> +#define LS2K0300_DMA_UART5		5
> +#define LS2K0300_DMA_UART6		6
> +#define LS2K0300_DMA_UART7		7
> +#define LS2K0300_DMA_UART8		8
> +#define LS2K0300_DMA_UART9		9
> +
> +/* I2C controllers */
> +#define LS2K0300_DMA_I2C0		10
> +#define LS2K0300_DMA_I2C1		11
> +#define LS2K0300_DMA_I2C2		12
> +#define LS2K0300_DMA_I2C3		13
> +
> +/* SPI controllers (IO mode) */
> +#define LS2K0300_DMA_SPI2		14
> +#define LS2K0300_DMA_SPI3		15
> +
> +/* I2S controller */
> +#define LS2K0300_DMA_I2S		16
> +
> +/* ADC controller */
> +#define LS2K0300_DMA_ADC		17
> +
> +/* CAN-FD controllers */
> +#define LS2K0300_DMA_CAN0		18
> +#define LS2K0300_DMA_CAN1		19
> +#define LS2K0300_DMA_CAN2		20
> +#define LS2K0300_DMA_CAN3		21
> +
> +/* Total number of 2K0300 DMA requests */
> +#define LS2K0300_DMA_REQ_MAX		22

REQ_MAX is not ABI and your driver have not use it.

Frnak

> +
> +#endif /* _DT_BINDINGS_DMA_LOONGSON_LS2K_DMAMUX_H */
> --
> 2.52.0
>
