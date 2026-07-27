Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3A942BC48
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184265; cv=none; b=hofef1k1Py7QBymUmqg2vhmE0TQBsZqy2iVj0gGZiaAcPhSZA9mPHJ/LCpk+3/L+Swx3eBzSD8HCvM+6MK8nvF4mWWNTmNNeUgBqdMOlbDU/LPCT5deK65ekCc0tLjdUcNDMzrcKZosnLFltUJWNgTuGBY/4zVueGirH0S3qvnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184265; c=relaxed/simple;
	bh=htPEkRt/wlUc/B5CfMfsVrTbdwmpn7Pc0EUUOX+Q2x0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VsN3OeKUmVGxybjYLw+seJKbUeLqXrgB1cJDnK/CCt80jQ1PKogmEnPYUQWbop7iAQhRzsJGf52UC1FgSa5zJqs8M1fVcosNGDlAmwdbHC8CdpBRS76q0IchVZbBiSe9Oa0DVrHZXDnu0mgBJUPCtQmRC6+YkSHHhXowkViOmII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D3+FdmP9; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D3+FdmP9"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2caea3f742bso38311035ad.0
        for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 13:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184263; x=1785789063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eL6u4024lYZo08Y4G1gwSt9iJeSU/PAgv8//3iOWwdk=;
        b=D3+FdmP9V6rsovSMOLDc/rzdoEyDzWHzxgXXJ0fwqmKUKtwrSlbU0S+6s7lKFAygoi
         g2vfbeVS10E1M8nWvKBLHARFZSHNAiY5OFXZrlOpmRriBOe0VYf/Rr3hjcBi8BAL3nds
         l16KuR/Xk0ZrO/wnF4SasbPD3/Bg+0oBt9vXlckA8PV33QrsNMf9XppCmJocAe1wBFsa
         DbpfaxeWvJe3pixOuZYqdaw7KMWh7F7YpZBRnKl19c/sHINtJuey1tnN/T/yJaGd5jQY
         43wY8D51o/n8XrR2xNmK0BwgvMDnP4mnxQVHDfOZf3SiSkCWbgHYI8NHUfj0Cn3riTpT
         FcEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184263; x=1785789063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eL6u4024lYZo08Y4G1gwSt9iJeSU/PAgv8//3iOWwdk=;
        b=l1+hCguNNclbzClM7sfdAmXU8Ai+rqQ5flRhvgn0BJCzNaKWQ9Ss/7qcvHD6C+VM+H
         UMgQhG0BDg+s56qXqGRAiZUAjAXUqZ5EF8VWjcA4+s6ttGNXgdyrwavAV+8YXSFcTAL1
         nby4nJ8O947aEwnvEDC3qwv/SSoA8LaMJwzfLSADauIohtbjMDWwnbzKrxK3O7ckOlcA
         1Tl5gmg8ro8DhZ6hG8qzrR0uVVIyevcO8fRIX02y4S6KuxL8zA+lQ+3JTRsbXz4v2yHM
         4UDd/9Fqe4lnkUFA6hjsBBiJoA/+IWviKxjylfKNGCyIwu7GiFXRb/k7kq0hHZsok5JJ
         EzUw==
X-Forwarded-Encrypted: i=1; AHgh+Rqx61EJIv9gO/cpsW4x32myB3YCiY2asnaAB+Jo7xLEvMhmr1heMyWgxWNV5EnRI0LJ8446Hp5fD30=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPqug/3Jf4IR6iYgYv+Mlb87Tkl+uDr4/Qfsbd65NMcocnfelH
	7K+3xlAepCO/vSjMkvtgy/jJqppbWJDphTwvSuGlogHTFUOfzWT7tOZI
