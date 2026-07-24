Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012032.outbound.protection.outlook.com [52.101.66.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D0233A6E2;
	Fri, 24 Jul 2026 15:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784907416; cv=fail; b=dQR9NlYg0EbN6islGOgn6/x0zEGiEsmpaz2f1Ee5/qy2Nu5PYKXryKDqPXm/EowUPt34YTBlm0qinkePczbk9rNccHNcoAk96JzJC3lwGKQazxwdL8kSqGtXYa45rrKVFbyD+TEuXEGMY5MkzjKQnERHm8TKmC+GNolopXgk8bU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784907416; c=relaxed/simple;
	bh=nm6gbVc/SdKc9JA9x8Cf4rdcfbgZz5M6PDpJQng5cHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=t9a3bQi6T+7GxqIRKQkBBi1TPopilKEd+TD2xvnUTde2cBbLQsif3L0VzynxVlfLJtlgB6PT06c9OcUi9fVrDPOOkN76x9CM7QqP4I0NMEalSLeWkhSXbWivg9CVAweuMYpMZLHQUYP0rba2rgpxnmInYQbrkUHphyaf3pzrw8w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=u6aa7Qah; arc=fail smtp.client-ip=52.101.66.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="u6aa7Qah"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IRgKZWZWNAugX2ukzI/9mQqI5FyWP4WLo2jY5gwKYuuS4NOmN8jUwB9gPgjIMAHARWc8esN5zi32tB4zBliyj3NazbkHWqMpvQw+lzCj6RRYKAHABC8CKPZXTfYhWmYD50n7Ri3Nj/RwKeILZbQhVMGHlU1EcTsZVHaiepHEQRUGQf9mxWpudz6ushnxxNsRDiwqk3tNaEwCEGv5w4CNOwAM/ma35CttdrUxyDRqWsOV7Uh2ni0QaOkKCVS5OTqv2fu5Hmtc1acAoSNas8RB9ZboQi0n1c/cU+BvguQplQj37MQpw99+q7BvaJUUGqHEDpvE8+ZdJgO5KdNjeZXp4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4yF+hTg/Ans88wTlSZN7cmbgEQpqGtEcpJO9sUJmdUo=;
 b=NgGb6Bgl1BPF4a7ESEyFfp9BV/nji3iUgq1KPkB3ZGWg8w/n0pn2ABFlatVG3x8G4+6lo/yajesPZcO9sUnVok9WYjZEGeRRD+Zz0fKKO3XOysq8hVU8J7pV4CzCeVA1/RfReF8nyKbFFSTx2E04xiYntaYhvQGGbD20U2fqnyFkD4OcjN3I0gvNw+3e8yxYf3FdIdylgSKalcHOgsV1zBS20HeR08W30/PvXnJ7LvMkhHPzj8sonu+3puAOHyBtyMXn+G7mL1PbDPedLiw7wnX5X+moXlJEaHQNqqXy+R5QhRBVz2fZv5VCuTX8tFFfxINAMkLbazLJwiOF3s3EGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4yF+hTg/Ans88wTlSZN7cmbgEQpqGtEcpJO9sUJmdUo=;
 b=u6aa7Qah+nU9FFn721F9IgKzlralgBJzucoyuIAGusa9AMDvsXRbtnuEJksoMsiiDiL8EeqnZ1leMEzVe2HNJlgJ34rSNuNhS7H6KOGl/rKsXjFbUX7MdsHb8vr7Yhs4jA08qPcjGTA7Q+n6+3IWZWhQWIfP6EIYxWLvqiDr2aPLmjA6Vdlc4+DVEmKJv8lYvhNigHurr1cg/hFBtDdlD1oUuLUis5fHXmwW/PBxLqpgnuUOILLjwdh/cNdy0pewtLGI3tx9q3MSQ010tURmbnOmvmDnFXEGjrUBWkzCI4nyQgGPtcVoogtbEKD9rjcm4/k1dujTIYi3sEgkZabp9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB10104.eurprd04.prod.outlook.com (2603:10a6:800:248::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 15:36:50 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 15:36:50 +0000
Date: Fri, 24 Jul 2026 10:36:40 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Koichiro Den <den@valinux.co.jp>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
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
Subject: Re: [PATCH v2 05/19] dmaengine: dw-edma: Add LL interrupt placement
 policy
Message-ID: <amOGiJe8fVRoLCMQ@SMW015318>
References: <20260723084150.521366-1-den@valinux.co.jp>
 <20260723084150.521366-6-den@valinux.co.jp>
 <amJyWDdq7MBkoudf@SMW015318>
 <dbnylap6togkuwbgrnt4oors56c4litp7ndvfnbvgg4wynigtx@z4mrupqrd5sg>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dbnylap6togkuwbgrnt4oors56c4litp7ndvfnbvgg4wynigtx@z4mrupqrd5sg>
X-ClientProxiedBy: SA9PR13CA0070.namprd13.prod.outlook.com
 (2603:10b6:806:23::15) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB10104:EE_
X-MS-Office365-Filtering-Correlation-Id: bafae791-b856-436e-583a-08dee9996106
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|366016|7416014|376014|1800799024|10067099003|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	XxZYDQ1kQiSAD/WTB7rYOQoWezIw9AAz6f6HjMX+GOZEPSWVC9jA4ay3ZL7l8WrndXyXvyFT4yqRabkFgh2m3jQ/LGJPfer9OdkhC1JSDZ8LDMeHiFwdrnDKs6Z8p/rCTcSjYG7sxxy7574h4jmq5Pa6f6I4pgJvgAkB/pOSlw/81RL8K8pm1UJJc+IPt//QVw0MPneHyBxHp+Ud+bqOa3eEZCTrn9zKSzvHaf8Bi9WVAgGRcavlQBG04Tqk5tGuCtYR62niiuLOoNFr20x/qbrxpScwXNoPIZIRYbePEaNeAbJ8lJVy1j21vh2hdCNQwdfiXYj+PG7fWaQVZBzfid61aDZoLD01hAEQzKd6m9br2n5LiHFMzcM/ZzdFFOtB8kSf4vqQ9vvrwU2dnT4zAHaImOSBjJ0HCh7U+ZXOygmkOBHqmxPXrJXcfSdOhuJxX9L3G9GK5WLj04XdrZA3WN+bxmpb+E+MSA7LKLYFlJKen1sC5XNO9Npwc+d+cM45mr3PsNJKhXOBkqMQXj9+2UflPvJo8AC3OcsWYmMiTyv75TETtoX73gyW6lCg1xUNx+1+lN0mOUYeNxITmqybkK1TPP6Deh/dx/2W4QYiWFPUfsS8MYZQWkjJe3YuImwQ9BgANtJG6OzUcf0ej7NicmQyK9HyY2fy0RCIx6gtmZE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(366016)(7416014)(376014)(1800799024)(10067099003)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LycIjG73OwVJbRjavm2H5lbXi0noXeiX165D4Z3rnKCVlP5p8anig0NXopXh?=
 =?us-ascii?Q?1zmfz7rG403PAX23v/DoJe2UCRtpF2PwnCQ/GdyRvtKlO9N1BCwuzs5HPETh?=
 =?us-ascii?Q?UvWuktW+HXmD/syDP5NGWCVbziqGBO+6X9Wdd72mUWTAbQT302WLLwLX52Je?=
 =?us-ascii?Q?ENdnaUaWrHRqonpkpKDWLoHPWITrEAtlEeWj2hwJCLze6uheS/BN+3XsLVcD?=
 =?us-ascii?Q?Y4v/pDG5p1xfwdIgNR1C4bl16SdFjuZXGWkGYdaCaXOIZih9icyLiuZX9Xby?=
 =?us-ascii?Q?oxLAvWdIeG4W5svHg6FPH7z/lz8RBrMt0JCLMGOUe4lCf9DgcCRmYNEjJv42?=
 =?us-ascii?Q?WOMThZGfnkmR8V4xfWR7jsURfwxhTzF5j2UmH13GtFiFTBWo9LFYDJLyM1Aa?=
 =?us-ascii?Q?iQTeoRhhH3b2gl6rTLa94ifYe7Oj6nG270KegVh5GwVOzCfCdRh+xhC1A7w5?=
 =?us-ascii?Q?LQeGpJti1rMEzbDvfHG5dDwr0SbXQpYD4SIRD8yj7/rtJPrHV8LPcMtTsKzY?=
 =?us-ascii?Q?b+QfZISPGg6UY9OJZvEwLyrqozLALjBkA73syCouXKzZdSte5WYeUB25zJqF?=
 =?us-ascii?Q?RtfjOs0iwdbf1gXRuV6VA5g3gdNFGNG5FZ9io2DVIJYI6LMh+1ocsk8NGW3u?=
 =?us-ascii?Q?cbzIxgvkTBIWcMKOZC0iLmkjtsgVmjvzjGRAHTDN8+seFhpqJk1Cb0ZzQcA/?=
 =?us-ascii?Q?uzeqhQ7O9Brz0FFu636eXE1Eb/+C3SHjysXb0EY5xHXFtftLhEic9SUkyc5y?=
 =?us-ascii?Q?OyYQOJ+tAlAxxwuWvWZASaJa9VM1DmFbRRvmK40uH5928jTAQbME4OGx+/vG?=
 =?us-ascii?Q?q0edHKD4QBrcFP3TSo4C+Zx0Q8rnkrwQwOFrFCSkgdyvRA7u5+Y0ypCZ32/f?=
 =?us-ascii?Q?xEiV4MOieH+cY6EBNH4jmg4z4vwoj7Sm0lm9fsjdZpsyFiyE5I/4Y4RUAMwA?=
 =?us-ascii?Q?iY7G5UhJME1jUp97h0CEQCm87Ca5igaL6tN/+UEEUU9OgIqIHi84NJoe7Vo4?=
 =?us-ascii?Q?4pRWS6UD5d55HpLSN7Rvy0qffylv2ZPjuH7JugfoGfEqOla0HZIuulYjHIF5?=
 =?us-ascii?Q?H7PZaTP0w3wfCAtYxMv5orPjhg6lcSju2839r5hfuSEYWkGWU8769Zgk6Pil?=
 =?us-ascii?Q?wQuPyrmtPkMIUW20ZkwN+zSHNeZ+yfVgUyuIEVWtktbHCJB6NXzIHPfcqOku?=
 =?us-ascii?Q?mpkDivLJc/nuTLsri+BwJIIieLDsOADUrT+Xg0Qc0ShAT3c/1WmEzIOY/lmq?=
 =?us-ascii?Q?qcDzX7EW9RWGgS0NxboJ1K40m8K89+BNmpAsDAACUI/6/5qIwI6rNCG6YQ+k?=
 =?us-ascii?Q?Q8lO0FwBMovCdAOPMCnle+rlUMoPbmLZ5Kg1qHp0wvFpv2rAhF/YuP8YFJQF?=
 =?us-ascii?Q?FTgSco+JQ8I0uKn9fyYyAbQxWtM/kq5aK5C96cimssuXMRdbOTJaCysuWOOw?=
 =?us-ascii?Q?iCDVc++w4u3n1F0W5mEYCy+pf83n5oGgDgBBsAFAg06jEs392JbEjcefET+o?=
 =?us-ascii?Q?WbYS9rgEtZNSgx4C7uCiGkDwFyg8QUwRy63b6CWPjx0pJiJ49oEwdajoauJG?=
 =?us-ascii?Q?5bX6/J7IxZKsAry2+ET6b68B//ELrUCr+6RoUl0nUX8uTOGD5JHrBagV822R?=
 =?us-ascii?Q?8Fxp/H/zQR81aaIjAaLiK9tseYOON7aD1Hp4+60/xMgQwDjZN5wEvSltoXS9?=
 =?us-ascii?Q?kUmG2MtLeUz8+OOYMWhuEk2vtalklXxsCZ9TMj+VMJtXq9MHwuN7B9D2xmb2?=
 =?us-ascii?Q?dJXJ9BugJIySz4Z6mN3MhIxHok5DfCpljkrS4YNWTBQvvE5KaU6l?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bafae791-b856-436e-583a-08dee9996106
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 15:36:50.2915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DYSKJWIxtCvIdIzrQuj9BwXQiD7MgqpnslEKYaUr82+U3YNG+gmMfiTPr3stHeQRwkuPuQSICpl4BEnNNRSUjKBvNHRiITsNek6WovwVtANDuqE3LRsWervHlNMORNLc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10104

On Fri, Jul 24, 2026 at 02:46:23PM +0900, Koichiro Den wrote:
> On Thu, Jul 23, 2026 at 02:58:16PM -0500, Frank Li wrote:
> > On Thu, Jul 23, 2026 at 05:41:36PM +0900, Koichiro Den wrote:
> > > Move linked-list interrupt placement behind a core callback so eDMA and
> > > HDMA can use different policies.
> > >
> > > Keep the eDMA behavior. For HDMA, place watermarks at descriptor ends,
> > > before link entries, and every four entries when a descriptor exceeds the
> > > usable ring capacity or another issued descriptor follows. A later patch
> > > handles these watermarks as progress events.
> > >
> > > Four entries is an empirically chosen coalescing interval.
> > >
> > > Signed-off-by: Koichiro Den <den@valinux.co.jp>
> > > ---
> > > Changes in v2:
> > >   - Fix the zero-based interval so the first watermark is on the fourth
> > >     entry, not the fifth.
> > >   - Revise the commit message and source comments.
> > >
> > >  drivers/dma/dw-edma/dw-edma-core.c    |  8 +++++++-
> > >  drivers/dma/dw-edma/dw-edma-core.h    |  2 ++
> > >  drivers/dma/dw-edma/dw-edma-v0-core.c | 10 ++++++++++
> > >  drivers/dma/dw-edma/dw-hdma-v0-core.c | 28 +++++++++++++++++++++++++++
> > >  4 files changed, 47 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> > > index a9f25a65294e..78d1bb6302fb 100644
> > > --- a/drivers/dma/dw-edma/dw-edma-core.c
> > > +++ b/drivers/dma/dw-edma/dw-edma-core.c
> > > @@ -98,6 +98,12 @@ static u32 dw_edma_core_get_free_num(struct dw_edma_chan *chan)
> > >  		chan->ll_max;
> > >  }
> > >
> > > +static bool dw_edma_core_enable_ll_irq(struct dw_edma_desc *desc, u32 i,
> > > +				       u32 free)
> > > +{
> > > +	return desc->chan->dw->core->ll_irq(desc, i, free);
> > > +}
> > > +
> > >  static void dw_edma_core_ll_start(struct dw_edma_desc *desc)
> > >  {
> > >  	struct dw_edma_chan *chan = desc->chan;
> > > @@ -120,7 +126,7 @@ static void dw_edma_core_ll_start(struct dw_edma_desc *desc)
> > >
> > >  		dw_edma_core_ll_data(chan, &desc->burst[i],
> > >  				     chan->ll_head, chan->cb,
> > > -				     i == desc->nburst - 1 || free == 1);
> > > +				     dw_edma_core_enable_ll_irq(desc, i, free));
> > >
> > >  		chan->ll_head++;
> > >
> > > diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
> > > index f2c2d5af1fff..8ed37e8a12cb 100644
> > > --- a/drivers/dma/dw-edma/dw-edma-core.h
> > > +++ b/drivers/dma/dw-edma/dw-edma-core.h
> > > @@ -162,6 +162,8 @@ struct dw_edma_core_ops {
> > >  	void (*ll_link)(struct dw_edma_chan *chan, u32 idx, bool cb, u64 addr);
> > >  	void (*ll_clear)(struct dw_edma_chan *chan, u32 idx);
> > >  	int (*ll_cur_idx)(struct dw_edma_chan *chan);
> > > +	/* Called with chan->vc.lock held. */
> > > +	bool (*ll_irq)(struct dw_edma_desc *desc, u32 i, u32 free);
> > >  	void (*ch_doorbell)(struct dw_edma_chan *chan);
> > >  	void (*ch_enable)(struct dw_edma_chan *chan);
> > >  	void (*ch_config)(struct dw_edma_chan *chan);
> > > diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/dw-edma-v0-core.c
> > > index c31fff095b4f..62141aa32e50 100644
> > > --- a/drivers/dma/dw-edma/dw-edma-v0-core.c
> > > +++ b/drivers/dma/dw-edma/dw-edma-v0-core.c
> > > @@ -649,6 +649,15 @@ static int dw_edma_v0_core_ll_cur_idx(struct dw_edma_chan *chan)
> > >  	return (val - base) / EDMA_LL_SZ;
> > >  }
> > >
> > > +static bool dw_edma_v0_core_ll_irq(struct dw_edma_desc *desc, u32 i, u32 free)
> > > +{
> > > +	/*
> > > +	 * eDMA reports LL interrupts through DONE. Keep them at
> > > +	 * descriptor ends, plus the last free slot to refill the ring.
> > > +	 */
> > > +	return i == desc->nburst - 1 || free == 1;
> > > +}
> > > +
> > >  /* eDMA debugfs callbacks */
> > >  static void dw_edma_v0_core_debugfs_on(struct dw_edma *dw)
> > >  {
> > > @@ -685,6 +694,7 @@ static const struct dw_edma_core_ops dw_edma_v0_core = {
> > >  	.ll_link = dw_edma_v0_core_ll_link,
> > >  	.ll_clear = dw_edma_v0_core_ll_clear,
> > >  	.ll_cur_idx = dw_edma_v0_core_ll_cur_idx,
> > > +	.ll_irq = dw_edma_v0_core_ll_irq,
> > >  	.ch_doorbell = dw_edma_v0_core_ch_doorbell,
> > >  	.ch_enable = dw_edma_v0_core_ch_enable,
> > >  	.ch_config = dw_edma_v0_core_ch_config,
> > > diff --git a/drivers/dma/dw-edma/dw-hdma-v0-core.c b/drivers/dma/dw-edma/dw-hdma-v0-core.c
> > > index b2d35f0b7b6d..fb651a83f0f3 100644
> > > --- a/drivers/dma/dw-edma/dw-hdma-v0-core.c
> > > +++ b/drivers/dma/dw-edma/dw-hdma-v0-core.c
> > > @@ -13,6 +13,9 @@
> > >  #include "dw-hdma-v0-regs.h"
> > >  #include "dw-hdma-v0-debugfs.h"
> > >
> > > +/* Empirically chosen watermark interval. */
> > > +#define HDMA_V0_WATERMARK_INTERVAL			4
> > > +
> > >  enum dw_hdma_control {
> > >  	DW_HDMA_V0_CB					= BIT(0),
> > >  	DW_HDMA_V0_TCB					= BIT(1),
> > > @@ -417,6 +420,30 @@ static int dw_hdma_v0_core_ll_cur_idx(struct dw_edma_chan *chan)
> > >  	return (val - base) / EDMA_LL_SZ;
> > >  }
> > >
> > > +static bool dw_hdma_v0_core_ll_irq(struct dw_edma_desc *desc, u32 i, u32 free)
> > > +{
> > > +	struct dw_edma_chan *chan = desc->chan;
> > > +	bool needs_progress;
> > > +
> > > +	/*
> > > +	 * Always place a watermark at a descriptor end and before the link
> > > +	 * element. The first reports descriptor progress; the second provides
> > > +	 * one progress point per ring lap.
> > > +	 */
> > > +	if (i == desc->nburst - 1 || chan->ll_head == chan->ll_max - 1)
> > > +		return true;
> > > +
> > > +	/*
> > > +	 * Use periodic watermarks when a descriptor exceeds the usable ring or
> > > +	 * when more issued work follows it.
> > > +	 */
> > > +	needs_progress = desc->nburst > chan->ll_max - 1 ||
> > > +			 !list_is_last(&desc->vd.node, &chan->vc.desc_issued);
> > > +
> > > +	return needs_progress &&
> > > +	       (chan->ll_head + 1) % HDMA_V0_WATERMARK_INTERVAL == 0;
> >
> > This is not good layer design. edma/hdma supposed just do action to operate
> > register, less software logic.
>
> Indeed, thanks for pointing that out.
>
> >
> > Can we move this code to core layer?  introduce an 'interval' for difference
> > backend.
> >
> > eDMA: interval is number description.
> > hDMA: interval is HDMA_V0_WATERMARK_INTERVAL
>
> Sorry, by "eDMA: interval is number description", do you mean using desc->nburst
> as the "interval", so eDMA keeps one interrupt at the end of each descriptor?

Yes, of cource, you also can periodic interval check eDMA if want.

Frank

>
> >
> > So core layer can use unified logic to handle for both eDMA and hDMA?
>
> I'll move as much of the software policy as possible into the common core. I
> think even the periodic interval and descriptor-end placement can be shared.
> I'll rework this part and verify it with performance tests.
>
> Thanks for the review and suggestion. Much appreciated.
> Koichiro
>
> >
> > Frank
> >
> > > +}
> > > +
> > >  /* HDMA debugfs callbacks */
> > >  static void dw_hdma_v0_core_debugfs_on(struct dw_edma *dw)
> > >  {
> > > @@ -441,6 +468,7 @@ static const struct dw_edma_core_ops dw_hdma_v0_core = {
> > >  	.ll_link = dw_hdma_v0_core_ll_link,
> > >  	.ll_clear = dw_hdma_v0_core_ll_clear,
> > >  	.ll_cur_idx = dw_hdma_v0_core_ll_cur_idx,
> > > +	.ll_irq = dw_hdma_v0_core_ll_irq,
> > >  	.ch_doorbell = dw_hdma_v0_core_ch_doorbell,
> > >  	.ch_enable = dw_hdma_v0_core_ch_enable,
> > >  	.ch_config = dw_hdma_v0_core_ch_config,
> > > --
> > > 2.51.0
> > >
