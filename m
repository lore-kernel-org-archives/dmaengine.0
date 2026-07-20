Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010022.outbound.protection.outlook.com [52.101.84.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D6A423EBD;
	Mon, 20 Jul 2026 16:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784563462; cv=fail; b=XigZ2nE7txwQ9bxJ9pqzRyzqZQovcJQBqR3ne9DGqmeEmBRQGHT0bEeayYzQVziA/DQJzftgTIbQDa+FO7vVqYShs48d/1B7bSvRBBfcUCwzSngZeGoIuGbRrXBuTfhua76Q6TX601jNrtK+7B2s0PY6yGcDE501RvD2KVNjWZ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784563462; c=relaxed/simple;
	bh=TMbIfMIyjSz04giqxmUF9C1sgAaPjOq04F7v9j8QM/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Ap0whmoGCLZZHfBOzR+4+UMQ/C30FoWSfGlscRIJWO4nhEmwpkWFd1Tp+bJKxPqRsK1fYbKmLZBtqMYHqqYhHGFatYSaYDr2avL2ff5yvDZWSNxqeehp3hq76qYCM2xBM8+X56r4AZm/MJKS5Y7ovdy92v6uAOrWzlpHnKbYwUw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=xGgmAi99; arc=fail smtp.client-ip=52.101.84.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="xGgmAi99"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kKEkMMR+R1OF/rsW08gA+AQ5cvYUheWYDc7yjm2dukvzCPKADVkUIrV0SjHzFckRyuNBHgJn1qplPhyVt9M+ZdoS6OriTRie9wNUvrL/EtSacfp3jhstx8J+ltUvyWoP4B6BrsLEqAdpz+KtqwlahNzzt5ae8UVcPaQwO7qtx/L5diyDlqO8pfz0w2fHD24o2KpbrZP9CN3QvZXklEMMvoCYXNnJ1nN3J8PVk/oBGH3jQ+tf+EiOP0etdCQKmxz9uRfZq+ki99bpH4C3UxBUxnW0fkSjfAiqyoqOBnFfkAWI1rpBIPmwPOkyhtzqwHalYa5nZmnEQU6o14t8DR29GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z/1B6K1QVqyolFUrpKtlu9yCnBl+RcpItakvIepye/w=;
 b=Es3wyGMwhCe6evxfQhSnQiEJiOOyGeGA5HVaIV0Fi1GxZnHlcvHffAiFDEovp10o2nF1jA6XJMVehXH9dh7ircFs0unj/Am4ZgpdOAAdFzCMub2uq7LGFGYiqAm2YshRH5qZxJYi5RqFWZ0i81oiZLXt1TUIckcFDxpgmsEnUMEyvuTGqzkg8dUJ0XPPkB3dGnmaZrXAiVfHABm4bYwTRtAsMJOzsOTFudCO988NdEhAjZfXBq+Dg45JUfcZAKLwxJxoTvH/Wi+k0XbbCNKG2dLXbZTLCgWbFhUbaNAn7q2apaNdQFDPx3EOHwOhpGUD3za0AMQM7gMug+pxye3GJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z/1B6K1QVqyolFUrpKtlu9yCnBl+RcpItakvIepye/w=;
 b=xGgmAi99U4tf8ZhWtYBKOiyeERP6cDCapvZ6Agd6RaFNBaqNqR8N2e80s7LtgPnX+ug4ubGXqZ4rquIDLmztxiFXVSeZhUYJYmvF75Ga3l5jdWx4KPjAOBwDnrSM3R40cHJyt6ELYurCvWkY3mIhDGkD2iZN6ugW9ViVl5pWqyztIVQZDTEi2cwppHrqXj4yCZOeqhQc4WQ3KelCDckDY/SwBKrnXR5fgflMR4tpSFuXKIXJkOOKCRiDdp+LgQeS1q3z7ylnXUaCenMgbHQRUro5OlIT3C2pAj+ntQxq3UaRd3kdMiEPTmsfsgv2qcvUFBQMZQACAsicFi6+M9m5JA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 16:04:15 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0223.012; Mon, 20 Jul 2026
 16:04:15 +0000
Date: Mon, 20 Jul 2026 12:04:09 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Xuelin Shi <xuelin.shi@freescale.com>,
	Harninder Rai <harninder.rai@freescale.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dmaengine: fsl_raid: free resources in probe
Message-ID: <al5G-QqO55iNJpbe@lizhi-Precision-Tower-5810>
References: <20260718231716.230144-1-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260718231716.230144-1-rosenp@gmail.com>
X-ClientProxiedBy: SA0PR11CA0139.namprd11.prod.outlook.com
 (2603:10b6:806:131::24) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU2PR04MB8822:EE_
X-MS-Office365-Filtering-Correlation-Id: b177c95e-d9e1-4803-4b35-08dee6788c24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|19092799006|1800799024|11063799006|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	hpqS/UKBAEXnmxir+loAwwEHzP9qi3NJpKoh7a4pZSX8BzkidJ0kId5O18lTjWL37oYGMW7XG+h//6dXxXMt8FTe81b/jlTw+QiAgE2kNhHSFGBwfzP76VRWxfXhKPYeFgCl32Zk7krtsYRSciV0/yz+Y0Wu0UaO3WqdPoIlWo2q++v3JFKPMjVinRAbq8Fm1XqUFUxvgfgwuInQizjdoPx2opMacGYwI8DpZoFBLGCHJQQVyAx3NDCet/M3/7tG26qgleOVHxk4MU5oX+90EzH4gasRF+RMC2gJneyeb5kaN9WqsiNJwGrDTWGuKaXKVsyuOdPT8OnqQue5+jJw9m58eTiTEPCYxg1eg4A7tgSGsltiG4CfEOHHBvoX4uyPUvN/HRqQ+Ss+BQQpVHBqv1Tfyqff8pv6prWTTa7Xhcv1T/1rCSQke7kxp/pMwA41cFwK+parvNLQLYntKVjWdTPQBfBy63oQjsgx7IqpQB7rIAo/MB7VOdI3bbOwqLiSPtb0fmMxZAAtOzeFnXkeJK8rJ5J5sXxOFUwP6WxXr7UlQAFc3LZxa0JSO3QP+T5FKp5Bte4qGg2/Y0LuE8C35PlRpsHSLNwSiLMb0vkckCOI8L48JJJdrMEwSDj1l/ZlD+lVl47p5be59lnzlPJc9nrbkbOM8xVq19lm+bS952Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(19092799006)(1800799024)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JHLtsdQ/IrKEiEdwsFrS7AKUmXQaHsN4fGrw6LOIi49beQjplDkk+NHD+r1h?=
 =?us-ascii?Q?kadRzPYms/tCK6T2JzMoBGptug/iMuXFIIvOEvgS4HbayBkzuvyq81VGmrTe?=
 =?us-ascii?Q?UtpbenGOtFjUH1dan7PiywJplgjZn/Qcii2k/z/RYHsfAb3J+DbzIdUXUJa/?=
 =?us-ascii?Q?DzvwfiiHw8Xbxn1B7VclCx7gx4b51kUntnZF6gc213dOrOsQrZsODrm//Io7?=
 =?us-ascii?Q?C6II6dO3Teznv2kMoKOAIqG7e1zBv7Gmaq/bZIWFEIRh8RqORrZwe/P8IQEK?=
 =?us-ascii?Q?3jEJahlfc35yRMU8YubKtoxPfYOQ4PN9FJbUcxN8idNv4IWXcDrzq7xHiSbt?=
 =?us-ascii?Q?zDJrikXBpv9HwbwNB0XZ87qzt27pSUGtsr/aQdSl+jSniI2QjmXn3XZCdWrg?=
 =?us-ascii?Q?fbZQX9V0HJ+w/v/ZLC69fnkbVOyhCCeRmjW4QwIWukgDdfKkgs1vK4+LZn1m?=
 =?us-ascii?Q?vi9hwnNeJ6OcKFnwvGlMAB7UVLFkLHac0CfZRhIprwyah7GxMF1OO2KJdbL8?=
 =?us-ascii?Q?uimFuzsvD0F8k1mkveSpP5U3DMlVXNzaEVz1yWztix2xmwu1ZVufWrMZLGex?=
 =?us-ascii?Q?Hdif3ROneUVXjIA6nL3rfljHWDLK0p3dY+MPTRm1udMGkLswc+I00geLtd3D?=
 =?us-ascii?Q?iprib9L899BWAQLt+ikaRP/a3YYMGxeXN3KmPo3Rj8GT9xOrh9hhfWjeRQoV?=
 =?us-ascii?Q?gdp9mPzU3Op7wJJDjOn9IsBROs3/iDJ+YCUkS5/93kB1rxP6Z5XbPao8j+Ip?=
 =?us-ascii?Q?8gN9S7TsSxdnrdS2GIt/ni+1EJO9uhE8vzOrCHC9HtNITuJr4JhQByLTur/M?=
 =?us-ascii?Q?QR2dD1naTPIgSFksUm5wSt81mQHcX6gRnXiebB0baRAh55jjFwfaFUkqxwRb?=
 =?us-ascii?Q?3jtqFxJULUZPp48HINOSL22hXW/oTAfYs2p0oE/Z8RbSc2CJrc6uIVHyPtJV?=
 =?us-ascii?Q?eqyStKAoKrdKsRBaRQ2rMxzs94NEIruo0hzWX82nL5DLXnrPf13pLrTU7nr2?=
 =?us-ascii?Q?6GBuwLOVqJU2hDdgt0JQG/sanUq4SwzFA+M6R60oW3BCuPs/G0Q17UGwPP7g?=
 =?us-ascii?Q?Gz9neS+Mufwuei8hILAdjtIRW9bLn5u8KZWez+IUSAUYD2jkPjOurRe22Eef?=
 =?us-ascii?Q?p0a5BKv4u2K0uvKSReX26wl2czLSzJqiWvr1UJ1ox8W6dIuYKw/6jkvSo3Ez?=
 =?us-ascii?Q?dtJ+50fKybn8eTtyJ/lmwdSHMxl2NRVV29Bkjd5tDuaXdfYEmnQu5CKJCx2z?=
 =?us-ascii?Q?hHkSMB4xrac9GOOCHxG9gdulnF9xlETio43QAg0Qkhixbq555OsA7aiN/Fkb?=
 =?us-ascii?Q?uGPyPpBccI+y85E7o/JQhWSLl5xhcs6exRACk9XcZr/RFynnqrBsJUMpjAaP?=
 =?us-ascii?Q?zd/PEAYtrtaeQMNlMq3XwmRsaiDl0e8NfeqDu9W5dPMKwP7K8WlAzHHYMOuG?=
 =?us-ascii?Q?hYwEWZtB+7FTSwcbjz2AMsB8UY5USc92SBh/FcNUbtSQLnurb8RBQITrZEKN?=
 =?us-ascii?Q?8+wxfxaeY4DFDrmDVLeSn5R9hiEmEkWJu+nSTNokMcWX6255V03NiRANDhSJ?=
 =?us-ascii?Q?hq9KNW8Pcx7P1oys2JJk+xntFrsyvS/Wi1d3hZQs8Cwp1D5ygt6QvwKIFFW5?=
 =?us-ascii?Q?lWfqDzGNzQQEex5cW8NCB3T+423zLxg0QT6I3f9mJmz63gTb2Vt0yq8Fveaw?=
 =?us-ascii?Q?+BijG8K/FMre4EJpHIm5h+EsRraSw0FKEEz+QpFZXOq/WdqOAfhgKcogwEGT?=
 =?us-ascii?Q?HD28fpmC2Yt3ss7vNafDkBUBYD3+5hW0Xo+5qbz6aW/anJVojs3n?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b177c95e-d9e1-4803-4b35-08dee6788c24
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 16:04:15.6928
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SsvjLBfwzTpuZVf0nqWtb8uQF9k+nqri5yWyX4IqiR2qyDgcOEbYJStuIPX1rq+R9O0z4NRhUhrDkqWR+zWc7YboHof+LjJscuHc1wl8N9qbT7tiWNGa8U7969RoaqYY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8822

On Sat, Jul 18, 2026 at 04:17:15PM -0700, Rosen Penev wrote:
> Add free_irq() in the error unwind of fsl_re_chan_probe() and in
> fsl_re_remove_chan() so the interrupt is always released.
>
> Also add tasklet_kill(). Present in _remove but not _probe.
>
> Also add platform_device_put on failure as of_platform_device_create()
> increases the reference count and needs platform_device_put on failure.
> Requires placing the pointer in the struct for the _remove function.
> While at it, use platform_get/set_drvdata as there's no need for using a
> device pointer for that.
>

Can you split these patch, one patch just fix one problem.
1: replace dev_get_drvdata() with platform_get_drvdata()
2: add error handle one by one.


Frank

> Fixes: ad80da658bbc ("dmaengine: Driver support for FSL RaidEngine device.")
> Assisted-by: opencode:hy3-free
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/dma/fsl_raid.c | 32 ++++++++++++++++++++------------
>  drivers/dma/fsl_raid.h |  1 +
>  2 files changed, 21 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
> index 0b0b4e8fc821..b1a10292324d 100644
> --- a/drivers/dma/fsl_raid.c
> +++ b/drivers/dma/fsl_raid.c
> @@ -212,10 +212,11 @@ static void fsl_re_dequeue(struct tasklet_struct *t)
>  /* Per Job Ring interrupt handler */
>  static irqreturn_t fsl_re_isr(int irq, void *data)
>  {
> +	struct platform_device *pdata = data;
>  	struct fsl_re_chan *re_chan;
>  	u32 irqstate, status;
>
> -	re_chan = dev_get_drvdata((struct device *)data);
> +	re_chan = platform_get_drvdata(pdata);
>
>  	irqstate = in_be32(&re_chan->jrregs->jr_interrupt_status);
>  	if (!irqstate)
> @@ -645,7 +646,7 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
>  	struct platform_device *chan_ofdev;
>
>  	dev = &ofdev->dev;
> -	re_priv = dev_get_drvdata(dev);
> +	re_priv = platform_get_drvdata(ofdev);
>  	dma_dev = &re_priv->dma_dev;
>
>  	chan = devm_kzalloc(dev, sizeof(*chan), GFP_KERNEL);
> @@ -656,8 +657,7 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
>  	chan_ofdev = of_platform_device_create(np, NULL, dev);
>  	if (!chan_ofdev) {
>  		dev_err(dev, "Not able to create ofdev for jr %d\n", q);
> -		ret = -EINVAL;
> -		goto err_free;
> +		return -EINVAL;
>  	}
>
>  	/* read reg property from dts */
> @@ -683,17 +683,18 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
>  	chandev = &chan_ofdev->dev;
>  	tasklet_setup(&chan->irqtask, fsl_re_dequeue);
>
> -	ret = request_irq(chan->irq, fsl_re_isr, 0, chan->name, chandev);
> +	ret = request_irq(chan->irq, fsl_re_isr, 0, chan->name, chan_ofdev);
>  	if (ret) {
>  		dev_err(dev, "Unable to register interrupt for JR %d\n", q);
>  		ret = -EINVAL;
> -		goto err_free;
> +		goto err_free_tasklet;
>  	}
>
>  	re_priv->re_jrs[q] = chan;
>  	chan->chan.device = dma_dev;
>  	chan->chan.private = chan;
>  	chan->dev = chandev;
> +	chan->ofdev = chan_ofdev;
>  	chan->re_dev = re_priv;
>
>  	spin_lock_init(&chan->desc_lock);
> @@ -707,7 +708,7 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
>  	if (!chan->inb_ring_virt_addr) {
>  		dev_err(dev, "No dma memory for inb_ring_virt_addr\n");
>  		ret = -ENOMEM;
> -		goto err_free;
> +		goto err_free_irq;
>  	}
>
>  	chan->oub_ring_virt_addr = dma_pool_alloc(chan->re_dev->hw_desc_pool,
> @@ -739,7 +740,7 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
>  	out_be32(&chan->jrregs->jr_config_1,
>  		 FSL_RE_CFG1_CBSI | FSL_RE_CFG1_CBS0 | status);
>
> -	dev_set_drvdata(chandev, chan);
> +	platform_set_drvdata(chan_ofdev, chan);
>
>  	/* Enable RE/CHAN */
>  	out_be32(&chan->jrregs->jr_command, FSL_RE_ENABLE);
> @@ -749,7 +750,12 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
>  err_free_1:
>  	dma_pool_free(chan->re_dev->hw_desc_pool, chan->inb_ring_virt_addr,
>  		      chan->inb_phys_addr);
> +err_free_irq:
> +	free_irq(chan->irq, chan_ofdev);
> +err_free_tasklet:
> +	tasklet_kill(&chan->irqtask);
>  err_free:
> +	platform_device_put(chan_ofdev);
>  	return ret;
>  }
>
> @@ -828,7 +834,7 @@ static int fsl_re_probe(struct platform_device *ofdev)
>  		return -ENOMEM;
>  	}
>
> -	dev_set_drvdata(dev, re_priv);
> +	platform_set_drvdata(ofdev, re_priv);
>
>  	/* Parse Device tree to find out the total number of JQs present */
>  	for_each_compatible_node_scoped(np, NULL, "fsl,raideng-v1.0-job-queue") {
> @@ -864,21 +870,23 @@ static void fsl_re_remove_chan(struct fsl_re_chan *chan)
>  {
>  	tasklet_kill(&chan->irqtask);
>
> +	free_irq(chan->irq, chan->ofdev);
> +
>  	dma_pool_free(chan->re_dev->hw_desc_pool, chan->inb_ring_virt_addr,
>  		      chan->inb_phys_addr);
>
>  	dma_pool_free(chan->re_dev->hw_desc_pool, chan->oub_ring_virt_addr,
>  		      chan->oub_phys_addr);
> +
> +	platform_device_put(chan->ofdev);
>  }
>
>  static void fsl_re_remove(struct platform_device *ofdev)
>  {
>  	struct fsl_re_drv_private *re_priv;
> -	struct device *dev;
>  	int i;
>
> -	dev = &ofdev->dev;
> -	re_priv = dev_get_drvdata(dev);
> +	re_priv = platform_get_drvdata(ofdev);
>
>  	/* Cleanup chan related memory areas */
>  	for (i = 0; i < re_priv->total_chans; i++)
> diff --git a/drivers/dma/fsl_raid.h b/drivers/dma/fsl_raid.h
> index adbfede330a7..34d362803610 100644
> --- a/drivers/dma/fsl_raid.h
> +++ b/drivers/dma/fsl_raid.h
> @@ -270,6 +270,7 @@ struct fsl_re_chan {
>  	struct list_head active_q; /* already issued on hw, not completed */
>  	struct list_head submit_q;
>  	struct list_head free_q; /* alloc available queue */
> +	struct platform_device *ofdev;
>  	struct device *dev;
>  	struct fsl_re_drv_private *re_dev;
>  	struct dma_chan chan;
> --
> 2.55.0
>
