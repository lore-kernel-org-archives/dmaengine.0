Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020132.outbound.protection.outlook.com [52.101.229.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE54724336D;
	Fri, 24 Jul 2026 05:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784871992; cv=fail; b=u9fcyrcJNIq/CMvlLjAKYk/nEui2j2HG0wKMWz90XJQurytYXZDc3PmDJ8AO5VOEL6uYW0MvYYoO9g5ZoGM81WWn0W6McxUUqrOWpl6+F70J+LtORZ00452y4yq5jscH2yw58wdM3u/4QDXatSR4QxO6xQARzNTbVXeQPPYJxEM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784871992; c=relaxed/simple;
	bh=ePzEImxzlWGTOXk+KYXJ5IW9lzUO5vWsBA7B/bekoFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=anYwGFdZgxgjGgFPQ3nFLh1+MJGB3Nwok6sJsjJHPDraPYqK2jNNRXGV05M0JfKomOMA0s8rn7opOj8BHHrW3RrN1KhYcWVY8N+uRIe48hf1z1UvSrDQcs+wY0+85EF6VtLdDgv6sf7YU8kQYpPY5xTTcfLXX66TqN6e3Lxmi0A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=CWuSYQDV; arc=fail smtp.client-ip=52.101.229.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="CWuSYQDV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kNw8q0GcYGKL5Iat8IvBK8ieQI1/a2124B1vM1AMuVJivWv7/GhDxrFlMWAhsohsq88eZZOpNxnCz3VCz4+OloCMdRa1wnEU0JHZI9f9vk1eut1WL/SATlYiP+B63fxE2UWKeVGFp/S52RyMO2gFt5TB1DrNTIosxFK7BpjwuOQyJZKJVCYSXbWcQj4nyJcuLIORUbkGsoEr/w1IgbwqNya6YbH2FCloMYUIb9UvuF85rEGJ4UyemWbpm7tMrRZURfsZK0PCr3u27uaMZIL4imX4IgyZQtZeTPUzejRL/zS2NHmE6RMrcv2v9iJRpZJ/WRf8zJ18J0F/sZww2U7xNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SL2hctf81d1CIh6XPrVkCC99Lj6r4PNmj0PQylNBolU=;
 b=jRYYNavuWLV5GYy0iBUpxNnJKh4X9TJFemCQDiZ2ZZCjgXk73wMeD+/WBxeeDy7oZugzPE0yxz/elo3BcjiVsiFawXxhDLzFGFWTIYzV+iF06/bF5plijksXkSEVLeeEGp2aAoi/5Sim6HJTyV2tjcg1AlDwbPszvFQKU5x0ilINXLBJheWHoUsMPtpuVUSKGyn5k0OjNVFyFkqW+1mFRPdbbkQEFFhlXYL4VJx8Vr5LLvOf5vSY0Nf6g8UzCT4a7VjZRfRTSXF01hn+aWYmqDka1RSdOR845oyVJ5jQZUhrGWjXPJJD7OIMnCqVNh7sQLEUgPKClWQ2kbUAorRxtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SL2hctf81d1CIh6XPrVkCC99Lj6r4PNmj0PQylNBolU=;
 b=CWuSYQDVvZ8rGkyor5fPg7repYdbdFppKcgkRrao9kn9SMG72iTsB84tPaiWUyiLRhuEEMoBPyOlTI7uTp0CK0L0ErEQMSq5QhMu02lX8x54P5JxNlZbWZI0ABPdLb3+C99HsPtnK0VPHhLla8i8Tw25v2+Hb8icpZauGsXXXxo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OS3P286MB3322.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:20e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 05:46:25 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 05:46:25 +0000
Date: Fri, 24 Jul 2026 14:46:23 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>, 
	Kees Cook <kees@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Christoph Hellwig <hch@lst.de>, Serge Semin <fancer.lancer@gmail.com>, 
	Cai Huoqing <cai.huoqing@linux.dev>, Niklas Cassel <cassel@kernel.org>, 
	Devendra K Verma <devendra.verma@amd.com>, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 05/19] dmaengine: dw-edma: Add LL interrupt placement
 policy
