Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=40.107.162.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792752766;
	b=TPqnglXy1eKQwdZrWAtW9YYaru7Lzgrrj//KT164XwicZjvy8fJlg4rWuQvYBSvhYJTM
	 ZHo3TFEuX93xQJX9cSo/MSUwSfydGhwf5FYpt0OWkijGGAYuoq6xwAJ0KsUq1QT/wyBVV
	 g1VQbLLKmnTr1neG8ytE9lFmH/pgnY/epxFT9R0ks4KfAVChDUrcRFi10Cs76GKd3Urnv
	 PzHRmEof2k0qmLY9CIVMIt7VyvuOsZxVH4/tTN40PshAJcNWTlp0FcDElsR62Jjeh7lOd
	 YxetVQVNLw67vMBd5AL2CQibaIDQURsFYyyCt+yBEMzACWYsvFceWDpMr7c/HVsjxwQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792752766;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=pQaOnaZcTVvEme48jC747zRkwN9tYKHxM1eQHEK2nGA=;
	b=XnUxcPZEnPZm5ioxAQI+f/IIGI9YBvswcHYcaRhn0tnUyNpRJYyqFcXnRl0Cyy1MUUGM
	 End/FjC1Ljl/ksDPTGl7kXXuGMfBuLP9YuGtT2omndCDZdeNH8EWWBz43anEEYJb4LfRD
	 krc7cQ2zXNLOyYPFXCDqIkZJtoDJhEobnVv8Fc3NslVqL7aJObM6DwSckVGbT9FTCXj7n
	 +rwrnFQ36619DgtUszuvjk6bJXv7oF3Yhypdwhi/9+6veC9r9SbhQMnNRA9lhn7IBWUw9
	 0YJswWRS97jt6KLRNmiVW19IvoniYT/yBzdlCRAaPmqbZryQHs/wnbvh4qOg0S/4QpA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=fail reason="signature verification failed" header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=oQUvbmzm;
	arc=fail smtp.remote-ip=40.107.162.18
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013018.outbound.protection.outlook.com [40.107.162.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E8E606A326
	for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 10:52:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4E8E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=oQUvbmzm
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kQHem3nrvNDXWM3CJHjnxsTDhZKWv44U1R4PGC4VpDLB1LxbX00GvyU8BpNe5dolAkDDl3eZMLRyaAS9MH62E0qEcwm8dxHL0EF9PPXCS4z48yvfD3G6GO42SyLt8MKKT/M53Hq6pOZFd9zeASegHUJF1ou9+HZPWNlMUh6M+TaaH3MXZZubcmyGX0Jk3WwfgvCH9vj8Ds8MQlxVIj3c+HgqTKC5BFjG5DyYvZqhbAiGPVQD1lD7NMNOm4s+LKe0v3dRnqjoKU6D3856b8o1BuWwbNYszyz50cp7xuofQKDe10WKDGGtCPoWg0xbIJ/55/3IVwtAMu+RVwBWyDr9Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ROlvWVofN9R2ubw1i9wE9RkoLmGMd3RnJgd+1VD6tU=;
 b=LPdtYrBjvu1cklZDq0UTL19f233ElX/jvoOdqmu9dX5C6PMRYHLBdSx8sAXtlECM/XXmG/cB1Pa6h2azcyhh2FtSD34Qaux8ZbAFk1GeRWTa3bP/UN1tZkXOagwmqH3Ddb4lPpox05YujGRWtGVKfmZxrl9FpRdYphypNOV6/3/vIxaihY5CM5fi15cEyvRIabK47sO53tmcsEFi4Ab7IDCEzBpy2RQAAowBPdx/WasF8WuSu99k9Fu3Ua2M1S/t/TmzeNtmMuJhw9WyUDuTWjjEV7nhYmeKAILng5mtIJDe149/OK+xRadMkRB/XJt3L/RF2Qol6gFvsiti8pjfdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ROlvWVofN9R2ubw1i9wE9RkoLmGMd3RnJgd+1VD6tU=;
 b=oQUvbmzmmDRqnYoA5k8nxvHYvZh2EvYuWtK79w6yaHngYKUYSIDrSGAxqO8jGfV41MF22UaiXYU6ayQo+wZF8ZOzhUGmxuoH9ehmcbeJbH0+7yFeLFoTlGDBxVujqN4Cohkm1XoaeM4gZrjeOfKegpF9ndVv1FfI8nXR18iwZ2A7PFijm+5xWFe1+yRbkGGugtNWM8aFCW+LnWteryQxHeV1R6qdd9jLAJu+3E8BVvf9dyKdiGidlryD55+5GLzLO5F9+UY6vsHZBOYA36s0Lwxpd21yWA4QHIZbke5UN2kqEXUbieubxSILFh7V6xSwXBSd5Sg1FZOwkU+n25tMlQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com (2603:10a6:803:ec::21)
 by GV4PR04MB955734.eurprd04.prod.outlook.com (2603:10a6:150:402::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Fri, 23 Oct
 2026 10:52:42 +0000
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de]) by VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de%4]) with mapi id 15.21.0546.017; Fri, 23 Oct 2026
 10:52:42 +0000
