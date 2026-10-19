Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792422879;
	b=nmA4tCEqKGsottnGWh6DWPu/Drw/ld1TNBkdkS8iOgSAKLxZlitouRtnGKaLZgK8yqra
	 Eg2fmqMV/yQRTivDw90QjjM1Q+l0s9amGkgK+tCPvFLdjkXQTm5NPccfe+JmirUbEByvO
	 lV1WXbQ2ol0dpvqvZODqAauawIcfo5quwDryUFHXTBrusu7/nGa6+UTdzboufU2utOYel
	 n7m73DG/R713mFm2xMose7KYB5g6Te0ES2gFyrWUr5TkflSETrt/hhSM5ROI6vf+dE5K2
	 7h8vtW79kxWJUXMl+KsHZBWZewUDi4aayPNvYb0EWqjRjUn8FFXiQTIFPT6uSVBDG7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792422879;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=z2W4QtM//rkXfqjHQ7/TEqFOqtfnpjSrxUFW4r4yHmY=;
	b=HWTDg/SjW/YVOuSSQhm4hgDO1Z339sow/SmhSp0Z6rtxQXfBw+AdexrpZEwlN/qvj2ba
	 lXv6CHxarVQvHAbYffgA/m+jq2Cd1qDtcjKAblSoBde/iq28jlwxaoeKyOO2ipnbzjJgT
	 XwxnLhkefNuzrTduf008+pHjqhRp8WJwa2MXCgC0lcSsI/1QWyyysHooZQXc/huYun6RT
	 CEpZDWiS8lEso6aGbsdpaY4gc+1DkZDAkAmcpYgJId0V75y0t/Pt+5a4Ovqbl0JYpLtvg
	 TUP5VJ81gTcbn5D9M6KRkSeuSte/m0Ok8fWzPorKEcq9eCVvAAoJ94Cp4SJFnRrrbsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YeAeR60b;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04407609CECF;
	Mon, 19 Oct 2026 15:14:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04407609CECF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YeAeR60b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792422879; x=1823958879;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4TTqTt9wzLanOmqx5tRJYgHRoGJHQa7XuL3mClvOZ3Q=;
  b=YeAeR60b1PLTk6v3Er/fE2/Yxw06x1WKSBhBPop7cnQyMxXSMuuQMcY0
   XqyzbMejcDzrEZTdVxepmlmhWjd/U6lBojPaG7EtObfsXOigpW0pm1+/v
   Z1nqYQHEYPn2RaphLa0NOlGbRLgmwlsebHWRXOTdRiFVp4/DQSF6POMoN
   FUU8JaXagVfDGGN75HzQEikYUELzaSF2Nm7YJQjO4rpS3KaYo05WMR2xU
   pbtxKBpWFlg5Wq0gjtuTrTtK40HMOezrNkvKFQXslsTO1Htd1Hg3njIb5
   0MvJff4K9sDZcxADaTLHEDIsfAg1hldZA9kVg8QhZscKD1XAY3cQ8vu+x
   w==;
X-CSE-ConnectionGUID: FWbVHQqkQZ+924jaflNnvQ==
X-CSE-MsgGUID: ZbO0D9CeTNeMo/jMaOKOug==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="992135"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="992135"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 08:14:36 -0700
X-CSE-ConnectionGUID: Es0OG1AjQvONz3CixRLctA==
X-CSE-MsgGUID: jLfSd1UcT+SHn92uwWKARg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2636147"
Received: from jf5300-15a101203tc.jf.intel.com (HELO meta-crater2c.jf.intel.com) ([10.54.113.49])
  by fmviesa005.fm.intel.com with ESMTP; 19 Oct 2026 08:14:36 -0700
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
Subject: [PATCH 3/3] dmaengine: drop DMA_COMPLETION_NO_ORDER and DMA_OUT_OF_ORDER
Date: Mon, 19 Oct 2026 08:06:32 -0700
Message-ID: <20261019150632.4026424-4-daniel1.byrne@intel.com>
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

