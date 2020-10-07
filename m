Return-Path: <SRS0=s11Q=DO=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0833C4727E
	for <dmaengine@archiver.kernel.org>; Wed,  7 Oct 2020 08:31:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 65C5420B1F
	for <dmaengine@archiver.kernel.org>; Wed,  7 Oct 2020 08:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602059504;
	bh=BYEWkuMv4rR/6rSXCdWQtRFeiSp4JyU3cpI+RBBGAxA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=gdcMYfBUgniS6EqDd8QhAHal9CSd6nwdvLj1ovXGBqzzjiD3N8ROshcb466cYdS89
	 7q6hMXIP4yzCzXP5X3m033+VGGtYSRZNhPgiK4Xk0m12L6Q4p9ddeupoOoOiDDWo/Y
	 W/ir9VqKNh6xtlkivS/VCZjfqtAsN9xH6n0vCsYc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727868AbgJGIbl (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 7 Oct 2020 04:31:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:58682 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726463AbgJGIbk (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Wed, 7 Oct 2020 04:31:40 -0400
Received: from localhost.localdomain (unknown [122.171.222.162])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1871B2083B;
        Wed,  7 Oct 2020 08:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602059499;
        bh=BYEWkuMv4rR/6rSXCdWQtRFeiSp4JyU3cpI+RBBGAxA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QxTEzewNjnpVIAWIh3qLpZMusonlHNetGeX4+o/2KuMuW9xRRlRudSk8Cvnf9Yl4b
         OTnCYtan9JzxUbA9AcNziAYC9D5CTYscC8Vdwvedw5LZ/Tnc03Dtfl0BltLMsJ4wRk
         xe9ZX8qWQni2GYysoKseX80ImTUNGXgP0DCNSr1Y=
From:   Vinod Koul <vkoul@kernel.org>
To:     dmaengine@vger.kernel.org
Cc:     Vinod Koul <vkoul@kernel.org>, Allen Pais <allen.lkml@gmail.com>,
        Romain Perier <romain.perier@gmail.com>,
        linux-kernel@vger.kernel.org,
        Michal Simek <michal.simek@xilinx.com>,
        =?UTF-8?q?Rafa=C5=82=20Hibner?= <rafal.hibner@secom.com.pl>,
        Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>,
        Appana Durga Kedareswara rao <appana.durga.rao@xilinx.com>
Subject: [PATCH 3/5] dmaengine: xilinx_dma: fix kernel-doc style for tasklet
Date:   Wed,  7 Oct 2020 14:01:11 +0530
Message-Id: <20201007083113.567559-4-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201007083113.567559-1-vkoul@kernel.org>
References: <20201007083113.567559-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

Commit f19a11d40a78 ("dmaengine: xilinx: convert tasklets to use new
tasklet_setup() API") updated driver to use new tasklet_setup() API but
missed to update the documentation for the tasklet function.

Fixes: f19a11d40a78 ("dmaengine: xilinx: convert tasklets to use new tasklet_setup() API")
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/dma/xilinx/xilinx_dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index a9eb85ee6daf..ecff35402860 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -1044,7 +1044,7 @@ static void xilinx_dma_chan_desc_cleanup(struct xilinx_dma_chan *chan)
 
 /**
  * xilinx_dma_do_tasklet - Schedule completion tasklet
- * @data: Pointer to the Xilinx DMA channel structure
+ * @t: Pointer to the Xilinx DMA channel structure
  */
 static void xilinx_dma_do_tasklet(struct tasklet_struct *t)
 {
-- 
2.26.2