Date: Fri, 23 Oct 2026 18:57:18 +0800
From: Joy Zou <joy.zou@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, vkoul@kernel.org,
	dmaengine@vger.kernel.org
Subject: Re: [PATCH v6 4/5] dmaengine: fsl-edma: add runtime suspend/resume
 support
Message-ID: <ats9joQ5d/Je3ONA@shlinux89>
References: <20260701-b4-edma-runtime-opt-v6-0-354ff4229c00@oss.nxp.com>
 <20260701-b4-edma-runtime-opt-v6-4-354ff4229c00@oss.nxp.com>
 <20260701094312.B0EE61F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260701094312.B0EE61F000E9@smtp.kernel.org>
X-ClientProxiedBy: MA5P287CA0300.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21e::13) To VI1PR04MB5807.eurprd04.prod.outlook.com
 (2603:10a6:803:ec::21)
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
X-MS-TrafficTypeDiagnostic: VI1PR04MB5807:EE_|GV4PR04MB955734:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fcc1ba2-ace3-4368-eb84-08df30f3c0fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|376014|366016|1800799024|261021121427099003|6133799003|18002099003|10067099003|22082099003|261021123027099003|4143699003|11063799006|5023799004|261009223027099003|261022105027099003|56012099006|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	xui0rJLmkx5n9FMoYiiop55q4X6TEF0NMnww0eBxepJwy4ecYvD8z9lJd6zfaenQUBWHjY4eiiDqSkg7ewd8McrKREnCcRAsS6AsFro+cRGPARf3q7YDpDKzRI41ddNpn1WnNDYqyZFLrsMvTMnwyCHAfGop3eEg2DMy8mn5PXgKRvztW8YDC5C9nYRxmsOQz8GvgPE7RQCTiUoT7jsuZb2pnR1YwlfxSgWILt2kZAjYMXMVFMkQB64lW4wjHCGD1TZM/A6r5pylRLPOjctu5T+AZ44WXD/JkZBChHqsdgcX8GP/vvppqC/espy9dnvlGRlJdUfqL6vuZ83xOGCFrmQ2ZW6nEeU9+EY9757VJkQ8ZJeUfMyZpj1LxgMaCHvD0wX+CmDUB6ZlzeYcYVkeG+Rlvf2WoGIvZpeLLmUj6Fj0bkUc9pgGzcprZamNQdv0WpYVC+n2ynad5u897BXk2mNWliAjFfz9x7tLfb+/Nz8uTC1iqPadix9Z3LImJMJdcyJn6bEqID+VsrDXORiS0PjlJYzy3DSX7XwkzD5S5U23qsntBJxJOXavS0DcIA9MlfCTcAxHDQFVJ2aD4GtLoQd4rbRIS564c6f2dZAHHPo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5807.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(376014)(366016)(1800799024)(261021121427099003)(6133799003)(18002099003)(10067099003)(22082099003)(261021123027099003)(4143699003)(11063799006)(5023799004)(261009223027099003)(261022105027099003)(56012099006)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?cnUcAGVAs5Tx9lwT3mJ6ipmb/MvI+PsLhTJ5UQ4koTeMVq7gVVrdP9KwD3?=
 =?iso-8859-1?Q?kFEoHRQHpLuXu+YMo/F94spCWqr76/oY0hWFAm01nLIq7laaCGTAkaCZtf?=
 =?iso-8859-1?Q?7pHQQFgeZSQvLkwipdhB/GShZigUC5vQtwv1IueQ7Rcg2hq763UHcDfswD?=
 =?iso-8859-1?Q?BVBCviEZKJ4riPRgTPeEocIRUSrvX64s8llrrFXloa/aMOkuQ1ZbrvcYjR?=
 =?iso-8859-1?Q?Dnxd5GMgEapi8S18QKv3/mOW6BvIfoOPUZoaKTHLWe6QIRRMvcymuv4wSm?=
 =?iso-8859-1?Q?ZsJh/yifOTsqEHN4HK4TPHClfTpXza9d/cAHqmaNEcoT59cMYdZ6tpyqe/?=
 =?iso-8859-1?Q?eTASaU3A/uMtk9+zfFzZzE8Pu92ROYPWZmHd3VZbYZpJHo0OS4X0DA6BCt?=
 =?iso-8859-1?Q?guN05N+YmoaSSd/qT4Rm8/v2I+5cy6tLlMXpqh307DGfKwKNfX5h9kH+bi?=
 =?iso-8859-1?Q?U7IaNLFJa6vwmtMuMtSe9VFZumBdJrqstsrooCTE557l78IyP78TqQZNUY?=
 =?iso-8859-1?Q?/e1v/LnPgXSqNhYN0xNAFKN76F1whmrEqomjWLfEu2BqiG7WvCqUFEG8rg?=
 =?iso-8859-1?Q?HH7mcfizcv/nXKkqIyfOutQImjHaCZ1YgakXZFO6kszZTCx5JMTV6JYV8/?=
 =?iso-8859-1?Q?cDv9lfZMn9UZnUaRSg3UWA+jhJKgMXcpaBkBTA2DCeGz9ZngLQK+zXzRkh?=
 =?iso-8859-1?Q?0qPR16WtO0dYXBfLviIQEzndo58yOu1X1zXQjt+ZBbjMKQMPvJJdkitiar?=
 =?iso-8859-1?Q?12/1z5Q1cDBzzof9D3j4An81nvIoES89uRXxIb9aMNXPupjnbSv9x7/Kmv?=
 =?iso-8859-1?Q?VsZHoxBJRXjXfCZeD9v+7/w/KYtbAh38so4FnxFU/piUOTSUVMETFY5tT6?=
 =?iso-8859-1?Q?oeQeFjwJOMSC22G8mTKrcoG8etegsU0qnrg+3xQRToHfJD/pVs/wwGaPCi?=
 =?iso-8859-1?Q?h6LheJRptRPbJ5twtvNelgMbbc793AlFiLWiI/kWJgbGKygVkywLX7Cf1g?=
 =?iso-8859-1?Q?znav4OHTsqxNvRzELnSE/zXs9tMX26mKC5gMxRASd8lpZQ+xLAibrXbqqS?=
 =?iso-8859-1?Q?lrUiaTzBWItkwcx6Nw5PdSPu61f/Olm40Gi9L9jYGQmwqCU/6iaVf917jQ?=
 =?iso-8859-1?Q?8kyPVSvQPLb8ZnAbK2TmZSDbPNPHXqKUSN1OTVqNANPWKoBZzcbQkVtdXN?=
 =?iso-8859-1?Q?ihBBGrjFSsOqA8ebLMiX1/uLP3BBbgHcGolGIPGnHevgkkne9UkzOy9aLt?=
 =?iso-8859-1?Q?PxUA20R1hmKppsvmTTwVlFVvWZma/ClP+P4G2okcb8hQs2SrjloWIi/IBg?=
 =?iso-8859-1?Q?q35n6Ar7SRBxgwZf8/rOKhDvM4fO894VeFkGJsMzj3cQ1fQQ8LAEadQgYR?=
 =?iso-8859-1?Q?NYb6iifHAKQPMiXynPp0XNenHBwu4qWJ/h1/Th6ZOdv+dzMJ8TlMxP5c3a?=
 =?iso-8859-1?Q?MxNzyS+kqvHR0Iv5H30KSf9MxdOFGyaapkixA/HkBfdBCzYxyeErh44mxz?=
 =?iso-8859-1?Q?01EZlD7j11lkS29LJ7WsB0OPQ3BnA+7RXF/osuSkCRGT42hLwobj/iQLeU?=
 =?iso-8859-1?Q?Eu8eArVGkfkVALgRfFnGw3/7+LsMyE+RVYAdDYA3lUsZTJKiCQjCoY0r+u?=
 =?iso-8859-1?Q?8HHmcSfktCxfdpyiGRk/kFpR/MDPbN7OwwcQ5IfjUDNtCeh4XhvU3AVHLH?=
 =?iso-8859-1?Q?1V+wZfYkHUijHHULn8clwutloL5DIdSrV6h+3Gw7rHovH5lJvrh9qKDruo?=
 =?iso-8859-1?Q?QCZa+oPGexPxlcvZrJUB+2MiAJ+hDZ5qGPQ3Xt2k6CI3RSA6JAV+HDeDzu?=
 =?iso-8859-1?Q?7buVDpbVP40MvOpqO74HbbfT8iCgXX8cW3IzQh6DEkJyX4HfvqNI?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fcc1ba2-ace3-4368-eb84-08df30f3c0fe
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5807.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 10:52:42.0492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4mvWoah3Ahw7r5Jja+O15lBciQ9aAjLwkpaCeZT406fr5vKzJKtt538iJvGR10647fQdsZYPUYjs77idBBQki3tq//AdxEOJuKeBh110BQrQSeHRpFS2z/D+tCa15QSI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB955734

