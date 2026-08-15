Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11021084.outbound.protection.outlook.com [52.101.125.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0843941BA61;
	Sat, 15 Aug 2026 14:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786804624; cv=fail; b=Lj302W4JSkVsM1rkIaDHZhB9Ljd+gcFa//jhJ59nsUe1g9JhfTqUSAm9juzEHWfkMeWUc8OkKouDQBHTTxpezzVxGiRp4WmMN9GSWffazNuElWJmbuSocZMkImNPW4CC9hJQRnWY5u3oEMRWKh9V9F7DMsAaqd9cFTPTBcw2/CM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786804624; c=relaxed/simple;
	bh=/cV6wp6oGrlc+BSgHKT90MmqQdNC6DTeRNsD9UvQPi8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iWDHvb/xLmxdbX4LJEZE6AkjLW0HtouCVQxY7I+G7xZJ8iirw2KHIlqCZEmeZPmUxwU8a08zV6HE4vFqcBmix+vkJ6nCHruMFDz0vvIuPUhFJA92YFc4jAEsnCFJkFA25Nr44x7nSOk6lHgd+/KYGyMz4XeU1JDwPq5k7ONq16M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=UAtS+4wg; arc=fail smtp.client-ip=52.101.125.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="UAtS+4wg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Clp67Gd9FLT1rAQ98Ni7yd4lTagl/XYQHiBO7woAm0iSNNBEw2QT0NT7biqE6ntKn5oksbEU0y5/HqrrF6i1YAWJluee3Lwr0psNfz42HGjngdXNJR+J+bcfrF1ppXn9BNP8Q+tGknxcy1taaVDrS6xrSjwpYzfPl+Ej5xIUZOOQBbq0Cn8geRB88Ia6RbE82GngbLPcJnDrW0wCYqpV6VXJihUSozvx7ucX/a+5j95wsaR1Ew9ze1zjGnVw0h7jVmbXCOTDAxCEIcFpeymF/BA7qsLS0epmxkuXINvdDPBv8ZDcn+H9OKo/EQHckfYbw6Soj1hPMybe58pFgc2dqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H4m/UQzBTBo1co1Fo5QsGqR+7oKg2xRF/f4VClGF0wk=;
 b=cUnC4jaO2EJGp1P1RHpKJoR8iCjIuTPAhf/HsaUc5MXwnGqsnhkC6gvErEMYaHu04To0gM6WtAAbIxoEOnPsM26+tjNixzLmkOHyGCsXJcqfGso7TKL4ern/hzhYe5UBBB7GzlUHn48F218oLRSPHMqHl6ndWNE2l+ZZKz/jzue0EtCCmTzlRQgbabpL9WKqj6UmI9yqRyLY+sx2BZ9rXAuDRHR5si11JL4ozaYt08Ag+Si5jK8ASu0EYavnJ+qY9UWnrlLsin6GWpBRgmg7QxF/YcN5KQwocgmsczewP2tMzT8rHGguJ3QNoQrh69zRx5RBPOW+NpAVWPfmwRgkCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H4m/UQzBTBo1co1Fo5QsGqR+7oKg2xRF/f4VClGF0wk=;
 b=UAtS+4wgp4O3k4BuXo7mA9PXs+SzvdWEE3SbStTtaXBwcVmEa6l5DU4x+ZP3KwK9VbwHU8EXnAqN0nou+V8MxwJxEgqlpdikpO4Qy3xuGihtihDlUrJrwF/Q9958VYlHQTTFlbNIBftP+2MCdT5IvA0vRkh64hsrQ6+sEJq7IHs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OS3P286MB1639.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:160::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Sat, 15 Aug
 2026 14:36:56 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0315.016; Sat, 15 Aug 2026
 14:36:56 +0000
Date: Sat, 15 Aug 2026 23:36:54 +0900
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
Message-ID: <m5sw477gk4idakurqq2ngz5a5ehqdfwd274bqroitzzmefftyq@appeqhwo5lkv>
References: <20260812155721.2807506-1-den@valinux.co.jp>
 <20260812155721.2807506-14-den@valinux.co.jp>
 <anzdd9kAxBHvuzpo@lizhi-Precision-Tower-5810>
 <hi4ani63qjhwihylkpbensfb27u6kaqtl53mjnqpzcfbabdhgt@p6k4x5vabtph>
 <an84kpKLfr8ACBEQ@SMW015318>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <an84kpKLfr8ACBEQ@SMW015318>
X-ClientProxiedBy: TYCP286CA0234.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::6) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OS3P286MB1639:EE_
X-MS-Office365-Filtering-Correlation-Id: ab20fecd-d0d6-415b-6556-08defadaa7fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|7416014|10070799003|1800799024|56012099006|6133799003|4143699003|5023799004|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	cx9hddhQsxgkKOiqHdZZ0Ffq55DprKJ+CgMQCsZpUGy9PvUEdttp39s+FLIaOGa+gB8Bb6g0NVVXNxkphO4ZZ1L5Doso9Ln06mwlISkZhWw2jcLAWCI8WMdygla+GJDBA2qqGWdNvfNlol80VmTXH/JHk8O6yEuTvhiCn+ue9fOfo5n3SyEJHdpvtGVht+2xmwy+zy6pun5W4VOYwg84mrCbn1y6X3zuuw/JvKozD2sIx8vlsrakfqFGYyHTTFu3EkNgipYNTyXfE7uhrUNLwbDMKFsklSdx8CjQdphBEC2oE6wbzU8+tVSeOR0WouAYwyqrlyRQIvhkp5UgTOKVKIWqyxcSzzmDe1aPmowy5jQzlz/Bv9Q/ZtX5GoG8Pm9nqBQ0o0CIZ6CJZ2dgmalc9HHbiMxqvoDSUoWfOFUhUh2TWjbeXn0KREtotjOpGcGplQKqGWCr+ItJawAY3WPBQwYqgVTHROrq5qZGE1qzTh13Qfeuew2JXiG4fdmLpEDAW6dLtQ/YhkF1HDmBWtOFk2KIF/A7HXyTn2lHtxjcycDq54ZQXkkI1eUGfXJaup40VHLNEG+/Chc73adBIHTz/gR1VcjWl26Xv9696xRqpvNpVACI12rNnlNiJbQSEAxmBa/r2wM2HZCEoYSPhFBSMsZkYzahOZInAsYer7lDUWQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(7416014)(10070799003)(1800799024)(56012099006)(6133799003)(4143699003)(5023799004)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0NSsYT/uUHqEnXOrZnrbxfG7EjCnkFDBXGHmYBL64MiOzfcphqVFAGfVH4cz?=
 =?us-ascii?Q?3Lfzcp6Ga3/OxoX7DXTC7CA9n+4Sig36Y9mUY9Mg3Z/F1n1ik+m6G2u1Rbx7?=
 =?us-ascii?Q?oLz36w0GENR7RQoykmZXzOD0wP8qnvzlM3WRuakKwaK0EzTX/L8GaZbGOl9V?=
 =?us-ascii?Q?m6XxqaBA3ogWEnWmq4/qOx/vAM3eeswfxTrGIZGeJ9xbqi3NBFY/ABzPYT2C?=
 =?us-ascii?Q?w+Xg2Nzm80N+Ns2nOJIk5DuvYLAA3as5OHuoA89h4jegv5jTJxoWvvCGABPJ?=
 =?us-ascii?Q?TDtKQw5j69ri1RDo7e/r/Jol4RenJbap8gonuLuixMyPfRegW9/gZJdsBNfc?=
 =?us-ascii?Q?8kCMQwKPwapffZZhFwfHEzuBUNeoQUNsNiBqqDGg7it0wXVQqyYD8Z0zsscg?=
 =?us-ascii?Q?SIngZxmOIIaOGcAJM9whl9PvHCW+q1ZcAzFCtCmxwyAoCAAZUfGtr2HdkYDY?=
 =?us-ascii?Q?xhbDBNlY29GWvhHm75LmNLX+qlTwi0TNeMCPq9DAcjF8u7y9yuRcQRChdx+z?=
 =?us-ascii?Q?yeOSpqBsf8hiWhjzTzNFh/nyFpz0GX9wewNuxiQQJ7p8EDjFAdiwNrOOHwDa?=
 =?us-ascii?Q?squ1i1KlU5SIlopGhxSqNdA1yjk5wJXNIT0jqqQ4sEDVjr6LQPonsy6WAw+0?=
 =?us-ascii?Q?noGVEg/+YkmV5aq9f7ItVTnjM4kSozndD5HjmkqAlK835xyC7iSHI2CMhRlQ?=
 =?us-ascii?Q?CELYq2xWEekgSkup0yhRzoLrR2C4TTB4sMmD+NcqDJ9NUhQVVhZtUHp+srFL?=
 =?us-ascii?Q?phHkXgZ4DDCe5KSDjUeQG/tRuR7TZKwJpkd/oUwD04SHt1u9BLu38yf0wLTt?=
 =?us-ascii?Q?ugm1WRqq1VHl1OJcd9DOJX3XXzqdYq20nQUWnBYtnb50yK0Y/UY+ZHxRkSE9?=
 =?us-ascii?Q?VNBrZM4wkj7DsPJxpGSuX13J3pG8lySXwfWHF8d8hZnLHRgm101Xyh/gm+Go?=
 =?us-ascii?Q?HXGlO6MHCQKq7pMvfHZHNNS5BVgaM5V/EGuduAdqnrPZZLqBxAkxz8p7yyPh?=
 =?us-ascii?Q?+uxgTXXJ7TlN98NRQuj9vcwHXtVkoyGK5ihSAi4CwWSITyLT85JdaJSYqll9?=
 =?us-ascii?Q?9vfU09WNqGi8ZboC0RhHd4ugjYdzg/MSYnRrf2L6J0OWbuVx+eHZnsS3TV+i?=
 =?us-ascii?Q?akpeNuUOEBLtkZeCwqaBx5y8HXe9+ivAOsUh8plk4UUvuh4oez23XEIBExti?=
 =?us-ascii?Q?q0zvRRnSyoJEv4ZMw47NGFZSno6ah7yjQKGPQb+dVjPKjuLfoh9HqWHk+Wrr?=
 =?us-ascii?Q?NVPoSNexjYirrIZyiDE0Z/fp+3cmvZEJgc6Jn3akoouJQIkGFa/1zj+GT6yb?=
 =?us-ascii?Q?GrWQTTvzq8TUVgJ+LNJy90j0/xRfuNoBdbLsdxoro8jwbr4zVlGEqI84GX02?=
 =?us-ascii?Q?9WTzk+Z2bBqEdE2fuzrQ5n8hRm3byVX5Ntt/nGP4W5xBgEgaqOl3ZwaGh4Pi?=
 =?us-ascii?Q?v6yjNo4NljeI7g9WPALBhbRmiftcF75CF2h/BvJ9NSmmt6fyg476ZfIASSdr?=
 =?us-ascii?Q?wigeXafbA6HEGpxoN4zjv4VvIzSv5m1JB0kDXoYgJZWzNKRPzeOOlk+yY+7k?=
 =?us-ascii?Q?5kioONLugDUUD7Dirc5ChKlXkE2JNX7pIlRFzJFvhQd1xgYv7pakEfF9b9Rn?=
 =?us-ascii?Q?KGZWLX+gmX6a3EUSo1shkGC9fmMI2ei6bCXDRR5AFDZWFC6L1te8PO7vKfhy?=
 =?us-ascii?Q?6jjCUqPFMdAayywQ0URtd31nvhEcSSLzD/Ui7NIXzyPvf2Ws/lNhfKtBwrQ2?=
 =?us-ascii?Q?c4C1JeZ8iXafDJVSRMmINiRI3bKfPyCtLc9nNZQ6uTt3jP0RbdC0?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: ab20fecd-d0d6-415b-6556-08defadaa7fd
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2026 14:36:56.2734
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UYEGHe87w7S4ZR147NbdD4/hifLPNssMdqP6Y4Um83XBTNCjGgkGF6x76e7ZWi20gsfrary8ydPZEEvyay3CYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3P286MB1639

