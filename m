Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11020084.outbound.protection.outlook.com [52.101.228.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54EFE480DED;
	Wed, 15 Jul 2026 15:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784130477; cv=fail; b=VjUFn6Iw5bVRzb7zQgFMgpq1tVYheOfq952XekCWU6D5HDiiJSr+Zx1pmJ4rxW2UYMfGV/BGw9JOad4vHzIGG10VYIhW39erf2cw70w/i2wm+eZwXDrLdgT9RaV/iiVpJxhWVgYSn6fcwHHIdDFoogQy1lvbhZRhNGW2TnHjbKY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784130477; c=relaxed/simple;
	bh=BdKy6Gn45w0UANpKSdDz2Bj1PRfHYAoS74WbqF8OMXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZsJ8CT0NqtvWTOJk0HNfMav1gLKrI+YfZkzfi78FRgMxpTfJTgqskCxG/PUqOBtRaG+qJYg3iDdx9/+xpijM48uYF+aR7kGJGxkPuZ+K37l/xaHukdKh+pyelg4GUEzagx1k9+eVohr6wKkwWnc8wOMAq+BybLxqGmCaTKDler8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=vj1wyF0r; arc=fail smtp.client-ip=52.101.228.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="vj1wyF0r"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jto9eC3F9cfR2yQ58VzwerX0jDH2kjh2cjozSp7ByUYq7eYRcj3Zgn/lCSmpcE2w/RWLnt79TXE7Lmjc55C7ifuk7npOk+24S0/IKdoBnhn9zwQmb8hijUt0NlPQh2Q3GpvBd3GYeWwu2W+eu/c/I0sCP0zo3LXijjj0JTdtUYb7/GfwOQ6Dx7nAk/Q7pq8BgBORGC5V1jnhxx9DoE3uo5rngQ3SejRbP46som8A7cyTb1hyk0h0nYdhl3qaS864tqJnj5Nwm8iDhjPIgXHRSrsHHKLzs2PPtnW6ydhiKZ9E1wLQAZmskzkZyyg0ZmGBjlxdECKRA07gkS6bS1PWfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=symtyo4jbCzOaU8ZNoYrI69P/JYJmd9EwAapVnv+a2M=;
 b=mCg8zFRgNWddiD9NVmdVll/g98TjIsxJr1tLwKnac4He/YNxvyK8NILwR50TpisSh8oj9S1iBGCc4j/3iD5ZeddUsm7Uc7ohiQ8aVyAKLYMIq0nDG5lTI4mnEM5AaI+oI2rbF2f0K9ewcvl0/wvJvZL+Us2rMRsabCUftqXciyDUulaHsVuIjF+flqKQpO0l1tbicBZyPhs5t+s4LgQ59kM/QzV33vbO2Z44jAR/tGqEV+B5pASQHBD2iB0ZE/RS3ncQ4FgAhFdOaYuzVYZ/BizqFrQHrwXz3u4eKkZzc1PO6qXeTjM9eHKdXF3wlmy6RwXAx/hzvzzdbACOAdlZ3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=symtyo4jbCzOaU8ZNoYrI69P/JYJmd9EwAapVnv+a2M=;
 b=vj1wyF0rpk180c3BXGDWnyu+19br9IeViYzgGfHgbP/sWtVzJBLHfl/s+ngNX13vbwEazM85RH1fkKksC27zPL8ALFooGrsUVtCKIV/PXwXsf2Bp9tGWrn0j1t6U+P2eAMCfsuZRRsy+CTJGmDnk7r0fAuh4za/H2G9NuqcUgqI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYCP286MB1756.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:11d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Wed, 15 Jul
 2026 15:47:50 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 15:47:50 +0000
Date: Thu, 16 Jul 2026 00:47:49 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, Cai Huoqing <cai.huoqing@linux.dev>, 
	Serge Semin <fancer.lancer@gmail.com>, Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>, 
	Devendra K Verma <devendra.verma@amd.com>, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] dmaengine: dw-edma: Defer channel IRQ handling to
 workqueue
