Return-Path: <SRS0=Lj0n=US=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 053B6C31E49
	for <dmaengine@archiver.kernel.org>; Wed, 19 Jun 2019 12:46:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DD4CB21530
	for <dmaengine@archiver.kernel.org>; Wed, 19 Jun 2019 12:46:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731877AbfFSMqA (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 19 Jun 2019 08:46:00 -0400
Received: from baptiste.telenet-ops.be ([195.130.132.51]:47414 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731876AbfFSMqA (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Wed, 19 Jun 2019 08:46:00 -0400
Received: from ramsan ([84.194.111.163])
        by baptiste.telenet-ops.be with bizsmtp
        id Sclx2000G3XaVaC01clxNl; Wed, 19 Jun 2019 14:45:58 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hdZyP-00041l-DJ; Wed, 19 Jun 2019 14:45:57 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hdZyP-0003Jb-Bp; Wed, 19 Jun 2019 14:45:57 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Vinod Koul <vkoul@kernel.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     dmaengine@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dmaengine: sh: usb-dmac: Use [] to denote a flexible array member
Date:   Wed, 19 Jun 2019 14:45:55 +0200
Message-Id: <20190619124555.12701-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

Flexible array members should be denoted using [] instead of [0], else
gcc will not warn when they are no longer at the end of the structure.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/dma/sh/usb-dmac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/sh/usb-dmac.c b/drivers/dma/sh/usb-dmac.c
index 0afabf395930ed94..17063aaf51bce98b 100644
--- a/drivers/dma/sh/usb-dmac.c
+++ b/drivers/dma/sh/usb-dmac.c
@@ -57,7 +57,7 @@ struct usb_dmac_desc {
 	u32 residue;
 	struct list_head node;
 	dma_cookie_t done_cookie;
-	struct usb_dmac_sg sg[0];
+	struct usb_dmac_sg sg[];
 };
 
 #define to_usb_dmac_desc(vd)	container_of(vd, struct usb_dmac_desc, vd)
-- 
2.17.1

