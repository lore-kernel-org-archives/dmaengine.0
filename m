Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010041.outbound.protection.outlook.com [52.101.69.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77429305695;
	Wed, 12 Aug 2026 18:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786560625; cv=fail; b=qyo3ZIa1lFanKkGIE35PC2GKVUkY2uQ+P3bfsUDvP5cW68cjc1oGrOpx/CUdOb9j1oQbDa/OQklpx5++w3P121Kx1/Yyo5MuW1EGHyS9IYEcbD1WH6498zdcop2KO/5QX3hwTbOAxIQPP3ltI6h3z++1IXMH3KBDDP95yTUmHhI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786560625; c=relaxed/simple;
	bh=4jIa5CKIuHmgAkcno/FJ5pOAvnbhM9XPR9NcXiljqHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HPvKD0orMXDABiC6Z06MvMbnmSTlMu6ii+MkKEJkN9t5joUa9HEveM7dQ/9ejbC4AEuvXwuJTT3+DkhABU2QIDq2W+c8AqvLQVe5hxhcvOv+4/xgkkYshwcGtca2yPxfD+UZnTWFxxnWSyQ44GgiCZKDkrxrtCOFbrI2q3GPxDE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=mT2RKqpn; arc=fail smtp.client-ip=52.101.69.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="mT2RKqpn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eyk/ucfPkdZG9gJH00ekTYCBM7mBJ82povy8EJVMbm2fFtC5LX9ltZ2/uHJxG807Atn9U6ZA/ZhpbvKI2JJPQJqDJIgZvK+W2HAiuSreclBRkTXZniftotJHEYJgn4nsZMDOhYpDHkrzIAXsQ06Gv38zg7m286taVLkBFOsaROkj3QVUjLdaW6R2mIfzfv2u6gQ7bUcP3CRiUOsE8tDXsVysJUEe4p7qnYsAgq6sToZVWc8vjctn7aH6xHKHgm5JQ3r+x7BnC97iIf54JzveCSvg07jrDNzkyUd+vIMsjdOI6X4KI+psMR0v8c40qP3E9FgwKypmyy6pJLoy+kZOww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bnOsteQfWBshQ6tIqzNivtyYyAYn/RD9P35bfEw2wsE=;
 b=Rm2todtV4m0KTaJadgnaOvhktmzH8J7TDs7WBE1BZNKohLeHWR86vT1O7XBtBbU4DnMqZgGX9wfrVAWyyngTNO201Cngp4bHaKVwXj9BoxXGIsuPFG/j2FQtKQ5g62ddYzB146OJrdVm80Ndm7op4akB/5zR8sUSg8XaJLtfk8PBpKdQS1dr6p3vtzMD+NiuznM/eEeZGCjB/v45a8zgMEaVLnz5363kl6ubsd0zEGdhAGY5m57hr5oTjV9djhd8O4+BjR6gy5o08eAG0lZcMXF/Q/GSOsWisP7qtix1Gtozio+h9odg2AqoEHW3hNX3VXqLydO4/gR2Etr2bk/rcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bnOsteQfWBshQ6tIqzNivtyYyAYn/RD9P35bfEw2wsE=;
 b=mT2RKqpneLRsA8lXBWjzg16D2eI1IZN/rxCi9E5MRDTheDpAPPutyd8Joc5U4+vNIehTCV/CxLdtkt87xKIhX8AeA3FubcdNqd8QNff5YNlQIuxJll/7/pTvlesl4FEySd/YShZp5TxKwsnfyMx3nDr3Iuo2CAHcnbmaQx538kEZ9jaH0oKj5G2zYo2MJ//csA47wFu1BcOHiby7klMY0/V6rCZfvLPKpVHrs5MyNUWM6jEG3lT4Ydqz3vJeG739HL5SAfQ/t1MZeqiQNhfVgoXUjk4ZjrFM328J1AOyR+3VwRBcu/rntiSkquIDrfs8qZeimTtr42S391xS47+cgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM0PR04MB6819.eurprd04.prod.outlook.com (2603:10a6:208:17f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Wed, 12 Aug
 2026 18:50:19 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0315.012; Wed, 12 Aug 2026
 18:50:19 +0000
Date: Wed, 12 Aug 2026 14:50:10 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Koichiro Den <den@valinux.co.jp>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>,
	Kees Cook <kees@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Christoph Hellwig <hch@lst.de>,
	Serge Semin <fancer.lancer@gmail.com>,
	Cai Huoqing <cai.huoqing@linux.dev>,
	Niklas Cassel <cassel@kernel.org>,
	Devendra K Verma <devendra.verma@amd.com>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 01/24] dmaengine: dw-edma: Add
 dw_edma_core_ll_cur_idx() to get current LL entry index