Message-ID: <57v2j5ggivqb6marfvdxqiyo5megvhchwh7vg52g5x7u3cssgt@kxa56zjvvun3>
References: <20260710080903.2392888-1-den@valinux.co.jp>
 <20260710080903.2392888-8-den@valinux.co.jp>
 <alJZSKF7D-tx1BV5@SMW015318>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alJZSKF7D-tx1BV5@SMW015318>
X-ClientProxiedBy: TY4PR01CA0026.jpnprd01.prod.outlook.com
 (2603:1096:405:2bf::12) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYCP286MB1756:EE_
X-MS-Office365-Filtering-Correlation-Id: 64af32e1-9356-4f3d-fd0c-08dee2886d08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|10070799003|366016|1800799024|10067099003|56012099006|4143699003|22082099003|18002099003|4133799003;
X-Microsoft-Antispam-Message-Info:
	cEjfWslNQGuWxtdAGtkGwbgZ0XdMkIU6CA0Rd20bdYPXYUU3WC6//yrJNQ+Gu9z+vWibHlKEQJHdr6Hp2G7Xoz6pr3hA3Ig6kWY9lYDGeNYASv4sSZNDDIgr70wibhNcQSwH3vsCJRlnFOY2TQKlotEXxx6l7oXYh4T26ZgpYAZ2cEwE5Xb8jtNDK/rcAgYN9XUMU24q9SfLjRscVEtj4qAs2pDihYXpdZ0Is2B+skxmvV+8iB6ej3c1GXZJ4t123tpkhlZbxOLYbI+wFPzLp9V+W5OwJBFYAJ9ag5jALWDzhoVFvd1sq1phH0T7cTxkJF8AVfFLAKU3JwAQLhKkol9JgpPUtWs30XurhQ279WH3fqDoch/o8TlWAo5Rv/SaWxQ1h+1L3NB9EUn227ipTCouSKKejprf6IOHuIcd+YpGbMl/FQ9J3uqWm3qgHXtEGGQ9hnLG9aSzww9L2R/3J00N6QsHpWLkw/eqZdQ8sd4qMxcNipXd550MAAk3205PQkSV7uINQD2BIUQiHAMflD6uMw2QYRSrDNXxuOyOx/zzQyy5SPMx9B+NEkNbixlr7RzqllUP0Og/qE2KugOxLrKRFrAoN+H3NrvprR38lapjs0h6cEx1pEQpamTvzDKmIa9/ou6OtzHpgTI6q19uJl9p9Cx5s5wj4e/oIqKrM0o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(10070799003)(366016)(1800799024)(10067099003)(56012099006)(4143699003)(22082099003)(18002099003)(4133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YpzznwFyWwdDmrz9/LMA3d0TZnBduvp7drwsaorNYnPpPR10RjRp2YBoO/Jf?=
 =?us-ascii?Q?GfKhgyzA4P98mPU4kG2/t94kS9i8hRhlw9ZRlse6/w3qMt1VDjs6jd6XhlSQ?=
 =?us-ascii?Q?4/0X6/oXiqMaW25Jh72FV3J7kBHn0sD8QJhTE0OSeKPvXxVzfgI+UlumYkiO?=
 =?us-ascii?Q?OfBByl19wyLHaLnBpwGY59qUKK64970/Rnm4noo6OYTuExVD5Eo/kJcu+LAF?=
 =?us-ascii?Q?gxluKHM0B79EbjQErM8Acn89PXS97E/N/9z74c1I8Bt2USH2JLQwLIFcZYFR?=
 =?us-ascii?Q?VwFmQEtkrvIqvds61XTALOx1bWBr2Vsd/GjpbKOydLkJsPSarX2RCTHW4Bde?=
 =?us-ascii?Q?StW20UCjD+pB9+LE7h2wcXS937Xd3ZmAx7wF+dMS4WNwFz9G0VEzQ5/AFkB0?=
 =?us-ascii?Q?igpfswnMxeA9irdm0IaQbM4IHnD591mp5Qr53539YihePgKuulRQXUCmZW17?=
 =?us-ascii?Q?V1ql+wf4nrVJKISjCxg7yVtVx9udCaHPylAVmEdSWTn3LNF7RZorbmLq6W3e?=
 =?us-ascii?Q?Tosi0xd1ND3klQxntjFyOu6xZvVfaADlGVDSdXmhd7c+eHDPxz32jslsFmvA?=
 =?us-ascii?Q?L172Hcgc/U0pZ6TMmRz+bl/x8E8yX876l9owvqXcXOS4nkFKwIVpNXQ8nOq7?=
 =?us-ascii?Q?wvIndgI5xRCaYWe+5RAtYrzG+DraVYj2CNH1zHEC4Uy5u2vLDA+1bZW2iPaq?=
 =?us-ascii?Q?+3Tr6+3pqIEJFg5WMBrKUJtWh58x/EnMxubwCem3Ih3jYFtxi/DU1gilo/1Y?=
 =?us-ascii?Q?GKGpMvHzjT6ibqOtLv2YXqm37cd86rGsaOZqeDwqxTxNGANRJMP9ykT32qXV?=
 =?us-ascii?Q?3ywYFiNXc3yqxt28MFKNmmjTer8z70dHK2NIONNlqk0Jur16Leo5MIFOShay?=
 =?us-ascii?Q?xBxz3gaVvFFjSTX3IsoDMpo92cx4vNR59dRzh4uNG8crca9kMrDaXmSvZed1?=
 =?us-ascii?Q?HcLPztd+BoukAUGMz6kRvi7XTZTqZLEkqKCPK4N5KmKvoFWQM3FdN+n7fGJB?=
 =?us-ascii?Q?xWrGL7prZUU7ucHOIDgOMeWuvLpB5jjXGnrZCWsYTMJd2kmlT5tS2r66nOJN?=
 =?us-ascii?Q?Wxzho2qqPk3UFFp9v6i/E3PMXJyGQS7/P+qvtPzC6i6ZVAIW4iMfScjQjUwr?=
 =?us-ascii?Q?BDVgkN1WxTP6674v3a0ioXtRda0KKb+BiDcXLGoC3HicOfYrxTCaLzEANRuH?=
 =?us-ascii?Q?16Iyn/QWR5MMuGlgyvCnyi5QPb7XNNjV1jNsb9uz0rK+UHHReIl/XnfLb/Wl?=
 =?us-ascii?Q?SX0EwvH9IqvoQt4xf9RTPHy9rA1NID0atpfOQ5LngEZQ5db7apouQyO5kYZH?=
 =?us-ascii?Q?tbF+jVwBMPfV1T3Evsw7SDeJt2a7KogvdxihO/hekS/DJk4fjPhCS0nCpTGD?=
 =?us-ascii?Q?lbmaUezYfP5/cKqWzxtQ0Dz0jLxi911ETq7KOzYTcn1wbg8VFTcPwqqN8ZsA?=
 =?us-ascii?Q?Q7dwGxSEeKWppWUW4vbul0omOwd3O/TWgJNl+BNeiURLzGQlf7Ed20AlIxdH?=
 =?us-ascii?Q?j0CCyCr/ElHn7Hadk0lsxY1Jo0K8fBbHKOBrfReBB6k90zToAgZk9TTouYEV?=
 =?us-ascii?Q?MMNuef1Z+cl6LXUt+w7LPJ0UzF8lYnLuK5QQqkCSVb1cQGeaiE4Ehewe9gUk?=
 =?us-ascii?Q?3YBOa5LzwpRnEVGQCFd/hAj1gKXIddhe2ZitkMdbf0qqg23EPLmrW0EO7HMs?=
 =?us-ascii?Q?tm3G0zqpwF7b37IEFKpW7cwEPwuatoigNwNResBSbvXr54/PoX5Ww+8V7bEl?=
 =?us-ascii?Q?7j6M35tymB/HYa+x/u6z9b3p9xxm0GQ5e6o6SCsmrledAl78PIHT?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 64af32e1-9356-4f3d-fd0c-08dee2886d08
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 15:47:50.6880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g7/0aKNQJ/xhfywdcABvkwYmzSeX3z0fo9j+l+HWijzXX6e6r3rBPnBgfHmzexTVRXvpZ0i5Gfko4u4lBGHCKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB1756

