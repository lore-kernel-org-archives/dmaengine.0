Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010035.outbound.protection.outlook.com [52.101.69.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43783537CD;
	Fri, 11 Sep 2026 14:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789137394; cv=fail; b=cIKvznlu8VPKOF5ZBg1sOaAfOUIi4IKNgPgggP6VHJS0MW/D0QkyTj7LSd+2ymN/3yxR92Yp39LMdqwugH7AVUvRrb2SrV/A7WWAztT+sQy2ZfKxmc7KlYMoXpM0nVZ1rcK98Cm2uSmYwoR5jozAc+sEHCCKDaXwuD+LH46ibsQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789137394; c=relaxed/simple;
	bh=zVPlQ3mBcom+xfqMGmqj+34E74k7rvPZ/iqKAj1VlP4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JeOF2yeCxlw2J+CnlR0V+KQ0y8nDz3+EzyJ9FN7igZuky1Qw+xs4hp3b2wqlHu6qkomIKEN99HuAQARRl50CwDrpHqejQcLAeVrzRxe0M8nfldMS6V3rByEAuHhUCJrJed6FYYZCKGhgFRTFcDtDUf8eliVdveXy266Zc5861Qg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ni99ewv7 reason="signature verification failed"; arc=fail smtp.client-ip=52.101.69.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ni99ewv7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F4TeIPy0kncmnzqijUN3v2X5s0ZD+21LYqjRluYMP/avMpk5f5NDNtSJv7fHfwdfiLaYGn7UMfa0C22yTKZzFzsQVykDESbbAfn/W02sL4OJy/26DQuEybM4P6jXvGzzAbjGK5Vn2L696HWnTA/jRUHoaCPU8/OWBi0LC5iBxDNDWOJhVTFAIqj4k9yb+ousbfm2fj8GfLabkpu37lnUFSBKh8jhFKY8NolPO1fN2A6vfdw3zZlsHyoectUOQlP92yODRx21mu5OQlLHMj+brTksXox+lCI+A3cbwkdoL4Z9TO4kI7Zbzv8nny7GEjo7TtFbOM4YRnI0iblTSYx1OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZI+r+Tx/CLSnS1uEy6/dzlA7XPEc7UoVO/cp80pI/hQ=;
 b=ggp1elmMlHHTtybPrQz6uslkb/nTY0YLzEVpflTzI5CWsQsUCOpwV5jddNhDpeyTNhGZrrOVGleTwEWK+2mS4o7Bw3G/R5DY46IV1cHb/e9/OKGtLKSgjD9606wTER7LP50ho2+Fjo/5uOeO+SwRNHQ1dZZ45mwvM8STyUdBXMZZjFjwAZFpjmKDkPhqywu1Wa08T1H0pXmPcAqid1dDk0JaPd7Fdpa9ucL2+eqxZSv6K210CPMXvcNOoD/bkkt8USOmd4XTSeAsCRXd/+MQ/V8kKAXrOkHF4/jKta7zLqbFgeUn3EUOdV+Rx4LMuFlH7MU8xepDLgr0ZZf8S/Ab1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZI+r+Tx/CLSnS1uEy6/dzlA7XPEc7UoVO/cp80pI/hQ=;
 b=ni99ewv73AvY0yAenxueTTj4M5BS6Jlzat4DMdMcepbItQQOoFHWph72GzpfTUmNJJchA5gbhh+wWt0m/2sry1/9tdV5POOtAOfZJSFYehSg7GqxDYdlOEj8kzR7vcEyD5HAQvxD6EOzQsSgC3owNQPIaVhp5TD6yAyYXvEY+oASVrnCpouGG3nvfgzA71YyCKjh8DuVvzqemJzkzz65HagsCLHyknjxPv+CG4kQrVvi/HtsDqmWuhSDJh6lYkyCEgB/6ogIASVO2Ph3dH59klEQfman8k593KUV2gNfr5dLihb1HGCVOOaarf0vPKzWMJ4dr1Loqj26tG+Yxwy/Ew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB8164.eurprd04.prod.outlook.com (2603:10a6:20b:3ea::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Fri, 11 Sep
 2026 14:36:29 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 14:36:28 +0000
Date: Fri, 11 Sep 2026 09:36:19 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: CL Wang <cl634@andestech.com>, conor+dt@kernel.org,
	devicetree@vger.kernel.org, Frank.Li@kernel.org,
	dmaengine@vger.kernel.org, robh@kernel.org, vkoul@kernel.org
Subject: Re: [PATCH v6 2/2] dmaengine: atcdmac300: Add driver for Andes
 ATCDMAC300 DMA controller
Message-ID: <aqQR4-yt6eeqldxI@SMW015318>
References: <20260911072524.1297406-1-cl634@andestech.com>
 <20260911072524.1297406-3-cl634@andestech.com>
 <20260911075712.A4D361F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260911075712.A4D361F000FF@smtp.kernel.org>
X-ClientProxiedBy: PH7PR17CA0055.namprd17.prod.outlook.com
 (2603:10b6:510:325::16) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB8164:EE_
X-MS-Office365-Filtering-Correlation-Id: 4be9e6c0-edbf-46ec-6b3d-08df10121075
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|23010399003|1800799024|366016|6133799003|4143699003|5023799004|22082099003|10067099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	jGXegiA1Xc39wYCWv76zsDSz1S6t7KclRm8+VEF+L1Fh+lyuXe0ZcMn9d1kFDI8p7Czsy525PasQWZztJHe5fVgaaeseJsZfILbaWAQNH7c1CPc/52onwOGKc8SyfsanxKBsFCLHFeo/Qfuu5drzJvDQm6+cOFTMuJan/5kswRf8rTEWDMW3pwLEs8WMZsOLM395EZVM8v9VCScEAjV7sEUYwlG+yAGrs8XwHLnslMHfx70l/JckTijNV+CaBogM3SlBDjZpivZebGjdA7VVdZrq87UGDFVGRAL4Oh1HWzOz5Mn/HYblxOlRxx4xS2XTN/Y3HQivcV63Ln1qrHE4c+afJ1Rmr5gstgD+bqwGr6pUSIiTl3g2bP5mfdaWtFPDmn4kT1/tj+i9lTfDJL8SisUKLv1dy3FIZRWyQ7LLNYXYlh+99a54WY4iHNvgXf1H2DtUa0stueje7/Fa3QwH3i5/1hzGn5rv8tvXuC0xmc7qk+mWOMw0IcLjeaohcMKJmKtAufIjH57xnrnDwrp0unoxMJd+EeO9+1rSt4dVae4DmZrsTYyUPndNeRujhhVKS2IOYxUOCaaygQAKEYv3nazVktvp5vU+c+Mjn5osc+Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(23010399003)(1800799024)(366016)(6133799003)(4143699003)(5023799004)(22082099003)(10067099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?ZSab9L95hNdS8nA6QrjUTK4qTPDv4zm8NrkM9OysfU/gYWWAYgsQzUuF1U?=
 =?iso-8859-1?Q?wwh/Fo0yD0zE16tfp8Ry3wA/Ki4GwGckwP/L9EMVyWiE29LpI4lRC1HELM?=
 =?iso-8859-1?Q?HDusTNmcfSdo9mrjlz8RTFmxg8VvmDdfJ6yZtNliGhCBW1j9Vz6RRgFrqx?=
 =?iso-8859-1?Q?W42g+l7bzPTGE1mNLSMmFJhn63EJCNaw92JUTxXlCS2fGg9F8laBb3Y4yV?=
 =?iso-8859-1?Q?gwXS7wdj1FTqQ9LByR0XbpYPnzaa91paTXNFn0ry9fIzTry/GawxMfIb1J?=
 =?iso-8859-1?Q?Dk2dJc2WxW6zjYe6QtkoQ0uuOsNDDJqqdQWPepBuFs/pteTeZWPX61ydKW?=
 =?iso-8859-1?Q?z6T5OChuCgVxu0w/ED65U9qxFRxrBDsZO85y9mtIuSUJnBWbU26dLZn6/Y?=
 =?iso-8859-1?Q?4c5L2IXzMVFimPrL2tJC/1y3esSzV+EHK/HKlNR0xKY3Tkx6+YKdlwDyfk?=
 =?iso-8859-1?Q?3NPpjdmx9EA+WrrEHoi3vipSQ0XPf5RNlbWT3tNpz36eaX8RJd1cgZlR+J?=
 =?iso-8859-1?Q?af2TwDtwugLSvcvKY1s2hgnnCURONe3BgnDwGc1Z1eXPv45WTgpHpduXNF?=
 =?iso-8859-1?Q?rRz0H4qvicPbuc3YsOPBxbcUuGCiS2GRv4RsZcaytKQGsOz33D7gi/CZsk?=
 =?iso-8859-1?Q?guqbGXBCq5b9S7vCjBJsGbfRMD6L3K99q9GiFKbymIYbEsIKY8GQy1EJTN?=
 =?iso-8859-1?Q?0ikConAhIb7WNSEMgTJ2jjkU05BZ8Lzp/iqMaCwpbZV+54h4G/7shHgV0y?=
 =?iso-8859-1?Q?UWHUxhaQ4BFS8iwlJE/ksbdEA2O4bTEnoLBvflDlhhvs1AGB3hilepnKWC?=
 =?iso-8859-1?Q?8gHj0je8iBtyWIT/OoltH92IDkZqxmek6FvS1DJEr5IxIQFwwn0Uc1PPs2?=
 =?iso-8859-1?Q?nrGxGRSDUus3gKWLtjkHGzS6O+qYVgU0fyf1RtquTuXPLEhm0jMIVqq6Ys?=
 =?iso-8859-1?Q?OWDg7xgs5QxD3APhuegIVgIMx56+WghdS/HMDjyQDJx9QHuoCmrXKBHft2?=
 =?iso-8859-1?Q?0SvFCcYJ7maVYKNpP03GaFvwjGBG789EzDBtjqcFRO13KskU2B6/hEQQ5P?=
 =?iso-8859-1?Q?WC4eT2zj0Ei86EI0DGiicnwHF8P0GX2ovWllIHF1HViTCQwIjDjeR7Xz2E?=
 =?iso-8859-1?Q?hch2UUTl8U7nPkqRvk1WNxPDK1oAMoj3obP4FIPItOTGXKBfMTGpGQjY35?=
 =?iso-8859-1?Q?8CYuo7Kx4lJX/xXjemtUNaEtGJ4sgjmWiSOoIIZ1RM9IeyCLIs2kbHeGUq?=
 =?iso-8859-1?Q?Wsn8SxAgMGssqA912T3uBQMRrQO1wTvUxupGuOu42HWmqsplAga6TjPUzq?=
 =?iso-8859-1?Q?FYvW9G7P77FvkWhSmtbGqm2uHx7+ig8xgMTDZV4ZhwlU2z+kzQ0nSeEbo+?=
 =?iso-8859-1?Q?oZmEI2ZmBF+eFCwKpKbaRknhQEct7EiBD4SmT4831LIbaDLdG6FjXy+ffO?=
 =?iso-8859-1?Q?NZccXGBT4X1CebR69HXR0UkBKf3tpwfaoYHp+TPmUrRYNGxqDXjiJT1qIo?=
 =?iso-8859-1?Q?iTFnCmfLpL/Oi367oo3W/eNGq9TO22FgMPQpAgoAZ8StIXvPioajV6GJc1?=
 =?iso-8859-1?Q?imJ0tNFCEx4aH5g7nXWc3YWKQupRejDxmDZxRPNcOXamP4HjP3GgVk5zXs?=
 =?iso-8859-1?Q?xcKn0VmQWfrTg9AXuZRJJHzo2QaHy915vZ42tbTkJv42a4rWGkbl+lJcGw?=
 =?iso-8859-1?Q?zMgRWXfCCH7vfH1bwSA6fH/hwpf1hHFDg4uOzYeWGCkTUtlZrZllN/G86C?=
 =?iso-8859-1?Q?BECg9+ohlxNxbm/3DNeIek17fmsi+yaZZYwlNJap6iNYB1ZLNm4kK5Dwgh?=
 =?iso-8859-1?Q?Z2/GoLXnOFqpDMiuY7Rf1PnSwuNP48hfHss3DodP/ykF8Es5Flnc?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4be9e6c0-edbf-46ec-6b3d-08df10121075
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 14:36:28.4783
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zV/g9k3FZFdd8TCjtE/zuk8IXAmruwr650UL8ZiUKsZdKqy0MvbLiXbeXoHoynOt+vMVXeZep/lwtQB8HdILVqBJm1yi1oBz7nezKDhV6i3QqbJ/RUai4GWr1CTn+5F6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8164

On Fri, Sep 11, 2026 at 07:57:12AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 11 potential issue(s) to consider:
> - [Critical] Double-callback and Use-After-Free race in cyclic transfer completion during channel termination.
> - [High] Masking pending hardware interrupts with software state (`used_chan`) causes an unacknowledged IRQ storm.
> - [High] The DMA device is exposed to clients before its IRQ handler and cache coherency (IOCP) are fully initialized.
> - [High] Polling for up to 100ms with interrupts disabled in `atcdmac_terminate_all` causes soft lockups.
> - [High] The channel-wide `cyclic` flag is sticky, and unconditional resume restarts cause arbitrary DMA execution or kernel panics.
> - [High] Suspend/resume race with the threaded IRQ causes transfer desynchronization and hardware corruption.
> - [High] dmaengine API violation in `atcdmac_terminate_all`: invoking completion callbacks for aborted transfers.
> - [High] System suspend times out and fails if a slave DMA channel is actively waiting for peripheral data.
> - [High] Sleep-in-atomic bug on PREEMPT_RT due to using `spinlock_t` in hardirq context.
> - [High] Kernel panic due to list_del_init() on an uninitialized list_head in error paths.
> - [Medium] Writing a blanket clear mask to `REG_INT_STA` clears unhandled interrupts, permanently losing them.
> --

Please fix these problems. I will start review after fix sashiko report
issues.

Frank

>
> commit e06d7bd262ebaa03646e2e3ac2876918f25083d4
> Author: CL Wang <cl634@andestech.com>
>
> dmaengine: atcdmac300: Add driver for Andes ATCDMAC300 DMA controller
>
> This patch adds support for the Andes ATCDMAC300 DMA controller.
> The ATCDMAC300 is a memory-to-memory and peripheral DMA controller
> that provides scatter-gather, cyclic, and slave transfer capabilities.
>
> > diff --git a/drivers/dma/atcdmac300.c b/drivers/dma/atcdmac300.c
> > new file mode 100644
> > --- /dev/null
> > +++ b/drivers/dma/atcdmac300.c
> [ ... ]
> > +static struct atcdmac_desc *atcdmac_alloc_desc(struct dma_chan *chan,
> > +					       gfp_t gfp_flags)
> > +{
> > +	struct atcdmac_dmac *dmac = atcdmac_dev_to_dmac(chan->device);
> > +	struct atcdmac_desc *desc;
> > +	dma_addr_t phys;
> > +
> > +	desc = dma_pool_zalloc(dmac->dma_desc_pool, gfp_flags, &phys);
> > +	if (desc) {
> > +		INIT_LIST_HEAD(&desc->tx_list);
> > +		dma_async_tx_descriptor_init(&desc->txd, chan);
>
> [Severity: High]
> Does this code leave desc_node uninitialized?
>
> dma_pool_zalloc zeroes out the descriptor, leaving the pointers for desc_node
> as NULL since INIT_LIST_HEAD is not called for it. If a subsequent descriptor
> allocation fails (for instance, in atcdmac_prep_device_sg), the error path
> calls atcdmac_put_desc on the first descriptor.
>
> This descends into atcdmac_put_desc_nolock, which performs list_del_init on
> desc_node, potentially causing a NULL pointer dereference on the
> uninitialized list head.
>
> [ ... ]
> > +static void atcdmac_put_desc_nolock(struct atcdmac_chan *dmac_chan,
> > +				    struct atcdmac_desc *desc)
> > +{
> [ ... ]
> > +		list_del_init(&desc->desc_node);
>
> [Severity: High]
> Can this trigger a NULL pointer dereference as described above?
>
> [ ... ]
> > +static void atcdmac_start_next_trans(struct atcdmac_chan *dmac_chan)
> > +{
> > +	struct atcdmac_desc *next_tx = NULL;
> > +	struct atcdmac_desc *dma_desc;
> > +
> > +	if (dmac_chan->cyclic) {
> > +		/* Get the next DMA descriptor from tx_list. */
> > +		dma_desc = atcdmac_get_active_head(dmac_chan);
> > +		dma_desc->at = dma_desc->at->next;
>
> [Severity: High]
> Could this dereference an invalid pointer if the active_list is empty?
>
> The channel-wide cyclic flag is sticky and is never cleared when a transfer
> is terminated. If atcdmac_start_next_trans is called (for example, during
> system resume) on a previously cyclic channel that is now idle, active_list
> will be empty.
>
> Using list_first_entry via atcdmac_get_active_head on an empty list returns
> a bogus pointer, leading to a fault when dma_desc->at is accessed.
>
> [ ... ]
> > +static void atcdmac_advance_work(struct atcdmac_chan *dmac_chan)
> > +{
> [ ... ]
> > +	if (dmac_chan->cyclic) {
> > +		if (!stop)
> > +			atcdmac_start_next_trans(dmac_chan);
> > +
> > +		spin_unlock_irqrestore(&dmac_chan->lock, flags);
> > +		res.result = DMA_TRANS_NOERROR;
> > +		dmaengine_desc_get_callback_invoke(&dma_desc->txd, &res);
>
> [Severity: Critical]
> Is there a use-after-free race here if atcdmac_terminate_all runs
> concurrently?
>
> dma_desc remains in the unlocked active_list while the channel lock is dropped
> to invoke the client callback. If another thread calls atcdmac_terminate_all,
> it will splice active_list, abort the channel, manually run the callback on
> dma_desc again, and return it to the free_list.
>
> Another CPU can then immediately reallocate the descriptor and overwrite the
> callback pointers while the first CPU is still reading them to execute, which
> could lead to arbitrary code execution.
>
> [Severity: High]
> Can this delayed threaded IRQ cause a double-start race with system resume?
>
> If a transfer finishes right before suspend, the hardware interrupt fires
> but the threaded IRQ handler may not execute before the system freezes. On
> resume, stop_mask is cleared and the transfer is restarted. When normal
> operations resume, this delayed threaded IRQ runs, finds stop cleared, and
> erroneously double-starts the transfer while it is already actively running.
>
> [ ... ]
> > +static irqreturn_t atcdmac_interrupt(int irq, void *dev_id)
> > +{
> > +	struct atcdmac_dmac *dmac = dev_id;
> > +	struct atcdmac_chan *dmac_chan;
> > +	unsigned int status;
> > +	unsigned int int_ch;
> > +	int ret = IRQ_NONE;
> > +	int i;
> > +
> > +	regmap_read(dmac->regmap, REG_INT_STA, &status);
> > +	int_ch = READ_ONCE(dmac->used_chan) & DMA_INT_ALL(status);
>
> [Severity: High]
> Does masking hardware interrupts with the software used_chan state risk an
> unacknowledged IRQ storm?
>
> If an interrupt fires for a channel where the software used_chan bit is 0
> (such as an abort interrupt triggered by atcdmac_terminate_all on an idle
> channel), int_ch evaluates to 0.
>
> The handler bypasses the clear routine and returns without acknowledging the
> hardware interrupt, potentially causing an infinite loop of interrupts.
>
> > +
> > +	while (int_ch) {
> > +		spin_lock(&dmac->lock);
>
> [Severity: High]
> Is it safe to use a standard spinlock_t in hardirq context here?
>
> On PREEMPT_RT kernels, spinlock_t is implemented as an RT mutex which can
> sleep. Locks acquired in genuine hardware interrupt context typically need
> to be typed as raw_spinlock_t to avoid scheduling while atomic.
>
> > +		dmac->used_chan = READ_ONCE(dmac->used_chan) & ~int_ch;
> > +		spin_unlock(&dmac->lock);
> > +		regmap_write(dmac->regmap, REG_INT_STA, DMA_INT_CLR(int_ch));
>
> [Severity: Medium]
> Does writing a blanket clear mask erase unhandled interrupts?
>
> The DMA_INT_CLR macro writes 1s to the TC, ABT, and ERR bits for the given
> channel, regardless of which interrupts were actually set in the status read.
> If a new interrupt (like ERR) asserts after the status read but before this
> clear write, it gets cleared but never handled.
>
> [ ... ]
> > +static int atcdmac_terminate_all(struct dma_chan *chan)
> > +{
> [ ... ]
> > +	spin_lock_irqsave(&dmac_chan->lock, flags);
> > +	atcdmac_abort_chan(dmac_chan);
> > +	atcdmac_enable_chan(dmac_chan, 0);
> > +	ret = regmap_read_poll_timeout_atomic(dmac_chan->dma_dev->regmap,
> > +					      REG_CH_EN,
> > +					      val,
> > +					      !(val & BIT(dmac_chan->chan_id)),
> > +					      10,
> > +					      ATCDMAC_CHAN_TIMEOUT_US);
>
> [Severity: High]
> Can this cause a soft lockup by polling for up to 100ms with interrupts
> disabled?
>
> Calling regmap_read_poll_timeout_atomic with a 100,000us timeout while
> holding a spinlock in hardirq-disabled context can trigger the NMI watchdog
> and create extreme system latency spikes.
>
> [ ... ]
> > +	list_for_each_entry_safe(desc_cur, desc_next, &list, desc_node) {
> > +		atcdmac_run_tx_complete_actions(desc_cur, DMA_TRANS_ABORTED);
>
> [Severity: High]
> Is it permissible to invoke completion callbacks for aborted transfers?
>
> The dmaengine API explicitly prohibits executing callbacks for aborted
> descriptors because clients (such as ALSA) typically call terminate_all with
> their own stream locks held. Invoking the callback here can cause a deadlock
> when the client attempts to acquire the exact same lock.
>
> [ ... ]
> > +static int atcdmac_probe(struct platform_device *pdev)
> > +{
> [ ... ]
> > +	ret = dma_async_device_register(&dmac->dma_device);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = atcdmac_init_irq(pdev, dmac);
> > +	if (ret)
> > +		goto err_dma_async_register;
> > +
> > +	ret = atcdmac_init_iocp(pdev, dmac);
>
> [Severity: High]
> Are the DMA channels exposed to clients before the IRQ handler and cache
> coherency (IOCP) are fully initialized?
>
> dma_async_device_register makes the DMA channels immediately available to
> kernel clients. If a client immediately requests a channel and starts a
> transfer before atcdmac_init_irq and atcdmac_init_iocp execute, the transfer
> will run without cache snooping configured, which could lead to memory
> corruption.
>
> [ ... ]
> > +static int atcdmac_resume(struct device *dev)
> > +{
> [ ... ]
> > +	list_for_each_entry_safe(chan,
> > +				 chan_next,
> > +				 &dmac->dma_device.channels,
> > +				 device_node) {
> > +		dmac_chan = atcdmac_chan_to_dmac_chan(chan);
> > +		spin_lock_irqsave(&dmac_chan->lock, flags);
> > +		atcdmac_start_next_trans(dmac_chan);
>
> [Severity: High]
> Could this improperly restart idle cyclic channels?
>
> This unconditionally calls atcdmac_start_next_trans for every channel
> regardless of its active software state. If a channel was previously cyclic
> but is currently idle, it will cause a fault as described earlier when
> dereferencing the empty active_list.
>
> [ ... ]
> > +static int atcdmac_suspend(struct device *dev)
> > +{
> > +	struct atcdmac_dmac *dmac = dev_get_drvdata(dev);
> > +	int ret;
> > +	unsigned long flags;
> > +
> > +	spin_lock_irqsave(&dmac->lock, flags);
> > +	dmac->stop_mask = BIT(dmac->num_ch) - 1;
> > +	spin_unlock_irqrestore(&dmac->lock, flags);
> > +	ret = atcdmac_wait_chan_idle(dmac,
> > +				     dmac->stop_mask,
> > +				     ATCDMAC_CHAN_TIMEOUT_US * dmac->num_ch);
>
> [Severity: High]
> Will system suspend time out and fail if a slave DMA channel is actively
> waiting for peripheral data?
>
> The suspend sequence sets a stop_mask that prevents software from chaining the
> next descriptor, but does not pause actively running transfers. It then blocks
> waiting for all channels to report idle.
>
> If a DEV_TO_MEM slave channel is waiting for hardware flow control or
> incoming data, it will never complete. The polling loop will eventually time
> out, aborting the entire system sleep transition.
>
> [ ... ]
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260911072524.1297406-1-cl634@andestech.com?part=2
