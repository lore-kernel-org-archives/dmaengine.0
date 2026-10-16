Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011009.outbound.protection.outlook.com [52.101.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB393B71A9
	for <dmaengine@vger.kernel.org>; Fri, 16 Oct 2026 15:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792165077; cv=fail; b=DJk9PIJtHEiwtfP//K2a2h4F4kpcVdXCmzye6NXsvUEEseIWS0SbzUf1ReiOq9uXjm0D4DGhTz4cmtHOY5MKHX5tBoqlZbi/RYqEesP89VKikd7hBn9F1d1pNwDBYq/rRMd6EGwsXFE+rZunvLEpPXvwjWzaJ1gV3LUigk3MryU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792165077; c=relaxed/simple;
	bh=X5Z+qfr0HA+uv95f3+Pswii7SRo3SFzDciwcLsyFiMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oJ6pfbsD2m6TevvNhXfBTZIoNiMjm6nxjv+SWVJlCdsybI8ekGT68LTC79d8wD1PLRaBBjJ8FGM/gEOhQwD1Ub5a7OyAI+/uEhZop4oJW1xXWpIZVXJI9GD2LCwft97wUg/tKifs9THMN3ra6M9KW0RlPa0MkZFS8BS/UPktlwM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=MKyNF3OL reason="signature verification failed"; arc=fail smtp.client-ip=52.101.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="MKyNF3OL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jEGdU4iplBPibdn73uzofUHU0iJDLAzSW/FiT8Qe40mIwlWqVXmwLJP9fWEQXrxneU0t7ffjZVy4wJpiUyGSZ7jrpgWeaVulFeRo4pQjZG0qbHqaZcwx06wzvMsTPOKf3XuwkCw6sCbMZqvju5Y9ARmBPRu3x6xkSXEo02RgisQOBoXWTInPwH8cLY5otZCfBStswkk2e8N3bHZWR96Q0ZYfdCujIPDzzKdVJyj+AXRgZFlzlm3NJQwgVMvZXT6N5+E8W/VEuGBfLdFPdRBu+LiozvupkW3VeZji1kP3zRu8b2li4HvTpYERW4iP033FoWKlNmPhBr6DTLcboQT0ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RSa1AQio4l2WmT9lvlfCCfzayJeFYnzq6WLvCziz47I=;
 b=gnwRycZxlQJiMTaBArtNP6s/NrZ69I+wavMJwloMAZCfqs+/pgGI8WkVrctJCE12aVSBak0kCCqm/6IJBE215cO8C/tyaLKORWn0N+Azncbayi+It8SvOCNb4QWfY+5VZDsbw2ffJSc4KUICthw98At7nA2nNfdk8DZLvJWfTuWIbqcTViEEw/mEQcS1X2JfVa5WOT59w9z3ZJDQkA/xUEqE6il2tSR418tMCtiQYduYUImx7fnvfDFArDvDa9LUlZfShTddcmlOL8lQiQXjm4o5kOJdAinnX1eQIPy5qUZqR9GBJRyndDCyvLakPJnFtoqJ7skHOKjauCSsSHB5+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RSa1AQio4l2WmT9lvlfCCfzayJeFYnzq6WLvCziz47I=;
 b=MKyNF3OLK75jBNWyCn1z4+QsWazN3xwV0kvSbRsz1+KJcAN/jEttMYWv/Jj0nwuQNtmMfhSb1IFQPdBqh6c0+ZNRPNMzWHHw3cgf0k/jbvn571xpTiT/h5SDcsKfn3GXA8jVOlf42erAInN3pZleV3meP2XO2IMt0sfhyJqwJFw69/nC4V8KVH45f6OBMG2YCGIsjkXcbhdEp5/DjZ3kje+g9yL6We6lqNVixeoEVO3HnctofzL1VxE2ppXt9aB51aD5mvmhy0FpxmyV8hOEcZ3Vdq/enSz4zxeZLuKJ49fZ7UOIsfGjiNF6dFnbec5YSvPUeSmeM84nIHeBQoYNXA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS1PR04MB043897.eurprd04.prod.outlook.com (2603:10a6:20b:6d2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Fri, 16 Oct
 2026 15:37:53 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 15:37:53 +0000
Date: Fri, 16 Oct 2026 11:37:47 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Hongling Zeng <zenghongling@kylinos.cn>, Frank.Li@kernel.org,
	vkoul@kernel.org, linux-sunxi@lists.linux.dev,
	dmaengine@vger.kernel.org
Subject: Re: [PATCH] dmaengine: sun6i: Fix potential deadlock in
 dma_terminate_all and pause
Message-ID: <atJEy6w9J5_NTLa9@lizhi-Precision-Tower-5810>
References: <20260705082105.13325-1-zenghongling@kylinos.cn>
 <20260705083134.001491F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260705083134.001491F000E9@smtp.kernel.org>
X-ClientProxiedBy: DS7P220CA0039.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:8:223::33) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS1PR04MB043897:EE_
X-MS-Office365-Filtering-Correlation-Id: d500d60c-e8eb-4d67-e62e-08df2b9b718a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|19092799006|261009223027099003|56012099006|5023799004|4143699003|11063799006|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	3hm4oiOYgIaY1g8n7ZSlxONG/3ZTYjdgyyvfcD89yNnt//VPFQJXK7ERJvNVrGlsXdKF4Vk+ZD1q3+/7YaricAMhyBm2yUltLOL9pPTllVtHfV1bi7n0ocQJxx+dnMaOOGtXyAMPYyerFB/clEoh3X2asrnQYGym12lr7qlr8YDO/QmlJYjj/TPOWYXuKf+2o2svLF520liuskWa6/OOQEP4eLSe5OGRGVahOQFExcG92OWctn/DMEyiqEyB26C/pqzBfp8adn21v1bFgBwbLefeebnczf0rXQpdBo8aGgqDtc9PuBZ7gYge1xxppORiU60Y5skVORe98x2rrJErgitkI1BHs086MeF30+G1yHkwJgNc9+sKv3a3JxwqK4+slpQ80uRSlz1dI+vSCgfEZc335nut7bqPMeq+MnpeBdAhO+2E7wHEl7aCYtiNtkpuiuj//+yKql51Cy7qI1NAuNdv59y3Pq/WoSUmA7nM4jPqCYUciRc+E/FOIYNUOeYDYr7QyOT3DxWB1TZUqBoYh5dYpSYJtUNbAwa34MeLllUaWJIrbKdNVYG9WnxmPEalGdg+Qe94C5Hy13Bao4sTaT6NLxZ+2eUp1LBGSpYmlvk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(19092799006)(261009223027099003)(56012099006)(5023799004)(4143699003)(11063799006)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?O9Jieu6PlFgxuAWunQRF59lFAJqFj8ehI2hAfVFYfrVQBmwAccKdPaS7l4?=
 =?iso-8859-1?Q?GCie2SxFzDzah2tfShYmcemW+ngWsYIb1L+BwHuS9eR88OJAgXcO6u3rBj?=
 =?iso-8859-1?Q?ZUZuLm1Okvv+BLreeILAFa2Fd3GYWsi3IE77rcA1vFYSxsqNTt4HQY1zEg?=
 =?iso-8859-1?Q?NyAkWmxOYpZF3XtmHaim9MULwWhN9Z8ftmdh4rVGY3H3W6+WKdPbS7bH/K?=
 =?iso-8859-1?Q?k72pLYyTXd6SjBVPGkWLlsA5BmjeuRFEi94EBXpCtAqVjTsuvvPdwSLoRz?=
 =?iso-8859-1?Q?ccVEwYn43hqvPajpUOYLpHXCZUhnVFem4W7Vu+yhHhwBRTYMaXDLhHABvc?=
 =?iso-8859-1?Q?CII8Ghuw8sbM3vlaxsM0RoF+TWPcgoIzKT4u8fcdghKR/sQ8rqM1KBPASa?=
 =?iso-8859-1?Q?2y2860Y9/vqQpTexCubP7jFKhQobx1k0Kdpq1ngYF9uRHr8/Yr2bQpSB7Y?=
 =?iso-8859-1?Q?AP0GTRfJXWgH9YJqTXRhRmc7Cr2eKkRKNHq1ELB5Lr50x91hRhr9iMEBbE?=
 =?iso-8859-1?Q?HZSzr5ASgLYtxi9ZwjRPK81hdu2AbNn+Qyx7eS5fVk8ktUgRXCy6GN3uWR?=
 =?iso-8859-1?Q?vBY1RcN/SlidwThvl3B/QW0EDlxKBT/oZMOY9j30MN0LAeeEz5OyE9M9hs?=
 =?iso-8859-1?Q?B4ImWQ0GA4dBqqAsyFebO5B5Gnl52O9LDR8l21gi8DA6CHNZ0zO5eKwiMX?=
 =?iso-8859-1?Q?DJuUfSjAHwClqPpKXEg8v8jcfqBQRVudIXmLdHqRMQ1Wswx42Ow/OddxWz?=
 =?iso-8859-1?Q?b7shdy+TyM8Mdo2paLMf39YtEDxTSIdEKhpiDr9aToxuGO4hpOQ8qrBHyI?=
 =?iso-8859-1?Q?i2oe6yFke5jtKyW3pH7L0csNp49N8w651FrBqxEdG950UvvOx+ZhHJHRCC?=
 =?iso-8859-1?Q?abonZpTK0FE6hCWWXzD4r54WLBRQBIj4ihSc5rW7IqtdnQgZ4ILL3Qil3C?=
 =?iso-8859-1?Q?RoFyDV4izii8I/v/cXIMmc/4igGtw5SUukD8uRfCBply8HSsZczq72kQA+?=
 =?iso-8859-1?Q?fgFrAV6xO+0Gj1eGSKzegArawXZ+1OYKCzxVBkIVRYBpneMAoFjdBIe3Qp?=
 =?iso-8859-1?Q?28u0x3mbMOlupeqbu4ZKh3UQCSoaH5tCpl+BEpJKnt0MNsm63lugpEmSOn?=
 =?iso-8859-1?Q?lKX1qu5eNEEpeZlAz9z4zy8P8FsK7YSTdSK09z2sNCHSYh6E3vznOJ4Z1v?=
 =?iso-8859-1?Q?OIdDn3R+zFCvqeFHRebvlzKnPJl5NDrvi0jskQcPEhkIj0Y0jSKNFp+zYi?=
 =?iso-8859-1?Q?IuQFinOOhIhl7/xhR+mG3YFr23liZQ1cPjX8UKQujeJebGDclD/jCh7q/E?=
 =?iso-8859-1?Q?MOBb4KrnWWa8ySf8vlxmv7ER6L+MIQCnDwUsBd+Mf5rB7Pi/mWWSAZEyYz?=
 =?iso-8859-1?Q?GghdWK1Up2eOF3Gm0DqIM6HpoTk8Ly/XF2QYBx4rd2osP9JwyMKEulebPv?=
 =?iso-8859-1?Q?eHE5DnX7RV4K5dsbLRmtTdnVoL12YGeyIp3X625YWse37Tz/oWqjp1MKqs?=
 =?iso-8859-1?Q?KjNGZy6y8hAmp+bIQdaHAJhLZYBQuxlpwi+HIwSU6kJuWLpo/JGJzSyNeg?=
 =?iso-8859-1?Q?3DeTu2od2A/n+lTGlxeArM45sRuKrSKhAwV2MbhID2czllc67THrCP92Pk?=
 =?iso-8859-1?Q?DXzejwUm3QlHiTEneFvU955B/jH9efnRDXJNjYkronDJcHj+K39d4Y2c5m?=
 =?iso-8859-1?Q?UNK15fXmdhNPO1pSOrip3dX18zAl8BhjJLTXQu309uh51hLYlfznOqjrT1?=
 =?iso-8859-1?Q?PmzbPl+zrJOvXynIWozZlKopPObyftjL/DgVuvsgj4N+Bc7TrmfbHILmDY?=
 =?iso-8859-1?Q?WAMlrmBaF15wbis6SDp2yfrav/KXDC8F06qiWD/l/T1+ho+immyx?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d500d60c-e8eb-4d67-e62e-08df2b9b718a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 15:37:53.5946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zZuapq2Dpj6tb6wnlYutKiByxDBkbWnFPGp3PquAauZp7TWH1r1a7bRq2+IS3U6bsiiMy8Gg9o8j48mBwfDbXUQBzLvNuxUvbY5oPXexFz9z30Ig78zp9rLn1uO/rJeS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB043897

On Sun, Jul 05, 2026 at 08:31:33AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
>
> New issues:
> - [High] Use of spin_lock_irq()/spin_unlock_irq() unconditionally re-enables hardware interrupts, breaking caller atomic contexts.

Please fix this issue

Frank
>
> Pre-existing issues:
> - [High] Lockless reads of vchan->phy introduce Time-of-Check to Time-of-Use (TOCTOU) races causing cross-channel interference.
> - [High] Active, non-cyclic DMA descriptors are leaked upon channel termination.
> --
>
> commit 5ad36fe6cb5ac09d034a98b6efc7e6a3152d1705
> Author: Hongling Zeng <zenghongling@kylinos.cn>
>
> dmaengine: sun6i: Fix potential deadlock in dma_terminate_all and pause
>
> This patch addresses a deadlock between process context and the DMA tasklet
> in softirq context. It replaces plain spin_lock() and spin_unlock() with
> their irq variants for sdev->lock in sun6i_dma_pause() and
> sun6i_dma_terminate_all().
>
> > diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> > index a9a254dbf8cb9..37b143a8f75e2 100644
> > --- a/drivers/dma/sun6i-dma.c
> > +++ b/drivers/dma/sun6i-dma.c
> > @@ -898,9 +898,9 @@ static int sun6i_dma_pause(struct dma_chan *chan)
> >  		writel(DMA_CHAN_PAUSE_PAUSE,
> >  		       pchan->base + DMA_CHAN_PAUSE);
> >  	} else {
> > -		spin_lock(&sdev->lock);
> > +		spin_lock_irq(&sdev->lock);
> >  		list_del_init(&vchan->node);
> > -		spin_unlock(&sdev->lock);
> > +		spin_unlock_irq(&sdev->lock);
>
> [Severity: High]
> Does spin_unlock_irq() unintentionally enable hardware interrupts for callers
> that enter this function with interrupts disabled?
>
> DMA engine API functions like dmaengine_pause() are frequently called by
> client drivers from atomic contexts where interrupts are already disabled (for
> example, while holding a lock via spin_lock_irqsave()). Since
> spin_unlock_irq() unconditionally re-enables hardware interrupts, could this
> destroy the caller's atomicity and lead to scheduling while atomic panics or
> deadlocks?
>
> Would it be safer to use spin_lock_irqsave() and spin_unlock_irqrestore()
> here instead?
>
> [ ... ]
>
> > @@ -939,9 +939,9 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
> >  	unsigned long flags;
> >  	LIST_HEAD(head);
>
> [Severity: High]
> This is a pre-existing issue, but does fetching the physical channel pointer
> locklessly at the start of this function introduce a race condition?
>
> At the top of sun6i_dma_terminate_all(), we have:
>
>     struct sun6i_pchan *pchan = vchan->phy;
>
> If a DMA transfer completes concurrently on another CPU, the tasklet might
> clear vchan->phy and reassign the same pchan to a different virtual channel.
> When sun6i_dma_terminate_all() later acquires the lock and calls writel() to
> stop the channel, could it mistakenly stop an unrelated transfer that was just
> started on that physical channel?
>
> [Severity: High]
> This is a pre-existing issue, but does sun6i_dma_terminate_all() leak active
> non-cyclic descriptors?
>
> When terminating, the function has logic to rescue cyclic descriptors and move
> them to the completed list:
>
>     if (vchan->cyclic) {
>         vchan->cyclic = false;
>         if (pchan && pchan->desc) {
>             ...
>             list_add_tail(&vd->node, &vc->desc_completed);
>         }
>     }
>
> However, for non-cyclic transfers, it ignores the active descriptor entirely
> and sets pchan->desc = NULL. Because vchan_get_all_descriptors() only grabs
> descriptors from the tracking lists, the active non-cyclic descriptor is
> bypassed and lost. Could this lead to a permanent memory leak of sun6i_desc
> structures and their associated hardware pools when non-cyclic transfers are
> aborted?
>
> > -	spin_lock(&sdev->lock);
> > +	spin_lock_irq(&sdev->lock);
> >  	list_del_init(&vchan->node);
> > -	spin_unlock(&sdev->lock);
> > +	spin_unlock_irq(&sdev->lock);
>
> [Severity: High]
> Similar to sun6i_dma_pause(), will this spin_unlock_irq() unconditionally
> enable hardware interrupts and break the caller's atomic context?
>
> Also, because it re-enables interrupts before the immediately following
> spin_lock_irqsave(&vchan->vc.lock, flags) call, could it corrupt the IRQ
> state saved in flags?
>
> >
> >  	spin_lock_irqsave(&vchan->vc.lock, flags);
> >
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260705082105.13325-1-zenghongling@kylinos.cn?part=1
