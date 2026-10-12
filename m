Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013038.outbound.protection.outlook.com [52.101.72.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9CE4B4867;
	Mon, 12 Oct 2026 17:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791824455; cv=fail; b=YZuWDGExlvYWmr+9q6pIWY61+NlbH2uASlBbEO/K/WVXLd8YzSCXvxTtX4zocFMTopMP036sqyaHS69sNhupUKWC2vg3fI230MuD3dyfn3+MO7QCWMxI5LL4MjI6XZviHRRKyXY1cQnKZjTDYxBL3/b4qhFfbhXYa2LTOfk9OWo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791824455; c=relaxed/simple;
	bh=1k/R4wKH526afussIjyMomJQH2gaeprwKy+qXC/nv/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Yif+CXdOxHQxEOReGlimhKHcLredaazk8rGjwzudPotha5YBfssihBop/N0bCZ3El1FQMy1NDTEZCldIa/XmrV3rsZ6jGAVJkbPvVvcF1+Q21nSoRK9zdbWmuiVCQdvcxqWhJvf4zJ0j1TwRKGgArrsV4lY5w+ASg58UP7wwEwU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=egCJyjj2; arc=fail smtp.client-ip=52.101.72.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="egCJyjj2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ok1mVsrnG8OlRNBHlx5d9gCfBCQCk762urssJ4bHWQxMSUfBcYd2lDC6BH9mjfMBtDT/Fg6kj2wo+JSBm27svSKkxWpMAcBaSIWNOp6HAzrXP0eNJPjN6tzmhZTK2kzBgK3HNNr+2NFemCir82Lq0a8Dp7cYHv+rAOHNMSU6Ee2GBumsAHnCcVRMDdD/1gajyj4A+eWlPNtgF70M/Lz1AaVk1U81lO81AqjFkhk46X+OnspnlcUdaY3iSu3f2kc03HxJxC7SyQWfZ+IeZHpVDx6Jbf1vxB/t8L7JxgcVwy4AvWRD1RZUd/+heTqCioImdpFODmnpeJcsnI0EIaD/Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJsHIE6PxodIGxWd9FrzfEwlZiDgeazl+ArbRkaX78A=;
 b=PQwNd8zEXsqy3dvRvI3xdG5yKRxioGy0r5ZzDEaYvWMYHr5/hUguA8JxG4lB5UQGwxYQWdpRlIp1fXawLrhAKvMB+s1OUa3oUblNjGwZWriX580Khqq4TZIz39rcgPjJeBi2lJoAqndO3fjIqXTis08uMLJYHb/rg1yKm1scGjeazduYMEedY24rACEiHJOT1MuojTns/1+eSZrv74EPNvzOiowEkp2VF7ShGZYignyKWFXXsS2q8dU3jcgx+1l9farDGWLjXL/A5iRlrGZVxaAW2gzb31sD4pu3hfjJC+Cz4TBf9G7ccocHg81pofeVPQYBf9YxvGsoghjH6+TODw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OJsHIE6PxodIGxWd9FrzfEwlZiDgeazl+ArbRkaX78A=;
 b=egCJyjj2aYjtpgPepunyoGWI2z48uMcMo5tAkSAawz5DW0ovK7b9fEgPNhm7xrxpd2oXwFI2yDxzq61fWO9AKl0x3X4VMrNeHodNKrY/m/lyyNYR7lDi6ow4NHodk1/Nq16ftTVYM4wFwlVi3sauzMjicbJ8nWY4mc+/CPuLUJTai5JyLkjRr65VF82yLKVBmk9h3o9Uzsk671/y4FPzvLyqSbgIS+smC+BbQe4E2dMLJMabW4SPEjiZc0kSLULvhL4t55SnnS4S1UJzGMRQy0ak+s0ErDySOWjtndojqIOs5t2M3EOx2qJMTy0562dZATJfaXnO+95Tp3/qEMv/Mg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB11700.eurprd04.prod.outlook.com (2603:10a6:800:2fc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 17:00:48 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 17:00:48 +0000
Date: Mon, 12 Oct 2026 12:00:40 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Ginger <ginger.jzllee@gmail.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: pl330: Fix lock-order inversion in the
 channel release path
Message-ID: <as0SOGX6P61oZBN6@SMW015318>
References: <20261007150104.38253-1-ginger.jzllee@gmail.com>
 <asgJ5cVHQyiKFJo7@SMW015318>
 <CAGp+u1ZiGU6gqCT2kEZQK5ekEnwVFaOr0QrPYbP3YR4SF0UpqA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGp+u1ZiGU6gqCT2kEZQK5ekEnwVFaOr0QrPYbP3YR4SF0UpqA@mail.gmail.com>
X-ClientProxiedBy: CYZPR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:930:89::14) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB11700:EE_
X-MS-Office365-Filtering-Correlation-Id: d14df654-dc5f-4402-8a1e-08df28825d24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|19092799006|23010399003|56012099006|11063799006|4143699003|261009223027099003|261009221227099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	uAnUUfCYH/fu/AsgWEJ5ucbNwhXOsPCseufSA2dtfAsyhDNAlI9BTRk+2XDTL05r7SWaEC9mYAZDAfJmhTef5epla0taUdivIXoiauSqSvX4xcLnhyotyorgNq3ws93WBZlvdzz42i4pxVzpU1sNigUM92iyGjVBiw5q34T9Xn97CdfFBDhdQ1oUj3fa6Vdi+OcqQXZUbE/wA48Sc+77IFHRcbH7zgYdWXpAFHbVpGHJKGqnctRN1zhwyoH5BB0MA6cAl0Bl+XIIjL2lLy2BSE+YMBLwJY4hEVqDk1y3Ebcd2twz7cKgsiC4Ygrfcgi4IPuAwNFezlW3Q0DddUrCGESPdnlGHZpo7ts/hQkUWzZI/uM01/h9xsE9j2DjgCf74ifSnA4ZTb/XdbZuduiEgFmbNMtrRrkJn8bSTSGI4gsTgTsuARGX24FMFFk4VGdeIXFMoqTun9Uqm/ysviKMnSZOIjkm1Ra/suaOhNTNOdJkz8OfJzKNQpvxVlXloMngx2jBMyRIyRnGX8of4gemQe+2yx26BPRyOw36s9aUJMXe3UANQVAXk1PDCGnoZoRu0xsPjVtdV/GIZ217e792OMI0CJSCzuTAmgXz6B3ijamlw7QmLomNSDL+pV1iy3DMP8Rm2FXxmVdmx5HGFx7AwI6ChO7sH0nx/XQM+7bLstc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(19092799006)(23010399003)(56012099006)(11063799006)(4143699003)(261009223027099003)(261009221227099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WHRXWittRENIYm4rSllrelI4SW8zWW85amlqbS9VdXY3V2ZYRjJJY3RhWDI2?=
 =?utf-8?B?eTlQZ2FmQy9iQ2lRU21IQVlLSzBKU0ZmVmtoeVJBT2Nvb1dwUERWVERFQnlu?=
 =?utf-8?B?WjcvWmtKY0NZUzl1amxUWnpmaXZXcnQvekdFNFFvUkVPaXIyamJNUUVGMkdu?=
 =?utf-8?B?NTJBUjhldk9PbFRaazh5MUhTcTRSU1JtSU8rcW8zTEdnVGpQQnRuVlF0MUY5?=
 =?utf-8?B?UTRxQStqOEV4dTF4M3p2ci9WYnFzZ2U3ckl1cDJ4NHVWMzluUEVYdWUycTdl?=
 =?utf-8?B?TjRzTXFsNnlxUlJJT21sWFR4eUZjNGk5dWZ5WHZnSFJUUXpTZlI0OTdPOGN5?=
 =?utf-8?B?Uy9ZU1lFc3NEcTlDNmJQUzNxZmpBaGVxNE9FeS9Ga0xuZjVjZzV5RjhlQnBm?=
 =?utf-8?B?bFdLdWxOVnJGTGZka2J0YnZJbHVxN1FZbnRWaVNKSzRoV0UrVjF6YmZwd29k?=
 =?utf-8?B?V3gyL2ZkSHlyZUkzMDFQS25INThpNSswWW5OWkYvb1JJN2hQN2NQYXNmK3hT?=
 =?utf-8?B?eWYzQ3psR0dtSVJyaW5HS0dsOFFZalRyL1Z6amJtMDVIQnJ1cFI4ME9vczFu?=
 =?utf-8?B?YmNTcy9ockRBbFBlNTdDRUZSZlY2dnJlcTR1NUtOWmNKRk1vdlRjTXlmdUFk?=
 =?utf-8?B?YzBTZDgvOVhkS1JDdStxdGJJSCtuZGNneERkbDB4MmJYUEhNbUkrOXdPblox?=
 =?utf-8?B?NktaRjMyeE9TZEVlTEJUcDJJSG14TjFLQysxbXN1TGpVNGNBRmlKckNHd0RP?=
 =?utf-8?B?eTd0eVBZN0UwNFQ4azhhRmhPQWZWcU94REdMRThrN2I2a0pjRFFaY2NtOFRW?=
 =?utf-8?B?VFFJNytEM2RscHhuaUhldGplbG9VY0dJWXQyeVdDQkJucGVPWkU1N256b1hv?=
 =?utf-8?B?TTVvRW9uVXRpMURMRnFNV3JHbm1FODFuZ0ZLSkNFYkpVeVJldmJxOE8reDBB?=
 =?utf-8?B?MEhOUGlrRjkwVFdPUGcyTng1ZjkxQjlNNVlYSG5hQWwwWC9tazYyaEtTYjlY?=
 =?utf-8?B?ZGVGYVAvcUNwaTN2YUE1bDFab0ZWNTNtc0UzcWYzeG9DYnRJM3hDR0xLSFNa?=
 =?utf-8?B?TEhqVFpML1BhaFdxTHlFNG1tVlVEdnN5cTN3ZVlYNjUyUWxKYzRhYklXMitD?=
 =?utf-8?B?R2dZQ1RqUDZjekFhVFh0WG54eE1kQ2xDbVBKRkV0YlkxcEhRekQ3N2REWnpG?=
 =?utf-8?B?UU9Kc1dPdkFPSUlveW9zcHBCQ3Y4ZlJxNmFnc0c5aGhHVUJESnNraXk3R2hW?=
 =?utf-8?B?UVRKNG1oR0c3aDNEeXYvUUJRSW9oT1U1RUFvaGZaSHVBdDh4dUpudGtYQmdi?=
 =?utf-8?B?Nk9kcEl1UmpwZ254dnNnaU9zWU1iZWQ1b1pYV3Q3dkhqWk9kN04rV29ONDAw?=
 =?utf-8?B?b20vK0ZkQWZ3Q2Zvc2RlbExGZ0QwMlZRaWhMMk1tVW5sNjRQL2ZHRC9WU3dw?=
 =?utf-8?B?c3dzWVREVnoyYmxsdjBnR0ltL2VZRUZFQnlUOHpqUWdaZ0RLQXZoV1F3RW9T?=
 =?utf-8?B?a0xza0tsSDZWSTdRbmJYcHJXL1RwYS9wL3FGK1FxNFFSSDZqcTV4LzNDRW5C?=
 =?utf-8?B?Q21ZOFZFYkRHNlZ5QWI3c3J6K1NUS003ajZWUjRFcmlCUnI4VDVXY0NrUm0x?=
 =?utf-8?B?dkE3MG04RHdTT1F5M1J5cGpVZUwzU2pwVUNOSXhkUWJvTFdMS3d2Rnc4WUdp?=
 =?utf-8?B?V1ROclBXMzRMWFFRYkFhSDk3MC9veTJYdFRQendmemZiQ1BaQjJ5K2Y5bGVE?=
 =?utf-8?B?R3Brd0pXNk9XNUVIOTZpWFdFbU5oZUdNK1BUeWlqMWdRNkJSdDNwbW91cjhV?=
 =?utf-8?B?aS9oVWlxSDJrMklrTkRDMUlnbXB0Vksza0VPSmdTcDE5RFJZOHF1SlpWN09T?=
 =?utf-8?B?elBPOE9ublNQa0tiUXRqTU1nc2dZdHZRRXdPdk9UcStQYmh5VFNFWWZYN1Jy?=
 =?utf-8?B?enU0UXk3WlFRdVdKeG84QW5WemtWckl5ZXYvNDZMaHkzckIxN0prYmhVa1dT?=
 =?utf-8?B?ZHYvUWpISnJSL3l3M2ZzWXUzTzB4QVpiNzJlaFJEQUdJbTd5TndLQ3NINjRP?=
 =?utf-8?B?bStXcUE0ZVB1YXdmb0JybkR0Smgvbk1WVUdCS3dDZ0lESWJZU09BN2YydGxU?=
 =?utf-8?B?cHVhQkV1YWhzOW1oeE84bXNHenRDR3VleEhnOTBscDJuSkNqNVFVczFacnBz?=
 =?utf-8?B?QXEvcWJ6TUk5eitrQnRTS0JoakNOM2F5bTRzWUNYd2FVekVtOG9RTXlrSkRI?=
 =?utf-8?B?WVpuNzJ3Qzd3RFNWcGw1VWdmNUNJRXNYeEJXMkdKUE01ZjBnbkdtL05EbkVL?=
 =?utf-8?B?Z1RKVzdqelMyVVNBTXJnWnJjR0RxM3l2NEJuUnNYUUZDRmdodWM0RCtLbExY?=
 =?utf-8?Q?VnQqnto0MqgyWPNIa1sr54wxdoW4G7MK4Klmv?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d14df654-dc5f-4402-8a1e-08df28825d24
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 17:00:48.6616
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IubVkO6aWs3s1/VWOXmI2mlkJ2PGBWei2EoxhItaLrla89aBx4syPHdQ4NMtM9Hbv51ByqwEp3DSvF86z5C/QzmabFZcSKcwLzsLfilPiigHfQqlMJR4sT0475FK1TdY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11700

On Mon, Oct 12, 2026 at 11:15:16AM +0800, Ginger wrote:
> On Fri, Oct 9, 2026 at 5:23 AM Frank Li <Frank.li@oss.nxp.com> wrote:
> >
> > On Wed, Oct 07, 2026 at 11:01:04PM +0800, Ginger Li wrote:
> > > [You don't often get email from ginger.jzllee@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> > >
> > > pl330 uses two locks per transfer: the channel lock pch->lock and the
> > > controller lock pl330->lock. My static analyzer reported that they can
> >
> >                                The static analyzer ....
> >
> > > be taken concurrently in opposite orders, leading to potential deadlocks.
> > >
> > > The terminate/stop paths take pch->lock first and then pl330->lock, e.g.
> > >   pl330_terminate_all()
> > >     -> spin_lock_irqsave(&pch->lock, flags);
> > >     -> spin_lock(&pl330->lock);
> > > and
> > >   pl330_pause()
> > >     -> spin_lock_irqsave(&pch->lock, flags);
> > >     -> spin_lock(&pl330->lock);
> > >
> > > While on the other hand, the channel release path takes pl330->lock first
> > > and then pch->lock in pl330_free_chan_resources():
> > >   pl330_free_chan_resources()
> > >     -> spin_lock_irqsave(&pl330->lock, flags);
> > >     -> pl330_release_channel(pch->thread);
> > >     -> dma_pl330_rqcb()
> > >       -> spin_lock_irqsave(&pch->lock, flags);
> > >
> > > Freeing a channel (dma_release_channel() -> dma_chan_put() ->
> > > pl330_free_chan_resources()) while another CPU is in pl330_terminate_all()
> > > or pl330_pause() on the same channel is therefore an ABBA deadlock: the
> > > one thread spins on pl330->lock that the other holds, and vice versa.
> >
> > To here is enough. cut below message.
> >
> > >
> > > Inspecting the driver code suggests the rule that dma_pl330_rqcb() must
> > > not be called with pl330->lock held: pl330_dotask() and the callback
> > > drain loop  in pl330_update() both releases pl330->lock before their
> > > dma_pl330_rqcb() calls. Thus, pl330_release_channel() is expected
> > > to follow the same manner.
> > >
> > > Let pl330_release_channel() manage pl330->lock itself and keep the two
> > > dma_pl330_rqcb() calls outside the critical section, and stop holding
> > > pl330->lock around the call in pl330_free_chan_resources().
> > >
> > > This was found by a static analyzer on Linux 7.3-rc4; it reported
> > > DeadLock::AllLock (Certain) for
> > >
> > >     pl330_free_chan_resources() <-> pl330_terminate_all()
> > >     pl330_free_chan_resources() <-> pl330_pause().
> > >
> > > Fixes: 91539eb1fda2 ("dmaengine: pl330: fix double lock")
> > > Signed-off-by: Ginger Li <ginger.jzllee@gmail.com>
> > > ---
> > >  drivers/dma/pl330.c | 24 +++++++++++++++++++++++-
> > >  1 file changed, 23 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
> > > --- a/drivers/dma/pl330.c
> > > +++ b/drivers/dma/pl330.c
> > > @@ -1805,16 +1805,32 @@
> > >
> > >  static void pl330_release_channel(struct pl330_thread *thrd)
> > >  {
> > > +       struct pl330_dmac *pl330;
> > > +       unsigned long flags;
> > > +
> > >         if (!thrd || thrd->free)
> > >                 return;
> > >
> > > +       pl330 = thrd->dmac;
> > > +
> > > +       spin_lock_irqsave(&pl330->lock, flags);
> > >         _stop(thrd);
> > > +       spin_unlock_irqrestore(&pl330->lock, flags);
> >
> > [1]
> > >
> > > +       /*
> > > +        * dma_pl330_rqcb() takes the channel lock, which is acquired before
> > > +        * pl330->lock on the terminate/pause/tx_status paths.  Calling it with
> > > +        * pl330->lock held would invert the lock order, so keep it outside the
> > > +        * critical section
> > > +        * pl330_update() already follow.
> > > +        */
> > >         dma_pl330_rqcb(thrd->req[1 - thrd->lstenq].desc, PL330_ERR_ABORT);
> > >         dma_pl330_rqcb(thrd->req[thrd->lstenq].desc, PL330_ERR_ABORT);
> > [2]
> > >
> > > +       spin_lock_irqsave(&pl330->lock, flags);
> > >         _free_event(thrd, thrd->ev);
> > >         thrd->free = true;
> > > +       spin_unlock_irqrestore(&pl330->lock, flags);
> >
> > [3],
> >
> > how do you make sure it is safe to do 1, 2 and 3 without pl330->lock?
> >
>
> It seems that [2] is not strictly needed inside pl330->lock (e.g., pl330_dotask
> releases the lock before calling dma_pl330_rqcb()). However, if [1] and [3] are
> expected to run atomically, would the following change do? This fix keeps the
> original structure but moves the dma_pl330_rqcb() calls outside the critical
> section of pl330->lock.

I am not familar pl330 drivers. The key point here is that avoid introduce
new problem by resolve one exitings problems.

Frank

>
> Sincerely,
> Ginger
>
> ---
>  drivers/dma/pl330.c | 36 +++++++++++++++++++++++++++++++-----
>  1 file changed, 31 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
> --- a/drivers/dma/pl330.c
> +++ b/drivers/dma/pl330.c
> @@ -1803,15 +1803,33 @@ static inline void _free_event(struct
> pl330_thread *thrd, int ev)
>   pl330->events[ev] = -1;
>  }
>
> -static void pl330_release_channel(struct pl330_thread *thrd)
> +static void pl330_release_channel(struct pl330_thread *thrd,
> +  struct dma_pl330_desc **done_a,
> +  struct dma_pl330_desc **done_b)
>  {
> + *done_a = NULL;
> + *done_b = NULL;
> +
>   if (!thrd || thrd->free)
>   return;
>
>   _stop(thrd);
>
> - dma_pl330_rqcb(thrd->req[1 - thrd->lstenq].desc, PL330_ERR_ABORT);
> - dma_pl330_rqcb(thrd->req[thrd->lstenq].desc, PL330_ERR_ABORT);
> + *done_a = thrd->req[1 - thrd->lstenq].desc;
> + *done_b = thrd->req[thrd->lstenq].desc;
>
>   _free_event(thrd, thrd->ev);
>   thrd->free = true;
> @@ -1993,12 +2011,15 @@ static int pl330_add(struct pl330_dmac *pl330)
>  static int dmac_free_threads(struct pl330_dmac *pl330)
>  {
>   struct pl330_thread *thrd;
> + struct dma_pl330_desc *done_a, *done_b;
>   int i;
>
>   /* Release Channel threads */
>   for (i = 0; i < pl330->pcfg.num_chan; i++) {
>   thrd = &pl330->channels[i];
> - pl330_release_channel(thrd);
> + pl330_release_channel(thrd, &done_a, &done_b);
> + dma_pl330_rqcb(done_a, PL330_ERR_ABORT);
> + dma_pl330_rqcb(done_b, PL330_ERR_ABORT);
>   }
>
>   /* Free memory */
> @@ -2353,6 +2374,7 @@ static void pl330_free_chan_resources(struct
> dma_chan *chan)
>  {
>   struct dma_pl330_chan *pch = to_pchan(chan);
>   struct pl330_dmac *pl330 = pch->dmac;
> + struct dma_pl330_desc *done_a, *done_b;
>   unsigned long flags;
>
>   tasklet_kill(&pch->task);
> @@ -2360,13 +2382,17 @@ static void pl330_free_chan_resources(struct
> dma_chan *chan)
>   pm_runtime_get_sync(pch->dmac->ddma.dev);
>   spin_lock_irqsave(&pl330->lock, flags);
>
> - pl330_release_channel(pch->thread);
> + /* The two callbacks take pch->lock, so they run after the unlock below. */
> + pl330_release_channel(pch->thread, &done_a, &done_b);
>   pch->thread = NULL;
>
>   if (pch->cyclic)
>   list_splice_tail_init(&pch->work_list, &pch->dmac->desc_pool);
>
>   spin_unlock_irqrestore(&pl330->lock, flags);
> +
> + dma_pl330_rqcb(done_a, PL330_ERR_ABORT);
> + dma_pl330_rqcb(done_b, PL330_ERR_ABORT);
>   pm_runtime_put_autosuspend(pch->dmac->ddma.dev);
>   pl330_unprep_slave_fifo(pch);
>  }
> --
> 2.43.0
