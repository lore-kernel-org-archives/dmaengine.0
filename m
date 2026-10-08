Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013064.outbound.protection.outlook.com [40.107.159.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F10331C567;
	Thu,  8 Oct 2026 21:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791494639; cv=fail; b=UearlJ6zRt0O9J/99Vbeq5gEVAaMg7hS1jcQTZ03LKqBZiXvk8dsV8+zT3jPE9yb/oFc1sbv/VwF+MZ0hTxGmQ/p7Z1sdjDo3PsrgerPti+lxaGYqEtgPNkqRnrqtkJfmT8BmK1zkxi5PtgUUcVDMf+9XXohPTKvGDqxjEmxU7M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791494639; c=relaxed/simple;
	bh=F96iKkPzBfpORRTWAZFPrWwI2TTS+P4/arfX8mMbiec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rtav1fADbW1k0rM6yJlpAgtpBlgbd41i75W7kf9b1pBU3OqD6MfkK+0q1IBJj6LUvhPq1bR+G/xlnxoFF0rOYgkxrPSnfQjOS9FpAXeuT63IAM2T+gqot9lwfHvyt4qausBPuJNQxSawii+Zqlh37IHwTXZAoVBLuDI9rSALWjE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=C30Dr4ie; arc=fail smtp.client-ip=40.107.159.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="C30Dr4ie"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sxm8Vw5S8kxAv1L+6E4P0Y2sUHanlBZY/QoFP709N6oo5xKCANzNJJBhd0PhBgN4iA8o+M1pqwXRzDOPCEZNMPRngFxHaaQ/grcDmzI3GYi6undUCju8ut0VD8SSB34Ky9B3mfk/K1Wkh7IqwJxHM6W3fUHfImLuUTB3WmczrXTagMCh2mmIbICEN3TnTQLC5qUK927CE52ukXN3qtJQkyZ60j58qPBQoJV1VRMHdToXunT62sisDxwS8x3Y27p+bVSHN74Rjo0ivZtAZ7E4iHm7bWq68yXEUk+jN9mRxbG3cNSq+7elkRan1EJNuENVDc4YfBk6aV944+Jpc2cmig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wev4kxGArQ7rnlz2z41EDvIzBx7RHaZTFZFi/WVNUw4=;
 b=BNaO7L0jxx4UDfqYCZkUBEs2ZV1EgZURWic5u7Ey0jkYeR23AWB4XKQZJuDC+HxVgfJ00MZbHtzXSNLqTcAPBO/lrq3jECoem2AQTevW6czJrprjn+Yw1THum2T3dbZNGpwE562UB7V3JxY1YCcuYnauV3049bNQvZ0x8WkqiIpFJRggop0tvn+GevM8VXvhlp3jqZoUax2/Miq7ixOWrmepXe7urJMb6u3QLw7e22QcjYl6oF/PPhdxj2POYOTfp3wqUSy9mx9hbCGeqIHtrZhKgNji56v2xNZ91lOl4bIUUQBVW1W9Qv6vx3XRt3ZfJB3JNr4FlOmghXcTW6sVVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wev4kxGArQ7rnlz2z41EDvIzBx7RHaZTFZFi/WVNUw4=;
 b=C30Dr4ie+bh/cOP3r45K7t1qWoSo+TGvy6/mr+Ll4WD52S9mlHTATsdEpHGM7PZmm1fK7yCYON8SSmFijOKNj4n41ia/UDh76ufXaFy/coccKm6fcp7AS7blBtV7/583bC/m3AdrI/LUXESkdk88xls+e8sdnRo3SLcCNtaLoCJlf4X9KAgTD4ovakC4Yydkz/VwurQU88khrzcAQZNmPjGiazNSUkOVYIwhoaFaWmTPoKSjq4EkUBvjKRrgdum7SRms2vLQuqYK9zVgpz+IOmINFwf9fxFmV6XXJpb1TpU6GgsX8aVBnmn9oGaQoEAlcEUllt9pShrQdfMnd2Xtbw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA1PR04MB10675.eurprd04.prod.outlook.com (2603:10a6:102:48f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 21:23:54 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 21:23:54 +0000
Date: Thu, 8 Oct 2026 16:23:49 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Ginger Li <ginger.jzllee@gmail.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: pl330: Fix lock-order inversion in the
 channel release path
Message-ID: <asgJ5cVHQyiKFJo7@SMW015318>
References: <20261007150104.38253-1-ginger.jzllee@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007150104.38253-1-ginger.jzllee@gmail.com>
X-ClientProxiedBy: AM0PR02CA0153.eurprd02.prod.outlook.com
 (2603:10a6:20b:28d::20) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA1PR04MB10675:EE_
X-MS-Office365-Filtering-Correlation-Id: b84e65ba-6a30-4dd8-beb8-08df2582746b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|19092799006|366016|6133799003|22082099003|18002099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	Y3Zgye3fUcMx5NUfBG1BkAI2ID1VMhdN0RyFfouLRA4tGqB+RUb3OeEgh4y2/Rh72ce4PuuZZyHs+rsp4yL0Aj15VwPrMbCqz/8dRSaTn34BHyju5z7JsROi3DdcHVHsrTQ0botIFjkGH4m4DpHQ+wAnDbuokM7J1supfzlVeh6THURDWWzIGHLhD/XmjdsVrOwGtuSWb/8msfj5YAYUuKLM0EPj5/Spexjxu5EOQnSDwNIq9Zz+x80Tmw/HsCbu2ioawMS4nOczbvnja9003jx/GYkaOHGpW5Suth78Vd3nQsw9CzR9CoCgfB2vTpNDvSIGsirzcmtEXEZOLKFGE5GAUT9RIDcesVJxGIriFQgHMYMvLLtpFYmovh+W7rNJWIKCAQtsMIFw0/QlzBth1x/a7JERD7U5xyB9CANnxkIQfw7fYD0b1vWkxpiJoaz0iCXubRuc5bGGS5bopH9IyzeernHhv/65C8d+mg7h28vK9XQNKfMpKuwFtKPHDp9D2lAITH9e7oPGc7vD4AqnvhW0Wy94XkMNnJVeo+IXtX/bhiiYNpD9cstZfHBbvJBoZ9DSuksSoj663e7QkfXkXvs0ur6H4OoRpvJyRpGMCy6amt+2OyQZj5t2krxiDSN+kOrlOc6nU9/SRVTsOzWkzQTBN0oSzJY2YerKJdDdZGc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(19092799006)(366016)(6133799003)(22082099003)(18002099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AZQ9Ez0vyiyKkU9+qmBFaNcyXunqcUUVkuVxnyWABZY9eGKURKoTRZTnzoqf?=
 =?us-ascii?Q?xRDNXegV6IOrGY5v0U9gF8JDI0Ogx3GIgKcOxVqvO+HKwtVWFlPnvtVrNnxw?=
 =?us-ascii?Q?qiJYeHWe+JUSyPBZfApb3AgnrYEKXdJGkg5RCp0RaVbPw36Q+PFFCZHo1K+8?=
 =?us-ascii?Q?I7hwYvARRGMX+GqvQRM/d+00S+1mwIT9rvugn5PWe2RDFDDiY/AezxbFcPbH?=
 =?us-ascii?Q?zkNA2xKL8cnotCMVh3rsYVQXG0MnutPTRmnLZUMwOHHGqDvJasUcWE19ujrF?=
 =?us-ascii?Q?sCIX3KtHaXY29lEqgAMyWxN/8ubK0qt4Pgqt8TrhkX+lSGKjKm96MnL4ZB1b?=
 =?us-ascii?Q?NTGNIIO4ohuDgFcG69AAoOPxOdhYrnxWVhuXdz2cidQT9d50dI3Z+uJEcEbj?=
 =?us-ascii?Q?6Ld0e1k+VAAfZAsqdLYS9Q2yjR1+u7ld6vPqi4j1idOUM78Lr8v1esGJpLFJ?=
 =?us-ascii?Q?eomOx+e+HS8xfv5QsatE+Nfp+0zNO2Tob4b1wO3ww8ty0mlMi7hHffrRTrHU?=
 =?us-ascii?Q?Q3K/fZzG06l8h2WTJ/FrX50VVHPbWkAYeGmwOt/3dV7SYwqy+c6uQ/tLoUi4?=
 =?us-ascii?Q?hiqnGifXRG2lKNejgFrKrMXikpd8/0zU6EfkoPa44gY4AdTAcpPG75jYl8+W?=
 =?us-ascii?Q?OCXQpm3ecthHnzxCsY4aKI+SkjMml+heovqXU0PWGHLiJujY581GTfGNfltw?=
 =?us-ascii?Q?8jcIYQgGHrfulQXM1XEVSRI7D11YMjQoJOjBlvzXyhv3d/2akEG95HBLKG8k?=
 =?us-ascii?Q?DMeR33Swb5sKpjFmqDrybfsrbhy9h2NFoLZ62U1pLHStsx5B0fveKlZn6dty?=
 =?us-ascii?Q?dcRBoYSeZupxXgv3fQzbD6XHeq6Y+Uf/fGbTc1cvSRi7NrTUB/FKrYevhqfr?=
 =?us-ascii?Q?yECQpQIEdliF45WGvsOoFB5xoO8yadTMzogTrESt+xIphJfRldmBb6WcEaDR?=
 =?us-ascii?Q?LW3e3oEKrBmKhi/AR8WfUcnHM9Pjs9AT6sWfFrVehFnEM42Kr10urGPdJUUQ?=
 =?us-ascii?Q?qoOawKP+lEczaYavY++Hkv4/YWE6NArxyyW50yTHICeCl2DGDpM80hLCL9YE?=
 =?us-ascii?Q?c07+ulLVQHxFYCI2ZoWD8qL0HaocromD9Qk30rRkoAsUBfofomO2sFcno78t?=
 =?us-ascii?Q?K+XgFjofgNL17UsrSu1iJuKMnv5RwxlrTWdQdUBJ1NP5k3b8WakX6O+KET71?=
 =?us-ascii?Q?iGLRMsk3/elAm/XF8yZD10AaWJZBTfo2bEYPOa3iFmo7MBOSsr3fiBzwdvBB?=
 =?us-ascii?Q?3TyjGh2vIqXLb8mJlYSIYRIvU3+y2yHIvfhNcPfPiH9x3FUhr/XfzltcN3Ue?=
 =?us-ascii?Q?sgQRdF8K2lZ+aq/LC5r80weaqnaM88fqBrmORxKIMSgrbe6vowpHIi1Q/bm4?=
 =?us-ascii?Q?6HF1IHPO69ETTls0A7RIt/l/sIpiZXH1vp9NsDdaJWlWeYcxKspl4FG8X72W?=
 =?us-ascii?Q?jUZmxzv8jfTYfyTFld9iDHkFn09xxrJVMd4aQMcs2+9tEvZ6a0kiyLNQAQ65?=
 =?us-ascii?Q?GhfhdiioE1K4waH5VOSOs3/4ycbKmlRRIcyuITpmAQcyrvgpsKzDCSVDPJNg?=
 =?us-ascii?Q?KmSyKiwuh+0fyj3ypxIm5hOQ1oQwCkvRFExNClO6vc2i7QjlYBhXO95jzKZs?=
 =?us-ascii?Q?vGTj6MHClWKuowB/XuUZSfuJH4ZQlgn0XC/vXyox5JuCnKTB1Xf2Oaz9C+X+?=
 =?us-ascii?Q?1G0Om1Pv/yQqq4bZWwjhkW78m6EBiZQ7AqDj1zmm88NEB+mEQ4XPRGoSU2nj?=
 =?us-ascii?Q?fS72deBh+xjD10SuERpJy7boJjwdVN2kpsesY1biVu5GNh6H9skp?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b84e65ba-6a30-4dd8-beb8-08df2582746b
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 21:23:54.2548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3gKwtMmoBH3dBh6/wcSLA3klCc3QVbqP637zdJLqP0seeR6UNuu1fYSRaIpI/+vLlY02phPV70mOaJld+miqt7d06NxZE4De09N1haMwK8MNMIde857SN7dXAxgfJM0T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10675

On Wed, Oct 07, 2026 at 11:01:04PM +0800, Ginger Li wrote:
> [You don't often get email from ginger.jzllee@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> pl330 uses two locks per transfer: the channel lock pch->lock and the
> controller lock pl330->lock. My static analyzer reported that they can

			       The static analyzer ....

> be taken concurrently in opposite orders, leading to potential deadlocks.
>
> The terminate/stop paths take pch->lock first and then pl330->lock, e.g.
>   pl330_terminate_all()
>     -> spin_lock_irqsave(&pch->lock, flags);
>     -> spin_lock(&pl330->lock);
> and
>   pl330_pause()
>     -> spin_lock_irqsave(&pch->lock, flags);
>     -> spin_lock(&pl330->lock);
>
> While on the other hand, the channel release path takes pl330->lock first
> and then pch->lock in pl330_free_chan_resources():
>   pl330_free_chan_resources()
>     -> spin_lock_irqsave(&pl330->lock, flags);
>     -> pl330_release_channel(pch->thread);
>     -> dma_pl330_rqcb()
>       -> spin_lock_irqsave(&pch->lock, flags);
>
> Freeing a channel (dma_release_channel() -> dma_chan_put() ->
> pl330_free_chan_resources()) while another CPU is in pl330_terminate_all()
> or pl330_pause() on the same channel is therefore an ABBA deadlock: the
> one thread spins on pl330->lock that the other holds, and vice versa.

To here is enough. cut below message.

>
> Inspecting the driver code suggests the rule that dma_pl330_rqcb() must
> not be called with pl330->lock held: pl330_dotask() and the callback
> drain loop  in pl330_update() both releases pl330->lock before their
> dma_pl330_rqcb() calls. Thus, pl330_release_channel() is expected
> to follow the same manner.
>
> Let pl330_release_channel() manage pl330->lock itself and keep the two
> dma_pl330_rqcb() calls outside the critical section, and stop holding
> pl330->lock around the call in pl330_free_chan_resources().
>
> This was found by a static analyzer on Linux 7.3-rc4; it reported
> DeadLock::AllLock (Certain) for
>
>     pl330_free_chan_resources() <-> pl330_terminate_all()
>     pl330_free_chan_resources() <-> pl330_pause().
>
> Fixes: 91539eb1fda2 ("dmaengine: pl330: fix double lock")
> Signed-off-by: Ginger Li <ginger.jzllee@gmail.com>
> ---
>  drivers/dma/pl330.c | 24 +++++++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
> --- a/drivers/dma/pl330.c
> +++ b/drivers/dma/pl330.c
> @@ -1805,16 +1805,32 @@
>
>  static void pl330_release_channel(struct pl330_thread *thrd)
>  {
> +       struct pl330_dmac *pl330;
> +       unsigned long flags;
> +
>         if (!thrd || thrd->free)
>                 return;
>
> +       pl330 = thrd->dmac;
> +
> +       spin_lock_irqsave(&pl330->lock, flags);
>         _stop(thrd);
> +       spin_unlock_irqrestore(&pl330->lock, flags);

[1]
>
> +       /*
> +        * dma_pl330_rqcb() takes the channel lock, which is acquired before
> +        * pl330->lock on the terminate/pause/tx_status paths.  Calling it with
> +        * pl330->lock held would invert the lock order, so keep it outside the
> +        * critical section
> +        * pl330_update() already follow.
> +        */
>         dma_pl330_rqcb(thrd->req[1 - thrd->lstenq].desc, PL330_ERR_ABORT);
>         dma_pl330_rqcb(thrd->req[thrd->lstenq].desc, PL330_ERR_ABORT);
[2]
>
> +       spin_lock_irqsave(&pl330->lock, flags);
>         _free_event(thrd, thrd->ev);
>         thrd->free = true;
> +       spin_unlock_irqrestore(&pl330->lock, flags);

[3],

how do you make sure it is safe to do 1, 2 and 3 without pl330->lock?

Frank
>  }
>
>  /* Initialize the structure for PL330 configuration, that can be used
> @@ -2358,9 +2374,15 @@
>         tasklet_kill(&pch->task);
>
>         pm_runtime_get_sync(pch->dmac->ddma.dev);
> -       spin_lock_irqsave(&pl330->lock, flags);
>
> +       /*
> +        * pl330_release_channel() takes pl330->lock itself and calls
> +        * dma_pl330_rqcb(), which takes the channel lock.  It must therefore
> +        * not be called with pl330->lock held (see the comment there).
> +        */
>         pl330_release_channel(pch->thread);
> +
> +       spin_lock_irqsave(&pl330->lock, flags);
>         pch->thread = NULL;
>
>         if (pch->cyclic)
> --
> 2.43.0
