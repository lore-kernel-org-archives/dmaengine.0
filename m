Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11020101.outbound.protection.outlook.com [52.101.228.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59042F7EF7;
	Fri, 24 Jul 2026 05:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784870255; cv=fail; b=o5hWdlYk+3uw8QZZ8ZisF+LRVugU1xZnxFXsHy1SWHFSsXnFZjrzHl2l0s5/q2BSzH7g/3MAwB4fPi/FeVXNGP0ry3PyZjMLysbbiHDwULBG2Ab6ZFgihh9q1bLibys6WQLcc6/FDKH0VLl08yt54G0z228OaXxNUQZEsomhXsU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784870255; c=relaxed/simple;
	bh=UcdvArU32ozKD3LrBJTzZ1PzJuvwPXCW4IyVX1VLJ60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nj77K9V1SKjtuq5Xtl3hu4lEbtDFhCRenXrklBmxlu+v3FX5idY127/DyaGvh2GjazlC7Z9aRI+Et5RLbcgoa/ga1bThv1wqr+LA011Ico7sacd6fFDPjutjHbl4ZAVmNGKAj+2ZOnF0xCTMvBG8ZJEKhCu/C52PdNq6CIt6CQ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=Om7c6ptD; arc=fail smtp.client-ip=52.101.228.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="Om7c6ptD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GW0M7Hu6Tk4FtrdpgGnTnS4RKJMYGx0D7PzBRiN0DYrLhtyRQ8BbFnLC4QGRHkVeLqNOWVKGU8c4e7GTwj2EABNJnCgXQsA8v+zbvypgHROwTEpB9P7gBNp4THiNJ0kdAXxl2XUMDJcuf+FvbNyhsgW2KQBs3IWoXJh9sgD3Khh8qw/0EfGP+9BDPI5UjIT8CO9KIMYYUNvC4iVqKPYzHK1QamOe79t4dD+m7XvKhHVHfovY/AVvMZB+XjWkclWcliapHCf7wqCIVrM/f/3c8aX+pvsQTG1jYaQiQS8o3MFqrnph80P31i2TA/UpyrupSgTdjOTpp4mLJVCDh/3YmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dRHQrZLZ3pw9k75Ht7Wu9OcKnGM9xrtQgLWCfatAc6I=;
 b=V83csgTlt/WCoo4IzVKEpJK5z4FAaSy2xEOPwZ8DTvnvW/sfprFNR2BXRRv9jxqjR2CmesCMF7e00Elsurkk7FCsTFkzJ1j5O/Kmm2HpDgqqIR5MWi+sfTXJ2ZsQ5G6U2Y9CKrdrLehcjmDd5QzoGca3yaQ4Y92fhd5wwn5BuOfo4+EGPeceaitjI77Rhna0TF/R12hkG9ws8mz4HcJprmsIpT1YwCJpGXlTU3n41rVDAGewwglqG78p3nHH8oMw2LQ6PZU/qF28iWuT0D/czD7XdwnRZIKryBvgCFj7YCL4GlpPSDX2ndv3BYA1C4k7BvNbFbGV/41pG1XjIt+Dvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dRHQrZLZ3pw9k75Ht7Wu9OcKnGM9xrtQgLWCfatAc6I=;
 b=Om7c6ptD2RnGnO8fGGj2k2ZCx2OpwwdeUkKWpdlYmRWLC9IvPdYyaDYtB5hTSS5ZW1XRT3b6Hjdy+AzJ4KZ+2p9M0ZMTOwbe+sv3tUQDc7EH7ra09UTwWaYX1XszDaUH6KZJg/U0SBrHZ+v37yHpnfA0h7TxcTnfQSogBGrmMHA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OS7P286MB7745.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:461::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 05:17:29 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 05:17:29 +0000
Date: Fri, 24 Jul 2026 14:17:28 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>, 
	Kees Cook <kees@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Christoph Hellwig <hch@lst.de>, Serge Semin <fancer.lancer@gmail.com>, 
	Cai Huoqing <cai.huoqing@linux.dev>, Niklas Cassel <cassel@kernel.org>, 
	Devendra K Verma <devendra.verma@amd.com>, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 09/19] dmaengine: dw-edma: Reclaim issued descriptors
 from IRQ-paired LL progress
Message-ID: <svtmbx6qd3up3zx2pkv43d3iazx5cm3fseg5ft6c53v5bev5dl@j7pqdov5mznr>
References: <20260723084150.521366-1-den@valinux.co.jp>
 <20260723084150.521366-10-den@valinux.co.jp>
 <amJ_6jurELEeuMDt@SMW015318>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amJ_6jurELEeuMDt@SMW015318>
