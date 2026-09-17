Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B44C363C48;
	Thu, 17 Sep 2026 07:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789630713; cv=none; b=gWk5SvYR9qGpztOZeWvxid1GTQPqouX5yGaqeB+95TEKQNVHSRSVdxbRSklQDnIPtqwOXOm8hghE/E/F86U5HeWV64eTwu2jtlt47ZvOGrV6/oGJxmfg9ZJK0ihSrCvsbzVhJh/K07UPHQRbvl1I0LGEnFCm225vAtppJB4Xfp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789630713; c=relaxed/simple;
	bh=qR2yxKsMcta+ewKq1D4+OkktBVgomhX0bdrqZ2TQa+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gNe3EfQxq61IxJnrdbgl2JzNisdVQ+Lv7Kc8CatOrIS16Ae4Z/wh7EB39shYJ/OTCfJxUfViIDZ+pVjvN5gG3D8YceHrOs06btfIMnQOdhVZdyk0U0IxOQV6rna6nSe4xV5TZhZueo/lNnZH6y8L57Hq9dF4sBb5PizcOuTSW6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UZe3cPsg; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UZe3cPsg"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6811E324;
	Thu, 17 Sep 2026 09:36:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789630605;
	bh=qR2yxKsMcta+ewKq1D4+OkktBVgomhX0bdrqZ2TQa+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UZe3cPsgxIjDYVSq1Zl6sg9M+YlZxvb9XsOAhTpKyzKo3gfkOy6jGRq9L8/ZFfCB9
	 aoSpv83RIPl2xBKPLODYvqSaIBth6XHElJwrP/ql4qPT+fimMRuzNYePyR9wnuyP7q
	 OeNCWDL+ScWfbu6s+cqIJ+OSw0MeI6Olpwc+VPkQ=
Date: Thu, 17 Sep 2026 10:38:25 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Koichiro Den <den@valinux.co.jp>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, dmaengine@vger.kernel.org
Subject: Re: [PATCH 2/3] dmaengine: rcar-dmac: Add missing
 dma_descriptor_unmap()
Message-ID: <20260917073825.GB4019@killaraus.ideasonboard.com>
References: <20260917071208.36888-1-wsa+renesas@sang-engineering.com>
 <20260917071208.36888-3-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260917071208.36888-3-wsa+renesas@sang-engineering.com>

On Thu, Sep 17, 2026 at 09:12:07AM +0200, Wolfram Sang wrote:
> From: Koichiro Den <den@valinux.co.jp>
> 
> Call dma_descriptor_unmap() right after dma_cookie_complete() in the
> threaded IRQ completion path. Without this, streaming DMA mappings
> attached to the descriptor are never released and may eventually exhaust
> DMA mapping resources (e.g. IOVA with an IOMMU or bounce-buffer slots
> with SWIOTLB), leading to dma_map_* failures.

That looks like a horrible API. It pushes a requirement onto drivers to
clean up something done by clients, and is completely undocumented.
Can't those calls be moved somewhere in the DMA engine core ?

> Also ensure dma_descriptor_unmap() is called in rcar_dmac_chan_reinit()
> (error/terminate path) to avoid the same type of leaks.
> 
> Fixes: 87244fe5abdf ("dmaengine: rcar-dmac: Add Renesas R-Car Gen2 DMA Controller (DMAC) driver")
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> [wsa: added Fixes tag]
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/dma/sh/rcar-dmac.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
> index 5b54f1c4ce15..9155bceb723b 100644
> --- a/drivers/dma/sh/rcar-dmac.c
> +++ b/drivers/dma/sh/rcar-dmac.c
> @@ -844,6 +844,7 @@ static void rcar_dmac_chan_reinit(struct rcar_dmac_chan *chan)
>  
>  	list_for_each_entry_safe(desc, _desc, &descs, node) {
>  		list_del(&desc->node);
> +		dma_descriptor_unmap(&desc->async_tx);
>  		rcar_dmac_desc_put(chan, desc);
>  	}
>  }
> @@ -1654,6 +1655,7 @@ static irqreturn_t rcar_dmac_isr_channel_thread(int irq, void *dev)
>  		desc = list_first_entry(&chan->desc.done, struct rcar_dmac_desc,
>  					node);
>  		dma_cookie_complete(&desc->async_tx);
> +		dma_descriptor_unmap(&desc->async_tx);
>  		list_del(&desc->node);
>  
>  		dmaengine_desc_get_callback(&desc->async_tx, &cb);

-- 
Regards,

Laurent Pinchart
