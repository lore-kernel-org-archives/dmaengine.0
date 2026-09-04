Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013059.outbound.protection.outlook.com [52.101.83.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BAB73BE623;
	Fri,  4 Sep 2026 15:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788537032; cv=fail; b=gKUCTAw0LO3CkOVauU5mMwBqmYRto/+gXATxpFAkZbPgTnJOogWMqA6s9hIlrUBG5AF1xb4XOZcsmeHh2vEblKNXBJpIdFAUnlDpgvxkEUos5sD2roEsJQkLKz9jA9mzBHwtjYJfTYLbMv2xiglkYKJ/Mtoa71AG129kbYbIJMk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788537032; c=relaxed/simple;
	bh=Pqx1BdhBhs18RKtdCGSamKWStHUvCru14Dz52pF0okA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DbbS4phpdC1h9WhUlDa5nW6wqStHXCqckmuyJTz1GLFpSZQBTYlwDvdJWu3xbOJfoSz9+ayJyKYjAF3WWvtOlkjUGDvJE9A6I488jBc0rNrb7PGRIYtmIfNcvykam9C1KGeFAt2oeQV18ZS4gG9ogusrVabOZ45oNMjjAJIVKrU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=eGjjOJbB; arc=fail smtp.client-ip=52.101.83.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="eGjjOJbB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H1pcaBfCfcRqBPrpdA2S5y7CjbZMMxan/7lkyyNny3UzCS+X5UWkO0JaEVnTq7SrPPXtk3apDNllQch8W6myOTGbj40YZs4cxWk9ttXWYal6oE2TIZV0jFJZvF1sKSxrhLDmakLnnZmywXBRIOZCrTa7owDbcGzmNyuxfHuoJ4TD0zdLOZpF37wIZ0zOus1WczMTvtHtXXWwTMoTIswglimrZofwreh4q/lX4uX73MXFR46BUw4QPRthef1KbmydughJK841sEgyOm7BWoOQuzfNZ+eRE6GdBAtDGFlR7fXOfdIEg4ghP87bkLjqMoN/Xf/rF4pdOKrUoUSxPVDlzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nMwc1rfDY9fplLjE5z12ua6bQcqhII0HStNDIxiFOEo=;
 b=fwcwYEAQjdZxBi/5tstpriGWc0ja1EScGAQcKuVp/9oMMOyEgXC4jmSqrz+yXybRe1Qp93HvCkVfPtmdF8A93apZHDTQMgeOowLdKbtcvYLOGKLaUbcditfghNDHNCtqoUeuYhjNRaBxoE3kUc2p1T7nZIjKHND9EpWcEKDQucIXe9G5Dn8knAZgQZKrDjLbTYhFQKRE87lmU4QflPGVMNb6g4JfS/w4XVqxkb+UqyOgdNCGsrw8duDEXxcL4qE4oqGMAXDOVOnLJ0nTbnuPvkdNEMgBxhAlEQCf4yyxOVgIQOnSqJzpg2xHcflo5JBuy1JzgmGXt/GtbDYdYjYbEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nMwc1rfDY9fplLjE5z12ua6bQcqhII0HStNDIxiFOEo=;
 b=eGjjOJbBMSR6py4K5HlSg/hG2pZnKJHLeqZO4ifCWP1asBZCUrjlwSCi2irUsbIjOFXkPu+D4IAnVxIgiIE/PVZ66EiVsmAzNFOXg7SWvj8DWCfp8quOfTUtgq1yI9yU0zi1pyKlQk4dz0H2rYMjcs5YfAPqsrFOIwMVggEqspOxEY4YItSMn1jaJorGqN1AYw7ohrrwoTvSfZCw1cdltowKZxmPLeGUPJohDU3tuI/4AErZPnxH84SitVlOBK0zotfyJVUHYiM42uTVMfpgSzNsxKJTiEijHCH6Z/x+9lmktL6VNRO3xU9qw/AMru7wi5I9zNAH4i8FyMqZBljV3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VE1PR04MB7296.eurprd04.prod.outlook.com (2603:10a6:800:1aa::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 15:50:22 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 15:50:22 +0000
Date: Fri, 4 Sep 2026 10:50:15 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv2] dmaengine: bestcomm: ioremap early
Message-ID: <aprot0laCjaI3-Cr@SMW015318>
References: <20260902214612.311207-1-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902214612.311207-1-rosenp@gmail.com>
X-ClientProxiedBy: CY8PR12CA0014.namprd12.prod.outlook.com
 (2603:10b6:930:4e::16) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VE1PR04MB7296:EE_
X-MS-Office365-Filtering-Correlation-Id: 880f060f-1d89-456a-ad6c-08df0a9c3a8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|23010399003|1800799024|376014|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	gB/wlMReuhbFenrn7hnpC/59C41w0JPnmMMwKukIBYLks347HYZQXBRzDAzUmY3KcQWpzS4buQ5LzdJCeOoh1xWE8x0755ZgrRhRGPTCx+9tN3vr8wmyNZuOefFuerqz24ijZnWN33irE7WUrzEWNZwm5/lkm4pX85ab5MrYrch5VVZfTt+oM7nmV5eu2haL4eu0t7XFvPKcNnOXNtBeGKZvY2eAtcw5ejCsgqRQCJZ5drdNAnWqTWWmyLLqlOFngVUej35kLB5SEVbPCUqCcbfRgDZJ0qvUb+qQX8uxYEVMWjTcwToL+ulWrF0kAM6u1Ivcefzy0UXMG0IQhO95jC48s9/tkKXLog02snSE5MVMtuD0da/wACftMec8J3D1ciFyPU46kbLuSikDYgSnsRaa/sXt6Kj1BmPWbbT6WQUlBMpNE82swaQhFtTHq6CrzNnSJpp1POvIxteFV/B+aOA8dCy9vW7+nn8TcjvxP5gfVlfRfYLcR2evrJFJvi6CXBi1OXBVgku0gnZVb8RlO3OXZEy43ugCN5LZkFtijcRNq43Cyq/bEQNxyzl+uv6wIXeb4h9MJSQaLg69y6CGcYufQ2OfpBTrDEfnwGMA+yveqfUTwZl+voVLtiFMeND2b2W/NxecaKMOVCxbc2lZxxHsr982UncuiN92MHpakRA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(23010399003)(1800799024)(376014)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XFq1gm/CaKS3y5SpSJwPXs9i8GgcJPomFkEVlwRJ4dW9euHp+okwLTUxaLpA?=
 =?us-ascii?Q?gB3UVBfp1IiDHFV1Y9QtJHb1Za5/Mn1nJ0974uWHANiKy8F+WLf+741X/dRN?=
 =?us-ascii?Q?afWU2FHGz3I4y0EQRLEzmn4GYGJepT4pJwLyrliI++cmVgF/HlY+h+t1HBOU?=
 =?us-ascii?Q?ig50rQE3Nw2SFar+kkilO4JPkjnRqr8VOl8yx05i8RUkLk8b5k3iq2EVq9iZ?=
 =?us-ascii?Q?t0rO83O/Cq9YCttnuSzaBp+pqhToSXDqKdJe7b4yiqydeNUqZ1YU4LLAlCfk?=
 =?us-ascii?Q?MSFG/3DPksHVzla9gesk39SqE50CG2vwSLzxpHs3zn3rWy+q/ZI+9mM1U0WK?=
 =?us-ascii?Q?4RsnZJWSNHOTwtmq02dCdfNUQckF51cp7bCLINF8wDOrFyAalOtJMrQhCiUG?=
 =?us-ascii?Q?ZZrn8anCB1tI1vvHAJ9XB1yKdVhE+ZWXIzazqP/MSC6RvvN9P+lwSe3e9BS7?=
 =?us-ascii?Q?kYjbmEV4dkRGlgOiPz7VVRflKqBkndSLwRGAzHWNdMsO9PhCWnwPYnUv2CEW?=
 =?us-ascii?Q?463gLNOZsZOxDH25GGmllRrVa7V//aMW8cZd1U9iauXAVfvprybWxIwlo6tU?=
 =?us-ascii?Q?UdmtNxIc8UPFMHdFa6NTGsGjVJiEaSJ95InpX6h8A+PQrnJxPyWHMDayyWAl?=
 =?us-ascii?Q?hPGRra46hSwfaWsepa9C5rt0BaLh98i3N1QY4oI4KEBzUp5YvQGzLwPhm0it?=
 =?us-ascii?Q?v5Y/1L+5szs3jap1doWyO2brXaVLDgV4BE+5xWVexk9feWTnzuHSeimj7S6G?=
 =?us-ascii?Q?wkNPX59X2whoDM76c4xmlX63JW7BROgs9s7wa2quF+Hws6qSeyx3RnkUyg9w?=
 =?us-ascii?Q?kugHIx/YPWRaPSQXx9zIiZ+p7oWFb52e2SqVYX1QtiI0RG+koTNlCLtwXZkF?=
 =?us-ascii?Q?2rfHaLaISKS9ogq4dl/bGJ6Y66hDs6lHi8Sj7AXKSi2Z8/EDmzgkKidjgl5D?=
 =?us-ascii?Q?j0hyNPYmNVVQeRQhGdn/TWM4ZZAijH5Z48yubcAUnYA5Ns3bQt+ov1ba0hqo?=
 =?us-ascii?Q?nsnv4rMe3dZ4nmYPsmMUbDR/q9dPgenary0Q10RkF0p970Zx11y7BR5dy3V4?=
 =?us-ascii?Q?aVyCQZ4SFBFbwds2wqVIeiFsZkHMUC5ObXok8DEvQ/saN2nMXcVMMFYvWnnW?=
 =?us-ascii?Q?+gWMcHNM45ezODWuHDLrvw2phfC80p/PYXy6DryvjF4w44n8mPuA96hADg/v?=
 =?us-ascii?Q?PWmGkyn8IQuYvJodbWEwuvkqaj25SZVzFM9kbti4mUq3vQ4QSo/jJmlltAOe?=
 =?us-ascii?Q?TxkKbZwMJqnqkQ7Tx9KvRXQ3f5SP+EXZFJZLBPCnUvUBVtE/743wsC0stJHh?=
 =?us-ascii?Q?0ugpD3DMsG6CUrSg2LgjBZVbsJQMM7yT7tyJdN028JDIzQ5Hp7zV1tMR+rJT?=
 =?us-ascii?Q?33a3CLumGYVWZSAEjBevhCJKdJhMEeDZcwk23a1/WHWXz6/LEBWxIRKETNMC?=
 =?us-ascii?Q?Nq7U1sa6CKE8grqQ0vxkLE4BvTrHF/PMbwiXTv6wdMyGBChPJva/Q7g5lyNH?=
 =?us-ascii?Q?MGAW/ihwpm8Q72yskPqFmTrG4LwnlWu22ypPFgOGCtoOsbicNyQB/LOrjLQM?=
 =?us-ascii?Q?ypTKibzsNKYPgjWee92SpQeJNWd87jZYMRRg/h/NO64jcj0th2Tt6J4d+/0Q?=
 =?us-ascii?Q?I6+ZC9c55p2WyChkFu/k2JC8V2ZYKr0A1WpefQFD1sJFiVrMrH92x9YEoJnH?=
 =?us-ascii?Q?cqcr3X1MUlek7jub87TwhGk7WIFsFkaK54z+HcMqQt2mBqQonvvxtbXJZbt7?=
 =?us-ascii?Q?yKTte8W3968acyyId6QLjWPvU0kCmgPkhXxFuEQuGthSOG9ygfwT?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 880f060f-1d89-456a-ad6c-08df0a9c3a8c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 15:50:22.6374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6uMswrNoAzycazFPVWzmcXtCVnBiJd3TAHc5TbTbaQ+8FlzRYEWqqDQdrk032YaoKpp6wHe2U955ARk4xrOxvAFDQQPeIlYZ/R7mzbGTJt2jIuZrcwsnGlxxZJA6jUAr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7296

On Wed, Sep 02, 2026 at 02:46:12PM -0700, Rosen Penev wrote:

subject: dmaengine: bestcomm: use devm_platform_get_and_ioremap_resource() to simplify code

> ioremap early as devm_platform_get_and_ioremap_resource() only needs a
> platform_device pointer. Also avoid doing work before alllocating the main
>  struct.

needn't this paragraph.

>
> Replace the open-coded resource lookup, request_mem_region, ioremap and
> the manual iounmap/release_mem_region cleanup in probe/remove with the
> managed devm_platform_get_and_ioremap_resource() helper. This removes the
> now-unused error-unmap/release paths and simplifies probing.
>
> This also fixes a resource size mismatch between allocating and freeing

Fix a ...

Frank
> where request_mem_region() and release_mem_region() hopefully use the
> same size but is not guarenteed.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  v2: remove Sashiko generated description. Reword description.
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
