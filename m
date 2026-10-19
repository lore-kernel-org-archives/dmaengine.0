Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792422877;
	b=uqIln9mOTzgK5RUH94e2p6m3G/VLf7tum/NIy4bVlRQ+UfbH1bii20IEgHxIL7IBTFXn
	 3D5PxpXfisbSBjjxfPRS2Olu/UI/AyTFbMsTlRHPCiukDd4epqqyu7cehmr5TYbs3DcUq
	 7pE35xjev74Jtc5huJm9D3B+oz+VmsAzfvNiBWmuiKx6pYb5/ubgisFyja6mPD/pG1zeD
	 HJj7/kUE3XNd54PiyE/YMOweeauR0Db2Ei6/WC2y/V9CsWgNTEa8lM8+yity6rL4zdb3b
	 beJXf1aDZLE/9zE6YNGfPG+YLD2g/kw2x9PtMzYvox8F4fwl9r23P2b0Enjr3e9FOJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792422877;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RLjqAdwihfwMILiMHPnz0FYmmo76i0aPQCh334CV9WE=;
	b=L1CX0BIFF4iHSEkW2J1UN8vXyLANCPWyHF2X8gtS9gCx2IlqtL8IwPCryLi2hDb4o8sP
	 nrUoE+Db8tjfQo+KYvA+VuTFWWAsTCsuEKb2RpNRsvI2/lIRbbbgARUAOBJrKVresZfCF
	 zY4dgE2Jo47W5SYBM22ZemnMIHrea/kXVMhIk0CZmHbWtMxMLtk5xbKuqyPC7r6eZXgWp
	 6GGDnra7ZaaQMQAxypvY8jScuvt651np+oziTmJV9oYoHJx6HqQVrgAV1PUuFS9gelEv4
	 h5OtnUGH/ZbkfECUFmDW2wRzIIquSR+zUA8bSYa2rx6KJAPAKIOqCQjJ+FnrX8b4TIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="WEvhS/HD";
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F84609CEDE;
	Mon, 19 Oct 2026 15:14:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28F84609CEDE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WEvhS/HD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792422878; x=1823958878;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TDUC9/ygnBevxT8Y20L5HUe3WFLonkXYpQ/2lAUky5g=;
  b=WEvhS/HDqalAO53KHkJ85ksgnVVW4ZpDMo/rpLAalKTXzCTlu3tjyQQS
   nDX+Z5/+xwBqWWfTwQdD2c1zS8e0nZmVOcmZOIOgGsBEff9NxvKrxySGX
   DWiztdlCiUPSosIgaroPDlyfdICwK2UYGtdr5VJrnYZDS7ze1gzeRox0B
   j+1oPPXXWy/X4kscZ5ZwBs00ixkHWGPXMSZ5S+1EnHrt+8IAnQVGyirRx
   sxVMzOMAFM7QiuyQq46OVP5BvcKaUNZJjN+I1hrb4HC19D3C7JWpd3DcF
   Qr7bfJzXQIRpR6cmv89KX7kLv4xHdxeVuSwOSbZB9X7MvBgRMGhE7cc6n
   w==;
X-CSE-ConnectionGUID: uIAJmcl7RPuY+gqe12bUcg==
X-CSE-MsgGUID: YzLfwR9ZT5iKs7iqRKCgDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="992128"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="992128"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 08:14:36 -0700
X-CSE-ConnectionGUID: ts3hCmxIRqujsEnHjHCn9g==
X-CSE-MsgGUID: IxcBpJplQy6yQzPxTgk6JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2636138"
Received: from jf5300-15a101203tc.jf.intel.com (HELO meta-crater2c.jf.intel.com) ([10.54.113.49])
  by fmviesa005.fm.intel.com with ESMTP; 19 Oct 2026 08:14:35 -0700
From: Daniel Byrne <daniel1.byrne@intel.com>
To: Vinod Koul <vkoul@kernel.org>,
	Dave Jiang <dave.jiang@intel.com>
Cc: Fenghua Yu <fenghua.yu@intel.com>,
	Frank Li <Frank.Li@kernel.org>,
	Vinicius Costa Gomes <vinicius.gomes@intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	dmaengine@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dmaengine: add dmaengine_async_is_tx_complete() for channel status queries
Date: Mon, 19 Oct 2026 08:06:30 -0700
Message-ID: <20261019150632.4026424-2-daniel1.byrne@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019150632.4026424-1-daniel1.byrne@intel.com>
References: <20261019150632.4026424-1-daniel1.byrne@intel.com>
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

