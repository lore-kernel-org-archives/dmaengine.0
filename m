Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012068.outbound.protection.outlook.com [52.101.66.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB25437114;
	Thu, 13 Aug 2026 16:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786637826; cv=fail; b=aFt3wugz6Lcsh+KAA+c2xEnuOgMXxHxzaigHJuMlTcsI1vpu95a9RrwN0BNcK+sC8O9Lwa3WEgbwoo2rN41ZNSRt4NvXKsm8uv0LRBQYAGv/e+qn3LvCluRkzymFHg8MEOmFG0r9AYqP19V9w0FYPZfdyzzrnTid4YEEkdrGKcA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786637826; c=relaxed/simple;
	bh=8fOR0rDEL1HgYoNP499ipOQxMVeZ87gTS3LmEUEn8Ls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LE2tj6sGUh+Hp1kxHwYJ1Z++fR4RKd/ZlELxI79Fz8pkE6ycq/yzJvZFlXsVb3DbLETspzPovPXhFF5kbmB6jMhlPfVSnpcrGXB+GUs/+JKY43+JX8kc+dBvyHUfFMFa2Hjl840rWjqPHXak5iHLCxHi+I0d191CpbHWAGVYjUo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=MarnuOGo; arc=fail smtp.client-ip=52.101.66.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="MarnuOGo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VJ2RjmBJodCNIg3rHiQwl4Mi0U8buEfaG8bX0oBaVnusuI41uP0WiSVhvfHXXGrtnnHhufitJ5mLTV8ROrNaIFO5YYZYuJ/+BsWBe7GExPbob3CHMHBcHvjiCifTVi8pmz02AOYiey8qPKp/EhpcYOSL8uBR5OgTq3E9h8dyyv9MOYzXrM0GGHmN04f3x+M3VqN0+kkNWQ5RZ1YLZqD1u5wE4Y/rSB/i/QrCcBtpvCuN7YBiccUw5TVlpLBZX2EFJIMHK5n5onHULDk60xc3X7sZc79yUsNQY0VIFa05+8fq5W5FO5bHVur6g5JY4tV9PEWvwd/9cvIhAqFo7UnWjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pujJ01IOJWNZie+n/7vRZOo5bt8VRRdgyq8BqHF8kJw=;
 b=ODFD3QPEkzjwcHeT5DezYLJbjYqTKW6oLcBszV1s8nUUZi+oEXie0dfAurue+EH1T0UmkHS6Zhqb2TPZERqlmhpqtt45pR3QFTx/fawIswAih3ZrqLYDIud3qhTbLrgPdhojxwQLskpN6dKEwnrYXNZ0q0cTLey5hmnbELTbedBdL1cn3690bog0h8r53ba3YOQjq97irTHOKYH+IEtJPUgUqG3UYiVLkjL6AhaVktRxXWKyKAi/no+XU1UUzuD7jB5O5r9LXHT1ffs9Z461P6p0a0mGGFW5hwenPu9ewKCbyvRjzLzKYEPgU6C79hHvqyeYqs4tu1XIMvlvqq9EPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pujJ01IOJWNZie+n/7vRZOo5bt8VRRdgyq8BqHF8kJw=;
 b=MarnuOGoxu//VdpLXEePFYJO7nGOJSZ1MhewMvI8MY296PJ5dECWsmx96KjhiN1JwmjGj7RenMz1cxohlx8N+92jprzEk8YyHgeKlfyH1Stjd5ctRfMacnexmet4rAQCJCgkaYJ3CRhCWknjWB21UVGrdDz8D5yYGwCvb0zffguftGblpyIHAexjEmt0smSJSba9UfUwy9Z4v2VnVOy2Z86mOgMa8n9W6GbHAMf9y8Gzh8mQ+8JdsuV6rPOagl5z9iTHV3P9gLOfofOvOBHSQGx/mNVaSrjJJrqojZxXbgFc4aJGvdl8FUk+djHc9sQ8LBN2PR9aGxXddBGVECmIVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com (2603:10a6:10:623::11)
 by VI0PR04MB10805.eurprd04.prod.outlook.com (2603:10a6:800:25f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Thu, 13 Aug
 2026 16:17:01 +0000
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de]) by DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de%5]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 16:17:01 +0000
Date: Thu, 13 Aug 2026 11:16:56 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Ruoyu Wang <ruoyuw560@gmail.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org,
	ed.blake@sondrel.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: img-mdc: Fix runtime PM usage counter leak