On Fri, Aug 14, 2026 at 10:47:30AM -0500, Frank Li wrote:
> On Fri, Aug 14, 2026 at 05:48:16PM +0900, Koichiro Den wrote:
> > On Wed, Aug 12, 2026 at 04:54:15PM -0400, Frank Li wrote:
> > > On Thu, Aug 13, 2026 at 12:57:10AM +0900, Koichiro Den wrote:
> > > > Dynamic append can place entries from several descriptors in one LL
> > > > ring. Track the consumed boundary in ll_done, reuse entries behind it,
> > > > and complete descriptors in issue order as done_burst advances.
> > > >
> > > > Normalize each IRQ-paired LLP sample to the exclusive boundary used by
> > > > ll_done. A stopped sample points to the next entry. Keep a running
> > > > sample one entry behind the raw LLP so an entry is not recycled before
> > > > payload completion is established. For the eDMA-compatible interrupt
> > > > interface, treat DONE as a stopped boundary only when channel status is
> > > > complete and transfer size is zero.
> > > >
> > > > Record the first outstanding physical LL entry in each descriptor and
> > > > verify that it matches ll_done before consuming that descriptor. On a
> > > > mismatch, warn and resynchronize only if the sampled boundary has
> > > > reached the descriptor; otherwise stop without completing it.
> > > >
> > > > Reclaiming entries as they are consumed also lets a descriptor larger
> > > > than the ring advance. Keep one data entry free so a physical index
> > > > remains unambiguous in the active producer window. Clear any published
> > > > ring state on termination or abort before starting another transfer.
> > > >
> > > > LL progress now has its own completion path, so fold the temporary
> > > > lock-held DONE helper back into its only caller.
> > > >
> > > > Suggested-by: Frank Li <Frank.Li@nxp.com>
> > > > Signed-off-by: Koichiro Den <den@valinux.co.jp>
> > > > ---
> > > > Changes in v5:
> > > >   - Adjust context after moving the issue_pending() snapshot discard to
> > > >     patch 11. dw_edma_ll_snapshot_discard() is no longer re-added here.
> > > >   - Fold dw_edma_ll_clean_pending() into
> > > >     dw_edma_ll_consume_progress(), removing the one-line wrapper
> > > >     (pure refactoring).
> > > >
> > > >  drivers/dma/dw-edma/dw-edma-core.c    | 273 +++++++++++++++++++++-----
> > > >  drivers/dma/dw-edma/dw-edma-core.h    |   4 +
> > > >  drivers/dma/dw-edma/dw-edma-v0-core.c |   6 +
> > > >  3 files changed, 238 insertions(+), 45 deletions(-)
> > > >
> > > > diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> > > > index 1deaf2d0da91..363993c64c44 100644
> > > > --- a/drivers/dma/dw-edma/dw-edma-core.c
> > > > +++ b/drivers/dma/dw-edma/dw-edma-core.c
---[snip]---
> > > > +
> > > > +	/*
> > > > +	 * Moving a running index one entry back cannot represent index 0
> > > > +	 * without wrapping it to ll_max - 1. That could falsely consume a full
> > > > +	 * producer window, so wait for another sample or STOP.
> > > > +	 */
> > > > +	if (!idx)
> > > > +		return -EINVAL;
> > > > +
> > > > +	/*
> > > > +	 * A running eDMA LLP can move ahead of payload completion, so keep the
> > > > +	 * boundary one entry behind it.
> > > > +	 *
> > > > +	 * DWC PCIe Controller Databook 6.10a-lca06, Section 7.2.1, Table 7-3
> > > > +	 * describes an HDMA watermark LLP as an inclusive LLE recycling
> > > > +	 * boundary, which would normally translate to idx + 1. During testing
> > > > +	 * on a DWC HDMA 6.30a integration, using that boundary for DMAengine
> > > > +	 * completion let clients release DMA mappings while hardware still
> > > > +	 * accessed them, causing IOMMU faults. Keep the boundary one entry
> > > > +	 * behind the raw LLP for HDMA as well. Stopped samples continue to use
> > > > +	 * the next-entry boundary above.
> > > > +	 */
> > > > +	return idx == chan->ll_max ? chan->ll_max - 1 : idx - 1;
> > >
> > > LLP should point current DMA working LL, always stop at which controller bit
> > > have not set yet.
> > >
> > > If your logic always treat idx as unfinished, you needn't idx - 1 here.
> > >
> > > [ll_done, idx)
> >
> > I agree that [ll_done, idx) could be used when idx identifies the first
> > unfinished LLE. That is already how a confirmed STOP sample is handled. For an
> > HDMA watermark, the databook gives raw idx a different meaning, but it can still
> > be used as a conservative exclusive boundary. The idx - 1 retreat is used only
> > for a running progress sample.
> >
> >     state/event              meaning of raw LLP                  current v5
> >                                                                  boundary
> >     -----------------------  ---------------------------------  ------------
> >     eDMA, confirmed STOPPED  Points to the next entry to be      idx
> >                              processed.
> >
> >     HDMA, STOPPED            Points to the next entry to be      idx
> >                              processed.
> >
> >     HDMA, running at         Points inclusively to the last      prev(idx) (*)
> >     WATERMARK                LLE that may be recycled,
> >                              according to the databook.
> >
> >     eDMA, running at DONE    Was observed to advance with        prev(idx)
> >                              descriptor fetch before payload
> >                              completion.
> >
> >     (*) The documented HDMA LLE-recycling boundary would normally be
> >         next(idx). v1 used idx as the exclusive dmaengine completion
> >         boundary. The current code deliberately uses the same conservative
> >         prev(idx) rule for all running progress samples.
> 
> Thank you for good summary. The key problem is that it is hard to know
> DMA running or STOP. Espcially use polling mode.
> 
> 	assume a bus loop
> 
> 	while(1) {
> 		if (condition) { 	1
> 			do_action()     2
> 		}
> 	}
> 
> 1, Generally read some register status or software state.
> 2. Read idx
> 
> between 1 and 2, if 1 test is running, after test and before do action,
> dma may be already stopped.
> 
> DMA engine is totally async with cpu.

