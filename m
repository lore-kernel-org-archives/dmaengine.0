Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29A849AA20;
	Fri,  9 Oct 2026 09:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791537789; cv=none; b=ApYKyYGcQKjwdQ3awqGb6vjI88bStOuf2fBU7LB0eDQEVP/HHPnTkxSyc52llVryMpcojZzo48bF/wD7t3ihjrKNSJUhous1zblclZN/2Cr4TXQsRGngSeWoRw9WOOIfixTn0pZ48NlgCq6Bw75/GQ+83z3edPcy6XOMmnalo+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791537789; c=relaxed/simple;
	bh=Z9MInD0MIpJq9nDT9WaY6hrbfB/vLKD+F/mrG7jtcj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CEuoC6VDlmu+RF0cncFPU9y9GmnjEb4Gox4xWPGB49RGmq//VKZwy73gm+It/m0fTUOTOyUIn9GXLguyNzgh+Ro4Z9u9kMKYyva/8BstoginfHyBAIajS6sB97Rab55i+JprEzY7prKqCCtIa1HVJ0H4svZDLidfSlfnp6EFkeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YCmXWA/g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YCmXWA/g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A16FE1F000FF;
	Fri,  9 Oct 2026 09:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791537786;
	bh=aj8enua3ZAxbk2ZvWeVFGYXKZTQE3XQxNgdUO6DMbpw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YCmXWA/gSNUUyhYa+BdQRMQBWP57GW85+OdNjtBRGglna7MKvQylmltfdBzfiT0sj
	 sPDmFGcyug7muLY3WCHJlAFVM9oHJm07IPJ7ATo0UTRYtLrCE76DYuXkiKJJlA9wcv
	 4xnVfVUqJf15Y4FK9ZiEqYbgrcXu98s03hGGOwwbgh1yUN/eixlDpCJpSecWmC1VMZ
	 6Zvf/FUIPX8khAh9CNBhl5Nt8HpOlkguDL9HxHVFX5DkkP5T1F9eZuEbVO7kM1YSTl
	 p1VW6j6l9uoNL1/62G0abEbfim4yprEcdrCqUArlP4jEkVHHkk8PR/uDh98Kn/UYoN
	 xX8wyE4cjwHBA==
Date: Fri, 9 Oct 2026 11:23:02 +0200
From: Vinod Koul <vkoul@kernel.org>
To: Koichiro Den <den@valinux.co.jp>
Cc: Frank Li <Frank.li@oss.nxp.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org, Frank Li <Frank.Li@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	dmaengine@vger.kernel.org
Subject: Re: [PATCH 2/3] dmaengine: rcar-dmac: Add missing
 dma_descriptor_unmap()
Message-ID: <asiydkH91ggpsE7B@parshuram>
References: <20260917071208.36888-1-wsa+renesas@sang-engineering.com>
 <20260917071208.36888-3-wsa+renesas@sang-engineering.com>
 <aqwXwOiPgRDUQfp_@SMW015318>
 <3odvtlxs62ulw4obrzfy3xlf74k4wltjkj6k4axsmdx3hnyo3a@rx2pm422eozp>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3odvtlxs62ulw4obrzfy3xlf74k4wltjkj6k4axsmdx3hnyo3a@rx2pm422eozp>

On 18-09-26, 22:07, Koichiro Den wrote:
> On Thu, Sep 17, 2026 at 11:39:28AM -0500, Frank Li wrote:
> > On Thu, Sep 17, 2026 at 09:12:07AM +0200, Wolfram Sang wrote:
> > > From: Koichiro Den <den@valinux.co.jp>
> > >
> > > Call dma_descriptor_unmap() right after dma_cookie_complete() in the
> > > threaded IRQ completion path. Without this, streaming DMA mappings
> > > attached to the descriptor are never released and may eventually exhaust
> > > DMA mapping resources (e.g. IOVA with an IOMMU or bounce-buffer slots
> > > with SWIOTLB), leading to dma_map_* failures.
> > >
> > > Also ensure dma_descriptor_unmap() is called in rcar_dmac_chan_reinit()
> > > (error/terminate path) to avoid the same type of leaks.
> > >
> > > Fixes: 87244fe5abdf ("dmaengine: rcar-dmac: Add Renesas R-Car Gen2 DMA Controller (DMAC) driver")
> > > Signed-off-by: Koichiro Den <den@valinux.co.jp>
> > > [wsa: added Fixes tag]
> > > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > > ---
> > >  drivers/dma/sh/rcar-dmac.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
> > > index 5b54f1c4ce15..9155bceb723b 100644
> > > --- a/drivers/dma/sh/rcar-dmac.c
> > > +++ b/drivers/dma/sh/rcar-dmac.c
> > > @@ -844,6 +844,7 @@ static void rcar_dmac_chan_reinit(struct rcar_dmac_chan *chan)
> > >
> > >  	list_for_each_entry_safe(desc, _desc, &descs, node) {
> > >  		list_del(&desc->node);
> > > +		dma_descriptor_unmap(&desc->async_tx);
> > >  		rcar_dmac_desc_put(chan, desc);
> > >  	}
> > >  }
> > > @@ -1654,6 +1655,7 @@ static irqreturn_t rcar_dmac_isr_channel_thread(int irq, void *dev)
> > >  		desc = list_first_entry(&chan->desc.done, struct rcar_dmac_desc,
> > >  					node);
> > >  		dma_cookie_complete(&desc->async_tx);
> > > +		dma_descriptor_unmap(&desc->async_tx);
> > 
> > Does callback function still use these data? suppose should unmap after
> > callback return.
> 
> Unmapping doesn't free the buffer, so I don't think accessing the buffer in the
> callback requires that order. Correct me if I misinterpret your point.

Yep, we are not freeing, we are unmapping from dma. This can be and should be
done here.
-- 
~Vinod
