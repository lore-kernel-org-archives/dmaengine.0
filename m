Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021083.outbound.protection.outlook.com [40.107.74.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D034A4848;
	Fri, 18 Sep 2026 13:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789736875; cv=fail; b=mR+jOpnw399RLsazWv70O12057YgS7gUG+6L5yZeBFkn72LBCWm9yhLNzEXEiuO9BTp27WCTf1+1OK83PGHGDZ00UE209639Gy9jpQYrVeftLLTfCzo31xMcpWsKSCeclIOD5PwzTgcHjk7ncdgtz0gn0fyj7asrX2TZcT9SLNA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789736875; c=relaxed/simple;
	bh=a5vf3gRKFRsGnMvP78L1nh8zqQ7x1laubtQz6+gw3ZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CoGyUb2ZIGiYMJvTCrDdkzh//fPHO9o4+ZptkW6kF/5N0D8sAkvVbk2OD3m1ddejdoS+B91MkLfy7HFfUhlLDh3ICuE2PDcPcfRmbLxJE/YV0/sPmhDovpJ9E4zr6j16qhH/69od+JR2mcmRwa7fKoIKSPaJWvPYx7nbwwPzHO8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=hco9Rjdn; arc=fail smtp.client-ip=40.107.74.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="hco9Rjdn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HuajqwXjTWiWKHtvAuPfU409abh7p5eJ0yb5XDnMQqI51OFuTsSmrwInZu1076F2MYOIfc66Ag5HR08stXww+onGIFhbzhf2re7ATz32snrDgPouWOm5naxwbqjYwhaFjZKPVvLs+tXxJVWuXP+GdeYkfYjPyFiho31aF33UvrOwstXnj+VgEW9Y/2CMq0klxbTwFDKAz9SbYgS8K42wqDav7zcRIlU7rYEJBe5hbUp0WPCCEC5glx4QTlpgyvKfuM9Me+Vxr1GNYeYOJ9GGnx4Q6jOUc/EI7wVMkRqwF/ngazHIsO1dFUiT+f7vgdjcs4JjmHq2vklFTRsQTDOETg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=02eOJzfAinh85ud5MFnBHbGSyvA6a98lEQ9xof17Iqw=;
 b=v9V4nC6giHDX09cCUjW3wI6Kk9w9zzM9CngDBXfE55mowLVczcdMSUiXRzhMVWPdWDpENP5ZftNpTz1neCnowBy11GfdTn6pI1jQNk5vfeND8grLo0t/r9OMjYnQWz5J7mcauOf0V2eCUyTgU6re/9eRB166Z7ZX1nNNSxFxhXINEw883MMuyBH1dT/bEWU7TZpmyAmpP1uirATdx9Z0UkncI5EjFGtQlLh1l6VA9wgdWwyIVVfWSuCoM3yOR6KXc3vjGqi90QsnPELwd04Ko6nNCq4OW5CDS81RpNQmRKWRCp0cN6f97BafBwHEyHi8OqqdRO40YxLaMbbSXTOqrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=02eOJzfAinh85ud5MFnBHbGSyvA6a98lEQ9xof17Iqw=;
 b=hco9Rjdnee8YOTYQDA9geG+p2cssk+vg+NKJUFy7OROAjq3ItN2jjKnE4CQQQ57tt9tZkA4kXejG635V4wd3fLJIY7ZecFskoue/tCcaWALz1j2GgpKBcUN8/gR7yYa4SBV6+pknXXeS9m7SlA1L/OnpufeMr9KiLwB64xsOCSw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:325::11)
 by TY6P286MB7985.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:3a7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 13:07:50 +0000
