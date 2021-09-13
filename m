Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25440C433FE
	for <dmaengine@archiver.kernel.org>; Mon, 13 Sep 2021 22:36:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0641661260
	for <dmaengine@archiver.kernel.org>; Mon, 13 Sep 2021 22:36:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348677AbhIMWhR (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 13 Sep 2021 18:37:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:51912 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1348681AbhIMWgL (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Mon, 13 Sep 2021 18:36:11 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CDB8F61260;
        Mon, 13 Sep 2021 22:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631572486;
        bh=TXU9RyJxyHp0FWkg8Y5lc8stWI31Sz5EvnclFZyp5BQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bRpSIuaMPJHjdLKP+alXOZVxVV2jm8hYTGl1f111oaJ1NiLBfRTeTFZOAh/LItbl1
         Hda67f8ZYUfUTeqsNsXl994ZyvugNxY3BwvlFVMcBFK8kZv6O4Pgti1gsanJnqABJQ
         9gfvPSGAwTllkTRv0dU159IM+2frDJf7YbZjr3zsmtLm1yqnoFGM8MC/cjrn1f84WT
         sFNoa43VHn2pKJIkiofBSQBfLhtaNRxcHlyZ5gX6Q1ygmgaLYNfcp46+YaNhedlsRK
         sD+mNYMIiMzc1Yk0xXaiBRJVjXNRRy1uVBXnYPqmOf+fGlmRy2PPFN9zRLUK1GQCcd
         gCsDWkC2zftTQ==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Johannes Berg <johannes.berg@intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Dave Jiang <dave.jiang@intel.com>,
        Vinod Koul <vkoul@kernel.org>, Sasha Levin <sashal@kernel.org>,
        dmaengine@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 03/16] dmaengine: ioat: depends on !UML
Date:   Mon, 13 Sep 2021 18:34:29 -0400
Message-Id: <20210913223442.435885-3-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210913223442.435885-1-sashal@kernel.org>
References: <20210913223442.435885-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

From: Johannes Berg <johannes.berg@intel.com>

[ Upstream commit bbac7a92a46f0876e588722ebe552ddfe6fd790f ]

Now that UML has PCI support, this driver must depend also on
!UML since it pokes at X86_64 architecture internals that don't
exist on ARCH=um.

Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Johannes Berg <johannes.berg@intel.com>
Acked-by: Dave Jiang <dave.jiang@intel.com>
Link: https://lore.kernel.org/r/20210809112409.a3a0974874d2.I2ffe3d11ed37f735da2f39884a74c953b258b995@changeid
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/dma/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
index 3a745e8a0f42..08013345d1f2 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -299,7 +299,7 @@ config INTEL_IDXD
 
 config INTEL_IOATDMA
 	tristate "Intel I/OAT DMA support"
-	depends on PCI && X86_64
+	depends on PCI && X86_64 && !UML
 	select DMA_ENGINE
 	select DMA_ENGINE_RAID
 	select DCA
-- 
2.30.2

