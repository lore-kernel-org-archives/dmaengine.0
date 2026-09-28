Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013058.outbound.protection.outlook.com [40.107.159.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF9A353A92;
	Mon, 28 Sep 2026 16:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790614638; cv=fail; b=FHl8svQejWOkURvUz4DDdeHkpZOc31s28kb4QtnrwYE8k8XUlLLJMmX3csKrqXFNztZp75dtzHP2vp2sTmWybsZykgOwZ0TdjPm0pK8wbOe6i7NfDgNuvTGi5GNynN75b5QhO2ByxwPQqQvyxnSpRMSuIURxo2i1Zn2ivVQnD6Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790614638; c=relaxed/simple;
	bh=r0dL03kDxVPuEnNZ3lxYFv8bPdJSg/V18X52xfP9LfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=g5Ll98Z6i6uqcMYgjRfniPPB+uPOTKwuB+trvezX65c3JD3bif9ZnGaMKSE9ChOXFziYY+dQpoyyPxxDkpRGL3VOj1BbJ+VETscoXuJiLZvF5/D1p3j+DsWkTLkQ/UDksnoA4UCStW+zJl6J+2TDJT9yYhuOqLhTnzkwNBEAqS8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=v0I6fZrq; arc=fail smtp.client-ip=40.107.159.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="v0I6fZrq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tm5Zll6ch7bQgtggPKyRjwALBsnp4sYHKtkaxQiPU2gK13Zy3TUfdVngDJxrs7xtoLnMajQGZzPi0/G532zFZ2BGshDtqfsvcnFhX4jaDloy3ETkzizszqEZzn9Tf7cZe1ZMcKXeNv7ycyzSGmBKYRbCU+k0ZCNWdksHMNcLpWseH851mp2B++oxzcDxuLxPGlxCUH2UONxainP7/3PTx3GEqcWQ2pjoH/NzM6pqWCDp+1CqtzyWBiEKKphwh2UHn4evZ42QAQiwRxk8MZuwQ29tXE4mEBWH8Sw96+aecXcEVg57DiQiP3CGz6K74+rFEho6Af80q9EAbeYZvDdtIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AWKtUlxnWlpOnzGcrk0/HvpI140qVO4qpCotqctNweE=;
 b=o2nnE3uu3grnzMLkj5qCjwsDiAg5m/4lnhsPBtuBWKg9ZsooiItWn4lebh3ZocfLd1aGAwg9/q1l30UYY3J2JWqfEq/YrmZEFdDN5nBKY1OIS8oFUlnW1gxHRysQBxIdvk+RnuDw0QzJJ0mL+TuA0ij1rkMWdL9PHs5N6CSnlXPgwqApZ7qu+Zqq6B7xaG3bUpQmKHUxZwHe33MrbP3jkOz89N7gmZY/f76VTQ8WRQHbUYRmqmqBySZANL4ouHqeZ+Xwem6XtW9OSkjoY+l5sP4z32gNA38NiqB3TYKbRSGLcrQVB31yigTctY4XhVK4uLGQsiY5pMelC2huj7M4Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AWKtUlxnWlpOnzGcrk0/HvpI140qVO4qpCotqctNweE=;
 b=v0I6fZrqniwvamp8f/Kf4U9bFMAS4tH9bqjOOH4JLhtjaXlMQbfmjScMaCfJUl+nFBcTlrzussh62pIfFngofjOq+Zwmj6Qg73pJm1MI3ouIQVlKAVC4dFKgiACb1mSE+SqaHFyegHn2ZfMPc+PnJ7iCx4IAHDF9X08q4HD4vOzrOtzD2xCxbyG78woz9pAA6N2bKqRlJLcB6E2mvbOeIjciNB205DB5KRF4iDR0fnMLN8d2IVhRz5ajF8UsuhH+fyF28z5SFhK4vrXzTVZ/MXuwnCylnfD4Vc90TnKm7J/bq6hw3jsdqpQ5GljMCbNnK2k9XR0Z54fpSYY2xoGngA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8723.eurprd04.prod.outlook.com (2603:10a6:20b:42a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 16:57:14 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 16:57:14 +0000
Date: Mon, 28 Sep 2026 11:57:05 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, phone-devel@vger.kernel.org,
	sashiko-bot@kernel.org
Subject: Re: [PATCH v7 11/24] dmaengine: ste_dma40: Fix DMA registration
 unwind
Message-ID: <arqcYYhVRnSuuTRY@SMW015318>
References: <20260927-dma40-fixes-v7-0-89f595e8851d@kernel.org>
 <20260927-dma40-fixes-v7-11-89f595e8851d@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260927-dma40-fixes-v7-11-89f595e8851d@kernel.org>
X-ClientProxiedBy: CY5PR15CA0195.namprd15.prod.outlook.com
 (2603:10b6:930:82::11) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8723:EE_
X-MS-Office365-Filtering-Correlation-Id: 309d4d52-4efa-436c-fc66-08df1d818b9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|376014|23010399003|10067099003|56012099006|11063799006|6133799003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	/E/F0nKgywID92za1IGHGAsVJHOZPddbPq7q3dlZeurxz9/7GnR2VdlYIHjjpfUkCw7RyWb/u9LGQrSjUiL6npN0mFeR1z4WZBCGUJs+ogpcekYNcCu4wI9PV7dO9hq4fg6nAP6Qykc8nwFdcVmJx8bDHUq5UbX8GjWIxLV123+WCG8/8XOQfCRIKkif4/xWsgEYhppjfvSl5RIn8dX3jXLakUABbhENCFE9T3Jv6B77W77B1B9/vOXbWteVigW1s/G/R4UAseitJ7o4QV3GrtffEUUULSzgS6ILGELGS6Um3DPxjufDQKTxBLqUNNSoVA/ZZDk09jWscNvPejEl3lTtfqlvFIHfwHmpRpH2pZWkDesB4qSsvmaNh64A33iIAEfYKv5KitQ1U/nud/nrzjTR3zy1ciG569P6S42iiwaX/EQ8/q+V2O+K3jHLfgkak+LOPnD5k7EzLset16bAKipDpo3hHjQ3V+6iGPARzbw84wtYVytlwsFr364PAYd+wi7YK4GxkSi/VkGWdLIhgHeh55R2WevcSEXbKTjcgC9r+7xf9v9M4MKvIRpSBgL2KWlBzCZXvjepa+Wbh4hsoiJ6O6bKjRsjDcoDGkwrSOZXbxY1Zw830eT2Ifc7IQm8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(376014)(23010399003)(10067099003)(56012099006)(11063799006)(6133799003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YmMI+UHsfTY6m0BovYXRWGf6N9iOqhQC/URqSnsGPphQ/3SDavVDwAucarrw?=
 =?us-ascii?Q?qA+XaPwTNbXAx3w5LkXZJiLW2Z9tLMqAJWSo29NYPoYDeoGpW6A58hqU7Pn+?=
 =?us-ascii?Q?/42x0cWYdKtmH8loqGe3GbEo2mny6NdCJMUs2nMQswwX7XOdLn2NXnLV7du7?=
 =?us-ascii?Q?xhw7mKG1YznjZN8VYcNrIViEIWn5uSux2cB/5woJ74wY+NXtiC6/kwfz+eJ0?=
 =?us-ascii?Q?A1td3uuN8caiG/KRS/m+K3Ah6+WDtwZLZEoWTuxzqhzomSzqCrBvkMbtLJkl?=
 =?us-ascii?Q?8Z22NmgSFRxvvih7IZk8yZ2JtGEwCGCn1oNQvxsgFtOiRTF0fc74MvSFF68c?=
 =?us-ascii?Q?zHfclOuYaMOXkLbwva6MAxvkoIcOv1oyfZnm2AptNTD5yJzj4RyEejmPyCst?=
 =?us-ascii?Q?aNsTrJpO9pEZbxcFaMpCHDnmyGWDjtUZcBLgEPPHUfZgI7Kyo+fReTcTbQGX?=
 =?us-ascii?Q?fEyjjJMmAKfSwOBHZ8Lu4B6SN33GeaOoNC6qLtWmHpYqBpaw2eiyf6jJS+2V?=
 =?us-ascii?Q?KdKQein74pa0u5m528XMR5MlSvyFSRLE2zmz4JyNXt/FYBJY+cW0age4yBsT?=
 =?us-ascii?Q?X4mHQq/EgdqS55uJ7GZtFGpMcRRU+vi1RWX0I6ZKX0Bgmlw8Sl38tShzLnSM?=
 =?us-ascii?Q?rAkEklVERnaT1ocsfmkM8ic800g0TKjXbfrhz5u9O2tOWd9Zylm54T/7AnZJ?=
 =?us-ascii?Q?qzh5MqUgfmupoO7fsc/v/jt31sVzIUHlNg61Ka57qpCh4lF2X8yFkbMqI1bE?=
 =?us-ascii?Q?22sZTN0UorGlBpO0cvdKzn4mQJyJchupQDkABkVIaZ32XPtQIy314M4J60Pn?=
 =?us-ascii?Q?de6UrsD10b5ReaB2ysoO4GQp0I3JFNTsqb+OByQUHDKhOn+eevuw3/CL1xPT?=
 =?us-ascii?Q?yIs1zSBA0JI/MY08r0iCwgi07kU5CAZOaiyjrNI6oziVjJ+Yiuhnv1XlkTyQ?=
 =?us-ascii?Q?YbKWVOnZv2IMmG2OJFt5h9jzw62VjgcQYI5msv2xBf1r35drhcizW5c5tEml?=
 =?us-ascii?Q?fc1Kdh4x2bL1+rF0s5CGpWnU++CfTm8VQSqyfGvaKfv+d6X9Bs243VLgHcPB?=
 =?us-ascii?Q?Rwgqa4fj2JmKB21odaCnPC24t99CAP0HzIp/bT+0mIlwh5got/XJX4yRpqid?=
 =?us-ascii?Q?2Evy8oDVSwBf//1Wigns7c9Hsk2V2VbdvFg9fwT3MUv9I2pnTo2ytPgs5Yyj?=
 =?us-ascii?Q?Z61EQkqBVaOkUeUufVypzdZq/03SYET4IHBRQTjJK4lwLNrxPm19fuT9GN9o?=
 =?us-ascii?Q?WCPapfaRyMLzFoaMWW+jG+3peuEeIeUfp0MT4472/+pTS0ItSko8OU1Cgx3/?=
 =?us-ascii?Q?UP8b4kKZ0HdwhwqUSnGzh4D8W93zWHElOYn5HHzekriShHVWkImUSzFYRLLF?=
 =?us-ascii?Q?T0winm4MX/tSlQLeKnv89SHItGwaHzexhfsCHrNbAH0BVbDvckCXSnaFg+Bo?=
 =?us-ascii?Q?pKvc1SKN6+znNPDftfaM4SZwnR4mK3cPXK+HYpNY3hmiBJQngUFb9OS5i7KW?=
 =?us-ascii?Q?xOv6p0cYTy6A5cq67N1C1jQehu4/nnrU47gWQ+WmOMYZVFzkVv5Mw4sr30Lw?=
 =?us-ascii?Q?A81vtJjgqrd9WGQSP2WIPW7PzUI5tzrlZOHngJplpW6uvRSrQxSvxa82QuI6?=
 =?us-ascii?Q?3VkkrRmqN23DkgUkk9HeGML4ucldj+59s/v0u4Oo3ixM82oMwF8E8DndvkDw?=
 =?us-ascii?Q?rroJEg7Rh+5iHOrhZpIG0ZzJr5aw17zd817QGHj2VKh0EfGwocAyR6nuP+15?=
 =?us-ascii?Q?gk2K50R/7PBpNrvEWUzq1Nhof75TiMhdbYa9kqqCeOsnZeupUaOV?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 309d4d52-4efa-436c-fc66-08df1d818b9a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 16:57:14.3026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wGlLRptEFkq0RYQ3OQN9vNl9CGfXjE+3aErGCLvU+THVPLHnG83CTaSdlM0FrEI/mJDNO8OR+9zOaN9rW43dCa+dTIVClQc+kebNFJRK1lWbvFTxZzt22kElw6hMz6Z1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8723

On Sun, Sep 27, 2026 at 11:03:24AM +0200, Linus Walleij wrote:
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
> Install each action before publishing its DMAengine device. If action
> registration fails, those tasklets have never been exposed and cannot have
> been scheduled, so use devm_add_action() without immediate reset cleanup.
>
> On later failure, free the IRQ before releasing the group so no new
> tasklets can be scheduled, then unregister the DMAengine devices and drain
> their tasklets before freeing the remaining probe resources. Keep the
> managed registrations and cleanup actions in place on successful probe by
> removing only the temporary group markers.
>
> Fixes: 42ae6f1695be ("dmaengine: ste_dma40: Remove platform data")
> Reported-by: sashiko-bot@kernel.org
> Closes: https://lore.kernel.org/dmaengine/20260819225215.5EA2F1F000E9@smtp.kernel.org/
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/ste_dma40.c | 45 +++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 43 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index 4c545a947264..f72d91c8d0fa 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
> @@ -3039,6 +3039,18 @@ static void __init d40_chan_init(struct d40_base *base, struct dma_device *dma,
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
> @@ -3085,6 +3097,11 @@ static int __init d40_dmaengine_init(struct d40_base *base,
>
>  	d40_ops_init(base, &base->dma_slave);
>
> +	err = devm_add_action(base->dev, d40_kill_tasklets,
> +			      &base->dma_slave);
> +	if (err)
> +		goto exit;
> +
>  	err = dmaenginem_async_device_register(&base->dma_slave);
>
>  	if (err) {
> @@ -3100,6 +3117,11 @@ static int __init d40_dmaengine_init(struct d40_base *base,
>
>  	d40_ops_init(base, &base->dma_memcpy);
>
> +	err = devm_add_action(base->dev, d40_kill_tasklets,
> +			      &base->dma_memcpy);
> +	if (err)
> +		goto exit;
> +
>  	err = dmaenginem_async_device_register(&base->dma_memcpy);
>
>  	if (err) {
> @@ -3117,6 +3139,12 @@ static int __init d40_dmaengine_init(struct d40_base *base,
>  	dma_cap_set(DMA_CYCLIC, base->dma_both.cap_mask);
>
>  	d40_ops_init(base, &base->dma_both);
> +
> +	err = devm_add_action(base->dev, d40_kill_tasklets,
> +			      &base->dma_both);
> +	if (err)
> +		goto exit;
> +
>  	err = dmaenginem_async_device_register(&base->dma_both);
>
>  	if (err) {
> @@ -3714,6 +3742,7 @@ static int __init d40_probe(struct platform_device *pdev)
>  	struct d40_base *base;
>  	struct resource *res;
>  	struct resource res_lcpa;
> +	void *dmaenginem_reg_group;
>  	int num_reserved_chans;
>  	u32 val;
>  	int ret;
> @@ -3844,20 +3873,32 @@ static int __init d40_probe(struct platform_device *pdev)
>  		d40_err(dev, "No IRQ defined\n");
>  		goto destroy_cache;
>  	}
> +
> +	dmaenginem_reg_group = devres_open_group(dev, NULL, GFP_KERNEL);
> +	if (!dmaenginem_reg_group) {
> +		ret = -ENOMEM;
> +		goto release_irq;
> +	}
> +
>  	ret = d40_dmaengine_init(base, num_reserved_chans);
>  	if (ret)
> -		goto release_irq;
> +		goto release_dmaenginem;
>
>  	ret = of_dma_controller_register(np, d40_xlate, NULL);
>  	if (ret) {
>  		dev_err(dev,
>  			"could not register of_dma_controller\n");
> -		goto release_irq;
> +		goto release_dmaenginem;
>  	}
> +	devres_remove_group(dev, dmaenginem_reg_group);
>
>  	dev_info(base->dev, "initialized\n");
>  	return 0;
>
> + release_dmaenginem:
> +	free_irq(base->irq, base);
> +	devres_release_group(dev, dmaenginem_reg_group);
> +	goto destroy_cache;
>   release_irq:
>  	free_irq(base->irq, base);
>   destroy_cache:
>
> --
> 2.55.0
>
