Return-Path: <SRS0=OqEg=4N=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BA55C35DF5
	for <dmaengine@archiver.kernel.org>; Tue, 25 Feb 2020 08:15:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D996F218AC
	for <dmaengine@archiver.kernel.org>; Tue, 25 Feb 2020 08:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582618516;
	bh=n+2YgOKsGMMsAoGPW5aQGH0hk4is+s2lGuYr2A+eIUM=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=ZceAxoQrTEqMebhZIGQJ0cEIN87Y1PKi4nEgkfmyjbi3KdPxR8CSZJzjgMiPT/Uv1
	 Nm/nOeZ2GXNbn9B5Equ0Xa+v9APS1bAH/wpSR/Vz9rREkX7GGLnph0KQHVgSWDdYuj
	 pjI/SRIFybqoCaf/ESVB45Ut3dw/sn2Zw8lsAF5s=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729565AbgBYIPQ (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Tue, 25 Feb 2020 03:15:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:56180 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729360AbgBYIPQ (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Tue, 25 Feb 2020 03:15:16 -0500
Received: from localhost.localdomain (unknown [122.167.120.28])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 92E4A2176D;
        Tue, 25 Feb 2020 08:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582618515;
        bh=n+2YgOKsGMMsAoGPW5aQGH0hk4is+s2lGuYr2A+eIUM=;
        h=From:To:Cc:Subject:Date:From;
        b=Xuo+zimDxVGoYoXDUmQJob9uEwCku1rX47NSjLLNCOlqiBnagBLnQGZg7zdP1Hqvk
         TLjwhoQEdB9nQDNUXQYO8+ddjROIYgWtPTIL/BNun0tPxo6MP2+7KeUNdMdF/PoLnB
         Fd3G6f6gHwS1YdvnAsOnMd6sdP/GlvdWX/F2SEWk=
From:   Vinod Koul <vkoul@kernel.org>
To:     dmaengine@vger.kernel.org, Dave Jiang <dave.jiang@intel.com>
Cc:     Vinod Koul <vkoul@kernel.org>
Subject: [PATCH] dmaengine: idxd: remove set but unused 'rc'
Date:   Tue, 25 Feb 2020 13:44:59 +0530
Message-Id: <20200225081459.4117512-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

The driver assigns result of check_vma() to rc and never checks the
result, so remove the assignment

drivers/dma/idxd/cdev.c: In function ‘idxd_cdev_mmap’:
drivers/dma/idxd/cdev.c:136:6: warning: variable ‘rc’ set but not used [-Wunused-but-set-variable]
  136 |  int rc;
      |      ^~

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---

Dave, if you want the result of the check_vma() to be checked, feel free to
send the patch for that

 drivers/dma/idxd/cdev.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/dma/idxd/cdev.c b/drivers/dma/idxd/cdev.c
index 8dfdbe37e381..82b19eed6561 100644
--- a/drivers/dma/idxd/cdev.c
+++ b/drivers/dma/idxd/cdev.c
@@ -133,10 +133,9 @@ static int idxd_cdev_mmap(struct file *filp, struct vm_area_struct *vma)
 	struct pci_dev *pdev = idxd->pdev;
 	phys_addr_t base = pci_resource_start(pdev, IDXD_WQ_BAR);
 	unsigned long pfn;
-	int rc;
 
 	dev_dbg(&pdev->dev, "%s called\n", __func__);
-	rc = check_vma(wq, vma, __func__);
+	check_vma(wq, vma, __func__);
 
 	vma->vm_flags |= VM_DONTCOPY;
 	pfn = (base + idxd_get_wq_portal_full_offset(wq->id,
-- 
2.24.1

