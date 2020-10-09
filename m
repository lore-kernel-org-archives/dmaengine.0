Return-Path: <SRS0=mVlT=DQ=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F649C433DF
	for <dmaengine@archiver.kernel.org>; Fri,  9 Oct 2020 10:31:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3CB7A22276
	for <dmaengine@archiver.kernel.org>; Fri,  9 Oct 2020 10:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602239493;
	bh=f+JFODbuMo6NgQLOtF1ipvzfyu/s0e5oFG5MSBSu8SQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=OBoVGA6mKwFB4NjKoMgfMbQ+qupeNTSAqiUOqT6IBNWVrbUgC27XhQle5cb1wtslI
	 /CIwyO6euvMBkJhIgDpWELisZMMMAon+x/d4oFvV80/ei5ElmdQkBFjc9sOFc3ecP0
	 sChMMatQ45dRGZiXEQjE1piFvXq5A+U/EZjxJjEU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387676AbgJIKb2 (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Fri, 9 Oct 2020 06:31:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:51738 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387661AbgJIKb2 (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Fri, 9 Oct 2020 06:31:28 -0400
Received: from localhost (unknown [122.182.251.219])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 521712226B;
        Fri,  9 Oct 2020 10:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602239487;
        bh=f+JFODbuMo6NgQLOtF1ipvzfyu/s0e5oFG5MSBSu8SQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KhqfRslioSlIzFPVb6k4Zo+49DFYSBi/8ITfjue0qTc+D0Wr5NTeoXqG2yfYdPHyN
         G8mkT6KzbKPHDYrT/X6sn4KsQNgo7w/ox+OuYUvH7SGwP9mg2R0SwSc+mJkj680IQD
         IwKC8gZF5YvJKVklknHGDXqorMXNJbg2jpNlGb2I=
Date:   Fri, 9 Oct 2020 16:01:23 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc:     dmaengine@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] dmaengine: qcom: Add GPI dma driver
Message-ID: <20201009103123.GE2968@vkoul-mobl>
References: <20201008123151.764238-1-vkoul@kernel.org>
 <20201008123151.764238-4-vkoul@kernel.org>
 <6d6b4bf8-5610-f1cb-8c9d-f4bb82c93bdb@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6d6b4bf8-5610-f1cb-8c9d-f4bb82c93bdb@ti.com>
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 09-10-20, 12:00, Peter Ujfalusi wrote:
> Hi Vinod,
> 
> On 08/10/2020 15.31, Vinod Koul wrote:
> > This controller provides DMAengine capabilities for a variety of peripheral
> > buses such as I2C, UART, and SPI. By using GPI dmaengine driver, bus
> > drivers can use a standardize interface that is protocol independent to
> > transfer data between memory and peripheral.
> > 
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >  drivers/dma/qcom/Kconfig     |   12 +
> >  drivers/dma/qcom/Makefile    |    1 +
> >  drivers/dma/qcom/gpi.c       | 2303 ++++++++++++++++++++++++++++++++++
> >  include/linux/qcom-gpi-dma.h |   83 ++
> 
> Would not be better to have the header under include/linux/dma/ ?

Right, makes sense. Will move into include/linux/dma/

Thanks
-- 
~Vinod
