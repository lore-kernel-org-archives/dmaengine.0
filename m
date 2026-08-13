Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013019.outbound.protection.outlook.com [52.101.83.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD9E345EA2;
	Thu, 13 Aug 2026 16:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786639165; cv=fail; b=NBcdxv1SVfS4Gdom4Cu/AzH+G5u/sq2Y+VWEK1Vmo6zzlt0yD/FeEnrOD4GtuqlXmHOV5peh3/q26ZPBiD6zfh6YlCUuoKx5J990/nOFMd/8Wj7kQKpw2bpQSiPby6K4FjK7GkMaus6YM2KScEWoqcRxbHZipSi5HBnWQf6lUKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786639165; c=relaxed/simple;
	bh=6I0dx2FBr/qVJgzgAjHyjOvvDOrXSc4+j4hC0dXU5Q0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=garyOOX68P9GUQW0TxsiUHyPEUlnSTNESKIpPmV3d7oMeBXqMnOCpsU7/zlkDYqNXmjAk/uG7UI7kjLuYMhZTWUAsxCRlMEK52FcREfcPTFsjA1Ac+wyDQnviIOX+OiGTa2HDoKDTwMRO6OHKOpcjW1UndEF+DWE/XLjkUVze0Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=J3MdA5Z6; arc=fail smtp.client-ip=52.101.83.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="J3MdA5Z6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lPMP1J8PVci5BseqJMhQshOIyjLPcfiNoiU/V+9YeZHkVeeYlfQi5BYhbbI6vHc/ph3NtWA/K1ov6ShMA0ma20cLOJSEWza3CIBbwrf9QBhHXTS0vVd9oFJHTu6u9t99UL6K7MZmfZiFb1TIgbS6Hvnn1zXjFyYyqdr8bJnM8rwnDTEQb6OVdwMn0WQu/AfW7O/oL7KDNZ8ysBZ9kfEq3mLXTeXkugdXXnHML06YCmpoDh02BYRxa2wyBPSiuuN4INocOkvqlfnMkLnIn0PumGZmh9QLVhrDW+RTFjjlu/YkE8Cq3UFZGm4QE+ucv4uTkldG+foo6bhh3G6AUufHyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZHDPnklfj7/hhn5nVbPHhogcHw8/ua0b+agE4f8OlDw=;
 b=MPyWg0Xjd0PRgTz/GC7hfzEAW2bbMJiHt5lmtKwvZpBCaNYmzVCM3LaSjKqz8Mz5hKg4xScL/CJgv79dCoYWgRRT5nP0krVwXoFLPToJ+pShntVd2aTeUaS45n7ZaLORKGgwHaSqk6bjgQhEY5l6hrraLyy6CEn+qCO00rMStNHeZsGrsyuBvpkmzJHHgDUB1JOhL0+AHZ4H1/1SacP8WFH54YDTRdZaH46vlD/9uruKnNL5+qpBfIhhmz383t4QvWtPj/oHFEFOf+9qGszn6OfmzSsgnrVVwmQXE87Z7gg6RPbXmNxCqnbneQMO+S5DvUxhBts/ofH36eDG3D/yIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZHDPnklfj7/hhn5nVbPHhogcHw8/ua0b+agE4f8OlDw=;
 b=J3MdA5Z6kGuQoW+iTdydTOiHCFeHLTWPUtV93ZMP8Ag9h2wlqU01P76UhfZqYXPGDOtv8kBlUUgCYv4EOX+JDID+5qs3ZLIfty8tJYL8OBvG5e9jnXn20Kk3TxiIp/kCmcaVVWKH3LbcpRCw3Vp5b3DQtVWcgAtRRWIa41hkqFWFj4jvCsfa5U24KTpFyhlVoRSRvCr8FKObFLd8GtrcIPKXZb+xX4IaxOlfr76vilEkb9++0kC3N21xEXQ0nFDYETNCU3IHKmITFY/RSZvyPowI6aZEs8jcLadUPGlakHkFw/5FpNTbK8kMIpyn4lm2STbv3uUNZDA+Dovs1pLs+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com (2603:10a6:10:623::11)
 by AS4PR04MB9458.eurprd04.prod.outlook.com (2603:10a6:20b:4ea::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Thu, 13 Aug
 2026 16:39:18 +0000
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de]) by DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de%5]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 16:39:18 +0000
Date: Thu, 13 Aug 2026 11:39:12 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: sprd: fix clock imbalance when enabling
 ashb_clk fails
