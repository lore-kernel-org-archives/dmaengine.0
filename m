Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011034.outbound.protection.outlook.com [40.107.130.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C357C384CEE;
	Tue, 15 Sep 2026 14:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789483174; cv=fail; b=roKaJcri2KgnU/D7aXpO+sL/2x41bnwZl3wrEVd7JvDyy+ldCQ4yTmQGV9Ljy90bWdsBcYzeREC8SBBlwJG7V6GllXqsHkroWswp6RVCIT4S5qr9a/M0nGfSyVinegDLaxn4IF917UhxFDMC7FON3i4TOk8pbgvSnLd2vod+CA4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789483174; c=relaxed/simple;
	bh=e/ZGVN68yp/jK94Xd/DqI+rzFTcyw9DkuhBnAUyS+ro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=logwvD4nu3+SPO5B4hqwCLOj7qT3tsGiR2ENjoMxmu1CzzLMk9tJHPGIHR5YLxl1UCS++MDjkUogiSd5PVGQWfXFlsSXtE9XPIU16nOP96Wye9viOkSVJmfNfMwSYey0GBVw8bvNZrqXeCIHfuWH9WdHvCREOP8kxFfvbtc05KU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=dO6xxDe1; arc=fail smtp.client-ip=40.107.130.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="dO6xxDe1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LDfnHXZCHi7qmFX0bCr8O3O7lVeYg1mgN8Jxn7EWrMcO/QM9eWO34DilQk5/wO1Ys/1MP8A0RGzMh5phQYAqbCC5tvbHyBaAP2MEBuHkNCh7diJ+wawkkFZK+NeJUsKofbbvBuv1Uq+BMLm2xTvhK5dBvOLZWmuPW53t/8JNWqvqGCEODcOlpu8UPtvUvJRYHHv5BX8IBkzanpbCZ0p7C0vMAikY051ydbr+e5j3zcJkLlUFyHyD2qXIaTUM3xCxEsuXaWtlJSDaBfg3Uv9Kmd72RfyoeYIWJQ0h9cP9yTc2EqAYH/WdGCHw6mdrSiC25kh8B1RVCaEUGyOn3B2w5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NDsNmha82sOGd2y4VlH0JLuRr0YQZWQtK7pYs7Y1Arc=;
 b=lpcAoshyczzCAJUSSyOBF3bM8RW22ad+ty2DRzpNGe3shXDv9HVVCx6nkjvjJBA991khmc2/B8vp4p/DRbvyb1z4iaRshGR+5Msw2uxch1j4mZBvhuza6EqzNQbf6GZvExgh6e2lgssR4wJgAYolKp8nq42fcAk8KhfV5oMetEFAq36coMAcEq7kf4fr3VYrVMO7Z7qErusZPtaiplo9EgJ8HwkC2T7XUt1Pwvd/I6YtGxjgcnIyiQhvXipBcYzHolAGJeYsGnpiFPt7/qeuWiRyvxyD6qayj1k/0OZ045jTKg4+ChUztGX3HrcI8pZOljfccGxc4Fqi+DlgtDzYvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NDsNmha82sOGd2y4VlH0JLuRr0YQZWQtK7pYs7Y1Arc=;
 b=dO6xxDe10sSS2vOXUJpc8cojpK7BhLkJsRqqwU2/efqcnh2fbtJkXpuPqtrCCLM6AbZrBh9c7fl7PMwdSVzMJNq6fHHEt7OGqaren9cayqWyhast0AxBhpKwOOZKAPU4h5HUxtqnez2cYsr9/ygMSu0RaBmYucDXXKJpbNrTJXJV1F4cX/aPNNLzv46FGYOyTSOmaQCwDmbMAlRHLyTrtmNc4YR5dZKETlfyWx0b5ICS6Mn5/yiRalNxXyN2HOzd093K1sN5ZnTCENvKStQvMPBEe6xPd8gmyk8APxnaSWZzWtSbhpHWQLFcTZoJDNL0wAWHiKuTHkOen7ULcgCQYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by ZR6PR04MB587880.eurprd04.prod.outlook.com (2603:10a6:910:e5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 14:39:29 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.012; Tue, 15 Sep 2026
 14:39:28 +0000
Date: Tue, 15 Sep 2026 09:39:21 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv4] dmaengine: bestcomm: gen_bd: fix out-of-bounds access
 in PSC parameter lookup
Message-ID: <aqlYmat-QHFvRjsN@SMW015318>
References: <20260915072608.57887-1-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915072608.57887-1-rosenp@gmail.com>
X-ClientProxiedBy: CY8PR19CA0002.namprd19.prod.outlook.com
 (2603:10b6:930:44::11) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|ZR6PR04MB587880:EE_
X-MS-Office365-Filtering-Correlation-Id: ddbfdb46-3eb0-477c-c911-08df1337256b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|19092799006|6133799003|22082099003|18002099003|11063799006|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	xskcVhFbybN2xkptzabvhYoHaMmyip0oTYJV3Jqhn/npJ9oHkeeRbXf1+n0qcVC2DGxk7OifAMebKYlsts7n/te00S9UqpfSb18GDY6Tz2kQn395VplmlmNBta4Z4xDgDWpdVkTr09WMKB69QTb+beDaAXc2XpqW64Wa1F9ndwBssszV0gok4oNnw9AjkY7Vp7fvSXhgFLBGHH7ftxaUlI/DQNjnetZ9jgiRFCpQTJDeebILfi8d2XTigsXB2kTZbs2aXT4YzhzFle1IVDRQ3MI7gHPz+jFTkmW7JWYjPb4gTOGH2MEoCcl3lEdWrCpis4CeGPaMUpbr21K7u5tgKk7jdDP76TcZUyRIeFDNheIzE82DvDdCCpJp51+sP71+L+8qbEOC7wZ1oJVTcpYWgaYKNOWSTdbQ0Twhp8UP5XpiMYiswbgdol8DyZY13/aJN733F3l1MjJX67olSl2qhd0+KzhazSdzeHsSd8kEjetwoP7LnLWBqic0K9R2+RYDp79LnCzxMyiqAhSSCMCpUCjfOwgiKZKcxRspiRnkQVcZcqzMzshCugzUdNI5AID/KGrxV3eWmGifmC4wLHSVM2QWZxHWhMv93E1eSfnaUcTn2Jp/WkZUTOHNYtId7M7Oh0BqlRDxvsEjru6FEj7QNg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(19092799006)(6133799003)(22082099003)(18002099003)(11063799006)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RCuwbOzQYKfkBBrh0ZxUrfppANSu6lDXkVr27jhu5B9EmyUcKmAjDZEDBzuw?=
 =?us-ascii?Q?Q3XeFPNBk8V30sem7LBEymdqapN6JGBh6SUrRfVK8JnwOZ7pOFh3qWi1WPwO?=
 =?us-ascii?Q?m8kuOjhlEOaV3wGvOjXHzH3RXxSmWsb5xyqCAlwyVEjZ0REviVITT2e6PmWk?=
 =?us-ascii?Q?1WxV3GGwUgGGgdUkOx72Jdq90HPbP4WCh2hp99+y4zCT1LrDTC7VP47cnPag?=
 =?us-ascii?Q?E3qHJyytWskjfeEKouWUS7AZivLfxF7P5+gOt/YFx13SeO6fOGfD/le80UWy?=
 =?us-ascii?Q?W44C1BccQKshkoFW87yDwuvlsVg5FyrMMpbMxyMsrwprlhFgpBnpI+Hh7bHu?=
 =?us-ascii?Q?9kyyAG9QcblmEypJSUtRJ3Q4VKYLcoMWwPlsF/EY03ZiLAL3duJf+pSpxJL+?=
 =?us-ascii?Q?nwCn7WQnEJvS4cJiQiw/8SAa1TT3SP7s9ILLiKenzCv7ozgxb0IfpQkp8bTH?=
 =?us-ascii?Q?9YH16zCG8Jsx0SFeZd3DUD2zkVSndV90NCBEOHdqJVcAW0PYcteNbZStNQZH?=
 =?us-ascii?Q?asIVG24JYjB6pqcS3L2kCMOo2x7JthQZu10rb7kaqvdSC5uyn7qosisGzRD8?=
 =?us-ascii?Q?uwpEotzcyhEdmOVz0SW6pGZT8D5L+jyiUQ4UilS5nP/6eAKYl7DCwTcepmh7?=
 =?us-ascii?Q?NNmbsxX5T6WeBND2SOOikNQ+uQOt76MyguLBHRpOCINIJSxRh0v0n6NzuHtk?=
 =?us-ascii?Q?QpSaMoAqUZCjLbaMdVXoCkFipq26/j29hQwFyjVzB4Bwl6wDrHYG7MxgaG/6?=
 =?us-ascii?Q?fD5CCCms0j8fA1soSv6rPpMsEAF1oKoJS2vJ7ZUnOla+9tDxveJmNWfY25JD?=
 =?us-ascii?Q?Zw9Kak/b58FAtgy3DPOQASFiQP8nUfM9IuBUVOpbcnCaBTfbm6F5l9LBznOM?=
 =?us-ascii?Q?lYuKNoeDKHI/OrgontWl2V94kyHPsyYtICMZ4Y+o/aBS2olfagAZKjI8W9gV?=
 =?us-ascii?Q?Qq2JET2l7uRUG5fScx6gvfN9ZAVPhPdmgPvxE/dJQKWMCsnGrdsDOUyin+oI?=
 =?us-ascii?Q?a3S0wo0dnCW7XP+t4/OrkmjnAphXweEeIUj0bW+WUKq0cKxEg7EH8wkQW1H3?=
 =?us-ascii?Q?xuK7PTEhJNd1BdTpvMiS8vhMQYDZ4Dfs9nVwDNuzVfbWZCWKFlvzt7k44Ysn?=
 =?us-ascii?Q?LpkoYmQnNavS1Q2DpUwUfQabvi4rPnxqMz1eXn6VBACI3lusMgCy5RCtlFrQ?=
 =?us-ascii?Q?BdUHz13Np/0VkJpMVOjn1F63zEHtIRiTBY7IKv+0mHgCHLorG71vXg4pbd5/?=
 =?us-ascii?Q?JYktU8FqPoZWY/Tkdz61LxGBtjrDFOwL+ED3Pe0RJ6gHHnfjqMvC+HgzhePK?=
 =?us-ascii?Q?P1KvNrOOB2t3bjp7xL1F4cfi9k9ngjtNUJJUG0NMFk/25tQGyMxBkCLACSLX?=
 =?us-ascii?Q?bnVOA5TylkUBRZ6KL68WKqI+MBtXg+DZLuMDHUd6EhA73CYycs70SPTYjY7E?=
 =?us-ascii?Q?XwHuqnN6LBuGqFKIF+45dcebkEBoUq260qo8YCk2vhF3tA1Xyfidr9zrI046?=
 =?us-ascii?Q?l73dnidcVfSP3V6DRVNY9VvGCfsOtzcTojBIhgSv0D6r6kDschTWj9BI9zjz?=
 =?us-ascii?Q?xSWcHIHDHMHHiA3ICwHJOysC1UiPujQ5kro3UHzJUy0QtCRWCakvNNMlkH9m?=
 =?us-ascii?Q?YoqplA4FesfLL544zVB80AWSKxERIKMhUBhzFPWBEpMFVv0CXtk6d9cpuSeo?=
 =?us-ascii?Q?bYfaaBBRPxv+ewrCc+C8drYfyuV9qzTjL2oVyA6p98EBpjI1BSOaP58WuEV3?=
 =?us-ascii?Q?9Y2tljo2xLicYmgN/6PWN9tarYF9oX+K7VfelRMnuM7i6KoNDfeq?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddbfdb46-3eb0-477c-c911-08df1337256b
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 14:39:28.4981
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 60lYbIAg1W3cguho7Xqbc0KUZoEERRjkSxj5Kry76rfMxo38gxsFKIY6bfko8T9otcRvfN12hl0cybeIYbPqfBNLqGtLB6M0r+QDUxB1+GFMgqkCMbEan0GQL37zOpdD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR6PR04MB587880

On Tue, Sep 15, 2026 at 12:26:08AM -0700, Rosen Penev wrote:
> The bcom_psc_params[] array has 6 entries (indices 0-5), but
> bcom_psc_gen_bd_rx_init() checked against MPC52xx_PSC_MAXNUM which can
> be 12 when CONFIG_PPC_MPC512x is set, allowing indices 6-11 to pass
> and read past the array. The tx init function had no bounds check at
> all.
>
> A malformed device tree with a large cell-index could therefore trigger
> an out-of-bounds read. The garbage initiator and ipr values would then
> be used for MMIO writes via out_8(&bcom_eng->regs->ipr[...], ...),
> potentially causing out-of-bounds MMIO accesses.
>
> Assisted-by: LLM
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  v4: actually bcom_psc_gen_bd_tx_init is still needed.
>  v3: reduce bounds check to single function. It's not used anywhere anyway.
>  v2: fix title
>  drivers/dma/bestcomm/gen_bd.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma/bestcomm/gen_bd.c b/drivers/dma/bestcomm/gen_bd.c
> index 61b5746e1a97..7bbe9cd7b39c 100644
> --- a/drivers/dma/bestcomm/gen_bd.c
> +++ b/drivers/dma/bestcomm/gen_bd.c
> @@ -321,7 +321,7 @@ static const struct bcom_psc_params bcom_psc_params[] = {
>  struct bcom_task * bcom_psc_gen_bd_rx_init(unsigned psc_num, int queue_len,
>  					   phys_addr_t fifo, int maxbufsize)
>  {
> -	if (psc_num >= MPC52xx_PSC_MAXNUM)
> +	if (psc_num >= ARRAY_SIZE(bcom_psc_params))
>  		return NULL;
>
>  	return bcom_gen_bd_rx_init(queue_len, fifo,
> @@ -342,6 +342,9 @@ EXPORT_SYMBOL_GPL(bcom_psc_gen_bd_rx_init);
>  struct bcom_task *
>  bcom_psc_gen_bd_tx_init(unsigned psc_num, int queue_len, phys_addr_t fifo)
>  {
> +	if (psc_num >= ARRAY_SIZE(bcom_psc_params))
> +		return NULL;
> +
>  	struct psc;
>  	return bcom_gen_bd_tx_init(queue_len, fifo,
>  				   bcom_psc_params[psc_num].tx_initiator,
> --
> 2.55.0
>
