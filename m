Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795650571;
	b=AufNNqBUEaVRt8Ksm/oTJ7qu3MlML0nseE4KF5uBcJeag8xZMlbmcDplqalj8VAstxt7
	 EwJA6z5Pq8S+oSD6Avoi7jy+yyxbmQTISS4573uXiiFSbLCiBG62/omEyZWGqTGA6wtWz
	 E+/UuLJa7NXQ8Y1VwlSdvCKdptUMvb1V5RVxliR7QYkdYH9N4WjDxjZqKUxHhYJSgzNgQ
	 0UTm4IqMhnBJcc0mozw0M+hfZE7UOQe6ANMffX9SyG5BDFRg0v5j4afx9BxEzybdEwEu7
	 a6FFb4mzXHPXtuTS+05l5mdQnhI1rV0KNe7LA2PjEDRUB5CIUMJTQZoRQ/49knTN7GQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795650571;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=gFZNpG9Eqyf6YICUzEEAWrMnNpSXy/fCRlLxXy0TdIE=;
	b=iogKIbedWQNbmZJyKsvSpvI4Q/Md6CKJ0mlrsHMW4u7QGZrwyL+GKWMg/O5MAwQUOWzH
	 Lzqv+PtgOX8B+8Fw3kTJGaqe/2FLbKB5Ts+SEPfT2fLAE4YztDb72E1qNyXG7aRwdDQg7
	 JmzpKsutjekJecjRyy2TSUcIfWE37TsKJVcyfX6lwayYUGluR2L6e/swdB0WYqRM5xyc1
	 Q9DooTZD9VJ7Y1KRq9bBVwI2UY/vYfdhUEgcyMuWjSf7Nz++Mzn/gCwdwDV/UpGgsSKD8
	 vs4xQNuOqy0yx8I/IN4Uh/M0/9pWkkh+5v9/AclNbIXs/doYmxKgXoA/T89AnlOqgsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UQbtV3bE;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFBC606A681;
	Wed, 25 Nov 2026 23:49:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCFBC606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UQbtV3bE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795650570; x=1827186570;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=psikbIgkVHZLxmZjcI8ZWsgkrJEQcN7tTLOLTQXVTw8=;
  b=UQbtV3bEfCwmqYH/s7UM3rYjKv97aGqVt684CMTi8lYYSJsxuvUoR+JH
   AsErCgxTvT+ZKP38adVzMNEKPlZYR/C2qBDGGRYAhDG4PHosX/Xez4oWu
   oiPDHNGxAg1skxbneKy4s8j6g76GPdCrsn8fQy3bDlFkH/PaE0nZT3UCs
   usv1VewjQEUe+oqa5qLENEAw10kJ99BnQVCrYEv7kaDBXGCcpvGq4jUAt
   Nj2fcyEslpYFAPm63ref5VC9y6sy9tNlJY3QJCq88PY8rctr/FfVCN1rl
   iHT/fifjsdbs3N1jcHusVeI3EriM/4lXG41J7cSYhIinr7ZJW1geqfh/Y
   w==;
X-CSE-ConnectionGUID: HE7i/keWRQSwJaBMIpYOgQ==
X-CSE-MsgGUID: Ked+PghJT0m7Fr6vy9xdMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4597286"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4597286"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 15:49:28 -0800
X-CSE-ConnectionGUID: i1o2VaOgT7CPoHx5ZABq9w==
X-CSE-MsgGUID: EAP7zg8MTvG08sa9WiKCGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="11873834"
Received: from vcostago-desk.jf.intel.com (HELO [10.241.240.61]) ([10.241.240.61])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 15:49:28 -0800
From: Vinicius Costa Gomes <vinicius.gomes@intel.com>
Date: Wed, 25 Nov 2026 15:49:02 -0800
Subject: [PATCH v2 4/8] dmaengine: idxd: Fix the device registration error
 paths
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
Message-Id: <20261125-wt-idxd-fixes-v2-4-25a4691dfb9e@intel.com>
References: <20261125-wt-idxd-fixes-v2-0-25a4691dfb9e@intel.com>
In-Reply-To: <20261125-wt-idxd-fixes-v2-0-25a4691dfb9e@intel.com>
To: Dave Jiang <dave.jiang@intel.com>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>, Fenghua Yu <fenghuay@nvidia.com>, 
 Shuai Xue <xueshuai@linux.alibaba.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Vinicius Costa Gomes <vinicius.gomes@intel.com>
X-Mailer: b4 0.17-dev-1b309
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795650562; l=4157;
 i=vinicius.gomes@intel.com; s=20230921; h=from:subject:message-id;
 bh=psikbIgkVHZLxmZjcI8ZWsgkrJEQcN7tTLOLTQXVTw8=;
 b=R07xXkFBKyMCMTheR+f7rTBEBSaA6KbvfxoMziu7t/2TT0oxmvDQ0nNdWb4qJ9UBFupvztQkn
 woNG/TimBdeB7CQ4ti0x6Viy257nQ0bbzXJnK6bdDtWn3ONHbEDKEVj
X-Developer-Key: i=vinicius.gomes@intel.com; a=ed25519;
 pk=aJkrtgqgT6TZ8iIHSG8/rTPsmlYnjMrUjCsMYvCzntk=

