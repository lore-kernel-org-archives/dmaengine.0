Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8240C4F55BC;
	Mon, 12 Oct 2026 21:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791841137; cv=none; b=qs9k1TTrXFeNdMqe+S7anQFWmPf5KsJCwFE4cmVGGhuZ6vMcdu7hBRXbk4SoqXhOWyyT7Yt1dil1cir6iH8VvvE1ajkHKfA33BojSl+kKQ9YR1TXYixiZckXOzr6LlUvQDY73UVlrHc7V9WA8K9Crsq7+PSXg6JYZ8c40Nu4qxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791841137; c=relaxed/simple;
	bh=tOilvSTC8/h8ezC7J4rJQrlBpp5dG8Zc+vshrt1PZOU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qXz0JWnpSCWKpWftoXCzdzkdFudFKrzMNjh/OKz0e9Tv9P46Bcpl7v4Qj+hp07dzbslmJFqSxhZB4Jz5skeq9Bt2XcMg2bPq0mbV5eFmLwWIOYBsM7cEx2vLrNkznjeEXNSt/EgLNCAx13Klf/B5UTu8in3WUPARbfVhZaumLXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YKK2rfjO; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YKK2rfjO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791841136; x=1823377136;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=tOilvSTC8/h8ezC7J4rJQrlBpp5dG8Zc+vshrt1PZOU=;
  b=YKK2rfjOkVU5gN9KF1LafL+4aN/Mm2bpM+SnFgKUpXHE1tHv2JOEoXUK
   eWgO0QY2BN8HxtL7AlxB/r3fv2I8WPwxSFhnwgfleBpXWLhWLGHI9fXMb
   AGrT8zoXF0ZDwaiPL+cghHJ6KQIaVXAMQOm1q7uTMVCMcIbCpIcDxtULV
   tFjWwHPp7eGH57YGKQ6QuLdcTgkynDTc6EkNC7pMD14zxHAU5DXswRWoi
   oewJmjiAhg3oxD+TKt5WCKf4EHYAn9mnkmInmnjUURIalmhiNdeLZBt7a
   7aMoZgOK4l+42j/ZlO/N8guISqIbEPiwzBLLCIbqSDHAbsNm7AMaVlXvv
   A==;
X-CSE-ConnectionGUID: z251yTTlSeSdHnqKrPOQWw==
X-CSE-MsgGUID: oQ+Qbi5vSM+dk9MCGod3BA==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="459915"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="459915"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 14:38:39 -0700
X-CSE-ConnectionGUID: UUufAmdgQKODYwv+ZTCFPg==
X-CSE-MsgGUID: SB6/2e9XTruKh8//4GN+2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="986076"
Received: from vcostago-desk1.jf.intel.com (HELO [10.241.243.117]) ([10.241.243.117])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 14:38:39 -0700
From: Vinicius Costa Gomes <vinicius.gomes@intel.com>
Date: Mon, 12 Oct 2026 14:38:09 -0700
Subject: [PATCH 6/6] dmaengine: idxd: Do not release interrupt handles on
 terminate_all
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-wt-idxd-fixes-v1-6-30a35a445077@intel.com>
References: <20261012-wt-idxd-fixes-v1-0-30a35a445077@intel.com>
In-Reply-To: <20261012-wt-idxd-fixes-v1-0-30a35a445077@intel.com>
To: Dave Jiang <dave.jiang@intel.com>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>, Fenghua Yu <fenghuay@nvidia.com>, 
 Shuai Xue <xueshuai@linux.alibaba.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Vinicius Costa Gomes <vinicius.gomes@intel.com>, 
 Zhenzhong Duan <zhenzhong.duan@intel.com>
X-Mailer: b4 0.17-dev-362b8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791841118; l=2905;
 i=vinicius.gomes@intel.com; s=20230921; h=from:subject:message-id;
 bh=tOilvSTC8/h8ezC7J4rJQrlBpp5dG8Zc+vshrt1PZOU=;
 b=0RvrYTePKgefXJ5sc9A9+nwSBtDTYpBQJFF6aAUUdPlBoo0Iu4WS34hGfi8hM9Dk2duHf9N2S
 sKYyR0SdcIUBbY+Lw+w8ea3jJJQwW2Z1oettVHwzCZkgUqV7g/ggAdG
