Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011041.outbound.protection.outlook.com [52.101.65.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3A5367F36;
	Fri, 14 Aug 2026 18:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786733649; cv=fail; b=j4r8ko8x/rKDsJJazOVQQLNLoVAugi5JptuQBVxpzXEIrE0VPCc+hKuxoAxL2Ew6fYjJ5wXA3DKmsf+eqE7NMGMbNkIe0B0uyMbc6wPjkad/tcuobAVr+JR2ZRgrnuwuCTOjuZCb1TaFNneVM//hH/5VO45xPD7NSedQS+g3o2Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786733649; c=relaxed/simple;
	bh=iwf58rB0KyeFEDPeF/EP4itHN28cWyOoGNABTcoB4l4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BLuF29NKr/EIxD4YCaIikmcXpEzsRDeX33IgeioMpkdKkJQuUqCkTtb7DU9tLCpPiZD+yeB4UvlcC99qgP65zOczfTjilxf4puPwLkM3q0iv0TVdu+b7HvuqwFzR684WHuQppoQPeUCuZ2PDXtC7PyeiJEpqBKADw8s1NvLrA5Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=b87OsxjQ; arc=fail smtp.client-ip=52.101.65.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="b87OsxjQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HEdRvsPQdYiQp/EH0h751+72F6rXdi18SRCpnrcRrh7MBa+96l6pQuVkCg+ghy71YPZxyAw+xKl1ujXJOtZ7cCFBiwGLDQd6bvc22aH9Rm1D2U+yFHTBRx1eFoVfwSE1wZGkIYGriskVfLpSn8L2dVtyPD4/pOQ1jQNVJB4Lnfo1v3X2gIsctrLZOxbxVn39HaSMBATdHyk2urR8pboFSY5t7aosGm0rC6WNOjlosPf5Huh47/hrZHlV3FfmzzhPbG2q69QF65WH8SANL6MLlHVu+GImefjbrrYpSvZPvXBeo56/jc+JtVNvAhPV8c5fnZzzREMBLJOwyOpXeylaiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3rLGBlGlLklVE9Jy75IvX9umgOpni/fGEHbBpcfgO4c=;
 b=mgcr4QTUbkekN71PQOsJ1x2OuUpP/BgmGx7tXGBm9k9biGsse+CPqG3EDHe+Kvz+1tGp84C59H9nERgK4+ZJte+l7F3Vgepw5HlzYhiJ6JKkbcUae1LkYl7OxzXNuvz7RNWLtlS2+jh1JFRb6LRFGBrKTPrJ5VLGPXs98ZAvfbBT441uGan6sxIw7jElaj7MdCEd+iOgdcZUEe3I2xrgMlnZn8o8rP8Ygpj8KvYtCJh9qMNh+IA14suzymK4NZTUfZWn1navuNXOHO/jJhRp8wjCEGLBQ3e7uGtq1af+bUHPRWSlYv+zS627SzOPG0ThGJPO7BU9uRPkPU4f+v5WNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3rLGBlGlLklVE9Jy75IvX9umgOpni/fGEHbBpcfgO4c=;
 b=b87OsxjQn9Fe2d+mFA36dGCbg33YsrX7I0NbEPJyKrfuHHH7zRA0WCa73wnSlBwfBUaHxnl+ete3EjSQB4+pznxU4S61t8leLWHQHofpw52+ANIMpumYwa4OaYa0WhQqXVxbcjEZlFlytrJNwJewhTsMjuCnk9A0TRiqCNRVOOoD51NwaPFY82ZaGnJIZV54CJaGOHXrvZ1+gQ4HQbjMKx2xfmP6+xB6V8mJp3HEIUu6ePlAST5u7uQ9+eAgspZxQud7Ei0jt1kLCLqYVERxTKx4DJiWUzvQr6OruwOjeoRFHQwJHG9Y+UmAuV4FeQGBUPkOX/zNHIEhuBFa7yWucw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV1PR04MB9118.eurprd04.prod.outlook.com (2603:10a6:150:25::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Fri, 14 Aug
 2026 18:54:04 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 18:54:04 +0000
Date: Fri, 14 Aug 2026 14:53:56 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] dmaengine: apple-admac: Add M3 generation ADMACs
Message-ID: <an9kRPppZmUFH5uJ@lizhi-Precision-Tower-5810>
References: <20260812-t603x-admac-v3-0-d1f137f803e1@chaosmail.tech>
 <20260812-t603x-admac-v3-2-d1f137f803e1@chaosmail.tech>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812-t603x-admac-v3-2-d1f137f803e1@chaosmail.tech>
X-ClientProxiedBy: SA9PR10CA0023.namprd10.prod.outlook.com
 (2603:10b6:806:a7::28) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV1PR04MB9118:EE_
X-MS-Office365-Filtering-Correlation-Id: d05d55ac-5cde-432f-7dd7-08defa356923
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|19092799006|376014|1800799024|7416014|56012099006|10067099003|3023799007|18002099003|4143699003|11063799006|5023799004|22082099003;
X-Microsoft-Antispam-Message-Info:
	pvWoyKSxWGuPtaH4KU5KMqr1d5LYnf+v+X7pCfMOw1OAnLn0H+l8SnAQe/Bawg2qlnYhDadhBBKcqIJD3fDnPGz150nZveszoDLZKvvMreKSfZVG58TC0ydaBN6fxnIyp7xKFOEnrlcin+XOCrLJG8FfkVCyHabRe3CXiszzMsI9jCq2j2zI2yzXgAQtNxWUzeqKT6ZCkVzKFsO7zem9154SEg1A5tLLw9nMGyNBUQAt7ICuthjCeBTQB2hCaZyGmTeFIJqQTxjlTXJzMIAUMKVj0iZMda9SZnmumPz7CFS38rYm5dJ1HhZKewrcReoKN/pLF5wIjy5yO0rx8BIURpZ0f6Rj6g/wRNZ5s4TBPm+jAx58oFoLqeoutIqiCbkSIAGj4jBKjFQEpbPM54FJtiAGwEvjmvuRvhjViONu4w8abqAIUJbzJLV+WG4eBS9eDBRc80lXz7wpDs7Ug/pp2uKkzZPkAAlGESxqiTPlZyTlsmk02o9SSlgFQ52jSHjx3xWuFD+9xMpVCBwMmYWBnUZtF06puINFXBKvEPLBzkGNMa0GKi8YLT4WJ5VuoTysLpSGsNvdZ3cCXK5u/PsEho5/bVcrW/9R2zuHAzzp8uLEFgHfaM+/oXFQDF5GkfmxYoCg6HfXElzTvQMUuo3rRxQ+y9pAmG/46V/YpsdeivY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(19092799006)(376014)(1800799024)(7416014)(56012099006)(10067099003)(3023799007)(18002099003)(4143699003)(11063799006)(5023799004)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mgoY71fCwKJLJZtkr6tbPTh5UHRE4Xg/t9tTN9SdYF25UeGXZ8BD3saBjoo/?=
 =?us-ascii?Q?GxdoJs+iIQxWSa6Pe+6JIrIsJFP34BqwS096sbK9T2oytdHy63KaOabgFO8V?=
 =?us-ascii?Q?oMC2W3LYHkx9lcvgPxuOi/dKRy0UV5nqUSO8yAcyeE5/MqweXUTvy5Y9GvYF?=
 =?us-ascii?Q?EKZzkqA2w6t76RZwwrE1DA3xE+D41OnrgXCbgYcFPcsjrS1VfF5CadyPZnl0?=
 =?us-ascii?Q?jgHTM6S49k3hxvahdLhPHxGOXyM5IZkwARSirFbWG7xgiIame2fxDk3zbci6?=
 =?us-ascii?Q?nZQPr2BW9YfL/xxUHnwOtIhx3v7j7lILJVL+N/DJ73TWzhbX6Sp3Nk+DmfRZ?=
 =?us-ascii?Q?BrSNYOO4yyyTsbOPz6Mu6T04xUNItxwOL2jZ7+z+ubTPpf1HnIYhKuAQpKt4?=
 =?us-ascii?Q?9C95KcCKlsqw10ZKJsB2LCp7SfQGOYjGOPFi3bHWZf5e3wQ+zheMhHPqJWy7?=
 =?us-ascii?Q?Z++21IVVerYECKoFBArmJ2SO3dwzvy+HHAAevy7kIcw/l4iSKwN8a4HRQjbd?=
 =?us-ascii?Q?ez7NF2NhLj78niWK2vUVpzewwYeiIG8QUQR9kUNeibxGHmuFK+zilbJ6SesY?=
 =?us-ascii?Q?HeNeTa76Xx4mVysM5d2b4q42eGo+1itnOlDE5gEBepKTp9D99CKXV2ZENB7x?=
 =?us-ascii?Q?XoomOlrxkO+9oChdyvFkkPNzSyrw2mXyySC3zj8Hvps530ZH/7DsZ/m3kyIm?=
 =?us-ascii?Q?2ybTntoefTrct1De5Dro4TfGPdTSWVGYB8rW25Xc1PKo7KVeNgvKXneMZOvh?=
 =?us-ascii?Q?I9COvzUAAmzi7LaitRfVtD+z0VmON+xHIVVyYRm2XGqT6TZnn1NkkrOoE5Tn?=
 =?us-ascii?Q?BAREIMSiAmp6sAYQax6xHshS89ZIuX2rsC88+EXEz7OVW2AQpTSWFmHXeucJ?=
 =?us-ascii?Q?deXDzNZhzCUQnIf1M8Cwuwu7BB7oMKHxm4Gx/u5QWinHpIEa1N+Yvz8DV8tC?=
 =?us-ascii?Q?vnhyRa5SOoFseva9TSneXAk4ImXSfe9LbklwAcKZzB/a2nxYpoCT0Y5Mmbye?=
 =?us-ascii?Q?xQjLnIi+CykP94F1eWwIsdplJlcS8w1envpgKSxFNwQoyYwhgnRWuHsBehBX?=
 =?us-ascii?Q?D7BYmE7z7iNz76k8/zXPqk7CzFIeQzFXrYFrtr1Ugq4traj1AQQImcmtPNO1?=
 =?us-ascii?Q?e10qIVhj5mN6huZ43Iuif+2NXthQZpbu7NOq4SPxzb6m+A+QLhQIfwDOiRJF?=
 =?us-ascii?Q?wOPUpCLCn4/7ZW4MTEyXpOzT9znMl7x2MtXbZNhZpq2QtGboh4DugowOd7YC?=
 =?us-ascii?Q?qtUtkEMagNgoRPYMSDZ53GnHLjb21dAeq/34nk1+IruXxR8CQMe1wG16+kVR?=
 =?us-ascii?Q?Kf1TQmHoiXSVPq+MAO6lJMeWCChrx5tvLv7qLn3LY3YQ3C7Ncz+JoCj7IQ7U?=
 =?us-ascii?Q?sWiyjM9N0PJJFCn29iqXPfVnyrU8PF/lt0wr1v4Lecbo/2G5dYet2Bjpv5RI?=
 =?us-ascii?Q?SY+9JuvoMaxvWW8YuOZaFUMAnBP6rKXJp0S/SQK6469dYAVuZO2sC3qUtGrS?=
 =?us-ascii?Q?ies7DUUip7MRAuyjX84pZweUVTCe2p7vGTWtfi4+wMfsA1BMTRL7j7Ax6Sqz?=
 =?us-ascii?Q?+O2TNVTyVC6Oj1Q+2Z+ivkjc4FuIcDnUKj9JqArFol03mt6q64Xd93q4KHRQ?=
 =?us-ascii?Q?PpLxkRO8BQgC42gZ5pYeNQEjdoUGQjdxNoWex0Y3FefFA3rp7nymE/b8/nAv?=
 =?us-ascii?Q?f/nA1qSK4WCXx3ko00BqJInETrhHqelleUo6rWh9NQjzmfUXna1geQc23WqS?=
 =?us-ascii?Q?dTE6qxBJ/2guJGzhkh79p5Rn8NXHY4C5+EXRdrQ5v9Hbtxc0WuM9?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d05d55ac-5cde-432f-7dd7-08defa356923
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 18:54:03.9974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OkRvjINOLAy0VLW3/voZDaA7oS/jIVRXpk0iXFIVT9lMdx626IhKjC06hBqfHD17N1DIZkY81BJ4yDmOe2stvBA3H7or9dKQ6kJ4Ons98+/LLx0Tz8xRItva69EiHjzt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9118

On Wed, Aug 12, 2026 at 11:26:34AM +0200, Sasha Finkelstein wrote:
> The admacs present on t8122 and t603x SoCs need additional writes in
> order to operate correctly. The exact purpose of this register
> is unknown
>
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
>  drivers/dma/apple-admac.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/drivers/dma/apple-admac.c b/drivers/dma/apple-admac.c
> index 14a5ee14a481..fd6236c7c024 100644
> --- a/drivers/dma/apple-admac.c
> +++ b/drivers/dma/apple-admac.c
> @@ -39,10 +39,14 @@
>
>  #define FLAG_DESC_NOTIFY	BIT(16)
>
> +#define T8122_UNK_28_VAL	0x200000
> +
>  #define REG_TX_START		0x0000
>  #define REG_TX_STOP		0x0004
>  #define REG_RX_START		0x0008
>  #define REG_RX_STOP		0x000c
> +#define REG_UNK_28		0x0028
> +#define REG_UNK_2C		0x002c
>  #define REG_IMPRINT		0x0090
>  #define REG_TX_SRAM_SIZE	0x0094
>  #define REG_RX_SRAM_SIZE	0x0098
> @@ -127,6 +131,7 @@ struct admac_data {
>  	struct mutex cache_alloc_lock;
>  	struct admac_sram txcache, rxcache;
>
> +	bool set_unk28;

const struct admac_hw *drvdata;

So needn't copy set_unk28 to here, in case need more quirk in future

Frank

>  	int irq;
>  	int irq_index;
>  	int nchannels;
> @@ -147,6 +152,10 @@ struct admac_tx {
>  	struct list_head node;
>  };
>
> +struct admac_hw {
> +	bool set_unk28;
> +};
> +
>  static int admac_alloc_sram_carveout(struct admac_data *ad,
>  				     enum dma_transfer_direction dir,
>  				     u32 *out)
> @@ -747,6 +756,11 @@ static int admac_device_config(struct dma_chan *chan,
>  	u32 bus_width = readl_relaxed(ad->base + REG_BUS_WIDTH(adchan->no)) &
>  		~(BUS_WIDTH_WORD_SIZE | BUS_WIDTH_FRAME_SIZE);
>
> +	if (ad->set_unk28) {
> +		writel_relaxed(T8122_UNK_28_VAL, ad->base + REG_UNK_28);
> +		writel_relaxed(T8122_UNK_28_VAL, ad->base + REG_UNK_2C);
> +	}
> +
>  	switch (is_tx ? config->dst_addr_width : config->src_addr_width) {
>  	case DMA_SLAVE_BUSWIDTH_1_BYTE:
>  		wordsize = 1;
> @@ -805,6 +819,7 @@ static int admac_probe(struct platform_device *pdev)
>  	struct device_node *np = pdev->dev.of_node;
>  	struct admac_data *ad;
>  	struct dma_device *dma;
> +	const struct admac_hw *hw;
>  	int nchannels;
>  	int err, irq, i;
>
> @@ -822,6 +837,9 @@ static int admac_probe(struct platform_device *pdev)
>  	ad->dev = &pdev->dev;
>  	ad->nchannels = nchannels;
>  	mutex_init(&ad->cache_alloc_lock);
> +	hw = of_device_get_match_data(&pdev->dev);
> +	if (hw)
> +		ad->set_unk28 = hw->set_unk28;
>
>  	/*
>  	 * The controller has 4 IRQ outputs. Try them all until
> @@ -935,7 +953,12 @@ static void admac_remove(struct platform_device *pdev)
>  	reset_control_rearm(ad->rstc);
>  }
>
> +static const struct admac_hw admac_t8122_hw = {
> +	.set_unk28 = true,
> +};
> +
>  static const struct of_device_id admac_of_match[] = {
> +	{ .compatible = "apple,t8122-admac", .data = &admac_t8122_hw },
>  	{ .compatible = "apple,t8103-admac", },
>  	{ .compatible = "apple,admac", },
>  	{ }
>
> --
> 2.55.0
>