Message-ID: <an3zMHoaxx4XzvpK@SMW015318>
References: <20260813105354.2577040-1-nagachaithanya9911@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813105354.2577040-1-nagachaithanya9911@gmail.com>
X-ClientProxiedBy: SJ0PR13CA0171.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::26) To DU4PR04MB11791.eurprd04.prod.outlook.com
 (2603:10a6:10:623::11)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR04MB11791:EE_|AS4PR04MB9458:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a9e952e-534c-4c18-a6ea-08def9596b49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|19092799006|366016|22082099003|18002099003|56012099006|5023799004|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	1ULO8CynMOLoBvWbiFbja5pfUJ5zVNBHkXwkW2kZMKRl8j3pVggTLnnpKNd/+bLiYEWa69PSWbs70kqrP6VoE8+JCz0I+ATcDLKDs/yIhpdFKcFTBBAoQUa6EXQl3202BHrTtx05ngjv0L0kLspRRKWdu/JskexhtvCkSXSzVt8JGLtIguNmvZWHeDkBhL0UGdOlfmzQES7U9OKM6jcyaP0Sn69yDi3TJTLZQEfemY1tMWTvKqePJ96OEe+sQLpGm0V2bNof8WqryT7X5omQoOykBDc7k0rHc/KWeRMzMNMxVdTlFVAVCveHTTJ4cmMIpK2jqKE6Xsf778IskgI4/1T6NRZlTiYFVsW160mYf9AdXPSWwnjPTJ1c+gl8l7mbM8MYQrag9sCOy6iZuVCgiAfzjpSn1JC20vjM6SY30ALgcaVOph87KCeY9uPXVyLLT0nRx5Fi1amdimJ09Lxevkuw5g/eUrEcTdwtxO5Esixy7w16MCSQcrgUEXrKzFZxiDVL0dkaXtqCOur+UpepMVQu8y4ghojOik7OIAji7Wny5+adoJ6PEqCS1LG7ItZgQg1WzvV9ovbPsGX8ijwCo7KiSUn3ZVwP5TSFjCVl1eIZk2hDupQJiSsI3G3eDg5ZuSroiElKgcpyNSZDcqQwJuNUgOX5w8P27VcOETdXimU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR04MB11791.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(19092799006)(366016)(22082099003)(18002099003)(56012099006)(5023799004)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pHkkFbdc5T3QOzunWTE+Qd7yLrc7Is7euth0zPEDmu5m+aUZAjWBrJm99Uak?=
 =?us-ascii?Q?I71GbpYLKejaTcA6TNX1HfjKbKmI2ZRFUIp+jMzikYoPdY/xrMfB9BAvHHVu?=
 =?us-ascii?Q?Et81s3bcLdZBdsP2xW4bBon37wvEXHGFGHA9zTU2WlZCoIj61OMDWbuhki4Q?=
 =?us-ascii?Q?87pKBObaarQISEitrzKFo+1Bg5CQha0T0KxbOP7vSXFId8Cwd/T3xU7kKe14?=
 =?us-ascii?Q?c473eT6MVwJHBvPuyekR8prAdkjAoWfS4eKi23N3ciOtwRrqSJnc0K5mGg26?=
 =?us-ascii?Q?ME49ATNcEUjSZxLAKW5ng0oTjHCTM8tQf58Nq6ElDjrRkA7PjZegkq1C+TX8?=
 =?us-ascii?Q?kma1hfCAgiIdAGahJeLorNHJAq9ZAMV18iJpYmZP33C175kmP5QmnCW4JxG3?=
 =?us-ascii?Q?hJ6NXfCVab5ZCHsHE8phtAGWMIKajf3z4FkMir8quVy+iYnytsqR8IQVbfah?=
 =?us-ascii?Q?JdhTDIMCj1OJyM5OMc/ya0LYcINoZWx3ub/MNFHkjdtMhjRNnFiw4hgrMpre?=
 =?us-ascii?Q?zMgMh9dGdtjY+rVxvGwCY5YQi9YMKZ+EgI8xejRF+c0x+Bi4NPd2U74JAO/c?=
 =?us-ascii?Q?QtAViV2wApJf9IshNs1KooM7jT5mhdgwZvdy0B1QcuQBzD8hwEVnYznMbm07?=
 =?us-ascii?Q?D4dfHOICt64LxqsXN6kgKtjGFkR6RlKcExkZqfSxXF+f1M8HDRddHxeMbQl3?=
 =?us-ascii?Q?6PRbUpobKqoXL9yVSh+5L3/NRp8p/YtgZwQPg5vpuEDPMTX2SISa6OWPOF6l?=
 =?us-ascii?Q?eHwpRF8g9pM3VcpuzWlTY9BIqZq4wevWH6GdMv29d6cdDsdnaCZqjsO7s26D?=
 =?us-ascii?Q?s0rchrP0y5ti9rPOlViNJ+UX7KHbQyppKZKqEDC/Cn0FbLsOHpuSYLdEwk85?=
 =?us-ascii?Q?fRrLiZs6Dq5neCBK59XMRwem+iDiU5Cn4qKXKgD8oyYpajjzuX1ghMoCP90s?=
 =?us-ascii?Q?kg8kyhJHftf8qT30abrPtiIhf+TyjlINHrhGHE1DVvUYfIG4cR/E+8LdGFU2?=
 =?us-ascii?Q?r4wTCnDn9Mvz2qBBnGZG/fkiZFrLOD2A1lm6+vvtiSmEEuRHiNd5pyxDH+Pm?=
 =?us-ascii?Q?fZUCphQUNfG4MFKKlCy0xDcjjJVWHd88/xduyzD8Ac/YHn1gs0S4ZY4DUeO1?=
 =?us-ascii?Q?6JICsk5gBfwuUdgrcVuFXFqKiuuFtURTecKteRtNeRoN6MkaTyw33MzkbJKb?=
 =?us-ascii?Q?gTaAHYNMPAZP7+z7Asi7kgV8xKVTYwlNGd6zxqKTk2m/D6KmSkVkqlf4GRc0?=
 =?us-ascii?Q?6muH81gPsNSS4WNg5YmZoWtNjzwosL+O55NELI9C1pJ/mGfEROIDtHCfR+tV?=
 =?us-ascii?Q?Ymer2jZszk1dmO/qEEuNT1cR7to+63J6yIvzlFW5p59Z2gkxYe28pzF2Bom/?=
 =?us-ascii?Q?DMfpfCt7xcga/eigWK51S/eVW26AdyiWbLPvwyWjV6M5IGIMUODkHFLkh2sc?=
 =?us-ascii?Q?4NGsgQBks/yolzycGcie04hM38icHlHkrS3vviSzSLgqDZiquVhZJ3cNJ00l?=
 =?us-ascii?Q?/M3KzUG9Xm6lcSG4FVK7dAzJXtMsk0um76A8d9Y6aCpygFCCBnaYi9IwQjeo?=
 =?us-ascii?Q?Djb884NKXMzeH0ja4psTfRXeGGHfiYBDvRjLO6v83E8UOA+/NoH9/9+J54NK?=
 =?us-ascii?Q?JiO7u3qqY1pOFIgAzbAZk88CtimH7ZE3kE26IlxITd89kFSOeTkOVZo6VYbV?=
 =?us-ascii?Q?FJO0Bql63W1TCs7CNZtaP3jtUeoos545lzGIqlBXex+xS+k20sSE1Q7C+Q32?=
 =?us-ascii?Q?SI3qGjCQDJVG6++9XW7sjClEefZeO8AukA4crwWtqLitJzbWppQv?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a9e952e-534c-4c18-a6ea-08def9596b49
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB11791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 16:39:18.3094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uCTYPECzcVVc7pyPrfElulObPxgo6nj/LQq7HE0KaHGOm5+MKWWJSpLfKjCCxcBuWv+XFWIThu3pMJC4cLsc70FXArj9p6kg2PCHmANrwCxItkCGxiqXqFFZyoJcK5gZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9458