Add dmaengine_async_is_tx_complete() as the client API for polling the
completion of one transaction. Like dma_async_is_tx_complete(), which
it deprecates, it routes the query to the channel's device_tx_status()
callback; the change is that it drops the @last and @used outputs,
which only make sense for providers that complete in cookie order.
A provider that tracks per-descriptor state can answer exactly from
that state, and a high-rate in-kernel polling user, the io_uring DSA
copy offload to be posted separately, depends on such answers.

The kernel-doc says how far such an answer goes. It is exact for a
transaction submitted without DMA_PREP_INTERRUPT, on the first query
that reports it finished. An interrupt-armed transaction reports its
result through callback_result, and a cookie whose descriptor has been
retired reads DMA_COMPLETE. The client guide's advice to pause or stop
the channel before a query points at that text.

dma_async_is_complete() was only used through dma_cookie_status(), so
delete it from the client header and open-code the cookie-window
comparison there. Move dma_set_tx_state(), which only providers call,
from the client header into drivers/dma/dmaengine.h; every in-tree
user already includes it. Convert dma_sync_wait() and dmatest to the
new helper, fix the two comments that still name the deleted helper,
and document the cookie assignment helpers in the provider guide.

Assisted-by: Claude:claude-opus-5-5
Assisted-by: Claude:claude-fable-5-1
Signed-off-by: Daniel Byrne <daniel1.byrne@intel.com>
---
 Documentation/driver-api/dmaengine/client.rst | 24 ++++-----
 .../driver-api/dmaengine/provider.rst         | 45 ++++++++++++++--
 drivers/dma/amba-pl08x.c                      |  2 +-
 drivers/dma/at_hdmac.c                        |  5 +-
 drivers/dma/dmaengine.c                       |  2 +-
 drivers/dma/dmaengine.h                       | 21 +++++++-
 drivers/dma/dmatest.c                         |  3 +-
 include/linux/dmaengine.h                     | 54 +++++++++----------
 8 files changed, 103 insertions(+), 53 deletions(-)

diff --git a/Documentation/driver-api/dmaengine/client.rst b/Documentation/driver-api/dmaengine/client.rst
index 5ee5d4a3596d..255aaad33339 100644
--- a/Documentation/driver-api/dmaengine/client.rst
+++ b/Documentation/driver-api/dmaengine/client.rst
@@ -277,8 +277,8 @@ The details of these operations are:
 
       dma_cookie_t dmaengine_submit(struct dma_async_tx_descriptor *desc)
 
-   This returns a cookie can be used to check the progress of DMA engine
-   activity via other DMA engine calls not covered in this document.
+   This returns a cookie that can be used to check the progress of a transaction
+   via dmaengine_async_is_tx_complete().
 
    dmaengine_submit() will not start the DMA operation, it merely adds
    it to the pending queue. For this, see step 5, dma_async_issue_pending.
@@ -357,23 +357,23 @@ Further APIs
 
    .. code-block:: c
 
-      enum dma_status dma_async_is_tx_complete(struct dma_chan *chan,
-		dma_cookie_t cookie, dma_cookie_t *last, dma_cookie_t *used)
+      enum dma_status dmaengine_async_is_tx_complete(struct dma_chan *chan,
+		dma_cookie_t cookie)
 
-   This can be used to check the status of the channel. Please see
-   the documentation in include/linux/dmaengine.h for a more complete
-   description of this API.
-
-   This can be used in conjunction with dma_async_is_complete() and
-   the cookie returned from dmaengine_submit() to check for
-   completion of a specific DMA transaction.
+   This can be used with the cookie returned from dmaengine_submit()
+   to check for completion of a specific DMA transaction.
 
    .. note::
 
       Not all DMA engine drivers can return reliable information for
       a running DMA channel. It is recommended that DMA engine users
       pause or stop (via dmaengine_terminate_all()) the channel before
-      using this API.
+      using this API, unless the provider tracks per-descriptor state.
+      Even such a provider answers exactly only within the limits that
+      the kernel-doc of dmaengine_async_is_tx_complete() in
+      include/linux/dmaengine.h describes: for a transaction submitted
+      without DMA_PREP_INTERRUPT, and on the first query that reports it
+      finished.
 
 5. Synchronize termination API
 
diff --git a/Documentation/driver-api/dmaengine/provider.rst b/Documentation/driver-api/dmaengine/provider.rst
index f4ed98f701c9..ef342886af96 100644
--- a/Documentation/driver-api/dmaengine/provider.rst
+++ b/Documentation/driver-api/dmaengine/provider.rst
@@ -419,7 +419,9 @@ supported.
 
     - tx_submit: A pointer to a function you have to implement,
       that is supposed to push the current transaction descriptor to a
