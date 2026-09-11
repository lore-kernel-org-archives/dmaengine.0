Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010021.outbound.protection.outlook.com [52.101.69.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C9049BD65;
	Fri, 11 Sep 2026 16:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789142606; cv=fail; b=umOTe48AwA/u94bUTzXRtcLOntgdhK5on0DoeBf2hwqdVLtpV/sjgqeGy4TnneEHSB1nKQAx7LqZGJrkV5890I2LPMQSwQ8uwSxsmffiN7bX/nR/kBc8SLRayWYZn+IiXRuamika1Db7TE9og5RdASrVKq9ayhblZLCqFRMT0eA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789142606; c=relaxed/simple;
	bh=5phX8pDVrmKypNjjwp6lw2NChUQeacla18UXDDQ4rZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fjHDht6RH/3rhwM705CyE5iOyWrmDIHst/EshxIyp9abEY1kXHNl4RZGfu+0aLmdKcpOSkozIf8s8VcJFW08Qh4kgT/c0cH4B+Q43b4WtKY9sPJvXGTUEPLS/Dz6QkDoDmxjO+V5ZqWKwbNtUurZby7lmjohXHYHRuusei3gLGs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=MwnKeorY; arc=fail smtp.client-ip=52.101.69.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="MwnKeorY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AzT71NbvUlSjP0A8pDk0HpP/+cYUXSl5EvnhVru5UOTgU86OeVN0gP8DPlZhrc/X+Twe4QD0ZupTB1DyPCdsXxSx/8nunt+Mvm+7Z1Hk7N2v07Sl6bH61NHUgWFqUur35H9mU5nSzZjPXTG/oFrJn/Zamkox30zXr8Mb9PAJCzQxhvZrv/7yIdt2M4mPUWEQLGd84+NVKsCKSw15iuRTEazgSeALBg4InRwyvtNJnOfHlG6OF939obf6m+IMGdpQYVxy03vm/XD1c0L4QFOqYlwpE2bnpGbWNgXDYjmVd7MkYPeW7GSjUYVjNte1S5y8FMjdF5D7t+/dGC54IALE3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lPggS7t8A9Zzjoltm/iMdjabILDtom3Fatbu11AiYZs=;
 b=QJnxiz6aYM5iDmhM8i4dMYOpk89G1NfmlPENPHvVzuNi6sq77cKJsqEOOga6jRHwlQkwVqPsQ7hfkToZKyHbNsdbEGzDvHdZ+VzL3GncxkhFHB9IQ6wL6YNf1Xq4gm7IZ+iXiHf6+Qc3iGs5euVtXgtSPy6fmXB3FqN2l14yPLYOxHipA2KAVe0G/mA6Tz4nR9AI9jo0j8cJRlxoLMcOIM1/sXLzJq4/rb+Jsx2xaHXVxOfSHoXSB3JtCH8JPbuYvfBVt/RQDBuvJVrE3L692oWi840Yr0VUSGYjM/67VrntWGol2PXDhuDAb8HY2GIDYB+rXqg2Xy6khKAvBActVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lPggS7t8A9Zzjoltm/iMdjabILDtom3Fatbu11AiYZs=;
 b=MwnKeorYPWGy1FuBh3VpUR0xE2gxVop3LGdhpzfXftbwdeHOLDmGbM+1oUMcXR8wXsFnuoLfGk9ec0e8l7Fj8xY+McWSplgcfeZDcAkVwr0C8apJOuEJeSx7L5iYLHPaVGdOSoy6h6DZVTA1JDjtFGZinT5t4qvoNwYSa7qZypbtTGziHly+mNrBSodkAYpDtDxGLV3dVmpuMUFxevseIwMlnswb3ER26/XAKDpbFA7vaIY2FUzGDZNFijYb2RgYBoBAi97eqG6/mnTjkP3oM91ZBrS9eXCuYMGjXKNbNfnLmjyDlwnx477+HXiyM7GmPuwir/wJTuQvy7RBDAqqcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV1PR04MB11039.eurprd04.prod.outlook.com (2603:10a6:150:208::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 16:03:21 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 16:03:21 +0000
Date: Fri, 11 Sep 2026 11:03:13 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dmaengine: ppc4xx: convert irq_of_parse_and_map to
 platform_get_irq
Message-ID: <aqQmQVdc33D1sOqf@SMW015318>
References: <20260910212720.70721-1-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910212720.70721-1-rosenp@gmail.com>
X-ClientProxiedBy: PH8PR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:510:2cc::22) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV1PR04MB11039:EE_
X-MS-Office365-Filtering-Correlation-Id: 114c0094-54cc-4ac0-bd70-08df101e33b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|23010399003|376014|10067099003|22082099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	XIc6piXOQDcQRP4mXNvXj2CynvI28SC9hnyoXqBSQSqwhZHSgY0aIbhdM3/tTEfJMkplWsC7Yax3Y0LB87GfdLc47JdAondAxoHtmhUQgkuK+VkXyCbr59mSrHOB67KkZTMa6OXrjjZ7nwHngbDTs9HxzeKisnsiCKEdn1GzetVCS5uhOGEHvAfV7yy+xPDuNV9OQavqZupItR3+i7e1lPyjGRmC3ctts6IYO+V+MIjJzYJit38Dd+wHpmGvfyGL+wtW9+hI9AhSsZCbG271Z3lP6gOVwbQYg6Fvw6xAcc02JICDXOMFOSyCtq44WRNrJ+g5N8m8eyAoiSvWiepD2vx9g9ld3k6aLnhRLJvkHCRW7Blatkcsd/WgOREZ0sST0W9kMkC8sMw+x6AT53YK1gYqd73RgspeBkw9pyOONrNoLUuhE3BfU2x8X01yxFehY38tN7FdLNQUAuBdlcR6H0HiKGDB1xE1U5o9Hwu08ZsKG4evCoX4QGYr17eY4jrAIKZ931pPa6PvK6r6DXChXibcE9OYelTWmDKh9wXavsjDbK3DD57J1VYUP1b/QJ/kpjvvHKiXGrHJ42t5Fu3UVfMYJAP/CvpO9+ZugojABa21BFZfnk8uLiKaxB7r8ar2iRmgEfKnHO12urqj0SKKUOh39oMcoocmfh1eKL6H8QI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(23010399003)(376014)(10067099003)(22082099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5Hy/UovnQeJIR91IXrXlBnFssn5geDZuKmoTyDK9Wi3CY2MVbgNaXbhbaLPl?=
 =?us-ascii?Q?0IAiiTJP21OkZUvzowopMjuAH3pOMqj8FjlFmKKqIMlujY8azZufMWRpr76V?=
 =?us-ascii?Q?0zUETlkwLG8cUT9Ew/+Jxr/amBYez/2clh1QpOzUmUSheDxZiUm/KUsImWqz?=
 =?us-ascii?Q?HrB0TV5nbZ5VvB8u573/4OcxV6nRQ/7Oz9Ah93/Y7+917/GIPc4q+Zn7+RSe?=
 =?us-ascii?Q?phgKrrDaJdAqxxOBdxUHtJp+IC88lXd1kBTMkCWT6xQl68Vo/cnvFIQ2zhgE?=
 =?us-ascii?Q?3iPGpgPNB9Q5pVxkGGn2VFI2mQqmH+4i5JQevvbXDTa6Tp7x2YRFV62nSF7L?=
 =?us-ascii?Q?C23+z2OHH9ri7ajJcEoHa3v/Ipx2+aejh4YPJQoP03wQa3u2pTg5phuUcX3G?=
 =?us-ascii?Q?ZHaGPgPpEHqY5vUrRMKYkdo6bnD53MPpIV6mQaUiAa3coX5O0GPzJu8dXf2f?=
 =?us-ascii?Q?cpX+GaawmwJVsjlNa+mcLHGrl9dSBB7kCQixztjIFzrWHnWJInMLLMZFrPYv?=
 =?us-ascii?Q?DeI+Kg/e1GwDklS0+6AbDETDusWd0MG+YKKB0JhBqPOtNlbh/plPGDfLpkYH?=
 =?us-ascii?Q?8O9t0YRFJ/GHOt51NddCarGmOlOAOB436/8HTF7RCRCYjoOHyucJG93UW+Pi?=
 =?us-ascii?Q?p0bz2QR4rQnvJyUQGyJqx4wl26d+kpqmz6YgNS9VffWxTSbQb6RU0xMY+U3T?=
 =?us-ascii?Q?5Z8p8I4WeO1MF+WJMw3PmmBFjTReDY5eZkOX1EOpSE+a2XdGKJfS0Cb/elmM?=
 =?us-ascii?Q?M+D3GGFI6RlQEp9yJcKKFhW5ECjmdEBy4vLRQcmaXtCbME7Qab8VIRprfVcX?=
 =?us-ascii?Q?CtifCMh/p5Q2EeV6mxdgMYWAp1JSqNW94A3n2S2VO+7yT4mDVXAGHmVkxJW3?=
 =?us-ascii?Q?nAYo2cmto8Eo2NGEYPRmy8aRd0f5dPGMAjJK7uA00ndbA4kWc4KLGBWJYzX+?=
 =?us-ascii?Q?5cTXTses84RB2QtxZp/UZ6yafSAVtg581jm2Thmiw2mAuV+3JIuABil7LaLl?=
 =?us-ascii?Q?rv4XjjMA4nVdYDNJJSEqirP8/DzPxrdHaoZrZHL/8tPeSHbIo8JK1YyOLVes?=
 =?us-ascii?Q?aDS0aj8hmhbFQH7nixt3/iwy2nZTzqbX1Qj6K3JmYn50Hh/Ml0BwkmHfQb8g?=
 =?us-ascii?Q?uArdSfguUyxzqkDPedFaDdbnGOD5+Iq6dMqwp4rbsmQtp+G+DYJQYqQt3vNz?=
 =?us-ascii?Q?Ymvu8SKAH98VsZSkDwWF21KTAjlOvAinMqPs/GBLJv4P1hBS4T7eEa8BHOO2?=
 =?us-ascii?Q?IYMCXQwPhR5LLoVpCL8HWt5TZP8/LYHdKOEiib6bWdZTbZ4RUe47xWLqH+gC?=
 =?us-ascii?Q?KoXqi1p7oFFMDlqitQr5p7si4R71mSi9l8bIdSdtEPhK1KYG9ubnu+KONy6B?=
 =?us-ascii?Q?xQmjqQVRH7FDv6a3RpA3e14FuK8D9qAP+H96cXIQvyLqmTrOzU5MFeznvJ7s?=
 =?us-ascii?Q?iBUhSqwMpbvZD8CeT2kW6tU1GcUIX1iwc9YageIrvYl1YK6iiBcu+bAkG2pY?=
 =?us-ascii?Q?KBWm4yri7OyPT+g4WpOi/U5sZcTupsOTR2FIeYWzyyeVxlwkBWMZKLQfJ4PI?=
 =?us-ascii?Q?oyZzc63X+YLXrCLhiCIiP0XcKqQI+TXDxOMUimPMwa6UqE8wiGwOsmp/+x09?=
 =?us-ascii?Q?uCWo7/FACN0T0Xg8ZSFuKlMFmawily30KZbcMDOkhXDjepMWynfmv5qzJips?=
 =?us-ascii?Q?AcJosvMe7B697XTIXkbfJGj0aPXiVoRsW7kmEMSUOyoIf3sfWMKwOIWfeci5?=
 =?us-ascii?Q?xitUXMstLy7RibQDAUNznIFlEf0JcXUuJV8awgKrJqgzJZi0abCR?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 114c0094-54cc-4ac0-bd70-08df101e33b5
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 16:03:21.5829
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mrDsfRZ6H7SdXxMR951U6oz5Erm5+LHGVQDawb/srNTlF8iVUYAifsmPQ49yALYKSCO6BOuSBBLJ+YlUUxR6LKqVn8SND204adkCFsENzs+YQv2GMK3mfMwqTzGiv0ZV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB11039

On Thu, Sep 10, 2026 at 02:27:20PM -0700, Rosen Penev wrote:

subject: function need ().

> Replace irq_of_parse_and_map() with platform_get_irq(), which is the
> preferred way to obtain IRQ resources from platform devices.  This
> eliminates the corresponding irq_dispose_mapping() calls

> since the
> framework manages the mapping.


Needn't this

>
> While here, fix a latent bug in the err_req2 error path: the error IRQ

remove "While here", just Fix ...

> was not freed when a subsequent step (I2O setup) failed.
>
> The struct device_node *np declaration is moved to the scope where
> it is still needed (I2O register lookup).
>
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/dma/ppc4xx/adma.c | 28 +++++++++++-----------------
>  1 file changed, 11 insertions(+), 17 deletions(-)

please collect all ppc4xx fix into a patch serial.

>
> diff --git a/drivers/dma/ppc4xx/adma.c b/drivers/dma/ppc4xx/adma.c
> index 279a431ccae3..42fc1791662b 100644
> --- a/drivers/dma/ppc4xx/adma.c
> +++ b/drivers/dma/ppc4xx/adma.c
> @@ -3865,28 +3865,25 @@ static int ppc440spe_adma_setup_irqs(struct ppc440spe_adma_device *adev,
>  				     int *initcode)
>  {
>  	struct platform_device *ofdev;
> -	struct device_node *np;
>  	int ret;
>
>  	ofdev = container_of(adev->dev, struct platform_device, dev);
> -	np = ofdev->dev.of_node;
>  	if (adev->id != PPC440SPE_XOR_ID) {
> -		adev->err_irq = irq_of_parse_and_map(np, 1);
> -		if (!adev->err_irq) {
> +		adev->err_irq = platform_get_irq(ofdev, 1);
> +		if (adev->err_irq < 0) {
>  			dev_warn(adev->dev, "no err irq resource?\n");
>  			*initcode = PPC_ADMA_INIT_IRQ2;
> -			adev->err_irq = -ENXIO;

need descript in comment message to propagate irq number instead return
-ENXIO.

Frank
>  		} else
>  			atomic_inc(&ppc440spe_adma_err_irq_ref);
>  	} else {
>  		adev->err_irq = -ENXIO;
>  	}
>
> -	adev->irq = irq_of_parse_and_map(np, 0);
> -	if (!adev->irq) {
> +	adev->irq = platform_get_irq(ofdev, 0);
> +	if (adev->irq < 0) {
>  		dev_err(adev->dev, "no irq resource\n");
>  		*initcode = PPC_ADMA_INIT_IRQ1;
> -		ret = -ENXIO;
> +		ret = adev->irq;
>  		goto err_irq_map;
>  	}
>  	dev_dbg(adev->dev, "irq %d, err irq %d\n",
> @@ -3927,6 +3924,7 @@ static int ppc440spe_adma_setup_irqs(struct ppc440spe_adma_device *adev,
>  			    XOR_IE_ICIE_BIT | XOR_IE_RPTIE_BIT,
>  			    &adev->xor_reg->ier);
>  	} else {
> +		struct device_node *np;
>  		u32 mask, enable;
>
>  		np = of_find_compatible_node(NULL, NULL, "ibm,i2o-440spe");
> @@ -3956,14 +3954,13 @@ static int ppc440spe_adma_setup_irqs(struct ppc440spe_adma_device *adev,
>  	return 0;
>
>  err_req2:
> +	if (adev->err_irq > 0)
> +		free_irq(adev->err_irq, chan);
>  	free_irq(adev->irq, chan);
>  err_req1:
> -	irq_dispose_mapping(adev->irq);
>  err_irq_map:
> -	if (adev->err_irq > 0) {
> -		if (atomic_dec_and_test(&ppc440spe_adma_err_irq_ref))
> -			irq_dispose_mapping(adev->err_irq);
> -	}
> +	if (adev->err_irq > 0)
> +		atomic_dec(&ppc440spe_adma_err_irq_ref);
>  	return ret;
>  }
>
> @@ -3987,13 +3984,10 @@ static void ppc440spe_adma_release_irqs(struct ppc440spe_adma_device *adev,
>  		iowrite32(mask, &adev->i2o_reg->iopim);
>  	}
>  	free_irq(adev->irq, chan);
> -	irq_dispose_mapping(adev->irq);
>  	if (adev->err_irq > 0) {
>  		free_irq(adev->err_irq, chan);
> -		if (atomic_dec_and_test(&ppc440spe_adma_err_irq_ref)) {
> -			irq_dispose_mapping(adev->err_irq);
> +		if (atomic_dec_and_test(&ppc440spe_adma_err_irq_ref))
>  			iounmap(adev->i2o_reg);
> -		}
>  	}
>  }
>
> --
> 2.55.0
>
