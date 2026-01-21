Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882EA34DB6F;
	Wed, 21 Jan 2026 18:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769020500; cv=none; b=nZwGWWauHGBi02iA3yXBUDa3nMCG3WjnFMzNDwMDbUBv+dqmogYMcKl3U7nmSRdzfu3E/e18ArT+b/MDR18Y5ZEy2TXLdN79039tpIbeGIvauoAIIz1HzP2nSnhXUuPCjnDFXH/iwqyANjX8YVhNHJG3rAckd0SoB9LiBQgwzbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769020500; c=relaxed/simple;
	bh=iLD6dAIQdTx0q9g8zeHSLNaFu3s5+AYcoK5gKpCmhiM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JFfRXR4HzN2F/MNn/SKOw9MWHjUmuicf5ZQo4Ii1dkw+axi2JFEKvlRlJY5AzUv0JnKnKDwIlrJjmpfBuQstDKJaqgiNiW86mjX9RJ9glacv72mYKGkIzUXDwvuoo0o0DpFmjzeYe6XKBRBo2K22fSPukN9vuqjdlyCliaNKEKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=awYwAWvh; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="awYwAWvh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769020498; x=1800556498;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=iLD6dAIQdTx0q9g8zeHSLNaFu3s5+AYcoK5gKpCmhiM=;
  b=awYwAWvhbiaUnW/J/P44DYSz9+HEUiTJGsOPOFWKtRZpLBiDaUpSA4gt
   tDXI0p8JXBBvcn5DPMLQAv7UGLu/Y+O1MxBuCCLdoHbDkDYUoTCT+I83G
   QvZyInLm9xFTv9ZkVK9E61e26BV2Qx8qtCGuIoztoOEyExnU9/l5UU7l0
   TLEbWXyygJFm6k2VZRnD4OGM7+XiIW0gMLHJW70NJXTqsP4y70OOh5S2/
   Hq8WRotKQ536816wU+bOV+3w4wS7ulAkQU2rJh5z7oh8/ki8WZF5MHBO5
   poY4jeD/cf7FxeMaf7kdPOh6bfSp8pFTwvLSSFY0Xooh0afCWrhPPO7xK
   g==;
X-CSE-ConnectionGUID: 3d5vHcATQsW97IIdHYIMYg==
X-CSE-MsgGUID: hnWrBXtzTi++EtZFvr6xJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70349896"
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="70349896"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 10:34:55 -0800
X-CSE-ConnectionGUID: 6UT2XrtuTjCj+ZtiZfqKrA==
X-CSE-MsgGUID: /HNDS74OSLGI87L6W9Bq+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="210678458"
Received: from vcostago-desk1.jf.intel.com (HELO [10.88.27.144]) ([10.88.27.144])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 10:34:54 -0800
From: Vinicius Costa Gomes <vinicius.gomes@intel.com>
Date: Wed, 21 Jan 2026 10:34:28 -0800
Subject: [PATCH v3 02/10] dmaengine: idxd: Fix crash when the event log is
 disabled
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-idxd-fix-flr-on-kernel-queues-v3-v3-2-7ed70658a9d1@intel.com>
References: <20260121-idxd-fix-flr-on-kernel-queues-v3-v3-0-7ed70658a9d1@intel.com>
In-Reply-To: <20260121-idxd-fix-flr-on-kernel-queues-v3-v3-0-7ed70658a9d1@intel.com>
To: Dave Jiang <dave.jiang@intel.com>, Vinod Koul <vkoul@kernel.org>, 
 Dan Williams <dan.j.williams@intel.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Vinicius Costa Gomes <vinicius.gomes@intel.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769020494; l=1623;
 i=vinicius.gomes@intel.com; s=20230921; h=from:subject:message-id;
 bh=iLD6dAIQdTx0q9g8zeHSLNaFu3s5+AYcoK5gKpCmhiM=;
 b=Py66MCNRYtLQtiCAcjegedy/qC2lV01/22JrVzegCOCVqqrGuWNZ2PXUBj7KqhHmwKCAR6Kt2
 NxVzTpLN7VnDAeAy4cYB/CSJqBDuj8m3Jksy0ftjgmhFrz8I6uGDrB8
X-Developer-Key: i=vinicius.gomes@intel.com; a=ed25519;
 pk=aJkrtgqgT6TZ8iIHSG8/rTPsmlYnjMrUjCsMYvCzntk=

If reporting errors to the event log is not supported by the hardware,
and an error that causes Function Level Reset (FLR) is received, the
driver will try to restore the event log even if it was not allocated.

Also, only try to free the event log if it was properly allocated.

Fixes: 6078a315aec1 ("dmaengine: idxd: Add idxd_device_config_save() and idxd_device_config_restore() helpers")
Reviewed-by: Dave Jiang <dave.jiang@intel.com>
Signed-off-by: Vinicius Costa Gomes <vinicius.gomes@intel.com>
---
 drivers/dma/idxd/device.c | 3 +++
 drivers/dma/idxd/init.c   | 3 ++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/idxd/device.c b/drivers/dma/idxd/device.c
index a704475d87b3..5265925f3076 100644
--- a/drivers/dma/idxd/device.c
+++ b/drivers/dma/idxd/device.c
@@ -831,6 +831,9 @@ static void idxd_device_evl_free(struct idxd_device *idxd)
 	struct device *dev = &idxd->pdev->dev;
 	struct idxd_evl *evl = idxd->evl;
 
+	if (!evl)
+		return;
+
 	gencfg.bits = ioread32(idxd->reg_base + IDXD_GENCFG_OFFSET);
 	if (!gencfg.evl_en)
 		return;
diff --git a/drivers/dma/idxd/init.c b/drivers/dma/idxd/init.c
index dd32b81a3108..1c3f9bc7364b 100644
--- a/drivers/dma/idxd/init.c
+++ b/drivers/dma/idxd/init.c
@@ -973,7 +973,8 @@ static void idxd_device_config_restore(struct idxd_device *idxd,
 
 	idxd->rdbuf_limit = idxd_saved->saved_idxd.rdbuf_limit;
 
-	idxd->evl->size = saved_evl->size;
+	if (idxd->evl)
+		idxd->evl->size = saved_evl->size;
 
 	for (i = 0; i < idxd->max_groups; i++) {
 		struct idxd_group *saved_group, *group;

-- 
2.52.0

