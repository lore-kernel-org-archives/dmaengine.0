Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11020090.outbound.protection.outlook.com [52.101.228.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827103385B9
	for <dmaengine@vger.kernel.org>; Thu, 16 Jul 2026 03:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784170810; cv=fail; b=rAfcSTPnrfj5vWLplUJnidG6OiSGKTWFLE4MGGYS7JRtGI+Qg4DPh1Kyv1v0dbF2EOmrAchwqEpuFsmSGVaVs4Th36GlVsqjgqNxm99XTkJuc5yZrOJCrRyJqpDqLX8ZkO78pt+wL+NEZOXm/rIgbeJOTt4jn5Y6GaKRjOykrQ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784170810; c=relaxed/simple;
	bh=3L+R5BYZRONxFRnthmutZGhIxT7jqB+JiFiPhyHDwPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=B5In+imNdoQ3T6GPg23BNnHbA+iu6vh9ofQgDqLT2MWeUFSSuctGdeAC1VHXRU761vLDa48NrEb7Ed2zokjDdNbIQh1d9slod+66GDAUJk+6y+ke4QDKgGijYPTEbhC6g3UrKxjYS0wqVunHD4NxXiKM3GsSFlxSRjrSpkeUgiU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=fail (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=XTkRO4xR reason="signature verification failed"; arc=fail smtp.client-ip=52.101.228.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="XTkRO4xR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pyKFU134WnklHGFU5Jz5IUB7H/CEbl0FqqwF85wvyZL2noJ2vpsZhJ3FrwJr7pjhUirqC+fWkAd6d7BA5k/VHrhTazEijrzdgpuOipox1H3XrMUMJK60ON5aGvGXjowPgaMHUzMTHGRUfqk5bmwoXhHxhsTh7gFu2d1xVagikld+MMpNgmIDyLZ+sLZHxADxkSbWqF4ayPjAwD0FWBBogeXwlOKupyoKnJEItPc5HRIJDxa8UWURcX1N1OfIahsyvy2ERaA7TZlXszH2+rE+A23lFxoLRMwWem0B9mwvkly0SQ2N9lCbXmiKQEeEuaaSWoFc0sv6G8K3P0ASDStadQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+xgoSvh44J4s1xGCbj/G5qJBiHaESxxi74mTcWFeZQI=;
 b=SG4LK74pDUH0CJaeW3DZD7o3Z3cY7mF0gehHmPV1TCYRcQq1uVO5jXZI9L7IZavgdiUmZo2EewF8c3+9gwf5ZGAaGeVa5Tqfu8Or1VBuWolJ2jJCx0dw+Syd+fzUsC5VAIlCfw0r+V/ctC2+/wiTq9Fkk/PhHhl/ZNuD4xhOqkdcTkemXiSAdCmUDtRq5vBGfRGlojJBPVbvPcGUvk9bhWOANuW3qIqT6Sl6QmDuuGTZTkh7Xdi/WdBQc2UR329gSlPEtU+B0sClbO0RS/256hvzUhSr91zoSrHsgxHAJYOL2E4HLBAdqXztQpbDS6fGGvhTKuQlBh58muGHZx/IYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+xgoSvh44J4s1xGCbj/G5qJBiHaESxxi74mTcWFeZQI=;
 b=XTkRO4xRavgBYjJtbpxVz9CW+aeQuaXQkqap5eB/uJVD6Bis/ZabH+sqmC1ISaAcsgA6Sdi94mA/CfyLIrVEGoAMrzNxrTnhjVOuA31RuLXJHW+wJn3MVMrdn7DkK0lPsFJB2u49h5r7i7yXDnY7FlPGa4624EsPssC3g/tlGhg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TY4P286MB6623.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:33f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 03:00:05 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0223.008; Thu, 16 Jul 2026
 03:00:05 +0000
Date: Thu, 16 Jul 2026 12:00:05 +0900
From: Koichiro Den <den@valinux.co.jp>
To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
Subject: Re: [PATCH v3 2/9] dmaengine: dw-edma: Terminate all descriptors
 without callbacks
Message-ID: <oofcmuhiwjcbavyqq4cngfhrpbnibvrucvlpmw4e2d2usc3c4m@7wx2svix3vha>
References: <20260715175740.1110404-1-den@valinux.co.jp>
 <20260715175740.1110404-3-den@valinux.co.jp>
 <20260715182457.E94211F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260715182457.E94211F00A3A@smtp.kernel.org>
X-ClientProxiedBy: TYCP286CA0355.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::12) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TY4P286MB6623:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f9064c1-520a-4c4d-920a-08dee2e656a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|23010399003|376014|1800799024|366016|6133799003|18002099003|22082099003|4143699003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	7OicK+VU+bLkWZFjE+cKGwcocO3J5khtaRiWZkp9IBoQQWHwkABY80mueNyc7CUe1SVmHVHtMBR+LJKQXFaxriysf0A026lOWWfrVjZlDeEz2Gc1uzzsxoPvOqOa2EL+MW4D/XqerzwYIXQzPMwOPESQQiUA15iDXWX/aZyKpbqFthFbE/7IoERXQaOhALsU8wPWO9ZuZfPKIjvH0SwB4c/0yaGZFGL3e30iRlwWA13lz4OyOHrXGEu/ybrEAlwNfG6GF3QFBTgSeB4OF2IgJyuxYIGnlf0x6xQGkVPmKiDiEGXu7yBdJQGCCOYscQJiHv8jVrPcaNctDvR4kZvNrgY03GsArOGHQLybBell2se4AcqFb4xkaXN97a1bZ/Rb08/dX+/6KEy+dwxzIO8OqDFCI3dt2tbWhQruvEOtyEitTA+Jh4HRRWYHgYtMZf4vtd/ERiCVUzbTaD4IBUMyTObyI8vxO1AJH4mJFE/nM3+Vis33bmYuFvDXijS4n8icI6tl4+xQmaAgemZ1WBDrQMtW3kmeaCHBjLdQoz3vs8UvZXgs0rO0tdsyIFs78eddlRHhJ5caifYKnTZSHH5ALkOYRk7DxArbwnKdYhrskeY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(376014)(1800799024)(366016)(6133799003)(18002099003)(22082099003)(4143699003)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?oTf8u6HKmWDCNwWpDtWuNvFOcOQrsod4wKLFv3TzA68IEqpmUXrOwxPxfV?=
 =?iso-8859-1?Q?LIaBQYgg4wO5W9BQWez6Y2kOWt2Wa5Tcm3s5kls8Go5qk3RlZksVc3kJyb?=
 =?iso-8859-1?Q?kyL45vFqWHuiiuTfLPZK59yZqXw3TJ5ztFUxPfiPXA/S1dYUIo9g75zcrd?=
 =?iso-8859-1?Q?pG/mgePyRJH3+H8PL60LNecD6Q+qaFLrN/U+gFjuKztLatgRbApznqas4X?=
 =?iso-8859-1?Q?30XddtXfYP4Xk7Pe9g/03YFeZigsTbHZE+C2HzWy9Gr3sTMXbi7RQCuiRE?=
 =?iso-8859-1?Q?ysgRwNoSj1QIbb1vUt678snOxx5+V2aXLuWnhd+8L7ZUHE4WxjKqnhbgx8?=
 =?iso-8859-1?Q?6rwWUfNJk77rFEdzsfPSntyTnjl/K9mUbFwKFTED13qzysUSnLiBe3P8K3?=
 =?iso-8859-1?Q?Z7UtZCgeskMfZTHm/oqlH77+Ej12hQPSZ3fnuKz6TunaHIfWVIZbsA5CwO?=
 =?iso-8859-1?Q?eZ8PYjApGIt3/g97Qocvq6fNMQE3HqaDGdiKstO6bypxiHcjqok/k8XeS0?=
 =?iso-8859-1?Q?+N3TZ81oMtgtzF3fTGUugBHnqFVHRHVoTj797Lk0/Qh/CptMkd6pMPOxDI?=
 =?iso-8859-1?Q?AAGHd/jv+dW6TUDKJwhZIvkVk8oa/kzzAYUdfMjhilAckW/3BXucdsN9+b?=
 =?iso-8859-1?Q?yW0NmWT6qtrvRC1xF3gt63LISTdJ4+pV5J646Vxrpds78YzF+sYFO+7kbF?=
 =?iso-8859-1?Q?hkAX2euXa0v5lZLVkMRUhqHPiPkuEmL5zHC3Gr72gps8EFLojo1YZs3l5O?=
 =?iso-8859-1?Q?+rzIvRhPWiO0peWiUYowaarOBl0AxoTC4lK38FjvLbgiff9xcDb/vcFrcB?=
 =?iso-8859-1?Q?xP6SXOYlB5+BpeNWn68kBmFj6Z1140ltvTCooLX7ocBKbzQvMkH60tO29Z?=
 =?iso-8859-1?Q?EmBViziIPuqf/7XUy4JYLt4p9IEe7pbXRtvz69TVDGa1vkLE0qkrJYhSgR?=
 =?iso-8859-1?Q?8p/mm7WH37sxGHm9oJcI8R1hli23uUNCIC1SoYF4y0g8Cj+oxXJKLjqJQY?=
 =?iso-8859-1?Q?aHVxTTLAWgNyob5BMYU3TZOd93TMGBH39DUj7a1nlbkjczRDf8OnCB3s9A?=
 =?iso-8859-1?Q?CzyCZZAoeNTPglGtyAXC0dxWSlhjJHuoP0wriwi6J5l4q0JHiBtawNhzPF?=
 =?iso-8859-1?Q?D6ArcPS8xSRlIYskYM2fslxjT9PR7pQHgtzjhUJyd4p1tjHSe/6xcb1BNt?=
 =?iso-8859-1?Q?4b4X0V/lobwlCUUA1OBLbGvAEzawzI4BAY0aZc92LWgYPMnJh8yIGzmWtv?=
 =?iso-8859-1?Q?xmMKQGMdci//TmjrcjyBtDjh13aASdLb1JDXXkhXkWxrKoqEe8i7ZiSTo8?=
 =?iso-8859-1?Q?jda3KS6z54EEkhRbebxdwrRG594K/UgDCNgZn4euGtFEIp9hNDW+lH/wPu?=
 =?iso-8859-1?Q?lPr8zhgDRdZaucjSxHr4pwQZCXwiIHyHJNb5KW3w1MFqPLXZYW+uHHx5gM?=
 =?iso-8859-1?Q?IfoJug1lMJpoh0RgMMNtjvWMru8Zd0YeHk/8A3MLQ4TuCWJ3h1Ib+OYhVb?=
 =?iso-8859-1?Q?C4MRE1/JXqPSr/pQn5GcOstTDcyFSUmMiGRlNJ+HXgxMUGR9+HXPalfTMK?=
 =?iso-8859-1?Q?XL/aN3jEWSTra60zod7so2NwZ0BZZ6KJofJsuq0UWcXWwZt1Oiy6/XT/qb?=
 =?iso-8859-1?Q?k7meqmpAolyPmEL5VS78nIoL6ABeonkW9KEcnP0B8Jx8WfK1r7aTZexY6H?=
 =?iso-8859-1?Q?oI8GVKLL9ttgEhNgiroDulHpShGEEWwk31iy8gfXolVUndzh9eojnoayk6?=
 =?iso-8859-1?Q?YxB1LupKyvF4BKDWMH2gA5Y4ZG7ZNKmEh/Oq1c9GreCRisyglYjH/qGiEa?=
 =?iso-8859-1?Q?Rmf709z6+vQ+QDSkxFIzgiyl2KYrUmotJdhUwCiOwMZfaJLAAnSd?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f9064c1-520a-4c4d-920a-08dee2e656a1
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 03:00:05.7948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rf1XDkPKDFp0eeabAsxSMKhbWDUbxKD47/j/3jYhrOfU3WiZhfFHP0zOKAD3G+fLCOpmD8EZovREdMBn4+JTxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4P286MB6623

On Wed, Jul 15, 2026 at 06:24:57PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> 
> New issues:
> - [High] `dmaengine_synchronize()` explicitly waits for and causes the channel to lose its configuration, breaking generic clients that expect to reuse the channel without calling `dmaengine_slave_config()` again.

Good catch. In v4, device_synchronize() waits only for a pending STOP and no
longer clears chan->configured. free_chan_resources() clears it instead.

> 
> Pre-existing issues:
> - [High] State updates in `dw_edma_abort_interrupt` are performed outside the channel lock, creating a data race that can permanently stall the channel.
> - [High] `dw_edma_device_pause` and `dw_edma_device_resume` read and modify channel state variables without acquiring `chan->vc.lock`.

Patches 3 and 5 address theses issues, respectively.

> --
> 
> --- Patch [2]: [PATCH v3 2/9] dmaengine: dw-edma: Terminate all descriptors without callbacks ---
> commit ca03488a0b49733d1020ab17fdc7c52f079bfb7c
> Author: Koichiro Den <den@valinux.co.jp>
> 
> dmaengine: dw-edma: Terminate all descriptors without callbacks
> 
> This commit changes the termination behavior of the dw-edma driver. It
> moves all issued and submitted descriptors to the terminated list without
> scheduling callbacks when termination completes. It also introduces
> dw_edma_device_synchronize() to wait for channel termination.
> 
> > diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> > index 89a4c498a17b8..44ef5fbe3fd4a 100644
> > --- a/drivers/dma/dw-edma/dw-edma-core.c
> > +++ b/drivers/dma/dw-edma/dw-edma-core.c
> [ ... ]
> > @@ -306,20 +336,25 @@ static int dw_edma_device_resume(struct dma_chan *dchan)
> 
> [Severity: High]
> This is a pre-existing issue, but does dw_edma_device_pause() and
> dw_edma_device_resume() have a data race?
> 
> In drivers/dma/dw-edma/dw-edma-core.c:dw_edma_device_pause():
> 
> 	if (!chan->configured)
> 		err = -EPERM;
> 	else if (chan->status != EDMA_ST_BUSY)
> 		err = -EPERM;
> 	else if (chan->request != EDMA_REQ_NONE)
> 		err = -EPERM;
> 	else
> 		chan->request = EDMA_REQ_PAUSE;
> 
> These functions read and modify chan->status and chan->request without
> acquiring chan->vc.lock. If device_pause() runs concurrently with an
> interrupt completing a transfer, it might overwrite chan->request to
> EDMA_REQ_PAUSE on an already idle channel, preventing new transfers from
> starting.
> 
> Similarly, device_resume() calls dw_edma_start_transfer() which manipulates
> virt-dma lists without synchronization.
> 
> >  static int dw_edma_device_terminate_all(struct dma_chan *dchan)
> >  {
> [ ... ]
> > @@ -698,7 +733,9 @@ static void dw_edma_abort_interrupt(struct dw_edma_chan *chan)
> >  
> >  	spin_lock_irqsave(&chan->vc.lock, flags);
> >  	vd = vchan_next_desc(&chan->vc);
> > -	if (vd) {
> > +	if (vd && chan->request == EDMA_REQ_STOP) {
> > +		dw_edma_terminate_all_descs(chan);
> > +	} else if (vd) {
> >  		dw_hdma_set_callback_result(vd, DMA_TRANS_ABORTED);
> >  		list_del(&vd->node);
> >  		vchan_cookie_complete(vd);
> 
> [Severity: High]
> This is a pre-existing issue, but can this sequence permanently stall the
> channel?
> 
> The end of dw_edma_abort_interrupt() looks like this:
> 
> 	spin_unlock_irqrestore(&chan->vc.lock, flags);
> 	chan->request = EDMA_REQ_NONE;
> 	chan->status = EDMA_ST_IDLE;
> }
> 
> Because chan->request and chan->status are updated after releasing
> chan->vc.lock, a concurrent client completion callback could queue a new
> descriptor and call dma_async_issue_pending().
> 
> The issue_pending() call would acquire the lock, observe the stale
> chan->status (e.g. EDMA_ST_BUSY), and fail to start the hardware. The
> interrupt handler then unconditionally writes EDMA_ST_IDLE, leaving the
> hardware idle while the descriptor is stuck in the desc_issued list.
> 
> [ ... ]
> > @@ -856,21 +893,48 @@ static int dw_edma_alloc_chan_resources(struct dma_chan *dchan)
> >  	return 0;
> >  }
> >  
> > -static void dw_edma_free_chan_resources(struct dma_chan *dchan)
> > +static void dw_edma_wait_termination(struct dma_chan *dchan)
> >  {
> > +	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
> >  	unsigned long timeout = jiffies + msecs_to_jiffies(5000);
> > -	int ret;
> > +	unsigned long flags;
> > +	bool configured = true;
> >  
> > +	/*
> > +	 * dw_edma_device_terminate_all() may defer cleanup to a later interrupt
> > +	 * while the channel is still running. Retry until the channel is
> > +	 * deconfigured, which means termination is complete.
> > +	 */
> >  	while (time_before(jiffies, timeout)) {
> > -		ret = dw_edma_device_terminate_all(dchan);
> > -		if (!ret)
> > -			break;
> > +		dw_edma_device_terminate_all(dchan);
> >  
> > -		if (time_after_eq(jiffies, timeout))
> > +		spin_lock_irqsave(&chan->vc.lock, flags);
> > +		configured = chan->configured;
> > +		spin_unlock_irqrestore(&chan->vc.lock, flags);
> > +		if (!configured)
> >  			return;
> >  
> 
> [Severity: High]
> Will this break generic dmaengine clients?
> 
> The loop in dw_edma_wait_termination() forces the channel to become
> unconfigured by polling dw_edma_device_terminate_all() until
> chan->configured is set to false.
> 
> However, dw_edma_wait_termination() is called by dw_edma_device_synchronize().
> Generic dmaengine clients expect the channel configuration to persist across
> dmaengine_terminate_sync(). Because this explicitly clears the configuration,
> subsequent dmaengine_prep_* calls from generic clients will return NULL
> and fail.
> 
> > -		cpu_relax();
> > +		usleep_range(1000, 2000);
> >  	}
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260715175740.1110404-1-den@valinux.co.jp?part=2
