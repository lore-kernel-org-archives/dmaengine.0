Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020093.outbound.protection.outlook.com [52.101.229.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88203537FE
	for <dmaengine@vger.kernel.org>; Fri, 24 Jul 2026 06:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784874236; cv=fail; b=F337QhnFfoMSrWu4XikjVBNl3Vfpn0gaJUHhUl9pKvOwveVEv/E2KbzWbquGtzAQ0m2Ke/5Fu+W19mE9qaGfY+naNhMivZ1orqYJbceBsTNH2mLPBO80dLBE/nEFwgaEBn/ZA0MoDNJU73mmkbdjcrlATlA3qra3j8tbsKMJLVU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784874236; c=relaxed/simple;
	bh=rSbh5RSwmIITXlapZ0BWW71vQWTRLTYGOHINE8vaCJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cDMWrcOAp/1WljgyfwZx4YqYgqloUOSasQJuvn0spI8YEfdGOLj9J068Ko1VIiDxP76SFI9LC29PLMKpIMQfcFzk7bChn0Tvf4xcHt4FgzUvPtH3F2q4/jEFLmWSrJe8HC/hXWc9SjFSeDPPxks4T74S2Q484IQGCKpXBRYGUBg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=fail (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=arOso1rb reason="signature verification failed"; arc=fail smtp.client-ip=52.101.229.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="arOso1rb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lwifC6uRG03i2UrhQPf7pGgrbUufwfP8BO8p1rwIfUx+yja9K3pgqQBDNZ3i+CmsEeZStZOH6ZM1mzoaPEu7rdPKE6x9B87gu+gVBQ1ruEaWTiTu3ihLJ7vt2QsIKqHGSD5cAWzFThaH1tTm1oWPBHcdyz9AfyZpxc/pd/sSKoZIcHJpdCbfEh5yDFCekr2cIvTpnEEBB1SPtp5WgsTFZlymFsrnABsGFBRvMoyd5i2uyCxkBpbZPdvfe6qCcUETiBhcqluCCBmJNJqm/vYinOC552XxbU8gfBrwj2zP97Fxoudy/zMpqHLr6uqaATKY8L3Nnb9j5L3xii7PjRg6RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fs7aXHzc4fi34veseRvnVxI5zdag39sbVl7ruKmDuUk=;
 b=iiTyCNbZXT7lqaiiKu/TEJcmfKdNwgtA/K/0VEhRp54NQ6D3WCWxC7ENuet+/Z3wGIjevdjd/Yp41kG6JAy6tq+puwrPSpHnLhYLd9KaYek84wjqdJpLoUTJiXqdZ0MrVcy3hChRgFcIFLhNsBQahMjSBayR2C3W84mC2syk1sCtfQBfYqlUL/riIgY/kMAyIF0s2P1av6vm5m8Joq4Vux3+2moULXMSPvc44jvb7OrhiAorA2WJHMHl/XrqOd2QDleql7gtLfY4mxayMeNGWQZsonVccIuT8NWUkjisqssrmOnEpVXZyV1s8hWClvoc4tbF0PuG2Ncpb0GecS+QZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fs7aXHzc4fi34veseRvnVxI5zdag39sbVl7ruKmDuUk=;
 b=arOso1rbgP/PDLEBm7Ng+j0nuqUtZOpr2AvQC1qmriDVd1s5qTg9c3s8SCFkA40ZinNnEwkZNhAm40X5O/lHOynfzUuL4ywXIwm6SSTOqmPOgaZwrtssKy6/NNSM40Phl+wJJZk9yysAUyz3HeDfoNYMAEkKL5LxVT9nXm7Yaf4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYYP286MB4459.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:10e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 06:23:51 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 06:23:50 +0000
Date: Fri, 24 Jul 2026 15:23:49 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: sashiko-reviews@lists.linux.dev, vkoul@kernel.org, Frank.Li@kernel.org, 
	dmaengine@vger.kernel.org
Subject: Re: [PATCH v2 04/19] dmaengine: dw-edma: Make DMA link list work as
 a circular buffer
Message-ID: <xdx3g3rcw4vc7xvu36hh3ypkazclp2v2z7kp4oc2jxgcku4baf@yw4slias6qst>
References: <20260723084150.521366-1-den@valinux.co.jp>
 <20260723084150.521366-5-den@valinux.co.jp>
 <20260723090705.9E41D1F000E9@smtp.kernel.org>
 <amJEsX3XipBmJ7qT@SMW015318>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <amJEsX3XipBmJ7qT@SMW015318>
X-ClientProxiedBy: TYCP286CA0291.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::13) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYYP286MB4459:EE_
X-MS-Office365-Filtering-Correlation-Id: 24bacffc-cc2d-476e-fd81-08dee94c2050
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|10070799003|4143699003|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ftJSygZQUu9ic/yuRIkpnH5kLRnZtfVQ5NEkMv0fejwfv2stGhFfCo1vM+asCLDhQ2aLkH0ll0Ibv1dLg2SkWsV8WVjLS46A/ljmLfkQcCZFo+WhjkXQEmwkj0m0/nnskMLtCS+T+RVADSUiDNWwEpDfGkHx3Tcm9ge/pNjr8TM4xL12kXwPyVSozyF8F6MI8UMjM2ceAy2PTeVXluv/6poSkLS6VR/9iNEntEOv0RUMGN//PfazV93X/K448SWr9tyZKnGnIxlrYoLDO22AV/HImSU5nTg47l3xSeo635y3ChrbVifj+06yU0KDGXfYs4ZTuAUTmgA62X9BmCcEbAEJSeOtlH7vir5VuHdmr5xy5QEtwf2FXclIWlZaCP/ko1KqgoMYJL1AnnyY4Vu7P5eEksxr5qAAipeLMNLRduquL0Y6W7MrLZhWEH2Xkr6XIQeKe7lWwyxcVFFaMamfOXL1CuT3b9KZD5KBcQ1FVOWUN4qw8Qk96L8225gue99UfcVoiXyzOeTB/mY2OB+X+aA40Y0ODsQin2X0Tc4HfymogQTz6LE8MS6LjtftL0wFAZqClqLcQXx8u8FeA2jTejRPsaAuSLrOC+B23ojKcq8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(10070799003)(4143699003)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?DiVZMFqESfAF56S0X8s73tBNWibSxFuKbtJtT1KpqqZkx577Q5j3Lwqw7/?=
 =?iso-8859-1?Q?VrvpoXTtNhL0AW6ndaLR0byyog0pgncW5jc7keDIUmL76ras/zXa31sy2V?=
 =?iso-8859-1?Q?lh/ey8+Mz6T+iDsJZF2J+JVnYAB7UTCDkxEKFAFJmnpstm3m3uQTYQoP0V?=
 =?iso-8859-1?Q?euI7okoSC3Jsc877VPVRy/NbdKraHTywc0O530Wj7LW5AmCrQ1c+glylDk?=
 =?iso-8859-1?Q?mlHgpCNMGa8MiEGT0Q2++x9HNToEt30i0WbTeAXWZ9CirnE1BC9wVIxrzk?=
 =?iso-8859-1?Q?Amyl8/c4tgOIQPBSJtVvAZjPn8HTswnbdTpAcDFAAJ37V82HvF86hVhrc0?=
 =?iso-8859-1?Q?8uf0SjXWKA8dnHzaEV61UWBGstGs4OGfYi+V6BvK3psWMNGz8nseyAENPm?=
 =?iso-8859-1?Q?nMKwsJNAfky3SbJGg3ftp1fD+/I5fCzntvGOerPaI7Hv0I2aLUf7X/WIb7?=
 =?iso-8859-1?Q?rPrKaFi0TctJDqzk+9aLjiJIdw/arNepdZ2I8XAkCwj8I1VtQ341W1jC2O?=
 =?iso-8859-1?Q?I3UuZB2d3F2k9eAcqwHJIVS359kWoDu3dXW9hGW6cSd8TEPkOT46lSO2rA?=
 =?iso-8859-1?Q?czWn64GUwkhkizD2dLsLvOGWizAebSC5y0m79P0vVxy0CiK+NLH3pYMtjG?=
 =?iso-8859-1?Q?xMwPXurUINLeM/aWQjrGHQQpLCIu0h1G8XjqTM9/T3Ymc7Nx9OFX1pafMW?=
 =?iso-8859-1?Q?HoGUgiceOJz74mpVOrUXeHuGz8LbwakaVgX6Sqt3a8U9L0dWe11boxLN/v?=
 =?iso-8859-1?Q?nisGfhgj3DqgRvOECJWLN23sB33NC1izw/G4V0YO8mzJZxsWFr8DN+WBIn?=
 =?iso-8859-1?Q?UAiGBaOR1XGXZpsQtwnYkhNaG8QGE3OfdXHWVCh9nL16SOqS56IQEkWUCI?=
 =?iso-8859-1?Q?y9yy9noz606mXNoOVIK3QCUUIxlnd5eZW0OO+46Vbt/gKrUW8b9Ij8OH4H?=
 =?iso-8859-1?Q?rCIEI0tRh9FCDWqdNcD71Y5I+iJDGAq2E3MC6j/Iy8YLE3oIcpeIpsHKNy?=
 =?iso-8859-1?Q?ii3t+BPQxsrYkrmxdkt8fy/jZpINCe9KANJuoK6mzqAjHcixkWa23KqvSl?=
 =?iso-8859-1?Q?NWUXhWEiYMDYgIpfOHB9SR36y+T7TjMe6d2JSFdO3XN1ZeFLLAgq/nqigA?=
 =?iso-8859-1?Q?rHqbL6RozpgXByk6X2ZRN/Gt2ACyXCyLrrsR6MH3FXctTTg+FGvhAune1e?=
 =?iso-8859-1?Q?+Jcqgz53dUFjZmR+ism9zkeQSijp38Bm/ZBYAtOu7WDjaMyaWUUSkhB4NV?=
 =?iso-8859-1?Q?B4hVxS+8xTXhFCqYlXr2FnVuPLDy+NuNoABLC0VzA1B8XoEzt3def+6x0d?=
 =?iso-8859-1?Q?/6SBqc7x8VYr8MemjvlhU5LOXVO+M/U3ns5th/bUPO8jxzDDXcYPW183e5?=
 =?iso-8859-1?Q?FXZ/ruVes2E34BnOjm8X1n96EUrySs7PTUUkDP6xeBjElQThKfdm5LqN1Z?=
 =?iso-8859-1?Q?q8+ACzGXd6o6pjKl4GnwXzQbQOyM2eDIg+gmGKdtXT23qK3wM62YIdaG8g?=
 =?iso-8859-1?Q?2/zmjDMT2ClKQ+qnfjs2W6uams1qJwxmc6seNtZJB79M7VxHhtK9A+2GyF?=
 =?iso-8859-1?Q?Hlx0CQYnPwlyhD46OSFSlnPp0TZJqAKcEF6A3P5F35W/nohd1fuaIyqG5X?=
 =?iso-8859-1?Q?RMlJRTDSMNB7A3Iav5Ug0KIRe31OhbBa3XSQz6J5goTu1iMsjEMXqBxmic?=
 =?iso-8859-1?Q?Iso8f7Gjv6jMRvfR5K2ARSKHl3pLzp97AgXYQCvlNPUCxUvNTe97ujcn3a?=
 =?iso-8859-1?Q?mvXTEFxpIMN1xpM151x+OWp5SsDKj6uUcainKKdxVgnjdnhhPMVSfVgx4/?=
 =?iso-8859-1?Q?yAZ78WoTPWNmKJVBivTDbVUjXdWgqqWMgcJ2thRM++b0ipJ0s3Hb?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 24bacffc-cc2d-476e-fd81-08dee94c2050
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 06:23:50.3353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kZBgLKblF2a+9p4/SmFb0PUJ8hhA/E08yfNbsI620euOuAwp0erfPwRpmQDbBLzexm4e7aqwYAmcwZ548SQeOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB4459

On Thu, Jul 23, 2026 at 11:43:29AM -0500, Frank Li wrote:
> On Thu, Jul 23, 2026 at 09:07:05AM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [High] Ring buffer capacity is permanently leaked on error and termination paths because `ll_end` is not advanced.
> > --
> >
> > --- Patch [4]: [PATCH v2 04/19] dmaengine: dw-edma: Make DMA link list work as a circular buffer ---
> > commit 2d5b6554b58830487f70a13eab5e1ac3de304658
> > Author: Frank Li <Frank.Li@nxp.com>
> >
> > dmaengine: dw-edma: Make DMA link list work as a circular buffer
> >
> > This commit updates the driver to use the DMA linked list as a circular
> > ring buffer. It appends entries at ll_head with the current cycle bit and
> > reserves the final entry to link back to the start.
> >
> > > diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> > > --- a/drivers/dma/dw-edma/dw-edma-core.c
> > > +++ b/drivers/dma/dw-edma/dw-edma-core.c
> >
> > [ ... ]
> >
> > > @@ -645,6 +687,8 @@ static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
> > >  							    DMA_TRANS_NOERROR);
> > >  				list_del(&vd->node);
> > >  				vchan_cookie_complete(vd);
> > > +				if (!chan->non_ll)
> > > +					chan->ll_end = chan->ll_head;
> > >  			}
> > >
> > >  			if (chan->request == EDMA_REQ_PAUSE) {
> >
> > [Severity: High]
> > Does this leak ring capacity when descriptors are aborted or terminated?
> >
> > This block successfully reclaims ring capacity on successful completion by
> > advancing chan->ll_end. However, if a client driver queues transfers and
> > then aborts them (for example, via dmaengine_terminate_all() or during an
> > abort interrupt), the descriptors are removed from the list but chan->ll_end
> > does not appear to be updated to reflect the aborted descriptors.
> >
> > Since chan->ll_valid remains true after a termination, subsequent transfers
> > will bypass the dw_edma_core_reset_ll() ring reset logic and continue
> > appending to the un-reclaimed ring.
> 
> Make sense. Need change at these abnormal case.

Indeed. This is a bisectability issue. The final tree handles it in patch 14,
but patches 4 through 13 still have this issue. I'll sort it out so each
intermediate patch remains valid.

Best regards,
Koichiro

> 
> Frank
> >
> > Will this eventually cause dw_edma_core_get_free_num() to permanently return
> > 0 and deadlock the channel once the un-reclaimed slots exhaust the ring?
> >
> > --
> > Sashiko AI review · https://sashiko.dev/#/patchset/20260723084150.521366-1-den@valinux.co.jp?part=4
