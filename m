Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9430C4332F
	for <dmaengine@archiver.kernel.org>; Sat,  1 Oct 2022 03:08:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232812AbiJADIs (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Fri, 30 Sep 2022 23:08:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232573AbiJADH1 (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Fri, 30 Sep 2022 23:07:27 -0400
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 115A7CA281;
        Fri, 30 Sep 2022 20:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1664593601; x=1696129601;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MjC1xNzKenBHU8kT4k360DnZXsHo+Jy276zH+wgLXt4=;
  b=WfW68bTouPb9+WZhrdKV/YvRkvdlcuKmwhvVGQQaJVvQQ4hKQaNAjAoW
   A1hbpHQiep5yvIpW0aUW1zhgCCO6jAnuJxc3hIDdzBcuolpgkFBzj1TPX
   AGrAuG96N2psOWwgAVG8srWFZ7zyParE6MjEieWgQvFj/lQfu4ucEsSnM
   8=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 30 Sep 2022 20:06:40 -0700
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2022 20:06:40 -0700
Received: from hu-molvera-sd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Fri, 30 Sep 2022 20:06:40 -0700
From:   Melody Olvera <quic_molvera@quicinc.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC:     <linux-arm-msm@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Melody Olvera <quic_molvera@quicinc.com>
Subject: [PATCH 1/2] dt-bindings: dmaengine: qcom: gpi: Add compatible for QDU1000 and QRU1000
Date:   Fri, 30 Sep 2022 20:06:26 -0700
Message-ID: <20221001030627.29147-2-quic_molvera@quicinc.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221001030627.29147-1-quic_molvera@quicinc.com>
References: <20221001030627.29147-1-quic_molvera@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

Add compatible documentation for Qualcomm QDU1000 and QRU1000 SoCs.

Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
---
 Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
index 7d2fc4eb5530..e37cee079c78 100644
--- a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
+++ b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
@@ -25,6 +25,8 @@ properties:
       - qcom,sm8250-gpi-dma
       - qcom,sm8350-gpi-dma
       - qcom,sm8450-gpi-dma
+      - qcom,qdu1000-gpi-dma
+      - qcom,qru1000-gpi-dma
 
   reg:
     maxItems: 1
-- 
2.37.3

