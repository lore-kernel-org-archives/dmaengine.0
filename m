Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D4135F60F
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 18:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786385476; cv=none; b=uyPEyzLPM3EMNZooMvbgN1Tduut5o3N/rfTo6XopMmoGTZQN2MnQrbRtn8LOQgdFlBaDhFXyh7hIqn+vUt7Z6DmLabsnCKZARepsMZw4kaz4S2m2vkmsRsvPGy9eP01k6VD8DKGkD506L6uj3ubhiYwyn1v0MGvLQKLzP7Zna9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786385476; c=relaxed/simple;
	bh=A+wdVsonyIyCPvYO9b0+zZ8pAQxec+QpXwawuJGaBpI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OW8xFNSmJAsBxKBryQ9NGGzMt14BZduQ3spWEI30WIuZeEI7YojAgduO9eGqngl0JDqSX5GM15genhknpxw/6n9egkjGPdTt+tGk6X+0V1wJLWr2k5m1LJ1mH2qvstrZtoqn4/FcwTYSd8bBcP35qVhnw5ddY1pKQ1J7CdgdXDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bpFPjIWm; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bpFPjIWm"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so2202377a91.0
        for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 11:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786385475; x=1786990275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j1oXvCbOw5n+OU0mIPnphWs1BICFLSSH2Y3JAeFMT9Y=;
        b=bpFPjIWml4QJNSMDcYxnpxIFzWrUrn9Y5M2/CwDgTlyNTZ4FslTpz1+HmARCwkUAF1
         8/yWCpxDTKhDBrSNu3zqER0XKRYeG5frA77VBVPg16SyE6iCW7QP7rE5fW2LT96YOMeJ
         r7qX5BQJm6Ayb/ehxNdeveyAJ0b85NOBi4k5xNQDyR1SPZfvvok71vAqshxEDoriVhpZ
         cEh1vBq2SvL/HBqbwv0UTXXdomZj8VPEaJFi4FGzvogKDxpUjH2MbTSJRcJ6Ht9+eygG
         SjMgob8sKzke1Iv/6wBPqrbHmTMNW1eH5aGaorxvcRZNcaMngXbMyDw6JLIfjH+4tXNF
         KdEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786385475; x=1786990275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j1oXvCbOw5n+OU0mIPnphWs1BICFLSSH2Y3JAeFMT9Y=;
        b=Hq3wCvkK33vrk5hDV1uexZgJEGRcnaISdY1gz1l0cqjwyzFp9hCg+po1UMAB1bucsO
         b8ButhkRKKHamNpUndmTFXxzt4IcmhNdp7f8C73iwQgGH4GCoGWT3HctllOC5CMjHRLC
         l1OouwX3czTHgsqXO+F/6QwFlbQDDCoYSqweCNVMBHpmA69FxpuHWzsa2OVTSMISICpW
         dyyR4AHP6+G+bjiPZ0u+mGF4hyEono01eWDVq1Z7Oln/rwdjzhyl6kkav5V1DrrHtjtu
         VPV8dsesQD0Sk9fA9E15mGKQ+na/gY38jUsj2PqFiZaVx3ChZSEOXW4a2jq5cpy3buO2
         Cbqw==
X-Forwarded-Encrypted: i=1; AHgh+Rrt8es1sl11Bk9I+WdlnZmC5zvxtjAywEHb9H3OBab/drzKaj9oS0k42aLNRc6JTUNdiU23yFN5M84=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxqm3w27xxMF3P/bMyNHXeHrEZVPy9lkvGZ9XwwmKfduSuJTs21
	ymasd84ugoFVLX0Jgg1t5/IhSgogUeC7nSe6iDPjipC8jqNGohyK5Ylj
