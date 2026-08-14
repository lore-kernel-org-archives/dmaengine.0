Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021105.outbound.protection.outlook.com [40.107.74.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D09E412C0C;
	Fri, 14 Aug 2026 08:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786697304; cv=fail; b=d6DRWjrBjGXvsDAUQ3fjj7Hqr7xxzYXycGqWLIV0WGkJQSAUC7Z4aIesmt21I5MRs8IeVxXvUi6IZlPm+9xat+DnZnp+qcaTV/MmONXRtYawmuMr0Uj3OrYVCIDfCQ5DaVvJyrlDfVsYtawmGPaZADObTA2fKRDzeNIzhEgUiIY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786697304; c=relaxed/simple;
	bh=709Lkq8JU+Vt+9vG5LHjrx5VTwgzxjB8eBJFRDUxgVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UEoYRvo4tTRtZd7MW1ZvZOxAHWl/v/0lTVVmbcUWgjCKelX4K+LQ1DmKXhmH6Ld6bY11AWwapN+XVawCBJCEM/YsytwrM9kdqtukUdWSJ3BkEWSIeeZUHg8FxhlJ7V/8xy13WnSJevrQcxCcemEJhlY7mVdu/WbZ7iQVycHmc7g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=nrZjIAkN; arc=fail smtp.client-ip=40.107.74.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="nrZjIAkN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SzEvC1VfPsHBjyDftlWMK/jwWMfzqH1Kgp7BnBSdmKsZmn5Vu+3JlK+mf8klKR1EJLAYzOnPs3TCd4nSmMOqL2fSM2JJisvxK8aOC/dmUHhbaIM2MrA6Fr+dL6B2uBjYXXz3YyEa1+8PaAHlBEN22b0DULicCFCtcTjjY4C4weGcatpa/0VA5W2EiEjb7Ik7JbrVFwCjm6aahICMkmAp6BjToO+EzLTlZPo93fdqYZsAU+PFkZ47OOKpoRY4pxPEeTjEFE2lSIBYdRgLt3JBbpYFgYsAdYca98JFR/r2gazkWQq7G4C5qs92S7SQjhnb4qDnVdzkgdgv7Bz4+tQKxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LjnrejSIvZM9xIAOEVZSd0j2MUasfxx2v79kVp1Kojs=;
 b=tjwg+p+2oULk4uMkX4o907mZWEcW5RGFP9m5N+9VL0PNxe/3+9gfTXD/zAoZbpBgwUaoXGZFajZQZJvyUj6cCTvZWnGXCX96baotXGA6RIbAQZifUvYmsFbtqJnEbCIydrnk0u2vIKZfd3aPJPGMjc1P1Fhe9gvnUo4KYq8TDl1LXhOevRZTkR8QYbvdf9m23VWcyl4Qzz80mHbuVsf48ZX65Ube/k5qTUATXvQdXfg5aa7jGBseAxxzY7cTHKSk/Z6LHMKmfMZDT/sLrFoVtHNVDidCEvg31w1HXOHquEkAnuOT89erxYs5ZI1QvZUSmz/9p0Rn+wHjIr/Klg+j+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LjnrejSIvZM9xIAOEVZSd0j2MUasfxx2v79kVp1Kojs=;
 b=nrZjIAkNqy9feaJ2L2gBs7DPQ9PFqLF+r5ctJP/8OBFB7U/1tJklFxByc7EAGkCILFAxpkjSCyDhIJGV8IGJk0+zb/0XiA1j9MZpCjRq+OpKAC1lgyPmixxksDAhoQMPb9Gcvx2qOO19jB1+Q3YHfzvwm9c98DhTlAVacv/vSME=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OS9P286MB5964.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:406::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Fri, 14 Aug
 2026 08:48:18 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0315.011; Fri, 14 Aug 2026
 08:48:17 +0000
Date: Fri, 14 Aug 2026 17:48:16 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>, 
	Kees Cook <kees@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Christoph Hellwig <hch@lst.de>, Serge Semin <fancer.lancer@gmail.com>, 
	Cai Huoqing <cai.huoqing@linux.dev>, Niklas Cassel <cassel@kernel.org>, 
	Devendra K Verma <devendra.verma@amd.com>, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 13/24] dmaengine: dw-edma: Reclaim issued descriptors
 from IRQ-paired LL progress
Message-ID: <hi4ani63qjhwihylkpbensfb27u6kaqtl53mjnqpzcfbabdhgt@p6k4x5vabtph>
References: <20260812155721.2807506-1-den@valinux.co.jp>
 <20260812155721.2807506-14-den@valinux.co.jp>
 <anzdd9kAxBHvuzpo@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anzdd9kAxBHvuzpo@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: TY4PR01CA0066.jpnprd01.prod.outlook.com
 (2603:1096:405:370::7) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OS9P286MB5964:EE_
