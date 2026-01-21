Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B40B3A89C7;
	Wed, 21 Jan 2026 18:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769020499; cv=none; b=pcZf0DWOH7SEQqpgdwB9ODNOwO/7S27sS+hczuALf7e1JJLuc9Pkyap/w+TDYfFGA1vrPkqyFCs7LGg5dGwXTk9wllAQrSfuiDxyiUDtYp1gmBVlmBBRUPU18DEffSjvma5mYMxdeVVIMR16rhYzAmpoDJELipLjr8+L+qy7bjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769020499; c=relaxed/simple;
	bh=XLrTXkAciRqKGJJORhw6bznnGQL8Wr0o313Upu3L7M0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EsWg0EG+BdgmvNk5yva6JQGUnIV6hsZsQEsgbcTRkcY1AUX8wAQ8fWQkL8SJdA+R++eYVjIed9RhMZiZsHgtljl9pkrl569/yC3GB5bU9alu9sgt/9nLSyEbBng+WFrZi2hRdCq7z0WnTXQcm6YgXqXIODMdZw6mdDCYZeVO49I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lpqALLm8; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lpqALLm8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769020498; x=1800556498;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=XLrTXkAciRqKGJJORhw6bznnGQL8Wr0o313Upu3L7M0=;
  b=lpqALLm8pXP7z9fwlOTfmOSpPZLoCQsh8fUZRQRQsL0RCTsWgxR68Xhg
   UfNPErYG04u3VF/kPNkYfubI94UWlU5C1/zKK0XnbmFWnE6/ck29uHK7l
   IxlYW5sKCrZ997mPWBXi8Lnf5BHsAEIul3Xp3HlK486aWKN6NbpljcMY+
   2JepZaQooC0Fb2D7XOqPsFla7z74YXwNk5mRB9KZ+4mfw9agj654JMHOa
   zovd2Xs1ayR3cnVb1O4gnuaCvXJ3IMeYEwy2kFl6g0puioxcpZJhSqnSy
   qiCfhZzIOb8FJi5Kn9NzIajC3DwSf18AI3sBacZWl+ecQarzmUPJdzLi4
   Q==;
X-CSE-ConnectionGUID: PI8Y061BRVeSgnXvAOXwDA==
X-CSE-MsgGUID: OSn3zYvgRCiHh9AAxLomvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70349893"
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="70349893"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 10:34:55 -0800
X-CSE-ConnectionGUID: SmvHdUHVT4CzV2LPkUx6Jw==
X-CSE-MsgGUID: b43BaP6IShOV8PcslobGAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="210678455"
Received: from vcostago-desk1.jf.intel.com (HELO [10.88.27.144]) ([10.88.27.144])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 10:34:54 -0800
From: Vinicius Costa Gomes <vinicius.gomes@intel.com>
Date: Wed, 21 Jan 2026 10:34:27 -0800
Subject: [PATCH v3 01/10] dmaengine: idxd: Fix lockdep warnings when
 calling idxd_device_config()
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-idxd-fix-flr-on-kernel-queues-v3-v3-1-7ed70658a9d1@intel.com>
References: <20260121-idxd-fix-flr-on-kernel-queues-v3-v3-0-7ed70658a9d1@intel.com>
In-Reply-To: <20260121-idxd-fix-flr-on-kernel-queues-v3-v3-0-7ed70658a9d1@intel.com>
To: Dave Jiang <dave.jiang@intel.com>, Vinod Koul <vkoul@kernel.org>, 
 Dan Williams <dan.j.williams@intel.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Vinicius Costa Gomes <vinicius.gomes@intel.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769020494; l=2455;
 i=vinicius.gomes@intel.com; s=20230921; h=from:subject:message-id;
 bh=XLrTXkAciRqKGJJORhw6bznnGQL8Wr0o313Upu3L7M0=;
 b=BqmqZURATwpp7B16yr+70ElZYn5DDz7/7ntUJzqJmNCX97dIk5sK82PBgjgbO+abH6xy7xMSG
 chSPULDUzNuDrSKD+kipKVETRxMUPPEK4i6DA6EC2l37hp20cxeuleC
