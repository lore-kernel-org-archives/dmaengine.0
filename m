Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011042.outbound.protection.outlook.com [40.107.130.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1A733C1B7;
	Thu,  6 Aug 2026 15:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786030807; cv=fail; b=pyyGy/kYUhYgk2PhkMOOqWcGJIxQkU9x5iWsJ8dy56ATD4luP6QDVY642KQ1s6m7+QJ5SsxwLiS/p4tXJe7BDfGldve9pBuVONGCcxx7pzKKFyv11XuigReYMxnbTbOw6k/cQ8m+MdG/uPSvrswt9dS2uP6fb/WE6Frh1vwW8co=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786030807; c=relaxed/simple;
	bh=KXGjDjzeXoJuif8/75AILJV/7em+WtJL+54NpEbaOEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FRiBgp8HwuIHngKJu03H5iy6xeuKuK1s1CzYSrIurqtqBRfB8jjYEueFeZR3UBdzXLItBUtLBQ3q2q0osWUROmOxPt33It4hhmFC4jFYVgJGzVqxX562KJM0JHJGxWi/uYyZH2w7k+CPIHxYMibZi6loHnXgUmRy59s/jQMzUho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=GMbJzm9C; arc=fail smtp.client-ip=40.107.130.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="GMbJzm9C"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oybOZDKylTMDvzpn55HwekF+ptQsUeYTDYuh49T7MHAXK/XSgdVAGslhCjt6ojbYbZ+xGt7HMdzF3VTS8Rhj1xLnK5FMYh1cgRt2SPkkQi4ftibALrf4DJ+xgTdPN0nrIokqbGMlEhb6PbKxGRJCOROR5MN0+BGuJKO7Sem1zy8pKriz0CuIcvd9Gsr7rHgaq3uNtZpwQ9wWU+a/F+/iJYd/ISUlGKjdqD7uTWEc+zfRWjhTmzcwKv2rgG56zuyReaSJmrHlzh2bN7NB5nohSdoLW8KOtlZr7D8RruoiP89PwO9mQyYNasMwnKePxplI9pGYQbXLlCL8/EIKhJiRcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/PTRslgxomaY6jfCndrQyWAa+I4zc2tvN0JXWilVu+k=;
 b=Z0aWHMEkYAw2kZZfbov+Q3qryTf8i1pMJBiulqt/SVhcO8uTjgu1gPkojNR+RyCDYZtYPmoBlg0rbDXAaiOn3hd6Szxt7g5z6lePtq+1dBd1yIkPDpV21Xh398AIE6/WdMnXzv8UW8Y7jMAKXVCQtTKemJ3N6sXBFY5th1gFgP4g3L3b91FJASlxG792B2BUuQxS5MYJR9LdxXdafubh8iiCXZWI6RwEWrkPXaK1KEF+R7pPXYO+7JlYzCxl+VOnVZTV9LJE2l0Uvt4xfYuuXwwHiJTZHwUEX1pXTmcz2I4qtQdD9hZW1rjEB8u9OQVougBe4adCiGqQX+6j5H9akA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/PTRslgxomaY6jfCndrQyWAa+I4zc2tvN0JXWilVu+k=;
 b=GMbJzm9CwLK5bLPHm8yrFlunITpIWpQRywi2sW1yBV3+C0ytGULAHA2pw/vYUj9zzzEguXLjUg8CsBuKiVRwcJHX8bDYtTxKEQjsrtnmMc33n+zOzaGs8r66xKJHyNfyIoQsRkBc9GzY1fXvVC1N1u7YoDIWyHZaBgDYFhZA47BDtvBnBeMwZr4u/NUgpmQOSBZtRkW6NY4vmYpjnNVkWKqsE4tGYsXkY7XaNeckPEdiCHxbs9a6RYIbD0XH9RDV0ADOUBkty1sV9WCrL2tniP+Q/mlpxt8mLldZeO5OTBDsWlPgbtTe+/CLzPZUA4O1Slb8/lZKomFk1IsxTmhYRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB9877.eurprd04.prod.outlook.com (2603:10a6:150:113::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Thu, 6 Aug
 2026 15:40:00 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0292.018; Thu, 6 Aug 2026
 15:40:00 +0000
Date: Thu, 6 Aug 2026 10:39:51 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Golla Nagendra <nagendra.golla@amd.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, michal.simek@amd.com,
	robh@kernel.org, krzk+dt@kernel.org, radhey.shyam.pandey@amd.com,
	kees@kernel.org, sakari.ailus@linux.intel.com, yukuai3@huawei.com,
	git@amd.com, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] dmaengine: zynqmp_dma: Fix alloc_chan_resources
 error cleanup
Message-ID: <anSqx-k1HFLsgyX1@SMW015318>
References: <20260806123014.2120447-1-nagendra.golla@amd.com>
 <20260806123014.2120447-2-nagendra.golla@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806123014.2120447-2-nagendra.golla@amd.com>
X-ClientProxiedBy: SA1P222CA0160.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c3::6) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB9877:EE_
X-MS-Office365-Filtering-Correlation-Id: 83e229dd-3715-4d6c-e810-08def3d0f966
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|19092799006|1800799024|7416014|376014|4143699003|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Hu2IeZ8jV2fdGEh5FY665Np+LY6Bgw/ElIcC2sxNkfOi6XjWUFu0v44Ysc0DrxHLI1Z3tpA3gQAGXBwaaj9iy3pdvTom6w8RuU0aY/TvGjy47thnf8EiYmh/JdwukoMDtDYxvZbemUWdf01Dj/GmhFdkNqvj1r3XyGkH3a3y+zgwOv1vcmbk3hhU/KzndNv5gm4wO0WowOgfe/TP3Gfa1KQSJI3O5V3XBIGtxG55Dt7eZcypODD3AVGqoYvqaKQEi0jMBouXVL/HKN2yxz615sN6h4JEiVryXqbo+7vbFgtpPlNWqst8UxjD6NVIIqoNXa0Jxvis9zzUHeJlaNDii0AmOnTqK2O1dHZUKkc0UVqszrwz7Aq5o94zMLfENZcAZk5T44C0Pe+os7U17sC1WvyjyU4b32uSg0x3hfGICCojReS0urR1QQYWS9wSKgodBX5XN4TnL+slKDTetdHAo/NnGS3LjfAk47kIRWDcu7S9jDy1UOmiEuA17bdl5ykxXqQRvKnTaxO1xOhq0Xmmljec+8ZcbjiftujUb1yB3P9iLaye63q20+25k6nYTfPlg/IYeX5gVu9/T8jLVsV7ypvdfqCnaNpzryLrkvhVVvb+pPU/pJCEMw5t7VB3NK5OQDCOKLWVQ0J6AyaNNvHUMTGACkpt+Wdd/26hOWxwp6Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(19092799006)(1800799024)(7416014)(376014)(4143699003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uWofANkAwrbzq/j7KzI0pwZAFHxy9CuD5P4mgNDIYU+0m9AURaFe+LeMf0CJ?=
 =?us-ascii?Q?P4Yyx6i+WxM3qxENZHinJTlP3aFiYYRNU1jMjQrFfpnLl49+1qGSbP9gGbkj?=
 =?us-ascii?Q?Blc6Z7iDhckp4ChFUIlT7jtwI8nPPu56YMp9BUJkmwvOElJQipFDuWFhd6BC?=
 =?us-ascii?Q?ZpT6o7vHx705Up0j87/8j/fcoSpiEuD9zw9sgKOYOgo8nrLc648O0LyM2dhC?=
 =?us-ascii?Q?jC/XDurxhd3y1nodxPmdp5FWkNRk8z0VxTAp+acZKKF2rFb2Nx1j73DBu3Zb?=
 =?us-ascii?Q?HGee3uEXUAX1WvkCmaqw34yej+yqQvEX1R9pCqwhJpmeuNykMb/O6mmSzFh3?=
 =?us-ascii?Q?jihA5Q10ui7fQyXNA8+HujclGeCdSzcMDVQV58Wcn3D4bM8kIAhcsKQUDir7?=
 =?us-ascii?Q?Mt39/AA0iaf8uZM5QKXcV00+YDODqPXsIgk8k0cLsabFEtnkWM4GjbFONSBW?=
 =?us-ascii?Q?qQzLy9Jt+hgHvUjd5LCkJHE5Z+ixIKgqsm8bHovbDLh+pQ80pcaYkpWuxQEg?=
 =?us-ascii?Q?c8JAjdifdg3lJDKYJVnXRlIIaelcZPFkS/SVk2cl5ZmaYK3SXS/ij7HGPqAP?=
 =?us-ascii?Q?pbdbH3sp9CSIBd+pfefhEIPSeiNERveW5l8dthC1gsJzhYYb6GyWBX+Mj89F?=
 =?us-ascii?Q?YyeuyKkJhPCcbR64tM8nFTCwbKJkX/zFu7Z/8aoQU4W04rjOI7M60WyDBirV?=
 =?us-ascii?Q?TENwDe8BgoQEETb6hsSX9V28Enk9oCWyId4AmWUoMPWH99VdO4n9b9SwtNzF?=
 =?us-ascii?Q?i4DT3jm2mpPtrPmxkjGqSnl8GM83tdeiiUPmQR0PMxCa+8jRYn9xeMhAuHu+?=
 =?us-ascii?Q?K6qn+kVkEOV/bUedspAFTVxpDKRDDbX6E+msPDy8M9lQdosdoLdlbDhmE8m6?=
 =?us-ascii?Q?3TpvVpRJxNi5Yb5EOsHpF1XwjLwQOUHRHC+fdVSw6sop9B1Wd6NYFu5784Ok?=
 =?us-ascii?Q?jrgOphnQu++xhAwVZ1IgbwAAGvtk+V+8VZg5UJwb2092CNvjnAk30hLTAEU0?=
 =?us-ascii?Q?eDpJQS7HOe2yQJWJ6QbsB2KbfqujP3atmxtyOLsnSHEgu8rPUnDwh9Zt7KWr?=
 =?us-ascii?Q?o17HWgBHtyFfnvsRGnu/X+QQuFkzJB97kAPs7RBIsHvjouVAFWvG1Qz6oPt4?=
 =?us-ascii?Q?Dz4zEeSRabHe9jdI66WKlJa1rSJxQ0kz8fdCB5Ucg6nTwhSY8Hblcq56YlyL?=
 =?us-ascii?Q?9cLEVD+8+svj+rX0rP47lmX9a5H+pM+K7MkkeFW883Zm37cnWC5oKwJNpmsp?=
 =?us-ascii?Q?O+mOM95EKY8x6V3nSEoAid3MPi0O3Bk/1CmRp+v64IT/bzXUouu7Ou75K9FA?=
 =?us-ascii?Q?k0+ZWWTQpwr8Yy8/2GlOL3hez/u+M/u9anlXyanarHPlZhhJ5/Jk4mrK2bPt?=
 =?us-ascii?Q?odm7NvmJjDAVMo5x7D4GQZERPbN/ULXqzIxKyDlFmDPhVa/xAHR5alRdedOY?=
 =?us-ascii?Q?2sE+7kRf7oPCe+xPlD6KExLHTsbpmU4Fayx/Vl4fkoPDD7LS5vDqwUarfi+3?=
 =?us-ascii?Q?86+BO0mx8Axt/FW7Sy6ixRXQNFvxntR/OeRcdu8otZGlcTFTZYzVLr7C0OTP?=
 =?us-ascii?Q?hvfXXPrnzO8ZucrlRNzS6jw4/coqPrtx1v9z6Fn5BnecFPRVQ4dtapre8Z9L?=
 =?us-ascii?Q?OKjixw8Tignj6tBBGHd2r/V6p/fyGrz2Ss+YQYLslUME6IgWLoyDt3Y9Rxyq?=
 =?us-ascii?Q?iNcUslNrG3SN5GHsUgjEaC5kPDhhFMuCIliMCcT++VAv5AHOgcJK8oacAKof?=
 =?us-ascii?Q?NF4521meTGIFsqhsavMRhlDOQ08RKO2efZBjBQ4bCAhWvDw0gABN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83e229dd-3715-4d6c-e810-08def3d0f966
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 15:39:59.9371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PYevoEalasiWrmB/t9VEYiTQipdNWxvZcbhnIFWxfkjTNAWPo1arrQ9ZuuIecn3xJafQwyWEJ1yfxLMnKDiOnIoavT7v7zQyQhqZXU3S1Aq6VuLV7pvl1XU9GAGFKAAH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9877

On Thu, Aug 06, 2026 at 06:00:09PM +0530, Golla Nagendra wrote:
> Channel resource allocation can fail after runtime PM has been acquired
> and after part of the descriptor state has been initialized. Without
> proper rollback, the error path leaks a runtime PM reference and, on
> coherent allocation failure, also leaks the software descriptor pool.
>
> Fix this by balancing runtime PM usage before returning an error and
> releasing any partially allocated software descriptor pool.
>
> Fixes: 8982d48af36d ("dmaengine: zynqmp_dma: Fix PM reference leak in zynqmp_dma_alloc_chan_resourc()")
> Signed-off-by: Golla Nagendra <nagendra.golla@amd.com>
> ---
>  drivers/dma/xilinx/zynqmp_dma.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
> index f6a812e49ddc..b7c561280694 100644
> --- a/drivers/dma/xilinx/zynqmp_dma.c
> +++ b/drivers/dma/xilinx/zynqmp_dma.c
> @@ -483,8 +483,10 @@ static int zynqmp_dma_alloc_chan_resources(struct dma_chan *dchan)
>  		return ret;
>
>  	chan->sw_desc_pool = kzalloc_objs(*desc, ZYNQMP_DMA_NUM_DESCS);
> -	if (!chan->sw_desc_pool)
> -		return -ENOMEM;
> +	if (!chan->sw_desc_pool) {
> +		ret = -ENOMEM;
> +		goto err_pm;
> +	}
>
>  	chan->idle = true;
>  	chan->desc_free_cnt = ZYNQMP_DMA_NUM_DESCS;
> @@ -502,8 +504,10 @@ static int zynqmp_dma_alloc_chan_resources(struct dma_chan *dchan)
>  					       (2 * ZYNQMP_DMA_DESC_SIZE(chan) *
>  					       ZYNQMP_DMA_NUM_DESCS),
>  					       &chan->desc_pool_p, GFP_KERNEL);
> -	if (!chan->desc_pool_v)
> -		return -ENOMEM;
> +	if (!chan->desc_pool_v) {
> +		ret = -ENOMEM;
> +		goto err_free_sw_desc_pool;

This is seperated problem. Need use new patch to fix it.

Frank

> +	}
>
>  	for (i = 0; i < ZYNQMP_DMA_NUM_DESCS; i++) {
>  		desc = chan->sw_desc_pool + i;
> @@ -516,6 +520,13 @@ static int zynqmp_dma_alloc_chan_resources(struct dma_chan *dchan)
>  	}
>
>  	return ZYNQMP_DMA_NUM_DESCS;
> +
> +err_free_sw_desc_pool:
> +	kfree(chan->sw_desc_pool);
> +	chan->sw_desc_pool = NULL;
> +err_pm:
> +	pm_runtime_put_autosuspend(chan->dev);
> +	return ret;
>  }
>
>  /**
> --
> 2.43.7
>
