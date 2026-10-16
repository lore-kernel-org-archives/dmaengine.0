Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013050.outbound.protection.outlook.com [40.107.162.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DE34CEE4F
	for <dmaengine@vger.kernel.org>; Fri, 16 Oct 2026 15:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792164943; cv=fail; b=ZGtqDojmdc7w/8z5x+J/F90/XyH6u8uf3+RD4fX4rUKWILqLxp4W+bVLxYh2c+6L+aUBx0kLRfyeo5ZKRooGO3jNPzrM6AwCPSFZbLGWkVylQ4jkNdQB8zoNEvqJsztVE3bz/+CHDNVMY+G0exzAJ//XBxuKcsaEWRqf8bqxe88=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792164943; c=relaxed/simple;
	bh=cRgPb9hEjCM+5tUzysON2AiiIih0HOaVezXvIIj1VLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Lz+MVPJfDN/wJ5id7Fdn204INCvwMXhFkkeYtLhJhoM3QVVvGYVKI3BmNotOZ94e//f2mBhFSt8jXoNPX1v1hUqkzLHCC4W/kJMX/P6x1LZofeMWj2Zan15eZHa5VOuwe82SU2qjqiXCf7f0TYzSq9Lf/SSjWXi6Y4wYY/ft2D4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=gBHJDauA reason="signature verification failed"; arc=fail smtp.client-ip=40.107.162.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="gBHJDauA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ajsGzD8K/3UDnunebYFgx9Dp8zj9yjVUdJxgICU8Q1/hRlUka98ypu5uDBdPcKpVCFh6i4ygwQCiOhLXXoOHtdZPiaWd/QMjEb8tAx4EAdEgnrHYg7wEY1qmsJO/yVlfVyHF/EYC4Ls9wkY5K4CRrz6cdbZU8OkJGqrEodfTzfhr3695UlQnuLdohPvX2ga3UOhuwvDb8IjY4+6omKM08m0iKQVAbxWu2TX+LNcRL6XcaqpQ+JsUB9xm37qYMvsORrbMDTj2GI0DdHoo6IPOxdQKTWmWWNT+W5bUUGKQxAyqVhVHJvjnjJVjgmbNt5vjDswJoVcAdSmgoUOlDyl76w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EMZpXjciAS1Z2fBRyBc1/o1vXotmGd+uAnqRbANQOPY=;
 b=WPz/0FnYaN8OuGPsu+e7S8XqSg/Z694tj1a6QC/uof89sGriMfihrySdNszHTwm0bix4m2SkUuZzGaVENBJicjM1p0iLm5qDuGAMnB/cZLosYsQhuCVUjui3huMNzj4gn6DdOW6YkhnJNyAiFI6pMqncKd8/PqINRsnj5uGEhAabG9LYULYqa8HFw6axf0T1rT7nl+QdnirhyOWeLg6D/S56mz2BCIPZXeeJIKUxGFct5s13GfThc5qRlf2u1YcUnJobhsTWzuVyFxse+VqbRzfeO//Z6r9ZwnzW92g3GHBsSQf3hgUjAdfo6npn7ybqihcToRIwwQt83Gc/klUzgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EMZpXjciAS1Z2fBRyBc1/o1vXotmGd+uAnqRbANQOPY=;
 b=gBHJDauABblXI6ZV8fJ4vrHPSYl/BsWyKE49ax8bg6ftLgdKVjDlX3emIbKfdpurHggg6AL0bdDIy+3BX2VSxTeiBXKIN4k4Dl24UEQhPiCcbzlmmgvSO9SKOc+0iFEawUUZfOT+IjKY3vWfRCn+m25MMdDlPzZuWZS8zAr6d3+2UkvoMhOG5p9Gnvj4Mz2uqrDpfs8WClTOrE72Qll0gPadowZ1b9wj4W3YWIUMyuJDmnzHem2xbgS+kEDdANBfHB9TeLAcb+6RWq/bn31+5HB8TtvZ7/yu7AkD8A/SaQQJOtuUjwiXvOR2EX9gBqCeMZzWPbQ31NMsiFZEiF8Fug==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS1PR04MB043897.eurprd04.prod.outlook.com (2603:10a6:20b:6d2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Fri, 16 Oct
 2026 15:35:38 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 15:35:38 +0000
Date: Fri, 16 Oct 2026 11:35:29 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Hongling Zeng <zenghongling@kylinos.cn>, Frank.Li@kernel.org,
	dmaengine@vger.kernel.org, vkoul@kernel.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] dmaengine: sun6i: Fix potential deadlock in
 sun6i_dma_terminate_all()
Message-ID: <atJEQfowK20xLeLR@lizhi-Precision-Tower-5810>
References: <20260705075738.10639-1-zenghongling@kylinos.cn>
 <20260705080726.585E31F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260705080726.585E31F000E9@smtp.kernel.org>
X-ClientProxiedBy: SJ0PR03CA0215.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::10) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS1PR04MB043897:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c1810fc-4b39-4c38-eca5-08df2b9b20c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|19092799006|261009223027099003|56012099006|5023799004|4143699003|11063799006|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	VxEsyEZoHR130UIfYliynQoDdV+qVwwEPU2RbQ5cts81mI6vb9pH61gXIEie7ytoKNSzmHiwd5YWVbk2CFW2g+B2ABxusAdD4aZ1KhzrEiuL2hqDOxYUdkpLzsd0ZELEVJDPw8YUGvLzb/fFrBI5GsbTPA837vnlztbTszmTjbiPbxOw1ndx3YZxzVUpYw7fgoOzVAHRt8Mid8DxIWhzplaIW5rkUUAcxjTle7Ow1sY5lGfavw2W1dXzjj6ltMdG87Yu9YNTYBMukolh5U4xw5QB0e3G2Dq1YTmqf4GHSxluXsLeXAVczjVZn39J7R7cUTaVbGqNJtHuZ8TRC8n+xe/dCl3DIT+IAppDaawjZe9HKLyTZNJOvqqq6jwkMTlP37zppYOXtFifTP8w6hc/g+XhCFrisU+35/jfIxJ2Hv8X+pUhR3iuk1iPBOsNLer1ij5l6NSDT9JNih4XdmnwvEsATVZpXSyVnOKbTWx5KNeEjC4YNMPHCcA59tSNR4xDbopH1lhbVqm3ELX3/3kmiR2JcRkJw80nYexSmpNboYy+9qwXJvONMPRiwEDkT2crKD2jUQfEnwJClLyHfUHaj9ALiXZ22pOfJti1ww2CvyU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(19092799006)(261009223027099003)(56012099006)(5023799004)(4143699003)(11063799006)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?vt8p3kG3EFVULVylHXkj3DPuzNCiWI2kxv08pedhr0FgPNze2ulhpRjWL5?=
 =?iso-8859-1?Q?1pakMybfO4fBCg5IQ25o+Lgl66lgrGC123Y1jT7cN6cFfbkQMM+IfSmCD+?=
 =?iso-8859-1?Q?JE7DA1bNI+VLpRF4xP7kLXMBbM0tsDSc6+fxqWd3HRq4SjJB9YX46Ntwvz?=
 =?iso-8859-1?Q?2Q8xSVRsuxaRb8GGBXa8gKXhh9dtCDSh3IDu1QZgdYs7NgOILm0Cw0o1y9?=
 =?iso-8859-1?Q?8n4Wl0OQUvu4XJ312STY3bnYORRQaR/ROajsNLM08pPqs3ogvIG52P9jvI?=
 =?iso-8859-1?Q?sRT0DtXCRwKiBHH0bl0jD0MU0Pc7B7AphgF2por9gaPw+X+Hs8kUYu1rcI?=
 =?iso-8859-1?Q?ruQqadwbeyzm3cpEVyZBTBxW3Kz6f5IfDdnPGMIfAcFMDFAAhtUiVd2xds?=
 =?iso-8859-1?Q?N+cSXMVXEb+Ymgv/OfYG9bO8Xcvj6LWvKNZOm6M5RRsB+2tXqRKvMUHtqS?=
 =?iso-8859-1?Q?6Zy/PEz4oMQlph+cxlHKm+mKCwlGfe5MLzPt6s7vm9D7sTtHF7LVAhPo2J?=
 =?iso-8859-1?Q?ba9CT1JLF0JMnp/X034oREChIc83FFb5yLrMhuLgGZIhv5mO1nBT7IG/qt?=
 =?iso-8859-1?Q?DSQEg6oqh1tmztV9uWIPH95nI/w1r3Ou/f4bx1z+BuVjjrZ7gfu2Zrb4vg?=
 =?iso-8859-1?Q?BdQCtazeuN+8jIZxNhP8YsdhZsoQVVyCqzvb84vNfwZ/8az9Nkq+McOTWM?=
 =?iso-8859-1?Q?EsYpPY76d5DhHIuJ/9XJG6V+tnH7THTVRf+ejUe5RWS7Zz7T+/OflGDgS2?=
 =?iso-8859-1?Q?eujsKhT1saR1pIjRMU/JUqC3JMlz1LtMJRBTM9wLFGEXXORzR6ggdw53oc?=
 =?iso-8859-1?Q?QzU1xNk2l+5bKDPDGplNcdQCPxSYAFRu7h4jXQWGvZittXSAWTDBH/ddf0?=
 =?iso-8859-1?Q?xYHgd53VoSgD+hxKM2d2RzQ7Cqzj4wAl1Iubo0gOeKn2MHw6T8eUj53KuY?=
 =?iso-8859-1?Q?Y8m7tuuRXhnIfWRQsF1XRgXWcxbOechPFOPc1+aJ0rHPAyZF4OyAyqD4TU?=
 =?iso-8859-1?Q?GCsT4vgDs7DsQ2ynAe8cS+MSglhPw+FaQBmH1lErqMm4x01EQZbTb79TK2?=
 =?iso-8859-1?Q?m3qhhZFXPWo2aWpJB5oTqcP86SyrgMaZtJ8uK77zXzP7mZhEQVpOk6DlV8?=
 =?iso-8859-1?Q?1CHHEnanOcTpMsxr5G0/k2mg6qho3982t69cjyTFNYplCxPLVkWsE17liO?=
 =?iso-8859-1?Q?5acF5LqPiheUYTzUj+HAVunJP4AtV242HC9nRaG130TJQls8x6eJscE+Vw?=
 =?iso-8859-1?Q?bvXhkm+4WEmPHQ6bYZZ4NZqglDxPeyx7Huv80Da4jtM8fg4O6b50j4w4r5?=
 =?iso-8859-1?Q?YB2QbGSZqnszTwt7IC4FYp3By/fGCniZKP4zu6XSnCFM8A9Ak8/dHHzmIc?=
 =?iso-8859-1?Q?d9QKojL+azdeaYlD0ILbUDXet9+qcRaF+ZBdigyo0mhHgdahF/fMpkRUiA?=
 =?iso-8859-1?Q?3OXWP7NnVLEzm+jy/3poIcLTgngFr0A/KZIfq302GI91r3go8HZzCnL33F?=
 =?iso-8859-1?Q?+dYj0IggKNHlpn4n0KhrinpTn2oi3H7slXbqjawE22YMU9/iipdhjkJ3Ze?=
 =?iso-8859-1?Q?JEMdwMUa4DrdZa218xJ5tCSZHflEZCrolpTPhSndVPSZqP3EFHVKFBPkoi?=
 =?iso-8859-1?Q?nw8LtLz8PTyrdWzgjygsSgh9d5RfpIiSONUHcc2Hzyss6pOGR15yxvEPmI?=
 =?iso-8859-1?Q?IiemiNeSDU4Q1nWUvDN6PNQ8FbQEbP9itIsRnxdp112e0aTT//vBN6kRzF?=
 =?iso-8859-1?Q?UWrayvDbDDUtqVgvq842vjNRc4LTMR7yY+7lfA/euOVvBpSl8i4v/cZ9fp?=
 =?iso-8859-1?Q?0GAeRSW12ZzJGheV5c3WQji2Mt36Bfatvv1I/KoeIUjBCICu+fHI?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c1810fc-4b39-4c38-eca5-08df2b9b20c9
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 15:35:38.1273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yUjlcN9NtsWhTn2FzogWy1o2TaChaxPXs49G4pBGM5pdJXIOv/ZrUT5F7fchbdMoAfy1pPpoyNvcFSL0q8wFurBEe1dbqIrIhcFDyvIbn2vrrbeTms15DR4W4pfzmojO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB043897

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