X-Gm-Gg: AR+sD12+6nzijJN14uERPLTs+AE8Wmmv+Y50e1dIr6F8qTnDuKbp6NFP7AFrIS8uy0e
	8Y1E4cUBij1RhRqE9z0h+P9pUu+F1/gx/cEMTH/jqH+paA2rI2PoMkNlhXjfJNXFfZSdAD8NrT+
	So2o0ouWl/LinymVWhwera56ycCX+uFtyav8dy/5quECqzupGkM0fnetY/B6letwidYMO/2aK0M
	1G5yQ/NG2p6huxSp9+Gf2C7cl/qDPm1otVlAfF56cyFnhQVDFk+mGtHIRhal44o1rxolXFEAH2b
	6IPRlgOgqRd5eUi6XD4QxnQBxTDAOrORzAkZFFNumAsc/zum6aP4kH30v/0ksCA9igPrYZDC6QQ
	WkUikr7Ce/3zscZYFftwGs9vR9iRzBW53II0amAmP+Uzbs3MZlR4CwmUVnz7z/Rh+oIE88hbuBI
	dTnBg94EbPE/1OSQ8=
X-Received: by 2002:a17:903:2ca:b0:2ca:c411:78a with SMTP id d9443c01a7336-2d00f26a4f0mr7911805ad.3.1785184263356;
        Mon, 27 Jul 2026 13:31:03 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde59b768sm41551805ad.4.2026.07.27.13.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:31:02 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>
Subject: [PATCH v2 02/64] dmaengine: back channel BH helpers with WQ_BH
Date: Mon, 27 Jul 2026 13:28:30 -0700
Message-ID: <dccbdfb0da3283455c72521e918ce1e98b77194b.1785183549.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com> <cover.1785183549.git.allen.lkml@gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the tasklet implementation of the channel BH helpers with a
dedicated WQ_BH | WQ_PERCPU workqueue. The public dma_chan_*_bh() API and
its softirq execution context remain unchanged.

Keep the workqueue operations internal to dmaengine. Drain scheduled work
in dma_chan_kill_bh() to preserve the completion semantics of
tasklet_kill().

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/dmaengine.c   | 59 ++++++++++++++++++++++++++++++++-------
 include/linux/dmaengine.h | 10 +++----
 2 files changed, 54 insertions(+), 15 deletions(-)

diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
index f43aeecb47f9..8b1b17794956 100644
--- a/drivers/dma/dmaengine.c
+++ b/drivers/dma/dmaengine.c
@@ -54,6 +54,7 @@
 #include <linux/rcupdate.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
+#include <linux/workqueue.h>
 
 #include "dmaengine.h"
 
@@ -61,6 +62,7 @@ static DEFINE_MUTEX(dma_list_mutex);
 static DEFINE_IDA(dma_ida);
 static LIST_HEAD(dma_device_list);
 static long dmaengine_ref_count;
+static struct workqueue_struct *dmaengine_bh_wq;
 
 /* --- debugfs implementation --- */
 #ifdef CONFIG_DEBUG_FS
@@ -1428,9 +1430,34 @@ static void dmaengine_destroy_unmap_pool(void)
 	}
 }
 
-static void dma_chan_bh_entry(struct tasklet_struct *tasklet)
+static void dmaengine_destroy_bh_wq(void)
 {
-	struct dma_chan *chan = from_tasklet(chan, tasklet, bh_tasklet);
+	if (!dmaengine_bh_wq)
+		return;
+
+	destroy_workqueue(dmaengine_bh_wq);
+	dmaengine_bh_wq = NULL;
+}
+
+static bool dmaengine_queue_bh_work(struct work_struct *work)
+{
+	if (WARN_ON(!dmaengine_bh_wq))
+		return false;
+
+	return queue_work(dmaengine_bh_wq, work);
+}
+
+static void dmaengine_flush_bh_work(struct work_struct *work)
+{
+	if (!work)
+		return;
+
+	flush_work(work);
+}
+
+static void dma_chan_bh_entry(struct work_struct *work)
+{
+	struct dma_chan *chan = container_of(work, struct dma_chan, bh_work);
 	dma_chan_bh_work_fn fn = READ_ONCE(chan->bh_work_fn);
 
 	if (fn)
@@ -1446,7 +1473,7 @@ void dma_chan_init_bh(struct dma_chan *chan, dma_chan_bh_work_fn fn)
 		return;
 
 	chan->bh_work_fn = fn;
-	tasklet_setup(&chan->bh_tasklet, dma_chan_bh_entry);
+	INIT_WORK(&chan->bh_work, dma_chan_bh_entry);
 	chan->bh_work_initialized = true;
 }
 EXPORT_SYMBOL_GPL(dma_chan_init_bh);
