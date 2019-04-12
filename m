Return-Path: <SRS0=jDKn=SO=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 789E2C10F0E
	for <dmaengine@archiver.kernel.org>; Fri, 12 Apr 2019 09:54:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 46EFF20850
	for <dmaengine@archiver.kernel.org>; Fri, 12 Apr 2019 09:54:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PmKT+1RB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726735AbfDLJyL (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Fri, 12 Apr 2019 05:54:11 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:38538 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726711AbfDLJyL (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Fri, 12 Apr 2019 05:54:11 -0400
Received: from pendragon.ideasonboard.com (unknown [IPv6:2a02:a03f:4440:2800:43de:b524:bf87:f821])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E8299549;
        Fri, 12 Apr 2019 11:54:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1555062850;
        bh=0YE7BeADDF/hw9Q//zKYfamrQgUHriRex7uQgTESQJ4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PmKT+1RBLKROfPNYwK3QsKQbkLqJ5FQwGbnxKxaGixr44GdCMsu3cbofM3Gpv6knN
         LuaJeRA+KgM3OaSK993kAl14cQ+jS/XnHIGF9cu4zPxai/HY9EsVMzXCVXsFwU9yAr
         EEsmK0hUcvYV+dDtgGb6Ge6AWkcIIsHiErUjSLLk=
Date:   Fri, 12 Apr 2019 12:54:00 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dirk Behme <dirk.behme@de.bosch.com>
Cc:     linux-renesas-soc@vger.kernel.org, dmaengine@vger.kernel.org,
        vkoul@kernel.org, geert+renesas@glider.be,
        niklas.soderlund+renesas@ragnatech.se,
        laurent.pinchart+renesas@ideasonboard.com,
        Achim.Dahlhoff@de.bosch.com, yoshihiro.shimoda.uh@renesas.com,
        ylhuajnu@outlook.com, hiroyuki.yokoyama.vx@renesas.com,
        kuninori.morimoto.gx@renesas.com, stable@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dmaengine: sh: rcar-dmac: With cyclic DMA residue
 0 is valid
Message-ID: <20190412095400.GB4897@pendragon.ideasonboard.com>
References: <20190412052914.16006-1-dirk.behme@de.bosch.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <20190412052914.16006-1-dirk.behme@de.bosch.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org
Message-ID: <20190412095400.aLE8SIqbNN3adxKysR_GVfgtvQnvx6-ZDO7wfAZ3nSQ@z>

Hi Dirk,

Thank you for the patch.

On Fri, Apr 12, 2019 at 07:29:13AM +0200, Dirk Behme wrote:
> Having a cyclic DMA, a residue 0 is not an indication of a completed
> DMA. In case of cyclic DMA make sure that dma_set_residue() is called
> and with this a residue of 0 is forwarded correctly to the caller.
> 
> Fixes: 3544d2878817 ("dmaengine: rcar-dmac: use result of updated get_residue in tx_status")
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
> Signed-off-by: Achim Dahlhoff <Achim.Dahlhoff@de.bosch.com>
> Signed-off-by: Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
> Signed-off-by: Yao Lihua <ylhuajnu@outlook.com>
> Cc: <stable@vger.kernel.org> # v4.8+

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Note: Patch done against mainline v5.0
> 
> Changes in v2: None
> 
> Changes in v3: Move reading rchan into the spin lock protection.
> 
>  drivers/dma/sh/rcar-dmac.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
> index 2b4f25698169..54810ffd95e2 100644
> --- a/drivers/dma/sh/rcar-dmac.c
> +++ b/drivers/dma/sh/rcar-dmac.c
> @@ -1368,6 +1368,7 @@ static enum dma_status rcar_dmac_tx_status(struct dma_chan *chan,
>  	enum dma_status status;
>  	unsigned long flags;
>  	unsigned int residue;
> +	bool cyclic;
>  
>  	status = dma_cookie_status(chan, cookie, txstate);
>  	if (status == DMA_COMPLETE || !txstate)
> @@ -1375,10 +1376,11 @@ static enum dma_status rcar_dmac_tx_status(struct dma_chan *chan,
>  
>  	spin_lock_irqsave(&rchan->lock, flags);
>  	residue = rcar_dmac_chan_get_residue(rchan, cookie);
> +	cyclic = rchan->desc.running ? rchan->desc.running->cyclic : false;
>  	spin_unlock_irqrestore(&rchan->lock, flags);
>  
>  	/* if there's no residue, the cookie is complete */
> -	if (!residue)
> +	if (!residue && !cyclic)
>  		return DMA_COMPLETE;
>  
>  	dma_set_residue(txstate, residue);

-- 
Regards,

Laurent Pinchart
