Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA28B4F85CE;
	Mon, 12 Oct 2026 21:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791841135; cv=none; b=VCZk/EK3e9jYRhsc83Tt2/khaZpB/F+ZIp3HibqHyqp3NgXO7jpE8Mqg12u/XUVpaB9xuzH2LBeQ+OCgvhPBIv4c+q9ppbMJvDc6SLiwL6QQeGH9aFgO40KKT5Reqfb5ODz8EVfeNYU3nbqjETEGo19w4qHVZwxK9rQENk3kPxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791841135; c=relaxed/simple;
	bh=a79QeoUXM3XxsX6VJ5LDYlJx/l54eJgdJRVq/7G3uMg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TITy05ZTA3fsTeoORM/Q0V43P03egszpI2wsuiJk2g+vv9B/KZFzEcg7KEcBOdtRRS3UcMNtiYYWeg2Jlf2nrVDMN2mDO+dyCcuunrIzF+4dOSxzQP/bZ0wHzvOvz24xiw8YT9pFk7+MrQFa/X2LjMYyB+y8IjpBlg4pY7eEK4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QAObLjMC; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QAObLjMC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791841130; x=1823377130;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=a79QeoUXM3XxsX6VJ5LDYlJx/l54eJgdJRVq/7G3uMg=;
  b=QAObLjMCxIHOsaJhQjygQq7BL5nu/fdf/SkaIYVLjcOMFpb3BbF40yam
   RuB49Oi8Oc41bDBh9n9mnv9k+ylbl/EGKTL+hyLIAwCXR4YaBeW61GOBN
   2NEC1hZIJgZA+cgZZ4upajtFv4jmk6nMvvR0k0yBq/X5VP5EebumriHPE
   GYo0BU3TNfrr/kS1QofXG0E4zn0nr/5hDRsqCwmqYPEJe9pi0QlORzOz/
   ILn8tD2hKYJ+c6blT7tIQcunJf4yu0uQXn2GSgLYte84IaceIfgugRH5m
   53BDUzKwABrN9tulM80QzMnjk8OWgxVSVUuCxXL0eBzhU2liq61QhgGol
   A==;
X-CSE-ConnectionGUID: 9olg/wQ6QGyKOIOzgB47EQ==
X-CSE-MsgGUID: V1oZMf6qRbu1yALiTCaN8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="459903"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="459903"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 14:38:39 -0700
X-CSE-ConnectionGUID: 5T6ldLdXTsiltYaqUn9fFQ==
X-CSE-MsgGUID: R1pSTV0PTZiFrt3z85VFzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="986065"
Received: from vcostago-desk1.jf.intel.com (HELO [10.241.243.117]) ([10.241.243.117])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 14:38:38 -0700
From: Vinicius Costa Gomes <vinicius.gomes@intel.com>
Date: Mon, 12 Oct 2026 14:38:05 -0700
Subject: [PATCH 2/6] dmaengine: idxd: fix duplicate memory frees on
 initialization error path
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-wt-idxd-fixes-v1-2-30a35a445077@intel.com>
References: <20261012-wt-idxd-fixes-v1-0-30a35a445077@intel.com>
In-Reply-To: <20261012-wt-idxd-fixes-v1-0-30a35a445077@intel.com>
To: Dave Jiang <dave.jiang@intel.com>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>, Fenghua Yu <fenghuay@nvidia.com>, 
 Shuai Xue <xueshuai@linux.alibaba.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Vinicius Costa Gomes <vinicius.gomes@intel.com>, 
 Steve Wahl <steve.wahl@hpe.com>, 
 Bogdan Codres <bogdan.codres@windriver.com>
X-Mailer: b4 0.17-dev-362b8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791841118; l=2838;
 i=vinicius.gomes@intel.com; s=20230921; h=from:subject:message-id;
 bh=d/TFb09o2GIAJgqrkezcpeuFmKPbmHI5hCWs85jQ/go=;
 b=OPs47wIq8HoZtOkG2sHMjs9w/fzgUO9SmVGWAFagGgTe4if91LB1Kp+ArtStQ2tm5hFrDAYq0
 WdjBOx8IcOqB/3Qtqpubia0D/f9Wlni1pv2mJwznFhi8AVuWlYPQrIn