X-ClientProxiedBy: TYCPR01CA0181.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::10) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OS7P286MB7745:EE_
X-MS-Office365-Filtering-Correlation-Id: 11e22a1a-7da6-4582-e477-08dee942dbc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|23010399003|366016|376014|7416014|10067099003|4143699003|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	phOAEDXGeLio0OEbFHGjdTue9Qpv8OTOT9oXu64TUvmYrVKPhN45VuO2mBVN+N4LifQWXhWnvsEf3I3UgY6YL4gdVEK//6CsDo/foa/IAsjaEokE7Ik94a4x/cIdN+d6F9tCW5s+436DVimDZtP01Ikn0BwwKCciJ6E/JVg/yRqF0anp7kM5ttLhq1gLi/vemgYP6333ColQVlUSNpRNPpbX89Pm3pyzXgiu/PWejDrwRwf/oinY/fmRPWG7R31EEPMHr1qggayap+H25eXuCu+RP0DgghB9c0wK+V9xqQGLxAg5RPKZilwklzRBLqmxEVbDagHDrZro5KvxJtVtKSAcoL5UOcTetC3BTY1vjTiYaV1aOAMOe5XUWicCFfEP5DXgeMMfaKeIei1pvcXTwwj3CP71FbvLbwrHV7glVkDbsrGRSQ7y+cFN/3uE/e2a3Bx2mfMxY+S7uEKf51Ytd0T/WePaziK/arlrW5sdAC0+ATW+HVqjjXA33/kkfuTMGXdoFpnVQeip9tywosEb4XvQeln7wLIux4zlJV7JG7qUdwOCMkpSpRgLbepTsezn8g4+sHEBIKJeeXYO8qRx7HS9D9oK/uTRnLYGguVWxSnJDSaWz/SYSzim6QUU8jDDx9gr2uih9Xgbmtjg0f25NHntRq7IcgHyhLehA39xi8M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(23010399003)(366016)(376014)(7416014)(10067099003)(4143699003)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uoLMT51AFumjp9/mrpDYALHaRfAHgmxT2q6ppmLvqMLTGUH6Pkkaw4sssX+P?=
 =?us-ascii?Q?rLKEtkNpNixNtpl1iSiZF+dTK9yq9OPoID9Tji0zV3OpgseHJp7XcXoUsFwq?=
 =?us-ascii?Q?Bpoycca33JfPKDr/HNF0gF6kHTecaonNA8+ube8BOAoeEfX2As4hd/qRqoZq?=
 =?us-ascii?Q?//gDBCWudeEtOcdzDwIZMg/ZO1wEWHXJNx6bwZgaCCXJU316bZ8GbRs+CsfL?=
 =?us-ascii?Q?RZQO7B/p4HEvYUYewtckGGgZ+1TXDmfb1HifeC1kv2qhFv7Nl7k8DiVIVMJt?=
 =?us-ascii?Q?fv7qVsMTE9iSDLN6wFo/LURHmo1BKeV5gCsvM1Z26mDiiTM4F+I3VJKpIrwb?=
 =?us-ascii?Q?/zVzukVhdy8GQAo8Z7mDbDewumJARWUPT8da2R03Q7caV8QfRB7joecrIJGY?=
 =?us-ascii?Q?SaetFiW0enigM8veamRp8gX6wl6gnKIGwtvTypMIYS69n2WR4nB0LIlCch8L?=
 =?us-ascii?Q?FLDN+xY4dimrtae2GdijjGwRgedr5nlMj/RFHYg+D1kNjjh700jV4KwE9RL1?=
 =?us-ascii?Q?/N5nhthhXcJ30kbkk1L0AIxQECsIg01HKwzq4DUdF+RYYNnNeDS/N4SPLM4C?=
 =?us-ascii?Q?c84vFadkE2IfYgP1dziBMjvU9z6Js4e33cpL0hLAqd4ZrrVnBHo7YwZmLmA7?=
 =?us-ascii?Q?HkDffPYfJSQ1yE3/r2Gri1dcjWPqE4kqFuVDGteVVPErru2eUgWMqDF1NYTW?=
 =?us-ascii?Q?dgAFFHERNdrxhleNT/2sRBXPULzgcu5lkoDmm1vYU1m9wtKzgCexbTZYJ9Qq?=
 =?us-ascii?Q?JW9HuXeBvV4xkv/X6tckm9v23TxLjm6IeZm4e6p2Lwd7RQNK/9GGGTCDxJ+G?=
 =?us-ascii?Q?m6BHeaLcit1lfBrgsb3Q1lK9pJVNiYlBQYlsgq29wbsFAY9rzBbwIP0iFajd?=
 =?us-ascii?Q?CydM37Hk7WtA87zrPBn7kQHh3fV8bXEzllQKhhYx92OzqmIGi3wfZgoVB/5U?=
 =?us-ascii?Q?Hcos4qpmoJLNXTykn+aLZy5p3KPAp7EBCbVwaaO3lEOy2r8qO9/4Pc0JLzG6?=
 =?us-ascii?Q?Kl8vhDPOnCWvNAM1TiwXz61D5T9+Eee76/BTPo8nFayHMzT93TA42/v3XVBX?=
 =?us-ascii?Q?SfUkjZcd1XOYRmxzilFSEFVJ/LWX6q6rbzuZVc0GBCzm2X4lCN6SrWrB8qFY?=
 =?us-ascii?Q?9LxykqCyrMCUPpBRoXsSljXIbzHBfmXsVg/r7tnyxQ52A1S55l4D5H2CgOiB?=
 =?us-ascii?Q?+ytWgS4vvZ+RMzZyH3m5Q55n9g1Iocoq+T9DD+gWKuaKraXQ7IAPF+OhVRcy?=
 =?us-ascii?Q?oCSsqfPdcoNjA9Q818DIOGQij0EHpM5NrWwDIEqxIQxKIctBEPgb+6QOkqWy?=
 =?us-ascii?Q?Di3Y6kKK0Qk81/ACP2pkYmShe1RblO1fQYfoVoryxyr2VQ6+Fq25hzPuXzgz?=
 =?us-ascii?Q?qkcS8Oxe3ZIcODloM+wEbDkMbFsWqgaVKLRm12wifIXYMNAdJKGNhbFd3iva?=
 =?us-ascii?Q?fg4iDgSA5jXItVG53GZur+wuWBNbiHd7ZzIlVOkO5kt7leX0dlm0nMqa/TE/?=
 =?us-ascii?Q?EyNyiKm0jVL9N+zIuYAT5Z8nvIXEBcai2AzTkGOFg3S9wcwoeHjuk5InEbRs?=
 =?us-ascii?Q?FBIFgnE7favMFS/IlHwAK52uCoZy9eeeq/qREFWjFHVJ+G9zCCtpcVXo527/?=
 =?us-ascii?Q?uacH82NXX/Z/OsBzDGXMh5i6hPHRBooN4fIS4lxq+C4ST147T/fXap+g+BQ3?=
 =?us-ascii?Q?ULrx4FYjEJDx9MlLxFKjnSf9fB4u2CpLxdoLBJWymlL26uAooftagpTT8gBL?=
 =?us-ascii?Q?rPzcp10zn3PISQaZyqDLivWJ+QLkEuYBmNgMQ6aFkCCiJ2yWV3QS?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 11e22a1a-7da6-4582-e477-08dee942dbc7
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 05:17:29.8491
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tPGgGgVHa6809LOR8fiu9SQato3H7z6EAgYcs6Hy+xxHMNR68a/z9dPI9+nPSYc8K9OBV77uL5I+fwM/o7n/Bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB7745

