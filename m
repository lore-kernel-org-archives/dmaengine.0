Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010030.outbound.protection.outlook.com [52.101.69.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C0D352016;
	Wed,  9 Sep 2026 15:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788968962; cv=fail; b=uZ4P8qNL6cSbDP4n1ymiUQgbKFnWQkKEWnYfLIXUxitKhV6GK9buCdVL0KHfbBR1i2fu+iSp6iR5Ro7Qi6UNc9nb49LfntBINbM6W7wF+hLrwjZCG0VcWtiDbevpf4qKWcZ3Dc4siR37S0xxvXJNrGgWdSNqEm1J8DZ0AIsOEJA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788968962; c=relaxed/simple;
	bh=ld2IYOLXjXxjrn3qua+OKZkbYEARtEc6ArlAUzJiZQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=j9NLKbnzgh+7ncyOOmoqviBYEZD7U3bZuLRRSLgQfTn7VlDMcY4kwtQbxHZ8vXW+U+H62Tda0Xi/kEmeXvokD6TT72li7PFLGnmbSO7cOPVeI5cY6idNoEMnsO2ApXmWVUODFQJjdhmvoFqV5nqPIiWmU1F2nglVDAQDoYxeK94=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=My/+kXbL; arc=fail smtp.client-ip=52.101.69.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="My/+kXbL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iLHGUMbP6z7heOpvrVdIuUwJiVru3PrlJvf40/NTBerg1wuy4BB0PVrwY3P8N4CFrV9QOwm/glU/y2gblm98SUcQgOqVulgDd3fuphrmeM3zlGuY7WMpxjRVrQJBwDzr5RaaoaXfVPxU80JiRbeI9OCFhZPdELGrKpxZjVU5tQvSbAj0SVYVEscxFvBAefdr389FRDHAHY0DEpF5Onsk9HC83tprUefuvsoxQA6fuXsfVlDwaP5OVr3TCapZkXk5miVjcAZvKAh+reTvSZQYXPliK7Sn8rP3RlWv4n3d/zymChzjRRhmvYyx2b05KwU4LebJWgubY1dACrerpAM2NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ao/vFS1HYK2W99yrQ/bQamwYYTKB00s4Al2URtqQ5tY=;
 b=LDQ6WfY8F3PM+fssEe63B14yARHhJnI5Dxhcl/lfaemZNMae3mymJkdT5ltkMp26L9HiQu+OzSY9Sfuzv7jYvr15YOphCEi4Wt69uY9sytOLZl65AYVL8DrYDSeUaPoL/+qOLSQAtbx/Io0KJMWm/+5iWiZF0HTHVZsTKyeLWJ+FxvgNkeJhV2s/QHFY5OOvBHrPFkrS4JBpwCKNDIj1pHHY/7Zt4QIQcSD4rp7cPHtcyh10uoDgIipgN0UDsentm8v+WOTRE9Q0hYLlACNODxW5/sQBYjgWJYp9g0tvf9EjPZ7+31mce2qa3Wngbj/u7d/TWkxwodh4Ht6gf0GOEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ao/vFS1HYK2W99yrQ/bQamwYYTKB00s4Al2URtqQ5tY=;
 b=My/+kXbLRFF0jwSCqsEafW15Uo3BdLglCdOdi2F74xDA/wR64+UncVHHflmLU89lol44XkxuHQ24tTT2Nh0RiOpqaD9BYaw5ONo6UoN08t2GXkQFX0u8P9OubN8nVMzeHM31opN9LNCYjJ8Ds4LcR9NXUyIUf7lPZXelU/+Di1Y8Qojch28VZZRQXK7J/yWclIzo10vggpvyN+OH5Aoro1JscQDwRNdxYf/lubGbIAsUS7gAq5nRUnIwpjqlBGl6P+t4LS+2iWjB7KqiMdeI6Z1ThvcUw1Ni2dGFYZhq1jbxKlABNXnDPbeBfFB+O2h1Lb0UrLNEgFrLR/WH4sw0qg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AMBPR04MB217899.eurprd04.prod.outlook.com (2603:10a6:20b:7dc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Wed, 9 Sep
 2026 15:49:18 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 15:49:18 +0000
Date: Wed, 9 Sep 2026 10:49:10 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv3] dmaengine: bestcomm: ioremap early
Message-ID: <aqF_9tvVIE43hIKw@SMW015318>
References: <20260908213049.592138-1-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908213049.592138-1-rosenp@gmail.com>
X-ClientProxiedBy: CY5PR19CA0035.namprd19.prod.outlook.com
 (2603:10b6:930:1a::11) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AMBPR04MB217899:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fc9d21c-88a7-4cb7-6877-08df0e89e81b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|1800799024|23010399003|366016|11063799006|56012099006|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	NOFGIcDTnbuJvqQ8Ks3W4a2Zc028w/6J3ZE7R210/Qdnyr53fXuo23GXOnDL8nyT32TfMZYteOeuvNBItWRjbSOaul29WKsdXO7vPCY8QfV3SUZpqnhtvR96Cw1vNMNBNUkQp2ho8wqTaa8ErucEKwFCEXLnqWBAyjDBws9BKhl6tl8qqg4Bo6/4KNJDqON2TenuGBUel6SJ8H/mss4kRS3mLt2X8Fb25esgWg0HY+ebhqtZ1lH7DoRn+D/kVXVFCA6S0bevV+yghRUPFYQT/jmBT2cQAYFaEW37xvplizD+2APRg7Ua1U6jOamBm4+uWIZHKn3eYgEgWnXkiKzuRLnug64+s5Qmd7mcpGdSHq6X0bkAsQJVgc8BJbLfGcNYbqWQQHBbrbNXsuqBeSwA92H+SR3LewOJBoBhTNQrz+5K8TZv2e1tN9rbEZ/qyWpHf2lOIKU/ETRp02q/YISY7AiQx9rU5gs7lv1z2BbBNrsX93sc8XlzyjrWucSfFbC1WXB3PbU1tpZIHMeDyB7hc+6JBU+ePlMORQWiATUzXzVScaVoRIOggGRg3lRV4xO0W1SOEpa5f/Y2ehiD/BAqI5l5KVvWfaQd78DHLvqkj8lNj1PDchVvFHwcr81p75ndrIYLT1ut1Imk1u5OmiheJLKRuKhU7LhEi77E51QdceE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(1800799024)(23010399003)(366016)(11063799006)(56012099006)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GmJRI6MDU74U3969Y3EGg4XcDJuCZZSPtIfaBtjR8plEF5D7b3tQzDyD2ExE?=
 =?us-ascii?Q?OOFY3U5h1W/0M664JNP3+uCojIWvgztYULgkSz1vaAJdqvt3RhmF+0FlwjcZ?=
 =?us-ascii?Q?H/ZDCWIViKE3D3xdP/7RZyk/1EpNEZIt3ikkftJBwDLGiC+q1DAPCAs00yXF?=
 =?us-ascii?Q?0MpSf8Qi6hY/bDk7H5TRo1s2Zqps4D9rnNf89ZZ1CC1eIzP2zO8L2vwhBPj0?=
 =?us-ascii?Q?5u+U0wPerntnod6ATniy/s8Dsb6kSSaeBg22Idw2BbVvBdhfnLkMhDTdzVPb?=
 =?us-ascii?Q?8yBF6OAYwS2sKpfXNE22RGfkjTXxeJ2Ebkh0bHY5ghxoBGcJN1mI9nXyl7/I?=
 =?us-ascii?Q?QPi2wK0sUQZtW/wp8auODlRXkEo4EW46r1j0NuOCNezjT6+i9p+lhZTY9d1q?=
 =?us-ascii?Q?EOCcMJ6naBmd7NtLK+wgfRIcOxlQfSkQmhOBXNIgqjqZk/xEYkPBfvaEtOOM?=
 =?us-ascii?Q?e/OZVhnwd08Ou4CbQi7vJ8aeVUgjVRRgc/U8zXtjJujlWy5Wv3it6LsJelgs?=
 =?us-ascii?Q?wDS8rFIM9K0kddnC0955+9Cv0Sp6r5yckO+hnCvy24xHezIelvCSkEoGusMB?=
 =?us-ascii?Q?dh2cYWaaDJ1z2rmm5QOYY6CiXIz0OspDJDXA0roVSX0kr91P/U+6v3KsX3V2?=
 =?us-ascii?Q?rh0IrYvkpABv2SLmm1AY4y5HMRbWgfKg/nmNvZyw7w0xg7nvvLq8bSWbL5PC?=
 =?us-ascii?Q?Q2ZeWXSxsVPftUJi7Y94RxVGH8dJjRygo3uVFRk/frDN15TRmCa5XAQH79f1?=
 =?us-ascii?Q?t4A4aIFvpbQ38fO7ebJvWIGb4iyzk+lyFQIa5ZbNqHldX9097cdH7m/Napz7?=
 =?us-ascii?Q?qZSo0i6Nd29tCVu8K1/6Aamp9MkfAokoCVVY40caOiAgIeR/w46KvLn+sY9/?=
 =?us-ascii?Q?rHcK4aZDz1aKH7tE3anLZbuzk4IR+pYg5OR2Xfwiayau4qP4ij2bh9olUECj?=
 =?us-ascii?Q?zze2a/6IqZD6MJy7r7E9+h7stzt4Ukd4q7/0Ndz7mOwI4xj6L2EYjZQVEBB+?=
 =?us-ascii?Q?byonClTx9rA+V+skvr1OmVyw2TTuiPr2EjF/DQrGNPtCnsPWFR3q2myvti3z?=
 =?us-ascii?Q?zN7w7c7x0oyqEw/ZyLKgDoWPAhPkJIfKNgbTcOccW+xXDeLN8vai8wBIHki7?=
 =?us-ascii?Q?JrTPa+9TrcyhFDjQS9zU0+hbJ+3nzw7eeO3y6ywVIaaECKKJ4xZL9vXxjXbj?=
 =?us-ascii?Q?IYemKSbnSrEhCAVHcG1lQqUX5dwFJxsrmXTTp8hzNe3SEeq4211GO9QVVX+A?=
 =?us-ascii?Q?xQn0JUwibB1jZg4MXmBI1JYCG1wSK+t+YEs2dJaRnnlGlMFvFbLQyKSjbXVG?=
 =?us-ascii?Q?k3w2Ds9aFxMBKQiP4vYLdVlQuls8RQBE7RC77ZtYxZqj3YDg3r6iRTtesgwf?=
 =?us-ascii?Q?o+4Sb9IOpWeZJRNS5qZHxyBqQzbjYsMif0d+gnKnTMbzwPPvCHJTLR9EELK4?=
 =?us-ascii?Q?Y3EqjNpK5kA8QRfjLSQJYhlJh+moSaylGL9zlJizQ2t/mhRMu7oswMVJdThs?=
 =?us-ascii?Q?3Z4c9E/iIibnRg0y00LiaV9q2ht8LZxqVKAphZKfi1okXTGJ+0mxLyiLy0Ba?=
 =?us-ascii?Q?jctyRMW+Jb/i7A+DS6VOvdjIXO0cUmyUilYP1CtGTVAfJTs5v0bHGGNwu2DW?=
 =?us-ascii?Q?00KREM0ZJ7LoMdOjJ8HRhRfyg+nbEAKuucgEu+HfIU1uGx52+/n01pypnnm1?=
 =?us-ascii?Q?3ODwAftLTPkCv1mH9SEHImuSxWUoKnQI/kCbL5DM60Vq1Mroshn3KKMsJDBE?=
 =?us-ascii?Q?IGzItOW+cpiwERrAyj2XSisZkmwqCg50fU9WxosJmTXZvouH3kyv?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fc9d21c-88a7-4cb7-6877-08df0e89e81b
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 15:49:18.0379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kJLnPoZOihLn2mQ591dcDfROzAopGF/U7gJ2gcoJ2KjcL/d0Jen93H2qkWnJbhVO1cAVLK9g67BTyC6xGtpQ2od6GT5JuOO4fxvGEAsE5rIgfD0U/KHhFRD1Tr5Suljz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB217899

On Tue, Sep 08, 2026 at 02:30:49PM -0700, Rosen Penev wrote:
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
>  v3: reword again

Miss update subject:

dmaengine: bestcomm: use devm_platform_get_and_ioremap_resource() to simplify code

Frank
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
