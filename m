Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E17CAC433DB
	for <dmaengine@archiver.kernel.org>; Mon,  1 Feb 2021 10:02:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9276860295
	for <dmaengine@archiver.kernel.org>; Mon,  1 Feb 2021 10:02:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232975AbhBAKBq (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 1 Feb 2021 05:01:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:58040 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232363AbhBAKBo (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Mon, 1 Feb 2021 05:01:44 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 97EAA60295;
        Mon,  1 Feb 2021 10:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612173663;
        bh=btVHL1DJLmmuNZh6ac5ScgPwCn7LgJYpYj0NJXJ9yQs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HEMtuW1Lx4yqoHayQ4aQkG08V9CdG9TemoiVeNyxMYhJxz1bQys9FxMLjHLaMV7e4
         zDkk/aMdX7Zqgu6azxSl0BvY1D7aH7rf6W1A3pkpRNlaDWI20lrhnO4bnHz2HO/PrL
         F5db+MS/rhevczkisUbGtugxojNVLEFv2PvyYtlG9kUKvRLrFM3NQVQwhH018xuPqL
         Q3wrBUkbid+Bx9dR40SQ7jZYswn3bMAv3AFolPu5x14cslXK05pNhkTsRRzVScuAbt
         V5TiXH5wYVCX+zEL5i8NLhlGyi/iUOrEupY/Wg9jvER2pI4RSnzStIUM8VZ3c0u8/G
         93Mm+xVdyxFkA==
Date:   Mon, 1 Feb 2021 15:30:59 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Guanhua Gao <guanhua.gao@nxp.com>
Cc:     Dan Williams <dan.j.williams@intel.com>, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dmaengine: fsl-dpaa2-qdma: Fix the size of dma pools
Message-ID: <20210201100059.GQ2771@vkoul-mobl>
References: <20201217092327.11473-1-guanhua.gao@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201217092327.11473-1-guanhua.gao@nxp.com>
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 17-12-20, 17:23, Guanhua Gao wrote:
> In case of long format of qDMA command descriptor, there are one frame
> descriptor, three entries in the frame list and two data entries. So the
> size of dma_pool_create for these three fields should be the same with
> the total size of entries respectively, or the contents may be overwritten
> by the next allocated descriptor.
> 
> Signed-off-by: Guanhua Gao <guanhua.gao@nxp.com>
> ---
>  drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.c b/drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.c
> index 4ec909e..bc5baa6 100644
> --- a/drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.c
> +++ b/drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.c
> @@ -38,15 +38,17 @@ static int dpaa2_qdma_alloc_chan_resources(struct dma_chan *chan)
>  	if (!dpaa2_chan->fd_pool)
>  		goto err;
>  
> -	dpaa2_chan->fl_pool = dma_pool_create("fl_pool", dev,
> -					      sizeof(struct dpaa2_fl_entry),
> -					      sizeof(struct dpaa2_fl_entry), 0);
> +	dpaa2_chan->fl_pool =
> +		dma_pool_create("fl_pool", dev,
> +				 sizeof(struct dpaa2_fl_entry) * 3,
> +				 sizeof(struct dpaa2_fl_entry), 0);
> +

Can you add comments here as well (like you have for changelog above)
describing why we need 3 times dpaa2_fl_entry


>  	if (!dpaa2_chan->fl_pool)
>  		goto err_fd;
>  
>  	dpaa2_chan->sdd_pool =
>  		dma_pool_create("sdd_pool", dev,
> -				sizeof(struct dpaa2_qdma_sd_d),
> +				sizeof(struct dpaa2_qdma_sd_d) * 2,
>  				sizeof(struct dpaa2_qdma_sd_d), 0);
>  	if (!dpaa2_chan->sdd_pool)
>  		goto err_fl;
> -- 
> 2.7.4

-- 
~Vinod
