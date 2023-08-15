Return-Path: <dmaengine-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60B55C001DB
	for <dmaengine@archiver.kernel.org>; Tue, 15 Aug 2023 02:42:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234252AbjHOClx (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 14 Aug 2023 22:41:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234334AbjHOCl2 (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Mon, 14 Aug 2023 22:41:28 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92E30ED
        for <dmaengine@vger.kernel.org>; Mon, 14 Aug 2023 19:41:27 -0700 (PDT)
Received: from dggpemm500021.china.huawei.com (unknown [172.30.72.56])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RPwTy2kcdzrS5x;
        Tue, 15 Aug 2023 10:40:06 +0800 (CST)
Received: from localhost.localdomain (10.175.103.91) by
 dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 15 Aug 2023 10:41:25 +0800
From:   Jialin Zhang <zhangjialin11@huawei.com>
To:     <vkoul@kernel.org>
CC:     <dmaengine@vger.kernel.org>, <liwei391@huawei.com>,
        <wangxiongfeng2@huawei.com>
Subject: [PATCH] dmaengine: ioatdma: use pci_dev_id() to simplify the code
Date:   Tue, 15 Aug 2023 10:38:21 +0800
Message-ID: <20230815023821.3518007-1-zhangjialin11@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500021.china.huawei.com (7.185.36.109)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

PCI core API pci_dev_id() can be used to get the BDF number for a pci
device. We don't need to compose it mannually. Use pci_dev_id() to
simplify the code a little bit.

Signed-off-by: Jialin Zhang <zhangjialin11@huawei.com>
---
 drivers/dma/ioat/dca.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/ioat/dca.c b/drivers/dma/ioat/dca.c
index 289c59ed74b9..17f6b6367113 100644
--- a/drivers/dma/ioat/dca.c
+++ b/drivers/dma/ioat/dca.c
@@ -51,7 +51,7 @@
 /* pack PCI B/D/F into a u16 */
 static inline u16 dcaid_from_pcidev(struct pci_dev *pci)
 {
-	return (pci->bus->number << 8) | pci->devfn;
+	return pci_dev_id(pci);
 }
 
 static int dca_enabled_in_bios(struct pci_dev *pdev)
-- 
2.25.1

