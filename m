Return-Path: <SRS0=/LIb=CO=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8719C43461
	for <dmaengine@archiver.kernel.org>; Sat,  5 Sep 2020 17:28:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 658512086A
	for <dmaengine@archiver.kernel.org>; Sat,  5 Sep 2020 17:28:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UWWicQF9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727875AbgIER2X (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Sat, 5 Sep 2020 13:28:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726568AbgIER2V (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Sat, 5 Sep 2020 13:28:21 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 769ABC061244
        for <dmaengine@vger.kernel.org>; Sat,  5 Sep 2020 10:28:19 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 81A40335;
        Sat,  5 Sep 2020 19:28:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1599326894;
        bh=Dnt9cpqNAX6aQfLMV6Clevf8BSBBJAyi6HTM3ITyYdE=;
        h=Date:From:To:Cc:Subject:From;
        b=UWWicQF9CGfOE8umxmoXde3+E7KR44aUWjHGSXrRiCQrAeq+bqS+a4RGDxOqJiyS2
         FpnP8DevvqEHPD6CK4fMtBviRrkQ5k2/HkwDQwwUt/YdjoTOOPjQSJeyjd3kI1C6mN
         v2S0g6gdZby7m4jeowI/gv+TOTHvFeRSi0e6yFk8=
Date:   Sat, 5 Sep 2020 20:27:51 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc:     Hyun Kwon <hyun.kwon@xilinx.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Alexandre Bounine <alex.bou9@gmail.com>,
        Vinod Koul <vkoul@kernel.org>,
        Matt Porter <mporter@kernel.crashing.org>
Subject: [GIT PULL FOR v5.9] Fix Kconfig dependency issue with DMAENGINES
 selection
Message-ID: <20200905172751.GC6319@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

Hi Dave and Daniel,

This small pull request fixes a Kconfig dependency issue introduced in
v5.9-rc1. Among the three patches required to fix the issue, the ASoC
fix has been merged in Linus' tree already. I haven't been able to get
the RapidIO patch reviewed by the subsystem maintainers, so I've
included it here as it's a dependency for the DRM patch.

The following changes since commit f75aef392f869018f78cfedf3c320a6b3fcfda6b:

  Linux 5.9-rc3 (2020-08-30 16:01:54 -0700)

are available in the Git repository at:

  git://linuxtv.org/pinchartl/media.git tags/drm-xlnx-dpsub-fixes-20200905

for you to fetch changes up to 3e8b2403545efd46c6347002e27eae4708205fd4:

  drm: xlnx: dpsub: Fix DMADEVICES Kconfig dependency (2020-09-05 19:52:54 +0300)

----------------------------------------------------------------
Kconfig fixes for DRM_ZYNQMP_DPSUB DMA engine dependency

----------------------------------------------------------------
Laurent Pinchart (2):
      rapidio: Replace 'select' DMAENGINES 'with depends on'
      drm: xlnx: dpsub: Fix DMADEVICES Kconfig dependency

 drivers/gpu/drm/xlnx/Kconfig | 1 +
 drivers/rapidio/Kconfig      | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

-- 
Regards,

Laurent Pinchart
