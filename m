Return-Path: <dmaengine-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C26ECD98FD
	for <dmaengine@archiver.kernel.org>; Wed, 11 Oct 2023 08:12:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230104AbjJKIMb (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 11 Oct 2023 04:12:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229957AbjJKIMb (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Wed, 11 Oct 2023 04:12:31 -0400
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6CAF98;
        Wed, 11 Oct 2023 01:12:28 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AB0DA1BF20C;
        Wed, 11 Oct 2023 08:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1697011947;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=4HMH1lD+WUg/h8euX0dESyMJIfvuUaMHpH1iRNCMCEw=;
        b=N7n/BlTydq1oNGaSomuVSJYjiApWa2wHro7DBGhmj89qhNZj9e7cTxXS5JgZSwcwfbxqD8
        n0STB1OWbeBYUNoy29G0stmkriw2RA/muu0763YmpfsgZnxTb8aheYS5M5n7dST4X3/c8L
        pBuxRjFQd/KPU4eNuuud3V5Cear3sScaj9Y5vBcK2bd3VYtp7jNar4egea1fLJy+JVStHf
        AF3LpPQRtp10dsZ8fetqdyb+ZXrsmnfL7/mcZ7BgUHM8QisbV7NsWs+ym+Ghcube/MykS/
        WmH8PvumznGXp2HYT2JIyIlcEA2edKfKi/+Wl4MuJZ63T9extKnne8o+qKCw7A==
From:   Kory Maincent <kory.maincent@bootlin.com>
Subject: [PATCH v3 0/6] Fix support of dw-edma HDMA NATIVE IP in remote
 setup
Date:   Wed, 11 Oct 2023 10:11:39 +0200
Message-Id: <20231011-b4-feature_hdma_mainline-v3-0-24ee0c979c6f@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIALtYJmUC/x3MSwqDMBRG4a3IHRswxtTSrYhIHn/qBY2S2CKIe
 2/o8Bucc1FGYmR6VRclfDnzFgtUXZGbTXxDsC+mtmmVbKQUthMB5vgkTLNfzbQajgtHCPtwug9
 PKKs9lXxPCHz+18N43z858518agAAAA==
To:     Manivannan Sadhasivam <mani@kernel.org>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Vinod Koul <vkoul@kernel.org>,
        Cai Huoqing <cai.huoqing@linux.dev>
Cc:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        Herve Codina <herve.codina@bootlin.com>,
        Kory Maincent <kory.maincent@bootlin.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.12.3
X-GND-Sasl: kory.maincent@bootlin.com
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

This patch series fix the support of dw-edma HDMA NATIVE IP.
I can only test it in remote HDMA IP setup with single dma transfer, but
with these fixes it works properly.

Few fixes has also been added for eDMA version. Similarly to HDMA I have
tested only eDMA in remote setup.

Changes in v2:
- Update comments and fix typos.
- Removed patches that tackle hypothetical bug and then were not pertinent.
- Add the similar HDMA race condition in remote setup fix to eDMA IP driver.

Changes in v3:
- Fix comment style.
- Split a patch in two to differ bug fix and simple harmless typo.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
Kory Maincent (6):
      dmaengine: dw-edma: Fix the ch_count hdma callback
      dmaengine: dw-edma: Fix wrong interrupt bit set
      dmaengine: dw-edma: Typo fix
      dmaengine: dw-edma: Add HDMA remote interrupt configuration
      dmaengine: dw-edma: HDMA: Add sync read before starting the DMA transfer in remote setup
      dmaengine: dw-edma: eDMA: Add sync read before starting the DMA transfer in remote setup

 drivers/dma/dw-edma/dw-edma-v0-core.c | 17 +++++++++++++++
 drivers/dma/dw-edma/dw-hdma-v0-core.c | 39 +++++++++++++++++++++++------------
 drivers/dma/dw-edma/dw-hdma-v0-regs.h |  2 +-
 3 files changed, 44 insertions(+), 14 deletions(-)
---
base-commit: 8bf914570650ec5858e18554d70d2838cef01de1
change-id: 20231011-b4-feature_hdma_mainline-b6c57f8e3b5d

Best regards,
-- 
Köry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