Received: from TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM
 ([fe80::cce5:2aa8:53f9:dba9]) by TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM
 ([fe80::cce5:2aa8:53f9:dba9%5]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 13:07:50 +0000
Date: Fri, 18 Sep 2026 22:07:48 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-renesas-soc@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, dmaengine@vger.kernel.org
Subject: Re: [PATCH 2/3] dmaengine: rcar-dmac: Add missing
 dma_descriptor_unmap()
Message-ID: <3odvtlxs62ulw4obrzfy3xlf74k4wltjkj6k4axsmdx3hnyo3a@rx2pm422eozp>
References: <20260917071208.36888-1-wsa+renesas@sang-engineering.com>
 <20260917071208.36888-3-wsa+renesas@sang-engineering.com>
 <aqwXwOiPgRDUQfp_@SMW015318>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqwXwOiPgRDUQfp_@SMW015318>
X-ClientProxiedBy: TYCP301CA0090.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::17) To TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:325::11)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB6866:EE_|TY6P286MB7985:EE_
X-MS-Office365-Filtering-Correlation-Id: eacd4e73-5d95-4a1e-d9d2-08df1585d784
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|10070799003|5023799004|6133799003|10067099003|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	KkVvtMoiUC7KBexBecUqxv5RuMpdZgL5qj/HELqsDg0aXbhibNDSX27XGqIc7uDu5bjQVs+Bg6CPdMa3IoBrVdZukxE4/IvPdIzrnQXhkQ4oV36tVtMPHxPs22oEZdeGmacUJiDUk0TPldhDJjjz//EQd3juTAAo9HN3PLwVvTnggMM9KsK48Xo2KjsDOaEr/Daw7jTpOAfCtC3yp0PaZRixUG1wLM842YoqAph1tuq99XYgM6NTaM14SQJHc3zHtOvL/LQ5ZoSFMYG1hX4x7OGajs4Mzlv+leRsZxo2ESIEAN28TvsYVBv6W64bEezj4h9X8ucjaTZNqvvORMEW36ufFX5OxKGQnioGfRpHw2oZQQXKQgcJA3g3EaDNoSGYJqukHPhmO8p+ve/DnzqRaGeumGIofadAnrzz/auL9CCzEK4N5RiKwtsafXHwH6r4kBMDKJXVbHOws4NizSb4aJZlH1kegaudtPY+xl7RohvBl9aQ75w8w1w7aUwn2/ZmTBodLNFSPBJ7K68yn8ymREIDmb3Gy9kEedTD24m7JGio79XP1H5I9gZqyQnZ1JOh0lPUym6qk/fhZVS1uCyiCMlywkEkRZJyPx15zXkP4b5E4r/4uMOMW5R6DBzYd2ao4ppb79b5HJ5LhrHTKGakYYLVxYGQPnztxH0bDXsQkj4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10070799003)(5023799004)(6133799003)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mV748BWwp+CVofxxXf/6wkKfRGdCm+YEOCKw0cA2XDAbEaNNrv22FCX+DRWz?=
 =?us-ascii?Q?SglzVzawlAJsPtYXutApat+CyUVeyhoIkG4yiGDJflTLCVGcz7HtGOtPj59k?=
 =?us-ascii?Q?GUYICIE+Kjv4GoBQytC4Rm29i57mCnTs07FXa2ZqogaZ5af6p/NVsl4N88We?=
 =?us-ascii?Q?RiaUGEky+XeDGHH8QonEzwNhds6pj4N6Ka+w+1nY9Zt3zXNyhj2RDyd7v/Q1?=
 =?us-ascii?Q?gl4VSbt4UImr5NIfi4o5olLJyrCbFVwioyq1FkTgczNgC9cE1fQxtAXFBzLp?=
 =?us-ascii?Q?7Pg9i3OhCkvHDYXFNzQElX3Y+R8FCo2EsN8du5fgOlGQGlaN274k712Oljtc?=
 =?us-ascii?Q?AGXEAUNNqRgiFTJDx0Kuv18oh2Vxtv5GqG9fkdB3UkUmP6DKflfNbTwPNcGD?=
 =?us-ascii?Q?EoE1p6grHvy1psqtihjAvxCZsJUCqsbpyKRDFRchHGIorunvWnbBAiRJOELa?=
 =?us-ascii?Q?ZlWr4fJJywNnHUT6vBhF3ijjEvzNVwhRtPgsw+p2VZ1e9A1GEszw+u8/e/aO?=
 =?us-ascii?Q?XBvo7x9nHUvSfqzBrKVqoLKGKVxjL8wvZfpZ9lQ7DeXYBTRHbn5j5Xv6M3sv?=
 =?us-ascii?Q?CmjeohlVOrac503lXKiOeMXmcNTVApwgYpWUUNHqk9OEgo5jXc+9cjKCqYak?=
 =?us-ascii?Q?l0byWW/Sui1EfAI6xB0qSIs+1E337SwSeiyR+kzlyBZkeAV5YwFzihemVWhO?=
 =?us-ascii?Q?JksWuhPuXbLZirtgXTox8PHFi8dEnv2A6i1wNXyxmEXNkV80YN1/aLCA+67M?=
 =?us-ascii?Q?2g7wqdCWrKncGdyuplmiqFkqDlr7N49pZLejTa6dUG81Bil87gdhmmU3LDkf?=
 =?us-ascii?Q?MDshzpXTCxVTevxxb/jQY00fGEaErbLoRQ173Wbp4ASEAjbWfwvMyOw3uWMl?=
 =?us-ascii?Q?2xq6/9Y0r0x1cNURUpnHPdUTtTv5pLpd6UuG2a2PNApBvYMAGUURvUAAKXOA?=
 =?us-ascii?Q?y47NjpPNPA8dhehPALiUL76XfP41H+6yV6Z63PSqJAbWAPwLueivBQeQHpgq?=
 =?us-ascii?Q?50e7uHGuEJEVY/euXbFs5h78CUQhN5uyqKtYdnrhdpGibht1n9zpfj5hJgqp?=
 =?us-ascii?Q?Wt7VMWdQCI9AShOhGcCNRi2ZnjjSdPAvyTX6y9JPLRj3DAYI95jmO1qyDLCm?=
 =?us-ascii?Q?XYhFqb/Jz9q6XhsYSoOrIe+JHztV0M1/Soot0vjEcnegQwA4RXIIqgf+Y4Xk?=
 =?us-ascii?Q?1MbPk9pSpQF6mOvymX0CljSwZcryGe6gxNragFxwIA8R1QcdpSTEZOPXyV/d?=
 =?us-ascii?Q?2g/DEMia8pTMDOYr9qyF8mlITuuKibCMsfHB/zQnfYlXtwpb9RoT7ru0FSXG?=
 =?us-ascii?Q?gIMG230xdyIRXYJKAXXvIHhbTo+z3Wqi2oDRIuQ8d8bbGPnCBw4pi7TINiKk?=
 =?us-ascii?Q?avOnIaQPg1wh6KAZLpf7gMFw3gyP9WBqmE+ACxxVrM/faNSoprSyQT2keow9?=
 =?us-ascii?Q?qJ+qbONALBA3O7hPBSRZe+zOCFMT16IUwYkJok6q7z0Jt05VfOYxNVBhA4A8?=
 =?us-ascii?Q?KO5m7KWDQxe71jbUtxT8Qido3LxXyakVgDD9XPI5LEYHE0QG0lab+anRPzDp?=
 =?us-ascii?Q?Yeae9MQZd+my65wUkYVYhF0JDuSoGAVNsVJVgKwucI0nEKj1f84MgN7i45It?=
 =?us-ascii?Q?I1sTqVF6ni14WOGfgV7die56SwoEusPI7Wue+0327qK7x3R6g2Ui02DW0lkG?=
 =?us-ascii?Q?eoNHORdjbH+LVIN7m6es1ShbLbAQiDKSj5gJCz+f/jGodRqoVeLQOetZeXKr?=
 =?us-ascii?Q?knfSlQKG+UR1lol0IshO8U5FkuPYkdL2wfJ55l/hI02Tlo8i4wY+?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: eacd4e73-5d95-4a1e-d9d2-08df1585d784
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 13:07:50.1495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aMSw0K77vrfGFqGBAOFeD4/1sZNNsfRhfUeBCKRpWj6SuW3zyubl1hrEdlb3c7LUmrBKB0aSjmj8JZr9e+hStg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY6P286MB7985

