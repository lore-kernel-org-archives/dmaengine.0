Received: from out30-112.freemail.mail.aliyun.com (out30-112.freemail.mail.aliyun.com [115.124.30.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4EF92236E0
	for <dmaengine@vger.kernel.org>; Tue, 14 Apr 2026 12:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776170752; cv=none; b=gDAxdD2Md96eL+/eZEWuPR/bvRQFCDAEyg7Cn7VKkoMwGagIhVB2qBg7X4bZ/B+CquoRzL1ua0XbcvNhKfTXbQdNt46h6maLTEHrWKGfJeLJ9ZhnwYGgK5+WMYq6+dO6t/6O1FM46f0iMssmX3vVtVANMLmq5efFFnM87u96Kos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776170752; c=relaxed/simple;
	bh=KjfDFsCJG4cWAUuBUVK2ugLPrW0kMFaJOoABDPpwkSs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=j2O1yGN/gCUKj9q3PPSqp4BuR/HgI/yOBvwxeHdzCeiDj7egjIYWL0y8LB/ULcxIoXHZrivHKVQg9uMM4lFLpy0ieCtV8kz2Luh43rwbmpACBKeHCXTRTZjEXV5P+4oAF76RlLi3Mp2Ls2N3rCzP0YeTnTEVlBsUYzlXLsd3mtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=bKDyyojL; arc=none smtp.client-ip=115.124.30.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="bKDyyojL"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1776170741; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=qK/rX1AEe5+MgUbDntQ7N2lP2VJ940oRqJHSxhzqd4E=;
	b=bKDyyojLZ6949PF3z1T4x7Hz0D/DIYAJBdOYFcHnOkCyzreAMiM3En931Q8Dq97G+Sx3/DmcvH31ta3Fgc4beTnN9vPCFe6POBdMZ4W9NHbMIkrSKgxeAWdadyo9meJMEAd64EnId5evxoAqNTWb4PRoRarlmPVaTd4fiu4fWGQ=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=kanie@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0X11UUJo_1776170735;
Received: from localhost(mailfrom:kanie@linux.alibaba.com fp:SMTPD_---0X11UUJo_1776170735 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 14 Apr 2026 20:45:40 +0800
From: Guixin Liu <kanie@linux.alibaba.com>
To: Vinicius Costa Gomes <vinicius.gomes@intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org,
	Xunlei Pang <xlpang@linux.alibaba.com>,
	oliver.yang@linux.alibaba.com
Subject: [PATCH] dmaengine: idxd: Fix use-after-free of idxd_wq
Date: Tue, 14 Apr 2026 20:45:35 +0800
Message-Id: <20260414124535.19353-1-kanie@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We found an idxd_wq use-after-free issue with kasan:
Use location:
BUG: KASAN: slab-use-after-free in idxd_device_drv_remove+0x1f8/0x240 [idxd]
Call Trace:
  <TASK>
  dump_stack_lvl+0x32/0x50
  print_address_description.constprop.0+0x2c/0x390
  ? idxd_device_drv_remove+0x1f8/0x240 [idxd]
  print_report+0xba/0x280
  ? kasan_addr_to_slab+0x9/0xa0
  ? idxd_device_drv_remove+0x1f8/0x240 [idxd]
  kasan_report+0xab/0xe0
  ? idxd_device_drv_remove+0x1f8/0x240 [idxd]
  idxd_device_drv_remove+0x1f8/0x240 [idxd]
  device_release_driver_internal+0x391/0x560
  bus_remove_device+0x1f5/0x3f0
  device_del+0x392/0x990
  ? __pfx_device_del+0x10/0x10
  ? kobject_cleanup+0x117/0x360
  ? idxd_unregister_devices+0x229/0x320 [idxd]
  device_unregister+0x13/0xa0
  idxd_remove+0x4f/0x1b0 [idxd]
  pci_device_remove+0xa7/0x1d0
  device_release_driver_internal+0x391/0x560
  ? pci_pme_active+0x1e/0x450
  pci_stop_bus_device+0x10a/0x150
  pci_stop_and_remove_bus_device_locked+0x16/0x30
  remove_store+0xcf/0xe0

Freed by task 15535:
  kasan_save_stack+0x1c/0x40
  kasan_set_track+0x21/0x30
  kasan_save_free_info+0x27/0x40
  ____kasan_slab_free+0x171/0x240
  slab_free_freelist_hook+0xde/0x190
  __kmem_cache_free+0x19e/0x310
  device_release+0x98/0x210
  kobject_cleanup+0x102/0x360
  idxd_unregister_devices+0xb3/0x320 [idxd]
  dxd_remove+0x3f/0x1b0 [idxd]
  pci_device_remove+0xa7/0x1d0
  device_release_driver_internal+0x391/0x560
  pci_stop_bus_device+0x10a/0x150
  pci_stop_and_remove_bus_device_locked+0x16/0x30
  remove_store+0xcf/0xe0

In the idxd_remove() flow, when execution reaches
idxd_unregister_devices(), all idxd_wq instances have already been
freed. Subsequently, when device_unregister(idxd_confdev(idxd)) is
executed, it calls into idxd_device_drv_remove() which accesses the
already-freed idxd_wq. This fix resolves the issue by swapping the order
of these two operations.

Fixes: 98da0106aac0d ("dmanegine: idxd: fix resource free ordering on driver removal")
Signed-off-by: Guixin Liu <kanie@linux.alibaba.com>
---
 drivers/dma/idxd/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/idxd/init.c b/drivers/dma/idxd/init.c
index f1cfc7790d95..4f001ef6b1ef 100644
--- a/drivers/dma/idxd/init.c
+++ b/drivers/dma/idxd/init.c
@@ -1293,7 +1293,6 @@ static void idxd_remove(struct pci_dev *pdev)
 {
 	struct idxd_device *idxd = pci_get_drvdata(pdev);
 
-	idxd_unregister_devices(idxd);
 	/*
 	 * When ->release() is called for the idxd->conf_dev, it frees all the memory related
 	 * to the idxd context. The driver still needs those bits in order to do the rest of
@@ -1303,6 +1302,7 @@ static void idxd_remove(struct pci_dev *pdev)
 	 */
 	get_device(idxd_confdev(idxd));
 	device_unregister(idxd_confdev(idxd));
+	idxd_unregister_devices(idxd);
 	idxd_shutdown(pdev);
 	idxd_device_remove_debugfs(idxd);
 	perfmon_pmu_remove(idxd);
-- 
2.32.0.3.g01195cf9f

