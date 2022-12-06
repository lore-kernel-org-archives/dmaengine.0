Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E0D6C352A1
	for <dmaengine@archiver.kernel.org>; Tue,  6 Dec 2022 04:36:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233470AbiLFEg3 (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 5 Dec 2022 23:36:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232841AbiLFEgS (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Mon, 5 Dec 2022 23:36:18 -0500
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFD7515FF3;
        Mon,  5 Dec 2022 20:36:16 -0800 (PST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2B64a7FN084421;
        Mon, 5 Dec 2022 22:36:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1670301367;
        bh=k9emjr+Dl6s21oRvc/gyITAsl5kkv/Qh5rJAI+QMseM=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=wrCgGlDEjVC2asfXK7qnOQ1ZMbADWnc+J69Zzt27Vgxpq6GynT9CQnsPqQvyXT6SC
         lPpm2LO3aG69gsvjHyzu0LqQDOWNplIStP/hFlTB3qT6nSbnZ7Njx6PDwJFlSO84n6
         IVjOySUf9Yobebv9zO+BFJeuBVk2cJfU9Xr6O7B8=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2B64a7Op001588
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 5 Dec 2022 22:36:07 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 5
 Dec 2022 22:36:07 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 5 Dec 2022 22:36:07 -0600
Received: from uda0132425.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2B64Zx2a097382;
        Mon, 5 Dec 2022 22:36:05 -0600
From:   Vignesh Raghavendra <vigneshr@ti.com>
To:     Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC:     <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH 2/5] dmaengine: ti: k3-udma: Fix BCDMA for case w/o BCHAN
Date:   Tue, 6 Dec 2022 10:05:51 +0530
Message-ID: <20221206043554.1521522-3-vigneshr@ti.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221206043554.1521522-1-vigneshr@ti.com>
References: <20221206043554.1521522-1-vigneshr@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

Reusing loop iterator fails if BCHAN is not present as iterator is
uninitialized

Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---
 drivers/dma/ti/k3-udma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index ce8b80bb34d7..791cf6354946 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -4758,6 +4758,7 @@ static int bcdma_setup_resources(struct udma_dev *ud)
 		}
 	}
 
+	i = 0;
 	irq_res.desc = kcalloc(irq_res.sets, sizeof(*irq_res.desc), GFP_KERNEL);
 	if (!irq_res.desc)
 		return -ENOMEM;
-- 
2.38.1

