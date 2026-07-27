Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CD6422542
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184263; cv=none; b=EMr7nRAkthEbnzd8W/ip6pHxAgFXG3hbm+P5sJJHlf3mWBjwCQBrYhLEO+86Fo4LQjD0WSOaeCoRXWzYwANConhlbUb4q1Zv4m3wK3jmtoZWTa9hT+V4XazQxikuGHqBKwikP0pMwYHSsyZ4jtMyMG5jNbVARWr1zN/xRWdQL+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184263; c=relaxed/simple;
	bh=U4KXLBS3zkStCYfODfSsXYNkUSZw4MyLZbLPLaeLLVA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jmMKqMZLT8yYtDehOB2yFRbxQa9La2zRG8fTg0PIGLnO5Pr6CWZVxTTltNKra1ucWM/ZdRMeRF17ow890F4bnbvcrO4ISKeASda7kN72dxzwgTscB7Gr88ucZe8z99O3YCHrUDW/HioiHIN+S3s8ggZrfXVOfErxE7pyGE90+xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R1WFCf1h; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R1WFCf1h"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cf50c6f235so38240135ad.0
        for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 13:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184261; x=1785789061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xGZ1GOaRsiWh0/W+o9LgId/Souim6C1Eu5Tze1b0ElA=;
        b=R1WFCf1hDmUQkx0uOzMelPhR92rCP7ES9Vglh5A+wYDlQ6b87HkIxUP+6o9hQj06Jl
         FgEwB3IgK7ApVK7A4WWbfuHTCMp4fw1otUz6hrZfqL279Rd51znM2ubzuTA0B5v57nfN
         M4X4w1arjGITWG/UXVNoD8UxIaIYOQ8E+kd/AwDzqQPHrHbV7W0ESlU54avDgNoIFREy
         NkV2OPO4PRBYLXKbtzUIN58W6Z4MvhsiubZofWyU/bQD8xurH9C2SP3rY13W111U1dGc
         3SuydPbQzTeeDNIi8gIBoxEss4/wiBMJ+adPPWWX7wZBX2XYivJqaYl8lxGIzExemcOR
         wfRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184261; x=1785789061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xGZ1GOaRsiWh0/W+o9LgId/Souim6C1Eu5Tze1b0ElA=;
        b=W5P1SpWPgTtGIiytetIVfr+9VUkgtm7Xgg4BBMFN21hEqpz/uL3miCrONsLam9f/9W
         Awr9HcPihKZfKlLFmM915R1otRd0qxRnwODxJGsNebamGPp8Z5jUUMOWQhGf6ehs0R0H
         gJfvMwrMJTfsjqbKhF7WoqpVPcLZ8TgSHmHPQFWRvO5isvxFzwwHArUonxSYdwfmU7EK
         Rud5nLmUOMPaP5IM6oHoaU+3AJ1FS+gnHibzXtoFu4m+qocsgF1NZLvp+z5fSSMpn602
         w9E1r0jPwZEpvwgcj3QHNssa4+lGvpYeITWJcjXYSwrZB1QjEgHBd6XDAaDweN34m8B2
         a/Pg==
X-Forwarded-Encrypted: i=1; AHgh+RoUjbvmS+MGscm1bN07hvXTLFHBai2rQVchXfTqlS3Ju4FAy2ncz9TAHSTOflp+Uooevfa/MikOFew=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj+DlIy8IW+wXZuPkq4HyXXTo96KrfYwoT7XloBiN4fFAKNG7h
	19pVEBKoYptGVR7jv6O40JcOVQKWUdmSBr0uJjGjw2xZR8GMGlFSeMcQ
X-Gm-Gg: AR+sD11kGMLv5YJzCz1i0kIXOI694OQ/0tq27jubUdeMJhqImjgFfbVdVnx2D2qb77I
	azL11R3ATfe+K6NrI8Z2IPf7Kx4Lvp912pvo5T7hnoXXyClfU+pAniSknIL5nnXI7p2u+ZmVkHB
	afHykjeN3Ju92sBQTYoM9fg1TFpXn6080xFI8uV5NMT6ekNC3BmlbRdxjMV/JSt6M76XnWQH46w
	cs8ONK8Eel0+pB3ubkn0q2SEzFhRTzuWIS2TlL93kb4cNYV++WIUazBGTG6z/8ko2yUVvjD7Dk5
	ov6HFNyjWUWcMtcZek8WPiOZbovRTX+lxwzApV5nY06qOUkA9OCyWCF8ct/8RQmLUY/W11gu56z
	MVq4SHL8/oFu2p1/C1uRt1UkENHPcVG9YaAT0JGV3mQNhP46jwI7cOEJrFn4ziiCxpPjAzAJnK/
	OWMn2E
