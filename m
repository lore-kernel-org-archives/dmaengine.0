Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021137.outbound.protection.outlook.com [40.107.74.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C9F451998;
	Thu, 30 Jul 2026 16:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785428058; cv=fail; b=kEXc6EMgWIp2A16+IvCjXPXXU6F/xoTCkDiTQRDjQiGxmaYiECVBE82sT0WAlz5azot7SEgucJo0Mb102OuqCnhB81d8iz8zJaAtraRM+HzAAYnkOO4Gzkpg7bkFG2jvkuoeOJOIO6zizRLJhKSoeEk2DM+EFmSY6PkRy2hHOrs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785428058; c=relaxed/simple;
	bh=35rbHs6KdYSEA9nLhcDxFJy41041ji+lGFk23r3pdaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JgL+GLXQJg5WjSU8L7Cd4GmWoAw0JsIZ2HMyX2ScxrO88spaKEpLE3MAO1HjmbqmXdcjr0tsNXYPFahRSJC9LIzQTos5ridfUuOenC+cdgI9ahCFKDhSIfQ+uZbly3dCavwbbV2fLpqNRWRsgtWjY8f8E9BhTwNDFQLaTpY4i3o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=b3dB0Qc5; arc=fail smtp.client-ip=40.107.74.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="b3dB0Qc5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jxNB9R5W7pSc+UQy5pEiJEvLVziCVTWe9vjJp3AykdZMhDvobzfDVx+9LbusIuGduW60ZFR8nOCR3/hjp6v0+1H5PepDACN4pfaqKuR5owFEaP1omg1JH2LO8kUJOIrdWH7Mk0O0q9shxO4YlGR5FX5ZiX7ZLbHnaFUGwPqUz4MpVjFRvLLzRFWEJRoXEThKlO8aqk1zra7PHfd4Y4Yk+XA68DvZK3TPpVDWTiIwKK2/1HsDe1BTThzOcswCUqMCyCYflPPJAT8c4nJAmj39T3H0F4W9QHsqc/KwwuKJhROYM6SMjAAM0n+qsJWNYCmRNiBo7uY0asevbf+fOFTDbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jv7QMJigw3cw5dfVhMd82VWflem/sdKoafTeg0hHIU4=;
 b=SZvvvSr8SKJEp15im4otMgepq+5LZqbVLAvFUapVasKfxHV80+0jX7NeFOEmF2ydsAsIRhPeG1acPyTK9j8l8CVTNdtAkIDlTOddMaVHo1FTAxsWlttDSwTAZk1d9g3aeXoA7c74g84LrZY2I546C4tw13mhzxIeyAJ1OCaMA22F2E1vm1XsucMIpbhgkgAXPyuklaCnCYIwwx24ERJg2IlGF1FeNM4prY0oMox17PJ1VRxN1SyCy8rEu+StRi9+Mx2ForHJIIW5JlBjiAkVNfkOSM9yCCmjf3M1MTCFyOlEeXl+5EASJHYw3BnuGLGUeiNrCYF++iM/0x47zbCwRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jv7QMJigw3cw5dfVhMd82VWflem/sdKoafTeg0hHIU4=;
 b=b3dB0Qc5LktNQTYA1axv2Z9BbEGZ8wxtG1DS0srnAZ96rL+DUX100OoLH1JCEMjsfCpl7xhxsMTlHsi3NTvf2gQcCHWHAMjkUQCHJoByO4ounQzuGRh2ItTcAWjuho9e6z9SiHaSgtLzj8/IZwtJDQLn3IX3kRoutdzNDVd7dPc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OSZP286MB2395.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:15c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Thu, 30 Jul
 2026 16:14:14 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 16:14:14 +0000
Date: Fri, 31 Jul 2026 01:14:13 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Niklas Cassel <cassel@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: Niklas Cassel <cassel@kernel.org>, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: dw-edma: Mark emulated IRQ as level-triggered
Message-ID: <vv3jhkzntzqcn6crgvc6zz7ktilthhorejxq5dww3p2rbrxmmk@k47azlq6czl6>
References: <20260730160701.3550710-1-den@valinux.co.jp>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730160701.3550710-1-den@valinux.co.jp>
X-ClientProxiedBy: TYCP301CA0031.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::8) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OSZP286MB2395:EE_
X-MS-Office365-Filtering-Correlation-Id: 40985be2-cb5f-48d1-4291-08deee55993d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|10070799003|1800799024|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	amaFBYkvnV/XJRLzSoZLTQSSguQ5nWIZ21n+sc0Ppys3BSrf6arw04NpEHbKoLj8YzOXpQ9dxa+PsDOcrfWzB/DYPZfnvQghX8j8V4GL+qnPTpJeuqHbQBWU4gtgq7sJJ8WQM8JJ7yO1VmdZGcvSL03UU3mmArA4wc7/xE0jzJ9I/AalcbqdZXX7mJbdV2hHxCRRP+Dk33OG03mCOLx0PQwGlY2VWTBk6lw9fD2cMghjG0UO53QF2Bv3+h/bD9W7leQ4Iukp+oozDEOv32EgArWA2PrfJ3KoDAXaS3wXU80K6RSrQkWZvOAma858a8HRbFs/oDP2jn+UBkW79x30+YUNHXbXb0rjFc3G7Mmli6DxR8wZfSDaok51YBk1G66OgzXd/wJHfCvK+KOKcwvbOM9yKKJVYly3Gy5hROjbbv5RTO+oeatkLiXkFv+ulV1vsMeTurIHW3PALpResFnmv0wgYbaRHrmXa0lgHKkqZOcBtjqho03qXdHqzZaVR7ukF869fp5wWRUw02qXy3PJW4LXth4W/u2cZZ0U7ew+M2csegarxoOxu+ANhAIpmsm5wp3917nYHELqm8uilgRrkzP9WO7fxev9O83Z9wIG/IAEgvi/u/1kb8EWuIMd+O1qyJvesN3dPZ2d5NuobV9jfCjAOFM70O/d/8khNciBbA0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(10070799003)(1800799024)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nXACNkkSRqiCqr/qkNpwJojHEkXLptvut53AJrHNXUox/kQ0DgmcPAeWcBD+?=
 =?us-ascii?Q?4gFkjkrDSqPll4GZxxraAOt/ij7eYLI8lII5z7CTDdRE58eE35pdNYC/vnSX?=
 =?us-ascii?Q?RuzmH4d5Sk0Ss0G3cOBQYgoygbFaTj2w6QjCZgCGfVAiCyfJeRUFQobAfHMO?=
 =?us-ascii?Q?jl64rhG3O1nrv9yzbmg8YRko4RpWUglMXuKoXjijhT3bZA+gEdLjfqcC3SEB?=
 =?us-ascii?Q?O8AqvYapWpva2wuidK8JGK+9/NQShb074iRTPddTz63tExSBN96bM6W4JzaG?=
 =?us-ascii?Q?BZjYppm8jyYHjhmOHB8coge3McRmHgnx1ppT4l5bC7e6rPAjhiJ152/s9pkq?=
 =?us-ascii?Q?kX0FyqSEvE2qPJzRR186yrQzuq80bsmt4nAJMPxPE1f4PrzTaFOmyZ8XDjHh?=
 =?us-ascii?Q?5ZwiSoISRpEqgKtRKNdQjlbWk1HOb44O+lQvGRa0oEo6DkVO8Y60ufMh0g3q?=
 =?us-ascii?Q?DxbllW1hQ4GEJc6xxCnry/A6nbSsQes38JMXUbRhhXAaXAna4gcsCENc0KMm?=
 =?us-ascii?Q?580RyHUGR+Hkct1230eIx4O5EC0vC/JqY3ZXNIBJwuX9M73PG2Qol3TH5zpw?=
 =?us-ascii?Q?izQnoNbI5nBS3IyxDTk5gFn+1vLBiwVVueb7ecPf2scplaXd20mKfxkf3HtF?=
 =?us-ascii?Q?QHsqVKN1zb9I8PvQeHNPnkKrT8ybD+iz0lcZIP2yotsmRd0XQeqeg/LR688y?=
 =?us-ascii?Q?qWKtOxpfG3YAXUG4W9cMwQNQrRKpdkmrV331hVZfs+cXWHOLft86cMXvhpCh?=
 =?us-ascii?Q?AYXJmBmXr75crBMOqfdkfJoCiO/HgcPoX3jQBeEW6rhXXjC/marSpGbfS5pk?=
 =?us-ascii?Q?w8ybeSNmV4EpS40ZLseZONL8gOCZaAs0OAL//95FBzKiTysW5Otigw2dEvLw?=
 =?us-ascii?Q?x3ZtBQgGtpG8ei61MQmUuSjrS9ZFVINwpsFRtJALkxEVecOsv6fUrgRvox9Z?=
 =?us-ascii?Q?XTEv17jUgwdjkO37R2p3yRZU2XtJ5Zzzh9ZKZRStF8ofsVIjTEf0/Yd5tmhz?=
 =?us-ascii?Q?4k5St8TY7Qz0YOFiH1nOj7s304U553bbmMvnvbkIkuzVNJwhwQ/sVLBpS341?=
 =?us-ascii?Q?bqUhe7/JWioCG6y0MQM+NdKrrA3DjGtVyKlg6fej6+d/cDB8BwPzC4FEcAao?=
 =?us-ascii?Q?BSx1ZC22OyeceyMA65efx0T3OOTtuVTHEI/ryMfjkwnc2GqP2ujsNSD0KtxD?=
 =?us-ascii?Q?tclL9aDT4cX8gKNTTjrfZI/iUMGczhXdn/L+u5QgjF4Q8DMK/oKzm+GKVkku?=
 =?us-ascii?Q?FioG4CI8F6rtGykikY9msqRqRVM8WKYpjt7OqCqSMp+pPr/trbA81U4BOe6F?=
 =?us-ascii?Q?Qi+ObIVXI6gqVdbYYMwTEHb6MUMqprRr/NtD6ApknWrEUmEBblKXBhfz4Iz1?=
 =?us-ascii?Q?zLbkF4VlPA8Y7uRrd4BszVgWmenEePwL06DvrDYUxR1HKdM4WDYib8eCvBOf?=
 =?us-ascii?Q?V16XgNd5uepHAgVP4oDWf0R4yNAE89qSFUImlzcWdhcFsKBeqk5m+ecLimz4?=
 =?us-ascii?Q?DHYRTdQhMmje5MarO8D3uAruGdisBqqKxqPgFV5nfYQrt3GMK1FmmZH5zlcV?=
 =?us-ascii?Q?TuL+IcwqVVu7fcEzQJax+L2aIUCbAbovvIjfp2fbR9wuOi/KyyJx5Erb7JA9?=
 =?us-ascii?Q?0kGVp2h1oAeoJOdJ8YHuAgpzMD9709FmrOkc8pOXY9HpejnucI3IPzbaGzIX?=
 =?us-ascii?Q?fIpINc/EG1CA0jS8xACL2ml91oeSHp8yiJobVppay1J7cEfT7WD1vUvNs7UG?=
 =?us-ascii?Q?/dL4S178eCrA3OYIuwwAad6/pEupVXA6UHf1astRDCHeaLaSv0RE?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 40985be2-cb5f-48d1-4291-08deee55993d
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 16:14:14.4312
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cQj1FdX3RJLIge3mmLhlu22y1PfJWkmUAU9/N1LK2ogl2i0aAlrCdjdfeyFzp8RLxVF7iDfhevmpnMw8rxfPFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZP286MB2395

