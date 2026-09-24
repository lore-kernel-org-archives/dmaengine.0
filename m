Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010032.outbound.protection.outlook.com [52.101.69.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2507D4A5ED3;
	Thu, 24 Sep 2026 15:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790265480; cv=fail; b=hUkcvCZN76O2TfIz8qHX0RI5/tlLQQ7K1cSCqCbMBHDDReDTqpmIQjG9aPDCwErquHCm2b2VyJmnv4XHtrul4oPWbPWRddClfmY6Rf8Emv0o2pi9SBG1iX3A0rajpsJG0ZBeCUF0eFJAlV6SApnNTCGHF2h2weGmE83yGwy1cZE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790265480; c=relaxed/simple;
	bh=I8XRaikdEFvvHiQTP68TUwLDqX3xpLxb/sffWQ/Hauo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mpsLHGV6XXeZw4NGlrV1KGbdQuvWcGfI2RgX0FvI6UE5QeDa2YQwMVrE9F3lu7FrnWKyF5RRinwjdO9wmJkwKuCftx9D4zWzfIj6wOinCCbD+AanWPw+jVBR4aIKMLfbiMQE/E8n9OzmAXA3irOtUbetOfnuWHEuDRqvx8mXj6s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=A5/jOw6V; arc=fail smtp.client-ip=52.101.69.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="A5/jOw6V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N9SAvTNng0mxLlU3zkRJgJQgT5p4avd9QsJRRBrCsMcnWMO/UN8lv4IBFa1/PCl1vXSwMcM9AgtivM9ZK7XhGGyR2xRrVcdbiI9aEbE2nvGEsBPpPuGVlKOLXPzuRurx9grJMB3ozpcfV1+SgSFUDSqGOGfYhBB/N4LO7NBiDspUEpjKCQXi6gvT1+az+dyA3xub9OLSJA9P6Lb+FJhuKPm30GHL3cvrSmDtB3RoUxN+Gmbt90lxStZaruGPCOc88pEqCD9qY/fd53UvkrDdDLJHOfxv9C30UaTygP4B4ahpiVNnf1YtDhsVOIdTYPjHFCr5ZfE23CDhYHcR3Kk1xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zVGuxg4/WlIahWTxsO83dJmmPaoLzSlJRJ+Vp9VS15Y=;
 b=yqiW6o3bWUR+SWFPapuFEgJ1fAa2DVXe46DUqf/jH5HXfs89/CDuVVBZUYPS6wm3lJp4NnjYeFcbHJefLuaU0ddScyqeyv58RT35WKvgGBXULwaGq/ye8Q+3CMEPDNe2UV0IR/GwG1vKfTJbgTZeBFLmbERC5JEhWUBCquyOkJYFY652u8NEao7rIIFX+sha5DFQglZOqqZlutnqC4onwW4La10tUeijDX9SEq96uiESFqZj1/N7QR6nw3TloRBvJCfp1EtNfKwYCLFPTEt3R4UZEN/ewC6Q2xJ+Kkz3YR39vpKCDTqcnwuNLVNOhY5rCHOi0IEhoRvDIMRGUdnvvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zVGuxg4/WlIahWTxsO83dJmmPaoLzSlJRJ+Vp9VS15Y=;
 b=A5/jOw6VZTJGzqbX20Uu3CMVyhUv+J0Bx2lDMme/glyo0pP+kSaJe4cudox6dfa6RAcZMbeG4k8CHaLpP+8ntSTe1cgqqMBzMkhsb8/yUVDoqmas7nLvUqRJKggiMZ9kvEhk5e+0VDX8u85j+RXY/DGygpdyzA5VKFYIs1c6wEEJDhLMws1eme2YhBGHzqqRj9tVy+gjblTX3FiWd0b8lNPJLtSu/ALS329848N2VL2RMr5tdAAM/w3sMJ8NX5ef4yxsQsff+mAa+23tJrvOQA+uMlFMZe20J3RbVTVXIomk4z9lYAQAV3EKH3QbNnS4XAPaZwcvt5QJxrSiDHQADg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 15:57:56 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 15:57:56 +0000
Date: Thu, 24 Sep 2026 10:57:49 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, phone-devel@vger.kernel.org,
	sashiko-bot@kernel.org
Subject: Re: [PATCH v6 18/23] dmaengine: ste_dma40: Reject direction changes
 after allocation
Message-ID: <arVIfdNSMubXA4Mt@SMW015318>
References: <20260924-dma40-fixes-v6-0-fdb6755020a2@kernel.org>
 <20260924-dma40-fixes-v6-18-fdb6755020a2@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924-dma40-fixes-v6-18-fdb6755020a2@kernel.org>
X-ClientProxiedBy: CY5PR15CA0011.namprd15.prod.outlook.com
 (2603:10b6:930:14::23) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU2PR04MB8822:EE_
X-MS-Office365-Filtering-Correlation-Id: fb37aec9-f837-4483-a864-08df1a54991b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|376014|366016|23010399003|4143699003|6133799003|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	TEjsQs+1fLiNFUQjL81A2RHEAsVySTERIVSqAxiz0AxNSTJWIWHuDxmJIJiGbsnogus0M9Dr8r18jVY03lMcnEwE/bVh4iHD9e+xp9g9noH8ktJ4h2I/8YncMvLG6X8ujfGd4kDRwXxFJSzhzTKXKC646ZglRF2VuYykl2lIskMOQTKwbtUT7D5Tu2B0TKIKoSZ0151AFkQ6iQqAZRFnBVIRsMd9DIELUA8120xarKWl2DYQsPAQjFNte3uQbMtD/BD0t86OxpA+dcyUOrct3eWdwDgAi7zXBpu5mvBhEc1+clio+vApNtD2QhfUenbKTVpiH+8Cz4E1ky1xObDs293qtR27d94s1Qq+UvLjRLL916HIAcWxubzO1CdsqYizLWrTWDXuoOsUs5zXe4Y0ZJcsZCS5OjlMGjkIhkvilnFHlTKjhFWkcw9Vu67rOJJ5FFWvRTId6nHQ64v1zFNhXJrcngoZ5BM2tOKuI5tXGBbbJ9puCcI0WDu0itd50Oz0s2TizhgTyPLAub2af0OfeWvtw0mbbnaHbVhofJbmwyxfKWerxsLMqWhWdTa2AG6paAEgZovb7AAfqvzByai/c3k5I9bbl+rTU3JwN75Ax3omTh674tO8IMVAyGKEfTwj
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(366016)(23010399003)(4143699003)(6133799003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EW06GEpEE4U1uITjMVyJW2WBqB0cX4GAQh014/MnRt4gQwBgzmA1FkM0FaP3?=
 =?us-ascii?Q?YYSRgxxCyfr5BTUUTIdgkA949Ww4bIpFK4I76LyUP5OS4YT0PRhZUkXAZ/je?=
 =?us-ascii?Q?S+9WWz5wzUGNetZRL48dO9Xi8CYzHgxvQg/zqLc3AdL5VCUxNVoPOEDfrEPF?=
 =?us-ascii?Q?xBwjb7m/1bHiBGL++aj4feyqBqF2tlkx4g0nCp5sV62eUUCFNnCVqkq3sLSp?=
 =?us-ascii?Q?QMv8mvgfK2rfS1aVq7X5PlSUqjD3B6+ZF/EXFhoMKDg2T7pIBBmp7IpBryFL?=
 =?us-ascii?Q?2NSsPSlDbuCAnfC/IEhPZ85x1QkQqWkC6AF8GXEhZUgt99enpkg2hZ7iUt68?=
 =?us-ascii?Q?1GGoct0kuqBKhFegRY/zzIaSmU7noecXGv2wKuVZ+cvnrC/+uNE8Uo8YBvAU?=
 =?us-ascii?Q?QU8vbkAuNQmXBH1uHyqrXOy4ZfpOL7h/wtPCulkdo8tuusWQi30NmIlRwBiI?=
 =?us-ascii?Q?g/DpwAvLUPp8Hs9hsi5oDai0nK/IO1O77O5cGSbFUmyPl5xj50pNhjkN13xr?=
 =?us-ascii?Q?9DcwSlFjJCl1wwOe0j+QLSYfU4cnhQtNvp/+u8jXk56ZEWA+zgqdlDnQsP1S?=
 =?us-ascii?Q?v91mvkXgVDXw0AHjTIlF29s+gfkKpYkbIB+b19VSHD6V4UXEqh23bRauso2/?=
 =?us-ascii?Q?Bb8s+qhNy+PPSMoxxW23T1nNnjHFc2cxuKUG0vV2srmwH1Z1dypyj731Vbcz?=
 =?us-ascii?Q?KNPqch1xobCAY7p1Pbn6nKC/NH/cJ2WH7y/atLCKsmZT9KOhupqSyegHd8MH?=
 =?us-ascii?Q?av9T8bqhov/DZa79Ov3at11fkK+kunVyxbTGs9nDa79PvsaWMPoOnXshOL3I?=
 =?us-ascii?Q?LepkKoJGqb7iLAUjHZKA8QgeeKFtm1dVhuWAeej1LhdfXQ9GcqiywkxFWSJo?=
 =?us-ascii?Q?kltNhgO490OBjbQZ9RH/xIMqc4GJMqysS9lVDx4hI2vdkZEVY+dKAxDaSt6n?=
 =?us-ascii?Q?xjqvntkQ1CgtJXJ3oO12W2ka1CuNwIQicdSSY0tf/U56+heGLE+x/kxfoLOJ?=
 =?us-ascii?Q?pl0p//UDZDBpUF09vUGougUtQak7WhIxmCt9zLDyP3GwX8aWmDtrrABWm06j?=
 =?us-ascii?Q?Fuv21oxf/MNmGKE9AzwgWdLtWrcuWVWfpGyhh391qcgNyFbfpGzMidFAQMCo?=
 =?us-ascii?Q?OZX9i61+dEwmAimsrlxYLzkSeMA5t4zOgWa1Lwpyij967MLxNCA3Jb3sHY/M?=
 =?us-ascii?Q?yuSyBmLKtN1qy8evksqbZJ1TWNwS1+uWR10sP0DUkm1S7AHstFk1s2gpG5OC?=
 =?us-ascii?Q?EW+sbO4UzpRG/h/eHdVtCYeZqBHd2G54KE8BUc99aNf7FUPth/YbBu/HgKaQ?=
 =?us-ascii?Q?QFtx6RgAEzxyRvmnYvwXi6k6hQvnD0WjazFg4rXPBC4pj9g6VYgQ454ttsjJ?=
 =?us-ascii?Q?yo2CbNOu0zl7iu00R3+svw1olEqNX5AuzPEQK3l+QQQll9ktZo4gUUtGH5V+?=
 =?us-ascii?Q?OEb3k1415o3FiQwsbrZzTXsQLrqAQP35ZBzwHjG7ZhDSE9invnG882wfLuye?=
 =?us-ascii?Q?2dBwZMCrI9n/3kW2DSWcgmjIcakmIywdj5w5YTtREV31nK/HIQ8NQ04o6PNc?=
 =?us-ascii?Q?6L5kiKCZ6sEzamJZAYHB4cb6KSjw1eN23gzyAScXE8OCkNKFlFwI+MqIXFbH?=
 =?us-ascii?Q?Itv+nQ5AlvIyaXpTvx1VAlAuKqV7PUrtTg84ZQAnnIZMUI/v5jkeVLZjJB6O?=
 =?us-ascii?Q?ltWeRsv4b5SPA8LVDjHLcvSC41/8/dQBTaECcGZ6FzDgPt385ftC9gULcPcP?=
 =?us-ascii?Q?v9FYCSUyrO8xPKmuv48uF7lQng2jxzluRbbpeZYbJ5cngvQA+7ug?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb37aec9-f837-4483-a864-08df1a54991b
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 15:57:56.1275
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ziSWKnWrve8vNVCTgvH3o+HHpF9M4YtYHuRw/gFr07vC4dvxsH+IonY4Bd25PlnVlCIMBLyF2JBkt8E9Urr1IWBYZ5KhCcs7o2/IpTx+lMzC+BaQJdh0yP7OwgZv3lvv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8822

On Thu, Sep 24, 2026 at 10:35:30AM +0200, Linus Walleij wrote:
> Logical channel allocation uses the configured direction to select the
> source or destination allocation mask, derive the logical channel number,
> and choose the LCPA location.
>
> d40_set_runtime_config_write() nevertheless overwrites the configured
> direction when a transfer is prepared for the opposite direction.
> d40_free_dma() then clears the wrong allocation mask, leaking the original
> resource and potentially releasing one used by another client.
>
> Reject directions that differ from the direction used during allocation
> and propagate runtime configuration errors to callers. Skip slave runtime
> configuration for memcpy transfers, which also use d40_prep_sg() but do
> not require it.
>
> Fixes: 95e1400fa131 ("DMAENGINE: add runtime slave config to DMA40 v3")
> Reported-by: sashiko-bot@kernel.org
> Closes: https://lore.kernel.org/dmaengine/20260618051539.15E201F000E9@smtp.kernel.org/
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/ste_dma40.c | 29 ++++++++++++++---------------
>  1 file changed, 14 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index 660ac63efb40..4f5839691b85 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
> @@ -2413,7 +2413,13 @@ d40_prep_sg(struct dma_chan *dchan, struct scatterlist *sg_src,
>  		return NULL;
>  	}
>
> -	d40_set_runtime_config_write(dchan, &chan->slave_config, direction);
> +	if (direction != DMA_MEM_TO_MEM) {
> +		ret = d40_set_runtime_config_write(dchan,
> +						   &chan->slave_config,
> +						   direction);
> +		if (ret)
> +			return NULL;
> +	}
>
>  	spin_lock_irqsave(&chan->lock, flags);
>
> @@ -2889,6 +2895,13 @@ static int d40_set_runtime_config_write(struct dma_chan *chan,
>  		return -EINVAL;
>  	}
>
> +	if (direction != cfg->dir) {
> +		chan_err(d40c,
> +			 "transfer direction %d differs from allocated direction %d\n",
> +			 direction, cfg->dir);
> +		return -EINVAL;
> +	}
> +
>  	src_addr_width = config->src_addr_width;
>  	src_maxburst = config->src_maxburst;
>  	dst_addr_width = config->dst_addr_width;
> @@ -2897,13 +2910,6 @@ static int d40_set_runtime_config_write(struct dma_chan *chan,
>  	if (direction == DMA_DEV_TO_MEM) {
>  		config_addr = config->src_addr;
>
> -		if (cfg->dir != DMA_DEV_TO_MEM)
> -			dev_dbg(d40c->base->dev,
> -				"channel was not configured for peripheral "
> -				"to memory transfer (%d) overriding\n",
> -				cfg->dir);
> -		cfg->dir = DMA_DEV_TO_MEM;
> -
>  		/* Configure the memory side */
>  		if (dst_addr_width == DMA_SLAVE_BUSWIDTH_UNDEFINED)
>  			dst_addr_width = src_addr_width;
> @@ -2913,13 +2919,6 @@ static int d40_set_runtime_config_write(struct dma_chan *chan,
>  	} else if (direction == DMA_MEM_TO_DEV) {
>  		config_addr = config->dst_addr;
>
> -		if (cfg->dir != DMA_MEM_TO_DEV)
> -			dev_dbg(d40c->base->dev,
> -				"channel was not configured for memory "
> -				"to peripheral transfer (%d) overriding\n",
> -				cfg->dir);
> -		cfg->dir = DMA_MEM_TO_DEV;
> -
>  		/* Configure the memory side */
>  		if (src_addr_width == DMA_SLAVE_BUSWIDTH_UNDEFINED)
>  			src_addr_width = dst_addr_width;
>
> --
> 2.55.0
>
