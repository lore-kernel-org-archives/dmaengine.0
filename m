Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013059.outbound.protection.outlook.com [52.101.72.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE944A2050
	for <dmaengine@vger.kernel.org>; Tue,  1 Sep 2026 19:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788290211; cv=fail; b=HSQP9ws5mB90WM4o3tEgxWnsjLSyJ7XgyZbkeWQA5DD9E1gnFAlW6PbnXZh9SHpWI9PqqekS1a3xE57gtJriCdeYtBp+nFRbJSsKdJM1BOhmPdKtRALSQx8kwmFcpXdytA5y7nrjMw73/7GMePyxSCgmOVpRJsuDN6BIZDat9LE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788290211; c=relaxed/simple;
	bh=L+P/tWZehxTw+2rGk1bi/uzgbJmX8GAwjEamjITgsPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GjRtsuhm1Lpv/QGmlSerq+KuRydoregNj+yqZhtu3ZvDtSfEGH6bvmsC9dCvhPTcP9RUTEgmk+6jQVakVKlvQ4zcoytLBBat2y0B3wv1SjajljhsYRsHTGdBOexdMPgErT7N1XJlXlXwgBJh8bNZz0uRn+hLSR/1m9yeKyf7IBM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=PDq2JfHD; arc=fail smtp.client-ip=52.101.72.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="PDq2JfHD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wm2LZbmFwiMyBeB0V5l76ojYAX3W1XORMEEiWBjllVS4MfBOxvNFPJyImx91wu3eAXLEbzdQ2JGeZlHahILr5lwjYl/QeAI0P4gEPWxCn9q9PlXBS1jvfFzIwSY5yoVpVqwA9zvhM4o5e+5tXRqwF8uG9DQ1daDfkkEBP0iF5lBtHJQodC6f+uIhQgVKNP/asvXSAYZlEvyy1sMe88hEFABcywR5rwOP2RVajIvV19cEM6ZifeilgxZuPOJmVaU1kRiKVbA6nFtoWoE1nFUK5etyN6Xk3L9k/2O9XrEvbbHbAB8WUa3SkFFVZwuI+79+VNrpYGZXXgHqQZ5Zynqlcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QK5gSfdIvLXtD2FXE3TXPbaRggxlOCau93cleQmgCFk=;
 b=GslFm2aSvksb5LFkTKal7/8pyf3SaW3/fGLYir9QntE/ukPGMv7A7bv/FDfkTDKLnDs8MdqCK7oyto1kzLMcRmSyDY3ovnDRDzQTwwIhXUp0VTkyDtw1ocikYPrcVG9wxftcQ74bDZpj/Ed1B2DStJhqB5Yn9JoUh1iajvG/y/dft26G5WDLBvdIcBR878x2UIhDgwywQR++2sIgYy/axsQaoFhvli0yHApdvdWcLEO77gttzbEqJH4tnnN6dGeSzLnsVmO7cRC7qomJxMUSKN2+8X7DrElLKRraXOwZVfFViZYb2yKdkt/9zyGAw5d/yraf7W0AQFT/3tcBqhJzIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QK5gSfdIvLXtD2FXE3TXPbaRggxlOCau93cleQmgCFk=;
 b=PDq2JfHDtYKwkQOLtrhLw65V3aqGnCc9/yYan4UmJooYgo5CyptWIOBW9acBQodaoXYo0kVM3vo588uRYjZdc618clbVbX/rpw0dOQI+PFLHkn4a4oc/fvLBLB1Ml1Pm1ERTLyfKn7trlskKer1giYCShh86kThCzRSILT3/JHoOX/oAreEvS7YziEofhmNXyJwQ4zPUiwiTiuAQu3Wd9f/AIkA1iXoGDYervf9z/wpxi9gZujGRYOkQDisaJaFwbNYyEoLD0R8nljKM5I229wsZY3am4wPIC4kWYBCTmEYlyLfvXupFqCMBzZW2JLZegh9R66g19gUQ34ZFd/avXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI2PR04MB10884.eurprd04.prod.outlook.com (2603:10a6:800:270::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 19:16:44 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 19:16:44 +0000
Date: Tue, 1 Sep 2026 14:16:36 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Li Youhong <dayou5941@163.com>
Cc: Eugeniy.Paltsev@synopsys.com, vkoul@kernel.org, Frank.Li@kernel.org,
	dmaengine@vger.kernel.org, Li Youhong <liyouhong@kylinos.cn>,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v2] dmaengine: dw-axi-dmac: convert to clk bulk APIs
Message-ID: <apcklCjTPr0sUWbm@SMW015318>
References: <20260901013916.194253-1-dayou5941@163.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901013916.194253-1-dayou5941@163.com>
X-ClientProxiedBy: PH8PR07CA0015.namprd07.prod.outlook.com
 (2603:10b6:510:2cd::20) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI2PR04MB10884:EE_
X-MS-Office365-Filtering-Correlation-Id: 73827481-b034-4045-31b6-08df085d8f8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|19092799006|376014|6133799003|18002099003|22082099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	IGF2hu5EspE/E+1qGveYMpHUP/STjPuMKE6zLFDk19x1WhFEblCxZ8Dc2i9EE4NTSd1qvkng7jfQsDpPjgkJ1YW8119thCzGFBdNdcbDCHYaWp/gDuB+FfiYKD04yxrGLSXvlQ8R6A6+oZ8Syw7LudH8eTZLz8jt9Z5MPEWhQFwJe9oKhhhTIsciWXI1MOFymqWcInGKlvaycRV/p4MPCqxX6LA1P9V7xXsHJNd04XAs+lHdVQbH83eRjaPbrgYYFxd23sScZ5jfUIFL8abZzjWq/ac0D6/UG0Er8UIyZJ81PiCrBweCeCEbSpPBmMqIyh4rwHIaxCWD4S2Tz4eqTBbYh/VYyIk+K3BVYJdj2LvGzL3YBrRN3X4UqcVv4Fv/OKXDzcbIVdr2l1GGQmzF6n4qoS9sjvPiqlkPJ1J5Om/7Yi5DVp+zdqq6s7EO8ukXlEjRclE/GDsh55zQx7aTR7NE/RGZ7pJP0gQweg1qIq1XH4PVmAiQvNbKNw55nJa+XcsnJweyLJE3V5DpZg1nTqaTrvlQHfyBE46zv0cS4B3H3qUyBH6k15Btc71tRgvcn0YXp5jxG6dEiIegNMCFp+LOyVSGEbPKyM+aKFApuC7xWLbD05wuE5QD6ILq6Q/MY9KbXmyABTUJbJPD5rFrNASa2qLiyZPp7u9Etwku1s4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(19092799006)(376014)(6133799003)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NxLsjb4xifaZWWDOnTO4tQdQkYeBHv4ozUBeHkp6YLFwRAFj8kZZo3cF0wHn?=
 =?us-ascii?Q?zzJlvl1+6CfCmkQjuUni8vIn36xyULzvTUGdiQLa8gtILVRWCw9PxgC/sJfC?=
 =?us-ascii?Q?jApzY4N3ULy5zmKn2ygDvvMUy7mBcNp5zWhabpLkoRdIHH+/0WPDfcVpqOrr?=
 =?us-ascii?Q?zXZ16v55flA8cUmjUfX8Tk/ZLG/ruP9LweNDpqMSecEhMhig2AzVbIsf4xa7?=
 =?us-ascii?Q?xaf6IAlLfxf+qb4d6vdPFIEsYRJuVF9Zk6Gwpx6rhXuIdaUJiF0Bezy8GD2B?=
 =?us-ascii?Q?RP233+Dbo4DYwOAvl36tkbEEkGaOirgzK+B5rHgblXtZTjs2H5FyMo4yhji/?=
 =?us-ascii?Q?+zPIGAWGdpndA01nkpmip5LVWUY6GZLoJwLi3kss83lvGuxU2LSoNi/EEQGy?=
 =?us-ascii?Q?noVJX/gKbE28L4Atqnv6PnKZIDk4u80FmwcOWaBxKIZRdSlQp8LaboiweDaR?=
 =?us-ascii?Q?+Po01DytskggKL05SDIF9OCaITmHBPkbrjiGRvc+kwExiXJmgiVmUAfK8NI+?=
 =?us-ascii?Q?6uqUWJ8rbdAm5gFKWH60OKn7eq2L1HHBOhEby49UyhEo3Pum6OR1sCtNWB3F?=
 =?us-ascii?Q?O5wvuho3FfUZYD+gV7CRmOVsm/XiSqb+ieuIoN5kYSt96nKmeXufgwpRa3u7?=
 =?us-ascii?Q?oEcPX1ECXHLyyIJbPLsjSr13lomAGHt3K5ZrVuM/943ZJyjAe6DOTHjkI8Qm?=
 =?us-ascii?Q?rGzsT0RpEpepKeYuqvfie2LfeOdZI+H9JTRBX8c663lgqMLX62YBOYVGPEzQ?=
 =?us-ascii?Q?6Q40mfBPs3Ohx3Qv0efiIJrVJSaHJC5Ah5BNvGzbXMgimNVpqcL+vu0VT9lm?=
 =?us-ascii?Q?0cq+QfWRbRXHrGJyepMz70Uz1/mNkcLYO7XoBwtMXpomOWtBrt/czrWzXOgu?=
 =?us-ascii?Q?0MaP8LLr0FnRAyqY1lAWFQnEVwkfcHZy5InR1hTm8Q1BZhtP2AnrhW/SesDp?=
 =?us-ascii?Q?0avtS4HPd+8hNmWQbTzFQ/veE+NburcMCJE7HZz9QU7MNbltGpxyU8eit23+?=
 =?us-ascii?Q?yOIi0pxV/eaLAsO3z20L+Y5DCVUrfJd761knPut8lJaql6O1uisWX5SiupsY?=
 =?us-ascii?Q?5Bsh8D021WaDpr/FXt89EtnLRyaMEyE10WVD1LCPj1kW15xJxWaKav2O1TYZ?=
 =?us-ascii?Q?Qlsw7zTLMI7DoJz4bxmA7ZNat46QiCcyrAjj3dxZeOVHwPZOznW8nF+HPnQm?=
 =?us-ascii?Q?BNvZep4pwfLWjvFuuuxNIukswhfONJnnnJDIGZHn8va3rLrkN7x/6B6EKOl5?=
 =?us-ascii?Q?hwCjbrHSC85g29/2A73fjZOT0Gpd2Eax73YvUF6N+fZ016eT9k0ZeYW1HDSC?=
 =?us-ascii?Q?mxVs5sWn/2lyCtgVtwVF/JqEgKRcu6YYZU6hpZwo155HjH6BWssg2iPz4nzS?=
 =?us-ascii?Q?A70Y9oK6LBAtqVhvgRzFUjDO5rcUy4RM2Sp4JicC71RpMrn/b5MbK1jWLqWC?=
 =?us-ascii?Q?O/ymq+e9d3CH6PR8JC7lKZZaXo0qMl62tyxMtK9NQLyQwVfRzqKa6PiLEENT?=
 =?us-ascii?Q?0nxEPQ5zIjmI+4qwNDBX3MIk2T2JQIxsYl2v/4xw5181qjUWJKDyH78rGv8X?=
 =?us-ascii?Q?7jGtCm4H2HtCUEoYSHquvhGRF8y3QU8jyfa1SvdxDglP1Q3y5SE3cq8DOgAf?=
 =?us-ascii?Q?6nBP1MdIkEHN17ZEUbasGUNMHrJ7O0iU7wCAKduKg+oKD9xy7scAC1VgbAHc?=
 =?us-ascii?Q?4y5Cv6IWa2nS10MIKhZEqPoEm9MOZt7LFXzvbNSFKuobUYopn/g+6DKQflTG?=
 =?us-ascii?Q?kepLDopDNJ1tGUw/T9r05YQ3+qduIvfnGZT4CFShVUdTxvmNMJds?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73827481-b034-4045-31b6-08df085d8f8f
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 19:16:44.6429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ivprJ1RfKWBlSybQIm+K742vUgMcACx32iWBlOApAotaUL+/6apOUEiR9Hen0M2YrUQr9AlE+tuQLWjPoff71blbNrcPBPBiiZ5fU51bRmFlDleR4zoQ+b8FH8rDLLx5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10884

On Tue, Sep 01, 2026 at 09:39:16AM +0800, Li Youhong wrote:
> From: Li Youhong <liyouhong@kylinos.cn>
>
> axi_dma_resume() enables cfgr_clk then core_clk. If enabling
> core_clk fails, return without disabling cfgr_clk, leaking the
> already-enabled clock.
>
> Switch both clocks to the clk bulk helpers so prepare/enable
> failures roll back automatically, and update probe/remove/
> suspend/resume accordingly.
>
> Fixes: 1fe20f1b8454 ("dmaengine: Introduce DW AXI DMAC driver")
> Suggested-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Li Youhong <liyouhong@kylinos.cn>
> ---
> v2:
> - Convert to clk bulk APIs
> - Use a static const clk table with ARRAY_SIZE/memcpy
>   v1: link: https://lore.kernel.org/all/20260831094438.2244538-1-dayou5941@163.com/
>
> ---
>  .../dma/dw-axi-dmac/dw-axi-dmac-platform.c    | 23 ++++++-------------
>  drivers/dma/dw-axi-dmac/dw-axi-dmac.h         |  8 +++++--
>  2 files changed, 13 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> index eebed2474210..3a957af0e089 100644
> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> @@ -1320,8 +1320,7 @@ static int axi_dma_suspend(struct axi_dma_chip *chip)
>  	axi_dma_irq_disable(chip);
>  	axi_dma_disable(chip);
>
> -	clk_disable_unprepare(chip->core_clk);
> -	clk_disable_unprepare(chip->cfgr_clk);
> +	clk_bulk_disable_unprepare(ARRAY_SIZE(chip->clks), chip->clks);
>
>  	return 0;
>  }
> @@ -1330,11 +1329,7 @@ static int axi_dma_resume(struct axi_dma_chip *chip)
>  {
>  	int ret;
>
> -	ret = clk_prepare_enable(chip->cfgr_clk);
> -	if (ret < 0)
> -		return ret;
> -
> -	ret = clk_prepare_enable(chip->core_clk);
> +	ret = clk_bulk_prepare_enable(ARRAY_SIZE(chip->clks), chip->clks);
>  	if (ret < 0)
>  		return ret;
>
> @@ -1524,13 +1519,10 @@ static int dw_probe(struct platform_device *pdev)
>
>  	chip->dw->hdata->use_cfg2 = !!(flags & AXI_DMA_FLAG_USE_CFG2);
>
> -	chip->core_clk = devm_clk_get(chip->dev, "core-clk");
> -	if (IS_ERR(chip->core_clk))
> -		return PTR_ERR(chip->core_clk);
> -
> -	chip->cfgr_clk = devm_clk_get(chip->dev, "cfgr-clk");
> -	if (IS_ERR(chip->cfgr_clk))
> -		return PTR_ERR(chip->cfgr_clk);
> +	memcpy(chip->clks, dw_axi_dmac_clks, sizeof(chip->clks));
> +	ret = devm_clk_bulk_get(chip->dev, ARRAY_SIZE(chip->clks), chip->clks);
> +	if (ret)
> +		return ret;
>
>  	ret = parse_device_properties(chip);
>  	if (ret)
> @@ -1642,8 +1634,7 @@ static void dw_remove(struct platform_device *pdev)
>  	u32 i;
>
>  	/* Enable clk before accessing to registers */
> -	clk_prepare_enable(chip->cfgr_clk);
> -	clk_prepare_enable(chip->core_clk);
> +	clk_bulk_prepare_enable(ARRAY_SIZE(chip->clks), chip->clks);
>  	axi_dma_irq_disable(chip);
>  	for (i = 0; i < dw->hdata->nr_channels; i++) {
>  		axi_chan_disable(&chip->dw->chan[i]);
> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
> index 67cc199e24d1..fb11b525727e 100644
> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
> @@ -22,6 +22,11 @@
>  #define DMAC_MAX_MASTERS	2
>  #define DMAC_MAX_BLK_SIZE	0x200000
>
> +static const struct clk_bulk_data dw_axi_dmac_clks[] = {
> +	{ .id = "cfgr-clk", },
> +	{ .id = "core-clk", },
> +};
> +

Avoid define varible in header file, in case header file included more
than once. I know you want to use marco ARRAY_SIZE().

#define DW_AXI_DMA_MAX_CLKS 2

chip->clks[0].id = "cfgr-clk";
chip->clks[1].id = "core-clk";

>  struct dw_axi_dma_hcfg {
>  	u32	nr_channels;
>  	u32	nr_masters;
> @@ -69,8 +74,7 @@ struct axi_dma_chip {
>  	int			irq[DMAC_MAX_CHANNELS];
>  	void __iomem		*regs;
>  	void __iomem		*apb_regs;
> -	struct clk		*core_clk;
> -	struct clk		*cfgr_clk;
> +	struct clk_bulk_data	clks[ARRAY_SIZE(dw_axi_dmac_clks)];
>  	struct dw_axi_dma	*dw;
>  };
>
> --
> 2.25.1
>
