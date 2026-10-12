Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DFA3BF68D;
	Mon, 12 Oct 2026 21:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791841136; cv=none; b=DAY04AzV+WY8W7XBT0C9cMOc3G7+vTUbrAcHKBPMkTDZsJKWaelx0R5DhN9qBn4IlwIL6FJmWNdHl0n3bz7fwZoLpYTRHH5cvlyYm6SJutPr6uyQQrLmm8uv3dH05Rywiv3KL32NFs0H/BBuSdQb/BAOGksgmauBm9qczqkyEW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791841136; c=relaxed/simple;
	bh=aYQVoT0Tc7BdS/Y3vtjo08DcqnXoVDksw6bzyVdHoZs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SxET1jEAu0vUtRD3SWQFioDE0zexAt+0+kgNPneCduooHqwWAAID8ZWAyZAe5DjEG3NdZzUYnxu2QxcI/lDDGKmZOE7yJ03cR3HBSF29kgp5eiYX1pEUWlkFJSRE2+SeKBebuevZhBLBjCUOxxss997OUXiBKy9JuJRST8wgRr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YLmufzkf; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YLmufzkf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791841131; x=1823377131;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=aYQVoT0Tc7BdS/Y3vtjo08DcqnXoVDksw6bzyVdHoZs=;
  b=YLmufzkfLnReXPqWqhshPQjQ6QvC1sDKSX30i5bk+Ru1oHjeEB3yFxjo
   jWvwFMEzclxEHd++Bc25TUWoaFZPv2M8ljdIW4qRqlExNoyizt9YlArWK
   ANDKKaIspjTk9TnAlh+PvLYW6pPuX8bqxFEhs0CzOdrgKBEiof2SNfL+v
   TnahnuOVQGFYr6GbDyxvEqmWKHZvozHvuaX3MXGaUFN23DDM5K9GcYvmK
   WQKIh0X+gL0dqpg2P8WMvb0xTtZbIcmhj4rLtXRt/Nww9Rr44q66cEdvZ
   VaK7O+DhT6Brr7FaXUVFd1AkLOj/H4ucpWkfB4b7plHHtaquom+we1Agb
   A==;
X-CSE-ConnectionGUID: H1mtGPDoTxm+uXW274kozQ==
X-CSE-MsgGUID: 3GvcBPCUSfyI5wM0yHc8Mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="459907"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="459907"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 14:38:39 -0700
X-CSE-ConnectionGUID: xQAo6Bo3Tcaz1pisb3mwWw==
X-CSE-MsgGUID: 7Ag+PMUjQDCOZDmLo1FceA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="986071"
Received: from vcostago-desk1.jf.intel.com (HELO [10.241.243.117]) ([10.241.243.117])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 14:38:39 -0700
From: Vinicius Costa Gomes <vinicius.gomes@intel.com>
Date: Mon, 12 Oct 2026 14:38:07 -0700
Subject: [PATCH 4/6] dmaengine: idxd: Fix unwind bounds in device
 registration error paths
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-wt-idxd-fixes-v1-4-30a35a445077@intel.com>
References: <20261012-wt-idxd-fixes-v1-0-30a35a445077@intel.com>
In-Reply-To: <20261012-wt-idxd-fixes-v1-0-30a35a445077@intel.com>
To: Dave Jiang <dave.jiang@intel.com>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>, Fenghua Yu <fenghuay@nvidia.com>, 
 Shuai Xue <xueshuai@linux.alibaba.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Vinicius Costa Gomes <vinicius.gomes@intel.com>
X-Mailer: b4 0.17-dev-362b8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791841118; l=1822;
 i=vinicius.gomes@intel.com; s=20230921; h=from:subject:message-id;
 bh=aYQVoT0Tc7BdS/Y3vtjo08DcqnXoVDksw6bzyVdHoZs=;
 b=bX8u7KxehM4VXdCpl3QzciqZR/e2ri1VIaYySPceqQPsz+K9gI+XE/3mVCPegKZhFB7VplQ4l
 3bJIl1WlGCGBA8VpRqmDuh94QXgqd0Evj8r6quDyhi2ukbVhc1GHUzt
X-Developer-Key: i=vinicius.gomes@intel.com; a=ed25519;
 pk=aJkrtgqgT6TZ8iIHSG8/rTPsmlYnjMrUjCsMYvCzntk=

When registering the per-idxd wq, engine, or group devices, a failure
partway through must roll back exactly the devices already added, i.e.
the range [0, i) when device_add() fails at index i.

idxd_register_{wq,engine,group}_devices() get this range wrong: each
seeds the "while (j--)" rollback loop with j = i - 1 instead of j = i.
This skips one device (leaking it), and when the very first device
fails (i == 0) the index underflows to -1 and the loop walks off the
front of the array.

Start the rollback at i.

Fixes: 7c5dd23e57c1 ("dmaengine: idxd: fix wq conf_dev 'struct device' lifetime")
Fixes: 75b911309060 ("dmaengine: idxd: fix engine conf_dev lifetime")
Fixes: defe49f96012 ("dmaengine: idxd: fix group conf_dev lifetime")
Signed-off-by: Vinicius Costa Gomes <vinicius.gomes@intel.com>
---
 drivers/dma/idxd/sysfs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/idxd/sysfs.c b/drivers/dma/idxd/sysfs.c
index d5ffc641c856..e828292e5fb8 100644
--- a/drivers/dma/idxd/sysfs.c
+++ b/drivers/dma/idxd/sysfs.c
@@ -1876,7 +1876,7 @@ static int idxd_register_engine_devices(struct idxd_device *idxd)
 	return 0;
 
 cleanup:
-	j = i - 1;
+	j = i;
 	for (; i < idxd->max_engines; i++) {
 		engine = idxd->engines[i];
 		put_device(engine_confdev(engine));
@@ -1904,7 +1904,7 @@ static int idxd_register_group_devices(struct idxd_device *idxd)
 	return 0;
 
 cleanup:
-	j = i - 1;
+	j = i;
 	for (; i < idxd->max_groups; i++) {
 		group = idxd->groups[i];
 		put_device(group_confdev(group));
@@ -1932,7 +1932,7 @@ static int idxd_register_wq_devices(struct idxd_device *idxd)
 	return 0;
 
 cleanup:
-	j = i - 1;
+	j = i;
 	for (; i < idxd->max_wqs; i++) {
 		wq = idxd->wqs[i];
 		put_device(wq_confdev(wq));

-- 
2.56.0

