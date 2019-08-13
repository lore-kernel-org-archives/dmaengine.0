Return-Path: <SRS0=dTBq=WJ=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E039C433FF
	for <dmaengine@archiver.kernel.org>; Tue, 13 Aug 2019 08:06:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4A32520665
	for <dmaengine@archiver.kernel.org>; Tue, 13 Aug 2019 08:06:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727359AbfHMIGI (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Tue, 13 Aug 2019 04:06:08 -0400
Received: from mga12.intel.com ([192.55.52.136]:10485 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727326AbfHMIGH (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Tue, 13 Aug 2019 04:06:07 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Aug 2019 01:06:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,380,1559545200"; 
   d="scan'208";a="375520866"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.59])
  by fmsmga005.fm.intel.com with ESMTP; 13 Aug 2019 01:06:06 -0700
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
To:     dmaengine@vger.kernel.org
Cc:     Viresh Kumar <vireshk@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH] dmaengine: dw: Update Intel Elkhart Lake Service Engine acronym
Date:   Tue, 13 Aug 2019 11:06:02 +0300
Message-Id: <20190813080602.15376-1-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

Intel Elkhart Lake Offload Service Engine (OSE) will be called as
Intel(R) Programmable Services Engine (Intel(R) PSE) in documentation.

Update the comment here accordingly.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/dma/dw/pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/dw/pci.c b/drivers/dma/dw/pci.c
index 8de87b15a988..ad6db1cc287e 100644
--- a/drivers/dma/dw/pci.c
+++ b/drivers/dma/dw/pci.c
@@ -143,7 +143,7 @@ static const struct pci_device_id dw_pci_id_table[] = {
 	{ PCI_VDEVICE(INTEL, 0x2286), (kernel_ulong_t)&dw_pci_data },
 	{ PCI_VDEVICE(INTEL, 0x22c0), (kernel_ulong_t)&dw_pci_data },
 
-	/* Elkhart Lake iDMA 32-bit (OSE DMA) */
+	/* Elkhart Lake iDMA 32-bit (PSE DMA) */
 	{ PCI_VDEVICE(INTEL, 0x4bb4), (kernel_ulong_t)&idma32_pci_data },
 	{ PCI_VDEVICE(INTEL, 0x4bb5), (kernel_ulong_t)&idma32_pci_data },
 	{ PCI_VDEVICE(INTEL, 0x4bb6), (kernel_ulong_t)&idma32_pci_data },
-- 
2.20.1

