Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013057.outbound.protection.outlook.com [52.101.83.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535FE4078F0;
	Wed, 19 Aug 2026 19:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787167374; cv=fail; b=M14e50lyEbcuNEL0aKX/J6qdoGvl8ICYvFBOtf372Ggyb4f+iES89PRQ+//FOthIn4kp9gqBePm2wDZqk3losJNLuUvHzGFto9PpHJSZWa115zBiwQvt+cn29RqPFN/3lVDK5fPCHJSAf4ZFzwIhZpPReGSybEa70XLt0CZYHvY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787167374; c=relaxed/simple;
	bh=jn4aD3mW17uzBJKRa6FViOh99gOq6Peps6Kt0fghi4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uNilS5xSE+kudwp/iZ8G8vnmNrhPvzzuS+A//qRmm1EXuJB8zv2sNd8Pau5ae/juyziJ2kzfsnnoCRwGcKx7UmgRpHdcso4cpLq6HeklOaQW00ofNelGDYbV5i3p34AFXtEzj6BgrYBs799TkCXCvtCJBbl/bhg6CxaW9tEP6Wk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=kMnaLBTn; arc=fail smtp.client-ip=52.101.83.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="kMnaLBTn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iBoZOyKfg1VnSfDlmhnm/489cU+pCha6fX7ouzxgmFpqnXhwuasDzBuFpS30a/cQMUDulRCdRn3Qs1T8dPUo1s4QJCE2e37DbH76Z5WaasZoNzkS14/Xq77v0YNGOIwLkYz2a9Q3EkLNzNgO26+NHKbtJBb0QL8thK6xJDvwtdyDhBR5G1t5RpIHOdo7ctymis9LlYQuAD6e50laQ90kuH70IUVVEfwjOIbMZNuQiRWVMhiR421PEGIJZBDCt/MiC9pIj2nAhmS0nPBQOye0AJFbLA1ZCcgDKBunywm7C36KeTJ7ypSZwgJs7OAsp9wDIdJh2Yek6MKq/PeIVSVNIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=36L+VZKbusDf15E4ANyxe/mRXXsc5g1YwOjL2dRmTIA=;
 b=eOQt6//QqtFFZNSkfzTGyz2+s7Lmw+T1NUqmcJ0Cb0kQh+7vIx20/1ZP/k+meIkBRvaJUjqPTbTyd5AaDg5knxOibHI/nWGs+WMTdrHXv3iq8sn/xannW979hr/OM+TWo5nDjeYgXgOJEo8DoXre7hpgEZu1k7W/+TnJCjfa2UeeroDFe3qQHWoYlMKdM5T1yaLuDh5kTiwHhgkPuIvtfpsf8KV/qxgYx3Torxtib96jE1kogxZ8E9HsBsBQUzh0ED0rVpWoiaPXndljeYEWGT1i9PT+bP0lU/4QDS32kjS0BXdVc7A54BpsH08zoVP+MHz+5Ts5cC7Mn+Ls6suSKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=36L+VZKbusDf15E4ANyxe/mRXXsc5g1YwOjL2dRmTIA=;
 b=kMnaLBTnG+CYuTsiNt5NYWDJ5oHsdTHJJZfVdo/xYbyv2Wy5+MYbb+eciAfoCEPgtFhd5lFnpBHzcWDP7SoD/zB/RRa5x0PLbJdV9DrJg+Z+d2EA3L/U5yFj1B4EwYB3Xo1+zrnC+0qskKbv+odkTJAdIE2XWClfrJdHsk95wL+ocvXmjEqY3dxoIPnojI4swMfsnohTVHRm5aviAyfWDP8idEi04Cgqns6HuH6jmEJ4NZTN2K/+7L3NzsPvVrMxjSOyv/7RmVINbxzn4tw81HXLZ2mf41CKQRkPR4ySL1Qnr7PvcmMQR+UJYi1JFaKL3DinJfSVA+IjJXveshiOqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU0PR04MB9696.eurprd04.prod.outlook.com (2603:10a6:10:314::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 19:22:48 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 19:22:47 +0000
Date: Wed, 19 Aug 2026 15:22:41 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, Eugeniy.Paltsev@synopsys.com,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dmaengine: dw-axi-dmac: convert clock handling to
 clk_bulk API
Message-ID: <aoYCgWfzCmjT637e@lizhi-Precision-Tower-5810>
References: <an3y4lS-ZE4CdJ7R@SMW015318>
 <20260816054858.2667380-1-nagachaithanya9911@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260816054858.2667380-1-nagachaithanya9911@gmail.com>
X-ClientProxiedBy: SA1P222CA0062.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2c1::13) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU0PR04MB9696:EE_
X-MS-Office365-Filtering-Correlation-Id: 30a54126-57da-4f32-96f6-08defe27408d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|19092799006|23010399003|1800799024|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ZK84oM5CZ3rzPDQVNzDRNULeCk5WFaW6erRpcsgTyDKC7r5E8LduZ5U+J+fSnbRcQEjupT8jactCVJA7yTLDaScRThH17XAJ3a9PxBJVJFE8O7jFacLckXwhczhQs1EYPknq1SpwfoKZD1Gq6HCiW5Ub4xki9/25J/qAKkwave8HL4bhTfmOFjsX12T8LFv9dYSR62qEvRec7Lt6IlHy2JAb50wxFJge4yNsId7x6HsNDFOKFQ8x8n/0UHNur+zwv+4lPXFkntBiFVio6UeLchUQXVBX8l+CseWdoJYSX9SZJTrnDxTzcU3Aw6SlP5/OWZeEJFio+HNW840nhINz5UUHjvBQCaOVmU150QLCPAOA/zgdrVDkgEuSyl7ZcwqJ+M/OFunfKfxF4++86SmlYWnt6EmoDwMXxHa1MGnL0eupszl/MqKWTcH5l9DgZyb53JE6QhOXMYDHXQGcMbdpavqyfVEJUt0jcK628mUQ2cG54muujxU3x0DnzX5Kmnttt+Vzs6za4iRQMJSloXevYH7EX/Hisqh44NMFcvOXlitkHdrGeRbScxdeWCBTlzaOn77su5oKp/vDmqqz9CNWWFjKhytO0NRy3OO6YXu2WGlcavHcIi5O56tDXPewL1yfaAhGUI6M69RV5XejrWqY8JbsUvCk3x6u5UjFFBxaG9Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(23010399003)(1800799024)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ydfnL/IEY9Jj/HZxa+R4uw/gTscOFiF5u5TEGI5IQ9UvHVbwK35S/TnoNXr9?=
 =?us-ascii?Q?XENK9TqnE+vjqLpVYpB4wXXGF5lx3fH2aH5cDobb221K2oAmRpJMvFNC0P5q?=
 =?us-ascii?Q?9B0A74NfX/NfQyDgTcdnjuoaCO9ECkEzhqLM6X6SZcyqYYWXH+wGC7O9zGqI?=
 =?us-ascii?Q?NEd0lkg6/YOf4bOObBWkS5pl3iSEoHB++1Qy39R4uZ8XYbXsxJEE9ymrToeL?=
 =?us-ascii?Q?hu1iXO7ajbdjXpDId8JrZV/3QKUyzWLTLUP4KaAjekxvuC/LfrQy9Hj95vFI?=
 =?us-ascii?Q?KBHdfu+D4wFJJcjg41zTplzIXViXEc+jCAeRYpxxknYp67eJlX0D7KzqjNTJ?=
 =?us-ascii?Q?V9PE8XxG+2tChN3w5TQLcatkNgE/INuH45kGaQEGr4wQvFGos4Y+cCiG2a2G?=
 =?us-ascii?Q?lPhu6cew5ymF4cCRvc4vDYMmvm4Cew8i7uuxSbNdRVRKhdZum4Z7D/OPOtxI?=
 =?us-ascii?Q?XvC3ZH9x6Jb9MFvHPR5RNr/kbKcozZQVd9YOYFhDQ0lOrfrUFgghjTJbHh6d?=
 =?us-ascii?Q?I9MFFTfMhHuQS5SOd4S7K/jKSfwTBed49FWXpf45Y48SYBwnJTnFfNQG+Mw/?=
 =?us-ascii?Q?fASNQVCfjWp6k5d3MpdvCNr/3emCJdnpc4kf1t/KpPfCEY/gEumPLQws9z+9?=
 =?us-ascii?Q?C4V3AvQ9AwJ5NsJ1HIRZMCsSaChOW6cL4c+XZDeLA7flJDlU2jvJkGkmhLjN?=
 =?us-ascii?Q?EeLDUC9uHXEMXbYzjZaSxKhcvilTE+jtatM+lpzRHwpYamSTTtgSo7XorLq2?=
 =?us-ascii?Q?ww+vtsrZy6ctSFKIoBvIKWhsabnbHP/aoZUySdZ6E56g0UsUWEZVFyuAFWy4?=
 =?us-ascii?Q?gfL9wfKFWHfK/UoJGbI1tOeeYlx22xzbG10P/SGzEK2AFwn1ggEJRawmuIW4?=
 =?us-ascii?Q?W6AcAA986WnVczZ1LR9+SLQZ1DU4PlJWX2+sHLQxZ4lIYUY0ZMP8KhjESphQ?=
 =?us-ascii?Q?nJHndkzZlKmLI0JY682X7MMp8l4hoWUKQQ581XgQ8l1LuhMtH2Q+/4iyPAFJ?=
 =?us-ascii?Q?dZ2UujpClZneA0L4jw18AvwBpSkNS/LyrNdRYsHMvBzBcpb/zu3B0i2Q2zIr?=
 =?us-ascii?Q?MYwIfteOFKEoLn9kYT8b7gm8YClCEYl3HkP3olHxhaYPwrwhkEfHcseJQY9o?=
 =?us-ascii?Q?hOhXCeQDYtWI0FL4pruAUMuiwTN+fnFxDlnF9UvMBrX7pAXW3fBv0b2pvK5X?=
 =?us-ascii?Q?dq454EYz/84l07KIXzC9J9B83qEQCTah83vSFaEhFcJmXB+F6/gP+nhYsfjj?=
 =?us-ascii?Q?FkjrJEx1Kizd22WfOeXu0cov0pHq0CkdDmwuMCyCHJ102erpfDfvRmH09v0l?=
 =?us-ascii?Q?E+bpm6CHbDvy5VGkD0hAxPTw6scmWAkp/WjHm+kiyAt1vJ5Ry1q2tM79iZ/t?=
 =?us-ascii?Q?mCGGeB5rc2VSIp4fdfhAHKLlGGjDjR4RR7QNQ9C3zBDlKNJ/BgkN2dGkET4f?=
 =?us-ascii?Q?hAxcXIZpGqyrkoRL0NqqO76cNMeS36pPfY1IuO5Rt7I3Dyxk+q1sy4HAQ5h0?=
 =?us-ascii?Q?UvL4KNmiXOX8qoltYvlr38/yzMvuAeMuMGmqI5AxmULR1edERK6hxaC5nRHi?=
 =?us-ascii?Q?wXXHBKcotcs4Fulw8fUd/4qrYVjRmAJTWgH45uUKbCr4wm5wHPmAbwBD/XSC?=
 =?us-ascii?Q?zHPY/Kze+L0BsesLZJcfooAU+sgIYsHv+06At0D0FRtWGt5YSO7yP+Pz+skn?=
 =?us-ascii?Q?LvfwGB6E+ZGFwDDbQt7P732+OxRQjacl4uaU45rL99trKlSgj5LNyJfBlrjM?=
 =?us-ascii?Q?iOr3AiMcJarLoZ2+aVE5l+aOZ854tgQk7+L8KvQR/szTsuYchCko?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30a54126-57da-4f32-96f6-08defe27408d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 19:22:47.5987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hq8T2GslKRtJco/K/7e1t01eYPTmsd1j8Jt7w8t1Tl2nXlCUHLve4ggZnkMo4hWtbMEw49CZy58nss5HGoM4cci/YPlbx98iEtxU13yuxvisCfdsWg8Zs3H9rQjUkSAo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9696

On Sun, Aug 16, 2026 at 05:48:58AM +0000, Chaithanya Lagisetty wrote:
> The driver managed its two mandatory clocks (core-clk and cfgr-clk)
> individually. This was error prone: axi_dma_resume() enabled cfgr_clk
> and then core_clk, and if enabling core_clk failed it returned the
> error without disabling cfgr_clk, leaving the clock refcount
> unbalanced.
>
> Convert the driver to the clk_bulk API. The two clocks are always
> acquired, enabled and disabled together, so a clk_bulk_data array
> expresses this naturally and shrinks the get/enable/disable paths.
> clk_bulk_prepare_enable() also unwinds any clock it already enabled
> when a later one fails, which fixes the resume imbalance.
>
> Fixes: 1fe20f1b8454 ("dmaengine: Introduce DW AXI DMAC driver")
> Signed-off-by: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
> ---

Again, don't post new patch to old patch's thread.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes since v1:
> - Convert the driver to the clk_bulk API instead of manually disabling
>   cfgr_clk on the error path, as suggested by Frank Li.
> - v1: https://lore.kernel.org/all/20260813105432.2577322-1-nagachaithanya9911@gmail.com/
>
>  .../dma/dw-axi-dmac/dw-axi-dmac-platform.c    | 28 ++++++++-----------
>  drivers/dma/dw-axi-dmac/dw-axi-dmac.h         |  3 +-
>  2 files changed, 13 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> index bcefaff03b5c..254167a558ff 100644
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
> +	chip->clks[0].id = "core-clk";
> +	chip->clks[1].id = "cfgr-clk";
> +	ret = devm_clk_bulk_get(chip->dev, ARRAY_SIZE(chip->clks), chip->clks);
> +	if (ret)
> +		return dev_err_probe(chip->dev, ret, "failed to get clocks\n");
>
>  	ret = parse_device_properties(chip);
>  	if (ret)
> @@ -1640,10 +1633,13 @@ static void dw_remove(struct platform_device *pdev)
>  	struct dw_axi_dma *dw = chip->dw;
>  	struct axi_dma_chan *chan, *_chan;
>  	u32 i;
> +	int ret;
>
>  	/* Enable clk before accessing to registers */
> -	clk_prepare_enable(chip->cfgr_clk);
> -	clk_prepare_enable(chip->core_clk);
> +	ret = clk_bulk_prepare_enable(ARRAY_SIZE(chip->clks), chip->clks);
> +	if (ret)
> +		dev_warn(chip->dev, "failed to enable clocks before remove: %d\n",
> +			 ret);
>  	axi_dma_irq_disable(chip);
>  	for (i = 0; i < dw->hdata->nr_channels; i++) {
>  		axi_chan_disable(&chip->dw->chan[i]);
> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
> index 67cc199e24d1..039316c42f05 100644
> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
> @@ -69,8 +69,7 @@ struct axi_dma_chip {
>  	int			irq[DMAC_MAX_CHANNELS];
>  	void __iomem		*regs;
>  	void __iomem		*apb_regs;
> -	struct clk		*core_clk;
> -	struct clk		*cfgr_clk;
> +	struct clk_bulk_data	clks[2];
>  	struct dw_axi_dma	*dw;
>  };
>
> --
> 2.43.0
>
