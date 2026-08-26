Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013000.outbound.protection.outlook.com [52.101.83.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E09038F636;
	Wed, 26 Aug 2026 16:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787761627; cv=fail; b=ZxgwLykoPRNjh89BZsKLDy+H6H1irGQP6CMlYDa2ZzY/nLcTSgVTCh8g/9K7MTcoWTL5nWc4egTJAyoF8mDiH0zA/YtPpF+94oZGF0QHfe395/CzxoyIsgM4BSs4dkAp8S2Rra46RNpk1u5Yy4AyjAj54Hq7FPwkxb76AsCyKZs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787761627; c=relaxed/simple;
	bh=ycM3pJ44rMa8BEoHHt/F2LkNLhR0fob5tj6FCA1IAaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ATLzObfRK5FDBfPn6SDVZf7FQGy/XmwA4rFLdt9uDj1fz3sRFaFt8g+N1V4xGlDLsL+/a1SI1vutb0XiNnyiQytlhsKWvLJQ/JhZ3VH4LBhB7Uv91/EUAOgm2hT3Rs6MYLg+V1n22UMvp/sybUd3dV6KemlZQSGxPPX4+5K+CBM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=bMFB+HYd; arc=fail smtp.client-ip=52.101.83.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="bMFB+HYd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T7JhAml0znBAQC8AQdqknfAyZWVW6Og5fEsITnKBFh0LwaDpUnuHo7jh9Cap0Dv0o/QIyHWh8TNbm11woLKYRF3A5R+bFqfNRsTgQfOHY3cC6FuQ7IPqZIgFautGKZlg/kn/5fwHI7znx/MKEwK2g9r+GhqLlL0irOzqXer+ItrwUKZHGbM8MbmHJrOdwShZ5BgC85Tx61YY6HZmZG7xKRrdhjTBV08piG8gELw23rI/7W7y9ZGjrQDeQQxqg0MImyle17Wsmm7tLnDf7XWSMILcJcZdaeWXwGTtWj03DPwuTlk5co3XmLzJu5Q0aIzbjJYGK3uI1tT9pw/XwdzlBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PQNB7S8RCBxFW+7NcYZvzwVgYXls+CU9rOWlsdFydSU=;
 b=Mqbq58iA8xI03X8NQkbrOVm5uoeBEws0tYdZ7pNTavNknaJCukymh/zcUDbw0JbUg4Ro96VO4jaiXuy8bvIvMuSv/Dm2vcUbvLA7VhxVhXyfNkYkHtFxOIrWUjDQ+l0oCYkCSIjg04LG0hrpHS39QLVQWiuldWT13d7Fn3gG8GfjQCI7y7A9eO4jPf3TdSju5QbLE8uPhoh9rzKiuG4mKcIud/4mDe/nLzqfZkgyV1eCP8K3lZG5oXukmOGHoor9YKmTOusdb9Mz6RivZRViGsWez0Hnkb2RWGrZunqVIsSTZ6/OrynDzVPgjHkwoisUZ6p5yv7ZiAtA9K6+avZS5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PQNB7S8RCBxFW+7NcYZvzwVgYXls+CU9rOWlsdFydSU=;
 b=bMFB+HYdHGZ9269cpjYievRnjOqXeFaomOt/wD0ig46o9mnZjMbsGa5785H2Dv12nnR2PUeNtS9kfotdx2O+SW8TbSl3WgdlIcJ1hYsdf4+arvxCLASMX53nDRY71+RLgeSSdKbgCGc63aAGEurlHl8pzKzMJF5Vf1DzCR08bqVFCpYDd6s+P7LAsePgvUG28gniB9tp9tzfEV1hv/UnGZft2dB+1k7TgR4B35kIclIFCS42wdZyChX1SAdst9oSF4lLPdzsnvTp3+Hw5a0zYxBi8gWPv3Hl5UnIdEYz6LHJQ4HRGcq6QbJmdmFAK1lmeNQJ4R0XsYeH0S2y0MNxbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI0PR04MB11784.eurprd04.prod.outlook.com
 (2603:10a6:800:2ea::12) by PA1PR04MB12199.eurprd04.prod.outlook.com
 (2603:10a6:102:560::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Wed, 26 Aug
 2026 16:27:02 +0000
Received: from VI0PR04MB11784.eurprd04.prod.outlook.com
 ([fe80::d486:debf:a139:2953]) by VI0PR04MB11784.eurprd04.prod.outlook.com
 ([fe80::d486:debf:a139:2953%5]) with mapi id 15.21.0360.006; Wed, 26 Aug 2026
 16:27:02 +0000
Date: Wed, 26 Aug 2026 11:26:52 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Yuanshen Cao <alex.caoys@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 5/5] dmaengine: sun6i-dma: Add support for Allwinner
 A733 DMA controller
Message-ID: <ao8TzCAhWTxtxDB0@SMW015318>
References: <20260826-sun60i-a733-dma-v4-0-dc2f745f40dc@gmail.com>
 <20260826-sun60i-a733-dma-v4-5-dc2f745f40dc@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826-sun60i-a733-dma-v4-5-dc2f745f40dc@gmail.com>
X-ClientProxiedBy: SN7P220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:806:123::12) To VI0PR04MB11784.eurprd04.prod.outlook.com
 (2603:10a6:800:2ea::12)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB11784:EE_|PA1PR04MB12199:EE_