X-Received: by 2002:a17:902:ecc1:b0:2c9:97a7:3289 with SMTP id d9443c01a7336-2d00f5c3069mr6752375ad.43.1785184261069;
        Mon, 27 Jul 2026 13:31:01 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde59b768sm41551805ad.4.2026.07.27.13.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:31:00 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>
Subject: [PATCH v2 01/64] dmaengine: add tasklet-backed channel BH helpers
Date: Mon, 27 Jul 2026 13:28:29 -0700
Message-ID: <1ffd627be7ac24478efb82f52acbdc80c46ee2e5.1785183549.git.allen.lkml@gmail.com>
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

DMAengine drivers commonly use a per-channel tasklet to invoke client
callbacks. Add helpers that initialize, schedule, and kill a channel
bottom half, with an initial tasklet-backed implementation that preserves
the existing execution context.

Convert virt-dma to the new API and remove its private tasklet. While
touching the completion handler, avoid forming a result pointer from a
NULL cyclic descriptor.

This establishes a backend-independent API before changing how channel
bottom halves are dispatched.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/dmaengine.c   | 42 +++++++++++++++++++++++++++++++++++++++
 drivers/dma/virt-dma.c    | 12 +++++------
 drivers/dma/virt-dma.h    |  7 +++----
 include/linux/dmaengine.h | 28 ++++++++++++++++++++++++++
 4 files changed, 79 insertions(+), 10 deletions(-)

diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
index 9049171df857..f43aeecb47f9 100644
--- a/drivers/dma/dmaengine.c
+++ b/drivers/dma/dmaengine.c
@@ -1428,6 +1428,48 @@ static void dmaengine_destroy_unmap_pool(void)
 	}
 }
 
