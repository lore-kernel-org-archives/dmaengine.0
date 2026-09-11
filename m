Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FF539A807
	for <dmaengine@vger.kernel.org>; Fri, 11 Sep 2026 06:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789109821; cv=none; b=CmjCyCgfzOZaS9peD3Y1VrQsBTAg67mh2LvXvBxlRpfsy1SqMbgTRR5QK5Y9/L1fqWpIShqXpy2RdMZDHz/TdpRv3aQvbwZiPwBZWBcsNMPJDnO0q/S1AH4Q1fph5Wd0gdJmkZkOAxXTXZFLUX0bHwmAeheKghsX4ceof+ujPnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789109821; c=relaxed/simple;
	bh=ZWiWWoPoHpGWSF7duWUIa10+eDgIbOA4gXOP71DCixA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p0mPUgmbrTMcbZZ6J4Oqwhnj1ds/M8bDgHBNZDt4z/aNs6RJKGmAThfNFwoNdz/q/6sEfzGjkfT1k2J1MMGtA0nwOpDuZpyK8v48GDFX100L7dH3wohEM6NKevHXnM2UW3VtJBnCQyPPP9fJvJfhfALojadxhRH+RgbubwqXXTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X46eqP6z; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X46eqP6z"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c0766cbe64so407479b6e.3
        for <dmaengine@vger.kernel.org>; Thu, 10 Sep 2026 23:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789109804; x=1789714604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m7YKdCCnwvUX0LHciH03Yb1Ns90oMxtD4jexVpEltzQ=;
        b=X46eqP6z+QiDsYsElA/ASSVuGyNaiM3Z2QeHxIR4s6ybOV9piyQ0qcV6YfE/3InoQh
         FCW9b9dcfAE94AUHjemANFEprSqmRPEpm0Kn9sL1guECXttwlAFX3axukbcjGxTCb/Em
         uuCQ9NNOQsIko5lC9Ac0pemi+ptClSh1NfSps5p1Tmyxj8J9FMjy8F5fRsEkcDNWbfyu
         kjg4E2A48cxFXRbAqD/U3rI2vs+hkSuh8c1mT0AUMH0fPuPBue0D3+SoHGSxMDraOrci
         N6JZMbgdWVeYbNvPNi/Jzak4Gvg+P3gmSUEb1ew+WCO1wsjArGDEn1EcBa/4hllIUcS4
         Ffcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789109804; x=1789714604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m7YKdCCnwvUX0LHciH03Yb1Ns90oMxtD4jexVpEltzQ=;
        b=HoZzCyc9a9CMDNYRrf7Qd2qfPnvKXs5LhU/H1EK7LOlQ+YT11Rp5tThcEb3Sf9kVEJ
         M1JRQo2XT1dNXGuxVl13gwymYRydoid78ysXfULwdWCIfZLGxGE/08kXTDqOIzo6w0zL
         1sEGtrG7SkMTNFk3+mgSt/VuvKUNSXcgMN57M6lcLVUD/b1KzjUFMVnsNhyfIMsVLxaQ
         GNoghXLaUwFNEe9lR2W5nKy3YbKAZcYgrciPtPlb1hBqM+A/P4mHh5CXxPF44pt014sp
         ywcVIm88ZG7GGBy5XGjrKGePWu3HjrREfqHaycSUy3aMahBaX5kmO5Rd3SSEVHGy8W8x
         nDjQ==
X-Forwarded-Encrypted: i=1; AKwUvBzlMf4LfPhQFKWwpL7DD4XOhEOSR5M+Ro277jep7Pz9jFNOtrXjF7+0AK6GVnY0ayFZ8DV91hIBKnE=@vger.kernel.org
X-Gm-Message-State: AFuF++lDE9ZSMqjv3jRZHxrxRlOzxsgMsDpeTYmqjU8pB8YgjdHqx3QP
	FaDhDJLz0dOgrf5Z8Ux9EdUJLfSHGNgWOWlXoyfszIiOMgXnwcpp6ove
X-Gm-Gg: AYBFou1i24Kx4/fDAY7qdIE492QSfNNjHDhyzlNsUAof7tJPZZDh1JKMtRbw0TJipvl
	T/OQCHdRc24YF/wWFZTOL3pYPr/ZwuAwOaEVsZ5bbMZvD1sGCAEgk2idGcYAou9DLt5RUbtsmvN
	QZjkF87JRBP06r65oXgsBD/NNBzk6GK+E6qciX0EfcM5hHFyVwdcunu2JoHAQIvDEU8yG37XVQg
	UgVytO850yCwOZj0ujSQRaVM/HXRIQkn2vV/42xYCdhVDB0Y9Bfi+iq9Rusltz8blxwjj9MV3Mw
	f7FC8xOGO9iJwPfnSOhsgMEYzrkCpeLUKQzJOFgRvgwuD9loKnwwXPdSlA5OiutPt3w2vCqsCs7
	TFP8ZKMoF7DlykFD1IaehWJ+pS3L+4RU5gLij5l7hjBpP+NviWKElkgADuBYhCoJ3p0OsStyk92
	yB+mgs9nUhrV6FAh/6OHCSCMvWg6nOi9BKYc75Jg1Y+9FvajSRedlHaYGiMSuyjO4UuzCb3/p+M
	lFC5rcG
