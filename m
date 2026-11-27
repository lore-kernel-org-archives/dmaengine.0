Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795792991;
	b=B/Ogu9/Bx3ECwxF4/ommt3hl79YYkFOgAWgjBKiX6pJa4S72pOKGcoxlPXcFeiS4NwGV
	 ssDtaI/dJEMNa/Iv1vAtnMFKgmPb45YC925FtMK6PfmTGUHSVmeZq4eDal69alITTGvaA
	 BH8Gl21A5dSluE30l0ShFbStzt0mZBc58PVQ35zEskEKglUIa0OUh2R/FQaUB3Xut4b4k
	 YqLj/3yAqbvwFdIQmtf0F+OLmCjp3t8Ukvy4wD7uhdXuCHSnxO4msF4eWCy3MBBa/9J6f
	 tgsZxeKW1iTYubs5NOUmStu90b6AFdxIKXT/cmzqsQJxh98hT+u9odfB0Rt850yV0XA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795792991;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=TR8WuSpJ49a6bUwxYj7koKPKhjs/tl7qJzMILnCRYCI=;
	b=4Hu3WOlke5Af80lNiaORkyJqlZHgcD5UJmXcjic1WgAFOBfFHzDHrVJspnNoUFTxen0M
	 QEKwsC8pp9dWVMSg9Dt/N58yRZzm7cZDP+IjLsUvCJ9TTOZqieEsyUb15c2sZLpnqA3/v
	 VfEdSwVArJTZKi6K4Y4zS2mFEn9bM4mbH+n4Cb3dnXKjyYLbBpX3tbs4I7XWBgPgfMneL
	 cZ+AHsL3NcCNGmV7ijFCRKBmMooItkDvHJUdAsSYpsBQt4xJFYLiszX+rT7OkBDdL6TwZ
	 MapDkRQ9s7XITJs/C1oH7H4Mcl3PUZIydH1pxsBGPPUm4vWdWH6hUlyaaruEBGAsVEA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Tg7rVAXB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.32
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012032.outbound.protection.outlook.com [52.101.66.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5227F606A31E;
	Fri, 27 Nov 2026 15:23:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5227F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Tg7rVAXB
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FTSRnfQYwx+8VjrO7G8swAU0pbpRpz+87oL5eeTFRgU3for9gbGyC70GsmuH63kdqK3+AEqVdGlYCI8Kuj6tl2ixccJDlsV4GllMve84qY6ZRNhWmoG4MpB9/ZbaFsiRuUb7bIh5Hx220oUusfBBAEKGErNf4GY+Lwh+FlNyNZqxbghK6KXlmSNri9aEVxUwSH2xv8MrJYnmM03mYkFo9+sNKY5WXN5/srKVsurF5gvpTpRUyHV6hzO8alhIzKdG/ZX7mSRzg4v+zpo1Xrqt2YTaGvQzty5ZztxE4HjZMuuye+JhEbXzC1uiDz+HH6Ss3oCw427SP8BdcMJnf4FNDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TR8WuSpJ49a6bUwxYj7koKPKhjs/tl7qJzMILnCRYCI=;
 b=DivuabKsY40UH/akiK2ApWc2psX53oKtV5zUjRrzosiWeK99zEuvBrKw6crckx7IMyijMdyRXoqMDRFNDBkNY+mfyyiNknK5epetPTTLWij8xFltHTeWqJH31NQmugfzOpQPL5No6qdfYaAR2hCmC7lnj9pjCr5gET4WfGtgbxJJpqQ17UcUY9/KNASQ88GnIp75A4br9e1X81CKtihwDm9qN44x6VigMtM8skjYc2KMzrdTgCUq7XHY1W2qqbtTD+O+nk7OuJHZ3HBseoLge8Nw9Yd0K/rA7LBfRcZtLD8HnSFleTm4/xdM5ia+38Qm3hldmw/T+kTfILJHI5iksw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TR8WuSpJ49a6bUwxYj7koKPKhjs/tl7qJzMILnCRYCI=;
 b=Tg7rVAXBfq0RUCJ8SCZ72arRIjNa9jRhopgRX7pPripMoCoxAn+Osi6zCUMEq5bi8zdP0nOVS1BP+9AG4BMhxCyoZQic2WNtaNohGl8SZwJZYWzFKIY9+E4O41yIM43SJRIVdb7EAwY+I5N/5MPPvpWyrRZQ7i7zT/aFNforBqepIGEDTLUSn5wU3qQl3l855SzlJ/O1b+GxIZQe5mA8A5hbzircPwY+71ZgF1bJh4Oxr+UHDGwiutvuh2TaZ2hvMcnXGCGkxTOZqewoEwurkrzOmwDwglBxX1Cz2nwFfsUef5a2JssNBbuF1/xtFGzgxcGhh4+N2XWHbyklMJpO8w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DBAPR04MB7303.eurprd04.prod.outlook.com (2603:10a6:10:1af::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Fri, 27 Nov
 2026 15:23:08 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 15:23:08 +0000
Date: Fri, 27 Nov 2026 09:22:56 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Tian Xuechen <202300460064@mail.sdu.edu.cn>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, vz@mleia.com,
	piotr.wojtaszczyk@timesys.com, manabian@gmail.com, robh@kernel.org,
	saravanak@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/3] dmaengine: lpc32xx-dmamux: Use managed DMA router
 registration
Message-ID: <awmgUCQ27j85pwhI@SMW015318>
References: <20261127110400.379397-1-202300460064@mail.sdu.edu.cn>
 <20261127110400.379397-4-202300460064@mail.sdu.edu.cn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261127110400.379397-4-202300460064@mail.sdu.edu.cn>
X-ClientProxiedBy: PH8PR21CA0012.namprd21.prod.outlook.com
 (2603:10b6:510:2ce::6) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DBAPR04MB7303:EE_
X-MS-Office365-Filtering-Correlation-Id: ef02c493-07da-410c-0d36-08df4c9a5749
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|7416014|1800799024|23010399003|4143699003|18002099003|22082099003|11063799006|10067099003|56012099006|261026140227099003|261028144727099003|261102123227099003|261022075727099003|261022105027099003|261021121427099003|261021123027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	pAL3lZgWbACYaqMWp6WxToUpdYK9wl2Woog9qAbagvlSI5pjyIIM6Q6cPqo5DIpH/JNf9qL4C1clA0wepBLUYoBe8+g2ixRVHGQxZTIfmeyQRprV4Q68IXRdIctphzfojm5/XK5KFK91DJzgtHrf6A0ubuaIIZ+A2JqCoCA3j8VFYc/VUIfJuKg+3qn9BywuusHDv8x8W3OROl04YeJuHrf7rgECXmP1drxKwp8FOhmJeOpBT56d4FCGMPuWADMa9kfH85BVLIHLP1QYV6hR2KpyLRORGI5BQaGFSGVIFqp5Z7PGInfMh+M08IPL0mN3rsXP4cEYX7bviG9o4vm1v6K+TZTfKiprv4p5cZi/PIe9VC4W84PQNqi2paBLrVSA+fgTslyPdLi5zLiDMIWakboFR14mmTx0XlY273l5kUO7cu/B1NWsYzcF2SQIthPJjkkrrbCN0Aj2vtE/VQ3n8NslGSQYjr/PpTX2fOkUAQDqehcfPWfGZsuhtzvMXRkItRc+57l+wlk4L7cI9xyXz4ZlQSwNYsyjRqSucKYgceWaiLLo5TfDU/Q0muvyS5gyDYZgYPJ+7+M7WKI1frpnDyzXCExvEm0yTeElZQff7MBinqkaUtFxXKpCd6y16Wv4PlOaQIu4SoL1bn+6nAIEigQC56UXkGnwNIVHyehH+Qo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(7416014)(1800799024)(23010399003)(4143699003)(18002099003)(22082099003)(11063799006)(10067099003)(56012099006)(261026140227099003)(261028144727099003)(261102123227099003)(261022075727099003)(261022105027099003)(261021121427099003)(261021123027099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RMZF/ZYno6a9CSigJpG2T4AGnv84oUgkdfYruu5W+J44o5hAyYeRSGmjpvj1?=
 =?us-ascii?Q?viKagDBgRd0WkeSEzivsdAUJgJ9ZAaFBIbJ2XxPh4TI0uU11VbqXOPKlKPX6?=
 =?us-ascii?Q?bivG19jKuQ5pjBDr8qBt5Dw8f8mxj/Ze9g6y/zhjzUBvMocsJWdSy4U9wVfc?=
 =?us-ascii?Q?+G/5vNBnzG8jOdGMQNZt7p5k9zcTHC9iK6Ms3mfkbxzbPqjS6ylcJwDt0QTC?=
 =?us-ascii?Q?UGpDyc7G5eFw+KIOb0t/9v+xOfNzkU/BnxWaaUKfzZTmFvkf0aJ8wKk2j9Cz?=
 =?us-ascii?Q?QX0nUYDwBFzVtPb22T8Lidf6KLYhQPLonv5SfANJOeaYijauMuh0MM0M0/4w?=
 =?us-ascii?Q?yyVH4o1ebiqFAN68O+VuVDrbqLOuzRRVJCHj0oA9VKfoIrPK7w58CS/gSaFk?=
 =?us-ascii?Q?GJ34LxO3TWno4JB9IsCn+d8w/r5JeFKJxQHHz4llImA02bjkRH/21aFmgYle?=
 =?us-ascii?Q?VQYVhn8HJL1yl8D+4mrdd9M4DAANAhocg03jtLS8dnqnRdmQ9pgIyQ4wsmpv?=
 =?us-ascii?Q?l63K+fvnr15WZKDf/Gffav6Aa+fE9/aExavA3Q6aEzrD/qZwGvMidGsJ6Mxv?=
 =?us-ascii?Q?MonyORQNn7zQEpOLF2ySb+4X2gBsKsVATj5VZMut0PQz9nqgxlQqsn3GSq63?=
 =?us-ascii?Q?WPsZx326FZnaO74H/yu1dK8zzRpo4LkGKFpVAK5aiyf4m+/747m1iMj5Uuu7?=
 =?us-ascii?Q?CYga3qlndwJ3QlPstBENq/vYGPDTCG17xrL/A0a8Mxkcd7Jt35KTT3yWELYa?=
 =?us-ascii?Q?kpNggj5eTbPqVrErV9WsHFCSFY6N2oxGyxXIEBKgGz0m06Vz34Q2Tc8dpd+5?=
 =?us-ascii?Q?vXuviyM2+XS0fy8pqY3KOCCh2hqiZjLPCHaQL3jlLpeoCsYN1yPw4S3QXutW?=
 =?us-ascii?Q?JDX0ERXQ1oeaIAiYZQoJ99wW6OYuGmeNFyAfUpqgUzOF+j+5ev1RPi376vfz?=
 =?us-ascii?Q?UOOO88IzfoUvWtMBBnJQAmAkgMh0SJ4NnkYBP2fTIeOBZMKTqyyplBUmEl27?=
 =?us-ascii?Q?DvihNNArYmJX0GGKosnbHTDKZd7ltI29rWaNQNzbC5ugdkT1GK8uEbf8DVY6?=
 =?us-ascii?Q?tHaLTycezVc84yLRv+DcdFR/WzTFDeMF8SC7bFi50kVEk46BZdPgD6zMm2qM?=
 =?us-ascii?Q?J6qhgbpIvpfXH+K4KV3tT2EXXj2hsW4xdhWhlbbkqA768EvQSvGT7zmK1BwA?=
 =?us-ascii?Q?92WZzKfIe2zfxFCg8f2Tgp561tZfAZn6zzrztzN2xt1mC5kNxFJGk2VluQ8U?=
 =?us-ascii?Q?YrLXsSYb3H52kIrwHl75HBTv+buIkIJ/gwc88QNQKyPWb5p1G9p9vKS6yWlP?=
 =?us-ascii?Q?CPgbWxcyoxJCCg+pb5EaSejB0IbuiOrcF8gf4GzUk1I3RXYXddbJJVdo3Z1q?=
 =?us-ascii?Q?TwSdRav9eWYYaUckgL7nUY50Kqgff17t4rRk92LgdKlz9FIQ/66+8neRHsSz?=
 =?us-ascii?Q?Vp9R0NCOjHyl2DyQo5nluzUWMbSQoIVJqti22UO2Q3yr7at1QT/i2RVbTLAL?=
 =?us-ascii?Q?QH8wMUEEF7LvSS2/ReiDm7DD4wr1Ka6oIN2sk7J0/knIULXNnj8Jq6AECkul?=
 =?us-ascii?Q?wqfZwMwQugZIZfjYv3VhEn1srrzxKptNtDR8qbfdb7E2SmuNrXsqvMW/6Ihh?=
 =?us-ascii?Q?IKzENBKO7MsoXS2LDYy22ix/ywX7Nkk0TlCXWfk1voYUFW9p3RerJxVDMtRw?=
 =?us-ascii?Q?iVvAw0PeMO9jrA54oNIaEL9kXbV7Odcj9CXISyfBaORAAgZQ/xZGzp+Y2Nag?=
 =?us-ascii?Q?TgxfBmG7i1rLQqr0o46wRLVG6T/y+c6Wm1PXJ8N1BO/CWkuzj06f?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef02c493-07da-410c-0d36-08df4c9a5749
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 15:23:08.4973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N9yTt3XUfLpPl4+8fmnDKZ85OVoR5QqcSy5avDFFu73wVVc29fxsnbdFpq0ScXG/kcxcbcXdek7kLzh4xG1GUuKIfbM8WDuZtEG7hu/+s6A8g6TJZpDFLQut6vr6QGdh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7303

On Fri, Nov 27, 2026 at 07:04:00PM +0800, Tian Xuechen wrote:
> The DMA router remains in the OF registry after its device-managed
> data is released. Use managed registration to remove the routing
> entry before the router data is freed.
>
> This issue was found by our static analysis tool under development.
>
> Fixes: 5d318b595982 ("dmaengine: Add dma router for pl08x in LPC32XX SoC")
>
> Signed-off-by: Tian Xuechen <202300460064@mail.sdu.edu.cn>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes in v2:
>   - Use devm_of_dma_router_register() instead of a remove callback.
>
>  drivers/dma/lpc32xx-dmamux.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma/lpc32xx-dmamux.c b/drivers/dma/lpc32xx-dmamux.c
> index 33be714740dd..3218be8e8eae 100644
> --- a/drivers/dma/lpc32xx-dmamux.c
> +++ b/drivers/dma/lpc32xx-dmamux.c
> @@ -180,8 +180,9 @@ static int lpc32xx_dmamux_probe(struct platform_device *pdev)
>  	dmamux->dmarouter.dev = &pdev->dev;
>  	dmamux->dmarouter.route_free = lpc32xx_dmamux_release;
>
> -	return of_dma_router_register(np, lpc32xx_dmamux_reserve,
> -				      &dmamux->dmarouter);
> +	return devm_of_dma_router_register(&pdev->dev, np,
> +					   lpc32xx_dmamux_reserve,
> +					   &dmamux->dmarouter);
>  }
>
>  static const struct of_device_id lpc32xx_dmamux_match[] = {
> --
> 2.43.0
>
