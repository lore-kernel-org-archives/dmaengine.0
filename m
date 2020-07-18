Return-Path: <SRS0=egwF=A5=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4B84C433DF
	for <dmaengine@archiver.kernel.org>; Sat, 18 Jul 2020 00:24:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 956A6206BE
	for <dmaengine@archiver.kernel.org>; Sat, 18 Jul 2020 00:24:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uPM2AYOk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728068AbgGRAYE (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Fri, 17 Jul 2020 20:24:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727946AbgGRAYE (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Fri, 17 Jul 2020 20:24:04 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E91C7C0619D2
        for <dmaengine@vger.kernel.org>; Fri, 17 Jul 2020 17:24:03 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 92D9171D;
        Sat, 18 Jul 2020 02:24:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1595031840;
        bh=7XGL+mMApygh4E2eUpda33Jf5g9bp8n1Y5ST8AGKnJY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uPM2AYOkc0XCSjkClKVQuqA6omR9vQVeyhj95/Sp1uPsZEiLyk/DXc0a+hxti01Dj
         gcrGHMAseee3oELdYwPpYfarW1xIQSI1INseq4WxKXdrpRtRl2Huo5JwwXa/CcsWg+
         PHfhbMS97CKLnYZoUpeBmQGXsgsWWeKELvSfjxK8=
Date:   Sat, 18 Jul 2020 03:23:52 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     dmaengine@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Tejas Upadhyay <tejasu@xilinx.com>,
        Satish Kumar Nagireddy <SATISHNA@xilinx.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH v7 4/5] dmaengine: xilinx: dpdma: Add debugfs support
Message-ID: <20200718002352.GB5962@pendragon.ideasonboard.com>
References: <20200717013337.24122-1-laurent.pinchart@ideasonboard.com>
 <20200717013337.24122-5-laurent.pinchart@ideasonboard.com>
 <20200717060515.GD82923@vkoul-mobl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200717060515.GD82923@vkoul-mobl>
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

Hi Vinod,

On Fri, Jul 17, 2020 at 11:35:15AM +0530, Vinod Koul wrote:
> On 17-07-20, 04:33, Laurent Pinchart wrote:
> 
> > +static void xilinx_dpdma_debugfs_cleanup(struct xilinx_dpdma_device *xdev)
> > +{
> > +	debugfs_remove_recursive(xdev->debugfs_dir);
> 
> you can skip this step as core will do so when you call
> dma_async_device_unregister()
> 
> > +	xdev->debugfs_dir = NULL;
> > +}
> > +
> > +static int xilinx_dpdma_debugfs_init(struct xilinx_dpdma_device *xdev)
> > +{
> > +	struct dentry *dent;
> > +
> > +	dpdma_debugfs.testcase = DPDMA_TC_NONE;
> > +
> > +	dent = debugfs_create_dir("dpdma", xdev->common.dbg_dev_root);
> > +	if (IS_ERR(dent)) {
> > +		dev_err(xdev->dev, "Failed to create debugfs directory\n");
> > +		return -ENODEV;
> > +	}
> 
> Do you really need another dir in your device root. You should already
> have .../dmaengine/<dpdma-dev-name>/ adding dpdma dir seems overkill

It's indeed overkill. I'll remove it. Thanks for catching the issue.

-- 
Regards,

Laurent Pinchart
