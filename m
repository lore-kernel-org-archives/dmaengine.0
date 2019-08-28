Return-Path: <SRS0=2FgE=WY=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49BE3C3A5A1
	for <dmaengine@archiver.kernel.org>; Wed, 28 Aug 2019 10:32:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2A92F22DA7
	for <dmaengine@archiver.kernel.org>; Wed, 28 Aug 2019 10:32:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726394AbfH1KcH (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 28 Aug 2019 06:32:07 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:29746 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726328AbfH1KcG (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Wed, 28 Aug 2019 06:32:06 -0400
X-IronPort-AV: E=Sophos;i="5.64,440,1559487600"; 
   d="scan'208";a="24927763"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 28 Aug 2019 19:32:05 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 0B1A54004CFD;
        Wed, 28 Aug 2019 19:32:05 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     vkoul@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc:     dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] dt-bindings: dmaengine: dma-common: Fix the dma-channel-mask property
Date:   Wed, 28 Aug 2019 19:30:23 +0900
Message-Id: <1566988223-14657-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

The commit b37e3534ac42 ("dt-bindings: dmaengine: Add YAML schemas
for the generic DMA bindings") changed the property from
dma-channel-mask to dma-channel-masks. So, this patch fixes it.

Fixes: b37e3534ac42 ("dt-bindings: dmaengine: Add YAML schemas for the generic DMA bindings")
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Changes from v1:
 - s/Revise/Fix/ in the subject and s/revises/fixes/ the commit log.
 https://patchwork.kernel.org/patch/11117885/

 Documentation/devicetree/bindings/dma/dma-common.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/dma-common.yaml b/Documentation/devicetree/bindings/dma/dma-common.yaml
index 0141af0..ed0a49a 100644
--- a/Documentation/devicetree/bindings/dma/dma-common.yaml
+++ b/Documentation/devicetree/bindings/dma/dma-common.yaml
@@ -24,7 +24,7 @@ properties:
     description:
       Used to provide DMA controller specific information.
 
-  dma-channel-masks:
+  dma-channel-mask:
     $ref: /schemas/types.yaml#definitions/uint32
     description:
       Bitmask of available DMA channels in ascending order that are
-- 
2.7.4

