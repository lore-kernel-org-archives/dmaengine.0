Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6018543B6DA
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184902; cv=none; b=KbpYYQZED3ptNm1BKLQJwOMa2pXfP7PvEUu8apIiCqGKTZOQQY+52NXSa1MxKie/KdTIcM2P0gMUgZDsLHoqM2CVoVQbE+UraVN2sclYOSc/Jc3HqJP9HJXMdDBhPWVI3VkqmwwjD34LFTespLWClHljYWJRLCQ/Paw9eL0Y9PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184902; c=relaxed/simple;
	bh=D9buJWBENXwKkA5D1XEqqiZG/+eN/1H8cfh/E7VzUns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pxx9CgxobqySF5PBBjxetz7dd+BzjFqh6o2bApsLBCQA+aOgsdbL3+tZgFsjYG6SvE977IaTogpH/SKkAPSSsutDPOFzITjBz5+FcP8qwPbXBDhzUJpD63G3YRAhN5QN5eLqtAnNB6Kjad4NSCPV6Z1I9gpve750kffKR9BguY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P2FlCAsm; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P2FlCAsm"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-84e3007a2b7so2733307b3a.0
        for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 13:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184900; x=1785789700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lNITHQbGYZEGVzOsNHD58vSU7coqhBN7c2AlQHYl/Jg=;
        b=P2FlCAsmyc8cPHiPjMknOK664Ecw/YzvujMQvJY55xSOCpvzUoEtc8fURH7PWAKsGq
         qbDRI0aajW3FDc2QdUQVm77Nn6QctD3miIa8MQYV1GgBwQf/Vps0YnOtgINrvRqwxzgN
         s+3OqGXkdOrpj43jrawQSLAuzDUqeSvwxCDnerJCYRsHGk2rl6YOHlLlI42+UL5tB++3
         8zUz0ir6PGbwd96HuBh4b+E0DcZo/4Da0LZ5e+D+qXdsW0b0roxz2IBLHoQ3DYTr3+kR
         qrCuv3KAhPKdJVhpLnzjGlnVB8cJhw704GsTicZ9psGu7s5l8wILT8tM3rPR4yEfBFiR
         G6Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184900; x=1785789700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lNITHQbGYZEGVzOsNHD58vSU7coqhBN7c2AlQHYl/Jg=;
        b=q2STf4WvcMRDMkeYzEoCUL11BxZp7M166q8vbYg8Z9EJELj+BWBTxjMVrJQV4BGeWJ
         A/rU5GXn6M0k3fRDPntfw14ig+8DVqKTHXMmCen4hDnw5nv2lOlp62o3OJ7oU6EW479u
         /i/fRcAgm1OPwUkqdFFvey/G/9N2kKCldX62ZPcBje9qHmDBOXYwpBKa2jETcAJeq+iy
         +miSgdgc5aLKxlHKFDRxpGADqfAkLFgBYeZDaur7iWQcRz7Mah+Nx0VlGo3379e0MPH7
         Umr+jzfXIe+J6AqllyTMv7lZ2IFrIs2kTtMSYJ5Z/XLzPt6TOY/Aa5GHgPB8X3Hq5oND
         Uetg==
X-Forwarded-Encrypted: i=1; AHgh+RrJMKy7rajwonDn/9qWf71AFbWlS5hfAXXlWH10Gz/WIUroe1qY9ORTmKEkw80bkdTIqtPlPzNqbNw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwD0dydXj82K+OXFikOapyGkBolxM9HgiJNez+/JIAXV74DfRYv
	brBfOyzAp/CW3Xpu9QUJHmTD9px+OQH7ZawsuA/bfdncRB/skBEB3vOe
X-Gm-Gg: AR+sD137F4KCjKmqQjrLT09XDPIDKcGcldLSO/buVNSBV/TDL88KOneFo15y5R/rAHQ
	SuvheqMVInI2Atdq2uKfllP+o4JnPC3XSvW1ju+pcebhlWrhTzhEabWJFzHU9lQRx7hrrPAHUt7
	m63I9SXAKMD9gCcbcNeEZ9Xl/qjXi6dpFbbBQoWhiP4WbYP05FqZRUdySbaz80ae2E96FXFa8Hi
	x/HCEgUDu0w/Xbw9x9dVyaPaU9pEBuZJhYP7SFGnFLIXOhqiZgVeCnCqmHcRZ9lM3hi9C6P02aD
	H1zNdTtFmDG0Gm0SNuxsQ4X3sgveMm9VS6S0+wN86CG8OEKb4j5qLAz2xvyQjqi105Zicv8aoY0
	+i5bQmPfqOakAaf0v1T+pmseRD24Gw/6a0NNNwEFsGx4d/rbOdyUJgm51TRhh54mmk99IaAxxk/
	5lM/KT
