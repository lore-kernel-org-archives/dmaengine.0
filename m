Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E402C6379D
	for <dmaengine@archiver.kernel.org>; Tue, 17 Nov 2020 10:58:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A61C621534
	for <dmaengine@archiver.kernel.org>; Tue, 17 Nov 2020 10:58:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ikBSvicE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727807AbgKQK4T (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Tue, 17 Nov 2020 05:56:19 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:59602 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727347AbgKQK4S (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Tue, 17 Nov 2020 05:56:18 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AHAuD0D019443;
        Tue, 17 Nov 2020 04:56:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1605610573;
        bh=vOyHJcWQgFd/X5VGt8S3nS+qlpjg6sSRGX+cBw76W44=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=ikBSvicEeXyZkVW/bI2E9SMbQ9sG+P56mnzbCDb6/hhEq4lYSm4epHS1dkxGULBFP
         eGXXo7gmyrCbnAKG3iBcCxtXefV+6xA4tvhkIDMJPdJ2L7uh890AaCTDklGuj96Gaq
         72GEpZlhbrNtCblViZkokE80M39bnNfM6/RjV1dE=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AHAuD4a009876
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 17 Nov 2020 04:56:13 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 17
 Nov 2020 04:56:12 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 17 Nov 2020 04:56:12 -0600
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AHAu6tl087311;
        Tue, 17 Nov 2020 04:56:10 -0600
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
To:     <vkoul@kernel.org>, <nm@ti.com>, <ssantosh@kernel.org>,
        <robh+dt@kernel.org>
CC:     <dan.j.williams@intel.com>, <t-kristo@ti.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <dmaengine@vger.kernel.org>, <vigneshr@ti.com>,
        <grygorii.strashko@ti.com>
Subject: [PATCH v2 01/19] dmaengine: ti: k3-udma: Correct normal channel offset when uchan_cnt is not 0
Date:   Tue, 17 Nov 2020 12:56:38 +0200
Message-ID: <20201117105656.5236-2-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201117105656.5236-1-peter.ujfalusi@ti.com>
References: <20201117105656.5236-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

According to different sections of the TRM, the hchan_cnt of CAP3 includes
the number of uchan in UDMA, thus the start offset of the normal channels
are hchan_cnt.

Fixes: daf4ad0499aa4 ("dmaengine: ti: k3-udma: Query throughput level information from hardware")
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 drivers/dma/ti/k3-udma.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index e508280b3d70..0e8426dd18a7 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -3199,8 +3199,7 @@ static int udma_setup_resources(struct udma_dev *ud)
 	} else if (UDMA_CAP3_UCHAN_CNT(cap3)) {
 		ud->tpl_levels = 3;
 		ud->tpl_start_idx[1] = UDMA_CAP3_UCHAN_CNT(cap3);
-		ud->tpl_start_idx[0] = ud->tpl_start_idx[1] +
-				       UDMA_CAP3_HCHAN_CNT(cap3);
+		ud->tpl_start_idx[0] = UDMA_CAP3_HCHAN_CNT(cap3);
 	} else if (UDMA_CAP3_HCHAN_CNT(cap3)) {
 		ud->tpl_levels = 2;
 		ud->tpl_start_idx[0] = UDMA_CAP3_HCHAN_CNT(cap3);
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

