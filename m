Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013066.outbound.protection.outlook.com [40.107.159.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555282DC783
	for <dmaengine@vger.kernel.org>; Mon, 17 Aug 2026 14:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786976798; cv=fail; b=Bt9WlHbu1FcIDNY1dZtbeYjPAo4SdUqxm/3j4G4qBUG5J1yU0xJJXGqxw7DOH/GDRcP9GYbSP1cxf7zObveN2Hiueb9uxBSLMPJjeSADzUqc8hnK10/fJWTRjyolKebIj9YcBwOYEuAbjMRwlV3C4GWMVyO5WQp+xiQ57L0Myok=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786976798; c=relaxed/simple;
	bh=/VzS7MNQ2JcuNOILix3p1nNLbdb6OTjSo640vwCbAGg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=s5oTxe/bqnSVe+KCTpdiYNGts/2eM8VRpmx9gdtNvCnFB5bcJjfriclCmQ9+gik7iPMu2d0qLYNrFpWLZV67kAQ529pNWZ1ADOrh/IRx9LNGL/FIeGFkQbtE9xA8PBZ5wnAJcLuOkyBZWVEd5FzFIeik0VPaj3e3p9jkcHMEnTA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=AmmpEjIZ; arc=fail smtp.client-ip=40.107.159.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="AmmpEjIZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f94iUHTTxxKeQBynONd0alvkh1uo1zB5Z6HgjyY769Ns80xPkTGTlEjvxBr0s8msYr6TNxgnJKjvuP7yAh+0c+3xKGm2UBkZzfFFXdnP4GFpchuQq17n906N498JaG0WEiziV+CCGazBd3ZN5TTrYe9yRR7UItmrRFPDctRZoQVqbVTXyrfvoFocF/Y4/pzhRhP/kT4l6mXRVdKMy1+PEkOsI3BJ8SJfSU8Xyv6UwpgNFj/onqTwMkfNm7AffuwfoW8rHSsRggcKDOLmYQiIZfAhouu51C3E2QLNyAmceu7spV0HzV15gZ2q8+InLFvg+RCjbFdlhlJ3RP6y4/CYyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hKS3jxS7B26aBqXMgMb0OUaENXUk6M2anoS+NQLelic=;
 b=T4wkfngdFc/fbzyJaZN//tWCXeM6CRYzuFhhAuVVJVsO8rpE+X+AjXVF9vGvwqAHqknmRFfaGNe+dMmCjA7U8fo8ISh0vpVfVwXN4AIiR2xD4ru1tsahxdAYrpRjekZHl5BA6hHkF9XD7DNFaCeO5ljlofJwrPhMmXTCIyck8b8Dk02u82/ont9wakemQEYg3weQ12xEgSn9XrWXeyf0Z2eTHsPKeM0UaiaDGm8EV+hJF5RsIGHrVTAs3VKomjpIUVHLzPU9kml59lp8iKLWUZfHoevnVCXtSlzm/+eYRDQQv+ywYMQIp9LJZ2uuJ/zT40RfUfm89ORdzF6fJ3b/sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hKS3jxS7B26aBqXMgMb0OUaENXUk6M2anoS+NQLelic=;
 b=AmmpEjIZkkXeGOCffRNcEX2JikvYcye78wlc8OeRRLg1eG+WwS9HA0FZTV01Po0lyjn0HEeRawBXV4gU0rere+qun1ZeMDCwMsufW2xt4zBdwtF9jmAFNcsvHZAwLI1HZQa5pzuBO/gQOmRU+rHWLjmbZ9wcmf1IWrDnLXVWCpfuWhfW9xP1U5V2FBl579MI1VgGgqfuTlJUV0Mm3M2yGlpZUSQloHK5iRVzqswHMjJxSxYalfrvykecZ5cRWpux6em2rp6cZ9r7TBkZeidsHe7LVbfeQS2wLuee0dtBApjBb/438f2aDw78m4MxU6YE2N1wTZtqydhpkDcQgUCHCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA1PR04MB11429.eurprd04.prod.outlook.com (2603:10a6:102:4f3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 14:26:34 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 14:26:33 +0000
Date: Mon, 17 Aug 2026 09:26:24 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: "Garg, Shivank" <shivankg@amd.com>
Cc: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
	"vkoul@kernel.org" <vkoul@kernel.org>,
	"Frank.Li@kernel.org" <Frank.Li@kernel.org>
Subject: Re: [PATCH v3 2/3] dmaengine: fix use-after-free in dma_chan_put()
 and dma_release_channel()
Message-ID: <aoMaEEOgQhZduJoe@SMW015318>
References: <20260816-dmaengine-kref-fix-v3-0-7e76187145df@amd.com>
 <20260816-dmaengine-kref-fix-v3-2-7e76187145df@amd.com>
 <20260816160722.26C811F000E9@smtp.kernel.org>
 <ba6d6fc86076b4f2e5244cad3c5c70d782dff74a.camel@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ba6d6fc86076b4f2e5244cad3c5c70d782dff74a.camel@amd.com>
X-ClientProxiedBy: SN7PR04CA0175.namprd04.prod.outlook.com
 (2603:10b6:806:125::30) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA1PR04MB11429:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d7e5dd3-7927-4aeb-e0d2-08defc6b89ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|19092799006|18002099003|22082099003|56012099006|6133799003|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	rW/d0zrRGE9v4u+YgB1OkKFRn2QblqjT+IdeGs1O378Rs+Ye2GeBy6QRZBCc3lS8kqT9LbE/7nwpUNG5YbMGcwaULd8YXotOQeoSDh1v4o+UFRRF6aI0uQTmwne+5H/M1cDMkM6+CdxEAZow1xnpjGExIBRZu5XOW7+vDFTLr1+4r90Rf3SZB7voluepHxSwBiu3jumG+EoQyn8CnDfO5DD6R1y/ujxNCdcyUltG+4psPIWY6ust8VVSIg5hkom3aWzeErJBooYOqrfk/QHbP5LS2IVHJRDjDyi8RaWn1/5MLfu2adpGmsoH2V965XEaxzH8ppmCB37BKKiNxVxKUgsPCoBwJ+JiJHVFjdRfS086xjVdW/z7/+wl0lylRSJGifEJicz4hVIHzyN0cH5l7wQ1cYukIkIDAK3agSLJxVlUxvtJWl0k3IKL8I7HzuzD8pc+D2xv0BYeuOp2VNpWH0mVgIHFRNu9W4cZBCM+jOeYj6hbWa4PMY4kRdQj2YsVl9FzLL/5Ulgo09WBzgrO9ZqYxCl4g3M9/OXAr4nK0+lviwOzNiBMIWmhOsxHAPPo/+OdFO/ejgQZAaE7r+5R2EKasefe2kFYvPnBMk2ZwUU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(19092799006)(18002099003)(22082099003)(56012099006)(6133799003)(11063799006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7ty1cPDinPZBZqSlRgkem/OKgOMFtlPoonz1nZKVXGjmrOKSw1n+phb8NnPk?=
 =?us-ascii?Q?uYCcSZ8BQv62PJUGB8yS3cnesKWgAGn5H5nIEE497maLHZH2iBv9fRi2hI+D?=
 =?us-ascii?Q?OEnjuoRY6dTdZSdfdX/Y3qMlg8SbW5BA1uy+cste5Lfolafd5+hN47LDTd3o?=
 =?us-ascii?Q?8y15q0RKK9PH7bIE+GmUb2CxsrtPkV9TiQCX62V22shNMVhVrrPOIbK15uzu?=
 =?us-ascii?Q?UxI077TkgayQcdQS4mpuqHbQIaxskKJlx0jYmNjn/KtR5FV98ci8YRQAHh0p?=
 =?us-ascii?Q?2edHBsjX+2RgFNMMBRwm9rcPna3xfeSvtE2zUJsY9nbvS/Q7eqmgdqPFqHmR?=
 =?us-ascii?Q?hfSePZ5LooOgrCgP76omtP591D6mXOAa7zE4HJV8Naw9Wa73IZUtZhLUj5Eg?=
 =?us-ascii?Q?M+eIGrBtVZ2WfrYFn7Nbv2fxfzqw8Z2UAa9UCqIRSDrR6pDAF7EMx4CR8TIY?=
 =?us-ascii?Q?u9R4OEVWjIloWhH9mcopTN0hvIsyOtBgTQvNBlBJYgzAG6herWTvXkgwvBdI?=
 =?us-ascii?Q?HmdBU/Rubmh0BBdx+KTl7k+2K8clRHldlEjowECWqjLl4RoOnyl0oARfx0M4?=
 =?us-ascii?Q?7LUscKFErXAsoK5xY0Ow4w2xGVdKBJr+7MpoWRkuWr3MtheK7Z5s6BJvJstW?=
 =?us-ascii?Q?SbPocLutJ7bM+kT57YLod84eA7lUoFrPxQEFdaXc8CxxwN/sh9DRv7nvKZAe?=
 =?us-ascii?Q?Y01oAnCNJGyrb9vcjzXPeyusquLLEVvJbWf4XiTOHG3Ca8AbVb/9kQjkaz+S?=
 =?us-ascii?Q?gHfuClY/r+mh8A8hGzsx86SgSm7hSHtxAjIZorlPGD9YDWFo/YM+bJG46auE?=
 =?us-ascii?Q?rHzGdYT8D19CJGlEIWop154mfRdtiOZQx8y2Gaw0ibHu+h8jiaG+R3D14/fV?=
 =?us-ascii?Q?YPTx3KOwd4znixtsyB8Cjrm2Ax0+uotGINfXnj+9v0pBO7HtiJr7EKsbHFjI?=
 =?us-ascii?Q?6Ng+M/1g5MxkKdC99Ti1NWFRVN6VEsHsoNxFqex5c7+0Bf3/CQR4Xk46Td40?=
 =?us-ascii?Q?7iBjSqp6bogmbcgjU5XEnuyogJmyfW9cGa3rNR1eLJUUOCgfTJEl5ueh3v2v?=
 =?us-ascii?Q?W1tY1zN17sZ7mCd3Ihguj+9w3DPsCaecRaQIzcdc3k0i1AqSxyS5f5zFaLPI?=
 =?us-ascii?Q?HY/Ve3DVP32Ima3Pmdh5zkm0STxMDGOBe9tQzS/OR0/NuvDN1+MmSKn4H3Sc?=
 =?us-ascii?Q?a2vGNLWGVhGBjWEdgVF9ER39txWeUPWw2tek5qu3605zG7G7MjWtY3bZM+Oc?=
 =?us-ascii?Q?SRic0/EQDs4AkQWLV6xH2SIhsHwqr1TgN72EDdjEEOnxqP+tDLz5ZI6zVB/K?=
 =?us-ascii?Q?20ghhQyieE4W9jGGd7QE+ejGjBgK9YG/jM6/DP/duySRvXhkanej811TnsoX?=
 =?us-ascii?Q?0slfZ8pg1THF4GykJ8gN8lThVmqKyBwL+6pbYLSlfgbGO31tCMnMLwC1X1ex?=
 =?us-ascii?Q?W8S0YtGU04Q2swVp91pL8mboDAzGareono0fJGTzAodNpqX0TbwNYCrIE00S?=
 =?us-ascii?Q?v8zxISoZoCmO1Mil/5Q4zIePg8w7+LeH2bvLDvPTSr2TvNKelOaSw89ECymg?=
 =?us-ascii?Q?DQvmM0qaaYIWkNWKxfu/xy1q0r7xXHDxJ+CUUrwIj0MB94zlDsYcWTmDeMZY?=
 =?us-ascii?Q?BZl5tMg8oZnH3tcKvA+usVUlTmS9ArhjZ2zEinTGtb2jeAWNB806se7zcYJI?=
 =?us-ascii?Q?HoS+Kbi4wzdeAPofzDMDbjWmC8uTdgGGUCG565fpsni0doZdLFsaoiKZaIqI?=
 =?us-ascii?Q?sEwvEQU73l40mCuZ2ZUWS+9Gr009LDQ/jBfyo2Yt7neWK+nlBsqN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d7e5dd3-7927-4aeb-e0d2-08defc6b89ce
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 14:26:33.8419
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YZcFfSZCdLKav9t4B9Z0ORTNjoK1TITeOdhd+YmGct3qvQGhuGe6v46UjD2HRjZwr6+kRR5RMMf862Qo1ZbvV7k0TcnDoCLbw2G43jkYIxNfbc2wyZWevh/VvUbTQ5E8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11429

On Sun, Aug 16, 2026 at 06:05:27PM +0000, Garg, Shivank wrote:
> [You don't often get email from shivankg@amd.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> On Sun, 2026-08-16 at 16:07 +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [High] Clearing `chan->slave` before stopping the hardware introduces a NULL pointer dereference in `stm32_dma3_pm_suspend()`.
> > --
> >
> > --- Patch [2]: [PATCH v3 2/3] dmaengine: fix use-after-free in dma_chan_put() and dma_release_channel() ---
> > commit c0bca60dc6977cca7352bacd1095081d89c88211
> > Author: Shivank Garg <shivankg@amd.com>
> >
> > dmaengine: fix use-after-free in dma_chan_put() and dma_release_channel()
> >
> > When dma_device_put() drops the last reference on chan->device->ref,
> > dma_device_release() may free the dma_device. This commit caches the
> > module owner and delays dma_chan_put() to prevent reading freed memory.
> >
> > Link: https://sashiko.dev/#/patchset/20260518-dmaengine-kref-fix-v1-1-4d6125048fb7@amd.com
> >
> > > --- a/drivers/dma/dmaengine.c
> > > +++ b/drivers/dma/dmaengine.c
> > > @@ -916,8 +919,6 @@ void dma_release_channel(struct dma_chan *chan)
> > >     if (--chan->device->privatecnt == 0)
> > >             dma_cap_clear(DMA_PRIVATE, chan->device->cap_mask);
> > >
> > > -   dma_chan_put(chan);
> > > -
> > >     if (chan->slave) {
> > >             sysfs_remove_link(&chan->dev->device.kobj, DMA_SLAVE_NAME);
> > >             sysfs_remove_link(&chan->slave->kobj, chan->name);
> > >             kfree(chan->name);
> > >             chan->name = NULL;
> > >             chan->slave = NULL;
> > >     }
> > >
> > >  #ifdef CONFIG_DEBUG_FS
> > >     kfree(chan->dbg_client_name);
> > >     chan->dbg_client_name = NULL;
> > >  #endif
> > > +   dma_chan_put(chan);
> >
> > [Severity: High]
> > Could moving dma_chan_put() here introduce a NULL pointer dereference
> > during system suspend?
> >
> > By moving dma_chan_put() after the block that clears chan->slave, the
> > hardware channel may still be active while chan->slave is NULL. If a
> > system suspend occurs concurrently, drivers like stm32-dma3 might check
> > the hardware state and attempt to print the slave device name:
> >
> > drivers/dma/stm32/stm32-dma3.c:stm32_dma3_pm_suspend() {
> >     ...
> >       ccr = readl_relaxed(ddata->base + STM32_DMA3_CCR(chan->id));
> >       if (ccr & CCR_EN) {
> >               dev_warn(dev, "Suspend is prevented: %s still in use by %s\n",
> >                        dma_chan_name(c), dev_name(c->slave));
> >     ...
> > }
> >
> > Since dma_chan_put() (which stops the hardware) hasn't been called yet,
> > CCR_EN would still be active, and dev_name(c->slave) would dereference
> > the NULL pointer we just set.
> >
> > Is there a way to stop the channel before clearing the slave pointer
> > without triggering the original use-after-free?
>
> This is a valid concern.
> So, either we can have a NULL check in stm32 code while printing device
> name, or drop dma_chan_put() change for now to avoid this trigger?

Drop dma_chan_put() firstly.

Frank

>
> Thanks,
> Shivank
>
>
>
