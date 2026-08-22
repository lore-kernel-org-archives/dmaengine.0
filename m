Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11021137.outbound.protection.outlook.com [52.101.125.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774BB3DAABD;
	Sat, 22 Aug 2026 14:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787408841; cv=fail; b=P7YVsR5FSjABYq0s/NRlv0bIFB+OnxOnWWIokNHiJznv7IcHlCEJ8Hdc0ywIZyzmGuCwAdW9Zs7VjFsgjb3B5rosUeGFv7ntSkU0WV3oDywnHa3rJ1iN6rlSOfJFJ83Jws3e5tk30HAlRhn7RlS5GaZRHxH1VlULB6YhQWe3G04=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787408841; c=relaxed/simple;
	bh=MOFcugS68Yqh82pVNjOs7dmk00aPaypLf+ZSdPhuZcI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DHdXXSuJiJwc9kM2KEy+Fu/XyeIyZq2iDEAo/o7lV7AhmMnSHCht6qR4k7YJqs1VGW5BFbaZYD87wMpM5qpGubH3gToHZeL5E/puWb/rwU+tRayBUxTrHB8/6h7i0R6nbIw9t9pC9VI9paAOyjNc1DfzC1plTN5Da+ccvpS7J8w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=YiLUzCJe; arc=fail smtp.client-ip=52.101.125.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="YiLUzCJe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hogqbaK586SZRcAhEL/7b/dvksfL12xlxo5KPGNBq/8e9dCHZwqv8FAr3ysXmdnsF0fYaomFv7ze6+Ub/mU09XT73h0BYZgMGXc4KCTiZ2/f40XSbYusPxhUYPsVQfXiq3CjS++psnR+9A8diD9uaDerYDeL9LUtm+21qrgDEF0fRPIzVzZGW/Kjuf5I66dksnaIeYnHoAAH66Td3KpcuSnvUxeBmQKbcZhbfXrXK8PLqzaghyt2yHUKnyqpELz5TMTdXZ1nvOgwUyTESnvNRD9usUq7LxIwm4gCt0PcxHsN3AuI5m/3PXcS8LbBTN1qo9WtAmzNbjE9nQ8ar6NeWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WV7MwSQUtaJSr3dgX5mh+iWb/vULVnB61awmzuQKIow=;
 b=gpB876FPlS1jTS+DKdIbyFJDlGRE5iSZARU6b19icgBSiX8W6lkuMZCwQBQia6s39br2aDeXxdvnaI45wA9n/J30yFqP6/mimthT14b7oW8S84ojTY4ceIeBd1QdhW/XUiScWJizb0S1HonWKeC29sgr6SwCncqWQ/QEeoXtSUUFfJR2290ALo+RIVzFuDJQWp0n+rNNN3GfftHRiM0VN/aJNZRamrNvJZ+35XRBDSHKltswaKtM8G+mzAbJOQ9i2OF0IWRi2kCjVjZzJIqQUPEJSb2b2J6lTUdEfnL/hPm0cnziL6sb+Pl8+JHPZeV4Yz1JV9RFyFD89xXXeavvTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WV7MwSQUtaJSr3dgX5mh+iWb/vULVnB61awmzuQKIow=;
 b=YiLUzCJeaKAM9LJgfXHITZ5k+wkRtxqwniXkDgDYQgsU/1UuZLyjJntvmRxwD/PXjDI9NwlgGNFndF/M1Yur/kERMEtBDEDFyjg+fmBAc7M8JCXdkZ5f02bmT4n6da3rWOMa6F9pO1tgRP7lu1FOq7gMYxwDAz4LVfAA+LdQSIA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYCP286MB2098.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:151::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Sat, 22 Aug
 2026 14:27:00 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0339.007; Sat, 22 Aug 2026
 14:27:00 +0000
Date: Sat, 22 Aug 2026 23:26:58 +0900
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
Message-ID: <aicrjnsonoyvezrseop2ioo7fu3o7g37xdthrxyl6e2eu66l42@grwf3gff7se5>
References: <20260812155721.2807506-1-den@valinux.co.jp>
 <20260812155721.2807506-14-den@valinux.co.jp>
 <anzdd9kAxBHvuzpo@lizhi-Precision-Tower-5810>
 <hi4ani63qjhwihylkpbensfb27u6kaqtl53mjnqpzcfbabdhgt@p6k4x5vabtph>
 <an84kpKLfr8ACBEQ@SMW015318>
 <m5sw477gk4idakurqq2ngz5a5ehqdfwd274bqroitzzmefftyq@appeqhwo5lkv>
 <aoiyPQVGS8gkdNoW@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aoiyPQVGS8gkdNoW@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: TY6PR01CA0034.jpnprd01.prod.outlook.com
 (2603:1096:405:3bd::17) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYCP286MB2098:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fb64482-f50b-4e14-c1fb-08df00596dbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|376014|10070799003|1800799024|366016|5023799004|56012099006|6133799003|10067099003|4143699003|13003099007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	xHbZhPX//CDAyle9TcFb5eceXJ7yMgWI+sH7AReIo3jegxFXyKPfvRA9CALeIreI112Jg9dx8YcZu1LCYBC+us4Myk1rQJFqvzyic5U4rIYtCkygNXkthr2qjhwcG2SPymxBf7lAHQczJFVAyrYq+dpAt5gmZkgLFvOsVfsUSx1qo/gO4aG1bjZUjt54YJnJIpHbRo0iGZpyP8kuxkAlnaRg/UeQGRpnaIDLaNHNLyNnSCxFDJlh87pitz8/CsBcqYcqfCui0jGiiYY2CKCZ9umuDHOQL9XAqBvvQi2d+u3wE59lfeLyoUDn0cUdnrFnvyH65eK3ommCW0NkCL5zYAPJeSp7I7RMkoNC2mog6UXrUravUqqZZhBKNpZOBGknbrapdFrq5+iFyHyQSNeHy/CvlLt3rJsjg9zUW6aTATOOvs0unNxO5ejrC0iBERav8jZV+xj/sqHPVeMlVcA6kdmSamlKtHLhuuTG2U/QHKEbTrjUSJ2WXslIJXM2HC8FpIbTJ0R2L5Sb2VfOl1kICm5M032b3Oumi6OQk2a0TrJ30RLCSamP2CpKAhUiUEX81tzx9bHgaLygbMckQ9NJTn7E6QGVQKqzHpRwaHxQoA0GST88gA6z5/kneLddMtA+wGdVizV/wMfvzqbnH/C6Xxnn0oEevMG8k1Zcf1X4m+M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(10070799003)(1800799024)(366016)(5023799004)(56012099006)(6133799003)(10067099003)(4143699003)(13003099007)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lXuva+tU9O/AoU+pUCCeHKK3YGWYAcJv/ZZ0LDClkvu5DHHU74r9+gJZxDsW?=
 =?us-ascii?Q?iTwTNZjKqPhwmOEi+B/1XkiChx6sI18urB1lXVgbwrLLvBLp9eclx1tc3ThC?=
 =?us-ascii?Q?OyJS/Vdub6GgDdhpTD6bcV7GyIbRxTyM48rbVzboXWlB2+Kx1rV49s4iPBPU?=
 =?us-ascii?Q?0cDiMUf24D/OSDi/9x+2tIRcltHb1ZeJfLJ9CroSaXFT66dH6JLaCU54O/Gi?=
 =?us-ascii?Q?+FVdUS2q4SZvXYeEYxyGT0GuL7D8OFtTHcZuJOgjGzmRhmvEGDqVly1o+0M5?=
 =?us-ascii?Q?hB7qZ7I3Sz1jG2jB8xsu/LIYTdi0bY+H8wtb2SHgK3Wy1TOIxEwHnfsGDNU4?=
 =?us-ascii?Q?4h72jFt/z+zh7LSNNoRzcZVFJbk0VpMoeZ9Fz29uQjd3OifxCI+NCSxzENw4?=
 =?us-ascii?Q?rsTRHMJypWCk8I6vPfJebWZnhBNp2Y4XFXvWnqlC+NW5OgxaNxpvGxrc2hyF?=
 =?us-ascii?Q?IqoB43hbGI6PyWcaJUhFV5GggRJ/cIJoGnq7cjuQhSzaSKDMFxc4aQqvvPgh?=
 =?us-ascii?Q?fCOvM1U9ZqSIkVOymtfFP5yGpfn+0soZ/IfSG5ab5iQSxqrocpmaOv5CmKqH?=
 =?us-ascii?Q?P9uRGkfmdxyze/bUSZ/YH/aDodY9KpMvV5Jb1GdBivTosVpgEkXZyl1U4Fjv?=
 =?us-ascii?Q?fRF8W/mC7C5ikVa/nGLXfGIMaV2kYUy0Wd+j+phhaYf6k89aSRn9pw5oEOaz?=
 =?us-ascii?Q?QSf4/zkVpywGVZeqF1uZyNfnn/zQStrYBWX6RmEh88PcpQoo2FuIghV8tV0U?=
 =?us-ascii?Q?/ulBTlE3E3Q4z5SBHyImHHEqYCrE7ECaBuBiYt/yTR2pg11u149RCthBT4Mv?=
 =?us-ascii?Q?ernNpB+6bhnYPJoS9hK5oegJc93qNC7b5rIldkuZTJ6JTZ74IceG6bLDLNPr?=
 =?us-ascii?Q?Pza2IsNwS5wxNZ4TlLka23uPFCPzIHBGjxG35EsUavFH9GM76oyu6WbDxysP?=
 =?us-ascii?Q?eCbc0ZhyZT40JOIZs6K5+a34wdJ4vwi3aVC7dyGj7CXj39HBGbm15mEkA7EB?=
 =?us-ascii?Q?x6+jAF7F0shzpjWuH4V816oKbI2RUno4rhN7TcfOS5OlWj9ruiVMmlLVtUc0?=
 =?us-ascii?Q?ziJWXCAOpkeS+yHrXpYrUfHDxPiP2eE/Ke6q6rXjSV5sz1g/WocDLl4pPEEh?=
 =?us-ascii?Q?hBxfRId8pdaGNC7lGkE3/LYSnyQOfThux/j5HmDbhiHCNHV3EDfbvcdPDPn8?=
 =?us-ascii?Q?yaqf7K2qnNrtC9qwpOeV9G5RuDb3Fcn51EkcH7GMUcgWdkt3VqxdPxCJmunZ?=
 =?us-ascii?Q?dhchBCKBc/i7tg4cpAK4X4QB5g7foe6wftJB3tLTRK8+bHhGtB+u5S/Tr1DJ?=
 =?us-ascii?Q?9hSXyAk1MdbQf7WfVKxzjLBj98SHv82Fgdj3U7G+aTmqwoDiu7pwoipmmE/b?=
 =?us-ascii?Q?8DiPU+8vbDn4OjFPxpSlw6LVnyk51toRZZs9o+Su/+oKKhKvXHnGABhJ87y1?=
 =?us-ascii?Q?h2F+x7ypRouToPYGaqr/rUscweDGst4ijafbR4XNTLyHrM5AmLkJzQStg09R?=
 =?us-ascii?Q?nNbFFAydHyDWHB78uLBb/iHnJlXnjmMHCO7idGicZM/4/JG2aZEj782osh5M?=
 =?us-ascii?Q?xMG5Vsw4U7WTJz/P7YRdol2L5Yx+0N3dm+ER3IO/tBgsVi45Xh6o4OGpcrZV?=
 =?us-ascii?Q?9HoIcbPyXyx/7j2goyFBS7Rmglvmj1JXJtOeUe5PgVx5Kqe0UfaDVa4OYfGg?=
 =?us-ascii?Q?90WntBoNpxEPU+q7mIL22+B+udKVTZ1vG3tgcHTO1q5NDQDUhiGrjyeBNs3N?=
 =?us-ascii?Q?63ewZrH7IY41eS5DhDeUQTbElik2snTiwhTHkyflwQck57OiZEHy?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fb64482-f50b-4e14-c1fb-08df00596dbd
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2026 14:27:00.4772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8pJ/2JHMtOWpmt14gImlcFuj46vBSljAFXajswWJiZ7RnPR2VBXhvfl8X+2su6+4pzli8aeAlr8eU6vnbDYZEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB2098

On Fri, Aug 21, 2026 at 04:17:01PM -0400, Frank Li wrote:
> On Sat, Aug 15, 2026 at 11:36:54PM +0900, Koichiro Den wrote:
> > On Fri, Aug 14, 2026 at 10:47:30AM -0500, Frank Li wrote:
> > > On Fri, Aug 14, 2026 at 05:48:16PM +0900, Koichiro Den wrote:
> > > > On Wed, Aug 12, 2026 at 04:54:15PM -0400, Frank Li wrote:
> > > > > On Thu, Aug 13, 2026 at 12:57:10AM +0900, Koichiro Den wrote:
> > > > > > Dynamic append can place entries from several descriptors in one LL
> > > > > > ring. Track the consumed boundary in ll_done, reuse entries behind it,
> > > > > > and complete descriptors in issue order as done_burst advances.
> > > > > >
> > > > > > Normalize each IRQ-paired LLP sample to the exclusive boundary used by
> > > > > > ll_done. A stopped sample points to the next entry. Keep a running
> > > > > > sample one entry behind the raw LLP so an entry is not recycled before
> > > > > > payload completion is established. For the eDMA-compatible interrupt
> > > > > > interface, treat DONE as a stopped boundary only when channel status is
> > > > > > complete and transfer size is zero.
> > > > > >
> > > > > > Record the first outstanding physical LL entry in each descriptor and
> > > > > > verify that it matches ll_done before consuming that descriptor. On a
> > > > > > mismatch, warn and resynchronize only if the sampled boundary has
> > > > > > reached the descriptor; otherwise stop without completing it.
> > > > > >
> > > > > > Reclaiming entries as they are consumed also lets a descriptor larger
> > > > > > than the ring advance. Keep one data entry free so a physical index
> > > > > > remains unambiguous in the active producer window. Clear any published
> > > > > > ring state on termination or abort before starting another transfer.
> > > > > >
> > > > > > LL progress now has its own completion path, so fold the temporary
> > > > > > lock-held DONE helper back into its only caller.
> > > > > >
> > > > > > Suggested-by: Frank Li <Frank.Li@nxp.com>
> > > > > > Signed-off-by: Koichiro Den <den@valinux.co.jp>
> > > > > > ---
> > > > > > Changes in v5:
> > > > > >   - Adjust context after moving the issue_pending() snapshot discard to
> > > > > >     patch 11. dw_edma_ll_snapshot_discard() is no longer re-added here.
> > > > > >   - Fold dw_edma_ll_clean_pending() into
> > > > > >     dw_edma_ll_consume_progress(), removing the one-line wrapper
> > > > > >     (pure refactoring).
> > > > > >
> > > > > >  drivers/dma/dw-edma/dw-edma-core.c    | 273 +++++++++++++++++++++-----
> > > > > >  drivers/dma/dw-edma/dw-edma-core.h    |   4 +
> > > > > >  drivers/dma/dw-edma/dw-edma-v0-core.c |   6 +
> > > > > >  3 files changed, 238 insertions(+), 45 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> > > > > > index 1deaf2d0da91..363993c64c44 100644
> > > > > > --- a/drivers/dma/dw-edma/dw-edma-core.c
> > > > > > +++ b/drivers/dma/dw-edma/dw-edma-core.c
> > ---[snip]---
> > > > > > +
> > > > > > +	/*
> > > > > > +	 * Moving a running index one entry back cannot represent index 0
> > > > > > +	 * without wrapping it to ll_max - 1. That could falsely consume a full
> > > > > > +	 * producer window, so wait for another sample or STOP.
> > > > > > +	 */
> > > > > > +	if (!idx)
> > > > > > +		return -EINVAL;
> > > > > > +
> > > > > > +	/*
> > > > > > +	 * A running eDMA LLP can move ahead of payload completion, so keep the
> > > > > > +	 * boundary one entry behind it.
> > > > > > +	 *
> > > > > > +	 * DWC PCIe Controller Databook 6.10a-lca06, Section 7.2.1, Table 7-3
> > > > > > +	 * describes an HDMA watermark LLP as an inclusive LLE recycling
> > > > > > +	 * boundary, which would normally translate to idx + 1. During testing
> > > > > > +	 * on a DWC HDMA 6.30a integration, using that boundary for DMAengine
> > > > > > +	 * completion let clients release DMA mappings while hardware still
> > > > > > +	 * accessed them, causing IOMMU faults. Keep the boundary one entry
> > > > > > +	 * behind the raw LLP for HDMA as well. Stopped samples continue to use
> > > > > > +	 * the next-entry boundary above.
> > > > > > +	 */
> > > > > > +	return idx == chan->ll_max ? chan->ll_max - 1 : idx - 1;
> > > > >
> > > > > LLP should point current DMA working LL, always stop at which controller bit
> > > > > have not set yet.
> > > > >
> > > > > If your logic always treat idx as unfinished, you needn't idx - 1 here.
> > > > >
> > > > > [ll_done, idx)
> > > >
> > > > I agree that [ll_done, idx) could be used when idx identifies the first
> > > > unfinished LLE. That is already how a confirmed STOP sample is handled. For an
> > > > HDMA watermark, the databook gives raw idx a different meaning, but it can still
> > > > be used as a conservative exclusive boundary. The idx - 1 retreat is used only
> > > > for a running progress sample.
> > > >
> > > >     state/event              meaning of raw LLP                  current v5
> > > >                                                                  boundary
> > > >     -----------------------  ---------------------------------  ------------
> > > >     eDMA, confirmed STOPPED  Points to the next entry to be      idx
> > > >                              processed.
> > > >
> > > >     HDMA, STOPPED            Points to the next entry to be      idx
> > > >                              processed.
> > > >
> > > >     HDMA, running at         Points inclusively to the last      prev(idx) (*)
> > > >     WATERMARK                LLE that may be recycled,
> > > >                              according to the databook.
> > > >
> > > >     eDMA, running at DONE    Was observed to advance with        prev(idx)
> > > >                              descriptor fetch before payload
> > > >                              completion.
> > > >
> > > >     (*) The documented HDMA LLE-recycling boundary would normally be
> > > >         next(idx). v1 used idx as the exclusive dmaengine completion
> > > >         boundary. The current code deliberately uses the same conservative
> > > >         prev(idx) rule for all running progress samples.
> > >
> > > Thank you for good summary. The key problem is that it is hard to know
> > > DMA running or STOP. Espcially use polling mode.
> > >
> > > 	assume a bus loop
> > >
> > > 	while(1) {
> > > 		if (condition) { 	1
> > > 			do_action()     2
> > > 		}
> > > 	}
> > >
> > > 1, Generally read some register status or software state.
> > > 2. Read idx
> > >
> > > between 1 and 2, if 1 test is running, after test and before do action,
> > > dma may be already stopped.
> > >
> > > DMA engine is totally async with cpu.
> >
> > Yes, sure. The table in my previous reply summarized the state/event-dependent
> > HDMA_LLP semantics as described in the databook. It was not assuming that
> > RUNNING/STOPPED remains stable between two MMIO reads.
> 
> can we use typical method by read twice
> 
> 	do {
> 		status = readl(status);
> 		idx	= readl(llp);
> 	} while (status != readl(status);
> 
> status idx always reflect the same time hardware status.

I don't think that double read guarantees a matched snapshot here. CS is not a
sequence counter. Both reads might return STOPPED while HW goes STOPPED ->
RUNNING -> STOPPED between them. CS lag would be another head-scratcher, as I
described in the mail to you and Gustavo [1].
So AFAICT, it can catch one visible CS transition, but not stale CS or ABA.

[1] https://lore.kernel.org/r/tkyu5rsxfa7i6rxxw6qxmmwke5qnlxptwx4j2s24fhftsmmf26@gamef2ec4wwm/

Thanks,
Koichiro

> 
> Frank
> 
> >
> > I am aware of the race you described, and the implementation handles it
> > conservatively, including this v5. If hardware updates LLP and reaches STOP just
> > after the interrupt-status read, the sample may be treated as running progress.
> > The newly asserted STOP status remains for the later STOP pass, while the
> > stopped-tail recheck provides another fallback.
> >
> > >
> > > >
> > > > For a running eDMA sample, I observed that DMA_LLP can advance with descriptor
> > > > fetch before the corresponding payload transfer has completed. Therefore raw idx
> > > > does not by itself prove that the payload for the entry immediately before idx
> > > > has finished. Using [ll_done, idx) could complete that entry and release its DMA
> > > > mapping too early.
> > >
> > >
> > > This is bad hardware design. Pre Fetch should not show in register leave.
> > >
> > > Maybe a workaround, dma driver create pre allocated memory.
> > >
> > > When prep sg, append an extra LL, which write/read to this pre allocate
> > > memory, we can check this pre allocated memory to know current dma working
> > > status.
> > >
> > > This is embeded DMA, one side have to be remote side memory, which make work
> > > around complex.
> >
> > Thanks for the suggestion. The extra LL idea might be one possible direction to
> > avoid relying on LLP. Even though the databook describes LLP in detail, if a
> > copmletion-marker LLE makes the software decision simpler, I think it is worth
> > considering.
> >
> > Plus, my guess is that one extra LLE would not affect the throughput ceiling
> > much. As you said, the question is whether the remote side can be handled
> > without making the generic implementation more complicated.
> >
> > >
> > > >
> > > > For HDMA, the databook describes the watermark LLP as an inclusive LLE recycling
> > > > boundary, which would normally translate to next(idx). I first implemented it
> > > > that way. On a DWC HDMA 6.30a integration (SpacemiT K3), however, this let the
> > > > client unmap memory while hardware was still accessing it, causing IOMMU faults.
> > > > Moving the completion boundary back to prev(idx) stopped the faults.
> > > >
> > > > For completeness, v1 used raw idx as the exclusive HDMA completion boundary,
> > > > [ll_done, idx), and completed the HDMA fio test set reliably. So raw idx itself
> > > > is not known to be unsafe.
> > > >
> > > > After next(idx) caused the IOMMU faults, however, I deliberately aligned HDMA
> > > > with the conservative eDMA handling (pls. see the comment block in
> > > > dw_edma_ll_recycle_idx()). All running progress samples use the same prev(idx)
> > > > conversion, while confirmed STOP samples use the exact next-entry boundary. This
> > > > keeps the common normalization simple and avoids engine-specific handling. For
> > > > HDMA, the trade-off is that completion stays one additional entry behind raw idx
> > > > until later progress or STOP catches it up.
> > >
> > > So DMA engine move idx advance even though current LL still working.
> > > It is quite common at some modem dmaengine to improve dma preforamce, but
> > > it should be hidden in hardware internal, like CPU's PC pointer.
> >
> > Please note again that this is only my observation on one integration, not a
> > claim about the architected behaviour. Input from someone at Synopsys would help
> > confirm it. Even if this is the actual behaviour, I think it can be handled
> > conservatively in software, as the LLP handling in this v5 does. So I do not
> > think tackling it is necessarily a wild goose chase.
> >
> > One option might be the extra completion-marker LLE you suggested above, while
> > another is the conservative LLP handling used by this v5.
> >
> >
> > P.S. That said, all in all, what I find most troublesome is a separate matter:
> >
> > (1) apparent CS lag from software's point of view, especially when multiple
> >     hardware channels are busy under heavy load, and
> >
> > (2) a doorbell while the channel is still internally running may not only be
> >     ignored but also stall the hardware if it lands in a narrow transition
> >     window.
> >
> > Once dynamic append is enabled, avoiding (2) when (1) may hide the actual
> > internal state is tricky. Much of the extra complexity added since v2 comes from
> > handling this interaction safely.
> >
> > That is why I would greatly appreciate any response or input from someone at
> > Synopsys who knows the actual internal behaviour, including any known errata
> > which might be relevant:
> > https://lore.kernel.org/r/tkyu5rsxfa7i6rxxw6qxmmwke5qnlxptwx4j2s24fhftsmmf26@gamef2ec4wwm/
> >
> > I added Gustavo and you to the To: list of that message, asking whether (1)
> > and/or (2) are real, known issues.
> >
> > AFAIK, there is no in-tree test that can both run on different DWC PCIe eDMA
> > integrations and also generate the transition-heavy load needed to trigger that
> > behaviour, which makes it hard to compare observations with anyone else.
> >
> > Best regards,
> > Koichiro
> >
> > >
> > > >
> > > > I think this is related to the fact that HDMA LL mode decouples descriptor
> > > > fetching, data processing, completion processing, and interrupt handling. That
> > > > explains why the documented LLE-recycling boundary cannot automatically be used
> > > > as the dmaengine completion boundary, although it does not by itself tell us
> > > > whether idx or prev(idx) is required.
> > > >
> > > > The idx == 0 handling is also a consequence of the current prev(idx) retreat.
> > > > For example, with data entries 0..7 and the physical link element at index 8,
> > > > moving raw index 8 back gives boundary 7. Blindly moving raw data index 0 back
> > > > would also wrap to 7. If that raw 0 was a no-progress sample, it could then look
> > > > like almost one full ring of progress. Therefore raw 0 is rejected while the
> > > > physical link index remains distinguishable.
> > > >
> > > > In other words, without the prev(idx) retreat, the link index could simply be
> > > > normalized to 0, as you mentioned. The current prev(idx) handling was
> > > > nevertheless intentional, not an oversight. It trades one-entry delayed HDMA
> > > > completion for one conservative rule shared with eDMA. Unless there is a
> > > > concrete reason to reclaim that extra entry at each HDMA watermark, I would
> > > > prefer to keep the common handling.
> > >
> > > let me read document again.
> > >
> > > Frank
> > >
> > > >
> > > > Best regards,
> > > > Koichiro
> > > >
> > > > >
> > > > > > +}
> > > > > > +
> > > > > >  static void dw_edma_core_ll_sync(struct dw_edma_chan *chan)
> > > > > >  {
> > > > > >  	/*
> > > > > > @@ -834,31 +977,30 @@ dw_edma_device_prep_interleaved_dma(struct dma_chan *dchan,
> > > > > >  	return dw_edma_device_transfer(&xfer, dw_edma_device_get_config(dchan, NULL));
> > > > > >  }
> > > > > >
> > > > > > -/* Must be called with vc.lock held. */
> > > > > > -static void dw_edma_done_interrupt_locked(struct dw_edma_chan *chan)
> > > > > > +static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
> > > > > >  {
> > > > > >  	struct dw_edma_desc *desc;
> > > > > >  	struct virt_dma_desc *vd;
> > > > > > +	unsigned long flags;
> > > > > >
> > > > > > -	lockdep_assert_held(&chan->vc.lock);
> > > > > > -
> > > > > > -	if (chan->status == EDMA_ST_PAUSE)
> > > > > > +	spin_lock_irqsave(&chan->vc.lock, flags);
> > > > > > +	if (chan->status == EDMA_ST_PAUSE) {
> > > > > > +		spin_unlock_irqrestore(&chan->vc.lock, flags);
> > > > > >  		return;
> > > > > > +	}
> > > > > >
> > > > > >  	switch (chan->request) {
> > > > > >  	case EDMA_REQ_NONE:
> > > > > >  	case EDMA_REQ_PAUSE:
> > > > > >  		vd = vchan_next_desc(&chan->vc);
> > > > > > -		if (!vd)
> > > > > > -			break;
> > > > > > -
> > > > > > -		desc = vd2dw_edma_desc(vd);
> > > > > > -		if (desc->start_burst >= desc->nburst) {
> > > > > > -			dw_hdma_set_callback_result(vd, DMA_TRANS_NOERROR);
> > > > > > -			list_del(&vd->node);
> > > > > > -			vchan_cookie_complete(vd);
> > > > > > -			if (!chan->non_ll)
> > > > > > -				chan->ll_done = chan->ll_head;
> > > > > > +		if (vd) {
> > > > > > +			desc = vd2dw_edma_desc(vd);
> > > > > > +			if (desc->start_burst >= desc->nburst) {
> > > > > > +				dw_hdma_set_callback_result(vd,
> > > > > > +							    DMA_TRANS_NOERROR);
> > > > > > +				list_del(&vd->node);
> > > > > > +				vchan_cookie_complete(vd);
> > > > > > +			}
> > > > > >  		}
> > > > > >
> > > > > >  		if (chan->request == EDMA_REQ_PAUSE) {
> > > > > > @@ -871,25 +1013,12 @@ static void dw_edma_done_interrupt_locked(struct dw_edma_chan *chan)
> > > > > >  		break;
> > > > > >
> > > > > >  	case EDMA_REQ_STOP:
> > > > > > -		vd = vchan_next_desc(&chan->vc);
> > > > > > -		if (!vd)
> > > > > > -			break;
> > > > > > -
> > > > > >  		dw_edma_finish_termination(chan);
> > > > > >  		break;
> > > > > >
> > > > > >  	default:
> > > > > >  		break;
> > > > > >  	}
> > > > > > -	dw_edma_core_ch_maybe_doorbell(chan);
> > > > > > -}
> > > > > > -
> > > > > > -static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
> > > > > > -{
> > > > > > -	unsigned long flags;
> > > > > > -
> > > > > > -	spin_lock_irqsave(&chan->vc.lock, flags);
> > > > > > -	dw_edma_done_interrupt_locked(chan);
> > > > > >  	spin_unlock_irqrestore(&chan->vc.lock, flags);
> > > > > >  }
> > > > > >
> > > > > > @@ -902,7 +1031,37 @@ static void dw_edma_ll_interrupt(struct dw_edma_chan *chan)
> > > > > >  	if (!dw_edma_ll_snapshot_take(chan, &snapshot))
> > > > > >  		return;
> > > > > >
> > > > > > -	dw_edma_done_interrupt_locked(chan);
> > > > > > +	if (chan->status == EDMA_ST_PAUSE)
> > > > > > +		return;
> > > > > > +
> > > > > > +	dw_edma_ll_consume_progress(chan, snapshot.idx);
> > > > > > +
> > > > > > +	if (snapshot.event == DW_EDMA_LL_EVENT_PROGRESS &&
> > > > > > +	    chan->request != EDMA_REQ_NONE)
> > > > > > +		goto out;
> > > > > > +
> > > > > > +	switch (chan->request) {
> > > > > > +	case EDMA_REQ_NONE:
> > > > > > +		dw_edma_start_transfer(chan);
> > > > > > +		chan->status = dw_edma_ll_pending(chan) ?
> > > > > > +			       EDMA_ST_BUSY : EDMA_ST_IDLE;
> > > > > > +		break;
> > > > > > +
> > > > > > +	case EDMA_REQ_PAUSE:
> > > > > > +		dw_edma_set_request(chan, EDMA_REQ_NONE);
> > > > > > +		chan->status = EDMA_ST_PAUSE;
> > > > > > +		break;
> > > > > > +
> > > > > > +	case EDMA_REQ_STOP:
> > > > > > +		dw_edma_finish_termination(chan);
> > > > > > +		break;
> > > > > > +
> > > > > > +	default:
> > > > > > +		break;
> > > > > > +	}
> > > > > > +
> > > > > > +out:
> > > > > > +	dw_edma_core_ch_maybe_doorbell(chan);
> > > > > >  }
> > > > > >
> > > > > >  static bool dw_edma_abort_interrupt(struct dw_edma_chan *chan)
> > > > > > @@ -965,21 +1124,44 @@ static void dw_edma_queue_irq_work(struct dw_edma_chan *chan,
> > > > > >  static void dw_edma_record_irq(struct dw_edma_chan *chan, unsigned int events)
> > > > > >  {
> > > > > >  	struct dw_edma_ll_snapshot snapshot = {
> > > > > > -		.event = events & DW_EDMA_IRQ_STOP ?
> > > > > > -			 DW_EDMA_LL_EVENT_STOP : DW_EDMA_LL_EVENT_PROGRESS,
> > > > > > +		.idx = -1,
> > > > > > +		.event = DW_EDMA_LL_EVENT_NONE,
> > > > > >  	};
> > > > > >  	unsigned int pending = 0;
> > > > > >
> > > > > >  	lockdep_assert_held(dw_edma_event_lock(chan));
> > > > > >
> > > > > > +	/*
> > > > > > +	 * Classify the LL event before normalizing its LLP sample to the
> > > > > > +	 * exclusive consumer boundary. Keep STOP even without a valid
> > > > > > +	 * boundary so deferred handling still sees that the run ended.
> > > > > > +	 */
> > > > > > +	if (!chan->non_ll &&
> > > > > > +	    (events & (DW_EDMA_IRQ_DONE | DW_EDMA_IRQ_PROGRESS |
> > > > > > +		       DW_EDMA_IRQ_STOP))) {
> > > > > > +		if ((events & DW_EDMA_IRQ_STOP) ||
> > > > > > +		    ((events & DW_EDMA_IRQ_DONE) &&
> > > > > > +		     dw_edma_ll_done_is_stopped(chan)))
> > > > > > +			snapshot.event = DW_EDMA_LL_EVENT_STOP;
> > > > > > +		else
> > > > > > +			snapshot.event = DW_EDMA_LL_EVENT_PROGRESS;
> > > > > > +
> > > > > > +		snapshot.idx = dw_edma_ll_recycle_idx(chan,
> > > > > > +						      dw_edma_core_ll_cur_idx(chan),
> > > > > > +						      snapshot.event);
> > > > > > +		if (snapshot.idx < 0 &&
> > > > > > +		    snapshot.event != DW_EDMA_LL_EVENT_STOP)
> > > > > > +			snapshot.event = DW_EDMA_LL_EVENT_NONE;
> > > > > > +	}
> > > > > > +
> > > > > >  	if ((events & DW_EDMA_IRQ_ABORT) && chan->abort_pending)
> > > > > >  		pending |= DW_EDMA_DEFERRED_ABORT;
> > > > > >
> > > > > > -	if (chan->non_ll) {
> > > > > > -		if (events & (DW_EDMA_IRQ_DONE | DW_EDMA_IRQ_STOP))
> > > > > > -			pending |= DW_EDMA_DEFERRED_DONE;
> > > > > > -	} else if (events & (DW_EDMA_IRQ_DONE | DW_EDMA_IRQ_PROGRESS |
> > > > > > -			     DW_EDMA_IRQ_STOP)) {
> > > > > > +	if (chan->non_ll &&
> > > > > > +	    (events & (DW_EDMA_IRQ_DONE | DW_EDMA_IRQ_STOP)))
> > > > > > +		pending |= DW_EDMA_DEFERRED_DONE;
> > > > > > +
> > > > > > +	if (snapshot.event != DW_EDMA_LL_EVENT_NONE) {
> > > > > >  		/* STOP is final for this run; do not replace it with progress. */
> > > > > >  		if (chan->ll_irq.event != DW_EDMA_LL_EVENT_STOP ||
> > > > > >  		    snapshot.event == DW_EDMA_LL_EVENT_STOP)
> > > > > > @@ -1227,6 +1409,7 @@ static int dw_edma_channel_setup(struct dw_edma *dw, u32 wr_alloc, u32 rd_alloc)
> > > > > >  		chan->irq_mode = dw_edma_get_default_irq_mode(chan);
> > > > > >  		INIT_WORK(&chan->irq_work, dw_edma_irq_work);
> > > > > >  		atomic_set(&chan->irq_pending, 0);
> > > > > > +		chan->ll_irq.idx = -1;
> > > > > >  		chan->ll_irq.event = DW_EDMA_LL_EVENT_NONE;
> > > > > >  		chan->abort_pending = false;
> > > > > >
> > > > > > diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
> > > > > > index d709aa274300..27cab6ca5e67 100644
> > > > > > --- a/drivers/dma/dw-edma/dw-edma-core.h
> > > > > > +++ b/drivers/dma/dw-edma/dw-edma-core.h
> > > > > > @@ -71,6 +71,7 @@ struct dw_edma_desc {
> > > > > >
> > > > > >  	u32				alloc_sz;
> > > > > >
> > > > > > +	u32				ll_start;	/* First outstanding LL entry */
> > > > > >  	size_t				done_burst;
> > > > > >  	size_t				start_burst;
> > > > > >  	size_t				nburst;
> > > > > > @@ -78,6 +79,7 @@ struct dw_edma_desc {
> > > > > >  };
> > > > > >
> > > > > >  struct dw_edma_ll_snapshot {
> > > > > > +	int				idx;
> > > > > >  	enum dw_edma_ll_event		event;
> > > > > >  };
> > > > > >
> > > > > > @@ -113,6 +115,7 @@ struct dw_edma_chan {
> > > > > >  	 * LL event recorded by the hard IRQ handler. The event lock
> > > > > >  	 * serializes its capture with a new hardware run; vc.lock serializes
> > > > > >  	 * its consumption with LL state.
> > > > > > +	 * Valid indices use the exclusive boundary convention of ll_done.
> > > > > >  	 */
> > > > > >  	struct dw_edma_ll_snapshot	ll_irq;
> > > > > >  	/* ABORT is terminal and remains pending across LL state changes. */
> > > > > > @@ -189,6 +192,7 @@ struct dw_edma_core_ops {
> > > > > >  	enum dma_status (*ch_status)(struct dw_edma_chan *chan);
> > > > > >  	/* Called with dw_edma_event_lock(chan) held. */
> > > > > >  	bool (*ch_abort_int_pending)(struct dw_edma_chan *chan);
> > > > > > +	u32 (*ch_transfer_size)(struct dw_edma_chan *chan);
> > > > > >  	irqreturn_t (*handle_int)(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
> > > > > >  				  dw_edma_handler_t handler);
> > > > > >  	void (*non_ll_start)(struct dw_edma_chan *chan, struct dw_edma_burst *child);
> > > > > > diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/dw-edma-v0-core.c
> > > > > > index 20dff21a0603..b9d6205157b3 100644
> > > > > > --- a/drivers/dma/dw-edma/dw-edma-v0-core.c
> > > > > > +++ b/drivers/dma/dw-edma/dw-edma-v0-core.c
> > > > > > @@ -318,6 +318,11 @@ static enum dma_status dw_edma_v0_core_ch_status(struct dw_edma_chan *chan)
> > > > > >  		return DMA_ERROR;
> > > > > >  }
> > > > > >
> > > > > > +static u32 dw_edma_v0_core_ch_transfer_size(struct dw_edma_chan *chan)
> > > > > > +{
> > > > > > +	return GET_CH_32(chan->dw, chan->dir, chan->id, transfer_size);
> > > > > > +}
> > > > > > +
> > > > > >  static bool dw_edma_v0_core_ch_abort_int_pending(struct dw_edma_chan *chan)
> > > > > >  {
> > > > > >  	u32 sts = GET_RW_32(chan->dw, chan->dir, int_status);
> > > > > > @@ -677,6 +682,7 @@ static const struct dw_edma_core_ops dw_edma_v0_core = {
> > > > > >  	.ch_count = dw_edma_v0_core_ch_count,
> > > > > >  	.ch_status = dw_edma_v0_core_ch_status,
> > > > > >  	.ch_abort_int_pending = dw_edma_v0_core_ch_abort_int_pending,
> > > > > > +	.ch_transfer_size = dw_edma_v0_core_ch_transfer_size,
> > > > > >  	.handle_int = dw_edma_v0_core_handle_int,
> > > > > >  	.ll_data = dw_edma_v0_core_ll_data,
> > > > > >  	.ll_link = dw_edma_v0_core_ll_link,
> > > > > > --
> > > > > > 2.51.0
> > > > > >
