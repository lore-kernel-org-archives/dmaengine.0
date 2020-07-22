Return-Path: <SRS0=c//p=BB=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6009C433E1
	for <dmaengine@archiver.kernel.org>; Wed, 22 Jul 2020 16:18:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B3CE5207BB
	for <dmaengine@archiver.kernel.org>; Wed, 22 Jul 2020 16:18:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="E5GA4aa9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726685AbgGVQSY (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 22 Jul 2020 12:18:24 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:50624 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726642AbgGVQSY (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Wed, 22 Jul 2020 12:18:24 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8DCA3329;
        Wed, 22 Jul 2020 18:18:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1595434702;
        bh=6wbBHGc8Q8bh+oi3uThJZ+oIHYQLXuzOYpYMfKUfjV4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=E5GA4aa9z9AKPGaB4Uegq/cka9gBok3OhaQ5gm3q8wNKwtcUiI+kS0XNIkJ1X/FfC
         U+d4wB28TtbhputGjIf4u3kJhz2/FnXUTo2r0pN0c+ArqJDhDHfeWEsDbsY5oCxLhY
         y4SVSqzz0gTXUmBoJnSqFXm4ig30BT0fTGoGu8nM=
Date:   Wed, 22 Jul 2020 19:18:17 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     dmaengine@vger.kernel.org, Hyun Kwon <hyun.kwon@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH 3/3] dmaengine: xilinx: dpdma: fix kernel doc format
Message-ID: <20200722161817.GM29813@pendragon.ideasonboard.com>
References: <20200718135201.191881-1-vkoul@kernel.org>
 <20200718135201.191881-3-vkoul@kernel.org>
 <20200722131119.GH5833@pendragon.ideasonboard.com>
 <20200722142608.GR12965@vkoul-mobl>
 <20200722145127.GC29813@pendragon.ideasonboard.com>
 <20200722145435.GS12965@vkoul-mobl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200722145435.GS12965@vkoul-mobl>
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On Wed, Jul 22, 2020 at 08:24:35PM +0530, Vinod Koul wrote:
> On 22-07-20, 17:51, Laurent Pinchart wrote:
> 
> > > W=1 build again..
> > 
> > I get the same when plumbing the source file into the kerneldoc build.
> > The generated documentation however contains the description of both
> > desc.pending and desc.active. If you want to fix the warning, I think
> > you should instead add a line to document @desc, but without removing
> > the existing @desc.pending and @desc.active lines.
> 
> I would like to see clean build with W=1, helps to find other issues :)
> So do feel free to send the patch to fix this, i will swap them..

Done, see "[PATCH] dmaengine: xilinx: dpdma: Fix kerneldoc warning".

-- 
Regards,

Laurent Pinchart
