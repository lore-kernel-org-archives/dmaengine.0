Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013008.outbound.protection.outlook.com [52.101.72.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3C34A2E02;
	Thu, 24 Sep 2026 15:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790264991; cv=fail; b=FG+qHxJazZRGvW7LQDbRJ7fhhXxvlUOQYaVVfVMer87ppJirqGOm3C+7EqkqKRBbC0FfHUbsLhETTw9wPboihV85ahpHwKVNQ/3UBrGesFqTAB0lvqYUNFc3lVHCN2VTn1jjJVftimA+Ecc4xyIxUBgm8FKtAQjeHI7L6eKVGtU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790264991; c=relaxed/simple;
	bh=TA+gFwI3BLoasRLV/0KDK77QMh1CJrXa0tSQTktqa6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NxbK1VM2Owr/sCZI0yfDvSqO4gN+rqVCBqwjfqbqbGIlSkTRPv42q7LIDhV51aM8YD1eMTRwbTGdKO+txEYKeoZ1UnaIyMQhLJTyrOkjGgveycKUVYuca4e8XoxYa5IQ6i9fG7rW5b4xPa7NXQDYtBOVVtbn87DicPd4ZhNrSCs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=kKbxY8Yg; arc=fail smtp.client-ip=52.101.72.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="kKbxY8Yg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GteLuUobLM4m8W4Gb7YgNfx2UZzWwaF3rC9JVvxYqz5cKzvmf3OR+vhbFFXK+PjXP9wXNvfu+baB2U22T7kvNCNXTozUFt7z+x95K/B+f14V8OetMomHx8VAlTkO5nW0jDgRklPynK/rKAFAzJRRUqvleHRBGFBqsxMbkFa9iCaLB4wtzIj8qTkILdcm30qbW9bGaRfg3HRsEufLlMvRtfPvEHGuzpBvXOyxKiCLH3KG1Klr2q0ruu7v7dBZIoL2kMilwEDH+TDOgECj18O2gDTHV6QbzNWx2qDieEoKaqJ+iy5QKJqskpm1yr7lgthajQnODHjV9khPZliTuzkfLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8QPXuwFhBziezxanHfbBNtOL7iiEtvDwrqDz28PvUkU=;
 b=fLbgd6C9F2jHn47AqOBmZ/7QacNnR/dXTwD7MXAJ43ndyu/RVZJ7Rgrl4YMapemmD7jrvXCo4Br5wuax+PxvvM2tXxdyC4nIyQp1r/1KoYpj11RwjFUwAxAl0FlWjHvO4kRUXuHjHnLqsAF+R7PFaX3eFtAuB1ViM/Mf/ShtB3pGne5HHtEAmfkUna7FhEYrPzYOgt4xcA8IWixbkphd+xKpRfV4FpOtks7Fe6Mj6yCiLbux/WlvVgmuqzbjtS9PTc89dbqaX/7ScDQpP1xqPKpqLQNVpAaDO50geEnDRUVkuhDlMZ+JpppDfK9xjyU8RA2w5f1nFS1IVCec3Msv/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8QPXuwFhBziezxanHfbBNtOL7iiEtvDwrqDz28PvUkU=;
 b=kKbxY8YgrsGpVZfs4GCNrPgx+xCtUYnSR707D1wolt4U9ODkZWOpBYkQuk0PT19F5AcZAzR5DIttTyUUVAZ4x8LD7dmiYn67rfZXTTb698610wc05Bx4pz6UuaDdd5L2mERTQMOfbjS0/idkzR0Z9yND0wDba/8m5aP7PUo9t/HIFoZCxeKXiDTUuEXXk3AiC7re1FZ02TnTUUBTm4NVDQA8dlJXG9Ixbv66bIufnsLeo4EYOVTx9c5JEaFXwsFk8YH05AgD9V5EESoe/2E8P/h2mcJgnAUBTBBD1iAttKDtaNhVZtveFXVFBwBFTMszyej1tOFbJBrjLEsDv77EPQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by BR0PR04MB048570.eurprd04.prod.outlook.com (2603:10a6:2c8:50::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 15:49:47 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 15:49:47 +0000
Date: Thu, 24 Sep 2026 10:49:39 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, phone-devel@vger.kernel.org,
	sashiko-bot@kernel.org
Subject: Re: [PATCH v6 15/23] dmaengine: ste_dma40: Fix memcpy channel parsing
Message-ID: <arVGk3NNCshNRZt9@SMW015318>
References: <20260924-dma40-fixes-v6-0-fdb6755020a2@kernel.org>
 <20260924-dma40-fixes-v6-15-fdb6755020a2@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924-dma40-fixes-v6-15-fdb6755020a2@kernel.org>
X-ClientProxiedBy: SJ0PR03CA0267.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::32) To DU4PR04MB11791.eurprd04.prod.outlook.com
 (2603:10a6:10:623::11)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|BR0PR04MB048570:EE_
X-MS-Office365-Filtering-Correlation-Id: eefe0b8c-8c6c-4337-cfd8-08df1a537505
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|19092799006|23010399003|10067099003|56012099006|6133799003|18002099003|22082099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	Wbg5FjY+cSrXy6q/u6ubCkEiCedKp8tkxxXW6w2XL8lHpWL/Cb0xuWj+M7xnCAmWnv7gh491HeFtx9aFgTx+TfKo0gKx8GEEpA+4s9Y8mBgevjYR5+6ewfizR5qtm6IwBYemaLKJ4JpdKEUd5e592RSaNsm1yuo5kiMP5Ah1sWGqY7Kcd50cw5tFibidJiJKYOHmcRvcSnOtSTe/RqpAM+UrigFH248fqCAcMTsMSXriBzbTyCTjLzNNYfZ9R7SirTBS76scke5wFikOHEpLzksmZQ6iC6UUy8vt3mbd3jqsIFpX+NOcwE9ultO1jpZqO5zkDYb3/X2t3A5g3D/5OKy4XaA8di4wEMFacNUfa+A9CoVEz+hyis0zbPGP1xGcr4e964J4Og6ZmXt+4jMRFqph+fRdIih871+H2LcI5AaWrmRyErSMsnPOufYc8zOkJMDGHyiFVudxrCOo4xzGFQInvbK5J427SicMSOb/b0wbdeLOrWDvMtW9fuxBoM94uCZsfw5j+x30il+Ze3v+EFF1vwvG7cyzNeHzqPwOlMv/0IsxsE/qZSEPanaytTh2KUszmqk4bcLWRk7D8lkdi/5aWBoaBwyEfwXaImbHkzZihcF+zO2ECt9HhqH1y2+c
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(19092799006)(23010399003)(10067099003)(56012099006)(6133799003)(18002099003)(22082099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zu3tZrqU205mojasSdOi8E7FI50EXEB1oEG5TxjbOkPOuteASEqkXtLlZCGF?=
 =?us-ascii?Q?CTPwIa31WvsWd1A8l1O40+2qSbZIFa1v+Sgge5BtNu5dq6y9RidzAbPW2jpG?=
 =?us-ascii?Q?+55Is3pucO1q6rkuxihCsXOiQzU1NSPssz++BocpuOsyRltN1krbpI5uaMsI?=
 =?us-ascii?Q?KsrjPzv4ahPqF4i9b5h8Ln0aGZagnFy0/U8CwExB32HP+fdBI1FYqrlqEurK?=
 =?us-ascii?Q?gNg6V1hciBszjUKVJqY7GnzsoY/jFBJJRE0GfWLa5lDukQKvk58vJBzNgFiL?=
 =?us-ascii?Q?bt++lt/IgG9KEv8usqk5iG9w35r0q61kW+hTmmSbA3G+I4ErfYL6FsHNwXWV?=
 =?us-ascii?Q?5e3wP/CP145rloolODjE4GaWLinwl1/4IBEVmUtsmfnWWROWGbggxreifxGL?=
 =?us-ascii?Q?bftwCOojJXoqtLLMfd31k8bwGM8tdN/hb92SoCOlhrnnKHdsz/1nQAlVyWQd?=
 =?us-ascii?Q?ZGpTIqRKX/cTtB3U6WBiNRspDwwqxix1WJdZOl09DO69gLIcPzaHNuxPUOBJ?=
 =?us-ascii?Q?9a0ztpIhrezPu3pTnOppaKV0O9gxjN82VkWL1VoKABt71WsTqL5Bcz2UvuyG?=
 =?us-ascii?Q?keBT6BQrKhlJcedga9/mtSWM4HuTDUM7cp88Iz4jFxNGmpgLMbQuy9Zbmn9F?=
 =?us-ascii?Q?T5O/HwdaTPUGsZAIOH8i5RWMAbmwiMaSSz4U4Q37Rfrb06+cY+FVN3temqeg?=
 =?us-ascii?Q?tUUXC0o9BkKdZ60XQIIKJT09PLizsR+LzgRe2WAa0La3f1d2yZRYLR+1PdWw?=
 =?us-ascii?Q?DlDj4QyT61ztqNUs9VrNTopAL63KdYc/wBdZB48O2p1PdIJal5biYb5oGM03?=
 =?us-ascii?Q?gFBA1zuBhspTNKXNyxXw1zaXILl1qzzq5OH0NWAo15Aw6XZCSEjGm1Q8+GNX?=
 =?us-ascii?Q?iPRnz1ZmsFKwVQkO5iMx0kdO2Aar2ogCMyMsjMUpxyn8yb75Ed48+2gEvFVA?=
 =?us-ascii?Q?68gWJTJK+TvDb19VMwaPwcvofJbDxT0DqNN+/qQEtqcyplEvmI1F+f0/xKNN?=
 =?us-ascii?Q?sl6p5jwja7E3Xgx6H/g/w90BKWEgVmuzznN4W098hhxm0UAdbdAo+9NDLbof?=
 =?us-ascii?Q?qVi52iIpWLn8m0jv+QCp2HEPn/P8h11oINpQNk+5A/14O9kzxnzRjkHe/3Cp?=
 =?us-ascii?Q?PPNNBtH5B8qrY/HcaROvQPFGtw2pt8hOeGRT4xGQr2U2tnSwtMp6BrO6NHPT?=
 =?us-ascii?Q?NS5tnD7YNUhGkB0E3nd9adJze4jf534zUxeO55dAiTlP+Junj1vSQAUYcRCe?=
 =?us-ascii?Q?eBUep/dAKzQhlYXSJKi8atH5iFK9GH6x5fJZhIbH5cyvZYjGKZ0IbDXgadWC?=
 =?us-ascii?Q?yKxmmNTm+FLltefd1v7b+pgG4C2mBc+cmympXNS0fhuXLHhZ7UTf1W1Mtt7S?=
 =?us-ascii?Q?S1jSzB6XkLNySPCVbsahWWnR9RCjgn3H1uPZrE9C6EwWmOQZSBnCtzUn58SL?=
 =?us-ascii?Q?d1kHV1tMVjweKG0/pmaC5MuUBshe51UmzDRREiI2vUy8XOBbfMe15RdHJOeq?=
 =?us-ascii?Q?0OxDpQsy0/BrC3jwyZ3k4t4R1dcTkYmuKPUSbLIJxUvUuhrD7VeiORghIcBb?=
 =?us-ascii?Q?KdRVX3fJMysyG4n19pSxUYowtNFtdBz81dQsU5rEQT77m5tDSl8/6lqtnMTK?=
 =?us-ascii?Q?gEZ8yuxGaLLAzpVMgr3SS9OnWVZbkmLsTigYn2/YRlRoeSbPNflZ+1lJl59a?=
 =?us-ascii?Q?t2n9tTDJFQT/ii0SkZ23TTjfb0Sa1JQGG/HgsFBS3UyD8NqZs2QX717T0ooW?=
 =?us-ascii?Q?HKuDFiXGcbzc3X2WXosMT+rJxq9a/rziRVNx2Vutr18Cnw+t1PMF?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eefe0b8c-8c6c-4337-cfd8-08df1a537505
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB11791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 15:49:46.9564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N3BVV8kJbthAHBWRRNsFM56xjFne2TFlZTA+fnm7HFqWxOW7pg0HRHIQz3iL5ao6JBBlQw0dDQsUS+iC0abtvy8D0aHztxGptJ6mnbZWpwYhkpZ34PU/SKmXUZDjVXsx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR0PR04MB048570

On Thu, Sep 24, 2026 at 10:35:27AM +0200, Linus Walleij wrote:
> d40_of_probe() validates the memcpy-channels property against
> D40_MEMCPY_MAX_CHANS, but reads the property directly into a smaller global
> array. A long property can therefore overwrite adjacent data. The mutable
> global also lets a later DMA40 instance replace the memcpy channel mapping
> used for future allocations on an earlier instance.
>
> Store the mapping in the per-device platform data, validate the property
> against that storage, and check the property read result. The property is
> required and d40_probe() always populates the platform data, so remove the
> obsolete global mapping and fallback.
>
> Fixes: a7dacb68b35a ("dmaengine: ste_dma40: Allow memcpy channels to be configured from DT")
> Reported-by: sashiko-bot@kernel.org
> Closes: https://lore.kernel.org/dmaengine/20260819225215.5EA2F1F000E9@smtp.kernel.org/
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/ste_dma40.c | 45 ++++++++++++++-------------------------------
>  1 file changed, 14 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index 6599104ecdde..24994e9bfbbb 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
> @@ -28,6 +28,8 @@
>  #include "ste_dma40.h"
>  #include "ste_dma40_ll.h"
>
> +#define D40_MEMCPY_MAX_CHANS	8
> +
>  /**
>   * struct stedma40_platform_data - Configuration struct for the dma device.
>   *
> @@ -41,6 +43,7 @@
>   * to use SoftLLI.
>   * @use_esram_lcla: flag for mapping the lcla into esram region
>   * @num_of_memcpy_chans: The number of channels reserved for memcpy.
> + * @memcpy_channels: The event lines used for memcpy.
>   * @num_of_phy_chans: The number of physical channels implemented in HW.
>   * 0 means reading the number of channels from DMA HW but this is only valid
>   * for 'multiple of 4' channels, like 8.
> @@ -51,6 +54,7 @@ struct stedma40_platform_data {
>  	int				 num_of_soft_lli_chans;
>  	bool				 use_esram_lcla;
>  	int				 num_of_memcpy_chans;
> +	u32				 memcpy_channels[D40_MEMCPY_MAX_CHANS];
>  	int				 num_of_phy_chans;
>  };
>
> @@ -89,25 +93,6 @@ struct stedma40_platform_data {
>  #define D40_ALLOC_PHY		BIT(30)
>  #define D40_ALLOC_LOG_FREE	0
>
> -#define D40_MEMCPY_MAX_CHANS	8
> -
> -/* Reserved event lines for memcpy only. */
> -#define DB8500_DMA_MEMCPY_EV_0	51
> -#define DB8500_DMA_MEMCPY_EV_1	56
> -#define DB8500_DMA_MEMCPY_EV_2	57
> -#define DB8500_DMA_MEMCPY_EV_3	58
> -#define DB8500_DMA_MEMCPY_EV_4	59
> -#define DB8500_DMA_MEMCPY_EV_5	60
> -
> -static int dma40_memcpy_channels[] = {
> -	DB8500_DMA_MEMCPY_EV_0,
> -	DB8500_DMA_MEMCPY_EV_1,
> -	DB8500_DMA_MEMCPY_EV_2,
> -	DB8500_DMA_MEMCPY_EV_3,
> -	DB8500_DMA_MEMCPY_EV_4,
> -	DB8500_DMA_MEMCPY_EV_5,
> -};
> -
>  /* Default configuration for physical memcpy */
>  static const struct stedma40_chan_cfg dma40_memcpy_conf_phy = {
>  	.mode = STEDMA40_MODE_PHYSICAL,
> @@ -2157,7 +2142,8 @@ static int d40_config_memcpy(struct d40_chan *d40c)
>
>  	if (dma_has_cap(DMA_MEMCPY, cap) && !dma_has_cap(DMA_SLAVE, cap)) {
>  		d40c->dma_cfg = dma40_memcpy_conf_log;
> -		d40c->dma_cfg.dev_type = dma40_memcpy_channels[d40c->chan.chan_id];
> +		d40c->dma_cfg.dev_type =
> +			d40c->base->plat_data->memcpy_channels[d40c->chan.chan_id];
>
>  		d40_log_cfg(&d40c->dma_cfg,
>  			    &d40c->log_def.lcsp1, &d40c->log_def.lcsp3);
> @@ -3437,12 +3423,7 @@ static int __init d40_hw_detect_init(struct platform_device *pdev,
>  	num_phy_chans = min(num_phy_chans, STEDMA40_MAX_PHYS);
>
>  	/* The number of channels used for memcpy */
> -	if (plat_data->num_of_memcpy_chans)
> -		num_memcpy_chans = plat_data->num_of_memcpy_chans;
> -	else
> -		num_memcpy_chans = ARRAY_SIZE(dma40_memcpy_channels);
> -
> -	num_memcpy_chans = min(num_memcpy_chans, D40_MEMCPY_MAX_CHANS);
> +	num_memcpy_chans = plat_data->num_of_memcpy_chans;
>  	num_log_chans = num_phy_chans * D40_MAX_LOG_CHAN_PER_PHY;
>
>  	dev_info(dev,
> @@ -3691,6 +3672,7 @@ static int __init d40_of_probe(struct device *dev,
>  	struct stedma40_platform_data *pdata;
>  	int num_phy = 0, num_memcpy = 0, num_disabled = 0;
>  	const __be32 *list;
> +	int ret;
>
>  	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
>  	if (!pdata)
> @@ -3704,18 +3686,19 @@ static int __init d40_of_probe(struct device *dev,
>  	list = of_get_property(np, "memcpy-channels", &num_memcpy);
>  	num_memcpy /= sizeof(*list);
>
> -	if (num_memcpy > D40_MEMCPY_MAX_CHANS || num_memcpy <= 0) {
> +	if (num_memcpy > ARRAY_SIZE(pdata->memcpy_channels) ||
> +	    num_memcpy <= 0) {
>  		d40_err(dev,
>  			"Invalid number of memcpy channels specified (%d)\n",
>  			num_memcpy);
>  		return -EINVAL;
>  	}
> +	ret = of_property_read_u32_array(np, "memcpy-channels",
> +					 pdata->memcpy_channels, num_memcpy);
> +	if (ret)
> +		return ret;
>  	pdata->num_of_memcpy_chans = num_memcpy;
>
> -	of_property_read_u32_array(np, "memcpy-channels",
> -				   dma40_memcpy_channels,
> -				   num_memcpy);
> -
>  	list = of_get_property(np, "disabled-channels", &num_disabled);
>  	num_disabled /= sizeof(*list);
>
>
> --
> 2.55.0
>
