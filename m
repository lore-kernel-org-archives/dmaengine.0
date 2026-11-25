Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795606635;
	b=gaGwXKVuD0M5rU05LXZyPaJ2UZdn43bRsb3nX4btcT612TUtwHibQNhsG/qSu5iHV/WU
	 7XM21K3/GDPCqcV/B9k8vKEj8g+xPW+hE7gBq1UR4NMAOAUmM9O0lmOPL2QuK7LmHOMxg
	 O/TQnbTQJ+TUlzl8yHQZ/6apiziXndj+DcCkKCf2nD7vLhc6SuC36eSufm/eH1ybmhs1A
	 CI6WHKfq9NNmPta8fxJvYeWpIb6f1wqwL+7hsU25kqOv1xZvR/ibNGYdGEBK2UyTti6x+
	 z33dCoOu7+0aPvEqGkt1O4x86gXtxeso5RemvsD+14MVhYFUSUDmsfvBrf1+aoM3k0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795606635;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3rGjea6nUknwVphXD39fnbsFzrZc+7G/LRSnT77AgSg=;
	b=j9YzhBA0cZBL8nrw208f/5HQyf3Xq+oj1t8zZQKRUmH9mpwkuLPjooCFJ09Y1H/A8PLI
	 hZwFramij5BjrdYWutIQ4wQt6yiWCsN2QHNUAFf2vxDKjsxyS+JmJwpZo3/dVWEr86rWd
	 hPV6q+xWgIvSWRIaY0KCjTJWcGcdaaxdWCue4Q0KP1xntFezfrT5aihHHlR0VtgaMDOfC
	 FmzCo4d4CWRZl4GU712rD7zcivsFihyMYMFcj/2/oqJA737ISmVJtXZTo+jCm1GBXaJ6F
	 G9krT5WPJ5456NUKE0h1FPzgx0eJ+aZXCaNEvL40d9Nchc6/L0tJIvZfFDrI1r/kdag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KV8+w4Fy;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D28606A32E
	for <dmaengine@vger.kernel.org>; Wed, 25 Nov 2026 11:37:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18D28606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KV8+w4Fy
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b4ab53a966so514448a91.0
        for <dmaengine@vger.kernel.org>; Wed, 25 Nov 2026 03:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795606634; x=1796211434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3rGjea6nUknwVphXD39fnbsFzrZc+7G/LRSnT77AgSg=;
        b=KV8+w4FyuiXxVDrO7Y0ECYk04tVbli7h7QqoBT0EgIoLIIlLOJBxiRiKCOscjyLtTa
         exaRA0O3X5FM70xY4NfFsa04SPQK00uaIeEyVHsgQGFM11v8HOslXcZXSTcF8jm2Ngq6
         +rU83k7SH7zd+7Zbx4JxXVZfPzAnF02/lUSQpsdRZumPuE+w/7G5UDlGQqQYKuaeM2id
         Fws1uEmztTt+c/DahBl3TplTK3B+tZ6Vb6nLeSi7IQU9ThbbFMwdldxu7FOnfROkJQcW
         yAryC91AdoNU03D57OT6+m92g9iujMh/yTMvp0qH4BGx4FS9HxFORtoTZD68Hj/77Lkv
         i/lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795606634; x=1796211434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3rGjea6nUknwVphXD39fnbsFzrZc+7G/LRSnT77AgSg=;
        b=tSLoLPaeYb88Ly2GxJDTOT7wpocWXdgNqPwrYoBG5oVlx/T89skdY09QUpJuSV/l8Z
         D3pERLc8nRESF5BVDhSxc/vojFPQNU8uZVDHfR4QNJqCi3IfSVOTRmDOoZWxx1/FtbCJ
         LG73aJGXDo5p2VUZrS47uwJDc0Mxhs2n4g3CPjctcqIzh98SAqOWHsFM3E0lE/4TAi2H
         hRcgW0ZwFy7uXPEbZykR+RZ0JY2PBG7OiKIFMqrEgFE97lY+GblNb7Uakpsm87pP6Ibb
         mDt7BHNvgWjzryZtRlJqCRjo9OMKXNZmAbGEs1I59VUw+8FWu5z4cMhktlLp3Unh/rhT
         rCdA==