-      pending queue, waiting for issue_pending to be called.
+      pending queue, waiting for issue_pending to be called. Each
+      descriptor is given a cookie to identify it. See the section
+      "Cookie Management" below.
 
     - phys: Physical address of the descriptor which is used later by
       the dma engine to read the descriptor and initiate transfer.
@@ -533,6 +535,41 @@ supported.
 
   - May sleep.
 
+Cookie Management
+------------------
+
+When a transaction is queued for submission via tx_submit(), the provider
+must assign that transaction a cookie (dma_cookie_t) to uniquely identify it.
+The provider is allowed to perform this assignment however it wants, but for
+convenience the following utility functions are available to create
+monotonically increasing cookies:
+
+  .. code-block:: c
+
+    void dma_cookie_init(struct dma_chan *chan);
+
+  Called once at channel creation.
+
+  .. code-block:: c
+
+    dma_cookie_t dma_cookie_assign(struct dma_async_tx_descriptor *tx);
+
+  Assign a cookie to the given descriptor.
+
+  .. code-block:: c
+
+    void dma_cookie_complete(struct dma_async_tx_descriptor *tx);
+
+  Mark the descriptor as complete and invalidate the cookie.
+
+  .. code-block:: c
+
+    enum dma_status dma_cookie_status(struct dma_chan *chan,
+      dma_cookie_t cookie, struct dma_tx_state *state);
+
+  Report the status of the cookie, filling in the state structure if
+  it is not NULL.
+
 
 Misc notes
 ==========
@@ -550,10 +587,10 @@ where to put them)
 
 dma_cookie_t
 
-- it's a DMA transaction ID that will increment over time.
+- it's a DMA transaction ID.
 
-- Not really relevant any more since the introduction of ``virt-dma``
-  that abstracts it away.
+- The value can be chosen by the provider, or use the helper APIs
+  such as dma_cookie_assign() and dma_cookie_complete().
 
 dma_vec
 
diff --git a/drivers/dma/amba-pl08x.c b/drivers/dma/amba-pl08x.c
index 5e88fd44812d..8c235a603bb0 100644
--- a/drivers/dma/amba-pl08x.c
+++ b/drivers/dma/amba-pl08x.c
@@ -1536,7 +1536,7 @@ static void pl08x_free_chan_resources(struct dma_chan *chan)
 }
 
 /*
- * Code accessing dma_async_is_complete() in a tight loop may give problems.
+ * Code polling the transaction status in a tight loop may give problems.
  * If slaves are relying on interrupts to signal completion this function
  * must not be called with interrupts disabled.
  */
diff --git a/drivers/dma/at_hdmac.c b/drivers/dma/at_hdmac.c
index e5b30a57c477..7ea0822a3900 100644
--- a/drivers/dma/at_hdmac.c
+++ b/drivers/dma/at_hdmac.c
@@ -1666,9 +1666,8 @@ static int atc_terminate_all(struct dma_chan *chan)
  * @cookie: transaction identifier to check status of
  * @txstate: if not %NULL updated with transaction state
  *