On Sat, Jul 11, 2026 at 09:55:04AM -0500, Frank Li wrote:
> On Fri, Jul 10, 2026 at 05:09:03PM +0900, Koichiro Den wrote:
> > On some SoCs (e.g. R-Car S4) the endpoint-side eDMA raises a single
> > fixed SPI that is hardwired to CPU0 and covers every read and write
> > channel. Handling channel events directly in that hard IRQ context
> > serializes the completion processing of all channels on one CPU:
> > descriptor recycling and refill, client callbacks (the vchan tasklet
> > runs on the scheduling CPU) and the doorbell writes all funnel through
> > CPU0, while the handler additionally spins on each channel's vc.lock.
> > Especially under multi-channels heavy load, the contention becomes a
> > performance bottleneck.
> >
> > Keep the hard IRQ handler minimal and have it just clear the status and
> > dispatch, defer the per-channel processing to work items. A work item
> > per channel preserves per-channel ordering while letting the channels be
> > processed in parallel on any CPU.
> >
> > Signed-off-by: Koichiro Den <den@valinux.co.jp>
> > ---
> 
> It looks good, allen try convert bh tasklet to workqueue.
> https://lore.kernel.org/dmaengine/CAOMdWSLVk136RzEyiN76zqk65VLwYms0hCDi5Kww9FQppie12A@mail.gmail.com/
> 
> Please double check if it can apply to dw-edma?

