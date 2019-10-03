Return-Path: <SRS0=6Pif=X4=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A798C10F14
	for <dmaengine@archiver.kernel.org>; Thu,  3 Oct 2019 03:58:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 406B2222BE
	for <dmaengine@archiver.kernel.org>; Thu,  3 Oct 2019 03:58:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727452AbfJCD6I (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 2 Oct 2019 23:58:08 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:23587 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727911AbfJCD6I (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Wed, 2 Oct 2019 23:58:08 -0400
X-IronPort-AV: E=Sophos;i="5.67,250,1566831600"; 
   d="scan'208";a="27948076"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 03 Oct 2019 12:58:06 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 92508400D4F3;
        Thu,  3 Oct 2019 12:58:06 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     vkoul@kernel.org
Cc:     dmaengine@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v4 0/3] dmaengine: rcar-dmac: use of_data and add dma-channel-mask support
Date:   Thu,  3 Oct 2019 12:58:03 +0900
Message-Id: <1570075086-25126-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

This patch series is based on the linux-next.git / next-20191001 tag.

Changes from v3:
 - Rebase the latest linux-next.git.
 - Add Simon-san's Reviewed-by inio patch 1/3 and 2/3.

 https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=171621

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

Yoshihiro Shimoda (3):
  dmaengine: rcar-dmac: Use of_data values instead of a macro
  dmaengine: rcar-dmac: Use devm_platform_ioremap_resource()
  dmaengine: rcar-dmac: Add dma-channel-mask property support

 drivers/dma/sh/rcar-dmac.c | 47 +++++++++++++++++++++++++++++++++++++---------
 1 file changed, 38 insertions(+), 9 deletions(-)

-- 
2.7.4

