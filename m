Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013056.outbound.protection.outlook.com [52.101.83.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B89451981;
	Mon, 17 Aug 2026 16:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786984044; cv=fail; b=nw9nBiLcjMcq23FM/FKgS0OrFy1Tp2Pis5Uz3vJD30XnYvqxboyA0VzWhwPW+hz/vJo7WeNIfWvLaDXjaZRSXr2+8inTDYeXF3TiDIL/A2ejG1kwJ5ob6hkIz70aFPAw9n4DWh3R0m2LCZsvkilFGmHMw0+XpSx0X1GyRqeg4d0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786984044; c=relaxed/simple;
	bh=LUouvoDvq0NRy7oNzJUWz6t4oEJ+Yg8O2JBx/2fhTT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=P7A+h5NqymL4MJdZsUPaMkwJT6kvpdjqX0ZU4IqgMkZ6Fo9W6AXrwjZzh2zj/px4IoDB4tWBljC68+XD2DyjQT225CFDWu0gJoCXCiJ4YXDtCQJomwtDyPrwFocicfv9d/8esDS8L4mA+79lipJat3cyy1v9CD2VPpPwGCxeQ/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=t3w9yudB; arc=fail smtp.client-ip=52.101.83.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="t3w9yudB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dWoIxBTZZ/TvLocmgY9o/xiO58Q2Kg6zlv7tWWQx3uCgRcFNIoCqQhn/mikmgSpBr4yOesZF3ljt/oI315Fy5GEr1GdvJME/1fZO1fLFDPWOz7X9S1Wp8Y10118GU3m/ITAM7f2VHApr7uxArXeC5EZhdk4cb5ONjeBDT/Eyr/JsT45tF36myGXusxD2dkPirLnCfts2aldDgMstK8NtSo/4VmLW2CF8Tcx0BQ4BCgxwdkcuxQJ5lOnKL/VyjcT31j69cXXIUWKqpLu0Rvwk58ua1snC0Z+Myfjscvyy8rHLx8rWxOTL4y3I1VlqjD10DzXP9AjMwerm49m9S8xe3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Vz3BThAFXv0E0RKG61issts+SfMPWKgBIb/+Xhfv+U=;
 b=L8TTyRzUzqGXEsPF1kNW7GkXQowUkDsSdaQKBO7iG4tt7pm7YWuH/oUb9e/GIVT7QimF/xSn9bfR924EhAxIemP/KN7UK6zakudXFb1Y+uvyZGFHo0WiOJ79WsdPLPbWLt3gW/XfYTh+MudZS7Z8bRsD01OdKIqwWXilZOIBDyJM1WxIwQ7y4fpiaOsDtgQWRfUdDp/DhzTkIEDH05/2jMcfgViibbzHuRl/XrX4XYEtEImze1l4xHmTPtZJM8DSEEZrQnuwWg3wjFdvoddtkW8mKuhci6Y9YceFtHiY80i972YPiGpV7XVPZMCbOE6B0fl1QOsN69DFVLFPH0ukiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Vz3BThAFXv0E0RKG61issts+SfMPWKgBIb/+Xhfv+U=;
 b=t3w9yudBQzN4y6N7A8KfNqtzSstGVJb/gPMZtwywQpV1pkNWjRSyaz1iMuU+fNujVMfNU+lMpdnDJoiPlgVtrYxDe1meiEI5/zBGmQyCgBV6EFZcsYDAP44cgDUnlgiuMMmO+vBdbsjuXqUAIXUatZsErSncd/Oyj2WfuYN7ne+REWVrf0ca/wIImCSUaj6M07u7Gmrf6j6kDdYS5ChbeKjIqf4TjfGHnH1a1DTzFVwOkXzpU/UXRtSyxXCwrQaBa9rvh9QuVrZlwLCjNkcEPcReQnPbDH7cAClY3xpc+atAMpzctAWwsxUZNGjTsJVSDc7It8c2vxE2SEHWxCFQwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU2PR04MB9068.eurprd04.prod.outlook.com (2603:10a6:10:2f3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 16:27:18 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 16:27:16 +0000
Date: Mon, 17 Aug 2026 11:27:07 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dmaengine: bestcomm: gen_bd: split struct
 bcom_psc_params from array definition
Message-ID: <aoM2W6jtsdbjzRNt@SMW015318>
References: <20260817015903.137062-1-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817015903.137062-1-rosenp@gmail.com>
X-ClientProxiedBy: SA9P223CA0030.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::35) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU2PR04MB9068:EE_
X-MS-Office365-Filtering-Correlation-Id: 3394ef1c-3bc7-4428-6232-08defc7c66e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|23010399003|376014|366016|6133799003|10067099003|11063799006|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	Y4dJNfQFVvguFz8IEHYHJCVsVa4KSWxJgnh2upWWd+Hnogjr01d4M8VUdH4BdbqXj/W9p+XEgy0iRyAO9EOhBQxHxruRVWAXGbNSy2r8WWzEPqo317F53Hbt3AcoMQDDZ3Uu+lkBL9zaRmXpNBg8b7xvw0MoTIc7BoNRGH/e1Q7071PyxPS4Txvtw8H5e1VeAVMZWutyoDI9nmAQVZSsqEmtLtoazq/D1J0B4wBR/OPDVx4rklzY6rSAD52P153l1nLWqPaa3IucI+FasA/Aoa6GFeWOxy2KVy6Amkmqu5DSe3J5hlJGHc3eq1/CnIRM22tILY6oKkcVMLEBmcoWwZJb81qOdog4IbWq+xC+ec6+ErdBJBDJ+8Zgi5J9eBm/gQyXvcRFUdZ5SqFEaf609HXUqiilY5eH+rnj2AihzNY7Nx1+gZg/siNwWqI9wX6u3k0jMMgwhp4R2g5wy6ihfZDwOh06Xq9Cyt2ZIfXAQ/dYYb0N4EYuyuBdWpdPtRMlkKA16pFNEOPrpVuI1YnZb+dqNWu/CMMnJzcvgWd6LOO6DsqL9Z53giT+k4PMJAueZI5BDt5aDn46qpsRlXBbu3an+SY3vkSFsXwhwhJNaCMeCSjlOf9ZBgZlxLHe0gLZz2gfiO/oxawdtqPUwXEsitWmMCc/svEua5COT7l3Iok=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(23010399003)(376014)(366016)(6133799003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wemUtUfYBtCTlyValijHjVqS42bGOMQAcKs/K/cXnvIyc4imIGbdnSARWYRe?=
 =?us-ascii?Q?+yVmBGLkex5ndy64tg0QbCAMDttHFZkqHWKYyFJLH8Y61yqa4I+rkxDSLa15?=
 =?us-ascii?Q?Bja9rhHWs2XpKi5Ix6PAoWYhAtLUvletC8O9dtUeUtul+8IdkfoI7tsMYfbj?=
 =?us-ascii?Q?CrXKCqu1sERxsCTFv/A16pw0MQVcltKCvTZbPbW8MK0M+2ErtovQBOLigGpr?=
 =?us-ascii?Q?3Y0h52ttbRi2bwoWdESMLzoFxPKOmG2rgNisY+1STO+HoWHkQ+Hnl1tAfKYZ?=
 =?us-ascii?Q?dphtOJRysN5NMTVHTdAJnhjX8m6zUO2dcfolzx+J+QrPm1gLy42lsJWQizDQ?=
 =?us-ascii?Q?qs0fvmVoK/pK+FYru8W0qGhW84PhQl2W1QqUJmo1YncuO72cjEXN6mSvMpcP?=
 =?us-ascii?Q?Fa11hyJ4bYOqKmBKCtAAivVcPXEHzxolKm6BHysnkEStHFnlLRBp5UmzM0gu?=
 =?us-ascii?Q?/8ypUbkBj3KSeZo4+vZe2q7/Plsyu8+V1rCm1ESI0dtFYgodamkhFrQHaA1n?=
 =?us-ascii?Q?h/O3moC2zxiHsuzR0EPcssvjSt6/+Zx8SpON63ExP2c+CD2nTqICzi9jCHfZ?=
 =?us-ascii?Q?X5LvZSNyBoAj/qx9HDn9ex7nVQEw5sODjPD2y2UcHqtar532n6R0kuUtbi6/?=
 =?us-ascii?Q?7FrNAbRwNLwA/mGU2iP0HT+S/OK7gpNF8gtmkXXIxLEbZjoE8z6E2riIMGJ0?=
 =?us-ascii?Q?593EO6/aSXjKPPPk0oaolZnzZh0lfJnlW9PnwraDlWRmIzCWQcbntYyjYgn7?=
 =?us-ascii?Q?raSQBTIy508HeZf7Il3Oe5wdgibbJqlIoy/jjZssBTtIYtGTweHSMMR/Gw2Y?=
 =?us-ascii?Q?tRKJ7zygx9vaaZ5/tdzhZi+voXi25XYfb+/vga1Y6pxdAfPsITctheiB30oI?=
 =?us-ascii?Q?eY2F+6XY9N9vO1F4/QemCANjXlbosGefU8hxGGI2QyVutilYgL2A5PiIAGry?=
 =?us-ascii?Q?H40fURCyYLdiB5BoAR/wj87mZtfEu+zA3CevuRryHxPFHa8PAi/gENvisOtu?=
 =?us-ascii?Q?BWVrApqaQaOfEgix/jhKaoOD1jChiKGYYtfeGSzRkX863TloH8Eqmm8v0bnk?=
 =?us-ascii?Q?VnkAcfp2D9U3X9THYpoOXk9LPAfBSX8bEFQ6OyElc0nwi4O1XwP41hp7wWdy?=
 =?us-ascii?Q?kpLwwT/iu/1UiyXQOfPfO+kKXX36Fjf/6rRk2ujMmbvY+VuoyAyJiD9Q1KsF?=
 =?us-ascii?Q?vBnkFay3UYCM8nG8ToTDtgdLldYOlE4Gle1UPwRVQ+omH1BlIfwAvLVbv4GA?=
 =?us-ascii?Q?Skc3cQF8crdf4CGPnrjbeQVvljMBXInA0dInFoTGlvfPYJYPBYYJBbux7TUv?=
 =?us-ascii?Q?UVLSyeb0qOq0upzmvCZ2MD48fKcDaPdKq4ZdXj9hy8uUTLp0PCTTsgA9OwAJ?=
 =?us-ascii?Q?4An9BzDw5855x1O1IYaXioFlg1UIlucW93BOqjAMVs1XPQUH8L3tM/Cd6exN?=
 =?us-ascii?Q?eju4AvKwpeH8YlT7QlbWGxIqX464JXjCtT7mptOe5TJClNBZB2IpDbK61eUc?=
 =?us-ascii?Q?cI2YH9+CL/bBF/KgqbgCBPjXI8tlxeJVUafdEI9NjrKUa+1cvydb7CBNaGwI?=
 =?us-ascii?Q?2xdd9Lmgb/vyEdRhZ4ysD4E7cskYc6ON43rpHEVhSk8emnVjAH3sOG6GPccY?=
 =?us-ascii?Q?+YoeCC3REeRKxjdo0cD7pdC2yZuDjFPOy25ntRdBVbXIGlJOA/HyBO9xYEVa?=
 =?us-ascii?Q?qcd/A7upzk6ZyLuFmsy/D5w9vYuMKOnyewVwRfZ/7p0sXnxduhmPGg4Clo1z?=
 =?us-ascii?Q?mZtKXBE9O7gUj9WaXgp/yCEOIr1I1+Zf4E5A3RlgwmKJLbqIQPEw?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3394ef1c-3bc7-4428-6232-08defc7c66e7
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 16:27:16.8518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zmgY5bZezjYD1Q42FgSYfunKfhXz1fygj5xFpZj6MflNxUFI90ytu3CzcO4VXr0euzx4HZsOMqs8Sldhp2LjIEcJTGGnEYREePwhJGkGZqlZqCqhx/EYSJgwWTcSVOQz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9068

On Sun, Aug 16, 2026 at 06:59:03PM -0700, Rosen Penev wrote:
> The combined struct-definition-with-initializer pattern confuses the
> kernel-doc parser. Split into separate struct definition and array
> declaration.
>
> Also now that it's fixed, it warns on missing members. Add those as
> well.
>
> Since this is just a lookup table and not modified, make it const so
> that it can be moved to read only memory.
>
> Assisted-by: Opencode:Big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/bestcomm/gen_bd.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/dma/bestcomm/gen_bd.c b/drivers/dma/bestcomm/gen_bd.c
> index 75d1a6f543df..00dfdc4b8eba 100644
> --- a/drivers/dma/bestcomm/gen_bd.c
> +++ b/drivers/dma/bestcomm/gen_bd.c
> @@ -254,17 +254,23 @@ EXPORT_SYMBOL_GPL(bcom_gen_bd_tx_release);
>   */
>
>  /**
> - * bcom_psc_parameters - Bestcomm initialization value table for PSC devices
> + * struct bcom_psc_params - Bestcomm initialization value table for PSC devices
> + * @rx_initiator: RX initiator ID
> + * @rx_ipr: RX interrupt priority register value
> + * @tx_initiator: TX initiator ID
> + * @tx_ipr: TX interrupt priority register value
>   *
>   * This structure is only used internally.  It is a lookup table for PSC
>   * specific parameters to bestcomm tasks.
>   */
> -static struct bcom_psc_params {
> +struct bcom_psc_params {
>  	int rx_initiator;
>  	int rx_ipr;
>  	int tx_initiator;
>  	int tx_ipr;
> -} bcom_psc_params[] = {
> +};
> +
> +static const struct bcom_psc_params bcom_psc_params[] = {
>  	[0] = {
>  		.rx_initiator = BCOM_INITIATOR_PSC1_RX,
>  		.rx_ipr = BCOM_IPR_PSC1_RX,
> --
> 2.55.0
>
