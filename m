Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010058.outbound.protection.outlook.com [52.101.84.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E4D57F738;
	Wed,  9 Sep 2026 15:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788969293; cv=fail; b=HqZHs4GRdq0GTF/c/sG1FU1/p3ijoz2fpooIg2egTnTopG9hu98x9mlyPCT0jlprMOoE7YJ+Yu0AT12ShWTBkugYEirHtKQIiGFxitTd7q1N5cQaYHHkqv39SxIwdBd4xBHVXZldt3Rl16HySp07uE5Lnamn31VxH6KDbofdLmc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788969293; c=relaxed/simple;
	bh=Lx+sF3q2vNs/SSV+YGLsDtQlruZDKHc4zC/a3lsx7ko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=V2HfgUYoV3AIrUn7uOYtoMyAcy5enOHxH3t3lcyyA7It0FVBNVaSa2C/j4CFJ1W+vf9FKQznX9Sxlr/8RrH6KjY11724NAW7Y/REbEXtFmp6gAiYgBFo5tNRc523N4XyZ+qkfajtWT4Ji/2JOZkoUAtQ9wea9aVJjpiT528bRxM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=wsDKaOe/; arc=fail smtp.client-ip=52.101.84.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="wsDKaOe/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HZpxjZLQ5Xy4B/s6ul0gq1kSRsUg3fjplx/pyJ8sz6crYLfqzQvhrUeqij+bftHZQza9mYq1NTzbMu6+jMtl45BDCJSbhW9wnB97WmmQYidGOK68ZgYYiSGUjqThwWd//1KhMPPqkA864dECfPyAiafXM2gQVC0DlGnwAWv0kUIAlzme0AJ0z/aBkFnTVv9677XmX+6+olOWWSTkYCKeo31Chro9KK1DhqZt9IZEXAoNcWidAEyTKtsgkb7dL73emBDoSAJP9741WJgmfK2ifWT8b6e+RoXoOWLSXoUQsptZ6s3Pblze0Hi64qGFQFAnR1elFNq+JDzo7IwrO+JcGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nw5W0VPLWzYTmn9DO/zWi76opJmz3B3VIUAF532AmVs=;
 b=rWlGctthhRYmwpqv2h+7tscmTEP+6eumollSRD6yJHoPejlKUSXj+s0fJg8qPAODbkkN5apEOL2qLiTugNfqJenePHQ/Ys4p2k016OgZ3mj6brYvyipsUMBfEt3CM8OMRuNxE/mn45KOS4+havKu9gf/YhJKPk0pJI0VOc9h88vFTBIFWGnVSrSPKiQXgEkh+GVMjfDvq9GQjLRVCX5WGQVdnwjTdOSghQLCyt6sahYfo7sS7YlObKMPZKMX/rOWfl1aXSt5bVb/lrsDgueq+IjlV6eKZkbNn7PeRgtLKf77n3playUyPgmxfGZ8lGvkZ/DQ7IUlo1xwhNf8YUA2JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nw5W0VPLWzYTmn9DO/zWi76opJmz3B3VIUAF532AmVs=;
 b=wsDKaOe/uK92ub0NsoBvLFU5pLYJS6Alaqxx5XzMDFvddqO8JeWEweF/+XRuGJP60T7bq0LIRG85jE0qhDK/M5477m4te9qL+tAyuDqifbJNeTSkxmVVPhgH95mflAzMqqVPt2VP1O/YofVPDiiiNdcxLRHPlDKAL3nIR2hCp8ySJYjBvuL96Bb7WdzobJHke+e0wClrqkV3lRjmTEC+kR0wrmM4VCypeUi5yxYpBxirs9UCPzACQHnSnbo3XGdAA7BBdnDuUej/y6YTswXZgPiB6X54JjP/VLRF8zJ4pFCWYlAu/8Tej7mT0IGSIAsuKQw5Tt7l+L4ClTQSjcicFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AMBPR04MB217899.eurprd04.prod.outlook.com (2603:10a6:20b:7dc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Wed, 9 Sep
 2026 15:54:49 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 15:54:49 +0000
Date: Wed, 9 Sep 2026 10:54:41 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	"moderated list:MICROCHIP AT91 DMA DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dmaengine: at_hdmac: use devm_clk_get_enabled()
Message-ID: <aqGBQY-VFwVtQuQq@SMW015318>
References: <20260908212607.590224-1-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908212607.590224-1-rosenp@gmail.com>
X-ClientProxiedBy: CYXP220CA0006.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:930:ee::10) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AMBPR04MB217899:EE_
X-MS-Office365-Filtering-Correlation-Id: b68bfd62-0bab-4b7a-bbee-08df0e8aadbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|1800799024|23010399003|366016|11063799006|56012099006|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	AS/YAG57TyCwpgVWZdxI+7ZCMWcCfVPgbwrpc+spSdRhvQAYXcbdxjn9RoHExbiEu/ERth05URvwno5hbmuwjUeVNSSygQQk9/9QYMJ80ZzZ0Fqg9BA6P8uwQU1u3xbGGy7SGbVibdKa6b0A2LS9/mRBLcLc5PeVwjobHzwoaTIMNtEnhhPV7c5RMeduQzfhy6Rx9iznZyvEzrYljHjv9GOhVUuHlfmGAytK49PUFw0O8FfjBmu6uDVJcks81JhDs82L77F9jMKHNxm007iJtfv4tHomrSovwdFXNi4v6Eh3LPKflbVptdrnCmAWr7fh7uEw+oIOAp6SJgLG88V5yCl+z5qVPP8D54QOsYmyAaAz9Q+6Uiqen+rEmPWr6BQ/ug9tsKnplHIX0u+aX19UIg/odPKrx22MNEfmgDfMtwAPlD9PuyGJ4C8UwSUnqPvMpbSLWScdswK6wswpX1ddZ7sXlrNxMOIH/aGu7vztDwaIKTKRb7muVYi0x4C1hDighsyqogExbOhAEQszPAQX1SUO8JnS/qiK+wghTg7gtC36QyLcD0dWSS8cfZvPyIZ7zztthSv7GAfW/tpCCVQeuIFaX/hRdWoqtq06pFXd+l5zKYmWhFW6rH5KEaFc+dHxwnK1Xk3B/0o5vxs6j3C6roInQnBfO31Zi/Z5zwKht8Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(1800799024)(23010399003)(366016)(11063799006)(56012099006)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JKe+s5LCWwHCBbcxzb8l2KLIoiQlHaLCLI4ScTe9JsLhVRYIsRCtaShHXxyx?=
 =?us-ascii?Q?B8YbRJXqbP7m1DMMcyXBPuyB5dDn6753JUWbdkth0Xb/ruO24H8cQfDOPVMD?=
 =?us-ascii?Q?EK9S4bg41U+BMePrLYGbFdxzqsBC21fg/yR1M/pSN8ZHhaIz6jd9aL/NytU/?=
 =?us-ascii?Q?grsg+BomMsF38bg1roz8zrbHtuWPEqZzxy58cguPRjL5NZer8JXezDkH7muD?=
 =?us-ascii?Q?9uAAoRM0HyI3s1UidY09cnY6nkeuRTls9rPPB36O3nJbbaAF6ao733g1lpvD?=
 =?us-ascii?Q?iilAHCbYTnboKJbtIe2Mg/kp1zQX/QBnLCo9L0q5oY8DZtKrHFYU1rqfIFgn?=
 =?us-ascii?Q?1iA2u7PCzvrudBYv92gvbn8udNY9hxeFZu1FLQrfTNocPQigMi4xVdfKXbBb?=
 =?us-ascii?Q?mzcn/olHOwALEGiLDaiXwrThVCc3oJNMpDTov4uDi8JUUyGZ1YD7XZ4S3UDE?=
 =?us-ascii?Q?SJOU2De1ATY2jyGo7wSRgs4Z0J73WgwAHXg3/trPLbmXL69+TPo6ZVtHeRg6?=
 =?us-ascii?Q?ql+maVWVcUO2zTod3CgFJzQAu/PrdLtC+SjXe3DRTZfWKHEgtkiAW5xJCuQl?=
 =?us-ascii?Q?PwTDbA0rNqEXULvQLsPN2Tt7ru5b4ujXsFySf174ALkCSzsbNeJp0/ySCSuP?=
 =?us-ascii?Q?j19+UWxYyqdT/yzmG6vJq7oYMIwxcCyCK4JPtPLD828WLBqDbydTk7ltpTpk?=
 =?us-ascii?Q?mmaCnaUYYyllgCoC5jYq0nFu3b0T7OQMnhc+JP5F0F6/fG9s/xGxXVfVM2y4?=
 =?us-ascii?Q?K+GaMkD01mndwJn8sSj2r7dyo/oI7+BN3bzm9g8pQewMyeei7WlYvYOimiqR?=
 =?us-ascii?Q?bmdCwKySyBz/O21YKdwc+o1XBvyJ/T22h0jjRGBsuzs6bEZb4CRlkgr1Sa1g?=
 =?us-ascii?Q?dkzh8IQPGJfnQ1XYQisJ1p8vXAKnRU7ue3lKSZBmY366IxBsrSj/6NetssGl?=
 =?us-ascii?Q?ZjapV9Ey+CfRM3DYw+aZW3yNx/zaxkeNX9DiJS97rlL4yIMUCTTKdTgSnrKc?=
 =?us-ascii?Q?DQpWyQdHh/EoNgPG5SsUM5F12K46+cUyLO9tF98MGpP2sLnUvSD1LqZUQSov?=
 =?us-ascii?Q?9zqqdmHQI9HOMx3OHzxiACiBxlt5DeyNJu7Zo+hAiC3rmUhaCgMyqhX7iBtV?=
 =?us-ascii?Q?wA7YqwvIDlCFhk2zPZeXHdArGpmydAlrNjKePLIG0oBrGMLvNIKkNtJgoMvb?=
 =?us-ascii?Q?n8l0lUvYHe4NklSWiTCROZV0m77yHdIzt6w1S0o834y0OkQ7tbU3ajiLJY6d?=
 =?us-ascii?Q?Kfau2ob8bcsQKO+gjkiqj+vHIiLLU5UsWhdCPplqr2E1GgjGiKjXBUudZdRN?=
 =?us-ascii?Q?X/TD6yOqY7F+0Eb7pI6ol9/A+BCL/wDXfptNA2pypCQasBiQ9tPS8mF+tRsQ?=
 =?us-ascii?Q?BsXjW3iVxynA2QcHDvna6ySpKsqkhN5RhJNtQqXGz3EKC+z1bgZco/kTkIiI?=
 =?us-ascii?Q?7nSZc+ZhcIH0YOzhUAyiyr6E3HeKlQHdKW0BTeJ3ga3S6vdfHIiHR+egQpom?=
 =?us-ascii?Q?9CFRstn2g9cW0tNLK85bvSZf5b7De4VqyMWhK6Iu8PS0rKgxjI0TaMfvihAa?=
 =?us-ascii?Q?ZoznmO6Kh8nfNJKMpow7Hyw+1cuFI9ZhMBzDmfqrcnvGkZ2FNg/qPJuICe6p?=
 =?us-ascii?Q?IaWxTJR7twp1wxyg1nmNN2eZ8f8IuKBgfRLMsouPMPd53ix7+WhWAhWY9Bc/?=
 =?us-ascii?Q?vvzco2v0B9IZ0EO/VTR4LUE/buDPna3p+zgw34U8iEUPr9M5bAIY5TrQgQei?=
 =?us-ascii?Q?X+1Z5RDTLWR1QYpAO01HH/C/28nPybMJH1G9dFkBFMyz14rxhNjW?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b68bfd62-0bab-4b7a-bbee-08df0e8aadbd
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 15:54:49.5999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p1UPoQEou/HI5WIpfXENDlYoHUmfQriijWzFWlcTPCfrNJ2uWZhXRhIW1DYQ5nruI6toKrscrhJtHffbfOS58HsLtZBfaf1fBGQXIpadbdpzom00fuMb5PaCqEg9Idtg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB217899

On Tue, Sep 08, 2026 at 02:26:07PM -0700, Rosen Penev wrote:
> Replace the devm_clk_get() + clk_prepare_enable() pair with
> devm_clk_get_enabled(), which handles enable/disable and the
> unprepare on driver detach automatically.  This lets us drop the
> err_irq cleanup label and the clk_disable_unprepare() calls in
> probe error paths and at_dma_remove().
>
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/at_hdmac.c | 12 ++----------
>  1 file changed, 2 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/dma/at_hdmac.c b/drivers/dma/at_hdmac.c
> index f4d0c72787d1..cae26ea890fa 100644
> --- a/drivers/dma/at_hdmac.c
> +++ b/drivers/dma/at_hdmac.c
> @@ -1994,20 +1994,16 @@ static int __init at_dma_probe(struct platform_device *pdev)
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
>  	err = request_irq(irq, at_dma_interrupt, 0, "at_hdmac", atdma);
>  	if (err)
> -		goto err_irq;
> +		return err;
>
>  	platform_set_drvdata(pdev, atdma);
>
> @@ -2126,8 +2122,6 @@ static int __init at_dma_probe(struct platform_device *pdev)
>  	dma_pool_destroy(atdma->lli_pool);
>  err_desc_pool_create:
>  	free_irq(irq, atdma);
> -err_irq:
> -	clk_disable_unprepare(atdma->clk);
>  	return err;
>  }
>
> @@ -2145,8 +2139,6 @@ static void at_dma_remove(struct platform_device *pdev)
>  	at_dma_cleanup_channels(atdma);
>  	dma_pool_destroy(atdma->memset_pool);
>  	dma_pool_destroy(atdma->lli_pool);
> -
> -	clk_disable_unprepare(atdma->clk);
>  }
>
>  static void at_dma_shutdown(struct platform_device *pdev)
> --
> 2.55.0
>