Message-ID: <anzAYsh7LuHOC8FL@lizhi-Precision-Tower-5810>
References: <20260812155721.2807506-1-den@valinux.co.jp>
 <20260812155721.2807506-2-den@valinux.co.jp>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812155721.2807506-2-den@valinux.co.jp>
X-ClientProxiedBy: PH8P223CA0007.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:2db::10) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM0PR04MB6819:EE_
X-MS-Office365-Filtering-Correlation-Id: 42821ab7-40cc-4bc5-a225-08def8a28e21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|23010399003|19092799006|6133799003|56012099006|10067099003|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Ei//FNcjF8fhEtijrw3x1aVfS+D2XvFDmrceDvZrovSYHK+RvXONcSySrMUzjsBVaaZ/spEmzLYzCRmXRJOb4tl1AKZo48fyAaXX8CbLoBYXeq1zOpwHWc2VCHfvx62uy6SNujiQtsDztnsq9A8gtYIjRjEohui5Sxx+vpCwh8QBTBzC62JAPcMY8I9B/arWwrNO4oEB5gnywbv/jaPULN03D6lXKI+ogIOC5EOkddvLHoqpQnOKcqwwQjiJK4m6nG/LAB2ivhQJ4LkvRxnjDx3T1I56kO3LJsN2LyYIZ4hTFCvMFUq5R3Q98Q/hiweV2a8WrToHF1Et9osxwzYWNeo9y9bnoC9Nx9sGvKxpJB3oXL/7398+qjJ0BOO+qlVplZdmDeuW3B5xirvG3im5fCGnH1jKY0mdF+YKPI3ByR06QxNf8rV0JwHPrt73VU7DvoXyGIUxt6JP6ddKPS6DrKL7atxhKNBT7GZjLaCz/O/J7g5UFnRy+1DOQ7oWHYT76mHgZVL1nyuW1ubIQ+BZco+EWPdHy1xyKkldnIr0QBpR4CH+U5XB6UrTldH+fIkn3v3p3na46T0LULd4CYcrJEzYhyt6ZDC5k+oE5g//wggpsPPS0VWne3KxEBZf34A2Vvj9X/vQcja3UP+pyey9B3iRE63nbeytK+Ra5ACM4Kk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(23010399003)(19092799006)(6133799003)(56012099006)(10067099003)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9MoPJNVIfLYb0MkC+CjeNs8E2V0T4Z+xa375ZR4p845fQ4Z+g5zm3rnUHgrO?=
 =?us-ascii?Q?xl/ytzjw21gjSyTN/xOcW1ddiBmyDybtnSR3drN/FY/RuHlY7740e9A9B+F8?=
 =?us-ascii?Q?QvSCiGMQjnXy+Lr1r7v73hgrrV4oSCdZ9ghfqrZP/dg6YlgLae/+lmeWhdOz?=
 =?us-ascii?Q?UROpCvu01j6XsXt/CldNBSnlhORHwpOwnkk3tFuleV27axpFveUfQUv57JXY?=
 =?us-ascii?Q?0l/GQLQvYG/SPBUbNjnTR7/Po/18yAftR7yMilmBDBUnGCBo0O1STYGnz5ie?=
 =?us-ascii?Q?gvsIi9JQNY+cX+DONnJOqq2XyijG4zx5lDI+OdMqgban3BA838mWi+XZ8zWw?=
 =?us-ascii?Q?5XWPwkO1jdfO2vA6HGgNv0x1vdlSitaGcShhY+anxrvCKv9mBxny3+V9rYyp?=
 =?us-ascii?Q?4oLKcrqpRVsSvIEuuA4+Er95N+BMjUt2n52yooT297LVALPnNwLIhT3hium1?=
 =?us-ascii?Q?kvywlUdMRSkCKIs8TPs1s+D8hC/48xlujLXFUwKRa7fr3uONQTrMsOt2XmDZ?=
 =?us-ascii?Q?8ICElPRzR+aBUxDrGA9JFbqYqfnIQke+vqoDpyRoa8CVEhBXYzrgF0qCkqYO?=
 =?us-ascii?Q?fWYAB8oLFx0FiEFDt2AymKI6qL/viUsy7LZ5+GEjKFT4102fb1A4+JyzT7OQ?=
 =?us-ascii?Q?DsJb5xeTVv4iB/vfpEWGnRJzeSCahcbgY6P08eCbs0y+7M7EhLNcog3OjCgW?=
 =?us-ascii?Q?LKuxD4HNHit+8gBARCFMBmXWMY5lP6NGREg8KpIQP9/IIN+nSL+dt7ejUChj?=
 =?us-ascii?Q?ekEV4oOY4mbRHFf7KCB+QAblm2CPhP1fpDjI2gFKy8I3le1ypKyd6IoSjPGi?=
 =?us-ascii?Q?jGgX6pU/kKDoH8c0aB1R4Qm9+qGjf7ZMCKdQMqQ9bh1yE+XU0x3LxaOooWAd?=
 =?us-ascii?Q?SbJO3b8Rx/KFT0wzvLVuKTkTTyWPhlU88x3re6RKNS4/8kJIFjNK+/uNV9NR?=
 =?us-ascii?Q?7Q6Ia6Pwrmo1cEMUfAR8leW5gPuEvD+6Lt6768NtZo3UNIVdmSeKe6VX1z4F?=
 =?us-ascii?Q?diHxFwMw91o3QBGnp2+Gk2huKDoPyvgPck0+C8VuJOoXFixKvzRqb64H4V/7?=
 =?us-ascii?Q?B6XsA96gskPNF5iAjGajtrfCvUrkYsMWgVs5r+ty/+0AD/4SLOmuDvFeW3fO?=
 =?us-ascii?Q?K6LafiWB3eAebG4g0KQ7bdm6TDSKtEv2pfrad65jK00vFWyW9wBhQhU3VN9i?=
 =?us-ascii?Q?B/giU+qISBBeyq4iQeeQeZ2/XqvOnVzTf2rN25fTY4jB1ea5fDfuxVxJ3+SW?=
 =?us-ascii?Q?zYlD+qfu748HMEUf9DbJvwnvfQhB5y9tJilV1apCmG6ea8mMO8hYCto7qnhp?=
 =?us-ascii?Q?ayUlf/8+uPcrUUpKvFsI8ndRk18QxNRWd/kk3G+pRHN8UvM/8VQ1jy0OUIE6?=
 =?us-ascii?Q?2ih3NMdmJYZDAeanuqhDTo+w42GSwRhevRyQdmJkoSmpjWJ7bHQ9WFsKL8O0?=
 =?us-ascii?Q?kVo8Y04GykHOcTntoiWUKyy5UU/TVCYGMm9/Cc2PfLsd9MKL5cxEjF7ctYRB?=
 =?us-ascii?Q?k+4VIv+z4nWMVVAsQJT4J/1wsZxMt2quON+8qSasCgafXtCC2AxKnnKXhRJr?=
 =?us-ascii?Q?6cJ38B4ZSuxlSiqcUI8WxAckyxGMN8x1/WjSMbav7nTET5/EYaUbtwtkixef?=
 =?us-ascii?Q?3kcSDlKAywKgYjDo+hvFIasCkE373SOUI2+VtHIqyeSm3a2T0inwef+8AnbR?=
 =?us-ascii?Q?FODC620zNYpDDaRjEx38j0h0VLPRDtWG5AVyQg7iwbGRbZnXBMkvBVLkpfpa?=
 =?us-ascii?Q?wRKAjaDvfi1aemFyeoDqjsSfIX7cmhs=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42821ab7-40cc-4bc5-a225-08def8a28e21
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 18:50:18.9930
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7i/7wDXnURZt7cpt57R46jyCN3AddWh2IPwxuDQfnhiYmLu7jG6HpKwlTXVYlZbiuFpPfpy5RyeqTHKd8Odldrhs2WHPVwnXF8KgDJkxzy5x9/LXTx/1HaJbDFrqBAA6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6819