+static void dma_chan_bh_entry(struct tasklet_struct *tasklet)
+{
+	struct dma_chan *chan = from_tasklet(chan, tasklet, bh_tasklet);
+	dma_chan_bh_work_fn fn = READ_ONCE(chan->bh_work_fn);
+
+	if (fn)
+		fn(chan);
+}
+
+void dma_chan_init_bh(struct dma_chan *chan, dma_chan_bh_work_fn fn)
+{
+	if (WARN_ON(!fn))
+		return;
+
+	if (WARN_ON(chan->bh_work_initialized))
+		return;
+
+	chan->bh_work_fn = fn;
+	tasklet_setup(&chan->bh_tasklet, dma_chan_bh_entry);
+	chan->bh_work_initialized = true;
+}
+EXPORT_SYMBOL_GPL(dma_chan_init_bh);
+
+bool dma_chan_schedule_bh(struct dma_chan *chan)
+{
+	if (WARN_ON(!chan->bh_work_initialized))
+		return false;
+
+	tasklet_schedule(&chan->bh_tasklet);
+	return true;
+}
+EXPORT_SYMBOL_GPL(dma_chan_schedule_bh);
+
+void dma_chan_kill_bh(struct dma_chan *chan)
+{
+	if (!chan->bh_work_initialized)
+		return;
+
+	tasklet_kill(&chan->bh_tasklet);
+}
+EXPORT_SYMBOL_GPL(dma_chan_kill_bh);
+
 static int __init dmaengine_init_unmap_pool(void)
 {
 	int i;
diff --git a/drivers/dma/virt-dma.c b/drivers/dma/virt-dma.c
index 7961172a780d..89fcd51ddcab 100644
--- a/drivers/dma/virt-dma.c
+++ b/drivers/dma/virt-dma.c
@@ -77,12 +77,12 @@ struct virt_dma_desc *vchan_find_desc(struct virt_dma_chan *vc,
 EXPORT_SYMBOL_GPL(vchan_find_desc);
 
 /*
- * This tasklet handles the completion of a DMA descriptor by
- * calling its callback and freeing it.
+ * This bottom-half handler completes a DMA descriptor by invoking its
+ * callback and freeing it.
  */
-static void vchan_complete(struct tasklet_struct *t)
+static void vchan_complete(struct dma_chan *chan)
 {
-	struct virt_dma_chan *vc = from_tasklet(vc, t, task);
+	struct virt_dma_chan *vc = to_virt_chan(chan);
 	struct virt_dma_desc *vd, *_vd;
 	struct dmaengine_desc_callback cb;
 	LIST_HEAD(head);
@@ -98,7 +98,7 @@ static void vchan_complete(struct tasklet_struct *t)
 	}
 	spin_unlock_irq(&vc->lock);
 
-	dmaengine_desc_callback_invoke(&cb, &vd->tx_result);
+	dmaengine_desc_callback_invoke(&cb, vd ? &vd->tx_result : NULL);
 
 	list_for_each_entry_safe(vd, _vd, &head, node) {
 		dmaengine_desc_get_callback(&vd->tx, &cb);
@@ -131,7 +131,7 @@ void vchan_init(struct virt_dma_chan *vc, struct dma_device *dmadev)
 	INIT_LIST_HEAD(&vc->desc_completed);
 	INIT_LIST_HEAD(&vc->desc_terminated);
 
-	tasklet_setup(&vc->task, vchan_complete);
+	dma_chan_init_bh(&vc->chan, vchan_complete);
 
 	vc->chan.device = dmadev;
 	list_add_tail(&vc->chan.device_node, &dmadev->channels);
diff --git a/drivers/dma/virt-dma.h b/drivers/dma/virt-dma.h
index 59d9eabc8b67..abe2a4475744 100644
--- a/drivers/dma/virt-dma.h
+++ b/drivers/dma/virt-dma.h
@@ -21,7 +21,6 @@ struct virt_dma_desc {
 
 struct virt_dma_chan {
 	struct dma_chan	chan;
-	struct tasklet_struct task;
 	void (*desc_free)(struct virt_dma_desc *);
 
 	spinlock_t lock;
@@ -106,7 +105,7 @@ static inline void vchan_cookie_complete(struct virt_dma_desc *vd)
 		 vd, cookie);
 	list_add_tail(&vd->node, &vc->desc_completed);
 
-	tasklet_schedule(&vc->task);
+	dma_chan_schedule_bh(&vc->chan);
 }
 
 /**
@@ -137,7 +136,7 @@ static inline void vchan_cyclic_callback(struct virt_dma_desc *vd)
 	struct virt_dma_chan *vc = to_virt_chan(vd->tx.chan);
 
 	vc->cyclic = vd;
-	tasklet_schedule(&vc->task);
+	dma_chan_schedule_bh(&vc->chan);
 }
 
 /**
@@ -223,7 +222,7 @@ static inline void vchan_synchronize(struct virt_dma_chan *vc)
 	LIST_HEAD(head);
 	unsigned long flags;
 
-	tasklet_kill(&vc->task);
+	dma_chan_kill_bh(&vc->chan);
 
 	spin_lock_irqsave(&vc->lock, flags);
 
diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
index b3d251c9734e..c670781b3150 100644
--- a/include/linux/dmaengine.h
+++ b/include/linux/dmaengine.h
@@ -12,6 +12,7 @@
 #include <linux/scatterlist.h>
 #include <linux/bitmap.h>
 #include <linux/types.h>
+#include <linux/interrupt.h>
 #include <asm/page.h>
 
 /**
@@ -295,6 +296,10 @@ enum dma_desc_metadata_mode {
 	DESC_METADATA_ENGINE = BIT(1),
 };
 
+struct dma_chan;
+
+typedef void (*dma_chan_bh_work_fn)(struct dma_chan *chan);
+
 /**
  * struct dma_chan_percpu - the per-CPU part of struct dma_chan
  * @memcpy_count: transaction counter
@@ -334,6 +339,9 @@ struct dma_router {
  * @router: pointer to the DMA router structure
  * @route_data: channel specific data for the router
  * @private: private data for certain client-channel associations
+ * @bh_tasklet: bottom-half tasklet stored per-channel
+ * @bh_work_fn: callback executed when @bh_tasklet runs
+ * @bh_work_initialized: indicates whether @bh_tasklet has been initialized
  */
 struct dma_chan {
 	struct dma_device *device;
@@ -359,6 +367,9 @@ struct dma_chan {
 	void *route_data;
 
 	void *private;
+	struct tasklet_struct bh_tasklet;
+	dma_chan_bh_work_fn bh_work_fn;
+	bool bh_work_initialized;
 };
 
 /**
@@ -1529,6 +1540,9 @@ struct dma_chan *devm_dma_request_chan(struct device *dev, const char *name);
 
 void dma_release_channel(struct dma_chan *chan);
 int dma_get_slave_caps(struct dma_chan *chan, struct dma_slave_caps *caps);
+void dma_chan_init_bh(struct dma_chan *chan, dma_chan_bh_work_fn fn);
+bool dma_chan_schedule_bh(struct dma_chan *chan);
+void dma_chan_kill_bh(struct dma_chan *chan);
 #else
 static inline struct dma_chan *dma_find_channel(enum dma_transaction_type tx_type)
 {
@@ -1576,6 +1590,20 @@ static inline int dma_get_slave_caps(struct dma_chan *chan,
 {
 	return -ENXIO;
 }
+
+static inline void dma_chan_init_bh(struct dma_chan *chan,
+				    dma_chan_bh_work_fn fn)
+{
+}
+
+static inline bool dma_chan_schedule_bh(struct dma_chan *chan)
+{
+	return false;
+}
+
+static inline void dma_chan_kill_bh(struct dma_chan *chan)
+{
+}
 #endif
 
 static inline int dmaengine_desc_set_reuse(struct dma_async_tx_descriptor *tx)
-- 
2.43.0

