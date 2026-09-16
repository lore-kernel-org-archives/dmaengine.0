Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011059.outbound.protection.outlook.com [52.101.65.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75A349B47E;
	Wed, 16 Sep 2026 15:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789573865; cv=fail; b=lb01dj4hdUgJQJDC+64o05l3yxACUIYMBF38vpQWHNAsRrVqiBLZmEbYUKq2BFhQqHx8lSTfLHlyMQ6KAzN2N7teUiGdipj5xssRwM1laPUfR1DzuJ1xxd4Ife8YeF0pfoWVg1dlwmP6C/M3m1Ia2cIE4FQZIQYCAdoBpkODzFA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789573865; c=relaxed/simple;
	bh=RlmzF1CX610eXTVu+IETNFDf4gnh9Ggs5uV0I7S/ylo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=um7icdD0F+h8linoK+vcMV2+N1BhNobWnaEuYFxaMD7o3Mix6ammfZm1g9h5EnEIeqScEx5WuusY8KxLEHwHfjePuSW5lgGwcjCQMqx/7aW9jJdoGq3o2j3/jsfQhwQq8wdZzyv7v05SgUO7jk3Z3aUZ2KfENnOjgprbx5CB9fA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=WlMV4+FI reason="signature verification failed"; arc=fail smtp.client-ip=52.101.65.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="WlMV4+FI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tvGm4eMQtwC5Cyaj5z75MUxPPXlwVhwc56Db7gg50sDfNta5XDJUmVdf+AZmX/0KTUDpnM99Air5D1wClhMb9RqH4cwE4S5D0sIZKyTcXzu1ypdl5qobfw+5nZpfgX00OCLI4lSWTgaHJd89X/V0bh4Oyp4fOYFO3xYLZ2brM6747GzIHI8QYsHyteEaemXbyBCMk+9ujjotG98uGpW3rkifKSlu2ITyjJByaOAH6F72hKkpFrsbh8u1pHwmX+wZoAXTMZdmPw9BYO7Z5u1yMKJqntT6T/bioLtqHXBw7YSn5SeyvKIk2cxNgIRahZo8vK9hHRgqxYf7lRQzRTb/rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xuBdvs8VvMQe3oEG5BwTHofkYyAG01dms+KQREXQRos=;
 b=BvUqTztwiBNGJax2PGmxMSOHCxjYdDeKcITp9Qzm8L8pzGJVfQ5DY/gImUpiVOkVV7E+/qaGmly1i39LXQYU2My3uHX6zst6BCdGZimb1ULmLPE3I4Nv6VbqHHwvWVrn1olgW6BRsHr9GrlrO/bUrfLOeVH6z87LtPYBVK9qArFM1P2jfQLAK2Q/IveYkjinHOcz4TkY6NUWw8bZOFaeAqMDYiAdnOuCPXEGF0fcuGFSEp1A9Egx/3qFCAaZEwmhIhZ5tj5Z4+TxUgWJv2dghtFC8TAR6Nev27M2BvJ3Hq9kggroLpPdvvJ5Fbu+zRjS+JDwy7cx1kqcEwOq9wumkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xuBdvs8VvMQe3oEG5BwTHofkYyAG01dms+KQREXQRos=;
 b=WlMV4+FIpw6fuISXxC8Zdf31HIvGDWjZkXO1KRSPaWHZ1ToWWwS1x6CXv0W7BikoC670vc8IYS0Nb7KAK3CpOJ3neCCaont/mPbqI7Bre9f45cgkgxHxvsoAvGHShJXRffhUaOSS0ew5jIH7Y3WX3f09qSx3bBdozLosx4uvijoorTRGM5ADEt6Ok+Vh9wem7wsZMweK/+gYo4xfme8tKz7JtwYARDk+GtRpnQtekS/nXj1lw+d9rqMe0qJN6EXwhHwByd3DSua+NlNAYKzDMb0ZkjOEhQpRRVOrhVNsqP/S2YmdC0rpeiTilh8xldNGa3Nk7E25pJnj41PQdB/iKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by BR0PR04MB685626.eurprd04.prod.outlook.com (2603:10a6:2c8:33::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 15:50:59 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.012; Wed, 16 Sep 2026
 15:50:59 +0000
Date: Wed, 16 Sep 2026 10:50:50 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: CL Wang <cl634@andestech.com>, dmaengine@vger.kernel.org,
	vkoul@kernel.org, robh@kernel.org, Frank.Li@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v7 2/2] dmaengine: atcdmac300: Add driver for Andes
 ATCDMAC300 DMA controller
Message-ID: <aqq62tSqUHvBkRs4@SMW015318>
References: <20260916134258.2178081-1-cl634@andestech.com>
 <20260916134258.2178081-3-cl634@andestech.com>
 <20260916140120.3112D1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260916140120.3112D1F000FF@smtp.kernel.org>
X-ClientProxiedBy: CYXPR02CA0040.namprd02.prod.outlook.com
 (2603:10b6:930:cc::25) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|BR0PR04MB685626:EE_
X-MS-Office365-Filtering-Correlation-Id: b211bce8-f523-4f4f-5c30-08df140a4d9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|19092799006|366016|23010399003|6133799003|18002099003|22082099003|3023799007|4143699003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	l303u2sdfcFm0PEGXxKMIDgCSN9Oi6MjZGkGATDkfjkmo6VgX3wB2A1S7USmKW0bpC3fTjQeVyHW5f0yTXP9/WTGoty7EV516XfumiMs34fJNUwqiUQr7FcrSELr327VeJr0FpMtSWUaP0LAQLa9b46IeeE+rKoUfcjI7qYpzfwdOaimV/J8rP6ojmig3nVgT1mXWD0MaSZ6Y84dHqSGQaVy0GwtwL+VUIBPLSY1FffjvBS4kCgdWzmEsspkwzYWmpzv2eaPEKtfd0TS0Khs12vSZwbLxYLAAee3FKZN+hTPed+bd7wh/IgpmiJWiOB+1aMo0gu+v1RXzqmcIILgDmW+rsUiTEZgJGFNetGEKWUqqd1Ppd6npJJfcoWmihRceqoavW6IebrHYfU8AiVBopPLNOl8sF3ywgHJ7876umUXP3TkvaXuOO1mK4xNIPBnEvEM7o9JLDEQFtsiRHQG94P2rF+ubRC7PnnDaSce1IGxDB2JzH122A5AdOTotLetzR0bRcTFgsM+EWUL8YEcDWi5yCaAQwDBg3m7X3GsldyNx4ZFbnIeWrQFqdki5lliTTZErDBRRnd2eMXqz0ilZNJLA+Pg+/oBa0C7n4LI2cw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(19092799006)(366016)(23010399003)(6133799003)(18002099003)(22082099003)(3023799007)(4143699003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?miIOXdGDo/oURkIE9yrqTvHrP17Nkce8Qfcmql3tFucpkIxAPEgdEg7Cqe?=
 =?iso-8859-1?Q?7PTM4ZsYlCZeHC8cMF1/WIhZk97hO4CCPM2Jxk9f8WUwU5ZzxELpjYPrhc?=
 =?iso-8859-1?Q?MLs9AAggKqaDx8YnWEzUKSt6WNb9aAm9m7TvM8cr1WTyEdKwYkcDe7uSOT?=
 =?iso-8859-1?Q?8FMRooQ8KSDLZiM6bMbI+7oF+eo/65t1MDHTQoOyQT9m6bHl9BZJ0Jn7KX?=
 =?iso-8859-1?Q?NA8D1pcH0tHLAlxEkpxuBZ7MYBMyt8/ez2TtBsFM5j/YuoDgMtp3M00VHz?=
 =?iso-8859-1?Q?O7S2Hz+uywHfNAhfzd99Or3zYezKVEMG1kyQ/LysnO9fnqBYBGqS++qYpP?=
 =?iso-8859-1?Q?YslF52bEhIWEDdUCdjFKNWJfaxFzlTZWeTW6OOCZa3S7kKJ7waCus51o6d?=
 =?iso-8859-1?Q?gAJvERlOyJEUJiiJd7rTTvPLmHs2YpS85M4+oDic3MEXHwpB8v/k/4yay8?=
 =?iso-8859-1?Q?57QWtPtBLFfaybWpjKqY7bwEan/UmN69p5HvgmnOcjMWnQ7uYO3n92qPsI?=
 =?iso-8859-1?Q?WBAb86OtfmTAFGTrdxSd72El9fDvMc3q1+W48EB3AraVan5vYNo7Hk/tMK?=
 =?iso-8859-1?Q?MDD7MxV+OK9eO/B8Pf6MsDn8/iZBhbq3fJJCtMP+OA7G3mzUX1NpEkT1BH?=
 =?iso-8859-1?Q?yrvkodw4kMdQ8jxlPgrw879UEdBnCfAFwGfOJ+CYve3VQkXiHZUwJqkEsp?=
 =?iso-8859-1?Q?3ZDPc/IDIA3YwhWy70juvgeukXDiD8tF5xdznGiZxaJlL4Ali6kpIoY+Qh?=
 =?iso-8859-1?Q?9qaVfzH0ZTdiAuQa8BXYKeyqqoxIRUKsNSuVOqlidCOmsu6bcqpTMKAIkN?=
 =?iso-8859-1?Q?KCoSXVmhEUTuwUf/K7S8gVyddkvfE1I+FHOfsxlA52S/vmHs3pRNIobX5H?=
 =?iso-8859-1?Q?97peh/iwW+oRFHbm9m2p4zh13trIVZ7PjFKaDI4T9ZJ8dZ/p94v8C+zX/d?=
 =?iso-8859-1?Q?IVF9iHt6uAlpv4vdqCGvjAD1wsSbt93gRrVS7W9Soj2hV9kpJ3zZJHhQpA?=
 =?iso-8859-1?Q?lQ7dSr+qwARKE6AOL37V6nP3BL0lhMBPJG5NPU5/YmRFcuAYzWkX0Hptbz?=
 =?iso-8859-1?Q?0LJCVaUpjSKvzhEZxN0ag5U4nX/l7wGI8I/0rEXqKa1Y69fm86fISZ/Hd4?=
 =?iso-8859-1?Q?SN+9OWL5BNv3l516sRoZfu2eMQf3vSnB0wpNkLlAdRld+DnYo3L7gia9Pw?=
 =?iso-8859-1?Q?ue3bcJYIfzSlJlwviLePFZQhLnyGu4dSRQvtBqCQtz85tB5z5iT9z7Bj0Y?=
 =?iso-8859-1?Q?3kBLgRSTNwkOaua1muspBL6lYCrWB+ABP4Oclm51pvu8lpLS71c2ArbmQ0?=
 =?iso-8859-1?Q?d5rvBtywDJPWXpAa2uRc3K6OuGr0QHEUjDS6KDGgz8+t8ukYAAt7uF8Wo2?=
 =?iso-8859-1?Q?L032zIaxEiDK1mgotqNWPczwBQZAGIEbtcVBdcmuNZwCF4PFZ1uCoFaKwj?=
 =?iso-8859-1?Q?ETv3FWDGPMA3pu8Urk0bcGII/b6WX/urLZiTy0YF/Ghu97VJ0f1ScYqFKF?=
 =?iso-8859-1?Q?zsodWoiF1MKA5wtNeTLhoeWvblhMIUAjW5Jk83tiBh1zi326c1qqQjw+LN?=
 =?iso-8859-1?Q?TeyA9DlcL9WkPzxvvfYW1axX7BgGOZjQ9LqS/U2/y01n5zYnSFCvQEIKiW?=
 =?iso-8859-1?Q?OV10ZD/WnKDXExOfeV65zEtYkCUVAv1OOimn2bkpuhBeCeQOv068ahtAn1?=
 =?iso-8859-1?Q?+G7cQOeqt9j9cR4CZoO7OznTAhkbTWXBGonHlfkifGeiPb2Jh7DB23eFUS?=
 =?iso-8859-1?Q?EvdPF3Bw90JxJLc3TFcNnRsHxR6gKjECtNesBW+cTVHSaSuutqSH55kxVI?=
 =?iso-8859-1?Q?PVJnpxQvoVzhqv+PnLqDesTsRR2vcLzMc1DzxJWeIlQe6aMIMSeW?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b211bce8-f523-4f4f-5c30-08df140a4d9a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 15:50:59.7818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9hPErDY2S+jf0UhRUiAzb3P1GptpMkw3hnjAPVfxrsGpiTqsTNC1Zr8a3JioZlXmJyPrQfjGNPSEsQoWZbmEXoyBeorauiUl60SsT/SUl0ZhAlTnGQKiLV5ZjD320Wsi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR0PR04MB685626

On Wed, Sep 16, 2026 at 02:01:19PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 8 potential issue(s) to consider:
> - [High] dmaengine: atcdmac300: UAF on driver unbind due to devres lifecycle mismatch
> - [High] dmaengine: atcdmac300: permanent controller halt if suspend times out
> - [High] dmaengine: atcdmac300: NULL pointer dereference mixing cyclic and non-cyclic transfers
> - [High] dmaengine: atcdmac300: cross-transfer corruption on simultaneous TC and ERR interrupts
> - [Medium] dmaengine: atcdmac300: memory leak of unsubmitted descriptors
> - [Medium] dmaengine: atcdmac300: silent truncation of DT req_num exceeding 15
> - [Medium] dmaengine: atcdmac300: transfers queued during suspend are stranded on resume
> - [Low] dmaengine: atcdmac300: missing endianness conversions for DMA descriptors
> --

Please fix these problem or provide explain.

Frank

>
> commit 94fd62b6d9e6afc2cf50f8dff89eedcdc57f24c9
> Author: CL Wang <cl634@andestech.com>
> Subject: dmaengine: atcdmac300: Add driver for Andes ATCDMAC300 DMA controller
>
> This patch adds support for the Andes ATCDMAC300 DMA controller. It provides
> scatter-gather, cyclic, and slave transfer capabilities.
>
> > diff --git a/drivers/dma/atcdmac300.c b/drivers/dma/atcdmac300.c
> > index 0000000000000..e0a8a980e2fe8
> > --- /dev/null
> > +++ b/drivers/dma/atcdmac300.c
> [ ... ]
> > @@ -82,9 +82,6 @@ static struct atcdmac_desc *atcdmac_alloc_desc(struct dma_chan *chan,
> >  		INIT_LIST_HEAD(&desc->desc_node);
> >  		INIT_LIST_HEAD(&desc->tx_list);
> >  		dma_async_tx_descriptor_init(&desc->txd, chan);
> >  		desc->txd.flags = DMA_CTRL_ACK;
> >  		desc->txd.tx_submit = atcdmac_tx_submit;
> >  		desc->txd.phys = phys;
> >  	}
>
> [Severity: Medium]
> The desc_free callback is omitted from the transaction descriptor here.
> If a client prepares a descriptor but aborts and frees it before
> submission, the DMA engine core won't be able to free it.
>
> [ ... ]
> > @@ -494,11 +494,11 @@ static irqreturn_t atcdmac_irq_thread(int irq, void *dev_id)
> >  	for (i = 0; i < dmac->num_ch; i++) {
> >  		dmac_chan = &dmac->chan[i];
> >
> >  		if (test_and_clear_bit(ATCDMAC_STA_TC, &dmac_chan->status)) {
> >  			atcdmac_advance_work(dmac_chan);
> >  			handled = true;
> >  		}
> >
> >  		if (test_and_clear_bit(ATCDMAC_STA_ERR, &dmac_chan->status)) {
> >  			atcdmac_handle_error(dmac_chan);
> >  			handled = true;
> >  		}
>
> [Severity: High]
> The lack of mutual exclusivity allows both conditions to execute if both
> status bits are asserted simultaneously by the hardware. In this case,
> atcdmac_advance_work() would complete the current descriptor and start the
> next one, followed immediately by atcdmac_handle_error() wrongly aborting
> the newly started, innocent descriptor. Should these checks be mutually
> exclusive?
>
> [ ... ]
> > @@ -911,10 +911,8 @@ atcdmac_prep_dma_cyclic(struct dma_chan *chan,
> >  		if (!desc)
> >  			goto err_desc_get;
> >  		atcdmac_chain_desc(&first, &prev, desc, true);
> >  	}
> >
> >  	first->txd.flags = flags;
> >  	dmac_chan->cyclic = true;
>
> [Severity: High]
> This modifies the channel-wide state during descriptor preparation.
> If a client prepares a cyclic transfer, does not submit it, and
> subsequently prepares and submits a non-cyclic transfer, this global
> flag remains set. When the non-cyclic transfer completes, could this
> cause atcdmac_advance_work() to treat it as cyclic and attempt to
> dereference dma_desc->at->next in atcdmac_start_next_trans(), leading
> to a kernel panic?
>
> [ ... ]
> > @@ -1144,10 +1144,8 @@ static void atcdmac_free_chan_resources(struct dma_chan *chan)
> >  	spin_lock_irqsave(&dmac_chan->lock, flags);
> >  	list_for_each_entry_safe(desc,
> >  				 desc_next,
> >  				 &dmac_chan->free_list,
> >  				 desc_node) {
> >  		list_del(&desc->desc_node);
> >  		dma_pool_free(dmac->dma_desc_pool, desc, desc->txd.phys);
> >  	}
>
> [Severity: Medium]
> This loop only frees descriptors currently sitting in the free_list.
> Combined with the missing desc_free callback above, does this mean any
> prepared but unsubmitted descriptors are permanently leaked and never
> returned to the dma_desc_pool?
>
> [ ... ]
> > @@ -1189,8 +1189,8 @@ static struct dma_chan *atcdmac_dma_xlate_handler(struct of_phandle_args *dmac,
> >  	if (!chan)
> >  		return NULL;
> >
> >  	dmac_chan = atcdmac_chan_to_dmac_chan(chan);
> >  	dmac_chan->dev_chan = true;
> >  	dmac_chan->req_num = dmac->args[0] & 0xff;
>
> [Severity: Medium]
> The request number is extracted and masked to 8 bits. However, the hardware
> request selection registers (SRC_REQ_SEL_MASK, DST_REQ_SEL_MASK) are only
> 4 bits wide. Since FIELD_PREP silently truncates values, a device tree
> req_num of 16 will be programmed into hardware as 0 without warning.
> Should this value be explicitly validated against the 4-bit maximum?
>
> [ ... ]
> > @@ -1305,9 +1305,9 @@ static int atcdmac_init_ioremap_and_regmap(struct platform_device *pdev,
> >  	regmap_read(regmap, REG_CFG, &val);
> >  	num_ch = val & CH_NUM;
> >  	size = sizeof(*dmac) + num_ch * sizeof(struct atcdmac_chan);
> >  	dmac = devm_kzalloc(&pdev->dev, size, GFP_KERNEL);
> >  	if (!dmac)
> >  		return -ENOMEM;
>
> [Severity: High]
> The DMA controller structure is allocated using devres, tying its
> lifetime to the device binding rather than the dma_device refcount.
> If a client driver still holds a channel reference when the device is
> unbound, could this lead to a use-after-free when the client later
> releases the channel and atcdmac_free_chan_resources() accesses the
> freed dmac structure?
>
> [ ... ]
> > @@ -1543,9 +1543,8 @@ static int atcdmac_resume(struct device *dev)
> >  	list_for_each_entry_safe(chan,
> >  				 chan_next,
> >  				 &dmac->dma_device.channels,
> >  				 device_node) {
> >  		dmac_chan = atcdmac_chan_to_dmac_chan(chan);
> >  		spin_lock_irqsave(&dmac_chan->lock, flags);
> >  		if (!list_empty(&dmac_chan->active_list))
> >  			atcdmac_start_next_trans(dmac_chan);
>
> [Severity: Medium]
> This condition actively prevents queue_list items from being serviced if
> the active_list is empty during resume. Since transfers submitted during
> suspend are placed into queue_list (because stop_mask prevents them from
> starting), won't they remain stranded indefinitely unless issue_pending
> is also called here?
>
> [ ... ]
> > @@ -1568,9 +1568,9 @@ static int atcdmac_suspend(struct device *dev)
> >  	synchronize_irq(dmac->irq);
> >
> >  	ret = atcdmac_wait_chan_idle(dmac,
> >  				     chan_mask,
> >  				     ATCDMAC_CHAN_TIMEOUT_US * dmac->num_ch);
> >
> >  	return ret;
> >  }
>
> [Severity: High]
> If atcdmac_wait_chan_idle() times out, the function returns the error code
> without reverting dmac->stop_mask back to 0. Since the PM core would abort
> the system suspend and resume normal operations, wouldn't this permanently
> prevent any new transfers from starting?
>
> > diff --git a/drivers/dma/atcdmac300.h b/drivers/dma/atcdmac300.h
> > index 0000000000000..3d2d07effc26d
> > --- /dev/null
> > +++ b/drivers/dma/atcdmac300.h
> [ ... ]
> > @@ -148,10 +148,10 @@ enum dma_sta {
> >   * @ll_ptr_hi: Linked List Pointer Register (high 32-bit).
> >   */
> >  struct atcdmac_regs {
> >  	unsigned int ctrl;
> >  	unsigned int trans_size;
>
> [Severity: Low]
> The hardware descriptor layout uses native unsigned int instead of
> explicitly sized __le32 types. When these fields are populated in
> atcdmac_build_desc(), values are assigned directly without cpu_to_le32().
> Does this lack of endianness conversion break portability if this driver
> is ever used on a big-endian system?
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260916134258.2178081-1-cl634@andestech.com?part=2
