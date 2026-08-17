Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011060.outbound.protection.outlook.com [52.101.70.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B30B41B354
	for <dmaengine@vger.kernel.org>; Mon, 17 Aug 2026 16:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786983269; cv=fail; b=I8cHkqM+SSlJmiyGWU0JyVZOUTjDnggAz8xYA8GLnNniU/xAb1ClcJrTAzJ9aDvr6ShhKSAiRykh1FHpuwaR5MCTHlooW9Kc2EnKJQ/Z3lUURCOi0qWrc6PHZVh49k5A0j6q6NxnHuuGPuAKqukhAkDaZRHEK0UXh3RULjb3Y9E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786983269; c=relaxed/simple;
	bh=Tlna0DT0Zp6NmARUKt7Yb9/4QKwHKyFTNiqLDTbIbNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DlN1qfFfYOJv8eemhx7VdNRBxovyP3YrV2pXQa9brDJKuFqIXiEzf0uDQ9jUh7348giiuvu3Cy1UznHNbZ4cNE934AAzwQQyPQ0bSFSINCPQf9ljT/ZmsS1o0lfCAk3RRl67OOokC8ylC8VqNHA/3Y9P2SXxnYh6lE1v5osJcyc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=miQGb4My reason="signature verification failed"; arc=fail smtp.client-ip=52.101.70.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="miQGb4My"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Run2CTFI7j+oe98PtKsth6kvv1PJmhDIEZyu3kXXZ4DrOX/oMNIjClmOYT2RFA9kT2WmMW6ZhlUrP9xPVCyC3dzXuSOOscpshUGaWok1zh+WgxSTan6fAVNP+iap46xRyPCnrNYdvi3ZcDBJlvLWWIXE/JJ3QIFVRiW7OKGZhkcAnZ0N4go5WHUeleRXWzXKIlB5gbZbVtbG0Hz23zMf0Md0e5M2hOpyarbn8AwzSaFhaXbIJb09qyp1bIeQGnh7PObeqp5EZ31h56tZcj5chrADMrUPM3TVNvcn6+dw1JuNw/sKKLKpefyheaVTCvi/Vc2TC3RAH+Sd+xvHsuTEAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aL1B9iurAN1J6mFvkP2744/OKljK8JFitfv0s7p0DZw=;
 b=wh+UYnuWUPpNvO+lD6zuySllLWvqDUIsuUkphdu+5n/EKaigr/Cxk7FAOInfJegfxddzVD+pLp5uJhG1KwUMK60FtwkryOhZdVA5R5h1nzNsVl9471Kb28OZDer9c651rp21Y20CCFKE3EVI4D0wbHcpsJRGAK1dvBa1cESJad+wDxo9+x6zNXEWjmiGqvQxLLrazJ9w4wTWQVIaZgwmzaPqMGgbhGGL0zs7Y8yu97NN4IwB3qJn6BkTbE8WcRF6fQy5kFB2xhHowftgYpio1k++uM/lVGHyii9aPihbgFe6MYS9xnDwJHh9LG2ajMSgpF+B+obfKyTebvEtpis2gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aL1B9iurAN1J6mFvkP2744/OKljK8JFitfv0s7p0DZw=;
 b=miQGb4MyBPiZ/Ra/Br3cOPIwrJ2MGq/Co2q40tppngpAfFnvG3MIoAQetDrutZM8kquct8bXgFHolQaPxBApH4TcoAe9ATRMehcyDrWcv93F6pFFVXtbPB2nFKBY7wr14y9wDyGbJqtx9ydkHJUghs2/k14hrq2fUj/qigrVtSxtTmiBODVTlEp+5ps9sSwKTirIRMLz6asRILApMfmGy1ToUPCKXaxZSB+dpW9qN/T2Ec/KOACW8YlwTDWkoUFhosNOKXm6eNPaIMPGYtZ8lk/GrOH1N75PTw66rV7pW/MPb3WkIs5QZ4bSGFZbm+0TL+bN2EvuBMy96n1LpWmrBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS5PR04MB9853.eurprd04.prod.outlook.com (2603:10a6:20b:672::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 16:14:23 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 16:14:23 +0000
Date: Mon, 17 Aug 2026 11:14:14 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Alex Bereza <alex@bereza.email>, dmaengine@vger.kernel.org,
	vkoul@kernel.org, Frank.Li@kernel.org
Subject: Re: [PATCH] dmaengine: xilinx_dma: Fix hardware buffer descriptor
 chain after cyclic DMA
Message-ID: <aoMzVjpCtZJaEC9B@SMW015318>
References: <20260817-fix-hw-buf-desc-after-cyclic-mode-v1-1-1fe47e701d6c@bereza.email>
 <20260817153652.9FDFB1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260817153652.9FDFB1F000E9@smtp.kernel.org>
X-ClientProxiedBy: SA9PR13CA0140.namprd13.prod.outlook.com
 (2603:10b6:806:27::25) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS5PR04MB9853:EE_
X-MS-Office365-Filtering-Correlation-Id: c2b8ef02-42dd-4d25-44af-08defc7a9a0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|19092799006|376014|6133799003|10067099003|11063799006|5023799004|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	5sP7QZQcw6WAiKS1ZI2ICccQ7NuRGJ1ANHG9TKersRd6O0huyPS22PqyTkFHJ9on3vwp5r8e7iee2GFOL/WMOJnBZSdBKY001NHhunyZ2cXABf/FxHj32mWcxKh/UYyICaI+f3HOwn+Sm+himf+vjs04rzH+I5nkNwXSEMCilSAqZDDE+ePzcymDsV+46ew89sIemsU6GP9KmzGuBUlaYuv4jKN9i82z3Nvn4qbiC4T1FIXeoSrrY4APKD2F3w/PV9YDYiK81YMN+Nm6VuK+6ThzJrlgDPWPDfLXNMRO7DJVKB42cO6SnU18PkhnCvGbHvajUYqyHqmO6/FWG3v8SNrx2JPSBKR0w/15fzQwvZxr6A/jG0Ut9RYDptekEvETQnvMMoL45avjlRxYCPwSYdqsd1jyQiVwSB489BFba227dZColbTOzUXU5agNbloXD664uG5M2M7DN7CMAQlLRPlUEVC4FZHSp9mq23IiVyq03409nfinTFHGxCAub8qC8fHyaa0Od8toEk/poZ6w/rdNzVFJLLoWdtBYwyUGzEf6PZhFFWS2jXhsQmsqgJYIbzs1QTDWLETVylMtxzzCYGmTZ31r284mFFmMh1q4BiQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(19092799006)(376014)(6133799003)(10067099003)(11063799006)(5023799004)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?75W9KMeQO3NDYhdlVa6FG3zBBFSaal/ybACl44FA7YdSg8rhzjCBCICvEt?=
 =?iso-8859-1?Q?bAdUwnukFa5bvHpsx8bxOuIwLE9dAySaveXhkx7q/Zz5rd/OdUuKb84CWI?=
 =?iso-8859-1?Q?dGGXBt3/ot4bYule3CfYzjinio7EdXQgmC07DdffpyVuXNNqbQkYaS5j6s?=
 =?iso-8859-1?Q?AnV5ovj4FtLZZrmNktycWeNh9AvmCoiT8xDw9FsgSm2dVQAH8NNWSrEOhM?=
 =?iso-8859-1?Q?TCbPfE1E89Y4Aeq2W9UIPD2hOlmiu8imAgnHaMRpuj+CEAkZoMr9wDYvVF?=
 =?iso-8859-1?Q?8QHig8is3ilYHhJX0iHmDiJzteG8ZDZYiYEdnZFeLvXooV4H9LVyA7qKcG?=
 =?iso-8859-1?Q?a3g38MjCbDmggNu3F1Px/cTh4m4ksRXIS2Jt5+5Y4R8KgjpxSb80drMQwI?=
 =?iso-8859-1?Q?49xZ3I5pPJJUJ7FitBm8kamCSUw0pjjlQHz8yOD/DA+QDcftWJgoCnVgJO?=
 =?iso-8859-1?Q?6G2dllDwC9bf2AoTIIfzPdjcyNqugx91i402bYe1mr5NF1pTN/FMzV5oeo?=
 =?iso-8859-1?Q?dQrAU3GuaYbCsRiVWIpJrJTekwfYgVGBryLUsQqz5Nj+ZDQQ8RKnOAPx6H?=
 =?iso-8859-1?Q?JqEPDfOo195qMFERC29Bpb+Cy9XxlXCrvQ9N1mCG0KGky03sAxwoQyO8pR?=
 =?iso-8859-1?Q?qDP9CTt9xxgRJON0QDTDdaXIQtUtjh0s1Zprp3tZgbnbKxlZRnR3vmWslU?=
 =?iso-8859-1?Q?sOAMbCrTxvEP6hygpr97VoppOd/+ISxzkCxgj2edXLZyXANq/qmvBECpwu?=
 =?iso-8859-1?Q?qbPo4yS03y5G0AK/xvQ3c2UmdlKFuoKrRUQ+L0cVacGdQKusLgfKi69xVn?=
 =?iso-8859-1?Q?mbGSTIgnIoquyCzQFHkkkOTu9mKpx5QLRzcb4+fhU2btBNZLQBCaHHsfWh?=
 =?iso-8859-1?Q?c029WeTaFYn2qlG92zVs4rNgguQx/lQD6fM/gEBFYAnMm9XWxLdfU/nt0K?=
 =?iso-8859-1?Q?OCUler2mCS694uWSqUqjKpdMiDrmWfB+5PWLjfwyI5opCLvsBTaPmIgr1q?=
 =?iso-8859-1?Q?69faO4bb0haTUF4ck8XGenAZXtkc5KQ7IMjE2stKztvHLcNCoRM38xA8nV?=
 =?iso-8859-1?Q?fbbjvu43pglhGWE63UjRCbFI6sqsZnRh3477ZZoeurZ6E2+yRu7k7ZyfCL?=
 =?iso-8859-1?Q?sHRiJYfn1qi7YJZ0U4voOFDyvR48jm0lhGePAvxk5xGg7xGQcpKCdkn0cX?=
 =?iso-8859-1?Q?Mxu/4VuaO4fIcJl8jaaBuExNzS97svS8IyxCfuJ/BxngYuqEvfinbQL7aT?=
 =?iso-8859-1?Q?il+1LQ8QNvAibCNXUaXBvGsETGam9Qfwol0V+o8z/MwqZn6SaOPd9ffSSG?=
 =?iso-8859-1?Q?s1+6XkwshYmRzZNUYC69GCVhPftPUp6IKB1uj16AovYza5Q3KOD8Zz8+TW?=
 =?iso-8859-1?Q?dqOYWNJX/qz5x/esUJ+ppMkaAxWBqdtkGCKzj4jAT44v68FzjliElBP7xD?=
 =?iso-8859-1?Q?fR+fCKgbHzudLs5/O977tJsZAjEmKfFg7K4puZ1JRruTUdH91l6HuXer1Z?=
 =?iso-8859-1?Q?s+hzys4onoJvnb4hlGSJlGFizEyvM2WZgcJAv5mg/y00khrgFMJ3iOuL1S?=
 =?iso-8859-1?Q?iL2uONEeeb6So/Oze6lzXIrl+Vn/w14LWL6voXHMpJ0nYaATtiQZG3o53e?=
 =?iso-8859-1?Q?dvWLMzgppsRwdPrwr5+l0akTTiLlzxlGRuNop3o4vV5lCgF0ahoW04w9jp?=
 =?iso-8859-1?Q?fb+GA1H/Hh8/fSDLNogKHVM0KAojf2pqDgpYhybJWX5S5IxKelhU1wrrBN?=
 =?iso-8859-1?Q?FJ1SUMnWKL2xHu0dLYy4cpjC2Bwk9DSeeQMbojKFmbiKO1pV/p87D5WNLR?=
 =?iso-8859-1?Q?2Y8mxwEo583+4Oi3WYsMSeEGf36JBh7e+zfxIQyii1E372XljvHZ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2b8ef02-42dd-4d25-44af-08defc7a9a0a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 16:14:23.6437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LSZhyJW3eh1adMuMW/LqQMJrSP8EzMTINno/MthcYZAefyGAZk7J3azpPblr1MnSfXyoogyWuGXO7CbBahrbcB6A4kx4LOnVi39WppR5yT6ZQFlJPCyNYRILTL5sP3D6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9853

On Mon, Aug 17, 2026 at 03:36:52PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
>
> New issues:
> - [Low] Fragile 64-bit division on `dma_addr_t` using `sizeof`.
>
> Pre-existing issues:
> - [Critical] Hardware descriptor ring desynchronization due to relying on `free_seg_list` ordering mapping exactly to physical continuity.
> - [High] Unlocked modification of `chan->free_seg_list` in error paths and submission rejection paths causes list corruption.
> --
>
> --- Patch [1]: [PATCH] dmaengine: xilinx_dma: Fix hardware buffer descriptor chain after cyclic DMA ---
> commit df3c4c6392659223fe0433932cd3afd45fdb012e
> Author: Alex Bereza <alex@bereza.email>
>
> dmaengine: xilinx_dma: Fix hardware buffer descriptor chain after cyclic DMA
>
> Using the DMA in cyclic mode modifies the hardware buffer descriptor chain
> so that the last descriptor points back to the first. This patch ensures
> non-cyclic mode works after cyclic mode by restoring the original buffer
> descriptor ring setup during segment cleanup.
>
> > diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
> > index bef2b031dba19..6d00aa97c8fc9 100644
> > --- a/drivers/dma/xilinx/xilinx_dma.c
> > +++ b/drivers/dma/xilinx/xilinx_dma.c
> > @@ -756,15 +756,25 @@ xilinx_aximcdma_alloc_tx_segment(struct xilinx_dma_chan *chan)
>
> [ ... ]
>
> > -static void xilinx_dma_clean_hw_desc(struct xilinx_axidma_desc_hw *hw)
> > +static void xilinx_dma_clean_hw_desc(struct xilinx_dma_chan *chan,
> > +				     struct xilinx_axidma_tx_segment *segment)
> >  {
> > -	u32 next_desc = hw->next_desc;
> > -	u32 next_desc_msb = hw->next_desc_msb;
> > +	dma_addr_t next;
> > +	u32 i;
> >
> > -	memset(hw, 0, sizeof(struct xilinx_axidma_desc_hw));
> > +	/*
> > +	 * Restore the buffer descriptor's next descriptor pointer to the value
> > +	 * set up in xilinx_dma_alloc_chan_resources(). Otherwise using the DMA
> > +	 * in cyclic mode leaves the next descriptor pointer altered and
> > +	 * prevents subsequent non-cyclic transfers.
> > +	 */
> > +	i = (segment->phys - chan->seg_p) / sizeof(*chan->seg_v);
>
> [Severity: Low]
> Is this calculation relying on compiler optimization to avoid an unresolved
> __udivdi3 build failure on 32-bit platforms?
>
> Because segment->phys and chan->seg_p are dma_addr_t, which can be 64-bit
> on 32-bit platforms with LPAE, this creates a 64-bit division. It currently
> works because sizeof(*chan->seg_v) happens to be exactly 128 bytes due to
> __aligned(64), allowing the compiler to optimize it into a bitwise right
> shift.
>
> If a field is added that pushes the alignment boundary to a non-power-of-2,
> would this break 32-bit builds? Could we use native pointer arithmetic like
> i = segment - chan->seg_v instead?

look good by this way.

Frank

>
> > +	next = chan->seg_p +
> > +	       sizeof(*chan->seg_v) * ((i + 1) % XILINX_DMA_NUM_DESCS);
> >
> > -	hw->next_desc = next_desc;
> > -	hw->next_desc_msb = next_desc_msb;
> > +	memset(&segment->hw, 0, sizeof(segment->hw));
> > +	segment->hw.next_desc = lower_32_bits(next);
> > +	segment->hw.next_desc_msb = upper_32_bits(next);
> >  }
> >
> >  static void xilinx_mcdma_clean_hw_desc(struct xilinx_aximcdma_desc_hw *hw)
>
> [ ... ]
>
> > @@ -786,7 +796,7 @@ static void xilinx_mcdma_clean_hw_desc(struct xilinx_aximcdma_desc_hw *hw)
> >  static void xilinx_dma_free_tx_segment(struct xilinx_dma_chan *chan,
> >  				struct xilinx_axidma_tx_segment *segment)
> >  {
> > -	xilinx_dma_clean_hw_desc(&segment->hw);
> > +	xilinx_dma_clean_hw_desc(chan, segment);
> >
> >  	list_add_tail(&segment->node, &chan->free_seg_list);
>
> [Severity: High]
> This is a pre-existing issue, but could this unlocked modification of
> chan->free_seg_list lead to list corruption?
>
> In error paths like xilinx_dma_prep_slave_sg() on allocation failure, or
> when xilinx_dma_tx_submit() rejects a submission,
> xilinx_dma_free_tx_descriptor() is called locklessly. This invokes
> xilinx_dma_free_tx_segment() which calls list_add_tail() on
> chan->free_seg_list here.
>
> If the interrupt tasklet concurrently calls xilinx_axidma_alloc_tx_segment()
> and modifies the list while holding chan->lock, couldn't this cause
> linked-list corruption and kernel panics?
>
> [Severity: Critical]
> This is a pre-existing issue, but will relying on free_seg_list ordering
> cause hardware descriptor ring desynchronization?
>
> In xilinx_dma_prep_slave_sg(), segments are allocated and queued:
>
> drivers/dma/xilinx/xilinx_dma.c:xilinx_dma_prep_slave_sg() {
>     ...
>     segment = xilinx_axidma_alloc_tx_segment(chan);
>     ...
>     hw = &segment->hw;
>     ...
>     list_add_tail(&segment->node, &desc->segments);
>     ...
> }
>
> This never dynamically updates hw->next_desc to link the transaction's
> segments together. If the free_seg_list becomes out of order (for example,
> due to xilinx_dma_tx_submit() rejecting and freeing segments), the segments
> popped will not be physically contiguous.
>
> Since hw->next_desc isn't updated, won't the hardware blindly follow the
> statically-initialized next_desc pointers into unrelated physical segments,
> potentially corrupting other active transactions?
>
> >  }
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260817-fix-hw-buf-desc-after-cyclic-mode-v1-1-1fe47e701d6c@bereza.email?part=1
