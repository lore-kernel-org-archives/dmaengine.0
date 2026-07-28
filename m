Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020136.outbound.protection.outlook.com [52.101.229.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE1B2E091B;
	Tue, 28 Jul 2026 06:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.136
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785218563; cv=fail; b=YiqZUrLu8OHx0mUWau7ccHj8sN3z3ou+TFkbMPili8whwIXTkr3yI0YeT4p6Xq62sFUi2zQOTp6qwrPfXEKk8EO70ZxWFh4syoNOsCsnl/Zyoh9T9erNcbDt/HcuF5VMD9ak+uNC99Fkfa3HracegQ92O8VIEP69WTR5Om/OSfM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785218563; c=relaxed/simple;
	bh=RlVHpXNPN5T4fd8GjZG5NKmYrueKrg2eQ8cwAWfxrBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pnVbpIy0MOASpjCh5KVQwMUL1yoqMp28bUv/goVyyqD25jN83WJC+1Uwf5MLXK8egoZac4OuZoXaKVOWmPLUBy0Lg8liw6wlvPT/H8yjg4manpnG2UCqVo+ezlr/yg+tMVS8PkqZ7qu2I97wp3h+RVl2VHXJexGEBj4QBlZpqrA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=eBCcyGEh; arc=fail smtp.client-ip=52.101.229.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="eBCcyGEh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KlOyUtAcJD8iSX3lB0pjEIKX2ttKTlvW75ZVg0kH9ykxTuQsFXOmy/VWSCMHJ/Q5nUAn/WFVEXUBZ0XHeEOgz/C4KIpP80BVOP1XoHcqDxMKeoQwNe15ZrIidi7cMxnEgO6QTraHCQa6+BX1a5RAIuLXxhTz6yxRPhHqEdXF583OHwCEezKOpRILsLKCY2WMdTaq/nwmv8O3oO6P0dy60ABUOxE/bPAXl/yTu2KQBrc5nd9mcwbfkkEwcPjLiDJfC6VAJ7qMdiPP87uQXMP5tF1pqAdeanfU3ZBN63M7Mw1BbjSfXTryvDAT6K376/RHSjOFmx0MeB14GBQYX4HfIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=djvJnEk43oi24grnDpNso9vZtVCa9sguQgdC7zEhj88=;
 b=dZDfIbJP4x64ugothah5mREccn2SDEubZUC0KDl27kcFf/3UddRl3Dc7CxvIV0e98XyBikRAFVjrtYfuwkET3mtfzlvtJ3oeBNebDSK+70M7R/KtOZccND6uqAXLXpQE4cmWfky5E2vM5lPCuJ0WrzXluqoIB/+V4IdviMvlXveFeI+ooDHQe1gEUJnNPnwhrz8nQIyvYdUFD4D4u7tb4xlbYaQzpWbRJaLfaXh8s7g1BUuWN6nqdJB/dUvyJhOuwNT5jNMUBqiBVkuFUt2vsJvZ1/qYZz1XexkJBvXLUMp1AyXmdrFb04X58UcypwfbVrhmMR4ISudfXm7uWgPo3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=djvJnEk43oi24grnDpNso9vZtVCa9sguQgdC7zEhj88=;
 b=eBCcyGEh+JibwKGzbv0Gw3aiMHdnNk40arCHWCuP78bwZWkXUJqO1nq9Id6vCmYiGsMB5sv5lnEDdtgHnvkxXKRcZ5Zdce5qrd7cqydhF8qaLOWCCe8SPv18VF6ncq+2bVLDso55dndaDHqhOQk7+PBVEGPtNZq9es+70QzAt2c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TY4P286MB6047.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:26b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 06:02:36 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 06:02:36 +0000
Date: Tue, 28 Jul 2026 15:02:35 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>, 
	Kees Cook <kees@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Christoph Hellwig <hch@lst.de>, Serge Semin <fancer.lancer@gmail.com>, 
	Cai Huoqing <cai.huoqing@linux.dev>, Niklas Cassel <cassel@kernel.org>, 
	Devendra K Verma <devendra.verma@amd.com>, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 08/24] dmaengine: dw-edma: Prepare LL progress event
 handling
Message-ID: <hlq7pbpnv5ilymqawadggdhqeinq6yfpgdpycjnt7llpddhcyw@ehwmetriczu2>
References: <20260727170323.2321369-1-den@valinux.co.jp>
 <20260727170323.2321369-9-den@valinux.co.jp>
 <ame63c8jsjRFJoxQ@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ame63c8jsjRFJoxQ@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: TYCPR01CA0184.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::13) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TY4P286MB6047:EE_
