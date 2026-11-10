Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316545;
	b=1fUK4xvjLCxGLY3zlOwYiVD2ZonmsR3PPZyXc6+nlAlvVE5f4mjfBU4Ff33AvW67eUjI
	 WRJ9kuLUCrA/mTAdDeRf9aEvyjDNKkZny3+fCXjVJ9GAZwch0GLcoDFK+f/eOzml9LMwc
	 h9x4U6smDMbjo0CTh0UxuuBZyqK29VNXuBgOdKEZudiwPcVqe/TMAhIXfIDW7mSuzewJP
	 KrBzQCaqbft6dIhFRyZ0XelTMd4sa72FlylSHf74zi9OuFSPbMe/zA31g/As6FA9tOIHJ
	 gcxfg9Bxgfcg5FbgixLXVEd4Jn09BNH6/OmZj632HvOaagdTejpPNV+Yo7YUkVbJ2DA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316545;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/X1mmCiDggDpEe22wnV3gioJN3CSsjkEiYXxHssz27k=;
	b=HFNftnYb9bt5Jl5yPMelWv5FoHUQayCK7ZmLg2SGRMSQVECF1dHO33JHkhMZAzyZYag8
	 MeYmox67wz9T1d3V/vqM7G7ZatpXz2lAqPnq9JNJAjZGmEHHY3b4uEhgX/xkuIiiFpOOz
	 vRtoyyMYPZeNrXLq18vFz1gAzLEuxt+t895g5NKDjP58Rag+bxTL3DtGbnnGB2inWFz70
	 eGeGwvEfKp4R3HViAEUHpcg+IdfI0obkI8lHVbr4n8iguP53tG/SvBBX6uaVhg/LWgPbu
	 cRLqNQbcK/c+GL7ogjSvzgrRjur2XSNNXhPLedgvvIhm2MxnVdsmF3NltWmk27Qvzdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Toun5HmM;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64DD1606E450
	for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 13:15:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64DD1606E450
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Toun5HmM
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cdb681de50eso657246a12.2
        for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 05:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316545; x=1794921345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/X1mmCiDggDpEe22wnV3gioJN3CSsjkEiYXxHssz27k=;
        b=Toun5HmMkjiXJ8vYxjv8I4HI6AD2qpezHwGZSw2JiqUexGERa+uwu6+GUb2BvP1H3F
         ktzlb1FY/XqfyGFXJnJKassjYK2hsxrS/qcMaiZ982i5hocaJslY0sFOxj6vuiW8lBWZ
         99l46rqVh+lLs1WodrQ4vSAenQoQGfsHFDsYYg8e5XpKeoDHjuVcGoapu0Ltyt1dqQJZ
         skhuZH0j3pulxBa9v6jJM25Xvivsra9OjJxxYdwI4XbV372/qvOmMnuwSJap98GeA0GT
         dF4vacABD4WvNB8W/iz62CM3wf19ytTv/GiXE22TfpU7J79STkxyaoZgQpQyyMCoWQwy
         Gdqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316545; x=1794921345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/X1mmCiDggDpEe22wnV3gioJN3CSsjkEiYXxHssz27k=;
        b=1+tLNy7BetlJoMqqvvX1VPUHIRl/r43FhD7p8IQOEmRlGOacK6Dbf7/PSwgEB1Qy+Z
         p6FJR4krPFXeNUsAd8EE+73txcYrwftkJDJrTAJ1t51Frh+8J6xKednLb+jPTx9w/Mat
         rAd/ItyphUCBt3KkFhcU9ftoI9KQC1jpwuN7x7PDxjfCnfcgFXZXjDfGM1Lssrujix5R
         x6piNbKZ19XAYziH95EDKqR78BAUicd1DtAXzoRC+7clK1f8cQJnloPrrurgkgAe9F9M
         e/VQ9HS9wlDP3HV4UAaHhu2BERSYqalRrFWNSocV5RqA9+gwx+rdJzQOPmEucS3tI8l/
         huPA==
X-Forwarded-Encrypted: i=1; AL+hErFb0pVLfjKONP/RHHVKUcrAb9+5oaqgYPJMnkiwwekDs9VeVJj7hqQsBNy9NafvYzfnqSl5QUEKZXA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/HI9ayVhmkZaJV7E3nlWtiHHWICLfyMnIPNPgxGIWftm8bc8GX
	Adbs2O6VkQkZ56vo3HgYviae2PBqsc08MQ8dpqSHMgDnWcyQfgucrxe2
