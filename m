Return-Path: <dmaengine-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACF9AC001B0
	for <dmaengine@archiver.kernel.org>; Fri, 30 Jun 2023 16:18:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232365AbjF3QRr (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Fri, 30 Jun 2023 12:17:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232373AbjF3QR0 (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Fri, 30 Jun 2023 12:17:26 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 566813ABC;
        Fri, 30 Jun 2023 09:17:22 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,171,1684767600"; 
   d="scan'208";a="166246338"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 01 Jul 2023 01:17:21 +0900
Received: from localhost.localdomain (unknown [10.226.93.15])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id E79324015EE4;
        Sat,  1 Jul 2023 01:17:18 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Vinod Koul <vkoul@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Hien Huynh <hien.huynh.px@renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        dmaengine@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 0/2] RZ/G2L DMA fix/improvements
Date:   Fri, 30 Jun 2023 17:17:14 +0100
Message-Id: <20230630161716.586552-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

This patch series aims to fix/improve RZ/DMAC driver.

The improvement patch is related to fix cleanup order in probe/remove().
and fixes patch is related to wrong SDS/DDS settings, when we change/update
the DMA bus width several times.

v1->v2:
 * Update patch header and description.

Biju Das (1):
  dmaengine: sh: rz-dmac: Improve cleanup order in probe()/remove()

Hien Huynh (1):
  dma: rz-dmac: Fix destination and source data size setting

 drivers/dma/sh/rz-dmac.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

-- 
2.25.1

