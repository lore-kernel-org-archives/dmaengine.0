Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795650571;
	b=L7XTVTk1xteXlPU3ZWVOnuzoxifFpYZczAmunOQw5PqJuot7hPmtAVNHn4yv7g64QHLi
	 qnHVu1thGZeEJq4pr7vCl2IYM5FJ+Mux76wEt6yqBBl8gLnv4ghDnxrl9pwOUkkpKn7/Y
	 wqFry2a7s1yJdBW4MGCtdE4kh/u0F9XBV3UvokitABfbqtF63YYYFIUu4KedVQLx/KcFH
	 8lFwL2qrt0zfgJQrhSZchAPOuvZ8aShsVGyBuGIWlqTiIhIeEuVCW3yRe+cOtBCd00yFb
	 IuvtkzoKVmX78RzEs+1cZdnohOyg9HOlZC/yfQ7CrqY6yWgr9fOACIcL/fv+2EOUPTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795650571;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=e92ZLgyv43DW4+iLoQJON+BXd9n0G30K931pNk1s2Bs=;
	b=yTMwWO33Odjq4RMOHPbNG6p55MnbYrNJQd1CsPFd2CSNMVa153GAHhThnaDJKwoWAAWz
	 QU1lZClHWG4ABTkAXUSBE1lTzZ057eALWcjbG8I9ECg1bLx+BUlsawX43vSigvELp8B92
	 ULf5jk5cIe4EfH9RhE4NZgLDv4DEcgLl+LAgu/AJXcslfrPcNKMJhKQGaTThD8A55+JNl
	 jg/6/zeV4KgHFsWMf81w8coQuxGE/ghT7bckNDM+2FHXBl0LYeNg1P5IFxx/iisi4fMsh
	 mRY/Hd89XorfUes2rAxiZpSMarjRKJk9v+sdY5h4cxdGDUrA1WsGr7v8GzjOx6LPVcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j0lq6Qj3;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8DA606A69B;
	Wed, 25 Nov 2026 23:49:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D8DA606A69B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j0lq6Qj3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795650571; x=1827186571;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=He47DOxr2tBFIxi3qnNjnJEH4ZgERRHYlx8I0sGLPbM=;
  b=j0lq6Qj3zF1oaWOJor9WPSmOP8wzLaptJtOZkk7OStzuwleX6nZbDkGu
   cTiNWdoYyhQhfQeVpMqXsG1kaN37AETPm571WqRTne8waoofJ4rSfFf2R
   o/YhJk5eXgbtaiMhOsr3oT0RDEzoCR82DS/cchrZOszCxDtAhTk66EK6q
   Od9n5zAMhqRdc8Z62CEoPwvLL4MceSOBl/MNYn51iCdnk2uPZC/BYc+P4
   fWAe8x3UVnUp6WOPOpH0Y0DjTI+GkqjL8MqPJTyh8g8ob/3QPdHPKK3cT
   m8u0QVr+CLFXKFFNtO3ZOHvvVQmeigQhYNRhI+hwwyhAM7FuphpWTFfd0
   g==;
X-CSE-ConnectionGUID: Ldi2tFPxR2+RweDA1MDbHw==
X-CSE-MsgGUID: 4uagLiunSZmIbRg310Vm3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4597300"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4597300"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 15:49:28 -0800
X-CSE-ConnectionGUID: clh5kSY6QtGaB7AgMenHEA==
X-CSE-MsgGUID: nnkWNz9yRdSmqBeG9YIsRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="11873847"
Received: from vcostago-desk.jf.intel.com (HELO [10.241.240.61]) ([10.241.240.61])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 15:49:28 -0800
From: Vinicius Costa Gomes <vinicius.gomes@intel.com>
Date: Wed, 25 Nov 2026 15:49:06 -0800
Subject: [PATCH v2 8/8] dmaengine: idxd: Don't flush the descriptors on
 terminate_all()
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-wt-idxd-fixes-v2-8-25a4691dfb9e@intel.com>
References: <20261125-wt-idxd-fixes-v2-0-25a4691dfb9e@intel.com>
In-Reply-To: <20261125-wt-idxd-fixes-v2-0-25a4691dfb9e@intel.com>
To: Dave Jiang <dave.jiang@intel.com>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>, Fenghua Yu <fenghuay@nvidia.com>, 
 Shuai Xue <xueshuai@linux.alibaba.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Vinicius Costa Gomes <vinicius.gomes@intel.com>
