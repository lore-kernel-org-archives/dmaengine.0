Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011035.outbound.protection.outlook.com [52.101.65.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE6633939D;
	Wed, 12 Aug 2026 20:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786568074; cv=fail; b=e8Xzg0kTruclDg1zM6iYI03hWPB9r0H0k+NKgsIIZdFrDLKdRFDGVcUSWJ1YBxkxJUHxVViGwkCe/+kVZr8pTWvuXisbbVY+FnA0/uD6n+hg+ymsSVKCYhldFZeNk5e78OkKfpzbxRZ+E4whnE9VcNbEHisZweortXmwyrgYylc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786568074; c=relaxed/simple;
	bh=+stfXKZirVBETuEQ/v/BhW6Iq0m9irHL0VUcAw0sgkk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SLP1YdbWgqGL5Q3KPidNSzuu4h+0FT8M+mE2eTrA2CO3KOlDLryVN4A+wyObEbzIXNLTCpHBP6PQVuS+xO8uhYn/84+u3D5Vs0R7NrJ+4HQCcIdKq5SOPlLdz8PuWXESZL6Pszo3MLuD8DQD+dk89hLw1St+O522HR0BgzS5VXg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=kwsI1Ok0; arc=fail smtp.client-ip=52.101.65.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="kwsI1Ok0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wHT9BU1E5gryUIuDmTg0DNhDabUavzj4mLgJgX/KqmoRQowrw67RBNqGURZZ+TQwPS4nxfnnmNg1zSv6nQACRzzXTCkCl4vNgtjzcyYjIDyJVuU/ecocwH4T690i02tf5fotOdrT3x/Wft/F/PBCfpVMJZkgwzDSW6JdwrrHTkCvC+kwnoTCpJR082IwR8JyloZMte/NGVUgPD8a29n2oPZEKYLw7TFJzLjosHbONjMa6ZVS4OD+IMn9vMNP8hju4IWhVZmSPalkNkKFmlEMoLxrJbG1Lg8hKigalwKzVOueHmTZqxCFj9iTXYFvC5XfvkUeA9pBlokAvwWPjeZh0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZpBKIVr0NG+eLbeTUVADD+Q+oU+awC+s+fH3OsrN+Sw=;
 b=WqTDx9OoEMtHh5Skt3Kxt4pk4jvCrZdgZT7aZJ8AIopZA/8AKndlt+0tTwdjqFE+RFQhUMkbmdr7rLy44FzX9+OSpeTAMbX9hO+xkY1EZ6Ydhcg4xLX3bBiKcm/IbX18rH2h/qp6wbUXmYve3XF3dDrBvrNYBFDJZrZ44MfNvbb5kBdSybsdnO2+i/g/1ZhNpdTXYXUCndRxA8HE4YhbfehVMCXlVII2TVZiHenxQDExz8L1p3eTbZSN5O78GXLVF+I0sishArx47epjfjKbgZNGSNCeVAcQPbFWpYzGHYPr5yQ6orzLszM1H8tFOgu+Cvv5qAsK4+ceJ6Ru2Qzj0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZpBKIVr0NG+eLbeTUVADD+Q+oU+awC+s+fH3OsrN+Sw=;
 b=kwsI1Ok0J7PUO6droY4QYPEOEN6DNj6rMMuorZzmFJXcy/w5XcMUkhwdaFIrDSGcZfnyfiU3UAY8cDjFhXqQliVzqHZ5eK7YIateypOP3KcwmbwmXBn7JzFaxwWRaQvYZkdwkryKM3m6v9lmgcYbItWOrEsWplRjT2Se2QoruEU4TjZDqCbBenKY1CyX1d/1UcrvxRbOKUL9sjUtiEGmY9O4ZWK/p2w6shfkrbC3RCuvXH2ER9yU9vqS8lhQV/6cXXEetX4xX4dVK1KGP9nbxxMsU8fx8kGAKxxVRc+1L8LDGbaESunw/iHj89J3eqPXEvkl3UFPmeRB6Fr9ghA/Qg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA4PR04MB7725.eurprd04.prod.outlook.com (2603:10a6:102:f1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Wed, 12 Aug
 2026 20:54:25 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0315.012; Wed, 12 Aug 2026
 20:54:24 +0000
Date: Wed, 12 Aug 2026 16:54:15 -0400
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
Subject: Re: [PATCH v5 13/24] dmaengine: dw-edma: Reclaim issued descriptors
 from IRQ-paired LL progress
Message-ID: <anzdd9kAxBHvuzpo@lizhi-Precision-Tower-5810>
References: <20260812155721.2807506-1-den@valinux.co.jp>
 <20260812155721.2807506-14-den@valinux.co.jp>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812155721.2807506-14-den@valinux.co.jp>
X-ClientProxiedBy: PH8P221CA0022.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:2d8::7) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA4PR04MB7725:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c307962-4d7e-45f0-01b2-08def8b3e43a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|366016|19092799006|1800799024|6133799003|10067099003|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	nBAGRsbNbkNyXRIfOzFsbdoeCiBTP3U/wH8Aixt6WcojDnGO7ILC8CmJDmpNjwGTjg8jnDO++K47El7eM38FrmeTOr/LyaHqqJ4WWVQsl2teRBq8mgtzsoaUZicQk1IEXQKhCVOv+x0stB67Q7Cr45jiqfWFTrsjdkbE8nvWggmHJufwJ5MDdAVKkFo4P8wq5KZOCsJ4HSr4+41pXe0KttwpvIT/jr4jalXUceFsyWui82kjVaVkuiEqkRAfokhVHr8mA7cz0cUlnHcgTQGj7jFGSCxu5HZsl02KrBxltsZJzT+ezDMq6KeC+b/9SHlt1hCN7GNgBNs288Aiw/Ady0V+b+iVy2XPl9zJO3rBGWqyKGvce6HVGhS1anUnMUrgw2ZkH/Ax4rsSITBhHRNJF3qU9k/aKIQGPOy/zvqC3b7V9bIe/ZdyzPnA6xLahqt0eHAG5CcbqmgE/Dfn1ujI6usQF5p81AXaJTkhbHdwPtr+g7g0S2kWuBtGpJs3QEe4TYFOs0KZH6RccOCOObi5SFSsudhrHtPhjlh3pPWcIvXfEb8XNQAOK+5JpxtuxMc7XTuTVPPRqpbDn5RCHmIE+4Z2CMU0HZs2AA+UGNRV92Q/lqQYLrY11R/wQB4/HvKPKVHXFUfeibySKe9Pdof3Th4YrrnQ9aR5Hcy+f/O0gLs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(19092799006)(1800799024)(6133799003)(10067099003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TpUIYsDfL2kW21QU191jmQPXacZ2x04mPv5uthdAqNgJoba8EfPupxldn7IC?=
 =?us-ascii?Q?GB/6ZsLdcQbqIu45oqIt8krSf5hb5OPj4jTS5zLIjJwjXMEADoZRd7subYkS?=
 =?us-ascii?Q?AMrXr7aBhBTbx12a+uTl728DyPfAAu2Ps/LoJOKNRgEGMdFJzqUK/LCD643z?=
 =?us-ascii?Q?wP1RVTnHNZaY+SvZPHfGDwGYUqAx8rl/vza1HUDCEvX53pTMxgSKi+65PeFj?=
 =?us-ascii?Q?rzFZezyjFHpNfvdv7XIfQkyuDYwq/zmszu/3kO9WbCapQ6g1M5nf0Bzkkh8o?=
 =?us-ascii?Q?BtbMr0XprVSHvrV2D4aTsRBpNWMYULdBFHtqvbbOP+GesKZeYVz2apFmluFn?=
 =?us-ascii?Q?M2odT0ywMjGrVjNQDsLIM4kCVbgMYzW7eD7pXfWvsoqwIvBxm0BuBDQgJMwY?=
 =?us-ascii?Q?hb+26tfdzrMM/unEJmzy9+yuBmQHSLUYAbp4hQ8pTkaE3WmWBFKrRanZ/NFw?=
 =?us-ascii?Q?n455AA78ItOw9j9FeZsDgfyiBuPmpVBuuVI+XKwzA1UtkohkQOVq7JQbbDDs?=
 =?us-ascii?Q?0gGKiBWBQK1Oow5CIs29rXeRE9aRwfpLeM3XF4hkSKqmwtE18C7EyshdvpRC?=
 =?us-ascii?Q?7/QVIjFQCbqK4sXAcbjSF4H1/W/cFNtLlO11QscyDXZp479RrCFfG4+EN94Q?=
 =?us-ascii?Q?TIwwTtxY9WwfIHaHIU8VjcC1/l+F/Ly0OOHkBtD+xyiI0x5BdrWvQT0r3B4x?=
 =?us-ascii?Q?sokL3Tt1WXhq3CWZDoqVkM9fcWsstYB5pp/kTn1F3hRXSiqoNDnKBHJ9XILV?=
 =?us-ascii?Q?+DPATpEVGE+uB92fb/HXr5CSxBCfZsThydgnudfOVxh0OLp8e4ZztxZGVm7P?=
 =?us-ascii?Q?mb5FxJHNX1GSByWU5RoTeAruhpd0lr2mBnmZ/tLH9qEmdGEsLs3Jq+PYDwDG?=
 =?us-ascii?Q?oEZhi/A7qsMceHTxpvAypeXb9HVrQCL+5DTmEvptdrr9tGiiz8AGLxsKn7Xz?=
 =?us-ascii?Q?JWl4fFCuyhyHCXpmpCTu5FwcaWOw2SsDrmXmN+zgr1HUta5THsWUb440ahYJ?=
 =?us-ascii?Q?/Icf9lFE/DEbFgIvHmYPyLlsOMWjjEyNyBwkR0HCTWgC38dwMRPbtUMZHZmx?=
 =?us-ascii?Q?lioyk+J68tFQz82gI/MSQzsu5+UnQULlO/f9AZqOgP0cYnVowqnfHb5FG5uN?=
 =?us-ascii?Q?PrxPKzrKRhEEBz5MNf+6BnrAQwqEulxZa76FGgb2+AA2d0F9ba4aVJaQDg2F?=
 =?us-ascii?Q?u8cdbrPqXhQKc5za/joLpH0doOMsFovwJjCj5QY1rjgNPy6WE7kH4UUbUdrL?=
 =?us-ascii?Q?cgT4dMFcLJJi6bu0YzugFUdOsL5XlXRyJsAl2waEf0jMF7Uc6FCwC815KpQ1?=
 =?us-ascii?Q?pwpTzEuLD8p6U79V3hbPt6NH9EtFYQeGnzxSC2AvZagWY3ODds4Sq1qD6RS8?=
 =?us-ascii?Q?HnGrY7Zv3iBUhGPEcn8YITxm2KnHXe1g65Z7tnuViZkwlGFeFKvT/N/AM8bP?=
 =?us-ascii?Q?eKqIQ5vMlLF+Oxd5cH9BbQHKNj0bYJucGbxz/Mnt0AD/g3xhXxMvCUXwCrC8?=
 =?us-ascii?Q?GjTnEcVD5TgV2TiTDqW77ktheFRiddA+PtVr9q7nwLoEPR2yd9Dyu+dcoKym?=
 =?us-ascii?Q?nE8hSFloWWYc6+CdAPBzOHWxsNaN3QHiqEsAoJ6oeJvluPiUj7VDCys/nxWD?=
 =?us-ascii?Q?ityVqVqmW6x2hVUdVvCglvCjofJuiJvHlDVkLtjuhB1aW/D3g02hlvmWZ3Am?=
 =?us-ascii?Q?dpfVvvOLSknMVPyv0IPul5LNJT7vjI6eMYwumfIr+aRPk4yItXFlADxbr4Iw?=
 =?us-ascii?Q?MFHkDfJcm04IFyXH2hL5UGgckRu/4tI=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c307962-4d7e-45f0-01b2-08def8b3e43a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 20:54:24.8741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l8hMJOjeeL7A8eVBY8Q7RHbAutgO7y5NBaEAMiLpoSRSb6aMLe+OsG1a7wM7nFM97bzV6pvhGJsubzEPbA2cIErZkYl9/ivdT/NcC6swmVhXkdzKdi+rYGtFOaECP/1E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7725

On Thu, Aug 13, 2026 at 12:57:10AM +0900, Koichiro Den wrote:
> Dynamic append can place entries from several descriptors in one LL
> ring. Track the consumed boundary in ll_done, reuse entries behind it,
> and complete descriptors in issue order as done_burst advances.
>
> Normalize each IRQ-paired LLP sample to the exclusive boundary used by
> ll_done. A stopped sample points to the next entry. Keep a running
> sample one entry behind the raw LLP so an entry is not recycled before
> payload completion is established. For the eDMA-compatible interrupt
> interface, treat DONE as a stopped boundary only when channel status is
> complete and transfer size is zero.
>
> Record the first outstanding physical LL entry in each descriptor and
> verify that it matches ll_done before consuming that descriptor. On a
> mismatch, warn and resynchronize only if the sampled boundary has
> reached the descriptor; otherwise stop without completing it.
>
> Reclaiming entries as they are consumed also lets a descriptor larger
> than the ring advance. Keep one data entry free so a physical index
> remains unambiguous in the active producer window. Clear any published
> ring state on termination or abort before starting another transfer.
>
> LL progress now has its own completion path, so fold the temporary
> lock-held DONE helper back into its only caller.
>
> Suggested-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---
> Changes in v5:
>   - Adjust context after moving the issue_pending() snapshot discard to
>     patch 11. dw_edma_ll_snapshot_discard() is no longer re-added here.
>   - Fold dw_edma_ll_clean_pending() into
>     dw_edma_ll_consume_progress(), removing the one-line wrapper
>     (pure refactoring).
>
>  drivers/dma/dw-edma/dw-edma-core.c    | 273 +++++++++++++++++++++-----
>  drivers/dma/dw-edma/dw-edma-core.h    |   4 +
>  drivers/dma/dw-edma/dw-edma-v0-core.c |   6 +
>  3 files changed, 238 insertions(+), 45 deletions(-)
>
> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> index 1deaf2d0da91..363993c64c44 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c
> @@ -53,13 +53,6 @@ dw_edma_alloc_desc(struct dw_edma_chan *chan, size_t nburst)
>  {
>  	struct dw_edma_desc *desc;
>
> -	/*
> -	 * For now, a descriptor that does not fit would stall the channel
> -	 * forever: reject it up front.
> -	 */
> -	if (!chan->non_ll && nburst > chan->ll_max - 1)
> -		return NULL;
> -
>  	desc = kzalloc_flex(*desc, burst, nburst, GFP_NOWAIT);
>  	if (unlikely(!desc))
>  		return NULL;
> @@ -79,6 +72,7 @@ static void dw_edma_ll_snapshot_discard_locked(struct dw_edma_chan *chan)
>  {
>  	lockdep_assert_held(dw_edma_event_lock(chan));
>
> +	chan->ll_irq.idx = -1;
>  	chan->ll_irq.event = DW_EDMA_LL_EVENT_NONE;
>  }
>
> @@ -128,6 +122,7 @@ dw_edma_ll_snapshot_take(struct dw_edma_chan *chan,
>  	if (dw_edma_abort_latch_locked(chan))
>  		return false;
>
> +	/* Consume each snapshot once, even if its boundary is later rejected. */
>  	*snapshot = chan->ll_irq;
>  	dw_edma_ll_snapshot_discard_locked(chan);
>
> @@ -215,7 +210,13 @@ static u32 dw_edma_core_get_used_num(struct dw_edma_chan *chan)
>
>  static u32 dw_edma_core_get_free_num(struct dw_edma_chan *chan)
>  {
> -	/* Keep one data entry free so equal indices mean an empty ring. */
> +	/*
> +	 * ll_done is the consumer boundary, so only the distance from ll_done
> +	 * to ll_head is occupied. Descriptor completion is tracked separately
> +	 * with done_burst.
> +	 *
> +	 * Keep one data entry free so equal indices mean an empty ring.
> +	 */
>  	return chan->ll_max - 1 - dw_edma_core_get_used_num(chan);
>  }
>
> @@ -224,6 +225,25 @@ static bool dw_edma_ll_pending(struct dw_edma_chan *chan)
>  	return chan->ll_head != chan->ll_done;
>  }
>
> +static u32 dw_edma_core_ch_transfer_size(struct dw_edma_chan *chan)
> +{
> +	if (!chan->dw->core->ch_transfer_size)
> +		return U32_MAX;
> +
> +	return chan->dw->core->ch_transfer_size(chan);
> +}
> +
> +static bool dw_edma_ll_done_is_stopped(struct dw_edma_chan *chan)
> +{
> +	/*
> +	 * Native HDMA reports STOP separately. The eDMA-compatible interrupt
> +	 * interface uses DONE for both progress and stop, so confirm a stopped
> +	 * boundary with channel status and transfer size.
> +	 */
> +	return dw_edma_core_ch_status(chan) == DMA_COMPLETE &&
> +	       dw_edma_core_ch_transfer_size(chan) == 0;
> +}
> +
>  static void dw_edma_core_ll_start(struct dw_edma_desc *desc)
>  {
>  	struct dw_edma_chan *chan = desc->chan;
> @@ -231,6 +251,9 @@ static void dw_edma_core_ll_start(struct dw_edma_desc *desc)
>  	u32 free;
>
>  	free = dw_edma_core_get_free_num(chan);
> +	if (free && desc->start_burst == desc->done_burst)
> +		desc->ll_start = chan->ll_head;
> +

should always set ll_start = chan->ll_head, always record current fit into
which ll index.

>  	for (i = desc->start_burst; i < desc->nburst && free; i++, free--) {
>  		/*
>  		 * Refresh the link element before filling the last data slot so
> @@ -252,7 +275,6 @@ static void dw_edma_core_ll_start(struct dw_edma_desc *desc)
>  		}
>  	}
>
> -	desc->done_burst = desc->start_burst;
>  	desc->start_burst = i;
>  }
>
> @@ -352,6 +374,127 @@ static void dw_edma_finish_termination(struct dw_edma_chan *chan)
>  	chan->status = EDMA_ST_IDLE;
>  }
>
> +/*
> + * Must be called with vc.lock held. Consume an LL progress boundary,
> + * advance ll_done and complete descriptors covered by the consumed range.
> + * Return true if ll_done advanced.
> + */
> +static bool dw_edma_ll_consume_progress(struct dw_edma_chan *chan, int idx)
> +{
> +	struct virt_dma_desc *vd, *_vd;
> +	bool advanced = false;
> +	u32 done, gap;
> +
> +	/* Ignore invalid, duplicate or stale progress. */
> +	if (idx < 0 || (u32)idx >= chan->ll_max)
> +		return false;
> +
> +	done = dw_edma_core_get_ll_dist(chan, chan->ll_done, idx);
> +	if (!done || done > dw_edma_core_get_used_num(chan))
> +		return false;
> +
> +	list_for_each_entry_safe(vd, _vd, &chan->vc.desc_issued, node) {
> +		struct dw_edma_desc *desc = vd2dw_edma_desc(vd);
> +		u32 consumed;
> +
> +		if (!done)
> +			break;
> +
> +		if (WARN_ON_ONCE(desc->done_burst > desc->start_burst ||
> +				 desc->start_burst > desc->nburst))
> +			return advanced;
> +
> +		/*
> +		 * start_burst is the next burst to append. done_burst counts
> +		 * bursts already consumed by hardware.
> +		 */
> +		consumed = desc->start_burst - desc->done_burst;
> +		if (!consumed)
> +			break;
> +
> +		/*
> +		 * ll_start ties the descriptor counters to the physical ring.
> +		 * If accounting lost entries before this descriptor, skip them
> +		 * only after the sampled boundary has reached ll_start.
> +		 */
> +		if (WARN_ON_ONCE(desc->ll_start != chan->ll_done)) {
> +			gap = dw_edma_core_get_ll_dist(chan, chan->ll_done,
> +						       desc->ll_start);
> +			if (gap > done)
> +				return advanced;
> +
> +			chan->ll_done = desc->ll_start;
> +			done -= gap;
> +			advanced = true;
> +			if (!done)
> +				break;
> +		}
> +
> +		consumed = min(done, consumed);
> +		desc->done_burst += consumed;
> +		desc->ll_start = (desc->ll_start + consumed) % chan->ll_max;

It'd better update ll_start when fill ll from desc. Here should only
update ll_done.

chan->ll_done = (chan->ll_done +  consumed) % chan->ll_max.

> +		chan->ll_done = desc->ll_start;
> +		done -= consumed;
> +		advanced = true;
> +
> +		/*
> +		 * Descriptors are published and retired in strict list order. A
> +		 * later descriptor cannot complete until this one is fully consumed.
> +		 */
> +		if (desc->done_burst != desc->nburst)
> +			break;
> +
> +		/* Hardware has consumed this descriptor's LL entries. */
> +		dw_hdma_set_callback_result(vd, DMA_TRANS_NOERROR);
> +		list_del(&vd->node);
> +		vchan_cookie_complete(vd);
> +	}
> +
> +	WARN_ON_ONCE(done);
> +
> +	return advanced;
> +}
> +
> +static int
> +dw_edma_ll_recycle_idx(struct dw_edma_chan *chan, int idx,
> +		       enum dw_edma_ll_event event)
> +{
> +	if (idx < 0 || (u32)idx > chan->ll_max)
> +		return -EINVAL;
> +
> +	/*
> +	 * Convert the raw LLP index to the exclusive boundary used by ll_done.
> +	 * For both eDMA and HDMA, once the engine has stopped, LLP points to
> +	 * the next element. ll_max is the link element, hence the following
> +	 * data boundary is 0.
> +	 */
> +	if (event == DW_EDMA_LL_EVENT_STOP)
> +		return idx == chan->ll_max ? 0 : idx;

regardless state. we can always treat link element as 0. ll_max have not
include link entry.

in calculate distance between two point A, B.  (B - A) % ll_max.

It is the same when A or B is ll_max or 0.


> +
> +	/*
> +	 * Moving a running index one entry back cannot represent index 0
> +	 * without wrapping it to ll_max - 1. That could falsely consume a full
> +	 * producer window, so wait for another sample or STOP.
> +	 */
> +	if (!idx)
> +		return -EINVAL;
> +
> +	/*
> +	 * A running eDMA LLP can move ahead of payload completion, so keep the
> +	 * boundary one entry behind it.
> +	 *
> +	 * DWC PCIe Controller Databook 6.10a-lca06, Section 7.2.1, Table 7-3
> +	 * describes an HDMA watermark LLP as an inclusive LLE recycling
> +	 * boundary, which would normally translate to idx + 1. During testing
> +	 * on a DWC HDMA 6.30a integration, using that boundary for DMAengine
> +	 * completion let clients release DMA mappings while hardware still
> +	 * accessed them, causing IOMMU faults. Keep the boundary one entry
> +	 * behind the raw LLP for HDMA as well. Stopped samples continue to use
> +	 * the next-entry boundary above.
> +	 */
> +	return idx == chan->ll_max ? chan->ll_max - 1 : idx - 1;

LLP should point current DMA working LL, always stop at which controller bit
have not set yet.

If your logic always treat idx as unfinished, you needn't idx - 1 here.

[ll_done, idx)

> +}
> +
>  static void dw_edma_core_ll_sync(struct dw_edma_chan *chan)
>  {
>  	/*
> @@ -834,31 +977,30 @@ dw_edma_device_prep_interleaved_dma(struct dma_chan *dchan,
>  	return dw_edma_device_transfer(&xfer, dw_edma_device_get_config(dchan, NULL));
>  }
>
> -/* Must be called with vc.lock held. */
> -static void dw_edma_done_interrupt_locked(struct dw_edma_chan *chan)
> +static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
>  {
>  	struct dw_edma_desc *desc;
>  	struct virt_dma_desc *vd;
> +	unsigned long flags;
>
> -	lockdep_assert_held(&chan->vc.lock);
> -
> -	if (chan->status == EDMA_ST_PAUSE)
> +	spin_lock_irqsave(&chan->vc.lock, flags);
> +	if (chan->status == EDMA_ST_PAUSE) {
> +		spin_unlock_irqrestore(&chan->vc.lock, flags);
>  		return;
> +	}
>
>  	switch (chan->request) {
>  	case EDMA_REQ_NONE:
>  	case EDMA_REQ_PAUSE:
>  		vd = vchan_next_desc(&chan->vc);
> -		if (!vd)
> -			break;
> -
> -		desc = vd2dw_edma_desc(vd);
> -		if (desc->start_burst >= desc->nburst) {
> -			dw_hdma_set_callback_result(vd, DMA_TRANS_NOERROR);
> -			list_del(&vd->node);
> -			vchan_cookie_complete(vd);
> -			if (!chan->non_ll)
> -				chan->ll_done = chan->ll_head;
> +		if (vd) {
> +			desc = vd2dw_edma_desc(vd);
> +			if (desc->start_burst >= desc->nburst) {
> +				dw_hdma_set_callback_result(vd,
> +							    DMA_TRANS_NOERROR);
> +				list_del(&vd->node);
> +				vchan_cookie_complete(vd);
> +			}
>  		}
>
>  		if (chan->request == EDMA_REQ_PAUSE) {
> @@ -871,25 +1013,12 @@ static void dw_edma_done_interrupt_locked(struct dw_edma_chan *chan)
>  		break;
>
>  	case EDMA_REQ_STOP:
> -		vd = vchan_next_desc(&chan->vc);
> -		if (!vd)
> -			break;
> -
>  		dw_edma_finish_termination(chan);
>  		break;
>
>  	default:
>  		break;
>  	}
> -	dw_edma_core_ch_maybe_doorbell(chan);
> -}
> -
> -static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
> -{
> -	unsigned long flags;
> -
> -	spin_lock_irqsave(&chan->vc.lock, flags);
> -	dw_edma_done_interrupt_locked(chan);
>  	spin_unlock_irqrestore(&chan->vc.lock, flags);
>  }
>
> @@ -902,7 +1031,37 @@ static void dw_edma_ll_interrupt(struct dw_edma_chan *chan)
>  	if (!dw_edma_ll_snapshot_take(chan, &snapshot))
>  		return;
>
> -	dw_edma_done_interrupt_locked(chan);
> +	if (chan->status == EDMA_ST_PAUSE)
> +		return;
> +
> +	dw_edma_ll_consume_progress(chan, snapshot.idx);
> +
> +	if (snapshot.event == DW_EDMA_LL_EVENT_PROGRESS &&
> +	    chan->request != EDMA_REQ_NONE)
> +		goto out;
> +
> +	switch (chan->request) {
> +	case EDMA_REQ_NONE:
> +		dw_edma_start_transfer(chan);
> +		chan->status = dw_edma_ll_pending(chan) ?
> +			       EDMA_ST_BUSY : EDMA_ST_IDLE;
> +		break;
> +
> +	case EDMA_REQ_PAUSE:
> +		dw_edma_set_request(chan, EDMA_REQ_NONE);
> +		chan->status = EDMA_ST_PAUSE;
> +		break;
> +
> +	case EDMA_REQ_STOP:
> +		dw_edma_finish_termination(chan);
> +		break;
> +
> +	default:
> +		break;
> +	}
> +
> +out:
> +	dw_edma_core_ch_maybe_doorbell(chan);
>  }
>
>  static bool dw_edma_abort_interrupt(struct dw_edma_chan *chan)
> @@ -965,21 +1124,44 @@ static void dw_edma_queue_irq_work(struct dw_edma_chan *chan,
>  static void dw_edma_record_irq(struct dw_edma_chan *chan, unsigned int events)
>  {
>  	struct dw_edma_ll_snapshot snapshot = {
> -		.event = events & DW_EDMA_IRQ_STOP ?
> -			 DW_EDMA_LL_EVENT_STOP : DW_EDMA_LL_EVENT_PROGRESS,
> +		.idx = -1,
> +		.event = DW_EDMA_LL_EVENT_NONE,
>  	};
>  	unsigned int pending = 0;
>
>  	lockdep_assert_held(dw_edma_event_lock(chan));
>
> +	/*
> +	 * Classify the LL event before normalizing its LLP sample to the
> +	 * exclusive consumer boundary. Keep STOP even without a valid
> +	 * boundary so deferred handling still sees that the run ended.
> +	 */
> +	if (!chan->non_ll &&
> +	    (events & (DW_EDMA_IRQ_DONE | DW_EDMA_IRQ_PROGRESS |
> +		       DW_EDMA_IRQ_STOP))) {
> +		if ((events & DW_EDMA_IRQ_STOP) ||
> +		    ((events & DW_EDMA_IRQ_DONE) &&
> +		     dw_edma_ll_done_is_stopped(chan)))
> +			snapshot.event = DW_EDMA_LL_EVENT_STOP;
> +		else
> +			snapshot.event = DW_EDMA_LL_EVENT_PROGRESS;
> +
> +		snapshot.idx = dw_edma_ll_recycle_idx(chan,
> +						      dw_edma_core_ll_cur_idx(chan),
> +						      snapshot.event);
> +		if (snapshot.idx < 0 &&
> +		    snapshot.event != DW_EDMA_LL_EVENT_STOP)
> +			snapshot.event = DW_EDMA_LL_EVENT_NONE;
> +	}
> +
>  	if ((events & DW_EDMA_IRQ_ABORT) && chan->abort_pending)
>  		pending |= DW_EDMA_DEFERRED_ABORT;
>
> -	if (chan->non_ll) {
> -		if (events & (DW_EDMA_IRQ_DONE | DW_EDMA_IRQ_STOP))
> -			pending |= DW_EDMA_DEFERRED_DONE;
> -	} else if (events & (DW_EDMA_IRQ_DONE | DW_EDMA_IRQ_PROGRESS |
> -			     DW_EDMA_IRQ_STOP)) {
> +	if (chan->non_ll &&
> +	    (events & (DW_EDMA_IRQ_DONE | DW_EDMA_IRQ_STOP)))
> +		pending |= DW_EDMA_DEFERRED_DONE;
> +
> +	if (snapshot.event != DW_EDMA_LL_EVENT_NONE) {
>  		/* STOP is final for this run; do not replace it with progress. */
>  		if (chan->ll_irq.event != DW_EDMA_LL_EVENT_STOP ||
>  		    snapshot.event == DW_EDMA_LL_EVENT_STOP)
> @@ -1227,6 +1409,7 @@ static int dw_edma_channel_setup(struct dw_edma *dw, u32 wr_alloc, u32 rd_alloc)
>  		chan->irq_mode = dw_edma_get_default_irq_mode(chan);
>  		INIT_WORK(&chan->irq_work, dw_edma_irq_work);
>  		atomic_set(&chan->irq_pending, 0);
> +		chan->ll_irq.idx = -1;
>  		chan->ll_irq.event = DW_EDMA_LL_EVENT_NONE;
>  		chan->abort_pending = false;
>
> diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
> index d709aa274300..27cab6ca5e67 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.h
> +++ b/drivers/dma/dw-edma/dw-edma-core.h
> @@ -71,6 +71,7 @@ struct dw_edma_desc {
>
>  	u32				alloc_sz;
>
> +	u32				ll_start;	/* First outstanding LL entry */
>  	size_t				done_burst;
>  	size_t				start_burst;
>  	size_t				nburst;
> @@ -78,6 +79,7 @@ struct dw_edma_desc {
>  };
>
>  struct dw_edma_ll_snapshot {
> +	int				idx;
>  	enum dw_edma_ll_event		event;
>  };
>
> @@ -113,6 +115,7 @@ struct dw_edma_chan {
>  	 * LL event recorded by the hard IRQ handler. The event lock
>  	 * serializes its capture with a new hardware run; vc.lock serializes
>  	 * its consumption with LL state.
> +	 * Valid indices use the exclusive boundary convention of ll_done.
>  	 */
>  	struct dw_edma_ll_snapshot	ll_irq;
>  	/* ABORT is terminal and remains pending across LL state changes. */
> @@ -189,6 +192,7 @@ struct dw_edma_core_ops {
>  	enum dma_status (*ch_status)(struct dw_edma_chan *chan);
>  	/* Called with dw_edma_event_lock(chan) held. */
>  	bool (*ch_abort_int_pending)(struct dw_edma_chan *chan);
> +	u32 (*ch_transfer_size)(struct dw_edma_chan *chan);
>  	irqreturn_t (*handle_int)(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
>  				  dw_edma_handler_t handler);
>  	void (*non_ll_start)(struct dw_edma_chan *chan, struct dw_edma_burst *child);
> diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/dw-edma-v0-core.c
> index 20dff21a0603..b9d6205157b3 100644
> --- a/drivers/dma/dw-edma/dw-edma-v0-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-v0-core.c
> @@ -318,6 +318,11 @@ static enum dma_status dw_edma_v0_core_ch_status(struct dw_edma_chan *chan)
>  		return DMA_ERROR;
>  }
>
> +static u32 dw_edma_v0_core_ch_transfer_size(struct dw_edma_chan *chan)
> +{
> +	return GET_CH_32(chan->dw, chan->dir, chan->id, transfer_size);
> +}
> +
>  static bool dw_edma_v0_core_ch_abort_int_pending(struct dw_edma_chan *chan)
>  {
>  	u32 sts = GET_RW_32(chan->dw, chan->dir, int_status);
> @@ -677,6 +682,7 @@ static const struct dw_edma_core_ops dw_edma_v0_core = {
>  	.ch_count = dw_edma_v0_core_ch_count,
>  	.ch_status = dw_edma_v0_core_ch_status,
>  	.ch_abort_int_pending = dw_edma_v0_core_ch_abort_int_pending,
> +	.ch_transfer_size = dw_edma_v0_core_ch_transfer_size,
>  	.handle_int = dw_edma_v0_core_handle_int,
>  	.ll_data = dw_edma_v0_core_ll_data,
>  	.ll_link = dw_edma_v0_core_ll_link,
> --
> 2.51.0
>
