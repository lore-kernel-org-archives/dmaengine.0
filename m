Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11020124.outbound.protection.outlook.com [52.101.228.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A48377AAF;
	Tue, 28 Jul 2026 06:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785218639; cv=fail; b=GyYBtIJUVRhSxF/cDiYvlEMoboT5hHCcBYaca7KLEcmMt2mXBwj16MK+o3uQlW/C4iyesGNnLnyWYUNDITjNF0Xpqrx09zwvPCdBwHHRP0kzhi4zHWI7IIOA2FfDt3ClDev0eZWRO9dcwD/XeHJ/g0qligKAK2Z84CDpYoBQJDE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785218639; c=relaxed/simple;
	bh=Fq3pYrLoqtZL7nIma9lVDtYt4UReXGdoHYMZMhO4la8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IyEFcdBt2h64ymsfhnDn8lRfMQFkaMlajzvSILDvzMQK1XmPW/Kq0qLRoR5ElQ6pGTJboPHn8hZC23CjOzgrI54OviOZW1GhdkX2eG6TlB9qKW4It0z5XRNcbDxqIRf5JcX9dW2nmeu9pOqCRl4HmiZlalkI0MxPe6mmHtdDegc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=vZihJbUL; arc=fail smtp.client-ip=52.101.228.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="vZihJbUL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nbD90pUnx1g3mWV6czP0DA+iRcCg98eEpuFmzRjpIAwCTnfX3peRaQAesuOOn8ks/5qxPWE5UcZdZYt3bn5aB4Fo3GjP/EGzUJWl2rhawPmpb6xv3cqdmq59wal/EmrYR4//9LWsCImvMAhjtxaCh5dpyyZuz9tRn7O0e3lcz8VHGNisXYpLgj9yiQarbqdoOw+QSgnABG16KaXuzjvedvtSr77q3u6B2DBdQSIm8X6qDFEiMpQqhIYSDN3HDOFvY5jBymwqyNEjOz/HsNcsfY8crI5y3Ucmr8hjYaEgm/gxdlPtLK8XmrQju/gnFLVWRlNS9XIMX7s4h7xsO/SqVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OO4y6D1nCZ/+Ca1/d1/xsEX+lDaUNBUK3lI3GvA0lU0=;
 b=G0a9bEcSfH1c2MVMwTQJUzdw7kjbeuIPLCZlkUzHH9VC+6xkcMvhqPu4N6Bf7N7aMAHJ1LOXI/FWgjFeafZro3xYDK6Ui4cFFdL5Qe0z9tAWIcTLcKzFIBlJxpu2yWIDbMnIltKgx5awYysC7nLrtknXOzhZN5xUa5zJmOB9Jyd4u++VjIB9R4u0Au0DrpvpKxM9qu5I7fJWtf4rkNgoyOH/MKak56oftUZjQOJOphpDdvUiBYH8PhAtq256TNOpoEbnCLwaA8UDDXxO1nkS1ghe45btd7FYigtr8LBIdoV87jZ/iDdSXMg0eQs8eA4zXAEE1s5QCC0cXSpdo4ZjJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OO4y6D1nCZ/+Ca1/d1/xsEX+lDaUNBUK3lI3GvA0lU0=;
 b=vZihJbULV9MsHnG8/h4p4pSnaqNTFH/yTarNmjgAnLqgYk6zOHHpCXnX4UAV11csxlmNEwml1t/c7b1QI3K38/U+JHaaIafmIiUUVreA0yrqOdxX5P6rill6JlQiB2ZSF67EeTctfZxPPD6Vr017NNS1lWykQv/gkwZ7W0WmJrU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TY4P286MB6047.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:26b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 06:03:54 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 06:03:54 +0000
Date: Tue, 28 Jul 2026 15:03:53 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>, 
	Kees Cook <kees@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Christoph Hellwig <hch@lst.de>, Serge Semin <fancer.lancer@gmail.com>, 
	Cai Huoqing <cai.huoqing@linux.dev>, Niklas Cassel <cassel@kernel.org>, 
	Devendra K Verma <devendra.verma@amd.com>, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 11/24] dmaengine: dw-edma: Serialize LL event capture
 with channel kicks
