Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010056.outbound.protection.outlook.com [52.101.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB1B47ECEB;
	Thu,  6 Aug 2026 15:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786031316; cv=fail; b=GD8E8673i3el5D/CMQIHeTLe1CkwxO39g+Pfi80ECIZB8DkEakRmG7hSrn/CXM5p4t+R5v3YbeSIHCy15T4bojH6DWuhAlNYcKX10CsLowrKhqNpJP03tjNoRiO+oxzXjQ6382cidJ5S+vIV93q9YgqNHaOxSafjRoT7Tut37R8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786031316; c=relaxed/simple;
	bh=6nH641g0ENTXTvu8g8unyQCzwNMpL8TeKwytr5gOjWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=skLV1sqdXUIx0izaw7TkUa1xW7DvylGsJ/7IDaKBlAsm0qcAxXokSYjqi11siUjA7JY30XBYAidfi1BSbI8eLyPn/wGCuHzH5pZznTUW2+58wH8OlEpVC/HqAhuDyi2W//dZ05/yu813Z27/UsMVxE/5i6dm0SGB+LHktfaryNw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=oHkOehSw; arc=fail smtp.client-ip=52.101.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="oHkOehSw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pk6ViwXoPU9Ldry23tdyghMoflHAtfspXR/teV7nfujt84MOlrwHcyiFYvTtbl6k0H3bQu7sOK0dHBeQ5a12R0LfB7CnvMUIxCv2naKZ/KcCOYeMqsfB6SfDTtN7xLtypITx4OLfjaYhP4XNHo2ig14HE/DCGcpUesoBhgdLugWqc0QNOLxfBDCRw17dVXseiSXoPBajvYSlQN1uCt3i2eWbzDsu4KMOY7NK8EziBHWo/t+aEwaJQZgMlKOClF6zJKTwHKAcmB2bPOzYvxPfki/OPMhRySnsmlVD0UBb3Z0Sp2U92kv2P/txztfgCqMSl+31SoAH0G2yQmea9fAYFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qDpgqz9CdGF4cKUCu9JOfpVR03m1KG5vMrGoxljCfr8=;
 b=UHNtR61bSuAf8vJReS6Xn+RyFRvqb+Mob9y9F4cOr/gAKnCydCewbjAJgmxM0+3I1XxEfKz2tpR4WmtTg/HOJaFRZD1V9V8d7VbAkLxRIS1fZmhRTunWTcVyoNzN1pgi6nHvrDgONIl87R9FTTP3d+naYvUm576JMzfGciY1puKtX2vlYGkwooIDt/wtXeew4XIO5GgdnVCEzS1iIY7UGSkFPUCTk+w3DLupgmYtq71YYSyyctOtezgislk+IZK9d0J+UMrB7HRT2LtvflBnZpp0265AV/iMjX/ZprALqxDQmxbxDr3tNYVDChYTOLwpvlQv1hSNyqM8jp/K6xybMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qDpgqz9CdGF4cKUCu9JOfpVR03m1KG5vMrGoxljCfr8=;
 b=oHkOehSwYJ6ClHtnjTjfLBuqmyECx7HPNy7I+UK019RTvHAoexPcTydGjfJcE4ETbnJ5iWP7VPeuR8pgp4BGXz95RSq1HQ3W/KC6afiMVrk2lL1iTUxPO8whxd5c0srrkSIvxoApy48RJeLEWZbKrhiF/b0SJdIZrjUdvBrp+H7tTXx8HWH5v9TiPVs7GBJFLmxoGwrSy7262y5M5tECZ4r2qezHU4tWY38Oz5MIiPUfgjAORcVN+uJXuU7VPVYql5zkrqLQHaVh2Ixv1pv7TdLl1pZsLnvOtjcp85hdVjcKa39hIPcmPL0AiDNEYl2mKLVnVNFInjuBMxgSS13H0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV2PR04MB11833.eurprd04.prod.outlook.com (2603:10a6:150:2fc::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Thu, 6 Aug
 2026 15:48:25 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0292.018; Thu, 6 Aug 2026
 15:48:25 +0000
Date: Thu, 6 Aug 2026 10:48:16 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Golla Nagendra <nagendra.golla@amd.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, michal.simek@amd.com,
	robh@kernel.org, krzk+dt@kernel.org, radhey.shyam.pandey@amd.com,
	kees@kernel.org, sakari.ailus@linux.intel.com, yukuai3@huawei.com,
	git@amd.com, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] dmaengine: zynqmp_dma: Fix chan probe error handling
Message-ID: <anSswBAJJw3ssAKG@SMW015318>
References: <20260806123014.2120447-1-nagendra.golla@amd.com>
 <20260806123014.2120447-3-nagendra.golla@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806123014.2120447-3-nagendra.golla@amd.com>
X-ClientProxiedBy: SA1P222CA0003.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:22c::31) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV2PR04MB11833:EE_
X-MS-Office365-Filtering-Correlation-Id: 03e87ca9-67af-4a1c-d2e1-08def3d226d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|19092799006|366016|1800799024|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	XZ+8EPG8SBxwQik/xbzdMmS2iRUiK6GC4o9ONrUIa3oT1Ib63kKOCB9qEhCNuLh7yx2nikpJ8PqgcA5Xtv9IBhw2et2+hSBXxN8z4SWaOecVshj/5PFninlnA3iBE0SqZUhthwNSOesSc6QKbPZVkRwC9nz2z9oi1DbAsEWDqp00UTJLXbKYja1bUnf4eAb8OPt78V+kF0YOfopTsYTn6rWciIyHd68aLgh3PbGcI3dAO+9XRt82fPM3NIEbhENycLtBL9xwJ4e30X/pef1R4mxs1MeA08exX7NjaTxJONMwj099IVwHKZhCP9kvkOH5oKIJ66rPzSIKPv2gqyd2x84puJ/hAkl2bY8RHTjO73Igs+3Cwz2HE8slLelbOwhXRfGeT9oHkO7KFQeqCOfJ12umQkkyN/50J84dY4sp/sC/5TQhhfzKPrU794t72brXLxiO4NBR8MKQuK1tAERuFgcSQn4uxx0P5167TudjEg0w60N9wlv2unORc7nsfQeDuTebGcGgCClzoiYVz5H0HOut49cAUL6n27Sb0+zB4WXgw2dLFhwejpVLXhoR5jcnaj7mgxboPUFSmDTDxbFrF51wRlISCnAFctDrEfYaXdrHm5tCY5UdPM/9yBi0LFcU5LBfSU1Vd5EmzOmqQoOXaeg5rf+mN+4rBBd34dm8OVA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(19092799006)(366016)(1800799024)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ypQgl4Q32RJzc6nlLyLIKUWdnSXv1obJj1olCpNDFy7Ykr+r9fAA56Bnnx/n?=
 =?us-ascii?Q?ZBv14AkMgRFiKxj5XXdEe9XkVabhBeKYiR3C92UeaU5uUqRKpp9ruht9loNd?=
 =?us-ascii?Q?2E/fdn72I0qRXQ+8gntGffvL4faMHTaK+Mtu15OxCOD5EEbiStGwV8X+ptRi?=
 =?us-ascii?Q?s8J9Kigi5+8GiaxxM8G27pugr00yHpasaj34i0/CgATR305E66AAhYRftbTe?=
 =?us-ascii?Q?Z8KdjXfYBb+ojxxgK5bYhogmYMcrQRehJgk3Uo1woAoPvXwYJ96CrN71/MHT?=
 =?us-ascii?Q?n0yHnug5wZanYRuvq4kZO8dMIwOWRiWvYEr5i21CDnf7GW31s0d/ZnkXOVzV?=
 =?us-ascii?Q?DRnOipbnWH+RwCXiuUTTRnm83INpQWCxRSLpfjtmofkAKBteiN+anMbqJAMf?=
 =?us-ascii?Q?7ikLM1L/yhlBQ6SqGteF/Q7o2y+DbgLihhw8sE0NmBnuqAFuvrrC5mJVpyK0?=
 =?us-ascii?Q?Rh8wmyOFNF7vgXdROQq16uLXppbiEM8IAiAT609tJIvf5td0YYppkGinJ3z5?=
 =?us-ascii?Q?8E3HOWyUswsD1fL6STCus/YxOgNXnunMq0cluH7G8HA7iTrTIYnnRJ0rxs8/?=
 =?us-ascii?Q?H184HS86Myp1pcOFN6n1NEr4u6CXNs5c86J7G5xvg/9MgAndQZ/zNG7bm0QM?=
 =?us-ascii?Q?FhhT2P/qVIYofRGzU7ONwDH/h3mxM3dLfAL7A7TXEtdbALvIsjh/gX2bbkKy?=
 =?us-ascii?Q?mCbTrGfuTzIPcHBJSwGUpc32pw6+OoczScMoQ7VMuSFMO8Z1TFXek8a+f7gQ?=
 =?us-ascii?Q?74h5rEhDZYno8KIBJwEUqmzF8oXDZ05HfVypZpu/ny0LtASlfi1iCggQ9Wzi?=
 =?us-ascii?Q?OETzm2BPdKvC8VaC0QO0PISwrX80OuIX9oyZ4G4WoCjC5gPEFpS8KHo4Y841?=
 =?us-ascii?Q?uHN8p9hksUAV/w9zHIW7LFo7LtF1D2jqaBHd2+LskrZQCKd4zA8LSu268myo?=
 =?us-ascii?Q?ryU210Muf2F7i7+ycR6KT9GVNU9ZH2AeICq6Bzsp3f8ehi3aYLwVByiL/oj6?=
 =?us-ascii?Q?UMZwERTaFnbSGOMVs5+WuTIiq8NR7CPc6r3uS6W+A/DMCiUmdQMsHs+16gT9?=
 =?us-ascii?Q?hdY/GDDKnnCifHXd7BeW3DHkXzFkAMqGm6pdzzzPeGmmg45Ti2SzQMCPiSQd?=
 =?us-ascii?Q?QHRz2xl/ZIzuELK0e+s78uZt0iHUlUrrXbtEn+MttPhL5aK9FfyCGXAoISQ2?=
 =?us-ascii?Q?u+cg2eUrNezmHpdZSDVFMgB3cZ+45DLCmiCNBCCnrOor9GPusfxerQOoj5ki?=
 =?us-ascii?Q?fdBxdTWRbM6njTX3TZbuDnJHeR7CQZj1UW5e8mITD1DrJnicC/yYUwrQ/gmy?=
 =?us-ascii?Q?wv+3yrL0kT29+GmwDddx56vnSOAfjFQxjpVkIfSoy842uzyzspk20YMGqQhA?=
 =?us-ascii?Q?5f7iqantUpX4PeGmVj6Vc0RQ3WbrjZpf5wh7sNKBebIDPqFDb3byMG7n2jOu?=
 =?us-ascii?Q?FtQXkYhpqyEsqp+l+8OGu9n7+9Nsz9lp5hBL/GM9C1l1XsTBx2+MBaju+BlI?=
 =?us-ascii?Q?Uc8l8UjxpTzr8DvioCxUjB01+s2dbKPugWBMZsrTolCaBb9YTx0iy+mMGkoS?=
 =?us-ascii?Q?2/cB/gd0aVOi+zfPQ7ZXaiQBcRv8G/YrtpUK5zOSe7EjFg72exmH7BFjj10L?=
 =?us-ascii?Q?xRqwwugPI3xR76G118EEz5SorPemzFOgkLGawmEISzcVLKt/rdjFCi5e/g34?=
 =?us-ascii?Q?HCuQ33Xw59ZaVUNpNnTPePKHrrGaMoLnJX6r/kGs+8hHwCVGl6ephKnr0X/d?=
 =?us-ascii?Q?9liU2CO2C0UPqibE3xUVRZOMPKmUvoz8JFlIEaX7junlkaNBnlOA?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03e87ca9-67af-4a1c-d2e1-08def3d226d3
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 15:48:25.7735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZNamCMDiHUj+4XEXK8erY+4vKExgOnNm+QKjXGwdcXak38WsPu9drlY/8c4bNwHN0rOETsh22LaBk8NQCzxewXs6uqhzfI+CJjv/ztmZCNuzJVuELt+WSLpBFSnDYOm5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11833

