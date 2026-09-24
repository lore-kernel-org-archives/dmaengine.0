Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011056.outbound.protection.outlook.com [52.101.70.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254504A260C;
	Thu, 24 Sep 2026 15:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790264621; cv=fail; b=PwTXj7tIgpOYOHlxRSUTPZjx1OnHUt+DkneBQlStiVHG2qja+NtEW9aB610JJhlDY/E8KngBtKac8we5ixb+NYb+Hp41VsOByk+MMBRMswLRnFy0MCIcVoKYPRAJ1kbYim0N6xZdI97hE3JuUm7Ye+QCatETFgUPDIloZV2ViBg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790264621; c=relaxed/simple;
	bh=vwX9JfTQSXBGDf9d/ejTLnDbDFiHJCGaEheUI/kDf5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ekJVlVQfXI6mMKwKLRXXg50O0klmk9S+nLs4fbt+BCyUjWoDpUpupyTWMOP2AgcYzWfO3b7XHbbqQpT60Rnn0fp4b9qXSZYMMvLmMuudy8UzrQVvWvQiCt1/+IdT1qlIAclgTlbJUQQuUAlW6Oz/OWngs5ngmc/tHfPIYjrdXLA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=gzJpQAy8; arc=fail smtp.client-ip=52.101.70.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="gzJpQAy8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rqyo+P3t4gv/tjaRfbff21pYwpS2Jyawm/UiSEGf+uMRAtqTyFkbZK21Sitkm0H+QJi0LEa+9z1G5mnEZm3TYumS8/CR3+tudfcMdbTbXSJWGgc5bTOgeQIoeKg4qTHF9XSFT42cmFmvGkxDRS+9L6//ZeYfaAvTS3JksSKSugJ6Qecx9raADEnHAPAWthQfQRBjXjE0fWeZtIqFqOrnvDX52o4ZpZdm2WpyO+5kBONGuHnu1i1rbq/HtX91Dgrtja9dsZQ1wsOPCCO3CIMlKzigx/YAsRCv0zj6LONJPY5G/i4roh/E2DieuoA83kDzgjrSfUniORx9XhPg1ZEUIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tq7FzVQmpuyWdB+EEJsgsv+5UYJhEqPpExclF6pyGFU=;
 b=jgeH0W7/WOxim2ZBazaKJnGidaZzVIFTZNhu7lVBwWywsaLZFj/UZpYYICqCNPEwNGqIwWRP4LYC+ZVxoZpRev+bSXgjWwM9Zhj4L8TykhuAL/NHCRyxew8Wr/v5SmZ8DtEN8edFca8Qcu+2Uorp32G32Nc72DArRtbrzuJlLU5sHD5jfhwkC8byghof5LXUkRmm7lyJfJy8g1mbVMDt1ejZyOY57XDkyPCclerFoHUlPZIOHIogRL8aL4wWESQGm7512WYIeLSEjwYesPtfSfK4pYS4t/iTVD2JUJKInL9Jw7YRHNdsj4veyuaiDWeRig5XgoKTsjviFS9pFq2wBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tq7FzVQmpuyWdB+EEJsgsv+5UYJhEqPpExclF6pyGFU=;
 b=gzJpQAy8oUTyQAMixeWwPcMmCsZRf3PG/xzWENlGzDL8INDFCdht2aQ+QAfyZ/ruXQi5C7ILHIZ2W6TA8gDCA+vI39yMGIRbPJXNokusCAOpvvRCnzwD6mX8YSH9QityaFUtvhkaegiTwya+onmpsa1cUpLXAYuin+gjkHT5N9E+RNiGZ51KFmT3KBCVdC6YhrTMZdtIsXRhfaxqZAQJIrSWRaDrgkkT9FoVUpHyX3F5RBr3SIdPGT6/NUhX/HCIK0m+q0pn/ew/+9ae/hCj9y7U6Mje2S+GbfLsSDAbuKC6lLSdi4rIBQA6/ElOKFLvf2aU2zBHVEdZ5rJGDZXadQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by BR0PR04MB048570.eurprd04.prod.outlook.com (2603:10a6:2c8:50::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 15:43:37 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 15:43:37 +0000
Date: Thu, 24 Sep 2026 10:43:29 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v6 14/23] dmaengine: ste_dma40: Put the LCPA SRAM node
Message-ID: <arVFIWoTCEM2FggU@SMW015318>
References: <20260924-dma40-fixes-v6-0-fdb6755020a2@kernel.org>
 <20260924-dma40-fixes-v6-14-fdb6755020a2@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924-dma40-fixes-v6-14-fdb6755020a2@kernel.org>
X-ClientProxiedBy: SJ0PR03CA0026.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::31) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|BR0PR04MB048570:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b606870-819a-4cd8-0107-08df1a529903
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|19092799006|23010399003|10067099003|56012099006|18002099003|22082099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	XJm/iWUR93RHYsafXyEXLJtpjLvPAQhv2XMs6h5cEyn6POTE6RbxFIevGsKw/qMG3GY8oHA/JYq74NpF96NWu7rZqLJ02gHyq8VWZErinsSet3EaAJvVFNyFUJOSgUj0zdRppKlwEmw1dkdfzGD53AZR1cqIb8hh6SbRYelBPPL7/TvCHfLV4+85pzrB+A4HnMaeYSFIbKrkViFrIDzQO3ZGIz7AwYSE3RhrZ2c3QcQ579TzFrNSNgbONWPVtcf+9ZOEFsnbETUIikQo/O+jvRQcSGnLnQ3JZss6SEdqtDbidkx0Z4HpXcB1Bojd4OaWh83f2MKRVwdFzaIFBKEFUD8KlxNts8WOhQT1qurMN9lQSGGqVYbGkubcm6maydIrC/xItaZwRiPvD0z+w25y7q0CHLw5xcTcBgQUFVkQhbsveRoS8g2EFo//SEBbWbdDAkhlSqXgl7A3J7PW323qgeAi1QM4L2sbCtUopApLFBY0Lj+OTr8yXsc7/bJFG40zGvOnrc5KkPH7FT5DQPqzkqFXGKy3P7gjCb99N707cXv9cV5bH7wyO2TaOLBxH7tiQsKDtqlh6yB9v8mlH27OccgjYmgRs3KEc6c1Oa9K0hu/A9qvGagP30fZAzmDNZ7rm5pD1Fy65X3ZbhDx7JQDVGxOkwEr64svmv9U5m8aGlo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(19092799006)(23010399003)(10067099003)(56012099006)(18002099003)(22082099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?61OmO8G2xjhTzkkv6c3jXY4tOk1MENJ8mNuLDTzKb4rgx+Bfvb6ZoCaYpi2A?=
 =?us-ascii?Q?mWKz/gIBUyvldRetKPgyuPPvVAS8zryMS8JbvdvHySXH47T08B83LrWlc6X2?=
 =?us-ascii?Q?wbvzG3AO3i0DRIKsqcNjnr6ab7dHI/KrHnjUpI24K7NuQczbvO1ul7i6EpOG?=
 =?us-ascii?Q?OY8zInA5zONlYvDGM7bSqHNUyhSCjlGIJjCYRiwaUHshbEtiFl8kJ+wd02/s?=
 =?us-ascii?Q?9PXgtwvEfrfpSOsGcvLzzlWeWMMhvXr/iT6FG6WDVIJFwJo6Va9Dsd3gm331?=
 =?us-ascii?Q?xNp0YlmFVcxreUlvHEiWtbs/CoUEOKMwcFiuKCMLRqeFYbov9aIuEODbuyzF?=
 =?us-ascii?Q?Hve754xgY+E31w5KLzcC8EPWjJDKg7aYbtqoabgw/cYxC0+n04kA3lO1D1if?=
 =?us-ascii?Q?czebz6ohyT20aAFM9iPqqXuJAOynD9+LXS20ApT/TiC53yQoZCS9I8Gov1iT?=
 =?us-ascii?Q?MXcimDpWSYj8genSdyRxtYDLOv2YuDWNK52ea7+DL3v6SeJk7uUEIMyIoxdr?=
 =?us-ascii?Q?HiRfJVRuJZVfWQOnfcxYiCPs7L9EH3+Fw9eM1lB8r3x2ZqXsep1skgel4EwJ?=
 =?us-ascii?Q?KakOZpa1RcskfuKOS/CsxQpI4J6lS19gzvtbIwTkxj88mLFhXhZ8TbuVN1SO?=
 =?us-ascii?Q?2h0J3c8mPlxI6nOvTzqjjwupk/hF8noGiu4ilvDPjVLNCU0kmjv1t35oCvhg?=
 =?us-ascii?Q?aFaNYsnXE1hyqR0RlTBfu4biGYTCt5+K8NeH+9ZGg+5kfjCTSSzK2Yo4i3oY?=
 =?us-ascii?Q?nTpreXLNynqiM9UmEPiBgJ0QJK1A1uhE4ATV24ujs6E9XHgHK0HaS2Gxsuid?=
 =?us-ascii?Q?XKHRMZ9P1bSK+vd/WGkmaOnXBONMVz8espjrfo1DSZoTa8G2XIWARrRJ7JRn?=
 =?us-ascii?Q?MSds/rhHOkc9YrMpyJ1RZJamDabBrNLPofvkn+6IQSuDZS8ks+rwl5C0P5Rs?=
 =?us-ascii?Q?PyrpUxUc/Cb2vEudajKnlUz2cGjll4hoaW/1DYL0h+/5oqk88+TH4Fb1krgt?=
 =?us-ascii?Q?HPMc1mimwDENBTSeEt+eSn35Q2ews655FMvVyJdQlJsCmJo68K+lJn061m/p?=
 =?us-ascii?Q?RnuRPvh9us3XTWFgRO52BHMdeT7mCI1hUjSuBKLcQc/4uYCDHtBc0FKJ0NNo?=
 =?us-ascii?Q?nxsQaad8A+J/Z3QYHLTN4H0rTXLbWRmPFYOW/lCnWzruD7PlaxWC2k2Dv7Ri?=
 =?us-ascii?Q?Qdpkn7yH4uq1/OjmH0+cr/kiKdHM3wGVujXgfK533U52QXitG8C+WepyBzyL?=
 =?us-ascii?Q?2llwRr5Cy1smznXQsxqiKeOrnofLvINwhjiZput3guIQMOeJh1UzpPZhPpX0?=
 =?us-ascii?Q?gO8k1gr+E82Bn1QzFcx3pxb1PzZFS3oBynaVYMftaDqQVV3Ut6XbpLKfO23B?=
 =?us-ascii?Q?fCdhbgAnUatIRGb8celJVfcc/nkaJTl075oUtq+O0Re3j9O06sZ70qFFRmL+?=
 =?us-ascii?Q?mOA6nOniCwC3EhFx7q6ntrjKIYeYPg+59XsE4Mg/yh0fkvmJsl3XnTB0enlN?=
 =?us-ascii?Q?HSiwgsZGiTPMCdq0Q609ISQCSUgZhTqyo2qxzGpGF8SUz2CrbAxRvg2jorG+?=
 =?us-ascii?Q?NjmU3LmqUotTc5sCszrRk1yukpTs/nP5JHjONVIrYa3dXjoxHdveAWUr+W5t?=
 =?us-ascii?Q?430Ci6OgOzGCD5o+ghsQOw+5RlzEb8ReuPnW9xJ3A0GOM0DPvrE3ipJ7UmCq?=
 =?us-ascii?Q?WuwAGJL9gVJAVYhhluM2P5GLRhRM5lD2qgitdI1FbE4ni67zAm1EoO58/dL7?=
 =?us-ascii?Q?S/aL/icXnsJsN1Qd8SIE9i6GQseAK1Sa85fHW+amRbT94TxiprxG?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b606870-819a-4cd8-0107-08df1a529903
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 15:43:36.9499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 27SYNflBy5nJ2HR+BgVRuN7gkchMf89pPlmIb+YHA5ogbjFj0yUJ+N76VRsIbNIPAFs3HrqqtR1IuU35iPnuogzTG5xjiGeuGyqa2PV4CsPjpZlDVZEOm+Z6QWjomuj7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR0PR04MB048570

On Thu, Sep 24, 2026 at 10:35:26AM +0200, Linus Walleij wrote:
> of_parse_phandle() takes a reference to the LCPA SRAM node, but d40_probe()
> does not release it after translating the node into a resource. This leaks
> the node reference for the lifetime of the system.
>
> Put the node immediately after of_address_to_resource() so both the success
> and error paths release the reference.
>
> Fixes: 5a1a3b9c19dd ("dmaengine: ste_dma40: Get LCPA SRAM from SRAM node")
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/ste_dma40.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index b25e9ed5fcb9..6599104ecdde 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
> @@ -3775,6 +3775,7 @@ static int __init d40_probe(struct platform_device *pdev)
>  	}
>  	/* This is no device so read the address directly from the node */
>  	ret = of_address_to_resource(np_lcpa, 0, &res_lcpa);
> +	of_node_put(np_lcpa);
>  	if (ret) {
>  		dev_err(dev, "no LCPA SRAM resource\n");
>  		goto report_failure;
>
> --
> 2.55.0
>
