Return-Path: <SRS0=tuOs=YH=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99B37C4CECE
	for <dmaengine@archiver.kernel.org>; Mon, 14 Oct 2019 08:21:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 66D6D20663
	for <dmaengine@archiver.kernel.org>; Mon, 14 Oct 2019 08:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571041293;
	bh=VF/qUyUlkg14sD+rbRC1ADnzlaEJc7WTleaClfnngbk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=njGdncxUh5gUQc2wqvTEnuRfq8I0kBxfxPiCkkLj35Rq15WN9+GzddslXBHgfjeRF
	 10+S5a4hmQj+czowS/8iyx2me/DsOYQHyrYYZf3hJNoJwBgJBE0OOLv/p1CrhFIdpj
	 QK7mbWvpy2UBib32LCSpsXwOUnzEGg5WjvvAO+nc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730366AbfJNIVd (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 14 Oct 2019 04:21:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:55628 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729923AbfJNIVc (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Mon, 14 Oct 2019 04:21:32 -0400
Received: from localhost (unknown [122.167.124.160])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B8B3E20663;
        Mon, 14 Oct 2019 08:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571041292;
        bh=VF/qUyUlkg14sD+rbRC1ADnzlaEJc7WTleaClfnngbk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BhRTWGesqyOsOpc1S26MgfC6gIv4xVvtFReoAEmOShlxnyQH3vOop3M2gPdqmoZa3
         ontM5IANOa8oAIUm4w59D8M4Ppugbo9+n/b5TGzjXl+YnsspfRYfcaykYOxxQaZnfU
         TTZ6UIYUjY+UO3bYFZcSdYYxHWkfURgkscSqRzXQ=
Date:   Mon, 14 Oct 2019 13:51:28 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Viresh Kumar <vireshk@kernel.org>, dmaengine@vger.kernel.org
Subject: Re: [PATCH v1] dmaengine: dw: platform: Mark 'hclk' clock optional
Message-ID: <20191014082128.GN2654@vkoul-mobl>
References: <20190924085116.83683-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190924085116.83683-1-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 24-09-19, 11:51, Andy Shevchenko wrote:
> On some platforms the clock can be fixed rate, always running one and
> there is no need to do anything with it.
> 
> In order to support those platforms, switch to use optional clock.
> 
> Fixes: f8d9ddbc2851 ("Enable iDMA 32-bit on Intel Elkhart Lake")

My script complained the Fixes doesnt match, you seem to have omitted
the subsystem and driver name tags from this line.

I have fixed that and applied

> Depends-on: 60b8f0ddf1a9 ("clk: Add (devm_)clk_get_optional() functions")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/dma/dw/platform.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma/dw/platform.c b/drivers/dma/dw/platform.c
> index 6a94f22b6637..bffc79a620ae 100644
> --- a/drivers/dma/dw/platform.c
> +++ b/drivers/dma/dw/platform.c
> @@ -66,7 +66,7 @@ static int dw_probe(struct platform_device *pdev)
>  
>  	data->chip = chip;
>  
> -	chip->clk = devm_clk_get(chip->dev, "hclk");
> +	chip->clk = devm_clk_get_optional(chip->dev, "hclk");
>  	if (IS_ERR(chip->clk))
>  		return PTR_ERR(chip->clk);
>  	err = clk_prepare_enable(chip->clk);
> -- 
> 2.23.0

-- 
~Vinod
