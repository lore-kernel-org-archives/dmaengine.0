Return-Path: <SRS0=ZDLz=7J=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2C48C433E1
	for <dmaengine@archiver.kernel.org>; Wed, 27 May 2020 07:05:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B31852078C
	for <dmaengine@archiver.kernel.org>; Wed, 27 May 2020 07:05:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Ith8zYH0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728498AbgE0HFj (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 27 May 2020 03:05:39 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:54896 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726025AbgE0HFj (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Wed, 27 May 2020 03:05:39 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04R75XkK119017;
        Wed, 27 May 2020 02:05:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1590563133;
        bh=o+AxwMAocz9eujzhqqJSH4TSGNSCEvRk0+cCUT3iGiA=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Ith8zYH0haMMUOSJGoEgSN74SxUlokH0W4YnrU+a/evmUgnuvTWBCAB/CZMKsGBmx
         PdbsxBX+jjWD3HO3RfMYJNlcjCLsgjVAmdbulnYsVEtsnDkt2ky/Kv+QMfjk3LhaLm
         1iX+Y7nu5gWV6ouLh3PrjvGmCg7CHLkqawGrJv1o=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04R75XKh016694;
        Wed, 27 May 2020 02:05:33 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 27
 May 2020 02:05:33 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 27 May 2020 02:05:33 -0500
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04R75UF5065430;
        Wed, 27 May 2020 02:05:32 -0500
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
To:     <vkoul@kernel.org>
CC:     <dmaengine@vger.kernel.org>, <dan.j.williams@intel.com>
Subject: [PATCH 1/2] dmaengine: ti: k3-udma: Fix cleanup code for alloc_chan_resources
Date:   Wed, 27 May 2020 10:06:11 +0300
Message-ID: <20200527070612.636-2-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200527070612.636-1-peter.ujfalusi@ti.com>
References: <20200527070612.636-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

Some of the earlier errors should be sent to the error cleanup path to
make sure that the uchan struct is reset, the dma_pool (if allocated) is
released and memcpy channel pairs are released in a correct way.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 drivers/dma/ti/k3-udma.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index 4bc470eb4143..502d7f2edd8a 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -1753,7 +1753,8 @@ static int udma_alloc_chan_resources(struct dma_chan *chan)
 			dev_err(ud->ddev.dev,
 				"Descriptor pool allocation failed\n");
 			uc->use_dma_pool = false;
-			return -ENOMEM;
+			ret = -ENOMEM;
+			goto err_cleanup;
 		}
 	}
 
@@ -1773,16 +1774,18 @@ static int udma_alloc_chan_resources(struct dma_chan *chan)
 
 		ret = udma_get_chan_pair(uc);
 		if (ret)
-			return ret;
+			goto err_cleanup;
 
 		ret = udma_alloc_tx_resources(uc);
-		if (ret)
-			return ret;
+		if (ret) {
+			udma_put_rchan(uc);
+			goto err_cleanup;
+		}
 
 		ret = udma_alloc_rx_resources(uc);
 		if (ret) {
 			udma_free_tx_resources(uc);
-			return ret;
+			goto err_cleanup;
 		}
 
 		uc->config.src_thread = ud->psil_base + uc->tchan->id;
@@ -1800,10 +1803,8 @@ static int udma_alloc_chan_resources(struct dma_chan *chan)
 			uc->id);
 
 		ret = udma_alloc_tx_resources(uc);
-		if (ret) {
-			uc->config.remote_thread_id = -1;
-			return ret;
-		}
+		if (ret)
+			goto err_cleanup;
 
 		uc->config.src_thread = ud->psil_base + uc->tchan->id;
 		uc->config.dst_thread = uc->config.remote_thread_id;
@@ -1820,10 +1821,8 @@ static int udma_alloc_chan_resources(struct dma_chan *chan)
 			uc->id);
 
 		ret = udma_alloc_rx_resources(uc);
-		if (ret) {
-			uc->config.remote_thread_id = -1;
-			return ret;
-		}
+		if (ret)
+			goto err_cleanup;
 
 		uc->config.src_thread = uc->config.remote_thread_id;
 		uc->config.dst_thread = (ud->psil_base + uc->rchan->id) |
@@ -1838,7 +1837,9 @@ static int udma_alloc_chan_resources(struct dma_chan *chan)
 		/* Can not happen */
 		dev_err(uc->ud->dev, "%s: chan%d invalid direction (%u)\n",
 			__func__, uc->id, uc->config.dir);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err_cleanup;
+
 	}
 
 	/* check if the channel configuration was successful */
@@ -1919,7 +1920,7 @@ static int udma_alloc_chan_resources(struct dma_chan *chan)
 err_res_free:
 	udma_free_tx_resources(uc);
 	udma_free_rx_resources(uc);
-
+err_cleanup:
 	udma_reset_uchan(uc);
 
 	if (uc->use_dma_pool) {
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