X-Developer-Key: i=vinicius.gomes@intel.com; a=ed25519;
 pk=aJkrtgqgT6TZ8iIHSG8/rTPsmlYnjMrUjCsMYvCzntk=

Move the check for IDXD_FLAG_CONFIGURABLE and the locking to "inside"
idxd_device_config(), as this is common to all callers, and the one
that wasn't holding the lock was an error (that was causing the
lockdep warning).

Suggested-by: Dave Jiang <dave.jiang@intel.com>
Reviewed-by: Dave Jiang <dave.jiang@intel.com>
Signed-off-by: Vinicius Costa Gomes <vinicius.gomes@intel.com>
---
 drivers/dma/idxd/device.c | 17 +++++++----------
 drivers/dma/idxd/init.c   | 10 ++++------
 2 files changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/dma/idxd/device.c b/drivers/dma/idxd/device.c
index c26128529ff4..a704475d87b3 100644
--- a/drivers/dma/idxd/device.c
+++ b/drivers/dma/idxd/device.c
@@ -1125,7 +1125,11 @@ int idxd_device_config(struct idxd_device *idxd)
 {
 	int rc;
 
-	lockdep_assert_held(&idxd->dev_lock);
+	guard(spinlock)(&idxd->dev_lock);
+
+	if (!test_bit(IDXD_FLAG_CONFIGURABLE, &idxd->flags))
+		return 0;
+
 	rc = idxd_wqs_setup(idxd);
 	if (rc < 0)
 		return rc;
@@ -1454,11 +1458,7 @@ int idxd_drv_enable_wq(struct idxd_wq *wq)
 		}
 	}
 
-	rc = 0;
-	spin_lock(&idxd->dev_lock);
-	if (test_bit(IDXD_FLAG_CONFIGURABLE, &idxd->flags))
-		rc = idxd_device_config(idxd);
-	spin_unlock(&idxd->dev_lock);
+	rc = idxd_device_config(idxd);
 	if (rc < 0) {
 		dev_dbg(dev, "Writing wq %d config failed: %d\n", wq->id, rc);
 		goto err;
@@ -1554,10 +1554,7 @@ int idxd_device_drv_probe(struct idxd_dev *idxd_dev)
 	}
 
 	/* Device configuration */
-	spin_lock(&idxd->dev_lock);
-	if (test_bit(IDXD_FLAG_CONFIGURABLE, &idxd->flags))
-		rc = idxd_device_config(idxd);
-	spin_unlock(&idxd->dev_lock);
+	rc = idxd_device_config(idxd);
 	if (rc < 0)
 		return -ENXIO;
 
diff --git a/drivers/dma/idxd/init.c b/drivers/dma/idxd/init.c
index fb80803d5b57..dd32b81a3108 100644
--- a/drivers/dma/idxd/init.c
+++ b/drivers/dma/idxd/init.c
@@ -1104,12 +1104,10 @@ static void idxd_reset_done(struct pci_dev *pdev)
 	idxd_device_config_restore(idxd, idxd->idxd_saved);
 
 	/* Re-configure IDXD device if allowed. */
-	if (test_bit(IDXD_FLAG_CONFIGURABLE, &idxd->flags)) {
-		rc = idxd_device_config(idxd);
-		if (rc < 0) {
-			dev_err(dev, "HALT: %s config fails\n", idxd_name);
-			goto out;
-		}
+	rc = idxd_device_config(idxd);
+	if (rc < 0) {
+		dev_err(dev, "HALT: %s config fails\n", idxd_name);
+		goto out;
 	}
 
 	/* Bind IDXD device to driver. */

-- 
2.52.0