X-Developer-Key: i=vinicius.gomes@intel.com; a=ed25519;
 pk=aJkrtgqgT6TZ8iIHSG8/rTPsmlYnjMrUjCsMYvCzntk=

idxd_wq_flush_descs() is called from the dmaengine .device_terminate_all
path, but besides flushing the pending descriptors it also releases the
interrupt handle. As the workqueue stays enabled, the handle is never
re-armed, and any subsequent submission uses an invalid handle and never
completes.

This only shows up when the same workqueue is used more than once: the
first run leaves the handle released on terminate_all, so any later run
times out on every descriptor. dmatest reproduces it by running twice.

Split the interrupt handle teardown into idxd_wq_release_int_handle() so
that terminate_all only flushes descriptors. The FLR path still needs
both, so call them together there.

Fixes: 2a93f5747d0e ("dmaengine: idxd: Flush all pending descriptors")
Reported-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
Signed-off-by: Vinicius Costa Gomes <vinicius.gomes@intel.com>
---
 drivers/dma/idxd/device.c | 11 ++++++++++-
 drivers/dma/idxd/idxd.h   |  1 +
 drivers/dma/idxd/irq.c    |  1 +
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/idxd/device.c b/drivers/dma/idxd/device.c
index 131138483b87..06299f40f531 100644
--- a/drivers/dma/idxd/device.c
+++ b/drivers/dma/idxd/device.c
@@ -1349,6 +1349,16 @@ void idxd_wq_free_irq(struct idxd_wq *wq)
 }
 
 void idxd_wq_flush_descs(struct idxd_wq *wq)
+{
+	guard(mutex)(&wq->wq_lock);
+
+	if (wq->state != IDXD_WQ_ENABLED || wq->type != IDXD_WQT_KERNEL)
+		return;
+
+	idxd_flush_pending_descs(&wq->ie);
+}
+
+void idxd_wq_release_int_handle(struct idxd_wq *wq)
 {
 	struct idxd_irq_entry *ie = &wq->ie;
 	struct idxd_device *idxd = wq->idxd;
@@ -1358,7 +1368,6 @@ void idxd_wq_flush_descs(struct idxd_wq *wq)
 	if (wq->state != IDXD_WQ_ENABLED || wq->type != IDXD_WQT_KERNEL)
 		return;
 
-	idxd_flush_pending_descs(ie);
 	if (idxd->request_int_handles)
 		idxd_device_release_int_handle(idxd, ie->int_handle, IDXD_IRQ_MSIX);
 	idxd_device_clear_perm_entry(idxd, ie);
diff --git a/drivers/dma/idxd/idxd.h b/drivers/dma/idxd/idxd.h
index ce78b9a7c641..f4aed90560e0 100644
--- a/drivers/dma/idxd/idxd.h
+++ b/drivers/dma/idxd/idxd.h
@@ -804,6 +804,7 @@ int idxd_wq_init_percpu_ref(struct idxd_wq *wq);
 void idxd_wq_free_irq(struct idxd_wq *wq);
 int idxd_wq_request_irq(struct idxd_wq *wq);
 void idxd_wq_flush_descs(struct idxd_wq *wq);
+void idxd_wq_release_int_handle(struct idxd_wq *wq);
 
 /* submission */
 int idxd_submit_desc(struct idxd_wq *wq, struct idxd_desc *desc);
diff --git a/drivers/dma/idxd/irq.c b/drivers/dma/idxd/irq.c
index 6a25e1fd0e62..26d75d744797 100644
--- a/drivers/dma/idxd/irq.c
+++ b/drivers/dma/idxd/irq.c
@@ -405,6 +405,7 @@ static void idxd_wqs_flush_descs(struct idxd_device *idxd)
 		struct idxd_wq *wq = idxd->wqs[i];
 
 		idxd_wq_flush_descs(wq);
+		idxd_wq_release_int_handle(wq);
 	}
 }
 

-- 
2.56.0