On Wed, Jul 01, 2026 at 09:43:12AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> - [High] Skipping hardware interrupt acknowledgment for inactive PM channels leads to an unrecoverable infinite IRQ storm.
> - [High] The channel runtime suspend callback calls `synchronize_irq()` with a negative error code and fails to synchronize actual per-channel shared IRQs.
> - [High] Accessing a freed `device_link` in `fsl_edma3_detach_pd()` due to devres teardown order inversion.
> - [Medium] The DMA engine and its channels are exposed to clients before their IRQs and runtime PM domains are fully initialized.
> - [Medium] Runtime PM usage counters for the engine device and channel power domains are permanently leaked on multiple error paths during probe.
> --
> 
> commit a5800ff547600d938eb443a21684d6291b4658d1
> Author: Joy Zou <joy.zou@nxp.com>
> 
> dmaengine: fsl-edma: add runtime suspend/resume support
> 
> Introduce runtime suspend and resume support for FSL eDMA. Enable
> per-channel power domain management to facilitate runtime suspend and
> resume operations.
> 
> > diff --git a/drivers/dma/fsl-edma-main.c b/drivers/dma/fsl-edma-main.c
> > index fe02b68d75fd3..3518dfb4292d2 100644
> > --- a/drivers/dma/fsl-edma-main.c
> > +++ b/drivers/dma/fsl-edma-main.c
> > @@ -37,15 +37,27 @@ static irqreturn_t fsl_edma_tx_handler(int irq, void *dev_id)
> >  	unsigned int intr, ch;
> >  	struct edma_regs *regs = &fsl_edma->regs;
> >  
> > +	if (pm_runtime_get_if_active(fsl_edma->dma_dev.dev) <= 0)
> > +		return IRQ_NONE;
> > +
> >  	intr = edma_readl(fsl_edma, regs->intl);
> > -	if (!intr)
> > +	if (!intr) {
> > +		pm_runtime_put(fsl_edma->dma_dev.dev);
> >  		return IRQ_NONE;
> > +	}
> >  
> > +	pm_runtime_put(fsl_edma->dma_dev.dev);
> >  	for (ch = 0; ch < fsl_edma->n_chans; ch++) {
> > +		struct fsl_edma_chan *fsl_chan = &fsl_edma->chans[ch];
> > +
> > +		if (pm_runtime_get_if_active(&fsl_chan->vchan.chan.dev->device) <= 0)
> > +			continue;
> > +
> >  		if (intr & (0x1 << ch)) {
> >  			edma_writeb(fsl_edma, EDMA_CINT_CINT(ch), regs->cint);
> >  			fsl_edma_tx_chan_handler(&fsl_edma->chans[ch]);
> >  		}
> > +		pm_runtime_put(&fsl_chan->vchan.chan.dev->device);
> >  	}
> >  	return IRQ_HANDLED;
> >  }
> 
> [Severity: High]
> If a channel is runtime suspended (e.g., due to a hardware race or a spurious
> interrupt), the interrupt bit is never cleared because the loop evaluates
> pm_runtime_get_if_active() <= 0 and continues to the next iteration.
> 
> However, the function ultimately returns IRQ_HANDLED unconditionally. 
> Could returning IRQ_HANDLED without clearing the hardware interrupt flag 
> trick the interrupt controller into thinking the event was serviced, 
> potentially leading to an infinite IRQ storm?
> 
> This same pattern appears in fsl_edma_err_handler() and 
> fsl_edma3_or_err_handler().
> 
> [ ... ]
>
Add the following comment to the code:
A racy or spurious interrupt for an already-suspended controller or
channel is an extremely rare corner case and highly unlikely in practice.

