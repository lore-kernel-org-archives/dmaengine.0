Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013057.outbound.protection.outlook.com [40.107.159.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A99D4A205F;
	Thu, 24 Sep 2026 15:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790264075; cv=fail; b=O8cAZITrPIYtQtHwX8prXD74HfEmo6dFNG25E6vzRQdaPxAJESwUaa/ztjqFEKY3FgH7SoidUGtOOp75JCxB2H8Ii1JWTOAQzT0NqO1UlU7KBkkNpy++IBscYpzyJUotn9Rc919RqP9why09OqMILrEiM/dRi/eGuuL5BaWQFHQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790264075; c=relaxed/simple;
	bh=mlsr+KVbNAgQxqpsRZOlzWZ9toKE8DeS9bcKOvCtXpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LFAe1rtSMWA9gBFAtqlgCwybzKiEteNuVnhxXi3zX1Lky/qjAJ7uaUo2h5h6NrGH5THk4OTpHJGofta5temyGkEchJ412Sm3UO0qCPX+tsfwE65ATMr/WpqE+D67WlenFZ0ECT7wsaWuB9xTRclVDTeI9KtTaBV53ksHuDhheTk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=LUOlvDx3; arc=fail smtp.client-ip=40.107.159.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="LUOlvDx3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dDhpRIEu2rwsF1xjPUbfOR2ttBmwt31aY3j0yPf0b11LW3FX8lK9c40uw2lrToBzSiEuwwhoSUm2EM/tYz+ug5jONhXofGW0cCMM1tcmY9i5RMAMf8wQl8iaf4q4Ms006eSXErGLqzNhfm4CkYVo3xG3VHCR9x3T1EZW397grhZovDei/3tpSHOtzpeyS+3PRWDbq7eJNCw+ryxiFLaUG1zfIHxaKizrImtPJuN8jhoRcggKtYyPLX+C4oCTCVqUoTy9EWsNlSNKM339fcMz826RiPf/H3B6H6tLEDHlrVLZdyAqSoM7dYcbowy2eySC4E1C1DWOtad7PzShvhhtBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sz4hTngUJ5TS1cVCOE7kG+qMRyOqgOGe8H6q9Lr1qgM=;
 b=qTs3hqPkCHVe48Maeae1qd5n+4M8xl2KitbFPR4vS+cVKtbL6tovruCruwyfD1zGoW6s4ZoL7oE5d9Zh2EL5T8dYzy6E2SD9Ly5bm23yy2vCzc6FvylCGWprb2N1ekgOStc93F1Xm/FLoFGRJBmDfmMbdG7Q8ObRqkvGLzxjCFDSWNnP4dagHyV1yWzhoXGeiuq7tACAcL6Xi6UH/tGkpOschRV7q0TP+E5kdAE+2J17VD2nIjv/lOX6KSWFAHmKmSjr8+kC7BzcR9og6pgElOFG72surQ/I1Umq3r/PZm92JYmVOXYznEtHd23PvOpj6awBWLrbZf6SC3dZwERuoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sz4hTngUJ5TS1cVCOE7kG+qMRyOqgOGe8H6q9Lr1qgM=;
 b=LUOlvDx3pwrdn73xdQcVbRUmRmYMDViznByxF6K3OKn4au2oFKy56QXL6t8kHvlfEO/alEvKWabTgc53LKv8XMSv7nLAUCwFheXCihqJ1F9LFmwvD2KZR6/cykQleQY96zFgnXJve/50cVbA7juKD8rESnTHGl9KgcDrGgZ6ZUXVCSVJB6EXl0sQVzl+UdYjkQT2hA5elbpZrKbAuqUf7ANJM4RJUB3GhqGcwvS108ep7H9XfYJOX7jnRxbEZwywbRiTVQUN/qNzkbQCLf4RYzeXh8McHVmKEJAj7qgk1pjfDuXEJhKFX0TEYE8Lt8PON4zon9EA6jgkVZORFa5ubA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA2PR04MB10129.eurprd04.prod.outlook.com (2603:10a6:102:3ff::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 15:34:29 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 15:34:28 +0000
Date: Thu, 24 Sep 2026 10:34:20 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, phone-devel@vger.kernel.org,
	sashiko-bot@kernel.org
Subject: Re: [PATCH v6 13/23] dmaengine: ste_dma40: Fix probe LCLA free
Message-ID: <arVC_OUeA7xCEmVW@SMW015318>
References: <20260924-dma40-fixes-v6-0-fdb6755020a2@kernel.org>
 <20260924-dma40-fixes-v6-13-fdb6755020a2@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924-dma40-fixes-v6-13-fdb6755020a2@kernel.org>
X-ClientProxiedBy: SJ0PR13CA0159.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::14) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA2PR04MB10129:EE_
X-MS-Office365-Filtering-Correlation-Id: 2072e328-3ab1-4401-9e01-08df1a51524f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|19092799006|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	na6vJr3XvuSPdYLeVFnccpyTMnJRHn6h5wpQF3OCgwL+ZjIumYGqwznNeCDs7LJV+zASOLFPw+dZW4PCOJV54Y7t/kQP30/estNK7bjYTx2DbkZpyuBm1cntiJUk2upBHTjV6jo/8uOtIqEUM/oTKsLjuVlOM223zwz2qWyDY6e/UrcJpBiVGQZPMbLPfYWy8FdEB+EodWeJeQTrRqmN2lYYexhRJ5A5WdLFEFnFCNophc7pM5s6pBKDisQEzEi+E90lDWm+g68P9HzyuShC/7rUqNExLTV/KEM/gI3SMLwf53PbzhvxXtYKp7EccXfLv6ghQwpy3Zk9orUIOKfsFPYxMJ9pg569rBu2Tua4p2gRfUFkJdymQM8u5QmQu6mV+GCWorNm9B7ysqwM/lXInxgI0eoIzSk9wpwjll6Ow9AJ3wOsvwUmV1NOBZaZhTxacVt9C0Z9xR2naJpk5fTvZO14iHSaO3FwvJZiqqWC/JpQ543K3EY1KO3Gl96dRsr+HzR00OiEVXKVFUCbhsnd1z9XX0ZcA2EfpApFcBN9KBALGBN/Cou+9b7LbsjbCH9J5AB15xnbQFwqKDdt3syjP2WRIfnYbGW0v6RN0Up3vyTyjVesZWjvOYJAGtMWqCch
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(19092799006)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?h5wYx7aDytTRG0kW7MAa3bml92/07iwnVzQUtjBdEOW1FLyD92JAqjVTwXuL?=
 =?us-ascii?Q?FgZFpEEzRCx/Z/4W//1qy4Z7RvyVsIDMpZsQQUYDEhwa2lngXmLfUcapOcNc?=
 =?us-ascii?Q?vnCNRdknDQPp5hQSLDDwRxR6htaCofJ/wRzDfWajZ0zxF1d07lO8eoLvxBpi?=
 =?us-ascii?Q?4zDgLJ+fR0GXcjSLZIbeuoOVXW1JL33Q0SYMF725iz70VPtpA7ibR+vlUhn7?=
 =?us-ascii?Q?lbTzKkZwZTLRSrzVUdQM1iQeG+lmDbrPAnVTHPCUbjL7eVgsT70D1C9YWaFK?=
 =?us-ascii?Q?O0z2Je5QefKWH9O2fzr2N6AJI/oFQ8WDnOPGHk6QbXk6jEP+zcFYKEzaePAh?=
 =?us-ascii?Q?7IqVvr5xr+czAqpxPR6zA8KvJznDbOGX8qAUN2tgU80xlLy0MoTJ8sliTq4S?=
 =?us-ascii?Q?9tVU2C5GrMA30e/OwlPt70o1iRZvhCbTZkmQCyE6Lhfmbnt8f8mIkfRYMAdP?=
 =?us-ascii?Q?EyvjPSRokD6PemAerHZo6wOA39envbTEoH+xupRSLvELhMU8CBoAokol57ZP?=
 =?us-ascii?Q?eMqMJZhUYNLrzJBtOcenQ/db5K0m7rzVwhNMC+yra0UG9skE3Ll2BDoq3kac?=
 =?us-ascii?Q?PGDoHnVPg352Jv7m23Hh62Id0D11pKGUyu4XroH4telwpfKfSbEuZt0nFwVP?=
 =?us-ascii?Q?cX/kvxPmT7R7+3+1UKNJMeQzNVle3uvu/3g8EKUPYNiEON/RWj2z8V0lZ30e?=
 =?us-ascii?Q?XY+2ObhoU9TyUzkcKawL8G6YXEQnrGvDvzS44NfkS/63CAiIgWkZuKeSzr2D?=
 =?us-ascii?Q?sPGb6tKE3ADdEBGPh6s3t4ztZOh6tjmufvajjgYs6i5UkWO8z2VVZWeiQybS?=
 =?us-ascii?Q?cZlhlaSjT2k3ZR+bH7uGzi/s/Zf9sadIzIaH4RatXBDdO7GcWJN1GWOGdlPV?=
 =?us-ascii?Q?5f1Px7r9Z1TOpN2RiWxpiMJ40iVXeg9YLuFvv6S5ckBdcWt02IashtR75WBL?=
 =?us-ascii?Q?Bk+Df0220Ln4ZO8mjiAY3NeOY9LmjjSMTe/xQaSMTUQJ/v60Ms3rjNjziLig?=
 =?us-ascii?Q?4D5a4Aq2oq8E+QiDlSEjp1T4OOK6gHIcL3TkPHqlr6fJmjUMbaQseTJUbshd?=
 =?us-ascii?Q?plIehqODqTpou3d781wUdHKmOf5tyVHPKB+q4//NVFFhkGpJD/QaLumajA8l?=
 =?us-ascii?Q?GM2jpQz+uWPblrz3XC2FAb5De8lpSnMCz5OWva8bwTWzsHmRCzgfWlnH35Eo?=
 =?us-ascii?Q?JI13VaYorA9ZlgpzZR3HIKHactxk9p+B2ANO0HkqSZK/qk5n290POeEIUCGo?=
 =?us-ascii?Q?PDjCJ34MYfsr2iD6t+AmJRE3mdf10m8noE+qKV8G9SFqBXlayucWfKgPkH4a?=
 =?us-ascii?Q?t7swVAuOq8dmyx2TXa1VcfN7sAFKDtLyyToUtqogg4K4LeeitVM6luFnkdXB?=
 =?us-ascii?Q?OOjaym1Yb9vwaIU5+ySefd+FMDBQWC4/Q1qrryOSC6NjoXaAyUmyu9NSFFiU?=
 =?us-ascii?Q?K9CFz/1mgN4MisQuD+Gr4mF0l2aLCyc5xEbbT4R7/RVzTPkrjmlLlOoBaK2h?=
 =?us-ascii?Q?q9DwVHL39qNaSTFAN0Az1QRntlGwllOMlOJQgXiQdXaJcnZbb09jkDA/cf3w?=
 =?us-ascii?Q?VJjJ+gqMcE/bd/B+C6KOz6EkBXyFgChmmqliqtdxNCUkZyckc/Bz93faaoII?=
 =?us-ascii?Q?gD/YaxwgLWTl0fGGNNDY/tg+rQjLVVi1zQZuzNFI8Ofl5QpZovmEKj42Cc8Z?=
 =?us-ascii?Q?M9Y7CVu+YdLIAjeB06HVvH6CNHIkucPybToa9oR2SczxwSnHucU36/rNDxX1?=
 =?us-ascii?Q?XNibIuzdg/gMeIYq6SVo0woHts8rbp9/XkdRWfz34+EGcGOq0kpB?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2072e328-3ab1-4401-9e01-08df1a51524f
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 15:34:28.8424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yKlTNwRGSZsePaejcb4DixZIFB0sTRe1LgDU6gC3hBCI8yVM9ojliwaI35aWd7FmIEGtwLyGrpRiz/3nYuhbvCaeOSTmQPgW/sbUpu9p50xrdy0CmCbCDXCpeB1Kwhx1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10129

On Thu, Sep 24, 2026 at 10:35:25AM +0200, Linus Walleij wrote:
> When LCLA is placed in ESRAM, d40_probe() stores a devm_ioremap()
> address in lcla_pool.base and leaves base_unaligned unset. The
> destroy_cache error path can then pass the ioremap address to
> free_pages().
>
> Only free lcla_pool.base with free_pages() when the driver allocated the
> LCLA pool from normal memory. The ESRAM mapping is devm-managed.
>
> Fixes: 339f5041089a ("dmaengine: ste_dma40: Use managed resources")
> Reported-by: sashiko-bot@kernel.org
> Closes: https://lore.kernel.org/dmaengine/20260819225114.AE1511F000E9@smtp.kernel.org/
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/ste_dma40.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index 8998466faa76..b25e9ed5fcb9 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
> @@ -3913,7 +3913,8 @@ static int __init d40_probe(struct platform_device *pdev)
>  				 SZ_1K * base->num_phy_chans,
>  				 DMA_TO_DEVICE);
>
> -	if (!base->lcla_pool.base_unaligned && base->lcla_pool.base)
> +	if (!base->plat_data->use_esram_lcla &&
> +	    !base->lcla_pool.base_unaligned && base->lcla_pool.base)
>  		free_pages((unsigned long)base->lcla_pool.base,
>  			   base->lcla_pool.alloc_order);
>
>
> --
> 2.55.0
>