Yes, sure. The table in my previous reply summarized the state/event-dependent
HDMA_LLP semantics as described in the databook. It was not assuming that
RUNNING/STOPPED remains stable between two MMIO reads.

I am aware of the race you described, and the implementation handles it
conservatively, including this v5. If hardware updates LLP and reaches STOP just
after the interrupt-status read, the sample may be treated as running progress.
The newly asserted STOP status remains for the later STOP pass, while the
stopped-tail recheck provides another fallback.

> 
> >
> > For a running eDMA sample, I observed that DMA_LLP can advance with descriptor
> > fetch before the corresponding payload transfer has completed. Therefore raw idx
> > does not by itself prove that the payload for the entry immediately before idx
> > has finished. Using [ll_done, idx) could complete that entry and release its DMA
> > mapping too early.
> 
> 
> This is bad hardware design. Pre Fetch should not show in register leave.
> 
> Maybe a workaround, dma driver create pre allocated memory.
> 
> When prep sg, append an extra LL, which write/read to this pre allocate
> memory, we can check this pre allocated memory to know current dma working
> status.
> 
> This is embeded DMA, one side have to be remote side memory, which make work
> around complex.

Thanks for the suggestion. The extra LL idea might be one possible direction to
avoid relying on LLP. Even though the databook describes LLP in detail, if a
copmletion-marker LLE makes the software decision simpler, I think it is worth
considering.

