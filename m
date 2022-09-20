Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82CC4C6FA8B
	for <dmaengine@archiver.kernel.org>; Tue, 20 Sep 2022 02:07:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230139AbiITCHb (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 19 Sep 2022 22:07:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230110AbiITCH1 (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Mon, 19 Sep 2022 22:07:27 -0400
Received: from ssh248.corpemail.net (ssh248.corpemail.net [210.51.61.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7550157233;
        Mon, 19 Sep 2022 19:07:26 -0700 (PDT)
Received: from ([60.208.111.195])
        by ssh248.corpemail.net ((D)) with ASMTP (SSL) id OBB00119;
        Tue, 20 Sep 2022 10:07:19 +0800
Received: from localhost.localdomain (10.200.104.82) by
 jtjnmail201619.home.langchao.com (10.100.2.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 20 Sep 2022 10:07:23 +0800
From:   Deming Wang <wangdeming@inspur.com>
To:     <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>
CC:     <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Deming Wang <wangdeming@inspur.com>
Subject: [PATCH] Documentation: devicetree: dma: update the comments
Date:   Mon, 19 Sep 2022 22:07:21 -0400
Message-ID: <20220920020721.2190-1-wangdeming@inspur.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.200.104.82]
X-ClientProxiedBy: Jtjnmail201613.home.langchao.com (10.100.2.13) To
 jtjnmail201619.home.langchao.com (10.100.2.19)
tUid:   202292010071955bafad3c998c61281a4986e3cacb721
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

remove the double word to.

Signed-off-by: Deming Wang <wangdeming@inspur.com>
---
 Documentation/devicetree/bindings/dma/ti-dma-crossbar.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/ti-dma-crossbar.txt b/Documentation/devicetree/bindings/dma/ti-dma-crossbar.txt
index b849a1ed389d..47e477cce6d2 100644
--- a/Documentation/devicetree/bindings/dma/ti-dma-crossbar.txt
+++ b/Documentation/devicetree/bindings/dma/ti-dma-crossbar.txt
@@ -4,7 +4,7 @@ Required properties:
 - compatible:	"ti,dra7-dma-crossbar" for DRA7xx DMA crossbar
 		"ti,am335x-edma-crossbar" for AM335x and AM437x
 - reg:		Memory map for accessing module
-- #dma-cells:	Should be set to to match with the DMA controller's dma-cells
+- #dma-cells:	Should be set to match with the DMA controller's dma-cells
 		for ti,dra7-dma-crossbar and <3> for ti,am335x-edma-crossbar.
 - dma-requests:	Number of DMA requests the crossbar can receive
 - dma-masters:	phandle pointing to the DMA controller
-- 
2.27.0

