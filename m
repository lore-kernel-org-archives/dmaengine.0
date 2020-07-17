Return-Path: <SRS0=GWNR=A4=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 242EDC433E0
	for <dmaengine@archiver.kernel.org>; Fri, 17 Jul 2020 05:59:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F109320734
	for <dmaengine@archiver.kernel.org>; Fri, 17 Jul 2020 05:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594965563;
	bh=Xk1yjDo8ZBe6RHRNCMTYO9zRRFOmWNNg8pXktDqA1Gg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=zXaeXMXTV7yd5V11sgPUxqcfnjtfyBpTzRfIrH51T2NeNo8KbX1C9jM2xjnGd5d/j
	 1O8Cidr9VPt29MuVaVT8gkk5dwfbFPmLE//vju4FIHeEFqq34zdYn477evj+mgYGTf
	 kVwIEf9EjBGC5r4pBmNfSmdALmb5ngliwXcmtcls=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725864AbgGQF7W (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Fri, 17 Jul 2020 01:59:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:44896 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725811AbgGQF7W (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Fri, 17 Jul 2020 01:59:22 -0400
Received: from localhost (unknown [122.171.202.192])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 53FC02071A;
        Fri, 17 Jul 2020 05:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594965562;
        bh=Xk1yjDo8ZBe6RHRNCMTYO9zRRFOmWNNg8pXktDqA1Gg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fJSCc/FKMsMzC8rLHLDb8RUb60FJYVYaVmSo7FDsWCk6Hkz4S3pIETKdQHR3PmGXS
         j2Y6gBetr7+on9DKGVCD0jDYzAdwakLpMoexnXbi2bGlZA1U27IRdVPHw7XoZAuTdA
         HuhHMIyviJemTL6IO8mT7AiFw4Xf5h0YSktqSsGU=
Date:   Fri, 17 Jul 2020 11:29:18 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     dmaengine@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Tejas Upadhyay <tejasu@xilinx.com>,
        Satish Kumar Nagireddy <SATISHNA@xilinx.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH v6 4/6] dmaengine: xilinx: dpdma: Add the Xilinx
 DisplayPort DMA engine driver
Message-ID: <20200717055918.GC82923@vkoul-mobl>
References: <20200708201906.4546-1-laurent.pinchart@ideasonboard.com>
 <20200708201906.4546-5-laurent.pinchart@ideasonboard.com>
 <20200715105906.GI34333@vkoul-mobl>
 <20200716004140.GN6144@pendragon.ideasonboard.com>
 <20200716052107.GC55478@vkoul-mobl>
 <20200716134625.GC5960@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200716134625.GC5960@pendragon.ideasonboard.com>
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 16-07-20, 16:46, Laurent Pinchart wrote:

> > Yes that is only thing atm. Also I think we should rethink how we are
> > tying the channels and can we do a better way to handle that
> 
> Thanks. I'll make the necessary changes and submit a new version. If you
> think a new API is needed to tie channels together, can it be developed
> on top ?

Sure, that is entirely reasonable

-- 
~Vinod