X-Gm-Gg: AYBFou1u5Exl/mfbKbRyf62nT7Zshmj3+aPBJkgOhwtzNQ1i2y8BBWMlfb3Z8VSqyLc
	wgPFFTZz80Us4bQcdOJMeoh61QKVEu9wKHj9B/Ix4aZNjaoWjRE0eHTN4MBfOT+3bfY77DT0qyj
	RoaT7+XWzGg1NIT4TjF4i507ISu+blAFiZQFIgjRMY75pk5VDThEypMo9itYUHnq55hNowq4C1k
	eOrkxm8C4mjSNgbB5ukEKwrn2TqahvhhIAA/8lBJetZKyhKo1xSOOH4T81gCN7eYIXxH3khSZqn
	c7izfjq9A7CDDJcBKUwVgfbTlvOUJMTM2bkkVMZMN8mpqCXYHONY3qfxgtWIwhhfv9QBW7djAlQ
	LZyTTrMtK6L57OBtEs5eKDtsYvUZ5t4dTGo35E+SMHS4ADTNEAjJXOxzWWpYatyqL0DkxmBkFwG
	GrEbxKWm+qauJZNkqqv53Lxf0nntAKPa3m4KtdRAkP4UN0jKsFSdDBMJSxJ4iq6Rc9erGYTAVJf
	GriiRE4AEEOn9f9xf/FlYE9DttQCj6gKMVUZFvzHKFaJcIKUNtygy1UEohSPBZWIZEMfXNK+eEu
	zjxLN1vlw4eJVBmDkGUiGyMc0vmdVv4=
X-Received: by 2002:a17:90b:1e47:b0:3ad:4bfc:1e77 with SMTP id 98e67ed59e1d1-3b166d027c3mr2727258a91.66.1794316544621;
        Tue, 10 Nov 2026 05:15:44 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:15:44 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>
Subject: [PATCH v4 02/33] dmaengine: back channel BH helpers with WQ_BH
Date: Tue, 10 Nov 2026 05:13:02 -0800
Message-ID: <717bb0b82658f1dd800f6b1bc06b9cf283f77361.1794315350.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794315350.git.allen.lkml@gmail.com>
References: <cover.1794315350.git.allen.lkml@gmail.com>
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the tasklet implementation of the channel BH helpers with a
dedicated WQ_BH | WQ_PERCPU workqueue. The public dmaengine_*_bh() API and
its softirq execution context remain unchanged.

Keep the workqueue operations internal to dmaengine. Drain scheduled work
in dmaengine_kill_bh() to preserve the completion semantics of
tasklet_kill().

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/dmaengine.c   | 59 ++++++++++++++++++++++++++++++++-------
 include/linux/dmaengine.h | 10 +++----
 2 files changed, 54 insertions(+), 15 deletions(-)

diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
index f3c19fbb2a01..97d8f9667ae5 100644
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
@@ -1449,9 +1451,34 @@ static void dmaengine_destroy_unmap_pool(void)
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
@@ -1467,7 +1494,7 @@ void dmaengine_init_bh(struct dma_chan *chan, dmaengine_bh_work_fn fn)
 		return;
 
 	chan->bh_work_fn = fn;
-	tasklet_setup(&chan->bh_tasklet, dma_chan_bh_entry);
+	INIT_WORK(&chan->bh_work, dma_chan_bh_entry);
 	chan->bh_work_initialized = true;
 }
 EXPORT_SYMBOL_GPL(dmaengine_init_bh);
@@ -1477,8 +1504,7 @@ bool dmaengine_schedule_bh(struct dma_chan *chan)
 	if (WARN_ON(!chan->bh_work_initialized))
 		return false;
 
-	tasklet_schedule(&chan->bh_tasklet);
-	return true;
+	return dmaengine_queue_bh_work(&chan->bh_work);
 }
 EXPORT_SYMBOL_GPL(dmaengine_schedule_bh);
 
@@ -1487,7 +1513,7 @@ void dmaengine_kill_bh(struct dma_chan *chan)
 	if (!chan->bh_work_initialized)
 		return;
 
-	tasklet_kill(&chan->bh_tasklet);
+	dmaengine_flush_bh_work(&chan->bh_work);
 }
 EXPORT_SYMBOL_GPL(dmaengine_kill_bh);
 
@@ -1687,15 +1713,28 @@ EXPORT_SYMBOL_GPL(dma_run_dependencies);
 
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
index b0d69e3083d6..a3f3dad8b91c 100644
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
@@ -342,9 +342,9 @@ struct dma_router {
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
@@ -383,7 +383,7 @@ struct dma_chan {
 	void *route_data;
 
 	void *private;
-	struct tasklet_struct bh_tasklet;
+	struct work_struct bh_work;
 	dmaengine_bh_work_fn bh_work_fn;
 	bool bh_work_initialized;
 };
-- 
2.43.0

