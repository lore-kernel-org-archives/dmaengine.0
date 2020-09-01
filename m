Return-Path: <SRS0=K2lT=CK=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DD2EC433E7
	for <dmaengine@archiver.kernel.org>; Tue,  1 Sep 2020 16:09:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 648722067C
	for <dmaengine@archiver.kernel.org>; Tue,  1 Sep 2020 16:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1598976584;
	bh=MTEbpe8X1nLaQUbTstx4qsG5E9DJUsRyNcHpbPRnEOY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=XSPgfMtHKjkh6AJDw7xO7m9KOW/7ZMtUuvF4IjPZzGQgNWR4tW513Uzwwdi15ggsL
	 JdtN7THa+prVrsk2rv3j4dXXMNo9073sR/5qJxqNcxDrxPZNZhT73LO/6KM6C1SRn9
	 I3m4JJf0wabRjqb8hnjbRvXa9VJpbzGWGPE/omIU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728742AbgIAQJn (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Tue, 1 Sep 2020 12:09:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:48068 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731399AbgIAPiq (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Tue, 1 Sep 2020 11:38:46 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6141F20866;
        Tue,  1 Sep 2020 15:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598974726;
        bh=MTEbpe8X1nLaQUbTstx4qsG5E9DJUsRyNcHpbPRnEOY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QBzPYI7CoakaHo0nG/6iFpSPMsi8c0ddaEowDDrtibYty0/5eOcFZC95G4YHHAwEc
         fA6clXgQQ5CLJz+BcKy5+i8kwfssmEqSXwbBVNDI6M8xHRXFht2nyjR+AblJqZpIdv
         83yJDNWbW3vdBB7eDCwRJC4Or5k5mqRzv/4zuZDo=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-kernel@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        stable@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
        Dave Jiang <dave.jiang@intel.com>, dmaengine@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>, Sasha Levin <sashal@kernel.org>
Subject: [PATCH 5.8 070/255] dmaengine: idxd: fix PCI_MSI build errors
Date:   Tue,  1 Sep 2020 17:08:46 +0200
Message-Id: <20200901151004.086401987@linuxfoundation.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200901151000.800754757@linuxfoundation.org>
References: <20200901151000.800754757@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

[ Upstream commit d6a7bb869dd8a516901591136a9a895fd829d6c6 ]

Fix build errors when CONFIG_PCI_MSI is not enabled by making the
driver depend on PCI_MSI:

ld: drivers/dma/idxd/device.o: in function `idxd_mask_msix_vector':
device.c:(.text+0x26f): undefined reference to `pci_msi_mask_irq'
ld: drivers/dma/idxd/device.o: in function `idxd_unmask_msix_vector':
device.c:(.text+0x2af): undefined reference to `pci_msi_unmask_irq'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Dave Jiang <dave.jiang@intel.com>
Cc: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>
Link: https://lore.kernel.org/r/9dee3f46-70d9-ea75-10cb-5527ab297d1d@infradead.org
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/dma/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
index de41d7928bff2..984354ca877de 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -285,6 +285,7 @@ config INTEL_IDMA64
 config INTEL_IDXD
 	tristate "Intel Data Accelerators support"
 	depends on PCI && X86_64
+	depends on PCI_MSI
 	select DMA_ENGINE
 	select SBITMAP
 	help
-- 
2.25.1



