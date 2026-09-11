Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010014.outbound.protection.outlook.com [52.101.84.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C29B49B5DE;
	Fri, 11 Sep 2026 16:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789142736; cv=fail; b=X9TgHgsWkTj2GN+mK2/tgw7KkHmYy4L2ut32HUGFOsRToc8SkA3pGc0mvMhGqrgVbxdAduZo/nTmYGu2vjCs+OO4omCwIPSe1uiLhUNvuRNdQxTw49Yy5HuWtScC7JD2ZSyfuxeK+MnQJCcu2mmNICadOlPIxfxAP6DGdbMpOGo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789142736; c=relaxed/simple;
	bh=dB72pByCh8zenzFAGynHY32cBAypGYyyCY9bKxrIF+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cyFhehlLko5MlxCjemGMLJK8I2q6wQNKUcPY2iSRG3ZhBccEzpwvUATqMMhBKOXp4yRnBgMysPPVNmAiIvLFxeYKKq2hbtKuiq5n6LwcgKdj2cCMpsX8/X5ZhLrBfPfN4JDkDaJrFCv7Vi4kuTo/bK+vXhn9yuyQ9ENfT1+zal4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ala70avI; arc=fail smtp.client-ip=52.101.84.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ala70avI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BB3ZG58xVID5N1RVvsHXsnHn1W5mOl8B5R7ooCEMFm8JE/DEzr09GEe4rx7zGcQUc8JqofQsxhuPq6+b01Syyqi1Hgb3HQL7WZSmJQkNppYWzd8/EslriYPC9I5wLy2zw72gM9hX8ZhFQdYNVloSR4EtzM6u9vLXfwBNWxjB9Y0EuzN+hdK5xm/+DfhEJ7FejdaL3eZRK5dWAJZHOUe43ayfE3G+PWEH8xQQcrC6kTn65CSFR++EduFjJqwuxdj4TcPwWDFju6oI9AOm0YxiniFnR7xZe+nOBQ4NDPBZrv9thXcOTPFaa0xCM7NQhY0FUfiM30lIB/8Fi0ohmy4+QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RH38eReygpTu/JWUVqdfYvDd+tV90x+oWIja5IyKJqQ=;
 b=sGDFSu3XjVdWIGe/c9owIO1hGzQbAgjmlVDzxnryLRPzwZbxwkWUn1Ycc+kDWQTBokmiuHIZlRafUdA0w0Riq11i/LXLGBnOSaZWfMWliRUjth4pUQh9+E2hF21SI4DxyR1Sk9ulfMZcohrsenHeGIupVwkss5T7FIQw1LzkJ1AtrhOA5fIsPje4c3ef7x29Ay/FYH1qhPHJmpew7GGvcA3b/DKu6cAdFsF3rZcD//Qsxrp5URhqwnsrmZN19Dw3dqJirtR6FOJj9T7+QXSL22nkiI/ehio1DPXgL63Vb+9iKG/3ZYOlYkyhBTkEBKnrkqyO2O4q0iufkixGeLz1kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RH38eReygpTu/JWUVqdfYvDd+tV90x+oWIja5IyKJqQ=;
 b=ala70avIjMJNHXSOJRL18JFbH8P/Ct9LYR0ik9V0KdIdxLvHRYAKiIJrO0eq7HAjE+LzyLOk8VXOVUcREJWBqIVClDiJnsaKQU4WxEm0eBwso3RkWmYnFL3L7aUZupxKd2KX6wrsRCNgUwUKAOxkUbxuXqdbFGN1LnZrStdP+J10Vz1+Xrrt9AFEIiIzXj+oDEeZEIROfTI8qQ+9jrDRaBuYMvKsuNK+kV+BaPRZmXsE2agv0NDBP2IDStYbIkLY7FqaRjwRyJFFV4f34gFHMtB9ZTSPRyiCzfC4W+LOvkoE6CdNHhChC6Gts89VtUIdim8qYh2m5hhlmv3dvRxBtg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV2PR04MB12632.eurprd04.prod.outlook.com (2603:10a6:150:369::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 16:05:31 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 16:05:31 +0000
Date: Fri, 11 Sep 2026 11:05:23 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, Anatolij Gustschin <agust@denx.de>,
	Yuri Tikhonov <yur@emcraft.com>, Dan Williams <djbw@kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dmaengine: ppc4xx: check dma_map_page() errors in probe
Message-ID: <aqQmw0j8-s5DEv9v@SMW015318>
References: <20260910214334.86689-1-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910214334.86689-1-rosenp@gmail.com>
X-ClientProxiedBy: PH5P220CA0006.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:34a::7) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV2PR04MB12632:EE_
X-MS-Office365-Filtering-Correlation-Id: 379d7819-9aa8-48a4-754f-08df101e80ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|19092799006|1800799024|22082099003|18002099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	ROD1uOcSC9+vHWkqQyeHtlm4QmHXZuClU2G4HmoCa2j0DlN9HqAalYI/GcqOReCTdTrdTFs6fP49+17sXwz1AqDNTqyBqJqSu95WCwqPatAtrcBh7Wd8Uxg8sTX1S06Tv2hU+B6yX+8O/ucPKS7JFuVPGNjQvSKmLQyQtwrfmCOvQ1Ty9Dy1yPC6paApTykURyrsCV1TcKvnFn6Gq9UIK3WHMirRUdJaknORZzQNulhrqcjvRsDrDU5WtoJABikDsS8olpFtBbb3f/meOyBDxcwVxI8R5+MGl2m8WnIlwTbOhd3yevB5wAlEykC+ur9Fw1vHYBhrILR2dezIkDXqvqPC4Hvt8SbMB2bbz9dkhOYuhAeegVQD2hyqC8S0TS+ArE71SpuzYq0IqLPDMBFRHURXfUc6AmwZAWOqK0CV/9tEbAocFgx8NvVuH7HAMMXytaskjEWe4CgvsWZbt3CTiNcVqV7cwXqsq54i8EyjRun6qAKB9rT/AUHc9BmAbrI88LI09oegSIf9Cn3pV+denorE9QieAt9INuI+KgX2utjz+IqOUSVi75FrzduVLJjhIY/qhF4Ovj9meRaQfkd9KaEGeTxRfPqrcNSeLV383HbBITNIn32hqdlFRptmkVt9LvMoZipKaN/FX4o0GLuz/iFbktLYGKC7sXyrVrEHUQ4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(19092799006)(1800799024)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jcQhRFJJwwQSkVj+rPgBiKSlAvUAUg4FtRQ8irRISRI5wmA1sJmqnPjGOYMV?=
 =?us-ascii?Q?N+G0o3AGclTxTdm+qvOGA/IVIaa48IFxanOyHvU5OCDR/Vb5ndjguSlbbdYN?=
 =?us-ascii?Q?yRmAI8j955Ii21b5PuiNtRJGG8D/80EzEzQXoFuAqnyUhOy/19CCDdeRm0rO?=
 =?us-ascii?Q?qpdEABWoWmaOhMyGo4pKZCpUu2XCoyHUZnuWzErdWW/K9uRfKnEEH0xbS/jH?=
 =?us-ascii?Q?wTS2o5/z19QU+euJ6TdDwVf2TAJ/Nh5WXCQoLCin6cLftfb+ShR8WPTz6HkE?=
 =?us-ascii?Q?XClrfp30v4V0s2c7jkKNTLMbz3WIuiVgKEEphgWz/UVq1xOM4EwrBXsKtBLJ?=
 =?us-ascii?Q?YwxyFJLrrdR6tMrF7Ai/6w2WIMz2CGD+u/6IakhzLegm/f4EHQh8hrOGT/+O?=
 =?us-ascii?Q?4dv+zHTy0uQuDXzqqTnIVqP3nfOQO8nmzkCBcaCRIgNCKsit7DnvvEZMUypF?=
 =?us-ascii?Q?RvQsg0+1Yv1zdzzKGF2p7mZRsWNyDWFu4Q9M0+doc96F5qZs92n5YLvXaZ13?=
 =?us-ascii?Q?E64/X/w2GlcoT9GwnkY8m9OSdI8Sonhopjco+yKKQbtSboBVw1rZcUl9gN0N?=
 =?us-ascii?Q?PzBk4FFdtEwFe3EraD+3tehn+Q19Pl5ZOMgWFTH6ZfKaLIuiE58s+U8F2isM?=
 =?us-ascii?Q?8Ag1S7WhIl1v6GhL+neyQcGGDOzM8qHWa2U9uIDiiFiA140XEnJ6a02zasz3?=
 =?us-ascii?Q?YGjMPrw0hXnaRk+I/25fM2Wcc/TAqa4kWxTyP5fUoVS1SvxjrrIUiwmAnhQx?=
 =?us-ascii?Q?CZcZlKfzvllGIkkSh07TvbHTeVvMFxebMrZEiLIcE+WmO01baNCXfbW4mBab?=
 =?us-ascii?Q?ta+GYH31rZAMJWntk6c274UOgEfOjVGp8N6TMRgmYJvOxsC/LeozEJ4meZUa?=
 =?us-ascii?Q?5H7WJis0nkgTPAlkUbWB+GEQmMOoeYqcM0rW2QWFVlOVDUjL2wLtFg3wmN7f?=
 =?us-ascii?Q?TwkGt3QTfG+aujIiA1FCBiSpKf515YACW1ldHhYkmn2RQ03mTsRc/duiXQja?=
 =?us-ascii?Q?Sm94wOiCPk020DHkBIjZL4pu61znRjxnIftnklfMtRJ0JKrmizHAIghR08aU?=
 =?us-ascii?Q?V4hkGEmMhYnu/rTLK8tGHpXb4f4/xkGbn2dhmRntAkccatAJXwKeKGnW2vA6?=
 =?us-ascii?Q?yO7Tnn1zD63BWgcNnFs5IVEgxDcZ6jBhV3cyigWuU4w5QDFLePqnM1vjDPVs?=
 =?us-ascii?Q?NuICJumWTu29OxuC/y0oYaeGJxXGXMInGS9Azhjjv4AM9iTTIJIJXFM1203J?=
 =?us-ascii?Q?f2FTyqp7jK259YSqYdungw6/kg7O0rrmEHXs1HI9S3ymss1mDacdUCPvecf+?=
 =?us-ascii?Q?QZUjSFClm/uFh0UvZUXbs3xg1UEAP7LlDHHNCHOi09tt+7Br/fgYSh2TMX/U?=
 =?us-ascii?Q?R3hdhGHkwiPwpsyfAwDhuVfYPDdg3F3io6vA8VTcSqI7tRCm8ukYfonJ9l89?=
 =?us-ascii?Q?oNRpPJFs7nYePQC0C+GNEhrROL7NHIafpnq1QVp7zWB96fMWHWyTI0gvZjtY?=
 =?us-ascii?Q?P2NV7ykxh/9rBbZqVVxCROm2vDaNpnhLVtWynPvy2ix+73+2x4dZAiKgIjs+?=
 =?us-ascii?Q?UhIUUHbhHezFw71lcR75tJcOR0P5WVRVk+hAG/4nr76NVpREQ9vXxUjuqmgY?=
 =?us-ascii?Q?FeOPwOJPgBXIXlhVgxHG8BVJDV7iKK1IdsHxdeI7VNC+xOGdcW+FdAbv0dn3?=
 =?us-ascii?Q?LQDS8cS+eZ0LWttkx3bwxrKO4qa649JIW7/CXtDN6oT8/yVD+nmmPY0eE0/m?=
 =?us-ascii?Q?OsC+IV0usSLTnTLD+x0uLB2HDvStT2oj//h9RtzfCI8BTBbt2/oL?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 379d7819-9aa8-48a4-754f-08df101e80ed
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 16:05:31.1219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +UtD717W3htz10rDX5G4vK/qS4+8/Kjvqv9IdCcRpIscwYm+FxzAa0g8yaQ2dLXxxx+Boo16NKmDS1lfWIivnKDCQTnRsVMpglV5qjjWDX+VJLN/lXfvUIXArACgv+Uu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12632

On Thu, Sep 10, 2026 at 02:43:34PM -0700, Rosen Penev wrote:
> In ppc440spe_adma_probe() the helper pages are mapped with
> dma_map_page() but the returned DMA address is never validated with
> dma_mapping_error(). On 440SPe the mapping goes through the
> SWIOTLB/direct map, which can fail under memory pressure or with an
> IOMMU, returning DMA_MAPPING_ERROR. The bogus address would then be
> programmed into the CDBs used by the async validation and
> mult/sum_product operations, causing the engine to DMA to or from
> arbitrary memory and corrupt data.
>
> Fail the probe when either mapping fails, freeing the pages and
> unmapping the first page if the second mapping fails.
>
> Fixes: 12458ea06efd7 ("ppc440spe-adma: adds updated ppc440spe adma driver")
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/dma/ppc4xx/adma.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/drivers/dma/ppc4xx/adma.c b/drivers/dma/ppc4xx/adma.c
> index 279a431ccae3..89e778896d7a 100644
> --- a/drivers/dma/ppc4xx/adma.c
> +++ b/drivers/dma/ppc4xx/adma.c
> @@ -4156,8 +4156,22 @@ static int ppc440spe_adma_probe(struct platform_device *ofdev)
>  		}
>  		chan->pdest = dma_map_page(&ofdev->dev, chan->pdest_page, 0,
>  					   PAGE_SIZE, DMA_BIDIRECTIONAL);
> +		if (dma_mapping_error(&ofdev->dev, chan->pdest)) {
> +			__free_page(chan->pdest_page);
> +			__free_page(chan->qdest_page);

put these to lable out

Frank

> +			ret = -ENOMEM;
> +			goto out;
> +		}
>  		chan->qdest = dma_map_page(&ofdev->dev, chan->qdest_page, 0,
>  					   PAGE_SIZE, DMA_BIDIRECTIONAL);
> +		if (dma_mapping_error(&ofdev->dev, chan->qdest)) {
> +			dma_unmap_page(&ofdev->dev, chan->pdest,
> +				       PAGE_SIZE, DMA_BIDIRECTIONAL);
> +			__free_page(chan->pdest_page);
> +			__free_page(chan->qdest_page);
> +			ret = -ENOMEM;
> +			goto out;
> +		}
>  	}
>
>  	ref = kmalloc_obj(*ref);
> --
> 2.55.0
>