DMA_COMPLETION_NO_ORDER (commit 47ec7f09bc10 ("dmaengine: cookie bypass
for out of order completion")) flagged devices whose completions can
overtake submission order. On DSA this happens when a work queue (one
dmaengine channel) belongs to a group that contains several engines.
Per-channel cookie tracking gives wrong answers in this case, since
dma_cookie_complete() moves the completed-cookie watermark past
still-in-flight earlier descriptors, so cookie-order status can report
DMA_COMPLETE for a running transfer. Clients were told to use
callbacks only, dmatest refused polled mode, and DMA_OUT_OF_ORDER
existed as the tx_status answer for such devices.

idxd, the only in-tree setter, now answers
dmaengine_async_is_tx_complete() from per-descriptor generation
numbers, exactly within the limits that helper's kernel-doc states: for
a transaction submitted without DMA_PREP_INTERRUPT, on the first query
that reports it finished. Polling an out-of-order device is therefore
safe and neither the capability nor the status code has any remaining
meaning. Drop them.

Whether reordering occurs at all is group configuration rather than a
device property. A group with a single engine completes its work
queues' descriptors in order. However, the driver cannot assume how
the administrator grouped engines, and the all-engines-in-one-group
layout is the device's throughput configuration.

Assisted-by: Claude:claude-opus-5-5
Assisted-by: Claude:claude-fable-5-1
Signed-off-by: Daniel Byrne <daniel1.byrne@intel.com>
---
 .../driver-api/dmaengine/provider.rst         | 19 -------------------
 drivers/dma/dmatest.c                         | 11 +----------
 drivers/dma/idxd/dma.c                        |  1 -
 include/linux/dmaengine.h                     |  5 +----
 4 files changed, 2 insertions(+), 34 deletions(-)

diff --git a/Documentation/driver-api/dmaengine/provider.rst b/Documentation/driver-api/dmaengine/provider.rst
index ef342886af96..435ccd3bedac 100644
--- a/Documentation/driver-api/dmaengine/provider.rst
+++ b/Documentation/driver-api/dmaengine/provider.rst
@@ -260,22 +260,6 @@ Currently, the types available are:
     want to transfer a portion of uncompressed data directly to the
     display to print it
 
-- DMA_COMPLETION_NO_ORDER
-
-  - The device does not support in order completion.
-
-  - The driver should return DMA_OUT_OF_ORDER for device_tx_status if
-    the device is setting this capability.
-
-  - All cookie tracking and checking API should be treated as invalid if
-    the device exports this capability.
-
-  - At this point, this is incompatible with polling option for dmatest.
-
-  - If this cap is set, the user is recommended to provide an unique
-    identifier for each descriptor sent to the DMA device in order to
-    properly track the completion.
-
 - DMA_REPEAT
 
   - The device supports repeated transfers. A repeated transfer, indicated by
@@ -468,9 +452,6 @@ supported.
   - In the case of a cyclic transfer, it should only take into
     account the total size of the cyclic buffer.
 
-  - Should return DMA_OUT_OF_ORDER if the device does not support in order
-    completion and is completing the operation out of order.
-
   - This function can be called in an interrupt context.
 
 - device_config
diff --git a/drivers/dma/dmatest.c b/drivers/dma/dmatest.c
index 3d0d54a97add..fbfa2f1d6f29 100644
--- a/drivers/dma/dmatest.c
+++ b/drivers/dma/dmatest.c
@@ -854,10 +854,7 @@ static int dmatest_func(void *data)
 			result("test timed out", total_tests, src->off, dst->off,
 			       len, 0);
 			goto error_unmap_continue;
-		} else if (status != DMA_COMPLETE &&
-			   !(dma_has_cap(DMA_COMPLETION_NO_ORDER,
-					 dev->cap_mask) &&
-			     status == DMA_OUT_OF_ORDER)) {
+		} else if (status != DMA_COMPLETE) {
 			result(status == DMA_ERROR ?
 			       "completion error status" :
 			       "completion busy status", total_tests, src->off,
@@ -1035,12 +1032,6 @@ static int dmatest_add_channel(struct dmatest_info *info,
 	dtc->chan = chan;
 	INIT_LIST_HEAD(&dtc->threads);
 
-	if (dma_has_cap(DMA_COMPLETION_NO_ORDER, dma_dev->cap_mask) &&
-	    info->params.polled) {
-		info->params.polled = false;
-		pr_warn("DMA_COMPLETION_NO_ORDER, polled disabled\n");
-	}
-
 	if (dma_has_cap(DMA_MEMCPY, dma_dev->cap_mask)) {
 		if (dmatest == 0) {
 			cnt = dmatest_add_threads(info, dtc, DMA_MEMCPY);
diff --git a/drivers/dma/idxd/dma.c b/drivers/dma/idxd/dma.c
index dd5a9d9274ce..19340c7ae2d3 100644
--- a/drivers/dma/idxd/dma.c
+++ b/drivers/dma/idxd/dma.c
@@ -417,7 +417,6 @@ int idxd_register_dma_device(struct idxd_device *idxd)
 
 	dma_cap_set(DMA_INTERRUPT, dma->cap_mask);
 	dma_cap_set(DMA_PRIVATE, dma->cap_mask);
-	dma_cap_set(DMA_COMPLETION_NO_ORDER, dma->cap_mask);
 	dma->device_release = idxd_dma_release;
 
 	dma->device_prep_dma_interrupt = idxd_dma_prep_interrupt;
diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
index 83bef7a70b99..9f73470759bb 100644
--- a/include/linux/dmaengine.h
+++ b/include/linux/dmaengine.h
@@ -39,7 +39,6 @@ enum dma_status {
 	DMA_IN_PROGRESS,
 	DMA_PAUSED,
 	DMA_ERROR,
-	DMA_OUT_OF_ORDER,
 };
 
 /**
@@ -62,7 +61,6 @@ enum dma_transaction_type {
 	DMA_SLAVE,
 	DMA_CYCLIC,
 	DMA_INTERLEAVE,
-	DMA_COMPLETION_NO_ORDER,
 	DMA_REPEAT,
 	DMA_LOAD_EOT,
 /* last transaction type for creation of the capabilities mask */
@@ -1632,8 +1630,7 @@ static inline enum dma_status dma_async_is_tx_complete(struct dma_chan *chan,
  * has finished. Once the first terminal answer has retired the
  * descriptor, a later query for the same cookie reads DMA_COMPLETE.
  *
- * Return: DMA_COMPLETE, DMA_IN_PROGRESS, DMA_PAUSED, DMA_ERROR or
- * DMA_OUT_OF_ORDER.
+ * Return: DMA_COMPLETE, DMA_IN_PROGRESS, DMA_PAUSED or DMA_ERROR.
  */
 static inline enum dma_status dmaengine_async_is_tx_complete(struct dma_chan *chan,
 	dma_cookie_t cookie)
-- 
2.43.0