Message-ID: <edypqjxsplctght75uuixih4lvyddonptxjq6mnjw4emgwa4mr@wjn5xbvvfwj4>
References: <20260727170323.2321369-1-den@valinux.co.jp>
 <20260727170323.2321369-12-den@valinux.co.jp>
 <amfBEK4qPJNTkB1A@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amfBEK4qPJNTkB1A@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: TYCP286CA0123.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::11) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TY4P286MB6047:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c1c34ff-754e-4b35-1725-08deec6e0105
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|23010399003|1800799024|7416014|366016|376014|56012099006|4143699003|10067099003|6133799003|5023799004|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	bqZaOmbfF1RA4UxrPcmtJr3Sgz6e9rx6GdTUdrID7fCsfak/bvW+0qgMLqo/OSBCE6SnAqrpaJ9gtYQqqgRCsgaKldEnpPJO2wiieyXN46ju6oTaUqXYAt95GpqxMhFFQ1+FVd/mrAEpK+fRgII3QKRqbhpPLC2hhkN6gDsDjNrH26DcPDxkb6g7RPnJhWRvRPCOsYmRy+jEbu9ysqtnSCbAgW/WwxbMbGPBnECzMuHeOThtWvDCMXXa6+iI+Crh3MV89kUchuX4RKeStNA63v1nLRVkWgK1FiTsmJLsYC0GObhfITfFfLyaYGvMB3Hv9q5/jWrdw/sjByo3BUuO52SxleZ7bWRHxHu3SzNC5r8Tv2/ZdElMqnZaKG1/sKqHUotzshfQbkcYS/ilS/LKmbimt3tJyZ0I/q2zpknUdWfFG2+Ves8QtvbCX2la5gcAlMRSw7Jia6oHh6lfwWmsRss8j8kxln2i4MspqjZtHT5DLwHG73B2yizPbZ+X9T1kmhJsiRj6UlTTKYK4ShaDRXaRc2a7YplZSMVIkf53kB4rDMFDlRM/M0ew8yXHbKtfuhJv98kly7ymoWNZXAUV6dnGrzzM7PjObazhd+GNeYCbGVT7WhqjftRzmn+5AmGKDfH9O49tRcFnYcqyN2lZywHJb15Vgx5HEsMM4zhUWhs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(1800799024)(7416014)(366016)(376014)(56012099006)(4143699003)(10067099003)(6133799003)(5023799004)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eeDJlku67mLWKXq5n/Vh/9fzbgIUgjaXEcTgCNUy/T+R7nNfqAwD6l0k6LU6?=
 =?us-ascii?Q?cz9n8Gpa/+G0D20H71/s9J1s1Uj5ILfPNztbliLm4IrXZNpGlXxg1NkcVkdZ?=
 =?us-ascii?Q?tHi61tRVPE09b84CvbPoIND0aooEBOhk4n6TNTqoxCH3e2XoHZCYRVu+DZGt?=
 =?us-ascii?Q?MYWtlzvtQbhZBPBCsNQ7JToLcVasXIvIz9OL9ZhFjzfopCvLc4UTHi58AUmX?=
 =?us-ascii?Q?oDC6HJLZgYKhvzLpRb2MC8ISkZBtyfEVxDUVIVg9CDe+NsVIFbXgY5y7ke/U?=
 =?us-ascii?Q?xKrHyIoFh3xQtRE4y/zRXBR+Bl8koT1qLzBF/himrHCrRczAAgSvP8PnKYxA?=
 =?us-ascii?Q?LBeA6tyY1s9PrX9sHNsXRuGSn0V52bJU+GbRDHqtLSucGoi49oXCIwlz4JLI?=
 =?us-ascii?Q?ZzH0/0+/Rr1FtNTtJ4Prkt//dvxtxfcOV2RDcTN4we1DBlSYYojqYE5h70dq?=
 =?us-ascii?Q?lqiMykM2vFA7D7bTlk+ReGgc6ffNPT8cByUWyDjGJMw47uCmz7J1u1eT2ulJ?=
 =?us-ascii?Q?db/GYoGkBRk9ibK23s3ys/LsxIxsa5pRiZEi2S8JPb9Uxs0IYW1zsaKWEEDb?=
 =?us-ascii?Q?JGD7mwZP31RWl3sZIahI7IV/UfbT8hysPBXXRnG9C7+ASYSZko9CR58woaMM?=
 =?us-ascii?Q?toYmUge0OMcXam4Av5FC7w087Ye6uijMIlXC5fFmhShyJAIrJsU5zsVt3zGd?=
 =?us-ascii?Q?vscvGJ2LnpLWPMPbRB0iiA/+B+LU6zzpxz4/OH24gRRnD274+K+t5ygv2K+s?=
 =?us-ascii?Q?PGzLHocnyf7DiNLn39VUlkL+tXHNLR1EIPmDebhF2Voea8Cz7B8zGVvUTwKY?=
 =?us-ascii?Q?xy8hyb1QbK0HNBrCQoxyOZP4oopLoXlGBrlqBO7gvbMAi7rXZNRwTNlsvG5x?=
 =?us-ascii?Q?Fke2vAeIT6WWqF8lzbGsKmjJ24Cp8zTbsp1cc6flu3u9+e3bJ2L/cigWjl/u?=
 =?us-ascii?Q?FoxCHQeektl8VxmWjC3wHzY3AR541HM17TeM6VNLHc5wb1XRaPNCTHcNQfgc?=
 =?us-ascii?Q?yXjptHaD6zFjZS6kI8sBXV7HVgbSmEWL2D6/Jp6E1uFyMoNm3pHtgwPuYiz5?=
 =?us-ascii?Q?QZV+BtTN7ok0Ka6oxvFEPwb5Sgg17X6Ju8slXzUAWCWm4eHV1kT5t+7sACBE?=
 =?us-ascii?Q?2O8YmiBLbn6CXz5qFo/dganXF/fTSg5ZZyDjRhgqTGShiI3z2yubKHtW6r6i?=
 =?us-ascii?Q?Cb5qADe674YndLJHv+8JMtnHpdDjWr3nIbtaHbf+wshki0WDJkfz2gDb1Nps?=
 =?us-ascii?Q?wC0Z9MYmYfGpItdozIqRqu+KJ83Oa/7znaA3BHDEftov7z1aexzd5YW9R2o2?=
 =?us-ascii?Q?z7mvSuJTSa77Q7Vu5s9GPiJ21vXQKIC+6NqcpQ02bzhVFv5IOJApmteDWwx2?=
 =?us-ascii?Q?ULvVOP8+tDDoh/vQlymQidaDiP7Q5XgDT/sRPZuaOqKV+7vl52UgbseHqQBz?=
 =?us-ascii?Q?GdufiC+DJE2l2F93UQJsTnRPsGro8iY7rASEroZlhgdzlRFmNbaDQcKWMkM7?=
 =?us-ascii?Q?vKpvhOpNkLWOifq3E9YYnLYZAI5t3bQLOvPV8JPWyoyd6rWN2qj75lFXu83I?=
 =?us-ascii?Q?XKaii5SaRVLR8dOCfBNicWVzpP5p9nSixw+oCERluk7qFktxS2NHcgqdW6x9?=
 =?us-ascii?Q?BIRUWpK5e/GRAgj06I4SoB09uKrrpi+j6ina/9gUOJMsRO8rgvZaeIHt3Usl?=
 =?us-ascii?Q?TgjTO6jCPHU4tjRSKTwCCnKFrde8kyBf5cGV76ibtg/Y+26fupooBqhSRMhY?=
 =?us-ascii?Q?JeAJtxZVRVuEhdz4WqiWNquwnmMTqyJy7vvopdpwtI0bnaWwEQpu?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c1c34ff-754e-4b35-1725-08deec6e0105
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 06:03:54.1916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H8Ep9rs3wy1a6MiC48LPcupI9faUF/d81tk4O8VLNzMy8I6iIDTrsc3rQwoMfPB3P6cjVmhku5Hep95Rp0zC0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4P286MB6047