On Thu, Aug 06, 2026 at 06:00:10PM +0530, Golla Nagendra wrote:
> Keep the real platform_get_irq() error value by returning ret directly,
> initialize chan->irq to -1, and only assign chan->irq after
> devm_request_irq() succeeds. In remove, free IRQ only for valid numbers
> and delete device_node only when linked.
>
> Move channel list registration to after successful IRQ registration,
> initialize device_node list head during probe setup, and kill the
> tasklet in the outer probe failure path when channel probe fails.
>
> Fixes: b0cc417c1637 ("dmaengine: Add Xilinx zynqmp dma engine driver support")
> Signed-off-by: Golla Nagendra <nagendra.golla@amd.com>
> ---
>  drivers/dma/xilinx/zynqmp_dma.c | 28 ++++++++++++++++++----------
>  1 file changed, 18 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
> index b7c561280694..f7e4a177bd17 100644
> --- a/drivers/dma/xilinx/zynqmp_dma.c
> +++ b/drivers/dma/xilinx/zynqmp_dma.c
> @@ -205,7 +205,7 @@ struct zynqmp_dma_desc_sw {
>   * @desc_pool_p: Physical allocated descriptor base
g>   * @desc_free_cnt: Descriptor available count
>   * @dev: The dma device
> - * @irq: Channel IRQ
> + * @irq: Linux IRQ number, or -1 when not registered
>   * @is_dmacoherent: Tells whether dma operations are coherent or not
>   * @tasklet: Cleanup work after irq
>   * @idle : Channel status;
> @@ -896,10 +896,11 @@ static void zynqmp_dma_chan_remove(struct zynqmp_dma_chan *chan)
>  	if (!chan)
>  		return;
>
> -	if (chan->irq)
> +	if (chan->irq >= 0)
>  		devm_free_irq(chan->zdev->dev, chan->irq, chan);
>  	tasklet_kill(&chan->tasklet);
> -	list_del(&chan->common.device_node);
> +	if (!list_empty(&chan->common.device_node))
> +		list_del(&chan->common.device_node);
>  }
>
>  /**
> @@ -915,13 +916,14 @@ static int zynqmp_dma_chan_probe(struct zynqmp_dma_device *zdev,
>  	struct zynqmp_dma_chan *chan;
>  	struct device_node *node = pdev->dev.of_node;
>  	const struct zynqmp_dma_config *match_data;
> -	int err;
> +	int err, ret;
>
>  	chan = devm_kzalloc(zdev->dev, sizeof(*chan), GFP_KERNEL);
>  	if (!chan)
>  		return -ENOMEM;
>  	chan->dev = zdev->dev;
>  	chan->zdev = zdev;
> +	chan->irq = -1;
>
>  	chan->regs = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(chan->regs))
> @@ -954,22 +956,26 @@ static int zynqmp_dma_chan_probe(struct zynqmp_dma_device *zdev,
>  	INIT_LIST_HEAD(&chan->pending_list);
>  	INIT_LIST_HEAD(&chan->done_list);
>  	INIT_LIST_HEAD(&chan->free_list);
> +	INIT_LIST_HEAD(&chan->common.device_node);
>
>  	dma_cookie_init(&chan->common);
>  	chan->common.device = &zdev->common;
> -	list_add_tail(&chan->common.device_node, &zdev->common.channels);
> -
>  	zynqmp_dma_init(chan);
> -	chan->irq = platform_get_irq(pdev, 0);
> -	if (chan->irq < 0)
> -		return -ENXIO;
> -	err = devm_request_irq(&pdev->dev, chan->irq, zynqmp_dma_irq_handler, 0,
> +	ret = platform_get_irq(pdev, 0);
> +	if (ret < 0)
> +		return ret;
> +
> +	err = devm_request_irq(&pdev->dev, ret, zynqmp_dma_irq_handler, 0,
>  			       "zynqmp-dma", chan);
>  	if (err)
>  		return err;
>
> +	chan->irq = ret;
> +
>  	chan->desc_size = sizeof(struct zynqmp_dma_desc_ll);
>  	chan->idle = true;
> +	list_add_tail(&chan->common.device_node, &zdev->common.channels);
> +
>  	return 0;
>  }
>
> @@ -1134,6 +1140,8 @@ static int zynqmp_dma_probe(struct platform_device *pdev)
>  	ret = zynqmp_dma_chan_probe(zdev, pdev);
>  	if (ret) {
>  		dev_err_probe(&pdev->dev, ret, "Probing channel failed\n");
> +		if (zdev->chan)
> +			tasklet_kill(&zdev->chan->tasklet);

there are already have goto, tear down move goto section.

Frank
>  		goto err_disable_pm;
>  	}
>
> --
> 2.43.7
>
