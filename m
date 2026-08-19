Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011017.outbound.protection.outlook.com [52.101.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15AA43B9DA2;
	Wed, 19 Aug 2026 15:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787154144; cv=fail; b=aHzlYZboBsFsdyjqIML6SOlCUbR4mWKoDc58mFhVgfnbP64wgPyCnWlXwKPH5StDCUOhXS8BDV5TFk/MJxnQ9X3XfimbMLGYoAU+cCQRCWre8vOgRhCjG/FIck2jZ40jx94HCrn8hinlGHwy3GtcyKeOwDzPtR9OoqoboWPRsns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787154144; c=relaxed/simple;
	bh=X1jscWy6A9mixXm8p9wp7L9u3qZcQn/vFeALLeDlAmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Jxerjbw0oXH5Id27dteTHJDDhLuHXmfUOrj+w5Z7KcUxQAA3n/wQvvYMCUm18PMSPR6JUU6kz0/vdV8Yqn/jl109esXhv5MTgu83mufihoJum/dG3hSsQ6GSbPNVwsqZMuiIewz3SFGd6cPMZggvR6t+N/iJrzieYSGjcrO1pSM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=GAI93MXq; arc=fail smtp.client-ip=52.101.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="GAI93MXq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yKP4NpG0MMkThYfVXhoKyNABQOvhHC85DCyZSRcPmBpfWfi52yNZSLMQZ9whjm7+Hkrkr5b3MsMCqu/reVqvaiCk+JgY3LhwoKaxjsb503K3tzME/Dc9ZxFUuomYhUHXca3YpU16NILZiplI0NVJvuwdu44YmcQP8KoOvY+U4zK7waiGp1TXKmpHxreE4czDORwwsvXBWPe9gjZbmqg+EWiKubEGftL7PH1ZYeu8ADhKv0gg/XMDugmN+yn+rqNZsumSBqIyOQ1+nEHdbIdLSB/Z8dFnOwdVwq8wnzvQUfB32llpaIxBqbCoYDooPLh0vUSwJXNpk1H1HO8Qmb8teg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nh13htDeUfTbcEsskIK0dt/YKH8ARN1SgyVKdM9rlrw=;
 b=uOQTqDj1jgreljNCjC+PH8E9o6/2lLk6rMmUY4g7UDUHfQP9pURsfpnXvRzl8G7QTiOrXu7DBQ6D7kRPh26xQXeGwyhVrcFmeLSHED26Jn211a+n8czw5EyF0RFKEYe0FgUeS1ajZwliJSjOSX/aLtkA0wt+xyDShz8VXY0wFh5yUJHFSgUH78+C4bzxNE1mtQJll4hy4lW0IEmJDHexwTgymr74iwB+K8xtvH5j5CLr8CbvQEYKrGewVwtBmySNluV+8COt34HCF0DxTIKfdaPRJYPXI17/ERTPmYqXM6g+rLEgn6F7MZ5028rEQnExUGw0Vw5qZG/FosGyYc3xgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nh13htDeUfTbcEsskIK0dt/YKH8ARN1SgyVKdM9rlrw=;
 b=GAI93MXqaS92lDI4fuxAYoWgB+9no0TF4WiKFDkc9YJK9mLHCnGPPI9RdGeDRTTXqj/99yUsBXXrnenWKg+1/2VtmyTBpw8vWsqbMlau/rrfLzzPzYsfcF57ia4QZZ1vegMQttLQGitIaMarLgQTi5Vx8H58eJ7tPBdihTraW7yvtjBFMm4XGvHKnB+JtUW/EAIK13mlUqUZUkhDldaM9Pv8Np72nvbOjslx/hBm2htelz3xAJk3pLEt0wXpLkoAj8y0RL4HeotaWKcFHPjC7C6W5QmhsiorOCqUzZSmu/uK6vAC0KRqQO2TZs5Fm0teDDzWlYPCvvz7CmUXVbowbw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB7558.eurprd04.prod.outlook.com (2603:10a6:20b:23c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 15:42:16 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 15:42:16 +0000
Date: Wed, 19 Aug 2026 10:42:10 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
Cc: Frank.Li@kernel.org, vkoul@kernel.org, orsonzhai@gmail.com,
	baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] dmaengine: sprd: use clk_bulk API to fix clock
 imbalance
Message-ID: <aoXO0hELqqNjCd_o@SMW015318>
References: <aoMfW_TVbzkuGZeU@SMW015318>
 <20260819053518.2825514-1-nagachaithanya9911@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260819053518.2825514-1-nagachaithanya9911@gmail.com>
X-ClientProxiedBy: SA0PR11CA0095.namprd11.prod.outlook.com
 (2603:10b6:806:d1::10) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB7558:EE_
X-MS-Office365-Filtering-Correlation-Id: 10024895-9500-46c8-3805-08defe08726a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|1800799024|23010399003|366016|10067099003|56012099006|5023799004|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	rvTOwLVS7LsldLTeEd3zWfArqznSmTQoaC08kYf2/9Lhcu5u9x/yLX6/6lWOaQcx4GnakFf74NWlpi7a0bbGJ0J/TMYK4+702is7a8GvycHjzpb6cdGUIEEfRjh0wWiWxB75wYtJ41sYZ60GYw1TQM+t/Zn/NE08aPtpCEU4BMYsMqz6hCrhDdH+EXYodnUghf3UhA2cdFiJzYTSLi05L19McUKFmEG0gg4JNNcVyXT1mNoNmi0i2QrO0/PItoiCReTi8nXOots2lKjv6qWGiXjoY8pSH5nq0JJYP3SinH0dHqWMA1Q2Hf8hzg6I3GtwF0AgxKSqzPWtXG1xS/tKpt7I72/8Oo3V2eL838oSKPAh3KjqkRi0RMKlLFIAkicaUlmveamfJ6ZWNAuYymEbJlMT/WjgMLSFGQgXVjhTLn2qQWAw2j84uU3JajJvGSyXzxWOXKwPkuVBrfi4vO7nbgSLK0CbekbdczfweC/NxxedVDangkDhMiGhBtLfb8lHyT+daj2twM+4TUPr+WuVcj6Q4vGo9vuMZNKHUUjwFaT6qg74PtNkArHy71dYRV6ylJUqaMtuZVDRanY4mNUt3l7isDJS1rEe14vk4v7RkXHBP7oxLaCeqMufLenakxM2DyJOY5GC/Ekc+GMpkYeLNk3qlzUdLwndqkUO9kTeV2E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(1800799024)(23010399003)(366016)(10067099003)(56012099006)(5023799004)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4FdZQTpN9onnIo1kFIZwoBd+s0pOVlL2ZBSh1LoVpNsP5Ec2qP+2Tpe2r1ZM?=
 =?us-ascii?Q?F+gebwLWITCswJpCUeJk/wWVCWYwfFL8h1WKD4rRM/fcwZ6BVqD6Y2Lz22cT?=
 =?us-ascii?Q?QI2IKjN/j7S/76c/3G1o8h/XXutw7302KOGjKrFc2HEO9e4CrdoW0wfye/L5?=
 =?us-ascii?Q?1bZE3V9cUPFuESY0aI+399G4OWJiidBjd+VpanHernCgPS+36l018phvVRBI?=
 =?us-ascii?Q?tQYqHJg/nVoKp+XnLyncHEyITMEBijxwW7h/iGJJYiOeFhM4/DIPYMARnHqv?=
 =?us-ascii?Q?udqPMp0FXk9t19Rfn5TZY4klOT60KG6yX08aCJJHfWsH9kc/PI2xk9gNRD4D?=
 =?us-ascii?Q?9sC7+jHRDpYPu6VZmFLEBV9OjE8dM8Bes3e7cYptyf0KCovLcLB1B+fG0ruX?=
 =?us-ascii?Q?sMAalvl5Pi1UmOnZ/ofsnSm5TGpBqJjP6pb+1HSf3Uz8/4ilahoBtDaHL28+?=
 =?us-ascii?Q?AEYt364TVYvMXUVkGYL+ujhLdF1AvQn3enDEdPOLyhifkIxhSEvqNjeakkOD?=
 =?us-ascii?Q?jvlj7O6K2pigQE0h8pGaxjnCOgRPRFXQhYy4mBXAcD85V0+5uPHoRhufWcNW?=
 =?us-ascii?Q?G7pvuoBr4m5TGCCshoVL5F67ldRptx8RdaT82CW7t5IDmD+lQw+kGwN3d0vC?=
 =?us-ascii?Q?niTtsv8fKJcNZbpwYq+7ZCVQMtRh7v/g9rMDOMsKGfYc5tZV26vbeTOu8Ue6?=
 =?us-ascii?Q?HXyap/h6Z10l8sb7OB7BuJs61HORdd8WxGCRwEMXi5fB+5qh+HdVzieW/zoz?=
 =?us-ascii?Q?mwz9B4LIdn2lBLXfzTeHJECT2Wy/RmtbwDFRpVKlOYo0hmCCLQ2suomDrFuJ?=
 =?us-ascii?Q?XAuuRvXaEl7H191eoc6unkeOA8xb2Bq9dov4WHfuK5JOzybjY0PHvIMU+AA5?=
 =?us-ascii?Q?BpnA2MYQORU64g4eM3YyQ9+5l9KWv8ELZrT8xjvqb4c0Gd3MLRBr1l8ew+lr?=
 =?us-ascii?Q?vs9EezUdpBfp56ALFurrACePZz9ot5cvqf7V/W2AQk5p4eCIVoMk9qp0G37y?=
 =?us-ascii?Q?Jxa/FdE6FUxmhybii5julqk2Z7Z3ZhmfwvSp5tmSjvQMEBcZcFuFIOzNNKVb?=
 =?us-ascii?Q?yiIqAGrgoGwAs4Zdj3nCOmJd+6nuRI5TdGyyOQiMUw0I5ISGMaENXR7vWm/s?=
 =?us-ascii?Q?jn2dYcExqN+ou4wRov4MiztcUvPG4OrGDM7vbB/xmCDwfXKHPQI9qiEYVyh7?=
 =?us-ascii?Q?8qrO5BIZY9q6pMm76R8uPy3ZoQivqOLJW2/zaAEI65NNOiadhOxZJK3RfflC?=
 =?us-ascii?Q?+i+q3KF438OoI0+h7eZHCWRT4Y6Fl9DxmcslfMF51xq+GFL+dmg32ANsBWC6?=
 =?us-ascii?Q?Z0L75dA9y0ZOQEsEAaWBddoXwGRSCznPijxTCWkKTVL2x0hDGb78s8SGfVpN?=
 =?us-ascii?Q?v1/gfTc8/cTcQDVin5TNHXOf43fVfO32P6raJsbawuyR4w081nv2rLFRaZE1?=
 =?us-ascii?Q?JL+5m1BLdEAusVFgRbEsolHxu5k7Vkda8kam22t2UeSjNCLf8gLUVI4xjYmc?=
 =?us-ascii?Q?pNE9rliuFKkOL88oQeDNR+9p2w5KF6B0Aov8gw9a83JbT7Tmz7YkzThYerL8?=
 =?us-ascii?Q?V6dKZ+tyzWxxPjVb5A8SPJ3HdaNXbALpXqtEV4h2NsauzTxcHJSvKPlDuR6c?=
 =?us-ascii?Q?ohUX9BZbDbRt3j9YDPOPKzp+6tM5y8u7BUdrptVD46mnFGAC2pMb7clgaqA0?=
 =?us-ascii?Q?qH+qg2KTQoQdEywL92hdbh9KPzB+xFq/bRg92jHuxLide9ZDmU5+ny1d8+Wv?=
 =?us-ascii?Q?UcXT+eo6LrcX4g3i1D6aVOT4tNbG+auApjbsfsdTuI8QpcHkCzbp?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10024895-9500-46c8-3805-08defe08726a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 15:42:16.8478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +4ImU6jUl9g/REV2p1agpingB/Fg68IIh4lMdeL2Em6i3u3AZRzd1DyMWg6NeIv6QhGIo260Kx32vCdfV9EsH13/echpG0NryY3WfQbVVOEKjvL5GHbqCpM1c4RdR1jo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7558

On Wed, Aug 19, 2026 at 05:35:18AM +0000, Chaithanya Lagisetty wrote:
> sprd_dma_enable() enabled sdev->clk and then the optional ashb_clk. If
> enabling ashb_clk failed, sdev->clk was left enabled: both callers
> (probe and resume) treat a non-zero return as "nothing was enabled" and
> bail out, leaking sdev->clk.
>
> Convert the driver to the clk_bulk API. clk_bulk_prepare_enable()
> enables all clocks and unwinds them on failure, and
> clk_bulk_disable_unprepare() disables them, which fixes the imbalance
> and simplifies the enable/disable paths. Both clocks are fetched with
> devm_clk_bulk_get_optional(); the optional ashb_eb clock simply becomes
> a NULL entry that the bulk helpers treat as a no-op, while the mandatory
> enable clock is still checked explicitly.
>
> Fixes: 9b3b8171f7f4 ("dmaengine: sprd: Add Spreadtrum DMA driver")
> Signed-off-by: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes since v2:
> - Fetch both clocks with a single devm_clk_bulk_get_optional() call
>   instead of separate devm_clk_get()/devm_clk_get_optional() calls, and
>   keep an explicit check for the mandatory "enable" clock (Frank Li).
>
> Changes since v1:
> - Convert the enable/disable paths to the clk_bulk API instead of
>   manually disabling sdev->clk on the ashb_clk failure path (Frank Li).
>
> v2: https://lore.kernel.org/dmaengine/20260816055005.2667930-1-nagachaithanya9911@gmail.com/
> v1: https://lore.kernel.org/dmaengine/20260813105354.2577040-1-nagachaithanya9911@gmail.com/
>
>  drivers/dma/sprd-dma.c | 45 ++++++++++++------------------------------
>  1 file changed, 13 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/dma/sprd-dma.c b/drivers/dma/sprd-dma.c
> index 087fea3af2e4..749cabd984eb 100644
> --- a/drivers/dma/sprd-dma.c
> +++ b/drivers/dma/sprd-dma.c
> @@ -208,8 +208,7 @@ struct sprd_dma_chn {
>  struct sprd_dma_dev {
>  	struct dma_device	dma_dev;
>  	void __iomem		*glb_base;
> -	struct clk		*clk;
> -	struct clk		*ashb_clk;
> +	struct clk_bulk_data	clks[2];
>  	int			irq;
>  	u32			total_chns;
>  	struct sprd_dma_chn	channels[] __counted_by(total_chns);
> @@ -260,31 +259,12 @@ static void sprd_dma_chn_update(struct sprd_dma_chn *schan, u32 reg,
>
>  static int sprd_dma_enable(struct sprd_dma_dev *sdev)
>  {
> -	int ret;
> -
> -	ret = clk_prepare_enable(sdev->clk);
> -	if (ret)
> -		return ret;
> -
> -	/*
> -	 * The ashb_clk is optional and only for AGCP DMA controller, so we
> -	 * need add one condition to check if the ashb_clk need enable.
> -	 */
> -	if (!IS_ERR(sdev->ashb_clk))
> -		ret = clk_prepare_enable(sdev->ashb_clk);
> -
> -	return ret;
> +	return clk_bulk_prepare_enable(ARRAY_SIZE(sdev->clks), sdev->clks);
>  }
>
>  static void sprd_dma_disable(struct sprd_dma_dev *sdev)
>  {
> -	clk_disable_unprepare(sdev->clk);
> -
> -	/*
> -	 * Need to check if we need disable the optional ashb_clk for AGCP DMA.
> -	 */
> -	if (!IS_ERR(sdev->ashb_clk))
> -		clk_disable_unprepare(sdev->ashb_clk);
> +	clk_bulk_disable_unprepare(ARRAY_SIZE(sdev->clks), sdev->clks);
>  }
>
>  static void sprd_dma_set_uid(struct sprd_dma_chn *schan)
> @@ -1140,16 +1120,17 @@ static int sprd_dma_probe(struct platform_device *pdev)
>  	if (!sdev)
>  		return -ENOMEM;
>
> -	sdev->clk = devm_clk_get(&pdev->dev, "enable");
> -	if (IS_ERR(sdev->clk)) {
> -		dev_err(&pdev->dev, "get enable clock failed\n");
> -		return PTR_ERR(sdev->clk);
> -	}
> +	/* The ashb_eb clock is optional and only present for AGCP DMA */
> +	sdev->clks[0].id = "enable";
> +	sdev->clks[1].id = "ashb_eb";
> +	ret = devm_clk_bulk_get_optional(&pdev->dev, ARRAY_SIZE(sdev->clks),
> +					 sdev->clks);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "get clocks failed\n");
>
> -	/* ashb clock is optional for AGCP DMA */
> -	sdev->ashb_clk = devm_clk_get(&pdev->dev, "ashb_eb");
> -	if (IS_ERR(sdev->ashb_clk))
> -		dev_warn(&pdev->dev, "no optional ashb eb clock\n");
> +	if (!sdev->clks[0].clk)
> +		return dev_err_probe(&pdev->dev, -ENOENT,
> +				     "get enable clock failed\n");
>
>  	/*
>  	 * We have three DMA controllers: AP DMA, AON DMA and AGCP DMA. For AGCP
> --
> 2.43.0
>
