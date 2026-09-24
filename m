Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013028.outbound.protection.outlook.com [40.107.162.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5836386C18;
	Thu, 24 Sep 2026 15:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790263030; cv=fail; b=Q25e9KmXKAah+vXmnDnUCTck4VvhKAduPXUPJBFw9u1e/gxVBI/Jfh9xkdi3lvTHw6rIY4GJL/F5gjqUfM4gLoTWPpmG+yboY/pGY3DuG9ucqNwnF2JlURWzIM59mtTwStOtf7MIOBUpP4zYed5bQ3HjP0eZ/APXH1AMrCuhdEc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790263030; c=relaxed/simple;
	bh=Jei9cZubILIJhxL77ms6HnWxb204Sc4hVtTv6hKJnLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PZOAb/XSDXBsIoVFS64ApK7jcz39WEMs5fRNU5GFiOa6zrtUbi8t2OAwYr/gtdehCh+mDppxM0Y1V2ixY8dZqy1ZIhzYf3UQF+CHd+pZiyZYfmXjVNJawPRVe9ztF2OWg4gmUPGXy78x0ufA+6Tmrk7dE8OM5t3umEY7DJBGrbw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=VF864go9; arc=fail smtp.client-ip=40.107.162.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="VF864go9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bjUP4xB2arRIaVvi1Jv3/nRaxHPfeGxPZ2EqIMKbRWsGtzKvx/cp5UsyZy2btc3D0tfFQu253ZHjirFxnIkLETHIxBcIlLpCadd5xhB3AwRAp62e9NMhlK8aBH3H1xumj84KHkoRuFJ7idNaBxN1U9vkSSSMKAPJD6k98POH/SsL6aD2xy7+gZOTc7LWWIZpR+0gnLhjVp70LY0YbslZlB9DBDuoiSwI8i0s15xW+Dy25s+OpnFF4ON783yjvYgUwxxTBcU1kaNt/RvphvFr6NaraMZMn5jK/N/UIch0O6exdY5Tq7ibyw+AfhX6k/86BEL9Fzqk3yb7rUJ3NZpv5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vtcbFae9jfytCFrscuuK1hN0cVY6+4HDDrAz/qnQ31Q=;
 b=s+QgjQGMErwFV+oQpZjmd36fH8N+1seEhNmnbHm5h5Ux2d98bjC0oSk7ymPRGHw5jA2jpa7e6kgNBpFIuylMp9iczFTE/YePQqOSYkt8CFCb2GGepNOOviNCnea0P5wZcmTgPSCrbOlY5iU2Moev9IHyxN9m/4/BNLeMjVI9gJTDPT2LSZdrOxAV1lneoMzJcJrBDx4J5ybltod1f2a3HrNzXp4uTwtuRDmht9IhI0fLLbD1hpyMfpg6J8zgE4oVPazLuNMiZrOMGFuFYgpD0rs3ElHk/lt4r4aHINdlS8odq1ZkFEuhSwTtC92HPfN2owUohhMi4fztDNhf8jckQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vtcbFae9jfytCFrscuuK1hN0cVY6+4HDDrAz/qnQ31Q=;
 b=VF864go9dhsGhdveknBbgx/DiTsQxk7k/gPdoJFakDVw/tGHD//Myvd9baM1zgcJRZBL4uOl/qDZbl8zcEVZJReXlthQwPnyFT1PFnMyr77j2aOw7nX2NPxPE+44vc/UIli7s8iBK7Eic9K146OXA55yPDRK5kKBkDn/QAKczuUKOGpzhPLZo+4p3odEBx+/Bcz1l/V0bPIax1wjGQIioVPUqN1CTm+RIIvVsnMdHEGDd8H1DH1PCR581cW6FH08kfjCN34eOokE443VucJk2NHQCdyf10rWuOC2IxqITrwMp6DmrYAV0khLo0dhJFZM5ml/pUEoZcgcb63y3AiGtw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM0PR04MB7156.eurprd04.prod.outlook.com (2603:10a6:208:19b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 15:17:05 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 15:17:04 +0000
Date: Thu, 24 Sep 2026 10:16:57 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, phone-devel@vger.kernel.org,
	sashiko-bot@kernel.org
Subject: Re: [PATCH v6 12/23] dmaengine: ste_dma40: Fix LCLA allocation order
Message-ID: <arU-6T9N_G8UJux-@SMW015318>
References: <20260924-dma40-fixes-v6-0-fdb6755020a2@kernel.org>
 <20260924-dma40-fixes-v6-12-fdb6755020a2@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924-dma40-fixes-v6-12-fdb6755020a2@kernel.org>
X-ClientProxiedBy: CY5P220CA0004.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:930:ed::15) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM0PR04MB7156:EE_
X-MS-Office365-Filtering-Correlation-Id: 428727b4-6e62-4b8a-5217-08df1a4ee40f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|366016|1800799024|376014|4143699003|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Bo60nPEotmFNr8bg+936bgWZjVSBAQ1yGIANc3eO75FGR9fjhZu4ppalmu8IId8gAX1P+H9V46dDSsfYJ9bZCHmmfXa8Y6tY/u0B7HAT7H7IKOEh8iqQ97atsv8h9IJOQaTN22pHck+UAOaNYVAQJQA1Sh/YyDMG5c8pdNo7cWB0z2Hx5Gh4WT8FaFMCU+V7HAs909lk1YAKDTmMA6WDsxpCzSyiOxCVM9y7eH1mSrV0dVofQU7yUX6NLSOWQ9M9lu0M5uU+R3fFyXfnIFpv8k/C+krcIM1u9tuZZ4Fa5sAtGjfFeKeDV0F1sh0qJrsJgOC3e3zG0CqHRCMGAUWWcEPcjXUN6Mb4u1MQ5jV87JMZ9O/T7tobWk5LwvHejXK3pCus9PBmtWVqEWPckw5mkYlRTii/bbF6CEZ6OvqcYcRXAgCaHovN1Mi3pv+iPejHR4Ikm5zqIMwRD2MYBtTlalYkxht6A5dJNHSe8ZhWlDZb1VD/eQnZDoLDHb0RCBw4oUve5ENfDvE37RRHPKG9Wgxj5wYsnbfEzeiXS6EG82LNwJ6Ky7/qHpQap5SdIIIgAOVMOYVFwfWwy0URKQfxmMV1+9Sz5hhoZKQmxlxZ+yiITV78HlDOOug7ClSvlZTs
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(366016)(1800799024)(376014)(4143699003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ef+JpYXKakWoTVJA0IyoQ7migvrrVTUExTpSKlUT6xOG699KElHDNJ9LZtrU?=
 =?us-ascii?Q?Ey0Oq0IDz+Te9QAGw8RgjmZhvHpBkSUG2/D0qZMxLzK98Wpax/DQ+L9pT8A7?=
 =?us-ascii?Q?HCKbJnkf9QnEh+AYLCd6PL+H3TtfbNObXe3u5cpVarRlLcNd3lF16Q7rd/ow?=
 =?us-ascii?Q?3R/1x0HkGaJLqOlwttA+163goT3cA7DC9tLRFDqwWKG+bNlfVhjo5/dSfyLN?=
 =?us-ascii?Q?hNGd67GNF8rvk1SpQE4Lzg2AEaMGmY/oLdwepIHsv1cBrEO90+HxHSeFCMay?=
 =?us-ascii?Q?WtCL0Lsm92xt8ThmIiuwWyNLU2ZPcUtk/at3J43gAm/JTPKN52ofD3dJBeG/?=
 =?us-ascii?Q?aWHCRkPPdEBiaiYsQ/JfHHUwOx/eVO4hjIe6KlkvDSuncRZ70IOZFVSa3hDU?=
 =?us-ascii?Q?UvUtdlZuwxAojvqdQjDFe9u1Yu2eX7d9e7RFMGt1nKhvq3EumvqR5Ansi9o0?=
 =?us-ascii?Q?QIVKZcHQj+6SOHklFZ8ohJEhxIJ3ok8Nf2KzmsPyWHHQXYcEb5mLGFpqv/Tx?=
 =?us-ascii?Q?Gs1DNO2FL7ZYmCCKjZABCitGSz5eZga9n609szosH/fzgNQqDSbh3XTUCgG6?=
 =?us-ascii?Q?8BmXG2gsiy7W30EnG+hXgDx0MfkISIxs4M9DxNbz/5Ui73ppF5sbFlo01oVs?=
 =?us-ascii?Q?iKUoDp/isbnQnA5PXw35gIjWk21DFujnMdBE5v2yqm1jAFJo2yDT62nnrOEZ?=
 =?us-ascii?Q?5cW0kToHB6J2YzrjdqktcDgdnI4lBnVssqzM/qcLvabSHP5/H3U+N5HIFHbB?=
 =?us-ascii?Q?kS2iS5C/N7l1DG/b+8DSJz3+x1iTxLlQETFgAyoNAQnMaRGjGfqAA04TLTlN?=
 =?us-ascii?Q?kmTvPC1vWR1CSWo347TmP1OBveDYw3XCjA6ZoTInp0+adsPdcqMUFIS6ldbt?=
 =?us-ascii?Q?gL0cIHRUDoLHb2doFUYt/eceyPAlTb8Kg/wqTXciU879UwfAH/CHsHULuAQx?=
 =?us-ascii?Q?/77hgq79Ro1EJ/3n1Af4/LlgHqu8ubfZd4OqcsIZ6mpfpweAoKtLeSrh8D1j?=
 =?us-ascii?Q?xc2y8nCiuTU81dVHDiukzSiWC39e07CjWXCoPeM3UuafaAiXB7Ph6K01ipLU?=
 =?us-ascii?Q?sObZ7VB9YBUrynx2QvPDfN7haiq7LhRl0a8CctUrwxQC4rYqNTydE/aWyERZ?=
 =?us-ascii?Q?Bmmj8NVZZKWeieU60cVIApYLKMGtRdMn9z2YaM2R3yZqB6KIMozyqCggu8Dq?=
 =?us-ascii?Q?MnxMuNMejZvQGIJTHOn6EtkjUYpBKeuRg8ofM+mz1GAPMFFSFt/NaecX/c8W?=
 =?us-ascii?Q?9ptLghTrYdGSVyTyGE5mDZjkrOqY/aUrAJXSlEiF5wIZ76DTlpbGR8hyXMPe?=
 =?us-ascii?Q?bvNR9ij0qyatBRpCLkUucshVN4YxSuDoDi8+4dJu78BdS4fROQgUmknMoPbX?=
 =?us-ascii?Q?1ae5EcP7kd9W9Qclgg+QSBnZmrV3I38gyyfk4gClQSd0lc9D6X7wzyZ8i/d6?=
 =?us-ascii?Q?QkW7wjF66HJLCMl+l7ZFQNLckpWcRGD9oITbsmRfVOrXWCaHiayP4od2qg5S?=
 =?us-ascii?Q?M8ZIXgsNsNNxMlQl4OmGqUTrBa8/1CXhvx3W/le1Qp7hIXpL8SNSWxAz/n+G?=
 =?us-ascii?Q?5Jt9yahAtnzDgLSCOfeNMc1/mRBGih6pYonyl+Y2WFvsrpXfV3mZKh+RTb8J?=
 =?us-ascii?Q?B6g7xrEQhHD+x+ebdttKkgpZ1XqZ1NB6lUHSRa4LYRheA83buAm/OzjYTsBO?=
 =?us-ascii?Q?BhJbHMg5bT1CKZ9sy9U02uZXOClmKkgrVnd/8n540xHepX2eyLwy7X3gZ3X6?=
 =?us-ascii?Q?XE+Twj38Ij53uyZ+A3BkW4JKga4jrhguMH2XjBIjTWsq7cU/0ak0?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 428727b4-6e62-4b8a-5217-08df1a4ee40f
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 15:17:04.8936
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mix5kKW7Z6KRUEWuiDHTiFYk1UIWO9eC38hYXFcCn9fUeoAsC16s1EKiefr8U7K1qylvFxlIypm1S9AV4RWcm5Etalft+ipJmVbI0PDoeidcJO9LXunIEBRnUIrGdjI9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7156

On Thu, Sep 24, 2026 at 10:35:24AM +0200, Linus Walleij wrote:
> d40_lcla_allocate() calculates the number of pages needed for LCLA, but
> passes that raw page count as the allocation order to __get_free_pages().
> The same value is later passed to free_pages().
>
> Store the allocation order with get_order() instead, and use a separate
> byte size for allocation diagnostics, fallback kmalloc() sizing and DMA
> mapping.
>
> Fixes: 508849ade23c ("DMAENGINE: ste_dma40: allocate LCLA dynamically")
> Reported-by: sashiko-bot@kernel.org
> Closes: https://lore.kernel.org/dmaengine/20260819225114.AE1511F000E9@smtp.kernel.org/
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/ste_dma40.c | 33 ++++++++++++++++-----------------
>  1 file changed, 16 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index 87b5f1d97ac2..8998466faa76 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
> @@ -426,8 +426,8 @@ struct d40_desc {
>   * @dma_addr: DMA address, if mapped
>   * @base_unaligned: The original kmalloc pointer, if kmalloc is used.
>   * This pointer is only there for clean-up on error.
> - * @pages: The number of pages needed for all physical channels.
> - * Only used later for clean-up on error
> + * @alloc_order: Order used for the LCLA page allocation.
> + * Only used later for clean-up on error.
>   * @lock: Lock to protect the content in this struct.
>   * @alloc_map: big map over which LCLA entry is own by which job.
>   */
> @@ -435,7 +435,7 @@ struct d40_lcla_pool {
>  	void		*base;
>  	dma_addr_t	dma_addr;
>  	void		*base_unaligned;
> -	int		 pages;
> +	unsigned int	 alloc_order;
>  	spinlock_t	 lock;
>  	struct d40_desc	**alloc_map;
>  };
> @@ -3606,6 +3606,7 @@ static void __init d40_hw_init(struct d40_base *base)
>  static int __init d40_lcla_allocate(struct d40_base *base)
>  {
>  	struct d40_lcla_pool *pool = &base->lcla_pool;
> +	size_t lcla_size = SZ_1K * base->num_phy_chans;
>  	unsigned long *page_list;
>  	int i, j;
>  	int ret;
> @@ -3621,20 +3622,20 @@ static int __init d40_lcla_allocate(struct d40_base *base)
>  	if (!page_list)
>  		return -ENOMEM;
>
> -	/* Calculating how many pages that are required */
> -	base->lcla_pool.pages = SZ_1K * base->num_phy_chans / PAGE_SIZE;
> +	base->lcla_pool.alloc_order = get_order(lcla_size);
>
>  	for (i = 0; i < MAX_LCLA_ALLOC_ATTEMPTS; i++) {
>  		page_list[i] = __get_free_pages(GFP_KERNEL,
> -						base->lcla_pool.pages);
> +						base->lcla_pool.alloc_order);
>  		if (!page_list[i]) {
>
> -			d40_err(base->dev, "Failed to allocate %d pages.\n",
> -				base->lcla_pool.pages);
> +			d40_err(base->dev, "Failed to allocate %zu bytes.\n",
> +				lcla_size);
>  			ret = -ENOMEM;
>
>  			for (j = 0; j < i; j++)
> -				free_pages(page_list[j], base->lcla_pool.pages);
> +				free_pages(page_list[j],
> +					   base->lcla_pool.alloc_order);
>  			goto free_page_list;
>  		}
>
> @@ -3644,7 +3645,7 @@ static int __init d40_lcla_allocate(struct d40_base *base)
>  	}
>
>  	for (j = 0; j < i; j++)
> -		free_pages(page_list[j], base->lcla_pool.pages);
> +		free_pages(page_list[j], base->lcla_pool.alloc_order);
>
>  	if (i < MAX_LCLA_ALLOC_ATTEMPTS) {
>  		base->lcla_pool.base = (void *)page_list[i];
> @@ -3654,10 +3655,9 @@ static int __init d40_lcla_allocate(struct d40_base *base)
>  		 * alignment, try with allocating a big buffer.
>  		 */
>  		dev_warn(base->dev,
> -			 "[%s] Failed to get %d pages @ 18 bit align.\n",
> -			 __func__, base->lcla_pool.pages);
> -		base->lcla_pool.base_unaligned = kmalloc(SZ_1K *
> -							 base->num_phy_chans +
> +			 "[%s] Failed to get %zu bytes @ 18 bit align.\n",
> +			 __func__, lcla_size);
> +		base->lcla_pool.base_unaligned = kmalloc(lcla_size +
>  							 LCLA_ALIGNMENT,
>  							 GFP_KERNEL);
>  		if (!base->lcla_pool.base_unaligned) {
> @@ -3669,8 +3669,7 @@ static int __init d40_lcla_allocate(struct d40_base *base)
>  						 LCLA_ALIGNMENT);
>  	}
>
> -	pool->dma_addr = dma_map_single(base->dev, pool->base,
> -					SZ_1K * base->num_phy_chans,
> +	pool->dma_addr = dma_map_single(base->dev, pool->base, lcla_size,
>  					DMA_TO_DEVICE);
>  	if (dma_mapping_error(base->dev, pool->dma_addr)) {
>  		pool->dma_addr = 0;
> @@ -3916,7 +3915,7 @@ static int __init d40_probe(struct platform_device *pdev)
>
>  	if (!base->lcla_pool.base_unaligned && base->lcla_pool.base)
>  		free_pages((unsigned long)base->lcla_pool.base,
> -			   base->lcla_pool.pages);
> +			   base->lcla_pool.alloc_order);
>
>  	kfree(base->lcla_pool.base_unaligned);
>
>
> --
> 2.55.0
>
