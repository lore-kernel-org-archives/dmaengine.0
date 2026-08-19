Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013030.outbound.protection.outlook.com [40.107.162.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8213C13EF;
	Wed, 19 Aug 2026 19:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787169062; cv=fail; b=gIIAEhuYpH0DS4SIcEIWXn7ThW4VHPs5K9vp+461EGLwQIBM1/bIJfeeZ6OaQWUP/rKANdJAMBc4Xz+TnH8KQex7zIjkcAQevV4TT7DB/eHYjvJMwfvbMGlt/+GG5Ob+43yeRAekS+Uu6r4f7O1k7MVsjUbXY3O/RRdPv8yU8nA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787169062; c=relaxed/simple;
	bh=ZWwGWFbFgKwW1cakBnW6jaR5mUCcq94DWH1B9JOCRkw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=E0amMNgH7n6m7A5XR4EFxM9M1YeHFCTspM0bYwN7z4Qbme/KcqwhP2TD+PdZXvKUXO6IADK8CLfjfeeTizePHgPBUsH9PfqKSMsjIBNdjuPIq2l7iQdrLzpm8He715vRqkMW+2Hl/20wfc6k32QIvu+Ly44RWdHTwOeut676zYc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=YO7MbwfG; arc=fail smtp.client-ip=40.107.162.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="YO7MbwfG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wyBMyox8EYbYCqqNEG+Lc5X6IoZNnk5sWuZiqTlsin4RfCJbe4vERpO3tlVevQ7oFrbgpwNX/jZWNz2NfojvM6zqgr52eCsk7RbXQJbhR6LGwa2ie+2mh8TBByfVOazFgzqmymLligPpKK8H+o1YyK2QfOm4oCbwJSrgSZ+n3WDRgMxh+mf6ku/2nvMhsF59Gt5BSGPfb0agXrNT1/D0I3aUen7ws3jaBexTSTcMU1wXHZtnfIcR5bcOssxuoRI3qwPDvM+v+1nKvqRl7zLr1DurefbEUWVen+DEi/DkvLVKz8kSfJGsUcw4WjVfgvAU4JuXUCfpZvgZet1v9mN8DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vhf2SSugvGpWipLPyf/D2ly0c25N/SCU09hwOpMmRco=;
 b=PS0TWADIzI+ylf7gny5lBoTj/gwzfg0Xnrs6RHytxLT/Zw/XfpgUM3Q3bH7KQPkbo1e5U/WNrewPGNo1M9g4hRUbf6+7pOpKuZB8TElNtycpMjSJHwTJUwdYyAFgN5ryHfdTJvtPQDfbuvKab+QvGeS0ugqYKbeX97OP3YWtsGNAZdfDAwlGeF3Fpu0+S0CHKGuY8BmF5GKChTVNFz3AbGBz7FOb5U/uYd/kr8bExDrsh9s4lbkAnza4W8OtO/R2OuOqZIediphX4yHEIdf+y9v185UlVg8+HAicY130b29HrE4WQ4E+mlM96o9hpPJJiAswgnD1vy4OWKauDUxGRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vhf2SSugvGpWipLPyf/D2ly0c25N/SCU09hwOpMmRco=;
 b=YO7MbwfGPMw/Z+lyrqq1psm9EH9pFKmark1aXfoj3pKtLg0DvwWHfeWzsOZE0roOYTIBtd8rCx/pRv4GyaX+J9fAU43x1/jtTryLkGWSkJQ3SBBHPsG56/4xi7ojuJTJLTeekZq44ODaaXTV5LAlBhII1it1DJWCjq7Q6FuZiZQzQbZN8t1fgQ3rga53h4duURrHbmxj0KfIN1+1N4eqCHVSwe1QTlBgD9X4zER9eJB4+wLDOHrgjK/iydc/5Jyfa96m1yYei/DiLX3NdcnYw7+VELv2kT+nUES/+UVyt7xCPcu6X11rSLELPfS9hz2Am59o27PRQ48hA6jikCZcww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB10204.eurprd04.prod.outlook.com (2603:10a6:150:1bf::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 19:50:55 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 19:50:55 +0000
Date: Wed, 19 Aug 2026 15:50:49 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	"moderated list:MICROCHIP AT91 DMA DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dmaengine: at_hdmac: ioremap and get irq early
Message-ID: <aoYJGXfDciTLTZx4@lizhi-Precision-Tower-5810>
References: <20260723050606.283453-1-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723050606.283453-1-rosenp@gmail.com>
X-ClientProxiedBy: SN7PR04CA0119.namprd04.prod.outlook.com
 (2603:10b6:806:122::34) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB10204:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d466066-a741-4bea-d52b-08defe2b2ec2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|23010399003|10067099003|56012099006|6133799003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	mLtDWBCFLmye2CCo3ZN0iQq4S58LJUU3272Iq3UQ6AVclO5iqzzsJsENdx+OdA0iccnbE2wnZLfLL4E6teAZtsbF0RNqIVLjCPR013BMoxlfm5i9LJ6AJvLg9hBqeCGeOaxIwCG5qYFHxETevBooDhJTshUEvLuPdLj82Uh7b0DIjJUTfWe8I9pEw+Xbp9VJOAijfBllsQ/I9Ul4DYjE3nxLA/PncMzRAdkG1PJnm04MFq1g8TNiv0pUE12NFMMF4M23s0KW7S5f7VJunke1Vd6My8BoYvRAZPWUMF/1W0NT859ZyqFSJXt2qliJk3HDbflBrdJ3jDl6sKbOvib3GoRr7ZO/eihZXXwKGFGalceQ3djYsMi48CYBJI4RDFXN/JTfyAkEpfDuqohwPCzO9ijZqFtcpoxaqEsBRXw7adrON/oLpMoCGoqAeReEJzvPx060MlZLEK4VhA375VaQ7dfTCW0QuFUCaILJ+zAM9zwV8PqwvX4t8OLnwZgHVRObRxWDIHmZpxvEVjkOt9kOyJd7Klzro5L9kMryuI+qyzV1G9Ap8Xg+HRXgDYjZQ9G127PL8yxTJ4Eq4BiA4svzWWVEWer7upzxL8K/kL6WOpSVFM/4uGNsNXCqJKazvWM7RSH+HkZQYYeHELCArG1+fnP7JHlaXvtkWuqbW+Idea8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(23010399003)(10067099003)(56012099006)(6133799003)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AxhF0UKtFlgJIPzwThCBzf4A9XG3M3liITW4jQJFtvwr059IriX+75sZhPig?=
 =?us-ascii?Q?8ZxpYBEWigZi7LVBHLx9gpvmJUKUnVxeosjkV5GTDRTE2KhR1HiLM7dPhYZQ?=
 =?us-ascii?Q?NbXhLAPnEgZzhtpuwEHiEOzVwodULKgRfkVijFftCHLYyTL7mc72C8AYuDXb?=
 =?us-ascii?Q?vXwSCKVwfGqjn6wru5RXHApi+wTdmV+4Y4/9jnVAzQjHNm0zEhwYzS7EEvAJ?=
 =?us-ascii?Q?ygnL5ZAGG6M1H2W2S/3jpIFBBzRo0GClRQaeIVwuSsrdRPYhFM1TinQoEbe1?=
 =?us-ascii?Q?ab1mLNPgsOiHnMKajLSECO2GOO4Xk1VIosxOwcJRpFll4h/ZMLDpk3uPvoBr?=
 =?us-ascii?Q?NSKHwRCuFL9adA5B1EMEaQ/IO6LaYFX1wp16XnkboDZqxKuTqxnvzTmXnpxu?=
 =?us-ascii?Q?ShosTIPSRa0r97bgiM/sEvHsJ+Ni5BSxiw3o/3HaBNhPID6WIQM1jMpBIqs/?=
 =?us-ascii?Q?XPzWRX8Pv/P/oZuLnFeqULfaTQEertbU4r0n1lB8HhRJMekeqnSs2Pw/O4hM?=
 =?us-ascii?Q?lmRyRmlfTQRgd+z5QDDP0qltNGGECE4JZLNHLXHPvuO5b/aMFYDOMzwJijbp?=
 =?us-ascii?Q?G9MSVr1ero/o0RCLRPkzIBVSIM514gNQUdfD1GM5ajZ2XZrfIM8fbdvc8b3B?=
 =?us-ascii?Q?nxGbkWENXyFY/uURsu/63NX9s7MLPjz6n5RhbSVkmEnKjWkb9DjkPXWbdNit?=
 =?us-ascii?Q?aJKQSyFaBavcDngIavrD9P1nCQ+s1P6YooGOHdzwWkQSzICVGlsfoDvxQo7k?=
 =?us-ascii?Q?qFVUGe54h0t0bs9AnGoL1m6U59aDWHiOdNn7JTbtpRJYFSM78iBupuTSIJRd?=
 =?us-ascii?Q?c16OhyB0C9Up4clZCYW/AIe+3N974FwKAk7uuK76x+EivPdqWXtLwTYMpQMW?=
 =?us-ascii?Q?982wuO5DVhxaKyV5RC3VGTbIglvprZGHYw/W1bB26c/kfi5x4N1u1spCivxW?=
 =?us-ascii?Q?PzfCzZIOg6RkW7gAznt4QzfTxHq+l8dn4VMb1jhTALZazZ46FSugMSiGeAUJ?=
 =?us-ascii?Q?agZmHhYYilZExaIYiWs4+A2ThpMmkBXm4tQi4xQQ5YsjXtThmcp+If2fiBNd?=
 =?us-ascii?Q?f1hHUrXFIotxssqGMbYKe/6sfCvAlVv8qitQJCLIsxrGvQHLuYiPczsrHH0q?=
 =?us-ascii?Q?6TcHAa9rucMnAvYRRVKmTe7WFdOzQlSC091BtCCxzHPHd5KjcMxiuT9fa/fr?=
 =?us-ascii?Q?42cAkj9M0kYaO6Oe3Qg1xWwtA4CNYFGUS/WzpkItIAoOtqBaio25HO/ee1xm?=
 =?us-ascii?Q?OPYDsF6j6J1iKkgoYw8pZHlT68/Xme+ABohTnDwB1c/83VVPAb4nP2m/LwLE?=
 =?us-ascii?Q?3blhmHeqEGbRop7zEak25y8p66t+0LuIa6mN87HPl5wE06KZ4JNYYnFN8lL7?=
 =?us-ascii?Q?h10N+bXazsx+4icX4fu485B8lS0FlOnGcw1FC8XNLsHGgMtBzEy9flgAwe7y?=
 =?us-ascii?Q?Nb1kzG/G6tzfoy3qipEb837dYjqKm7UjnWWRQDwbl6vVPpwVkmuupYAAZOIg?=
 =?us-ascii?Q?sd48XqCrtUS8co2ZHnLa15guKaWZgP9ZW04YOK7ynJCvWy29RoskpKz5z7lV?=
 =?us-ascii?Q?e5sGLYE9HwZ3ouXLDUPpMOpAiAoeZDrNhziUfj4bQ0KHkD7UDND2bLk08ZpJ?=
 =?us-ascii?Q?rBYzyC7a5/8TTg9GjuYt8sYdWzQmyuC5l71Jl51czxfq7N43/ND+bWnFKTYu?=
 =?us-ascii?Q?7LHWWeLmIinMlPypdP50POPKlXnrmqkk+FkwVXvVz8LW9Khf7lnz40GS9/by?=
 =?us-ascii?Q?ZLmwKFBezOgIzL9u+kpkBmY3OCIx+9/OdfH1vLXDT6wbPiMrvLY2?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d466066-a741-4bea-d52b-08defe2b2ec2
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 19:50:55.6561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H/m8Qq4Pj1C9hDfqq5D29Pay1E0/akD4kIJON7dwACXL0dviO84HlhAGc0HBmnfnQz0xS0Al0ipvYTb2UN4kaDYoZ5VfCb6ZzU2SdSHOOl4optP4YAlXksXRw5NJFjJR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10204

On Wed, Jul 22, 2026 at 10:06:06PM -0700, Rosen Penev wrote:
> The functions can return -EPROBE_DEFER. Call them before anything else
> to avoid doing extra work.

just move before one devm_kalloc(), I have not seen much beanfit for it.

Frank

>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/dma/at_hdmac.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/dma/at_hdmac.c b/drivers/dma/at_hdmac.c
> index e5b30a57c477..2f6f5877fc3c 100644
> --- a/drivers/dma/at_hdmac.c
> +++ b/drivers/dma/at_hdmac.c
> @@ -1943,11 +1943,20 @@ static void at_dma_off(struct at_dma *atdma)
>  static int __init at_dma_probe(struct platform_device *pdev)
>  {
>  	struct at_dma		*atdma;
> +	void __iomem		*regs;
>  	int			irq;
>  	int			err;
>  	int			i;
>  	const struct at_dma_platform_data *plat_dat;
>
> +	regs = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(regs))
> +		return PTR_ERR(regs);
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;
> +
>  	/* setup platform data for each SoC */
>  	dma_cap_set(DMA_MEMCPY, at91sam9rl_config.cap_mask);
>  	dma_cap_set(DMA_INTERLEAVE, at91sam9g45_config.cap_mask);
> @@ -1968,13 +1977,7 @@ static int __init at_dma_probe(struct platform_device *pdev)
>  	if (!atdma)
>  		return -ENOMEM;
>
> -	atdma->regs = devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(atdma->regs))
> -		return PTR_ERR(atdma->regs);
> -
> -	irq = platform_get_irq(pdev, 0);
> -	if (irq < 0)
> -		return irq;
> +	atdma->regs = regs;
>
>  	/* discover transaction capabilities */
>  	atdma->dma_device.cap_mask = plat_dat->cap_mask;
> --
> 2.55.0
>