Plus, my guess is that one extra LLE would not affect the throughput ceiling
much. As you said, the question is whether the remote side can be handled
without making the generic implementation more complicated.

> 
> >
> > For HDMA, the databook describes the watermark LLP as an inclusive LLE recycling
> > boundary, which would normally translate to next(idx). I first implemented it
> > that way. On a DWC HDMA 6.30a integration (SpacemiT K3), however, this let the
> > client unmap memory while hardware was still accessing it, causing IOMMU faults.
> > Moving the completion boundary back to prev(idx) stopped the faults.
> >
> > For completeness, v1 used raw idx as the exclusive HDMA completion boundary,
> > [ll_done, idx), and completed the HDMA fio test set reliably. So raw idx itself
> > is not known to be unsafe.
> >
> > After next(idx) caused the IOMMU faults, however, I deliberately aligned HDMA
> > with the conservative eDMA handling (pls. see the comment block in
> > dw_edma_ll_recycle_idx()). All running progress samples use the same prev(idx)
> > conversion, while confirmed STOP samples use the exact next-entry boundary. This
> > keeps the common normalization simple and avoids engine-specific handling. For
> > HDMA, the trade-off is that completion stays one additional entry behind raw idx
> > until later progress or STOP catches it up.
> 
> So DMA engine move idx advance even though current LL still working.
> It is quite common at some modem dmaengine to improve dma preforamce, but
> it should be hidden in hardware internal, like CPU's PC pointer.

