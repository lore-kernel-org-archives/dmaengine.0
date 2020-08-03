Return-Path: <SRS0=VS9U=BN=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DF37C433E0
	for <dmaengine@archiver.kernel.org>; Mon,  3 Aug 2020 10:06:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EC3F720678
	for <dmaengine@archiver.kernel.org>; Mon,  3 Aug 2020 10:06:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="xk9cIdV9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726007AbgHCKGH (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 3 Aug 2020 06:06:07 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:32964 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725968AbgHCKGH (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Mon, 3 Aug 2020 06:06:07 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 073A63Fg085092;
        Mon, 3 Aug 2020 05:06:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1596449163;
        bh=J+Fnw71msihI6/cYlK2paPYclDYBXhVP6G44WiHA3KU=;
        h=From:To:CC:Subject:Date;
        b=xk9cIdV9+dwVP+5cSBk7xq1zXa3fJSZgdnyYtMHk2A2cXJjiPW2E12FD2puSWLfKr
         P39qbnAS7uAl+HYrw9m6cmWfy14zc5xvFvgOLF6AQOl6UW0ShcI+Ozh/AX3wXyqJOS
         G1ei3Vyo2gDrTj5HdFvWD8lZJhpahriTkW6MHxXQ=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 073A63jK025279
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 3 Aug 2020 05:06:03 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 3 Aug
 2020 05:06:03 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 3 Aug 2020 05:06:03 -0500
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 073A6171062354;
        Mon, 3 Aug 2020 05:06:02 -0500
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
To:     <vkoul@kernel.org>
CC:     <dmaengine@vger.kernel.org>, <dan.j.williams@intel.com>
Subject: [PATCH] dmaengine: ti: k3-psil-j721e: Add entries for 2nd port of MCU SA2UL
Date:   Mon, 3 Aug 2020 13:07:24 +0300
Message-ID: <20200803100724.19003-1-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

The security accelerator within MCU domain supports two ports similarly
to the SA2UL in MAIN domain.

Add endpoint configuration for the two ingress and one egress threads of
the second port.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 drivers/dma/ti/k3-psil-j721e.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/dma/ti/k3-psil-j721e.c b/drivers/dma/ti/k3-psil-j721e.c
index e3cfd5f66842..7580870ed746 100644
--- a/drivers/dma/ti/k3-psil-j721e.c
+++ b/drivers/dma/ti/k3-psil-j721e.c
@@ -166,6 +166,8 @@ static struct psil_ep j721e_src_ep_map[] = {
 	/* SA2UL */
 	PSIL_SA2UL(0x7500, 0),
 	PSIL_SA2UL(0x7501, 0),
+	PSIL_SA2UL(0x7502, 0),
+	PSIL_SA2UL(0x7503, 0),
 };
 
 /* PSI-L destination thread IDs, used for TX (DMA_MEM_TO_DEV) */
@@ -211,6 +213,7 @@ static struct psil_ep j721e_dst_ep_map[] = {
 	PSIL_ETHERNET(0xf007),
 	/* SA2UL */
 	PSIL_SA2UL(0xf500, 1),
+	PSIL_SA2UL(0xf501, 1),
 };
 
 struct psil_ep_map j721e_ep_map = {
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

