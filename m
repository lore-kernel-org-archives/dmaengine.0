Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.27
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794598892;
	b=etY9xAg35nE7yO8izePw6Ja/oowJ+zr/ybZ/6wYk19dFQnFjxnfAq7bmntTpMnl2oKRP
	 gvqKnkpAjON9pjjWfYC+LeERAm0h19Q3CTzf915qm8dOui+Bd9F7qR5aVnbqT79nTcLJy
	 9kBcJcSw0ZvMmFLTDoocu8BCvEWs0rokQs6K49drael3gBmaiSwXw/svvLdFjXHPAejW0
	 UtHhlIi+m4soHJQ950VqhsfP4IjTgFPZfKKQcdCzm1XepgMphKz1z3qZxkPtTQmTSi3Q/
	 8BH8bq3626rE68EtIfv1jrJYr37E4HzgjYNgNaeaXsuVisfAxg1mAp4U6piaUOEQnPQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794598892;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=+L/5HeJeWapWYDKgwoTIQ0VYIEapofXO6xDP+YhZoIc=;
	b=ZT8CY5rEDyKpSR1W3pT/TBQEMYNNHkBJCUgIgDeSClfbsxrQ+z1m20djW1puoEwaYaiY
	 MuISfSQ40MlTWQAturo1TR72CAFWS5Y9O60dIWvfRPp68vD8QXFbemWAg1k60rR3TQ5i+
	 26MMF0OkYfiqCaSNK6TcN9AEeWGiqgykpyWTMLprsjI9a2uCU184LC7YnkWP/S9+bKeXe
	 OReFlkreyDPXgYnLpOFZU6yj2kIqdmEt5xwgRPgSn7Y7oTI9nsOlc9++eGUBpUfoLD29m
	 HWpz0uCJ8PlfonEP5WJIytoBVU22O8Wii6/MYQxoqptiNm8NlgeFEegrhr/oAltPlwg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=UTrSEmBV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.27
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011027.outbound.protection.outlook.com [52.101.65.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84AE2606A334;
	Fri, 13 Nov 2026 19:41:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84AE2606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=UTrSEmBV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qv4myWtvnFNhYmWYY/EW72Nl87CcduCcZ5ycMNyxli9S/pzmNZvXup4m21AV/dStgPOVoRluUt8mfgGDICLeSdquH0QIf1VcEfND28yF16eAgxYl2t1u1wUJq0nFrxwxxYY2sKgzdgfPDmBXRyxSkJ7NwW1EqeTzv1yXn02JV7RKINNmjVL1bd16VFEr3cbCsoqh48dL2abD/X8hFrtY7x+csNk3MCmVOyt2tTA5LyVq8JpYpAAHtFdVv2cqPOiVDb93GNiPgOwaHT5CL/besxJpNbZefupYs0llPqaSnsQKbraduJIwK9HzkhVwaJJepQ7Yq4nXplHzWNexsRa+Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+L/5HeJeWapWYDKgwoTIQ0VYIEapofXO6xDP+YhZoIc=;
 b=bqp4+2iARygQKlFZ7mr8cjayqiYn7/iJRJHunFhH6mvgXUjzRz2S2W40VzYZh5QdC93cewTehL9qOpBI7Ez7H97tqT1UCx6v5FwAGuRwFTd+eSkMe49As/MxPkjwdluMylmW29pzePX+C2VqDCRXOV5bpKYxmJz3y6vFDEDnh9r8giSJpugXUgP1cHF1fFK140YpYFICVohjvxhChkY0TgmW9zrb6AKiWKVpM1dKROnfiE0GA2SJofpx2mBkoZ76VGxWdloebL+sJOpn712VWADWhacFA1lHXvmTXN0/BYstiYr+7RiUZK7AHE/6q3x8Bw+sc6DQdEKFjmNJWwVPjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+L/5HeJeWapWYDKgwoTIQ0VYIEapofXO6xDP+YhZoIc=;
 b=UTrSEmBVHlwzLFeqApiKQFy+RCfNNmstDUyRGs4mvHnfWhLYWuFBeRG8dWr7fuSysvL7yRUES9Ya1lNmdLZbDzQdSWRztd0MNtHR7AZl6kIOQknQs12HcheI7Hl5w5gBqJodEuWnhzEiQ+pT7AkfbcEBzJViG1K7WgHmIxW2dQ3iW4930LwIVtCIZJI2fqpcl0azyv46/4j/JBZtucAP+Rh6imBrTlFBG42Of6qjdlSPpF2nGlIVmj4Ic08XaHpq6JGNJIpuV0KMGYuajuQXIPbq1/jrL0R1H4fbaiooQ4V72JuaY8csQJjDAzdI+8VYwDeM5SX3L/YbuGcHCWdsZg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DB9PR04MB9281.eurprd04.prod.outlook.com (2603:10a6:10:36f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Fri, 13 Nov
 2026 19:41:28 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.009; Fri, 13 Nov 2026
 19:41:28 +0000
Date: Fri, 13 Nov 2026 14:41:22 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Cc: =?iso-8859-1?Q?Am=E9lie?= Delaunay <amelie.delaunay@foss.st.com>,
	Vinod Koul <vkoul@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: stm32-dma: Fix runtime PM reference leak in
 pm_suspend
Message-ID: <avdn4prElVn-v_m9@lizhi-Precision-Tower-5810>
References: <20261102104108.794-1-laixiangwu@cmss.chinamobile.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102104108.794-1-laixiangwu@cmss.chinamobile.com>
X-ClientProxiedBy: DS7PR03CA0320.namprd03.prod.outlook.com
 (2603:10b6:8:2b::15) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DB9PR04MB9281:EE_
X-MS-Office365-Filtering-Correlation-Id: cfdc26d7-618f-4df1-f53f-08df41be1c02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|7416014|19092799006|23010399003|11063799006|261022105027099003|261028144727099003|261102123227099003|261021121427099003|56012099006|261026140227099003|261009223027099003|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	uyaJrHPQtXKqbd4rZQW6FQO6VBF+wkfz+4W97SXh7mfrXPziLmZOteAS5OjNUEdxZSPlmxdlVxthL41bWbeqDh74wEAC2HpPkj2fPQUZ/Ro9cDK1boj8ERzKCzOO/34W4nHJ1WHIt0wGYYNdv+qXeGePcqr2IQjYe36aKPSUmZbooPqWlggXVu65VdstxP6fBEIStFi5YbZfelnbsz0AXTz6j55ZSMCDFQ5sddCoLECkteQcy/X9UaPDwS8yfWMo3mW6lrLoklxUjOh8sGeA4gly8P63cSCfIXTvdqbsOmqlq4AM73NOT4H7J8OTQ6pJyG9duw+hKffB2Qwspb4QxIgdx4oRqAQEz2tCVUkX10xBfHtlJJrFWcudkca30PXJ69Hw55M2ID0r2pkp06PyE0zvBsg/5lWjQSyCDW/OLfBmOTWv1Pxjg6tjxafWm3uUUQyTUv41lx/STdDNB6kqFVoUXTZ3p0TSp0zU2GEZnssL2O/TjJXhpK4UBrcmRCCNIayaYBjex53PFI01sSBoegqLeBpFmys/VWQSDTP86dHnSUGbYUwKdMijY3W3Y1FkStYVkiIbuAF7cR4GCawpeamHQ9uIa5pw/Y0ydC/rnEmIRzC1y+l5dr7sZerquREUB8hyJ71jou/MwTK3NB4EyK8PxNWrfdHg419pk1x5X10=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(19092799006)(23010399003)(11063799006)(261022105027099003)(261028144727099003)(261102123227099003)(261021121427099003)(56012099006)(261026140227099003)(261009223027099003)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?D295y1YqA4X5gCiI/e4KvHMvQme8m9V+BrOX9sgzBYH03EXn8rDtB3d7y2Lv?=
 =?us-ascii?Q?Dhe5rPiY5INydaEKbUhL6QumxTtZ0JaMMxRRCSdhwk9mNPnYIaOTNJuf8N6h?=
 =?us-ascii?Q?U4WnPpPS3VF2kdaypRr5+u5frNRGbVM8loMXBsDO2upFTrjOJuMXbwnxNz23?=
 =?us-ascii?Q?bBAB3Lsgs8pnO3UT47OqAMqyqu7CAhYZg06/uLRAy4HnhL5bm+r4oNFrVjda?=
 =?us-ascii?Q?J17Z4mcOJGAQfw3iNxSGxg4P3T3liuPNQqlmahkm0k8BxzJRGv3k5/r+RAFy?=
 =?us-ascii?Q?UwtK5uiLk+Dm+M6VzN408QLBr6bffLPi60EkKYM8MSvbkFMRk6qGeTK9yONB?=
 =?us-ascii?Q?SSQROLspc90jnlM+08yeu4HkKGgbxaSEyCaJgBOTZ4AsUH37V6zJPdlyltg0?=
 =?us-ascii?Q?LbAuTVdOf9D+2xN4FBoUFfD9ckQ9VTI/yW31p5PazplliBkx3IMQHvAA64M0?=
 =?us-ascii?Q?zhYO0oEFoN3YKj5UJPfzSIyxkJll0cLACanRlSf8Du30hSId6tWAHz4x2tIA?=
 =?us-ascii?Q?YVpkXZvpkOsF1BjW8cvLaYoCmo/l8AwXJdjMM/O4JSbNvsRtJVgweTccoPoP?=
 =?us-ascii?Q?XjBCGPeP7ta4FBNtfO52QPhdP001HkjZYMWso722ToDQ0jLQ2/k/Ilukh3YQ?=
 =?us-ascii?Q?yVm4Kx5USEJlN9RCsnQ2BIvQ7ZVil6pyxTVcdKNs6PEak0G2NynH0WUhNQtS?=
 =?us-ascii?Q?6a4fLALW8olVOjEL8tKL4Po4xKpzglbp21319nWUqN4CFlSqRIESWuha6Wtl?=
 =?us-ascii?Q?D8FTm4j3jFtj1MwcY2WipPBXOBwnzfazdvnWQ+ko8Wnh9SZAzm1IJvr2VLZG?=
 =?us-ascii?Q?VOZwI/boM/PGBQXUQHvxWvqfkDXvwKsJH5C8yfKuCqe7DX3sYkStYW4ILsFL?=
 =?us-ascii?Q?X0dm4FGzXxEikOZRrOdvF5+s9QfJxVNB736FxmBvzekOdakjpR+AWoq+BHxY?=
 =?us-ascii?Q?IkR+/sYUqsyTHZuDJgrEaFm3v4HDHUcywQFwP5C1pcTT6m+YUXL/Idy7MWK9?=
 =?us-ascii?Q?GmPxp4pUWfMFmn9KK/2zJwnAr12kvoSKz0J0QOO/u2xe8OA5D+/njNFg8rwp?=
 =?us-ascii?Q?f7GJEtVG5W5NHGCE5xAmEFrv39JDGKJxaB423RJfHtfi9MTFV8NWsbSdnaLP?=
 =?us-ascii?Q?lCxL/Xx1K9ETEOTPbpyOse1wKDewl+ETCpE2DgFjf7u2M+Umj9Ya32O3QJuC?=
 =?us-ascii?Q?Z2A2UTM3g4o3lYTu1ya+UFTQe/hVL7QCz1BP454psmrZUJxvSjGKJw9EUHyf?=
 =?us-ascii?Q?m8X0GiCIgHjp8MTh4nOKEM83BnkGE1bG5yQyFtDOuXxuJJWpVdd/iMLM0ZWa?=
 =?us-ascii?Q?QprTrsRx0vJSucESld88Nr6xcMhWOQ+MHBe6KTjRPAmNEvUc+ZPVzRrTK4KW?=
 =?us-ascii?Q?jxkNZIX9UYLaYM14nz659LbUY9vmDNKuAXHJ2kaNziPkHq99/dU0/y7YoYW+?=
 =?us-ascii?Q?iNYgAngDrmFBtlY4bRBcJERLPAXAvo0aIbMjy0vFt9ojfkoQ8Nw9kq5hkOu4?=
 =?us-ascii?Q?/66+XhVnVHEQ9PNcWVIH8AaVrNrQrAbOSdFSuvO63LevXferOV+s2g+/jD0u?=
 =?us-ascii?Q?EfzuFZPRwuoVMeKHrDXetSGUhW6U/DpdTrdAzjtdqZR+Ljmnwqj1DaiwLlLB?=
 =?us-ascii?Q?4QMcfKjrxS0UFBcoL1L6Fj8FXmhAhWIoIe7AgAM7FTkQVgmPswILoYUNk6U8?=
 =?us-ascii?Q?Y9vTZ97zm9smBApVLu+rk+bLpSDXdk9+YMrp9tTW6zx9R3TCnFqn8+Y5vZf2?=
 =?us-ascii?Q?z0bF+2Coqc70RQXQlIk4nrT8HoDS52SEXIV0/NsHVEb2LTBKWh9F?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfdc26d7-618f-4df1-f53f-08df41be1c02
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 19:41:28.1141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Aqh1ZmZD4HjunQHkPaUn6g6qYVBZstdKT7lRCajYPBX4TumXtK5x6qq9m3u5KeDK9JcZlCtnoV8p5yKEA9ci8sndc0EFtcZs2FYKXetGDAM37oKGsoDZaISIuS+6gFLl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9281

On Mon, Nov 02, 2026 at 06:41:07PM +0800, Xiangwu Lai wrote:
> stm32_dma_pm_suspend() increments the runtime PM usage counter with
> pm_runtime_resume_and_get(), but when a channel is still enabled it
> returns -EBUSY directly without dropping the reference.  The matching
> pm_runtime_put_sync() only runs on the success path.
>
> Each failed suspend attempt therefore leaks one runtime PM reference,
> so the device can never runtime suspend afterwards.  Drop the
> reference before returning -EBUSY.
>
> Fixes: 05f8740a0e6f ("dmaengine: stm32-dma: add suspend/resume power management support")
> Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/stm32/stm32-dma.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/dma/stm32/stm32-dma.c b/drivers/dma/stm32/stm32-dma.c
> index d3ad78562..2abe846a9 100644
> --- a/drivers/dma/stm32/stm32-dma.c
> +++ b/drivers/dma/stm32/stm32-dma.c
> @@ -1743,6 +1743,7 @@ static int stm32_dma_pm_suspend(struct device *dev)
>  		scr = stm32_dma_read(dmadev, STM32_DMA_SCR(id));
>  		if (scr & STM32_DMA_SCR_EN) {
>  			dev_warn(dev, "Suspend is prevented by Chan %i\n", id);
> +			pm_runtime_put_sync(dev);
>  			return -EBUSY;
>  		}
>  	}
>
>
