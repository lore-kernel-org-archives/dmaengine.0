Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011064.outbound.protection.outlook.com [52.101.70.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B88B52843A;
	Fri, 18 Sep 2026 21:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789767726; cv=fail; b=i5ZHcCcjNljJLnu9Ko+y5VQc1lCBxc/KqOrGC7SFmK9pUdkziaOZkVEMMQ9iURi+IVoZItaTjX+OYX/TPfrVIM6tpsKKJS6Px9kXVupOvxo53gxZUAOX9oiTU74AdTv87O8FqdJGS48spBzMCJBvkb4CY1F2pE1VQJT57tKivWM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789767726; c=relaxed/simple;
	bh=KTSDfCZjGlwcS54KOOZZJptEKRknz0RVfdmYMr9cCes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mr9tBlqM6O9JEK1bK7hY8t7K6sA7L/9+69pAde+pDhaeafVuzZhrWkAvkrcIdRL3wmfnV26E+DPElq9gj3QZHO6oCuvLmOgEt8ypIVcZlEPKQmOjFcM0m8QiyfwHEkbzsTZ8YrkaD1/yBY917TCgLOlQjZ6he9KXETRV/v3vakY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=clAp+9mM; arc=fail smtp.client-ip=52.101.70.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="clAp+9mM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YPo4dATdM1iCrwLaHSsYoabQk8a1Jb0duJoK1djgNW46afnWytqGyV1Hp3dgbTBx2hEnw9cHPBDDYjKva11lQ4t+q2wgW3vAby4tUX/a3cpIQY8SZc1ZvU8IQN/ODD4MLIZVIJfro71EE8Lt6ufkqRJYrUTLg2pl+16ZW2IczNMuqeAgPThRLZcvF6u5fRQaiCE8ddYsoiCB26bcQzRpPSQ4NzWI7PtsV4f2CJtsbxIgnikN7PcovBGReSAwFnDUXRfr6JBpdJz9JtIL8SCWLrLnMFqjfN+8Ak9HbKSE7SYIlSXx+SCR2cXaLQ68BCztNrz/sHNRC74djWcADCGO/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fdx2ZzH0ZdO65HOn4ONR2D2vT7gJ633mmd8pCXgfR60=;
 b=rWRD6N9xEQdYqnUQvCWqrL44GNYibANVkbak7hmoyMMFvWj8rE6vNEHux0HndRYuIThNC29ifaPEUowdQwA/gLQLUupxvtsHEsOiBDRrePFpVnEa+xiefFUaNoWr71aob1fLhlB205UrSyuDTsxKcwlZnT4xSIViH/y08IfjHTpN8t0fdNv4nbVtYxOJJ6ypy15JjL+rQWKaTiyEJmjbSfbPUDq+Kb9+NVOmMqUbs1TKKZnIOnGcKxexVgAlLN4BxlOflcbPfem4Gv5XPwMeVjhz5GT4U8GPEIPC6xn+s7yJcKM6gOcO7HGg4yytswUW7oMNPOt0c6PsIbq/d2S7qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fdx2ZzH0ZdO65HOn4ONR2D2vT7gJ633mmd8pCXgfR60=;
 b=clAp+9mMCgYg9Kgur1hu+LPcsmDp2ujOnyypcHcF2QjJ6jUGOurrFwf934bweX8DULPCmn3VX5r5qj5P3YxNM8I79wGbO7VEoqNL3rTrD43CYxO7Rglu/d/R9rkB7mrCfEZOo4y1sWFQT94Lyxs0twoVbbXkKtHpIGEP9oAsiHcGY3X8sUkt3P5LC06++DD2bAQKCgWhgrWxaRWlur6Va+lk3RAVj6RYa7L+aCDiIfI/veK4Uw3j4AGx92rsVFr242/wzWWF54PAcGtUL5qdzLghcN0MgbipcxQo7AbFa2HQCDdVP7P6844nE0QnDxSp2WVBhT4p+JaCSzlcz72f0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VE1PR04MB7248.eurprd04.prod.outlook.com (2603:10a6:800:1aa::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 21:42:00 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 21:42:00 +0000
Date: Fri, 18 Sep 2026 16:41:52 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 02/22] dmaengine: ste_dma40: Fix cyclic transfer
 residue
Message-ID: <aq2wIPJW6viUxyy9@SMW015318>
References: <20260918-dma40-fixes-v3-0-8dd8450669e8@kernel.org>
 <20260918-dma40-fixes-v3-2-8dd8450669e8@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918-dma40-fixes-v3-2-8dd8450669e8@kernel.org>
X-ClientProxiedBy: PH8PR22CA0023.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::21) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VE1PR04MB7248:EE_
X-MS-Office365-Filtering-Correlation-Id: 85beb8bf-f3a1-4356-b685-08df15cdabaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|1800799024|23010399003|11063799006|10067099003|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	hcmD3zD9K3JHpyg6gpLi0SFyEOoASs5wXA5aYeOo3LpyKKvKAa3MVLRdN76pCkbw1FS9jTNEchxmpkmhIZNtYpukll/2m5tZPFW0tBqTbrU/p5JmmZi8L4HiI9pVpibne817s3344FSD//w3fpSbUGFENKnWbW3Z7sHOWDkIXPeY6+f1kewBTNdQAy5LCwI9MNluAMVRzTjTs2IjEiaye+WZRIjz32rnCZq+2wRpsaiKmmgUEklJBmXltRu1taQuCndYGSgL653u4RQUe1/2XCTcacLm4SL0RSJVP64KYkjbmtrxA5E7wnmATO1Z/rSiPVd5q+B6uvOtZ+VZ0qvmuElfyefN/IZ2HpdYS1f1SIJ7hhZRcP1QRw+hsyd7CTaaJF0w+gxLjYQgu+MOp956TDENewMbRzUrfj0icHidNeyViGNAu3JSo/2FPl/7WEzFHa3Bou+yDOF6Vy/hOOa6k43NzCxlSxs5N2JU3WQrmvRWZ+EsXk5qhBJ/K+L1+8WjnoK+FqodJj3ThREf7clhidaQuGuEq6WuEh3zjgTQgtLo+kcXTgGpaTwL+MKkbJ9Noog4QstsjUNUnh0zjto5OZI6nd6FnSvD9N0UVaiaKk9qcsNgg5lQ7MyFNCH6tyz6nTvkDqeFM+DffjGaEdbFp0ss3GtPuM2Y10TsygGeDRU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(1800799024)(23010399003)(11063799006)(10067099003)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AhCCSiff5hW8JwAvngjZHaaDi3MvvbuHrFukEOVtpm3Ymsgg4HTBT/u/wB3V?=
 =?us-ascii?Q?/R5J3elPkFTNNsR1yQ74mQ+EHs8g+KQr6NNWcyzwpvqFjsu+5MLBV3S+B4BV?=
 =?us-ascii?Q?HdOom85NLtzxupnxLlwHVJ9Q7ovcWJlrGho2ttsmwZXvJmry6YcfDHkqagb7?=
 =?us-ascii?Q?KgYLJwB2C4xxXr7UqzmX4LlzaNlytQVfqczPq1Xi1ATzbWFfuvmWE2/cA3v5?=
 =?us-ascii?Q?IR4kBLNyxeEF+gmaOBLm/27r3mptZgDFSooLEnuGufqv5vA6SG9e6l76od0Q?=
 =?us-ascii?Q?GQ62ALjxrekuwGzzq7VSpebTVHAK+n/0jF6IShboDl+y8aE9dtpLsshySh2j?=
 =?us-ascii?Q?0WLudfNDrPa031hHNqX5O22N/oTvHXHzM7ucR810ABLZSeEVaUuCJWPw2mbm?=
 =?us-ascii?Q?ZbASns1CIc580nIV7T4zJbdeWqQtrJGQjiraRgAFWhCUWUHK6Kn/O5i2CLAp?=
 =?us-ascii?Q?12AlKUzF1NpKWI7OLH0ulmsfJP4pNKwCFxV+wQxhMgVsjTiqNMPRPu99vwz+?=
 =?us-ascii?Q?xjgqRiSHUbZQS8M/FCCG0aihaBfWgmts30QQZe2QIc//mL/dXgbbed+QwPw2?=
 =?us-ascii?Q?YnYnB/rqCzOtbGPerzG/uCfpVLIsLFwT55kCUHjWLW+jUIcHUbtC5Akv7NYh?=
 =?us-ascii?Q?WmB6Gxmb3SfUHTYiwkGjDDMPQx4q4n3Qo2DTA1YKxEaiY2x8qC0VRID3+uug?=
 =?us-ascii?Q?QQKvGM5nDHO7/NrZfS0sPr/u98iU3Bl3nozriQngzUtlCcsOGGYliD8VCPJs?=
 =?us-ascii?Q?8S+w5zhHjsqPSXGr18jaG0MeceYS2WgSW1Z4iJX11xbGRzGXNXXBsWLV8Y2g?=
 =?us-ascii?Q?z+JKH9S4Mf7+PA8r01mIGsKO9763ItXgXRBBLgeg2as1K8MrndUssZyyIjd/?=
 =?us-ascii?Q?M5qwz9psFJ8CAzrsno0IafXBlt4uFO1Fr3H7CklSqSzGffT3SfKLvGXmT3lk?=
 =?us-ascii?Q?pliAEh2NnOKbiAvL6a7/puWmtPFTYpL/SymAOhBiEz75gmIzJHKQcIDfO0sg?=
 =?us-ascii?Q?y12ojMaL5tVqQmbqMB/P4RdrgkRsJKnjQvwBue798dGCT1LC7TASO/kYMLeR?=
 =?us-ascii?Q?gQib8gyBZyq9wVjifZZbbtMZjzSD+GLRx2FAA7DjbyOFAy7EQiPkom9sf3Xs?=
 =?us-ascii?Q?wEDmVgeDo49Fblki2nQEG6UXwWY2BelRFw4eIyz+DP6/Qesbc2BREL0iITWT?=
 =?us-ascii?Q?DQS0ZLD4TKdZaXFoBRNzCPychJPaHZIoKgbjuKgRMJSRjaMwC0xsk/q5xAX8?=
 =?us-ascii?Q?n3B+DoYIEHOzb15oHC0tLGJiORsb5eOh81pzpT+Ek6nSMcmcxFIRlhaJ/53M?=
 =?us-ascii?Q?0iEpQxBG5ZCwd+A6c1EWl1jA5Z/XUmnF7TfDIlVty01bt+ND8lM/0IKAP9y3?=
 =?us-ascii?Q?fXPNekLOctA+TL3DMqWCcm90ZJRd1mnYXUzo39fDtb1K8DcbxhFR+gHGMscK?=
 =?us-ascii?Q?kt1/v/5Vn5UVgYgt1yIwNE7BstATAM3R9hPA0C0xUZlcPWBUbi1Vc70ZH/JD?=
 =?us-ascii?Q?b2uC0uqD8/jLu6ei3zmI3booK+6sJQ3Gq3E4fRZGYZ+MJgOyDJ1ltCMAHtDo?=
 =?us-ascii?Q?cDre6BV0IfclCQmbCRNq03gRcYULF8K5xJEi66njkGiOs0CInY4GFVKMOF5C?=
 =?us-ascii?Q?te1MdTv2odSRBuVfBZcaU3kfeWSvnzKSfnaJQc5zk1TgZVsoZEiW7nvrzlJu?=
 =?us-ascii?Q?f7c3k5qJ9ErhFfAfhyF8E3oDdgEQS4cVEdVta2gsAXlP1P+YG8bwfMf73HhX?=
 =?us-ascii?Q?JFHcQ+v2q0tc22RxQow1W0VnvJVkZ7b47cuX6hDeBQ6M+JRmN0zc?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85beb8bf-f3a1-4356-b685-08df15cdabaa
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 21:42:00.5283
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xtbhe91zLuCLIEi5290LqR97Z54oESs1ehvab4eWNWfwOf8G0DkBAPuUXlB0Ovap06Inzehu+q+N843E35aUPcHndjLanhc//wgAPevx8YyJxhBml5a+W6ol7pQ4V44l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7248

