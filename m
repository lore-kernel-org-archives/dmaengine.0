Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25AB844239F;
	Thu, 17 Sep 2026 07:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789629472; cv=none; b=K5x/xPSeDC/54jqEaNM/6Rq0clWPXoebLDelVw6NPJ8xCg2ruE9eLZ94wpHpj2/DEgi/FBQrDf/JQNuspzwp16H/2ah8+KyppZNOmnvqW4amPCl7I+5GqeO2/Uavn6NE/gqeGG6loEjPlweHPIa3Wi8Vegdaf4jI5gU1PLkMidI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789629472; c=relaxed/simple;
	bh=oJ69tRvLbrqeKFkiOby1ZSgsZ7Q/m1HelwCZqGy6c7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EABLAv47FgFv4Hne90Izro7vAEClfLImgXdEQ1O0QLW2sfeFXxoZhQ26MMuo1kFg95SgKjHTbdKNMiCzuihgt7CMWf7jffDw0XGHzQrsPIGNPRYS+/uOOoo4PPfccVxrY1lAVA534do6xt9N29IFVf3Cicpe3jv8fsxQKC7BMfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Lx8pPvfb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Lx8pPvfb"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9D1952C6;
	Thu, 17 Sep 2026 09:16:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789629364;
	bh=oJ69tRvLbrqeKFkiOby1ZSgsZ7Q/m1HelwCZqGy6c7A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lx8pPvfbUAC+xXBt/97E5ufS0rYZN6wCAHVlHaEvCwmW8rktTj0GLru+VvlJ5dqjM
	 2sRTaSWZOjjPRaFNgqP0LRfhOEUnEHbfWsSLU6DSJ7dbYAeEMBkP57L5kSmpzUNqea
	 eWXH7ly+cjy6V6wgI2jpdvOkintK+UmhZM1wnG8I=
Date: Thu, 17 Sep 2026 10:17:45 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Zhang Shurong <zhang_shurong@foxmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
	dmaengine@vger.kernel.org
Subject: Re: [PATCH 1/3] dmaengine: rcar-dmac: Fix PM usage counter imbalance
Message-ID: <20260917071745.GA4019@killaraus.ideasonboard.com>
References: <20260917071208.36888-1-wsa+renesas@sang-engineering.com>
 <20260917071208.36888-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260917071208.36888-2-wsa+renesas@sang-engineering.com>

On Thu, Sep 17, 2026 at 09:12:06AM +0200, Wolfram Sang wrote:
> From: Zhang Shurong <zhang_shurong@foxmail.com>
> 
> pm_runtime_get_sync will increment pm usage counter even it failed.
> Forgetting to putting operation will result in reference leak here. We
> fix it by replacing it with pm_runtime_resume_and_get to keep usage
> counter balanced.
> 
> Fixes: 87244fe5abdf ("dmaengine: rcar-dmac: Add Renesas R-Car Gen2 DMA Controller (DMAC) driver")
> Signed-off-by: Zhang Shurong <zhang_shurong@foxmail.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/dma/sh/rcar-dmac.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
> index 3ad8aba5dcd4..5b54f1c4ce15 100644
> --- a/drivers/dma/sh/rcar-dmac.c
> +++ b/drivers/dma/sh/rcar-dmac.c
> @@ -1070,7 +1070,7 @@ static int rcar_dmac_alloc_chan_resources(struct dma_chan *chan)
>  	if (ret < 0)
>  		return -ENOMEM;
>  
> -	return pm_runtime_get_sync(chan->device->dev);
> +	return pm_runtime_resume_and_get(chan->device->dev);
>  }
>  
>  static void rcar_dmac_free_chan_resources(struct dma_chan *chan)

-- 
Regards,

Laurent Pinchart
