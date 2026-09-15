Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012044.outbound.protection.outlook.com [52.101.66.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F527439327;
	Tue, 15 Sep 2026 18:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789496370; cv=fail; b=SNhDyivh3YvLfJquKJ9uEfRVyTELMOc0WpMYBqcZEhbbP3xs8Ff8jPTtAMy7At4WefbCPTHdK4UHIdwtaztVlRJ0vCWm40Gk8W1XE/P/aRDu01YYwLWL+HeluhJdZfkDqruInHIWIjU+ImwuApeLCFRRuwJqS4vx6c/IFqYWE5o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789496370; c=relaxed/simple;
	bh=aMQE3uvfimtns3tpezdr6aiMpzc/KJFahADYFp6fBnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KdJgCO8jV+JLL2kFvZW5QEnsyoFQlNLD/7Ep/1MSolY5rVUkj9T4PjvOmhwbdIyRY4jy4kbdftSkaDVqkGJ5lA1OVcMiVPBjIF4ARPmTmS28XLy5xxfy18F46jdlfuPPOSkgybNNj6Vh0GOK+MnW8jJH8HFGc//+A5gqy+intnk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=VQuD03OW; arc=fail smtp.client-ip=52.101.66.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="VQuD03OW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zCAUWOx/wBzDiHFau8bUxLTlAJpHtaIUAhyfq+leduWHdhApeQ2iFyH+TGEaoORBtPbMcGakV4dw6kUiUo/h/FnbfIFtLk0SudRCIEJAZDXcWq4ihXHnAKHSOcbdplcub1HUpwnO0R9/Xx7olr17BuvTURJzB9to+n9B+r+Xty8rIyIPhJv6X49VFzirrhI43Llrfp/BIlkUPIufyAkWmrNNW1C3XOU4l5vuju5NrCZELE78lLcrdBjSZB4sM3L5iOu8eq/YU2Xi4YBtDXqwuRK/S+3Aadk19xYNmYw1ty0nAtPxHCvJOtIjWW9ncSrqjRxDhjk31ULM+VZyBxiyhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OZMNo228noAsGBP5nEiDQVE31x3jaVXQzHspgnOsSjo=;
 b=HNe5dMs14NYpQZbS4Py+YBNkeMoUMBCn3MS5oMvWQZopC3FGK9e6hXAYSm5B/xEs4fHbMosVL8OaMlfQIq+pF740EP2Cm2dYl/ms1jAP1Y5FjXrfgmEE5vfqsIhJH/ZOb33ygB4iEIUEVMcShEI3jfU7uI6QfjUgKb4lFdODa49mrVLlG2gt3pq4l4TbxJ0w2Uu/zR/SZQVVhldo5O01f/51UBZ3CIc7GKDB5NEjTE7BTWMTzRbEhoNBYrinGhHTSNSyDpC7usRKKd7ghVvl5alqvOLmk9j3qMQ0k/sOsBDA60p3OagGHmyONgDkIsB4Cxb16S4QLcBbNV1URr6hww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OZMNo228noAsGBP5nEiDQVE31x3jaVXQzHspgnOsSjo=;
 b=VQuD03OW5XF0/RTNiOLQM6+NuVwNzshzDbQVaxCNDtiAdc8PVDzItfS0GScsRXUlrBj4Q16ZYzkaZ2O1qSV16U/2X/af861uHPtxRlENN83F2RY13Q9XT10UjC10kQJhVDWQPNp4bcUoIlh13FbqcSh0N1YVYNRJxiLoiCmlqHNjDl7pHMQBdWwE/y/9qe9WBFvQdDjFovkFfH3Oszuv1bcRvE78PAKa6Lbqdy0Tb8YePQ3c1bFB48tjNHEcrTVIFec1X7eCAGCTaTbx77yLKdgROjJuE0gHvSu3gB945qJmGDYNPFh0xs9X2G3qhM57Tmu+RArtnQfQEvJjeyTs+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV4PR04MB11353.eurprd04.prod.outlook.com (2603:10a6:150:29c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 18:19:22 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.012; Tue, 15 Sep 2026
 18:19:22 +0000
Date: Tue, 15 Sep 2026 14:19:13 -0400
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
Subject: Re: [PATCH v5 5/5] dmaengine: sun6i-dma: Implement support for
 Allwinner A733 DMA controller
Message-ID: <aqmMIRjajqD_hXI7@lizhi-Precision-Tower-5810>
References: <20260826-sun60i-a733-dma-v5-0-abc5229b441e@gmail.com>
 <20260826-sun60i-a733-dma-v5-5-abc5229b441e@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826-sun60i-a733-dma-v5-5-abc5229b441e@gmail.com>
X-ClientProxiedBy: CY5PR19CA0053.namprd19.prod.outlook.com
 (2603:10b6:930:1a::30) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV4PR04MB11353:EE_
X-MS-Office365-Filtering-Correlation-Id: 44ddf8ae-51f1-4a79-961e-08df1355ddc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|366016|376014|1800799024|19092799006|4143699003|6133799003|10067099003|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	iEcoQ/iYqYZr1Ih4Q7P0SjqIYQBimfHWaMA6tZ/iV/kNeYtArxOSihVAqwosPzM0crWnob09iXoIyIq4wbfmpyOe5xs6h5Smy4yB31ue401mvxE5rPVT+2vPvrIgjX/z24xIDMNKsaUi2H2XcUJOnT5FG3DsCLBHWnVSp9mA7bTVNJUKtVtNpKhPcExZiKkSVHSiy3z5bzwTICsp5ZI9jvw3wkexWozqya4xt6Sq/we0B7l4xsj9riFWX4lqNv/9x8zad7tqOBbCVerf6gZzfZOst3vwrRql4Wk6aTqjFLxB5dQGt6JubZpHQclqnHGyhvThhPBJSA+TOhPJSDFBWl6R/vkH3TfbjoeRXHtiNLI44Yn+6QIrJht3j/O0K3qPR4qbe+kO/ojsBLBJQROIdh2E7O+l44ssj4NGV6TAtpHzuRmSiqCaG+Jt2/iavl8w+yL6pwC6FNghrZm9I4cNYA6NzlDb+BxzO+L1BfepoOqQk/OtnL2iCV+tP8PTzZrkcLLV2FJojLLX0FfLiQiNiUKXD6TA0qi+7GNi3riFO/1nV4gSnFwcK4ad6uHj10k/SpjYlCX/ZVMQF/6/5EIKRQnT6hoU/AdmBrP/7mUHYlRZXRVMSKYmZfe1MWTD1gfM9LaHdUh1EXFXxANYtz58GI3q5gHiRUoDadqR/AkpTFc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(366016)(376014)(1800799024)(19092799006)(4143699003)(6133799003)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3VvyjZhbiV/DRpsMxrsaaJilYcBB1BzMRSPCz5KqIbv5f7l7ebiIEyFxduLO?=
 =?us-ascii?Q?PhYmBCDba8Sav3JRhmbkuKNkdW+0hc76eZVK0AEB8dMIzQc4ZYkN3r1D4Hgg?=
 =?us-ascii?Q?GrG7Zpx1Jfi5+pPMF/nP+NECUpF9EB5VauiEp+3Jgpzn19VNSstCz8zUIJyo?=
 =?us-ascii?Q?RQ4HAk4ejl3D6po+mSsoKu+sIdzeDwLdmIdaEyrnhtS6LiZdIg8Yn3/J7dpu?=
 =?us-ascii?Q?vqyVQBrt0xGeoFHbKBZwhdlXtESScbF/UhQpvDD5PH4DhJ+xs8dZaK7VbYG6?=
 =?us-ascii?Q?3dTmIAGhIyjZWF2tc/wM/Vn2WVFbKnBoyZutD11xFMpeWk1jOXyDsMdUpWqn?=
 =?us-ascii?Q?Cg7npYH1KFc6zpiiKfONQyP4kE2oVB9FzJ6WR9q1hWZ7X57cq5FNBQPV05ZG?=
 =?us-ascii?Q?7/urzcg5FMRqx+c19L4g21Fq6zYEg1dGzZxJEm1zA/hEZche323vEMqFpUeI?=
 =?us-ascii?Q?R40kPNyAq9QiBXfezrSnfSO4Pv/HBgQXr/jg9S0cczGpk3syllTuvgJN1iig?=
 =?us-ascii?Q?HdUprHXe9hFdFLBz/T5BzcYw7TaNeVX/kxAAbJrqQB6JgRI0wqG6XYIhzUNP?=
 =?us-ascii?Q?HTN1iANs9VBuo0BQyWQSAW3iqBoI7JBrmm+0mR7WC3uR545Yray9Oodnsqhr?=
 =?us-ascii?Q?4/Jh3yWHfQOy7mIZMLcbnqr4Xyqf7r1mPwjI8GfYWgiLAsmhQmU3yV3wJAbb?=
 =?us-ascii?Q?ENkgh4rSMOCWUtUBQIIOoZwUtG3ZCt1/2bsio5BUdhgOFZlInyiweQ+ouZsU?=
 =?us-ascii?Q?4FTVXx00ctYLuXYuvIze5nv/LtQpeKb5vdzz/47bFFlJWGVZek4egetcPO97?=
 =?us-ascii?Q?JcBVHG5cLw7cYMGkdOldjcgnShve+e01DQ/toaraQd571cycfo3LLd+bBlkk?=
 =?us-ascii?Q?SbdtjuMcOvlkBDUmrns6Mw155WR9xLMJJPQIzITScALkYMf9Tb7g9/oZAS4S?=
 =?us-ascii?Q?eXFrrTH600l1uVF/uobimPlYJz4T6dLTu7+tslltVU9KOfmWHyGFjhmMPkaQ?=
 =?us-ascii?Q?EzQxw3FV42iwhCfEobAXcUkZwzGjLTlwnqf6Ip47VTmb2ZEalrNE5ETadOFV?=
 =?us-ascii?Q?4XYGiDctex3m8i0uSi2Gdq5tqsF655As5BcQdosAlbYb1GXlRUqfL8qRhz/O?=
 =?us-ascii?Q?/f5bZpx+ZcnWX+/ea+vK3c7vArgvtSTwxj4jmlyI1HT7daxT5CuatjG2EGJE?=
 =?us-ascii?Q?hCzaLXDayv2jKu/vyjeI7q6HSiULa/+CDAwT5TNLR06SSWMXww7MMe07sqRu?=
 =?us-ascii?Q?Js6GHlSdplfexKnyJNzLTcZ0AKdgGlzRw4apV9CF8xAx/c4xAhs/M7lYSHW8?=
 =?us-ascii?Q?r12N92qNNXOzV3nv1p2rgLyLsH0ePvJpe2/dAqQXVnMUr0kDNQwTop0idpUP?=
 =?us-ascii?Q?+gJ6OGCEBgpBLY4q30EYtcHmtEF0vGCuaHhxmNUQkpqGitMpMMPIOyTZRSqg?=
 =?us-ascii?Q?m+DwZfrelMiEzAyupr4jnIcMKfmQY9ghvCqer4zYzkx1hiLBf4G4PAwuRCca?=
 =?us-ascii?Q?EqMcRRWJSBtyf5e+5HoSwMqYPE10w/n5jeGTRFPPcuaTOB7bn613WrnJWnb5?=
 =?us-ascii?Q?+/5/0DIhBsiX3LpEtKuyazaDKlIODl1bEomGYgGfwz6jKsqA3XiFbL/GP2yE?=
 =?us-ascii?Q?QGWqDHD3UQORGc4yc2Cdceo6Xup+WP2R3bPHhW9/3H5c75hFHob2c8HMahQX?=
 =?us-ascii?Q?wCK79ObtID1EBX0Y2wQtd8XGqHFXf/NJ4MGRA+sEVNzK0X+MmUoCIOzrxUj9?=
 =?us-ascii?Q?NQ86jN22wCyqYQqiyWOsGf1zMjgEmV28HJvbAdljUBAwCjNjJXiu?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44ddf8ae-51f1-4a79-961e-08df1355ddc4
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 18:19:22.5404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x8nHte5LRspQysBaOTeqw6UtYmIyzgVD2afk/4wInhRZM6au/e8GHQ+aHNURs+Xb0S/NIH1Vevf0isg0gziWjKGw3tlgAbxnRYRjFWW6/Cf5ZWqj2qsokSL/h1gWQI6H
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11353

On Wed, Aug 26, 2026 at 02:40:31AM +0000, Yuanshen Cao wrote:
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

Reviewed-by: Frank Li <Frank.Li@nxp.com>


>  drivers/dma/sun6i-dma.c | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>
> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> index ffb63212bea7..66281e01972d 100644
> --- a/drivers/dma/sun6i-dma.c
> +++ b/drivers/dma/sun6i-dma.c
> @@ -54,10 +54,14 @@
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
> @@ -107,6 +111,8 @@
>   */
>  #define SRC_HIGH_ADDR_MASK	GENMASK(17, 16)
>  #define DST_HIGH_ADDR_MASK	GENMASK(19, 18)
> +#define SRC_HIGH_ADDR_32G_MASK	GENMASK(13, 11)
> +#define DST_HIGH_ADDR_32G_MASK	GENMASK(17, 15)
>
>  /*
>   * Various hardware related defines
> @@ -1318,6 +1324,32 @@ static struct sun6i_dma_config sun50i_h6_dma_cfg = {
>  	SUN6I_DMA_IRQ_A31_COMMON_CFG
>  };
>
> +/*
> + * The A733 binding uses the number of dma channels from the
> + * device tree node.
> + */
> +static struct sun6i_dma_config sun60i_a733_dma_cfg = {
> +	.clock_autogate_enable = sun6i_enable_clock_autogate_h3,
> +	.set_burst_length = sun6i_set_burst_length_h3,
> +	.set_drq          = sun6i_set_drq_h6,
> +	.set_mode         = sun6i_set_mode_h6,
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
> +};
> +
>  /*
>   * The V3s have only 8 physical channels, a maximum DRQ port id of 23,
>   * and a total of 24 usable source and destination endpoints.
> @@ -1352,6 +1384,7 @@ static const struct of_device_id sun6i_dma_match[] = {
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
