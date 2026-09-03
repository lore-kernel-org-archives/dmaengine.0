Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011002.outbound.protection.outlook.com [40.107.130.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9497509EE2;
	Thu,  3 Sep 2026 19:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788463626; cv=fail; b=ML0nYtCiABQO+Sbn1HjIINo3S8/+i9OixvKmVqt7Bdq1EL84XHEEpYqsFt0Ebhynh0tHl4W+Ibu3cdbIs6mRBWRKcBI7GoUArGiNCQwHha18g8pOLGepWeIYlVEbL+cWcpml5YVAsFYMYWniogXOyn2xGCTTeUBXN4r6x5Y5U4M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788463626; c=relaxed/simple;
	bh=FzZMWDpAP9oU1S7aNMw11Lx3UjN3g0Yw+vRDJL3Srgg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gIE1boBRwafjOFhirq/mw7LG4IV5DYCBzoAYBLHv5oThE2ni5a5D8mtkl74iU0Xnud42Tebyh7fRd2Mivn0Y9hYdpX0P9UGagt6RDJLIYuW2g1mR/tuOd28ibuczj8VEMRMPekuYBNWx0PHpck58XWBngsJJswD167fimOOYPcQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=wwSBjbiu; arc=fail smtp.client-ip=40.107.130.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="wwSBjbiu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QHglpvfPNltlkfqK5HtLYV3gGLsQj93h1ENcpdNxoDG4dJr8vNp89sUKJ5JBxnP1yYY3/cd6RnuA1rMaF8Dp/c784a2M4EShSOQmIcEmyAKYlDCxb9JaZ66DJzYMblUoaNVjk7YHS2k+0ypqiQKPFTgOjliZw1p5ViBppJh9XCWAFqYQAJRAKTrr+5bc1W3XTgR+oPp34/iwqvvLHhe7bt62kYuFeOr6vBz67LL/4PGhFgqW7LsEWD/hpzlORl2zV0E2X3Pz8wEm8Jzcxu2if3ESZngF96xq2iJglZoKcLEuv14Ilp1c2d3GrJtsKIIqdIxSD0onZbLWOGCSbUoiIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k8TOts1d22DELNhg87UdDuOgDkeg+DJkgwVYSZ5fRU4=;
 b=Pxmc1849mQSBN2lI+xNCoo9WPq3QNR8Ts7N9QxY9WXrWGgZfNqfyoM2CH1Wdg8vGp9VivMq3dxDbtadgZcQ5kpyZpoXNJFh0gw0Jb8TnJZKlT7PyofKU7EZ92YYhVOPsg7jWucruqsj2zBQjl7rtYWlpnl1LdEd97/NlwUDMxAtj5GFsOQrSS+T/uU4wfeUJurjyeBXiQkrXurjquOHo+IaH3Z687Da5VnidyxuzC2XBoObk7+3yXGZi4teIk1N0rhaVZkxvjNN7MK/ZfLRiU8EX2+bK3IjShBopybt6zoK27X5u9HYU7lvzFaYDdnmger4nVZgGEbxZPN817rcG8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k8TOts1d22DELNhg87UdDuOgDkeg+DJkgwVYSZ5fRU4=;
 b=wwSBjbiu6QmR0po4ykvdfU3hH92KAq7ckL/wcuJwqoUvk0ma70daNMUSbhmF8vbEBtN9SKBuaf15D5242omn8d3dGGTvYRr/FXcuZqxabJQXm5CKHpBu6CHrLS+WYXb40bJjOVzzceBm7YYxBHeIFnKrj1DObtprgOZwjsNWQ67t2JBP05sxcr0kBnU8Wc34E+ImfkuL5riclHeh37w7sjkYRyM3sxR9k/K8qedGDZi+DVE+VNsClmKXtwmqZMFSbz1X+zbH1hrM2nMB2mlSHJpLh2wvjVkPEQCSVLJQT0ORRA9ISK6CkqmUlHgHAPKd3iHqhNM/SmklAcMfW9SZCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV2PR04MB12088.eurprd04.prod.outlook.com (2603:10a6:150:300::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Thu, 3 Sep
 2026 19:26:46 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 19:26:46 +0000
Date: Thu, 3 Sep 2026 14:26:36 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Ruizhe Zhou <zhouruizhe@resnics.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Frank Li <Frank.Li@kernel.org>,
	Chunyan Zhang <zhang.lyra@gmail.com>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dmaengine: ptdma: Remove obsolete 32-bit DMA mask
 fallback
Message-ID: <apnJ7MtNw59x-qWh@SMW015318>
References: <20260903115441.912500-1-zhouruizhe@resnics.com>
 <20260903115441.912500-2-zhouruizhe@resnics.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903115441.912500-2-zhouruizhe@resnics.com>
X-ClientProxiedBy: PH8P221CA0057.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:349::12) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV2PR04MB12088:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e33ee95-3278-4b1f-c8e5-08df09f14acf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|7416014|19092799006|4143699003|10067099003|56012099006|11063799006|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	0asjD3F6SWSHEEawp0xIP5TJcXniCSD39rTYgevq6cUioau0ROk2lrZ1uQH+VxaV/4WwyYrjYwWuHhWHyy0bpxJfN83lARv5XEdVdq/yAMJsXvrA+Yc4tUNVakLRUIgYipG6DwCHm73CzNmNsG2LxnXYzwXqdQ6R59cyPDyvY3vNfNzoUd+7geIt/otvFsoNfp5biIhkFv9u86kpsoQ3fXSjCGxmEnfGzvObq6ELSR06jCLUucwZQktocSk43quDq6t4h6p409pwZ1vFWiXxvnZKnTDzoxTfZCtZy2aPYW5ul1aDxFZho82Qb5F7GDc8aomA0mQRsMrymbP3jt9psqAylp7fHBtrrFYCb6OfG3A0HAeN06yuWuirn7AO25FHhBIaIl3xqSog1u2FjOrLe3Kf4IDMhaMpzHS22lsXlZFXqdQP5HoLq1G320DvMZVK6uOsX182TWomp46GPKTn7t8YtQ5jUG76ldNw5gxXbkXEePFIXkE0n7Fvp6plhvS8XLBZOH46vMRINPucDT+vjMulIgibHlNGTtSgJZzmCPeDVQm0lTCIHBrpf0ekygoeE0eDwgw0exAtOIZRd3jL5n0UAoaRQhmT7Zq0BF6rEMQqJwu8sYy+Ynt9PCT3viBf
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(7416014)(19092799006)(4143699003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0qxv1Blwc1TH7gJLPZk/H6jpKgb7SXRx/8aKourU3baG13iE07NaFNpU09uv?=
 =?us-ascii?Q?i5MtjpySDtxL9N7rMTeFCF2zsvK24g3FDSrNz+XeL2iEc1d+j+RZL72LyJlP?=
 =?us-ascii?Q?ANFA856E5FX8A/CRkz1w5LE2SA1uilpNv8V0izfTxO5gUvmTvleCgctDw+Aj?=
 =?us-ascii?Q?+mdeD3F42RDXE4EE9IrgtBGjy28L272HgoFkI9KGHaNwwNDPpMrkJB25cKf+?=
 =?us-ascii?Q?6Wb1tiqixaEAHaTR+YY6IcpjfFTEvtleaD35uIAJ2YOeDa3a8pAF3EPd1IRc?=
 =?us-ascii?Q?K8eeJ6BS7TmrhYAoDLVtoCelAq0DYvbERcP/FTz9h9lo4yTsmZmA2kauxZm5?=
 =?us-ascii?Q?1dL9vxU4/NJLANi6mM8LJKwBvqEVz5YBORqBGCqjKBr0p9+NVEAoNJszaRgI?=
 =?us-ascii?Q?vB4Pw7//lpGqYyD2xGju2UXz1OHXpAxTvvbkmBTZ4GWOIHe6zWsezhgBeZeF?=
 =?us-ascii?Q?HIrZFcJz1du8qJe+qb/YxQ9JqrIADS2EKQolVzYE+QVaQbsN0SxmWM6CfGp2?=
 =?us-ascii?Q?AOAcMvp2elTVsmmGQ84JkW6Ea0hWN+jLg5OTQZf1bTYxQrD0Z5sCw9/MfhRt?=
 =?us-ascii?Q?bV66bJtzjiOkTNOXmx1SbczHGY1zG14USzFgbVgOZeMyKW9GuV2tEMkzdZsi?=
 =?us-ascii?Q?RGQzs98oUhw3Skta3VV2sIsHYDMAIhm2j/yoe39t15JoP1GroasavNvt1oYA?=
 =?us-ascii?Q?Z1s9pC8Qdh6Xk7BG+RkN+lC0L4cYfRxhiyntqajlMWXBbne8HIr+6EBzGM/w?=
 =?us-ascii?Q?UulnZckafAVsbRJVqQjozE3kNjpEwd3mtsyJFGPriQDdSOZHKHH71KOMxizN?=
 =?us-ascii?Q?xS1CK5jn2o74ZlWW8AIcjdhzdC0EP7ewhtBt4r2DI+FpT7cXDYX49KmSyMiX?=
 =?us-ascii?Q?9BcnxQyVpiL6Ldwpt7pCb4GrhAwbIiuvFxrqEEane74V4GunoliTCL4+yIb7?=
 =?us-ascii?Q?haiDpjq7VgAu97gb086IEScTrWapQN+WzbrYR24pv+Ae7VP+HbIKySAd7auS?=
 =?us-ascii?Q?PFo1G8F0jHHjDMoWGODTLTI5HZkrh71YgH+g1edGvbkk3wpFef/X5HPZq1uM?=
 =?us-ascii?Q?uwIHT1xwqvRpS2eB1B7kkdqO2rBZWx39nEn9bg/c/O3/+tp59jEZuBApENo9?=
 =?us-ascii?Q?y2XKCnRxVCN2+m0Bp4fg/gVH76WqxHTJXd+AeEbqVkLAlU9WcQW6IwUN//ky?=
 =?us-ascii?Q?YVymxSQa+TytuLwWPjTO46MU9QHJo4g5cjU7boksgrChmbuVjfjFyJuVO7yM?=
 =?us-ascii?Q?rkyLN/r2guy5/pHsrbhg8PxlwPoZUH5K3mfmuk693NnQctvqfix3TbluU+vF?=
 =?us-ascii?Q?LgiSNNaLwR1jRBx3k3KobqUN26lZSRcKMUPshBS28e6qAfeYWNqGIcVnCjsQ?=
 =?us-ascii?Q?Ka0L5Qhz8bvTLqI7yubC8DdLSTZJ6qNEXVwGqPQ9N2gVdfSNA3/EzfTJriOO?=
 =?us-ascii?Q?D6HnKEdDErER3qbRfmnEOXb/11cZo+97QG0dyVqlZv9bBu/+P53GciRWHcDe?=
 =?us-ascii?Q?2GHFojR0BivSpb4DDXXKzMTlVPYmPGxDw464+5iyXLCgnrFdyIorMR3IKNSh?=
 =?us-ascii?Q?HiKLW54sw2icZgQmmn11q5GkwbPobIVO4Hc0J+7bcpKm9FEoQbNR93qLLRom?=
 =?us-ascii?Q?/zYl5XvS78BtKMLJ2bIgFqsU3veXnC2APLFJ1NRdg8aBe+FG5t9l/VYwcCOt?=
 =?us-ascii?Q?sMPIWXir1vB0bIMDh/NcIN2+EGF4mg6taSqcv3vwqQ8QwN6tBAcVJBRvl/Jk?=
 =?us-ascii?Q?O0/AX7k7mCy+flNdz/snyWPdIcwqarRSMtXH4vKO6UGRaLupxTvH?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e33ee95-3278-4b1f-c8e5-08df09f14acf
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 19:26:45.9544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pFjNltYM2BFLyaobbqJUus+G/IRAQL62/8F/Lwl3ECC44Wo5xU/EqXPYP2RZOfE/J0R7PmGkA/um0IPoww+Mbq0jmUuAo7LcQYRzx/7GHqUZSbw4rGAwnn4JalOh1Zza
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12088

On Thu, Sep 03, 2026 at 07:54:39PM +0800, Ruizhe Zhou wrote:
> [You don't often get email from zhouruizhe@resnics.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> The DMA API guarantees support for masks of 32 bits or wider and
> explicitly identifies retrying a 32-bit mask after a wider request as
> incorrect:
> https://docs.kernel.org/core-api/dma-api-howto.html#dma-addressing-capabilities
>
> Remove the obsolete fallback while retaining the error check so that a
> genuine DMA setup failure is still reported and aborts initialization.
>
> Signed-off-by: Ruizhe Zhou <zhouruizhe@resnics.com>
> ---
>  drivers/dma/amd/ptdma/ptdma-pci.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/dma/amd/ptdma/ptdma-pci.c b/drivers/dma/amd/ptdma/ptdma-pci.c
> index 22739ff0c3c5..d36bb9c67325 100644
> --- a/drivers/dma/amd/ptdma/ptdma-pci.c
> +++ b/drivers/dma/amd/ptdma/ptdma-pci.c
> @@ -178,12 +178,8 @@ static int pt_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>
>         ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(48));
>         if (ret) {
> -               ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
> -               if (ret) {
> -                       dev_err(dev, "dma_set_mask_and_coherent failed (%d)\n",
> -                               ret);
> -                       goto e_err;
> -               }
> +               dev_err(dev, "dma_set_mask_and_coherent failed (%d)\n", ret);
> +               goto e_err;

also needn't check return value, it always return success if mask >= 32.

Frank
>         }
>
>         dev_set_drvdata(dev, pt);
> --
> 2.27.0
>
