Return-Path: <SRS0=KqRe=5I=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56841C3F2CD
	for <dmaengine@archiver.kernel.org>; Mon, 23 Mar 2020 17:20:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1916A20771
	for <dmaengine@archiver.kernel.org>; Mon, 23 Mar 2020 17:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1584984005;
	bh=jm8InWEtaTJ96zgFHkskp9C24p/HBzTUp+cVOeiyDFU=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=Ndlpri1YQoZNAljEtDEhySgRWMX8KdflW/LuTIZ8F0YcbM0Ln/cXdXevnkKA+jY2N
	 M4QWTtnM2sx4lWqibRm1k2NPkgIi8kf+TEPH3KxWTiPhVNZrY71vfxaO+HcQsxUiwL
	 1RPfDc7u7wfvOVnLtW9G+mWVu/9SzSywzR0p8Xsc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727811AbgCWRUD (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 23 Mar 2020 13:20:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:51740 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727801AbgCWRUD (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Mon, 23 Mar 2020 13:20:03 -0400
Received: from localhost.localdomain (unknown [122.178.205.141])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0AE652072D;
        Mon, 23 Mar 2020 17:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584984003;
        bh=jm8InWEtaTJ96zgFHkskp9C24p/HBzTUp+cVOeiyDFU=;
        h=From:To:Cc:Subject:Date:From;
        b=dz6Y39hqDD9ok6G8I6v5ow45EqBGyV/9kSkTm5AJx4Arix4300e/j4aIJGXQP8kf3
         /F+QpNVy6ILBnACdPpNvilpR8q4PetK2NHsCi75VAr2wMKMiah2DZ+HZ126e4j6q/3
         tMXYoCqnPNm6D46cVPnByPzdikoLLIukacLc6n5w=
From:   Vinod Koul <vkoul@kernel.org>
To:     dmaengine@vger.kernel.org
Cc:     Vinod Koul <vkoul@kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        kbuild test robot <lkp@intel.com>
Subject: [PATCH] dmaengine: uniphier-xdmac: Remove redandant error log for platform_get_irq
Date:   Mon, 23 Mar 2020 22:49:28 +0530
Message-Id: <20200323171928.424223-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

platform_get_irq prints the error on failure, so there is no need to
have caller add a log.
Remove the log in uniphier_xdmac_probe() for platform_get_irq() failure

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/dma/uniphier-xdmac.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/dma/uniphier-xdmac.c b/drivers/dma/uniphier-xdmac.c
index 2f6fd518d180..7b2f8a8c2d31 100644
--- a/drivers/dma/uniphier-xdmac.c
+++ b/drivers/dma/uniphier-xdmac.c
@@ -525,10 +525,8 @@ static int uniphier_xdmac_probe(struct platform_device *pdev)
 		uniphier_xdmac_chan_init(xdev, i);
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(dev, "Failed to get IRQ\n");
+	if (irq < 0)
 		return irq;
-	}
 
 	ret = devm_request_irq(dev, irq, uniphier_xdmac_irq_handler,
 			       IRQF_SHARED, "xdmac", xdev);
-- 
2.25.1