Message-ID: <dbnylap6togkuwbgrnt4oors56c4litp7ndvfnbvgg4wynigtx@z4mrupqrd5sg>
References: <20260723084150.521366-1-den@valinux.co.jp>
 <20260723084150.521366-6-den@valinux.co.jp>
 <amJyWDdq7MBkoudf@SMW015318>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amJyWDdq7MBkoudf@SMW015318>
X-ClientProxiedBy: TY6P301CA0018.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:3bf::19) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OS3P286MB3322:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b6a2d31-1990-4773-2f89-08dee946e622
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|23010399003|366016|376014|7416014|10067099003|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Qqr1ImU/dDDqMkprT44hxI3lRlsD7FNXxUzpFEK5d8njgjCSbYjqkr647K4t1JxIsV4ogQcNNLpNLXP9QeWJ1TgwhNJtFNY0W40d2bqtktrSaMe9kvILWGk3S/hTQOX8+sd8SngPv7LQMdVAtL//V1hqusa4H0e4uXcny5EtZ/n7Ob1JzpEMyZUzqXnB5K4VWZ6IbOa5Z8BgXhPE7HMAKVsh61FPNY2mpD2F3oGi+7ayij0aSXrK1WMgGOYBJY5GrVvqEtPkEMsycxX7Rq9K2AZ/eiPb6vMP7V+sSShXIt99dPxEnYlQWeBXcEG9yDRqkp4F43Oqm+0j38u9HCrr6ANVuHGeqi/CUHpg07aWwIC8eKU0d/hOKAhxbdK2i0K2ePQog+SdIlP8/5Gb7lUVDwasXzu9UKsPWI00uTbt/yxrdkPojDtSp15jxZ7r6SXh1KRJW7/6F9lgH10mwSrfp/IdmWSkTwrA8fkx7+QXaBR9Q0cEstHm/HX3w2Vaz3PfGK40bhKoVRYRpB3ujiODAxQQxswtiqY1Zn0tYBMuFjFGswnU+B7scGAGDF0jP0JUo/MtH3o0PgclLDbRbG4uJVRD7JEL3ndL8Sun7Usg36OO6SLbIwRGY4+MWVvINcF9hLI4W7VLwjw9kZhQv5YPzeSO3LdskANBXpvhuLGTXrk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(23010399003)(366016)(376014)(7416014)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4NG3Uz2LsiJOKeEpVW4uIfHthl39RM44MZc/00+z/WIH/JB/N4gUx99LXWJh?=
 =?us-ascii?Q?AEqBq+TTNoSqzCMCxr2rUsG3GL8meWI7LOzcXAQd4xvMjqUj9EvNlmX5bD3g?=
 =?us-ascii?Q?ISHBBsuHnGKw4mtsfWCKmqQWuJHh+M0xAvlJfsoyRtkl9wtC1a0INJ4EJUQG?=
 =?us-ascii?Q?K0c0NKcj2EmHIjcbtejOGZE7LDtawuytEA4gvzxu7cO2/ZLDHdzptVnhXn/z?=
 =?us-ascii?Q?b6RO1pN0Y81RpR9EJl9N1snmeJkm1g5/stYzAsZFMBo4MWMISeqQUNc3agtg?=
 =?us-ascii?Q?cK7kC0yVmJETGhJbJwu9jd1FrvE66AI0bslWPVTMoJsuww2K8y2yZ37XUsua?=
 =?us-ascii?Q?ap+RHRgE7ObMr7CzMNp0tzDCFZj5zgeuHFFq3vgE+vkRdo7MCboGYkwW9oER?=
 =?us-ascii?Q?wXkeEHExZwnONkLZXbkI73myIUj0nP1s4DWf3I8v9GYQOUYr+lkQXurnGQmZ?=
 =?us-ascii?Q?YZhkNbfA+VmlWKb2dZqgJm3o40FHn7ElDWUNjU0iu4tesIuJsjBMRU7WmXh7?=
 =?us-ascii?Q?nMrrQ2aPxEYLxgh551DvdnL5dOYn3xS6cDJ+hbXjD8ei/U5P7+ZXNKXVGRu1?=
 =?us-ascii?Q?9wqgXEyLZErff7lCPyBDyvbBgBR7ySLw5iKAc5t43pLkBdujrIjqTW6w0Zhr?=
 =?us-ascii?Q?DQzSD3kDe1b9G/WLJukY2kczcxThT8ANwZ2ntU8cB2twuFsuqhHPn+wIBcS+?=
 =?us-ascii?Q?h34MFLPTxxLCJK8QK8guQsGhVCCHOohSyD3jMYYLuM5eKPdpZqYsMb5Ocwzg?=
 =?us-ascii?Q?dwv3thiHOUiquMRMs7E7fMkCwUSPLdWC61sfZercMO4etp3orBraZ044v/7i?=
 =?us-ascii?Q?kU6N1s5Ybx9fezDJG78coqTnvwHnppms9G1KBne+cG3upqCK7HKUfqGWWs3P?=
 =?us-ascii?Q?KkHSJDZ/Snc27nsSmYLvziOoidTnHwFK1ZkoRbykf1fh7+lOodub4EdgM7US?=
 =?us-ascii?Q?AoGS+tn/Aq7Fg7YS1o7qDWAOyHJvY7JS35IsIZHqfSEsHpCLyUUXuLVfGkTb?=
 =?us-ascii?Q?fwzdhgFX2ofcGKx3pqVrgcnayzxb+Z+Uf+zTQzOXTfmke7/U1zsULBWb4hUH?=
 =?us-ascii?Q?47BInvkh1GCp2zxwwYfiKR3PRsC9oc3wQJ/vguUSN6+JazR74TzNb521v5Yb?=
 =?us-ascii?Q?iSG1gbzC323R2w46Q4egow1pMZY+ECLAs5GeSqojWBKMdwo1KnPJra7i5azk?=
 =?us-ascii?Q?Axju/frq4R75tyoqKt872rjcxd+hZRMGmSWLoucPOeFBIF0zm6pBr5R7eHrJ?=
 =?us-ascii?Q?Ir5up6W3Zz665IblKGyhXJ9MwPMFyiJstxWBPVqj76kvrL4w0+Uu0u5ixic7?=
 =?us-ascii?Q?902uJ1mF9ORVJpHhQnNE5qf1k95IQGqqx73mdutGBBzvn+mUE0Siu5ULEOKR?=
 =?us-ascii?Q?tQg0MB1iLxPzfcdoV2qPYXZJglOUTcRm/IqxrRrVlDMjLNaQ0H25BiCFxpBm?=
 =?us-ascii?Q?Ed7FDw/Hu9Z6yG5u+VH7QHgkWWU8NbdzhTojiCkaBe+O1+59NxMrMGRrW09f?=
 =?us-ascii?Q?12BVX+8vp3ZLsri1JYXEMLHjwHMHZWyry9yvSQML9No+wxdJ3wIyYMBXe0AL?=
 =?us-ascii?Q?OzO3SjUX8eJ3iEDDGy4ew+vBUwXEDn6HowjHqkr8G9h77GnU5JW/mD9B4J1a?=
 =?us-ascii?Q?+T6mgu+rgVnQ3WmJqwvZsTtEEDOCmRXWJqx/0aimBxO6/TibqMhn6QaJNrbE?=
 =?us-ascii?Q?9rGyeI9YIoK2c+J6hElV3WpNAEY+U03ckFv0ceAuvl7IV5dQPc1ekEN6tQ40?=
 =?us-ascii?Q?1vc8BcAN6KC5TloHimPucr5EnbQMMlajAG4/Vi69QdK7Y4C6kujj?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b6a2d31-1990-4773-2f89-08dee946e622
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 05:46:25.2627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sQMQVLDdISxV5ZwGt6b8yAXPQMOiiiByiEy+LSrEC7xV+IQ12FivVzF8KUH3hgKoKlxOrK+Gq+TmdWw11QaU6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3P286MB3322

