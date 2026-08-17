Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011044.outbound.protection.outlook.com [40.107.130.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B52F190462;
	Mon, 17 Aug 2026 21:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787002694; cv=fail; b=rKhBndDE5B17z+r3Su1vOKFlI7/ZZqDRAM8xVqbPDqshykfQCKKkbMO92GGgDweEmrxjsVhe/dhPv+di6euc1uYPBw6ulFNx5fYUezOEpP4331Azv4uZdPTIOkJT0swJFePcOMGukOBgBtuZzT1n9wCFqoeMTG0+uThNd+jdquI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787002694; c=relaxed/simple;
	bh=fA/EuG+Jwi4BIsho506fxp0ueGwXiInrEo+6tsGsy6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ltR7IUQ4VILHsVo/CQlF+Siwvaeh7AD0drhgUArSCysT6j0IS8QzjEQnofa9stwdzyPse67JUO3M6aRT4L1S9Cfxy/r+pEkYwcIC31uDczz+LPzHGq0a3k2gSAJYIxrjaRiX93XsPiY054r5jXaGaKkZo2ymilOafDOlDNrLNkA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=lK0e5Oj1; arc=fail smtp.client-ip=40.107.130.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="lK0e5Oj1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HOpm2FNc3A86oFWlmdXxwMO/ywPBIDes98uXRf6kQzH4piLNNNqDBWSm551irkJtikoku8nmi744uyYvfcaIEfDfu3A1+w0Vwa7jRKTOZeYOZhBhQ18SGi7/dnrs61K6fbHOPJgwPYkUZUsyCrhZ2RlxMTW3yiJ/MB/YXXk3y/MPQqPN91rAibnhHivgEh74yPEyVGngUP0pLyR88W8Jlmt3kLtZH7f3VewaB9e8v70YyM0Nhx3/EMNh/hIkd+7lMGiNS+w9Zlj/mOi3oLIbNeM4yqvCQAdZNve5WluWwbGSK+4oxrvCoCgLrSQ4KUUoWE62oyAM0LqT2ZoNoYBvpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tl6qZluDNVD0XJHBfRo/3IHu/mfCL6sV0OHSIRwpFco=;
 b=NH+r/sTcUMExIxFIRjzOlMB7IaYS+xMG5LXBjq2bLrub2DK2TK01jxAl8CFVFpzsl2X+SWELFk6vtoujqsxFJVlDniNuNBfsWxYzGde2kplVVYVXuhTpJFqJHLWtBdWsNTJo1bKvCwykPGj8g4pkpaiurEB0rS0nnbU1BI6pl89Jh/rrjQC7XElQJOh8cOwE92JZRNfrkFRUw6xH+N6/JpLL4Mlx00A9blUt/62bWLTDhKi2iygVJFKQC1T/EkUKW2+VDTGBVRdudFq33MyG3rxfHhD1bizqAZ7T94vq9X8GL4KyF41pKoHyIQiDkhPpSdNp9/tPkvrBhd8/cvWluQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tl6qZluDNVD0XJHBfRo/3IHu/mfCL6sV0OHSIRwpFco=;
 b=lK0e5Oj1y5LOZIhWFELjbosQw4HuymxQsn//jldnI598Azotkf6S72ho9miqYMI8qTE74mmmKrx7DNRaOo6rwFeHAAQ3y4kX3sHlaz6BJI+KKwBjT5nw6lCgafDTD9mu6usfZN16eBF1XpYErM5VNKwyD+64LQFhjvA/f1/DqSCMcEcf6snNd2Ddqz3iUrmcTuexewU6dWr1VhJbMQpcwgvzCR5GhJ5R1P6r2mHoHIInUyf2GB1z0eCewfrd3UchvuJ9ROwRTBoHSCf5D5D7vZac+CYtfQcTfU52Nnnm2zfhgJEzgrrViEKLwYvniJ54XqgLHaZbO4fQofQ58E9dHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI2PR04MB10954.eurprd04.prod.outlook.com (2603:10a6:800:278::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 21:38:07 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 21:38:07 +0000
Date: Mon, 17 Aug 2026 16:37:57 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	"moderated list:MICROCHIP AT91 DMA DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv3] dmaengine: at_hdmac: use devm APIs in probe()
Message-ID: <aoN_NUzODjRb-IDd@SMW015318>
References: <20260817201200.10952-1-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817201200.10952-1-rosenp@gmail.com>
X-ClientProxiedBy: PH8P220CA0057.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:2d9::17) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI2PR04MB10954:EE_
X-MS-Office365-Filtering-Correlation-Id: c08ca25a-0694-4f5c-ce2e-08defca7d3b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|19092799006|1800799024|366016|18002099003|22082099003|56012099006|6133799003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	h+GiEe79FwvY5ytOKuAyp2wLEAnXx+BfihYPL6XlXT4QAwb5Hn3iQiskHqvWf5jpHdngiXY4P4pcGpwl9v80m5ljONFlHebqcUhbU1Fa17DXWQ8Sp6+c5j+RNoueamXHAzdx3gBkD4So56z+MiyCTkrExtuHmLY1bMOCuLM78lXM/aAW7dq1e6Dnpv/GleMpaKGv2NJrIgDMYZGaNozN7fNG+knpG3QOtFrQZ22XJ6/8f18ViS8W7sL+v0SnQw9k3inTCeFgXMzmXga5yqTdtF2Vk/AWeIaKD43vfwfVp8uqkMHTkUpeyZXQ1EWL4UK5uCamAuPUVx5ugPqgSipQy73EEAUBgFV0MV4zVXGRxFUas1rYFoV3NR+Ro0B3eTJRgTnatfdtK9V9bVqzELzJPIjljIR0i/zTaiscWz10pO2rDn/nyzMN7zbdkYx7ZPijQdRfjfHPFbAZsguVYPgHFnZesJxesYXOrtxdLfSfC8NNBpq8HHGITxFy+4YB102mUK+0SF7ZqRhnws6PTsv7F91mWQoPmUueBVTidritkBg8bcU/K825vX2duMgBfuHulQPguj/gQZEvMrA4Krz+0tkBuMDE+CZ9Y2CJqv4TzDnpkz3/VO1ybXkra4m5t9Q6T7vs5pQhIKlhgkEDMsU7w8At475xlhxAAub0SxgpRyg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(19092799006)(1800799024)(366016)(18002099003)(22082099003)(56012099006)(6133799003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NdQOzG6hncNl7lhvfc6GDwuN3w/o2z9VSfmU9wb90a7FZF5TVsdgob9LDfIm?=
 =?us-ascii?Q?p3uaWtMG+tOHQO/6fOF8/9FQJb8K1+a177xeO/Sx621OS9QH4VI9uL+cUPsd?=
 =?us-ascii?Q?KXSwMdo5QMDCddI+Kki/LOm0BxRsZd6h1Nb3xIK9vTtL06gg3d3swFLI2D9i?=
 =?us-ascii?Q?+VLqlCObkxU12QDXrDboYtHBWk7TP006XNqwyhEsGRfAujiTDNvGV7p6oYYH?=
 =?us-ascii?Q?njfYcfXXdaUVXLptqMK2QdB5aQJhyyfp0HiE9AzpP/L8oFD3+2kS10xMMbMN?=
 =?us-ascii?Q?LnpXizBEwIaXInWrcsCB9qP0FdDXaiki5R40Rqga/9K8/cs17VEvLL0r5iDy?=
 =?us-ascii?Q?1zEZkl4jyPg6JXCk0ZZZueomUyyCJdGjMXUqn/tBsiJET0nVVw3UHHSK/NhO?=
 =?us-ascii?Q?pVXNc+jYN8jZh4C4+ZNX4XF96fk9xVMZOEa7U/uofRJXaP/lhtnoE+Pn6Ihy?=
 =?us-ascii?Q?amweB88UHARV5rT7l1CCQDrg0NI2Ij2bBZ73NK0pzyK4mGKs7/1Id0vZolRf?=
 =?us-ascii?Q?K14Sq3qcryDNelAhR5IOqLqdZ6W+SRdFg3KhQgVCAXynZHvmYQNjIAviFQLT?=
 =?us-ascii?Q?/pVnsMUEUTIoqOMHprwnxqryOIRvR64pQUgq4lCijHXqdWtQS/5qgoMfaBhf?=
 =?us-ascii?Q?yYurr/zmR03ZGwpQvBodF6FroJJK72QX9NJBxZva18sjTSUtjZQwaDnExEHS?=
 =?us-ascii?Q?7LYq4eS7Gj7SKCGs4LAQoycyNc9iXzBzlAdiiRgTakw7sVkfaVEEQSR127AL?=
 =?us-ascii?Q?N8vH0xdxz2SLCE2RG/XKyeNP/i/1s03lCYmY+cPT5gwypXDaPHPfcK67iWbp?=
 =?us-ascii?Q?5qutzHBKMozRvOTVzdroakVvLR0AgJb+QYShsEzjAC1Dx/s9oxIZKkwAYsYK?=
 =?us-ascii?Q?Bx8aumbySl023fKlep3eGXxEpghv7xOiQO7dTGDppfhXEw9T5KmtE88cToc5?=
 =?us-ascii?Q?pxUGK9UeRrRB7X9IKRI9XW2sBOlzZ6J75QF7KeAPWBfpyZRwlEQaNVOO+8S3?=
 =?us-ascii?Q?nvaknDMEQ94ILYlac7Uv4UUqFKG5v6q1hVmwuH5RjoKpMiqFXN2Tw84CJvM8?=
 =?us-ascii?Q?PuaucCWv/TvHPl6SNOV/6tLSGav33P7X5m9rtGSEB2+OSdHCNE/JIlY3E8LZ?=
 =?us-ascii?Q?tANxbsoFodozX4kC2+j89psrWtV3W1PAjq/p744huvHC/F/8Y4afDaoica+h?=
 =?us-ascii?Q?z+xXDD9s7PHF+t7ne9xCSHgSDZ3L2KSOnM4YoBeuy6iveoiJFC9HOeKB7Fak?=
 =?us-ascii?Q?QLUG41PTAm4rF7Pyo+L7FI0vHpac6VqAR8HykcdRJXe8WRBlbOfOm5aqo2um?=
 =?us-ascii?Q?0CsgDFuHgJ+Re7ZbAyqcU968BGenrQoAvKdK2ukZQdos4OYoeyl4aIhTRK53?=
 =?us-ascii?Q?kFFvdKTn15w8fJPktQbCHodb/WeBIlyKlyD5wX0VsiU4cP7dGjsm7vfBplS+?=
 =?us-ascii?Q?ouMmGcvdf3GsdtagICsUqFfkkcBjGNK/zlkVFVUtPY0ddqkn9DfZEbhJUDTm?=
 =?us-ascii?Q?xdV3tHLKc9ym7UElKat/lwX74vxq4/0r5Y+5sWsfeghJFlGoWhYuAp1HNFMF?=
 =?us-ascii?Q?d2xC3fP2KcF/rMe5i+AXOM3pFnQfPFCyEbje6ndd9ITCT+ahcB44SlHxawN0?=
 =?us-ascii?Q?7PXnyrPglvHGV4cqy9abcKiwBgf5zquxU2bfE7uA3fDRvW3/JMi5VLePrQ5P?=
 =?us-ascii?Q?T+6qwRPOUjmeK2z+ED3EdbYOzrIGcvaOEojf4J3i7uhyv28S4LLRU7keO6aM?=
 =?us-ascii?Q?NbUlhJYyCoQ1BexXtwlobWWVNAvMDFHqdqr/34c4HDZggvrNBB2y?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c08ca25a-0694-4f5c-ce2e-08defca7d3b7
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 21:38:07.7723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eW4Zz6zFAXlc0jZ+V448F8mXORMRtvsnZtrgXY7XfT8/aMyajTGmmzWsRiCvRZdQGhGVjFaYvdZNltY/9qW9mTWhRpIaKmIUQrz9jimmY7whhA3IQhsj2FoAYRXdhn2k
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10954

On Mon, Aug 17, 2026 at 01:12:00PM -0700, Rosen Penev wrote:
> Convert resource allocation and setup in probe() to use devm-managed APIs.
> Simplify the error handling path and removes explicit cleanup code.
>
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  v3: fix subject and description
>  v2: remove list_del
>  drivers/dma/at_hdmac.c | 50 ++++++++++--------------------------------
>  1 file changed, 11 insertions(+), 39 deletions(-)
>
> diff --git a/drivers/dma/at_hdmac.c b/drivers/dma/at_hdmac.c
> index 971f8bc9ec48..49a85ac66e83 100644
> --- a/drivers/dma/at_hdmac.c
> +++ b/drivers/dma/at_hdmac.c
> @@ -1986,40 +1986,34 @@ static int __init at_dma_probe(struct platform_device *pdev)
>  	atdma->dma_device.cap_mask = plat_dat->cap_mask;
>  	atdma->all_chan_mask = (1 << plat_dat->nr_channels) - 1;
>
> -	atdma->clk = devm_clk_get(&pdev->dev, "dma_clk");
> +	atdma->clk = devm_clk_get_enabled(&pdev->dev, "dma_clk");
>  	if (IS_ERR(atdma->clk))
>  		return PTR_ERR(atdma->clk);
>
> -	err = clk_prepare_enable(atdma->clk);
> -	if (err)
> -		return err;
> -
>  	/* force dma off, just in case */
>  	at_dma_off(atdma);
>
> -	err = request_irq(irq, at_dma_interrupt, 0, "at_hdmac", atdma);
> +	err = devm_request_irq(&pdev->dev, irq, at_dma_interrupt, 0, "at_hdmac", atdma);
>  	if (err)
> -		goto err_irq;
> +		return err;
>
>  	platform_set_drvdata(pdev, atdma);
>
>  	/* create a pool of consistent memory blocks for hardware descriptors */
> -	atdma->lli_pool = dma_pool_create("at_hdmac_lli_pool",
> +	atdma->lli_pool = dmam_pool_create("at_hdmac_lli_pool",
>  					  &pdev->dev, sizeof(struct at_lli),
>  					  4 /* word alignment */, 0);
>  	if (!atdma->lli_pool) {
>  		dev_err(&pdev->dev, "Unable to allocate DMA LLI descriptor pool\n");
> -		err = -ENOMEM;
> -		goto err_desc_pool_create;
> +		return -ENOMEM;
>  	}
>
>  	/* create a pool of consistent memory blocks for memset blocks */
> -	atdma->memset_pool = dma_pool_create("at_hdmac_memset_pool",
> +	atdma->memset_pool = dmam_pool_create("at_hdmac_memset_pool",
>  					     &pdev->dev, sizeof(int), 4, 0);
>  	if (!atdma->memset_pool) {
>  		dev_err(&pdev->dev, "No memory for memset dma pool\n");
> -		err = -ENOMEM;
> -		goto err_memset_pool_create;
> +		return -ENOMEM;
>  	}
>
>  	/* clear any pending interrupt */
> @@ -2086,10 +2080,10 @@ static int __init at_dma_probe(struct platform_device *pdev)
>  	  dma_has_cap(DMA_SLAVE, atdma->dma_device.cap_mask)  ? "slave " : "",
>  	  plat_dat->nr_channels);
>
> -	err = dma_async_device_register(&atdma->dma_device);
> +	err = dmaenginem_async_device_register(&atdma->dma_device);
>  	if (err) {
>  		dev_err(&pdev->dev, "Unable to register: %d.\n", err);
> -		goto err_dma_async_device_register;
> +		return err;
>  	}
>
>  	/*
> @@ -2098,27 +2092,15 @@ static int __init at_dma_probe(struct platform_device *pdev)
>  	 * dma_request_channel().
>  	 */
>  	if (pdev->dev.of_node) {
> -		err = of_dma_controller_register(pdev->dev.of_node,
> +		err = devm_of_dma_controller_register(&pdev->dev, pdev->dev.of_node,
>  						 at_dma_xlate, atdma);
>  		if (err) {
>  			dev_err(&pdev->dev, "could not register of_dma_controller\n");
> -			goto err_of_dma_controller_register;
> +			return err;
>  		}
>  	}
>
>  	return 0;
> -
> -err_of_dma_controller_register:
> -	dma_async_device_unregister(&atdma->dma_device);
> -err_dma_async_device_register:
> -	dma_pool_destroy(atdma->memset_pool);
> -err_memset_pool_create:
> -	dma_pool_destroy(atdma->lli_pool);
> -err_desc_pool_create:
> -	free_irq(platform_get_irq(pdev, 0), atdma);
> -err_irq:
> -	clk_disable_unprepare(atdma->clk);
> -	return err;
>  }
>
>  static void at_dma_remove(struct platform_device *pdev)
> @@ -2127,22 +2109,12 @@ static void at_dma_remove(struct platform_device *pdev)
>  	struct dma_chan		*chan, *_chan;
>
>  	at_dma_off(atdma);
> -	if (pdev->dev.of_node)
> -		of_dma_controller_free(pdev->dev.of_node);
> -	dma_async_device_unregister(&atdma->dma_device);
> -
> -	dma_pool_destroy(atdma->memset_pool);
> -	dma_pool_destroy(atdma->lli_pool);
> -	free_irq(platform_get_irq(pdev, 0), atdma);
>
>  	list_for_each_entry_safe(chan, _chan, &atdma->dma_device.channels,
>  			device_node) {
>  		/* Disable interrupts */
>  		atc_disable_chan_irq(atdma, chan->chan_id);
> -		list_del(&chan->device_node);
>  	}
> -
> -	clk_disable_unprepare(atdma->clk);
>  }
>
>  static void at_dma_shutdown(struct platform_device *pdev)
> --
> 2.55.0
>