Please note again that this is only my observation on one integration, not a
claim about the architected behaviour. Input from someone at Synopsys would help
confirm it. Even if this is the actual behaviour, I think it can be handled
conservatively in software, as the LLP handling in this v5 does. So I do not
think tackling it is necessarily a wild goose chase.

One option might be the extra completion-marker LLE you suggested above, while
another is the conservative LLP handling used by this v5.


P.S. That said, all in all, what I find most troublesome is a separate matter:

(1) apparent CS lag from software's point of view, especially when multiple
    hardware channels are busy under heavy load, and

(2) a doorbell while the channel is still internally running may not only be
    ignored but also stall the hardware if it lands in a narrow transition
    window.

Once dynamic append is enabled, avoiding (2) when (1) may hide the actual
internal state is tricky. Much of the extra complexity added since v2 comes from
handling this interaction safely.

That is why I would greatly appreciate any response or input from someone at
Synopsys who knows the actual internal behaviour, including any known errata
which might be relevant:
https://lore.kernel.org/r/tkyu5rsxfa7i6rxxw6qxmmwke5qnlxptwx4j2s24fhftsmmf26@gamef2ec4wwm/

I added Gustavo and you to the To: list of that message, asking whether (1)
and/or (2) are real, known issues.

AFAIK, there is no in-tree test that can both run on different DWC PCIe eDMA
integrations and also generate the transition-heavy load needed to trigger that
behaviour, which makes it hard to compare observations with anyone else.

Best regards,
Koichiro