On Thu, Jul 23, 2026 at 02:58:16PM -0500, Frank Li wrote:
> On Thu, Jul 23, 2026 at 05:41:36PM +0900, Koichiro Den wrote:
> > Move linked-list interrupt placement behind a core callback so eDMA and
> > HDMA can use different policies.
> >
> > Keep the eDMA behavior. For HDMA, place watermarks at descriptor ends,
> > before link entries, and every four entries when a descriptor exceeds the
> > usable ring capacity or another issued descriptor follows. A later patch
> > handles these watermarks as progress events.
> >
> > Four entries is an empirically chosen coalescing interval.
> >
> > Signed-off-by: Koichiro Den <den@valinux.co.jp>
> > ---
> > Changes in v2:
> >   - Fix the zero-based interval so the first watermark is on the fourth
> >     entry, not the fifth.
> >   - Revise the commit message and source comments.
> >
> >  drivers/dma/dw-edma/dw-edma-core.c    |  8 +++++++-
> >  drivers/dma/dw-edma/dw-edma-core.h    |  2 ++
> >  drivers/dma/dw-edma/dw-edma-v0-core.c | 10 ++++++++++
> >  drivers/dma/dw-edma/dw-hdma-v0-core.c | 28 +++++++++++++++++++++++++++
> >  4 files changed, 47 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> > index a9f25a65294e..78d1bb6302fb 100644
> > --- a/drivers/dma/dw-edma/dw-edma-core.c
> > +++ b/drivers/dma/dw-edma/dw-edma-core.c
> > @@ -98,6 +98,12 @@ static u32 dw_edma_core_get_free_num(struct dw_edma_chan *chan)
> >  		chan->ll_max;
> >  }
> >
> > +static bool dw_edma_core_enable_ll_irq(struct dw_edma_desc *desc, u32 i,
> > +				       u32 free)
> > +{
> > +	return desc->chan->dw->core->ll_irq(desc, i, free);
> > +}
> > +
> >  static void dw_edma_core_ll_start(struct dw_edma_desc *desc)
> >  {
> >  	struct dw_edma_chan *chan = desc->chan;
> > @@ -120,7 +126,7 @@ static void dw_edma_core_ll_start(struct dw_edma_desc *desc)
> >
> >  		dw_edma_core_ll_data(chan, &desc->burst[i],
> >  				     chan->ll_head, chan->cb,
> > -				     i == desc->nburst - 1 || free == 1);
> > +				     dw_edma_core_enable_ll_irq(desc, i, free));
> >
> >  		chan->ll_head++;
> >
> > diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
> > index f2c2d5af1fff..8ed37e8a12cb 100644
> > --- a/drivers/dma/dw-edma/dw-edma-core.h
> > +++ b/drivers/dma/dw-edma/dw-edma-core.h
> > @@ -162,6 +162,8 @@ struct dw_edma_core_ops {
> >  	void (*ll_link)(struct dw_edma_chan *chan, u32 idx, bool cb, u64 addr);
> >  	void (*ll_clear)(struct dw_edma_chan *chan, u32 idx);
> >  	int (*ll_cur_idx)(struct dw_edma_chan *chan);
> > +	/* Called with chan->vc.lock held. */
> > +	bool (*ll_irq)(struct dw_edma_desc *desc, u32 i, u32 free);
> >  	void (*ch_doorbell)(struct dw_edma_chan *chan);
> >  	void (*ch_enable)(struct dw_edma_chan *chan);
> >  	void (*ch_config)(struct dw_edma_chan *chan);
> > diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/dw-edma-v0-core.c
> > index c31fff095b4f..62141aa32e50 100644
> > --- a/drivers/dma/dw-edma/dw-edma-v0-core.c
> > +++ b/drivers/dma/dw-edma/dw-edma-v0-core.c
> > @@ -649,6 +649,15 @@ static int dw_edma_v0_core_ll_cur_idx(struct dw_edma_chan *chan)
> >  	return (val - base) / EDMA_LL_SZ;
> >  }
> >
> > +static bool dw_edma_v0_core_ll_irq(struct dw_edma_desc *desc, u32 i, u32 free)
> > +{
> > +	/*
> > +	 * eDMA reports LL interrupts through DONE. Keep them at
> > +	 * descriptor ends, plus the last free slot to refill the ring.
> > +	 */
> > +	return i == desc->nburst - 1 || free == 1;
> > +}
> > +
> >  /* eDMA debugfs callbacks */
> >  static void dw_edma_v0_core_debugfs_on(struct dw_edma *dw)
> >  {
> > @@ -685,6 +694,7 @@ static const struct dw_edma_core_ops dw_edma_v0_core = {
> >  	.ll_link = dw_edma_v0_core_ll_link,
> >  	.ll_clear = dw_edma_v0_core_ll_clear,
> >  	.ll_cur_idx = dw_edma_v0_core_ll_cur_idx,
> > +	.ll_irq = dw_edma_v0_core_ll_irq,
> >  	.ch_doorbell = dw_edma_v0_core_ch_doorbell,
> >  	.ch_enable = dw_edma_v0_core_ch_enable,
> >  	.ch_config = dw_edma_v0_core_ch_config,
> > diff --git a/drivers/dma/dw-edma/dw-hdma-v0-core.c b/drivers/dma/dw-edma/dw-hdma-v0-core.c
> > index b2d35f0b7b6d..fb651a83f0f3 100644
> > --- a/drivers/dma/dw-edma/dw-hdma-v0-core.c
> > +++ b/drivers/dma/dw-edma/dw-hdma-v0-core.c
> > @@ -13,6 +13,9 @@
> >  #include "dw-hdma-v0-regs.h"
> >  #include "dw-hdma-v0-debugfs.h"
> >
> > +/* Empirically chosen watermark interval. */
> > +#define HDMA_V0_WATERMARK_INTERVAL			4
> > +
> >  enum dw_hdma_control {
> >  	DW_HDMA_V0_CB					= BIT(0),
> >  	DW_HDMA_V0_TCB					= BIT(1),
> > @@ -417,6 +420,30 @@ static int dw_hdma_v0_core_ll_cur_idx(struct dw_edma_chan *chan)
> >  	return (val - base) / EDMA_LL_SZ;
> >  }
> >
> > +static bool dw_hdma_v0_core_ll_irq(struct dw_edma_desc *desc, u32 i, u32 free)
> > +{
> > +	struct dw_edma_chan *chan = desc->chan;
> > +	bool needs_progress;
> > +
> > +	/*
> > +	 * Always place a watermark at a descriptor end and before the link
> > +	 * element. The first reports descriptor progress; the second provides
> > +	 * one progress point per ring lap.
> > +	 */
> > +	if (i == desc->nburst - 1 || chan->ll_head == chan->ll_max - 1)
> > +		return true;
> > +
> > +	/*
> > +	 * Use periodic watermarks when a descriptor exceeds the usable ring or
> > +	 * when more issued work follows it.
> > +	 */
> > +	needs_progress = desc->nburst > chan->ll_max - 1 ||
> > +			 !list_is_last(&desc->vd.node, &chan->vc.desc_issued);
> > +
> > +	return needs_progress &&
> > +	       (chan->ll_head + 1) % HDMA_V0_WATERMARK_INTERVAL == 0;
> 
> This is not good layer design. edma/hdma supposed just do action to operate
> register, less software logic.

Indeed, thanks for pointing that out.

> 
> Can we move this code to core layer?  introduce an 'interval' for difference
> backend.
> 
> eDMA: interval is number description.
> hDMA: interval is HDMA_V0_WATERMARK_INTERVAL

Sorry, by "eDMA: interval is number description", do you mean using desc->nburst
as the "interval", so eDMA keeps one interrupt at the end of each descriptor?

> 
> So core layer can use unified logic to handle for both eDMA and hDMA?

I'll move as much of the software policy as possible into the common core. I
think even the periodic interval and descriptor-end placement can be shared.
I'll rework this part and verify it with performance tests.

Thanks for the review and suggestion. Much appreciated.
Koichiro

> 
> Frank
> 
> > +}
> > +
> >  /* HDMA debugfs callbacks */
> >  static void dw_hdma_v0_core_debugfs_on(struct dw_edma *dw)
> >  {
> > @@ -441,6 +468,7 @@ static const struct dw_edma_core_ops dw_hdma_v0_core = {
> >  	.ll_link = dw_hdma_v0_core_ll_link,
> >  	.ll_clear = dw_hdma_v0_core_ll_clear,
> >  	.ll_cur_idx = dw_hdma_v0_core_ll_cur_idx,
> > +	.ll_irq = dw_hdma_v0_core_ll_irq,
> >  	.ch_doorbell = dw_hdma_v0_core_ch_doorbell,
> >  	.ch_enable = dw_hdma_v0_core_ch_enable,
> >  	.ch_config = dw_hdma_v0_core_ch_config,
> > --
> > 2.51.0
> >