X-Received: by 2002:a05:6a00:9094:b0:848:2f84:f427 with SMTP id d2e1a72fcca58-84e5958d85amr8189474b3a.64.1785184899749;
        Mon, 27 Jul 2026 13:41:39 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e533d1351sm3583338b3a.39.2026.07.27.13.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:41:39 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Kelvin Cao <kelvin.cao@microchip.com>,
	Logan Gunthorpe <logang@deltatee.com>
Subject: [PATCH v2 64/64] dmaengine: switchtec: use channel BH helpers
Date: Mon, 27 Jul 2026 13:39:26 -0700
Message-ID: <5eb60739b22e88b9220179dc024186c19724db28.1785183549.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com> <cover.1785183549.git.allen.lkml@gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the per-channel descriptor completion tasklet with the shared
dma_chan BH helpers. Client callbacks remain in softirq context while
using the common scheduling and teardown mechanism.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/switchtec_dma.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/switchtec_dma.c b/drivers/dma/switchtec_dma.c
index 3ef928640615..f3459799e05d 100644
--- a/drivers/dma/switchtec_dma.c
+++ b/drivers/dma/switchtec_dma.c
@@ -133,8 +133,6 @@ struct switchtec_dma_chan {
 	/* Serialize hardware control register access */
 	spinlock_t hw_ctrl_lock;
 
-	struct tasklet_struct desc_task;
-
 	/* Serialize descriptor preparation */
 	spinlock_t submit_lock;
 	bool ring_active;
@@ -584,6 +582,7 @@ static void switchtec_dma_synchronize(struct dma_chan *chan)
 
 	int rc;
 
+	dma_chan_kill_bh(chan);
 	switchtec_dma_abort_desc(swdma_chan, 1);
 
 	rc = enable_channel(swdma_chan);
@@ -820,9 +819,10 @@ static int switchtec_dma_resume(struct dma_chan *chan)
 	return ret;
 }
 
-static void switchtec_dma_desc_task(unsigned long data)
+static void switchtec_dma_desc_task(struct dma_chan *chan)
 {
-	struct switchtec_dma_chan *swdma_chan = (void *)data;
+	struct switchtec_dma_chan *swdma_chan =
+		container_of(chan, struct switchtec_dma_chan, dma_chan);
 
 	switchtec_dma_cleanup_completed(swdma_chan);
 }
@@ -832,7 +832,7 @@ static irqreturn_t switchtec_dma_isr(int irq, void *chan)
 	struct switchtec_dma_chan *swdma_chan = chan;
 
 	if (swdma_chan->comp_ring_active)
-		tasklet_schedule(&swdma_chan->desc_task);
+		dma_chan_schedule_bh(&swdma_chan->dma_chan);
 
 	return IRQ_HANDLED;
 }
@@ -1041,6 +1041,7 @@ static void switchtec_dma_free_chan_resources(struct dma_chan *chan)
 	spin_unlock_bh(&swdma_chan->complete_lock);
 
 	switchtec_dma_chan_stop(swdma_chan);
+	dma_chan_kill_bh(chan);
 	switchtec_dma_abort_desc(swdma_chan, 0);
 	switchtec_dma_free_desc(swdma_chan);
 
@@ -1067,8 +1068,6 @@ static int switchtec_dma_chan_init(struct switchtec_dma_dev *swdma_dev,
 	spin_lock_init(&swdma_chan->hw_ctrl_lock);
 	spin_lock_init(&swdma_chan->submit_lock);
 	spin_lock_init(&swdma_chan->complete_lock);
-	tasklet_init(&swdma_chan->desc_task, switchtec_dma_desc_task,
-		     (unsigned long)swdma_chan);
 
 	swdma_chan->mmio_chan_fw =
 		swdma_dev->bar + SWITCHTEC_DMAC_CHAN_CFG_STS_OFFSET +
@@ -1116,6 +1115,7 @@ static int switchtec_dma_chan_init(struct switchtec_dma_dev *swdma_dev,
 	chan = &swdma_chan->dma_chan;
 	chan->device = dma;
 	dma_cookie_init(chan);
+	dma_chan_init_bh(chan, switchtec_dma_desc_task);
 
 	list_add_tail(&chan->device_node, &dma->channels);
 
@@ -1138,7 +1138,7 @@ static int switchtec_dma_chan_free(struct pci_dev *pdev,
 	spin_unlock_bh(&swdma_chan->complete_lock);
 
 	pci_free_irq(pdev, swdma_chan->irq, swdma_chan);
-	tasklet_kill(&swdma_chan->desc_task);
+	dma_chan_kill_bh(&swdma_chan->dma_chan);
 
 	switchtec_dma_chan_stop(swdma_chan);
 
-- 
2.43.0

