Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011003.outbound.protection.outlook.com [52.101.70.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847902DEA8F
	for <dmaengine@vger.kernel.org>; Fri, 16 Oct 2026 15:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792164858; cv=fail; b=PlzMOFZVy3sbHrrDBT6sSvSAw2KzT36fBCc02xkw5CzVHGqzKmqobHcMrDThA4sqLXt11TQxf5hZLtQm8M4Y2A0sXQvcY5h3LkJVuWiyxHAB1exqv78PK8TnQVgB0D0/SxAscvzEiNd0TjbAEJvF838IRj8YsbY3qRzB0N/kK6I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792164858; c=relaxed/simple;
	bh=cRgPb9hEjCM+5tUzysON2AiiIih0HOaVezXvIIj1VLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hY7o+ljqLajC93Mz7cZV2LGA0lda9OsNNDREPj8fa/Oik7arfC3vZWVJT/WcsMQ2nS+WzZwNRlRSzJ6PGIv8E7OHg3U2iCHroJvtoQc+K63u/sSPYl9rXx6fwsTBj/5BXe8PpOJFbl1wjrPKxF6Tw83UC5DIujjIOYRhlcq+c2M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=iB7/reDJ reason="signature verification failed"; arc=fail smtp.client-ip=52.101.70.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="iB7/reDJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D/AkKG03Rcw0BLkDMUwBM7QDzyJrfM3Q/kKwv7IsLssNw26srDOxD0Mp7pKQugm6/GwfDPX5v1nJQOKi5GCqi0sSbW0AN/8rUm+zS+N/zufWUHibJL2gvm2GuY5tKFWX8Lhdyg2EMdVwHI3J0I9llD2XmUa+N8uEVAo0R7AyAqsvt/Y6Zwz8hroukm78FdyD04vtM0J/09FvqHE6L8WXSc32Y0atiQsy++qxLlXIooIML5CbQFgEBB5VnQ2Bn8bzjQGSYAc8uD0Utwo3DOvN1CXIhPmo95jNeqtjjbMsu69lPGj1l9jsaKFXxD9RjgCJJBQQ/4CkdPeNy6ZcWvJIzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EMZpXjciAS1Z2fBRyBc1/o1vXotmGd+uAnqRbANQOPY=;
 b=vJKNucvQeSoaFJc2V6/YcKg1FFdquQXYX8pUb6YQBU96XN3dVsqXgq6WaMGi7RbxKOVvtVmYVG1Yp2J5pSXK0FouTx5oSB4xWjf9aEp1LGQoYSWJlfMOGxAYJ+DL6W9r8Cl1y9JkyKlo5z8Rx5eOeTC6okDWRRiLI/EPgBN/RSFTI0uhlzzfDxpoZz/SY406NP01Gzb+v90sGcoBFb3vUVfAVU3wUM2kBVKNKBT+0QaPyYzcmBi/pDB/d79VI/G36EmmlwL1TfoloKrU7oHjMTfKJnU1nV00r1auo1Teu0e5U4Fl05v2aE8q8GxWjScEBIiflyqCmrhjdL4Rgz6lhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EMZpXjciAS1Z2fBRyBc1/o1vXotmGd+uAnqRbANQOPY=;
 b=iB7/reDJOHLEQNIf54dvWL+ZiaM6JRR5GFNPYqnXnENS03439esGD92/7ukEDRixC7rCS4sn7rTGlKxC2BaGjwHWPZPKvXVYPwLp/8k5b7J4gBb7+cUnnEngKcaEjT5Vs0JS7o5rOXtSJaQIIDxM7eSvA4uT/8ll6mwTWBY3eyHLJR/Vtq4RpHlzS4WOkNrpqN0GV1gZ2Gg2f1SV4csxd0ZetPAke1dLuaVYilDvjldvcTF4zBkE1V1fF14+xcIsdugjp7J/lv/w8AkEii/JwafH13LDaj0mA2qFGYx5kci/+QyYnTrtpk2FmLTtKpxm1hkFx6wlD1wSgTn+y+yeoQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM0PR04MB7092.eurprd04.prod.outlook.com (2603:10a6:208:19c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.15; Fri, 16 Oct
 2026 15:34:11 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 15:34:11 +0000
Date: Fri, 16 Oct 2026 11:34:04 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Hongling Zeng <zenghongling@kylinos.cn>, Frank.Li@kernel.org,
	dmaengine@vger.kernel.org, vkoul@kernel.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] dmaengine: sun6i: Fix potential deadlock in
 sun6i_dma_terminate_all()
Message-ID: <atJD7EEGFVjdqhsC@lizhi-Precision-Tower-5810>
References: <20260705075738.10639-1-zenghongling@kylinos.cn>
 <20260705080726.585E31F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260705080726.585E31F000E9@smtp.kernel.org>
X-ClientProxiedBy: DS1PR04CA0006.namprd04.prod.outlook.com
 (2603:10b6:8:44f::6) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM0PR04MB7092:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ebefddd-b1bb-44d0-f98b-08df2b9aecda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|23010399003|376014|1800799024|6133799003|18002099003|22082099003|10067099003|4143699003|11063799006|261009223027099003|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info:
	jHm9Mi6rxxrpH+lq0P1FBl//e8y/VusGGPACn4EHkFtTN/ARrnqr9HG+z9H2uvtDY450jgW7U9CVfZ/W4X9UGqI+AgYozGlSMnJhe5Uz1A0JkuAUz1pyjppy5db8N8NNpKQmXKgvXVrFc/eslJMPVps59M0FcMY7ET0xg2XNO9OFS+RMXfUQeVCUUnIob4z3CqoBo90GnmzPvV6xG2YI3fBJoy+AKM4OJhnMlXLeb/Y9zFUHigHwM4BPKIVIPZEUSxjWg/dGlFfWr3m9nYnOrYhXPj0xQPLEv91ylmLQqVVHkhvx1aAYqsgcyNExLhh9Z124NF07FXA4Gu5hGPhPCPgLBW9vt9wH73JVCOe8BBfNUVj2ZorgFBDZXqQJo6YrwY3vaJ6wP5ldFfD2Aj9rq/pnD1ZsbG7D870XuPEYI/5JIorWG30EyCyyI+1MyBZmruZIwJUIC5X8Y0eWdmgSi7lBDpSDYcYTHCS+/uFqGjGmrHfXZ7peLhbiI2tNiRAhCwPv/w8CncFzNWnCjAnAt21UNNwRrpPruj/msc2Ni/xMLatpl6qFP/49jxq65ceaMLjsryx92DR1NqisyTobe52k0+6aKnNgIqpfsp2vtug=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(23010399003)(376014)(1800799024)(6133799003)(18002099003)(22082099003)(10067099003)(4143699003)(11063799006)(261009223027099003)(5023799004)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?C24CoFNHOarQC3IKuM5VVykxbw+Oow6Vi1Bqivp56jBOJ3GZyx4oJ802ni?=
 =?iso-8859-1?Q?XkMDfYewieWxfkJGtVqRWxdElQEqCZprqJc95pN0pckeiZORo51BEznnQI?=
 =?iso-8859-1?Q?TfWLd0vlvKDUV3EBdVX0lAVXm4W1Y7UZdTwPbhKiKs10oOtrBnOSvGsEpD?=
 =?iso-8859-1?Q?iKW3k2jt95ucmE+jCgwmaGVkaSr+sIPd3UQSpl+celF/uaZfIJdNhJxlRV?=
 =?iso-8859-1?Q?Qx+/K3ZJfk6CPLmw/DUjcCNKsRt8LaaYqtpii8szbeBNq7+hQlwcMkxVt5?=
 =?iso-8859-1?Q?i5ql1KaWE2oeOqWnj2juqTeVLYaX43/jCh4TOZbHtBfSNWZxrsKhUociEc?=
 =?iso-8859-1?Q?VprnVApwlyekckjY3vIkd7cJgvwjkfKegLCtxAfo2KvCOW86uHI/qsHLOr?=
 =?iso-8859-1?Q?Leb3rCfoR1yguWVWTnHJakMOZ9lKbako2xGnxM3vFKFBJFbFb4QPTF/Nzp?=
 =?iso-8859-1?Q?1NNtjSVQxpnmg8O6HMwrbUxNrSSVVM6EFww3gnlYXdkaib4FW2UZXmYzHP?=
 =?iso-8859-1?Q?rl2TtObHL0uSauVe8jHDpgcg+a/ZlGnUOLcOo+0iiR3M1MPZrK3Svm28JA?=
 =?iso-8859-1?Q?EcSWPmbLpi0ZRxTC/lHq3Wswv3SMc3cdWvaqnS+mo7HUwPQnI0FG1rRdDR?=
 =?iso-8859-1?Q?ekgGl+5SlrAgAHDhteadaBRyc+Qknpa+6FfK2bn5VW7pei4WQVobDeMANA?=
 =?iso-8859-1?Q?1jHA5gzWehvuUairrQ3bzQQoT2zDaI3IeiYm2PdWIN0akbEO6gh7fOTkbT?=
 =?iso-8859-1?Q?G45aOyVDhlUO1bA3+L1HPhGX9XGn2JXadn8nGYr7VvSJOKpi41zHB9VOJl?=
 =?iso-8859-1?Q?XB/upTIxcc6m0YlKljtdDxyPfqSSTmOtgnULciX5GYxs6dHW09v+ebX1Dh?=
 =?iso-8859-1?Q?MslqhqFm1quXRFmfUV4V9pXD7FGaGdS5zp5E6j7LnImBH1c5+oGfzqpfnc?=
 =?iso-8859-1?Q?L2TFfJJIK9XucpynmRw/WqUgcRj3lcmCPZcNDzvJgDWux5pgCpF6oB6pHL?=
 =?iso-8859-1?Q?SNN86VJ0M9z98YelVj6g/k3c0RPmj/4fxV/r3tDUxYK6fIabA8hUKqJYW2?=
 =?iso-8859-1?Q?Ws/MbHZeHWy5iYlBmKs9iN26zIE+R0XFv+p1MWRGqoyEuWD19ycJPtYp5q?=
 =?iso-8859-1?Q?o2ppkZ+No6/hvokWlnJqGaFMNcs6Jgjc9u+4HRQiEtsZ7aONk/eqatEOka?=
 =?iso-8859-1?Q?O1/FH/1fP0shlItAixdq6i0MRbo/8OLEwj+7eq1krUtVA93e/igptTaVuP?=
 =?iso-8859-1?Q?cEV6LxIdYxLM3XmpZ/Pq+kTFDsorN/K5vciJI4ZgPmNv+6mYdFWF9julTj?=
 =?iso-8859-1?Q?aElU1TYokjxPYTLg3QT62RMYEsweIQvw6oLav1xZ4Uu8ToUJ2A6nj7CsZF?=
 =?iso-8859-1?Q?jxpts6J1gRGFMpcn2NUVN/r5SGXwEmVCNnc4XLty3/+EHq9k2oafA4wuXu?=
 =?iso-8859-1?Q?t4lR+/i7xC9i4eIADhVSlo8kLFj9TOQskz3nynmRsu9e2RY46Exyr87nQx?=
 =?iso-8859-1?Q?2D7nbLzU1/ToWwWMrqipanZ62NbZfbfPoZ8u5/G7gPy6NYRP5tXiHcptaO?=
 =?iso-8859-1?Q?h4b26fr6D4OO6Zw4GIwPVA+BXI3MMZalRoFxOwFj0PxaiOS5xMbJDgQr1g?=
 =?iso-8859-1?Q?C2gVkOO/t1zjhYBlMI81Ppqqq3IyAlKJqS7T+87VoLAByTadbKm/G6u6Ls?=
 =?iso-8859-1?Q?Hc3SaMVdE+7btRgqPpr8KeJPgHkLjcM+Q9YfLJoeMoix72R0NXPwKk73OS?=
 =?iso-8859-1?Q?sQZOMsxc8AVWYlasRRgRJNhrWGt9VwxqOTt/3C/OKfkdtezwjugEtbAHuw?=
 =?iso-8859-1?Q?nAkPF05NdpMPe7b/cJT/eOAEy6jkEYCdVPeySj/tHsx0iOBHcSCj?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ebefddd-b1bb-44d0-f98b-08df2b9aecda
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 15:34:11.0255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lgulH9gdfsYLcUtuTVXsk/lokQXNWA8uSJwtl8iB8ToLIIKf2ywDvDmgvpQLXwU8QtPfa7oV4shjsL6QFkv4eL9S15T1lFAtJIevPGcZnRq/T09vaf9PgYTFnAZ5jWgi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7092

On Sun, Jul 05, 2026 at 08:07:25AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
>
> New issues:
> - [High] Unconditional hardware interrupt re-enablement violates caller lock state.

Please fix this issue

Frank

>
> Pre-existing issues:
> - [High] Incomplete deadlock fix: sun6i_dma_pause() contains the exact same deadlock vulnerability.
> - [High] Lockless read of vchan->phy causes Time-Of-Check to Time-Of-Use (TOCTOU) race condition and hardware corruption.
> --
>
> commit 1435f9b5204cbc43aa5b41f133e1e3e88387cce1
> Author: Hongling Zeng <zenghongling@kylinos.cn>
> dmaengine: sun6i: Fix potential deadlock in sun6i_dma_terminate_all()
>
> This commit modifies sun6i_dma_terminate_all() to use spin_lock_irq()
> instead of plain spin_lock() when acquiring sdev->lock. The change aims
> to prevent a deadlock caused when a DMA interrupt fires while the lock
> is held.
>
> > diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> > index a9a254dbf8cb9..840f7276ad5d5 100644
> > --- a/drivers/dma/sun6i-dma.c
> > +++ b/drivers/dma/sun6i-dma.c
> > @@ -939,9 +939,9 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
> >  	unsigned long flags;
> >  	LIST_HEAD(head);
> >
>
> [Severity: High]
> This is a pre-existing issue, but does reading vchan->phy locklessly at
> the start of this function create a race condition?
>
> In sun6i_dma_terminate_all():
>
> static int sun6i_dma_terminate_all(struct dma_chan *chan)
> {
>         ...
>         struct sun6i_pchan *pchan = vchan->phy;
>         ...
>         spin_lock_irqsave(&vchan->vc.lock, flags);
>         ...
>         if (pchan) {
>                 writel(DMA_CHAN_ENABLE_STOP, pchan->base + DMA_CHAN_ENABLE);
>
> If sun6i_dma_tasklet() completes a transfer, clears vchan->phy, and
> reassigns the physical channel to a different virtual channel before the
> lock is acquired here, would this operate on a stale pchan and stop
> an unrelated transfer?
>
> Similar lockless reads of vchan->phy exist in sun6i_dma_pause(),
> sun6i_dma_resume(), and sun6i_dma_tx_status().
>
> > -	spin_lock(&sdev->lock);
> > +	spin_lock_irq(&sdev->lock);
> >  	list_del_init(&vchan->node);
> > -	spin_unlock(&sdev->lock);
>
> [Severity: High]
> Does this unconditional spin_unlock_irq() risk breaking callers that
> invoke dmaengine_terminate_all() with interrupts already disabled?
>
> Since spin_unlock_irq() forces hardware interrupts back on, it could
> destroy the caller's interrupt-disabled state and lead to unexpected
> nested interrupts. Is it safer to use spin_lock_irqsave() and
> spin_unlock_irqrestore() here?
>
> [Severity: High]
> This is a pre-existing issue, but does sun6i_dma_pause() have the exact
> same deadlock vulnerability being fixed here?
>
> sun6i_dma_pause() acquires the same lock without disabling interrupts:
>
> static int sun6i_dma_pause(struct dma_chan *chan)
> {
>         ...
>         } else {
>                 spin_lock(&sdev->lock);
>                 list_del_init(&vchan->node);
>                 spin_unlock(&sdev->lock);
>         }
>
> Could a DMA interrupt fire while this lock is held in process context
> and cause the same tasklet deadlock?
>
> >
> >  	spin_lock_irqsave(&vchan->vc.lock, flags);
> >
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260705075738.10639-1-zenghongling@kylinos.cn?part=1
