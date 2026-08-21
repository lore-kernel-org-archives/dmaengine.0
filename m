Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013020.outbound.protection.outlook.com [40.107.162.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CE61E0E14;
	Fri, 21 Aug 2026 20:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787343441; cv=fail; b=g/Q1+bxXSJGqCF+Zn7RnbKvJFsOtX0nxJAapFKkTV2/Ob505jU2YdCKanQ5Bfx/Owrb0LW/Ka6OsxkMLhyhvAHKemyzT2xauN0txXwL1pGjMa5lnGy7GdLRlJ2cGM80uAb2UrcaHjuGVehOdNdlwGCgaJxvNbclpa6zO0eka+0Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787343441; c=relaxed/simple;
	bh=gFXV+kQzjBtrw8YbwHoLMof1zeDOcXaN5J3D3rr6p9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fbbGNgY+bA4m21sZD3ZzzNLyZ+T6NziaUJ6VCnp0ZDI3mLc+C5bazNROviYHUHZ+MmR9YcNOaFiN+1sqA4MNuWgHQ6phlBVPxhKL9KLCSDXMqOTh0BkLMWwljVOOVrKGyJOAdC1YkFSijzTUPjGzEZWu3is8U5ENP2WPYwckztI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=EuZY/8Rh; arc=fail smtp.client-ip=40.107.162.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="EuZY/8Rh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X1L98p3LntoBUAVpxcbUkjqquTyyHaFAMIB+oMUiKuyP8LKbhhptTBf+ZLTGv+Gp4Fp0v8DFucPfHS6JXLTZfIZFTDlUGLcwPUn0MvyGaCWv0QvlY6Z07my/EKN1vqrNZJnqM+GE++METieAClyyIT2LaCoiP2/RntyQW6sQJQSl1bla193EXfN3bUzqXyV8J0Ol5rFtqFQgUGn5EMNNmJ6T8hwY7Q8FYSrRjWmdRWogXHz7dN2M9/g+Ogqelk/6ovqI8AQN67aLJbxkA7k8poAy+Bd/4KgWNgQ97VIwy8WJmGkns4njO19fyqsIRdmyXwLAxCSTcH1ullDmM7Pinw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SPjg0/kxgoxkJGkvvi6QiJYpZ3BDfQDJM2xOyg5t8j8=;
 b=X7Va2wZvZJKod/qdlL6NNmUfYfDpwT3cDFJvNvvXiBt74DS9qcHEVCph56NNL6G5yZQko4NezmMnuOXJXSEeodUXBBqR+xKALe46TGXBqYrvF2L5einya+TQkLzDIXtzHkH9nX6rKPz19pkOa1rW1e0LiMmFIU+oZwFyCRIab4n4D2q5LkV0JOFXPW3XjWUhQ7AqpIm5VqAcA5lSmlITrxVlfCDPyoU/a+C+UJAUKnmcvLUBaUBewPy2qO8D4cGtti4wRyw4h46FT8ei5ANa2rapHiCM+/Q2BkeAySxyG5pKOnbbu2TcQOTONfKRlY5In+Y1G2s4bvQokBV+p/QhZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SPjg0/kxgoxkJGkvvi6QiJYpZ3BDfQDJM2xOyg5t8j8=;
 b=EuZY/8Rh/N7yDAgq/UP5k1mjfCTYAta56BJTRCPOoKlGumEiw9pCVfAq7AO6/zGt1wDSjl8RcRh4HZCjC2DCDW3g9U0xMPSpnf2bIYvBcvmOdqiODqCu/ZGxz5fp2KFTiKxjb4HOMPu4/nfA8wNawi2XSApUzyLayGWK5WPPgQbiSPSg5va9wEk1VGMPFpeiU0BoSJ3i8zQ3KtRAfHzgUJAwY7hR2PoQ5mYGO3AJqcalcLZIkLtK1Hk0CfxW7+iP75yBU8SKq30JKwEDAs/pzHVPXQT4j4HTPzjinFcvGSuQ3wzIkQpCSSDt+4OMvAHRxIliP+cu4f6pjZ15NrwCzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA3PR04MB11201.eurprd04.prod.outlook.com (2603:10a6:102:4b1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 20:17:15 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.010; Fri, 21 Aug 2026
 20:17:14 +0000
Date: Fri, 21 Aug 2026 16:17:01 -0400
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
Message-ID: <aoiyPQVGS8gkdNoW@lizhi-Precision-Tower-5810>
References: <20260812155721.2807506-1-den@valinux.co.jp>
 <20260812155721.2807506-14-den@valinux.co.jp>
 <anzdd9kAxBHvuzpo@lizhi-Precision-Tower-5810>
 <hi4ani63qjhwihylkpbensfb27u6kaqtl53mjnqpzcfbabdhgt@p6k4x5vabtph>
 <an84kpKLfr8ACBEQ@SMW015318>
 <m5sw477gk4idakurqq2ngz5a5ehqdfwd274bqroitzzmefftyq@appeqhwo5lkv>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <m5sw477gk4idakurqq2ngz5a5ehqdfwd274bqroitzzmefftyq@appeqhwo5lkv>
X-ClientProxiedBy: DX1P273CA0016.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:21::21) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA3PR04MB11201:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ffa5ae9-1cda-44d3-9e39-08deffc13081
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|7416014|1800799024|23010399003|6133799003|10067099003|5023799004|11063799006|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	yDD1SzmE00Ksp6byq8DtcgKKzPeDg1Es0Iin/L+0sp7c+GDiJnRiBhdEc+XiTAPVWU6TutnwKIGHnOP1etu8MhRbWk2sDt4L7pFFWuT/kC8SN5gqEaOXe10nnbHzFsv6gJrKk6hMMGK/mb/NNNqolLWxd/7NvqTUREJbxEMCF5LgTtEV/xPkuW5AteKjeqIHJmJuy9xqAJsXk5O4l4TjZljVumFwi24hCMwQwwef2l52lr0TOGQwLA1rk50WZXkTQTJjM9YHqZ1mgwnFJTuW9R8A69XF2DhhqPbUd7TUq0p5M1iWsbM+nSQ5Q/Wt44lddu/EN/aBT8N/gScEYudskO4X1AZTOIzWjdGBPOKw+RRma0mE4tYvIwQ8FFv/d/ptEyvXWd85oFXRcjHvJGYSL6L3oh5VnOTfMlEPODrpcdafRH0ZJgAwXF6yf2ryVArJ6P9vfDzQxsautFi3cWij3+Tig6/rSVEH65q6rAboG1Vpxagmg2NGGjvL51AeBlEPwJj/hC2mou+soN6j32bIsEadA+DZy2d0h5DTHzpcu386/9kYjqIdi8xKDk2DbkfHCRSdQ7DRq+oFLAYgIxRLOm7MRftf5DZ5dY1cMK/QiRAzCRErJOlVdIxstA2CnH8qOe/Y9moqrx4jH4xxGCIiMipYn8wjCTa/iOwgnXzb8J0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(7416014)(1800799024)(23010399003)(6133799003)(10067099003)(5023799004)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JWXlNGAFOKGXe6oMdHRUkbxESqXK+LiRVT5uNVi+RaQ4r8gpQ1RyK+XHitJj?=
 =?us-ascii?Q?Ub6lzJvIkVP6WsuUgdGbAS/NgoiioQCbuRuSuMf1dhcs22wojwlIXJA0Iq+4?=
 =?us-ascii?Q?OGDIlLn1OkPoYFH6ZqLS4X+yuRZUpUVsnJebrECK7Mqtp0n4Wv40m38++ys/?=
 =?us-ascii?Q?MN7NQNNkpibrBzjJDIamZxPLD7g3r2N/4HNPlr5ml73q9ktd/mSg+REtWJ/e?=
 =?us-ascii?Q?lUSDS3aiOQMWR8DlBBRNZTtgvE4Z5mlrafm6zAfXAXj0YFosp/Ea7XVHPj8r?=
 =?us-ascii?Q?7nsovs9CBC0ZB/ziia6x8Lz/6WuD6DRQ5C9p/GLqJMs89rAzJp91nolEvo0J?=
 =?us-ascii?Q?fCk/9BEAqIZXJK/ADtUB4WiXeKGC2qw2oHHSGDSspQk5axxyIrdLTnCTuITo?=
 =?us-ascii?Q?6SF2MawKNnoLNJ/5wunmLPOvu56MM8qu9EMUZ3kIDOdvpbQGxbArbx9/oO/r?=
 =?us-ascii?Q?B8aK+4xOR5gpj94Far+VOuPDSFbK11FAzTXHNT0WKlRpAepmQbJFUNt2i/bi?=
 =?us-ascii?Q?VjnKlWgMcghDihB5V0far13YhZTVRlaJjTH07cx+5ND+2fVJc2HeFqYMiKGH?=
 =?us-ascii?Q?q5aYeRzuoYKt0vlLSmG3kr00XCY9uqmIsnVDyIWwQBNWUTyG7IB8qkYrAWqA?=
 =?us-ascii?Q?G2X11WJuCZsSBPr8dxsDOGP5PQGNilGOyBsmIWBZsi/zvbsdnOLBk7rmM/7O?=
 =?us-ascii?Q?rdV1zswGv/aTywXBApQfBkromnAOJEkzR5j/3Ss6QkIscFVxFI0cmZ62DCKV?=
 =?us-ascii?Q?8+9nlYKC/0sJ9bb8BcXZpbJw4/MwnlbYhsVJYXwHAhLb9Wa2dq2wPMkxlIRg?=
 =?us-ascii?Q?Wol+EBxPhZMggZOz+Ai3rQKE1QCcZHcdTXhI0XtaYeBuEb8r0kZGMUDH2FBS?=
 =?us-ascii?Q?L+5ipp31n/zBHzjt93JiSNXb3R6wjKhudWwf76vUQKwZlPWWzjhlIcPT/X04?=
 =?us-ascii?Q?fkazSYWvYPQhXvkF/pqA5NPk0m4N/cNaDpU/D5Epy0rLFMU578Bwb40dLkW2?=
 =?us-ascii?Q?OM72AVSBOFfO5v0asQtaO+v9Im1739OsPO1Ns9zVBr5YlFOAocMOhXYY/Tt5?=
 =?us-ascii?Q?KF1UIKKwmjWp99YNKEY5qx5paQpZuWnNykp0BpsOqqH4xZq2h1b08BRSU1Zx?=
 =?us-ascii?Q?xJSksW31CahBnvxZafNk9YMOBl6TOErraZRYz6VtCiKBKOso4EfuF3UW6Y/D?=
 =?us-ascii?Q?bhhXK4KSfh0p0MDATN9S6iccW1B1W7g1+stGjpfMqqJ4VNThbolh2FJuqp/1?=
 =?us-ascii?Q?Be7KU2fUFCj7hpE7M0t2rwL78K5VNdk/fj5lF4kZamzEvCuyVUAETgRKdzhx?=
 =?us-ascii?Q?qOJbqZrMUzF0qM+FGWHrm2P+VQowBlzO3VJfR4KelbkKNgum+qBKuQltn+0u?=
 =?us-ascii?Q?XztP08Q65/rSPxbcmSCHPyEm93rZLMpk4ijPALn2EbZbTwvOyhiN9RcP960H?=
 =?us-ascii?Q?+Mt4FYWCCaVEXKfnAUGhzO6ZP+/3lFuhchVpkw8HUOEj45dYhtGCYBagueYn?=
 =?us-ascii?Q?aXSeQZ/qgEV2Q1hlrzoaJkPj8UAfkljU4W7J805m2doik8R6/janNKNQn2Z6?=
 =?us-ascii?Q?QyziBx2/zKvR3YWu3feohOnQp8pwiodjD9atZjtioDkQmC92aVVRu/OwG4dk?=
 =?us-ascii?Q?YB8Y+l2Ho1zBKjmy3eQ2E2SrCdAunje5RwPMQ/OfdQsth/FNndA1aH0BM3D+?=
 =?us-ascii?Q?I2g2Rx3Ou6NKr8YJmQR6vfOq/p9zoqb5e0Nolc06Qa/csolnYPuB0uKVcGeR?=
 =?us-ascii?Q?jUED/8P/XGhwBypubNBUPvpSUzTHC4m75CfQkw/3jcoXP58sWYhU?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ffa5ae9-1cda-44d3-9e39-08deffc13081
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 20:17:14.6634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9y8yokbCpEIIG9YzpqsvE8Wtp8K6iVUQGy/i7g40gd3HkkXMqoe0HD399UBkHvymRYb3ZTGSJm9XqMiWOF9CUy4CvXC136fSKteZdHU7VRu/BGpSyuDkirqMMv5KUqEH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3PR04MB11201

On Sat, Aug 15, 2026 at 11:36:54PM +0900, Koichiro Den wrote:
> On Fri, Aug 14, 2026 at 10:47:30AM -0500, Frank Li wrote:
> > On Fri, Aug 14, 2026 at 05:48:16PM +0900, Koichiro Den wrote:
> > > On Wed, Aug 12, 2026 at 04:54:15PM -0400, Frank Li wrote:
> > > > On Thu, Aug 13, 2026 at 12:57:10AM +0900, Koichiro Den wrote:
> > > > > Dynamic append can place entries from several descriptors in one LL
> > > > > ring. Track the consumed boundary in ll_done, reuse entries behind it,
> > > > > and complete descriptors in issue order as done_burst advances.
> > > > >
> > > > > Normalize each IRQ-paired LLP sample to the exclusive boundary used by
> > > > > ll_done. A stopped sample points to the next entry. Keep a running
> > > > > sample one entry behind the raw LLP so an entry is not recycled before
> > > > > payload completion is established. For the eDMA-compatible interrupt
> > > > > interface, treat DONE as a stopped boundary only when channel status is
> > > > > complete and transfer size is zero.
> > > > >
> > > > > Record the first outstanding physical LL entry in each descriptor and
> > > > > verify that it matches ll_done before consuming that descriptor. On a
> > > > > mismatch, warn and resynchronize only if the sampled boundary has
> > > > > reached the descriptor; otherwise stop without completing it.
> > > > >
> > > > > Reclaiming entries as they are consumed also lets a descriptor larger
> > > > > than the ring advance. Keep one data entry free so a physical index
> > > > > remains unambiguous in the active producer window. Clear any published
> > > > > ring state on termination or abort before starting another transfer.
> > > > >
> > > > > LL progress now has its own completion path, so fold the temporary
> > > > > lock-held DONE helper back into its only caller.
> > > > >
> > > > > Suggested-by: Frank Li <Frank.Li@nxp.com>
> > > > > Signed-off-by: Koichiro Den <den@valinux.co.jp>
> > > > > ---
> > > > > Changes in v5:
> > > > >   - Adjust context after moving the issue_pending() snapshot discard to
> > > > >     patch 11. dw_edma_ll_snapshot_discard() is no longer re-added here.
> > > > >   - Fold dw_edma_ll_clean_pending() into
> > > > >     dw_edma_ll_consume_progress(), removing the one-line wrapper
> > > > >     (pure refactoring).
> > > > >
> > > > >  drivers/dma/dw-edma/dw-edma-core.c    | 273 +++++++++++++++++++++-----
> > > > >  drivers/dma/dw-edma/dw-edma-core.h    |   4 +
> > > > >  drivers/dma/dw-edma/dw-edma-v0-core.c |   6 +
> > > > >  3 files changed, 238 insertions(+), 45 deletions(-)
> > > > >
> > > > > diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> > > > > index 1deaf2d0da91..363993c64c44 100644
> > > > > --- a/drivers/dma/dw-edma/dw-edma-core.c
> > > > > +++ b/drivers/dma/dw-edma/dw-edma-core.c
> ---[snip]---
> > > > > +
> > > > > +	/*
> > > > > +	 * Moving a running index one entry back cannot represent index 0
> > > > > +	 * without wrapping it to ll_max - 1. That could falsely consume a full
> > > > > +	 * producer window, so wait for another sample or STOP.
> > > > > +	 */
> > > > > +	if (!idx)
> > > > > +		return -EINVAL;
> > > > > +
> > > > > +	/*
> > > > > +	 * A running eDMA LLP can move ahead of payload completion, so keep the
> > > > > +	 * boundary one entry behind it.
> > > > > +	 *
> > > > > +	 * DWC PCIe Controller Databook 6.10a-lca06, Section 7.2.1, Table 7-3
> > > > > +	 * describes an HDMA watermark LLP as an inclusive LLE recycling
> > > > > +	 * boundary, which would normally translate to idx + 1. During testing
> > > > > +	 * on a DWC HDMA 6.30a integration, using that boundary for DMAengine
> > > > > +	 * completion let clients release DMA mappings while hardware still
> > > > > +	 * accessed them, causing IOMMU faults. Keep the boundary one entry
> > > > > +	 * behind the raw LLP for HDMA as well. Stopped samples continue to use
> > > > > +	 * the next-entry boundary above.
> > > > > +	 */
> > > > > +	return idx == chan->ll_max ? chan->ll_max - 1 : idx - 1;
> > > >
> > > > LLP should point current DMA working LL, always stop at which controller bit
> > > > have not set yet.
> > > >
> > > > If your logic always treat idx as unfinished, you needn't idx - 1 here.
> > > >
> > > > [ll_done, idx)
> > >
> > > I agree that [ll_done, idx) could be used when idx identifies the first
> > > unfinished LLE. That is already how a confirmed STOP sample is handled. For an
> > > HDMA watermark, the databook gives raw idx a different meaning, but it can still
> > > be used as a conservative exclusive boundary. The idx - 1 retreat is used only
> > > for a running progress sample.
> > >
> > >     state/event              meaning of raw LLP                  current v5
> > >                                                                  boundary
> > >     -----------------------  ---------------------------------  ------------
> > >     eDMA, confirmed STOPPED  Points to the next entry to be      idx
> > >                              processed.
> > >
> > >     HDMA, STOPPED            Points to the next entry to be      idx
> > >                              processed.
> > >
> > >     HDMA, running at         Points inclusively to the last      prev(idx) (*)
> > >     WATERMARK                LLE that may be recycled,
> > >                              according to the databook.
> > >
> > >     eDMA, running at DONE    Was observed to advance with        prev(idx)
> > >                              descriptor fetch before payload
> > >                              completion.
> > >
> > >     (*) The documented HDMA LLE-recycling boundary would normally be
> > >         next(idx). v1 used idx as the exclusive dmaengine completion
> > >         boundary. The current code deliberately uses the same conservative
> > >         prev(idx) rule for all running progress samples.
> >
> > Thank you for good summary. The key problem is that it is hard to know
> > DMA running or STOP. Espcially use polling mode.
> >
> > 	assume a bus loop
> >
> > 	while(1) {
> > 		if (condition) { 	1
> > 			do_action()     2
> > 		}
> > 	}
> >
> > 1, Generally read some register status or software state.
> > 2. Read idx
> >
> > between 1 and 2, if 1 test is running, after test and before do action,
> > dma may be already stopped.
> >
> > DMA engine is totally async with cpu.
>
> Yes, sure. The table in my previous reply summarized the state/event-dependent
> HDMA_LLP semantics as described in the databook. It was not assuming that
> RUNNING/STOPPED remains stable between two MMIO reads.

can we use typical method by read twice

	do {
		status = readl(status);
		idx	= readl(llp);
	} while (status != readl(status);

status idx always reflect the same time hardware status.

Frank

>
> I am aware of the race you described, and the implementation handles it
> conservatively, including this v5. If hardware updates LLP and reaches STOP just
> after the interrupt-status read, the sample may be treated as running progress.
> The newly asserted STOP status remains for the later STOP pass, while the
> stopped-tail recheck provides another fallback.
>
> >
> > >
> > > For a running eDMA sample, I observed that DMA_LLP can advance with descriptor
> > > fetch before the corresponding payload transfer has completed. Therefore raw idx
> > > does not by itself prove that the payload for the entry immediately before idx
> > > has finished. Using [ll_done, idx) could complete that entry and release its DMA
> > > mapping too early.
> >
> >
> > This is bad hardware design. Pre Fetch should not show in register leave.
> >
> > Maybe a workaround, dma driver create pre allocated memory.
> >
> > When prep sg, append an extra LL, which write/read to this pre allocate
> > memory, we can check this pre allocated memory to know current dma working
> > status.
> >
> > This is embeded DMA, one side have to be remote side memory, which make work
> > around complex.
>
> Thanks for the suggestion. The extra LL idea might be one possible direction to
> avoid relying on LLP. Even though the databook describes LLP in detail, if a
> copmletion-marker LLE makes the software decision simpler, I think it is worth
> considering.
>
> Plus, my guess is that one extra LLE would not affect the throughput ceiling
> much. As you said, the question is whether the remote side can be handled
> without making the generic implementation more complicated.
>
> >
> > >
> > > For HDMA, the databook describes the watermark LLP as an inclusive LLE recycling
> > > boundary, which would normally translate to next(idx). I first implemented it
> > > that way. On a DWC HDMA 6.30a integration (SpacemiT K3), however, this let the
> > > client unmap memory while hardware was still accessing it, causing IOMMU faults.
> > > Moving the completion boundary back to prev(idx) stopped the faults.
> > >
> > > For completeness, v1 used raw idx as the exclusive HDMA completion boundary,
> > > [ll_done, idx), and completed the HDMA fio test set reliably. So raw idx itself
> > > is not known to be unsafe.
> > >
> > > After next(idx) caused the IOMMU faults, however, I deliberately aligned HDMA
> > > with the conservative eDMA handling (pls. see the comment block in
> > > dw_edma_ll_recycle_idx()). All running progress samples use the same prev(idx)
> > > conversion, while confirmed STOP samples use the exact next-entry boundary. This
> > > keeps the common normalization simple and avoids engine-specific handling. For
> > > HDMA, the trade-off is that completion stays one additional entry behind raw idx
> > > until later progress or STOP catches it up.
> >
> > So DMA engine move idx advance even though current LL still working.
> > It is quite common at some modem dmaengine to improve dma preforamce, but
> > it should be hidden in hardware internal, like CPU's PC pointer.
>
> Please note again that this is only my observation on one integration, not a
> claim about the architected behaviour. Input from someone at Synopsys would help
> confirm it. Even if this is the actual behaviour, I think it can be handled
> conservatively in software, as the LLP handling in this v5 does. So I do not
> think tackling it is necessarily a wild goose chase.
>
> One option might be the extra completion-marker LLE you suggested above, while
> another is the conservative LLP handling used by this v5.
>
>
> P.S. That said, all in all, what I find most troublesome is a separate matter:
>
> (1) apparent CS lag from software's point of view, especially when multiple
>     hardware channels are busy under heavy load, and
>
> (2) a doorbell while the channel is still internally running may not only be
>     ignored but also stall the hardware if it lands in a narrow transition
>     window.
>
> Once dynamic append is enabled, avoiding (2) when (1) may hide the actual
> internal state is tricky. Much of the extra complexity added since v2 comes from
> handling this interaction safely.
>
> That is why I would greatly appreciate any response or input from someone at
> Synopsys who knows the actual internal behaviour, including any known errata
> which might be relevant:
> https://lore.kernel.org/r/tkyu5rsxfa7i6rxxw6qxmmwke5qnlxptwx4j2s24fhftsmmf26@gamef2ec4wwm/
>
> I added Gustavo and you to the To: list of that message, asking whether (1)
> and/or (2) are real, known issues.
>
> AFAIK, there is no in-tree test that can both run on different DWC PCIe eDMA
> integrations and also generate the transition-heavy load needed to trigger that
> behaviour, which makes it hard to compare observations with anyone else.
>
> Best regards,
> Koichiro
>
> >
> > >
> > > I think this is related to the fact that HDMA LL mode decouples descriptor
> > > fetching, data processing, completion processing, and interrupt handling. That
> > > explains why the documented LLE-recycling boundary cannot automatically be used
> > > as the dmaengine completion boundary, although it does not by itself tell us
> > > whether idx or prev(idx) is required.
> > >
> > > The idx == 0 handling is also a consequence of the current prev(idx) retreat.
> > > For example, with data entries 0..7 and the physical link element at index 8,
> > > moving raw index 8 back gives boundary 7. Blindly moving raw data index 0 back
> > > would also wrap to 7. If that raw 0 was a no-progress sample, it could then look
> > > like almost one full ring of progress. Therefore raw 0 is rejected while the
> > > physical link index remains distinguishable.
> > >
> > > In other words, without the prev(idx) retreat, the link index could simply be
> > > normalized to 0, as you mentioned. The current prev(idx) handling was
> > > nevertheless intentional, not an oversight. It trades one-entry delayed HDMA
> > > completion for one conservative rule shared with eDMA. Unless there is a
> > > concrete reason to reclaim that extra entry at each HDMA watermark, I would
> > > prefer to keep the common handling.
> >
> > let me read document again.
> >
> > Frank
> >
> > >
> > > Best regards,
> > > Koichiro
> > >
> > > >
> > > > > +}
> > > > > +
> > > > >  static void dw_edma_core_ll_sync(struct dw_edma_chan *chan)
> > > > >  {
> > > > >  	/*
> > > > > @@ -834,31 +977,30 @@ dw_edma_device_prep_interleaved_dma(struct dma_chan *dchan,
> > > > >  	return dw_edma_device_transfer(&xfer, dw_edma_device_get_config(dchan, NULL));
> > > > >  }
> > > > >
> > > > > -/* Must be called with vc.lock held. */
> > > > > -static void dw_edma_done_interrupt_locked(struct dw_edma_chan *chan)
> > > > > +static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
> > > > >  {
> > > > >  	struct dw_edma_desc *desc;
> > > > >  	struct virt_dma_desc *vd;
> > > > > +	unsigned long flags;
> > > > >
> > > > > -	lockdep_assert_held(&chan->vc.lock);
> > > > > -
> > > > > -	if (chan->status == EDMA_ST_PAUSE)
> > > > > +	spin_lock_irqsave(&chan->vc.lock, flags);
> > > > > +	if (chan->status == EDMA_ST_PAUSE) {
> > > > > +		spin_unlock_irqrestore(&chan->vc.lock, flags);
> > > > >  		return;
> > > > > +	}
> > > > >
> > > > >  	switch (chan->request) {
> > > > >  	case EDMA_REQ_NONE:
> > > > >  	case EDMA_REQ_PAUSE:
> > > > >  		vd = vchan_next_desc(&chan->vc);
> > > > > -		if (!vd)
> > > > > -			break;
> > > > > -
> > > > > -		desc = vd2dw_edma_desc(vd);
> > > > > -		if (desc->start_burst >= desc->nburst) {
> > > > > -			dw_hdma_set_callback_result(vd, DMA_TRANS_NOERROR);
> > > > > -			list_del(&vd->node);
> > > > > -			vchan_cookie_complete(vd);
> > > > > -			if (!chan->non_ll)
> > > > > -				chan->ll_done = chan->ll_head;
> > > > > +		if (vd) {
> > > > > +			desc = vd2dw_edma_desc(vd);
> > > > > +			if (desc->start_burst >= desc->nburst) {
> > > > > +				dw_hdma_set_callback_result(vd,
> > > > > +							    DMA_TRANS_NOERROR);
> > > > > +				list_del(&vd->node);
> > > > > +				vchan_cookie_complete(vd);
> > > > > +			}
> > > > >  		}
> > > > >
> > > > >  		if (chan->request == EDMA_REQ_PAUSE) {
> > > > > @@ -871,25 +1013,12 @@ static void dw_edma_done_interrupt_locked(struct dw_edma_chan *chan)
> > > > >  		break;
> > > > >
> > > > >  	case EDMA_REQ_STOP:
> > > > > -		vd = vchan_next_desc(&chan->vc);
> > > > > -		if (!vd)
> > > > > -			break;
> > > > > -
> > > > >  		dw_edma_finish_termination(chan);
> > > > >  		break;
> > > > >
> > > > >  	default:
> > > > >  		break;
> > > > >  	}
> > > > > -	dw_edma_core_ch_maybe_doorbell(chan);
> > > > > -}
> > > > > -
> > > > > -static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
> > > > > -{
> > > > > -	unsigned long flags;
> > > > > -
> > > > > -	spin_lock_irqsave(&chan->vc.lock, flags);
> > > > > -	dw_edma_done_interrupt_locked(chan);
> > > > >  	spin_unlock_irqrestore(&chan->vc.lock, flags);
> > > > >  }
> > > > >
> > > > > @@ -902,7 +1031,37 @@ static void dw_edma_ll_interrupt(struct dw_edma_chan *chan)
> > > > >  	if (!dw_edma_ll_snapshot_take(chan, &snapshot))
> > > > >  		return;
> > > > >
> > > > > -	dw_edma_done_interrupt_locked(chan);
> > > > > +	if (chan->status == EDMA_ST_PAUSE)
> > > > > +		return;
> > > > > +
> > > > > +	dw_edma_ll_consume_progress(chan, snapshot.idx);
> > > > > +
> > > > > +	if (snapshot.event == DW_EDMA_LL_EVENT_PROGRESS &&
> > > > > +	    chan->request != EDMA_REQ_NONE)
> > > > > +		goto out;
> > > > > +
> > > > > +	switch (chan->request) {
> > > > > +	case EDMA_REQ_NONE:
> > > > > +		dw_edma_start_transfer(chan);
> > > > > +		chan->status = dw_edma_ll_pending(chan) ?
> > > > > +			       EDMA_ST_BUSY : EDMA_ST_IDLE;
> > > > > +		break;
> > > > > +
> > > > > +	case EDMA_REQ_PAUSE:
> > > > > +		dw_edma_set_request(chan, EDMA_REQ_NONE);
> > > > > +		chan->status = EDMA_ST_PAUSE;
> > > > > +		break;
> > > > > +
> > > > > +	case EDMA_REQ_STOP:
> > > > > +		dw_edma_finish_termination(chan);
> > > > > +		break;
> > > > > +
> > > > > +	default:
> > > > > +		break;
> > > > > +	}
> > > > > +
> > > > > +out:
> > > > > +	dw_edma_core_ch_maybe_doorbell(chan);
> > > > >  }
> > > > >
> > > > >  static bool dw_edma_abort_interrupt(struct dw_edma_chan *chan)
> > > > > @@ -965,21 +1124,44 @@ static void dw_edma_queue_irq_work(struct dw_edma_chan *chan,
> > > > >  static void dw_edma_record_irq(struct dw_edma_chan *chan, unsigned int events)
> > > > >  {
> > > > >  	struct dw_edma_ll_snapshot snapshot = {
> > > > > -		.event = events & DW_EDMA_IRQ_STOP ?
> > > > > -			 DW_EDMA_LL_EVENT_STOP : DW_EDMA_LL_EVENT_PROGRESS,
> > > > > +		.idx = -1,
> > > > > +		.event = DW_EDMA_LL_EVENT_NONE,
> > > > >  	};
> > > > >  	unsigned int pending = 0;
> > > > >
> > > > >  	lockdep_assert_held(dw_edma_event_lock(chan));
> > > > >
> > > > > +	/*
> > > > > +	 * Classify the LL event before normalizing its LLP sample to the
> > > > > +	 * exclusive consumer boundary. Keep STOP even without a valid
> > > > > +	 * boundary so deferred handling still sees that the run ended.
> > > > > +	 */
> > > > > +	if (!chan->non_ll &&
> > > > > +	    (events & (DW_EDMA_IRQ_DONE | DW_EDMA_IRQ_PROGRESS |
> > > > > +		       DW_EDMA_IRQ_STOP))) {
> > > > > +		if ((events & DW_EDMA_IRQ_STOP) ||
> > > > > +		    ((events & DW_EDMA_IRQ_DONE) &&
> > > > > +		     dw_edma_ll_done_is_stopped(chan)))
> > > > > +			snapshot.event = DW_EDMA_LL_EVENT_STOP;
> > > > > +		else
> > > > > +			snapshot.event = DW_EDMA_LL_EVENT_PROGRESS;
> > > > > +
> > > > > +		snapshot.idx = dw_edma_ll_recycle_idx(chan,
> > > > > +						      dw_edma_core_ll_cur_idx(chan),
> > > > > +						      snapshot.event);
> > > > > +		if (snapshot.idx < 0 &&
> > > > > +		    snapshot.event != DW_EDMA_LL_EVENT_STOP)
> > > > > +			snapshot.event = DW_EDMA_LL_EVENT_NONE;
> > > > > +	}
> > > > > +
> > > > >  	if ((events & DW_EDMA_IRQ_ABORT) && chan->abort_pending)
> > > > >  		pending |= DW_EDMA_DEFERRED_ABORT;
> > > > >
> > > > > -	if (chan->non_ll) {
> > > > > -		if (events & (DW_EDMA_IRQ_DONE | DW_EDMA_IRQ_STOP))
> > > > > -			pending |= DW_EDMA_DEFERRED_DONE;
> > > > > -	} else if (events & (DW_EDMA_IRQ_DONE | DW_EDMA_IRQ_PROGRESS |
> > > > > -			     DW_EDMA_IRQ_STOP)) {
> > > > > +	if (chan->non_ll &&
> > > > > +	    (events & (DW_EDMA_IRQ_DONE | DW_EDMA_IRQ_STOP)))
> > > > > +		pending |= DW_EDMA_DEFERRED_DONE;
> > > > > +
> > > > > +	if (snapshot.event != DW_EDMA_LL_EVENT_NONE) {
> > > > >  		/* STOP is final for this run; do not replace it with progress. */
> > > > >  		if (chan->ll_irq.event != DW_EDMA_LL_EVENT_STOP ||
> > > > >  		    snapshot.event == DW_EDMA_LL_EVENT_STOP)
> > > > > @@ -1227,6 +1409,7 @@ static int dw_edma_channel_setup(struct dw_edma *dw, u32 wr_alloc, u32 rd_alloc)
> > > > >  		chan->irq_mode = dw_edma_get_default_irq_mode(chan);
> > > > >  		INIT_WORK(&chan->irq_work, dw_edma_irq_work);
> > > > >  		atomic_set(&chan->irq_pending, 0);
> > > > > +		chan->ll_irq.idx = -1;
> > > > >  		chan->ll_irq.event = DW_EDMA_LL_EVENT_NONE;
> > > > >  		chan->abort_pending = false;
> > > > >
> > > > > diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
> > > > > index d709aa274300..27cab6ca5e67 100644
> > > > > --- a/drivers/dma/dw-edma/dw-edma-core.h
> > > > > +++ b/drivers/dma/dw-edma/dw-edma-core.h
> > > > > @@ -71,6 +71,7 @@ struct dw_edma_desc {
> > > > >
> > > > >  	u32				alloc_sz;
> > > > >
> > > > > +	u32				ll_start;	/* First outstanding LL entry */
> > > > >  	size_t				done_burst;
> > > > >  	size_t				start_burst;
> > > > >  	size_t				nburst;
> > > > > @@ -78,6 +79,7 @@ struct dw_edma_desc {
> > > > >  };
> > > > >
> > > > >  struct dw_edma_ll_snapshot {
> > > > > +	int				idx;
> > > > >  	enum dw_edma_ll_event		event;
> > > > >  };
> > > > >
> > > > > @@ -113,6 +115,7 @@ struct dw_edma_chan {
> > > > >  	 * LL event recorded by the hard IRQ handler. The event lock
> > > > >  	 * serializes its capture with a new hardware run; vc.lock serializes
> > > > >  	 * its consumption with LL state.
> > > > > +	 * Valid indices use the exclusive boundary convention of ll_done.
> > > > >  	 */
> > > > >  	struct dw_edma_ll_snapshot	ll_irq;
> > > > >  	/* ABORT is terminal and remains pending across LL state changes. */
> > > > > @@ -189,6 +192,7 @@ struct dw_edma_core_ops {
> > > > >  	enum dma_status (*ch_status)(struct dw_edma_chan *chan);
> > > > >  	/* Called with dw_edma_event_lock(chan) held. */
> > > > >  	bool (*ch_abort_int_pending)(struct dw_edma_chan *chan);
> > > > > +	u32 (*ch_transfer_size)(struct dw_edma_chan *chan);
> > > > >  	irqreturn_t (*handle_int)(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
> > > > >  				  dw_edma_handler_t handler);
> > > > >  	void (*non_ll_start)(struct dw_edma_chan *chan, struct dw_edma_burst *child);
> > > > > diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/dw-edma-v0-core.c
> > > > > index 20dff21a0603..b9d6205157b3 100644
> > > > > --- a/drivers/dma/dw-edma/dw-edma-v0-core.c
> > > > > +++ b/drivers/dma/dw-edma/dw-edma-v0-core.c
> > > > > @@ -318,6 +318,11 @@ static enum dma_status dw_edma_v0_core_ch_status(struct dw_edma_chan *chan)
> > > > >  		return DMA_ERROR;
> > > > >  }
> > > > >
> > > > > +static u32 dw_edma_v0_core_ch_transfer_size(struct dw_edma_chan *chan)
> > > > > +{
> > > > > +	return GET_CH_32(chan->dw, chan->dir, chan->id, transfer_size);
> > > > > +}
> > > > > +
> > > > >  static bool dw_edma_v0_core_ch_abort_int_pending(struct dw_edma_chan *chan)
> > > > >  {
> > > > >  	u32 sts = GET_RW_32(chan->dw, chan->dir, int_status);
> > > > > @@ -677,6 +682,7 @@ static const struct dw_edma_core_ops dw_edma_v0_core = {
> > > > >  	.ch_count = dw_edma_v0_core_ch_count,
> > > > >  	.ch_status = dw_edma_v0_core_ch_status,
> > > > >  	.ch_abort_int_pending = dw_edma_v0_core_ch_abort_int_pending,
> > > > > +	.ch_transfer_size = dw_edma_v0_core_ch_transfer_size,
> > > > >  	.handle_int = dw_edma_v0_core_handle_int,
> > > > >  	.ll_data = dw_edma_v0_core_ll_data,
> > > > >  	.ll_link = dw_edma_v0_core_ll_link,
> > > > > --
> > > > > 2.51.0
> > > > >
