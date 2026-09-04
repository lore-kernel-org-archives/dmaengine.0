Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012038.outbound.protection.outlook.com [52.101.66.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2F33B19CF
	for <dmaengine@vger.kernel.org>; Fri,  4 Sep 2026 15:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788536755; cv=fail; b=CMPjIPTL+3NZXhXr2Ye92JQQQsR9OEy3IyMANxBX9F2YFfPHUlPvOf95sUYd7scYdJ7O+TPbHd42J/xFOnyfF2nNzLUkPmz3PdE6iD+J/L8SiQEEcWmfZug4AeCEWzwmyG1DURW2JGbvC+jWxKS3Vx9CHIcLRaolGhiwNAC+AGQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788536755; c=relaxed/simple;
	bh=ySX3Yj6D69K7tTQ4AwGa6tf4XqKphVzVbmHpBxRa13k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EhfCK1r9L3Er3Ay6NKv5wAuaA+55Vxt8Q+2zo37au15EZGN+USH+7T3D3bG1H57NqKPHHXOec6eq6UizbcG29fzKkvcV/nrwjoFkGD9wLLgauhxeNRgVKI9SsjvKsHT0WxNoyBvGRBav6j08yWAsadVnKd3p2E8ntRFwmv5vZL8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=t/ryZ/Yy; arc=fail smtp.client-ip=52.101.66.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="t/ryZ/Yy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q0G80p8PSQl6wNOVL2C3hNOffBlIy6KjktVThmWNKSQBzoRuml8Aosj7f+4q4jLJZ4cAwysSwjMuYkRNKKfae//vUX25NO3dr5VLsa+KviyTIa9spZLql+2MIiv96inIHgSTGicNh9A4Hp8tim17NdbJg8hSzRR5Df6KTUu3YZxWTL7pp/DySAfmwOlk53p4A33geU+7nyqlDLS87HpHt8hJSMb7bqBuMp5+6dSHyT/+ZwwqIMEtkuUmTHopqwnGLTp01XM42mlRiv1cICB7N+MVQJXEwmsc+Kxw3CiltZbzTHdeRYtQ+Yd/gkm3QTq9T83yVilTEKFcuFewyXxp8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v150Wx3dFe9NZjXrPvS1AG6THJ4YRLn+iY61g6GD6ws=;
 b=m5yzx701EPU7MxpEu3Q5zUgTF94CjXssCnXyoqo0PTipiC6QlJF6QROEYIL3z0db0FXJjF9rRd5nO7sXFj7ksm5LGTJCCr3aSMHYgW0ot18y2ON3wjXCxU5s4kBI4Zy2dN/YBIp3vP4uU+As0RbjsFKbQ6KXAcvLAIp+VFUzv2B/5x10r0c4xk4DiY3HC7smuugFHni4lJfg7rdo19n3bI3BfyvvpQyMdD5jrsdAAkfAyW8M6zme2H+sP+TexlssqEalevOYISjy1Cpy959NzfOz+1Y5reKxCtxIslCqL4KcbxE5lCvvrH/CWFczcXJUaARHGuI002G/T7i8hoO3Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v150Wx3dFe9NZjXrPvS1AG6THJ4YRLn+iY61g6GD6ws=;
 b=t/ryZ/Yy8AGfs8sqbs4IVwNQ2MHPKMZfQdxW6pXt0Wa5DJaN5etspYWB+w3LzqBUpCSikurdChpP9npzwIrhY3m+mnn38oJePn/V1cF4zb41B2/niOK3itxIOoQnTdULqBttdx7kujY9m8v3Bjm1syCwo/sg/sHtbPwuZiJPmd5aZztELMmbfzmlAbcSc91P2lx+DekQQWQdP/+LfPw0sYH2hZVyTxcMJv5IomQE2g2Y3iWJVXhR4JdYMGDX3UQM8tk7CkZiRn8p4Wz/ax5vcptA4gIZvA2tI9HsE8KweJZ854IfU7aFfrbpYYLJHajYkqXV6UURsksnBLgNhfgm4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by MI9PR04MB574041.eurprd04.prod.outlook.com (2603:10a6:290:c1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 15:45:50 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 15:45:50 +0000
Date: Fri, 4 Sep 2026 10:45:41 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Li Youhong <dayou5941@163.com>
Cc: Eugeniy.Paltsev@synopsys.com, vkoul@kernel.org, Frank.Li@kernel.org,
	dmaengine@vger.kernel.org, Li Youhong <liyouhong@kylinos.cn>,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v4] dmaengine: dw-axi-dmac: convert to clk bulk APIs
Message-ID: <aprnpU4sR9nLNBDb@SMW015318>
References: <20260903015438.2514100-1-dayou5941@163.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903015438.2514100-1-dayou5941@163.com>
X-ClientProxiedBy: PH3PEPF000040A3.namprd05.prod.outlook.com
 (2603:10b6:518:1::57) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|MI9PR04MB574041:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d6b628c-3174-4d9c-c288-08df0a9b982c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|19092799006|1800799024|366016|10067099003|11063799006|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	tP9T3zK9p2J9apW7NKYZlUIVW5kZsJQQJDxEh2OjyksUUFgc1b7OG1rhwslyoT9BqII7B5AlIqQNxotfvPd+B3PJEQox1ozs0D+t5c4RVFhUVyLKyuW9Zh5KrZQjES7yGtRqkLuEO28nTWPUu/03mKiLb9rG5uNzZqLShLKumMS1SlF4MZZXARAP3Ttpi3aorMi2El3g0fH9rthW3Dl5iZkoWKXaLxSJS3o00wpV6L0cw5RXtEG1LN8yeV+qd48j2VB85641Vfxj3o9S1IaSYNMtHgk2nmmZA1LVk8IxkIByng/IeE8uLkrbi46HDYIxLROzxoFDEKiucR0yYOrItVz4KmybIFo6Q3V3IYUEfUoVo+CeHD5op6nmPYR27mRr80/UqGtzmfaSU6wGEe381WHj+B8GuZCpItL076ZmGOT92dM3HZk2NnpsOkCGIFSDb9tzghDbUSdVsll6y64WbtXFXSRsQOodMqYl5xdN8aazCCJHCFuz+Gi/f7+0/ib22MqUdDPZfkNfzTwZER/svCe9Hy5lxMNB9P0ETQ4FLkekw3GXzoA3Chn5/E2WCueBwgI3RhU/gXp/PZDGdLKkHGBSubsUk1zyHXcJgLYxxOMio8O0zQ17NJughKXnUMAQTAbLPjj4PraSEUm64XeNxE7ahjfOMC6H2oCQnScDW5E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(19092799006)(1800799024)(366016)(10067099003)(11063799006)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sIvaNmlwODuweulwrxwEl3xGXmC9PCEeBseO8rzxSsoaLBjZlWLTO2WDTyza?=
 =?us-ascii?Q?DBcgoow9JYKFKhUONLM37sxP0q1Pgo6PsVAcz88Ti7P8Ub9zr+kpEoUwi4zF?=
 =?us-ascii?Q?A8QT42mQRMaPFfyLmETWShOp0PrBCCEatA2/B3/2+CicSsruVd5+l6JZkOlr?=
 =?us-ascii?Q?LMpCjfFw4xDdRYJzMvJQXkIOWi8L3x8xNufPzHumvXvXZpgvroWlesHDZpSs?=
 =?us-ascii?Q?6SLYKILVNZ1waq4oGs+HB6OpBmgQKYcbYF8bNL8QwU8yjgoB0bns8oxNJS3n?=
 =?us-ascii?Q?IYI/9dUEsGkzpBajHZB1Es5Af8mWWs6dMTSy5Nc4lAR71miFc0h0D6wJCTUP?=
 =?us-ascii?Q?IJV1u+1sX9pr5BsAJ33UJQKcYK2fyiBPu8+GMXaGEbE/WZzm9hkOrmOM9jvK?=
 =?us-ascii?Q?+nDO4XGBCi7+njm/xRnBVQjPPByruA0T8yArTAolHFfgj0b5YtMFYbZenf4A?=
 =?us-ascii?Q?lSPhp5XQ+eNmJKHrmzpdr2rZnKiaERG18hlyWrHR+id0Hw99qisj+Tk03uti?=
 =?us-ascii?Q?Wp3WgWPVeIh383NqUg90Vfah26O2pUdoO3lyCO35a+GSQ3QkH5QqL4LVGbal?=
 =?us-ascii?Q?10foyTL3t4KidkAmPgl//vLPHac7kMK697GvbQ2b8C7nzwEz718j8OKa+5C0?=
 =?us-ascii?Q?xtM4yykPuTx6cB4Umme5UMpAF0ml5mLFcptcHHchMKwE3su7N4Vo/Ee3mRCc?=
 =?us-ascii?Q?VwzcP+p2NwOY05IMwfsdr9q4n5qjAdZPhg+GJNqGDe5kOK4gXb6oAr/kIAGN?=
 =?us-ascii?Q?MCfwUN+x+FwmjDBUZ+ksQK9Iy3aqSSI03i2iSxQBZLfStqQuS2y+hsHlCahs?=
 =?us-ascii?Q?ejjDaorq0TQeyAiUVKl3cVwa6WWm4rIZTrg63t8RyNbXjozhcBIRLpdtZ/ql?=
 =?us-ascii?Q?RLFjuzcSh7Sfg6Lme7ZV2VFza2vyleVUjWahx3Rhm8unE9WuapOU+DC25gh4?=
 =?us-ascii?Q?fmb3y7T9RwVoPfsl3icx0ITjKJCEfPOvLZli1/IyMB0gzxa8VFHatvEHeBpA?=
 =?us-ascii?Q?YKe55Ho+FmZjT5rYZPFrOPfXst8UYQlpVwWw6nx8tkhPdDq9aEiKrVEfw46z?=
 =?us-ascii?Q?h47MWeAiU2f+19IN8x4Q1ZKvvBlTU+c3fsOd7cnJ/qQzFV/HzNPkvmTH9VI4?=
 =?us-ascii?Q?nmQ2IY+ORGoGZGpYvRfJcbgCECAqgZbHhnZ2GPkDEuY+qz9AHBePvw5CoSwI?=
 =?us-ascii?Q?aE6s+MINFoPV9kPAhhSh3XWLaoyCemB9DJP4dOVod2K2M+9h0VNJh8rwEQql?=
 =?us-ascii?Q?nWCceckFxJRV6nB+QLiD1gemUotnqSid3qBopmFK2xcgBPRB6DI8akiywOJo?=
 =?us-ascii?Q?zrnC24QGkt6EY4K2tb2ccM6EPHNHQ22xrBYfyOfw71sqqeOKv7oJTx41abeK?=
 =?us-ascii?Q?v0J9fQKnP8dH8UF0mn3kWXk01fqrZJ6uR9St1jYMWz73rYdMUwmHdhAyuR4Z?=
 =?us-ascii?Q?0TmkuNUkMij/WT56ULJaHBasVclF6CGsqrGUd0ryXOZ+git0pE1D0Jku7jsV?=
 =?us-ascii?Q?Y95M50i4MsYj9WwycmUx9RLCD62OSwfKxBLCpfRrfd89Vkey5kHyWURmLf/I?=
 =?us-ascii?Q?zhwqXhdDLbS7QlG347NFvXzlJj+B5QMaIkItUY8cAQX4xQ97x32pn5DTUrDs?=
 =?us-ascii?Q?mciSk8gMxDNFsS3qsf7ACK9ulJ4nHXUzpjseLh3aMc1CRkDQ42O8yKKlHkAX?=
 =?us-ascii?Q?OClmk6pp5SBLyb4h8SZjXAs/hEA+MAbtKSXV5fRkHZHgzGkHqu5lATpeC3L1?=
 =?us-ascii?Q?JjHLyOvjUWMu9zdDKvynOhcFdVxVoXH7nxqYOuLaeosAUb87WMxj?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d6b628c-3174-4d9c-c288-08df0a9b982c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 15:45:50.3347
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w9UZBikXfMTpiKYbJq8rOWJYE27VflRRhsiLLnGAOXnHzjbht12LFLwQ4nYsWQrkKbrkadnBkjaPdwbJ97Op9ug0yjdWrpRJogA4ta6+4hCkljKZhgdQRbvuXrVgo+oS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI9PR04MB574041

On Thu, Sep 03, 2026 at 09:54:38AM +0800, Li Youhong wrote:
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
> In dw_remove(), check clk_bulk_prepare_enable(). On failure skip
> MMIO and the matching disable to avoid unbalanced clk disable;
> always continue with IRQ/OF/tasklet teardown.
>
> Fixes: 1fe20f1b8454 ("dmaengine: Introduce DW AXI DMAC driver")
> Suggested-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Li Youhong <liyouhong@kylinos.cn>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  .../dma/dw-axi-dmac/dw-axi-dmac-platform.c    | 42 +++++++++----------
>  drivers/dma/dw-axi-dmac/dw-axi-dmac.h         |  4 +-
>  2 files changed, 22 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> index eebed2474210..413be7dce5fc 100644
> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> @@ -1320,8 +1320,7 @@ static int axi_dma_suspend(struct axi_dma_chip *chip)
>  	axi_dma_irq_disable(chip);
>  	axi_dma_disable(chip);
>
> -	clk_disable_unprepare(chip->core_clk);
> -	clk_disable_unprepare(chip->cfgr_clk);
> +	clk_bulk_disable_unprepare(DW_AXI_DMA_MAX_CLKS, chip->clks);
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
> +	ret = clk_bulk_prepare_enable(DW_AXI_DMA_MAX_CLKS, chip->clks);
>  	if (ret < 0)
>  		return ret;
>
> @@ -1524,13 +1519,11 @@ static int dw_probe(struct platform_device *pdev)
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
> +	chip->clks[0].id = "cfgr-clk";
> +	chip->clks[1].id = "core-clk";
> +	ret = devm_clk_bulk_get(chip->dev, DW_AXI_DMA_MAX_CLKS, chip->clks);
> +	if (ret)
> +		return ret;
>
>  	ret = parse_device_properties(chip);
>  	if (ret)
> @@ -1640,19 +1633,24 @@ static void dw_remove(struct platform_device *pdev)
>  	struct dw_axi_dma *dw = chip->dw;
>  	struct axi_dma_chan *chan, *_chan;
>  	u32 i;
> +	int ret;
>
>  	/* Enable clk before accessing to registers */
> -	clk_prepare_enable(chip->cfgr_clk);
> -	clk_prepare_enable(chip->core_clk);
> -	axi_dma_irq_disable(chip);
> -	for (i = 0; i < dw->hdata->nr_channels; i++) {
> -		axi_chan_disable(&chip->dw->chan[i]);
> -		axi_chan_irq_disable(&chip->dw->chan[i], DWAXIDMAC_IRQ_ALL);
> +	ret = clk_bulk_prepare_enable(DW_AXI_DMA_MAX_CLKS, chip->clks);
> +	if (ret)
> +		dev_err(&pdev->dev, "Failed to enable clocks\n");
> +	else {
> +		axi_dma_irq_disable(chip);
> +		for (i = 0; i < dw->hdata->nr_channels; i++) {
> +			axi_chan_disable(&chip->dw->chan[i]);
> +			axi_chan_irq_disable(&chip->dw->chan[i], DWAXIDMAC_IRQ_ALL);
> +		}
> +		axi_dma_disable(chip);
>  	}
> -	axi_dma_disable(chip);
>
>  	pm_runtime_disable(chip->dev);
> -	axi_dma_suspend(chip);
> +	if (!ret)
> +		axi_dma_suspend(chip);
>
>  	for (i = 0; i < DMAC_MAX_CHANNELS; i++)
>  		if (chip->irq[i] > 0)
> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
> index 67cc199e24d1..681dd6162baf 100644
> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
> @@ -21,6 +21,7 @@
>  #define DMAC_MAX_CHANNELS	32
>  #define DMAC_MAX_MASTERS	2
>  #define DMAC_MAX_BLK_SIZE	0x200000
> +#define DW_AXI_DMA_MAX_CLKS	2
>
>  struct dw_axi_dma_hcfg {
>  	u32	nr_channels;
> @@ -69,8 +70,7 @@ struct axi_dma_chip {
>  	int			irq[DMAC_MAX_CHANNELS];
>  	void __iomem		*regs;
>  	void __iomem		*apb_regs;
> -	struct clk		*core_clk;
> -	struct clk		*cfgr_clk;
> +	struct clk_bulk_data	clks[DW_AXI_DMA_MAX_CLKS];
>  	struct dw_axi_dma	*dw;
>  };
>
> --
> 2.25.1
>
