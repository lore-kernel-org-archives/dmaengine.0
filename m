Return-Path: <SRS0=1HPK=AK=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D599C433E1
	for <dmaengine@archiver.kernel.org>; Mon, 29 Jun 2020 23:40:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5EF48206F1
	for <dmaengine@archiver.kernel.org>; Mon, 29 Jun 2020 23:40:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mKsZW0cA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728334AbgF2XkB (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 29 Jun 2020 19:40:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728255AbgF2XkA (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Mon, 29 Jun 2020 19:40:00 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46A24C061755
        for <dmaengine@vger.kernel.org>; Mon, 29 Jun 2020 16:40:00 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8EDA9299;
        Tue, 30 Jun 2020 01:39:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1593473999;
        bh=QiXE5PrS9PfATm8FSp7IaRgY2XZuN9Xyl1+5wW4ZiAU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mKsZW0cALv8x7pfIOKJ50Kt++oVjgnSuNPD/AlhuVxQ+m92XAjDCTD3jOIB7AHY9t
         C/ojqCB5IoFmGDm0KLVoMIrdpCKeLsaRJvGdv18pv/3S48zcy57BRgMoQirSWL50bW
         5J+0l7freG/95hTEtaLIkVS6vC9ai6cOzVGjNVb8=
Date:   Tue, 30 Jun 2020 02:39:54 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     dmaengine@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Tejas Upadhyay <tejasu@xilinx.com>,
        Satish Kumar Nagireddy <SATISHNA@xilinx.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v5 0/6] dma: Add Xilinx ZynqMP DPDMA driver
Message-ID: <20200629233954.GH21452@pendragon.ideasonboard.com>
References: <20200528025228.31638-1-laurent.pinchart@ideasonboard.com>
 <20200629093041.GE6012@pendragon.ideasonboard.com>
 <20200629095647.GI2599@vkoul-mobl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200629095647.GI2599@vkoul-mobl>
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

Hi Vinod,

On Mon, Jun 29, 2020 at 03:26:47PM +0530, Vinod Koul wrote:
> On 29-06-20, 12:30, Laurent Pinchart wrote:
> > Hi Vinod,
> > 
> > CC'ing Greg.
> > 
> > The first version of this patch series I've posted dates back from early
> > November last year. Could you please help getting it merged ?
> 
> Sorry for the delay in reviewing this series, this one is on my review
> list for this week, so I should get to this  very soon.

Thank you.

> > On Thu, May 28, 2020 at 05:52:22AM +0300, Laurent Pinchart wrote:
> > > Hello,
> > > 
> > > This patch series adds a new driver for the DPDMA engine found in the
> > > Xilinx ZynqMP.
> > > 
> > > The previous version can be found at [1]. All review comments have been
> > > taken into account. The only change is the addition of the
> > > DMA_PREP_LOAD_EOT transaction flag (and the corresponding DMA_LOAD_EOT
> > > capability bit), as requested during the review of v4. Please see the
> > > discussions from v4 for the rationale.
> > > 
> > > The driver has been successfully tested with the ZynqMP DisplayPort
> > > subsystem DRM driver.
> > > 
> > > [1] https://lore.kernel.org/dmaengine/20200513165943.25120-1-laurent.pinchart@ideasonboard.com/
> > > 
> > > Hyun Kwon (1):
> > >   dmaengine: xilinx: dpdma: Add the Xilinx DisplayPort DMA engine driver
> > > 
> > > Laurent Pinchart (5):
> > >   dt: bindings: dma: xilinx: dpdma: DT bindings for Xilinx DPDMA
> > >   dmaengine: virt-dma: Use lockdep to check locking requirements
> > >   dmaengine: Add support for repeating transactions
> > >   dmaengine: xilinx: dpdma: Add debugfs support
> > >   arm64: dts: zynqmp: Add DPDMA node
> > > 
> > >  .../dma/xilinx/xlnx,zynqmp-dpdma.yaml         |   68 +
> > >  MAINTAINERS                                   |    9 +
> > >  .../arm64/boot/dts/xilinx/zynqmp-clk-ccf.dtsi |    4 +
> > >  arch/arm64/boot/dts/xilinx/zynqmp.dtsi        |   10 +
> > >  drivers/dma/Kconfig                           |   10 +
> > >  drivers/dma/virt-dma.c                        |    2 +
> > >  drivers/dma/virt-dma.h                        |   10 +
> > >  drivers/dma/xilinx/Makefile                   |    1 +
> > >  drivers/dma/xilinx/xilinx_dpdma.c             | 1782 +++++++++++++++++
> > >  include/dt-bindings/dma/xlnx-zynqmp-dpdma.h   |   16 +
> > >  include/linux/dmaengine.h                     |   19 +
> > >  11 files changed, 1931 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dpdma.yaml
> > >  create mode 100644 drivers/dma/xilinx/xilinx_dpdma.c
> > >  create mode 100644 include/dt-bindings/dma/xlnx-zynqmp-dpdma.h

-- 
Regards,

Laurent Pinchart
