Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013044.outbound.protection.outlook.com [52.101.83.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75DC472776;
	Mon, 31 Aug 2026 15:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788191191; cv=fail; b=a+ukeoUawEWMjwrYlSOgNaFsYkqJbWwakkKZTD9fcT6hpzS4NxyRrSNvdJ/deWL2VE7KdiX8tT+V+9OviX8SCwcgHpsjL8Oc3JippmodEm9puj2KSHKCaRkuOAkoU9EZiNIVVAKTNNxuSAeVPSHjqb0iJwh5pqnybTr9PFpjXyo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788191191; c=relaxed/simple;
	bh=CND6qp3tF5HMZiWmfBhZuBahqdshf62iJP2iV7+c6g0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gPOeIqs8Z3uJ8kC7hJCsdQQUMddCTOfG1ov8BFwziBmKQbKL9U7e9GDvbrJLwZbjL6fguyRJFqW7/7bUoyXMPg6Y+jZsP4N6ciYD3tlBrNgfD7LbYNpx17+/4OKaEMNdZ9Y2BXdwksr91uCPm3yLSfo7SJZ2o0i27FWs42FyvkY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=psV3GguR; arc=fail smtp.client-ip=52.101.83.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="psV3GguR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E3dS4SQHbfw3ivGpXHVBSriuA8tr1XrV++AaZZz83J4+k6h3UWxBGu/rmJNaEmN0cqQaB66jx5WH/9iAHAEz8Pa6afsii37j/ShYzFS2yZcn9GlFj7Ro5Ia7tkK1tJUslSzNKCdWtLgUwUpmB09sS4WbZ5iiRy8IX+Kf9F4+eMFsBmjo1FVhO9iWQxhHW4qkBQ0f6vj3u/dltuNG2ZT/Qhc6pO+D2N3AjnIFtAakaS4s3LUAQDDwoSbDS8nY9Mw44r6JWRX6suMcWlXK5TYKqSys+bugjI5ld69IswkPrvSZHreE7hQ7cUSVbtU2rrRMNHaNCk4Tka1NRBIocFBoWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HDBCGu79Yyh6daFR6kZoFkXp/Tw5z48ivV48n3Iym6A=;
 b=oHGtKYHMkmiEZWU01DORJpNaWx7cdCrOo2HqHqy4C4RlQQzKaYtns0L3wdoiREE4LXJcEEaG9Wti53VYIyB83IXSsLyv9gjcx4eFx5NFpkgg6bfmzAWSd5VtTYge46ixiinm2BcwHYrjej7SEq60oeIX6fxXKyaTn7Sez8YTv7+jQc+RaOfs6XRjyvwDW3ocd8tyqS6Scb2AMBpZPEilLSDkLVdOVlAYn+NoXkB0gVQBUc/vVb69W8mvPzLrCe4qC4xH+LBmnrO5hp8S9WsymHojBEW0Ct9rgR/G+0koxh2vmTOKTXWs7EInxGrLIJkNkz7RgpRvukd0xNd9Cj/+1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HDBCGu79Yyh6daFR6kZoFkXp/Tw5z48ivV48n3Iym6A=;
 b=psV3GguReYF3SDm2TxS6bTRLA+2uo2UuNIT5xOD+7SyUz4uxHGkzWtSBhMvezs/w59Pbp2RrHFnTKklO6ZgvW6eslStzANIIlDiOGRctgvxlkPFXL7pFUWpCZogxv4RYEBkbF2wR/BncvlwBHbbpxRnPmVDaH4dzL6PBJL8Q8BlHrFxsemeKZ1kmfG5RuQtpoq7g0D0TV+ed9w/YIooCzhg5Gzl12GZSNVEzT7/f1mYWGSpSurzulGw1Nb27J6Ad9pa6ZiOseHCeNchZRNOJOIM/AVhDb6Tuqjwhh4NnZJAir3oAaznE6FK8zx2KMhh32mCcgzhoziuESueV1sTYwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by MI9PR04MB338771.eurprd04.prod.outlook.com (2603:10a6:290:87::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 15:46:26 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 15:46:26 +0000
Date: Mon, 31 Aug 2026 10:46:18 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>, joy.zou@nxp.com
Cc: Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>,
	imx@lists.linux.dev, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: fsl-edma: make channel resource allocation
 transactional
Message-ID: <apWhyl5RKCtmEbzv@SMW015318>
References: <20260830140925.30268-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260830140925.30268-1-pengpeng@iscas.ac.cn>
X-ClientProxiedBy: CY5PR17CA0025.namprd17.prod.outlook.com
 (2603:10b6:930:17::16) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|MI9PR04MB338771:EE_
X-MS-Office365-Filtering-Correlation-Id: 9709e45a-82e2-4bea-f373-08df0777044a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|1800799024|23010399003|366016|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	k5eNa28bQnMVePibT57W4xwhd+yxoCLzj3UHgDW6lVQoGU1EBN0dmq9lw8pZQ+8qMVnfA2/von16ECNOpgPDGoFjWDl8kSgT/BEPJGfd+67ch/URtJs4FOccfysbAHskaIgcMof3+4Pc+iOIKson16PNPvprcRnbkQ35cduOT66p+Zo3FXX1/YdXrEgLS/bQYfTikCIyaOfXKfA7HjU0tIM8AvF/JqpsU6FVqDgUg/4WsBwwhSH0spZONgjRdGqbMN504FYPJZamp4WMBf19p1Pmd8sPCsWxKKug3FjTAkshMObqA3/H/S+i/W3v0LGT5RHJciKGxiziCY4XGU42AMk9y55EmEx/ZxpDHzPeXJCp4+GF0kKifteLUXUnTns8zGLxvq57FE+fKy3kNW/bvAsx7b+cJlj9E3jyKlRjLY8s9MnL82omkVaJHU0lXoaCLufJhExigzxZkuSHnx2a89ZDeA6ev1Z02+/jL0inmNoJ4MpworzUO9TDWLqPVFOx2TvA00npM3h4O2jwITJfqz2rrSip0fPRokwl72/zivu+a+bRY3jCPZqJz3GWtTkzAe6EAsu8CAHmzcUFHTXNLCDSuEJfd33Wu3RmvWfQnreva/F0vlmQMpQbsNZLDnM713hMfKUcPJVgOkipEkTXbbQfmQmWfKcZhcHlo8UhjbU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(1800799024)(23010399003)(366016)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?L8sKCr4vvH/XWbbCo39W0oMsSzMypzuBeyBmFnvqszSbwUcJpqg6ZrnK2RpV?=
 =?us-ascii?Q?pyJRgng3g7Wc9tTclMlgasu/Bn2FpVOa6fLaVFB2exqkt59vBm/FiT7KaQCE?=
 =?us-ascii?Q?tY9Juguc8KA4lptFUViPzi7nxDHwvGOmK1d8W6vRNFSSb9+OnSR93BvXJD5Z?=
 =?us-ascii?Q?L18lEYLKhl4QB1zcgFo1249s2FawNONc3dwxCWSvDV0zTosWV36dF2L42Brs?=
 =?us-ascii?Q?dp5bOqkWzPE8iN7QeyChIxzXjSZTKiof5klYifD+fOybBcvG/KE6fwJAiHDG?=
 =?us-ascii?Q?2XsN45pB2py/cNd7nsStr2SFlJyOs3Sn8ESJExgeld5MRlnMUNIDw3Ys6ZV5?=
 =?us-ascii?Q?foMfQgvQ9dyZ/lf2AcwZCOvqkVltaiH9YUGAPehOWJ5hNcqhCnhSRwOSjpJw?=
 =?us-ascii?Q?KfIX+dqo3+X4K46DPJO3hojozZMBHyQn/yh0s9EM+c4UdgQsRhsP9d0RqWzu?=
 =?us-ascii?Q?LvMxzwmdXpZmqafzCY2dkq06roWZMAj6EKxYkdYzaB2D8cD4ud0YNF08Xb+C?=
 =?us-ascii?Q?k1z6CTMxQDqHTqvwm8VhTjUro5UZNGxHNyDs5vpMBHzN4seGHUOsBMhizQXX?=
 =?us-ascii?Q?pQR2Kx/89vQgzGFovHms+TyC75lNIrAvVeEbdgZTR58E92xpAziFa1Eu7Ock?=
 =?us-ascii?Q?s6+TsBtRPcMqNG8GNkincBVCETLfnmpdgvGxBaOfKrR9fYpfHxPTCEc1T1ff?=
 =?us-ascii?Q?rvFZfjvq8OSnlW9TBHqi0HYX68Hm7K9j41Ni05zQYBu+sVddSAtSDgyRdBsc?=
 =?us-ascii?Q?X4draucrdALVH1IJXmxh91pEydBf2Q0iJT/FJyc5iuwQd2aiqdU3tSyGrgZl?=
 =?us-ascii?Q?dBhSX1PZFWVD+DyM9BbYGtwRy5snNR6/huWftyPz4oRcO6qFfiMwsLttNnun?=
 =?us-ascii?Q?D3UjrAZ4kS81sciso0jL0CLYWSGNxtH4eR8gCPD+0rc41sKhJinbUSFPzTqQ?=
 =?us-ascii?Q?ZOWDdcusNeCjQZRMurTTJ93StN7X5KXMwwW3GyJBefMzmZaI2qj7F51Nx7Dt?=
 =?us-ascii?Q?qI/FxtcKsAqLZwgpFcDdqn/jhTmqyTmqBStD5sj6FhioSVqquOIgK7bMmlOX?=
 =?us-ascii?Q?aWnQir9VV1Sk0upJ1ck4WVfu7Cxbi7B9iGhkUa+5cA77B9MGM3mCagUzlP75?=
 =?us-ascii?Q?VfJfT8lIE/9QhDCR/j8nkhZEib8ailUBbbJbTm74R5BFVBW9xtJTj4U9vqzj?=
 =?us-ascii?Q?532InDsUrdEDUBsXH+yu5GGjJ0kHXbvYC7BwdsY9ZcTNBV7prqynrTdZHo71?=
 =?us-ascii?Q?0f6PPmeI3wf6tIEfeIf2IRIBQ+JKPRAQJfbl97v9jAy0QM7IhQtfeD8h2ljz?=
 =?us-ascii?Q?osuc4z7L9tNXr7lFe5HmeKekUFxqRHDASc2TP59f20qK9IxjkIkAalIL6qwZ?=
 =?us-ascii?Q?QwNBB16bJx3aM/cudcOyFw0bjGvPCmnOc4lkqPfH+nsRGLsB/SHWhfcmEjZ6?=
 =?us-ascii?Q?MymTK6ck23szs1eMUhim5+VpxmTRMF94LXnk6tSsLeNCgP6TAXa4AVEGmGGP?=
 =?us-ascii?Q?j6lPEBD6uge690H5ApPxmIcK/EEXhlfScnFZzloYI2rqGd+8ATs0aKbTOBCh?=
 =?us-ascii?Q?io+gf/L/9xdyuBFy6Er2fg7J0mBXqvTjT7MgdGahYhb8d4lwmKf2dO+Cns2R?=
 =?us-ascii?Q?ia0ZwJshjihcn+rEYH0ixFpfBwdCDkwmO9hUdvBjfExuNTRpS8gRbLu0LU6o?=
 =?us-ascii?Q?4eyKNV8DmzethbxdaCbkqwHM4vclUpytMXtZgZivH0jYC4wBA8O0DRZ9Al2r?=
 =?us-ascii?Q?Y6a9DEw/NGQIP/wGkwjJN1uX073m90myEkTGHZtDy55+V9OAx4nw?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9709e45a-82e2-4bea-f373-08df0777044a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 15:46:26.7461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X0yJcQQwSQ12Bf+Z87urwIgEiSBwGR5wcXt9uH6hubdDsT75ziLN2S9rmlsuUWOlAqvVZUwYFsItqHtkGb0cC9tw8IoaD4hty5w0gtLz58gViDEb6FBQlRtWsLAIgDfv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI9PR04MB338771

On Sun, Aug 30, 2026 at 10:09:25PM +0800, Pengpeng Hou wrote:
> Channel allocation ignores a required clock failure and does not reject
> a failed TCD DMA-pool allocation before requesting IRQ resources.
>
> Check both prerequisites and unwind only the channel clock that was
> enabled by this allocation attempt.
>
> Fixes: 9d831528a656 ("dmaengine: fsl-edma: extract common fsl-edma code (no changes in behavior intended)")
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>  drivers/dma/fsl-edma-common.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/dma/fsl-edma-common.c b/drivers/dma/fsl-edma-common.c
> index bb7531c456dfa..02b92d1464cca 100644
> --- a/drivers/dma/fsl-edma-common.c
> +++ b/drivers/dma/fsl-edma-common.c
> @@ -844,13 +844,20 @@ int fsl_edma_alloc_chan_resources(struct dma_chan *chan)
>  	struct fsl_edma_chan *fsl_chan = to_fsl_edma_chan(chan);
>  	int ret = 0;
>
> -	if (fsl_edma_drvflags(fsl_chan) & FSL_EDMA_DRV_HAS_CHCLK)
> -		clk_prepare_enable(fsl_chan->clk);
> +	if (fsl_edma_drvflags(fsl_chan) & FSL_EDMA_DRV_HAS_CHCLK) {


Actually check is unnecesary because it is no-ops when clock is NULL.

Joy have did some work
at https://patchwork.kernel.org/project/imx/list/?series=1119587

Joy:
	Can you take this patch into your serie to avoid merge conflicts?

Frnak

> +		ret = clk_prepare_enable(fsl_chan->clk);
> +		if (ret)
> +			return ret;
> +	}
>
>  	fsl_chan->tcd_pool = dma_pool_create("tcd_pool", chan->device->dev,
>  				fsl_edma_drvflags(fsl_chan) & FSL_EDMA_DRV_TCD64 ?
>  				sizeof(struct fsl_edma_hw_tcd64) : sizeof(struct fsl_edma_hw_tcd),
>  				32, 0);
> +	if (!fsl_chan->tcd_pool) {
> +		ret = -ENOMEM;
> +		goto err_pool;
> +	}
>
>  	if (fsl_chan->txirq)
>  		ret = request_irq(fsl_chan->txirq, fsl_chan->irq_handler, IRQF_SHARED,
> @@ -873,7 +880,9 @@ int fsl_edma_alloc_chan_resources(struct dma_chan *chan)
>  		free_irq(fsl_chan->txirq, fsl_chan);
>  err_txirq:
>  	dma_pool_destroy(fsl_chan->tcd_pool);
> -	clk_disable_unprepare(fsl_chan->clk);
> +err_pool:
> +	if (fsl_edma_drvflags(fsl_chan) & FSL_EDMA_DRV_HAS_CHCLK)
> +		clk_disable_unprepare(fsl_chan->clk);
>
>  	return ret;
>  }
>
> base-commit: 08dbfad3f5040f5bdb6c529da20d6d4e81fefd72
> --
> 2.50.1
>
>
