Return-Path: <SRS0=i6BN=YQ=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C427FCA9EB9
	for <dmaengine@archiver.kernel.org>; Wed, 23 Oct 2019 19:00:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A0D2221928
	for <dmaengine@archiver.kernel.org>; Wed, 23 Oct 2019 19:00:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404281AbfJWTAj (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 23 Oct 2019 15:00:39 -0400
Received: from muru.com ([72.249.23.125]:39524 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2403979AbfJWTAj (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Wed, 23 Oct 2019 15:00:39 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id BD5A280CF;
        Wed, 23 Oct 2019 19:01:11 +0000 (UTC)
Date:   Wed, 23 Oct 2019 12:00:33 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
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
        dmaengine@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-omap@vger.kernel.org, giulio.benetti@benettiengineering.com,
        Sebastian Reichel <sre@kernel.org>,
        Skvortsov <andrej.skvortzov@gmail.com>,
        Yegor Yefremov <yegorslists@googlemail.com>
Subject: Re: [PATCH] dmaengine: cppi41: Fix cppi41_dma_prep_slave_sg() when
 idle
Message-ID: <20191023190033.GP5610@atomide.com>
References: <20191023153138.23442-1-tony@atomide.com>
 <6996a5de-215b-f9a2-1aeb-5eeed1b7cf8d@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6996a5de-215b-f9a2-1aeb-5eeed1b7cf8d@cogentembedded.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

* Sergei Shtylyov <sergei.shtylyov@cogentembedded.com> [191023 18:56]:
> On 10/23/2019 06:31 PM, Tony Lindgren wrote:
> > --- a/drivers/dma/ti/cppi41.c
> > +++ b/drivers/dma/ti/cppi41.c
> > @@ -586,9 +586,22 @@ static struct dma_async_tx_descriptor *cppi41_dma_prep_slave_sg(
> >  	enum dma_transfer_direction dir, unsigned long tx_flags, void *context)
> >  {
> >  	struct cppi41_channel *c = to_cpp41_chan(chan);
> > +	struct dma_async_tx_descriptor *txd = NULL;
> > +	struct cppi41_dd *cdd = c->cdd;
> >  	struct cppi41_desc *d;
> >  	struct scatterlist *sg;
> >  	unsigned int i;
> > +	int error;
> > +
> > +	error = pm_runtime_get(cdd->ddev.dev);
> > +	if (error < 0) {
> 
>    I'd call that variable 'status', comparison (error < 0) just doesn't look right.
> If it was *if* (error), it would have been more correct. 

Good suggestion, something to remember for next time.
In general error is widely used this way though:

$ git grep -A1 "error = " | grep "error < 0" | wc -l
425

Regards,

Tony