On Fri, Sep 18, 2026 at 06:24:21PM +0200, Linus Walleij wrote:
> DMA40 reads residue from the element count of the currently active LLI.
> For a cyclic transfer this reports at most one period, not the bytes
> remaining until the cyclic buffer wraps.
>
> Once DMA40 advertises burst granularity, DMAengine PCM uses this residue
> directly. For a four-period PCM buffer it consequently reports the
> hardware pointer near three periods after every period interrupt. ALSA
> eventually stops playback with -EIO although DMA period callbacks
> continue.
>
> Track the active period of cyclic descriptors and add all later periods
> in the buffer to the current LLI residue. Update the active period in the
> terminal-count interrupt before scheduling its callback so residue also
> stays coherent around period boundaries.
>
> Also reject invalid cyclic geometries before dividing or constructing
> the scatterlist.
>
> Fixes: 15c606686541 ("dmaengine: ste_dma40: indicate granularity on channels")
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  drivers/dma/ste_dma40.c | 42 +++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 39 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index e4d689c9eba8..49e9139e0ad0 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
> @@ -378,6 +378,9 @@ struct d40_lli_pool {
>   * @lli_len: Number of llis of current descriptor.
>   * @lli_current: Number of transferred llis.
>   * @lcla_alloc: Number of LCLA entries allocated.
> + * @cyclic_buf_len: Length of the cyclic buffer.
> + * @cyclic_period_len: Length of one cyclic period.
> + * @cyclic_pos: Start of the current cyclic period in the buffer.
>   * @txd: DMA engine struct. Used for among other things for communication
>   * during a transfer.
>   * @node: List entry.
> @@ -396,6 +399,9 @@ struct d40_desc {
>  	int				 lli_len;
>  	int				 lli_current;
>  	int				 lcla_alloc;
> +	size_t				 cyclic_buf_len;
> +	size_t				 cyclic_period_len;
> +	size_t				 cyclic_pos;
>
>  	struct dma_async_tx_descriptor	 txd;
>  	struct list_head		 node;
> @@ -1566,6 +1572,12 @@ static void dma_tc_handle(struct d40_chan *d40c)
>  			if (d40d->lli_current == d40d->lli_len)
>  				d40d->lli_current = 0;
>  		}
> +
> +		if (d40d->cyclic_period_len) {
> +			d40d->cyclic_pos += d40d->cyclic_period_len;

You depend irq handle will be called every period.

if period is short, like 100us, is it possible hardware combine twice or
more irq to once, cause miss count cyclic_pos?

> +			if (d40d->cyclic_pos >= d40d->cyclic_buf_len)
> +				d40d->cyclic_pos = 0;
> +		}
>  	} else {
>  		d40_lcla_free_all(d40c, d40d);
>
> @@ -2108,15 +2120,27 @@ static bool d40_is_paused(struct d40_chan *d40c)
>
>  }
>
> -static u32 stedma40_residue(struct dma_chan *chan)
> +static u32 stedma40_residue(struct dma_chan *chan, dma_cookie_t cookie)
>  {
>  	struct d40_chan *d40c =
>  		container_of(chan, struct d40_chan, chan);
> +	struct d40_desc *d40d;
>  	u32 bytes_left;
>  	unsigned long flags;
>
>  	spin_lock_irqsave(&d40c->lock, flags);
>  	bytes_left = d40_residue(d40c);
> +
> +	d40d = d40_first_active_get(d40c);
> +	/*
> +	 * The hardware residue is for the current LLI. Cyclic transfers use
> +	 * one LLI for each period, so include the later periods in the buffer.
> +	 */
> +	if (d40d && d40d->txd.cookie == cookie && d40d->cyclic &&
> +	    d40d->cyclic_period_len)
> +		bytes_left += d40d->cyclic_buf_len - d40d->cyclic_pos -
> +			      d40d->cyclic_period_len;
> +

I have some confuse about this formular, what bytes_left = d40_residue(d40c);

d40_residue() read some register value, I am not sure what's means.

and why d40d->cyclic_period_len,  d40d->cyclic_pos += d40d->cyclic_period_len;

pos should already consider cyclic_period_len.

Frank

>  	spin_unlock_irqrestore(&d40c->lock, flags);
>
>  	return bytes_left;
> @@ -2524,11 +2548,17 @@ dma40_prep_dma_cyclic(struct dma_chan *chan, dma_addr_t dma_addr,
>  		     size_t buf_len, size_t period_len,
>  		     enum dma_transfer_direction direction, unsigned long flags)
>  {
> -	unsigned int periods = buf_len / period_len;
> +	unsigned int periods;
>  	struct dma_async_tx_descriptor *txd;
> +	struct d40_desc *desc;
>  	struct scatterlist *sg;
>  	int i;
>
> +	if (!buf_len || !period_len || buf_len % period_len)
> +		return NULL;
> +
> +	periods = buf_len / period_len;
> +
>  	sg = kzalloc_objs(struct scatterlist, periods + 1, GFP_NOWAIT);
>  	if (!sg)
>  		return NULL;
> @@ -2543,6 +2573,12 @@ dma40_prep_dma_cyclic(struct dma_chan *chan, dma_addr_t dma_addr,
>
>  	txd = d40_prep_sg(chan, sg, sg, periods, direction,
>  			  DMA_PREP_INTERRUPT);
> +	if (txd) {
> +		desc = container_of(txd, struct d40_desc, txd);
> +		desc->cyclic_buf_len = buf_len;
> +		desc->cyclic_period_len = period_len;
> +		desc->cyclic_pos = 0;
> +	}
>
>  	kfree(sg);
>
> @@ -2563,7 +2599,7 @@ static enum dma_status d40_tx_status(struct dma_chan *chan,
>
>  	ret = dma_cookie_status(chan, cookie, txstate);
>  	if (ret != DMA_COMPLETE && txstate)
> -		dma_set_residue(txstate, stedma40_residue(chan));
> +		dma_set_residue(txstate, stedma40_residue(chan, cookie));
>
>  	if (d40_is_paused(d40c))
>  		ret = DMA_PAUSED;
>
> --
> 2.55.0
>