X-Mailer: b4 0.17-dev-1b309
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795650562; l=6632;
 i=vinicius.gomes@intel.com; s=20230921; h=from:subject:message-id;
 bh=He47DOxr2tBFIxi3qnNjnJEH4ZgERRHYlx8I0sGLPbM=;
 b=8iGCgBl+wuneUoBZv4eUr1QBd0b1ag1XPs2Gpvy/1YGVbmvQW+PSVKDno7EzBGeWiEe8snBjF
 /OCTvJgWSwCAYHwgi5Zrs7+Q5Xs5aiBBQPnL6nCTA2NNGOPBJh4zw7K
X-Developer-Key: i=vinicius.gomes@intel.com; a=ed25519;
 pk=aJkrtgqgT6TZ8iIHSG8/rTPsmlYnjMrUjCsMYvCzntk=

idxd_dma_terminate_all() has two problems:

- It unmaps and frees the pending descriptors while the device may
  still process them. The device can then write to unmapped buffers,
  or to the completion record of a reused descriptor.

- It takes wq->wq_lock, a mutex, but terminate_all() can be called from
  atomic context and must not sleep.

terminate_all() only has to keep the callbacks of the terminated
transfers from running. Mark the channel terminated, and skip the
callbacks while it is marked. synchronize() does the rest:

 idxd_dma_synchronize()
 |-idxd_wq_drain()
 |   The device has completed every descriptor.
 |-synchronize_irq()
 |   The IRQ thread has put back what it found still running.
 |-idxd_flush_pending_descs()
 |-synchronize_irq()
 |   The IRQ thread is done with what it took before the flush.
 \-Clear the mark.

The flush holds a wq_active reference, not wq->wq_lock:
dma_release_channel() calls synchronize() with dma_list_mutex held, and
idxd_dmaengine_drv_remove() takes dma_list_mutex under wq->wq_lock. The
remove path waits for the wq_active references before it frees the
descriptors.

Calling dma_async_issue_pending() between terminate_all() and
synchronize() is undefined in the dmaengine API. idxd starts descriptors
at tx_submit(), so this also relies on clients not submitting in that
window: then the descriptors completed while the channel is marked were
all submitted before the terminate.

Some users, like ntb_transport, terminate and release the channel
without calling synchronize(). The mark is still cleared, as
dma_release_channel() calls synchronize() itself.

Fixes: 2a93f5747d0e ("dmaengine: idxd: Flush all pending descriptors")
Signed-off-by: Vinicius Costa Gomes <vinicius.gomes@intel.com>
---
 drivers/dma/idxd/device.c |  9 ++++-----
 drivers/dma/idxd/dma.c    | 47 ++++++++++++++++++++++++++++++++++++++---------
 drivers/dma/idxd/idxd.h   |  3 +++
 3 files changed, 45 insertions(+), 14 deletions(-)

diff --git a/drivers/dma/idxd/device.c b/drivers/dma/idxd/device.c
index 21a0c32325ea..91cad6b0f955 100644
--- a/drivers/dma/idxd/device.c
+++ b/drivers/dma/idxd/device.c
@@ -1269,7 +1269,7 @@ int idxd_device_load_config(struct idxd_device *idxd)
 	return 0;
 }
 