X-Received: by 2002:a05:6809:154:20b0:4c3:9892:96fe with SMTP id 5614622812f47-4c398a1e3f9mr947694b6e.3.1789109803778;
        Thu, 10 Sep 2026 23:56:43 -0700 (PDT)
Received: from localhost.localdomain ([107.173.101.132])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4c3322e1baasm1406878b6e.16.2026.09.10.23.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 23:56:42 -0700 (PDT)
From: "Ziyou Wang (Lenovo)" <ziyou.dev@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Vinicius Costa Gomes <vinicius.gomes@intel.com>
Cc: Dave Jiang <dave.jiang@intel.com>,
	Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Ziyou Wang (Lenovo)" <ziyou.dev@gmail.com>,
	Adrian Huang <adrianhuang0701@gmail.com>
Subject: [PATCH] dmaengine: idxd: Fix use-after-free in idxd_remove
Date: Fri, 11 Sep 2026 14:55:47 +0800
Message-ID: <20260911065547.161522-1-ziyou.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When unbinding the idxd driver, the following call trace is observed:

  general protection fault, probably for non-canonical address 0x18fc1d6937256657
  CPU: 117 UID: 0 PID: 3396 Comm: python3 Tainted: G E 7.2.0-rc5-latest+ #11 PREEMPT(lazy)
  Hardware name: Lenovo WenTian WR5220 G5, BIOS speb50m-2.54
  RIP: 0010:__refill_objects_node+0x2da/0x5e0
  Call Trace:
   <TASK>
   refill_objects+0x1ee/0x2e0
   __pcs_replace_empty_main+0x1e1/0x330
   __kmalloc_noprof+0x503/0x550
   ext4_htree_store_dirent+0x34/0x110 [ext4]
   htree_dirblock_to_tree+0x1a9/0x2c0 [ext4]
   ext4_htree_fill_tree+0x246/0x3d0 [ext4]
   ext4_readdir+0x863/0x9d0 [ext4]
   iterate_dir+0xa6/0x260
   __x64_sys_getdents64+0x76/0x130
   do_syscall_64+0x98/0x620
   entry_SYSCALL_64_after_hwframe+0x76/0x7e
   </TASK>

With the KASAN-enabled kernel, the kernel reports a use-after-free bug:

idxd_unregister_devices() calls device_unregister(wq), which triggers
the wq release callback and frees wq memory via kfree(). However,
idxd->wqs[] array still holds the freed pointer. Later, when
device_unregister(idxd) calls idxd_device_drv_remove(), it accesses
wq->state through idxd->wqs[], resulting in use-after-free.

The same issue exists for idxd->engines[] and idxd->groups[] arrays.

KASAN report:

  BUG: KASAN: slab-use-after-free in idxd_device_drv_remove+0xc1/0x100 [idxd]
  Read of size 4 at addr ff1100038d296414 by task python3/3354
  CPU: 20 UID: 0 PID: 3354 Comm: python3 Tainted: G E 7.2.0-rc5-debug+
  Hardware name: Lenovo WenTian WR5220 G5, BIOS speb50m-2.54

  Call Trace:
    <TASK>
    dump_stack_lvl+0x5b/0x80
    print_report+0x153/0x4b5
    kasan_report+0xbc/0xf0
    idxd_device_drv_remove+0xc1/0x100 [idxd]
    device_release_driver_internal+0x244/0x2e0
    bus_remove_device+0x195/0x2b0
    device_del+0x24b/0x540
    device_unregister+0x17/0x80
    idxd_remove+0x3f/0x120 [idxd]
    pci_device_remove+0x6d/0xf0
    device_release_driver_internal+0x244/0x2e0
    unbind_store+0xae/0xb0
    kernfs_fop_write_iter+0x205/0x2d0
    vfs_write+0x3a9/0x6b0
    ksys_write+0xc7/0x160
    do_syscall_64+0x9c/0x620
    entry_SYSCALL_64_after_hwframe+0x76/0x7e
    </TASK>

  Allocated by task 1219:
    kasan_save_stack+0x20/0x40
    kasan_save_track+0x14/0x30
    __kasan_kmalloc+0x9a/0xb0
    __kmalloc_cache_node_noprof+0x1c6/0x470
    idxd_pci_probe_alloc+0x103f/0x2430 [idxd]
    local_pci_probe+0x71/0xd0
    local_pci_probe_callback+0x20/0x40
    process_one_work+0x389/0x6a0
    worker_thread+0x321+0x590
    kthread+0x1b4/0x200
    ret_from_fork+0x3bd/0x4d0
    ret_from_fork_asm+0x1a/0x30

  Freed by task 3354:
    kasan_save_stack+0x20/0x40
    kasan_save_track+0x14/0x30
    kasan_save_free_info+0x3b/0x70
    __kasan_slab_free+0x6b/0x90
    kfree+0x1d4/0x520
    device_release+0x77/0x120
    kobject_put+0xdb/0x2a0
    idxd_unregister_devices+0x5b/0x130 [idxd]
    idxd_remove+0x2f/0x120 [idxd]
    pci_device_remove+0x6d/0xf0
    device_release_driver_internal+0x244/0x2e0
    unbind_store+0xae/0xb0
    kernfs_fop_write_iter+0x205/0x2d0
    vfs_write+0x3a9/0x6b0
    ksys_write+0xc7/0x160
    do_syscall_64+0x9c/0x620
    entry_SYSCALL_64_after_hwframe+0x76/0x7e