X-Gm-Gg: AR+sD10kA4vfu9dkWpSDTUQIZKhOU6pBAhr/g+x1g4j4oFt5b83BqjZK/LN57zf9JSE
	q+wwHQKdIcK7DSTdpDcixKq6gNs+gARDelncoyauO5TejxyyVYq8+NSZNTSfAEmczn0gur3kyc/
	r7162wBluly8x1IMGoB9wbEWS2HbCxZr3PHt1rdCxseOrZVCX9LyENaveuKJ0z7tauUJk9BsnuP
	foK9mrcMSqjQlhWfbC2QvSc/K7oM+v1ENYr71HFlR/bdbHep7RA5BAmjzmKTXnSH++mWqc8lizb
	CQ66OIFiTwT+YiQdFgLjL9cN6LPZ4S+lrJwIoY6rAYVyo1A/I+/GM3WuIdOk2AY8BMBL8VcMIOO
	iQWKsZk8uSVLa7UKzscG8QQHLGXb+6fHtFoKADNlLv6UO13EVYz26JYCITX3lcbvY6TafFNP/q7
	0w8Wq4/LncZFCg/ggnZpQuciCZ2+zGeyOSWYP4emvepl16/YSZR+SCdhP7de9CWQw=
X-Received: by 2002:a17:90b:268f:b0:38d:c74d:29c5 with SMTP id 98e67ed59e1d1-392cca64db7mr3553763a91.19.1786385474709;
        Mon, 10 Aug 2026 11:11:14 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fa9:fa00:b1a9:6513:83c6:1d23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d53b873asm472795a91.17.2026.08.10.11.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 11:11:14 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>
Subject: [PATCH v3 02/34] dmaengine: back channel BH helpers with WQ_BH
Date: Mon, 10 Aug 2026 11:09:03 -0700
Message-ID: <442747fea2d831d2d6257e15a984a494bd7ad6ec.1786384168.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1786384168.git.allen.lkml@gmail.com>
References: <cover.1785183549.git.allen.lkml@gmail.com> <cover.1786384168.git.allen.lkml@gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the tasklet implementation of the channel BH helpers with a
dedicated WQ_BH | WQ_PERCPU workqueue. The public dmaengine_*_bh() API and
its softirq execution context remain unchanged.

Keep the workqueue operations internal to dmaengine. Drain scheduled work
in dmaengine_kill_bh() to preserve the completion semantics of
tasklet_kill().

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/dmaengine.c   | 59 ++++++++++++++++++++++++++++++++-------
 include/linux/dmaengine.h | 10 +++----
 2 files changed, 54 insertions(+), 15 deletions(-)

diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
index d8fc7eb71b48..e00f73a18e99 100644
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
 	dmaengine_bh_work_fn fn = READ_ONCE(chan->bh_work_fn);
 
 	if (fn)
@@ -1446,7 +1473,7 @@ void dmaengine_init_bh(struct dma_chan *chan, dmaengine_bh_work_fn fn)
 		return;
 
 	chan->bh_work_fn = fn;
-	tasklet_setup(&chan->bh_tasklet, dma_chan_bh_entry);
+	INIT_WORK(&chan->bh_work, dma_chan_bh_entry);
 	chan->bh_work_initialized = true;
 }
 EXPORT_SYMBOL_GPL(dmaengine_init_bh);
@@ -1456,8 +1483,7 @@ bool dmaengine_schedule_bh(struct dma_chan *chan)
 	if (WARN_ON(!chan->bh_work_initialized))
 		return false;
 
-	tasklet_schedule(&chan->bh_tasklet);
-	return true;
+	return dmaengine_queue_bh_work(&chan->bh_work);
 }
 EXPORT_SYMBOL_GPL(dmaengine_schedule_bh);
 
@@ -1466,7 +1492,7 @@ void dmaengine_kill_bh(struct dma_chan *chan)
 	if (!chan->bh_work_initialized)
 		return;
 
-	tasklet_kill(&chan->bh_tasklet);
+	dmaengine_flush_bh_work(&chan->bh_work);
 }
 EXPORT_SYMBOL_GPL(dmaengine_kill_bh);
 
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
index a1437bdbda9b..9f1a5405f6b0 100644
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
 	dmaengine_bh_work_fn bh_work_fn;
 	bool bh_work_initialized;
 };
-- 
2.43.0