On Thu, Jul 23, 2026 at 03:56:10PM -0500, Frank Li wrote:
> On Thu, Jul 23, 2026 at 05:41:40PM +0900, Koichiro Den wrote:
> > Dynamic append can put entries from several descriptors in the ring.
> > Track the consumed boundary in ll_done, reuse consumed entries, and
> > complete descriptors in issued order. Keep one data entry free so a
> > physical index is unambiguous within the active producer window.
> >
> > Sample DMA_LLP in the hard IRQ under vc.lock after clearing status, then
> > normalize it to the exclusive boundary used by ll_done. A deferred read
> > could attach progress to the wrong interrupt.
> >
> > A stopped sample points to the next entry. Keep a running sample one
> > entry behind because legacy eDMA fetch can advance DMA_LLP before payload
> > completion. The following HDMA watermark patch uses the same conservative
> > boundary. Handle EDMA_REQ_STOP and EDMA_REQ_PAUSE even if progress empties
> > the issued list.
> >
> > Suggested-by: Frank Li <Frank.Li@nxp.com>
> > Signed-off-by: Koichiro Den <den@valinux.co.jp>
> > ---
> > Changes in v2:
> >   - Replace ll_end completion accounting with ll_done progress tracking.
> >   - Sample and normalize DMA_LLP in the hard IRQ; v1 read it from deferred
> >     consumers.
> >   - Use the raw next-entry boundary for stopped samples and keep running
> >     samples one entry behind it.
> >   - Handle STOP and PAUSE after progress empties the issued list.
> >
> > Frank, dw_edma_ll_clean_pending() is based on the idea in your RFT,
> > although the implementation has changed substantially. Please let me
> > know if you would prefer different attribution other than Suggested-by.
> >
> >  drivers/dma/dw-edma/dw-edma-core.c    | 248 ++++++++++++++++++++++----
> >  drivers/dma/dw-edma/dw-edma-core.h    |  32 ++--
> >  drivers/dma/dw-edma/dw-edma-v0-core.c |  10 +-
> >  drivers/dma/dw-edma/dw-hdma-v0-core.c |   4 +-
> >  4 files changed, 250 insertions(+), 44 deletions(-)
> >
> > diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> > index e88bfb417ad4..44a0ff906f2f 100644
> > --- a/drivers/dma/dw-edma/dw-edma-core.c
> > +++ b/drivers/dma/dw-edma/dw-edma-core.c
> > @@ -51,13 +51,6 @@ dw_edma_alloc_desc(struct dw_edma_chan *chan, size_t nburst)
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
> > @@ -73,6 +66,12 @@ static void vchan_free_desc(struct virt_dma_desc *vdesc)
> >  	kfree(vd2dw_edma_desc(vdesc));
> >  }
> >
> > +static void dw_edma_ll_irq_idx_discard(struct dw_edma_chan *chan)
> > +{
> > +	chan->ll_irq_idx = -1;
> > +	chan->ll_irq_stopped = false;
> > +}
> > +
> >  static void dw_hdma_set_callback_result(struct virt_dma_desc *vd,
> >  					enum dmaengine_tx_result result)
> >  {
> > @@ -103,7 +102,8 @@ static void dw_edma_core_reset_ll(struct dw_edma_chan *chan)
> >  	u32 i;
> >
> >  	chan->ll_head = 0;
> > -	chan->ll_end = 0;
> > +	chan->ll_done = 0;
> > +	dw_edma_ll_irq_idx_discard(chan);
> >  	/* Drop stale CB bits before reusing the circular LL ring. */
> >  	for (i = 0; i < chan->ll_max; i++)
> >  		dw_edma_core_ll_clear(chan, i);
> > @@ -116,11 +116,26 @@ static void dw_edma_core_reset_ll(struct dw_edma_chan *chan)
> >  	chan->ll_valid = true;
> >  }
> >
> > +static u32 dw_edma_core_get_ll_dist(struct dw_edma_chan *chan, u32 from, u32 to)
> > +{
> > +	return (to + chan->ll_max - from) % chan->ll_max;
> > +}
> > +
> > +static u32 dw_edma_core_get_used_num(struct dw_edma_chan *chan)
> > +{
> > +	return dw_edma_core_get_ll_dist(chan, chan->ll_done, chan->ll_head);
> > +}
> > +
> >  static u32 dw_edma_core_get_free_num(struct dw_edma_chan *chan)
> >  {
> > -	/* Keep one data entry free so equal indices mean an empty ring. */
> > -	return (chan->ll_end + chan->ll_max - 1 - chan->ll_head) %
> > -		chan->ll_max;
> > +	/*
> > +	 * Measure occupancy from ll_done: entries consumed by the
> > +	 * hardware can be reused even if the descriptor that owns them has not
> > +	 * completed yet; this lets descriptors larger than the ring move forward.
> > +	 *
> 
> not sure what means of this comments

What I meant is that ring-slot reclamation is no longer tied to completion of
the descriptor. ll_done advances per consumed entry, so a descriptor that only
partly fits in the current free window can continue as those entries are
recycled.

The comment is not very clear, though. Would this be better?

  /*
   * ll_done is the consumer boundary, so only the distance from ll_done
   * to ll_head is occupied. Descriptor completion is tracked separately
   * with done_burst.
   *
   * Keep one data entry free so equal indices mean an empty ring.
   */

> 
> > +	 * Keep one data entry free so equal indices mean an empty ring.
> > +	 */
> > +	return chan->ll_max - 1 - dw_edma_core_get_used_num(chan);
> >  }
> >
> >  static bool dw_edma_core_enable_ll_irq(struct dw_edma_desc *desc, u32 i,
> > @@ -129,9 +144,51 @@ static bool dw_edma_core_enable_ll_irq(struct dw_edma_desc *desc, u32 i,
> >  	return desc->chan->dw->core->ll_irq(desc, i, free);
> >  }
> >
> > +static bool dw_edma_ll_advance(struct dw_edma_chan *chan, int idx, u32 *old_done)
> > +{
> > +	u32 done;
> > +
> > +	if (idx < 0 || (u32)idx >= chan->ll_max)
> > +		return false;
> > +
> > +	done = dw_edma_core_get_ll_dist(chan, chan->ll_done, idx);
> > +	if (!done || done > dw_edma_core_get_used_num(chan))
> > +		return false;
> > +
> > +	*old_done = chan->ll_done;
> > +	chan->ll_done = idx;
> > +
> > +	return true;
> > +}
> > +
> >  static bool dw_edma_ll_pending(struct dw_edma_chan *chan)
> >  {
> > -	return chan->ll_head != chan->ll_end;
> > +	return dw_edma_core_get_used_num(chan);
> > +}
> > +
> > +static u32 dw_edma_core_ch_transfer_size(struct dw_edma_chan *chan)
> > +{
> > +	if (!chan->dw->core->ch_transfer_size)
> > +		return U32_MAX;
> > +
> > +	return chan->dw->core->ch_transfer_size(chan);
> > +}
> > +
> > +static bool dw_edma_ll_irq_is_stopped(struct dw_edma_chan *chan, bool stopped)
> > +{
> > +	if (stopped)
> > +		return true;
> 
> look like strange, you pass stopped add check here.

Hm, right, 'stopped' looks like overloaded here. The passed true means that the
provider observed an explicit STOP event, while false means either a progress
event or an ambiguous eDMA DONE event.

I'll try to make the event semantics explicit in v3. rather than pass this as a
boolean.

> 
> > +
> > +	/*
> > +	 * Native HDMA reports STOP separately. The legacy interrupt interface
> > +	 * uses DONE for both progress and stop, so confirm a stopped boundary
> > +	 * with channel status and transfer size.
> > +	 */
> > +	if (!chan->dw->core->ch_transfer_size)
> > +		return false;
> > +
> > +	return dw_edma_core_ch_status(chan) == DMA_COMPLETE &&
> > +	       dw_edma_core_ch_transfer_size(chan) == 0;
> >  }
> >
> >  static void dw_edma_core_ll_start(struct dw_edma_desc *desc)
> > @@ -166,7 +223,6 @@ static void dw_edma_core_ll_start(struct dw_edma_desc *desc)
> >  		}
> >  	}
> >
> > -	desc->done_burst = desc->start_burst;
> >  	desc->start_burst = i;
> >  }
> >
> > @@ -235,6 +291,110 @@ static void dw_edma_terminate_all_descs(struct dw_edma_chan *chan)
> >  	dw_edma_terminate_vdesc_list(&chan->vc.desc_submitted);
> >  }
> >
> > +/* Must be called with vc.lock held. */
> > +static void dw_edma_ll_clean_pending(struct dw_edma_chan *chan, u32 old_done)
> > +{
> > +	struct virt_dma_desc *vd, *_vd;
> > +	u32 done = dw_edma_core_get_ll_dist(chan, old_done, chan->ll_done);
> > +
> > +	list_for_each_entry_safe(vd, _vd, &chan->vc.desc_issued, node) {
> > +		struct dw_edma_desc *desc = vd2dw_edma_desc(vd);
> > +		u32 consumed, started;
> > +
> > +		if (!done)
> > +			break;
> 
> this check should before dw_edma_ll_irq_idx_discard();

The !done check here only ends the distribution loop after all entries from an
accepted sample have been accounted for. dw_edma_ll_advance() already rejects a
zero-distance or stale sample.

The sample is discarded earlier so an invalid sample is not retries. I'll make
that ordering clearer.

> 
> > +
> > +		/*
> > +		 * start_burst is the append boundary. done_burst is the
> > +		 * hardware-consumed boundary reported through LL progress.
> > +		 */
> 
> start_burst indicate the start index which will append into hardware LL
> when there are free slots.
> done_burst indicate how much already progressed by hardware DMA.
> 
> 
> This required the strict desc enqueue and dequeue sequence.

Right. This part depends on descriptors being published and retired in strict
list order. I'll state that invariant explicitly. (Correct me if I misinterpret
your point.)

> 
> 
> > +		started = desc->start_burst - desc->done_burst;
> > +		if (!started)
> > +			break;
> > +
> > +		consumed = min(done, started);
> > +		desc->done_burst += consumed;
> > +		done -= consumed;
> > +
> > +		/*
> > +		 * Descriptors are appended in list order, so later descriptors
> > +		 * cannot be complete if this one has not been fully consumed.
> > +		 */
> > +		if (desc->done_burst != desc->nburst)
> > +			break;
> > +
> > +		/* Hardware has consumed this descriptor's LL entries. */
> > +		dw_hdma_set_callback_result(vd, DMA_TRANS_NOERROR);
> > +		list_del(&vd->node);
> > +		vchan_cookie_complete(vd);
> > +	}
> > +}
> > +
> > +/* Must be called with vc.lock held. */
> > +static int dw_edma_ll_recycle_idx(struct dw_edma_chan *chan, int idx,
> > +				  bool stopped)
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
> start_burst> +	if (stopped)
> > +		return idx == chan->ll_max ? 0 : idx;
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
> > +}
> > +
> > +/*
> > + * Must be called with vc.lock held. Consume a recorded LL progress
> > + * boundary, if any. Advance ll_done and complete descriptors covered by
> > + * the newly consumed range. Return true if ll_done advanced.
> > + */
> > +static bool dw_edma_ll_consume_progress(struct dw_edma_chan *chan)
> > +{
> > +	int idx = chan->ll_irq_idx;
> > +	u32 old_done;
> > +
> > +	/* No progress sample is pending. */
> > +	if (idx < 0)
> > +		return false;
> > +
> > +	dw_edma_ll_irq_idx_discard(chan);
> > +
> > +	/* Ignore duplicate or stale progress. */
> > +	if (!dw_edma_ll_advance(chan, idx, &old_done))
> > +		return false;
> > +
> > +	dw_edma_ll_clean_pending(chan, old_done);
> 
> is it better dw_edma_ll_clean_pending(chan, from_idx, to_idx);
> 
> Or you actually only use how many done, not related current actual
> posistion
> 
> u32 done = dw_edma_core_get_ll_dist(chan, old_done, chan->ll_done)
> 
> 	dw_edma_ll_clean_pending(chan, done_cnt);
> 
> 
> If one any small error happen, whole follow may mass up. I suggested double
> check from_idx\to_idx, which match desc's recorder.
> 
> 
> header of pending queue
> 
> 	desc:
> 		start_burst 10
> 		done_burst 0
> 		ll_header 35
> 		ll_end	45
> 
> when clean up desc, make sure from_idx and to_idx include range 35-45.
> 
> 
> if 100% depend on the counter,  assume a bugs or somethring wrong
> 
> hardware pointer 33, the go though 43,  here total is 10, so whole desc
> mark done, but actually hardware only finish 43.
> 
> if everything work perfect, no such problem. But it'd better to double
> check it, at least, report an error when this happen.

I see your concern now. The count-only check cannot detect such case if
something goes wrong. I'll update the part in v3 so that it keeps enough
boundary information to validate this, or add an equivalent consistency check.

Thanks for the detailed review,
Koichiro

> 
> Frank
> 
> > +
> > +	return true;
> > +}
> > +
> >  /* Must be called with vc.lock held. */
> >  static void dw_edma_core_ch_maybe_doorbell(struct dw_edma_chan *chan)
> >  {
> > @@ -424,6 +584,8 @@ static void dw_edma_device_issue_pending(struct dma_chan *dchan)
> >  	if (chan->configured && vchan_issue_pending(&chan->vc) &&
> >  	    chan->request == EDMA_REQ_NONE &&
> >  	    chan->status == EDMA_ST_IDLE) {
> > +		if (!chan->non_ll && !dw_edma_ll_pending(chan))
> > +			dw_edma_ll_irq_idx_discard(chan);
> >  		chan->status = EDMA_ST_BUSY;
> >  		dw_edma_start_transfer(chan);
> >  		dw_edma_core_ch_maybe_doorbell(chan);
> > @@ -697,6 +859,7 @@ static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
> >  	struct dw_edma_desc *desc;
> >  	struct virt_dma_desc *vd;
> >  	unsigned long flags;
> > +	bool active;
> >
> >  	spin_lock_irqsave(&chan->vc.lock, flags);
> >  	if (chan->status == EDMA_ST_PAUSE) {
> > @@ -704,20 +867,21 @@ static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
> >  		return;
> >  	}
> >
> > +	if (!chan->non_ll)
> > +		dw_edma_ll_consume_progress(chan);
> > +
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
> > -				chan->ll_end = chan->ll_head;
> > +		if (vd && chan->non_ll) {
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
> > @@ -726,14 +890,15 @@ static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
> >  			break;
> >  		}
> >
> > -		chan->status = dw_edma_start_transfer(chan) ? EDMA_ST_BUSY : EDMA_ST_IDLE;
> > +		active = false;
> > +		if (vd)
> > +			active = dw_edma_start_transfer(chan);
> > +		if (!chan->non_ll)
> > +			active = dw_edma_ll_pending(chan);
> > +		chan->status = active ? EDMA_ST_BUSY : EDMA_ST_IDLE;
> >  		break;
> >
> >  	case EDMA_REQ_STOP:
> > -		vd = vchan_next_desc(&chan->vc);
> > -		if (!vd)
> > -			break;
> > -
> >  		dw_edma_terminate_all_descs(chan);
> >  		chan->request = EDMA_REQ_NONE;
> >  		chan->status = EDMA_ST_IDLE;
> > @@ -789,12 +954,34 @@ static void dw_edma_queue_irq_work(struct dw_edma_chan *chan,
> >  	queue_work(chan->dw->wq, &chan->irq_work);
> >  }
> >
> > -static void dw_edma_done_interrupt_deferred(struct dw_edma_chan *chan)
> > +static void dw_edma_record_irq_idx(struct dw_edma_chan *chan, bool stopped)
> > +{
> > +	int idx;
> > +
> > +	guard(spinlock_irqsave)(&chan->vc.lock);
> > +
> > +	if (!chan->non_ll) {
> > +		idx = dw_edma_core_ll_cur_idx(chan);
> > +		if (idx >= 0) {
> > +			stopped = dw_edma_ll_irq_is_stopped(chan, stopped);
> > +			idx = dw_edma_ll_recycle_idx(chan, idx, stopped);
> > +			if (idx >= 0) {
> > +				chan->ll_irq_idx = idx;
> > +				chan->ll_irq_stopped = stopped;
> > +			}
> > +		}
> > +	}
> > +}
> > +
> > +static void dw_edma_done_interrupt_deferred(struct dw_edma_chan *chan,
> > +					    bool stopped)
> >  {
> > +	dw_edma_record_irq_idx(chan, stopped);
> >  	dw_edma_queue_irq_work(chan, DW_EDMA_IRQ_DONE);
> >  }
> >
> > -static void dw_edma_abort_interrupt_deferred(struct dw_edma_chan *chan)
> > +static void dw_edma_abort_interrupt_deferred(struct dw_edma_chan *chan,
> > +					     bool stopped)
> >  {
> >  	dw_edma_queue_irq_work(chan, DW_EDMA_IRQ_ABORT);
> >  }
> > @@ -1033,6 +1220,7 @@ static int dw_edma_channel_setup(struct dw_edma *dw, u32 wr_alloc, u32 rd_alloc)
> >  		chan->request = EDMA_REQ_NONE;
> >  		chan->status = EDMA_ST_IDLE;
> >  		chan->irq_mode = dw_edma_get_default_irq_mode(chan);
> > +		dw_edma_ll_irq_idx_discard(chan);
> >  		INIT_WORK(&chan->irq_work, dw_edma_irq_work);
> >  		atomic_set(&chan->irq_pending, 0);
> >
> > diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
> > index 8ed37e8a12cb..90dcbe415f57 100644
> > --- a/drivers/dma/dw-edma/dw-edma-core.h
> > +++ b/drivers/dma/dw-edma/dw-edma-core.h
> > @@ -72,24 +72,35 @@ struct dw_edma_chan {
> >  	u8				func_no;
> >
> >  	/*
> > -	 * New LL entries are appended at ll_head. Entries between ll_end
> > -	 * and ll_head, modulo the LL ring, are owned by DMA; the rest are
> > -	 * owned by software.
> > +	 * New LL entries are appended at ll_head. Entries between ll_done and
> > +	 * ll_head, modulo the LL ring, are owned by DMA; the rest are available
> > +	 * to software.
> >  	 *
> >  	 *   software-owned      DMA-owned       software-owned
> >  	 * +---------------+-------------------+---------------+
> >  	 * ^               ^                   ^
> > -	 * 0             ll_end              ll_head
> > +	 * 0            ll_done             ll_head
> >  	 *
> > -	 * The link entry points back to the region start. ll_head == ll_end
> > -	 * means all entries are software-owned and previous DMA work is
> > -	 * done.
> > +	 * The link entry points back to the region start. No DMA-owned entries
> > +	 * remain once ll_done catches up with ll_head.
> >  	 *
> >  	 * Software always keeps at least one free entry, so the ring is
> > -	 * never completely DMA-owned.
> > +	 * never completely DMA-owned. That keeps a hardware-reported physical
> > +	 * LL index unique within the current ll_done..ll_head producer window.
> >  	 */
> >  	u32				ll_head;
> > -	u32				ll_end;
> > +	u32				ll_done;
> > +
> > +	/*
> > +	 * LL progress boundary sampled by the hard IRQ handler after clearing
> > +	 * the DONE/watermark status it accompanies. It is normalized to the
> > +	 * exclusive convention used by ll_done. The sample and all later
> > +	 * accesses are serialized by vc.lock; -1 means consumed or invalid.
> > +	 * ll_irq_stopped records whether the same event found the channel
> > +	 * stopped.
> > +	 */
> > +	int				ll_irq_idx;
> > +	bool				ll_irq_stopped;
> >
> >  	u32				ll_max;		/* Data entries */
> >  	struct dw_edma_region		ll_region;	/* Linked list */
> > @@ -146,7 +157,7 @@ struct dw_edma {
> >  	const struct dw_edma_core_ops	*core;
> >  };
> >
> > -typedef void (*dw_edma_handler_t)(struct dw_edma_chan *);
> > +typedef void (*dw_edma_handler_t)(struct dw_edma_chan *, bool);
> >
> >  struct dw_edma_core_ops {
> >  	void (*off)(struct dw_edma *dw);
> > @@ -154,6 +165,7 @@ struct dw_edma_core_ops {
> >  	int (*ch_quiesce)(struct dw_edma_chan *chan);
> >  	u16 (*ch_count)(struct dw_edma *dw, enum dw_edma_dir dir);
> >  	enum dma_status (*ch_status)(struct dw_edma_chan *chan);
> > +	u32 (*ch_transfer_size)(struct dw_edma_chan *chan);
> >  	irqreturn_t (*handle_int)(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
> >  				  dw_edma_handler_t done, dw_edma_handler_t abort);
> >  	void (*non_ll_start)(struct dw_edma_chan *chan, struct dw_edma_burst *child);
> > diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/dw-edma-v0-core.c
> > index 62141aa32e50..3b69fa26bf1c 100644
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
> >  static void dw_edma_v0_core_clear_done_int(struct dw_edma_chan *chan)
> >  {
> >  	struct dw_edma *dw = chan->dw;
> > @@ -375,7 +380,7 @@ dw_edma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
> >  			continue;
> >
> >  		dw_edma_v0_core_clear_done_int(chan);
> > -		done(chan);
> > +		done(chan, false);
> >
> >  		ret = IRQ_HANDLED;
> >  	}
> > @@ -389,7 +394,7 @@ dw_edma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
> >  			continue;
> >
> >  		dw_edma_v0_core_clear_abort_int(chan);
> > -		abort(chan);
> > +		abort(chan, false);
> >
> >  		ret = IRQ_HANDLED;
> >  	}
> > @@ -689,6 +694,7 @@ static const struct dw_edma_core_ops dw_edma_v0_core = {
> >  	.ch_quiesce = dw_edma_v0_core_ch_quiesce,
> >  	.ch_count = dw_edma_v0_core_ch_count,
> >  	.ch_status = dw_edma_v0_core_ch_status,
> > +	.ch_transfer_size = dw_edma_v0_core_ch_transfer_size,
> >  	.handle_int = dw_edma_v0_core_handle_int,
> >  	.ll_data = dw_edma_v0_core_ll_data,
> >  	.ll_link = dw_edma_v0_core_ll_link,
> > diff --git a/drivers/dma/dw-edma/dw-hdma-v0-core.c b/drivers/dma/dw-edma/dw-hdma-v0-core.c
> > index fb651a83f0f3..4440e3ebaeac 100644
> > --- a/drivers/dma/dw-edma/dw-hdma-v0-core.c
> > +++ b/drivers/dma/dw-edma/dw-hdma-v0-core.c
> > @@ -203,14 +203,14 @@ dw_hdma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
> >  		val = dw_hdma_v0_core_status_int(chan);
> >  		if (FIELD_GET(HDMA_V0_STOP_INT_MASK, val)) {
> >  			dw_hdma_v0_core_clear_done_int(chan);
> > -			done(chan);
> > +			done(chan, true);
> >
> >  			ret = IRQ_HANDLED;
> >  		}
> >
> >  		if (FIELD_GET(HDMA_V0_ABORT_INT_MASK, val)) {
> >  			dw_hdma_v0_core_clear_abort_int(chan);
> > -			abort(chan);
> > +			abort(chan, false);
> >
> >  			ret = IRQ_HANDLED;
> >  		}
> > --
> > 2.51.0
> >
