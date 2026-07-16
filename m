Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11021121.outbound.protection.outlook.com [52.101.125.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1777A18DB26;
	Thu, 16 Jul 2026 02:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784169812; cv=fail; b=mwfngPASNKqIpwIhEJyzJzZEgwpW3gR1KJsozXW+oAM3nPeBF7T8usacDeqiyh6iTYGE5l5foEw5H+QZ1OiiCyaqcEs8Mb5e3UAYelT306muhK9/9MJuYpy/utf71wbkCcrYi1oqqc3B+SHtllvc9Un2G8209FzeH/a8ETIyffA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784169812; c=relaxed/simple;
	bh=Q5DYVXJZtvOwsPCtzezKgLqjp4F+opYFP7XPdPck2JQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SNWGHALSbP2+LGxWQoms9pVnZdFbZwJTje2+YNoEujTHOr9sWhMnQOdDQYlVz1P9LEKtOPxfRz9IPJfGRGgGLpn5QdYv63IgqEDqXlJTabn8anXaXTlRZYGMIzbhW5U2xh17J/TbjFWR8kVeQX18clSQ8veSpSh/9MuaDrRxEas=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=hCsXH7aC; arc=fail smtp.client-ip=52.101.125.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="hCsXH7aC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IX6gHiZkUjbjt3G4kM7VtYsiOPQBDW3HPXZDPUh/Q5xNc8nE/1XbJn4Obx1q69w0VveQn6feMDWUAYvLtvLhkEa0ewIOC6euN7OAwb5NmzX/ue91weM09QwnqxgqBZxeHQadxqj4xLJUw/EJeoEr7OIW/JpJGX65QJBWn9wk3mEE7Ga7iW+KpPSZfxqDRAoO8Hf8x78x4xsRiZwXNe3ywhQUrxEm5d2XOwkE1fAXO5oo/YqzvSwZmDud5mQvz6GD6Hp6uhAuVYPJCagucL5tlirvEBuw3cGSo/WRlg/tiTACrYLKjHPphgrd/j7eOvpK6VD0tqGw2ZrMzU2K6UC1pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WXerZfGKjTJ60cVczktQJOg1zmufkGHGQY2FrESf0ZA=;
 b=N97In1RMRjeMO96OQUpXj7nCKCsz9q0Z+Aj+kP8QLZdUiEeiZchPub66TjlJTdBZ/75q4qx9utKbUscYtvPIINrmRl2qUjfUV5IF0sgyfivojy1z3OpepWklz0A/sannHwddjza9KN5ok0uDH+4ECyHsIOCsilbllJ0ey/l7AsnB7cx0fsmGt0Jqmd3bHOYhRDfeDVqtVXJPaEb0/8b5subQ5laB6cvPWfnjxVYa4WAvFyEcryDZ/xbY1f7/hh0CaVayDds6Rh1jWMOCtkOhvTjDV59MLPhN03BhnVUcUYZ7HdZlpUrSN3MEMf8GG0lSuG36CL4Pqkb2izAuvHeD7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WXerZfGKjTJ60cVczktQJOg1zmufkGHGQY2FrESf0ZA=;
 b=hCsXH7aC7pu7jQYEZsoLs3mm47F9bljkUHvFdDgS/HyVds8i5Dy7KvWlB8DOGa9S88/5fysIhgj/xRZnkoHpAPvGsbXi2BJg3erSbdc5Epuyu7b5XT2SYXfzKffJot+Xa6M7oLGv7hhizjA76+aVn1FOa09TIlvlD7EVrV+ojyU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TY7P286MB6867.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:321::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Thu, 16 Jul
 2026 02:43:26 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0223.008; Thu, 16 Jul 2026
 02:43:26 +0000
Date: Thu, 16 Jul 2026 11:43:25 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, Cai Huoqing <cai.huoqing@linux.dev>, 
	Serge Semin <fancer.lancer@gmail.com>, Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>, 
	Devendra K Verma <devendra.verma@amd.com>, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/9] dmaengine: dw-edma: Serialize channel state checks
