Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12F63F58D6
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 18:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786385598; cv=none; b=WkohlgzEsGkN+4xLXmvMOyo4oKfxy8vJ8XNMOT570Ihe9u4LHcbBVfMKPIOevaZ1jnc7PIM8DqHGB2AJyCd7n9i6EL1iHT5KhizHQcOj+U0GnBzEZ84OeXK1z0JyGZmquMFsWIJCeerKgYT6k+OZFGNCXD+DHR1NNcExfeBZiTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786385598; c=relaxed/simple;
	bh=3vlw48vVVYMDsIfSnw51xnY2eWgPtcDwS/T3cZE/dy8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iDQwnrN43vyklDwHI+Lj+zn/rmDrdZRzA/2/acusBpVAHqGpesVhqcP5fDiGd16vUoZXVRe3ZmQF/qeBZFvbZarDA9eoWv0xnvd910ktFXJ7DhS2hLOUbP4xOmMLPPjObpfCEZKk/EoFk7+l8KocVg3j+doNAHyph5aw+R1rvxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bCHhbj8b; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bCHhbj8b"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d01663d816so19239035ad.1
        for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 11:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786385596; x=1786990396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WujUIY65y0KmxCJIWe2PeDrhDspA8W9feQaFaQQ0mOg=;
        b=bCHhbj8bZhIBloQtuZeShK4J2b+KOCMH65h1FUx3ZlvZ7A5wpob5wAuNEJjtcBTZ6O
         gv6fj6yVZz1EhdKTJ2MkOsgzEFHlQBLKN2FjfR9diepuch5iYjnlD/iKalMh6c58Ka5W
         g+kOJGB566k0rpT+2zcaBCjCauULRi6X/hxJUvDYWI2VCQGFsQ6pimddFGHGNL0EAIf3
         Zr+TpeJcO76uKzeGnZA5nCRiZY2S7UIBKLc/N2EUIUbDnu6L6L2PyWJWbddVksgnkFXi
         +85a4SESG4dVC+XcJZdOgGYEWllPhqoxYElTBx90AI4yg28m+66BMPOWWPCMk79WKKHl
         Q2RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786385596; x=1786990396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WujUIY65y0KmxCJIWe2PeDrhDspA8W9feQaFaQQ0mOg=;
        b=mMUXHeCKUHyPHnojN1BaosLGUBd/1P2jBlzMkeDVYIw3DBVx5g27XNB0EAtU6QWoN0
         17O4YNwqd69wxsjhCIoQBeuR0348J6nEvpVfVRTpY0mTRe9d8Q6IcZzslovcQ0HZyRmd
         U2kyA4FbRS27PuTdDYbil1ZNBPAFgEouyN/f3Ba+UMxv79vVLlTWLxaDf9LyCgALxTpB
         DqmdvZbM3kAoUvJY/uRTp/VyLtG+qerifOUs+ZdGlXVQqTkvPSX0PXo0H/waFGsQp9qt
         DBOUY+6MwJNzrqE6YpQ2xwuxtb5zZv3LTtsYZQAvEU2VE60IG+NcyJLcBd0tWOjLiv1Q
         Wm4w==
X-Forwarded-Encrypted: i=1; AHgh+RrnG/E+Tn1BKSYVRuZHDuP/LkuzzR+pQyIgeH5GPUW5HOKXEt+qiJvEJYFVzAr/8Iy8DNr17N/umCc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz26xCGVzdOplqhg5UdssugOYuVctNxoA4RRNSlgQ603qlEbfJA
	uGgwdvokfJV7yYlPg3qYRD0b6bALxWiK/8WpflSKeX7pXEOF1Rn2YkTH
