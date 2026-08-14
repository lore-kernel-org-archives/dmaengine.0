Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013021.outbound.protection.outlook.com [52.101.83.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357C52DA756;
	Fri, 14 Aug 2026 15:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786722470; cv=fail; b=Xln4Hhr6IxV5ByiZu4JVC9Vnpafd6snzwwuRLWA2Ddg7jaCfJxK7lCNF2sfaFvaHgJWIYNefsHklQh6qJXU2JMWDLEDdntAeyem26Kt//706UgGRrXDZOBcl5rDoWg8yhrpWqTGcmyqCw7wPp+yfmnMF3zas16XXUqhL8rlYgJM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786722470; c=relaxed/simple;
	bh=73cnDszZdzHdt5PBfYjKbcLbivwT7VjmOv/VxakQz4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Dp8Mdi8LRrx9uut+WE7zwyhqikyqgdXiYbxJq3oUfIaq7z9P/bwNn72TgZ/bpKJUrINim70r0BqEQGTWQs1g6aP4Ey1vq/1KlrZwoz7VPFgRXwMyUAnRJ06HLCpSP1GfSBxDhPx/6/lkhn+LoEr6O1Eu0jrj6kHYbAoAOS0KcGY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=MCmgOcuR; arc=fail smtp.client-ip=52.101.83.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="MCmgOcuR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=itkOFmsALZVazGmOG/rTn7V0MWdLaDLkHFQvyJqQ8K/7djxIk6fNAmBL3A84Ne5/3MLBw20vH5+Eg2ktXu64Bpqclpq7zl+l4KgloMSfMduoW+0SCtj3pRABRk2liS/mt5RSZ20R8lrZ5C+RrfwyN9TyHWnhBTHtlaSYP+eI0ZmVV6vIcjJXT9QNyue5KJ2P0JPakww5BbfF5umChYQyd/piCPuYA6ByNvl5W9626q5gT2hbl8us/su9wC3Ar+KmERkxM4QBiZD5YBSdlN9Sfk/F3+Hzoug2uafjJOD+h68ihxQqk0fOayh2ootmHIaRYWlpLWH60Ax6uoF//4gIlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m49FVPjGWUmwBS1OsQh5dipdLLbP+rf6g78p/z4MWV8=;
 b=kMpXny2Q2g5fAbi3YSZXfKsrD+TBH7DCkc1CGEd9q03zo6OlArOEmZ3KYQN54s9Qu4WU5KoIG01icHuIctx8pTIf/mlOvnqtWg/H1xFw1n1go/qmwvr4nLPv8UGumurwwHOIkAxotDlrYeA6t+Kh8Dlju7YZbtJx8GGj6frJS2haippUxsXjYsuGAVrX1V+3k0w2CEcmstTdPXS2xxYv0V0AeifhdYrYnTGWzvCyqzT6O0fX8A8y0CfRmP+2no4vQONwRZ05gQGN9TNe2LJm+x6WlbNH5AX1f9X63eEobuGwPQuzcPU3+OnjBwaLurqZu0yXbWn9Gc5Bf6wpUghRyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m49FVPjGWUmwBS1OsQh5dipdLLbP+rf6g78p/z4MWV8=;
 b=MCmgOcuRzC6legk8OhStYzev6DjuONXrjYqqwX5TuD+uo+sShPTerW59VxLRrJGJ0Qb2A/7rHCrtJKld5ubfoBXm2dZ9cE/DSRRXJ5+FMfvEc01DBPMNkH6VcGL/7tecOunWpsFnogCSuA+jQcNGu/IgzsVKAQLfmPHC6/q9CMev7wg05hrDqDvvdi7n+cMP3w5CGtrAd/qkx9QIx3VTjs55ao67EpnBktzqCuAOvYrowY6YETMiRTdBVmNOW5SzR9u4avik9yDxVdBxJD0eK+mbNS4H19thSTeoBFseORXOL2/v/Qh/Xw6qmy+YjOcxkI2wsZOA/egUJVTkvJ+viw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV4PR04MB11822.eurprd04.prod.outlook.com (2603:10a6:150:2d8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Fri, 14 Aug
 2026 15:47:42 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 15:47:42 +0000
Date: Fri, 14 Aug 2026 10:47:30 -0500
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
Message-ID: <an84kpKLfr8ACBEQ@SMW015318>
References: <20260812155721.2807506-1-den@valinux.co.jp>
 <20260812155721.2807506-14-den@valinux.co.jp>
 <anzdd9kAxBHvuzpo@lizhi-Precision-Tower-5810>
 <hi4ani63qjhwihylkpbensfb27u6kaqtl53mjnqpzcfbabdhgt@p6k4x5vabtph>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <hi4ani63qjhwihylkpbensfb27u6kaqtl53mjnqpzcfbabdhgt@p6k4x5vabtph>
X-ClientProxiedBy: PH7PR17CA0049.namprd17.prod.outlook.com
 (2603:10b6:510:325::26) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV4PR04MB11822:EE_
X-MS-Office365-Filtering-Correlation-Id: 39f7a68b-539f-435d-1155-08defa1b6029
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|23010399003|376014|7416014|1800799024|56012099006|5023799004|11063799006|6133799003|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	1l41FXlj/eD2xezpM6EMEVlNs3z0PXMVLBAkUSmPG9XRRTtmHoJDSLhSo6pRwohoxq0YT4w4qbFOqUEb2BcukoQgo1O5WOS0jLs61BMnar8vuaI01dSDG2NF6cG5DIJSO7XFOt8pBrfrnmXhwVUkIOgiC5DsHhH4UGjMCRlxtFdIbDPk/Db/LYyoZtx6VD+50xeOJXWagoeErLuOK9bQTDT8SPwYJmSEbr/dh44WMTaluu7foqg54I1bUtzA3j8FV5d6+BQVwDwsnLfEQl9Sicu1amF2Eapr75L/lfUClTbVHMCNL27mciH82FfCZnkM4YueUUkg9ZWWHdetsATIN/NjRMhmjYOplIfsqMdCY+Cxx+LbU1CvRgBOthgnUzpKEs4E1EbR156AaM3jCUDsQJ4EHBb+3l37r/0qvAv7oWh91gXnpHmYZCjvvsm95cmxGEIIu0/uZizgT7dwVQQui1wx0G2zudOuuMtJ0Ve3iDmZLhQ3jVQQzpBExRx/uTe5tCpZik67IA6mOi00jE6GY7TlOCSmRaXDZh8XKk8WwmmsdAp9hUdmzc97PvULPqDV705KBrWzizayvCg54L9zXA3caYK9kfxJohcbZPwcynf+qrtA6bijXRcf4vPCdqa/m1woBqreUwLUyEdd6/iMtl3bOCCOg++bpTojtbFRDks=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(23010399003)(376014)(7416014)(1800799024)(56012099006)(5023799004)(11063799006)(6133799003)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pOii3OBsruoSWKcUIGfzGy0viQFslDjJehs8CdI22Rwd0o5pLfLY+CsR9xRu?=
 =?us-ascii?Q?zS5RzjQcbTlx+XY/6Idt4pjuDje0h2rWD69q1k61XDZytifxLihrctsVLl/T?=
 =?us-ascii?Q?MR5JZPJsvQlqH6kDuqokY/Oex9BFo+tPlOpuvew5/+4cfYq+ehm2lmC7P1ur?=
 =?us-ascii?Q?vudW5L0lpx2EKSwXrHL7JZr7X53dFuERnlgh4Vsrel2LWyRqkvhaHRDrqjOZ?=
 =?us-ascii?Q?Thfz52/UaYSneWtrywovOkjmQClMwAhNYpPLOqWH/M9wcckwVlWdoteRCM3y?=
 =?us-ascii?Q?8ItCBZ9CYJ/mt2O8TCpPe727qcAFim1hGPsnOHmYG0PsTwrgX3Sh5lsB57sg?=
 =?us-ascii?Q?kC1ZX2em+tKXfiddJNf2d/CeTKaJq7Xz+AatJxw7g1emj8Ng3g9Ag6eWTomH?=
 =?us-ascii?Q?k4CO1Rqf+YErczw4JjRsd32w/DIOffqT6tspjjiRI5pABEbBHNqPvjI71jAB?=
 =?us-ascii?Q?b+D8VTV+1WOkBp6GVsJs/00cMJuuM3s2J88bRZvJQW5oF7SoBGRZ9BwiIZ4k?=
 =?us-ascii?Q?+AQbBsquxYZX2e5hozeW9pIQMWKzxLORZET/46t5C/LERgCnTL4XEpyEHV6E?=
 =?us-ascii?Q?fqR/bUXegrC9b6OBEOHB3vEWieapdIbsUiJsYG2TZH8tMrd5LlunNQqBLyTs?=
 =?us-ascii?Q?j4BslBpqNgg2RGlHnkR7gXfVRXwOE8BcVIEaWziNXMhz9oYsD+h7LEG6Sbce?=
 =?us-ascii?Q?C49AlNyCupFfoCyc2qxSgYw7cYd9OgI03MfagloFlpKVZ2NV16Xejzi/riFa?=
 =?us-ascii?Q?RYUzc4kAIyBbGcsV8PD8XFjblgzXzzyBH47ju6/YxG55ol8ZZhHr+sWSUiis?=
 =?us-ascii?Q?RZHnerZ1/dXYmr0WzYD4ZZ8GwhUlisFpinRbrfIz3wEQWbvaViYAjmcry2De?=
 =?us-ascii?Q?5RPFnbgtXO1uFp59xG94fSTNG0S124wXlc6Nf8wvwZ48arZE8JcCmESSaiFS?=
 =?us-ascii?Q?h8XiakL75Q4Z4BFvXfv9qtAATcoqt52dF1tNkWywv58xkP2iFseu5k782kHJ?=
 =?us-ascii?Q?bP4jtQMi3Z8uOioUuoZmExG9DfXDwP7xF5+kU2OWex04ovV3GALUi/SxQ2Gw?=
 =?us-ascii?Q?7Qt/4pnp/Vz444gmSpDGogwHddvLUaxW+VqID2kqC4V6xWsU6lvo+MO1cK/w?=
 =?us-ascii?Q?aY3aV5GmC0//YZrvmz8aA+7QLmit6CIRUeDBFsFzMFFBRZZmhQd1PNMt8QbA?=
 =?us-ascii?Q?b7eYXVNmS6h8gfpExctSq82Lxe7BQoahsvnlsaZ/Nk0n/KvUAS+NiW0vzWp2?=
 =?us-ascii?Q?TDDjyNICGXvwH2hVv0wzGLQf6iMdG+Sb5ZGtN/9HhE+z/GLgefMAZqRjsLsR?=
 =?us-ascii?Q?gkNNr+eeZlnHNupZutxsG0GxsasBiIQ0E4Tmgsp15wUFSUsuCBRNc3fUqYDF?=
 =?us-ascii?Q?PINNrg4ghyV3mB9Wr1Ps1Y7N2ntXGQQtsdXzbzJ8PayYdvN+TLIzf75UbSdE?=
 =?us-ascii?Q?lcXvEXmB4nZxeceZnCPU9jLUsqekdYjfCfEFqPt+JWvlZ5RSUkgHbhuE7YPD?=
 =?us-ascii?Q?Lf3G5vYwaaww2lXION+veTHtblv0U3FHoZA3QzStuASbWtA0m9BWPTElAgbA?=
 =?us-ascii?Q?1UgNKn8GJVmdNnxr4KOuAfgcFg66M045av5gtCrXGTHqeijKnQ8l4zyb1vV3?=
 =?us-ascii?Q?7tn7TukA/mDZGI31lGfMGVT4Zi/GPhFv4z+emBK1kaTdIusy9pavmS2sLwtg?=
 =?us-ascii?Q?mRjnGa0DnODI1liqIFBaYXPqEYr6XFxstxpHXgTo+qyUuDXIvxq4N6v/qB0c?=
 =?us-ascii?Q?zlo4BVdwctLezAoULsWtm6t3A72AzO5Hz4EkWz49awDXxIpQEKt+?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39f7a68b-539f-435d-1155-08defa1b6029
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 15:47:42.1772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ptd7Wsyq1zqRjLpMNSap+Lr3oPkE1wWyrM/kCyS3kJwxtBmaaop3VOo0QKO8uFfnuMiaVw3L+veP85swaJ+hxj8uovE7gE52ERm+0sjsCGvMjuuwL92dgoSuMNHQtchE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11822

On Fri, Aug 14, 2026 at 05:48:16PM +0900, Koichiro Den wrote:
> On Wed, Aug 12, 2026 at 04:54:15PM -0400, Frank Li wrote:
> > On Thu, Aug 13, 2026 at 12:57:10AM +0900, Koichiro Den wrote:
> > > Dynamic append can place entries from several descriptors in one LL
> > > ring. Track the consumed boundary in ll_done, reuse entries behind it,
> > > and complete descriptors in issue order as done_burst advances.
> > >
> > > Normalize each IRQ-paired LLP sample to the exclusive boundary used by
> > > ll_done. A stopped sample points to the next entry. Keep a running
> > > sample one entry behind the raw LLP so an entry is not recycled before
> > > payload completion is established. For the eDMA-compatible interrupt
> > > interface, treat DONE as a stopped boundary only when channel status is
> > > complete and transfer size is zero.
> > >
> > > Record the first outstanding physical LL entry in each descriptor and
> > > verify that it matches ll_done before consuming that descriptor. On a
> > > mismatch, warn and resynchronize only if the sampled boundary has
> > > reached the descriptor; otherwise stop without completing it.
> > >
> > > Reclaiming entries as they are consumed also lets a descriptor larger
> > > than the ring advance. Keep one data entry free so a physical index
> > > remains unambiguous in the active producer window. Clear any published
> > > ring state on termination or abort before starting another transfer.
> > >
> > > LL progress now has its own completion path, so fold the temporary
> > > lock-held DONE helper back into its only caller.
> > >
> > > Suggested-by: Frank Li <Frank.Li@nxp.com>
> > > Signed-off-by: Koichiro Den <den@valinux.co.jp>
> > > ---
> > > Changes in v5:
> > >   - Adjust context after moving the issue_pending() snapshot discard to
> > >     patch 11. dw_edma_ll_snapshot_discard() is no longer re-added here.
> > >   - Fold dw_edma_ll_clean_pending() into
> > >     dw_edma_ll_consume_progress(), removing the one-line wrapper
> > >     (pure refactoring).
> > >
> > >  drivers/dma/dw-edma/dw-edma-core.c    | 273 +++++++++++++++++++++-----
> > >  drivers/dma/dw-edma/dw-edma-core.h    |   4 +
> > >  drivers/dma/dw-edma/dw-edma-v0-core.c |   6 +
> > >  3 files changed, 238 insertions(+), 45 deletions(-)
> > >
> > > diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> > > index 1deaf2d0da91..363993c64c44 100644
> > > --- a/drivers/dma/dw-edma/dw-edma-core.c
> > > +++ b/drivers/dma/dw-edma/dw-edma-core.c
> > > @@ -53,13 +53,6 @@ dw_edma_alloc_desc(struct dw_edma_chan *chan, size_t nburst)
> > >  {
> > >  	struct dw_edma_desc *desc;
> > >
> > > -	/*
> > > -	 * For now, a descriptor that does not fit would stall the channel
> > > -	 * forever: reject it up front.
> > > -	 */
> > > -	if (!chan->non_ll && nburst > chan->ll_max - 1)
> > > -		return NULL;
> > > -
> > >  	desc = kzalloc_flex(*desc, burst, nburst, GFP_NOWAIT);
> > >  	if (unlikely(!desc))
> > >  		return NULL;
> > > @@ -79,6 +72,7 @@ static void dw_edma_ll_snapshot_discard_locked(struct dw_edma_chan *chan)
> > >  {
> > >  	lockdep_assert_held(dw_edma_event_lock(chan));
> > >
> > > +	chan->ll_irq.idx = -1;
> > >  	chan->ll_irq.event = DW_EDMA_LL_EVENT_NONE;
> > >  }
> > >
> > > @@ -128,6 +122,7 @@ dw_edma_ll_snapshot_take(struct dw_edma_chan *chan,
> > >  	if (dw_edma_abort_latch_locked(chan))
> > >  		return false;
> > >
> > > +	/* Consume each snapshot once, even if its boundary is later rejected. */
> > >  	*snapshot = chan->ll_irq;
> > >  	dw_edma_ll_snapshot_discard_locked(chan);
> > >
> > > @@ -215,7 +210,13 @@ static u32 dw_edma_core_get_used_num(struct dw_edma_chan *chan)
> > >
> > >  static u32 dw_edma_core_get_free_num(struct dw_edma_chan *chan)
> > >  {
> > > -	/* Keep one data entry free so equal indices mean an empty ring. */
> > > +	/*
> > > +	 * ll_done is the consumer boundary, so only the distance from ll_done
> > > +	 * to ll_head is occupied. Descriptor completion is tracked separately
> > > +	 * with done_burst.
> > > +	 *
> > > +	 * Keep one data entry free so equal indices mean an empty ring.
> > > +	 */
> > >  	return chan->ll_max - 1 - dw_edma_core_get_used_num(chan);
> > >  }
> > >
> > > @@ -224,6 +225,25 @@ static bool dw_edma_ll_pending(struct dw_edma_chan *chan)
> > >  	return chan->ll_head != chan->ll_done;
> > >  }
> > >
> > > +static u32 dw_edma_core_ch_transfer_size(struct dw_edma_chan *chan)
> > > +{
> > > +	if (!chan->dw->core->ch_transfer_size)
> > > +		return U32_MAX;
> > > +
> > > +	return chan->dw->core->ch_transfer_size(chan);
> > > +}
> > > +
> > > +static bool dw_edma_ll_done_is_stopped(struct dw_edma_chan *chan)
> > > +{
> > > +	/*
> > > +	 * Native HDMA reports STOP separately. The eDMA-compatible interrupt
> > > +	 * interface uses DONE for both progress and stop, so confirm a stopped
> > > +	 * boundary with channel status and transfer size.
> > > +	 */
> > > +	return dw_edma_core_ch_status(chan) == DMA_COMPLETE &&
> > > +	       dw_edma_core_ch_transfer_size(chan) == 0;
> > > +}
> > > +
> > >  static void dw_edma_core_ll_start(struct dw_edma_desc *desc)
> > >  {
> > >  	struct dw_edma_chan *chan = desc->chan;
>
> Hi Frank, thanks for the review.
>
> > > @@ -231,6 +251,9 @@ static void dw_edma_core_ll_start(struct dw_edma_desc *desc)
> > >  	u32 free;
> > >
> > >  	free = dw_edma_core_get_free_num(chan);
> > > +	if (free && desc->start_burst == desc->done_burst)
> > > +		desc->ll_start = chan->ll_head;
> > > +
> >
> > should always set ll_start = chan->ll_head, always record current fit into
> > which ll index.
>
> This was intentional.
>
> I added a source comment in this patch (i.e. patch 13/24):
>
>   struct dw_edma_desc {
>       [...]
>       ll_start;       /* First outstanding LL entry */
>       [...]
>   }
>
> So desc->start_burst == desc->done_burst means that no currently published LL
> entries for the descriptor remain outstanding. Updating ll_start to ll_head
> during a partial refill after some ring entries have been reclaimed breaks
> things. ll_start is a descriptor-local moving consumer boundary.
>
> For example, assume ll_max=8 and descriptor entries were published into data
> slots 0..6. After progress has consumed slots 0..2,
>
>   desc->start_burst = 7
>   desc->done_burst = 3
>   ll_done = desc->ll_start = 3
>   ll_head = 7
>
> If we updated desc->ll_start to chan->ll_head in this situation, slots 3..6
> would be skipped even though they have not been consumed yet.
>
> However, in hindsight, desc->ll_done might have been a better name. Perhaps
> desc->ll_done is more suitable.
>
> >
> > >  	for (i = desc->start_burst; i < desc->nburst && free; i++, free--) {
> > >  		/*
> > >  		 * Refresh the link element before filling the last data slot so
> > > @@ -252,7 +275,6 @@ static void dw_edma_core_ll_start(struct dw_edma_desc *desc)
> > >  		}
> > >  	}
> > >
> > > -	desc->done_burst = desc->start_burst;
> > >  	desc->start_burst = i;
> > >  }
> > >
> > > @@ -352,6 +374,127 @@ static void dw_edma_finish_termination(struct dw_edma_chan *chan)
> > >  	chan->status = EDMA_ST_IDLE;
> > >  }
> > >
> > > +/*
> > > + * Must be called with vc.lock held. Consume an LL progress boundary,
> > > + * advance ll_done and complete descriptors covered by the consumed range.
> > > + * Return true if ll_done advanced.
> > > + */
> > > +static bool dw_edma_ll_consume_progress(struct dw_edma_chan *chan, int idx)
> > > +{
> > > +	struct virt_dma_desc *vd, *_vd;
> > > +	bool advanced = false;
> > > +	u32 done, gap;
> > > +
> > > +	/* Ignore invalid, duplicate or stale progress. */
> > > +	if (idx < 0 || (u32)idx >= chan->ll_max)
> > > +		return false;
> > > +
> > > +	done = dw_edma_core_get_ll_dist(chan, chan->ll_done, idx);
> > > +	if (!done || done > dw_edma_core_get_used_num(chan))
> > > +		return false;
> > > +
> > > +	list_for_each_entry_safe(vd, _vd, &chan->vc.desc_issued, node) {
> > > +		struct dw_edma_desc *desc = vd2dw_edma_desc(vd);
> > > +		u32 consumed;
> > > +
> > > +		if (!done)
> > > +			break;
> > > +
> > > +		if (WARN_ON_ONCE(desc->done_burst > desc->start_burst ||
> > > +				 desc->start_burst > desc->nburst))
> > > +			return advanced;
> > > +
> > > +		/*
> > > +		 * start_burst is the next burst to append. done_burst counts
> > > +		 * bursts already consumed by hardware.
> > > +		 */
> > > +		consumed = desc->start_burst - desc->done_burst;
> > > +		if (!consumed)
> > > +			break;
> > > +
> > > +		/*
> > > +		 * ll_start ties the descriptor counters to the physical ring.
> > > +		 * If accounting lost entries before this descriptor, skip them
> > > +		 * only after the sampled boundary has reached ll_start.
> > > +		 */
> > > +		if (WARN_ON_ONCE(desc->ll_start != chan->ll_done)) {
> > > +			gap = dw_edma_core_get_ll_dist(chan, chan->ll_done,
> > > +						       desc->ll_start);
> > > +			if (gap > done)
> > > +				return advanced;
> > > +
> > > +			chan->ll_done = desc->ll_start;
> > > +			done -= gap;
> > > +			advanced = true;
> > > +			if (!done)
> > > +				break;
> > > +		}
> > > +
> > > +		consumed = min(done, consumed);
> > > +		desc->done_burst += consumed;
> > > +		desc->ll_start = (desc->ll_start + consumed) % chan->ll_max;
> >
> > It'd better update ll_start when fill ll from desc. Here should only
> > update ll_done.
> >
> > chan->ll_done = (chan->ll_done +  consumed) % chan->ll_max.
>
> Same here, this was intentional. ll_start points to the first outstanding LL
> entry.
>
> For the first issued descriptor, desc->ll_start and chan->ll_done represent the
> same exclusive consumer boundary, so they must advance together. Updating only
> chan->ll_done would leave the descriptor-local boundary stale and fail the
> consistency check on the next sample.
>
> BTW, using ll_start as the descriptor's immutable base is another possible
> design. I guess that's what you have in mind. In that case, the first
> outstanding entry could be calculated as:
>
>   (ll_start + done_burst) % ll_max
>
> but I'm not yet sure it would simplify the implementation. The other choice
> would be just renaming desc->ll_start to desc->ll_done, as I commented above.
>
> >
> > > +		chan->ll_done = desc->ll_start;
> > > +		done -= consumed;
> > > +		advanced = true;
> > > +
> > > +		/*
> > > +		 * Descriptors are published and retired in strict list order. A
> > > +		 * later descriptor cannot complete until this one is fully consumed.
> > > +		 */
> > > +		if (desc->done_burst != desc->nburst)
> > > +			break;
> > > +
> > > +		/* Hardware has consumed this descriptor's LL entries. */
> > > +		dw_hdma_set_callback_result(vd, DMA_TRANS_NOERROR);
> > > +		list_del(&vd->node);
> > > +		vchan_cookie_complete(vd);
> > > +	}
> > > +
> > > +	WARN_ON_ONCE(done);
> > > +
> > > +	return advanced;
> > > +}
> > > +
> > > +static int
> > > +dw_edma_ll_recycle_idx(struct dw_edma_chan *chan, int idx,
> > > +		       enum dw_edma_ll_event event)
> > > +{
> > > +	if (idx < 0 || (u32)idx > chan->ll_max)
> > > +		return -EINVAL;
> > > +
> > > +	/*
> > > +	 * Convert the raw LLP index to the exclusive boundary used by ll_done.
> > > +	 * For both eDMA and HDMA, once the engine has stopped, LLP points to
> > > +	 * the next element. ll_max is the link element, hence the following
> > > +	 * data boundary is 0.
> > > +	 */
> > > +	if (event == DW_EDMA_LL_EVENT_STOP)
> > > +		return idx == chan->ll_max ? 0 : idx;
> >
> > regardless state. we can always treat link element as 0. ll_max have not
> > include link entry.
>
> Right, ll_max is the number of data entries, and the physical link element is at
> index ll_max. In the modulo-distance calculation, the link index and data index
> 0 are equivalent after normalization.
>
> The reason the code keeps the two raw values distinguishable is the running
> prev(idx) conversion (pls see below). A raw physical link index of ll_max can be
> moved back to ll_max - 1. A raw data index of 0, however, may be a stale or
> no-progress sample, so blindly wrapping it to ll_max - 1 could report almost one
> full ring of progress.
>
> >
> > in calculate distance between two point A, B.  (B - A) % ll_max.
> >
> > It is the same when A or B is ll_max or 0.
> >
> >
> > > +
> > > +	/*
> > > +	 * Moving a running index one entry back cannot represent index 0
> > > +	 * without wrapping it to ll_max - 1. That could falsely consume a full
> > > +	 * producer window, so wait for another sample or STOP.
> > > +	 */
> > > +	if (!idx)
> > > +		return -EINVAL;
> > > +
> > > +	/*
> > > +	 * A running eDMA LLP can move ahead of payload completion, so keep the
> > > +	 * boundary one entry behind it.
> > > +	 *
> > > +	 * DWC PCIe Controller Databook 6.10a-lca06, Section 7.2.1, Table 7-3
> > > +	 * describes an HDMA watermark LLP as an inclusive LLE recycling
> > > +	 * boundary, which would normally translate to idx + 1. During testing
> > > +	 * on a DWC HDMA 6.30a integration, using that boundary for DMAengine
> > > +	 * completion let clients release DMA mappings while hardware still
> > > +	 * accessed them, causing IOMMU faults. Keep the boundary one entry
> > > +	 * behind the raw LLP for HDMA as well. Stopped samples continue to use
> > > +	 * the next-entry boundary above.
> > > +	 */
> > > +	return idx == chan->ll_max ? chan->ll_max - 1 : idx - 1;
> >
> > LLP should point current DMA working LL, always stop at which controller bit
> > have not set yet.
> >
> > If your logic always treat idx as unfinished, you needn't idx - 1 here.
> >
> > [ll_done, idx)
>
> I agree that [ll_done, idx) could be used when idx identifies the first
> unfinished LLE. That is already how a confirmed STOP sample is handled. For an
> HDMA watermark, the databook gives raw idx a different meaning, but it can still
> be used as a conservative exclusive boundary. The idx - 1 retreat is used only
> for a running progress sample.
>
>     state/event              meaning of raw LLP                  current v5
>                                                                  boundary
>     -----------------------  ---------------------------------  ------------
>     eDMA, confirmed STOPPED  Points to the next entry to be      idx
>                              processed.
>
>     HDMA, STOPPED            Points to the next entry to be      idx
>                              processed.
>
>     HDMA, running at         Points inclusively to the last      prev(idx) (*)
>     WATERMARK                LLE that may be recycled,
>                              according to the databook.
>
>     eDMA, running at DONE    Was observed to advance with        prev(idx)
>                              descriptor fetch before payload
>                              completion.
>
>     (*) The documented HDMA LLE-recycling boundary would normally be
>         next(idx). v1 used idx as the exclusive dmaengine completion
>         boundary. The current code deliberately uses the same conservative
>         prev(idx) rule for all running progress samples.

Thank you for good summary. The key problem is that it is hard to know
DMA running or STOP. Espcially use polling mode.

	assume a bus loop

	while(1) {
		if (condition) { 	1
			do_action()     2
		}
	}

1, Generally read some register status or software state.
2. Read idx

between 1 and 2, if 1 test is running, after test and before do action,
dma may be already stopped.

DMA engine is totally async with cpu.

>
> For a running eDMA sample, I observed that DMA_LLP can advance with descriptor
> fetch before the corresponding payload transfer has completed. Therefore raw idx
> does not by itself prove that the payload for the entry immediately before idx
> has finished. Using [ll_done, idx) could complete that entry and release its DMA
> mapping too early.


This is bad hardware design. Pre Fetch should not show in register leave.

Maybe a workaround, dma driver create pre allocated memory.

When prep sg, append an extra LL, which write/read to this pre allocate
memory, we can check this pre allocated memory to know current dma working
status.

This is embeded DMA, one side have to be remote side memory, which make work
around complex.

>
> For HDMA, the databook describes the watermark LLP as an inclusive LLE recycling
> boundary, which would normally translate to next(idx). I first implemented it
> that way. On a DWC HDMA 6.30a integration (SpacemiT K3), however, this let the
> client unmap memory while hardware was still accessing it, causing IOMMU faults.
> Moving the completion boundary back to prev(idx) stopped the faults.
>
> For completeness, v1 used raw idx as the exclusive HDMA completion boundary,
> [ll_done, idx), and completed the HDMA fio test set reliably. So raw idx itself
> is not known to be unsafe.
>
> After next(idx) caused the IOMMU faults, however, I deliberately aligned HDMA
> with the conservative eDMA handling (pls. see the comment block in
> dw_edma_ll_recycle_idx()). All running progress samples use the same prev(idx)
> conversion, while confirmed STOP samples use the exact next-entry boundary. This
> keeps the common normalization simple and avoids engine-specific handling. For
> HDMA, the trade-off is that completion stays one additional entry behind raw idx
> until later progress or STOP catches it up.

So DMA engine move idx advance even though current LL still working.
It is quite common at some modem dmaengine to improve dma preforamce, but
it should be hidden in hardware internal, like CPU's PC pointer.

>
> I think this is related to the fact that HDMA LL mode decouples descriptor
> fetching, data processing, completion processing, and interrupt handling. That
> explains why the documented LLE-recycling boundary cannot automatically be used
> as the dmaengine completion boundary, although it does not by itself tell us
> whether idx or prev(idx) is required.
>
> The idx == 0 handling is also a consequence of the current prev(idx) retreat.
> For example, with data entries 0..7 and the physical link element at index 8,
> moving raw index 8 back gives boundary 7. Blindly moving raw data index 0 back
> would also wrap to 7. If that raw 0 was a no-progress sample, it could then look
> like almost one full ring of progress. Therefore raw 0 is rejected while the
> physical link index remains distinguishable.
>
> In other words, without the prev(idx) retreat, the link index could simply be
> normalized to 0, as you mentioned. The current prev(idx) handling was
> nevertheless intentional, not an oversight. It trades one-entry delayed HDMA
> completion for one conservative rule shared with eDMA. Unless there is a
> concrete reason to reclaim that extra entry at each HDMA watermark, I would
> prefer to keep the common handling.

let me read document again.

Frank

>
> Best regards,
> Koichiro
>
> >
> > > +}
> > > +
> > >  static void dw_edma_core_ll_sync(struct dw_edma_chan *chan)
> > >  {
> > >  	/*
> > > @@ -834,31 +977,30 @@ dw_edma_device_prep_interleaved_dma(struct dma_chan *dchan,
> > >  	return dw_edma_device_transfer(&xfer, dw_edma_device_get_config(dchan, NULL));
> > >  }
> > >
> > > -/* Must be called with vc.lock held. */
> > > -static void dw_edma_done_interrupt_locked(struct dw_edma_chan *chan)
> > > +static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
> > >  {
> > >  	struct dw_edma_desc *desc;
> > >  	struct virt_dma_desc *vd;
> > > +	unsigned long flags;
> > >
> > > -	lockdep_assert_held(&chan->vc.lock);
> > > -
> > > -	if (chan->status == EDMA_ST_PAUSE)
> > > +	spin_lock_irqsave(&chan->vc.lock, flags);
> > > +	if (chan->status == EDMA_ST_PAUSE) {
> > > +		spin_unlock_irqrestore(&chan->vc.lock, flags);
> > >  		return;
> > > +	}
> > >
> > >  	switch (chan->request) {
> > >  	case EDMA_REQ_NONE:
> > >  	case EDMA_REQ_PAUSE:
> > >  		vd = vchan_next_desc(&chan->vc);
> > > -		if (!vd)
> > > -			break;
> > > -
> > > -		desc = vd2dw_edma_desc(vd);
> > > -		if (desc->start_burst >= desc->nburst) {
> > > -			dw_hdma_set_callback_result(vd, DMA_TRANS_NOERROR);
> > > -			list_del(&vd->node);
> > > -			vchan_cookie_complete(vd);
> > > -			if (!chan->non_ll)
> > > -				chan->ll_done = chan->ll_head;
> > > +		if (vd) {
> > > +			desc = vd2dw_edma_desc(vd);
> > > +			if (desc->start_burst >= desc->nburst) {
> > > +				dw_hdma_set_callback_result(vd,
> > > +							    DMA_TRANS_NOERROR);
> > > +				list_del(&vd->node);
> > > +				vchan_cookie_complete(vd);
> > > +			}
> > >  		}
> > >
> > >  		if (chan->request == EDMA_REQ_PAUSE) {
> > > @@ -871,25 +1013,12 @@ static void dw_edma_done_interrupt_locked(struct dw_edma_chan *chan)
> > >  		break;
> > >
> > >  	case EDMA_REQ_STOP:
> > > -		vd = vchan_next_desc(&chan->vc);
> > > -		if (!vd)
> > > -			break;
> > > -
> > >  		dw_edma_finish_termination(chan);
> > >  		break;
> > >
> > >  	default:
> > >  		break;
> > >  	}
> > > -	dw_edma_core_ch_maybe_doorbell(chan);
> > > -}
> > > -
> > > -static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
> > > -{
> > > -	unsigned long flags;
> > > -
> > > -	spin_lock_irqsave(&chan->vc.lock, flags);
> > > -	dw_edma_done_interrupt_locked(chan);
> > >  	spin_unlock_irqrestore(&chan->vc.lock, flags);
> > >  }
> > >
> > > @@ -902,7 +1031,37 @@ static void dw_edma_ll_interrupt(struct dw_edma_chan *chan)
> > >  	if (!dw_edma_ll_snapshot_take(chan, &snapshot))
> > >  		return;
> > >
> > > -	dw_edma_done_interrupt_locked(chan);
> > > +	if (chan->status == EDMA_ST_PAUSE)
> > > +		return;
> > > +
> > > +	dw_edma_ll_consume_progress(chan, snapshot.idx);
> > > +
> > > +	if (snapshot.event == DW_EDMA_LL_EVENT_PROGRESS &&
> > > +	    chan->request != EDMA_REQ_NONE)
> > > +		goto out;
> > > +
> > > +	switch (chan->request) {
> > > +	case EDMA_REQ_NONE:
> > > +		dw_edma_start_transfer(chan);
> > > +		chan->status = dw_edma_ll_pending(chan) ?
> > > +			       EDMA_ST_BUSY : EDMA_ST_IDLE;
> > > +		break;
> > > +
> > > +	case EDMA_REQ_PAUSE:
> > > +		dw_edma_set_request(chan, EDMA_REQ_NONE);
> > > +		chan->status = EDMA_ST_PAUSE;
> > > +		break;
> > > +
> > > +	case EDMA_REQ_STOP:
> > > +		dw_edma_finish_termination(chan);
> > > +		break;
> > > +
> > > +	default:
> > > +		break;
> > > +	}
> > > +
> > > +out:
> > > +	dw_edma_core_ch_maybe_doorbell(chan);
> > >  }
> > >
> > >  static bool dw_edma_abort_interrupt(struct dw_edma_chan *chan)
> > > @@ -965,21 +1124,44 @@ static void dw_edma_queue_irq_work(struct dw_edma_chan *chan,
> > >  static void dw_edma_record_irq(struct dw_edma_chan *chan, unsigned int events)
> > >  {
> > >  	struct dw_edma_ll_snapshot snapshot = {
> > > -		.event = events & DW_EDMA_IRQ_STOP ?
> > > -			 DW_EDMA_LL_EVENT_STOP : DW_EDMA_LL_EVENT_PROGRESS,
> > > +		.idx = -1,
> > > +		.event = DW_EDMA_LL_EVENT_NONE,
> > >  	};
> > >  	unsigned int pending = 0;
> > >
> > >  	lockdep_assert_held(dw_edma_event_lock(chan));
> > >
> > > +	/*
> > > +	 * Classify the LL event before normalizing its LLP sample to the
> > > +	 * exclusive consumer boundary. Keep STOP even without a valid
> > > +	 * boundary so deferred handling still sees that the run ended.
> > > +	 */
> > > +	if (!chan->non_ll &&
> > > +	    (events & (DW_EDMA_IRQ_DONE | DW_EDMA_IRQ_PROGRESS |
> > > +		       DW_EDMA_IRQ_STOP))) {
> > > +		if ((events & DW_EDMA_IRQ_STOP) ||
> > > +		    ((events & DW_EDMA_IRQ_DONE) &&
> > > +		     dw_edma_ll_done_is_stopped(chan)))
> > > +			snapshot.event = DW_EDMA_LL_EVENT_STOP;
> > > +		else
> > > +			snapshot.event = DW_EDMA_LL_EVENT_PROGRESS;
> > > +
> > > +		snapshot.idx = dw_edma_ll_recycle_idx(chan,
> > > +						      dw_edma_core_ll_cur_idx(chan),
> > > +						      snapshot.event);
> > > +		if (snapshot.idx < 0 &&
> > > +		    snapshot.event != DW_EDMA_LL_EVENT_STOP)
> > > +			snapshot.event = DW_EDMA_LL_EVENT_NONE;
> > > +	}
> > > +
> > >  	if ((events & DW_EDMA_IRQ_ABORT) && chan->abort_pending)
> > >  		pending |= DW_EDMA_DEFERRED_ABORT;
> > >
> > > -	if (chan->non_ll) {
> > > -		if (events & (DW_EDMA_IRQ_DONE | DW_EDMA_IRQ_STOP))
> > > -			pending |= DW_EDMA_DEFERRED_DONE;
> > > -	} else if (events & (DW_EDMA_IRQ_DONE | DW_EDMA_IRQ_PROGRESS |
> > > -			     DW_EDMA_IRQ_STOP)) {
> > > +	if (chan->non_ll &&
> > > +	    (events & (DW_EDMA_IRQ_DONE | DW_EDMA_IRQ_STOP)))
> > > +		pending |= DW_EDMA_DEFERRED_DONE;
> > > +
> > > +	if (snapshot.event != DW_EDMA_LL_EVENT_NONE) {
> > >  		/* STOP is final for this run; do not replace it with progress. */
> > >  		if (chan->ll_irq.event != DW_EDMA_LL_EVENT_STOP ||
> > >  		    snapshot.event == DW_EDMA_LL_EVENT_STOP)
> > > @@ -1227,6 +1409,7 @@ static int dw_edma_channel_setup(struct dw_edma *dw, u32 wr_alloc, u32 rd_alloc)
> > >  		chan->irq_mode = dw_edma_get_default_irq_mode(chan);
> > >  		INIT_WORK(&chan->irq_work, dw_edma_irq_work);
> > >  		atomic_set(&chan->irq_pending, 0);
> > > +		chan->ll_irq.idx = -1;
> > >  		chan->ll_irq.event = DW_EDMA_LL_EVENT_NONE;
> > >  		chan->abort_pending = false;
> > >
> > > diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
> > > index d709aa274300..27cab6ca5e67 100644
> > > --- a/drivers/dma/dw-edma/dw-edma-core.h
> > > +++ b/drivers/dma/dw-edma/dw-edma-core.h
> > > @@ -71,6 +71,7 @@ struct dw_edma_desc {
> > >
> > >  	u32				alloc_sz;
> > >
> > > +	u32				ll_start;	/* First outstanding LL entry */
> > >  	size_t				done_burst;
> > >  	size_t				start_burst;
> > >  	size_t				nburst;
> > > @@ -78,6 +79,7 @@ struct dw_edma_desc {
> > >  };
> > >
> > >  struct dw_edma_ll_snapshot {
> > > +	int				idx;
> > >  	enum dw_edma_ll_event		event;
> > >  };
> > >
> > > @@ -113,6 +115,7 @@ struct dw_edma_chan {
> > >  	 * LL event recorded by the hard IRQ handler. The event lock
> > >  	 * serializes its capture with a new hardware run; vc.lock serializes
> > >  	 * its consumption with LL state.
> > > +	 * Valid indices use the exclusive boundary convention of ll_done.
> > >  	 */
> > >  	struct dw_edma_ll_snapshot	ll_irq;
> > >  	/* ABORT is terminal and remains pending across LL state changes. */
> > > @@ -189,6 +192,7 @@ struct dw_edma_core_ops {
> > >  	enum dma_status (*ch_status)(struct dw_edma_chan *chan);
> > >  	/* Called with dw_edma_event_lock(chan) held. */
> > >  	bool (*ch_abort_int_pending)(struct dw_edma_chan *chan);
> > > +	u32 (*ch_transfer_size)(struct dw_edma_chan *chan);
> > >  	irqreturn_t (*handle_int)(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
> > >  				  dw_edma_handler_t handler);
> > >  	void (*non_ll_start)(struct dw_edma_chan *chan, struct dw_edma_burst *child);
> > > diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/dw-edma-v0-core.c
> > > index 20dff21a0603..b9d6205157b3 100644
> > > --- a/drivers/dma/dw-edma/dw-edma-v0-core.c
> > > +++ b/drivers/dma/dw-edma/dw-edma-v0-core.c
> > > @@ -318,6 +318,11 @@ static enum dma_status dw_edma_v0_core_ch_status(struct dw_edma_chan *chan)
> > >  		return DMA_ERROR;
> > >  }
> > >
> > > +static u32 dw_edma_v0_core_ch_transfer_size(struct dw_edma_chan *chan)
> > > +{
> > > +	return GET_CH_32(chan->dw, chan->dir, chan->id, transfer_size);
> > > +}
> > > +
> > >  static bool dw_edma_v0_core_ch_abort_int_pending(struct dw_edma_chan *chan)
> > >  {
> > >  	u32 sts = GET_RW_32(chan->dw, chan->dir, int_status);
> > > @@ -677,6 +682,7 @@ static const struct dw_edma_core_ops dw_edma_v0_core = {
> > >  	.ch_count = dw_edma_v0_core_ch_count,
> > >  	.ch_status = dw_edma_v0_core_ch_status,
> > >  	.ch_abort_int_pending = dw_edma_v0_core_ch_abort_int_pending,
> > > +	.ch_transfer_size = dw_edma_v0_core_ch_transfer_size,
> > >  	.handle_int = dw_edma_v0_core_handle_int,
> > >  	.ll_data = dw_edma_v0_core_ll_data,
> > >  	.ll_link = dw_edma_v0_core_ll_link,
> > > --
> > > 2.51.0
> > >