X-MS-Office365-Filtering-Correlation-Id: 26cd4a6c-3432-4b2b-c38d-08df038edc2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|366016|19092799006|1800799024|10067099003|6133799003|22082099003|18002099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	g1Ai679olGqDb0Pd+EdqQjLPeg+dgzYYozI6s27y8W4h64Pc+zMijlv7jHF8u3YL5eNPMMmmX8F2qL+Fx634C04m50wHAZvEdZw4DXf8H40jOPjxA4wZygO+S2kCQEq6LF7LYH2zF+OWq/1BbcWT6klPbRoUXXg4QiqRulHBj13fBeOdTakYR7aNq6InSfwmGvw9qwrTgF2TmSNuXr6M0oCd41V04Z4ueCeramS8nfiwZJIQAtUZVPnI0hGJUHjeRqm2fQ/UfZ1quCsaQ0BDP/u1n0bOwhPQkMNe6QC7DRE5eFL/iuGrAM4QkKs25ImkU+mQcuELNydYDaRoFpApfyBa5Q5Yqt4GyQ6SDyi+4jBeb+WGiM63+vOH/g/UayzPdd7xZos++Na/ugH5b0dNuRh5nIpGdGvnr7RXDV0SCwANSXK4fH3Rn7E7wZr1b/GSBvRzkiVv397Nh3do5AxpTaUiiGCwb4y2iy0iyOFgcPJ6oLJ04ZFHXXDYGi4rcH+lqqiiFsGGZumItzuFU70DRPxzIC7s3Q74i9bgW1Ii9AHg4wOiUM7oc7G7upwepUB1dgHbqi/CNCMMVH7oqU25tw662wSwYNLmsHZZFmfxzwQuK24eK04Ad27O+hekR0TZ2BhC0DXJovys6Vp2zR1foIrpbvjfLNQeisKXit3oa5I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB11784.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(19092799006)(1800799024)(10067099003)(6133799003)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?O8ntwEEXIYGdXqNAxwMDUaSIOU2PtbjCI/bDUZuQPkRFLcSVjOCr7clyA6LD?=
 =?us-ascii?Q?Ab5iZLpORgHlKEQVAzINnuaZR6pRfnn5fZq/S6myuTBr7Q2WDNPab5199J85?=
 =?us-ascii?Q?BO5TMYFIgQ/owDYT3LvDs5j1b0+LalPmxPVwXKlbMt2Nqc1vUm5TC4EFDCog?=
 =?us-ascii?Q?v4fZZMGsBxmYL+s+k4UKPicU1kHyN2nXxmHfPPtaucaX2ySVEK/M/NNVaLf0?=
 =?us-ascii?Q?ZYzRnPWDldfgCWuR2de/ZRR/WRi1HN+94fnuszTjSVAuycmry1YczaTGvTJ3?=
 =?us-ascii?Q?Mq7EjAkNkJeLS3Fcqfl5eP82ziGwOzr1Mx8wwFsGF7J4jnYFuR9itBu2rnWG?=
 =?us-ascii?Q?c2owssuLaF7/rtusUloYeJe5tJNSKbvvyBIy8+wRe5vGsL4SJNjonAB3SoIO?=
 =?us-ascii?Q?Ud0slSGIcQi+PChQVe4JJdfLW/oe3o9PpXGu4AQeGoGNMlPQt3rVZ3lZ3SpQ?=
 =?us-ascii?Q?c7Z+cS04PQaHgpkP1Sr1mC8PzlzvgUhjQyxpvWGXzfhkuVTG1z7m2W3pKKyR?=
 =?us-ascii?Q?sdLMCp66yhtsu02vpPi5yKSMy1WJxNvw5POfMV29KWjwppfaFYvakjn0CW33?=
 =?us-ascii?Q?+/wsNBExjBRj21tXHxCREOowweec2szMvcQbZ8P+3AxUgQrxT7APU8H3aDAg?=
 =?us-ascii?Q?r57VCvs5UOIu8VF6HEQfqpVtHnIfF+aXGU1Nsb154crzWLvj7IvHkshgAMOX?=
 =?us-ascii?Q?6z4XkvgPf0uUlOcvYdF14vl3pWUsTAbVsB1UWAa8rdcnzog3lVrK/6WVVBji?=
 =?us-ascii?Q?dU3xtfQBZch0R7vOgsdDBeoL03mJlP/Obqt1mWhtfg5TlbMc+zTGROYYpjCR?=
 =?us-ascii?Q?TfeWl5UMK8sPrPqfAT/SH+oHirb4fhWm0LgB+nHr65TjULOYBvShKeWbliqV?=
 =?us-ascii?Q?zrgPBwLPaPJvkeRN9mODQ4PMf6XAh5f63BvhGHiiRojPKsR9Mc3pUhu4rH4b?=
 =?us-ascii?Q?zxRgXYb7pBbZtozBR3hVT9IJb0Y+lrJItrxy5CvfHFsGWZ0QuISFKHmn+HDH?=
 =?us-ascii?Q?gyogZt98HbdDpoTrE0I6OOujc3FdgGtMTtSr7X4MMPoncGehPwphG5WonG7+?=
 =?us-ascii?Q?kW9sSrWOt0n10p3PwScNImdqejLGawSfbO9n3khdg+0z7/p/wGd+j9lrr15I?=
 =?us-ascii?Q?fjF60TVxeThSm0xQy6ifQwfSL2KkB5NMZ+zyBWJAKo15dK3/yEKY2Y7csARk?=
 =?us-ascii?Q?OvXcsN1AaMS2VS/sLcqPl9C/iJEofTxTSrDXGbDWwTrJW0J+y0hC2OCA31mW?=
 =?us-ascii?Q?C3z3c5jRutRg2cLrIPbi/h1lmVmgN7VYLzMWl0A0qnKCy2vNyHVmTINEKjkS?=
 =?us-ascii?Q?DgA89/1rAk3fdBZCUTDQDu4PeWryp1XNaYbXP49JnL//mtX+dKo8D/FXQLLE?=
 =?us-ascii?Q?bictm7qEkg5m91hQ3HNZ7oSj669JHf8nVxJxRu/McQ9ae/TUNaIhF/ePBt9F?=
 =?us-ascii?Q?vnrgIfZLDLmDmjK4KoYWN3KJETTX5LIPrHVyQtZq/BexGYDdttlCx9OeAAuq?=
 =?us-ascii?Q?eOwWSRWzZqWnIEFEUTOJfV+vkh5xYjAOWgKIKRdomM42Y5rwkDwXp4vC8gOc?=
 =?us-ascii?Q?IwrzMkyIMa5GewfLyN5g5M6u0Ateumrax3On4bJaXPQ4EpZGRiveDFusC21+?=
 =?us-ascii?Q?kpHdBUH/NqgmyK/KYj6bwhFjdT+0CbDdyBUGuJKNTG59vwmjQD5DLnH4q0io?=
 =?us-ascii?Q?708e+5vE9RgOvNzKXc9bYUcTa7Uk0KdFo9glnx2J1heZG32Hgc7llK712zBa?=
 =?us-ascii?Q?QYlMaELT63A0z+oeFDfZguCVssVaA74rHVVwfx+EAguBhHsjzmrA?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26cd4a6c-3432-4b2b-c38d-08df038edc2a
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB11784.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 16:27:02.7171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2OeRYkQBUd8XracqLzkHu1LByGmI5BpRRTftVM8ricpMGEHayQMzzTb4492kN7tvkVMrRc2auEbmBGTG9v/B1n1FSBN+VhiFYBlYe1D7HHxsOOlT+Ohu3UweVtQtYbxt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB12199

