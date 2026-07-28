Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011062.outbound.protection.outlook.com [52.101.70.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4883CC7D3;
	Tue, 28 Jul 2026 15:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785253451; cv=fail; b=lp5vjH58i3m7Cecko82lHbxst3IhCR1Ksg3QcFu2XpZFB7W3qpYEQM7MfYrrUKtVeI77+tFvVU38+7HgEe1n7bQrYzDaU7kVW90V4PpjLjyioBeJ3h1vHxy8VLtE+LH6za2YHQYSPySta2BfGt9B0TfaW4Tk1/zgd9Sqou+G59w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785253451; c=relaxed/simple;
	bh=h+nYPfi4VMep02BO/LRQEcZAwFkUjqjDD2ojqPfAaiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bk6KRBMLxRgdcKHET6qNGk9X8SgC3U5biFNYK7pyUQS9g78jtjnpLAYOPb3GlDcj8zFP7vBYs7F+gSfPfSdZ7SCIWnF6VK2ZPCQtmVULtXycBCKqGcWuaIXF+oadUy77UKZqRRe6qvMoAaU0vW11TAGNveWxsU6EaUtKQyYdXYE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=jX86eI0g; arc=fail smtp.client-ip=52.101.70.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="jX86eI0g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f6lAdffTZE6xogDboKpVTqqIGfJjZ/bI5tPZ1B7THJIdcuYp3gvCSguomJ0mTcSG4IEI2d0BDnJoF8+YlAkzHJE40E3CRnwqpBHK6zSLIwLGwPJt2iRhFAbo2sEM4JsIgJzZmW0tKkmSA0onqvQt+uBmNx4b3f9O+ADTH3pGyw0DmVtauVHlqGdo78drVvkEg0Gt3P9ExThyMH7foIS18ZFXobAoeCbcGowc7uWP+fsMzO6e3dTXdf+Rwthd1bpNdrBee1N01637bvPHU8He6Ke2ocxeGoo/Qc6WL1OTPaGVzhW1uzaEJwZNoxomhhhaORVY4qqylxB1deZWCO7TbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qWblp+eDCiTY9iTkSbxAtxn4mDEbu73i8M9U357+h5E=;
 b=IBCJ8k23ZF0aC9AYF+9alZucAc4/Ep7KXvJXBqdzep/RWMIPpOClnXCTht9scUbCSoVmaiSG1y491Bb6mtv7y/E+db0thy9JtKtKVD+gTtYaXpQKWe6VE3KCU2Xu69Jp8MAdPM3q+3cFuU+JIJoI23bIKV80h7yV4eaVlyToqfiuF2cA8/cTFRUi4rl8rZj2LU7Ev/jXW2GaUyvuK1kntjtmm41kJtrJpTtpSNgaviibKaiiPsgcHlr0hqyvpqhN0LMdOmPj2RmqCeMYIx9gxgCySYpTUyDjXk18jT82olyC0hNCzkavk2h7VQMiPnTwJYD8Q45EQ4m1Uwyj5WmSRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qWblp+eDCiTY9iTkSbxAtxn4mDEbu73i8M9U357+h5E=;
 b=jX86eI0gFueaT5qi66pvhkNr8Fo4Phzlx20+k5Xbl3KKGgZS2ETaQVskirA+pCVWQB5jRxhGhFhBCi7VPr4apGiTPHhWa/aYlEfEjnyl5/ZU7zKA1k9syMeqHdfx/sizInU4EdvBj700Hjq8Surfv1NWVrNjPzc7fYi5AYGl3EiZB9y2p/VHM5GF3Q6cw5dje9JZCa8SoJyvAMFkrO/pFFRX59fswE5qbtKE4/zPhYuVXbHRX6cmSuGn/HWPVRFYNLeYmKH5KIUaplGI0jpVeAyHml5z9T0PODtSgU2xH021fcHRZeHF5+CO8MRqCQ9jxRWDeDfjHEsd0XB26T6qrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAWPR04MB11675.eurprd04.prod.outlook.com (2603:10a6:102:50e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 15:44:06 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 15:44:06 +0000
Date: Tue, 28 Jul 2026 10:43:57 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Koichiro Den <den@valinux.co.jp>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>,
	Kees Cook <kees@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Christoph Hellwig <hch@lst.de>,
	Serge Semin <fancer.lancer@gmail.com>,
	Cai Huoqing <cai.huoqing@linux.dev>,
	Niklas Cassel <cassel@kernel.org>,
	Devendra K Verma <devendra.verma@amd.com>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 10/24] dmaengine: dw-edma: Prepare LL kicks for event
 serialization
Message-ID: <amjOPbm174THHNlR@SMW015318>
References: <20260727170323.2321369-1-den@valinux.co.jp>
 <20260727170323.2321369-11-den@valinux.co.jp>
 <ame8-QU4siDSPzaS@lizhi-Precision-Tower-5810>
 <uq7qe5ptxr4uekuxouqlir2ijusfxq66zffad7k7ypflfn2ezk@vxs2jonoc3hl>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <uq7qe5ptxr4uekuxouqlir2ijusfxq66zffad7k7ypflfn2ezk@vxs2jonoc3hl>
X-ClientProxiedBy: SA9PR10CA0005.namprd10.prod.outlook.com
 (2603:10b6:806:a7::10) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAWPR04MB11675:EE_
X-MS-Office365-Filtering-Correlation-Id: 84b76810-9831-4142-27f9-08deecbf0eaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|19092799006|366016|18002099003|22082099003|56012099006|10067099003|11063799006|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info:
	LmsyaXKbGBwP0ZamuToHIeMiTY8s9axaC12TP1Zb/LCzU7kRmSxiAtyZsopqA48Iy63jgcZ4iKke3syPsXZWQuktI9Dj/5FD5UfnotlENI5d2iPun+FxBHQe3IrVkNwafyuchvi9yXX8xHy7g8euPIy0Jk5/VyK4dAQd7Xub5vup8Nni7XIfYW4t1/iIGiyJIgfyr7jrR5frwgiOcofmOH0PRAQCpuErdPPVogGmmB7XdU5crmBNpiuB50rfRH7iBELK5TZ3JRkuSHBWh51DB8bdHTXjqIYxqm2I4DNcp5SJLXJKglqf3BmugMZjtWsSlF7PTvQVurzdjr2h5OYUKu3SKtBIiaWwGDFJF+S0OfSv3H9SYjMSsV2HoHpG7JkY7kkejl/j9ODlHcSlKXvpY9R5VZrrJSBYePOANZK9FHjdvF0K91sCeAhIjLqddqKuCmzWkDpMLykZaM5yr3uOu2jDEAUIpySSWn/Quq01RrelzvPYKJEIMWtVfBa9OpueEE5PjP9VaJ4nIwDDwPy8RnaBoUwId2KV2bz92C4xy1Yd5OtHpxAfPUNAmGaL5AE1GjG/w2DM0L0o7K/t6lYfLaIYkzSe+pRPVx4mA9XrVeJE1GQ2bA0/2Pw3+vTl9lwDpduQsF4E30lcm373p778sv1IBIHpakJc/0T7PT/3DeI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(19092799006)(366016)(18002099003)(22082099003)(56012099006)(10067099003)(11063799006)(4143699003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0TlmX2H/QbosjBcQ3nt3dNZOR84tUWgpQe+worSq1YP+efTuFCJUuqVKNK3f?=
 =?us-ascii?Q?Y+UG327QwHGbVyxr/sWcn5gh6RInShx/WIkYsUoZc1XcZjstBgQKiG74264J?=
 =?us-ascii?Q?sLyHSUtd8ygvA5yY+AxHsDbJRXqgOJ6IUkbx59ZGANBFtnqQ8bV8/BzN70PX?=
 =?us-ascii?Q?qgkvgm6glgmCqBBvKm6O+rBffaUKnKYtRsi4xKF8uepy8sQINjaWJEsodSfB?=
 =?us-ascii?Q?p6lwiZrRHw+vY0ZBst9NZUNHL/+BmSX83cp8NUCe9kk6i2ATI0JDVwgLSzcF?=
 =?us-ascii?Q?H7ub3ugP+iYJKxYbAv1xuFMUag51po6Hzp0oqFolkUjZLpgLvyYxQfZEDazw?=
 =?us-ascii?Q?ZsmipbD7kMdKhJGVGGX/xGzcofCgJOOGNpVStYwWAj2QyN7Jcuq4oHoYaI+H?=
 =?us-ascii?Q?oqr2ApJVLqJDOM9GeMu781nv9B7asXOhzlCp50OFHl8dpefklbJM/Kjpv/Vp?=
 =?us-ascii?Q?uq8lOufITGe6SR6+bw4PIfxqLkaNOqCsq/bdS0ZOP6+kxVMtWbgc5rTXXsB3?=
 =?us-ascii?Q?gwE6meDQoYBhqYjsOPek9SO0ygiEAfwDZK0GJOeh2GVkNno30DqpVufMypWg?=
 =?us-ascii?Q?589v4305jdHoMUT7DFF8qVnCPYbcQYWKrDsdxZhouzKBRtp3rS+odn6F5EEs?=
 =?us-ascii?Q?Ci9x0B67vJKwtBPY1QO9wqAwLL1mK2nU7cELycF9jwnnApGppzJQlEVTQYg5?=
 =?us-ascii?Q?AO6SEMlrXbR6m+l3Uwrz6PKa/Zs6+mos/Vxv9E0JYrxtT2iR0iiNDu5hQ64Z?=
 =?us-ascii?Q?tuH/qlW6U/HttfykeTrma21ktXII+pm7GI9Zr8aHu7Q94sOigCsvn2U7njBj?=
 =?us-ascii?Q?73zz1p1ojJvIpGUxl4YqaqLEdeOVsrTVAR7uaczSk4ByFaJ38hTdipzN3Z9a?=
 =?us-ascii?Q?iz8Mo4lSkN96iphKQnj2OmwFo9Pg4ZmM7NBPce0QeCSA5E/UhNGMEtvYuPLQ?=
 =?us-ascii?Q?q8Yjx9G2gWuY14Ws7ErRQP49rcYKhtxApcF2mk19gcHhvpODjUL3V9RFvZ6t?=
 =?us-ascii?Q?P+r5osgDOBewHOOeUc7ieK5Y2EsM9Qx7pOqKhtgqwjVxbZzyNMwDJ6xj+3cG?=
 =?us-ascii?Q?o7nsPApV0G7mmmYugEJbu1vlZVON8tMedaBavRvR72iPdyfTShZTAOKYybz3?=
 =?us-ascii?Q?kVElupOep1txmZfwQPvD+i12SjyQynvwZHPMnxBQGhjX7g/F46FDl1u1K+fd?=
 =?us-ascii?Q?6/XUbOxWubTtZTlSjrR8KW+vC06KfK8RemyZspmQRLiuxpGHuCHxqpPccIh9?=
 =?us-ascii?Q?EGMCeMT3CGsdkNxIHWxw7yt3hVFobc+pFhWPQ0Ko4vL4zXcoCDamdYIGgcYe?=
 =?us-ascii?Q?/YLdEH6J5K1NQY+ZRJipiYbYaQzWS1Jt3aGAWU2d2dycCrWZQOALRET/o5QB?=
 =?us-ascii?Q?IyqCM7Qrw1HiTPRBgGBa8buoYm/8EQjSa5fxFw21jSd7dgb6K2v6fLuFA/hU?=
 =?us-ascii?Q?2Zx8w15a0HA2hLRVrCG21eA02gS3trLcmN6p3c6mjz7H3rJpkWohwbv4CkgR?=
 =?us-ascii?Q?klrTNnCGV1ZxeNOEI98ZIQucZiRtj6MopKn6yFnBwe5pPJ+Md4mggXysLGfm?=
 =?us-ascii?Q?WFqMvZs/Y/OzL/xveKydapDvOVCukNHUwwTwWUqUCjBLNc5UoPTE1RHPnpNh?=
 =?us-ascii?Q?GtDm/CE0GZ3gjB//ltZMbs7jmcBVt82Geo+TPnA+tr/NtrEqH/g9AnThq3J1?=
 =?us-ascii?Q?HJltIxj2lOKsR1lpwVJzx7TxfJlNevOn+DldfII4IQeCqaLnpDdB4dZTcxef?=
 =?us-ascii?Q?Q/+h0VPS5PHBvsHUXXfNQByytyQnylUmm/dHoy18sRWPOj1C+PDN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84b76810-9831-4142-27f9-08deecbf0eaa
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 15:44:06.4929
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h/XjuUeD1+rKed4n1HyXLZZQewhCVBL6p7vTyxVe3kDy5Nb2LBKAw9oyGaWSXqGYGcDfGvQ1HWXnV64HqTLBtXAwupFSRbJYlMJPkDhEUkrHp81CcRmaU5qDLBJPwHsj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB11675

On Tue, Jul 28, 2026 at 02:38:16PM +0900, Koichiro Den wrote:
> On Mon, Jul 27, 2026 at 04:18:01PM -0400, Frank Li wrote:
> > On Tue, Jul 28, 2026 at 02:03:09AM +0900, Koichiro Den wrote:
> > > Both eDMA and HDMA perform the same remote LL read-back immediately
> > > before writing the doorbell register.
> > >
> > > A later patch serializes each LL doorbell write against IRQ event
> > > capture with a raw spinlock. Keeping the read-back in the provider
> > > callback would hold that lock across a remote read. Move the common
> > > read-back into a core kick helper, where it can run before the
> > > serialized section, and leave dw_edma_core_ch_maybe_doorbell() to decide
> > > whether a kick is needed.
> > >
> > > No functional change.
> > >
> > > Signed-off-by: Koichiro Den <den@valinux.co.jp>
> > > ---
> > > Changes in v3:
> > >   - New prep patch split from "Centralize LL doorbell decisions" to keep
> > >     that policy change focused and the remote LL read-back outside the
> > >     event lock added later. (Sashiko)
> > >
> > >  drivers/dma/dw-edma/dw-edma-core.c    | 20 +++++++++++++++++++-
> > >  drivers/dma/dw-edma/dw-edma-v0-core.c | 16 ----------------
> > >  drivers/dma/dw-edma/dw-hdma-v0-core.c | 16 ----------------
> > >  3 files changed, 19 insertions(+), 33 deletions(-)
> > >
> > > diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> > > index bb57f2d39d1c..e3d0559206d8 100644
> > > --- a/drivers/dma/dw-edma/dw-edma-core.c
> > > +++ b/drivers/dma/dw-edma/dw-edma-core.c
> > > @@ -13,6 +13,7 @@
> > >  #include <linux/dmaengine.h>
> > >  #include <linux/err.h>
> > >  #include <linux/interrupt.h>
> > > +#include <linux/io.h>
> > >  #include <linux/irq.h>
> > >  #include <linux/dma/edma.h>
> > >  #include <linux/dma-mapping.h>
> > > @@ -254,6 +255,23 @@ static void dw_edma_finish_termination(struct dw_edma_chan *chan)
> > >  	chan->status = EDMA_ST_IDLE;
> > >  }
> > >
> > > +static void dw_edma_core_ll_sync(struct dw_edma_chan *chan)
> > > +{
> > > +	/*
> > > +	 * Remote controller registers and LL memory may be reached through
> > > +	 * different paths. Complete posted LL writes before the doorbell.
> > > +	 */
> > > +	if (!(chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL))
> > > +		readl(chan->ll_region.vaddr.io);
> > > +}
> > > +
> > > +/* Must be called with vc.lock held for an LL channel. */
> > > +static void dw_edma_core_ch_kick(struct dw_edma_chan *chan)
> > > +{
> > > +	dw_edma_core_ll_sync(chan);
> > > +	dw_edma_core_ch_doorbell(chan);
> > > +}
> > > +
> >
> > Can you move
> >
> > 	if (!(chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL))
> > 		readl(chan->ll_region.vaddr.io);
> >
> > into funciton dw_edma_core_ch_doorbell().
>
> Could you elaborate a bit more on the concern?
>
> I'm guessing that one or both of the following changes look unnecessary to you:
>
>   (a). add the common dw_edma_core_ll_sync() helper
>   (b). move it outside of dw_edma_core_ch_doorbell()
>
> Regarding (a), the helper is also used in patch 22, where the LL writes must be
> completed before re-enabling the direction, without issuing a doorbell at that
> point. So I think (a) is useful on its own.
>
> Regarding (b), this patch 11 puts the raw doorbell write under event_lock.
> Simply keeping the sync in dw_edma_core_ch_doorbell would therefor also put the
> remote non-posted MRd under that lock. I tried to avoid it for two reasons:
>
>   1. It would otherwise increase event_lock contention, especially for eDMA,
>      where the lock granularity is a direction rather than a channel. The IRQ
>      path also runs dw_edma_record_irq() while holding the same lock.
>
>   2. If the non-posted MRd completion is delayed, event_lock would remain held
>      for the full delay, which can easily be avoided by this patch.
>
> Or is your concern more of the API design, that every doorbell call via
> dw_edma_core_ch_doorbell() should include the LL publication barrier?

Yes, doorbell() should include memory barrier.

Frank

>
> Thanks for reviewing,
> Koichiro
>
> >
> > Frank
> > >  /* Must be called with vc.lock held. */
> > >  static void dw_edma_core_ch_maybe_doorbell(struct dw_edma_chan *chan)
> > >  {
> > > @@ -261,7 +279,7 @@ static void dw_edma_core_ch_maybe_doorbell(struct dw_edma_chan *chan)
> > >  	    chan->status != EDMA_ST_BUSY || !dw_edma_ll_pending(chan))
> > >  		return;
> > >
> > > -	dw_edma_core_ch_doorbell(chan);
> > > +	dw_edma_core_ch_kick(chan);
> > >  }
> > >
> > >  static void dw_edma_device_caps(struct dma_chan *dchan,
> > > diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/dw-edma-v0-core.c
> > > index d883ca446f5a..b3098eb83442 100644
> > > --- a/drivers/dma/dw-edma/dw-edma-v0-core.c
> > > +++ b/drivers/dma/dw-edma/dw-edma-v0-core.c
> > > @@ -480,20 +480,6 @@ static void dw_edma_v0_core_ch_enable(struct dw_edma_chan *chan)
> > >  		  upper_32_bits(chan->ll_region.paddr));
> > >  }
> > >
> > > -static void dw_edma_v0_sync_ll_data(struct dw_edma_chan *chan)
> > > -{
> > > -	/*
> > > -	 * In case of remote eDMA engine setup, the DW PCIe RP/EP internal
> > > -	 * configuration registers and application memory are normally accessed
> > > -	 * over different buses. Ensure LL-data reaches the memory before the
> > > -	 * doorbell register is toggled by issuing the dummy-read from the remote
> > > -	 * LL memory in a hope that the MRd TLP will return only after the
> > > -	 * last MWr TLP is completed
> > > -	 */
> > > -	if (!(chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL))
> > > -		readl(chan->ll_region.vaddr.io);
> > > -}
> > > -
> > >  static void dw_edma_v0_core_ch_config(struct dw_edma_chan *chan)
> > >  {
> > >  	struct dw_edma *dw = chan->dw;
> > > @@ -624,8 +610,6 @@ static void dw_edma_v0_core_ch_doorbell(struct dw_edma_chan *chan)
> > >  {
> > >  	struct dw_edma *dw = chan->dw;
> > >
> > > -	dw_edma_v0_sync_ll_data(chan);
> > > -
> > >  	/* Doorbell */
> > >  	SET_RW_32(dw, chan->dir, doorbell,
> > >  		  FIELD_PREP(EDMA_V0_DOORBELL_CH_MASK, chan->id));
> > > diff --git a/drivers/dma/dw-edma/dw-hdma-v0-core.c b/drivers/dma/dw-edma/dw-hdma-v0-core.c
> > > index afc2f24fecd3..64a07fbc5be3 100644
> > > --- a/drivers/dma/dw-edma/dw-hdma-v0-core.c
> > > +++ b/drivers/dma/dw-edma/dw-hdma-v0-core.c
> > > @@ -282,20 +282,6 @@ static void dw_hdma_v0_core_ch_enable(struct dw_edma_chan *chan)
> > >  		  HDMA_V0_CONSUMER_CYCLE_STAT | HDMA_V0_CONSUMER_CYCLE_BIT);
> > >  }
> > >
> > > -static void dw_hdma_v0_sync_ll_data(struct dw_edma_chan *chan)
> > > -{
> > > -	/*
> > > -	 * In case of remote HDMA engine setup, the DW PCIe RP/EP internal
> > > -	 * configuration registers and application memory are normally accessed
> > > -	 * over different buses. Ensure LL-data reaches the memory before the
> > > -	 * doorbell register is toggled by issuing the dummy-read from the remote
> > > -	 * LL memory in a hope that the MRd TLP will return only after the
> > > -	 * last MWr TLP is completed
> > > -	 */
> > > -	if (!(chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL))
> > > -		readl(chan->ll_region.vaddr.io);
> > > -}
> > > -
> > >  static void dw_hdma_v0_core_non_ll_start(struct dw_edma_chan *chan,
> > >  					 struct dw_edma_burst *child)
> > >  {
> > > @@ -393,8 +379,6 @@ static void dw_hdma_v0_core_ch_doorbell(struct dw_edma_chan *chan)
> > >  {
> > >  	struct dw_edma *dw = chan->dw;
> > >
> > > -	dw_hdma_v0_sync_ll_data(chan);
> > > -
> > >  	/* Doorbell */
> > >  	SET_CH_32(dw, chan->dir, chan->id, doorbell, HDMA_V0_DOORBELL_START);
> > >  }
> > > --
> > > 2.51.0
> > >
