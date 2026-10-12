Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9D4486E7E;
	Mon, 12 Oct 2026 21:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791841129; cv=none; b=TOsycE4W0V2BCyy4f+on09l5uC/qEVbxidts8HPMw9vnmK2mALazRx/RdAH2ERdJK2JXmltqVB1+Yb/PLgNoXvLPJBExtiauUnB1sn5JqANACeSU+IxIHvcHNukAvb87+F4znKdyByL6Nt/8rhL76Nw32/9D4DSKB6RHY8JBfvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791841129; c=relaxed/simple;
	bh=36Srb2HpJuvbBGA66q1Omk3ISeTf90rwZgJ4qw4mqPg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kVkvYXUV1DrAhKGJ1y++00yRLlOUqzhmtCohoZDxP79lGDcgIOyggY+rhYEItdl1FJNARvDaVjIxDbM55x4vkvG9wdNT1nJpYhXk6OexLlThN+IGRbJB3UdzjXwtjrS1VrRlBKxqDx7zaWOcmygSJt6zAclXk9IbvMOXQtbws8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FniTXWWs; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FniTXWWs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791841127; x=1823377127;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=36Srb2HpJuvbBGA66q1Omk3ISeTf90rwZgJ4qw4mqPg=;
  b=FniTXWWs7XbGY2Bl1ipphzgy4OKbCBcO6KU7fLELHUDfQXABGN0H/2Z+
   LagF6tsJcVlp4JjIJkAKkhG/frvJbvrzouTVYaTYmuh66x+dEHgTENhDx
   zv5JGbtfXntDCHEQWNKsC8iFETyXfNMxRliEZ+TJXQtefdidWHCAK7X1Q
   Wc9ddDLr9eMUTLO10oqfLXID3D8sNeTHC/odKBC71bZvxHT5deJ8QixQp
   8/5S9OdOsbL6VmvqyhZErYiKAJMqGS1dtnwDurKiRgLlfhEnD+sJ6BJyB
   Lb0JtvgUt9FhYak6I5PJMQrsIUS8mkpznPsS/1NJYsBNr+oY2zKhwFjj3
   g==;
X-CSE-ConnectionGUID: rc5daBm/Qqm1rPz64ioBKg==
X-CSE-MsgGUID: YNolBMyRTQ6BH+2X/QyFFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="459892"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="459892"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 14:38:39 -0700
X-CSE-ConnectionGUID: w3gYhgVDStiDXr8420wxNg==
X-CSE-MsgGUID: SVa/9XmYReqFdNGbaQ+nPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="986062"
Received: from vcostago-desk1.jf.intel.com (HELO [10.241.243.117]) ([10.241.243.117])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 14:38:38 -0700
From: Vinicius Costa Gomes <vinicius.gomes@intel.com>
Date: Mon, 12 Oct 2026 14:38:04 -0700
Subject: [PATCH 1/6] dmaengine: idxd: Do not call destroy_workqueue with
 null idxd->wq
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-wt-idxd-fixes-v1-1-30a35a445077@intel.com>
References: <20261012-wt-idxd-fixes-v1-0-30a35a445077@intel.com>
In-Reply-To: <20261012-wt-idxd-fixes-v1-0-30a35a445077@intel.com>
To: Dave Jiang <dave.jiang@intel.com>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>, Fenghua Yu <fenghuay@nvidia.com>, 
 Shuai Xue <xueshuai@linux.alibaba.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Vinicius Costa Gomes <vinicius.gomes@intel.com>, 
 Steve Wahl <steve.wahl@hpe.com>
X-Mailer: b4 0.17-dev-362b8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791841118; l=1275;
 i=vinicius.gomes@intel.com; s=20230921; h=from:subject:message-id;
 bh=bYfmRgNtKZjfnzn7vvHOksa8X8EEQ973QGzDRiaW2l8=;
 b=djiGw3TXvLA9AWgcs7VB5NQdOI0jKQ7L78obAAl0S5T75pXljUQHpLBjBZARIh40xOb8He9wx
 SXzfWNS4hchA+wX6EIzKetywHMlQOV5lKse6DNUPSQaZhdUpSzaX4gI
X-Developer-Key: i=vinicius.gomes@intel.com; a=ed25519;
 pk=aJkrtgqgT6TZ8iIHSG8/rTPsmlYnjMrUjCsMYvCzntk=

From: Steve Wahl <steve.wahl@hpe.com>

Error paths within idxd_pci_probe_alloc and related functions end up
calling destroy_workqueue with a null pointer, from
idxd_conf_device_release via put_device, because that allocation has
not yet occurred when the error is hit.

This was encountered running in a kexec'd kdump kernel with reduced
resources, causing the "Device is HALTED!" branch in
idxd_device_init_reset to be taken.

In idxd_conf_device_release, check that the workqueue has been
allocated before trying to destroy it.

Fixes: 3d33de353b1f ("dmaengine: idxd: Fix not releasing workqueue on .release()")
Signed-off-by: Steve Wahl <steve.wahl@hpe.com>
Acked-by: Vinicius Costa Gomes <vinicius.gomes@intel.com>
---
 drivers/dma/idxd/sysfs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/idxd/sysfs.c b/drivers/dma/idxd/sysfs.c
index 6d251095c350..d5ffc641c856 100644
--- a/drivers/dma/idxd/sysfs.c
+++ b/drivers/dma/idxd/sysfs.c
@@ -1836,7 +1836,8 @@ static void idxd_conf_device_release(struct device *dev)
 {
 	struct idxd_device *idxd = confdev_to_idxd(dev);
 
-	destroy_workqueue(idxd->wq);
+	if (idxd->wq)
+		destroy_workqueue(idxd->wq);
 	kfree(idxd->groups);
 	bitmap_free(idxd->wq_enable_map);
 	kfree(idxd->wqs);

-- 
2.56.0