X-Forwarded-Encrypted: i=1; AL+hErFxBsulgLPQ1kIQoWtXRLzTpW7LPyRueEPnJXDGzYFhi3hIGE/GMMzRCPS9DZdharpkzQOQEOrqOcA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+QuEabFcced9K83/kingW3u18H3kO4gIKmCtUUyiL9VQcmnvvj
	M6d5IHCBa+6rV+H1Sy7VIv/nku2bcP1d21lqphU4att5BBLHa7CaEF9M
X-Gm-Gg: AZFdTZdUO0KQNdo4dPEl9WA2YGgfWyNlRDb3vGrN7SW8X/G6UapFH5ls0zvUdSwrplD
	PGv3hTI6MmxqrddcWBgQ4p6SAohr8u7ecJ4Y/20qjG3h7CV1EO5AuphzVsKZLjK+KrSnhpVdXWl
	KnRsJflYWkLSu1YbcGiZkCHDyGA42wJD3gWQDUBGK0fMW4R5v9BTjylnLQC/U+tk6QfaPoV2gAy
	wUoGpg/wTNCES1+ZPnqLgPgn+nK+D8sG8XtaP3yxT6sAMwHXwPeVqbClr8hjF5Vib+KppavijcF
	sYxlMFMvjYvdjz2sGkPYPn3S55YlsxCm+b0ZETj15AUf9OdU+7v+OxQ718i5+aBtFPXQpUtibj3
	buwlSwC2x3ZNOplVb2ko4XHL3hFq7PIVxPhkLuWz3uLdC8qhUS/Suf4Bj/u1VPluOv5ZQOgTCSo
	a+2I9954LtYIrl0lrFKh/IyJ0JDW3Zk9h1SLHbNNxEiMsp/fBiDjNMSWY7tsg7fDIgg7+VAGHA1
	H6xqsM2s4pjTbmoldYg8LRdPcOuGe4/iRQC07nfYOBLLwZfLefKvwMneLocbeDmspY=
X-Received: by 2002:a17:90a:e70c:b0:3a0:c1b1:45fb with SMTP id 98e67ed59e1d1-3b41c58aebdmr27233958a91.0.1795606634132;
        Wed, 25 Nov 2026 03:37:14 -0800 (PST)
Received: from gmail.com ([124.127.71.122])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcafe0sm29534485a91.16.2026.11.25.03.37.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 03:37:13 -0800 (PST)
From: Ziyu Zhang <ziyuzhang201@gmail.com>
To: vinicius.gomes@intel.com,
	vkoul@kernel.org
Cc: dave.jiang@intel.com,
	Frank.Li@kernel.org,
	kevin.tian@intel.com,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	ziyuzhang201@gmail.com
Subject: [PATCH] dmaengine: idxd: Fix deadlock on interrupt handle revocation
Date: Wed, 25 Nov 2026 19:35:53 +0800
Message-Id: <20261125113553.94215-1-ziyuzhang201@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
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

idxd_misc_thread() is the threaded handler of the misc MSI-X vector and
the only context that completes idxd device commands: it calls
complete(idxd->cmd_done) for IDXD_INTC_CMD.  On an
IDXD_INTC_INT_HANDLE_REVOKED interrupt it allocated a work item with
GFP_ATOMIC and, if that allocation failed, called idxd_wqs_quiesce()
inline to fall back.  The quiesce takes wq_lock of every enabled kernel
work queue, so the misc thread can block there behind a command
submitter that holds wq_lock and waits for cmd_done, which only the
misc thread can complete.  Nothing bounds that wait.

This potential deadlock was found by our experimental static analysis
tool, which analyzes lock usage and completion-based synchronization.

Embed the work item in struct idxd_device and queue it unconditionally,
removing the allocation and its synchronous quiesce fallback.

Revokes received while the work is pending are coalesced; the queued
work refreshes all valid interrupt handles. A revoke received while the
work is running can queue another execution to refresh handles that
have already been processed. Reusing the same work item on the same
workqueue also serialises revoke handling.

Fixes: 56fc39f5a367 ("dmaengine: idxd: handle interrupt handle revoked event")
Signed-off-by: Ziyu Zhang <ziyuzhang201@gmail.com>
---
 drivers/dma/idxd/idxd.h |  2 ++
 drivers/dma/idxd/init.c |  1 +
 drivers/dma/idxd/irq.c  | 27 ++++-----------------------
 3 files changed, 7 insertions(+), 23 deletions(-)