X-Developer-Key: i=vinicius.gomes@intel.com; a=ed25519;
 pk=aJkrtgqgT6TZ8iIHSG8/rTPsmlYnjMrUjCsMYvCzntk=

From: Steve Wahl <steve.wahl@hpe.com>

Error paths within idxd_pci_probe_alloc and related functions end up
attempting to free memory already freed from idxd_conf_device_release
via put_device.

This was encountered running in a kexec'd kdump kernel with reduced
resources, causing the "Device is HALTED!" branch in
idxd_device_init_reset to be taken.

[   18.628791] idxd 0000:00:01.0: Device is HALTED!
[   18.631447] idxd 0000:00:01.0: Intel(R) IDXD DMA Engine init failed
[   18.631450] ------------[ cut here ]------------
[   18.631451] ida_free called for id=0 which is not allocated.
[   18.631462] WARNING: CPU: 0 PID: 11 at lib/idr.c:525 ida_free+0xd3/0x130
[   18.631474] CPU: 0 UID: 0 PID: 11 Comm: kworker/0:1 Not tainted 6.12.0-1-rt-amd64 #1
[   18.631477] Hardware name: Dell Inc. PowerEdge XR8720t/0J91KV, BIOS 1.1.3 02/03/2026
[   18.631478] Workqueue: events work_for_cpu_fn
[   18.631480] RIP: 0010:ida_free+0xd3/0x130
[   18.631492] Call Trace:
[   18.631494]  <TASK>
[   18.631495]  idxd_pci_probe+0x1b0/0x1860 [idxd]
[   18.631506]  local_pci_probe+0x43/0xa0
[   18.631508]  work_for_cpu_fn+0x13/0x20
[   18.631510]  process_one_work+0x179/0x390
[   18.631512]  worker_thread+0x237/0x340
[   18.631517]  kthread+0xc6/0x100
[   18.631520]  ret_from_fork+0x2d/0x50
[   18.631524]  ret_from_fork_asm+0x1a/0x30
[   18.631526]  </TASK>

In idxd_free and idxd_alloc, do not attempt to free allocations that
will already have been freed.

Fixes: 90022b3a6981 ("dmaengine: idxd: fix memory leak in error handling path of idxd_pci_probe")
Fixes: 46a5cca76c76 ("dmaengine: idxd: fix memory leak in error handling path of idxd_alloc")
Reported-by: Bogdan Codres <bogdan.codres@windriver.com>
Link: https://lore.kernel.org/all/akLBL7b2h73pK0AC@ilogsc-qemu.local/
Signed-off-by: Steve Wahl <steve.wahl@hpe.com>
---
 drivers/dma/idxd/init.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/idxd/init.c b/drivers/dma/idxd/init.c
index 4b827a329756..4adb3f3bcd01 100644
--- a/drivers/dma/idxd/init.c
+++ b/drivers/dma/idxd/init.c
@@ -581,9 +581,6 @@ static void idxd_free(struct idxd_device *idxd)
 		return;
 
 	put_device(idxd_confdev(idxd));
-	bitmap_free(idxd->opcap_bmap);
-	ida_free(&idxd_ida, idxd->id);
-	kfree(idxd);
 }
 
 static struct idxd_device *idxd_alloc(struct pci_dev *pdev, struct idxd_driver_data *data)
@@ -623,8 +620,13 @@ static struct idxd_device *idxd_alloc(struct pci_dev *pdev, struct idxd_driver_d
 	return idxd;
 
 err_name:
+	/*
+	 * once device_initialize(conf_dev) is called,
+	 * put_device(conf_dev) will end up calling
+	 * idxd_conf_device_release() which will free the rest.
+	 */
 	put_device(conf_dev);
-	bitmap_free(idxd->opcap_bmap);
+	return NULL;
 err_opcap:
 	ida_free(&idxd_ida, idxd->id);
 err_ida:

-- 
2.56.0

