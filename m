Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013043.outbound.protection.outlook.com [40.107.162.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AB44A2067;
	Thu, 24 Sep 2026 14:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790261932; cv=fail; b=iTSX+2hQd7Rf0V18woFHOhXny/gMFRaqQEkgS0zzmJGTbJ036JLjzKVZzUqUqEftPXTV+WXfHutEz+FsUyJvydsp4NpiZSrVNEyQrQgkR7XpSfsoSlCemswT1T88BLI0uIdhB/zQrmYaQFcMHRUQMEbCWTsoV8IuKgPHqfweM88=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790261932; c=relaxed/simple;
	bh=wXz4f5BSISa350FujX+mgfGTZ0jdDAi0ZQLRkSGZU/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=C1Gpj4Nwj1s4qVUbse7lkNsLvbSETLvWTzKR6IE+j/nn8r9e4fXzGrMLWIPG6WVxMj9iebXD+d4rXp+ANudpJg4jJoaQpgxDCzW7YY4N8qkZ2VPtIh4yvu1zXdQ0XcbwsP4xo7sqZ/q3uAUHnqVSukGT+GJ4jorlaWmR2aKWKN8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=VvxTLtIA; arc=fail smtp.client-ip=40.107.162.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="VvxTLtIA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PYBiZNEWmUy1OoK5S/Tp6yLm9SoGMcpATEDAW3og+tiozJ5FfPHyR6cUo4Qr6l8Cy+c5GRFtuC2GzGs2bun8GP5LkHIaRtWNFJmRmQaA7ldn4rS+RAhnVZy1CLKfJ/Wu/I6WXVjn8ck65OFt95pHgNg7MnkTEvocNqofeFqpMUH+Zh9QqwVlWg72YpaLS2VCbwmRqPBl4ryI5t+YzKEN8TrjLcUM73yCDN87g4TrXW0mf6afb6UCliDDU568oG9e/Yj+HfadE5/fjZljjr1oxtZBp19uxXJ8nKEp0Vq3spbx9aqe4VqxgOjgISeKWv1D6WMTlDJwWTggFGGmrb2AOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NpBucjrpGBUZfgvUCvSV/ZjaDdd4nQLLIEDXIx1hryQ=;
 b=wOa6OX+QyrJ7a0Xt/h5tCodCY0nXX6WIqhV2A17xXD0vcQmGu4ij/Y0Qkdd/acyImg+cKqX9/EJecN9nd6GpWmuFiBBIRME/gj8PQo29ChYDrCym58ZkYd/i4RFEPvOgAwFIwQ/YHF9o6Lg97Pe/xEnCzt0j10/+da1cJ7i4RULbwBTRV/uOxR6sa78ukdgaO5C4j+z5dF29lPijTNTnfCGI2GgJ7s1r3mrnqF09R6h5rXDBT3/DKO5myL2h9b/hLbbeyUVHbVIJ6kSAR8CgVQ2h7/kObiFkRLOZg/9+KA1QgQ7UxkNb5us6iCxP/2zowULTwManIyWPOgdIs3Rj3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NpBucjrpGBUZfgvUCvSV/ZjaDdd4nQLLIEDXIx1hryQ=;
 b=VvxTLtIAzcxa8S0O2SImnu0tPPReMlqbUhuLcfVgcz0OTvU+uf+7QsITG2wfJzuYBdBaORGEBElF92mpG/p9XBSX+wfucnnn9H7kz7Op+I3xnEjMrDNsKiq/IxlseRlaZeqvQsmNJF3KO0oxCN1zLYmqTOvCRv4hO9vkDf8vYlsw32dBpm7SAolV+7E/wXisGfdI/rR9jawV5jSfiAp50gd4ezdXd9e3UdcyTWavaAeg19mdiSy1NuuBFkgOIcBZtn3A91fr367yIZH5CvQi2Y1A1JREzM/HDKp7kmtLV/W+F1b7Ray14PksuTs6RTiw4ABoB+o+p9NYauQ8CE/0Qg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU4PR04MB10363.eurprd04.prod.outlook.com (2603:10a6:10:55f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 14:58:46 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 14:58:45 +0000
Date: Thu, 24 Sep 2026 09:58:38 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, phone-devel@vger.kernel.org,
	sashiko-bot@kernel.org
Subject: Re: [PATCH v6 09/23] dmaengine: ste_dma40: Init hardware before
 registration
Message-ID: <arU6nkO05PQVY0F4@SMW015318>
References: <20260924-dma40-fixes-v6-0-fdb6755020a2@kernel.org>
 <20260924-dma40-fixes-v6-9-fdb6755020a2@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924-dma40-fixes-v6-9-fdb6755020a2@kernel.org>
X-ClientProxiedBy: PH8PR22CA0016.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::9) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU4PR04MB10363:EE_
X-MS-Office365-Filtering-Correlation-Id: 62db28f4-3a00-4e56-5581-08df1a4c54fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|376014|366016|23010399003|6133799003|10067099003|22082099003|18002099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	FKaOBbX8vqtTnqs+R7zeDRnoScyc8oOzT8ShgxJ/KElo3VVCt37hezfdRGUpdIMNwp+tJQMskO6fLvaHCcbRUwhzpiLoLLSr0POeIIrKngiC5m078F3KTD55uRam//zblEslu4gH2OU4g6oOyiCFTzAqF/PhNXY/CLh61jRrj3iUGmkTnLaTiTirlTAZPGQ2udYEd3kcFerYk4nMFIG/cezsY8Bg0d8tqjkefWK4O1NAHweG/gJ6pbBmkRMFhA0rCxpiABLGfV7tS0D+XHIBdJXLbS79mkiIB7rnjAz3XOyPhTrL4Rw6axKXyXIVmLgiI0WV8THbxHTex7ANCRFlCwz3XiomHIqHrC8fm0IkyVyN7bjsr+yIrEtf6ebc0PkeWHYcpeXO5NZnzGBbmqIxxLlxz+1kYesHXw3Gc58GxsUWQyBdQTyS0GmkAfolNT0TixhM0+KLeYJGhaSzM9Zh/kTpMJE8X5a/L4ucW+nqyKt6DgGrcv+SHGRm9qTtNZ3UV/B8rimW3L47+lN8lvUa+pd0VnGocVUu7yjY4knIr/9fjkCin+6syD1KpY/HEkGouDFEkEa1EW0BJh8mrrkrdjuPLL5wmg1N+/u4MABkBm8fxRYCDh48aRRigfKUrBxn
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(366016)(23010399003)(6133799003)(10067099003)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Xv64iAI0guWglEdI9egtDhOm6dbCbbT0MeGjEjonP4UjpaKQMd0D4Y3CkgQz?=
 =?us-ascii?Q?zattlXfOJ7iaMbosKGArSQ6VgTm1A2n8f1ACrdTeB2iiwv0vzyC7fp/7Jh52?=
 =?us-ascii?Q?1914M96wGXzpxZv+2bmFs4TcJfRCGIXMLruIsqNaNQjuwJ1Ak9d64+7OYjZq?=
 =?us-ascii?Q?EgSOT1u1ImGIA7jZvk1tA2R9UQpuimInmAN7f41sLR3MXLwmwLN/EAljZT4V?=
 =?us-ascii?Q?tzoMAVxpsuQgJnxO+HiTsbHN8Zb9SzhWJfSqY1CXwnA8ek1FaydChdRVhhat?=
 =?us-ascii?Q?MYTiW33VCto4Fm+SGWh4JhkhPJ3RmxATPcc+Xo2oZlxx+++lgshOz2Znx5X1?=
 =?us-ascii?Q?rfIbBIFAF3Ad93oF7WvS4YZ8hvjiFc5zOj0M7B4+Q2tQ6PbYyhzwJJMG1CDi?=
 =?us-ascii?Q?Bz0MTaoUNpKRxJ1ftxVK8CADCfc0ycpbibE5diCdi9e+JLaTT/SJlG5GNQHT?=
 =?us-ascii?Q?Ihd81tYLPqn4Ew2luAhIvSHkSRwWUqNA1gxylZospZL3FGROus8Pp70BX6ta?=
 =?us-ascii?Q?vleJPGDJUso2GpvD+3BJazpH1p7BB0A14SwS2X4B4mnX/5rG1S/rpygoo/Tl?=
 =?us-ascii?Q?0BzT5QNKWMhOK3Fn1v0ofR8IrHHnwP8lP2BmGlfhizuc1ime+FcJbUl1wPhU?=
 =?us-ascii?Q?NN6bkuEWOZR72SgR6lMUkBzLSFiReK75qItQqp0072QEWjhpq4gTQ+U44C9C?=
 =?us-ascii?Q?DVWHQS3jPrlzB2eOAG6FU7lso9uVI7nRDCveGrCuKGpwIKgYoL38LbIoA5AG?=
 =?us-ascii?Q?oJkMo+anMKeJPh+6bAXAbXUbbyAFpjKe/yAIsrijPjmPo0psZ48L4tpcLFFG?=
 =?us-ascii?Q?81hKEolCPKap1uukMpX58O7/m/eV1/NrB+lxblXw1LAygyPe0kdN5Yuraqn3?=
 =?us-ascii?Q?VN5S390m8Dr+bX85cRvK4zAlCibG7EZPmByqXI5tX4I2fH/cnO8lyaFjKmP5?=
 =?us-ascii?Q?VUUwMtvJ8wKvPo+QqLpFQBmIrlQRQNNPQXK8EUMmv0ClOAZk/TH4YRYfVq3Q?=
 =?us-ascii?Q?DaGDnWRbLnyMh1/lBIKkafQtFqvDD/0T1bB1wkneZOoRyMhWyOuWQeJiwHFd?=
 =?us-ascii?Q?Du0YFaBW4CEESfGu3x0Y8F0nvQu5o3oPP3k0Fxs8v2Kqq2b9EZVWdW6fn9+u?=
 =?us-ascii?Q?2dTc+xWwxb4wEEY7cF/KXP2Urjq+T1mqOF+gj77NhCGgpjRBWh4hI6dnh3OR?=
 =?us-ascii?Q?F00jCJlO0nrMZPD3EqpsRt59DHE18J5orB4kEk8v0eI1QtwkIG7QJscpppVz?=
 =?us-ascii?Q?OaraLS/AMgROFvf6bZfDLupCPtBcNTgokce+dzFgj/2VDcZXk3JEVTGaIufd?=
 =?us-ascii?Q?yH/jtwU1CBGLG/DIk7CxG13fY6LPTDl5NutXqSFLeLqRqf3uA4SHGUw+XfK/?=
 =?us-ascii?Q?zKMMgn2mrimFPG+jG2ASF6VDiZoRj7+rhESs0Ktf+pFEBkObCjJwTq6WalZ4?=
 =?us-ascii?Q?N9tesWJD/hxcXw4bo7eaSvqcL2PPXQGLUr3+GMRzp3RxBr2WjgFRMnIrXmJe?=
 =?us-ascii?Q?H67SDgVkIXZ245wf/4FMmz4SxVs+g9MmjCnrPUhOUczPWDzm4ctxf3Vf+lUX?=
 =?us-ascii?Q?cjyPVEvl9qumVrhYYD+QhqTd9VertDGjjyOrPMR7wLsrXZeGAIDUmUXIWZOu?=
 =?us-ascii?Q?ySR87ax3QkDNZeaJQiuQZlOlKhE90o+tlFfZczhXSVx4U6Ja1cUx9S88QGnJ?=
 =?us-ascii?Q?t4O/AREU6869BHddRri7apBhRyLEFOzeK7KoR7GU874cYKNN2xyO6C7JkDCM?=
 =?us-ascii?Q?TzWQISyuH44iIyJ7ISrkaCDcfNxDCnHe3Le018bL+fLlhddM7bk1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62db28f4-3a00-4e56-5581-08df1a4c54fc
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 14:58:45.8566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uISFwCDEtFmS3wL1WlNHCFTfvZv40gQjw1ap9njhj4riWsC1/g9mkDW7hrdeDc7+v+Q2dz83nuhqwu0MeVbSiO6BbsCS5QEGuJV1CSkliilqTGBLeH75xXhwEZJsBdj0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10363

On Thu, Sep 24, 2026 at 10:35:21AM +0200, Linus Walleij wrote:
> d40_probe() enables the interrupt handler and registers DMAengine devices
> before calling d40_hw_init(). An interrupt pending from the bootloader can
> therefore reach the handler while the hardware interrupt state is not
> initialized and channel lookup entries are empty. The handler deliberately
> does not acknowledge an interrupt for an unknown channel, so a level IRQ
> can retrigger continuously.
>
> Request the IRQ with IRQF_NO_AUTOEN, then initialize the hardware and set
> the DMA segment limit. Enable the IRQ before registering DMAengine devices.
> This ensures the handler and clients only observe initialized hardware
> while still letting request_irq() fail before hardware interrupts are
> enabled.
>
> Fixes: 8d318a50b3d7 ("DMAENGINE: Support for ST-Ericssons DMA40 block v3")
> Reported-by: sashiko-bot@kernel.org
> Closes: https://lore.kernel.org/dmaengine/20260819225215.5EA2F1F000E9@smtp.kernel.org/
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  drivers/dma/ste_dma40.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index 271f653a15c4..85789ee7c0c9 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
> @@ -3838,19 +3838,21 @@ static int __init d40_probe(struct platform_device *pdev)
>  	}
>  	pm_runtime_use_autosuspend(base->dev);
>
> -	ret = request_irq(base->irq, d40_handle_interrupt, 0, D40_NAME, base);
> +	ret = request_irq(base->irq, d40_handle_interrupt, IRQF_NO_AUTOEN,
> +			  D40_NAME, base);
>  	if (ret) {
>  		d40_err(dev, "No IRQ defined\n");
>  		goto destroy_cache;
>  	}
>
> -	ret = d40_dmaengine_init(base, num_reserved_chans);
> -	if (ret)
> -		goto destroy_cache;
> -
>  	dma_set_max_seg_size(base->dev, STEDMA40_MAX_SEG_SIZE);
>
>  	d40_hw_init(base);
> +	enable_irq(base->irq);
> +
> +	ret = d40_dmaengine_init(base, num_reserved_chans);
> +	if (ret)
> +		goto destroy_cache;


why not request_irq() after d40_hw_init(), suppose dw40_hw_init() will
disable and clean all irqs.

Frank

>
>  	ret = of_dma_controller_register(np, d40_xlate, NULL);
>  	if (ret) {
>
> --
> 2.55.0
>
