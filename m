Return-Path: <SRS0=qqdP=TW=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DDBFC282CE
	for <dmaengine@archiver.kernel.org>; Wed, 22 May 2019 19:28:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 405452173C
	for <dmaengine@archiver.kernel.org>; Wed, 22 May 2019 19:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1558553280;
	bh=BZxP4YwrsFYW6JLf3Gh67aXw4JFEXbt4Y7CG85LEW1I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=dox4C9atmxBgPilvzcgVX6Ny0whXM09IIzGTofH82VHlZGbP94MIES0n4X0OpXQdJ
	 +KPC2JPj1oHYFyYfz5ws1mftdu0jZLCMhZcvT8W1spJkwuP1V69HQpJZMY44q0wNWM
	 keeJTNfsIQ4KplV3kBESxUBhUwWA9+43Zo8VoRRY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732431AbfEVT17 (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 22 May 2019 15:27:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:50422 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730501AbfEVT15 (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Wed, 22 May 2019 15:27:57 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 51CEA20675;
        Wed, 22 May 2019 19:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558553277;
        bh=BZxP4YwrsFYW6JLf3Gh67aXw4JFEXbt4Y7CG85LEW1I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=I1YrULlTbDBGx21Lr12g4qlOYBIhLOCt44HIlzz2A23ce96RAPfJSiFBpPu+pI6NN
         IYBf3H00N00B0pejK73+6F8zvBuyJQMk/PVvN6lnsuhE++gv2WwuQFMKUYakHDXxYM
         w1Z+atAJp2fPRbzyjm6118gClrcAHLvMNpi1Wmgc=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Sugar Zhang <sugar.zhang@rock-chips.com>,
        Vinod Koul <vkoul@kernel.org>, Sasha Levin <sashal@kernel.org>,
        dmaengine@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 051/244] dmaengine: pl330: _stop: clear interrupt status
Date:   Wed, 22 May 2019 15:23:17 -0400
Message-Id: <20190522192630.24917-51-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190522192630.24917-1-sashal@kernel.org>
References: <20190522192630.24917-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

From: Sugar Zhang <sugar.zhang@rock-chips.com>

[ Upstream commit 2da254cc7908105a60a6bb219d18e8dced03dcb9 ]

This patch kill instructs the DMAC to immediately terminate
execution of a thread. and then clear the interrupt status,
at last, stop generating interrupts for DMA_SEV. to guarantee
the next dma start is clean. otherwise, one interrupt maybe leave
to next start and make some mistake.

we can reporduce the problem as follows:

DMASEV: modify the event-interrupt resource, and if the INTEN sets
function as interrupt, the DMAC will set irq<event_num> HIGH to
generate interrupt. write INTCLR to clear interrupt.

	DMA EXECUTING INSTRUCTS		DMA TERMINATE
		|				|
		|				|
	       ...			      _stop
		|				|
		|			spin_lock_irqsave
	     DMASEV				|
		|				|
		|			    mask INTEN
		|				|
		|			     DMAKILL
		|				|
		|			spin_unlock_irqrestore

in above case, a interrupt was left, and if we unmask INTEN, the DMAC
will set irq<event_num> HIGH to generate interrupt.

to fix this, do as follows:

	DMA EXECUTING INSTRUCTS		DMA TERMINATE
		|				|
		|				|
	       ...			      _stop
		|				|
		|			spin_lock_irqsave
	     DMASEV				|
		|				|
		|			     DMAKILL
		|				|
		|			   clear INTCLR
		|			    mask INTEN
		|				|
		|			spin_unlock_irqrestore

Signed-off-by: Sugar Zhang <sugar.zhang@rock-chips.com>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/dma/pl330.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
index 88750a34e8598..bc8050c025b7b 100644
--- a/drivers/dma/pl330.c
+++ b/drivers/dma/pl330.c
@@ -961,6 +961,7 @@ static void _stop(struct pl330_thread *thrd)
 {
 	void __iomem *regs = thrd->dmac->base;
 	u8 insn[6] = {0, 0, 0, 0, 0, 0};
+	u32 inten = readl(regs + INTEN);
 
 	if (_state(thrd) == PL330_STATE_FAULT_COMPLETING)
 		UNTIL(thrd, PL330_STATE_FAULTING | PL330_STATE_KILLING);
@@ -973,10 +974,13 @@ static void _stop(struct pl330_thread *thrd)
 
 	_emit_KILL(0, insn);
 
-	/* Stop generating interrupts for SEV */
-	writel(readl(regs + INTEN) & ~(1 << thrd->ev), regs + INTEN);
-
 	_execute_DBGINSN(thrd, insn, is_manager(thrd));
+
+	/* clear the event */
+	if (inten & (1 << thrd->ev))
+		writel(1 << thrd->ev, regs + INTCLR);
+	/* Stop generating interrupts for SEV */
+	writel(inten & ~(1 << thrd->ev), regs + INTEN);
 }
 
 /* Start doing req 'idx' of thread 'thrd' */
-- 
2.20.1

