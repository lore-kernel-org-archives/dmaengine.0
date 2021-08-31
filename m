Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C282C432BE
	for <dmaengine@archiver.kernel.org>; Tue, 31 Aug 2021 12:42:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 79B5E60240
	for <dmaengine@archiver.kernel.org>; Tue, 31 Aug 2021 12:42:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232209AbhHaMnY (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Tue, 31 Aug 2021 08:43:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229625AbhHaMnW (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Tue, 31 Aug 2021 08:43:22 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 520ABC06175F
        for <dmaengine@vger.kernel.org>; Tue, 31 Aug 2021 05:42:27 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:2193:279a:893d:20ae])
        by andre.telenet-ops.be with bizsmtp
        id oCiP2500V1ZidPp01CiP54; Tue, 31 Aug 2021 14:42:23 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mL35r-000rJA-82; Tue, 31 Aug 2021 14:42:23 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mL35q-00027I-KK; Tue, 31 Aug 2021 14:42:22 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Vinod Koul <vkoul@kernel.org>, Sanjay R Mehta <sanju.mehta@amd.com>
Cc:     dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] MAINTAINERS: Fix AMD PTDMA DRIVER entry
Date:   Tue, 31 Aug 2021 14:42:21 +0200
Message-Id: <28b7663ebcaf9363324a615129417b24625a7038.1630413650.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

Remove the bogus leading plus signs from the entry for the AMD PTDMA
driver.

Fixes: fa5d823b16a9442d ("dmaengine: ptdma: Initial driver for the AMD PTDMA")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 MAINTAINERS | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 51827224c141eaa8..3b024911ce6e50fe 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -985,11 +985,11 @@ S:	Supported
 T:	git https://gitlab.freedesktop.org/agd5f/linux.git
 F:	drivers/gpu/drm/amd/pm/powerplay/
 
-+AMD PTDMA DRIVER
-+M:	Sanjay R Mehta <sanju.mehta@amd.com>
-+L:	dmaengine@vger.kernel.org
-+S:	Maintained
-+F:	drivers/dma/ptdma/
+AMD PTDMA DRIVER
+M:	Sanjay R Mehta <sanju.mehta@amd.com>
+L:	dmaengine@vger.kernel.org
+S:	Maintained
+F:	drivers/dma/ptdma/
 
 AMD SEATTLE DEVICE TREE SUPPORT
 M:	Brijesh Singh <brijeshkumar.singh@amd.com>
-- 
2.25.1

