Return-Path: <dmaengine-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85229EB64DD
	for <dmaengine@archiver.kernel.org>; Fri, 11 Aug 2023 03:56:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232895AbjHKD4m (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Thu, 10 Aug 2023 23:56:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbjHKD4m (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Thu, 10 Aug 2023 23:56:42 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BC8B10DE;
        Thu, 10 Aug 2023 20:56:41 -0700 (PDT)
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.54])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RMVJ42267ztS48;
        Fri, 11 Aug 2023 11:53:08 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 11 Aug
 2023 11:56:38 +0800
From:   Guo Mengqi <guomengqi3@huawei.com>
To:     <vkoul@kernel.org>, <dmaengine@vger.kernel.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <devicetree@vger.kernel.org>
CC:     <guomengqi3@huawei.com>, <xuqiang36@huawei.com>
Subject: [PATCH 0/2] Add sdma driver for HiSilicon Ascend platform
Date:   Fri, 11 Aug 2023 11:48:20 +0800
Message-ID: <20230811034822.107229-1-guomengqi3@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

This is for the System Direct Memory Access(SDMA) hardware
used by HiSilicon Ascend families. The dma controller supports
data transfers between memory and memory or between memory and device.

Guo Mengqi (2):
  dmaengine: Add HiSilicon Ascend SDMA engine support
  dt-bindings: dma: hisi: Add bindings for Hisi Ascend sdma

 .../bindings/dma/hisi,ascend-sdma.yaml        |  82 ++
 drivers/dma/Kconfig                           |   9 +
 drivers/dma/Makefile                          |   1 +
 drivers/dma/ascend_sdma.c                     | 810 ++++++++++++++++++
 4 files changed, 902 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/hisi,ascend-sdma.yaml
 create mode 100644 drivers/dma/ascend_sdma.c

-- 
2.17.1