Thanks for the pointer. IIUC, Allen and Arnd had agreed there that the common
per-channel BH path work is for the vchan client callbacks, and tasklets/works
serving other purposes are to be dealt with case-by-case (hardirq, threaded irq
or a regular workqueue, depending on the driver). dw->wq here is the latter
kind, it exists mostly to relieve the hard IRQ handler, and also to spread the
per-channel servicing across CPUs. I don't think this one gets commonized as
well.

That conversion itself should apply to dw-edma fine on top of this patch, so
I'll keep an eye on it.

Best regards,
Koichiro

> 
> Frank
> 
> > Changes in v2:
> >   - New patch in v2, posted as part of this preparation series.
> >
> >  drivers/dma/dw-edma/dw-edma-core.c | 73 ++++++++++++++++++++++++++++--
> >  drivers/dma/dw-edma/dw-edma-core.h | 12 +++++
> >  2 files changed, 80 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> > index 5664421c6f15..704d8f9746e8 100644
> > --- a/drivers/dma/dw-edma/dw-edma-core.c
> > +++ b/drivers/dma/dw-edma/dw-edma-core.c
> > @@ -31,6 +31,11 @@ struct dw_edma_desc *vd2dw_edma_desc(struct virt_dma_desc *vd)
> >  	return container_of(vd, struct dw_edma_desc, vd);
> >  }
> >
> > +enum dw_edma_irq_event {
> > +	DW_EDMA_IRQ_DONE	= BIT(0),
> > +	DW_EDMA_IRQ_ABORT	= BIT(1),
> > +};
> > +
> >  static inline
> >  u64 dw_edma_get_pci_address(struct dw_edma_chan *chan, phys_addr_t cpu_addr)
> >  {
> > @@ -748,6 +753,44 @@ static void dw_edma_abort_interrupt(struct dw_edma_chan *chan)
> >  	chan->status = EDMA_ST_IDLE;
> >  }
> >
> > +static void dw_edma_irq_work(struct work_struct *work)
> > +{
> > +	struct dw_edma_chan *chan = container_of(work, struct dw_edma_chan,
> > +						 irq_work);
> > +	unsigned int events;
> > +
> > +	do {
> > +		events = atomic_xchg(&chan->irq_pending, 0);
> > +
> > +		if (events & DW_EDMA_IRQ_DONE)
> > +			dw_edma_done_interrupt(chan);
> > +		if (events & DW_EDMA_IRQ_ABORT)
> > +			dw_edma_abort_interrupt(chan);
> > +		/*
> > +		 * Correctness does not depend on this loop: queue_work() can
> > +		 * requeue once the work item starts running. Staying here just
> > +		 * coalesces back-to-back channel events into one wakeup.
> > +		 */
> > +	} while (atomic_read(&chan->irq_pending));
> > +}
> > +
> > +static void dw_edma_queue_irq_work(struct dw_edma_chan *chan,
> > +				   enum dw_edma_irq_event event)
> > +{
> > +	atomic_or(event, &chan->irq_pending);
> > +	queue_work(chan->dw->wq, &chan->irq_work);
> > +}
> > +
> > +static void dw_edma_done_interrupt_deferred(struct dw_edma_chan *chan)
> > +{
> > +	dw_edma_queue_irq_work(chan, DW_EDMA_IRQ_DONE);
> > +}
> > +
> > +static void dw_edma_abort_interrupt_deferred(struct dw_edma_chan *chan)
> > +{
> > +	dw_edma_queue_irq_work(chan, DW_EDMA_IRQ_ABORT);
> > +}
> > +
> >  static void dw_edma_emul_irq_ack(struct irq_data *d)
> >  {
> >  	struct dw_edma *dw = irq_data_get_irq_chip_data(d);
> > @@ -842,8 +885,8 @@ static inline irqreturn_t dw_edma_interrupt_write_inner(int irq, void *data)
> >  	struct dw_edma_irq *dw_irq = data;
> >
> >  	return dw_edma_core_handle_int(dw_irq, EDMA_DIR_WRITE,
> > -				       dw_edma_done_interrupt,
> > -				       dw_edma_abort_interrupt);
> > +				       dw_edma_done_interrupt_deferred,
> > +				       dw_edma_abort_interrupt_deferred);
> >  }
> >
> >  static inline irqreturn_t dw_edma_interrupt_read_inner(int irq, void *data)
> > @@ -851,8 +894,8 @@ static inline irqreturn_t dw_edma_interrupt_read_inner(int irq, void *data)
> >  	struct dw_edma_irq *dw_irq = data;
> >
> >  	return dw_edma_core_handle_int(dw_irq, EDMA_DIR_READ,
> > -				       dw_edma_done_interrupt,
> > -				       dw_edma_abort_interrupt);
> > +				       dw_edma_done_interrupt_deferred,
> > +				       dw_edma_abort_interrupt_deferred);
> >  }
> >
> >  static inline irqreturn_t dw_edma_interrupt_write(int irq, void *data)
> > @@ -930,6 +973,7 @@ static void dw_edma_device_synchronize(struct dma_chan *dchan)
> >  	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
> >
> >  	dw_edma_wait_termination(dchan);
> > +	cancel_work_sync(&chan->irq_work);
> >  	vchan_synchronize(&chan->vc);
> >  }
> >
> > @@ -972,6 +1016,8 @@ static int dw_edma_channel_setup(struct dw_edma *dw, u32 wr_alloc, u32 rd_alloc)
> >  		chan->configured = false;
> >  		chan->request = EDMA_REQ_NONE;
> >  		chan->status = EDMA_ST_IDLE;
> > +		INIT_WORK(&chan->irq_work, dw_edma_irq_work);
> > +		atomic_set(&chan->irq_pending, 0);
> >
> >  		if (chan->dir == EDMA_DIR_WRITE)
> >  			chan->ll_max = (chip->ll_region_wr[chan->id].sz / EDMA_LL_SZ);
> > @@ -1185,10 +1231,21 @@ int dw_edma_probe(struct dw_edma_chip *chip)
> >  	/* Disable eDMA, only to establish the ideal initial conditions */
> >  	dw_edma_core_off(dw);
> >
> > +	/*
> > +	 * Deferred IRQ works are queued from the hard IRQ handlers, so the
> > +	 * workqueue must exist before any IRQ is requested.
> > +	 */
> > +	dw->wq = alloc_workqueue("dw-edma:%s", WQ_UNBOUND | WQ_HIGHPRI, 0,
> > +				 dev_name(chip->dev));
> > +	if (!dw->wq)
> > +		return -ENOMEM;
> > +
> >  	/* Request IRQs */
> >  	err = dw_edma_irq_request(dw, &wr_alloc, &rd_alloc);
> > -	if (err)
> > +	if (err) {
> > +		destroy_workqueue(dw->wq);
> >  		return err;
> > +	}
> >
> >  	/* Allocate a dedicated virtual IRQ for interrupt-emulation doorbells */
> >  	err = dw_edma_emul_irq_alloc(dw);
> > @@ -1211,6 +1268,7 @@ int dw_edma_probe(struct dw_edma_chip *chip)
> >  	for (i = (dw->nr_irqs - 1); i >= 0; i--)
> >  		free_irq(chip->ops->irq_vector(dev, i), &dw->irq[i]);
> >  	dw_edma_emul_irq_free(dw);
> > +	destroy_workqueue(dw->wq);
> >
> >  	return err;
> >  }
> > @@ -1235,6 +1293,11 @@ int dw_edma_remove(struct dw_edma_chip *chip)
> >  		free_irq(chip->ops->irq_vector(dev, i), &dw->irq[i]);
> >  	dw_edma_emul_irq_free(dw);
> >
> > +	for (i = 0; i < dw->wr_ch_cnt + dw->rd_ch_cnt; i++)
> > +		cancel_work_sync(&dw->chan[i].irq_work);
> > +
> > +	destroy_workqueue(dw->wq);
> > +
> >  	/* Deregister eDMA device */
> >  	dma_async_device_unregister(&dw->dma);
> >  	list_for_each_entry_safe(chan, _chan, &dw->dma.channels,
> > diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
> > index 6474cacf7195..a6a9ed09fe1b 100644
> > --- a/drivers/dma/dw-edma/dw-edma-core.h
> > +++ b/drivers/dma/dw-edma/dw-edma-core.h
> > @@ -9,8 +9,10 @@
> >  #ifndef _DW_EDMA_CORE_H
> >  #define _DW_EDMA_CORE_H
> >
> > +#include <linux/atomic.h>
> >  #include <linux/msi.h>
> >  #include <linux/dma/edma.h>
> > +#include <linux/workqueue.h>
> >
> >  #include "../virt-dma.h"
> >
> > @@ -87,6 +89,9 @@ struct dw_edma_chan {
> >
> >  	struct dma_slave_config		config;
> >  	bool				non_ll;
> > +
> > +	struct work_struct		irq_work;
> > +	atomic_t			irq_pending;
> >  };
> >
> >  struct dw_edma_irq {
> > @@ -109,6 +114,13 @@ struct dw_edma {
> >
> >  	struct dw_edma_chan		*chan;
> >
> > +	/*
> > +	 * Deferred channel IRQ handling. WQ_HIGHPRI keeps
> > +	 * completion processing from starving behind saturated user load;
> > +	 * WQ_UNBOUND spreads per-channel works across CPUs.
> > +	 */
> > +	struct workqueue_struct		*wq;
> > +
> >  	raw_spinlock_t			lock;		/* Protect v0 shared registers */
> >
> >  	struct dw_edma_chip             *chip;
> > --
> > 2.51.0
> >
