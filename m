Return-Path: <SRS0=+u/s=DH=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33A85C4727F
	for <dmaengine@archiver.kernel.org>; Wed, 30 Sep 2020 09:14:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D6B9C20738
	for <dmaengine@archiver.kernel.org>; Wed, 30 Sep 2020 09:14:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="CBQ9P5Si"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729231AbgI3JOs (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 30 Sep 2020 05:14:48 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:35202 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729178AbgI3JOm (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Wed, 30 Sep 2020 05:14:42 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08U9EcHp035112;
        Wed, 30 Sep 2020 04:14:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1601457278;
        bh=r6BZcfFspKekPk2CsVfLnHhDTFjI4u11uU/6NZJdVNU=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=CBQ9P5SiEzy0dcX4PJlIBgutt2z55EpzRhTyLcms2dWr3JLZGLb7ISDOMupMQ0Mpz
         JOuon+dme+rPUNTGYiLUQpiu9IQXXj6iY0pSheclceNaqLnGlCe6ggpl5rzUqfhumz
         5VSOWaijk4BzjJYEvGqcn8ZKsJH4cp8rE4kkssHc=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08U9EcHJ100066
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 30 Sep 2020 04:14:38 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 30
 Sep 2020 04:14:37 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 30 Sep 2020 04:14:37 -0500
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08U9DuJk116385;
        Wed, 30 Sep 2020 04:14:35 -0500
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
To:     <vkoul@kernel.org>, <nm@ti.com>, <ssantosh@kernel.org>,
        <robh+dt@kernel.org>, <vigneshr@ti.com>
CC:     <dan.j.williams@intel.com>, <t-kristo@ti.com>,
        <lokeshvutla@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <dmaengine@vger.kernel.org>
Subject: [PATCH 13/18] dmaengine: ti: Add support for k3 event routers
Date:   Wed, 30 Sep 2020 12:14:07 +0300
Message-ID: <20200930091412.8020-14-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200930091412.8020-1-peter.ujfalusi@ti.com>
References: <20200930091412.8020-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

In k3 architecture a DMA channel (in TR momde) can be triggered by global
events, origination from different modules.

The events for triggers can be sent from any module which is connected to
PSI-L fabric, but the event number to be sent is DMA channel specific, it
is only known after the channel itself is requested.

The router operation needs to be split up:
- route_allocate: configure the dma_spec for the DMA and store the
  configuration which is needed for the router's input
- set_event: callback used by the DMA driver to set the event number for
  the channel and enable the routing

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 include/linux/dma/k3-event-router.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 include/linux/dma/k3-event-router.h

diff --git a/include/linux/dma/k3-event-router.h b/include/linux/dma/k3-event-router.h
new file mode 100644
index 000000000000..e3f88b2f87be
--- /dev/null
+++ b/include/linux/dma/k3-event-router.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ *  Copyright (C) 2020 Texas Instruments Incorporated - https://www.ti.com
+ */
+
+#ifndef K3_EVENT_ROUTER_
+#define K3_EVENT_ROUTER_
+
+#include <linux/types.h>
+
+struct k3_event_route_data {
+	void *priv;
+	int (*set_event)(void *priv, u32 event);
+};
+
+#endif /* K3_EVENT_ROUTER_ */
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

