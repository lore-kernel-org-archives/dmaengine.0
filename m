Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011046.outbound.protection.outlook.com [52.101.70.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A6D4BCABA;
	Mon, 28 Sep 2026 16:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790614182; cv=fail; b=B8HXKDK//pCOWd4c4AbvtVhzPnVdKppP9+ONbIWRidQfCxkXhbU54KEJ0LovKNqAFBPbqtwHI59nPjcv4idFEDOtt34NrreVi58Me6nuwFnltXazuIYkKbKUgals5Gq8OCe9Q2nteFXkeOEYb7XuUAqJ+3PjNFGIjR+z+6l6rSA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790614182; c=relaxed/simple;
	bh=sNDWMp4pR91xg3O4DVSw7/CUbX9bJrL1Ssbb1IvxvmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=q7/Gl2mpe1SbMNvFigR/NKchKz5gA1tHxgUNGr9j49B2f6Ec+DqWQg0GvENIlPJSrji/dWADcyjwlGLUPX8LnKWxmt9gxDMJ3aF5q72tdrBcbgexWa2mUpS5ZEQDB5nVY/P3AGcDLn4WQq/zapxBrU5MVFCpKFSRtUnPn6Gn34g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qwbKatcM; arc=fail smtp.client-ip=52.101.70.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qwbKatcM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CwwMhbwLgnaGTt2dHmywx4qk1QM8E5xTAfq9GQA2rrtSGuwjpo0VMokQzGQt2HXSfH6gZx06YLAEU5H8pZPtehlSgJEHBQGNEbZwFXi4hASvXspRILFf8O5DHca6F0zN0+onY7MKLqzgNmr8tedfb+wXyiRHv9x8x1oiQKSU1fTqrY5LDnQpJyDkBYGmpUwfGb7Hs5ZosqLdm1Ife8CzTzRpj+F8xxMsF8H+t7+4bWp2jNR7cSWUhT3jNsnm4zRrI02gnzErAGCrcJBV24rdSXZEEeS22nWOKJZKy7UrGhlnhOAAXbMf13HZRL3ze22PkVq4t//51EYbrX2gcYMu9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MEAHm4fs6j2VLTSoOxYy+Ot1LbExwwKKZViCoO9THS8=;
 b=bUijS2WiuhUki99qdgtp48Tyt5T6L9u3uej9EfkN0hEDqKuWk8IuUE7MhEXhKW2DVhT/FPFBZc0SyqrdtK52qIvhBeaKqsfSmPS6pVTOTTwKFoMRLKZK/Xm0NSPWVf3fd57bEjWgd1Jck9O2DK+L+j+EEn8gOGCM2okIRwtBeErnYwdqlj9m/u3GmWogpvW9wEp+fWiK661V6GwlcRpkyoZb02uWQujx/efZkXXTC8pXTciVxtlz84fkF1Sxcb0761LfYNgRR1ocb9X3usA2HeYPmIQmIRG6a7bWlxcZwoIsE9ErKCC+Gns4e3RPIp08BpGpa3JLOoKl1VMfahrH4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MEAHm4fs6j2VLTSoOxYy+Ot1LbExwwKKZViCoO9THS8=;
 b=qwbKatcMyTkKy2wcKAKyE+Yt35J4x+8bXwMJumhBTJS9gFUgeK0fbf0glXSw7lldj3bfG+zmdwb5w0KUhKWASkmk1cRzxksszMuBE+g3gEVN0jgvVpBn5hhDSlEYAMqPtFKk5Pd+wYUrGoPsTXK3HnDMVCjQSPLdGRg1h4apP4AqiwS61Z9Gbsu7SgiQvIEih5tIlxqQmdtqSS/B14cVoLPAPyV/n0p0e3dy9fatu8nYOj14BH2Oqs47cnB94WDplWe9W1kybD9PRf2XLrptWMjRpvNgoo8gPSIGJWcI72owC8Dp0J9zlFIeSIZ0evhf8t46yWE5OS2tBsxChcMwZQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8452.eurprd04.prod.outlook.com (2603:10a6:20b:348::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 16:49:36 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 16:49:36 +0000
Date: Mon, 28 Sep 2026 11:49:28 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, phone-devel@vger.kernel.org,
	sashiko-bot@kernel.org
Subject: Re: [PATCH v7 09/24] dmaengine: ste_dma40: Init hardware before
 registration
Message-ID: <arqamM5DWg0ry-v-@SMW015318>
References: <20260927-dma40-fixes-v7-0-89f595e8851d@kernel.org>
 <20260927-dma40-fixes-v7-9-89f595e8851d@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260927-dma40-fixes-v7-9-89f595e8851d@kernel.org>
X-ClientProxiedBy: PH7P220CA0118.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32d::18) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8452:EE_
X-MS-Office365-Filtering-Correlation-Id: 186d116a-71b7-4623-4bf8-08df1d807ac9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|19092799006|23010399003|1800799024|11063799006|56012099006|4143699003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	PRFC4H6J3jq02ce0wGtA1yZnEzheX5a4dnBIDYpDfjygHr/dePbrc5ObNUrKix68Bi0ph+P3+2LwsrtLsdg2duW0qnJbIqp6AxEyJ+0/+beb6aUqVQF/MiDYWuq+1rnLjPQO131PI4qvfgDXUhVw1hLA2US7jCOj5pQlF7y+Vc4GoARiNpHvj2mEOtDxG8W7NXzj7oEMINsjq2+tgrwVqgjLGvcJDBTDU9xIEL8R/cVYroeMfz5NnvuzzgN5dIHxk7G9rfSMgMWo9gkNeKiEThquwTYFZbyxX9QMp24wIqVe6qXDtZhDtKv2Ti+SASh7+TMimi0zoHT2Gcd0rhRWotCtzqfUeBRWoQoKOZMLkyvopGAHZEz2LpO7QdodESGjkHwpsmlq0Z22roYyVn6PfLm3QN1NnY6ibVceovUMAjMyWhZvCTlXoRthflEV6lJ724CatX29ge2JnVPBPp1CfJ3oRjw7JU5QKEeSywqgGUwyVi1yXwnLIwKXUepDN4Re5XSm7GSQk5SwBrIePl4Llyt4OIhUaLuiLrVJMyv+GMCJggJRIni2vhJT934qQVprVzCz30Xi0vChUYJcVR/DNamHiW+1ECRoU7QeQycJwVaQlEFg5p1dh9LF07oMNIOH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(19092799006)(23010399003)(1800799024)(11063799006)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XGJZFICJugHj4nOg5rh8TYoDuE4R0Yd4iSf7Z8mQwSMnJAbfT3V3sWPGt4rI?=
 =?us-ascii?Q?ultN3RuwEXZkcx8Da/CXrhagEd9QuHcLokdOVWkW7D+pY+nuVysw46QIXzWq?=
 =?us-ascii?Q?WWpKIajwbz0F3KazmG1ehKBZzd9evkprV3DV4Bhg6mjQ/fltDQ+wcnCGsBbJ?=
 =?us-ascii?Q?HJ2bnKK1Xr7e02kiSgwSAHVsHaSllgi5E5BQuVQZ1CiVvk/bdWdFRLQAjrQz?=
 =?us-ascii?Q?zdmTtizs+zMHonbUUwFiYObwRB7oyPdFIK8c2avFOpV3pLDayHV0KR6tcVBQ?=
 =?us-ascii?Q?Wqubca/gC/ryEV3vrfMQpwWJxEWaJrEK532rArsc8TSHGJDV/RYDIHfRA37O?=
 =?us-ascii?Q?TxhvwVhtVDu0Bm2dr2vDBOEdGuYY1QxjTWG2DW3R4J1QPX+6h84AAN5LPBoA?=
 =?us-ascii?Q?+f1ULeNZ/oScc4QawiaVQt1mxRTSyjiFoeKQUqDa3nveETYVMVDq3/wkBxWO?=
 =?us-ascii?Q?lO+jYPQC0vBSPkIUZ0CLg+O4WDigVxi5PYmPsluqk0e7MT5IC/Rb00lUdUc+?=
 =?us-ascii?Q?8fxeSp9T06aPceS037opRfCKV5FnpQ7zZ5iHC1q8O4yCKIaye0akLY5O/dsd?=
 =?us-ascii?Q?7W16z7AnoEau5/2F+6+/9RP2Ad/jNvychcMBckQ4NrbM9xvU3IPpCcWps8KT?=
 =?us-ascii?Q?gpZwjnOpxtzNgYo2iB8NRLTROWVVzK7GUiUhsJmMI/sduC2JgFqO9e8cwTul?=
 =?us-ascii?Q?BSjXTCHre+YwWnIMtVyLLwBgZbfyVqQsYdvRlD1dmQzjfBlL2+CJCxEOYzTe?=
 =?us-ascii?Q?QgELPjekf62NZDWw3i4+NYgGgD8wZWaayN82EGIgnvjyCFpvnBLxg0QyGb6J?=
 =?us-ascii?Q?mldhYKu8uZwM9JI4bOsADohuxBxL8qPmbZGPFSyy/RAiwWc5aXC/GUHrMX3W?=
 =?us-ascii?Q?vPIDaH+5cm85I2P802lGFUzGzMR+6iGa7ZPhz27s4/nrUNqfMS51lDKxEtrE?=
 =?us-ascii?Q?pbwS4IRodndwt3h7Ow9h7x5ehth/4bMdT7iojwABLxECiXKalm8Iyq/zgaMb?=
 =?us-ascii?Q?1Wj5LEa/YecaidMfghfQNJ2fqyMuSiiGbZ8UvuXmZES4Hfpb8piuHr4DecfH?=
 =?us-ascii?Q?YZe1a8BpuXn1M8OvS74XSAkGJPbCvDOCr618szvgG3658orxhPPNiXO0HYtl?=
 =?us-ascii?Q?XsTx7tp5SqLDzjeWtH0Sdy++S6QS3zFbbPitH1oYSF6kF7NxAui2yne17Hvc?=
 =?us-ascii?Q?A/nAu9sF+sqhHC7AiSIPJQde1IOAuQgNgY1NjVUOosURju2CnWlU0a/nFPsI?=
 =?us-ascii?Q?jNxv5EA4NG5WwEcZZ+kVW8Yx8SD4DZjMUf6Hm/kUfhd2PlNGIJO8At6beKTb?=
 =?us-ascii?Q?ghZNSrIAxi0fxqfvhzLV/39pEF4OmV9/ml3bRB7kax/NzzQsS5Vjzc/J/5+B?=
 =?us-ascii?Q?s/6M9gqz2l/iIlLh1h46IEsxJhOf9JR7egBoiqu+HF2pUdjUaGB+4xrLInso?=
 =?us-ascii?Q?EwtINgvfG3qPZHulNEztxApCwAswvPzTRRnTzxzgEOnkylvARn0D16Rc9DKt?=
 =?us-ascii?Q?X3Gkptwefs4L7ohxKEY+yOCJhOLPzZXi4gy6f6s+9ZHBpqq5gV9sdhDvlKJ0?=
 =?us-ascii?Q?L9pW+dzsS3/nrQOenCkyLS+ZlyMl+9zcGXROFRF3gm+LTjK6hGMDggEJ7Xc6?=
 =?us-ascii?Q?UtTfSwr8XW4nVWap1L3FT64IFyL9efPKKctFi+XAIVWVsYQaros4XErGyM6m?=
 =?us-ascii?Q?nIwa/EslGETHtWzTvaMbClIDGojKiSnnvqJKzT3lPgdJaS5vq5pHFDizYXwI?=
 =?us-ascii?Q?oOhzQ8L0fU2xWl7stVBhbHIHKAYmUi5IGuRLKwxhOslJh3QQojEf?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 186d116a-71b7-4623-4bf8-08df1d807ac9
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 16:49:36.5714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9xwY+xyetiJI0KlOsaynvaXmOl8C6MSfRanDISwgKcOx7kMM3do0GDUSrFvcyRbzckGusFRkJQwJ0Kx+UQNVUEnyrX82gWMU82X5gwzDf/Wh0SzAgAmWCn/MlLYNjcEV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8452

On Sun, Sep 27, 2026 at 11:03:22AM +0200, Linus Walleij wrote:
> d40_probe() enables the interrupt handler and registers DMAengine devices
> before calling d40_hw_init(). An interrupt pending from the bootloader can
> therefore reach the handler while the hardware interrupt state is not
> initialized and channel lookup entries are empty. The handler deliberately
> does not acknowledge an interrupt for an unknown channel, so a level IRQ
> can retrigger continuously.
>
> Initialize the hardware and set the DMA segment limit before requesting
> the IRQ or registering DMAengine devices. d40_hw_init() clears pending
> logical and physical interrupt status, so request_irq() can enable the
> line normally after the hardware state is initialized.
>
> This ensures that the handler and clients only observe initialized
> hardware.
>
> Fixes: 8d318a50b3d7 ("DMAENGINE: Support for ST-Ericssons DMA40 block v3")
> Reported-by: sashiko-bot@kernel.org
> Closes: https://lore.kernel.org/dmaengine/20260819225215.5EA2F1F000E9@smtp.kernel.org/
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/ste_dma40.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index 86efe2149be9..3bf89b057ccf 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
> @@ -3835,20 +3835,19 @@ static int __init d40_probe(struct platform_device *pdev)
>  	}
>  	pm_runtime_use_autosuspend(base->dev);
>
> +	dma_set_max_seg_size(base->dev, STEDMA40_MAX_SEG_SIZE);
> +
> +	d40_hw_init(base);
> +
>  	ret = request_irq(base->irq, d40_handle_interrupt, 0, D40_NAME, base);
>  	if (ret) {
>  		d40_err(dev, "No IRQ defined\n");
>  		goto destroy_cache;
>  	}
> -
>  	ret = d40_dmaengine_init(base, num_reserved_chans);
>  	if (ret)
>  		goto destroy_cache;
>
> -	dma_set_max_seg_size(base->dev, STEDMA40_MAX_SEG_SIZE);
> -
> -	d40_hw_init(base);
> -
>  	ret = of_dma_controller_register(np, d40_xlate, NULL);
>  	if (ret) {
>  		dev_err(dev,
>
> --
> 2.55.0
>