idxd_setup_*() takes a reference on each wq, engine and group device,
and idxd_cleanup_internals() drops it. When registering the devices
fails, the error paths drop it first:

 idxd_pci_probe_alloc()
 |-idxd_register_devices()
 | \-idxd_register_{wq,engine,group}_devices()
 |   put_device() or device_unregister() on each device.
 |   The last reference is gone, the device is freed.
 |
 \-idxd_cleanup()
   \-idxd_cleanup_internals()
     put_device() on each device again, use-after-free.

idxd_register_devices() does the same, with device_unregister(), for
the devices registered before the failure.

The rollback in the helpers is also off by one. With j = i - 1 and
while (j--), it skips the last device added. When the first device
fails, j starts at -1 and the loop walks off the front of the array.

Only device_del() the devices that were added, and leave the references
to idxd_cleanup_internals().

Fixes: 7c5dd23e57c1 ("dmaengine: idxd: fix wq conf_dev 'struct device' lifetime")
Fixes: 75b911309060 ("dmaengine: idxd: fix engine conf_dev lifetime")
Fixes: defe49f96012 ("dmaengine: idxd: fix group conf_dev lifetime")
Fixes: ddf742d4f3f1 ("dmaengine: idxd: Add missing cleanup for early error out in probe call")
Signed-off-by: Vinicius Costa Gomes <vinicius.gomes@intel.com>
---
 drivers/dma/idxd/sysfs.c | 40 +++++++++++-----------------------------
 1 file changed, 11 insertions(+), 29 deletions(-)

diff --git a/drivers/dma/idxd/sysfs.c b/drivers/dma/idxd/sysfs.c
index d5ffc641c856..87fa4f43e27c 100644
--- a/drivers/dma/idxd/sysfs.c
+++ b/drivers/dma/idxd/sysfs.c
@@ -1864,7 +1864,7 @@ const struct device_type iax_device_type = {
 static int idxd_register_engine_devices(struct idxd_device *idxd)
 {
 	struct idxd_engine *engine;
-	int i, j, rc;
+	int i, rc;
 
 	for (i = 0; i < idxd->max_engines; i++) {
 		engine = idxd->engines[i];
@@ -1876,15 +1876,9 @@ static int idxd_register_engine_devices(struct idxd_device *idxd)
 	return 0;
 
 cleanup:
-	j = i - 1;
-	for (; i < idxd->max_engines; i++) {
+	while (i--) {
 		engine = idxd->engines[i];
-		put_device(engine_confdev(engine));
-	}
-
-	while (j--) {
-		engine = idxd->engines[j];
-		device_unregister(engine_confdev(engine));
+		device_del(engine_confdev(engine));
 	}
 	return rc;
 }
@@ -1892,7 +1886,7 @@ static int idxd_register_engine_devices(struct idxd_device *idxd)
 static int idxd_register_group_devices(struct idxd_device *idxd)
 {
 	struct idxd_group *group;
-	int i, j, rc;
+	int i, rc;
 
 	for (i = 0; i < idxd->max_groups; i++) {
 		group = idxd->groups[i];
@@ -1904,15 +1898,9 @@ static int idxd_register_group_devices(struct idxd_device *idxd)
 	return 0;
 
 cleanup:
-	j = i - 1;
-	for (; i < idxd->max_groups; i++) {
+	while (i--) {
 		group = idxd->groups[i];
-		put_device(group_confdev(group));
-	}
-
-	while (j--) {
-		group = idxd->groups[j];
-		device_unregister(group_confdev(group));
+		device_del(group_confdev(group));
 	}
 	return rc;
 }
@@ -1920,7 +1908,7 @@ static int idxd_register_group_devices(struct idxd_device *idxd)
 static int idxd_register_wq_devices(struct idxd_device *idxd)
 {
 	struct idxd_wq *wq;
-	int i, rc, j;
+	int i, rc;
 
 	for (i = 0; i < idxd->max_wqs; i++) {
 		wq = idxd->wqs[i];
@@ -1932,15 +1920,9 @@ static int idxd_register_wq_devices(struct idxd_device *idxd)
 	return 0;
 
 cleanup:
-	j = i - 1;
-	for (; i < idxd->max_wqs; i++) {
+	while (i--) {
 		wq = idxd->wqs[i];
-		put_device(wq_confdev(wq));
-	}
-
-	while (j--) {
-		wq = idxd->wqs[j];
-		device_unregister(wq_confdev(wq));
+		device_del(wq_confdev(wq));
 	}
 	return rc;
 }
@@ -1976,10 +1958,10 @@ int idxd_register_devices(struct idxd_device *idxd)
 
  err_group:
 	for (i = 0; i < idxd->max_engines; i++)
-		device_unregister(engine_confdev(idxd->engines[i]));
+		device_del(engine_confdev(idxd->engines[i]));
  err_engine:
 	for (i = 0; i < idxd->max_wqs; i++)
-		device_unregister(wq_confdev(idxd->wqs[i]));
+		device_del(wq_confdev(idxd->wqs[i]));
  err_wq:
 	device_del(idxd_confdev(idxd));
 	return rc;

-- 
2.56.1