On Thu, Aug 13, 2026 at 12:56:58AM +0900, Koichiro Den wrote:
> From: Frank Li <Frank.Li@nxp.com>
>
> Add dw_edma_core_ll_cur_idx() to get the current LL entry index and
> prepare for dynamic addition of DMA requests while the DMA engine is
> running.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Co-developed-by: Koichiro Den <den@valinux.co.jp>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---
> Changes in v5:
>   - Reject an all-ones DMA_LLP value before converting it to an LL
>     index. (Sashiko)
>
> @Frank, I kept your R-b tag since the v5 change is only a small validation
> check. Please let me know if you prefer me to drop it.

look good

Frank
>
>  drivers/dma/dw-edma/dw-edma-core.h    | 10 ++++++++++
>  drivers/dma/dw-edma/dw-edma-v0-core.c | 20 ++++++++++++++++++++
>  drivers/dma/dw-edma/dw-hdma-v0-core.c | 20 ++++++++++++++++++++
>  include/linux/dma/edma.h              |  2 +-
>  4 files changed, 51 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
> index f6a5ad317567..e50fa7965778 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.h
> +++ b/drivers/dma/dw-edma/dw-edma-core.h
> @@ -138,6 +138,7 @@ struct dw_edma_core_ops {
>  	void (*ll_data)(struct dw_edma_chan *chan, struct dw_edma_burst *burst,
>  			u32 idx, bool cb, bool irq);
>  	void (*ll_link)(struct dw_edma_chan *chan, u32 idx, bool cb, u64 addr);
> +	int (*ll_cur_idx)(struct dw_edma_chan *chan);
>  	void (*ch_doorbell)(struct dw_edma_chan *chan);
>  	void (*ch_enable)(struct dw_edma_chan *chan);
>  	void (*ch_config)(struct dw_edma_chan *chan);
> @@ -181,6 +182,15 @@ struct dw_edma_chan *dchan2dw_edma_chan(struct dma_chan *dchan)
>  	return vc2dw_edma_chan(to_virt_chan(dchan));
>  }
>
> +/*
> + * Return the current LL entry index. A negative value means that the channel
> + * context is not initialized or was lost after a link reset.
> + */
> +static inline int dw_edma_core_ll_cur_idx(struct dw_edma_chan *chan)
> +{
> +	return chan->dw->core->ll_cur_idx(chan);
> +}
> +
>  static inline u64 dw_edma_core_get_ll_paddr(struct dw_edma_chan *chan)
>  {
>  	if (chan->dir == EDMA_DIR_WRITE)
> diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/dw-edma-v0-core.c
> index abc1bd4c0be2..cc8059182940 100644
> --- a/drivers/dma/dw-edma/dw-edma-v0-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-v0-core.c
> @@ -616,6 +616,25 @@ static void dw_edma_v0_core_ch_doorbell(struct dw_edma_chan *chan)
>  		  FIELD_PREP(EDMA_V0_DOORBELL_CH_MASK, chan->id));
>  }
>
> +static int dw_edma_v0_core_ll_cur_idx(struct dw_edma_chan *chan)
> +{
> +	u32 base, val;
> +
> +	val = GET_CH_32(chan->dw, chan->dir, chan->id, llp.lsb);
> +	base = lower_32_bits(dw_edma_core_get_ll_paddr(chan));
> +
> +	/*
> +	 * LL regions stay within one 4 GiB address window. Reject an all-ones
> +	 * MMIO value. If the low word is zero, use the high word to distinguish
> +	 * a nonzero boundary address from an unprogrammed all-zero context.
> +	 */
> +	if (val == U32_MAX ||
> +	    (!val && !GET_CH_32(chan->dw, chan->dir, chan->id, llp.msb)))
> +		return -EINVAL;
> +
> +	return (val - base) / EDMA_LL_SZ;
> +}
> +
>  /* eDMA debugfs callbacks */
>  static void dw_edma_v0_core_debugfs_on(struct dw_edma *dw)
>  {
> @@ -650,6 +669,7 @@ static const struct dw_edma_core_ops dw_edma_v0_core = {
>  	.handle_int = dw_edma_v0_core_handle_int,
>  	.ll_data = dw_edma_v0_core_ll_data,
>  	.ll_link = dw_edma_v0_core_ll_link,
> +	.ll_cur_idx = dw_edma_v0_core_ll_cur_idx,
>  	.ch_doorbell = dw_edma_v0_core_ch_doorbell,
>  	.ch_enable = dw_edma_v0_core_ch_enable,
>  	.ch_config = dw_edma_v0_core_ch_config,
> diff --git a/drivers/dma/dw-edma/dw-hdma-v0-core.c b/drivers/dma/dw-edma/dw-hdma-v0-core.c
> index 36ee72efcd31..19da1c8fd615 100644
> --- a/drivers/dma/dw-edma/dw-hdma-v0-core.c
> +++ b/drivers/dma/dw-edma/dw-hdma-v0-core.c
> @@ -384,6 +384,25 @@ static void dw_hdma_v0_core_ch_doorbell(struct dw_edma_chan *chan)
>  	SET_CH_32(dw, chan->dir, chan->id, doorbell, HDMA_V0_DOORBELL_START);
>  }
>
> +static int dw_hdma_v0_core_ll_cur_idx(struct dw_edma_chan *chan)
> +{
> +	u32 base, val;
> +
> +	val = GET_CH_32(chan->dw, chan->dir, chan->id, llp.lsb);
> +	base = lower_32_bits(dw_edma_core_get_ll_paddr(chan));
> +
> +	/*
> +	 * LL regions stay within one 4 GiB address window. Reject an all-ones
> +	 * MMIO value. If the low word is zero, use the high word to distinguish
> +	 * a nonzero boundary address from an unprogrammed all-zero context.
> +	 */
> +	if (val == U32_MAX ||
> +	    (!val && !GET_CH_32(chan->dw, chan->dir, chan->id, llp.msb)))
> +		return -EINVAL;
> +
> +	return (val - base) / EDMA_LL_SZ;
> +}
> +
>  /* HDMA debugfs callbacks */
>  static void dw_hdma_v0_core_debugfs_on(struct dw_edma *dw)
>  {
> @@ -406,6 +425,7 @@ static const struct dw_edma_core_ops dw_hdma_v0_core = {
>  	.non_ll_start = dw_hdma_v0_core_non_ll_start,
>  	.ll_data = dw_hdma_v0_core_ll_data,
>  	.ll_link = dw_hdma_v0_core_ll_link,
> +	.ll_cur_idx = dw_hdma_v0_core_ll_cur_idx,
>  	.ch_doorbell = dw_hdma_v0_core_ch_doorbell,
>  	.ch_enable = dw_hdma_v0_core_ch_enable,
>  	.ch_config = dw_hdma_v0_core_ch_config,
> diff --git a/include/linux/dma/edma.h b/include/linux/dma/edma.h
> index 3c8e2ef9dee0..a4e5aab8fddc 100644
> --- a/include/linux/dma/edma.h
> +++ b/include/linux/dma/edma.h
> @@ -130,7 +130,7 @@ struct dw_edma_chip {
>
>  	u16			ll_wr_cnt;
>  	u16			ll_rd_cnt;
> -	/* link list address */
> +	/* Linked-list regions must not cross a 4 GiB address boundary. */
>  	struct dw_edma_region	ll_region_wr[HDMA_MAX_WR_CH];
>  	struct dw_edma_region	ll_region_rd[HDMA_MAX_RD_CH];
>
> --
> 2.51.0
>
