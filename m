Return-Path: <SRS0=oONL=Z3=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49F20C43603
	for <dmaengine@archiver.kernel.org>; Thu,  5 Dec 2019 16:39:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1B3D224648
	for <dmaengine@archiver.kernel.org>; Thu,  5 Dec 2019 16:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1575563956;
	bh=VDa0X91Y/5oogK6rU3G7kmUVK77HXoQ52Qsok/xKKXQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=nIVIVnSfNK7FCRU3x0iHrAAPZki9Envy5hoAEqBinlzGA0V1t+hC2+jIob2ApX8+J
	 b8i25lU2HMfCeoxqmYXD2lePq2HsglSDy0nNSjJROYNKa4RHj3qrOw6Awx9YYnTALO
	 JMq7bshNDux0ELdUic1to3BMkX0Nc4Ozgy117VRM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726257AbfLEQjP (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Thu, 5 Dec 2019 11:39:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:56112 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726028AbfLEQjP (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Thu, 5 Dec 2019 11:39:15 -0500
Received: from localhost (unknown [122.167.100.68])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D0BCE22525;
        Thu,  5 Dec 2019 16:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575563954;
        bh=VDa0X91Y/5oogK6rU3G7kmUVK77HXoQ52Qsok/xKKXQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bF4FCBk61TT82aDVfw8uq+wIMbV48UkRAZcg2HdVAkNpl80oRl2v35IaDI30WRcV6
         mUr5f7ptHiAEKFqZ4FW6nvFiOJNGDmrQaY+nirbwTIZOe4SUUBRsmVnSJmT0gW0rrl
         PAEZ99jkDIzQnbmgFunBnemWkOa4GilMjWoyLHNc=
Date:   Thu, 5 Dec 2019 22:09:09 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     dmaengine@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Tejas Upadhyay <tejasu@xilinx.com>,
        Satish Kumar Nagireddy <SATISHNA@xilinx.com>
Subject: Re: [PATCH v2 2/4] dma: xilinx: dpdma: Add the Xilinx DisplayPort
 DMA engine driver
Message-ID: <20191205163909.GH82508@vkoul-mobl>
References: <20191107021400.16474-1-laurent.pinchart@ideasonboard.com>
 <20191107021400.16474-3-laurent.pinchart@ideasonboard.com>
 <20191109175908.GI952516@vkoul-mobl>
 <20191205150407.GL4734@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191205150407.GL4734@pendragon.ideasonboard.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

Hi Laurent,

On 05-12-19, 17:04, Laurent Pinchart wrote:
> > > +/*
> > > + * DPDMA descriptor placement
> > > + * --------------------------
> > > + * DPDMA descritpor life time is described with following placements:
> > > + *
> > > + * allocated_desc -> submitted_desc -> pending_desc -> active_desc -> done_list
> > > + *
> > > + * Transition is triggered as following:
> > > + *
> > > + * -> allocated_desc : a descriptor allocation
> > > + * allocated_desc -> submitted_desc: a descriptor submission
> > > + * submitted_desc -> pending_desc: request to issue pending a descriptor
> > > + * pending_desc -> active_desc: VSYNC intr when a desc is scheduled to DPDMA
> > > + * active_desc -> done_list: VSYNC intr when DPDMA switches to a new desc
> > 
> > Well this tells me driver is not using vchan infrastructure, the
> > drivers/dma/virt-dma.c is common infra which does pretty decent list
> > management and drivers do not need to open code this.
> > 
> > Please convert the driver to use virt-dma
> 
> As noted in the cover letter,
> 
> "There is one review comment that is still pending: switching to
> virt-dma. I started investigating this, and it quickly appeared that
> this would result in an almost complete rewrite of the driver's logic.
> While the end result may be better, I wonder if this is worth it, given
> that the DPDMA is tied to the DisplayPort subsystem and can't be used
> with other DMA slaves. The DPDMA is thus used with very specific usage
> patterns, which don't need the genericity of descriptor handling
> provided by virt-dma. Vinod, what's your opinion on this ? Is virt-dma
> usage a blocker to merge this driver, could we switch to it later, or is
> it just overkill in this case ?"
> 
> I'd like to ask an additional question : is the dmaengine API the best
> solution for this ? The DPDMA is a separate IP core, but it is tied with
> the DP subsystem. I'm tempted to just fold it in the display driver. The
> only reason why I'm hesitant on this is that the DPDMA also handles
> audio channels, that are also part of the DP subsystem, but that could
> be handled by a separate ALSA driver. Still, handling display, audio and
> DMA in drivers that we pretend are independent and generic would be a
> bit of a lie.

Yeah if it is _only_ going to be used in display and no other client
using it, then I really do not see any advantage of this being a
dmaengine driver. That is pretty much we have been telling folks over
the years.

Btw since this is xilinx and I guess everything is an IP how difficult
would it be to put this on a non display core :)

If you decide to use dmaengine I would prefer it use virt-dma that mean
rewrite yes but helps you term

-- 
~Vinod
