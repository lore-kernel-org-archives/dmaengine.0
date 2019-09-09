Return-Path: <SRS0=Lu0e=XE=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 408E0C00307
	for <dmaengine@archiver.kernel.org>; Mon,  9 Sep 2019 06:35:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 205CF21924
	for <dmaengine@archiver.kernel.org>; Mon,  9 Sep 2019 06:35:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729478AbfIIGfh (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 9 Sep 2019 02:35:37 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:18281 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727174AbfIIGfh (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Mon, 9 Sep 2019 02:35:37 -0400
X-IronPort-AV: E=Sophos;i="5.64,483,1559487600"; 
   d="scan'208";a="25872147"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 09 Sep 2019 15:35:35 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 7512341A59F7;
        Mon,  9 Sep 2019 15:35:35 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     vinod.koul@intel.com
Cc:     dmaengine@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v3 0/4] dmaengine: rcar-dmac: use of_data and add dma-channel-mask support
Date:   Mon,  9 Sep 2019 15:34:48 +0900
Message-Id: <1568010892-17606-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

This patch series is based on the latest slave-dma.git / next branch.

Changes from v2:
 - Rebase the latest slave-dma.git / next branch (In other words,
   this patch series doesn't depend any other branches.
 - Cherry-picked a patch which is contained in v5.3-rc8 to solve any
   dependency. (I'm not sure whether this is a right way or not...)
  https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=169317

Changes from v1:
 - Combine two patch series into this patch series.
https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=166457&state=*
https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=166457&state=*
 - Remove a patch because updated patch is already merged into
   the latest slave-dma.git / fixes branch as described above.
 - Add Reviewed-by tags into all patches.
 - Rename a member of rcar_dmac_of_data.
 - Just ignore the return value of of_property_read_u32() for dma-channel-mask.


Yoshihiro Shimoda (4):
  dmaengine: rcar-dmac: Fix DMACHCLR handling if iommu is mapped
  dmaengine: rcar-dmac: Use of_data values instead of a macro
  dmaengine: rcar-dmac: Use devm_platform_ioremap_resource()
  dmaengine: rcar-dmac: Add dma-channel-mask property support

 drivers/dma/sh/rcar-dmac.c | 71 +++++++++++++++++++++++++++++++++++-----------
 1 file changed, 55 insertions(+), 16 deletions(-)

-- 
2.7.4