X-MS-Office365-Filtering-Correlation-Id: 4431f1f1-5ccd-4557-c26c-08def9e0c934
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|376014|7416014|1800799024|23010399003|6133799003|10067099003|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	fzEKA9lZ5h/OE4IjFf6vxYumXaFuEzE7pGz1ceRMyhvEi+oCKAlnNjg11GvdOFGho8+K8sy36xAr9YQA5PxLFCocGBYzH1b6rOdLy7HTwRHxAqS9lvBk+ZmllMTqYJeWOx8i5aCZeJtLNxzelQJjn5u3oKJyPRMODLpQzn+RYQUS1LW5KyoK0RN+GzSIP+zoaSMGLhfLBR/VPF/WS5bQit6pO//aJYR1YqCUIUoFpZWLh6/7n7+NmK29e3pZdxwUQqEeDUmg/LdToYb6y8uu9ft68w2OvuPyv2d8tKXb9L12tFHzAW4P8AuaOu6IRU75lMWTGnTv3TyivnYGchtgFAse2oqYNyxsFTV++t6tibtOaj883RrSS4KxLp1LWs9zGDKSvj3G79Ua8oC7E8eTWvrvyBT5oDWwWnv6p66ubhFOU5X2vW5AkDSgpC01WhXRemkWfhOz3IjwMw7VBXp2NcGmy5fPxxOydeM65j5Prg5LuBmQApOPS8jrv16fUCAdMumD1OgZwAAg2tsOaJl9FRp54PaRzYduDLcAW6th6gXjQ8W7Chrxpht1xrU7q3O+D2FvuW9bWzWD0Hjjg7qqFtMVXJYc58AwbMLv64DiOt3K+PZsCnGe6dHG9m7mIMeq1kkXzyv8SSHzvVL2WklBayDPl+xOkuAcb+0pN05nLUo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(7416014)(1800799024)(23010399003)(6133799003)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AKkd1qxi/AETa1q0ANB5kIev2doNRJGg9Yx6bKX38Sxh9ZZt76M2pwWoa89Q?=
 =?us-ascii?Q?ng/z3PZyIeSIr9dBYR8xo2twsjOOazEFHIKZ7ucoTSZeLAdPEx60Rd5cD6f1?=
 =?us-ascii?Q?9xkd1Eysr3JwJGmaX0DwRxbKwP0N1kpG0eR16+oIBNiL3C7I+7UG56NBlb2L?=
 =?us-ascii?Q?RlcgfAjhheY46d2aSYoe9B9AW1KchdNBQKU9l0G95CLO9M1nFHDSGsICK6+T?=
 =?us-ascii?Q?/zOQMRXvUlnqU7mwlBVT6wZyyKG560S8tA1psdvw6tpLIBInbikidAOrGkDK?=
 =?us-ascii?Q?K4yM7kw6xbXeAvajQkUfXlp/Xnm8hq/AesCAZIDQYqUxlncKtADoARSGJMaS?=
 =?us-ascii?Q?FLFnfZiVK2Ovii76HrwWyB8jVRm6DC7TrhTZIgzp6Aes34atR/UNtpB9eJpp?=
 =?us-ascii?Q?92r71zCYV7FfL9r1vraCJWHgmx64YByFlgoWoH9bPAG3gaQOV80gBhaAUeRc?=
 =?us-ascii?Q?GxLnfv4hsQWh6ZEy84ujo/rMUdwBhZ9CJ9GUyiLHKT/jfXVtEdwXP1hr0VDu?=
 =?us-ascii?Q?42/r9aObRgGpZY68qkEEsBB6tiPLXVG0SaZnIM6QbFLuIOIPlT3x/12Qbfpm?=
 =?us-ascii?Q?gpzuRb/80nrOR/c5hNDdNgVQmLf8IRkJmOKGvuTB3EJRruYK8W7eFIjsBaGr?=
 =?us-ascii?Q?+yp/KFKp3MfNAZfgw69bYJqviLunedl9c5SSGdBkGawDBaN7Xj9XgFevQCQ6?=
 =?us-ascii?Q?JcK0tATwPTzgeoaMWR9Dsv/mERZHNYW2lH+F7COOChuSoksBs9Vd5aMtD6ED?=
 =?us-ascii?Q?hSFM7s+gYoMUrdfl4ofhYXDiKPYu4Zw0opaoD550NR1PRPIFrU33nEcmOnGK?=
 =?us-ascii?Q?mk0EYFHqyED+j+lcAWELxjM9yWlvNL6eFfUU+Qbdzz/EkEPMKB8m0I9puCiE?=
 =?us-ascii?Q?cs4LXmAivUaIC6tS/ojW6hvCris8mB1g4xVck4qnqhgjTu3QQqPKyHCwfvfc?=
 =?us-ascii?Q?D8W9Vgie/y2SBAn6E8NTsLvpLKH1VGQq3EIkNoIKXSUdWynz60PdHKqjUpyR?=
 =?us-ascii?Q?6Iqa2P9bVVvLVbiO1kF9XMyYDuK/kDFJHtwC49LEPY71qvbpV/+d8PQ9tc1K?=
 =?us-ascii?Q?d9KRq/rGta5hkiWQtRYi0VlPPYjXONZC7PIyjtKSEQSPcwbHJEUqkRSYL0tC?=
 =?us-ascii?Q?vzfBrH1H795bEK49QsKgcQCR92QEcf8mVvnEFsVe5GUn1Lr01dHlrXoZyLOw?=
 =?us-ascii?Q?pksmeju3J0SgtP93ulj8SZlsHF9PGe0JOrFktV7NFI7tSqz9uGWFOccFW/a4?=
 =?us-ascii?Q?kU6u+nGAsygmOw87wqXlaYPsgKa4ZfRlR7uK4HNtXmEjcIbOwfeA0VwAOi7F?=
 =?us-ascii?Q?EqjIJdrwBeW8VWN3C4FHak2dpbHIJC3Na7ILlxv015WmOzyhnZ42lW729z2C?=
 =?us-ascii?Q?OK74qY4tjP5aMZ4gjzSNHFmKqZzb2RZBTcASWiu+4vn8BUaRoOIJv/B9ibUG?=
 =?us-ascii?Q?yM+TtSJIBMGasYHR55V8Ank2/E5OC+AaC7bnk0U0zTD4fjWjDifDW5YXM0h+?=
 =?us-ascii?Q?caXWYYDC+TJxVXI9d2ZZbJTKOfYd5RILNwxLIP9uw0nRA7gtPkIgVfWpsKdo?=
 =?us-ascii?Q?C6LdzjfU2xb01obBM52qY2BkJ0e+fkJvGuRYu8fpdJday1zzua+cwzkNeqAY?=
 =?us-ascii?Q?qK6JV4soIJyXDz1jJt3irBgIISgaGo1k3joNIsHENGALZUdezOoO/6OP6AGp?=
 =?us-ascii?Q?BJQrzyXCWY4xBjzxkZY7VWbcIw2gNdF7tcI6pvfbFWAN9Ctxvl/qFZihMv5q?=
 =?us-ascii?Q?XQwoBtPjEaLfGXPporQsXEXjRW2j11hBMKd3sk+jUUc3brdrR4qN?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 4431f1f1-5ccd-4557-c26c-08def9e0c934
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 08:48:17.8487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ffi8bIP4J7MKTQ+MCP0owO/bwplfsjhNQmY72z4cjdC7nWYlHq/BDsRCeBZfufsnSemDz8daXkvawRTEblSXqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9P286MB5964