Message-ID: <uyyzhbcgp3kvhrcmekw7lqqfi5buk4vzxjfrslbuvy3t6a5ejx@5nrhnswpnsbr>
References: <20260715175740.1110404-1-den@valinux.co.jp>
 <20260715175740.1110404-6-den@valinux.co.jp>
 <alfYRbDbpSI02unF@SMW015318>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alfYRbDbpSI02unF@SMW015318>
X-ClientProxiedBy: TYCP286CA0087.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::18) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TY7P286MB6867:EE_
X-MS-Office365-Filtering-Correlation-Id: f19364e6-359b-44d1-4324-08dee2e402c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|10070799003|7416014|376014|366016|10067099003|18002099003|22082099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	sW5JgfivA3Tj0ebO/5dLysh+M/k4bT831XnvyELe7UtbFlnRNUP7DKeQH9iRk68oq2JTcn1CfXj3T7b7CX/buGSelPvvrf2HJc73MzeF0pJlluPUaXBy1kPJ56vm1edtr9rl0HwlFtd5BC7fyvZmk1/NelOb7Pvs0DbnwA0K4KRTsKRLsHkteIEO4pZw7qrXvOt0WjTs+xTm/J9agwNrN5KaZSRhgkCf8Za8ECvvqZyiicpxdTWhIx3s1Nm7MsbL0XEUvwg3vam64jlHO3FE1rjEcvU8W0sm9kmu+3ss8fL64pN7qcdBy95k5iupzVe1xekx7gVevxWKStmNXax5fcrsda8G6vgdwfTwCl6VqRfoWgynHpS566/ftTilUwHnnjByYuXzOas2RznYAOeHsAFI9C6rwFu1e9K7iV6bVcpn2V3IPIkCvJ7ZvLxaKIYOahMoM/YAXgqWigSrjbMA4hKZmZ7ZwO2yZ1FlHHaMgiJQnyGIcGHOq9EGz/py/a1MiysL7v0Ak368/cBeR3VMEKdHalfMJs7KpehhqJcKl3aEnNpM3/9Z3896A+X31DfTOQwjzq1/it7pK6aLwzP4CRIvDL4YhLleO7nxo2PMI0RexC5f3kzcQ7rzXW2P54cOOr47BoRdfYGlg7wrVqliTIBgx1UJw5cTHuI5WiwA1PM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(10070799003)(7416014)(376014)(366016)(10067099003)(18002099003)(22082099003)(4143699003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZrPXFAwcuw78wRczNvxuoQuEIyMb2tGK1YP16CyfsNHKTe5vc2MGaPlSt7OB?=
 =?us-ascii?Q?7d3g84zi3IHHP867MbWY7/OjtTLRxbaPlEPp4DuxI7c8RvPDuGsDEGQ74bul?=
 =?us-ascii?Q?DTMMFADbBbMllLZARg9USIr8i50/nZwJSyNRVilPdKjRhKtshJlwLWfuGM0N?=
 =?us-ascii?Q?QHehexaQ3nac/5yM6dr/7zFWVrRgIr8kfQHSHHmrnVowDTJ7ayBVrux3lFzx?=
 =?us-ascii?Q?31+WHCE9g0+aVuOVVS7/TEQehYSYuw7zSx19fGj40fwSFzvqaGbWbCSvyFGD?=
 =?us-ascii?Q?7l1+kCcvszQmCobdvDyD4BknGyXD+PpXWTZCOXhIMcXst0IXe68xtXDCdvUw?=
 =?us-ascii?Q?n2A9AGB2mS4zvrjEhQoo7vsRkpKumU2t5Cz7bkP7ENVUE77gY+i+uLxDDbR4?=
 =?us-ascii?Q?46SpUnZemA/+aplgxe1SfQSDYv54Rp8fQidrFZuJaK6/U+NjbSu89PP+X4Ah?=
 =?us-ascii?Q?e3BzWBO4Q+pO8Yy+Qq1+0EswxOflJUYYUs436GwH25OO8k/bWVrGTx5pmKlx?=
 =?us-ascii?Q?r7/4kAcZBvLoqPargkXrBiWNmcqmul0Y3OJCaCsimnU7qnATcXp+uECfOUxW?=
 =?us-ascii?Q?4rhohcWKQon85Kfh4LLIu12XOSBss8qpXzAK6BcsMa47rd21v02Wm28Kbvgo?=
 =?us-ascii?Q?vym6SxI9VFdG0BXK9Fd9hzDf0rFdNMBoDqGxRjM6mGkFA65H8DuDdGSjIkAc?=
 =?us-ascii?Q?czG0pfB342eL0FurWBJqRAhMUfL8QbOTzug4nLBTaIqne8lRF/HKrj+BTE7b?=
 =?us-ascii?Q?DolLXDKzPgtVmEHTL9RyNv5cPcxUBI9mZQtG3kr1IZqJ4TuSX/PVeGiNrrAU?=
 =?us-ascii?Q?4DAHBRdNEl91OqFk0MW0njUHh3P4P+cahOnUd3nShPW61GBhid9t1tYxZ6Ya?=
 =?us-ascii?Q?pD5sa8J6ecLzELSEJIGPg2sMJjbLjaHEDT0J//uqyay57cbLQFCbkC/SVyry?=
 =?us-ascii?Q?3n5+xSKynH3yxZfeewdOx2XtxOiNgXzCqQsyLjz1xTc4677b87ic4mIuV+/b?=
 =?us-ascii?Q?qMJqAfgYC+b+SXUYTD+3jMUZf33rYTO+sL0H98OpEm5XgXmcs4F7upHdhddR?=
 =?us-ascii?Q?fe2+sPoCw6rM0Nt7CwBjqBcZpZaKtnkuJ1XsJ/KvAU+gJGuk/w4IgEfSwQoT?=
 =?us-ascii?Q?OgJ5HffPCfSJr0ROht87WBh7eXnYioJ/YkxnypJlHpFifL5R8Ap8JY9vLVpi?=
 =?us-ascii?Q?jNSzgJ0EY4G2aBPk/5UOIb3adzwr1z8hfyD3tqatnG1XJpymuxyqKghiDY/M?=
 =?us-ascii?Q?oMYaPjcC9YQSG+NhzndiU/mbwbCvePr8y1Zl6J5TnGXrCa2AFmx2zXpkugJT?=
 =?us-ascii?Q?7ycm1RYj7f/2vXIUsEl0L4HPj4j4ruEeEitN6a8U6DfIUXgvyrkOKKFq5W6l?=
 =?us-ascii?Q?hZfGauMF2PvxzG1DWnmzsE4iMQj++r2mA+aAoDYKTcsqhg2qv3FCOSqhwpL6?=
 =?us-ascii?Q?TBWVtSgveNi4sc7zlSB3GGBcG68zpqfRZPoVh/s1JoHRHFCkIikq+VFxXM7l?=
 =?us-ascii?Q?BFQUZZFqGVPQFYBr5ZZGYNQoyb0DugWKnxcoMCvPW+gECpRw+k+t900leeta?=
 =?us-ascii?Q?1LV+OfSp/nPefhufqmjo/ROHaD4Jby+2x7wd5Lq7mlX/80owkUW5Sl6rTLiI?=
 =?us-ascii?Q?t6FCbeISMhuF1Kz80SlwRqiPhDpOxgzNnqdAqwy+74SVuVfnX/FUwJ6H78ll?=
 =?us-ascii?Q?m8rssJchi01Iej/43uLSJn/hHwa+XsqAWRTav+HjWwXVC1Jjh++rP2u/wxmq?=
 =?us-ascii?Q?a1Ad7Oq5C3igR2544HeeWeyP47+SpkvnpG7aH+bxl24kh7BsJHXQ?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: f19364e6-359b-44d1-4324-08dee2e402c6
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 02:43:26.2014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OsPWdTktYHlps/jz+hL01SiIVOMujMc/nW4OgOBUA2I+D8s0hEpo885MbEUi7YLNg+7A1JE2c25GKbND1mNrVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7P286MB6867

On Wed, Jul 15, 2026 at 01:58:13PM -0500, Frank Li wrote:
> On Thu, Jul 16, 2026 at 02:57:36AM +0900, Koichiro Den wrote:
> > pause() and resume() read and update channel state without holding vc.lock,
> > while the interrupt handlers update the same state under it. Take the same
> > lock around those state checks so that request, status, and configured stay
> > consistent.
> >
> > For example, pause() can observe EDMA_ST_BUSY right before the interrupt
> > handler completes the final descriptor and moves the channel to
> > EDMA_ST_IDLE, and then record EDMA_REQ_PAUSE on an already idle channel. No
> > further interrupt will acknowledge the request, and since issue_pending()
> > requires EDMA_REQ_NONE, the channel is wedged for good: terminate_all()
> > leaves the stale request behind, so even reconfiguring the channel does not
> > recover it.
> >
> > issue_pending() already runs under vc.lock, but it tests configured before
> > taking it. Move that test under the lock as well, so that the decision to
> > start work is made against the current value rather than one observed
> > before a concurrent terminate_all() deconfigured the channel.
> >
> > Fixes: e63d79d1ffcd ("dmaengine: Add Synopsys eDMA IP core driver")
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > Signed-off-by: Koichiro Den <den@valinux.co.jp>
> > ---
> > Changes in v3:
> >   - No changes.
> >
> >  drivers/dma/dw-edma/dw-edma-core.c | 12 ++++++++----
> >  1 file changed, 8 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> > index b06b299661c0..8b0e2af734da 100644
> > --- a/drivers/dma/dw-edma/dw-edma-core.c
> > +++ b/drivers/dma/dw-edma/dw-edma-core.c
> > @@ -300,8 +300,10 @@ static int dw_edma_device_config(struct dma_chan *dchan,
> >  static int dw_edma_device_pause(struct dma_chan *dchan)
> >  {
> >  	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
> > +	unsigned long flags;
> >  	int err = 0;
> >
> > +	spin_lock_irqsave(&chan->vc.lock, flags);
> 
> new code, can you use clean up guard()

Sure, will do so in v4.

Thanks for reviewing,
Koichiro

> 
> Frank
> 
> >  	if (!chan->configured)
> >  		err = -EPERM;
> >  	else if (chan->status != EDMA_ST_BUSY)
> > @@ -310,6 +312,7 @@ static int dw_edma_device_pause(struct dma_chan *dchan)
> >  		err = -EPERM;
> >  	else
> >  		chan->request = EDMA_REQ_PAUSE;
> > +	spin_unlock_irqrestore(&chan->vc.lock, flags);
> >
> >  	return err;
> >  }
> > @@ -317,8 +320,10 @@ static int dw_edma_device_pause(struct dma_chan *dchan)
> >  static int dw_edma_device_resume(struct dma_chan *dchan)
> >  {
> >  	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
> > +	unsigned long flags;
> >  	int err = 0;
> >
> > +	spin_lock_irqsave(&chan->vc.lock, flags);
> >  	if (!chan->configured) {
> >  		err = -EPERM;
> >  	} else if (chan->status != EDMA_ST_PAUSE) {
> > @@ -330,6 +335,7 @@ static int dw_edma_device_resume(struct dma_chan *dchan)
> >  		if (!dw_edma_start_transfer(chan))
> >  			chan->status = EDMA_ST_IDLE;
> >  	}
> > +	spin_unlock_irqrestore(&chan->vc.lock, flags);
> >
> >  	return err;
> >  }
> > @@ -373,11 +379,9 @@ static void dw_edma_device_issue_pending(struct dma_chan *dchan)
> >  	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
> >  	unsigned long flags;
> >
> > -	if (!chan->configured)
> > -		return;
> > -
> >  	spin_lock_irqsave(&chan->vc.lock, flags);
> > -	if (vchan_issue_pending(&chan->vc) && chan->request == EDMA_REQ_NONE &&
> > +	if (chan->configured && vchan_issue_pending(&chan->vc) &&
> > +	    chan->request == EDMA_REQ_NONE &&
> >  	    chan->status == EDMA_ST_IDLE) {
> >  		chan->status = EDMA_ST_BUSY;
> >  		dw_edma_start_transfer(chan);
> > --
> > 2.51.0
> >