On Wed, Aug 26, 2026 at 01:30:07AM +0000, Yuanshen Cao wrote:
> Implement support for the Allwinner A733 DMA controller by defining
> A733-specific register offsets, bitfield masks, and the
> `sun60i_a733_dma_cfg` configuration structure.
>
> This includes the IRQ stride, offsets, and channel counts specific to the
> A733, as well as the 32G mask for high-address fields in the LLI. Add
> `sun60i_a733_dma_cfg`, which ties all the refactored functionality
> together for A733.
>
> Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
> ---
>  drivers/dma/sun6i-dma.c | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>
> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> index b96d7d90f6b5..fb371b57d792 100644
> --- a/drivers/dma/sun6i-dma.c
> +++ b/drivers/dma/sun6i-dma.c
> @@ -57,10 +57,14 @@
>   * Interrupts specific registers
>   */
>  #define DMA_IRQ_STRIDE_A31		0x04
> +#define DMA_IRQ_STRIDE_A733		0x40
>  #define DMA_IRQ_EN_OFFSET_A31		0x00
> +#define DMA_IRQ_EN_OFFSET_A733		0x134
>  #define DMA_IRQ_STAT_OFFSET_A31		0x10
> +#define DMA_IRQ_STAT_OFFSET_A733		0x138
>
>  #define DMA_IRQ_CHAN_NR_A31		8
> +#define DMA_IRQ_CHAN_NR_A733		1
>
>  /*
>   * Channels specific registers
> @@ -110,6 +114,8 @@
>   */
>  #define SRC_HIGH_ADDR_MASK	GENMASK(17, 16)
>  #define DST_HIGH_ADDR_MASK	GENMASK(19, 18)
> +#define SRC_HIGH_ADDR_32G_MASK	GENMASK(13, 11)
> +#define DST_HIGH_ADDR_32G_MASK	GENMASK(17, 15)
>
>  /*
>   * Various hardware related defines
> @@ -1321,6 +1327,29 @@ static struct sun6i_dma_config sun50i_h6_dma_cfg = {
>  	SUN6I_DMA_IRQ_A31_COMMON_CFG
>  };
>
> +/*
> + * The A733 binding uses the number of dma channels from the
> + * device tree node.
> + */
> +static struct sun6i_dma_config sun60i_a733_dma_cfg = {
> +	.clock_autogate_enable = sun6i_enable_clock_autogate_h3,
> +	.src_burst_lengths = BIT(1) | BIT(4) | BIT(8) | BIT(16),
> +	.dst_burst_lengths = BIT(1) | BIT(4) | BIT(8) | BIT(16),
> +	.src_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
> +			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
> +			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES),
> +	.dst_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
> +			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
> +			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES),
> +	.src_high_addr_mask = SRC_HIGH_ADDR_32G_MASK,
> +	.dst_high_addr_mask = DST_HIGH_ADDR_32G_MASK,
> +	.has_mbus_clk = true,
> +	.irq_stride      = DMA_IRQ_STRIDE_A733,
> +	.irq_en_offset   = DMA_IRQ_EN_OFFSET_A733,
> +	.irq_stat_offset = DMA_IRQ_STAT_OFFSET_A733,
> +	.num_channels_per_reg = DMA_IRQ_CHAN_NR_A733,

Nit: if only use once, needn't define macro, you can put value to here.
Also please check previous prepare patch.

Frank

> +};
> +
>  /*
>   * The V3s have only 8 physical channels, a maximum DRQ port id of 23,
>   * and a total of 24 usable source and destination endpoints.
> @@ -1355,6 +1384,7 @@ static const struct of_device_id sun6i_dma_match[] = {
>  	{ .compatible = "allwinner,sun50i-a64-dma", .data = &sun50i_a64_dma_cfg },
>  	{ .compatible = "allwinner,sun50i-a100-dma", .data = &sun50i_a100_dma_cfg },
>  	{ .compatible = "allwinner,sun50i-h6-dma", .data = &sun50i_h6_dma_cfg },
> +	{ .compatible = "allwinner,sun60i-a733-dma", .data = &sun60i_a733_dma_cfg },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, sun6i_dma_match);
>
> --
> 2.55.0
>
