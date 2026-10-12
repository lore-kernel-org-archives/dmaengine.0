Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B643D47C2;
	Mon, 12 Oct 2026 21:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791841136; cv=none; b=lzhhrlYfyA0qCigbA9U8t4hFFF5cIPfIc1KrfGwpRt4SELwp9tDH+9OxchZAdcVO+tuFYN12a/ldRYa3vFg4rffkzB8gH2u1qsfg5SoEP9g6iIfuf+VWDy8dQ8UQkr6znk66xW0cp/RdGwOuDwPxZJf2DPbiMObt7nWZ1MlYVwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791841136; c=relaxed/simple;
	bh=x5jidGddvEONZs4UJjc/pa0eZwQ8zzBqFkYU42/Scv0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mGJ8LiHFjOPzcHR+WQW2TYHCPR0ekaeRceVuNVYZ1GuwjCApRuyR4k5mPktJ+Xh6qKukYtE8WD+8JU7/dBKnn6Zt8ztVcYiYLcCNX8xA9FA8zqn+nU8NhDvy3JfC/8NPY/ee9MKUzBQR+fjFjUqCoGADyMGw4+8nKqKcq9kjfEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c5lVtCXs; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c5lVtCXs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791841134; x=1823377134;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=x5jidGddvEONZs4UJjc/pa0eZwQ8zzBqFkYU42/Scv0=;
  b=c5lVtCXsG3ASs0tHaIHVOsfJFh9WhpMPU/bO/A7AQUR2CrCKFeKhEmST
   Oz2EhbEXpiYU0JOyXcW+tp+jh/jO3X/1DUiaFX51t6JEVuSElKHgtUErL
   orIaBlzgnLFGHjMyMzZx2KhzhUd8U5pkeztGpdb4N6cHpXhJ7JiixdZr3
   qf1bOM51VgKzw1G+a9729RNeIMt9RpfbUfwEE2YO4TnXBoaUVtK0KdYTf
   DXkl59ThyZSzNv00fWFo4CD0VYxF5ku4Sue7vlXIzwTNXJINEeiGIZ4Mn
   bkwkWXZKAMYfogrrJGDBYvnKCP0LAO8AmAYmFUsPs8sPVeYA1ZFMHB8L3
   Q==;
X-CSE-ConnectionGUID: WMX2EMirQSK+oXgIQSj0Dw==
X-CSE-MsgGUID: ShKyrraKTwOcdpmCKDP1Uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="459911"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="459911"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 14:38:39 -0700
X-CSE-ConnectionGUID: QLDSys0oSzOO6KTzbphsow==
X-CSE-MsgGUID: O1iIm6uNTCyvi6MyfhrLDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="986074"
Received: from vcostago-desk1.jf.intel.com (HELO [10.241.243.117]) ([10.241.243.117])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 14:38:39 -0700
From: Vinicius Costa Gomes <vinicius.gomes@intel.com>
Date: Mon, 12 Oct 2026 14:38:08 -0700
Subject: [PATCH 5/6] dmaengine: idxd: Fix error code handling in
 idxd_cdev_open()
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-wt-idxd-fixes-v1-5-30a35a445077@intel.com>
References: <20261012-wt-idxd-fixes-v1-0-30a35a445077@intel.com>
In-Reply-To: <20261012-wt-idxd-fixes-v1-0-30a35a445077@intel.com>
To: Dave Jiang <dave.jiang@intel.com>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>, Fenghua Yu <fenghuay@nvidia.com>, 
 Shuai Xue <xueshuai@linux.alibaba.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Vinicius Costa Gomes <vinicius.gomes@intel.com>
X-Mailer: b4 0.17-dev-362b8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791841118; l=1986;
 i=vinicius.gomes@intel.com; s=20230921; h=from:subject:message-id;
 bh=x5jidGddvEONZs4UJjc/pa0eZwQ8zzBqFkYU42/Scv0=;
 b=M+PdY/cCb6z0PT5oXV3jcY3xzQ4okCjQEwyXZ/ce/gcBEPXpVEZzpa94Bup/eckTUNu3k1aw6
 VQfFrPU4yJEC6+smBkfEWhEO5R959MAaD9RyF2ZZFvmVy13SgR1PQG5
X-Developer-Key: i=vinicius.gomes@intel.com; a=ed25519;
 pk=aJkrtgqgT6TZ8iIHSG8/rTPsmlYnjMrUjCsMYvCzntk=

idxd_cdev_open() mishandles rc on two error paths:

  - On ida_alloc() failure it jumps to failed_ida without setting rc,
    returning the leftover 0 from the earlier successful xa_insert(), so
    open() falsely reports success.

  - When a PASID entry already exists, xa_insert() returns -EBUSY.  This
    is non-fatal and only warned about, but rc is left negative and can
    leak out for a shared wq (which skips the idxd_wq_set_pasid() branch
    that would reset it).

Set rc to the ida_alloc() error before unwinding, and reset rc to 0
after the "PASID already exists" (Fixed the "exist -> exists" typo
while at it) warning.

Fixes: e6fd6d7e5f0f ("dmaengine: idxd: add a device to represent the file opened")
Fixes: b022f59725f0 ("dmaengine: idxd: add idxd_copy_cr() to copy user completion record during page fault handling")
Signed-off-by: Vinicius Costa Gomes <vinicius.gomes@intel.com>
---
 drivers/dma/idxd/cdev.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/idxd/cdev.c b/drivers/dma/idxd/cdev.c
index 82b07cf942ef..abbab9bdd06c 100644
--- a/drivers/dma/idxd/cdev.c
+++ b/drivers/dma/idxd/cdev.c
@@ -264,8 +264,11 @@ static int idxd_cdev_open(struct inode *inode, struct file *filp)
 		mutex_lock(&wq->uc_lock);
 		rc = xa_insert(&wq->upasid_xa, pasid, ctx, GFP_KERNEL);
 		mutex_unlock(&wq->uc_lock);
-		if (rc < 0)
-			dev_warn(dev, "PASID entry already exist in xarray.\n");
+		if (rc < 0) {
+			/* An existing entry is harmless, warn and continue */
+			dev_warn(dev, "PASID entry already exists in xarray.\n");
+			rc = 0;
+		}
 
 		if (wq_dedicated(wq)) {
 			rc = idxd_wq_set_pasid(wq, pasid);
@@ -279,6 +282,7 @@ static int idxd_cdev_open(struct inode *inode, struct file *filp)
 	idxd_cdev = wq->idxd_cdev;
 	ctx->id = ida_alloc(&file_ida, GFP_KERNEL);
 	if (ctx->id < 0) {
+		rc = ctx->id;
 		dev_warn(dev, "ida alloc failure\n");
 		goto failed_ida;
 	}

-- 
2.56.0

