Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010022.outbound.protection.outlook.com [52.101.84.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6475B49EC6C;
	Thu, 24 Sep 2026 15:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790262704; cv=fail; b=fnQmwoskVFM6DtafIGLLArYQLXz4JOpj8VN80DfPtMwe7HX4PORkfyz6zeUAgoeYE4NBsJ6GHJ3STun0dMQL0A9Y1wGNzxED7YMeuiG77fXQMDwz3nXzH4kuq+L+se83ZM7IHT6ZIMI1v/IZcB1Zuarw9kwPFgxLkfqiW6e1uGs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790262704; c=relaxed/simple;
	bh=Ckfoh13PmmkbD7QYs+R5SddFEIy+XjhitoW36AVElUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ovNv4B7xJVEFxscQRP8Qd3bF+eLKVVaahnS1cliDcScp4lpsoOIG3an/gGxr8K4EgZzgOzwS1R8PlytH6qdDseQzjp3Jz9jlA4dTQ3bTCKqzZxGfS77teFaLBCmWp2qnM7ea4Pu4W/VoJlncYvcGrK6BufngSV84kgig1Au7NrE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=kBieXQDr; arc=fail smtp.client-ip=52.101.84.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="kBieXQDr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nK9b30v69r17qwkkwV4YJB+B97xDS5BdWZvO5iS8wElWDB+2HnjS9hITDpVmPxSqaBZkc+Ex5qb3Byrfwt8GzrzyYtekx9ZyPv2WUM4vmXD4EyEEkbZfRrzzltvMyvaLdtU74b+IJ+8FQBHOpLWT328D0pT1zdIYDwJWvFPa38AavftAoUe+zpPTScobnyiFMsZjMwKqM4DctPA//ImpvmhziCLNXlIq9XPdKNEafVwO+JAG1qzd9p1qrWmXTqXUqf6NHnQTEkLAEQ9UnohSlE16wwrqvz0TUHlC5K6Ith2qJJZB8AZ7U17DPPemd0mrbR/o03FO9WRben1YP8xDfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ygWrKN5NJ+n5HzROCKhBWeo6pQZq2LhuyUCmHwgOkJc=;
 b=TCJ9tq/iTiiWyEGgSm0Qo8LjYwCkLTyfNe/78/7a/ixF4udcCrobnV4WejGrNe668A6BuYs5vhV04ArJDOtyGrP4uY0kA23IxwOzOLBjiokpNWj9FPcW99u0hcHDh/u0LpLN/7G5Y1Vd/dvYRNb7nJ8CNNooQGM9q7GCUy7may+dpMzKKV9fR6yTkqLwUweqntrUXpiOcnPutxYOhXkUy4vV7XWf2FHburPAaWdySqZWGY/PfAzprbO8x+//FlyM6l4FXYvtmBHU6yuyA+ugaUOzHNQGD5q97NwEbyLeofEbpkGZuM21CjCc4QfopLmibUcgVczxt3NNkHzXQ4v1qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ygWrKN5NJ+n5HzROCKhBWeo6pQZq2LhuyUCmHwgOkJc=;
 b=kBieXQDrQ1vZTg3SLCa9pyFJ0QU3iqh0Flx+U9pymQ20GgDi0VlTm9OogVpTfE7p5WL8vfWYw2F/CKz809jTMNpiqzNPee7PXL1QFuEwouMXyiXa+lm4+xkyGE+l3FcfO4UwROBUnzVG07ZVUD9rszbFH1EpAzxrRrkCdN0ilK13bNVX5g5mJx5fkd+zTtlZTZRBxJOHx6G3DKeEiO2AVYI1nbNp9rJsysuYOaH/fIPQAEn+9rRLxDfb1MTdtFaxo62uRCvkWj526IcEmpcY1SQer2f2+iidYkWUJpA0kMtHa2nSZZjqyVLWApzU18eZRBP1mF1W8Q9pZ87TQPB9aA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB12663.eurprd04.prod.outlook.com (2603:10a6:800:342::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 15:11:38 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 15:11:38 +0000
Date: Thu, 24 Sep 2026 10:11:31 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, phone-devel@vger.kernel.org,
	sashiko-bot@kernel.org
Subject: Re: [PATCH v6 11/23] dmaengine: ste_dma40: Fix DMA registration
 unwind
Message-ID: <arU9o0FEP-3wKne0@SMW015318>
References: <20260924-dma40-fixes-v6-0-fdb6755020a2@kernel.org>
 <20260924-dma40-fixes-v6-11-fdb6755020a2@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924-dma40-fixes-v6-11-fdb6755020a2@kernel.org>
X-ClientProxiedBy: SJ0P220CA0008.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::17) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB12663:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d217b26-5039-4143-0984-08df1a4e2163
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|19092799006|4143699003|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	q01QPgNTeoJXdKU3G+23N3sBNygT/z27856tEwyhHE1YEnmX39y35wStQPcL+H8/EwbfBJEwmxqNeR2XLueow1W9BIBzjG3Hb7gm3PAmzBMFI++ChUMgw+C58sOHR+YJ60I3xy4D1wQBYtgHxaml32TqWA2sRSt4kFpZcA79DIQ6RiI/uluRgnPvKEvRh6r9kXT+LRLr1qOvw23L6EH76yrl3hYqEs1EAVDv5p1eKjmivMc4STuo4nmTrfXivqKsC8vE8Wdbv190zB3DJE5xEsqjivF53xoBpdwYpG6DSQm/vdXNNNUoJ8kYEmGnINE9YjHZoKlEf5KqUaonnHXZ3BBcE37qydwzm8ei4KmA7ZZl5uXZxUEsDkUSobEf6XGK8rzw6fwYb6e+uiRFagN1I7sOAEl7NaekFP1haC7fuJ9GGmlzTUeHKjG7n8YFjNG/bUT2VmUJNMhbWHv1nJMZocxepXRkaTLlH595Y0zqLWKBQw3dhzNwj/3tlTV18SLXJ5bvFwCu//GhqLDTxHIQekiBcHrCi77xGbt8dCTqfyo/MHqzcJWXIhG0XihF8Ok6wxjZy+WZIWlVm9XWfPb6TqriITG3Jkxo4DwccXdCFuHLeEtAvcDxyvp8fdK9t10y
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(19092799006)(4143699003)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ket3UnsBis+NB4kxpI2aOpY7oQD7WdUbwEVddxExzrIpyf6FF03hA3OsoOpH?=
 =?us-ascii?Q?dHpq45JZRDr86m1GYX1tz+rfSx8yXq2d2R0TbDDLq0DTapjxhQ4UVYpHPipz?=
 =?us-ascii?Q?USuPQvlRbDvT7eG7s7FxRSbqspmmKjZeHTG2eXp6g5FYXUD+OegdqlBWvGM9?=
 =?us-ascii?Q?7ulmPEA60bhok145IcACuqWC994opI0HkocuS4a0XHOafbzmIY4GHaE9QdC4?=
 =?us-ascii?Q?msagI2/t7qLMG5QP6euWbFo9IOUnkSEXiB4lrvONcB1dce5D8SwszPs28oeK?=
 =?us-ascii?Q?xdiCISzbWZzQ+MIdpx1wTAgwu2Mod6jWQbt7aGxAbF3RqpsCK9l3OssYrkZR?=
 =?us-ascii?Q?y7vpZc4HLaaSlBd4mginAYrxYafKW3u2a9hAl+0U29nGRq6P16WVcuK1xBIR?=
 =?us-ascii?Q?QrodAG9mUeRcPUFU/7FDCzy3PqNXptrGoEKxP6DL0ldWDIUIO3t543ldIkaU?=
 =?us-ascii?Q?j99NdiygMAkm7WOmRsq2Pyeb2MhxDC11yJclGeIg+G071IiMvC5Rz5YuBN+o?=
 =?us-ascii?Q?eVEaWqSF2gQLsJxELItjWstgE/5tpmqmLAXEa9D5uTgI8GsQfXYIujeqhbYd?=
 =?us-ascii?Q?jIHGC36bcqKTsnkOnP4deaPyroyaS1a7Swxxt2WV7HIiP+TYfSPJl6Awtzb5?=
 =?us-ascii?Q?tuoj+WUmE26B40/XWqnvKCdvtsbxC5kMc3hKMAHiNg8dXgCZUvG9LablXDk8?=
 =?us-ascii?Q?6/Iob0Zh8Kz+iBlNvKPJV4CTJslzve8E42XKILDpjLd3PUKkH+RZ8Fom7BMh?=
 =?us-ascii?Q?UPd3t0DnjVYVISwMx27dtuFrUFBLbawIvL9/9GXBbB9XA3oy/WwnYy+en+1Z?=
 =?us-ascii?Q?VR2FNBB73TrnMYAghbg5eZgPRiVyWSm0Pu24VR4G27RlPqsGgqNYrwU4LBYV?=
 =?us-ascii?Q?Ne0n7tgTg3vRe32oDG8SqRKjuQKM54jPExo3NUhDN1wNGUmQc4gRZAiI7o/M?=
 =?us-ascii?Q?PuGKL8yIOZy0QutFHxW+lg42V6EriLNWMG7O8MFv+uC36FhgjEpKS3F/EX3w?=
 =?us-ascii?Q?jKGHpl+TR7hEmo0rEVZArZhwbmqMEaU8Dkd9nb2r4YzoU2RfL8A/moP5jzGg?=
 =?us-ascii?Q?4MXVqzJzx7Prxx8K5brhbQuF400mugQZVQvjK6hITs3k29yuJb3Uxcr5uZoT?=
 =?us-ascii?Q?9ZkCVZB4jlZ4YGLG83BffGNDxZupubf2QFcVPmqdbge018n9/lEdzXjRuyGq?=
 =?us-ascii?Q?RpgiCjYqvobsmc1/aHjNcEVA36tDgmCvFZ5JcE5pmJCU9BoTs8ZVD/RqYQVE?=
 =?us-ascii?Q?DxLcSyT+TLFHYlG+He5SZksV3vZR/UUGm98XRzPKqw1pXwIIpBKShYPBz+eE?=
 =?us-ascii?Q?Y29S++goskoYo9uSSRbl1HLmhamxvRX5DHbLJ2T0MZ0RB9y7CyY4782xNB+t?=
 =?us-ascii?Q?FdFUhSwPnkeVsADNV7PKV9oT6RIHrtT/XNPthCKDlb83NVC6EQHUacyHNtcv?=
 =?us-ascii?Q?qT/jocd5T6N3v6QnHgGN/eAVbuzib5bvvXSFY1xL6laGb8CUXn453VZti5Le?=
 =?us-ascii?Q?rkJ1yRIJToghEdrp5PHJZYQtOTNTgtUx8RpODG1fNRmnaoAB8r4tfoYJ7xc9?=
 =?us-ascii?Q?xOZLFX+24FrTptNnTQQ6L3/8bW2eomCSyxkSfYW2HufvKH2AlAJrqFePUR7I?=
 =?us-ascii?Q?2BQ1cVnpe6BUsXyO0zY3tvOi0RjuMtcs8jZ8BploYK9KUVxZ+luuKVQRkfxF?=
 =?us-ascii?Q?Obhj1jmLLG9se4wMzkNaj5XpykfLOo8D8DoGJWg90sCWzXku/guHnXxYsCdz?=
 =?us-ascii?Q?ZhDu9ea+bTTr5Gi9b9ELRKVPRFBwHyNcRBkUUQal7c2GjBcD14DR?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d217b26-5039-4143-0984-08df1a4e2163
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 15:11:38.2937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LXbvqgnvvJxFZv39zv/gJni7rnt8tF4eCAcnEIDxcGXnG1T5Qp7juRY7eap9zTGdmqcvWOBQ+2+zV6De5QIZdWtX/vzcLp+bwMUmJyTJa8doPaKTzY3oa0JvGxN0Y3jr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12663

On Thu, Sep 24, 2026 at 10:35:23AM +0200, Linus Walleij wrote:
> d40_dmaengine_init() registers DMAengine devices using devres-managed
> unregister actions. If probe fails after one of those registrations, the
> DMAengine devices stay visible until devres unwinds after d40_probe()
> returns.
>
> The channel tasklets are also initialized before each DMAengine device is
> registered. An interrupt can therefore have queued a tasklet by the time a
> later registration step fails, but unregistering the DMAengine devices
> does not drain that tasklet before probe-owned storage is released.
>
> Add tasklet cleanup actions to the DMAengine registration devres group.
> On failure, free the IRQ before releasing the group so no new tasklets can
> be scheduled, then unregister the DMAengine devices and drain their
> tasklets before freeing the remaining probe resources. Keep the managed
> registrations and cleanup actions in place on successful probe by removing
> only the temporary group markers.
>
> Fixes: 42ae6f1695be ("dmaengine: ste_dma40: Remove platform data")
> Reported-by: sashiko-bot@kernel.org
> Closes: https://lore.kernel.org/dmaengine/20260819225215.5EA2F1F000E9@smtp.kernel.org/
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  drivers/dma/ste_dma40.c | 46 ++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 44 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index 36f4cbd4da36..87b5f1d97ac2 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
> @@ -3042,6 +3042,18 @@ static void __init d40_chan_init(struct d40_base *base, struct dma_device *dma,
>  	}
>  }
>
> +static void d40_kill_tasklets(void *data)
> +{
> +	struct dma_device *dma = data;
> +	struct d40_chan *d40c;
> +	struct dma_chan *chan;
> +
> +	list_for_each_entry(chan, &dma->channels, device_node) {
> +		d40c = container_of(chan, struct d40_chan, chan);
> +		tasklet_kill(&d40c->tasklet);
> +	}
> +}
> +
>  static void d40_ops_init(struct d40_base *base, struct dma_device *dev)
>  {
>  	if (dma_has_cap(DMA_SLAVE, dev->cap_mask)) {
> @@ -3088,6 +3100,11 @@ static int __init d40_dmaengine_init(struct d40_base *base,
>
>  	d40_ops_init(base, &base->dma_slave);
>
> +	err = devm_add_action_or_reset(base->dev, d40_kill_tasklets,
> +				       &base->dma_slave);
> +	if (err)
> +		goto exit;
> +
>  	err = dmaenginem_async_device_register(&base->dma_slave);
>
>  	if (err) {
> @@ -3103,6 +3120,11 @@ static int __init d40_dmaengine_init(struct d40_base *base,
>
>  	d40_ops_init(base, &base->dma_memcpy);
>
> +	err = devm_add_action_or_reset(base->dev, d40_kill_tasklets,
> +				       &base->dma_memcpy);
> +	if (err)
> +		goto exit;
> +
>  	err = dmaenginem_async_device_register(&base->dma_memcpy);
>
>  	if (err) {
> @@ -3120,6 +3142,12 @@ static int __init d40_dmaengine_init(struct d40_base *base,
>  	dma_cap_set(DMA_CYCLIC, base->dma_both.cap_mask);
>
>  	d40_ops_init(base, &base->dma_both);
> +
> +	err = devm_add_action_or_reset(base->dev, d40_kill_tasklets,
> +				       &base->dma_both);
> +	if (err)
> +		goto exit;
> +
>  	err = dmaenginem_async_device_register(&base->dma_both);
>
>  	if (err) {
> @@ -3717,6 +3745,7 @@ static int __init d40_probe(struct platform_device *pdev)
>  	struct d40_base *base;
>  	struct resource *res;
>  	struct resource res_lcpa;
> +	void *dmaenginem_reg_group;
>  	int num_reserved_chans;
>  	bool irq_requested = false;
>  	u32 val;
> @@ -3852,20 +3881,33 @@ static int __init d40_probe(struct platform_device *pdev)
>  	d40_hw_init(base);
>  	enable_irq(base->irq);
>
> +	dmaenginem_reg_group = devres_open_group(dev, NULL, GFP_KERNEL);
> +	if (!dmaenginem_reg_group) {
> +		ret = -ENOMEM;
> +		goto destroy_cache;
> +	}
> +
>  	ret = d40_dmaengine_init(base, num_reserved_chans);
>  	if (ret)
> -		goto destroy_cache;
> +		goto release_dmaenginem;
>
>  	ret = of_dma_controller_register(np, d40_xlate, NULL);

if use devm_of_dma_controller_register(), does it avoid use devres group?

Frank

>  	if (ret) {
>  		dev_err(dev,
>  			"could not register of_dma_controller\n");
> -		goto destroy_cache;
> +		goto release_dmaenginem;
>  	}
> +	devres_remove_group(dev, dmaenginem_reg_group);
>
>  	dev_info(base->dev, "initialized\n");
>  	return 0;
>
> + release_dmaenginem:
> +	if (irq_requested) {
> +		free_irq(base->irq, base);
> +		irq_requested = false;
> +	}
> +	devres_release_group(dev, dmaenginem_reg_group);
>   destroy_cache:
>  	if (base->lcla_pool.dma_addr)
>  		dma_unmap_single(base->dev, base->lcla_pool.dma_addr,
>
> --
> 2.55.0
>
