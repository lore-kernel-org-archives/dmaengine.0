Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011027.outbound.protection.outlook.com [40.107.130.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2DC3911DC;
	Mon, 17 Aug 2026 14:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786978161; cv=fail; b=VoBVyoRvBiZmWUREIGFe5jO9o7s06HyHXplBBi54o/EkzXwzXpZjcLHfXGEE5h3RyAXO3FxhPmi/ybtm1yYuoSlnTM52gj43aQTAECRMRe1srb+bjMHfFPNDMLM5HFYhwlIqivQasTbelp0akgqqmBhyACkMd+67K59qA99u/BA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786978161; c=relaxed/simple;
	bh=fPkYl+V7P6pAeiNJoivXoDOxm842NG0IMirFBSaqfjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ArxAfZaGAsTq9NaAUhIimJOQ07PntHIUtLuU8aZVz7JeWFwmg4nseVw7ziVx7hYi6/BhajRWseFjgOhaxbNgNByzdiV9ppJ0zYnNVRxf+hGFArHkjGmA+VvB5wWZPiVw1szPeEF2iS1L1VsWnmLmQPkimMmNAS3DzccwxkhHOdE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=CHATHB33; arc=fail smtp.client-ip=40.107.130.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="CHATHB33"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xk5baEXCNiGzvzvRyijc4zLv3qItyur/N5ECNfO/riLhtV0SMQ0Jso1hsjTthSQAUWeEFEi1dCHipNJK3TZqNIeihGjN3o0ttnCczz5GvL8djDZWaxTnjcKI6hK9+SO3LkVhb10Liv2N8kMCnpX70LHtTsHW4STk2bVBVwHmtQ+3Sw/4YCcZx11txfRr2Obs3CfNt6pZUmKmQf5i9CxZnYccLJIAPmXC3bD/6gF14fTM0ZrinaC+Td/Gyz0sSeDP6JIvV2DGS3NYiuDixqCaclNMPAxpdftE/QlA4nbc1Jwmtrr2tau649U0ZQBSN9O8jlAsfyTgLuGaYMXG51aL/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0HpcC2Qgy8RuLYJnf+qZ0zEj3MLYFCUh3MY8JDGkqVg=;
 b=r5+jdUpPFXhH5ZRmM59pexiLfXcqc4AQ4jw7OZhgJqtymMhqcZ5cl671GAhH7WssZ0s5EArkinzHPMRqO9Cj84bhb1mZhBJYgEr/M9LB2NOoGEqSogCMBBPMdwgngILzF/bXzCYb6MY5F4LdEjWKcotZx9dcJ9ofqf3OsEK2UIfPhKPCuAssQ5W0fmXktNms/9rHbThj0cxTxOzyPtPYPjOCLznQBp0SRtJyflr0XqiuLZ4ysnCminjytZjtntQZA4elLKdhUuuu+21LDLzywfuNeg7lQWObCwyjyUVH/IYOjK3H25+Bd0jdyfqMBXeAe7qDZ9wQSgz42Y3SXsoVww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0HpcC2Qgy8RuLYJnf+qZ0zEj3MLYFCUh3MY8JDGkqVg=;
 b=CHATHB33A5Bd76C7ubjzJHZOUn48vhjVES5R7VNqjbs6KltB/vYJ85I2r532SbKyYd9chAaxKZpyz4ZqH8n68BXUSzQXhVjujEWHJ10U6qo2N1suLqVLdOnvkflyekfPfebqx0jPecg/UAEImW1jW4sVWgBmzaLlPoKdotr2CKsgpYMvn1f+GHECsYucjYD8nzFFjgeD3Mpn2id4v2VYwLgfVmzSGi+/v1CNg+5ff9jiTSkf9bK6W6P/QcOHPr0wL2rMYF2YXy+oO8aw0QqDUProL6dRpcp9JbwN1Cge63LtbxqJPZfmwH9GVd4GCxlNzPBB9P7cJfNyB5CLBd5UNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DBBPR04MB7705.eurprd04.prod.outlook.com (2603:10a6:10:209::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 14:49:09 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 14:49:09 +0000
Date: Mon, 17 Aug 2026 09:48:59 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, orsonzhai@gmail.com,
	baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dmaengine: sprd: use clk_bulk API to fix clock
 imbalance
Message-ID: <aoMfW_TVbzkuGZeU@SMW015318>
References: <an3zMHoaxx4XzvpK@SMW015318>
 <20260816055005.2667930-1-nagachaithanya9911@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260816055005.2667930-1-nagachaithanya9911@gmail.com>
X-ClientProxiedBy: SA9PR13CA0143.namprd13.prod.outlook.com
 (2603:10b6:806:27::28) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DBBPR04MB7705:EE_
X-MS-Office365-Filtering-Correlation-Id: 756e92fb-7ece-4564-2f1f-08defc6eb193
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|376014|23010399003|366016|10067099003|4143699003|11063799006|5023799004|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	+FllnIn+tOm9/LaZrT49uhT8nRWRlZ7nZecFC29+DeNcKCpIjsRPJy0z+sIQaagY1nGAD8y1L95YxKWplbFSOGsK2Ay/nQLXNb6vYXjIyOmhZPrab6TzEVr4YMmTAwEtpfGilWlxUXEkX1BYnIkhZE50O0bfNys7KOBOsxwIfTYKqyACz29dNQEYJJIVAduyhhKXil3bjIS7/VgMMBd6FHazghaKAz1uipPOXYLycMxmAdYZMZeNm+z5ktH/thBo31OGiI+60tyDKZSJMZKJttzcPjX/uzDfWr6fJhPBibJjP/AbSDBkxMw1VV6mLXa8CTeJXCLemam3RD3CDczjNabQ+80/YjRjGKyqYtxoAOFQfqScb2J0nkj3VcuB9RVgpOIjhdvLTQiNlKf8s8dnQHlkYlBUX886ocX8hl5upLAmDgFBuSb8I2QEe8qQwgQlozBB/K5el7Z6qBslfVsuwnUzyOlWCMIgFE+zPN0XNlad5wlDyxi2qDsrnTlbmnM+4Bzb1+fnXDZXRtZruLRV5YWXc64Neix+5Crc6tAzoTBMXMA0zmnoLRP1uQrEom1TwAm2EaPdPZfFxCedCkCejCsyzbzWW5YV4aM8aYwUYSYDDqzeTOrpfQZw11LJf5hmE0Jl+NUJKR3S0YNdSg8aU6/Xf9Zp7AYDDdj7Y3RCo4o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(23010399003)(366016)(10067099003)(4143699003)(11063799006)(5023799004)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7JQoC5XGu6xpaMRVhCLoyJSmLaU+ARqTp7Rc7yGDz/3g5de4tKRdJ6fy+ury?=
 =?us-ascii?Q?+M8IZdi/LaP3hVYTTZ2drEyXWTZBgfhbw4iHQZlyDD1ShaSzeEB5FgkCcpcK?=
 =?us-ascii?Q?DibGAr5Crks/Evgi3YWC1GxGMYKrFnd1RGfRoPblkAYnfakk/tgGHqkfEYN9?=
 =?us-ascii?Q?kpmpLSDKfNR1EKuOnSf2RsVVGIk5nz8j3xZzGLO6LswAdMbC+ym1/PfhC47x?=
 =?us-ascii?Q?cFrCnJmt9ldc0suruWyk7Sd3n+rpyWlQeDldiECLU+2KQXdOi3DsfNPOc/J3?=
 =?us-ascii?Q?juubkrFQU08cb9m8gYfNUfrBulSwUx+wbOJqTxDJDZTMOAT95frXER9fJS4p?=
 =?us-ascii?Q?hFk6JMzyDVjt0Qn9hZMkXtuf1v/2R0lLT9mTgB48//i7K8yPfr8XygWyJ45B?=
 =?us-ascii?Q?J0AarPXncEzMJHZiT35djB9cwX9sCOSTvJI0NT4aV8jv74suUffiuTvwTwc3?=
 =?us-ascii?Q?/HHLtGhSf21rFfPIOLPthR9ZMementhDjeUOEac+eP7E6PipoZTqndJmn6bz?=
 =?us-ascii?Q?XzdRwKvgo6lsyg/Tho3CX8NFEihsopK96q851JNC1KRaQwmvjiwbu2tGeEjb?=
 =?us-ascii?Q?z/lFl5q4/WT5ECggJcohFCAPtB3EQ8LrovM9kBXoA9braZKXtJs3hyxZqzom?=
 =?us-ascii?Q?AXWtrC6OoykVg4xzzpiD7h8zoO7Rp7Iy02Rt1a0kVSi/1mi9ZQjc2QgcMJmP?=
 =?us-ascii?Q?uvmbacI003Ldar0OokDtJt3qtkqgQc35+MoRQjF/xdilx8BuXGy5odHErMyu?=
 =?us-ascii?Q?M2XB50geHxv0DSiBLr7i8RY3Lq6l1W97UT8Il3I3qnwYm93L4zu1kg6kGCxP?=
 =?us-ascii?Q?hHZy9GmMh+QZqbIE6KcVjv/XWuGQdA1GeW9cPBiJdwMHCynrjkV1GKfKwld0?=
 =?us-ascii?Q?mabPAN0eIYMUgOIubvVqxqGDBbE7j60qstEfvvVSCvbf38LgwPuOp9YOPuLX?=
 =?us-ascii?Q?Y0ngyV20umR24WS3IpoN0zOcmrlF1fXR7/77Ii/jZmPZd4K1UbPdrAjkoEYn?=
 =?us-ascii?Q?76BjpxA481893N8pPXSRwqOVvrfnk6qkZyePgC8wn4NRCzGAsH2kfIQmhHVK?=
 =?us-ascii?Q?J66mL9kxDAs3of5csZSErwsphsVsbU1bjOis0Ud/IOYBbKVqwKNmWSKUPQcK?=
 =?us-ascii?Q?+/7bCA2fPOGzLTCh4cJo0+m5jXPPXgIliq9HYhCW8DkBGEnfXuf1wUcwewvk?=
 =?us-ascii?Q?G0MkeqD2OFcHgZ+tjyI425epEyBH3jcy61gfHwiIGDHOJrGt0z4p1XoIFDrS?=
 =?us-ascii?Q?/gYCoxDN268YVKaVTWrY2eHeooxLGGRCP7VOgEy/dWFMK0gGYAdwiHldTdWA?=
 =?us-ascii?Q?cUv4CpGLd0kwvr+boo6m1F+2NAKc1Q1RSG8XVSRts9NwFF9PikAWPX6u6WO0?=
 =?us-ascii?Q?glaQhKTZE/aLcyRsqzBM9r74Lx4VPbJtx/LgRPMPwOvefrv0IrMsWBt0Yk0C?=
 =?us-ascii?Q?McW6gcFzWbfliM2LOvzYiEC9Up8lm0P04GVNWtfsBcbriRkym7Ls6OiBVyr4?=
 =?us-ascii?Q?KmmHtpplVFB7rgSDURpDbezUHE6zGyM20vSI6/QpBvIp13mDQomlPE6to7hu?=
 =?us-ascii?Q?phwvoYsBQLWobmJEgjhjJFBZm3aYQmrjJD56lTCI9jxFzSRm6nY+vSKD7ufP?=
 =?us-ascii?Q?AcE9DyBRN2XkgKqH7sxU9BwALo9IqlLY334z9gs0sa4m0doWfXlO33757n9r?=
 =?us-ascii?Q?py4Ds1o5eOpFbrM/6dpnIWB/3KLBgAbSNE1Jw0S2+PI39Rfwb3rWa19bywwp?=
 =?us-ascii?Q?nuFPUIxTyZ/WamQfEWqsQgE3iBZtYt9g3vmwN8s/kLYxCOs2RnG6?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 756e92fb-7ece-4564-2f1f-08defc6eb193
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 14:49:09.2949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hQK5zvWgRrlTxzTDXvzN4+oRizXxRHpXX/+I2eoUIJolxrsXfLxl6EiWQ3x51xoh1i1wUj4S2INJ+k3wkt5msWqU8usjNX1a22+GLhROShuI8hjgv50bOpfWZH0l1GCY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7705

On Sun, Aug 16, 2026 at 05:50:05AM +0000, Chaithanya Lagisetty wrote:
> sprd_dma_enable() enabled sdev->clk and then the optional ashb_clk. If
> enabling ashb_clk failed, sdev->clk was left enabled: both callers
> (probe and resume) treat a non-zero return as "nothing was enabled" and
> bail out, leaking sdev->clk.
>
> Convert the driver to the clk_bulk API. clk_bulk_prepare_enable()
> enables all clocks and unwinds them on failure, and
> clk_bulk_disable_unprepare() disables them, which fixes the imbalance
> and simplifies the enable/disable paths. The optional ashb_eb clock is
> fetched with devm_clk_get_optional(), so a missing clock becomes a NULL
> entry that the bulk helpers treat as a no-op.
>
> Fixes: 9b3b8171f7f4 ("dmaengine: sprd: Add Spreadtrum DMA driver")
> Signed-off-by: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
> ---
> Changes since v1:
> - Convert the enable/disable paths to the clk_bulk API instead of
>   manually disabling sdev->clk on the ashb_clk failure path, and fetch
>   the optional ashb_eb clock with devm_clk_get_optional() (Frank Li).
>
> v1: https://lore.kernel.org/dmaengine/20260813105354.2577040-1-nagachaithanya9911@gmail.com/
>
>  drivers/dma/sprd-dma.c | 44 +++++++++++++-----------------------------
>  1 file changed, 13 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/dma/sprd-dma.c b/drivers/dma/sprd-dma.c
> index 087fea3af2e4..ac6fe6118ad1 100644
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
> @@ -1140,16 +1120,18 @@ static int sprd_dma_probe(struct platform_device *pdev)
>  	if (!sdev)
>  		return -ENOMEM;
>
> -	sdev->clk = devm_clk_get(&pdev->dev, "enable");
> -	if (IS_ERR(sdev->clk)) {
> -		dev_err(&pdev->dev, "get enable clock failed\n");
> -		return PTR_ERR(sdev->clk);
> -	}
> +	sdev->clks[0].id = "enable";
> +	sdev->clks[0].clk = devm_clk_get(&pdev->dev, "enable");
> +	if (IS_ERR(sdev->clks[0].clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(sdev->clks[0].clk),
> +				     "get enable clock failed\n");
>
>  	/* ashb clock is optional for AGCP DMA */
> -	sdev->ashb_clk = devm_clk_get(&pdev->dev, "ashb_eb");
> -	if (IS_ERR(sdev->ashb_clk))
> -		dev_warn(&pdev->dev, "no optional ashb eb clock\n");
> +	sdev->clks[1].id = "ashb_eb";
> +	sdev->clks[1].clk = devm_clk_get_optional(&pdev->dev, "ashb_eb");
> +	if (IS_ERR(sdev->clks[1].clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(sdev->clks[1].clk),
> +				     "get ashb_eb clock failed\n");

sdev->clks[0].id = "enable";
sdev->clks[1].id = "ashb_eb";
ret = devm_clk_bulk_get_optional(dev, ARRAY_SIZE(sdev->clks), sdev->clks);
if (ret && !sdev->clks[0].clk)
	return sdev->clks[0].clk();

Frank

>
>  	/*
>  	 * We have three DMA controllers: AP DMA, AON DMA and AGCP DMA. For AGCP
> --
> 2.43.0
>