> 
> >
> > I think this is related to the fact that HDMA LL mode decouples descriptor
> > fetching, data processing, completion processing, and interrupt handling. That
> > explains why the documented LLE-recycling boundary cannot automatically be used
> > as the dmaengine completion boundary, although it does not by itself tell us
> > whether idx or prev(idx) is required.
> >
> > The idx == 0 handling is also a consequence of the current prev(idx) retreat.
> > For example, with data entries 0..7 and the physical link element at index 8,
> > moving raw index 8 back gives boundary 7. Blindly moving raw data index 0 back
> > would also wrap to 7. If that raw 0 was a no-progress sample, it could then look
> > like almost one full ring of progress. Therefore raw 0 is rejected while the
> > physical link index remains distinguishable.
> >
> > In other words, without the prev(idx) retreat, the link index could simply be
> > normalized to 0, as you mentioned. The current prev(idx) handling was
> > nevertheless intentional, not an oversight. It trades one-entry delayed HDMA
> > completion for one conservative rule shared with eDMA. Unless there is a
> > concrete reason to reclaim that extra entry at each HDMA watermark, I would
> > prefer to keep the common handling.
> 
> let me read document again.
> 
> Frank
> 
> >
> > Best regards,
> > Koichiro
> >
> > >
> > > > +}
> > > > +
> > > >  static void dw_edma_core_ll_sync(struct dw_edma_chan *chan)
> > > >  {
> > > >  	/*
> > > > @@ -834,31 +977,30 @@ dw_edma_device_prep_interleaved_dma(struct dma_chan *dchan,
> > > >  	return dw_edma_device_transfer(&xfer, dw_edma_device_get_config(dchan, NULL));
> > > >  }
> > > >
> > > > -/* Must be called with vc.lock held. */
> > > > -static void dw_edma_done_interrupt_locked(struct dw_edma_chan *chan)
> > > > +static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
> > > >  {
> > > >  	struct dw_edma_desc *desc;
> > > >  	struct virt_dma_desc *vd;
> > > > +	unsigned long flags;
> > > >
> > > > -	lockdep_assert_held(&chan->vc.lock);
> > > > -
> > > > -	if (chan->status == EDMA_ST_PAUSE)
> > > > +	spin_lock_irqsave(&chan->vc.lock, flags);
> > > > +	if (chan->status == EDMA_ST_PAUSE) {
> > > > +		spin_unlock_irqrestore(&chan->vc.lock, flags);
> > > >  		return;
> > > > +	}
> > > >
> > > >  	switch (chan->request) {
> > > >  	case EDMA_REQ_NONE:
> > > >  	case EDMA_REQ_PAUSE:
> > > >  		vd = vchan_next_desc(&chan->vc);
> > > > -		if (!vd)
> > > > -			break;
> > > > -
> > > > -		desc = vd2dw_edma_desc(vd);
> > > > -		if (desc->start_burst >= desc->nburst) {
> > > > -			dw_hdma_set_callback_result(vd, DMA_TRANS_NOERROR);
> > > > -			list_del(&vd->node);
> > > > -			vchan_cookie_complete(vd);
> > > > -			if (!chan->non_ll)
> > > > -				chan->ll_done = chan->ll_head;
> > > > +		if (vd) {
> > > > +			desc = vd2dw_edma_desc(vd);
> > > > +			if (desc->start_burst >= desc->nburst) {
> > > > +				dw_hdma_set_callback_result(vd,
> > > > +							    DMA_TRANS_NOERROR);
> > > > +				list_del(&vd->node);
> > > > +				vchan_cookie_complete(vd);
> > > > +			}
> > > >  		}
> > > >
> > > >  		if (chan->request == EDMA_REQ_PAUSE) {
> > > > @@ -871,25 +1013,12 @@ static void dw_edma_done_interrupt_locked(struct dw_edma_chan *chan)
> > > >  		break;
> > > >
> > > >  	case EDMA_REQ_STOP:
> > > > -		vd = vchan_next_desc(&chan->vc);
> > > > -		if (!vd)
> > > > -			break;
> > > > -
> > > >  		dw_edma_finish_termination(chan);
> > > >  		break;
> > > >
> > > >  	default:
> > > >  		break;
> > > >  	}
> > > > -	dw_edma_core_ch_maybe_doorbell(chan);
> > > > -}
> > > > -
> > > > -static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
> > > > -{
> > > > -	unsigned long flags;
> > > > -
> > > > -	spin_lock_irqsave(&chan->vc.lock, flags);
> > > > -	dw_edma_done_interrupt_locked(chan);
> > > >  	spin_unlock_irqrestore(&chan->vc.lock, flags);
> > > >  }
> > > >
> > > > @@ -902,7 +1031,37 @@ static void dw_edma_ll_interrupt(struct dw_edma_chan *chan)
> > > >  	if (!dw_edma_ll_snapshot_take(chan, &snapshot))
> > > >  		return;
> > > >
> > > > -	dw_edma_done_interrupt_locked(chan);
> > > > +	if (chan->status == EDMA_ST_PAUSE)
> > > > +		return;
> > > > +
> > > > +	dw_edma_ll_consume_progress(chan, snapshot.idx);
> > > > +
> > > > +	if (snapshot.event == DW_EDMA_LL_EVENT_PROGRESS &&
> > > > +	    chan->request != EDMA_REQ_NONE)
> > > > +		goto out;
> > > > +
> > > > +	switch (chan->request) {
> > > > +	case EDMA_REQ_NONE:
> > > > +		dw_edma_start_transfer(chan);
> > > > +		chan->status = dw_edma_ll_pending(chan) ?
> > > > +			       EDMA_ST_BUSY : EDMA_ST_IDLE;
> > > > +		break;
> > > > +
> > > > +	case EDMA_REQ_PAUSE:
> > > > +		dw_edma_set_request(chan, EDMA_REQ_NONE);
> > > > +		chan->status = EDMA_ST_PAUSE;
> > > > +		break;
> > > > +
> > > > +	case EDMA_REQ_STOP:
> > > > +		dw_edma_finish_termination(chan);
> > > > +		break;
> > > > +
> > > > +	default:
> > > > +		break;
> > > > +	}
> > > > +
> > > > +out:
> > > > +	dw_edma_core_ch_maybe_doorbell(chan);
> > > >  }
> > > >
> > > >  static bool dw_edma_abort_interrupt(struct dw_edma_chan *chan)
> > > > @@ -965,21 +1124,44 @@ static void dw_edma_queue_irq_work(struct dw_edma_chan *chan,
> > > >  static void dw_edma_record_irq(struct dw_edma_chan *chan, unsigned int events)
> > > >  {
> > > >  	struct dw_edma_ll_snapshot snapshot = {
> > > > -		.event = events & DW_EDMA_IRQ_STOP ?
> > > > -			 DW_EDMA_LL_EVENT_STOP : DW_EDMA_LL_EVENT_PROGRESS,
> > > > +		.idx = -1,
> > > > +		.event = DW_EDMA_LL_EVENT_NONE,
> > > >  	};
> > > >  	unsigned int pending = 0;
> > > >
> > > >  	lockdep_assert_held(dw_edma_event_lock(chan));
> > > >
> > > > +	/*
> > > > +	 * Classify the LL event before normalizing its LLP sample to the
> > > > +	 * exclusive consumer boundary. Keep STOP even without a valid
> > > > +	 * boundary so deferred handling still sees that the run ended.
> > > > +	 */
> > > > +	if (!chan->non_ll &&
> > > > +	    (events & (DW_EDMA_IRQ_DONE | DW_EDMA_IRQ_PROGRESS |
> > > > +		       DW_EDMA_IRQ_STOP))) {
> > > > +		if ((events & DW_EDMA_IRQ_STOP) ||
> > > > +		    ((events & DW_EDMA_IRQ_DONE) &&
> > > > +		     dw_edma_ll_done_is_stopped(chan)))
> > > > +			snapshot.event = DW_EDMA_LL_EVENT_STOP;
> > > > +		else
> > > > +			snapshot.event = DW_EDMA_LL_EVENT_PROGRESS;
> > > > +
> > > > +		snapshot.idx = dw_edma_ll_recycle_idx(chan,
> > > > +						      dw_edma_core_ll_cur_idx(chan),
> > > > +						      snapshot.event);
> > > > +		if (snapshot.idx < 0 &&
> > > > +		    snapshot.event != DW_EDMA_LL_EVENT_STOP)
> > > > +			snapshot.event = DW_EDMA_LL_EVENT_NONE;
> > > > +	}
> > > > +
> > > >  	if ((events & DW_EDMA_IRQ_ABORT) && chan->abort_pending)
> > > >  		pending |= DW_EDMA_DEFERRED_ABORT;
> > > >
> > > > -	if (chan->non_ll) {
> > > > -		if (events & (DW_EDMA_IRQ_DONE | DW_EDMA_IRQ_STOP))
> > > > -			pending |= DW_EDMA_DEFERRED_DONE;
> > > > -	} else if (events & (DW_EDMA_IRQ_DONE | DW_EDMA_IRQ_PROGRESS |
> > > > -			     DW_EDMA_IRQ_STOP)) {
> > > > +	if (chan->non_ll &&
> > > > +	    (events & (DW_EDMA_IRQ_DONE | DW_EDMA_IRQ_STOP)))
> > > > +		pending |= DW_EDMA_DEFERRED_DONE;
> > > > +
> > > > +	if (snapshot.event != DW_EDMA_LL_EVENT_NONE) {
> > > >  		/* STOP is final for this run; do not replace it with progress. */
> > > >  		if (chan->ll_irq.event != DW_EDMA_LL_EVENT_STOP ||
> > > >  		    snapshot.event == DW_EDMA_LL_EVENT_STOP)
> > > > @@ -1227,6 +1409,7 @@ static int dw_edma_channel_setup(struct dw_edma *dw, u32 wr_alloc, u32 rd_alloc)
> > > >  		chan->irq_mode = dw_edma_get_default_irq_mode(chan);
> > > >  		INIT_WORK(&chan->irq_work, dw_edma_irq_work);
> > > >  		atomic_set(&chan->irq_pending, 0);
> > > > +		chan->ll_irq.idx = -1;
> > > >  		chan->ll_irq.event = DW_EDMA_LL_EVENT_NONE;
> > > >  		chan->abort_pending = false;
> > > >
> > > > diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
> > > > index d709aa274300..27cab6ca5e67 100644
> > > > --- a/drivers/dma/dw-edma/dw-edma-core.h
> > > > +++ b/drivers/dma/dw-edma/dw-edma-core.h
> > > > @@ -71,6 +71,7 @@ struct dw_edma_desc {
> > > >
> > > >  	u32				alloc_sz;
> > > >
> > > > +	u32				ll_start;	/* First outstanding LL entry */
> > > >  	size_t				done_burst;
> > > >  	size_t				start_burst;
> > > >  	size_t				nburst;
> > > > @@ -78,6 +79,7 @@ struct dw_edma_desc {
> > > >  };
> > > >
> > > >  struct dw_edma_ll_snapshot {
> > > > +	int				idx;
> > > >  	enum dw_edma_ll_event		event;
> > > >  };
> > > >
> > > > @@ -113,6 +115,7 @@ struct dw_edma_chan {
> > > >  	 * LL event recorded by the hard IRQ handler. The event lock
> > > >  	 * serializes its capture with a new hardware run; vc.lock serializes
> > > >  	 * its consumption with LL state.
> > > > +	 * Valid indices use the exclusive boundary convention of ll_done.
> > > >  	 */
> > > >  	struct dw_edma_ll_snapshot	ll_irq;
> > > >  	/* ABORT is terminal and remains pending across LL state changes. */
> > > > @@ -189,6 +192,7 @@ struct dw_edma_core_ops {
> > > >  	enum dma_status (*ch_status)(struct dw_edma_chan *chan);
> > > >  	/* Called with dw_edma_event_lock(chan) held. */
> > > >  	bool (*ch_abort_int_pending)(struct dw_edma_chan *chan);
> > > > +	u32 (*ch_transfer_size)(struct dw_edma_chan *chan);
> > > >  	irqreturn_t (*handle_int)(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
> > > >  				  dw_edma_handler_t handler);
> > > >  	void (*non_ll_start)(struct dw_edma_chan *chan, struct dw_edma_burst *child);
> > > > diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/dw-edma-v0-core.c
> > > > index 20dff21a0603..b9d6205157b3 100644
> > > > --- a/drivers/dma/dw-edma/dw-edma-v0-core.c
> > > > +++ b/drivers/dma/dw-edma/dw-edma-v0-core.c
> > > > @@ -318,6 +318,11 @@ static enum dma_status dw_edma_v0_core_ch_status(struct dw_edma_chan *chan)
> > > >  		return DMA_ERROR;
> > > >  }
> > > >
> > > > +static u32 dw_edma_v0_core_ch_transfer_size(struct dw_edma_chan *chan)
> > > > +{
> > > > +	return GET_CH_32(chan->dw, chan->dir, chan->id, transfer_size);
> > > > +}
> > > > +
> > > >  static bool dw_edma_v0_core_ch_abort_int_pending(struct dw_edma_chan *chan)
> > > >  {
> > > >  	u32 sts = GET_RW_32(chan->dw, chan->dir, int_status);
> > > > @@ -677,6 +682,7 @@ static const struct dw_edma_core_ops dw_edma_v0_core = {
> > > >  	.ch_count = dw_edma_v0_core_ch_count,
> > > >  	.ch_status = dw_edma_v0_core_ch_status,
> > > >  	.ch_abort_int_pending = dw_edma_v0_core_ch_abort_int_pending,
> > > > +	.ch_transfer_size = dw_edma_v0_core_ch_transfer_size,
> > > >  	.handle_int = dw_edma_v0_core_handle_int,
> > > >  	.ll_data = dw_edma_v0_core_ll_data,
> > > >  	.ll_link = dw_edma_v0_core_ll_link,
> > > > --
> > > > 2.51.0
> > > >
