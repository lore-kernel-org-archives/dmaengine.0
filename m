Return-Path: <SRS0=Ziga=4X=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F09FC10F25
	for <dmaengine@archiver.kernel.org>; Fri,  6 Mar 2020 13:34:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0B7A6208C3
	for <dmaengine@archiver.kernel.org>; Fri,  6 Mar 2020 13:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1583501673;
	bh=hRmFwmamlSWipAEUkvXt8mf5jo231W60hzTx+/ubc+Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=MUrqJprEk1LQeuK/6EvCGMDKI80f/UevChhAvXdBBz5NYRk5WKI+7Lg0Zqk4IanZN
	 M+Iu0gZUBEhOh5pr7Ab7S3JOes4sR6Wo1rRolw3kyW5Y2g6H+IZosuPwfizjrQ6/Qx
	 AadLATEB42ynFNas04iujMP2RqbbvEkgFM85Sp8c=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726194AbgCFNec (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Fri, 6 Mar 2020 08:34:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:55154 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726633AbgCFNeb (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Fri, 6 Mar 2020 08:34:31 -0500
Received: from localhost (unknown [122.178.250.113])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AADF820848;
        Fri,  6 Mar 2020 13:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583501671;
        bh=hRmFwmamlSWipAEUkvXt8mf5jo231W60hzTx+/ubc+Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cZlo3cAuc+z0+imsfQ6P2ZF/X0M0xOmU9hbdgYWHXgASLUek7YGgN+zx/MWlj6tVE
         v0o/Ii1QNtNdLFo0pexGfrUeiQOhmWDjYDf1CdEbl2RSUiyntxYUMPoeXb+3grRa0M
         PeamhMVWSUmv3bSitB76S2fag5cWQoPQ5561dpy0=
Date:   Fri, 6 Mar 2020 19:04:27 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Sebastian von Ohr <vonohr@smaract.com>,
        Appana Durga Kedareswara rao <appana.durga.rao@xilinx.com>,
        Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>
Cc:     dmaengine@vger.kernel.org
Subject: Re: [PATCH] dmaengine: xilinx_dma: Add missing check for empty list
Message-ID: <20200306133427.GG4148@vkoul-mobl>
References: <20200303130518.333-1-vonohr@smaract.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200303130518.333-1-vonohr@smaract.com>
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 03-03-20, 14:05, Sebastian von Ohr wrote:
> The DMA transfer might finish just after checking the state with
> dma_cookie_status, but before the lock is acquired. Not checking
> for an empty list in xilinx_dma_tx_status may result in reading
> random data or data corruption when desc is written to. This can
> be reliably triggered by using dma_sync_wait to wait for DMA
> completion.

Appana, Radhey can you please test this..?

> 
> Signed-off-by: Sebastian von Ohr <vonohr@smaract.com>
> ---
>  drivers/dma/xilinx/xilinx_dma.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
> index a9c5d5cc9f2b..5d5f1d0ce16c 100644
> --- a/drivers/dma/xilinx/xilinx_dma.c
> +++ b/drivers/dma/xilinx/xilinx_dma.c
> @@ -1229,16 +1229,16 @@ static enum dma_status xilinx_dma_tx_status(struct dma_chan *dchan,
>  		return ret;
>  
>  	spin_lock_irqsave(&chan->lock, flags);
> -
> -	desc = list_last_entry(&chan->active_list,
> -			       struct xilinx_dma_tx_descriptor, node);
> -	/*
> -	 * VDMA and simple mode do not support residue reporting, so the
> -	 * residue field will always be 0.
> -	 */
> -	if (chan->has_sg && chan->xdev->dma_config->dmatype != XDMA_TYPE_VDMA)
> -		residue = xilinx_dma_get_residue(chan, desc);
> -
> +	if (!list_empty(&chan->active_list)) {
> +		desc = list_last_entry(&chan->active_list,
> +				       struct xilinx_dma_tx_descriptor, node);
> +		/*
> +		 * VDMA and simple mode do not support residue reporting, so the
> +		 * residue field will always be 0.
> +		 */
> +		if (chan->has_sg && chan->xdev->dma_config->dmatype != XDMA_TYPE_VDMA)
> +			residue = xilinx_dma_get_residue(chan, desc);
> +	}
>  	spin_unlock_irqrestore(&chan->lock, flags);
>  
>  	dma_set_residue(txstate, residue);
> -- 
> 2.17.1

-- 
~Vinod