> > @@ -691,6 +711,36 @@ static int fsl_edma3_attach_pd(struct platform_device *pdev, struct fsl_edma_eng
> >  	return -EINVAL;
> >  }
> >  
> > +/* Per channel dma power domain */
> > +static int fsl_edma_chan_runtime_suspend(struct device *dev)
> > +{
> > +	struct fsl_edma_chan *fsl_chan = dev_get_drvdata(dev);
> > +	struct fsl_edma_engine *fsl_edma = fsl_chan->edma;
> > +
> > +	if (fsl_edma->txirq)
> > +		synchronize_irq(fsl_edma->txirq);
> > +
> > +	if (fsl_edma->errirq)
> > +		synchronize_irq(fsl_edma->errirq);
> > +
> > +	clk_disable_unprepare(fsl_chan->clk);
> > +
> > +	return 0;
> > +}
> 
> [Severity: High]
> Are we synchronizing the correct IRQs before disabling the channel clock?
> 
> During probe, global IRQs like fsl_edma->txirq are initialized to -EINVAL 
> for SoCs using per-channel IRQs. This check evaluates to true because -EINVAL
> is non-zero, causing a negative error code to be passed to synchronize_irq().
> 
> Additionally, this code doesn't synchronize the channel-specific shared 
> IRQ (fsl_chan->txirq). Could this allow a shared IRQ handler to execute 
> and access hardware after the clock is disabled?
> 
> [ ... ]
> 
Modify the condition to verify that fsl_edma->txirq is greater than 0.
> > @@ -891,6 +917,64 @@ static int fsl_edma_probe(struct platform_device *pdev)
> >  		return dev_err_probe(&pdev->dev, ret,
> >  				     "Can't register Freescale eDMA engine.\n");
> >  
> > +	ret = devm_pm_runtime_enable(&pdev->dev);
> > +	if (ret)
> > +		return dev_err_probe(&pdev->dev, ret, "Can't enable eDMA engine PM runtime!\n");
> > +
> > +	ret = pm_runtime_resume_and_get(&pdev->dev);
> > +	if (ret < 0)
> > +		return dev_err_probe(&pdev->dev, ret, "Failed to resume eDMA engine!\n");
> > +
> > +	ret = fsl_edma->drvdata->setup_irq(pdev, fsl_edma);
> > +	if (ret)
> > +		return ret;
> 
> [Severity: Medium]
> By calling dmaenginem_async_device_register() just prior to enabling 
> runtime PM and setting up IRQs, do we expose the channels to clients 
> prematurely?
> 
> If a client allocates a channel concurrently before runtime PM is enabled, 
> fsl_edma_alloc_chan_resources() will invoke pm_runtime_resume_and_get(), 
> which could fail with -EINVAL.
> 
Move dmaenginem_async_device_register() after runtime PM is enabled.
> [Severity: Medium]
> If fsl_edma->drvdata->setup_irq() fails here, we return the error code 
> directly. Does this leave the pdev->dev usage counter permanently 
> incremented from the pm_runtime_resume_and_get() call just above?
>
Move fsl_edma->drvdata->setup_irq() to the end of probe() and use
dev_err_probe() on failure.
> > +	for (i = 0; i < fsl_edma->n_chans; i++) {
> > +		struct fsl_edma_chan *fsl_chan = &fsl_edma->chans[i];
>
 > +		struct device *chan_dev;
> > +
> > +		if (fsl_edma->chan_masked & BIT(i))
> > +			continue;
> > +
> > +		chan_dev = &fsl_chan->vchan.chan.dev->device;
> > +		dev_set_drvdata(chan_dev, fsl_chan);
> > +		dev_pm_domain_set(chan_dev, &fsl_edma_chan_pm_domain);
> > +
> > +		if (fsl_chan->pd_dev) {
> > +			fsl_chan->pd_dev_link = device_link_add(chan_dev, fsl_chan->pd_dev,
> > +								DL_FLAG_STATELESS |
> > +								DL_FLAG_PM_RUNTIME);
> > +			if (!fsl_chan->pd_dev_link) {
> > +				return dev_err_probe(&pdev->dev, -EINVAL,
> > +						     "Failed to add device_link to %d!\n", i);
> > +			}
> > +		}
> 
> [Severity: High]
> Could the teardown order of these stateless device links result in a 
> use-after-free on probe failure or driver unbind?
> 
> Earlier in probe, devm_fsl_edma3_detach_pd is registered as a devres 
> cleanup action before the DMA engine is registered. 
> 
> However, the stateless device link is added here with the channel device 
> (chan_dev) as the consumer. On unbind or probe failure, devres actions 
> execute in reverse order:
> 
> 1. The DMA engine unregisters, destroying chan_dev.
> 2. The driver core automatically purges and frees all device links attached 
>    to the deleted device.
> 3. devm_fsl_edma3_detach_pd executes and calls device_link_del() on the 
>    now-freed fsl_chan->pd_dev_link.
>
DL_FLAG_STATELESS means the device link will not be automatically released and
must be explicitly removed with device_link_del().
> > +		ret = devm_pm_runtime_enable(chan_dev);
> > +		if (ret)
> > +			return dev_err_probe(&pdev->dev, ret,
> > +					     "Can't enable eDMA channel PM runtime!\n");
> > +
> > +		if (fsl_chan->pd_dev) {
> > +			ret = pm_runtime_resume_and_get(fsl_chan->pd_dev);
> > +			if (ret)
> > +				return dev_err_probe(&pdev->dev, ret,
> > +						     "Failed to power on eDMA channel %d!\n",
> > +						     fsl_chan->vchan.chan.chan_id);
> > +		}
> > +
> > +		ret = pm_runtime_resume_and_get(chan_dev);
> > +		if (ret < 0) {
> > +			return dev_err_probe(&pdev->dev, ret,
> > +					     "Failed to resume eDMA channel %d!\n",
> > +					     fsl_chan->vchan.chan.chan_id);
> > +		}
> 
> [Severity: Medium]
> If pm_runtime_resume_and_get(chan_dev) fails here, we return directly.
> Does this leak both the engine's usage counter (pdev->dev) and the channel 
> power domain's usage counter (fsl_chan->pd_dev) acquired earlier in this 
> function?
> 
Replace pm_runtime_resume_and_get() with PM_RUNTIME_ACQUIRE_IF_ENABLED().
> -- 
>


























 Sashiko AI review · https://sashiko.dev/#/patchset/20260701-b4-edma-runtime-opt-v6-0-354ff4229c00@oss.nxp.com?part=4
