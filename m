Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011067.outbound.protection.outlook.com [52.101.70.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38682C21F0;
	Fri, 14 Aug 2026 19:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786735199; cv=fail; b=hih5Xq31QjvqXulTlwJcCrpABAkrhM2C93om06dRJQv6pBlhZug8Y++zzyLl6NacIL2pMpd3LirxKRY7eTskkkVQSU0SdrRp5Dux0MoTPlMObHz19d8pEGRKmjbEeU75mdG+AzuK9FPWUpDUziC7MGm+L8iA5+Jb2bKdhxVMQyo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786735199; c=relaxed/simple;
	bh=HENsPT73oGejzHmw40CUib73zSReluNPLKf/j/f1CLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iJTY2vHkNHCjVT0yx17ao/jPoUle+FAQgh1EE6yC9Qe1anewzlEG0F6ppYJ1tGIHcNnqPbCom8XAgcnCwTgF5ySfhZSQ+PveUX/psXcf+M/lEYF9wnIWj9M4O65Kv7e5CW3wUri+WmDZ4ZjtvjYhQSMpc+xTjp8N1kKIFJJTL3s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=al6eJknO; arc=fail smtp.client-ip=52.101.70.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="al6eJknO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XyvFCfv9YWMlOXxBJnkGgcPykuj9tZGgY19/JnUeADLcLao1HV9rtngVozmqWxYWi6VHk5PLrceZC+vr++lppAq7wh52ZVtsZ76qfMnEItI3C9FhrLl94Jd/qMA2moVUfhnV4I7H3wp+o8Xg4+8fl0MbZWsP9r6+UiucPx0goTl2svJ05X5KdLyyz3DTzAYl65Vp+jeQoD8k6bt5EESuKb2PdtHiRSSmTgLRcOzfU8RUKweLTUVqRYeQ7GhM8yd3Fz8fLacJ7n/90nweiV6y1ClLkQpvIeaywaPwFdgeg+uiSap6NXCG7YLEQMVrpxxVU+Wy37rkvvUIlYgCDgA+RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ml4nFFPO4E1DRPtyQK31bvAG+DqqBMl5o3+Nm/A8ZXo=;
 b=a/DGIcVXZMHwHrqtyYgyJduZhKAaf4Fa43THI+QR81lxXiKYMlcR8RJldcQh4+vD2HJQGsstJF/o7xXjlBR/W+/8RE4UKnsCtqAWfC/FI0b/DHQGDBO4I5SAq2jm6QQ0L4qW30TgbpyjTFcagBjupe1Tdkvqc1zW/+GZuojnXsvYopFjZhYrAA9HTYdRf4R9x+vF91e2Nj9eZUAvKDKJ1BjdIz4NMF+HzFJc4XK1cDTxA5ifGVcMsB7CPOnZbUbGtg+clrLCdK6Hiw51QaLQBdUXcknUz6ckcB7mpeBSkBKoRCOSwlCv51NfL8uyemwzgY34tMO8nVJT8z4oSpX2+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ml4nFFPO4E1DRPtyQK31bvAG+DqqBMl5o3+Nm/A8ZXo=;
 b=al6eJknOA4T6MjLp148cI7MgrjLQGIIcG5IJM0XqXwVRRd7mfv++r+lfOETC6ssn+O6l6fhFcmq6gKAZU4LW54n1D6BJvGzUqwP729/YIohc3YIc0Q8GXXeVffrvQgp06LVkki6lIBtmkJHg+KN0rOMec4svGJPURvQrkcOo0krANtib63RukV/552hyPCBf/Ru9Ie8hzJ65ulQOwyO8/vvle9j3PoAJO2uWZhP3jVb22g96Wf/nRTAzGqZrhZKXLucRfrILSrgq5NBCkivVj9yo1RXH98i7MTNbGtuOSaxSvRNU1lVyfsfo2ZZFijnA8/qNx4GxM4N+DFWOdKuhsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DBBPR04MB7996.eurprd04.prod.outlook.com (2603:10a6:10:1e3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Fri, 14 Aug
 2026 19:19:54 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 19:19:54 +0000
Date: Fri, 14 Aug 2026 15:19:46 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: Re: [PATCH v2 RESEND] dmaengine: mediatek: hsdma: fix runtime PM
 leak on init failure
Message-ID: <an9qUnMZ7_iRTwY2@lizhi-Precision-Tower-5810>
References: <aj1RSj5ZXvc-9yu7@lizhi-Precision-Tower-5810>
 <20260804153924.49627-1-mhun512@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804153924.49627-1-mhun512@gmail.com>
X-ClientProxiedBy: PH7P220CA0137.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:327::22) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DBBPR04MB7996:EE_
X-MS-Office365-Filtering-Correlation-Id: 785f92de-aaf6-4075-6380-08defa390559
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|366016|19092799006|56012099006|10067099003|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	6bow7FiMO90jOV/wY5kt17SkbxIkLOmN958BIvAc2awlvcBp1bLaLxGNou+JmWYb/vkJLxJIcq/ujyUDDQgwzTuVWFGQzKVgQO3t3P1Givg6qhdFxrODLtWUoX7TpREP/Sb+YHL7eJl19nl0suInq9af8CgaQWRYf3nbjNTYq8KPEe6nawEZw92LWy1D9PINGaLTjZuIrtw9x6JVpCKjCdNaCsBAGK0iOGbZDlyJvYklEEduV5lwc1uW3mQxT8YWNdBttURDkP5PUwQFiEgy0W7OK8jWfECGgh7dW6sCdxLZGiAS6nWZ4PLPTE7fQ1blffPRHXz1p2gLRf/lue/49txNBXWTHv1u5kZqcfwGoVWO/bSvpFWZtP/tEnU4HT40eJUCPkOTuESDxrw1CaWRk8rArGzcXCtjr4VTKgXLUPwA8wbtxru1W7i3cmbC/m0E7rMso9jsIhQ6pvzFym7X83qAjwibWnsc2pzABPuZNdmi2Pw+zgDIsm59keV/mcF3x7ZGTjcPK2mAJd7aLXgthuSEwQHOPYl+rdxjJOSzOJyWr/0FZQhUQ/Qb8YB5h1DS8YxDWt2uHxEnUP2kCPA17SpA2oNOXGsNlyYBVMAHShK3CjgiGzuUDZ6xlnurNncdbsgq1EAsx1V7ubBSry/FdHX3LJ7K/rbOpaPqUAAcDN8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(366016)(19092799006)(56012099006)(10067099003)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?E6sZ2PjP/nLnSgLcMfJ5wUlIUw3cXi/7A6doB4V9xHJz8CHjS8tXB6vjPzOk?=
 =?us-ascii?Q?9uAXuXFf+++sFpPiiuFWhzzkuihHwsgbAPL90EF7B/zWUK+3sHLusKZz+zac?=
 =?us-ascii?Q?QlQTl047+tf58Sjy5upmodbJRK2rVsxbvRghs9V3StWabYm8Yq5Yn8NjwZPi?=
 =?us-ascii?Q?LHWEShOKSAnfCDfzoMEuWTPBsKpPZ0gJZppdvUlNLT3bN8lOyWM16COGl4bz?=
 =?us-ascii?Q?+iqaJVhtQlz5VeJ3DNDbdLpbHwUzcbA6QNZFaUXMuEp+KV0BYbS3E1L1+r3L?=
 =?us-ascii?Q?E3wwVGAzb3WZgvRIXylzwCR1LNx1D1w0YgFPNEun30Fp+B+ODDIK6gpW5yLI?=
 =?us-ascii?Q?n7m3aZHG0K20Ao33f5Csl/OxHS3ZgPioyft7Pzyn3mICd5c20MkXrUu0sKJo?=
 =?us-ascii?Q?IBN4EOIrm1CDLAK5cLjRkEhduqyvN9zmsKe4+6ynGdabnqnuEnoGM8RHu3ZD?=
 =?us-ascii?Q?1Qr6UnZ4dvv92FZPFIpeFaveJSNh70eBmdA0FzXFNUkHR0oI5tLjZJ//AB9l?=
 =?us-ascii?Q?77NUAeQeX9aQYhmDOUXUNQdoKS7B3UNHCUcH5KbUyYEWhTkHh+xZ33YAo/NX?=
 =?us-ascii?Q?1z5PpWUvjZc4WpxR9qtV1ioXvACud6xEI6Wrt67SdOlY9WVFmT4MyYN93VsE?=
 =?us-ascii?Q?B/eRRV/DZ1wRZFVV3VWqeMAtE8T2KLKFjMXOW76cR9FJs5JGLEsRkxyMnD7L?=
 =?us-ascii?Q?mh3c8n2fdSu7GU05XGPv59OgpKQgMYnsXfnaMtjiQO2TpXDTBE9h6HaRZ3sa?=
 =?us-ascii?Q?jJM/+ObC/16oUkJidBoi5WEnnzqxOeZnyztFY5EphzA+O45llF1r0/3i19b9?=
 =?us-ascii?Q?2Ce8T7Gaf6Y2+E9ECe4ooqsEH8Sb6y8SIAvjlVnpMFSMpeg7QkoLXVnpTV2O?=
 =?us-ascii?Q?lKsHxzzlxUFl1LqP9S/PxGoniEOuefHQdKQQoMMDTXwBvwZlkJ/xDfBlunya?=
 =?us-ascii?Q?0nOyvt6Fcmv5MxLwq7KoHvbwfSUg0b2syDDffed8ZRKUuT/QcqWEKAlZVf+H?=
 =?us-ascii?Q?+BCvOJWPSPfof6NaaGL4OUYgc4Qe9fOYMCpXMziif2GL40r6lb/TQT2e9HaK?=
 =?us-ascii?Q?YTKv7mnWpqay+Hw2ESMOIm5JGC1pjmKjrzAobJnl0SsA5TgxvNUETUb7k1DF?=
 =?us-ascii?Q?wLCau2pkwMDu3A2kzKXJfRAiUacjoI/TWqo7NEMbV/qL7zmO1SkrQFg9lanG?=
 =?us-ascii?Q?eIbUrIhMipook2Msu968ldBeB4fqvw/H5lrRKALZf7LnAF/5tB9eB6mSOj77?=
 =?us-ascii?Q?BJiSnCjpBeJX3KIIbL3BnE4oekOYv6qxf37h+g57Efxt7fzz30QKzHFsT9ry?=
 =?us-ascii?Q?r21hx9Z7g06k52qEVuFLgmjkqtZZL5wagFrM+YJwnN9RXCHpthymmMYZcLRm?=
 =?us-ascii?Q?MtNRbqnhyYbCoY2GIjFKrOtZmKTd4xO+ymhUUkt3TqnQ/cT2kCHxAwjGWUwU?=
 =?us-ascii?Q?fNtQmfmpBXwCbRWol2cqDToUfYKjSV3jnIpPelWAcAnB9aRiXf2PcXOxtKIu?=
 =?us-ascii?Q?8gLhPiFhw22b5HFsWXUMszFjEUs0RuVF0SK+TLR//Mw33m1BTAeC1Kwyjd3B?=
 =?us-ascii?Q?iVua8TZJ4sFCMfIJ43JMmFtPnwFYqBmmchJw54lm3wIUs5lVvBo3+pu9nkQF?=
 =?us-ascii?Q?GpOKR5bycWVebpuX75sdJIu+UqeGGsW65uimf55JpOyhIt8gOwWbBMVzo+oQ?=
 =?us-ascii?Q?egaDZGVdFkOTcVq3TAj8M7nDv9AT7kvqzEq98dkXwXEcMS+dzw4AmhMUYu1H?=
 =?us-ascii?Q?ifrSq5I0ccClY4uS6o/ZAMbAZ7lkoCWIv6Wv2X4MCnPa55jAOHf7?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 785f92de-aaf6-4075-6380-08defa390559
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 19:19:54.4680
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fdUwU39x3+JZ6suoLeov4Pp+3xcx6yErG9PIR1a53RD7Z1DvSH22oxaBrQB5dFFjkzRAj63Oqw0QeumV5bASdQ7CK/3jpTV9O2HtTeo3rOMg4LI+92p2o8WsTZb/mpTw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7996

On Wed, Aug 05, 2026 at 12:39:24AM +0900, Myeonghun Pak wrote:
> mtk_hsdma_hw_init() enables runtime PM and gets a runtime PM reference
> before enabling the HSDMA clock. It currently ignores failures from
> pm_runtime_get_sync(); if runtime resume fails, the usage count remains
> held. If clk_prepare_enable() then fails, the usage count remains held.
>
> Use devm_pm_runtime_enable() to manage runtime PM enablement, and use
> pm_runtime_resume_and_get() so resume failures do not leak the usage count.
> If clk_prepare_enable() fails after a successful runtime resume, drop the
> runtime PM reference before returning.
>
> The probe path also ignores the return value from mtk_hsdma_hw_init(), so a
> failed hardware init can continue as a successful probe. Propagate
> mtk_hsdma_hw_init() failures from probe, while keeping a separate unwind
> label so mtk_hsdma_hw_deinit() is only called after hardware init succeeds.
>
> Fixes: 548c4597e984 ("dmaengine: mediatek: Add MediaTek High-Speed DMA controller for MT7622 and MT7623 SoC")
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

Please don't post new patch to old email thread.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> ---
> Changes in v2:
> - Use devm_pm_runtime_enable() for runtime PM enablement.
> - Drop manual pm_runtime_disable() calls from init/deinit paths.
>
>  drivers/dma/mediatek/mtk-hsdma.c | 26 +++++++++++++++++++-------
>  1 file changed, 19 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/dma/mediatek/mtk-hsdma.c b/drivers/dma/mediatek/mtk-hsdma.c
> index a43412ff5e..27cb370106 100644
> --- a/drivers/dma/mediatek/mtk-hsdma.c
> +++ b/drivers/dma/mediatek/mtk-hsdma.c
> @@ -848,17 +848,27 @@ static int mtk_hsdma_hw_init(struct mtk_hsdma_device *hsdma)
>  {
>  	int err;
>
> -	pm_runtime_enable(hsdma2dev(hsdma));
> -	pm_runtime_get_sync(hsdma2dev(hsdma));
> +	err = devm_pm_runtime_enable(hsdma2dev(hsdma));
> +	if (err)
> +		return err;
> +
> +	err = pm_runtime_resume_and_get(hsdma2dev(hsdma));
> +	if (err < 0)
> +		return err;
>
>  	err = clk_prepare_enable(hsdma->clk);
>  	if (err)
> -		return err;
> +		goto err_put_pm;
>
>  	mtk_dma_write(hsdma, MTK_HSDMA_INT_ENABLE, 0);
>  	mtk_dma_write(hsdma, MTK_HSDMA_GLO, MTK_HSDMA_GLO_DEFAULT);
>
>  	return 0;
> +
> +err_put_pm:
> +	pm_runtime_put_sync(hsdma2dev(hsdma));
> +
> +	return err;
>  }
>
>  static int mtk_hsdma_hw_deinit(struct mtk_hsdma_device *hsdma)
> @@ -868,7 +878,6 @@ static int mtk_hsdma_hw_deinit(struct mtk_hsdma_device *hsdma)
>  	clk_disable_unprepare(hsdma->clk);
>
>  	pm_runtime_put_sync(hsdma2dev(hsdma));
> -	pm_runtime_disable(hsdma2dev(hsdma));
>
>  	return 0;
>  }
> @@ -983,7 +992,9 @@ static int mtk_hsdma_probe(struct platform_device *pdev)
>  		goto err_unregister;
>  	}
>
> -	mtk_hsdma_hw_init(hsdma);
> +	err = mtk_hsdma_hw_init(hsdma);
> +	if (err)
> +		goto err_free;
>
>  	err = devm_request_irq(&pdev->dev, hsdma->irq,
>  			       mtk_hsdma_irq, 0,
> @@ -991,7 +1002,7 @@ static int mtk_hsdma_probe(struct platform_device *pdev)
>  	if (err) {
>  		dev_err(&pdev->dev,
>  			"request_irq failed with err %d\n", err);
> -		goto err_free;
> +		goto err_deinit;
>  	}
>
>  	platform_set_drvdata(pdev, hsdma);
> @@ -1000,8 +1011,9 @@ static int mtk_hsdma_probe(struct platform_device *pdev)
>
>  	return 0;
>
> -err_free:
> +err_deinit:
>  	mtk_hsdma_hw_deinit(hsdma);
> +err_free:
>  	of_dma_controller_free(pdev->dev.of_node);
>  err_unregister:
>  	dma_async_device_unregister(dd);
> --
> 2.47.1