Message-ID: <an3t-OJN4TdsS7fJ@SMW015318>
References: <20260813153143.3953303-1-ruoyuw560@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813153143.3953303-1-ruoyuw560@gmail.com>
X-ClientProxiedBy: SN7PR04CA0162.namprd04.prod.outlook.com
 (2603:10b6:806:125::17) To DU4PR04MB11791.eurprd04.prod.outlook.com
 (2603:10a6:10:623::11)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR04MB11791:EE_|VI0PR04MB10805:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d8da42c-dcd1-41bb-5e43-08def9564e59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|19092799006|366016|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	3nKsSgi5uEONE6mWoAXS3g6UOARX/zuVccYd/94UCi8D4oRvMIfxM7CHJ7mLa5CjwI4vqyzek07pV9znFLJImpVMsyXirlGbnj8IW2sgZR5w4q7piGUipBCzbU3aBUqZPrsVFNcYCAthjQPrkgCNvIBXwN/BPzt02hLPDoipr+YpUafLp9v7/kkudDWmMvARI9tYReuCmYVZue1kMTwe5JA6dnz6EOz1EzIo1QHbwKd532evKx5eifhvTCHaxdTX95LAM1lDGSmhlX5JY5PGs2puR3XGf5UDrWb9Yr37BM/KY6fEsbGY3RNXoiMaSRhiB+ooeOT0tg5ocVHuB1QT3ffGezvXZ7dY1QkcDp8/yXT3T2nKUfB7/806hiywhULIpPf7nJD+przEnipVhy9gXlOognX62MonwC5Tzl+NaPZk+rdkk41lY+SioMBRgb04ir6ILW3/cklZZG1u5hJcVmMb17tLuYpTXb5Ktz6KRWnoCXKRile/nPdkAYaEOXrPLT81SYi4RLbAWJn3kUNaRfrN/weP2ONYHHCN5jH3kGjTxckEv8ebtnx/kMeLArw503EcFFTwHKDNVj0zrJYxpX35bhis93FEQFVaA/tpDSZ6f2EpFJPQTE6QPsuZ9g3w6A9HoBlMbJQG7jVqQM9w84gf2/7K5vBl2+nINojUR7g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR04MB11791.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(19092799006)(366016)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?31up6Tr56u/NjOG+bbvAJ7d2AyMLR9EZR9308PS4Nj2hU1phmM6AnvODBKhX?=
 =?us-ascii?Q?lJ1oaFe9Xblx4LX6DMBcWG6cKHythG/pCF+9OO+PwqPtd5aCn4rLczgGTIX3?=
 =?us-ascii?Q?bdCS8wGlwpigfA74QI6D8l/TNsfIa8EiaQY9OBhtTXuMqQ+/4IqnjJb2FBGB?=
 =?us-ascii?Q?j8eNeXXUmlFnDO//OWsf/u7zu9BLo53T/4feQa7dUZXoInCZ/1W/8nzni/Sv?=
 =?us-ascii?Q?gUN7ml+9GIBBHVloXSKCQGN7ggGQiDmN33kWeOZp5N1mHtdhfUofmGealDdb?=
 =?us-ascii?Q?LD38vDCh2HwW96fj5er1d69csEeR4zOOEl2a16bGATMXg7KDyKalRgqydMJ+?=
 =?us-ascii?Q?GvQg2ROb04/5PAQX5qe6YWOoGnVzw9ZBI01b9MvfHLxVvG1QPBGiYfZTBwcS?=
 =?us-ascii?Q?HT/DRYrh5iZIk60LMGsbYjOS/P9ua764WXNGx34FrWpzmtqbs3i6BC5PbCLh?=
 =?us-ascii?Q?3ilAHynX9zCIFr3MnxcCwr4cVI0cKqbiSrrGGhiAD2gmvlinO+N+17CIVteN?=
 =?us-ascii?Q?vOatZGx2/RVl71p8/TztXL9oH+ZmmasQiimm/YhdzhUdxQ74smQLoTl3UdL0?=
 =?us-ascii?Q?uc24aY2m5SL0OyPeZKrWaRSP5AP39K0A1sgzd5mp6wirkvj5H+2L3MBlZ15O?=
 =?us-ascii?Q?a8gGNV4xRv2k1HMlNY1iM6IZOkJpqf72dAzQvodSLF26QFJWqhzV3L88QXgu?=
 =?us-ascii?Q?XLbisioCLKv1i53DeaxCxBN8wXmoiLTogFJloTitkB9fR7ROGzrlfT6RdiOU?=
 =?us-ascii?Q?llOO+7Xy7LyAJZYQeY2zLRnY9DhQmmnJmi/7st1q33WNzx8FAsX1+pCmr7t2?=
 =?us-ascii?Q?BFVH+OyydxJwZpw07bWvzOyaciCPNJ8U2c45VphrOugRnsG9BrIxUkj7Fmni?=
 =?us-ascii?Q?hzlBvj2odTYJ4vfz6KfqMNQF/ZsqeSWSJr0hxf96twJsyX84hJ12bupvUody?=
 =?us-ascii?Q?8sAFQv2WRWMy1v6eChGyo5fkJhpkEEWujTfTp2uI9S1/1Bq+tz9k7F2zn9f/?=
 =?us-ascii?Q?IRAVM0QF1jXkG6jPejfa766a6JosSCuEe34OZn2XMiR99hrdkr7Y9ClTG9on?=
 =?us-ascii?Q?f7FFmIyIHWQaqmYyorp51qDsffdfeshabeB9PxeT1/fodrxBdfXtJFcJ9xbF?=
 =?us-ascii?Q?PdXlmNoY72IbI4RbCoDUauyZ+j5cTg2AX+G24G5x0KyIm3h3gQ7oCaiERgI1?=
 =?us-ascii?Q?os9CBi0Yr+bnWSnQeVDDOBrbyLGA0UwwW0/2zJwNZ5Y09XTIW6mHBVDSC28K?=
 =?us-ascii?Q?d8u7ZjoiwpOuQd1cHEr+qp9hcYOdLXh+7kkrVD0MHKgcKjpUhcBY2FlwnMjS?=
 =?us-ascii?Q?5WOcz39yyVG0573L9FrEya9PRQm+dB42WuGbEsyOVofdDXK+awKyQS3fOOlr?=
 =?us-ascii?Q?P4SQtdjjYtcVLmoNii24AFkOehjh8/FDxxb9aOdaOnyT/gS3vGUgU3jWlEMw?=
 =?us-ascii?Q?0Yvn19roBSd18vYfpVzaVXF54hhIA2jh/H0UGm9ihgVprBkD3iufALXtaXKx?=
 =?us-ascii?Q?KCwmHGpRWLUmsRgc7756jn+7VdkvfVaX2wHFwDQ51SYOHmGeGXUpeqpd26Qi?=
 =?us-ascii?Q?n4/FNCxGYSTXZEP10TGd5QVYGgcyB7wXXDwqyIbZdl/h9DaAsw33ecy0JXdx?=
 =?us-ascii?Q?dioO+KCitM710Ujy1gzBAhHQg8NHTujiFiFnBKH5CEe0QCYaRqgg3RQpEbUj?=
 =?us-ascii?Q?QJVdrCgyxj8cbESDvFfShDxx+RY50fqe2AM0F4dfa4cu/5YN6hYJVm0PwpUU?=
 =?us-ascii?Q?vRzy1TQskmPUX+2XjWEpcd3Pw79k66+/qQqrspWtz2LOZsYg3S40?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d8da42c-dcd1-41bb-5e43-08def9564e59
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB11791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 16:17:01.2454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m6M4sTp/cNKt1m7fRIIijBHrLWSpAL4AoFz07T4XmJeSJCwCkgluqzeMlgS2IjcsaNLQdk3aKgRQNWXoKtmXyMXCkbJdk1IWtCx+eCOHqgugfkM+OsohSjkPm5x/llhW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10805