diff --git a/drivers/dma/idxd/idxd.h b/drivers/dma/idxd/idxd.h
index ce78b9a7c641..03a73da22596 100644
--- a/drivers/dma/idxd/idxd.h
+++ b/drivers/dma/idxd/idxd.h
@@ -366,6 +366,7 @@ struct idxd_device {
 	struct idxd_dma_dev *idxd_dma;
 	struct workqueue_struct *wq;
 	struct work_struct work;
+	struct work_struct int_handle_revoke_work;
 
 	struct idxd_pmu *idxd_pmu;
 
@@ -762,6 +763,7 @@ int idxd_load_iaa_device_defaults(struct idxd_device *idxd);
 
 /* device interrupt control */
 irqreturn_t idxd_misc_thread(int vec, void *data);
+void idxd_int_handle_revoke(struct work_struct *work);
 irqreturn_t idxd_wq_thread(int irq, void *data);
 void idxd_mask_error_interrupts(struct idxd_device *idxd);
 void idxd_unmask_error_interrupts(struct idxd_device *idxd);
diff --git a/drivers/dma/idxd/init.c b/drivers/dma/idxd/init.c
index 4b827a329756..f3ade8036ddb 100644
--- a/drivers/dma/idxd/init.c
+++ b/drivers/dma/idxd/init.c
@@ -108,6 +108,7 @@ static int idxd_setup_interrupts(struct idxd_device *idxd)
 	}
 	dev_dbg(dev, "Enabled %d msix vectors\n", msixcnt);
 
+	INIT_WORK(&idxd->int_handle_revoke_work, idxd_int_handle_revoke);
 
 	ie = idxd_get_ie(idxd, 0);
 	ie->vector = pci_irq_vector(pdev, 0);
diff --git a/drivers/dma/idxd/irq.c b/drivers/dma/idxd/irq.c
index 6a25e1fd0e62..6d3355ce88f7 100644
--- a/drivers/dma/idxd/irq.c
+++ b/drivers/dma/idxd/irq.c
@@ -24,11 +24,6 @@ struct idxd_resubmit {
 	struct idxd_desc *desc;
 };
 
-struct idxd_int_handle_revoke {
-	struct work_struct work;
-	struct idxd_device *idxd;
-};
-
 static void idxd_device_reinit(struct work_struct *work)
 {
 	struct idxd_device *idxd = container_of(work, struct idxd_device, work);
@@ -127,17 +122,15 @@ static void idxd_abort_invalid_int_handle_descs(struct idxd_irq_entry *ie)
 	}
 }
 
-static void idxd_int_handle_revoke(struct work_struct *work)
+void idxd_int_handle_revoke(struct work_struct *work)
 {
-	struct idxd_int_handle_revoke *revoke =
-		container_of(work, struct idxd_int_handle_revoke, work);
-	struct idxd_device *idxd = revoke->idxd;
+	struct idxd_device *idxd =
+		container_of(work, struct idxd_device, int_handle_revoke_work);
 	struct pci_dev *pdev = idxd->pdev;
 	struct device *dev = &pdev->dev;
 	int i, new_handle, rc;
 
 	if (!idxd->request_int_handles) {
-		kfree(revoke);
 		dev_warn(dev, "Unexpected int handle refresh interrupt.\n");
 		return;
 	}
@@ -216,7 +209,6 @@ static void idxd_int_handle_revoke(struct work_struct *work)
 			udelay(100);
 		idxd_int_handle_revoke_drain(ie);
 	}
-	kfree(revoke);
 }
 
 static void idxd_evl_fault_work(struct work_struct *work)
@@ -504,20 +496,9 @@ irqreturn_t idxd_misc_thread(int vec, void *data)
 	}
 
 	if (cause & IDXD_INTC_INT_HANDLE_REVOKED) {
-		struct idxd_int_handle_revoke *revoke;
-
 		val |= IDXD_INTC_INT_HANDLE_REVOKED;
 
-		revoke = kzalloc_obj(*revoke, GFP_ATOMIC);
-		if (revoke) {
-			revoke->idxd = idxd;
-			INIT_WORK(&revoke->work, idxd_int_handle_revoke);
-			queue_work(idxd->wq, &revoke->work);
-
-		} else {
-			dev_err(dev, "Failed to allocate work for int handle revoke\n");
-			idxd_wqs_quiesce(idxd);
-		}
+		queue_work(idxd->wq, &idxd->int_handle_revoke_work);
 	}
 
 	if (cause & IDXD_INTC_CMD) {
-- 
2.34.1