@@ -1456,8 +1483,7 @@ bool dma_chan_schedule_bh(struct dma_chan *chan)
 	if (WARN_ON(!chan->bh_work_initialized))
 		return false;
 
-	tasklet_schedule(&chan->bh_tasklet);
-	return true;
+	return dmaengine_queue_bh_work(&chan->bh_work);
 }
 EXPORT_SYMBOL_GPL(dma_chan_schedule_bh);
 
@@ -1466,7 +1492,7 @@ void dma_chan_kill_bh(struct dma_chan *chan)
 	if (!chan->bh_work_initialized)
 		return;
 
-	tasklet_kill(&chan->bh_tasklet);
+	dmaengine_flush_bh_work(&chan->bh_work);
 }
 EXPORT_SYMBOL_GPL(dma_chan_kill_bh);
 
@@ -1666,15 +1692,28 @@ EXPORT_SYMBOL_GPL(dma_run_dependencies);
 
 static int __init dma_bus_init(void)
 {
-	int err = dmaengine_init_unmap_pool();
+	int err;
 
+	dmaengine_bh_wq = alloc_workqueue("dmaengine_bh",
+					  WQ_BH | WQ_PERCPU, 0);
+	if (!dmaengine_bh_wq)
+		return -ENOMEM;
+
+	err = dmaengine_init_unmap_pool();
 	if (err)
-		return err;
+		goto err_destroy_wq;
 
 	err = class_register(&dma_devclass);
-	if (!err)
-		dmaengine_debugfs_init();
+	if (err)
+		goto err_destroy_pool;
 
+	dmaengine_debugfs_init();
+	return 0;
+
+err_destroy_pool:
+	dmaengine_destroy_unmap_pool();
+err_destroy_wq:
+	dmaengine_destroy_bh_wq();
 	return err;
 }
 arch_initcall(dma_bus_init);
diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
index c670781b3150..c87974d5048b 100644
--- a/include/linux/dmaengine.h
+++ b/include/linux/dmaengine.h
@@ -12,7 +12,7 @@
 #include <linux/scatterlist.h>
 #include <linux/bitmap.h>
 #include <linux/types.h>
-#include <linux/interrupt.h>
+#include <linux/workqueue.h>
 #include <asm/page.h>
 
 /**
@@ -339,9 +339,9 @@ struct dma_router {
  * @router: pointer to the DMA router structure
  * @route_data: channel specific data for the router
  * @private: private data for certain client-channel associations
- * @bh_tasklet: bottom-half tasklet stored per-channel
- * @bh_work_fn: callback executed when @bh_tasklet runs
- * @bh_work_initialized: indicates whether @bh_tasklet has been initialized
+ * @bh_work: bottom-half work item stored per-channel
+ * @bh_work_fn: callback executed when @bh_work runs
+ * @bh_work_initialized: indicates whether @bh_work has been initialized
  */
 struct dma_chan {
 	struct dma_device *device;
@@ -367,7 +367,7 @@ struct dma_chan {
 	void *route_data;
 
 	void *private;
-	struct tasklet_struct bh_tasklet;
+	struct work_struct bh_work;
 	dma_chan_bh_work_fn bh_work_fn;
 	bool bh_work_initialized;
 };
-- 
2.43.0

