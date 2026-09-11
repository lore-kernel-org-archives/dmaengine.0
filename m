Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011019.outbound.protection.outlook.com [40.107.130.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D16836729D;
	Fri, 11 Sep 2026 15:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789142318; cv=fail; b=JhopX6DA9GuNfeQeswA/ZqL5OgdKP10IHeH67ZJw2kaMYmFT2RbQrBWkmb7PgKTSl+aHJN/j389RuTuQlfykoKZ4WrKO0mi8oEdMUbbVGtxumx4vMeZIyOTboIKWnFFxQITjG1KSpyjrphOkOnnpiIbeuPSGSIcOlHhi4cYOjNk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789142318; c=relaxed/simple;
	bh=/XBUgfl+ksVIy0hhXklYcLhnPEerOiwkDYzziTfUEbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KLn1yvzBI4u23Q7VMmoTxYIbMUWhR534LxFZBS2IBdf6g+/PVebhaAiYG3fwNt7xMqo1v9xIQJtPlEtC26qqIAJWlnR5HY9DsRjX7OfQ2A6yaddXk8B38pjG9n219oWJd/pINQHgOYR5B+o9HCbp8CLZrOAQuZiZcdUNsKsx7lk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=LncRU2N9; arc=fail smtp.client-ip=40.107.130.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="LncRU2N9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lme3RQGQy0nrkCV9wlPHqwJOEkucaTlVjBZv3LitZvBkQHwgVFLzebQs0OHvSC09dkqERgP3YbBlLEQBKd0G+ARS78lqvHtgAUODOT2BwbzsAd7a2R1RqGxhRBA4oxZvHsJ3jjz678exmF//tXhyEj7Ya0TUZNAKgFyX/n3wgSNgFkF9cxlKLplmamwkkEF/ZieVPoYDDM52ymFRsaPD9nZ4l8oVrJ/eFupW7WnzdBkK2L9AtmJIprTe7vPTlT9BtkEtYYSDWlTKJVkl4vcggbOlTrx7IFX8YDwCHsU6df0pJwKuXb11DGUw/7cE2UWTOehbms3QnQMtciD7J0eIJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RX5JrLyZV8x+6J8FLYeXWz3WIeruEvzAUOJBn4zG9ys=;
 b=d83JPXW0eYUrdQO1g/nRSIkr6honSScRoxBIEbXcGC9vT3Pk3Z53/eXA3eX/vU3A5k6fbThRxylgUSJu9VC+7grvAhoBzsz239mDyX5HAB22FVs4oPMPIM+7+BMAHjinmtH/Qi4pG7aTgy4JrPhEAZWuxKFfJ6ypZmkvk8GqWdauVv7UcMqv+YyqIFVH2xUO33ZwTBwpR55zI9v6DXeEZYbnfqYEeILoBXmqpbt7O6NvDX0LhfQv/x6+Ua6S5eL0GKVnr619+r0W7ouW5ZTxr76zF5iZAqrMTf2IvAU2tO3AHJxu3YCX10NgcTohOLdj8h3W/jtAzW3pglsi+N57ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RX5JrLyZV8x+6J8FLYeXWz3WIeruEvzAUOJBn4zG9ys=;
 b=LncRU2N9FofrpC59xeMEIFayfMVVO9jfPeWd2nae4+YsKjcqWWYiXOHkWwXxQEMKHvNlnofImeT793FYMqp701knfFtJ9pw5BU+BTPOTZLyC8/1orbQ2G+UxH5G3qY1iG51UbcwJdwxQvKutMxyzexIPMjPG6eff09FJp+goafb0UP75svXovRk75YGJLSQP7Z3SY+v8duzoaXozwfUszL53TLcP35kfxDUTxZnaZ6mWR1L8e5feWckROZtzUdtQbaoB0YVhIeXS/CmNjWk2R/YIeENg0HZN0tR6tpryOIzpLujXv6EE2d2E7AZ3C2wGxW9TlgBJedfAeIXRta9/QA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB11632.eurprd04.prod.outlook.com (2603:10a6:150:2c3::8)
 by PR3PR04MB7451.eurprd04.prod.outlook.com (2603:10a6:102:93::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.13; Fri, 11 Sep
 2026 15:58:34 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::3c3c:c28a:d3b1:edea]) by GVXPR04MB11632.eurprd04.prod.outlook.com
 ([fe80::3c3c:c28a:d3b1:edea%6]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 15:58:33 +0000
Date: Fri, 11 Sep 2026 10:57:25 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dmaengine: ppc4xx: use devm_platform_ioremap_resource()
Message-ID: <aqQk5dNhI2kbx4ip@SMW015318>
References: <20260910212018.67728-1-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910212018.67728-1-rosenp@gmail.com>
X-ClientProxiedBy: CY8PR19CA0026.namprd19.prod.outlook.com
 (2603:10b6:930:6::27) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB11632:EE_|PR3PR04MB7451:EE_
X-MS-Office365-Filtering-Correlation-Id: 46da857b-2152-4c3a-def2-08df101d63ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|19092799006|376014|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	KidXJh8dYpa00kRIYiWM9cES3RRPB6jK2j7MeVD+0zBR4z2Zq/3ky9o8VzdnmvKqkbp/1MDYrURIhI5R09IsmzH0c6LQLR5gp/SeWGP8BVKd5n8/B0XM83UEG9YEQninoqNqFaWKt3znm6E9VMxG/AEXwGVOy0fhzChBs1b8JL/++74vDjHFfPyJTuqkLfvmRkgH7dTlhm4mBwr55Hp9JCYmWwDsVSy+czjE6yTAXYrIqrilr/stFUoHjgd9nYTN5QcdJ/JHHSiUoDVg2leqXJ7b+3/k+8YV+Hl5Kpqgd063FfdDYhSokf2KOtoRmixCuvfLmkloxF3BZiA/NBdIwFMZbV36fzMPEUD87HJytoV56jl1NZr7RDwtcXzR2VB21zOdQLA1Uunuj70H/haF2JWA9Qt7wC8SBSbSW/Dfz6fgcrgpHKTdaETZtSxEvuSMQPtd98JG6g+oz3nnnjrTGeqP1JvmIfPhnI4i8zgturkqhpwo+4oIZxKh+cbqNrwS+aAkbaDuAg2/AEQcF6sN2ZZfjN3J8foNplWf96W23DQWSR7bmbqKYdPh9iRpWVABTZoxd3CmhQuHeVkbjMdnCLOp3SUVyK9ayTh/ej3ss0d/0CTx5iin/QVhq+YxlQeuYcyjrtptA29bCnbzcxBnJng5kGh4l4axw6N7YW7Sf3c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB11632.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(19092799006)(376014)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6eRDOquXLSkbaBqKPIklEwtp6ERPTp7itIJpT0MVBpgGnd6PYThcvVKyN/EV?=
 =?us-ascii?Q?8bAhIRPN/vJpfdJB11HFBae4qStfVXSyuVCONJ9sPkETzp26ZJeMBcP/13p2?=
 =?us-ascii?Q?b6unpsZtAN1dbUhx7cslzS1WEaIjnggZ5LDUfCvD6OXDqQUQiuyCbjMFVpXo?=
 =?us-ascii?Q?SxU1TIc9nEP/Ls31n2uIER1y3ssllF6WGl1hXBScflXwahJvVQg4L9emIqVV?=
 =?us-ascii?Q?IbSK8x5FNAdrgXLI8TDE7Iwao7/6O7/wRJM1KJvwd5zSjFPlufMfTAAherzl?=
 =?us-ascii?Q?Gx0RoELXLiZ2Jmxni705vQADnU1zejiFPpik96oaGe6B9WnaH9fVxkYjr6oi?=
 =?us-ascii?Q?CvFGyer+/z6RuVcSz+wWJvfD9my94SJ1vK33vBGQ/c/CEAekaJyl9EMG7c1X?=
 =?us-ascii?Q?najIzUJwjavkjLts1nEC4A235S8L17TAXzv7zSyzMrQ85jF+VNjqTfVXJcj2?=
 =?us-ascii?Q?SED4qYGo6SZp8xR68xFjvNwLpLrvCt7UHBAnCAprFBQCIdANpZ1lDSvT/Mrk?=
 =?us-ascii?Q?pNLTWGz8CW04L7Qwa7+FDLmogy1yR8D4Cm+fFgwo9+qBE3oqlPKTPDl80XWW?=
 =?us-ascii?Q?0x9V2kwbP7tUjs2xbWjdRl14P5EWEr5CRahazXeQiaXbJcjtCl2WC1gKYv7m?=
 =?us-ascii?Q?WUdSlaxHQQBOJbDEOnua2lYfIgtL6KUUbTkOOEBbXEsjvrkI5w+Wp6J/vaBi?=
 =?us-ascii?Q?QBtyeB8O/h3VoIDLtbQzApXD6EOqKVkgfIrYyYFl/4hGLHtFA/5vl0iPJ21W?=
 =?us-ascii?Q?Z7fVQT0tY5KVmH3N6oiyhKNDKhhhrO2IaEHa2yRnZns9Y+2N66tQIJROaoJK?=
 =?us-ascii?Q?NbTHBxUwIWes4xGVrFzO+RE8nZk50bRjCBgqsblZtr2L+qLEWHzCZyzSD0bE?=
 =?us-ascii?Q?sq9Gyfbz/SN4gv42YBJ4W1pMmcsqHICLRy9C4MwboHE4gwfdk2LtPJ7fU37N?=
 =?us-ascii?Q?D8/ioUfClMD4hN1aB6lMGelm5Wmm0R4QpPN+Vr1D6+K9zS1Z6bJKqi+hjEWe?=
 =?us-ascii?Q?wAoYMEMcnoU3+UI+2136ZyY/9fEzrMNg7L+QyaiTb1EwErks4i0aAImCKrB/?=
 =?us-ascii?Q?Pf6y71qUNYe6sOpthPU60GQ+FhBQ/5flTjXugGQBOpfoZzMid4NXqvR/WubF?=
 =?us-ascii?Q?QyWJ/CKUsQgiPaCPlkhEG49yR2+zUaSPIp7wJ9MEUwHCZT3DijsXnW1U342C?=
 =?us-ascii?Q?XTrLbn/lmxVxQ4A/YqKtWOMSx3eSqaP8cReFtbg9NzXyX32HR/q+mPznnjCX?=
 =?us-ascii?Q?sZOu3RL12I+jmPWQy37cv+IsydA4rIDmXooaE02ZzX4tk2c+rg0AngPpWi5e?=
 =?us-ascii?Q?JWiZ/LLuA9V5Z0rkKrwwHSj/dvJoIZbhP/GFXs57qJGQOtIsit7ggjMUKtVM?=
 =?us-ascii?Q?M9obypKE4mw6yko02sVRhhwylvxtCCUCdeFMYZ2rTCk0jUD3N+D4dQzkffCi?=
 =?us-ascii?Q?XLw6kb/MEEfwUNvZob24enyZSm3dFe+2sFy4CAUAiQ+0HhAWPoZkvkLeEg27?=
 =?us-ascii?Q?a3SpXLAldP03qT8yu5ww2iNMUtH8iJMJ4L4TJ0Lg47aviYu73ZUfrwyw2dHe?=
 =?us-ascii?Q?raurxc2WBDfm4eNISGxIleuZutPF0sMVLo+aSICSO0geCvMrupeJ8N3PaPhc?=
 =?us-ascii?Q?a2mFl1Nm7vj7nISf8pCHtXG0AxSxF7U0QpPhqndIT11OitRnZYbY8spHXmlS?=
 =?us-ascii?Q?Zcjp2eY+Er1KkQNgGupSKDXPCuuqH2CRT5N7TCt38TB6NXPrTZf34l5cy0Wu?=
 =?us-ascii?Q?hfZ1v3XKIgl2s2gDkPNREqTpN39B8pRlCW4xNkL8v5kQNaWsM393?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46da857b-2152-4c3a-def2-08df101d63ce
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 15:57:32.7294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zfrtYenTvSD4K59db1gedl2NuQ31GOq5WUKdA4U+Dph68IddRTe0cml4pLeyspHiPib9LCOAtI3Qf1B8XZ6243Sjmf87ba52ZxLfgP2Drb+kF1jg1PzeEZXFGFcNw4KT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7451

On Thu, Sep 10, 2026 at 02:20:18PM -0700, Rosen Penev wrote:
> Replace the open-coded sequence of of_address_to_resource(),
> request_mem_region(), and ioremap() with devm_platform_ioremap_resource().
> This eliminates error-path cleanup for both the memory region and the
> ioremap

, and lets the devm framework handle automatic release on probe
> failure or device removal.

cut this.

Frank
>
> The two separate initcodes PPC_ADMA_INIT_MEMRES and PPC_ADMA_INIT_MEMREG
> are collapsed into PPC_ADMA_INIT_MEMRES since the combined call covers
> both steps.
>
> Also emove unused PPC_ADMA_INIT_MEMREG enum value
>
> The PPC_ADMA_INIT_MEMREG error code is no longer used after converting
> to devm_platform_ioremap_resource().  Remove it from the enum and the
> corresponding error string.
>
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/dma/ppc4xx/adma.c | 46 +++++----------------------------------
>  1 file changed, 6 insertions(+), 40 deletions(-)
>
> diff --git a/drivers/dma/ppc4xx/adma.c b/drivers/dma/ppc4xx/adma.c
> index bcc54d584e2b..9decdd04a51e 100644
> --- a/drivers/dma/ppc4xx/adma.c
> +++ b/drivers/dma/ppc4xx/adma.c
> @@ -37,7 +37,6 @@
>  enum ppc_adma_init_code {
>  	PPC_ADMA_INIT_OK = 0,
>  	PPC_ADMA_INIT_MEMRES,
> -	PPC_ADMA_INIT_MEMREG,
>  	PPC_ADMA_INIT_ALLOC,
>  	PPC_ADMA_INIT_COHERENT,
>  	PPC_ADMA_INIT_CHANNEL,
> @@ -49,7 +48,6 @@ enum ppc_adma_init_code {
>  static char *ppc_adma_errors[] = {
>  	[PPC_ADMA_INIT_OK] = "ok",
>  	[PPC_ADMA_INIT_MEMRES] = "failed to get memory resource",
> -	[PPC_ADMA_INIT_MEMREG] = "failed to request memory region",
>  	[PPC_ADMA_INIT_ALLOC] = "failed to allocate memory for adev "
>  				"structure",
>  	[PPC_ADMA_INIT_COHERENT] = "failed to allocate coherent memory for "
> @@ -4003,7 +4001,6 @@ static void ppc440spe_adma_release_irqs(struct ppc440spe_adma_device *adev,
>  static int ppc440spe_adma_probe(struct platform_device *ofdev)
>  {
>  	struct device_node *np = ofdev->dev.of_node;
> -	struct resource res;
>  	struct ppc440spe_adma_device *adev;
>  	struct ppc440spe_adma_chan *chan;
>  	struct ppc_dma_chan_ref *ref, *_ref;
> @@ -4046,28 +4043,12 @@ static int ppc440spe_adma_probe(struct platform_device *ofdev)
>  		pool_size <<= 2;
>  	}
>
> -	if (of_address_to_resource(np, 0, &res)) {
> -		dev_err(&ofdev->dev, "failed to get memory resource\n");
> -		initcode = PPC_ADMA_INIT_MEMRES;
> -		ret = -ENODEV;
> -		goto out;
> -	}
> -
> -	if (!request_mem_region(res.start, resource_size(&res),
> -				dev_driver_string(&ofdev->dev))) {
> -		dev_err(&ofdev->dev, "failed to request memory region %pR\n",
> -			&res);
> -		initcode = PPC_ADMA_INIT_MEMREG;
> -		ret = -EBUSY;
> -		goto out;
> -	}
> -
>  	/* create a device */
>  	adev = kzalloc_obj(*adev);
>  	if (!adev) {
>  		initcode = PPC_ADMA_INIT_ALLOC;
>  		ret = -ENOMEM;
> -		goto err_adev_alloc;
> +		goto out;
>  	}
>
>  	adev->id = id;
> @@ -4087,10 +4068,10 @@ static int ppc440spe_adma_probe(struct platform_device *ofdev)
>  	dev_dbg(&ofdev->dev, "allocated descriptor pool virt 0x%p phys 0x%llx\n",
>  		adev->dma_desc_pool_virt, (u64)adev->dma_desc_pool);
>
> -	regs = ioremap(res.start, resource_size(&res));
> -	if (!regs) {
> -		dev_err(&ofdev->dev, "failed to ioremap regs!\n");
> -		ret = -ENOMEM;
> +	regs = devm_platform_ioremap_resource(ofdev, 0);
> +	if (IS_ERR(regs)) {
> +		ret = PTR_ERR(regs);
> +		initcode = PPC_ADMA_INIT_MEMRES;
>  		goto err_regs_alloc;
>  	}
>
> @@ -4127,7 +4108,7 @@ static int ppc440spe_adma_probe(struct platform_device *ofdev)
>  	if (!chan) {
>  		initcode = PPC_ADMA_INIT_CHANNEL;
>  		ret = -ENOMEM;
> -		goto err_chan_alloc;
> +		goto err_regs_alloc;
>  	}
>
>  	spin_lock_init(&chan->lock);
> @@ -4206,19 +4187,12 @@ static int ppc440spe_adma_probe(struct platform_device *ofdev)
>  	}
>  err_page_alloc:
>  	kfree(chan);
> -err_chan_alloc:
> -	if (adev->id == PPC440SPE_XOR_ID)
> -		iounmap(adev->xor_reg);
> -	else
> -		iounmap(adev->dma_reg);
>  err_regs_alloc:
>  	dma_free_coherent(adev->dev, adev->pool_size,
>  			  adev->dma_desc_pool_virt,
>  			  adev->dma_desc_pool);
>  err_dma_alloc:
>  	kfree(adev);
> -err_adev_alloc:
> -	release_mem_region(res.start, resource_size(&res));
>  out:
>  	if (id < PPC440SPE_ADMA_ENGINES_NUM)
>  		ppc440spe_adma_devices[id] = initcode;
> @@ -4232,8 +4206,6 @@ static int ppc440spe_adma_probe(struct platform_device *ofdev)
>  static void ppc440spe_adma_remove(struct platform_device *ofdev)
>  {
>  	struct ppc440spe_adma_device *adev = platform_get_drvdata(ofdev);
> -	struct device_node *np = ofdev->dev.of_node;
> -	struct resource res;
>  	struct dma_chan *chan, *_chan;
>  	struct ppc_dma_chan_ref *ref, *_ref;
>  	struct ppc440spe_adma_chan *ppc440spe_chan;
> @@ -4270,12 +4242,6 @@ static void ppc440spe_adma_remove(struct platform_device *ofdev)
>
>  	dma_free_coherent(adev->dev, adev->pool_size,
>  			  adev->dma_desc_pool_virt, adev->dma_desc_pool);
> -	if (adev->id == PPC440SPE_XOR_ID)
> -		iounmap(adev->xor_reg);
> -	else
> -		iounmap(adev->dma_reg);
> -	of_address_to_resource(np, 0, &res);
> -	release_mem_region(res.start, resource_size(&res));
>  	kfree(adev);
>  }
>
> --
> 2.55.0
>