On Fri, Jul 31, 2026 at 01:07:01AM +0900, Koichiro Den wrote:
> The interrupt-emulation virtual IRQ uses handle_level_irq(), but the IRQ
> descriptor has not been marked with IRQ_LEVEL.
> 
> The interrupt emulation is somewhat unusual: the eDMA interrupt handlers
> dispatch the virtual IRQ for every edma_int[] interrupt because software
> cannot reliably tell an interrupt-emulation event from one caused solely
> by DONE/ABORT status. If an interrupt arrives before the doorbell
> handler is registered for the virtual IRQ, the IRQ core marks it
> pending. When the IRQ is later started, check_irq_resend() treats it as
> non-level and replays the pending interrupt, causing the newly
> registered handler to run for a stale event.
> 
> Mark the virtual IRQ with IRQ_LEVEL so the stale pending state is
> cleared without being replayed. This was observed in pci_endpoint_test
> as two doorbell handler calls when the DMA-variant test ran before
> DOORBELL_TEST.
> 
> Fixes: d9d5e1bdd180 ("dmaengine: dw-edma: Add virtual IRQ for interrupt-emulation doorbells")
> Cc: stable@vger.kernel.org
> Reported-by: Niklas Cassel <cassel@kernel.org>
> Closes: https://lore.kernel.org/r/ampndLtU32ODmncX@ryzen
> Tested-by: Niklas Cassel <cassel@kernel.org>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>

[+Cc Niklas]

Sorry, I forgot to Cc Niklas.
I relied too much on the get_maintainer.pl (again..)
Niklas, thanks for reporting, discussing and testing.

Best regards,
Koichiro

> ---
>  drivers/dma/dw-edma/dw-edma-core.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> index 89a4c498a17b..ec097c68cf5f 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c
> @@ -755,6 +755,7 @@ static int dw_edma_emul_irq_alloc(struct dw_edma *dw)
>  		return virq;
>  
>  	irq_set_chip_and_handler(virq, &dw_edma_emul_irqchip, handle_level_irq);
> +	irq_set_status_flags(virq, IRQ_LEVEL);
>  	irq_set_chip_data(virq, dw);
>  	irq_set_noprobe(virq);
>  
> 
> base-commit: f5098b6bae761e346ebcd9da7f95622c04733cff
> -- 
> 2.51.0
> 
