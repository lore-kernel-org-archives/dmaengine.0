Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011060.outbound.protection.outlook.com [40.107.130.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADF148EC9E;
	Mon, 21 Sep 2026 16:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790009839; cv=fail; b=f0/FQynzn0HyOR+yah1Iv1Q7oLeQx+pZQAfR4LCvJ0KQeFi+itAfxQtNbwMVn8RdEai/H2wncq2byljDwjSuJ21oq8qvUkI/5wXNMPcgwAFARcdc5V3iPjA+QpLwOeTtuJ6nNBbuApsKouiZEZPK+BBqMcnhVfYcgbZ3JwA0wk4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790009839; c=relaxed/simple;
	bh=e+V3E6QigkKd3Gu87EUHuMpbqEuqEfCpVQa/SGRoFDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IyQhUev5xzAPURGW+wv+kRxRMOd4NG3s1q09rM617chUe3PiDYGEf2rBHpdt8o0dGarV7Pf2KM4SQaeuFgq/KlppYLDQ9CFEjWjIez1OsAaSX97vuL3e8L3ToKaUUSDQ4c00xGDrPpf2ISzuozbddHFtmBNC3jZ+FviSUXbBEMY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=RARlrr5Y; arc=fail smtp.client-ip=40.107.130.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="RARlrr5Y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gAViqle2pZkqYU5McShNNWzhVOhZFoPbPAr5Y8eON14Izosljqhqw1KwTPDsbMCWJKvDINocTLy8QaRlxqN2LBOaJ0dOXgFQqhZRZYI8hO5WNCCZQ4HQ8JwA7+FIMwjnwvY2qJ6DqCi0mCV1DU+4RawYKNEuvzWTkPMAbc1n5YX+UqOvx2Q60iA2bJ7odj/TjIbl0mwULudDjj4Hm052BkVrEZiaMoKzqJ22IPIHGf+qi0zUcfO0j5Ko5vDC8+xZ5MWuHvBwryEDYAUIamULxAp4E4IzhKORHnkDkDuWPh+p/WR68g0PExr9ViR4CDSdj8YbNzv08vkt/d0ZVDtbJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W7DzyWzJw4h7RNp64MZUDNs2RsZBs5YIX67K51P17qo=;
 b=YEMJwMMCMh7qJKLnqLfJqCgfvvXdUtk4jZl/7Cr6bAlWpqZ5j5qJDdtKt4GkwLHK05iAo0e2gq3uWqAGkUMVy/br90Rk5mdHSsAJSCvlK5JPcwadSSimAC8hQe68TBb/ks0bBTwQtUKcX0GGXjHnNGEHoUYiOSzEmDMtnzVciewwHQp/ogw4K1c8OWEk4RdKc7nq6/Z6BvMGRzHv6k7PQvXawc4A1UrIAULtpLoAws/zutPrRgiQCAv14ajwsEuXf/8SmD2d4ev2RmfsNRTAjcIRDo0SVZdq3omPClXuOQC+SN93TVSaVnbh9sgwryLK/8Rcdj2BqaKVaRD5nnwfZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W7DzyWzJw4h7RNp64MZUDNs2RsZBs5YIX67K51P17qo=;
 b=RARlrr5YBUQX5CPJn/W716pe6oyLRnHROLS85e2HqDQ2P4c2RruULz+l2uJxzGcrDBI/QkcjR3wpGHcDU2iqOFI560Hkb6VrEH9Jv/k1pwSOc9oto6uuLNR0nZ3Fw4ZvrluaGDFpTEaGG5fUP+sU45/pENcu3ZW15OywlJn1tD64JXJDW9RoBwizuuOM9OEtGIzOCLF0UNHUW70tpqA/lzSmcYeVAhdMe3zKHPeLVQF87bN5wM8zk3rJSSli+UYC1lTSszcBeq0Z+GP8c8dirTMDepUXWl12T/hF56UB0TxZcs8CQaye2Cl5+kk/w1fzKOZb0/IF5943d5v4nbszMA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8563.eurprd04.prod.outlook.com (2603:10a6:20b:422::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 16:57:14 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 16:57:14 +0000
Date: Mon, 21 Sep 2026 11:57:06 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v5 02/23] dmaengine: ste_dma40: Fix cyclic transfer
 residue
Message-ID: <arFh4iq1NU50KQKZ@SMW015318>
References: <20260920-dma40-fixes-v5-0-5c55cd7f92f9@kernel.org>
 <20260920-dma40-fixes-v5-2-5c55cd7f92f9@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260920-dma40-fixes-v5-2-5c55cd7f92f9@kernel.org>
X-ClientProxiedBy: CY8PR10CA0014.namprd10.prod.outlook.com
 (2603:10b6:930:4f::21) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8563:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b8fbf06-25ab-43d6-2931-08df180162a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|19092799006|366016|376014|10067099003|56012099006|22082099003|18002099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	tqBB3IymmsM4U+9D0yp02DgGe80QQQlSX2poGbts5vfvM+n2Cjp5RvL2dfKp+RXW7yLNW+sn9MuKub0ZIHyhvIFhdsv83vjg6O96XniWAWY10+q6zIflKZSbs457sRcWAzBXP94x2AiZDOCYGNCgItngiyndzCxokLSRqjJtk7MYSk7JKFDQfos2OvlnCc1gYk+eifbM+WVEsisPFRIuMnzqYDuoffozRrnjZT9W/L4azkV2hvlNAUr/Q+QsGx2FOIoZzFE1awAGcOwZL+8nGmZsi0/hDsQZtdFv1z6JTbJzaRHb8tgL2zXIpFzgQu0ohmhGEMPtZhAiFhK+S/Gurkz30yXvlfvGhl9CMZWBw2IXpVMwQT0HONLKM0fqTgk+hmAxRmUnYWs8IFQXi1t/gIWFbAXQ5WU6JxQihj9S3j45UvkuwU7zyG36iseeD4j7bUSacZbD+vnnsRE7bSJl5MXoHHo8YwH/ZV3g0ofRw3S0P7UIOhzLcbnNVlVZ6MJWRkXBYbAr/vATUtKpgRZ5LNdeaKTrquzRm8k//uba0S/LUWzKAAOYzPFbvt6e6wcm0Cfaxmy/E0nkdhB41xlzhkvLI4D5NsLQ/ufHYm+x2wU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(19092799006)(366016)(376014)(10067099003)(56012099006)(22082099003)(18002099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?b3klppouCXpQYCfvvoGUeLuiGN2+8i14Kiw3gh3upoLb8nkSgZiuea1HBNxx?=
 =?us-ascii?Q?36qvhJOL8V+aAbagFPsLqUlrio2fDhoBuXdVTGbuR1NP86+ScwfG2/e4iZOz?=
 =?us-ascii?Q?91mPJsrrOM6tsHEpqmRuNmVHDFnlofsYn7ET0AfMZ+kyTOVc4QRg0ZymSwp7?=
 =?us-ascii?Q?2tj3Q7ITPQkXBKHFBbaFCxdA7PeF262XhyjZjDtP3GIyEGnnw+RcPEfv01Vi?=
 =?us-ascii?Q?ZjatJbmOYKZ13kvnbgGEBT/G3IAkSu8PlFwBtRhTk5CGiypE0xgJ7WfrZUHV?=
 =?us-ascii?Q?Itocmkymqhu4r7a/l7s4MwRGaZNbYi2+TUbxcyhRPSWBolS061/rN/KL0N7Z?=
 =?us-ascii?Q?qP43HBgDbjWXWMlyUOXl59hsBIxHLcBX2TFAMtAlbE68shAUBbDW2/CNRfvC?=
 =?us-ascii?Q?CcDMtzEEFwFlEq0pKbbZ0CNfPg7W/F1RYVnKd25fTpwFWsxv/m6wnM5xlkJN?=
 =?us-ascii?Q?Su/u8n6KrgeBqFGsmVdPZJkq38QydtEf4ML+toqeT4KSX+qWO6FeZr46JmAU?=
 =?us-ascii?Q?zUxrTCimTj1zheZaD6bfJAF96tIkVFvb/P9ygq/c6zvglqnKncINxUO1oCyw?=
 =?us-ascii?Q?PP7wDMYk7Qff7JEvSRK1bxRGyZn0AeOMmlWp7q7abQIPjmzmzG2LtYvZC3Qm?=
 =?us-ascii?Q?vzJC85eic3DSVIZfsEDr4EO4EQ5Lt/EDb1IAIDhMC2zDub0DtKe+LRYfjm6L?=
 =?us-ascii?Q?PRTbZe+x7jwh7NHKBEf7eM74lO6xyXgYhiClKHgzyZXkVMfPM8fpEx1YbfWv?=
 =?us-ascii?Q?p8RiSwgtTQS3PNElES9BfDHWhDAHiUpz+XaRXDbAjo8TNx8kAQcURs7NqcOS?=
 =?us-ascii?Q?hrzFDQpEwycIIPVL77k1ZrhTgp+iMVKNwcwgw5nNNDGI83P/CLTwoERd2H3L?=
 =?us-ascii?Q?+09Wm9dv1of3f8Zx3tnD71hlYidw+2J3/ahgsq9ZbkU9WdEdudDZLM8IyMvw?=
 =?us-ascii?Q?FkZAhHYGOk1Tq56SeTMFOq916vgQBEj1OqKDzi2ckHkgs1KO/zJE/wFTRc6t?=
 =?us-ascii?Q?gZLL/6utnJXMqAiJZLf5v+l9gj1tkXNkp4i1f252P13ZGwnJ/5nTGDZUjelL?=
 =?us-ascii?Q?idtpRgSLBVWioD8mCd5JY/ogdWiNr+84k32cpwPanEIj1X4vaIMY/Q9aesjj?=
 =?us-ascii?Q?9B3M4Dwx3nGafJC98VxJehmnL3XCa+KPdnbhqKhNNXXyikeMXSdInGtSIjrw?=
 =?us-ascii?Q?+MryyTXOuGxhhdOmiBAGjcAW1C1yDuUXBeqIEOmiXWgEwn0jgDYpP+S5Eqsl?=
 =?us-ascii?Q?ww+rtKdiAPFDT8K8vqjZpKjVOKiXDYLRSKPiyCpNcx91Hc9T5o/OYuMO5LF5?=
 =?us-ascii?Q?JbpThTgSMeCdC1Sc99IE3brDjLKs4hkB1vyDktJ4jhI1e5G8fbjLwmFun++w?=
 =?us-ascii?Q?/bt+4Rov3YhPMZMSERa6G+YrvvzZm3OyDaYb0RMslvGNWEyCaMwX1dgl+dLD?=
 =?us-ascii?Q?iUHSbbGzqLWrHuteVSC9+ESjX7+A/ctRcjD2sg1ePKbfFuS5LLsCdv9a/Wph?=
 =?us-ascii?Q?B/dfdv6GZj2u7P5+A0HYClYSvpsWvI+Sw+50EXoq7JdmtyvUYTotFtgSKpoD?=
 =?us-ascii?Q?ork4/AG3uWms0GxRiLCDILA6mWfqU85PA1j5QeVkWMuVemGWxMcyKaqBAQ7s?=
 =?us-ascii?Q?UwTu7yPiJ4evBeieKZSrI6fyGJGiJtt5wd3KDM+vxE7GhnW2+syKHV0Hix1F?=
 =?us-ascii?Q?IJkZ2F3/PGYiQI64xHDFs20c9L33of2Mab8NHlinYl+EVoA6iACDElfze+iD?=
 =?us-ascii?Q?lHKKcGnX0WCS36UUAIsOqvqtDPaF1X2ueoc+t8oT3gHaDMG+NC0R?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b8fbf06-25ab-43d6-2931-08df180162a8
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 16:57:14.2584
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DYhFQb4/VKPwjmQMc8QY+6lT73Ws+psRNH/2GNgY5Y3oKp3VAwhwSRnHBDdUUj3/mVOB6g8fc93LENhji7S6znFk7p0rwiXj5chf3xdQ0DtGyvP/Px+ytPDzd1cygtTo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8563

On Sun, Sep 20, 2026 at 08:59:37PM +0200, Linus Walleij wrote:
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
>  drivers/dma/ste_dma40.c | 104 +++++++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 99 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index e4d689c9eba8..c9983e600daf 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
> @@ -378,6 +378,9 @@ struct d40_lli_pool {
>   * @lli_len: Number of llis of current descriptor.
>   * @lli_current: Number of transferred llis.
>   * @lcla_alloc: Number of LCLA entries allocated.
> + * @cyclic_dma_addr: Start address of the cyclic buffer.
> + * @cyclic_buf_len: Length of the cyclic buffer.
> + * @cyclic_residue: Last valid cyclic residue sample.
>   * @txd: DMA engine struct. Used for among other things for communication
>   * during a transfer.
>   * @node: List entry.
> @@ -396,6 +399,9 @@ struct d40_desc {
>  	int				 lli_len;
>  	int				 lli_current;
>  	int				 lcla_alloc;
> +	dma_addr_t			 cyclic_dma_addr;
> +	size_t				 cyclic_buf_len;
> +	size_t				 cyclic_residue;
>
>  	struct dma_async_tx_descriptor	 txd;
>  	struct list_head		 node;
> @@ -1420,6 +1426,64 @@ static u32 d40_residue(struct d40_chan *d40c)
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
> +	for (i = 0; i < 3; i++) {

what's means of 3, retry counter?  can you define macro for it.


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
> +	for (i = 0; i < 3; i++) {
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
> @@ -1566,6 +1630,7 @@ static void dma_tc_handle(struct d40_chan *d40c)
>  			if (d40d->lli_current == d40d->lli_len)
>  				d40d->lli_current = 0;
>  		}
> +

Nit: clean this unnessary changes.

Frank
>  	} else {
>  		d40_lcla_free_all(d40c, d40d);
>
> @@ -2108,15 +2173,26 @@ static bool d40_is_paused(struct d40_chan *d40c)
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
> @@ -2246,8 +2322,13 @@ d40_prep_sg(struct dma_chan *dchan, struct scatterlist *sg_src,
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
> @@ -2524,11 +2605,18 @@ dma40_prep_dma_cyclic(struct dma_chan *chan, dma_addr_t dma_addr,
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
> @@ -2543,6 +2631,12 @@ dma40_prep_dma_cyclic(struct dma_chan *chan, dma_addr_t dma_addr,
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
> @@ -2563,7 +2657,7 @@ static enum dma_status d40_tx_status(struct dma_chan *chan,
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
