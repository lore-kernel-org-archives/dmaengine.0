Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011025.outbound.protection.outlook.com [40.107.130.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5328D357CEB;
	Tue, 21 Jul 2026 21:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784670210; cv=fail; b=Y8ebhlfWeOnTXDcMizaT0RTj0m4lJI+QCEq+i106s2xu/zbBHGu45hAN20x4JbpOOD8foCZyUr8VW287azVPignwPWsOeF38kIUpj2fqRQLAU2i8hInGFSk9rZSo95zEV4FKMN9WLZcSGRrPhlMdK3sauF4GvrxBJRnfiNQn3Cs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784670210; c=relaxed/simple;
	bh=kPAIDd00MZI+MRuuCjt+6NWm8MUcqkn+HfeO6ywcOo4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=aoxnQCca+sVfTkOF0ow24AIVc1KIYehJKZ+AwlY8U0Bgw1xFJrXX7IZC65DxVvxX1VX61A6AEIMV1vxzFCNyA5zVfTpsGptSIsugqvu0ut+zDtp/CIRf6c6p4rkpHA1/J2zYoeZI1aTYlLrQ6et0hLYFj/XtbWSHGziw3hY7el0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=GlSvODqG; arc=fail smtp.client-ip=40.107.130.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="GlSvODqG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pqxW8j06vADK5W3O+xXnnyMdUzlRMYfqEWAj77fRoMn75TXOBJTUe+C9onbfuWG/6BhxNwCtfcyYr4jCR1VADz0o92jZL9+L63ErocwkVicf/HqsCbxIGRxwLXpVw0PSEAHLp1uL5ldmM7ELHse1NmOAFGLzuHyE69daWNyU5fwxlUp9BInU5lbMdgG4eeqjeIEkpnwXTHquFf8ZbGHvhBSOLIzgmt1vkL4MGlHCYhZwHh1wIRxmj24qlZ0MIrKaGkP6NCIc6GGcwQ364HokQEPs7D71wb7C0c9aRKmwL07rvt00JIvtge8irC+LdohifGP+o8fn1vT9qG50G2I2Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HIuQJOOVXKkvpUKgCw/RcuHgk159lEOChzvZfoRAu1M=;
 b=GP65O4XYYKK24HHVKiyfRpfbvB89Du6MjLfOoTOpsIJi4LBm5g8Tw8Z6nLr9DSU1kkHh4B51smVxq4TWUuVBbL/x98NZi9whmhzlX8na4it/CjM53wtnsCB0AuHiyriWnNsL5kqcYGF2/L+wkNMgsJdGKmXCBLzPwclcoLsnwAFBcaxETud4v7l7IahF8hmGR1VzSXoL2fwe5GI8ZE9wB6NjyJFlSKDLwGLDd4Hb0+30+9BtDzOqw9aqoYGSd2vQpkdjg+jfZjbyqxlmTWueuCWj+TjvjX2N/4vDcJBcKO25P/KBcQwhkLk7X2SvyZiDDU5FTVtMGWY6fu/bxZCNtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HIuQJOOVXKkvpUKgCw/RcuHgk159lEOChzvZfoRAu1M=;
 b=GlSvODqGXb7taJg2k3QmiOdpsOccKzI378oY3wAOZBOo+Py07f8EaXzeXKgNTWywuTNCVxVl9mj8OqgiDCvAknZHdWGvRoNhm1ViO+y5j9WAYw40dR2kWeb+6isIhay14MQEfyxE8TYs3I/m1GLMVLrMULbfSExuJ1oYszN+JQA+dyy3jm+h9HcnCYmCUeks+lTISFJxRlYpFpemfrn2Qx0PkjZ/F6gJ94PPklUWy4x7lF4pc6CZQ2VURW3+lSMJHmVRlYVVO0bSlmMFFRQX8LVU9FhW9m82BMIvaJDONcQBkKb1YdEaOId1SXOakuin8bA8+tULVTyA5rU8rmILwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS5PR04MB9998.eurprd04.prod.outlook.com (2603:10a6:20b:67e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 21:43:26 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 21:43:26 +0000
Date: Tue, 21 Jul 2026 16:43:17 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Xuelin Shi <xuelin.shi@freescale.com>,
	Harninder Rai <harninder.rai@freescale.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv2 2/2] dmaengine: fsl_raid: free resources in probe
Message-ID: <al_n9QnYzdvII8fZ@SMW015318>
References: <20260721195422.353794-1-rosenp@gmail.com>
 <20260721195422.353794-3-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721195422.353794-3-rosenp@gmail.com>
X-ClientProxiedBy: SA1PR04CA0022.namprd04.prod.outlook.com
 (2603:10b6:806:2ce::17) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS5PR04MB9998:EE_
X-MS-Office365-Filtering-Correlation-Id: eb352f46-501c-4bef-e6c5-08dee771184c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|23010399003|376014|22082099003|18002099003|10067099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	Ajxumq4iMTgioZUZ6qD85Vc2Fm6EEt6tegnoNE3wXwP0WcyKWfIm15vPpVCHvewi7LMAHAwf/O9XFesmPQYXG4xHK/gljLTobjeHnHTbLZ6h1QYMZ/MkyiYTIhUKO+C8SD+tPRau9drBK7ceCCr0d67wja+VJy7Mgz7PfyKFjZ4ipw9rNtB9FQYuktIrQUHm419YPuf/SrgWWwFlD2aHucNxnwjTgpixMipG6LqsrSS08Mb4M8ZBY1zt6CRryMZUdiX5+ORGOOYoD+igh5HtqIefgTBCfvZQ+a4Df3szmwiIHVlc0kr4xvzkoBKE1sG+zFMkL2iphOM0mGXy5M/vPBv4LkHL5EGE7f07UVknOX2oI4WsaW8NgkIEhUiuVe+7aSVTmTF/cl3cOKagY4gDmlvvdYoV1dMwoBg2HjVGGZwAyJTY5ZWvi0mpyyCeQEJRuXmNgqZ9tZBw5LtgBLkAhnZPRWCrexb4QSky8U35XACPl7jOEVuhR1eXm0OuuA0cgKWrTOwuwtZNl0nW3ghUx8bp9AgS8YwsGJeD1RO/YHWJfeuEMyFDiOzWSAMqC2TAEPxje7U/QGrRPLCGfzT+UmIAeuqzp0VESlZGJHJSz4VZ2Y66YxTGFW7jb0bNyXPHnc6GYENN0FxnVcx8kJyWvEmAvATLPIN4C9k7yMSf568=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5zSKGU7cymLzYqf0jqOx2iN2132EVOwQfO7BhupgLV+CN20ekGTZAzyv916G?=
 =?us-ascii?Q?F/5ms40R4OombHQG1o0LxpsFUOvgTbUDBOt6AtALhh4rbkXDUe1p6Q5MBYRL?=
 =?us-ascii?Q?B4+kpPvsyvKBwNVlcC/iH3ED/aA07n/UR1ZxonZwracxwfklRxlK2YuFvB6P?=
 =?us-ascii?Q?1h0sHmzTu9Py2KZiVk0odpNXz0BeEMzyjkVHFtqo8MsCM38J06vDY0ipTxpo?=
 =?us-ascii?Q?H6qHfx64QKRzcoZMwZBBPEGGs3lYg259YsyCGyrGXIP9JaUij0KIQe096r+x?=
 =?us-ascii?Q?/emo50TAKXKHzvK9INR7oFzqsRcERxl54bUqw9ZZzitS4pIdpNgJxKhzbOE7?=
 =?us-ascii?Q?JMq/l7lqFBY23X9+gZl6LH/stXNdvfvA8Gb+GdJ09pbFWfD6l/hh/TImIBcX?=
 =?us-ascii?Q?2RjVYNMY6BV67/0IZ1udOBVdkJT36g7why1D/Icn6nPSOwew4k9JeVBSbNTr?=
 =?us-ascii?Q?6wuvSuR9pOKKXNe/rKLWYqDx1HBd8+wp0hTe+dUftGnloLv5HSCOJJUhBnHZ?=
 =?us-ascii?Q?0i0RGeaTMGrKBxsWmBUJFN3k/rqTA6zSV7tEsMqM9VSOYptMTw7HSkCOpprY?=
 =?us-ascii?Q?m+PCuTVjCiU+zFlLjoPgI4b7t3dXOHBE613n6jBt/08ypNskO/FwGYHLCRPH?=
 =?us-ascii?Q?YlwYnJ5m5ejmuTged/BFM0c2lMtaGJiIWQdW98OCNZERqOz2Mae/C/nuwf5I?=
 =?us-ascii?Q?J8C6ygZn99N2Op7Fdd7p+TFYHaxUFDG0v4W8WQDgtiX7hXbqw2JF50I8u7QQ?=
 =?us-ascii?Q?51FfstYTYhQ8rYk0j8nhQBdLsY3pKnYlkyWIXZ5ok+hmB85N2ZtaDJp1N6Bm?=
 =?us-ascii?Q?7dZaAh29GBdWcmQbTGzMxgi2NQ0aWyZl5m/hthHEYCkg+UeFPJ7Wgv4z4IOs?=
 =?us-ascii?Q?WXLbfMr5oFttoBmQRn8SauWO9swOXnvfzHhkOvveVQXjJRC48zZkM+IJFuHo?=
 =?us-ascii?Q?OWc2Fh4z0kFfghaYE91ZIFatgttko+9Fd9G8j3c0MUQIkIlc2cRVffWN2nni?=
 =?us-ascii?Q?dFyWfswNLkdlkK+Yo3zv2cwhUJWAYPSvmgaK4scpxiM+TMr7MmUCS08nNMOy?=
 =?us-ascii?Q?baZt5TJC0B4Lf4fLtogNa/4RRRT8uNSQ0sei7Xf6zJ07EbHjJqJwho7EJZnD?=
 =?us-ascii?Q?NsgUgBK0kRVAN+JfN6ushKpFjr97dDvD+J7Un322rJyW6yzyF9tGCP4Rw4Jz?=
 =?us-ascii?Q?OBDPlpjA6ZWhiFYjucwR5vw/xxQ8v+GYTV84AOj4CgcfSbZ+TwHNkkSdZok/?=
 =?us-ascii?Q?lnaPGJolQxqmLWC0cpKC2qlIYyPtpaSkC4BzEMsrT3l2w3ShpQS/cJqMv+J6?=
 =?us-ascii?Q?Mj8tNwKq3AV4WNmRPKemzjxiOm26dEpxpwW9sSQAXPrm1xB1XFiIjY4mlTUV?=
 =?us-ascii?Q?UtJ+fZVSZ+2jXddYwL815nZykW3ht5x43+tPL1YmtkxqGRIeUZcNIMoEbcyV?=
 =?us-ascii?Q?qkd0ES0JZcVSMCvix17GHPsFmg84sRmQ8Bl8zaEX8XN13JBG2TIAtq/qWrw4?=
 =?us-ascii?Q?D9wNNUB+68Xq8R3aow53s+j5I7o5OfqssbKN+rDzjpJOt0fE4XmS1yLT/e+W?=
 =?us-ascii?Q?7HKjY+EmGySSAF8sHwqvc+X0r5ifu7IGtiuN0wx8nk87B6lYLv3SPVeqt86u?=
 =?us-ascii?Q?t6T4eICNgd5IIRrJwB2HimWDbx60jN0DTH8iHet3TqpA6OQH58uFtJhm/MbJ?=
 =?us-ascii?Q?vWRwRwtjpXipHNWYMgRkHji0KStXuk0Nofr33mVpxK5hVlWPFxDu+wfdlHph?=
 =?us-ascii?Q?iFvBV60OejEl8oLStGDX4zhSPvK7KySVOtwaX9wjGb6ZvqRwAYUA?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb352f46-501c-4bef-e6c5-08dee771184c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 21:43:26.0882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q/qgYrSOdsGq2BbFsRv7Uf3KDqQxG4ZjLlxX5zY2wHEFVOKoUGADwbAD5nIXi4QQFEG8uCPy3e2JxerzeoixonxUqYYYMcM8QS2hFnJK6TTSQjaDiX6SkexR6zySOjxm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9998

On Tue, Jul 21, 2026 at 12:54:22PM -0700, Rosen Penev wrote:
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
> Fixes: ad80da658bbc ("dmaengine: Driver support for FSL RaidEngine device.")
> Assisted-by: opencode:hy3-free
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/dma/fsl_raid.c | 20 ++++++++++++++------
>  drivers/dma/fsl_raid.h |  1 +
>  2 files changed, 15 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
> index 2d54879cd6e1..cabc79e61e85 100644
> --- a/drivers/dma/fsl_raid.c
> +++ b/drivers/dma/fsl_raid.c
> @@ -661,8 +661,7 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
>  	chan_ofdev = of_platform_device_create(np, NULL, dev);
>  	if (!chan_ofdev) {
>  		dev_err(dev, "Not able to create ofdev for jr %d\n", q);
> -		ret = -EINVAL;
> -		goto err_free;
> +		return -EINVAL;
>  	}
>
>  	/* read reg property from dts */
> @@ -688,17 +687,19 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
>  	chandev = &chan_ofdev->dev;
>  	tasklet_setup(&chan->irqtask, fsl_re_dequeue);
>
> +	platform_set_drvdata(chan_ofdev, chan);

Previous patch already set, why need set again?

Frank
>  	ret = request_irq(chan->irq, fsl_re_isr, 0, chan->name, chan_ofdev);
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
> @@ -712,7 +713,7 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
>  	if (!chan->inb_ring_virt_addr) {
>  		dev_err(dev, "No dma memory for inb_ring_virt_addr\n");
>  		ret = -ENOMEM;
> -		goto err_free;
> +		goto err_free_irq;
>  	}
>
>  	chan->oub_ring_virt_addr = dma_pool_alloc(chan->re_dev->hw_desc_pool,
> @@ -744,8 +745,6 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
>  	out_be32(&chan->jrregs->jr_config_1,
>  		 FSL_RE_CFG1_CBSI | FSL_RE_CFG1_CBS0 | status);
>
> -	platform_set_drvdata(chan_ofdev, chan);
> -
>  	/* Enable RE/CHAN */
>  	out_be32(&chan->jrregs->jr_command, FSL_RE_ENABLE);
>
> @@ -754,7 +753,12 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
>  err_free_1:
>  	dma_pool_free(chan->re_dev->hw_desc_pool, chan->inb_ring_virt_addr,
>  		      chan->inb_phys_addr);
> +err_free_irq:
> +	free_irq(chan->irq, chan_ofdev);
> +err_free_tasklet:
> +	tasklet_kill(&chan->irqtask);
>  err_free:
> +	of_platform_device_destroy(chan_ofdev);
>  	return ret;
>  }
>
> @@ -892,6 +896,8 @@ static int fsl_re_probe(struct platform_device *ofdev)
>
>  static void fsl_re_remove_chan(struct fsl_re_chan *chan)
>  {
> +	free_irq(chan->irq, chan->ofdev);
> +
>  	tasklet_kill(&chan->irqtask);
>
>  	dma_pool_free(chan->re_dev->hw_desc_pool, chan->inb_ring_virt_addr,
> @@ -899,6 +905,8 @@ static void fsl_re_remove_chan(struct fsl_re_chan *chan)
>
>  	dma_pool_free(chan->re_dev->hw_desc_pool, chan->oub_ring_virt_addr,
>  		      chan->oub_phys_addr);
> +
> +	of_platform_device_destroy(chan->ofdev);
>  }
>
>  static void fsl_re_remove(struct platform_device *ofdev)
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
