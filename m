Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011047.outbound.protection.outlook.com [40.107.130.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D6E3D47A5;
	Thu, 24 Sep 2026 14:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790260649; cv=fail; b=TaNHHW/7RfzJmy0moZJR2vg4YU6iPu93fw+eZoxtzqi9FF2X++J1l8d0QGxCe9PzVFYsxz2PMfgvKj4XH8MYng0g1FLa4TCEJUjewMbStvqbKyHWhk6zNN3xDrXRVkyKKn4CMF2kfRb/kKmUX4VSHqo+iWH59DVemky09MtM7ic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790260649; c=relaxed/simple;
	bh=9vq+oj/6Ms/LFxAg4nMCIwM+JfunAseLeC54WLS53SA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OCTNgTf4tCI79cXl8dXmRrIyEMK0ccslZYE1e01mfvolQ36ByZzHFn4RdqnaMHINnYhEguCjvJ1fPHHtcXIXjJGp2O9F6zPSLDrUeSYXCWNmQ7QKCpiA8KH9WKvu+BBikAfIx5RmFmyFjB5bkAs6f9t+FBSlglGGfNSg2H2l90c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=I+JPTYYW; arc=fail smtp.client-ip=40.107.130.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="I+JPTYYW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S2WPD3ITwbdyZ1e5T3S7M1+693weYcIeDdcI5zKxz03eKL30wqbTiA8+jFwmrvXW3DoDqnR0zS+wopmV4o/ThNvRQHHXizT+5ImHGrr6SbNddgm9Ofuuldax93FN7sLyaSfFGL8vdF9de4LWyIYfQ/1YVw584CkU7qJsH2XsvqTYrbAcE/NyAXCvB0Z3aM/Is66PTgowBgjOHkUl4VJMUnTYQJeHeIbwDkzetqJ2VcGj9BSCGoD//QJm1uAuOitoiYLpfI/rE6MueefuogOyZS0uF8FMHNl/8CrWmb7H75h4vKVroTetuFQPJGY/WO+xTiFfcHv17hplb7TwJGGgiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fEDEmuHVDi4mDjvNOMvvfTsr46Unp6jhfmWw4AFP16A=;
 b=TkroUBbq3icEeiwIuv/2c2zK9d5g1vCfc6CVB42lMcXYN7Z8bFih4ALbPEZ1XFiJe1wYY2P2WgxMwGPe767M+nOCL/0EmDwyVfP0ccvrFVeGpcjtyjDVjnZD8PoSCXRDVT3HdeuoSxCO6ABukP2qOyFGdmuIxJK7ixVAUb7BRXb8l77TV0epd8f3fz5SMSYgJY1YzLWMtBBiWe8GCiAOIEX3iTNsxppxdtT0MzyXWWze6lnREnid7UrgzF3b5IMOHoVmmTXGXmcRxS0WuYJ6jWG94DnTz7U/SJiW82fFmJWnYIHh9zv6mCRZtPgGqNcjZhxK7oJ9FfkvwxIThGh6Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fEDEmuHVDi4mDjvNOMvvfTsr46Unp6jhfmWw4AFP16A=;
 b=I+JPTYYWU8fjLQFGU1V7vc9jBoYNDaucoGYZNqnm1JHM0mLlznqMD/75TbgJRL2iRFXzTdb5lGm1Ac/y/vzc9fJL8jeBweGbFNt02t/8jG/gPbjlKRDNqbLS6P/pHesBQWXZtZeUaJ5MkCGsAfTu7ao1cyp3Vd2zw24LdsmwBe2XLlX6YEDtbz07SU/zuCZTcfs30YZVHaOMydBz58EM60Yanwounh4CqX45KXNv505Q46iV7TeFU02lbLw/jRbk7adpZm7ASu017Y0HRw18Pa39laa/naFlOt4yYzRqEuFzer8o16h01MOg8JxWSuFM97mM5ZoK0ibazo0myC9jvA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by MI7PR04MB897750.eurprd04.prod.outlook.com (2603:10a6:290:102::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 14:37:25 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 14:37:25 +0000
Date: Thu, 24 Sep 2026 09:37:18 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v6 02/23] dmaengine: ste_dma40: Fix cyclic transfer
 residue
Message-ID: <arU1nsEFPn43Madb@SMW015318>
References: <20260924-dma40-fixes-v6-0-fdb6755020a2@kernel.org>
 <20260924-dma40-fixes-v6-2-fdb6755020a2@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924-dma40-fixes-v6-2-fdb6755020a2@kernel.org>
X-ClientProxiedBy: CYXPR03CA0096.namprd03.prod.outlook.com
 (2603:10b6:930:d3::17) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|MI7PR04MB897750:EE_
X-MS-Office365-Filtering-Correlation-Id: 41305d0d-f96c-49f2-3e77-08df1a495994
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|23010399003|1800799024|376014|56012099006|6133799003|10067099003|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	S1B8WhAoPUnhnP3F6Tjxf4ivSim2mJ7m02gBYe+Tq2dqYUPbOxaTp+IDrVkt8KgGT9dSb7RnnAy5WZ1KsK1/1j4ZXrTvL8PpjRhmJHagxrznYwutV/x4hyvGTAp2godthx5KW1O4z/cfDrIpYj3DlR8DwmfpAbeOzsSnD/6OgNZYbI3B1p7xQUCsh+eyrts8mpLoTP5RXJ35DXrZ81z2lXyyQx3zU7X3iJ6XKUf6gYz2P5/X5jGGLInsCFcwwPBW0Mr7BQwgxruFTyUXeEGN3rC++cJt5CzDPMXMJDUlVlGtIX/Cl1/1Zw+kdgsf1B1pNwD2gbdWGheVHlOYtdNghnatpJEqmMzssDXbCar6Nh0YQEyS9TECEIB0Z9tkzwmUGizNufDWPBpKPTTPjbmiJcoUWYcpAdatheA271J4fdBaB4FBNT/8B7vfV9byfC1W43721XkJDCNmL4twiXwMCHGjOJplpIOoPSklY2OJKFagXiu+WCI/TL5jDjsV/TNznHqEC6zrPK/5qPTTZVjDVa+8rTb3mKrHTS9eSsCgRwNhiJi/GM1WOwQCueVs32VQ5puXGj+xSrJBUK6onVKH6RZ4RYyio14WPR+C9TT4hiZK1iQglAT+9scIC8a5iSkzREuBIZ8rOESu2GF8/HRTZdqnH0wuHgiInVw6Gvb5UsU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(23010399003)(1800799024)(376014)(56012099006)(6133799003)(10067099003)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Lg8WIJX6GaDiNETUhxd2GV1GKOf+1KRe3/fl3qxUM3HclzlWRByFRNVaGjuH?=
 =?us-ascii?Q?KCSUUA38afXZDVN5e0aQUOu/uARElrwPfQ2dMWCFEuHAC2VW4nGVsYjrvmmb?=
 =?us-ascii?Q?Ur0MB+j1xg6fuC6mhj+MF4aBngBU8pryw9EMc1G1KEcI9zCkIZL+MMO1rws3?=
 =?us-ascii?Q?/+W2i2AR0b8Y/bShMjHo5fAvNXTjJ8XK8Ky+GUO2QhqmZKNHt3QjTv3KlWlq?=
 =?us-ascii?Q?YVJC0lItin3uSNQ4/vkwUkOIHImcrZnQpGP3Y105SMiVBwXnQ/WxqJ4UXg+6?=
 =?us-ascii?Q?fRkNYAyjZ1Z5qSqoHY6OOGlOqN2Rp6XPfYdVVwwrNrU2Yhil23txIYwoDXH6?=
 =?us-ascii?Q?vv0qDODgBqzu2sUhKjACNLvrPR9+xmCNMx/qlrFJ+OP2b+GWVGbV4mBIAsU+?=
 =?us-ascii?Q?TJjqhVb3MwHggkG7UuEfQcM7SqIEJStN9drdIakSUC5tl3C49jEZ7sXbZHqh?=
 =?us-ascii?Q?+0dgWKK5Q8PvEpXgHE14DGtlcxD0Bp/kv/9VBcgAiFhW4nlzHDyvcySSF2Xt?=
 =?us-ascii?Q?mZcIumYy+TW+OgWxANVUfw8LrT6nKGqguznmiN8yck0M0o6tVL8Mpdqe6cvC?=
 =?us-ascii?Q?zMTP0NGSNHl5jXXgCAAm15Smm1ODzEfHBoJ/8I7nAHA52Ok3FPlAgR8MlScf?=
 =?us-ascii?Q?OsE7e40sxy7LIw7ZSb4KUledubrkSxrmpYWSBN6imi2eO5UjUr17Y3TN/NQr?=
 =?us-ascii?Q?YlfzhDd7Se+0mRRMYj4X2XMFTK+tX8T7Mmc3m5GskFn36LPA/l/8WMULRH9N?=
 =?us-ascii?Q?ftdzHDIqc33yUwx3k7dm/SZWvJR0BpS4sdU08uIwAfy127gUT/ii0Mx6Uz7h?=
 =?us-ascii?Q?8LfAtqBk687/AOMm/XKLjD6bz9EqnoioS/j3b2rxcmC0JBDfIRqyyMqAozz2?=
 =?us-ascii?Q?oTnSYHNvX46e+3A+jvt+JFcL9phdcRyWgJuP15rKqNZUxo4scArPj25WE2+o?=
 =?us-ascii?Q?SOabTYcVgE3MiZ4JS2LXGfSPHsBTdnkWf2FxMxwPyWlF+njNf1BnDubrubYS?=
 =?us-ascii?Q?iMVNr5wJqHIHJUQw9o9BegmEmH/s2yJ9jDR26lnvYnDkJm3j5xkkIv/ippPg?=
 =?us-ascii?Q?bj6mMl/2Z3aPU/5yWIatbKssfFF/ABV5YuNutAvhqslVdpZ3eelQCe1wq9sP?=
 =?us-ascii?Q?+1lhwUZM0dqjjZ5zA4tHmpBYS7n19aJXoO1a4WnebKa1QQ5Q4xvsduvEBh6k?=
 =?us-ascii?Q?BVqx2bwpiFuBOOu2eYAF3/5r33JXRkRtiUl7w/Afl7HXAKVIhIOyrlDbGy7I?=
 =?us-ascii?Q?rmH06qg7H+9/xNEh6HWoa4E1TXux9xxmfgf/vtpfAxuQ0zBY3K2ZVkoGw58m?=
 =?us-ascii?Q?A3ICXGq6ccF/InpTtvu0uoXErmdOWAhQh2zgdspXv0196pY8MWefhbl6XQ6J?=
 =?us-ascii?Q?wxS9MS55cRh/2TSsUttWEetPvfW7SWqkGr8sWvBWaElgKoPrrGtSYV9JbrjF?=
 =?us-ascii?Q?LGZflAvNM0CXBUTcOEft982yX1oQfQWXis8EhdNdW5YEXuRzGs2Qo5lU91Pq?=
 =?us-ascii?Q?T5UbUg/abOXmXblJ/Kl3N5yNEFarWwUZVeR9TpbXeQIVvmlEcX6hZDc8XQ2M?=
 =?us-ascii?Q?WMxTOmljg10V7en9PdrsXv0K9RbsqYJId4H6yapqofuUq9i+5vkcar4EQrBe?=
 =?us-ascii?Q?ElYVV+wwLFtM8Wg3bxxn4NGhmodDOa4vW5+bU6YZ2PKRUsZjkLQ4IQyHRoZQ?=
 =?us-ascii?Q?MxpQGda2jz0KfUtGUT05i09oh2EN1i9+fp4+iPtbb1bPl/Hg4SuhoPU37G8W?=
 =?us-ascii?Q?uosKLDrHotuAU+fhobGg43nL6FESRyYKDjLp7JXxF2PNbPoyh/UI?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41305d0d-f96c-49f2-3e77-08df1a495994
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 14:37:25.0658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PA+46JnWurQnirlKK7uJqNi9qP1TTkI7KMbpR8sPCfwtvyr9j4g2Muwl5SZbTpXiQlXMlG62VOn4KTyxfeNamUll2JhiW8wdA4kHGmmUd78KqVdRsqRgMaZilRMsvDo8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI7PR04MB897750

On Thu, Sep 24, 2026 at 10:35:14AM +0200, Linus Walleij wrote:
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
> Calculate cyclic residue from the current memory-side hardware pointer
> instead. Read the destination pointer for capture and the source pointer
> for playback. Sample the split logical channel pointer coherently and
> retain the last valid residue during relink transitions.
>
> Make at most three residue sampling attempts: one initial read plus two
> retries. The retries let transient split-register updates or LLI relink
> windows settle, while the limit prevents unbounded polling if hardware does
> not yield a valid pointer.
>
> This avoids counting terminal-count interrupts, which races with hardware
> advancing to the next LLI and cannot account for coalesced interrupt
> status. Also reject cyclic periods that expand into multiple LLIs because
> logical cyclic LLIs each request a terminal-count interrupt and would
> generate more than one callback per period.
>
> Reject invalid cyclic geometries before dividing or constructing the
> scatterlist as well.
>
> Reported-by: Frank Li <Frank.li@oss.nxp.com>
> Closes: https://lore.kernel.org/dmaengine/aq2wIPJW6viUxyy9@SMW015318/
> Fixes: 15c606686541 ("dmaengine: ste_dma40: indicate granularity on channels")
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/ste_dma40.c | 106 +++++++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 101 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index e4d689c9eba8..eab9c09b4bfe 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
> @@ -65,6 +65,9 @@ struct stedma40_platform_data {
>  /* Maximum iterations taken before giving up suspending a channel */
>  #define D40_SUSPEND_MAX_IT 500
>
> +/* Maximum attempts to sample a stable cyclic residue position */
> +#define D40_RESIDUE_MAX_ATTEMPTS 3
> +
>  /* Milliseconds */
>  #define DMA40_AUTOSUSPEND_DELAY	100
>
> @@ -378,6 +381,9 @@ struct d40_lli_pool {
>   * @lli_len: Number of llis of current descriptor.
>   * @lli_current: Number of transferred llis.
>   * @lcla_alloc: Number of LCLA entries allocated.
> + * @cyclic_dma_addr: Start address of the cyclic buffer.
> + * @cyclic_buf_len: Length of the cyclic buffer.
> + * @cyclic_residue: Last valid cyclic residue sample.
>   * @txd: DMA engine struct. Used for among other things for communication
>   * during a transfer.
>   * @node: List entry.
> @@ -396,6 +402,9 @@ struct d40_desc {
>  	int				 lli_len;
>  	int				 lli_current;
>  	int				 lcla_alloc;
> +	dma_addr_t			 cyclic_dma_addr;
> +	size_t				 cyclic_buf_len;
> +	size_t				 cyclic_residue;
>
>  	struct dma_async_tx_descriptor	 txd;
>  	struct list_head		 node;
> @@ -1420,6 +1429,64 @@ static u32 d40_residue(struct d40_chan *d40c)
>  	return num_elt * d40c->dma_cfg.dst_info.data_width;
>  }
>
> +static bool d40_current_addr(struct d40_chan *d40c, dma_addr_t *addr)
> +{
> +	bool dst = d40c->dma_cfg.dir == DMA_DEV_TO_MEM;
> +	void __iomem *high_reg;
> +	void __iomem *low_reg;
> +	u32 low;
> +	u32 high;
> +	u32 check;
> +	int i;
> +
> +	if (chan_is_physical(d40c)) {
> +		*addr = readl(chan_base(d40c) +
> +			      (dst ? D40_CHAN_REG_SDPTR : D40_CHAN_REG_SSPTR));
> +		return true;
> +	}
> +
> +	if (dst) {
> +		low_reg = &d40c->lcpa->lcsp2;
> +		high_reg = &d40c->lcpa->lcsp3;
> +	} else {
> +		low_reg = &d40c->lcpa->lcsp0;
> +		high_reg = &d40c->lcpa->lcsp1;
> +	}
> +
> +	for (i = 0; i < D40_RESIDUE_MAX_ATTEMPTS; i++) {
> +		high = readl(high_reg) & D40_MEM_LCSP1_SPTR_MASK;
> +		low = readl(low_reg) & D40_MEM_LCSP0_SPTR_MASK;
> +		check = readl(high_reg) & D40_MEM_LCSP1_SPTR_MASK;
> +		if (high == check) {
> +			*addr = low | high;
> +			return true;
> +		}
> +	}
> +
> +	return false;
> +}
> +
> +static bool d40_cyclic_offset(struct d40_chan *d40c, struct d40_desc *d40d,
> +			      size_t *offset)
> +{
> +	dma_addr_t current_addr;
> +	dma_addr_t current_offset;
> +	int i;
> +
> +	for (i = 0; i < D40_RESIDUE_MAX_ATTEMPTS; i++) {
> +		if (!d40_current_addr(d40c, &current_addr))
> +			continue;
> +
> +		current_offset = current_addr - d40d->cyclic_dma_addr;
> +		if (current_offset <= d40d->cyclic_buf_len) {
> +			*offset = current_offset;
> +			return true;
> +		}
> +	}
> +
> +	return false;
> +}
> +
>  static bool d40_tx_is_linked(struct d40_chan *d40c)
>  {
>  	bool is_link;
> @@ -2108,15 +2175,26 @@ static bool d40_is_paused(struct d40_chan *d40c)
>
>  }
>
> -static u32 stedma40_residue(struct dma_chan *chan)
> +static u32 stedma40_residue(struct dma_chan *chan, dma_cookie_t cookie)
>  {
>  	struct d40_chan *d40c =
>  		container_of(chan, struct d40_chan, chan);
> +	struct d40_desc *d40d;
> +	size_t offset;
>  	u32 bytes_left;
>  	unsigned long flags;
>
>  	spin_lock_irqsave(&d40c->lock, flags);
> -	bytes_left = d40_residue(d40c);
> +	d40d = d40_first_active_get(d40c);
> +	if (d40d && d40d->txd.cookie == cookie && d40d->cyclic &&
> +	    d40d->cyclic_buf_len) {
> +		if (d40_cyclic_offset(d40c, d40d, &offset))
> +			d40d->cyclic_residue = d40d->cyclic_buf_len - offset;
> +		bytes_left = d40d->cyclic_residue;
> +	} else {
> +		bytes_left = d40_residue(d40c);
> +	}
> +
>  	spin_unlock_irqrestore(&d40c->lock, flags);
>
>  	return bytes_left;
> @@ -2246,8 +2324,13 @@ d40_prep_sg(struct dma_chan *dchan, struct scatterlist *sg_src,
>  	if (desc == NULL)
>  		goto unlock;
>
> -	if (sg_next(&sg_src[sg_len - 1]) == sg_src)
> +	if (sg_next(&sg_src[sg_len - 1]) == sg_src) {
>  		desc->cyclic = true;
> +		if (desc->lli_len != sg_len) {
> +			chan_err(chan, "Cyclic periods must fit in one LLI\n");
> +			goto free_desc;
> +		}
> +	}
>
>  	src_dev_addr = 0;
>  	dst_dev_addr = 0;
> @@ -2524,11 +2607,18 @@ dma40_prep_dma_cyclic(struct dma_chan *chan, dma_addr_t dma_addr,
>  		     size_t buf_len, size_t period_len,
>  		     enum dma_transfer_direction direction, unsigned long flags)
>  {
> -	unsigned int periods = buf_len / period_len;
> +	unsigned int periods;
>  	struct dma_async_tx_descriptor *txd;
> +	struct d40_desc *desc;
>  	struct scatterlist *sg;
> +	dma_addr_t buf_addr = dma_addr;
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
> @@ -2543,6 +2633,12 @@ dma40_prep_dma_cyclic(struct dma_chan *chan, dma_addr_t dma_addr,
>
>  	txd = d40_prep_sg(chan, sg, sg, periods, direction,
>  			  DMA_PREP_INTERRUPT);
> +	if (txd) {
> +		desc = container_of(txd, struct d40_desc, txd);
> +		desc->cyclic_dma_addr = buf_addr;
> +		desc->cyclic_buf_len = buf_len;
> +		desc->cyclic_residue = buf_len;
> +	}
>
>  	kfree(sg);
>
> @@ -2563,7 +2659,7 @@ static enum dma_status d40_tx_status(struct dma_chan *chan,
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
