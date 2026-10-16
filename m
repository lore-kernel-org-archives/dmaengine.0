Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011041.outbound.protection.outlook.com [52.101.65.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B6F2E1EE0
	for <dmaengine@vger.kernel.org>; Fri, 16 Oct 2026 15:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792165012; cv=fail; b=s6crchV5k05hIzgTGXbGOy5mCQ1b1XvhRd85LR6k273+PMBq8D0OeTLQ+rEFFQNtrbcLzhrUReBa80LC62+OFeBDm0EgOfC9/IEdTjfxm+bWr2wlr3jp8HBBHfhNCBvCe38TTf28FWQeN3K7VIbqEL7HcEA1/ZTBbCzeiJYT/QU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792165012; c=relaxed/simple;
	bh=cJvczyCYIA8noHki9QnuUy5QXdVn9m/DojQc0VSnRxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cPKhy6b+50MlkbqyMDK7b3vtXjBn7yO8/Snf9nSrr94OMjbv/X2jR1IjAtSigBoycIyZBq4/Td3Jrcuy1c1UE1lZJT3ci8NA9jeglLO0hBOSNPkD+Hb9ugA9q/aHCPh0xesfdImyc3cAkzqusvtD/XtP0eU6PkudJIY77j9oQf4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=vCIPYrfP reason="signature verification failed"; arc=fail smtp.client-ip=52.101.65.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="vCIPYrfP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PVb7CdGhJkgxc/sl9e+thcVea59xitQD1S9dlfcNX7tfYh6k8jkTX29PpMu1QL4O6Sh3xyV1MCN9XaL8Y4Pr+WpsmMQoSnAdFzEbpLkpW3VF75oXcf/hWMXBO7nGJXXyUNSyamwQ//ORIqXEsxVuC1+f3MtTNR5422mab1h433VjpBHgigYbLtVGwwq+zsW7LlTWA2dnu1z0HBTQj5XDdDD0zGGXFcHy9w83ByXVqgqgAQ68X81jutE1oclw712oXZLpQYPOhghrFOvcja0sCjLixtaIIWbcX1ShAaTGt6CiHdivuAAw/PDYoYXvsfRkM8nQ4xPVAkG8saGUU0esgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JtkQoPNc76CK3nhdbFAkd10HNQZj3di+khNAiAa+Vw0=;
 b=g7D4vgLZtZni8niZGzxYLoqYpKIpoLIS7CwpKn++QBaTCXaNNvwIm9bgO+qIe9qi9zMOdlt9gMesdTbYo5T4fNTt20qeFkMyyj5iYoAC8QxrqvTXq2hXxHnpDIN58F/++V9ua0bVL5c/8harP2Cejm/F1E0jDvjeJIjqUl1vwESBBsZVeVt/TwErUOmN+/C1ImQ6KFbVDJmPN88ejvMCFiJlUMc6JsLcGWdtFrCRcQY/Z1ENI/70ujqZud4sZtcR+im0Rdn5bJKL1U8rOxO5Eo1stKb/b9XmP15R/JYDpJzU7kscszdWMwXEp334PbMb/K2deL30Mr95EG8s94F+Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JtkQoPNc76CK3nhdbFAkd10HNQZj3di+khNAiAa+Vw0=;
 b=vCIPYrfPBGyT1k0yXZiJSj3T1JfIWID++qCUoHjithWEiJts0gRecI4sTm0aIvSF/0BbpivvxZAM1byqxTi5Mk4HQAVCHEyByA9jpbakkbX3ydHSZrT4+7K2Ps50mFA9Paj73I/muUsL+wj0QPsoadnrkeUSe0N0YiBzZSMta/u/UUot/l1Z/D5h+jMPPExtJlF7sHzHCAH1ygTjbX/osNZFAjQukXqgQtTqJqwjtAUSPvoBwHwaxUc6N2wMIaUT8aZ2JzRi9fAupPiee55+kJvykHd56WLCM1A7hEdaMeZv48v5WPEriB3RYuuoHQhbi6NNhml3Co0yxd/wQd191Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS1PR04MB043897.eurprd04.prod.outlook.com (2603:10a6:20b:6d2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Fri, 16 Oct
 2026 15:36:48 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 15:36:48 +0000
Date: Fri, 16 Oct 2026 11:36:42 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Hongling Zeng <zenghongling@kylinos.cn>, Frank.Li@kernel.org,
	vkoul@kernel.org, linux-sunxi@lists.linux.dev,
	dmaengine@vger.kernel.org
Subject: Re: [PATCH] dmaengine: sun6i: Fix potential deadlock in
 dma_terminate_all and pause
Message-ID: <atJEipCUmSQbvbnK@lizhi-Precision-Tower-5810>
References: <20260705082105.13325-1-zenghongling@kylinos.cn>
 <20260705083134.001491F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260705083134.001491F000E9@smtp.kernel.org>
X-ClientProxiedBy: DM6PR05CA0061.namprd05.prod.outlook.com
 (2603:10b6:5:335::30) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS1PR04MB043897:EE_
X-MS-Office365-Filtering-Correlation-Id: 273da377-f3aa-49dd-b2d5-08df2b9b4ade
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|19092799006|261009223027099003|56012099006|5023799004|4143699003|11063799006|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	Uv83djwjjO/eouWeTr11xdAOZpwqLCZM5pbZ20XMj20m2V82cVgSZ+CgT0qmJ1ACMDKuhy1dIFFwm7HMZT3FA8t0m7sSzdZmg8lDvchdvu0zjBIZ1Hcsf9ULzobPUx7i7GkSaA7MVwx2YWYMf/mnIT6qwh4k3N/Sih2Y6mHtBuJskQ51zQu1KDGGQEiK0razM9ZA5tmPZINTL3Sq/FVsBiFIy4ExDyok6mAzr4UYL/jjK9IG65oRZHQYD9UZP2SXCKSioSu9l40zYNyWn2Q7S6B3QW8rSHq+uUfcpOnFfA7hOuJ4P5cOack5a3Js8u45rwgvr6Q4pQL96zINEey7bKuvTJ4+zUrI0wPnJMurS23sB41hoElpH6T2NVQrDNnHSrb4sLCxDJQns2UQAav3y7tVsELJVLiq+JGadNA0/PuMYnco0iuLmoJugehVTPeA8lL6bPjKtHO9ccpTAq2RX5Oxb07LIt4XyuwBYg13rFn6p6j6b1F5oWzB0xEvlgiXLG6jS75LEyZCH9WCbbmrCILY8XLvyrIDDPGOXmtZTzJMPbualYJ0SwuhZtyKQc92R9GVqC7JgDSkFIcFqNKoXxD6soz47r+86L2Hgt1d0Bk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(19092799006)(261009223027099003)(56012099006)(5023799004)(4143699003)(11063799006)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?fOtn1RhBOe5bbOKChptdxVFu9rku5LNZpuAhSHsDSjOHqo5nYSLpcZsETW?=
 =?iso-8859-1?Q?ihn4B8IhMOWjZNsdcNCwDh8FS10vLYu+GEL/bQBTsVAJ7YXCChhaRDCA5W?=
 =?iso-8859-1?Q?Ivv0MBqk+3beRdvfegtmTzXuUkIzTXRJHhsC0Eqa/uyLWZXUJxkN+vI9ni?=
 =?iso-8859-1?Q?ksVC8C3zfsydAxtjjm5qGglnieoPmChgZMSoEv6qrZAvT5C95qQriHTbTD?=
 =?iso-8859-1?Q?oLzTZOKo2RIkpHsJw0POvVVo7bHpMGORtUyTT8GxeeqFFRYob3Yh6ZL8tQ?=
 =?iso-8859-1?Q?M9UIq3qo3TdNDhM42WQOsCBwt8eNHy44HC2QGYn3ahdyZkaeS61ShXlO1z?=
 =?iso-8859-1?Q?3SWY+PRObylJF9tRxBinp5GQuK9p1UCm6jIDsS2jdLREPq7czMwV4SZsMY?=
 =?iso-8859-1?Q?thLqXgwKT/uyehddNNIn/jz0VyD61tS3J+Q72eewyS244drK0W2pTzPf3N?=
 =?iso-8859-1?Q?mmy+X+fAAhj7R3YXobcLyrgDeX7YvefcTrOpKQskWZwKz0J3amd2HSiAEw?=
 =?iso-8859-1?Q?2YsbwrGgabOveO7nxiBk4WxJRHvS/jSptjw/3JPcG40gqJ9MRhUs660Y3X?=
 =?iso-8859-1?Q?lMVGvJ5E8dL6T7PRKzRBIoSvIjsC4fdhVkGPG/pgklJEOaD6Roc8+SE7rC?=
 =?iso-8859-1?Q?kpkIIoxblGOEQRlc6L2u6/rKk+VB5hz2ArN0PuuDzIZcmvO7+7lh31dfCJ?=
 =?iso-8859-1?Q?l1BTk9qtyamYKN95MwXxRL0vVE42LOa5aiK/DZZ2S0KPqZmibTJ9jP9JdV?=
 =?iso-8859-1?Q?Vn6qoWHOkUT/O+S55iYoKjLHmChybKF0tIcH8bFLhrE4Ol9Ggecn2VRQBo?=
 =?iso-8859-1?Q?V23TPcsuzJrrC3AIHmWBHzCKDD4cZ/FBqKiuvDL9Rnrgyp8KalgpUceMTp?=
 =?iso-8859-1?Q?6WfZ2yR1+NXO7TyTqFSouB47nSP9wOdQXxtrOKgXxRpCdKdM/urgf2KR9L?=
 =?iso-8859-1?Q?v3WNS2d/hXnoHRAURQyN3H5DvtVbYuO+p+YNmKNNzvZSlxZr3xs52nNvuM?=
 =?iso-8859-1?Q?O4B/3ci/f/anruej+9CGgYzNfTY4FIIf5ZCuOYyiTv5SmBFQc/mTHmrnR3?=
 =?iso-8859-1?Q?zZuKjv03si0zRnrcf0r4be8WT40Q9k2Kx5sWyw0CAnu6FGGvN2eq1Xerxx?=
 =?iso-8859-1?Q?1SnSRW1iP8rNef5rSchcX1LbtPyEOryiPjri/UA7VsGxDk2HaNLZsLVwh/?=
 =?iso-8859-1?Q?XMqlXqXljTNKzLUwCk1Pxt5XAn/aUjkoc1H+IGc0W3sOUfpCTLWzWU+vcH?=
 =?iso-8859-1?Q?nfVKd6Ectmrz++D42YCvCyNxy/+JQdxwGdGiuYKJnPKo+nQhRw/WGccL2b?=
 =?iso-8859-1?Q?hySOI+ZQvDij03sH3oph8/cyIn+XOMz6u1/4MkjOERzwEok3LWWNOxA845?=
 =?iso-8859-1?Q?m8LH0ovNh0KlpzsS2rOy9Kz3XQViZMuhJrclwhxOOSs/2gDVCND1v7JzBs?=
 =?iso-8859-1?Q?fOR4fMBp1CHwo9O2HoBC4VczKV+7cukPX0h1iQQ0jEn7xjPLscIO3zAEE7?=
 =?iso-8859-1?Q?LE1vao1LgtGbhwxBH6Pr/XwYky+ufTVhWSp48rlbIG8CRDI8FEsu/djF4Q?=
 =?iso-8859-1?Q?efh3WNA8ZHYYz+zjmx3QZ+6T/PAlAyDKtLMzYsJgtkEZvpAsbOt5OifE6C?=
 =?iso-8859-1?Q?PzsA2NALy2aOxyne2CUge2uSGr29ZrL7gbKa4QCIUshUWKcHgzBKTFcmPY?=
 =?iso-8859-1?Q?M6p+IJv95drYrYV9JYD7lLLDGAVD3ZaeiF4PbeeMLf51BgExXA+Z2nsm1A?=
 =?iso-8859-1?Q?QITVlsGuKmjkxeN9X7gNECjIIVMSJIYmw1tLKcUzFtjnQDgZaFyOt+xPY3?=
 =?iso-8859-1?Q?Rw9LqTifDC5WD7NrEs0ZFA4F+eemKq+bXex2vYlbrELfH1qtrQoj?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 273da377-f3aa-49dd-b2d5-08df2b9b4ade
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 15:36:48.7153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qt5MaN53Lvjb0wZI6QPZbTl/oAThw/bOFOqgJBBKGTRD35YnqFfXYqchjIgKKj8GRyXxzXFLCgMhndkfxtsWNXzTO5LIVJyyLxgIe6gLHxVU+cjYkRFKFvTYQukHofWb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB043897

On Sun, Jul 05, 2026 at 08:31:33AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
>
> New issues:
> - [High] Use of spin_lock_irq()/spin_unlock_irq() unconditionally re-enables hardware interrupts, breaking caller atomic contexts.

Please fix this issue.

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
