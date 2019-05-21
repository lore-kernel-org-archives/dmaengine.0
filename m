Return-Path: <SRS0=94oH=TV=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A86CDC04E87
	for <dmaengine@archiver.kernel.org>; Tue, 21 May 2019 14:10:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7451821773
	for <dmaengine@archiver.kernel.org>; Tue, 21 May 2019 14:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1558447846;
	bh=79qXCZx7JD0WlKWODrAOvLopFoe/K5zbSAhGGsEXDSA=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=oqPY+53itSk/SeFoHSuUff2U9VymPpN2hCoDO+Yq62BzjSDo91InfPeBQLlko9msM
	 PW+44igOaMCW2lGngEYqQzuEfKvG+Z5lWe0UC+1pW0siXBpD5dhS55X7H2FCOrCJkj
	 Suf7a+SFysW7gyAyrwiqNbtS9S7FLIpnCjojrps8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728055AbfEUOKq (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Tue, 21 May 2019 10:10:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:40486 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727624AbfEUOKq (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Tue, 21 May 2019 10:10:46 -0400
Received: from vkoul-mobl.Dlink (unknown [106.51.105.51])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E1FA42173C;
        Tue, 21 May 2019 14:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558447845;
        bh=79qXCZx7JD0WlKWODrAOvLopFoe/K5zbSAhGGsEXDSA=;
        h=From:To:Cc:Subject:Date:From;
        b=xrdQF9ajSIx7scu1kXtr7TBoEMrbStZxkDOBYRgbDjqTHvFA5+wTuypIYG2aH8v+o
         PmQw/fUuOkA1H09x4gcUPF0QO43zwU7BLV3JhXolYN8YegUFfYBvpWVe+/nkYozUbh
         k3eBk0VB09Kz2PGJg9hCeFqFSzu7VCxDTG7L7xDk=
From:   Vinod Koul <vkoul@kernel.org>
To:     dmaengine@vger.kernel.org
Cc:     Vinod Koul <vkoul@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>,
        Andrea Merello <andrea.merello@gmail.com>,
        Appana Durga Kedareswara Rao <appana.durga.rao@xilinx.com>
Subject: [PATCH] =?UTF-8?q?dmaengine:=20xilinx=5Fdma:=20Remove=20set=20but?= =?UTF-8?q?=20unused=20=E2=80=98tail=5Fdesc=E2=80=99?=
Date:   Tue, 21 May 2019 19:40:34 +0530
Message-Id: <20190521141034.8808-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

We get a compiler warn about variable ‘tail_desc’ set but not used

drivers/dma/xilinx/xilinx_dma.c:1102:42: warning:
	variable ‘tail_desc’ set but not used [-Wunused-but-set-variable]
  struct xilinx_dma_tx_descriptor *desc, *tail_desc;

So remove it.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/dma/xilinx/xilinx_dma.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index c43c1a154604..34564224e675 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -1099,7 +1099,7 @@ static void xilinx_dma_start(struct xilinx_dma_chan *chan)
 static void xilinx_vdma_start_transfer(struct xilinx_dma_chan *chan)
 {
 	struct xilinx_vdma_config *config = &chan->config;
-	struct xilinx_dma_tx_descriptor *desc, *tail_desc;
+	struct xilinx_dma_tx_descriptor *desc;
 	u32 reg, j;
 	struct xilinx_vdma_tx_segment *segment, *last = NULL;
 	int i = 0;
@@ -1116,8 +1116,6 @@ static void xilinx_vdma_start_transfer(struct xilinx_dma_chan *chan)
 
 	desc = list_first_entry(&chan->pending_list,
 				struct xilinx_dma_tx_descriptor, node);
-	tail_desc = list_last_entry(&chan->pending_list,
-				    struct xilinx_dma_tx_descriptor, node);
 
 	/* Configure the hardware using info in the config structure */
 	if (chan->has_vflip) {
-- 
2.20.1

