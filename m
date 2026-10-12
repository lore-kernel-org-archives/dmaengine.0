Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1C945D903;
	Mon, 12 Oct 2026 21:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791841126; cv=none; b=SzJg+ihF+xAmTt3TeyK5s4CoBNhOxeMgvzA04uWRU3l4mV+9nfb5oFKjsyv9kTA55pU/9YgQtcVyxH5powq10Wjj2FuZ37W9JwU558J9dlHRoAMUv2JFqZGwxNM35BwQTHXkgwu6D9AFTWdxtdbX1hqEvytXiXrLKykwQOSa8ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791841126; c=relaxed/simple;
	bh=g96STZZmBcCP/AR7VqTLRRlb13HRj5IVmPfJhDh+I8I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GHAxRjDxsa9rkGMJ/Uq/wJ18XZkSxKvhFSR11tU5tBYhrC7ijROOSR0RkFcqMQ4L/iojQaBvCjmtKXDMweKSx2yd7FcAZHpqzmwsMRMCnj05vIr4hUW165aoU2K3YgbeGedNf5BSZtYktE1/bTRJLpLVWVskKa3B11dPri+EyWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HfHGAh/r; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HfHGAh/r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791841120; x=1823377120;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=g96STZZmBcCP/AR7VqTLRRlb13HRj5IVmPfJhDh+I8I=;
  b=HfHGAh/rug67yD5WO2hJpzPJjZoPCQvhs9pzDfzg+sHacDWizfQ1Nd7+
   9lssjn9wWW9Gva75JcqCbZtq/43zHlPygEToHb9T7tWHSQ3m8pOWkJUWl
   FvGANCF16VhYYHt+adhTSPGETYM2S6kMgM7f/BJRMkH8wN2EsIzk/HDj4
   cgJuL0qa6rnsoRT70Sp5uK0uVDAVphQtWinZIav+UeYDHhURC1ybT6qsc
   Jk6LjWfMkeE7qKj/71vJtKhoBLCVh2BfZqBD02/YE70J2TWKC0L4W1o5a
   PwOQTSmait+40RCig7urafMYrzPj4w6iM7LxfD/R0YItTJjo3TBmqabyS
   w==;
X-CSE-ConnectionGUID: 2MWyUeGOSviZg+NFOd4/kA==
X-CSE-MsgGUID: 0L8BGCIwSeqxhVs8jHrWfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="459883"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="459883"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 14:38:39 -0700
X-CSE-ConnectionGUID: 8bEHUB5DQKOYOtTxB///zA==
X-CSE-MsgGUID: vNVax3rlQNizq+iI9P1oEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="986059"
Received: from vcostago-desk1.jf.intel.com (HELO [10.241.243.117]) ([10.241.243.117])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 14:38:38 -0700
From: Vinicius Costa Gomes <vinicius.gomes@intel.com>
Subject: [PATCH 0/6] dmaengine: idxd: More error handling fixes
Date: Mon, 12 Oct 2026 14:38:03 -0700
Message-Id: <20261012-wt-idxd-fixes-v1-0-30a35a445077@intel.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMSw5AQBAFryK9NkkPyQRXEQtDoy2Qab9E3F1jW
 fVS7wKhwCRQRBcE2ll4nhRsHEEz1FNPhltlSDBxmGFqjlXN2ZqOTxJja3Teu9xbQtBmCfQNmpT
 Vz7L5kZr1PYH7fgCib7lPcQAAAA==
X-Change-ID: 20260803-wt-idxd-fixes-1a06bb69b1e0
To: Dave Jiang <dave.jiang@intel.com>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>, Fenghua Yu <fenghuay@nvidia.com>, 
 Shuai Xue <xueshuai@linux.alibaba.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Vinicius Costa Gomes <vinicius.gomes@intel.com>, 
 Steve Wahl <steve.wahl@hpe.com>, 
 Bogdan Codres <bogdan.codres@windriver.com>, 
 Zhenzhong Duan <zhenzhong.duan@intel.com>
X-Mailer: b4 0.17-dev-362b8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791841118; l=1399;
 i=vinicius.gomes@intel.com; s=20230921; h=from:subject:message-id;
 bh=g96STZZmBcCP/AR7VqTLRRlb13HRj5IVmPfJhDh+I8I=;
 b=XMKWBBNq1rje35jEwLRD9d4VmKuuSwDJfMIzOIR1X2AgaM4DhctIdntO5BTdziTcrHLqmUpzE
 jxlatlD1YwnD6zvdahvne6U5fXY5JwDr/sdesnmeo2S6HGzXkzf+K++
X-Developer-Key: i=vinicius.gomes@intel.com; a=ed25519;
 pk=aJkrtgqgT6TZ8iIHSG8/rTPsmlYnjMrUjCsMYvCzntk=

Mostly this series proposes fixes for issues in the error handling
paths of the idxd driver. Patches 1/6, 2/6 and 3/6 are for issues that
have been shown to happen in the real world.

Patch 6/6 is an exception, in the sense that it's not error path
related, it's an issue that I introduced (my scripts were removing
the idxd module after each dmatest run, so I didn't caught this).

Signed-off-by: Vinicius Costa Gomes <vinicius.gomes@intel.com>
---
Steve Wahl (2):
      dmaengine: idxd: Do not call destroy_workqueue with null idxd->wq
      dmaengine: idxd: fix duplicate memory frees on initialization error path

Vinicius Costa Gomes (4):
      dmaengine: idxd: Fix potential double free on probe error path
      dmaengine: idxd: Fix unwind bounds in device registration error paths
      dmaengine: idxd: Fix error code handling in idxd_cdev_open()
      dmaengine: idxd: Do not release interrupt handles on terminate_all

 drivers/dma/idxd/cdev.c   |  8 ++++++--
 drivers/dma/idxd/device.c | 11 ++++++++++-
 drivers/dma/idxd/idxd.h   |  1 +
 drivers/dma/idxd/init.c   | 21 ++++++---------------
 drivers/dma/idxd/irq.c    |  1 +
 drivers/dma/idxd/sysfs.c  |  9 +++++----
 6 files changed, 29 insertions(+), 22 deletions(-)
---
base-commit: 42c31fec1ca76b8b5f7759def122d418dff2cd4b
change-id: 20260803-wt-idxd-fixes-1a06bb69b1e0

Best regards,
--  
Vinicius