- * If @txstate is passed in, upon return it reflect the driver
- * internal state and can be used with dma_async_is_complete() to check
- * the status of multiple cookies without re-checking hardware state.
+ * If @txstate is passed in, upon return it reflects the driver
+ * internal state: the last completed and the last issued cookie.
  */
 static enum dma_status
 atc_tx_status(struct dma_chan *chan,
diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
index ced78c985d1c..d7febef65a2d 100644
--- a/drivers/dma/dmaengine.c
+++ b/drivers/dma/dmaengine.c
@@ -537,7 +537,7 @@ enum dma_status dma_sync_wait(struct dma_chan *chan, dma_cookie_t cookie)
 
 	dma_async_issue_pending(chan);
 	do {
-		status = dma_async_is_tx_complete(chan, cookie, NULL, NULL);
+		status = dmaengine_async_is_tx_complete(chan, cookie);
 		if (time_after_eq(jiffies, dma_sync_wait_timeout)) {
 			dev_err(chan->device->dev, "%s: timeout!\n", __func__);
 			return DMA_ERROR;
diff --git a/drivers/dma/dmaengine.h b/drivers/dma/dmaengine.h
index 53f16d3f0029..e72876a512a3 100644
--- a/drivers/dma/dmaengine.h
+++ b/drivers/dma/dmaengine.h
@@ -79,7 +79,26 @@ static inline enum dma_status dma_cookie_status(struct dma_chan *chan,
 		state->residue = 0;
 		state->in_flight_bytes = 0;
 	}
-	return dma_async_is_complete(cookie, complete, used);
+
+	if (complete <= used) {
+		if ((cookie <= complete) || (cookie > used))
+			return DMA_COMPLETE;
+	} else {
+		if ((cookie <= complete) && (cookie > used))
+			return DMA_COMPLETE;
+	}
+	return DMA_IN_PROGRESS;
+}
+
+static inline void dma_set_tx_state(struct dma_tx_state *st,
+	dma_cookie_t last, dma_cookie_t used, u32 residue)
+{
+	if (!st)
+		return;
+
+	st->last = last;
+	st->used = used;
+	st->residue = residue;
 }
 
 static inline void dma_set_residue(struct dma_tx_state *state, u32 residue)
diff --git a/drivers/dma/dmatest.c b/drivers/dma/dmatest.c
index 2ae3469397f3..3d0d54a97add 100644
--- a/drivers/dma/dmatest.c
+++ b/drivers/dma/dmatest.c
@@ -847,8 +847,7 @@ static int dmatest_func(void *data)
 					done->done,
 					msecs_to_jiffies(params->timeout));
 
-			status = dma_async_is_tx_complete(chan, cookie, NULL,
-							  NULL);
+			status = dmaengine_async_is_tx_complete(chan, cookie);
 		}
 
 		if (!done->done) {
diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
index 4178248611d9..83bef7a70b99 100644
--- a/include/linux/dmaengine.h
+++ b/include/linux/dmaengine.h
@@ -1596,9 +1596,12 @@ static inline void dma_async_issue_pending(struct dma_chan *chan)
  * @last: returns last completed cookie, can be NULL
  * @used: returns last issued cookie, can be NULL
  *
- * If @last and @used are passed in, upon return they reflect the driver
- * internal state and can be used with dma_async_is_complete() to check
- * the status of multiple cookies without re-checking hardware state.
+ * This function is deprecated. New code should use
+ * dmaengine_async_is_tx_complete() instead.
+ *
+ * If @last and @used are passed in, upon return they reflect the most
+ * recently submitted (used) cookie and the most recently completed
+ * cookie.
  */
 static inline enum dma_status dma_async_is_tx_complete(struct dma_chan *chan,
 	dma_cookie_t cookie, dma_cookie_t *last, dma_cookie_t *used)
@@ -1615,36 +1618,29 @@ static inline enum dma_status dma_async_is_tx_complete(struct dma_chan *chan,
 }
 
 /**
- * dma_async_is_complete - test a cookie against chan state
- * @cookie: transaction identifier to test status of
- * @last_complete: last know completed transaction
- * @last_used: last cookie value handed out
+ * dmaengine_async_is_tx_complete - poll for transaction completion
+ * @chan: DMA channel
+ * @cookie: transaction identifier to check status of
  *
- * dma_async_is_complete() is used in dma_async_is_tx_complete()
- * the test logic is separated for lightweight testing of multiple cookies
+ * Query the provider's device_tx_status() callback for the state of a
+ * single transaction. Providers that rely on cookie ordering answer with
+ * the cookie-window approximation. Providers that track per-descriptor
+ * state can answer exactly, but only for a transaction submitted without
+ * DMA_PREP_INTERRUPT and only on the first query that reports it
+ * finished. A transaction submitted with DMA_PREP_INTERRUPT reports its
+ * result through callback_result, and the query only tells whether it
+ * has finished. Once the first terminal answer has retired the
+ * descriptor, a later query for the same cookie reads DMA_COMPLETE.
+ *
+ * Return: DMA_COMPLETE, DMA_IN_PROGRESS, DMA_PAUSED, DMA_ERROR or
+ * DMA_OUT_OF_ORDER.
  */
-static inline enum dma_status dma_async_is_complete(dma_cookie_t cookie,
-			dma_cookie_t last_complete, dma_cookie_t last_used)
-{
-	if (last_complete <= last_used) {
-		if ((cookie <= last_complete) || (cookie > last_used))
-			return DMA_COMPLETE;
-	} else {
-		if ((cookie <= last_complete) && (cookie > last_used))
-			return DMA_COMPLETE;
-	}
-	return DMA_IN_PROGRESS;
-}
-
-static inline void
-dma_set_tx_state(struct dma_tx_state *st, dma_cookie_t last, dma_cookie_t used, u32 residue)
+static inline enum dma_status dmaengine_async_is_tx_complete(struct dma_chan *chan,
+	dma_cookie_t cookie)
 {
-	if (!st)
-		return;
+	struct dma_tx_state state;
 
-	st->last = last;
-	st->used = used;
-	st->residue = residue;
+	return chan->device->device_tx_status(chan, cookie, &state);
 }
 
 #ifdef CONFIG_DMA_ENGINE
-- 
2.43.0

