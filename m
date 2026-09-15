Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013048.outbound.protection.outlook.com [52.101.83.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32CC93195FA;
	Tue, 15 Sep 2026 14:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789483584; cv=fail; b=gBcC6/DEAvjPUhTVhzblkGWtTQICpZb6Zf3lHKipdJkmyDdlm/m9MpLYjW/P4VfAlDjcFYRvu1D5u/TaKWSGIgmAtQmqfJl3eaFLmNVwQjjSXNp7Hda8jOOmKa+3xXAC2jaQ7d7ZD+1wocnN1xJhvIWD3GMI7BX4dBLkxBm1Ung=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789483584; c=relaxed/simple;
	bh=mC2tTkK+z0lFTIxK7IWdm4AhIuBTkH350vV1I1deYR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eVLuxF+Lhnfvv+0P/fwsGsJE008tDSTEhk1EbzfbANYmMeufWTyOqbVzWrThFUSQFY7OqSd+Co+HjO0QbwrgGbFEefCQ2qhUBLyaA7yh+szhCKbPu4tSO5Z95+Cu8B8vtCcTaUkYpxwzo1iYI4vxCcfX8S4hOPssPGBVND+rSyQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=BuA6kyRt; arc=fail smtp.client-ip=52.101.83.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="BuA6kyRt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x1K6POzg6x7ajm0bcEmNEoZ8dzOpXnzS72EJgYBuOajemLL/B+lzBFoTy1YnfNc3MB411IpZ50AE4kHpxxvKlNZ3WAf8CzMPjBhJd6RMJTpB+ezMz6mt9gbBBPtjAolEIJFSWFF+JfbDR0lTdYjMc0imQmmliwTZ2nK7WCeUV4U7bQXjAf1dg0zx5drU/HYUjfNTe4AUT7jhKr2BJvXzIT4SKxSBlcoyV/5zYZttcv79z6u9EtRhRyX4qSs+c3QYHRPpOsTtTVmRboJ1Uo1u813C+YnlhWbvJRegR2nCD34dooHTF6Fflr79DtkF0kkdVf6ksIyP8J5nE4653n6l5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A/F4Xnyyq8TBrl+1kzD/YlDimhns9lbgTo2YXkSaL4Y=;
 b=PCupqB6ghWLJOdt9Wo3pgmBZPILjc2J8ADOOobhjcxebX3OwSEggRJXj2qqEOlcgsIfq6tQigO8nsjmmKriU+iS9DEtLIz2Ck8fdc+bxWpoA0xEwnuYFga/9JoeUt6/lJG9K4cHRfOOX/7XruUdKRYTCcSj90fwa06pU0uRjA0FVXPYDUeE96JoKBqxHRKsFzvCqaPulSoD6Ci+RMx/ebH/XLNL8qiC77fw+bqhnhig27v+M9vmvB5m3xoA5TVMg5DEvtkbxEWI3KH9ZmsfCuPensHmz4QqhyCIo/h2OHkpr86qZe6YoEW2xciTkRtG2fYDq5NSqAOgIUStCBVqPWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A/F4Xnyyq8TBrl+1kzD/YlDimhns9lbgTo2YXkSaL4Y=;
 b=BuA6kyRt892HVQVQrWjj1m6vbhR76rkaHLskyZJmMgf8nmF+VXfIm7WXR9rN+dQE4DJanqWeUhsMvexS9qSQbNdxw38GiUdvzg3sLpVSIPL664Aaf0h+tdQ7rE2DK9aLZrWhF0WTtYZ5c07STh1jBjjYxC7OqyTtyG7Eu5tcZxvaurYQoH9k9Ghdfq/nMiGX6BZxZ1gG2d3j/k8G/RFfE6Ec0azMIrud3P35U+CG1r02exjNZ45FQpZRmC8x0rXZK/1grD1xG/C2BgVxq+5RRCfHtJ+ffKsiYeJhSgeK7h5o3XfPsxjKhBNORsL8lhnJRzE5idYwM39F44f2LjGuEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB10826.eurprd04.prod.outlook.com (2603:10a6:150:226::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.13; Tue, 15 Sep
 2026 14:46:10 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.012; Tue, 15 Sep 2026
 14:46:10 +0000
Date: Tue, 15 Sep 2026 09:46:02 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv5] dmaengine: bestcomm: use
 devm_platform_get_and_ioremap_resource() to simplify code
Message-ID: <aqlaKlizK1JTh_sT@SMW015318>
References: <20260915072853.58587-1-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915072853.58587-1-rosenp@gmail.com>
X-ClientProxiedBy: CYZPR17CA0013.namprd17.prod.outlook.com
 (2603:10b6:930:8c::14) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB10826:EE_
X-MS-Office365-Filtering-Correlation-Id: b76da700-db4b-4cb9-a5a6-08df133814cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|23010399003|376014|366016|10067099003|18002099003|11063799006|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info:
	URFr63YYXnASteiTIVUpSNzTa/j1w1mrsdS3NTpGrbBWVYpbbcUx/mvVZSPl4aLJjWKWIy8ltbhem69/Mz29V9MQm3FQgqjzK4TvTiSSSw317vR5EsCdVfXVx176pWP81STQjhuUFWihj7mWi0w14dfKSLlqJBQxdHOgc5pnySkfDt3DiOdq+/T0t3/oLWt/YMY+R1PJ9yM2m8j//X9lBytsIL274MOEeIOTlxSrbzByuL9StQT5kfd9YOUh1DckkVzUlahw2sGd2DhIyVd53XQeNSd1VqYyQiC1eG0+V5OXzXZer/sOU0Ja7nfwZJzQDJ0hTO1pWDjZw/iu4J8nVu4p8lfUbbo4Y0o04c7Y2lHNvOVFUt92NTmP1T/hv4lYzsi4+0ZxByU9RaeRr9q9gLgJ242USOhlBcl1xsHt2RKI103n43wYVkj3weMfNqbXtAHOnQSB3jBH1zqYXERFV02WQ4qTcuX1vngKnhXe5i9U1igwc8sinmqzb+whNoOOenOZlYeqcFpwYMWm/fAKPYDvypQMoXyKgFYhGlIFVBkC+4CyapCrqaxiwzm8DkTNfE4Wdh4LwanPROq4IGSYnclw96f/cRiooijEgV8kFWG8NCe1MJUPjCuTDYKJmCpnUCkuVpI+PRJzgCyBJUpWEvnGHvGlm5LWgzHRhk5dLHw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(23010399003)(376014)(366016)(10067099003)(18002099003)(11063799006)(56012099006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UKcjvRN3sDoXd/Uft+TOd8MAasiKoxiECoH6bVJMCFy5O8GD+kJqjP49+XC5?=
 =?us-ascii?Q?h7JbJXXgnNQd4bdEDdw6Ynnz/N2LQvw5M6rO6xayL3hBHm/Z+EPJ4fO/eG6Q?=
 =?us-ascii?Q?yKF1FyAUtVHioIkH+zVfklvn/L8SgkPsK7LMdwEzKu1iuGW0vgquufehFfSD?=
 =?us-ascii?Q?lGyrfJazlKIFafuLk4lQydL5bKW1xVNGtALxUun+ZxatnV1OMhjFjUP1e1mN?=
 =?us-ascii?Q?jdORDhYeYNRjsnuq9DC7GMsw3+Hu9Nd4f6y31U1stQlzTDIygQ7agwtRrBP9?=
 =?us-ascii?Q?R/m5FxMexCrqeT0l8WOamsfWzRkhRVHINdML9aI5q78ou61ZEOHSubNCeWK1?=
 =?us-ascii?Q?CTf1lmfKZcdYVrluYTD3IB78jpbx0QqIgIe2hLqwtMd9M6dszP8X6TqJN7LR?=
 =?us-ascii?Q?1GAfkjAkswqwqBLU7fkrG9GBKm4YOuToHHgFtGWS7vViC0H+jpQOsuclV/Zs?=
 =?us-ascii?Q?0zwEYlKUwPIBuaO3G/4yS1v9lUUDrOVJc8Csec1FFYX0meTzO3qisPsiO7/w?=
 =?us-ascii?Q?JQwu9DF0Tz1i0DUyBwXSjBx0xIDiEgwbQ+HUfTuSFnAsERYq1gW4pL5hKDGb?=
 =?us-ascii?Q?1lJv8mN2cxcTXOBJFKWVxCpfIOZlJi0L35MvBNfWH6UaMYIIcRMmWfB2FT9Y?=
 =?us-ascii?Q?9xNRxvS9maj9VKnVUBbrCPGlKNXdkp0w6FwKhH7higxlq0fv/rCGVQdYFNIT?=
 =?us-ascii?Q?MIPNbm6Uf2WTDR/8gvnrlp6A942L/gQVqdrpE5WbBbGpmaicGyUAR3aEgrBo?=
 =?us-ascii?Q?Hn42cogL74WP3XMdmMJxXA8QIWHbTNx0FSHPFzNZV/mERoZjqm1pd9nrNZR6?=
 =?us-ascii?Q?COZfYl0kIOuvo5394B0EZ5sR2T9FIQ4fVhnme/xgV/uYsbpRjMHCgJ0gHR83?=
 =?us-ascii?Q?q54FPkNaxLeGLiBDx7R/jbhC6ti89/ev4SBqj7dKVBoqhNFn/8auQ/EvHPI5?=
 =?us-ascii?Q?j57CIyyJD414gKdV4H1+JoBYYpqJHk/hnZvazzif86aDibxwA5D8Ptjb+QZK?=
 =?us-ascii?Q?BevC8yQ4YCra4Y7mXv3evNqbpYTK0tWpTebnkvlCKHloU0QcKLVDGbOGUo7w?=
 =?us-ascii?Q?twGcQXwFr4bprb+tArKRqYPloDpQemYTydBU8YXgY8IMqUv314Ncv+KZQcfn?=
 =?us-ascii?Q?nUnUWBaOp/c966BBUEJRF/KI66d+KEp8NjX9NtapwDYdApvrM+Pa2dlLeVVo?=
 =?us-ascii?Q?7otj0EFocclYcUKC2WiJxzC+y0g8n2tejzmO6DziA1LZkuF9s8NktOE+M5/g?=
 =?us-ascii?Q?jefBjsQeQyKBVWi1+anGNswxgDz3iF8lZJk/FYXFis2MQmxGlie5LodFGaNb?=
 =?us-ascii?Q?r9I5gHZHRbKbCiKomnmflO9TpMO5I3/F8ZQK1jY1lum61/C5LgKaWZZtSvHK?=
 =?us-ascii?Q?PCtFeCZcjK2Zx6ykepDHSE8P89Qun/qj2P2LxfgqEce4reUMBtqtqrvSc7X4?=
 =?us-ascii?Q?cUqSa6fqCckgPEATNbLmzBBBehYmRdSV+uGC5IJR7X0B3BDb9dqdlkl0/ipk?=
 =?us-ascii?Q?BA4lU17uODXJy7QOldjpyhTOVbdDvJCkeCFoMu7uQ/OH01Bwzc1zu8t2SMl8?=
 =?us-ascii?Q?SLNBuKzx03pAYpdqVRe410Z1lw7SxWZv6MT4G/fqDb0/UqW89M77FUI5tZDA?=
 =?us-ascii?Q?gC4bJBPcVMdVCRkXlHMImpfvqzADY5JQVnvcfQDMIq27tFgOh9q1b6mdu28H?=
 =?us-ascii?Q?dSPeDJeFppDoK6gYNJvLN6epoc+8fp0S9EzYbVYq9B5LKFA9GrxJszfo4QrK?=
 =?us-ascii?Q?zuRzRaGChi0PTf99GZE/71PyiCqJgAMZuNpdzk53aeTuTMVGuZ8N?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b76da700-db4b-4cb9-a5a6-08df133814cf
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 14:46:10.3028
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VsAF3jW5qeqhmLjwN4pHLAPLe63VCBost0LzzI1kmnMXeW6q7AiBiu8IhPTZbpSqNUysiBf93uhz3oXQEhql4KCPhbP1yGJWy4m8xqJp5aRpiQ1e8uNPZMelBUJdd/KP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10826

On Tue, Sep 15, 2026 at 12:28:53AM -0700, Rosen Penev wrote:
> Replace the open-coded resource lookup, request_mem_region, ioremap and
> the manual iounmap/release_mem_region cleanup in probe/remove with the
> managed devm_platform_get_and_ioremap_resource() helper. This removes the
> now-unused error-unmap/release paths and simplifies probing.
>
> Fix a resource size mismatch between allocating and freeing where
> request_mem_region() and release_mem_region() hopefully use the same size
> but is not guarenteed.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  v5: resend with PATCHv5 this time.
>  v4: fix subject
>  v3: reword again
>  v2: remove Sashiko generated description. Reword description.
>  drivers/dma/bestcomm/bestcomm.c | 45 ++++++++-------------------------
>  1 file changed, 10 insertions(+), 35 deletions(-)
>
> diff --git a/drivers/dma/bestcomm/bestcomm.c b/drivers/dma/bestcomm/bestcomm.c
> index ec58d2c6573f..241a91936fe8 100644
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
>  	bcom_eng = NULL;
> @@ -464,10 +443,6 @@ static void mpc52xx_bcom_remove(struct platform_device *op)
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
