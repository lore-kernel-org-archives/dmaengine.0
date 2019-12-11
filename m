Return-Path: <SRS0=1Ev4=2B=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E9C2C43603
	for <dmaengine@archiver.kernel.org>; Wed, 11 Dec 2019 15:47:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4FD9C208C3
	for <dmaengine@archiver.kernel.org>; Wed, 11 Dec 2019 15:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576079227;
	bh=vJYi5Cf3RhKaYquMOGw3LcJjHTdtvE0fu1/DA1QsneE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=l5TiKYVFL2Dse2/1Rcr7PXz8w60KoclgxxBKJSXOZBbjdVuU8XfZLakCPKotWQ0ik
	 +NR6Tdcmh7yGwAZKUeBDndyT3MGgAI8hQBqPIO2Xijtx3D/jg92L8z+WMnP8k2DCmR
	 SCSL65T6xMxpsi+JsY5KiOfCzD1fTW8l8tU4PQ2w=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732644AbfLKPrG (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 11 Dec 2019 10:47:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:60344 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732553AbfLKP0x (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Wed, 11 Dec 2019 10:26:53 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 883792465A;
        Wed, 11 Dec 2019 15:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576078013;
        bh=vJYi5Cf3RhKaYquMOGw3LcJjHTdtvE0fu1/DA1QsneE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GAAm8DKx/uATzMHfP2SgwoUL2RftKh9yJjAcdYdkSWfmpnzsLmZwVMghR21H0FU8t
         dhWR+/t9OZ232HvX/t4eY06ShKEqFxgXm6JursYxFx6BQgH4g7Km+Rhbu6W79+pmjh
         LqK0fljuvFHXfH1wjYEmkMpfXd4q9Rv+eWUYg7xA=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Nicholas Graumann <nick.graumann@gmail.com>,
        Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>,
        Vinod Koul <vkoul@kernel.org>, Sasha Levin <sashal@kernel.org>,
        dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 4.19 08/79] dmaengine: xilinx_dma: Clear desc_pendingcount in xilinx_dma_reset
Date:   Wed, 11 Dec 2019 10:25:32 -0500
Message-Id: <20191211152643.23056-8-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191211152643.23056-1-sashal@kernel.org>
References: <20191211152643.23056-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

From: Nicholas Graumann <nick.graumann@gmail.com>

[ Upstream commit 8a631a5a0f7d4a4a24dba8587d5d9152be0871cc ]

Whenever we reset the channel, we need to clear desc_pendingcount
along with desc_submitcount. Otherwise when a new transaction is
submitted, the irq coalesce level could be programmed to an incorrect
value in the axidma case.

This behavior can be observed when terminating pending transactions
with xilinx_dma_terminate_all() and then submitting new transactions
without releasing and requesting the channel.

Signed-off-by: Nicholas Graumann <nick.graumann@gmail.com>
Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Link: https://lore.kernel.org/r/1571150904-3988-8-git-send-email-radhey.shyam.pandey@xilinx.com
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/dma/xilinx/xilinx_dma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index 8aec137b4fcaa..d56b6b0e22a84 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -1427,6 +1427,7 @@ static int xilinx_dma_reset(struct xilinx_dma_chan *chan)
 
 	chan->err = false;
 	chan->idle = true;
+	chan->desc_pendingcount = 0;
 	chan->desc_submitcount = 0;
 
 	return err;
-- 
2.20.1