Fix by taking refs on wq/engine/group conf_dev in idxd_unregister_devices()
before calling device_unregister(). This prevents their memory from being
freed until after idxd_device_drv_remove() completes. Add idxd_put_devices()
to release the refs after all cleanup activities are done.

To reproduce:
  cd dsa-perf-micros
  ./scripts/setup_dsa.sh -d dsa0 -w 1 -m s -e 4
  echo "0000:00:01.0" > /sys/bus/pci/drivers/idxd/unbind

Fixes: 47c16ac27d4c ("dmaengine: idxd: fix idxd conf_dev 'struct device' lifetime")
Suggested-by: Adrian Huang (Lenovo) <adrianhuang0701@gmail.com>
Signed-off-by: Ziyou Wang (Lenovo) <ziyou.dev@gmail.com>
---
Added a Suggested-by tag for Adrian, as he came up with the idea for this patch.

 drivers/dma/idxd/init.c  | 15 +++++++++++++++
 drivers/dma/idxd/sysfs.c |  8 ++++++++
 2 files changed, 23 insertions(+)

diff --git a/drivers/dma/idxd/init.c b/drivers/dma/idxd/init.c
index 4b827a329756..212efbfebacc 100644
--- a/drivers/dma/idxd/init.c
+++ b/drivers/dma/idxd/init.c
@@ -1263,6 +1263,20 @@ static void idxd_shutdown(struct pci_dev *pdev)
 	flush_workqueue(idxd->wq);
 }
 
+static void idxd_put_devices(struct idxd_device *idxd)
+{
+	int i;
+
+	for (i = 0; i < idxd->max_wqs; i++)
+		put_device(wq_confdev(idxd->wqs[i]));
+
+	for (i = 0; i < idxd->max_engines; i++)
+		put_device(engine_confdev(idxd->engines[i]));
+
+	for (i = 0; i < idxd->max_groups; i++)
+		put_device(group_confdev(idxd->groups[i]));
+}
+
 static void idxd_remove(struct pci_dev *pdev)
 {
 	struct idxd_device *idxd = pci_get_drvdata(pdev);
@@ -1284,6 +1298,7 @@ static void idxd_remove(struct pci_dev *pdev)
 	if (device_pasid_enabled(idxd))
 		idxd_disable_system_pasid(idxd);
 	pci_iounmap(pdev, idxd->reg_base);
+	idxd_put_devices(idxd);
 	put_device(idxd_confdev(idxd));
 	pci_disable_device(pdev);
 }
diff --git a/drivers/dma/idxd/sysfs.c b/drivers/dma/idxd/sysfs.c
index 6d251095c350..eca96a4dcecd 100644
--- a/drivers/dma/idxd/sysfs.c
+++ b/drivers/dma/idxd/sysfs.c
@@ -1988,21 +1988,29 @@ void idxd_unregister_devices(struct idxd_device *idxd)
 {
 	int i;
 
+	/*
+	 * Take a reference count to the idxd device to prevent the
+	 * corresponding idxd context from being freed, as the driver
+	 * still needs it for the remaining cleanup operations.
+	 */
 	for (i = 0; i < idxd->max_wqs; i++) {
 		struct idxd_wq *wq = idxd->wqs[i];
 
+		get_device(wq_confdev(wq));
 		device_unregister(wq_confdev(wq));
 	}
 
 	for (i = 0; i < idxd->max_engines; i++) {
 		struct idxd_engine *engine = idxd->engines[i];
 
+		get_device(engine_confdev(engine));
 		device_unregister(engine_confdev(engine));
 	}
 
 	for (i = 0; i < idxd->max_groups; i++) {
 		struct idxd_group *group = idxd->groups[i];
 
+		get_device(group_confdev(group));
 		device_unregister(group_confdev(group));
 	}
 }
-- 
2.53.0

