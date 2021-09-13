Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1EDEC433F5
	for <dmaengine@archiver.kernel.org>; Mon, 13 Sep 2021 22:38:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9AE4E60E8B
	for <dmaengine@archiver.kernel.org>; Mon, 13 Sep 2021 22:38:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245732AbhIMWjb (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 13 Sep 2021 18:39:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:51262 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1349062AbhIMWh2 (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Mon, 13 Sep 2021 18:37:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2F75F6134F;
        Mon, 13 Sep 2021 22:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631572525;
        bh=P6dKveuOPB+7Dz8pfEpbCBI6+ptDmfuolSyzDe2EUWE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tV5wx79fuEmo2MKmjqQRqmlYp42+7MvdMDtQpYOnPN2xjSIZ4w0xF/yEgGVrKKlQB
         ZuBahPpy4li2GuLJbL1VRajr1+OgSUvw012hJdBaZQmBu3NgYMv7iB8QaNTpzBq9Za
         UYO648DHcdunJ08rOIAnpaDiU4yANtnrZrkqEsFQPRbYjrdEVEAXrYlx8xsic1Z+a3
         XwBlgCdWrQu9JiC6s/AY7fxA8OYGLnReKAP2aS6wpmCKzdY4HyQ4Rb/FmtOVHZPG9q
         S5TDkSk8NkpW1gIC8vm4YVr5IAXxfsbnJOmtirGfJrw7XfBcIy2DV9JJ8hnWPeV1tz
         HE2abDLZx51rA==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Johannes Berg <johannes.berg@intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Dave Jiang <dave.jiang@intel.com>,
        Vinod Koul <vkoul@kernel.org>, Sasha Levin <sashal@kernel.org>,
        dmaengine@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 02/10] dmaengine: ioat: depends on !UML
Date:   Mon, 13 Sep 2021 18:35:13 -0400
Message-Id: <20210913223521.436250-2-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210913223521.436250-1-sashal@kernel.org>
References: <20210913223521.436250-1-sashal@kernel.org>
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
index 52dd4bd7c209..e5f31af65aab 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -266,7 +266,7 @@ config INTEL_IDMA64
 
 config INTEL_IOATDMA
 	tristate "Intel I/OAT DMA support"
-	depends on PCI && X86_64
+	depends on PCI && X86_64 && !UML
 	select DMA_ENGINE
 	select DMA_ENGINE_RAID
 	select DCA
-- 
2.30.2