On Thu, Aug 13, 2026 at 10:53:54AM +0000, Chaithanya Lagisetty wrote:
> [You don't often get email from nagachaithanya9911@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> sprd_dma_enable() enables sdev->clk and then enables the optional
> ashb_clk. If clk_prepare_enable() for ashb_clk fails, the function
> returns the error without disabling sdev->clk, which was already
> enabled. Both callers (probe and resume) treat a non-zero return as
> "nothing was enabled" and bail out, so sdev->clk is leaked.
>
> Disable sdev->clk on the ashb_clk enable failure path.
>
> Fixes: 9b3b8171f7f4 ("dmaengine: sprd: Add Spreadtrum DMA driver")
> Signed-off-by: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
> ---
>  drivers/dma/sprd-dma.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma/sprd-dma.c b/drivers/dma/sprd-dma.c
> index 087fea3af2e4..3ea5c3ba1a8c 100644
> --- a/drivers/dma/sprd-dma.c
> +++ b/drivers/dma/sprd-dma.c
> @@ -270,9 +270,16 @@ static int sprd_dma_enable(struct sprd_dma_dev *sdev)
>          * The ashb_clk is optional and only for AGCP DMA controller, so we
>          * need add one condition to check if the ashb_clk need enable.
>          */
> -       if (!IS_ERR(sdev->ashb_clk))
> +       if (!IS_ERR(sdev->ashb_clk)) {
>                 ret = clk_prepare_enable(sdev->ashb_clk);
> +               if (ret)
> +                       goto disable_clk;
> +       }
>
> +       return 0;
> +
> +disable_clk:
> +       clk_disable_unprepare(sdev->clk);

Convert to clk bulk API.

Frank
>         return ret;
>  }
>
> --
> 2.43.0
>
