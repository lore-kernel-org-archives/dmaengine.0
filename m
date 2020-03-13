Return-Path: <SRS0=iScN=46=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89FB0C10DCE
	for <dmaengine@archiver.kernel.org>; Fri, 13 Mar 2020 01:28:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 63A5D206F7
	for <dmaengine@archiver.kernel.org>; Fri, 13 Mar 2020 01:28:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726882AbgCMB2T (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Thu, 12 Mar 2020 21:28:19 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:38636 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726620AbgCMB2T (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Thu, 12 Mar 2020 21:28:19 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id CABAF225FA0977D84417;
        Fri, 13 Mar 2020 09:28:15 +0800 (CST)
Received: from localhost.localdomain (10.69.192.58) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.487.0; Fri, 13 Mar 2020 09:28:06 +0800
From:   Zhou Wang <wangzhou1@hisilicon.com>
To:     <vkoul@kernel.org>
CC:     <dmaengine@vger.kernel.org>, Zhou Wang <wangzhou1@hisilicon.com>
Subject: [PATCH] MAINTAINERS: Add maintainer for HiSilicon DMA engine driver
Date:   Fri, 13 Mar 2020 09:23:44 +0800
Message-ID: <1584062624-196854-1-git-send-email-wangzhou1@hisilicon.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.58]
X-CFilter-Loop: Reflected
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

Add myself as the maintainer of HiSilicon DMA engine driver.

Signed-off-by: Zhou Wang <wangzhou1@hisilicon.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a6fbdf3..7399ebd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7518,6 +7518,12 @@ F:	include/uapi/linux/if_hippi.h
 F:	net/802/hippi.c
 F:	drivers/net/hippi/
 
+HISILICON DMA DRIVER
+M:	Zhou Wang <wangzhou1@hisilicon.com>
+L:	dmaengine@vger.kernel.org
+S:	Maintained
+F:	drivers/dma/hisi_dma.c
+
 HISILICON SECURITY ENGINE V2 DRIVER (SEC2)
 M:	Zaibo Xu <xuzaibo@huawei.com>
 L:	linux-crypto@vger.kernel.org
-- 
2.8.1

