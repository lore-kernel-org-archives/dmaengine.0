Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11021080.outbound.protection.outlook.com [52.101.125.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E6E355F5F
	for <dmaengine@vger.kernel.org>; Thu, 30 Jul 2026 05:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785388487; cv=fail; b=IE/3kaAquku6M3X3vMPcCGksIzc+qKBod444TukPKFUUYNrT16of58s+D/FFjatTrztB2ATu5/MGLuVpu8cBUyCvAsYJ9zzsC39EiHjAsAwjHLnU/nvCSbHhqMdD+yN0eH7JcDla64WFT4XAPUXNkWdxtOilp6KRHdSqNJF+bDI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785388487; c=relaxed/simple;
	bh=Z/iG9FBYcNjUAyFHiFgjUYn2ZC+CBcl5jYAvHJl4Pq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CUv31WzmAoVHxt6MtHzSZAp+MvRvDLgVGgE3BVAEpazBEM0yUB1tv63WNNzw/qrf+p/+o2Lb/f2N3cFjwpZAJ1bXUPMRhsoKCuyU3/s4d0Wz/HAy1fy9p6kqPMG4XCaGRwJ1qo6CGlWx+ZclzHaljy2DqXq0kk7kfTWzJCjidWc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=fail (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=lvagCFv5 reason="signature verification failed"; arc=fail smtp.client-ip=52.101.125.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="lvagCFv5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vyh0hXepgFn76ms3BBayJejD69Y2o3GrDgIbVN3tDlhHoXnvA41wP9K1mhWtF6OULZtTyeb33n1pwNK6f8KV50kQzrYNEumAqB/p9E31RhrUU46GZcjU2hC9ogTePfM6Uerlf79BlavWDaIp7AStwAzJcPdWNrPGnACcMElonJ4cUA+xnfz8y1sgTIj9yfnoEyE2RmrhDCNCyPySK0mh+9whqN+UZl4nZfyv8/IG0vUHII6qGbLGmJwB7snZ2daFKNunv0y+ySCASNLO7Cedrh/2iKvceq9YRMPHT9hso+fm3Wrb9829MJPNprSkSUAxhmWKUdScuFN+JCaM2yclGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2b7dV2G+BOlcLwDi/A9GanuUkmZ1kaxqKHx2RpXokyU=;
 b=X/I7d0DqIBnAe1iY03unZuCJ4Rdj6fqd1V9gwT6rzxd4P7Ru4uftAxcC1wMBSOQEkxKHTfbv61bvVj8J4iwFHpObj4cLF29l9dGDHfybFIBmRNENfsFU7efyWQJPb9ORSfS5TYxe8Y5Y6zMCZcMYuJ3N4ZxmKsLToj68A10cQZ4BDm+80Dt/gF53kCreopUiBCil4QyleJhZpCX2434fDlLrp7gClADXEA1CgcSzA206dtKyhZvlzlYst3124CpZoy9nBEjmtpQL1agP/lX4zYZij59MBZrb2QN2XZfOqPELqWRaoZfFPy2Jh/jGhBbyDSQ+tlFHs1BH20PouWKqZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2b7dV2G+BOlcLwDi/A9GanuUkmZ1kaxqKHx2RpXokyU=;
 b=lvagCFv5yE8R0pmbHwwvVY+Jv2LhU301DNtEIQ1x9v3PZ+aHdUbOVRbDry5SuLrUKmU4Rv+Z3hEtpGkLK5eP3pCyR+laEz+uGbQo3jnRHepcMJhpna2MbzQ5Jb2P7Wos52X1gDBwI329U8appJxW/NEULyenGwhx0z3IyomZErc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TY4P286MB7101.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:341::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.14; Thu, 30 Jul
 2026 05:14:43 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 05:14:43 +0000
Date: Thu, 30 Jul 2026 14:14:41 +0900
From: Koichiro Den <den@valinux.co.jp>
To: sashiko-reviews@lists.linux.dev
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
Subject: Re: [PATCH v4 11/24] dmaengine: dw-edma: Serialize LL event capture
 with channel kicks
Message-ID: <keuoh456azgwropu5qvenj2md3fxcmqs4xibc36gs6ix6hxx3q@chcplu4rrrd7>
References: <20260729143036.3087722-1-den@valinux.co.jp>
 <20260729143036.3087722-12-den@valinux.co.jp>
 <20260729145108.CFE281F00A3E@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260729145108.CFE281F00A3E@smtp.kernel.org>
X-ClientProxiedBy: TYCPR01CA0195.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::17) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TY4P286MB7101:EE_
X-MS-Office365-Filtering-Correlation-Id: b5dc6ad6-3dd5-4183-70b0-08deedf976cb
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|366016|23010399003|1800799024|6133799003|56012099006|4143699003|10067099003|55112099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	L1omqkxut3/+U31oLcYwiw8d4mz8iKAdwEmKQR8GEP4MjM1zMWTJ89ePZZpwfw3TB5RZwiJnqMswFKj+RZcAHbHiGdQ3gwZVUsd8g8we/Lcdpapf45U4a3oAOzgR8FKWdRLASzpvJPPR3qyRO1161sU1ZZ9t08IRUZZKyadO3swXJ+1W+veL2VTrKu4sLwpBLn/zMR3pLihZOKzaue/yXbi8eoCiLJD2ouI4wKw2hjXXODlut8qDd4uaHq1yQA31nghQV2C9FAee/G5dOhf59y6Cx1XQcBsuSVfG77Wzp1VU6GA4JMXTn3LWhmeVmaumf+aLGNbEduRyurvyv/bXDjpEF2t0U2aMW3+C4bqn5nxOlmv0naB6ul5/b55kQ/UVwOs5aXcZxVY56sGofn4cX1q1mUILQEC5uALq7+9F5K8jciLg6vYf2/mSx8Sno2um+iQT9JxRLEYGBxpMsz12kgORCjjTJbZPot1GDCnc7RGosyfNJuyRlVZpVCcvTu+ZYVYK+WTcgiyp9DHj3ebOaoffpM1SB4uJw6H8/VJ0neuC00Ce+gsSNOVPI+x025UHKP88U/1nN5awYH5Eu/jxUWqtRUAWatgEoesRj36cz0A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(23010399003)(1800799024)(6133799003)(56012099006)(4143699003)(10067099003)(55112099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?T29/uzdyCOoMlkPOD0p9c83pADvYA9zuM+fUC9KVlY3sZ9T/7ysATfsXur?=
 =?iso-8859-1?Q?tTlnt2K9QGuEI8WYukGpa/4ejI2hOzUmt3y9Tl2yf1FK13uAvGPW/nYSr6?=
 =?iso-8859-1?Q?xCrdKYa4CrYYFzpDDUWjDoRrv3yScbmbZOhz12nLZA8ytIiHo6EkaiZs7J?=
 =?iso-8859-1?Q?HMf+eM1nYOcnpe5945g0qx2/ZUub90uLKKjgarWU4nCp8NHXfAQiBG/o33?=
 =?iso-8859-1?Q?4xjD9TqruH/amVqoWCiz9g71lPmeotGn3turPqa3fudcaBd7MGSDuxw6YU?=
 =?iso-8859-1?Q?XNbdrB/+RvBZC8uddq7ZT0oIQ4gzH0hjpqMUWFq/c4wyB6bZTaWjqMQbkr?=
 =?iso-8859-1?Q?aVVJWifhA9ByKSM0+Z9TB7z3hskuwfXA+a69wylFlXy6xzP8dZ2CkvL2Mf?=
 =?iso-8859-1?Q?xTypqAmsDjvMDqlbmPY/9b8heoBn/k7rqOT3jIxrSvbKLhCEH8LRmQZuAB?=
 =?iso-8859-1?Q?+e4GqNS6T2w11LFX4kQAElS/93y/ECren6NlUmBW07T/h7ZL002A40ttpx?=
 =?iso-8859-1?Q?rCAn6IthvY5c6WT/nsdtVX8BZVp49kuzvNf4ywa1iLLhB2dR7jAMHMF6zK?=
 =?iso-8859-1?Q?2SguKyfi5FoyQXuf39qkYAAinneQMsE8pd4fByBQ0W/G6gUNVZMQCwj69x?=
 =?iso-8859-1?Q?eCsoAwRD/a+831xC3iqjI8/whWHugMwwBk1By2zWVUX31FFHJPIjdaqRQ/?=
 =?iso-8859-1?Q?WA2JGdn1g9xKo0QzetyWgd2YMwGA4pIgeB/ZepdvyDY5UN6kJ6H6YdniRB?=
 =?iso-8859-1?Q?kBHuTJMfdXUtilfHlujkgpQAssb8smmMDWsBVU7kzgHXN1nqVmrIjS4MyG?=
 =?iso-8859-1?Q?H8s0QqjeadUgr/Y0JledLhE/AeApGhNhIONOT5j7+zlrrbp6Sgm+rN7LNF?=
 =?iso-8859-1?Q?nCXugSVDtjsxJHQZ1aAyoCysRBXz2LUqegahZpUC0rIal/m16pY8QWxyh9?=
 =?iso-8859-1?Q?4Fns03oL1jeaUkT2JQ4E944CgOeWNszb4a12mcy6DBbEuTQg9uNWOz7BDa?=
 =?iso-8859-1?Q?/7Cx9D7cbFflbemZ/fjZYSXeldpJSALa1kPmNUx0G23Oj8l8Eym3qzkYDF?=
 =?iso-8859-1?Q?oQsDnUM+FOCaTmEkJW2x/Yy7p6q2EDCoNoJgxB30inxtzXiwxw4MkxG2jt?=
 =?iso-8859-1?Q?yE+XdBDbSpzIKGUP+1R+pxrMn4OZNLt1cemwB2lw5fsDIeh1QnY7wN0mte?=
 =?iso-8859-1?Q?M4ZZDdMrAzkk/Ros6081DiN7LrH5S9MjklHizf+iXjdLnHouuuZ8fOSli6?=
 =?iso-8859-1?Q?smppGD0jzCUyCKBaIFdez00T6EYsLI0AhKJMhjzJkbnBN0LYS2xARuJDFR?=
 =?iso-8859-1?Q?esYAn5R9gFf8SZpKUmOt9/3t0fB9U/MNQoiYgcunTbsFf+3WoC+rstDE2k?=
 =?iso-8859-1?Q?UQZ1EzaduMidYDTG6wgVJKyHEZz3znVBtbn7uBAK5kKpJlSx6Vc4496cCi?=
 =?iso-8859-1?Q?0W3fr3ng7EJbQX5e1+/i3vLN0CsQnXB/UMyDafnkGg3NmlEZNMHBuaajVW?=
 =?iso-8859-1?Q?M5IH/rhjYft+hSZhjJXZBMWn0RNf5sGNNSKMzV4/Xm+hhY2adYLKTBqTuV?=
 =?iso-8859-1?Q?tg9i82FqP3sKdhjCsBK853k/kGaa6fFDWH0DfeKdJev0dz/zjljR95wLpG?=
 =?iso-8859-1?Q?8+p+bNmSNF3vvDWiU6CxxatZeJ1IGj+lQ0zPDoC+lY61ZQrBqxHjz+Xo4J?=
 =?iso-8859-1?Q?8yzCyXETGVfA6m3SGyyO+0sXqZxZe63pXVPOBjqYxTqOmvgqNDQv4+Xr0A?=
 =?iso-8859-1?Q?2CmaeTmiuVFEAbRXBXkn61g63wEco2pEF5nfUyfHSbJh0GABCCR4XV8tNF?=
 =?iso-8859-1?Q?ANDiH4Q+oqYCWHa4QRQXnwJ3W1F+JIXaGVJCqxMhatAEa/nB6a9O?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: b5dc6ad6-3dd5-4183-70b0-08deedf976cb
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 05:14:42.9893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x6bAIUYAEvKCFZpn58v8kvb+oid+HGnl4kB5jC2AR9+qCl5VPMqvOweokksCx+ALFYVB56u3muWUjXGDE2n5Dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4P286MB7101

On Wed, Jul 29, 2026 at 02:51:08PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Ringing the doorbell can race with a hardware interrupt, clearing and permanently losing a pending DMA completion event.
> --
> 
> --- Patch [11]: [PATCH v4 11/24] dmaengine: dw-edma: Serialize LL event capture with channel kicks ---
> commit 56231794b3b46dd52a7c7f61f0def40f1fed9890
> Author: Koichiro Den <den@valinux.co.jp>
> 
> dmaengine: dw-edma: Serialize LL event capture with channel kicks
>     
> This commit introduces an event lock to serialize interrupt status reads,
> clears, snapshot recording, and LL doorbell writes. It aims to prevent a
> deferred handler from applying an event from a previous hardware run when a
> doorbell starts a new run in between.
> 
> > diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> > --- a/drivers/dma/dw-edma/dw-edma-core.c
> > +++ b/drivers/dma/dw-edma/dw-edma-core.c
> 
> [ ... ]
> 
> > @@ -269,6 +317,17 @@ static void dw_edma_core_ll_sync(struct dw_edma_chan *chan)
> >  static void dw_edma_core_ch_doorbell(struct dw_edma_chan *chan)
> >  {
> >  	dw_edma_core_ll_sync(chan);
> > +
> > +	guard(spinlock_irqsave)(dw_edma_event_lock(chan));
> > +
> > +	/*
> > +	 * A recorded event belongs to the current ring and must be consumed
> > +	 * before starting another hardware run.
> > +	 */
> > +	if (chan->ll_irq.event != DW_EDMA_LL_EVENT_NONE)
> > +		return;
> > +
> > +	dw_edma_ll_event_discard_locked(chan);
> 
> [Severity: High]
> Can this race with a hardware interrupt and permanently lose a completion event?
> 
> If dw_edma_core_ch_doorbell() is called (for example, when appending
> descriptors to a running channel) exactly when the hardware finishes a burst
> and asserts an interrupt, but before the hardirq handler can run,
> chan->ll_irq.event will still be DW_EDMA_LL_EVENT_NONE.
> 
> The code will bypass the early return and unconditionally call
> dw_edma_ll_event_discard_locked(), which clears the hardware interrupt
> status.
> 
> Does this result in the interrupt being completely lost? If so, the software
> state will permanently trail the hardware, which would cause the DMA channel
> to stall indefinitely.

Thanks for catching this.

That exact race cannot occur at this point (= patch 11), because dynamic append
is not yet enabled.

In the final tree, however, the race window seems real. The pending DONE status
can be cleared before the hard IRQ records it. It does not leave the channel
**permanently** stuck, though, because patch 15 adds a delayed stopped-tail
recheck which samples the channel state and LLP again.

A hardware STOP transition, including DONE status and interrupt assertion, can
land between the status check and the status clear performed by software. And
the check and clear cannot be made atomic. So the cleanest fix I see is to
permit the initial kick after an LL reset, then at most one kick after each STOP
boundary that software has confirmed as STOP. A quick test showed no obvious
regression. I'm planning to rework it that way for the next revision.

Best regards,
Koichiro

> 
> >  	dw_edma_core_do_ch_doorbell(chan);
> >  }
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260729143036.3087722-1-den@valinux.co.jp?part=11