On Wed, Aug 12, 2026 at 04:54:15PM -0400, Frank Li wrote:
> On Thu, Aug 13, 2026 at 12:57:10AM +0900, Koichiro Den wrote:
> > Dynamic append can place entries from several descriptors in one LL
> > ring. Track the consumed boundary in ll_done, reuse entries behind it,
> > and complete descriptors in issue order as done_burst advances.
> >
> > Normalize each IRQ-paired LLP sample to the exclusive boundary used by
> > ll_done. A stopped sample points to the next entry. Keep a running
> > sample one entry behind the raw LLP so an entry is not recycled before
> > payload completion is established. For the eDMA-compatible interrupt
> > interface, treat DONE as a stopped boundary only when channel status is
> > complete and transfer size is zero.
> >
> > Record the first outstanding physical LL entry in each descriptor and
> > verify that it matches ll_done before consuming that descriptor. On a
> > mismatch, warn and resynchronize only if the sampled boundary has
> > reached the descriptor; otherwise stop without completing it.
> >
> > Reclaiming entries as they are consumed also lets a descriptor larger
> > than the ring advance. Keep one data entry free so a physical index
> > remains unambiguous in the active producer window. Clear any published
> > ring state on termination or abort before starting another transfer.
> >
> > LL progress now has its own completion path, so fold the temporary
> > lock-held DONE helper back into its only caller.
> >
> > Suggested-by: Frank Li <Frank.Li@nxp.com>
> > Signed-off-by: Koichiro Den <den@valinux.co.jp>
> > ---
> > Changes in v5:
> >   - Adjust context after moving the issue_pending() snapshot discard to
> >     patch 11. dw_edma_ll_snapshot_discard() is no longer re-added here.
> >   - Fold dw_edma_ll_clean_pending() into
> >     dw_edma_ll_consume_progress(), removing the one-line wrapper
> >     (pure refactoring).
> >
> >  drivers/dma/dw-edma/dw-edma-core.c    | 273 +++++++++++++++++++++-----
> >  drivers/dma/dw-edma/dw-edma-core.h    |   4 +
> >  drivers/dma/dw-edma/dw-edma-v0-core.c |   6 +
> >  3 files changed, 238 insertions(+), 45 deletions(-)
> >
> > diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> > index 1deaf2d0da91..363993c64c44 100644
> > --- a/drivers/dma/dw-edma/dw-edma-core.c
> > +++ b/drivers/dma/dw-edma/dw-edma-core.c
> > @@ -53,13 +53,6 @@ dw_edma_alloc_desc(struct dw_edma_chan *chan, size_t nburst)
> >  {
> >  	struct dw_edma_desc *desc;
> >
> > -	/*
> > -	 * For now, a descriptor that does not fit would stall the channel
> > -	 * forever: reject it up front.
> > -	 */
> > -	if (!chan->non_ll && nburst > chan->ll_max - 1)
> > -		return NULL;
> > -
> >  	desc = kzalloc_flex(*desc, burst, nburst, GFP_NOWAIT);
> >  	if (unlikely(!desc))
> >  		return NULL;
> > @@ -79,6 +72,7 @@ static void dw_edma_ll_snapshot_discard_locked(struct dw_edma_chan *chan)
> >  {
> >  	lockdep_assert_held(dw_edma_event_lock(chan));
> >
> > +	chan->ll_irq.idx = -1;
> >  	chan->ll_irq.event = DW_EDMA_LL_EVENT_NONE;
> >  }
> >
> > @@ -128,6 +122,7 @@ dw_edma_ll_snapshot_take(struct dw_edma_chan *chan,
> >  	if (dw_edma_abort_latch_locked(chan))
> >  		return false;
> >
> > +	/* Consume each snapshot once, even if its boundary is later rejected. */
> >  	*snapshot = chan->ll_irq;
> >  	dw_edma_ll_snapshot_discard_locked(chan);
> >
> > @@ -215,7 +210,13 @@ static u32 dw_edma_core_get_used_num(struct dw_edma_chan *chan)
> >
> >  static u32 dw_edma_core_get_free_num(struct dw_edma_chan *chan)
> >  {
> > -	/* Keep one data entry free so equal indices mean an empty ring. */
> > +	/*
> > +	 * ll_done is the consumer boundary, so only the distance from ll_done
> > +	 * to ll_head is occupied. Descriptor completion is tracked separately
> > +	 * with done_burst.
> > +	 *
> > +	 * Keep one data entry free so equal indices mean an empty ring.
> > +	 */
> >  	return chan->ll_max - 1 - dw_edma_core_get_used_num(chan);
> >  }
> >
> > @@ -224,6 +225,25 @@ static bool dw_edma_ll_pending(struct dw_edma_chan *chan)
> >  	return chan->ll_head != chan->ll_done;
> >  }
> >
> > +static u32 dw_edma_core_ch_transfer_size(struct dw_edma_chan *chan)
> > +{
> > +	if (!chan->dw->core->ch_transfer_size)
> > +		return U32_MAX;
> > +
> > +	return chan->dw->core->ch_transfer_size(chan);
> > +}
> > +
> > +static bool dw_edma_ll_done_is_stopped(struct dw_edma_chan *chan)
> > +{
> > +	/*
> > +	 * Native HDMA reports STOP separately. The eDMA-compatible interrupt
> > +	 * interface uses DONE for both progress and stop, so confirm a stopped
> > +	 * boundary with channel status and transfer size.
> > +	 */
> > +	return dw_edma_core_ch_status(chan) == DMA_COMPLETE &&
> > +	       dw_edma_core_ch_transfer_size(chan) == 0;
> > +}
> > +
> >  static void dw_edma_core_ll_start(struct dw_edma_desc *desc)
> >  {
> >  	struct dw_edma_chan *chan = desc->chan;

Hi Frank, thanks for the review.

> > @@ -231,6 +251,9 @@ static void dw_edma_core_ll_start(struct dw_edma_desc *desc)
> >  	u32 free;
> >
> >  	free = dw_edma_core_get_free_num(chan);
> > +	if (free && desc->start_burst == desc->done_burst)
> > +		desc->ll_start = chan->ll_head;
> > +
> 
> should always set ll_start = chan->ll_head, always record current fit into
> which ll index.

This was intentional.

I added a source comment in this patch (i.e. patch 13/24):

  struct dw_edma_desc {
      [...]
      ll_start;       /* First outstanding LL entry */
      [...]
  }

So desc->start_burst == desc->done_burst means that no currently published LL
entries for the descriptor remain outstanding. Updating ll_start to ll_head
during a partial refill after some ring entries have been reclaimed breaks
things. ll_start is a descriptor-local moving consumer boundary.

For example, assume ll_max=8 and descriptor entries were published into data
slots 0..6. After progress has consumed slots 0..2,

  desc->start_burst = 7
  desc->done_burst = 3
  ll_done = desc->ll_start = 3
  ll_head = 7

If we updated desc->ll_start to chan->ll_head in this situation, slots 3..6
would be skipped even though they have not been consumed yet.

However, in hindsight, desc->ll_done might have been a better name. Perhaps
desc->ll_done is more suitable.

> 
> >  	for (i = desc->start_burst; i < desc->nburst && free; i++, free--) {
> >  		/*
> >  		 * Refresh the link element before filling the last data slot so
> > @@ -252,7 +275,6 @@ static void dw_edma_core_ll_start(struct dw_edma_desc *desc)
> >  		}
> >  	}
> >
> > -	desc->done_burst = desc->start_burst;
> >  	desc->start_burst = i;
> >  }
> >
> > @@ -352,6 +374,127 @@ static void dw_edma_finish_termination(struct dw_edma_chan *chan)
> >  	chan->status = EDMA_ST_IDLE;
> >  }
> >
> > +/*
> > + * Must be called with vc.lock held. Consume an LL progress boundary,
> > + * advance ll_done and complete descriptors covered by the consumed range.
> > + * Return true if ll_done advanced.
> > + */
> > +static bool dw_edma_ll_consume_progress(struct dw_edma_chan *chan, int idx)
> > +{
> > +	struct virt_dma_desc *vd, *_vd;
> > +	bool advanced = false;
> > +	u32 done, gap;
> > +
> > +	/* Ignore invalid, duplicate or stale progress. */
> > +	if (idx < 0 || (u32)idx >= chan->ll_max)
> > +		return false;
> > +
> > +	done = dw_edma_core_get_ll_dist(chan, chan->ll_done, idx);
> > +	if (!done || done > dw_edma_core_get_used_num(chan))
> > +		return false;
> > +
> > +	list_for_each_entry_safe(vd, _vd, &chan->vc.desc_issued, node) {
> > +		struct dw_edma_desc *desc = vd2dw_edma_desc(vd);
> > +		u32 consumed;
> > +
> > +		if (!done)
> > +			break;
> > +
> > +		if (WARN_ON_ONCE(desc->done_burst > desc->start_burst ||
> > +				 desc->start_burst > desc->nburst))
> > +			return advanced;
> > +
> > +		/*
> > +		 * start_burst is the next burst to append. done_burst counts
> > +		 * bursts already consumed by hardware.
> > +		 */
> > +		consumed = desc->start_burst - desc->done_burst;
> > +		if (!consumed)
> > +			break;
> > +
> > +		/*
> > +		 * ll_start ties the descriptor counters to the physical ring.
> > +		 * If accounting lost entries before this descriptor, skip them
> > +		 * only after the sampled boundary has reached ll_start.
> > +		 */
> > +		if (WARN_ON_ONCE(desc->ll_start != chan->ll_done)) {
> > +			gap = dw_edma_core_get_ll_dist(chan, chan->ll_done,
> > +						       desc->ll_start);
> > +			if (gap > done)
> > +				return advanced;
> > +
> > +			chan->ll_done = desc->ll_start;
> > +			done -= gap;
> > +			advanced = true;
> > +			if (!done)
> > +				break;
> > +		}
> > +
> > +		consumed = min(done, consumed);
> > +		desc->done_burst += consumed;
> > +		desc->ll_start = (desc->ll_start + consumed) % chan->ll_max;
> 
> It'd better update ll_start when fill ll from desc. Here should only
> update ll_done.
> 
> chan->ll_done = (chan->ll_done +  consumed) % chan->ll_max.

Same here, this was intentional. ll_start points to the first outstanding LL
entry.

For the first issued descriptor, desc->ll_start and chan->ll_done represent the
same exclusive consumer boundary, so they must advance together. Updating only
chan->ll_done would leave the descriptor-local boundary stale and fail the
consistency check on the next sample.

BTW, using ll_start as the descriptor's immutable base is another possible
design. I guess that's what you have in mind. In that case, the first
outstanding entry could be calculated as:

  (ll_start + done_burst) % ll_max

but I'm not yet sure it would simplify the implementation. The other choice
would be just renaming desc->ll_start to desc->ll_done, as I commented above.

> 
> > +		chan->ll_done = desc->ll_start;
> > +		done -= consumed;
> > +		advanced = true;
> > +
> > +		/*
> > +		 * Descriptors are published and retired in strict list order. A
> > +		 * later descriptor cannot complete until this one is fully consumed.
> > +		 */
> > +		if (desc->done_burst != desc->nburst)
> > +			break;
> > +
> > +		/* Hardware has consumed this descriptor's LL entries. */
> > +		dw_hdma_set_callback_result(vd, DMA_TRANS_NOERROR);
> > +		list_del(&vd->node);
> > +		vchan_cookie_complete(vd);
> > +	}
> > +
> > +	WARN_ON_ONCE(done);
> > +
> > +	return advanced;
> > +}
> > +
> > +static int
> > +dw_edma_ll_recycle_idx(struct dw_edma_chan *chan, int idx,
> > +		       enum dw_edma_ll_event event)
> > +{
> > +	if (idx < 0 || (u32)idx > chan->ll_max)
> > +		return -EINVAL;
> > +
> > +	/*
> > +	 * Convert the raw LLP index to the exclusive boundary used by ll_done.
> > +	 * For both eDMA and HDMA, once the engine has stopped, LLP points to
> > +	 * the next element. ll_max is the link element, hence the following
> > +	 * data boundary is 0.
> > +	 */
> > +	if (event == DW_EDMA_LL_EVENT_STOP)
> > +		return idx == chan->ll_max ? 0 : idx;
> 
> regardless state. we can always treat link element as 0. ll_max have not
> include link entry.

Right, ll_max is the number of data entries, and the physical link element is at
index ll_max. In the modulo-distance calculation, the link index and data index
0 are equivalent after normalization.

The reason the code keeps the two raw values distinguishable is the running
prev(idx) conversion (pls see below). A raw physical link index of ll_max can be
moved back to ll_max - 1. A raw data index of 0, however, may be a stale or
no-progress sample, so blindly wrapping it to ll_max - 1 could report almost one
full ring of progress.

> 
> in calculate distance between two point A, B.  (B - A) % ll_max.
> 
> It is the same when A or B is ll_max or 0.
> 
> 
> > +
> > +	/*
> > +	 * Moving a running index one entry back cannot represent index 0
> > +	 * without wrapping it to ll_max - 1. That could falsely consume a full
> > +	 * producer window, so wait for another sample or STOP.
> > +	 */
> > +	if (!idx)
> > +		return -EINVAL;
> > +
> > +	/*
> > +	 * A running eDMA LLP can move ahead of payload completion, so keep the
> > +	 * boundary one entry behind it.
> > +	 *
> > +	 * DWC PCIe Controller Databook 6.10a-lca06, Section 7.2.1, Table 7-3
> > +	 * describes an HDMA watermark LLP as an inclusive LLE recycling
> > +	 * boundary, which would normally translate to idx + 1. During testing
> > +	 * on a DWC HDMA 6.30a integration, using that boundary for DMAengine
> > +	 * completion let clients release DMA mappings while hardware still
> > +	 * accessed them, causing IOMMU faults. Keep the boundary one entry
> > +	 * behind the raw LLP for HDMA as well. Stopped samples continue to use
> > +	 * the next-entry boundary above.
> > +	 */
> > +	return idx == chan->ll_max ? chan->ll_max - 1 : idx - 1;
> 
> LLP should point current DMA working LL, always stop at which controller bit
> have not set yet.
> 
> If your logic always treat idx as unfinished, you needn't idx - 1 here.
> 
> [ll_done, idx)

I agree that [ll_done, idx) could be used when idx identifies the first
unfinished LLE. That is already how a confirmed STOP sample is handled. For an
HDMA watermark, the databook gives raw idx a different meaning, but it can still
be used as a conservative exclusive boundary. The idx - 1 retreat is used only
for a running progress sample.

    state/event              meaning of raw LLP                  current v5
                                                                 boundary
    -----------------------  ---------------------------------  ------------
    eDMA, confirmed STOPPED  Points to the next entry to be      idx
                             processed.

    HDMA, STOPPED            Points to the next entry to be      idx
                             processed.

    HDMA, running at         Points inclusively to the last      prev(idx) (*)
    WATERMARK                LLE that may be recycled,
                             according to the databook.

    eDMA, running at DONE    Was observed to advance with        prev(idx)
                             descriptor fetch before payload
                             completion.

    (*) The documented HDMA LLE-recycling boundary would normally be
        next(idx). v1 used idx as the exclusive dmaengine completion
        boundary. The current code deliberately uses the same conservative
        prev(idx) rule for all running progress samples.

For a running eDMA sample, I observed that DMA_LLP can advance with descriptor
fetch before the corresponding payload transfer has completed. Therefore raw idx
does not by itself prove that the payload for the entry immediately before idx
has finished. Using [ll_done, idx) could complete that entry and release its DMA
mapping too early.

For HDMA, the databook describes the watermark LLP as an inclusive LLE recycling
boundary, which would normally translate to next(idx). I first implemented it
that way. On a DWC HDMA 6.30a integration (SpacemiT K3), however, this let the
client unmap memory while hardware was still accessing it, causing IOMMU faults.
Moving the completion boundary back to prev(idx) stopped the faults.

For completeness, v1 used raw idx as the exclusive HDMA completion boundary,
[ll_done, idx), and completed the HDMA fio test set reliably. So raw idx itself
is not known to be unsafe.

After next(idx) caused the IOMMU faults, however, I deliberately aligned HDMA
with the conservative eDMA handling (pls. see the comment block in
dw_edma_ll_recycle_idx()). All running progress samples use the same prev(idx)
conversion, while confirmed STOP samples use the exact next-entry boundary. This
keeps the common normalization simple and avoids engine-specific handling. For
HDMA, the trade-off is that completion stays one additional entry behind raw idx
until later progress or STOP catches it up.

I think this is related to the fact that HDMA LL mode decouples descriptor
fetching, data processing, completion processing, and interrupt handling. That
explains why the documented LLE-recycling boundary cannot automatically be used
as the dmaengine completion boundary, although it does not by itself tell us
whether idx or prev(idx) is required.

The idx == 0 handling is also a consequence of the current prev(idx) retreat.
For example, with data entries 0..7 and the physical link element at index 8,
moving raw index 8 back gives boundary 7. Blindly moving raw data index 0 back
would also wrap to 7. If that raw 0 was a no-progress sample, it could then look
like almost one full ring of progress. Therefore raw 0 is rejected while the
physical link index remains distinguishable.

In other words, without the prev(idx) retreat, the link index could simply be
normalized to 0, as you mentioned. The current prev(idx) handling was
nevertheless intentional, not an oversight. It trades one-entry delayed HDMA
completion for one conservative rule shared with eDMA. Unless there is a
concrete reason to reclaim that extra entry at each HDMA watermark, I would
prefer to keep the common handling.

Best regards,
Koichiro

> 
> > +}
> > +
> >  static void dw_edma_core_ll_sync(struct dw_edma_chan *chan)
> >  {
> >  	/*
> > @@ -834,31 +977,30 @@ dw_edma_device_prep_interleaved_dma(struct dma_chan *dchan,
> >  	return dw_edma_device_transfer(&xfer, dw_edma_device_get_config(dchan, NULL));
> >  }
> >
> > -/* Must be called with vc.lock held. */
> > -static void dw_edma_done_interrupt_locked(struct dw_edma_chan *chan)
> > +static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
> >  {
> >  	struct dw_edma_desc *desc;
> >  	struct virt_dma_desc *vd;
> > +	unsigned long flags;
> >
> > -	lockdep_assert_held(&chan->vc.lock);
> > -
> > -	if (chan->status == EDMA_ST_PAUSE)
> > +	spin_lock_irqsave(&chan->vc.lock, flags);
> > +	if (chan->status == EDMA_ST_PAUSE) {
> > +		spin_unlock_irqrestore(&chan->vc.lock, flags);
> >  		return;
> > +	}
> >
> >  	switch (chan->request) {
> >  	case EDMA_REQ_NONE:
> >  	case EDMA_REQ_PAUSE:
> >  		vd = vchan_next_desc(&chan->vc);
> > -		if (!vd)
> > -			break;
> > -
> > -		desc = vd2dw_edma_desc(vd);
> > -		if (desc->start_burst >= desc->nburst) {
> > -			dw_hdma_set_callback_result(vd, DMA_TRANS_NOERROR);
> > -			list_del(&vd->node);
> > -			vchan_cookie_complete(vd);
> > -			if (!chan->non_ll)
> > -				chan->ll_done = chan->ll_head;
> > +		if (vd) {
> > +			desc = vd2dw_edma_desc(vd);
> > +			if (desc->start_burst >= desc->nburst) {
> > +				dw_hdma_set_callback_result(vd,
> > +							    DMA_TRANS_NOERROR);
> > +				list_del(&vd->node);
> > +				vchan_cookie_complete(vd);
> > +			}
> >  		}
> >
> >  		if (chan->request == EDMA_REQ_PAUSE) {
> > @@ -871,25 +1013,12 @@ static void dw_edma_done_interrupt_locked(struct dw_edma_chan *chan)
> >  		break;
> >
> >  	case EDMA_REQ_STOP:
> > -		vd = vchan_next_desc(&chan->vc);
> > -		if (!vd)
> > -			break;
> > -
> >  		dw_edma_finish_termination(chan);
> >  		break;
> >
> >  	default:
> >  		break;
> >  	}
> > -	dw_edma_core_ch_maybe_doorbell(chan);
> > -}
> > -
> > -static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
> > -{
> > -	unsigned long flags;
> > -
> > -	spin_lock_irqsave(&chan->vc.lock, flags);
> > -	dw_edma_done_interrupt_locked(chan);
> >  	spin_unlock_irqrestore(&chan->vc.lock, flags);
> >  }
> >
> > @@ -902,7 +1031,37 @@ static void dw_edma_ll_interrupt(struct dw_edma_chan *chan)
> >  	if (!dw_edma_ll_snapshot_take(chan, &snapshot))
> >  		return;
> >
> > -	dw_edma_done_interrupt_locked(chan);
> > +	if (chan->status == EDMA_ST_PAUSE)
> > +		return;
> > +
> > +	dw_edma_ll_consume_progress(chan, snapshot.idx);
> > +
> > +	if (snapshot.event == DW_EDMA_LL_EVENT_PROGRESS &&
> > +	    chan->request != EDMA_REQ_NONE)
> > +		goto out;
> > +
> > +	switch (chan->request) {
> > +	case EDMA_REQ_NONE:
> > +		dw_edma_start_transfer(chan);
> > +		chan->status = dw_edma_ll_pending(chan) ?
> > +			       EDMA_ST_BUSY : EDMA_ST_IDLE;
> > +		break;
> > +
> > +	case EDMA_REQ_PAUSE:
> > +		dw_edma_set_request(chan, EDMA_REQ_NONE);
> > +		chan->status = EDMA_ST_PAUSE;
> > +		break;
> > +
> > +	case EDMA_REQ_STOP:
> > +		dw_edma_finish_termination(chan);
> > +		break;
> > +
> > +	default:
> > +		break;
> > +	}
> > +
> > +out:
> > +	dw_edma_core_ch_maybe_doorbell(chan);
> >  }
> >
> >  static bool dw_edma_abort_interrupt(struct dw_edma_chan *chan)
> > @@ -965,21 +1124,44 @@ static void dw_edma_queue_irq_work(struct dw_edma_chan *chan,
> >  static void dw_edma_record_irq(struct dw_edma_chan *chan, unsigned int events)
> >  {
> >  	struct dw_edma_ll_snapshot snapshot = {
> > -		.event = events & DW_EDMA_IRQ_STOP ?
> > -			 DW_EDMA_LL_EVENT_STOP : DW_EDMA_LL_EVENT_PROGRESS,
> > +		.idx = -1,
> > +		.event = DW_EDMA_LL_EVENT_NONE,
> >  	};
> >  	unsigned int pending = 0;
> >
> >  	lockdep_assert_held(dw_edma_event_lock(chan));
> >
> > +	/*
> > +	 * Classify the LL event before normalizing its LLP sample to the
> > +	 * exclusive consumer boundary. Keep STOP even without a valid
> > +	 * boundary so deferred handling still sees that the run ended.
> > +	 */
> > +	if (!chan->non_ll &&
> > +	    (events & (DW_EDMA_IRQ_DONE | DW_EDMA_IRQ_PROGRESS |
> > +		       DW_EDMA_IRQ_STOP))) {
> > +		if ((events & DW_EDMA_IRQ_STOP) ||
> > +		    ((events & DW_EDMA_IRQ_DONE) &&
> > +		     dw_edma_ll_done_is_stopped(chan)))
> > +			snapshot.event = DW_EDMA_LL_EVENT_STOP;
> > +		else
> > +			snapshot.event = DW_EDMA_LL_EVENT_PROGRESS;
> > +
> > +		snapshot.idx = dw_edma_ll_recycle_idx(chan,
> > +						      dw_edma_core_ll_cur_idx(chan),
> > +						      snapshot.event);
> > +		if (snapshot.idx < 0 &&
> > +		    snapshot.event != DW_EDMA_LL_EVENT_STOP)
> > +			snapshot.event = DW_EDMA_LL_EVENT_NONE;
> > +	}
> > +
> >  	if ((events & DW_EDMA_IRQ_ABORT) && chan->abort_pending)
> >  		pending |= DW_EDMA_DEFERRED_ABORT;
> >
> > -	if (chan->non_ll) {
> > -		if (events & (DW_EDMA_IRQ_DONE | DW_EDMA_IRQ_STOP))
> > -			pending |= DW_EDMA_DEFERRED_DONE;
> > -	} else if (events & (DW_EDMA_IRQ_DONE | DW_EDMA_IRQ_PROGRESS |
> > -			     DW_EDMA_IRQ_STOP)) {
> > +	if (chan->non_ll &&
> > +	    (events & (DW_EDMA_IRQ_DONE | DW_EDMA_IRQ_STOP)))
> > +		pending |= DW_EDMA_DEFERRED_DONE;
> > +
> > +	if (snapshot.event != DW_EDMA_LL_EVENT_NONE) {
> >  		/* STOP is final for this run; do not replace it with progress. */
> >  		if (chan->ll_irq.event != DW_EDMA_LL_EVENT_STOP ||
> >  		    snapshot.event == DW_EDMA_LL_EVENT_STOP)
> > @@ -1227,6 +1409,7 @@ static int dw_edma_channel_setup(struct dw_edma *dw, u32 wr_alloc, u32 rd_alloc)
> >  		chan->irq_mode = dw_edma_get_default_irq_mode(chan);
> >  		INIT_WORK(&chan->irq_work, dw_edma_irq_work);
> >  		atomic_set(&chan->irq_pending, 0);
> > +		chan->ll_irq.idx = -1;
> >  		chan->ll_irq.event = DW_EDMA_LL_EVENT_NONE;
> >  		chan->abort_pending = false;
> >
> > diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
> > index d709aa274300..27cab6ca5e67 100644
> > --- a/drivers/dma/dw-edma/dw-edma-core.h
> > +++ b/drivers/dma/dw-edma/dw-edma-core.h
> > @@ -71,6 +71,7 @@ struct dw_edma_desc {
> >
> >  	u32				alloc_sz;
> >
> > +	u32				ll_start;	/* First outstanding LL entry */
> >  	size_t				done_burst;
> >  	size_t				start_burst;
> >  	size_t				nburst;
> > @@ -78,6 +79,7 @@ struct dw_edma_desc {
> >  };
> >
> >  struct dw_edma_ll_snapshot {
> > +	int				idx;
> >  	enum dw_edma_ll_event		event;
> >  };
> >
> > @@ -113,6 +115,7 @@ struct dw_edma_chan {
> >  	 * LL event recorded by the hard IRQ handler. The event lock
> >  	 * serializes its capture with a new hardware run; vc.lock serializes
> >  	 * its consumption with LL state.
> > +	 * Valid indices use the exclusive boundary convention of ll_done.
> >  	 */
> >  	struct dw_edma_ll_snapshot	ll_irq;
> >  	/* ABORT is terminal and remains pending across LL state changes. */
> > @@ -189,6 +192,7 @@ struct dw_edma_core_ops {
> >  	enum dma_status (*ch_status)(struct dw_edma_chan *chan);
> >  	/* Called with dw_edma_event_lock(chan) held. */
> >  	bool (*ch_abort_int_pending)(struct dw_edma_chan *chan);
> > +	u32 (*ch_transfer_size)(struct dw_edma_chan *chan);
> >  	irqreturn_t (*handle_int)(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
> >  				  dw_edma_handler_t handler);
> >  	void (*non_ll_start)(struct dw_edma_chan *chan, struct dw_edma_burst *child);
> > diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/dw-edma-v0-core.c
> > index 20dff21a0603..b9d6205157b3 100644
> > --- a/drivers/dma/dw-edma/dw-edma-v0-core.c
> > +++ b/drivers/dma/dw-edma/dw-edma-v0-core.c
> > @@ -318,6 +318,11 @@ static enum dma_status dw_edma_v0_core_ch_status(struct dw_edma_chan *chan)
> >  		return DMA_ERROR;
> >  }
> >
> > +static u32 dw_edma_v0_core_ch_transfer_size(struct dw_edma_chan *chan)
> > +{
> > +	return GET_CH_32(chan->dw, chan->dir, chan->id, transfer_size);
> > +}
> > +
> >  static bool dw_edma_v0_core_ch_abort_int_pending(struct dw_edma_chan *chan)
> >  {
> >  	u32 sts = GET_RW_32(chan->dw, chan->dir, int_status);
> > @@ -677,6 +682,7 @@ static const struct dw_edma_core_ops dw_edma_v0_core = {
> >  	.ch_count = dw_edma_v0_core_ch_count,
> >  	.ch_status = dw_edma_v0_core_ch_status,
> >  	.ch_abort_int_pending = dw_edma_v0_core_ch_abort_int_pending,
> > +	.ch_transfer_size = dw_edma_v0_core_ch_transfer_size,
> >  	.handle_int = dw_edma_v0_core_handle_int,
> >  	.ll_data = dw_edma_v0_core_ll_data,
> >  	.ll_link = dw_edma_v0_core_ll_link,
> > --
> > 2.51.0
> >