On Mon, Jul 27, 2026 at 04:35:28PM -0400, Frank Li wrote:
> On Tue, Jul 28, 2026 at 02:03:10AM +0900, Koichiro Den wrote:
> > The hard IRQ path clears interrupt status before deferred handling takes
> > vc.lock. If a doorbell starts a new hardware run in between, the
> > deferred handler can apply an event from the previous run.
> >
> > Use the event lock to serialize the interrupt status read and clear,
> > snapshot recording, and LL doorbell writes. Do not write another
> > doorbell while a snapshot is pending. A ring reset discards the snapshot
> > under the same lock. When events coalesce, keep STOP over PROGRESS.
> >
> > Changing chan->request alone neither changes the ring nor writes a
> > doorbell, so it does not invalidate the snapshot. Preserve it across
> > request changes. A later patch uses PROGRESS and STOP to decide whether
> > a pending STOP or PAUSE request can finish.
> >
> > Signed-off-by: Koichiro Den <den@valinux.co.jp>
> > ---
> > Changes in v3:
> >   - New patch to serialize IRQ event capture with LL doorbell writes and
> >     defer doorbells while an LL event is pending. (Sashiko)
> >   - Add explicit PROGRESS and STOP types for deferred LL snapshots.
> >     (Frank)
> >
> >  drivers/dma/dw-edma/dw-edma-core.c    | 101 +++++++++++++++++++++++++-
> >  drivers/dma/dw-edma/dw-edma-core.h    |  37 ++++++++++
> >  drivers/dma/dw-edma/dw-edma-v0-core.c |  64 ++++++++--------
> >  drivers/dma/dw-edma/dw-hdma-v0-core.c |  32 +++++---
> >  4 files changed, 187 insertions(+), 47 deletions(-)
> >
> > diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> > index e3d0559206d8..3970b066dca2 100644
> > --- a/drivers/dma/dw-edma/dw-edma-core.c
> > +++ b/drivers/dma/dw-edma/dw-edma-core.c
> > @@ -33,7 +33,8 @@ struct dw_edma_desc *vd2dw_edma_desc(struct virt_dma_desc *vd)
> >
> >  enum dw_edma_deferred_event {
> >  	DW_EDMA_DEFERRED_DONE	= BIT(0),
> > -	DW_EDMA_DEFERRED_ABORT	= BIT(1),
> > +	DW_EDMA_DEFERRED_LL	= BIT(1),
> > +	DW_EDMA_DEFERRED_ABORT	= BIT(2),
> >  };
> >
> >  static inline
> > @@ -74,6 +75,52 @@ static void vchan_free_desc(struct virt_dma_desc *vdesc)
> >  	kfree(vd2dw_edma_desc(vdesc));
> >  }
> >
> > +static void dw_edma_ll_snapshot_discard_locked(struct dw_edma_chan *chan)
> > +{
> > +	lockdep_assert_held(dw_edma_event_lock(chan));
> > +
> > +	chan->ll_irq.event = DW_EDMA_LL_EVENT_NONE;
> > +}
> > +
> > +static void dw_edma_ll_snapshot_discard(struct dw_edma_chan *chan)
> > +{
> > +	guard(raw_spinlock_irqsave)(dw_edma_event_lock(chan));
> > +
> > +	dw_edma_ll_snapshot_discard_locked(chan);
> > +}
> > +
> > +/* Must be called with vc.lock held. */
> > +static bool
> > +dw_edma_ll_snapshot_take(struct dw_edma_chan *chan,
> > +			 struct dw_edma_ll_snapshot *snapshot)
> > +{
> > +	guard(raw_spinlock_irqsave)(dw_edma_event_lock(chan));
> 
> Not sure previous why use raw_spinlock, suppose it is wrong. should be
> spin_lock.

Thanks for pointing it out. I checked all event_lock critical sections again,
and yes, you're absolutely right. spinlock_t is enough because:
- the lock serializes interrupt status/LLP capture with an LL kick
  (doorbell). There is no point in ensuring the holder non-preemptible on
  PREEMPT_RT.
- dw_edma_record_irq() builds the new snapshot locally and publishes it only
  once it is fully formed.

> 
> > +
> > +	if (chan->ll_irq.event == DW_EDMA_LL_EVENT_NONE)
> > +		return false;
> > +
> > +	*snapshot = chan->ll_irq;
> > +	dw_edma_ll_snapshot_discard_locked(chan);
> > +
> > +	return true;
> > +}
> > +
> ...
> >
> > +/*
> > + * Lock ordering:
> > + *
> > + *   chan->vc.lock -> dw_edma_event_lock(chan)
> > + *
> > + * Interrupt providers invoke the dw_edma_handler_t callback with the event
> > + * lock held. The callback must not take vc.lock.
> > + */
> > +static inline raw_spinlock_t *dw_edma_event_lock(struct dw_edma_chan *chan)
> > +{
> > +	if (chan->dw->core->event_scope == DW_EDMA_EVENT_PER_DIR)
> > +		return &chan->dw->event_lock[chan->dir];
> > +
> > +	return &chan->event_lock;
> 
> can we change chan:: event_lock to pointer,
> 
> when DW_EDMA_EVENT_PER_DIR
> 
> 	chan->event_lock -> chan->dw->event_lock[chan->dir]
> 
> else
> 	chan->event_lock -> create a lock when register HDMA channel.
> 
> So needn't DW_EDMA_EVENT_PER_DIR,

That looks simpler. Thanks for the suggestion, I'll rework it that way.

> 
> 
> > +}
> > +
> >  /*
> >   * Return the current LL entry index. A negative value means that the channel
> >   * context is not initialized or was lost after a link reset.
> > diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/dw-edma-v0-core.c
> > index b3098eb83442..43e33a400a3e 100644
> > --- a/drivers/dma/dw-edma/dw-edma-v0-core.c
> > +++ b/drivers/dma/dw-edma/dw-edma-v0-core.c
> > @@ -339,8 +339,8 @@ dw_edma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
> >  			   dw_edma_handler_t handler)
> >  {
> >  	struct dw_edma *dw = dw_irq->dw;
> > -	unsigned long total, pos, val;
> > -	irqreturn_t ret = IRQ_NONE;
> > +	u8 events[EDMA_V0_MAX_NR_CH] = {};
> > +	unsigned long total, pos, val, active = 0;
> >  	struct dw_edma_chan *chan;
> >  	unsigned long off;
> >  	unsigned long *mask;
> > @@ -356,45 +356,45 @@ dw_edma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
> >  		mask = dw_irq->rd_mask;
> >  	}
> >
> > -	/*
> > -	 * DONE and ABORT status share one register, and on remote setups
> > -	 * every read is a non-posted round trip across the PCIe link. Take
> > -	 * one snapshot and derive both views from it. An abort raised
> > -	 * after the snapshot is deferred, not lost: only bits observed in
> > -	 * the snapshot are ever cleared below, so its status remains set and
> > -	 * triggers another handler pass.
> > -	 */
> > -	sts = GET_RW_32(dw, dir, int_status);
> > -
> > -	val = FIELD_GET(EDMA_V0_DONE_INT_MASK, sts);
> > -	val &= *mask;
> > -	for_each_set_bit(pos, &val, total) {
> > -		chan = &dw->chan[pos + off];
> > +	scoped_guard(raw_spinlock_irqsave, &dw->event_lock[dir]) {
> 
> use helper dw_edma_event_lock()

Sure. My mistake.

Thanks for the review.
Koichiro

> 
> Frank
> > +		/*
> > +		 * DONE and ABORT status share one register, and on remote setups
> > +		 * every read is a non-posted round trip across the PCIe link. Take
> > +		 * one snapshot and derive both views from it.
> > +		 */
> > +		sts = GET_RW_32(dw, dir, int_status);
> >
> > -		if (unlikely(dw_edma_core_ch_ignore_irq(chan)))
> > -			continue;
> > +		val = FIELD_GET(EDMA_V0_DONE_INT_MASK, sts);
> > +		val &= *mask;
> > +		for_each_set_bit(pos, &val, total) {
> > +			chan = &dw->chan[pos + off];
> >
> > -		dw_edma_v0_core_clear_done_int(chan);
> > -		handler(chan, DW_EDMA_IRQ_DONE);
> > +			if (unlikely(dw_edma_core_ch_ignore_irq(chan)))
> > +				continue;
> >
> > -		ret = IRQ_HANDLED;
> > -	}
> > +			events[pos] |= DW_EDMA_IRQ_DONE;
> > +			active |= BIT(pos);
> > +			dw_edma_v0_core_clear_done_int(chan);
> > +		}
> >
> > -	val = FIELD_GET(EDMA_V0_ABORT_INT_MASK, sts);
> > -	val &= *mask;
> > -	for_each_set_bit(pos, &val, total) {
> > -		chan = &dw->chan[pos + off];
> > +		val = FIELD_GET(EDMA_V0_ABORT_INT_MASK, sts);
> > +		val &= *mask;
> > +		for_each_set_bit(pos, &val, total) {
> > +			chan = &dw->chan[pos + off];
> >
> > -		if (unlikely(dw_edma_core_ch_ignore_irq(chan)))
> > -			continue;
> > +			if (unlikely(dw_edma_core_ch_ignore_irq(chan)))
> > +				continue;
> >
> > -		dw_edma_v0_core_clear_abort_int(chan);
> > -		handler(chan, DW_EDMA_IRQ_ABORT);
> > +			events[pos] |= DW_EDMA_IRQ_ABORT;
> > +			active |= BIT(pos);
> > +			dw_edma_v0_core_clear_abort_int(chan);
> > +		}
> >
> > -		ret = IRQ_HANDLED;
> > +		for_each_set_bit(pos, &active, total)
> > +			handler(&dw->chan[pos + off], events[pos]);
> >  	}
> >
> > -	return ret;
> > +	return active ? IRQ_HANDLED : IRQ_NONE;
> >  }
> >
> >  static void dw_edma_v0_write_ll_data(struct dw_edma_chan *chan, int i,
> > diff --git a/drivers/dma/dw-edma/dw-hdma-v0-core.c b/drivers/dma/dw-edma/dw-hdma-v0-core.c
> > index 64a07fbc5be3..bbf9ee0392f8 100644
> > --- a/drivers/dma/dw-edma/dw-hdma-v0-core.c
> > +++ b/drivers/dma/dw-edma/dw-hdma-v0-core.c
> > @@ -177,10 +177,12 @@ dw_hdma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
> >  			   dw_edma_handler_t handler)
> >  {
> >  	struct dw_edma *dw = dw_irq->dw;
> > -	unsigned long total, pos, val;
> > +	unsigned int events;
> > +	unsigned long total, pos;
> >  	irqreturn_t ret = IRQ_NONE;
> >  	struct dw_edma_chan *chan;
> >  	unsigned long off, *mask;
> > +	u32 val;
> >
> >  	if (dir == EDMA_DIR_WRITE) {
> >  		total = dw->wr_ch_cnt;
> > @@ -197,20 +199,28 @@ dw_hdma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
> >  		if (unlikely(dw_edma_core_ch_ignore_irq(chan)))
> >  			continue;
> >
> > -		val = dw_hdma_v0_core_status_int(chan);
> > -		if (FIELD_GET(HDMA_V0_STOP_INT_MASK, val)) {
> > -			dw_hdma_v0_core_clear_done_int(chan);
> > -			handler(chan, DW_EDMA_IRQ_STOP);
> > +		events = 0;
> > +		scoped_guard(raw_spinlock_irqsave, dw_edma_event_lock(chan)) {
> > +			val = dw_hdma_v0_core_status_int(chan);
> >
> > -			ret = IRQ_HANDLED;
> > -		}
> > +			if (FIELD_GET(HDMA_V0_STOP_INT_MASK, val)) {
> > +				events |= DW_EDMA_IRQ_STOP;
> > +				dw_hdma_v0_core_clear_done_int(chan);
> > +			}
> >
> > -		if (FIELD_GET(HDMA_V0_ABORT_INT_MASK, val)) {
> > -			dw_hdma_v0_core_clear_abort_int(chan);
> > -			handler(chan, DW_EDMA_IRQ_ABORT);
> > +			if (FIELD_GET(HDMA_V0_ABORT_INT_MASK, val)) {
> > +				events |= DW_EDMA_IRQ_ABORT;
> > +				dw_hdma_v0_core_clear_abort_int(chan);
> > +			}
> >
> > -			ret = IRQ_HANDLED;
> > +			if (events)
> > +				handler(chan, events);
> >  		}
> > +
> > +		if (!events)
> > +			continue;
> > +
> > +		ret = IRQ_HANDLED;
> >  	}
> >
> >  	return ret;
> > --
> > 2.51.0
> >