X-MS-Office365-Filtering-Correlation-Id: bbc7a5fa-72ea-4ccc-a020-08deec6dd2da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|23010399003|1800799024|7416014|366016|376014|56012099006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	flfk96dtrqqfWKFZnqZ7qa40ch1s20dciN+KaG4Ql3B8UvxHWEINM0XjKiSPffU24uzONtL1BgpiBp1b5z4cHl/dxGDw8qo6QkaElgFm4ggnqEmWr316eI7LLS31Wi7HTW4QR5UAz/J+oEiFAZP+3lafAOiFozS0AEy1ygnsuf6gUrsN9SA2DQAGE43hjpsBuX2uJPLBsn/bY3N55RTUj5moKe7tNShaI7FmqdNMT8jUpO88IKzulLPfqwyOjX35C/I2XSMDUpQ/dqmIHap4LjtTB4MbyIbsfx7NZwWAem5tjbae4c23XsOBqRlN5GOncqxAkTrmeU8VtgIBYTPBjlPMytHyDSMOCgoPhnKxVv6IY2kvT+b/1pXRZfHKHAuocdpfB420t5VDZSiyRB86MkSYA+x8cu7WdeWBY/bbM9WSVchCgdY6lUPnhvVQrTnCGa2nMKEHfrzxBsnF4JtBV3eLgsfOTteebl2bB7+BUF7Pn8YeHo7iPtjsqDqNJ9hCX7pF3Ors6Sh6oqhh1dpvkq7SWo0ejPk8CxaMmjz4g32eB4LeKHSpjpPLxbmfTl9bwm5RvBCakTSQGX5+fHui9UzPrGhH6msUT7NFUrKONESlpQoBJAw9U8LyRJ66ixXQKO1o+rbM5/cBKjb3imK32MeCoQXfuURvGWfv+fcRI2M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(1800799024)(7416014)(366016)(376014)(56012099006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3ghpgZwu1QgrBz4gA8T+PlLm6x8RFh5xSEIDrOeELwomIxP/JKAP0k9b9MIV?=
 =?us-ascii?Q?J2d7J/i9KAV5aJ6DiFkkGcsCYBI5af6c77w01rao4wwIfNuSzf1Y7ioMjf+h?=
 =?us-ascii?Q?1gjdPQoWfAqvRatyDQq4ye3K9v+zt3t6xxk0m/yGIthqD85AxODVSnmN1Qfi?=
 =?us-ascii?Q?rYWkHk8aomKGoUoiWmTWRCbLuJokWdv6hq+Pp6bWtSwT1zLuujL3EdQAyLMp?=
 =?us-ascii?Q?0L2YnVoG8vxE+7o+DZ6uF33+SWP6x5nkuSTEb8Z7kVYMSKPBiAIM4wRdQsut?=
 =?us-ascii?Q?DHY2c1ye2QkWQf87fKu5Mx7UsTvVAM+X/jdpbGJ+YKGk4tnvmAJ/7NDX9L06?=
 =?us-ascii?Q?GTMsXCyGT8gugb8MejBh4ZE1Yz9ADKLIjzzSTG5bw5gOoIqImVHEIBSU8VUt?=
 =?us-ascii?Q?uDIKJug23KFeikYqhDUgBCYQbWNtnOpWVrAj01P+rL+b++qdKtSyo9qL1oRm?=
 =?us-ascii?Q?6Hn/bmgitwpu+o5HoJecXZ7iLYAK/CK3WvDl3ahUSMVRD+0kYgC096NnFj8V?=
 =?us-ascii?Q?D4woUFffYZBCfbhDWxk4yGbYC1k2t8nWHPOUwvRpln10EC07MC6X5+pSzqPQ?=
 =?us-ascii?Q?jUN9q+CprwVH79jNvnK1izpHu7udwyuHFHGnpsg9Yv1Qrk0SpIFplcZAkfwS?=
 =?us-ascii?Q?DSF64MK3ZeDSR6sLpMxdzVdjgEoNvzz/eAep1MVgs+noKgP/R2lHzqhXAy0P?=
 =?us-ascii?Q?vKmdmJWYwK5NuwWAFTCKr2Y1gtint7Vfo6p1soHmUZGSgvw+XniDVxFGapsd?=
 =?us-ascii?Q?33Rl+8OIYE2tRSgZBgjrD9aKgE90bAPYYHIZgUobA6C14pC3ALsmAkhyvjhD?=
 =?us-ascii?Q?Jxpk20M9YcmUhZduSujWz/z29QZLVHEhea66VYBJFYrW1QwP7Fs3x7UOI73b?=
 =?us-ascii?Q?rR//piTUWJL0t0kpotXIxHl43udczrX4cWinVLlAIM/ZJzdddQdRJB5suE1m?=
 =?us-ascii?Q?P4mMUYMshHs9FqF/IP2i+21FNOEHz3OeLRIFLQTnAFKkTef4/8KsNnylzpFX?=
 =?us-ascii?Q?k128IpYfrTbgjK2Y+C1N3tf/+D44ksyZIpckoS/3FJV3e8gfN0SQ0rycsZF5?=
 =?us-ascii?Q?3LM8af+PH11pxILF3fQnH136Wi1YVN0/tWMRqwDVK4h7WXEJ0PyAJugUqSvR?=
 =?us-ascii?Q?qY29sbiKM/aJpOh7gG+1G3ihB0IvTIcG++xZ0vDbpP1jUdKCFnab/O7liVvo?=
 =?us-ascii?Q?SsaILjikL8XjUt3W42CrvPqm2w3M0NF+B0UOqL2ladKXo8k0rscIwaOfrrPZ?=
 =?us-ascii?Q?pwXhQEO2IGKti1+qxkmro/9oYeselb9s7zIEHUFWR+ZbpDJm73Ht6E0L8bnI?=
 =?us-ascii?Q?EFQZA4+CfsU61RzYqkHWJZUeGlq2wWjDe2EP+5FNqXs8Sgs0EAzBQffV+miH?=
 =?us-ascii?Q?QO2ZJ/e6+eLGKt2xLnay2853gZCa576QBYrCs17jahP/HUNTI7wYi5ClJdu4?=
 =?us-ascii?Q?MsQtp9TY56JOhrpipZGa3pLvg/SMI8rYVUzQx4cs/DjU/I9G8H3RoaJfzcFQ?=
 =?us-ascii?Q?M3Rk9/dRMoSO0/yyPtT0uAZ6eVd6vLTvwFtWy+DDOaPDJaIZEX8INkMm3JTN?=
 =?us-ascii?Q?2TLQk3r2FdNHdqW1+IXdleU7Mfnx9pvFK8+SHWDWFYpIUDGVW56p74tdmuIf?=
 =?us-ascii?Q?QbqlO2jWlFqbKONhd3IIowmBJpvVbtWEtcPJFFfC0wa77KamgzsLfTvwxs/7?=
 =?us-ascii?Q?HuRq8sQuHMS/XS+kR4t3/aaYm9s4RMaa0vJ3vpFvaWFmWeDlTpr+nkvFNiUC?=
 =?us-ascii?Q?FEfOPhioN4szy4d0T+ugij26mbmtTffIpuUV4rPbnNW687MgQQfR?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: bbc7a5fa-72ea-4ccc-a020-08deec6dd2da
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 06:02:36.7614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JmKerGvzhG3ax5slv19VKl4jeJY8Qk7cp1TaPmNpfFGIpfxXtAuL8GeJok/SLQWIjPfLLcZMwEp+5IR2F2BfQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4P286MB6047

On Mon, Jul 27, 2026 at 04:09:01PM -0400, Frank Li wrote:
> On Tue, Jul 28, 2026 at 02:03:07AM +0900, Koichiro Den wrote:
> > LL event pairing needs to know whether event registers are shared per
> > channel or per direction. It also needs a provider operation to clear
> > stale LL interrupt status before a channel restart. Add both.
> >
> > Centralize runtime request updates in dw_edma_set_request(). A later
> > patch uses it to cancel a pending LL recheck when STOP or PAUSE changes
> > the channel policy. Rename the existing workqueue event bits to
> > distinguish them from provider IRQ events.
> >
> > No functional change.
> >
> > Signed-off-by: Koichiro Den <den@valinux.co.jp>
> > ---
> ...
> >
> > +enum dw_edma_event_scope {
> > +	DW_EDMA_EVENT_PER_CHAN,
> > +	DW_EDMA_EVENT_PER_DIR,
> > +};
> > +
> 
> not why core need know this information?

It doesn't need to. It is just an artifact of my v3 implementation.

With your suggestion to make chan->event_lock a pointer, I believe the core no
longer needs to know whether its scope is per channel or per direction, ie. both
the enum and the core_ops member can be dropped.

Thanks for the review,
Koichiro

> 
> Frank
> >  struct dw_edma_chan;
> >  struct dw_edma_chunk;
> >
> > @@ -155,6 +160,7 @@ struct dw_edma_core_ops {
> >  	int (*ch_quiesce)(struct dw_edma_chan *chan);
> >  	u16 (*ch_count)(struct dw_edma *dw, enum dw_edma_dir dir);
> >  	enum dma_status (*ch_status)(struct dw_edma_chan *chan);
> > +	enum dw_edma_event_scope event_scope;
> >  	irqreturn_t (*handle_int)(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
> >  				  dw_edma_handler_t done, dw_edma_handler_t abort);
> >  	void (*non_ll_start)(struct dw_edma_chan *chan, struct dw_edma_burst *child);
> > @@ -163,6 +169,7 @@ struct dw_edma_core_ops {
> >  	void (*ll_link)(struct dw_edma_chan *chan, u32 idx, bool cb, u64 addr);
> >  	void (*ll_clear)(struct dw_edma_chan *chan, u32 idx);
> >  	int (*ll_cur_idx)(struct dw_edma_chan *chan);
> > +	void (*ll_irq_clear)(struct dw_edma_chan *chan);
> >  	void (*ch_doorbell)(struct dw_edma_chan *chan);
> >  	void (*ch_enable)(struct dw_edma_chan *chan);
> >  	void (*ch_config)(struct dw_edma_chan *chan);
> > @@ -284,6 +291,11 @@ static inline void dw_edma_core_ll_clear(struct dw_edma_chan *chan, u32 idx)
> >  	chan->dw->core->ll_clear(chan, idx);
> >  }
> >
> > +static inline void dw_edma_core_ll_irq_clear(struct dw_edma_chan *chan)
> > +{
> > +	chan->dw->core->ll_irq_clear(chan);
> > +}
> > +
> >  static inline void dw_edma_core_ch_doorbell(struct dw_edma_chan *chan)
> >  {
> >  	chan->dw->core->ch_doorbell(chan);
> > diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/dw-edma-v0-core.c
> > index c31fff095b4f..d497d36f5b28 100644
> > --- a/drivers/dma/dw-edma/dw-edma-v0-core.c
> > +++ b/drivers/dma/dw-edma/dw-edma-v0-core.c
> > @@ -680,11 +680,13 @@ static const struct dw_edma_core_ops dw_edma_v0_core = {
> >  	.ch_quiesce = dw_edma_v0_core_ch_quiesce,
> >  	.ch_count = dw_edma_v0_core_ch_count,
> >  	.ch_status = dw_edma_v0_core_ch_status,
> > +	.event_scope = DW_EDMA_EVENT_PER_DIR,
> >  	.handle_int = dw_edma_v0_core_handle_int,
> >  	.ll_data = dw_edma_v0_core_ll_data,
> >  	.ll_link = dw_edma_v0_core_ll_link,
> >  	.ll_clear = dw_edma_v0_core_ll_clear,
> >  	.ll_cur_idx = dw_edma_v0_core_ll_cur_idx,
> > +	.ll_irq_clear = dw_edma_v0_core_clear_done_int,
> >  	.ch_doorbell = dw_edma_v0_core_ch_doorbell,
> >  	.ch_enable = dw_edma_v0_core_ch_enable,
> >  	.ch_config = dw_edma_v0_core_ch_config,
> > diff --git a/drivers/dma/dw-edma/dw-hdma-v0-core.c b/drivers/dma/dw-edma/dw-hdma-v0-core.c
> > index b2d35f0b7b6d..b181603bf2c7 100644
> > --- a/drivers/dma/dw-edma/dw-hdma-v0-core.c
> > +++ b/drivers/dma/dw-edma/dw-hdma-v0-core.c
> > @@ -435,12 +435,14 @@ static const struct dw_edma_core_ops dw_hdma_v0_core = {
> >  	.ch_quiesce = dw_hdma_v0_core_ch_quiesce,
> >  	.ch_count = dw_hdma_v0_core_ch_count,
> >  	.ch_status = dw_hdma_v0_core_ch_status,
> > +	.event_scope = DW_EDMA_EVENT_PER_CHAN,
> >  	.handle_int = dw_hdma_v0_core_handle_int,
> >  	.non_ll_start = dw_hdma_v0_core_non_ll_start,
> >  	.ll_data = dw_hdma_v0_core_ll_data,
> >  	.ll_link = dw_hdma_v0_core_ll_link,
> >  	.ll_clear = dw_hdma_v0_core_ll_clear,
> >  	.ll_cur_idx = dw_hdma_v0_core_ll_cur_idx,
> > +	.ll_irq_clear = dw_hdma_v0_core_clear_done_int,
> >  	.ch_doorbell = dw_hdma_v0_core_ch_doorbell,
> >  	.ch_enable = dw_hdma_v0_core_ch_enable,
> >  	.ch_config = dw_hdma_v0_core_ch_config,
> > --
> > 2.51.0
> >
