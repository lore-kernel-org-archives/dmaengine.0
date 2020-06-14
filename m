Return-Path: <SRS0=q0tK=73=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD8E0C433DF
	for <dmaengine@archiver.kernel.org>; Sun, 14 Jun 2020 15:38:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 88D32207BC
	for <dmaengine@archiver.kernel.org>; Sun, 14 Jun 2020 15:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1592149116;
	bh=M3DrH1ytsKdjqL9lY47ZOY5fFfRmJ4W3MUub2aQIb2w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Ue1qHpa3gSNCbm2oOHJCAuaSgwalUhHWUp7SJsWc1pUFM5YGxr6IZepL2EhSEiwN+
	 BHlKE4hoh6+A1ygqZF09s2FIHa8lmx2hAWZGRirz4AsaJSpGV/rUvZSBtUyCYMMqFw
	 LhJ+6MN8mx3SJ7WTrpP/ZqDB2ob+0EQseM3Q2RgA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726844AbgFNPig (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Sun, 14 Jun 2020 11:38:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:56050 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726717AbgFNPig (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Sun, 14 Jun 2020 11:38:36 -0400
Received: from localhost (unknown [171.61.66.58])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A8B7E2078A;
        Sun, 14 Jun 2020 15:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592149115;
        bh=M3DrH1ytsKdjqL9lY47ZOY5fFfRmJ4W3MUub2aQIb2w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Xt+E9nOZeV0trQdsqtSfvBodWSWH69XjUg6l4FzeoUGWoKbg80nx386fEHXgqzMUk
         /2sSEYwBPR+7Y5wAqmIQZe7h4aHtHpG2khFd7GEqBlleI8idlW5Zf7vL1S99w8nvw0
         MCThowa6gKUuK6NNiLUfgOoVtGaXibzc4C4vkehI=
Date:   Sun, 14 Jun 2020 21:08:30 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Marek Vasut <marex@denx.de>
Cc:     dmaengine@vger.kernel.org, Akinobu Mita <akinobu.mita@gmail.com>,
        Kedareswara rao Appana <appana.durga.rao@xilinx.com>,
        Michal Simek <monstr@monstr.eu>,
        Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH] dmaengine: xilinx: Add empty device_config function
Message-ID: <20200614153830.GI1393454@vkoul-mobl>
References: <20200613145842.113671-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200613145842.113671-1-marex@denx.de>
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 13-06-20, 16:58, Marek Vasut wrote:
> Various DMA users call the dmaengine_slave_config() and expect it to
> succeed, but that can only succeed if .device_config is implemented.
> Add empty device_config function rather than patching all the places
> which use dmaengine_slave_config().
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Akinobu Mita <akinobu.mita@gmail.com>
> Cc: Kedareswara rao Appana <appana.durga.rao@xilinx.com>
> Cc: Michal Simek <monstr@monstr.eu>
> Cc: Vinod Koul <vinod.koul@intel.com>

Umm, you should look up get_maintainers.pl to get right addresses :-)

> ---
>  drivers/dma/xilinx/xilinx_dma.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
> index 5429497d3560b..058150ff9e0d9 100644
> --- a/drivers/dma/xilinx/xilinx_dma.c
> +++ b/drivers/dma/xilinx/xilinx_dma.c
> @@ -1637,6 +1637,17 @@ static void xilinx_dma_issue_pending(struct dma_chan *dchan)
>  	spin_unlock_irqrestore(&chan->lock, flags);
>  }
>  
> +/**
> + * xilinx_dma_issue_pending - Configure the DMA channel
> + * @dchan: DMA channel
> + * @config: channel configuration
> + */
> +static int xilinx_dma_device_config(struct dma_chan *dchan,
> +				    struct dma_slave_config *config)
> +{
> +	return 0;
> +}

NAK, the driver supports slave ops so it does not make sense for this to
be dummy, right fix would be to use these params for configuring dma
correctly

-- 
~Vinod