X-Gm-Gg: AR+sD12cuTCUJwemckrbvi4CWCg4N24FJjWaVA2Z60I6atPffGdOLzItjLjWohJcucq
	cqF2tDggoAIu55fqGKKsJYDVzQ6EO+fYL41AvhkWlX4phQG3vmUXxU6o+foLhk9EorZ3ff8LjhY
	63FJEjWhSExdpakWc9/gDiDXqV0HkMkATAVoCiXLk0jTI3DR7v4RVbojtHvaee3xGy3en85GZKF
	RYG8OsW5ksawjvOEmjurVu3xrtecEIBdKHVDc0rUyoIFNAVp/yvjVIRM/spLj3wqqkOonC5bX4v
	GMyWgkSFUBGhilizOwZSRkNB3VgpNpNnYWctLK8hBEitRYBhIuwEeBEK+Jru2Xhy1oVcVeO9nqV
	pl/d59IJ4QsOnjOqZRohG97wabZXuuGJTt8WPCNBi9m52wkH3Q+hQVb8N46b4GVXKUTjfKfllDz
	/Axm3+3pp8aA5m2coBAO0NuPqlCKNbNqo8K1qqvef51/Lj6Kv2B+xxKsGl/NPhLIg=
X-Received: by 2002:a17:90b:2242:b0:37f:c28a:de61 with SMTP id 98e67ed59e1d1-3909d8e4c62mr27816069a91.17.1786385596135;
        Mon, 10 Aug 2026 11:13:16 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fa9:fa00:b1a9:6513:83c6:1d23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d53b873asm472795a91.17.2026.08.10.11.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 11:13:15 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Logan Gunthorpe <logang@deltatee.com>
Subject: [PATCH v3 27/34] dmaengine: plx_dma: use channel BH helpers
Date: Mon, 10 Aug 2026 11:09:28 -0700
Message-ID: <9b931c21648cdee0e5db08642861b532b6b040d5.1786384169.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1786384168.git.allen.lkml@gmail.com>
References: <cover.1785183549.git.allen.lkml@gmail.com> <cover.1786384168.git.allen.lkml@gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the device tasklet with the per-channel BH helper so completion
callbacks run via dmaengine_*_bh.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
Reviewed-by: Logan Gunthorpe <logang@deltatee.com>
---
 drivers/dma/plx_dma.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/plx_dma.c b/drivers/dma/plx_dma.c
index 84941a918b01..a9a798c54ef1 100644
--- a/drivers/dma/plx_dma.c
+++ b/drivers/dma/plx_dma.c
@@ -105,7 +105,6 @@ struct plx_dma_dev {
 	struct dma_chan dma_chan;
 	struct pci_dev __rcu *pdev;
 	void __iomem *bar;
-	struct tasklet_struct desc_task;
 
 	spinlock_t ring_lock;
 	bool ring_active;
@@ -241,9 +240,10 @@ static void plx_dma_stop(struct plx_dma_dev *plxdev)
 	rcu_read_unlock();
 }
 
-static void plx_dma_desc_task(struct tasklet_struct *t)
+static void plx_dma_desc_task(struct dma_chan *chan)
 {
-	struct plx_dma_dev *plxdev = from_tasklet(plxdev, t, desc_task);
+	struct plx_dma_dev *plxdev = container_of(chan, struct plx_dma_dev,
+						  dma_chan);
 
 	plx_dma_process_desc(plxdev);
 }
@@ -366,7 +366,7 @@ static irqreturn_t plx_dma_isr(int irq, void *devid)
 		return IRQ_NONE;
 
 	if (status & PLX_REG_INTR_STATUS_DESC_DONE && plxdev->ring_active)
-		tasklet_schedule(&plxdev->desc_task);
+		dmaengine_schedule_bh(&plxdev->dma_chan);
 
 	writew(status, plxdev->bar + PLX_REG_INTR_STATUS);
 
@@ -471,7 +471,7 @@ static void plx_dma_free_chan_resources(struct dma_chan *chan)
 	if (irq > 0)
 		synchronize_irq(irq);
 
-	tasklet_kill(&plxdev->desc_task);
+	dmaengine_kill_bh(&plxdev->dma_chan);
 
 	plx_dma_abort_desc(plxdev);
 
@@ -510,7 +510,7 @@ static int plx_dma_create(struct pci_dev *pdev)
 		goto free_plx;
 
 	spin_lock_init(&plxdev->ring_lock);
-	tasklet_setup(&plxdev->desc_task, plx_dma_desc_task);
+	dmaengine_init_bh(&plxdev->dma_chan, plx_dma_desc_task);
 
 	RCU_INIT_POINTER(plxdev->pdev, pdev);
 	plxdev->bar = pcim_iomap_table(pdev)[0];
-- 
2.43.0

