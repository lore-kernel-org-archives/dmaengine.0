Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010058.outbound.protection.outlook.com [52.101.69.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39AEF48E0E3;
	Thu, 24 Sep 2026 14:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790261447; cv=fail; b=X5pwm0fP51rBLs0N5uop9AEOMThJNUVKJJv+Ltn4BaExW5nWT6iICm1XcPdyfvG2yZoApBZgcTd4ZYD9PzflJlsjBg8U+EpvepekB7v+woczqJVL1e9GctSDunofLiV5cnMwJXANWgaIbvoxCyB+QHhFQt3q9+zDdee8aDtZk94=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790261447; c=relaxed/simple;
	bh=BktCulYlr44gzKw0V41UBAqidu/eNNETW8f3CbGEiU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=i+E+0COCwuabRgdObUs2fEh7PoM1ODrfd9ZKeTLFL+uZf4PGtEAhViqMOjJ6RKHGdagsOC3JMa/dXmqW2W5fMh+xJT5MchKZVJpNrLNCDOPReRYq2yG2dL0K6UrjfM+TiGUALtIzOtqntQR9w/OvJADS5PbA1hIt7R1V2EC0eHo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Ju6L0DDp; arc=fail smtp.client-ip=52.101.69.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Ju6L0DDp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FCH09uJAJEUVgos136yuAmtiUEJ4pqq4qg+E45XRjwyN8z5C8nvM+EtFkDCIWS6vOsgvEdLUj5YcftOtxZY5N5tbhQHHl5atkHucvGQD4U08wckmcEW/jWwhIIZmfLuGyzlPO/EtXK12x+vobVoGmOmmxSt1SWexCfNAFcnzKQMbYYOUL6CNt98FU2R0gyVvEj9+cZdhwr5jTp6UykiH0ucMwSx6Tdv9+e07v3odN6WDMDKZEkCpvhdGnF2FHOhUDTj+iT6D7KBWTuhkgF9rvFhzerK/Ib3I8d7/WbwqSTkqIkgBWV3pRjVvcoaUc73wGp3oKGd5lKy0+uUWXLH4fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RO16a0CAOmf9mOxLx2BO9WTcdAl7y5i/q7ZNDsBgUkA=;
 b=YHtaCuSSyZMeGW2krJkMPDyLKbwMBnUpdHiiWCUqdyPZRJusZhbcflRSVZC+O8btwKbj0wqpd33gbPeGUDT7KJNU/EQbBzaLxbjouEnjHyh0IZSVJJalrzg0D+zOr1Y3FuLlrweePF9T6YC0zF5HViEn1vsJoG+pUfzNILQjFo0KEWxhSgXskw1+I4vaJ25ZBrqEDR2+WpCxFx47BZ0rOnsw4lZpgtM7JpwQJeHwoPnHQr81Yte8fIF32AGF3Iqomh/G3EruC7cKnBVjzOkJShNC9SgeSnXQJwTR89IEIN+TP+gk2HYe5xPoe/tvmf89Z8pqYx/OXzkFdDXuGmQdkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RO16a0CAOmf9mOxLx2BO9WTcdAl7y5i/q7ZNDsBgUkA=;
 b=Ju6L0DDplqSvAVRJno5x5h4GvsETAumUjixoU+NCF5ShJeSEmWCtz7svnNK0IfMidVE9JHBeMcfh85OezXlIpe9uUJBrnMeY1KShnQxrzxEriYljLZjcJmW47mOEd4iAgMeThUNn+vykuF7WswfOaJI1yCW3HLoon9+B9+l/l/j5KdRW13IyFyLyskmwFmMrz34408mjqOx8XxKxkHg7dzWtR5iDzTQTlpOepgyqd4Lb21LLOQCgb9JRO1WVV++pMxgs3EyV0+UYcPWDoduuEM04jGpAoA6616JpPMf+rDrtf5kI4Em2yRmJ/a3vRKAqqPMPt6O7PTEmUGIV2Mn18w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by MMZPR04MB439479.eurprd04.prod.outlook.com (2603:10a6:190:55::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 14:50:40 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 14:50:39 +0000
Date: Thu, 24 Sep 2026 09:50:32 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, phone-devel@vger.kernel.org,
	sashiko-bot@kernel.org
Subject: Re: [PATCH v6 05/23] dmaengine: ste_dma40: Fix probe runtime PM
 disable
Message-ID: <arU4uCcM9Lzf3RMF@SMW015318>
References: <20260924-dma40-fixes-v6-0-fdb6755020a2@kernel.org>
 <20260924-dma40-fixes-v6-5-fdb6755020a2@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924-dma40-fixes-v6-5-fdb6755020a2@kernel.org>
X-ClientProxiedBy: CY5PR15CA0238.namprd15.prod.outlook.com
 (2603:10b6:930:66::9) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|MMZPR04MB439479:EE_
X-MS-Office365-Filtering-Correlation-Id: 45a9990e-43d5-4b00-1f4c-08df1a4b3351
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|19092799006|4143699003|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	/1WS8uD5nuN+OhI6nD8nht0ohqyT1Q/Ef4g6roYz//srprXFNbPn1gnte/TGDlQzVcYoZdW96V0FiDqKqs7WoLum3QJxTcW+jUd60hp9TFs9zO+29k7XCcFI63Ger/80N7Qm8HCgd8wqueQTjqUPIEmriPJXdqPjzoAphamNLKBvknORm2V5/7E9lPT7hJazC/tsn4UyrSEPUsZSIJndT2MJjsNifUgE6K4INp42RlcyGgxSbjV4zncF8v0fVx9ohTQedGtoH2sOFxNSlLF0enBnhxFQF7xwgwWYgkU9vavECmrmduRgOaYV+Uss9JJXK5AAEYFiHwOIPEaMtjNarE32AOUxuJjsvhyC4sIDzSPmBPGL2RRMRzycxj0Ra4wO9l+MV8lRdtd88ToJpcGm0lMYjT5a6q7DsM4SK04cJ0xR2QATTLLOeKG7xdWoRCDJhiRGpmQqMj7U0BoMz6ikBvBL+bdi81W+yRT/7xBCHLLvUk0d5UqcMZaPORGNAJHHTdSLBrtHSWJ290OdVhQ7yvMrXNRS7Ox5jVxXpay3MFxOaYRpVSg2FHxg2nkQkik1Pny54j/kKyoxyWBv7yoNZq7XhxLWmWwATtmREBwv0cSZrpxjIcVaw+RWxm3YhdvR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(19092799006)(4143699003)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YBMK7JMk6vpO2AA+Rr1OvgRKGWUNVmrfNmLCuZagvQ7iba2wdf3y0s7s3Uou?=
 =?us-ascii?Q?SZVWPEypUKSZp+zgce/bESQvJPeBdqjo0h4qk4KvoiGdpaEDntoFktoixW7v?=
 =?us-ascii?Q?tM4aRkMcZFE4Ge/sGwXRq1xQwvcbYmj48DarYs09Z7gqrW91Fv2tS+2OqGDw?=
 =?us-ascii?Q?mGKKharIVMVr7CTyRIS5p6j2U90IdDK3OUFEL01FIr7wtB/7OYTRzkeA6kR3?=
 =?us-ascii?Q?63jp135vj7Roaq4+b5jlcTcF3dIdgYuowI11YT/pm4grRKpAiWrSJfbftb+o?=
 =?us-ascii?Q?iGXWKE+RVXaX/OELnpZtb1hiJmRCUc9reo7htpj3dAhXRaTYPhsEwDg3DwYJ?=
 =?us-ascii?Q?rA04fffpf+fLNw6jg4EnjJ3tiVfpSuD309oDUXt8yjqdRuBgcf07zgt1NyW9?=
 =?us-ascii?Q?MD0rzMnM3OQ3PUOe3MoAKfJkCBXJmfsLNrUbTUOFKa28BrmKcALgu52b1B89?=
 =?us-ascii?Q?aJ96yAjmMlEztZ7sH73Qk8tLJlACacAWi2RazLMOXClbaGPEhvglz3J/ko+l?=
 =?us-ascii?Q?fwIlo1aiq3oIffhh4X17KNcRzNLEAM292hb3yjEGYXmRiZs7jRih6sIpRFVf?=
 =?us-ascii?Q?25G7BTQNVhM9k6meqGs05pgcVWDuaNmqd8sU4k5n3vKColR18Iii7+HkCzg3?=
 =?us-ascii?Q?kLuZkZf9X5UYVPIigqwrkMknEhPYo2SA7vhGtM755jZN3CwpxbxRGpxCyHxh?=
 =?us-ascii?Q?U7z6cQY5kGEDFPt3W/+FFKkQuA6VBTf4PDeLG29+h7KQ2Wg/+jOwtPvdI5bk?=
 =?us-ascii?Q?eV+AOJl2KZQx8Mqmr/R24/IRUKhIGiJM65soCwgYb6j9X8KH1uG7JgKxURBg?=
 =?us-ascii?Q?OT55A5UOPYLdmOmrjAmY7gR4EeEYccioeEvJqIvXaIaHUyH86ucvoCb4WomK?=
 =?us-ascii?Q?m8bUjYjDgZVokzGuTrQCurHSNTHSRu1E3PiWctCwQly+r12aHsB8Mw0BfYXG?=
 =?us-ascii?Q?NDJnFE8kZPYAg2fSz/oQqDVwVlfsjqUjQ07dkJB/z7Q8EN2RRsf40SuPLzKg?=
 =?us-ascii?Q?nW0DjcVIpQ5GYI7azDJP0mel/L3Z2NkrIeLtRrP7t3VImtSPkR9I32E4knlQ?=
 =?us-ascii?Q?I4GYVwaLfvtlUXN2/Fxhr6JJWqprM//IPucW4R61onl/1qw1cfQGfLA66+Qe?=
 =?us-ascii?Q?4cTkkJaV5QpVGm6/hVFXcMGWE9+oV81q03Ua+hRyyD1049sMm0SD7fWJAK+4?=
 =?us-ascii?Q?IZ4+rdfq8wizrnRD/FbKeddZkkFR9QrIoDdZ2wTIgPAiHJYJKzzkQkZ2EBm+?=
 =?us-ascii?Q?yaiUexZWRCVEZziGoblIK1+qiUSY3Tjdlxq/KHelLjnD2mpbbQagQlyVa+TT?=
 =?us-ascii?Q?bwjRhKWuIh9EI9mWRuaCV6B9u1V/UKr2gBQMwlW2nK3wdNrJBv95hCx7oLL6?=
 =?us-ascii?Q?vYkv5reqkcd0DA7sr5NKbJegZD9vTpONjr0x9mt8XYLMx8uDcw5CTdezUNEc?=
 =?us-ascii?Q?RLlT22u3NEIyXHZgCG9WYRkYCa69UBeexJ/uDArLCIWirK3NMuDgVQDGp+gG?=
 =?us-ascii?Q?Jrrz7EhM3fcigYi6+/nEtyeBlu1FRsglUphSkIRPAM7cbLn2GvvdPpHiJ0jg?=
 =?us-ascii?Q?wnvf6mIPsqIf1gxGr1cld5I0e44cgxan1rCCtJoIiMZfH9VkP6PSISGNIsHM?=
 =?us-ascii?Q?jouvGxIQmAs0XO6BXhsqsrmMXlD7GTPsrVAdqsFJnTlXfHDYGF2eE/QCRLag?=
 =?us-ascii?Q?K6kQMJTVCABB+BNHMiCRnxLlBcokvE7PuRjfpdYY1RHN57hu3+GxxckyQj0R?=
 =?us-ascii?Q?qo8QDkPYaakd91NR+vIof1+3hwo987yesf4fhPSNGWTKnUBQ6Kg+?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45a9990e-43d5-4b00-1f4c-08df1a4b3351
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 14:50:39.8743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dfRfJjbRsGX7qIMYoLpADv4AmJfUiFCwCMFlbK9gGRFPk13vDrDgnEM9KS3YYAgIBBz07vT3/ozrli7wel2zSPQMh401/O0q4Bnh+32FYVst2ZT3td7POTydmDQ/XnBe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MMZPR04MB439479

On Thu, Sep 24, 2026 at 10:35:17AM +0200, Linus Walleij wrote:
> Some d40_probe() error paths jump to destroy_cache before runtime PM has
> been enabled for the DMA controller device. The label unconditionally calls
> pm_runtime_disable(), which increments disable_depth even though this probe
> attempt never enabled runtime PM.
>
> Use devm_pm_runtime_set_active_enabled() to mark the controller active,
> enable runtime PM and register balanced cleanup for probe failure. This
> avoids both the disable-depth imbalance and ad-hoc probe state tracking.
>
> The interrupt handler uses pm_runtime_get_if_active() and cannot
> acknowledge a pending interrupt while runtime PM is disabled. Request the
> IRQ only after enabling runtime PM so the handler cannot enter an
> unacknowledged interrupt loop during probe.
>
> Fixes: 0618c077a8c2 ("dmaengine: ste_dma40: Fix PM disable depth imbalance in d40_probe")
> Reported-by: sashiko-bot@kernel.org
> Closes: https://lore.kernel.org/dmaengine/20260618051539.15E201F000E9@smtp.kernel.org/
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/ste_dma40.c | 23 +++++++++++++----------
>  1 file changed, 13 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index 621ae9ffcd57..de1d5670adec 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
> @@ -3760,12 +3760,6 @@ static int __init d40_probe(struct platform_device *pdev)
>  		goto destroy_cache;
>  	}
>
> -	ret = request_irq(base->irq, d40_handle_interrupt, 0, D40_NAME, base);
> -	if (ret) {
> -		d40_err(dev, "No IRQ defined\n");
> -		goto destroy_cache;
> -	}
> -
>  	if (base->plat_data->use_esram_lcla) {
>
>  		base->lcpa_regulator = regulator_get(base->dev, "lcla_esram");
> @@ -3790,10 +3784,20 @@ static int __init d40_probe(struct platform_device *pdev)
>
>  	pm_runtime_irq_safe(base->dev);
>  	pm_runtime_set_autosuspend_delay(base->dev, DMA40_AUTOSUSPEND_DELAY);
> -	pm_runtime_use_autosuspend(base->dev);
>  	pm_runtime_mark_last_busy(base->dev);
> -	pm_runtime_set_active(base->dev);
> -	pm_runtime_enable(base->dev);
> +
> +	ret = devm_pm_runtime_set_active_enabled(base->dev);
> +	if (ret) {
> +		d40_err(dev, "Failed to enable runtime PM: %d\n", ret);
> +		goto destroy_cache;
> +	}
> +	pm_runtime_use_autosuspend(base->dev);
> +
> +	ret = request_irq(base->irq, d40_handle_interrupt, 0, D40_NAME, base);
> +	if (ret) {
> +		d40_err(dev, "No IRQ defined\n");
> +		goto destroy_cache;
> +	}
>
>  	ret = d40_dmaengine_init(base, num_reserved_chans);
>  	if (ret)
> @@ -3829,7 +3833,6 @@ static int __init d40_probe(struct platform_device *pdev)
>  		regulator_disable(base->lcpa_regulator);
>  		regulator_put(base->lcpa_regulator);
>  	}
> -	pm_runtime_disable(base->dev);
>
>   report_failure:
>  	d40_err(dev, "probe failed\n");
>
> --
> 2.55.0
>
