Return-Path: <SRS0=Ns8y=IF=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62A8CC433E6
	for <dmaengine@archiver.kernel.org>; Sun,  7 Mar 2021 04:08:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 320AC65056
	for <dmaengine@archiver.kernel.org>; Sun,  7 Mar 2021 04:08:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230007AbhCGEHZ (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Sat, 6 Mar 2021 23:07:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230023AbhCGEHI (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Sat, 6 Mar 2021 23:07:08 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96D85C06174A
        for <dmaengine@vger.kernel.org>; Sat,  6 Mar 2021 20:07:08 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9158F93;
        Sun,  7 Mar 2021 05:07:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1615090025;
        bh=B2FWIOaq1CG0oF2eROymjjLPDRIkiQ+5WKXs/ZkE9uA=;
        h=From:To:Cc:Subject:Date:From;
        b=kXS0jKw85VaGBhBZpLANqSgPOjbhnOgqzGOezHzopeS7uvR+UH3F4NuUnjT+C+83G
         zQdhhWFCQyBZuDnKCQghTNx7464dUp1R2+zQnZCi0yHlOz0nI5f7HQ4eBmFpceWFru
         qyCIeeyR6/Vk/4XVn271GHhRXUGp0IQU5zWCcxak=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     dmaengine@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Vinod Koul <vkoul@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Rohit Visavalia <RVISAVAL@xilinx.com>
Subject: [PATCH 0/2] dmaengine: Fix issues in Xilinx dpdma driver
Date:   Sun,  7 Mar 2021 06:06:27 +0200
Message-Id: <20210307040629.29308-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

Hello,

This small patch series fixes two issues I've experienced with the
Xilinx dpdma driver. There isn't much to summarize in the cover letter,
please see individual patches for details.

Laurent Pinchart (2):
  dmaengine: xilinx: dpdma: Fix descriptor issuing on video group
  dmaengine: xilinx: dpdma: Fix race condition in done IRQ

 drivers/dma/xilinx/xilinx_dpdma.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

-- 
Regards,

Laurent Pinchart

