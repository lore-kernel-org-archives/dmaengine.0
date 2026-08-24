Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013071.outbound.protection.outlook.com [52.101.72.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946F3370D77;
	Mon, 24 Aug 2026 15:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787585135; cv=fail; b=SkocRCY6xfbmKKVPIX+SWzvlrKgM1qWyItswbJQD9Gwjy7bBMpPTE0Xat9IAPxhrJjoDgy2MxH78iullRhnm8QsBaU28qIQQy3tBAhgztLMe6XBR9P/sZr768L9J3s/gGFF8YLkCaqurbsNeLijd5B2yCWtcgK8bQPkj/7tMUNc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787585135; c=relaxed/simple;
	bh=0gqPPfoWasKg9kCWkHONMXoykKcfhcC4jnGGqTzkZkg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=sIVYR9fdD8E3UoUYiJbyEobe9DXJQTER0/6Qk9cRU2PNqCHQOUKvzDuEKDlhmWX4kBKQvTFQmdjfV5Vff9KEUDwlAr5BuPMnTOjeBAQTIOXDVzOGHQHeaInehyT2yBbsmJ/9y8bpw8UC4t9U4C92rGkrLKZoJK8Xn18Q9lruVW0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=EVjpZOqk; arc=fail smtp.client-ip=52.101.72.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="EVjpZOqk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CCBjHWtd/MMZTTXuPIbSHlZ5Tl4zN09CbxGbmfSQQ37ZWbDs+nx4Nb1WYc3bFF8sJq7SgwLERgG4la60yEDqC3y7RmVgKIUOhi6W0MQHJB7u7SBRvdgQw/tUJ/czadvYaqL5NRKvMloP9nANrp6Pv0LP1XwsTAwtwi/xUeimouZbJM6xPky5mYcOjOG9oc8C7Ad8v3986st9cNSvz/V/vpES388yXx+NjLqcUbS/AdzHtycDh9xGzS18bZHAKc+hHuSD98fMuxvwbE4uLgJHOQLO0g4HxhBCaXprXaQl2uQC7Fjk6yPgNOHOsXFQJdW39mPF7WSyf7UJYI28O81OzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RffG9UgvaR1iSR9D3zkYO7/zZH/PxE6esaEmH/Mhx6w=;
 b=eUOLXQVTNOofV1YvVxKVxTCY1nHn6atJCGA5up1SLZgfyBMaLmgRYrrxs4GQbRykdKemSq6f+3nO0arhPjfrzcKLiHH7HHbNprtRCY3lYf+P/YOfD7bax5mQDlCpmba/yRPsn7DgLTxz3+dm8B7qFP0xIAnKUPJg9qPcE145jN2ZfRLVEivh4WXLsy/WHdtjjJH6qCauUue8nZTIgV/5mljvysWzabLjG+nv+ANbhYt83+qI1+91OQFMl5+Go5Vjdu6G7/BScX0PnpDH3E3gGkaZROZBMZK6s5HNcv+XWyzPySzR/RIgSflm/ctsUJMf/WkjkoUgjtouWgn4EmI7dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RffG9UgvaR1iSR9D3zkYO7/zZH/PxE6esaEmH/Mhx6w=;
 b=EVjpZOqkVVvvLpyEh4nLQanuO/NoVvS33I49R8PRJSFIS1hIWlFKVDhqXt+I7Exs3kgbMitPtDx75GbG8uq9QxhYU9zNxw5vLa0RKydHlOFw+r1OWtzlkr8DiGcFEOPqB9hxriJ/gCKBkauvg6bb2VOI458d1T1knNp4UL8tQ5szblWBa0+D64XIW74g7XaakpykGXawsB1EUHRREd5aaUqSBzjLmjPGG9QTbX1rJuEAghMtEo6wdjSUe0VJ70Gift+SIyObM1oRgVBART0lRRI6FcjjSh7ABS7N9vmthUH/WKwHJzW6eLIbxXQ9D2mcQ7p2nKXpFMqTSM/cKC6cKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by BR0PR04MB494131.eurprd04.prod.outlook.com (2603:10a6:2c8:35::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 15:25:31 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 15:25:30 +0000
Date: Mon, 24 Aug 2026 10:25:22 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dmaengine: bestcomm: ioremap early
Message-ID: <aoxiYtuTC3dULO06@SMW015318>
References: <20260823044900.11466-1-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260823044900.11466-1-rosenp@gmail.com>
X-ClientProxiedBy: PH0PR07CA0073.namprd07.prod.outlook.com
 (2603:10b6:510:f::18) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|BR0PR04MB494131:EE_
X-MS-Office365-Filtering-Correlation-Id: d397b9ed-f2b6-484c-8d75-08df01f3eeb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|23010399003|376014|10067099003|56012099006|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	k5lYTfszoje5YXAAwohz/tH6+06oODlYYVGzeyL2d7FfLFOy3IsMnSQpj8P1zqc3zthPJXJJ8yN6HGyHmdw7Jlj3CdVU7KsZLyPJL1XfOP62c7HeCNyyuPZFX+Two1cgeTSn/gPSsX8VoL9ZWXPVJH+IXVFDE/H2lHu9jtDG8FqdywHZKW4cmSolMqsJ9EVKIxQYhwk+xJaWEmc1szhcBPBgYGCfqp1/QuAiJEDAOkeTYz7hIkOYvTOvc+ZTMLZEsiiYJTeyHVwdHisZHGOMYYcmiTBKWDGvtyfh8S/O/BZ9LLKtlaF8F6HUlxb+mcd1NPVe/uPpmIAHARCIauFiIR07BrCUg+OhPwDY4FaVzwX1zyt4PC32aJ4ZfuyPDKGHhffDvRfNmUep+zflpAC0uUfDfHPnU67h6d/sLYRC2QK6JGDj68OJKL/vzNygyOesWXVQidmmxQwU9nS3XBBMSoAumQqht8U3HQEjyn1jMvFqbIMEHhXMW3Eexrrceuxrq/JwLrOmTmDQzr5gQ2e46R/4gzHiiTFnLMxJU6CxD7ZceMGEe/gEPL+dSgxvgs88H5+H+aAKmWwSER+04CXQpbQlVYa2a6cPfb9CaeBvz+aZ8KygdkSyTJ7ntEw4Xify+ZfvojUphM1QNkKDCsBYD6pRO1VNl6oZtiLQYr7YLUk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(23010399003)(376014)(10067099003)(56012099006)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0T1omLC0okVytXf/zaWUNdvseXxJ3v4zmpTp5Sb58tX4267GUhCLbA4U9tEV?=
 =?us-ascii?Q?uQUAV0ZW7l/hr6SdhyBc4nAWYiLmZfrk1KDCpfLrcYY7g3QKN5j7VCo15lJc?=
 =?us-ascii?Q?DyijzxEPP0tpTVLnMGXpqu0jHM6Q2pAUTLbHbDlqiAZne2kxN/Iy4W7XeCjL?=
 =?us-ascii?Q?P42TzLaHEYU7McU3k8IUSPppAI/k2vHosHvX2Juapg6SO6arHVmASNEKlEii?=
 =?us-ascii?Q?P9IwjGm+FiqglaM/9Bt39MxA677w3jL96bslmD9qHEJYhV4mth0eRWJE9ZaH?=
 =?us-ascii?Q?TAh/cGdFEdhOgVO1LKH3AEkLRn0xies8nuotFu8XJqmYdEeCIofRiTI9iyyz?=
 =?us-ascii?Q?b9eKBvQp2NTGx/lrxD6mVOOQJeSJm5IN0PBnMfbVWa/btY1iM+bV25IqBB/8?=
 =?us-ascii?Q?zZ1NlzOC+gB0vfGfwgS317MeUuOf1GpaLEk7CeONaWJFQsGm1n9TuMKcI8G+?=
 =?us-ascii?Q?hhwCXCo5XuTtKdTZ9YVi6+UjXklsrJ+p9A9mOPCgVdqXz1pYLtCHeJLMqFYV?=
 =?us-ascii?Q?c06p/lhLQCfuvDdJ+y2tKiIDvwTJQHkiDsd2ImDB7r0a8PBpQ8/sGE44wz8W?=
 =?us-ascii?Q?EoejUYDyJDyLnaPNMU/kQYxgwWiG7o4QgDsN/voqB7Gr7JpLdwPtamDThhEA?=
 =?us-ascii?Q?2Z1e24d8aclf9O6XogAQW7bcM3nhVV26bZ0Sc87HB2UFCPR0r4dVXRWnzZVT?=
 =?us-ascii?Q?ebpY6cfQ3zDm50WoVictdG4AGc8g3UaHOMjRrd/fGqIO+Y20q+qx7PurIei0?=
 =?us-ascii?Q?+cUQ34wR6NWVEP+pukYEkHDCNpKIYQ8vfvazqZ/cxpWMuxcRKyY5+0H5/AIl?=
 =?us-ascii?Q?F0G4heGgUDgrymIq6hFvNZyp7mPiA7DgY+JkzlvZvMuFnjNpf3FyckfUpSeZ?=
 =?us-ascii?Q?wqGBYs31vatKfNl4iUS3p1+otGUIGAeuIHtPZQxVXeJLPzLe8AslUbOt47qo?=
 =?us-ascii?Q?ImRS32F6d0ZqrwdXm4a5WGjsG+4/tPssnwATLfEg+W7/M8tc5oBigzh6MXyC?=
 =?us-ascii?Q?sdtT1ruv1IIQGingbfrbH6jCNoXafxI20BT6BPN13Ri/Pcb08XUloWWWRCUZ?=
 =?us-ascii?Q?JnGUcCBq4jO9vsGDptKG+dlT00IjN8PzlVUtttHN/sxoepSjykol7F7aPONK?=
 =?us-ascii?Q?2uHWYOS9Qr3gAt4MV37PW4Hs3ht1JoNvnTViLZl3gYmxfuZJ30yKnLWzuVJD?=
 =?us-ascii?Q?zIsopx+UU2ZbT8f0IgmZicH6zw28Zi9QXb9pkDSL3bRAo4QK1YmBMJZSoClI?=
 =?us-ascii?Q?RL1OWW8+2QxKpXqX3Vg2KTY8opFaim/OGsPoi5FIjnH/NrsCUE2KivSvqn0b?=
 =?us-ascii?Q?DvHzQeR4xUEr8zWY8ZZ6XPf4oo0eXvYfCre5U4vfyKo1acdt57Z/hTQYm4F/?=
 =?us-ascii?Q?N6WHBklf9lr0fTwWA+Y+TJFCMWUO/hI95jtfTTbTxgP/L9Qi/oZudajNCS0X?=
 =?us-ascii?Q?RS/Yt6bwKwk7EsSCfkklMBQpNpVOAWGqRw6riQfKNBOSARTyMwWdGz5W919J?=
 =?us-ascii?Q?Ah5pOetvBh59+iWl21tpErkuf60GbUH/TPRY2fOTcEIuIYiJt7eZ83k5KcLF?=
 =?us-ascii?Q?j6dKtIPawnu/+vdaCmX5HtoeFSCoXrc7rIDQGuHOdurd5hWi2d2BJlir9WGu?=
 =?us-ascii?Q?vEZwg78Nh9qLyEWFtmgyEJ9uTBT4Fid2+b2TiE23+Zs1lD43YVnXY0pjgHf+?=
 =?us-ascii?Q?P5blyHCc5YFK9em1oCevvunKI53PawC/J7YmJaWDXBPb2cdf80MWx6sDioUo?=
 =?us-ascii?Q?YOTv5/aFK8xppUbDAAEtT2Kk6gtJ9XzF2wWngzmd9Cj3cc/zIFZI?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d397b9ed-f2b6-484c-8d75-08df01f3eeb1
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 15:25:30.6317
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PJKBcdarmLGODadffZpL7wkf65egQKH8xUMTEhrkClStpKNw1ViNTgTDCEdVUWAZ7PXU5nZcPSWII+RJFIBJ3T2Md2FCAeLJlT8gMWq5gQ2If+jTxsfyxPqGf+HFONUU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR0PR04MB494131

On Sat, Aug 22, 2026 at 09:49:00PM -0700, Rosen Penev wrote:

subject: dmaengine: bestcomm: use devm_platform_get_and_ioremap_resource() to simplify code


> Doing so allows handling potential -EPROBE_DEFER before any work gets
> done.
>
> Replace the open-coded resource lookup, request_mem_region, ioremap and
> the manual iounmap/release_mem_region cleanup in probe/remove with the
> managed devm_platform_get_and_ioremap_resource() helper. This removes the
> now-unused error-unmap/release paths and simplifies probing.
>
> This also fixes a resource size mismatch between allocating and freeing.
> From sashiko:
>
> >  	release_mem_region(res_bcom.start, sizeof(struct mpc52xx_sdma));
>
> This is a pre-existing issue, but does this mismatch in size during release
> cause a permanent resource leak?

%s/?/.

> The memory region is requested earlier in mpc52xx_bcom_probe() using the
> device tree node size:
>     if (!request_mem_region(res_bcom.start, resource_size(&res_bcom),
>                             DRIVER_NAME)) {
> However, the error path above attempts to release the region using a fixed
> compile-time size: sizeof(struct mpc52xx_sdma). Since __release_region()
> strictly verifies the boundaries of the requested resource, if these sizes
> differ, the check fails and the I/O memory region is never freed. Driver
> unbinding in mpc52xx_bcom_remove() also uses this same fixed size.

Needn't this paragraph, "devm_platform_get_and_ioremap_resource..." already
clear enough.

Frank

>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/dma/bestcomm/bestcomm.c | 45 ++++++++-------------------------
>  1 file changed, 10 insertions(+), 35 deletions(-)
>
> diff --git a/drivers/dma/bestcomm/bestcomm.c b/drivers/dma/bestcomm/bestcomm.c
> index 432b43520ddc..44ff4a42376b 100644
> --- a/drivers/dma/bestcomm/bestcomm.c
> +++ b/drivers/dma/bestcomm/bestcomm.c
> @@ -13,7 +13,6 @@
>  #include <linux/kernel.h>
>  #include <linux/slab.h>
>  #include <linux/of.h>
> -#include <linux/of_address.h>
>  #include <linux/of_irq.h>
>  #include <linux/platform_device.h>
>  #include <asm/io.h>
> @@ -365,13 +364,19 @@ bcom_engine_cleanup(void)
>  static int mpc52xx_bcom_probe(struct platform_device *op)
>  {
>  	struct device_node *ofn_sram;
> -	struct resource res_bcom;
> +	struct resource *res_bcom;
> +	void __iomem *regs;
>
>  	int rv;
>
>  	/* Inform user we're ok so far */
>  	printk(KERN_INFO "DMA: MPC52xx BestComm driver\n");
>
> +	/* Get, reserve & map io */
> +	regs = devm_platform_get_and_ioremap_resource(op, 0, &res_bcom);
> +	if (IS_ERR(regs))
> +		return PTR_ERR(regs);
> +
>  	/* Get the bestcomm node */
>  	of_node_get(op->dev.of_node);
>
> @@ -402,35 +407,13 @@ static int mpc52xx_bcom_probe(struct platform_device *op)
>  	/* Save the node */
>  	bcom_eng->ofnode = op->dev.of_node;
>
> -	/* Get, reserve & map io */
> -	if (of_address_to_resource(op->dev.of_node, 0, &res_bcom)) {
> -		printk(KERN_ERR DRIVER_NAME ": "
> -			"Can't get resource\n");
> -		rv = -EINVAL;
> -		goto error_sramclean;
> -	}
> -
> -	if (!request_mem_region(res_bcom.start, resource_size(&res_bcom),
> -				DRIVER_NAME)) {
> -		printk(KERN_ERR DRIVER_NAME ": "
> -			"Can't request registers region\n");
> -		rv = -EBUSY;
> -		goto error_sramclean;
> -	}
> -
> -	bcom_eng->regs_base = res_bcom.start;
> -	bcom_eng->regs = ioremap(res_bcom.start, sizeof(struct mpc52xx_sdma));
> -	if (!bcom_eng->regs) {
> -		printk(KERN_ERR DRIVER_NAME ": "
> -			"Can't map registers\n");
> -		rv = -ENOMEM;
> -		goto error_release;
> -	}
> +	bcom_eng->regs = regs;
> +	bcom_eng->regs_base = res_bcom->start;
>
>  	/* Now, do the real init */
>  	rv = bcom_engine_init();
>  	if (rv)
> -		goto error_unmap;
> +		goto error_sramclean;
>
>  	/* Done ! */
>  	printk(KERN_INFO "DMA: MPC52xx BestComm engine @%08lx ok !\n",
> @@ -439,10 +422,6 @@ static int mpc52xx_bcom_probe(struct platform_device *op)
>  	return 0;
>
>  	/* Error path */
> -error_unmap:
> -	iounmap(bcom_eng->regs);
> -error_release:
> -	release_mem_region(res_bcom.start, sizeof(struct mpc52xx_sdma));
>  error_sramclean:
>  	kfree(bcom_eng);
>  	bcom_sram_cleanup();
> @@ -463,10 +442,6 @@ static void mpc52xx_bcom_remove(struct platform_device *op)
>  	/* Cleanup SRAM */
>  	bcom_sram_cleanup();
>
> -	/* Release regs */
> -	iounmap(bcom_eng->regs);
> -	release_mem_region(bcom_eng->regs_base, sizeof(struct mpc52xx_sdma));
> -
>  	/* Release the node */
>  	of_node_put(bcom_eng->ofnode);
>
> --
> 2.55.0
>