-static void idxd_flush_pending_descs(struct idxd_irq_entry *ie)
+void idxd_flush_pending_descs(struct idxd_irq_entry *ie)
 {
 	struct idxd_desc *desc, *itr;
 	struct llist_node *head;
@@ -1293,10 +1293,9 @@ static void idxd_flush_pending_descs(struct idxd_irq_entry *ie)
 		list_del(&desc->list);
 		ctype = desc->completion->status ? IDXD_COMPLETE_NORMAL : IDXD_COMPLETE_ABORT;
 		/*
-		 * wq is being disabled. Any remaining descriptors are
-		 * likely to be stuck and can be dropped. callback could
-		 * point to code that is no longer accessible, for example
-		 * if dmatest module has been unloaded.
+		 * No callbacks: the transfers were terminated, or the WQ
+		 * is being disabled or reset and they may point to
+		 * unloaded code.
 		 */
 		tx = &desc->txd;
 		tx->callback = NULL;
diff --git a/drivers/dma/idxd/dma.c b/drivers/dma/idxd/dma.c
index 9937b671f637..f8ce06274ef4 100644
--- a/drivers/dma/idxd/dma.c
+++ b/drivers/dma/idxd/dma.c
@@ -7,17 +7,20 @@
 #include <linux/device.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/dmaengine.h>
+#include <linux/interrupt.h>
 #include <uapi/linux/idxd.h>
 #include "../dmaengine.h"
 #include "registers.h"
 #include "idxd.h"
 
-static inline struct idxd_wq *to_idxd_wq(struct dma_chan *c)
+static inline struct idxd_dma_chan *to_idxd_dma_chan(struct dma_chan *c)
 {
-	struct idxd_dma_chan *idxd_chan;
+	return container_of(c, struct idxd_dma_chan, chan);
+}
 
-	idxd_chan = container_of(c, struct idxd_dma_chan, chan);
-	return idxd_chan->wq;
+static inline struct idxd_wq *to_idxd_wq(struct dma_chan *c)
+{
+	return to_idxd_dma_chan(c)->wq;
 }
 
 void idxd_dma_complete_txd(struct idxd_desc *desc,
@@ -47,7 +50,8 @@ void idxd_dma_complete_txd(struct idxd_desc *desc,
 	if (complete && tx->cookie) {
 		dma_cookie_complete(tx);
 		dma_descriptor_unmap(tx);
-		dmaengine_desc_get_callback_invoke(tx, &res);
+		if (!READ_ONCE(to_idxd_dma_chan(tx->chan)->terminated))
+			dmaengine_desc_get_callback_invoke(tx, &res);
 		tx->callback = NULL;
 		tx->callback_result = NULL;
 	}
@@ -196,18 +200,43 @@ static void idxd_dma_release(struct dma_device *device)
 
 static int idxd_dma_terminate_all(struct dma_chan *c)
 {
-	struct idxd_wq *wq = to_idxd_wq(c);
-
-	idxd_wq_flush_descs(wq);
+	/* The device still runs them, synchronize() waits for it */
+	WRITE_ONCE(to_idxd_dma_chan(c)->terminated, true);
 
 	return 0;
 }
 
 static void idxd_dma_synchronize(struct dma_chan *c)
 {
-	struct idxd_wq *wq = to_idxd_wq(c);
+	struct idxd_dma_chan *idxd_chan = to_idxd_dma_chan(c);
+	struct idxd_wq *wq = idxd_chan->wq;
 
 	idxd_wq_drain(wq);
+	if (!READ_ONCE(idxd_chan->terminated))
+		return;
+
+	/*
+	 * Not wq_lock: dma_release_channel() calls this under dma_list_mutex,
+	 * which the WQ removal takes under wq_lock. The removal waits for
+	 * wq_active instead.
+	 */
+	if (!percpu_ref_tryget_live(&wq->wq_active)) {
+		wait_for_completion(&wq->wq_resurrect);
+		/* The WQ is quiesced, disabling it flushes them */
+		if (!percpu_ref_tryget_live(&wq->wq_active))
+			return;
+	}
+
+	/*
+	 * The IRQ thread can still put back the descriptors it saw running
+	 * before the drain, or complete the ones it took: wait for it on both
+	 * sides of the flush.
+	 */
+	synchronize_irq(wq->ie.vector);
+	idxd_flush_pending_descs(&wq->ie);
+	synchronize_irq(wq->ie.vector);
+	WRITE_ONCE(idxd_chan->terminated, false);
+	percpu_ref_put(&wq->wq_active);
 }
 
 int idxd_register_dma_device(struct idxd_device *idxd)
diff --git a/drivers/dma/idxd/idxd.h b/drivers/dma/idxd/idxd.h
index f4aed90560e0..3d0747be193a 100644
--- a/drivers/dma/idxd/idxd.h
+++ b/drivers/dma/idxd/idxd.h
@@ -185,6 +185,8 @@ enum idxd_op_type {
 struct idxd_dma_chan {
 	struct dma_chan chan;
 	struct idxd_wq *wq;
+	/* Set by terminate_all(), until synchronize() */
+	bool terminated;
 };
 
 struct idxd_wq {
@@ -803,6 +805,7 @@ void idxd_wq_quiesce(struct idxd_wq *wq);
 int idxd_wq_init_percpu_ref(struct idxd_wq *wq);
 void idxd_wq_free_irq(struct idxd_wq *wq);
 int idxd_wq_request_irq(struct idxd_wq *wq);
+void idxd_flush_pending_descs(struct idxd_irq_entry *ie);
 void idxd_wq_flush_descs(struct idxd_wq *wq);
 void idxd_wq_release_int_handle(struct idxd_wq *wq);
 

-- 
2.56.1

