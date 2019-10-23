Return-Path: <SRS0=i6BN=YQ=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9A9ECA9EB6
	for <dmaengine@archiver.kernel.org>; Wed, 23 Oct 2019 15:52:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C092921A4A
	for <dmaengine@archiver.kernel.org>; Wed, 23 Oct 2019 15:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571845957;
	bh=gw+u2oDxao9S2OF9vDMVHJXR1sZpwCsxQL+71vaNdXA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=ftZZx7hGCGKIcm7qu2xYeZEevTPMy7hODjNdq9ZcBFRKlkf/XwJI36Wglmb3EOTts
	 NDPnaJ8pDJ04ZhXZKcezhi4t8d7/TTZIIWpuWwji8fXR7mmgudT5RA49DqNhZOO8MM
	 6DAl/cYFg5AUqD4Hz/LlQHxjOE2bU/XxHVBspmsA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390925AbfJWPwh (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 23 Oct 2019 11:52:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:40588 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390909AbfJWPwg (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Wed, 23 Oct 2019 11:52:36 -0400
Received: from localhost (unknown [122.181.210.10])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D58C220679;
        Wed, 23 Oct 2019 15:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571845955;
        bh=gw+u2oDxao9S2OF9vDMVHJXR1sZpwCsxQL+71vaNdXA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=n6oem8MVv8qFbVXjuuk8lYoQjHeKNKEUbjKgmjPgh9NnWMgkQqnE1w91Zjd4v2P+m
         ST7+KtZ2qUQCJMXvxbWBW80lyXoP8Z2bSi5GVTSbQQKjjk41FBesVs1Gkf1nZjzrbo
         P2zTiE8t4vbIzOgpazRcSm2hrdy/+6YUFJ8i2sSw=
Date:   Wed, 23 Oct 2019 21:22:28 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Dan Williams <dan.j.williams@intel.com>,
        Vinod Koul <vinod.koul@intel.com>,
        Alexandre Bailon <abailon@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Bin Liu <b-liu@ti.com>, Daniel Mack <zonque@gmail.com>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        George Cherian <george.cherian@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Johan Hovold <johan@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Sekhar Nori <nsekhar@ti.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        dmaengine@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-omap@vger.kernel.org, giulio.benetti@benettiengineering.com,
        Sebastian Reichel <sre@kernel.org>,
        Skvortsov <andrej.skvortzov@gmail.com>,
        Yegor Yefremov <yegorslists@googlemail.com>
Subject: Re: [PATCH] dmaengine: cppi41: Fix cppi41_dma_prep_slave_sg() when
 idle
Message-ID: <20191023154759.GT2654@vkoul-mobl>
References: <20191023153138.23442-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191023153138.23442-1-tony@atomide.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 23-10-19, 08:31, Tony Lindgren wrote:
> Yegor Yefremov <yegorslists@googlemail.com> reported that musb and ftdi
> uart can fail for the first open of the uart unless connected using
> a hub.
> 
> This is because the first dma call done by musb_ep_program() must wait
> if cppi41 is PM runtime suspended. Otherwise musb_ep_program() continues
> with other non-dma packets before the DMA transfer is started causing at
> least ftdi uarts to fail to receive data.
> 
> Let's fix the issue by waking up cppi41 with PM runtime calls added to
> cppi41_dma_prep_slave_sg() and return NULL if still idled. This way we
> have musb_ep_program() continue with PIO until cppi41 is awake.

Applied and tagged stable, thanks
-- 
~Vinod