On Thu, Sep 17, 2026 at 11:39:28AM -0500, Frank Li wrote:
> On Thu, Sep 17, 2026 at 09:12:07AM +0200, Wolfram Sang wrote:
> > From: Koichiro Den <den@valinux.co.jp>
> >
> > Call dma_descriptor_unmap() right after dma_cookie_complete() in the
> > threaded IRQ completion path. Without this, streaming DMA mappings
> > attached to the descriptor are never released and may eventually exhaust
> > DMA mapping resources (e.g. IOVA with an IOMMU or bounce-buffer slots
> > with SWIOTLB), leading to dma_map_* failures.
> >
> > Also ensure dma_descriptor_unmap() is called in rcar_dmac_chan_reinit()
> > (error/terminate path) to avoid the same type of leaks.
> >
> > Fixes: 87244fe5abdf ("dmaengine: rcar-dmac: Add Renesas R-Car Gen2 DMA Controller (DMAC) driver")
> > Signed-off-by: Koichiro Den <den@valinux.co.jp>
> > [wsa: added Fixes tag]
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > ---
> >  drivers/dma/sh/rcar-dmac.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
> > index 5b54f1c4ce15..9155bceb723b 100644
> > --- a/drivers/dma/sh/rcar-dmac.c
> > +++ b/drivers/dma/sh/rcar-dmac.c
> > @@ -844,6 +844,7 @@ static void rcar_dmac_chan_reinit(struct rcar_dmac_chan *chan)
> >
> >  	list_for_each_entry_safe(desc, _desc, &descs, node) {
> >  		list_del(&desc->node);
> > +		dma_descriptor_unmap(&desc->async_tx);
> >  		rcar_dmac_desc_put(chan, desc);
> >  	}
> >  }
> > @@ -1654,6 +1655,7 @@ static irqreturn_t rcar_dmac_isr_channel_thread(int irq, void *dev)
> >  		desc = list_first_entry(&chan->desc.done, struct rcar_dmac_desc,
> >  					node);
> >  		dma_cookie_complete(&desc->async_tx);
> > +		dma_descriptor_unmap(&desc->async_tx);
> 
> Does callback function still use these data? suppose should unmap after
> callback return.

Unmapping doesn't free the buffer, so I don't think accessing the buffer in the
callback requires that order. Correct me if I misinterpret your point.


P.S. Sashiko's concern about completing the cookie before unmapping seems valid,
but other drivers use that order too. Also, with drivers that can automatically
start DMA in tx_submit(), the following race also seems possible:

      API user                                 dmaengine driver
      -------------------------------------    -----------------------------
  #1  unmap = dmaengine_get_unmap_data(...)
  #2  dma_set_unmap(tx, unmap)
  #3  async_tx_submit(...)
  #4                                           dma_descriptor_unmap(tx)
  #5                                           invoke callback
  #6  dmaengine_unmap_put(unmap);

Here, #4 only drops the refcount from 2 to 1. With swiotlb, the actual unmap and
copyback can happen later at #6, so the callback in #5 may see stale destination
data. All in all, I have no idea how to sort all these concerns out cleanly, at
least for now. (I hope I'm missing something here and the existing code is
actually fine, but in any case, I personally feel the unmap infrastructure could
use some cleanup.)

Thanks,
Koichiro

> 
> Frank
> 
> >  		list_del(&desc->node);
> >
> >  		dmaengine_desc_get_callback(&desc->async_tx, &cb);
> > --
> > 2.53.0
> >