On Thu, Aug 13, 2026 at 11:31:43PM +0800, Ruoyu Wang wrote:
> [You don't often get email from ruoyuw560@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> pm_runtime_get_sync() leaves the IMG MDC device's usage counter
> incremented when runtime resume fails. mdc_alloc_chan_resources() returns
> that error to the DMA core, so the channel's client count is not
> incremented and mdc_free_chan_resources() is not called to drop the
> reference. Repeated allocation attempts can therefore accumulate usage
> references and prevent runtime suspend.
>
> Use pm_runtime_resume_and_get() so a failed resume does not retain a
> usage reference while successful allocations remain paired with
> mdc_free_chan_resources(). DMA core only treats negative return values as
> allocation failures, so the helper's zero success return preserves
> behavior.
>
> This issue was found by a static analysis checker and confirmed by manual
> source review.
>
> Fixes: 56d355e6f586 ("dmaengine: img-mdc: Add runtime PM")
> Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/img-mdc-dma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma/img-mdc-dma.c b/drivers/dma/img-mdc-dma.c
> index b3765ba1580308..a3192d49b6c860 100644
> --- a/drivers/dma/img-mdc-dma.c
> +++ b/drivers/dma/img-mdc-dma.c
> @@ -738,7 +738,7 @@ static int mdc_alloc_chan_resources(struct dma_chan *chan)
>         struct mdc_chan *mchan = to_mdc_chan(chan);
>         struct device *dev = mdma2dev(mchan->mdma);
>
> -       return pm_runtime_get_sync(dev);
> +       return pm_runtime_resume_and_get(dev);
>  }
>
>  static void mdc_free_chan_resources(struct dma_chan *chan)
> --
> 2.51.0
>
