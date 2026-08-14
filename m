Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013016.outbound.protection.outlook.com [52.101.72.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6636933F8B7;
	Fri, 14 Aug 2026 21:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786741743; cv=fail; b=WvTsCYB0jEww2LgVh3E+1jBGTkBPg+W22wDOOg0G13Aad53+eXDzxteCt/SwIOagXVLQmE2zD/mXyRBmdCrBZhb6fjX/N4lc6tDcG6Ph7sB4w0fV+XhQEIfCBz4M6VrRkp+/xqpZhJN4OLap1Pl7QFL23oKEllwjtPk1zAdbdT4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786741743; c=relaxed/simple;
	bh=2YBWdFIeP/5RLvH0ekoqLkdtVlKtzdvdIoO5OWbT44g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=R72blfoIxDixMR+wvuunBRCo37mgy8LoPubKIZfdcCo3kOo80nvIUi1YH1DYvBo7Mg9MuCaEF3IX0i3Ix6S0AgFr2OiX5GFL5qE/GP1E8NTf2BzOVQQfiZb4nU6WzBQMNLzYupU/Xpz+jCx1x4wi7A+JhBuzwZEqr/B2TIAYz00=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=tABFdQ9r; arc=fail smtp.client-ip=52.101.72.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="tABFdQ9r"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G82/EOcTBLDhUyZJsDbsjeBJn0IWn0/zAq1sVhio+SVEG22U61T5416YoFe/noWdHXHDW+2Bp4XpHw5o1sznTMWkqCi+sAIhN0kLfNiIJ2NAvxvvL+gTLvfu2x0OpuXirGnvdLD7JVitEvRfYQj/tj9CgHzpYVVLqV7g5Ru5xgQAFCaF3IvSlx/yfUzY9aYV5H46AB8z7747V14Ek9NXV+oN3lXRotxiFv5DmCoyMfIaLuD+plNOFIIXWtCLU30FmNx1rAM+fGDQg5OzDY0kXNlBUVCzT0jlkZhmkCAnn2WOD9Vry8iRKhGW5UJsOfLs+lYjsmQF+Y/RPULGEUfhnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c3OrTmWY1Ck+Vy86RwaLUhvqd/Uu9Ap85AYROFbXkK8=;
 b=GatjpDaWStkhld3GCvC9Cy6OCOTymf08jXP2afxmRMBaEE+jpI9OdbSHSX/FazHWWvTi86mosvFIQwdf7fRZtMMdtEMERi0UknKHRA7x4hAmJ71/At6M7D6Hhlb922ZaGrBqsGZXV/WMUTqOKlqb3+N9NfoSPT06zRxhsAqUh8UlZoRbal3wi/6xCf+jkITFykqWVQ2hFGOLQNb8Oy7rb1euL/ZfO4vJGinaAL1D3LI1LgyPQRy0Yr9efwMwe3kTzuaak8E6TCfy0IZx0MODq9B9OHM+/ispitBq0GI79iJBsoM11hBPjOnbxasqYZ0GDLlbYktE/xZMAqXyiSE0dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c3OrTmWY1Ck+Vy86RwaLUhvqd/Uu9Ap85AYROFbXkK8=;
 b=tABFdQ9r2Ps+0aOCC5ApvuBgqWBxZcTOtCnCGe9x2LszXMENSen8VSZyCcuxmzX7Z3UBwRoTqhwogwn6J3BWUd6qcdkF7gdzNmz4jT2HlFFcTiSfrR/0KjqZPw4WuMxqbH4YFbxTDPO5+y22KiAHMKJqwyHAQzQRofxOfWW/gTTvmCROGb4L19w+Zn/9WJONJYPj737JOWiKswSMWn+067RGHIzEzJOGZQZGfxT50V2UTTgkpDxSRi0loViZDz4G+C7lmaSR4qVfQtQ2IzG1Czr+hlSFP7Vg5grmhJwnQkRwIZY/gmpUmg1kNIz6tzG8eGF66rzQLPDSLgo6Tda0ag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM7PR04MB7159.eurprd04.prod.outlook.com (2603:10a6:20b:111::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Fri, 14 Aug
 2026 21:08:57 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 21:08:57 +0000
Date: Fri, 14 Aug 2026 17:08:50 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	"moderated list:MICROCHIP AT91 DMA DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv2] dmaengine: at_hdmac: use more devm in _probe
Message-ID: <an-D4k84MUptmfkF@lizhi-Precision-Tower-5810>
References: <20260724225720.43410-1-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724225720.43410-1-rosenp@gmail.com>
X-ClientProxiedBy: PH0PR07CA0050.namprd07.prod.outlook.com
 (2603:10b6:510:e::25) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM7PR04MB7159:EE_
X-MS-Office365-Filtering-Correlation-Id: e4771837-bc6b-4a5f-8610-08defa484104
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|19092799006|1800799024|376014|6133799003|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	lzjVctALNVRcHgP3R0uSGfuXZSnjV2HDC8Lagzx6CCh93LHEec0dKh18uaNSKgju+bh72HCkGckQGG44b8q7PSvCGwFFswliP1e3m/QLvXDPeHNED2HVD7k+sxwQE9mxvu28UgNBUWrI1E/ezTFFGXOQ2fNyE4sBbWvA59ev5+mWmcp/51tUExJpSUFB8w+sTICtJPmpmd03cPSgPoGS4WqrLjOoRNT2NSqiTwkXOhJjR78KS5+iCVB2QhbpXLz+y4Q4tNeJ4IIp4DTCB01gcKwFBEkwe/gQF9Z7vJo4rbHxBEG61pltDKa/NSWfrhGSL9AT/yJHO7FA66WhDH1J47G5wS9nGm87DzheITTp7c+5VvvWf7PTuNXmVsctR+7uzgQ5RoCXRNIlywkrg+wAIokCXiz7EtFUKPBHzh+TrTLV0Q3GN6q8YM0noKNmRFUwGAUSXpny+ItClyUAm1bcx2v2robRlmyih7oTJFyNVrTvcD1b65IUnGwGRxSsLLLe3rbi/cRjjqR+bc5N3JYWim13n/FPRfChFcOzayIsp+dMlRJCd9sHEwr8xpDBYDn/2PorPoHQ1TLr8Mkcm3ApHQ4iuaUPikWnFhnjXYmaLa4Qe3PK6ybZkv2PlI+v2fc5v/VMUAecMj6ERmA8/38VPxJsbVicv1qDlSVcqqZIyd4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(19092799006)(1800799024)(376014)(6133799003)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HOZzuW0MCZWWzqb5Agj+3KxvGhOEP1Gp9Qs6g6gOEaY6oY5nIckpxNB5S/OJ?=
 =?us-ascii?Q?ReHLgEwGT7kNEIpMVFWyE35jjvoQ/KvK8rGLIeFs8WD6dGFKeLv5h+ts1o5n?=
 =?us-ascii?Q?Wdy5kFQEN/CP/qmX3AO3Qmr5AGv/6rg5+Lq01pT5gykZhSmcPwj4dKHOQASk?=
 =?us-ascii?Q?C55Y1eAOlWIJTDgpF8ceKHKF6XSqhGIyRikfOYeSyJgLntU3Z7Ht8rFxZbZe?=
 =?us-ascii?Q?MoCkcJwTKHRPudMED2CWbQ7ShCSHVzwoyK47CFULb3Vn3ySu273MFqIbbg++?=
 =?us-ascii?Q?j1/mH7J10svAD73PqxAY8vPNrcoI6ALmi3cJClE2I09nFzBq+wNRtDC6VYoF?=
 =?us-ascii?Q?60XlY9oGcRvG+vBi7jvKXSyENKj68zxh2Wu+QBjagwpIK6sVCH9wuaoJNWyC?=
 =?us-ascii?Q?T0OJiD6q5wOQ1nBZV8AbyvnQY8/HGq/FxBqmJBLK+GZCzFK6pDprn8I5/jwY?=
 =?us-ascii?Q?n5RgaMBB86Vsmf0n+RjoeXPCejEob8pB8n9LnOLtgwiHxzkqNxX/ngPZ2/7O?=
 =?us-ascii?Q?YKZmGzCn5HFQTfkQpRRDOgA+NGwlfM6tYGXkYz9umJdU9uNF2S6vHzJGaoxk?=
 =?us-ascii?Q?DR4sJNEuwrUL+Gt1eXYUhjSPwPK3gd62IJwcehWv1x+v/1z4XDkBDkAbTlO5?=
 =?us-ascii?Q?HBCyVv2YJIbvsvOIJ4+Pjc9wzdIBM0hqMr5xfPxhCesFq3Zdxwe6zHpvea9h?=
 =?us-ascii?Q?nga9SXJYeDOMveNF9bQ2Pq6GT9jjfYqBjN6+YVkJElTI1lbrCD5xW0eMS4Tl?=
 =?us-ascii?Q?DzTbxEOzIY4xCsFKAW/s8d6ouea3tWTRKVIen7cngyTqLe1G4l8b5VgZFb5c?=
 =?us-ascii?Q?5J3BIuysZngi/GaZAlcyF5IDVVdYsSUIOYNCM54pXi6XUR4U0h834z9ThyMo?=
 =?us-ascii?Q?v2Toofmlu1hUJjHmMyeMifohqH+2Rqw7Ua8+g7a7NYM8pKC2voVsgcrd4qBW?=
 =?us-ascii?Q?FjdKNyAu/PFd6pMVbnM5jLN1/lDiX7wvUx/68OwqFt6t0wH8PQIBnO1KyTPk?=
 =?us-ascii?Q?0yQ67cjCOsrSUxMXJgrPe585IYaR7OWc/lZCAiCoRSVsQkdi6DjwD5S4cC/p?=
 =?us-ascii?Q?3+Ak6s6lYSXC/guCoAMsvDho/ZU8pRjInf0TZ09Wdj1y24oG+STW23UDnIlr?=
 =?us-ascii?Q?nP2VT5isXVDZiBaOnXPOa/DXrpZejzK2BjBUzD3wiVVscTYOyXepkiepcZU4?=
 =?us-ascii?Q?m+Q1sz5A45maE+wFte8udAon7t3LFSFU7N0Fm9deqyvKDfJUTCwhNfSIrY2q?=
 =?us-ascii?Q?H9pXCDQ6IesvMcGzLUI0Oj16VX+HfsMuXrcHogHEx7db1PWYPivd6gTtFy8R?=
 =?us-ascii?Q?7Y60CCscCmjEezZqLoDlWjpE4eFlW66Lqbc/d/4zY9+QnRFlclJGLXAad1cE?=
 =?us-ascii?Q?FPB0nYqHDUtFXdwylJ9ZlALLjhyn6n6WisnYWZDFvDDUbV37H5RP2+y1iYXk?=
 =?us-ascii?Q?Zh2/UflvB/+BO4c3Iih0HQpfEWoN6OI05R82EryInzKLZvls9o9UUYxMnQ5K?=
 =?us-ascii?Q?4E1gsXTJyLjOVzpQOwj/qTjX079mhgT/bK2J9A+ws3+vqxqIbt/z2HF9phVX?=
 =?us-ascii?Q?+wlJ8r3zDK2YdFLFONn3yWeSpcM3NBm9urNRkPKMCGDEiOTwXRz+DwWQMqC4?=
 =?us-ascii?Q?u4FUj9l9If7LpZI0M7AadHZIrX93otqRBbrVJdEwPYn97JqeQognLg5o97hC?=
 =?us-ascii?Q?AenwE4+F69Ymn2Ty8aphxSNW0vQg4Qel6e3jrsr/BZlz3hHlTBDzyTJgUKOt?=
 =?us-ascii?Q?bjbuW6xVhqB+hbKazNsc/d8XNCZqzyQHHk6sOx5AfYBCXdUH4Dt0?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4771837-bc6b-4a5f-8610-08defa484104
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 21:08:57.0519
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T3UKkGH5STyVLOk/vCpKM129a/bNNMI2vxCXGf4g4IAGwsAy48+7p8zh75BH2UnhWEbPJ3TmOoZEFYvsCUEoXWhGyPlXSzZ8bLXfxuPM/EsunFoGKF7RMn0uF1N5mdC3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7159

On Fri, Jul 24, 2026 at 03:57:20PM -0700, Rosen Penev wrote:
> As devm is already used in _probe, complete the conversion so that
> everything unwinds in proper order.
>

Thank for. suggest commit message

dmaengine: at_hdmac: use devm APIs in probe()

Convert resource allocation and setup in probe() to use devm-managed APIs.
Simplify the error handling path and removes explicit cleanup code.

Frank
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  v2: remove list_del
>  drivers/dma/at_hdmac.c | 50 ++++++++++--------------------------------
>  1 file changed, 11 insertions(+), 39 deletions(-)
>
> diff --git a/drivers/dma/at_hdmac.c b/drivers/dma/at_hdmac.c
> index e5b30a57c477..f16cf29ca548 100644
> --- a/drivers/dma/at_hdmac.c
> +++ b/drivers/dma/at_hdmac.c
> @@ -1980,40 +1980,34 @@ static int __init at_dma_probe(struct platform_device *pdev)
>  	atdma->dma_device.cap_mask = plat_dat->cap_mask;
>  	atdma->all_chan_mask = (1 << plat_dat->nr_channels) - 1;
>
> -	atdma->clk = devm_clk_get(&pdev->dev, "dma_clk");
> +	atdma->clk = devm_clk_get_enabled(&pdev->dev, "dma_clk");
>  	if (IS_ERR(atdma->clk))
>  		return PTR_ERR(atdma->clk);
>
> -	err = clk_prepare_enable(atdma->clk);
> -	if (err)
> -		return err;
> -
>  	/* force dma off, just in case */
>  	at_dma_off(atdma);
>
> -	err = request_irq(irq, at_dma_interrupt, 0, "at_hdmac", atdma);
> +	err = devm_request_irq(&pdev->dev, irq, at_dma_interrupt, 0, "at_hdmac", atdma);
>  	if (err)
> -		goto err_irq;
> +		return err;
>
>  	platform_set_drvdata(pdev, atdma);
>
>  	/* create a pool of consistent memory blocks for hardware descriptors */
> -	atdma->lli_pool = dma_pool_create("at_hdmac_lli_pool",
> +	atdma->lli_pool = dmam_pool_create("at_hdmac_lli_pool",
>  					  &pdev->dev, sizeof(struct at_lli),
>  					  4 /* word alignment */, 0);
>  	if (!atdma->lli_pool) {
>  		dev_err(&pdev->dev, "Unable to allocate DMA LLI descriptor pool\n");
> -		err = -ENOMEM;
> -		goto err_desc_pool_create;
> +		return -ENOMEM;
>  	}
>
>  	/* create a pool of consistent memory blocks for memset blocks */
> -	atdma->memset_pool = dma_pool_create("at_hdmac_memset_pool",
> +	atdma->memset_pool = dmam_pool_create("at_hdmac_memset_pool",
>  					     &pdev->dev, sizeof(int), 4, 0);
>  	if (!atdma->memset_pool) {
>  		dev_err(&pdev->dev, "No memory for memset dma pool\n");
> -		err = -ENOMEM;
> -		goto err_memset_pool_create;
> +		return -ENOMEM;
>  	}
>
>  	/* clear any pending interrupt */
> @@ -2080,10 +2074,10 @@ static int __init at_dma_probe(struct platform_device *pdev)
>  	  dma_has_cap(DMA_SLAVE, atdma->dma_device.cap_mask)  ? "slave " : "",
>  	  plat_dat->nr_channels);
>
> -	err = dma_async_device_register(&atdma->dma_device);
> +	err = dmaenginem_async_device_register(&atdma->dma_device);
>  	if (err) {
>  		dev_err(&pdev->dev, "Unable to register: %d.\n", err);
> -		goto err_dma_async_device_register;
> +		return err;
>  	}
>
>  	/*
> @@ -2092,27 +2086,15 @@ static int __init at_dma_probe(struct platform_device *pdev)
>  	 * dma_request_channel().
>  	 */
>  	if (pdev->dev.of_node) {
> -		err = of_dma_controller_register(pdev->dev.of_node,
> +		err = devm_of_dma_controller_register(&pdev->dev, pdev->dev.of_node,
>  						 at_dma_xlate, atdma);
>  		if (err) {
>  			dev_err(&pdev->dev, "could not register of_dma_controller\n");
> -			goto err_of_dma_controller_register;
> +			return err;
>  		}
>  	}
>
>  	return 0;
> -
> -err_of_dma_controller_register:
> -	dma_async_device_unregister(&atdma->dma_device);
> -err_dma_async_device_register:
> -	dma_pool_destroy(atdma->memset_pool);
> -err_memset_pool_create:
> -	dma_pool_destroy(atdma->lli_pool);
> -err_desc_pool_create:
> -	free_irq(platform_get_irq(pdev, 0), atdma);
> -err_irq:
> -	clk_disable_unprepare(atdma->clk);
> -	return err;
>  }
>
>  static void at_dma_remove(struct platform_device *pdev)
> @@ -2121,22 +2103,12 @@ static void at_dma_remove(struct platform_device *pdev)
>  	struct dma_chan		*chan, *_chan;
>
>  	at_dma_off(atdma);
> -	if (pdev->dev.of_node)
> -		of_dma_controller_free(pdev->dev.of_node);
> -	dma_async_device_unregister(&atdma->dma_device);
> -
> -	dma_pool_destroy(atdma->memset_pool);
> -	dma_pool_destroy(atdma->lli_pool);
> -	free_irq(platform_get_irq(pdev, 0), atdma);
>
>  	list_for_each_entry_safe(chan, _chan, &atdma->dma_device.channels,
>  			device_node) {
>  		/* Disable interrupts */
>  		atc_disable_chan_irq(atdma, chan->chan_id);
> -		list_del(&chan->device_node);
>  	}
> -
> -	clk_disable_unprepare(atdma->clk);
>  }
>
>  static void at_dma_shutdown(struct platform_device *pdev)
> --
> 2.55.0
>
