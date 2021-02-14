Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88C2FC433DB
	for <dmaengine@archiver.kernel.org>; Sun, 14 Feb 2021 03:44:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4975264DDA
	for <dmaengine@archiver.kernel.org>; Sun, 14 Feb 2021 03:44:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229713AbhBNDon (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Sat, 13 Feb 2021 22:44:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229615AbhBNDon (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Sat, 13 Feb 2021 22:44:43 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60AA4C061574
        for <dmaengine@vger.kernel.org>; Sat, 13 Feb 2021 19:44:03 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 772C52FE;
        Sun, 14 Feb 2021 04:43:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613274239;
        bh=Aiu8utsA/R0EL/bSR1XIAxocUingsu+BsqrWoP+MP+g=;
        h=From:To:Cc:Subject:Date:From;
        b=BACJdj49byDU91sa8417p7wiT77lN/lxfc6rzbdtYvc1nstGIAz82/XXFNpkRV5Cy
         4TKxuPC2nv8x/wXXBslxboR7wPGwS7kLcRLkOJF5VRo8dPFq7eRLB0rJbRlMny7+8h
         GDyip0oCMINeM3Jp2kqx6uKboqkJRCTf0Y/xVtAM=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     dmaengine@vger.kernel.org
Cc:     Vinod Koul <vkoul@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH] dmaengine: xilinx: dpdma: Fix compilation when !HAS_IOMEM
Date:   Sun, 14 Feb 2021 05:43:19 +0200
Message-Id: <20210214034319.11569-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

The xilinx-dpdma driver uses the devm_platform_ioremap_resource() API,
which is only available when HAS_IOMEM is selected. Depend on the
Kconfig symbol to fix the error.

While at it, also depend on ARCH_ZYNQ to avoid cluttering the
configuration on other platforms, unless COMPILE_TEST is selected. The
former would be enough to guarantee HAS_IOMEM, but with COMPILE_TEST we
still need to explicit dependendy on HAS_IOMEM.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/dma/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
index d242c7632621..205bc888d49f 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -702,6 +702,8 @@ config XILINX_ZYNQMP_DMA
 
 config XILINX_ZYNQMP_DPDMA
 	tristate "Xilinx DPDMA Engine"
+	depends on ARCH_ZYNQ || COMPILE_TEST
+	depends on HAS_IOMEM
 	select DMA_ENGINE
 	select DMA_VIRTUAL_CHANNELS
 	help
-- 
Regards,

Laurent Pinchart

