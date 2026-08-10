Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5ED93F58D6
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 18:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786385512; cv=none; b=ERRCFj1bl0K0OoC19PucZdkLYmA+RZDTXdlm5plJx/IIQc5F+PHby5jPLLOXKxhUKp6WRQGbccOfXNCIxV1mjFXn35NXRgGqi0HV5GLR5z9xJU+wSqMsf8SHs8NX14pQR/M6r6rYw8AqlobQWXzqYmAAtldcxmBDpA0I1+Mb2I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786385512; c=relaxed/simple;
	bh=Aqbd7GzBuzE8rI9O2NgJ3ZT7ebKglGTUt9a1gqEF4hM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tsR0dOIxoD78ZHPlCQUDHygW8ZNoTyA5XBPW60m0JFBMbEHWs/9lKkYV5DRJ2GVxYxCBsUYOhzYhhJAxJFUBk/YOSmLG2Mvj0JCkSca8m2HPYETKoOElR1rOREwd0vPgqGzfYGFhheESmBilmzukbZInkOmnsBuTyD4chcO6GMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WUcYvuaY; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WUcYvuaY"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so2125232a91.2
        for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 11:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786385510; x=1786990310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uvni5rvIbNookZfZcgjA1SBuMYV8QNEvigVrBM/wZOg=;
        b=WUcYvuaYcvWfZ9AheS4omq7+Zivvo+2G+ApDGybFhD36iVvVlXY9rtVOqVHUmVXd0a
         Y4NkVf04GjfBWm/pr5t+kHk0CWe8HqNJJ8DcseU2Az0KVgQwi7lbDk7jD+C1nCpEnY7h
         Ac23k5r7f3CimFtm2AkQj820Izj3YJDFipsnBiz4qNfL/WsPm+l/aaoAQjBDXjIQhj8b
         P1fTEvSRiHMVs4EwVLxqgUkHdx4Jj3Pl20/N5i0oolGIhALFB2K77OhFFEWuBG4NWfmh
         FczKJbv1BZPgd9dRv+bDXTYYS+zGmvElsDtfU0M8Me/GStqT1Bplm9+TlPXV9yIGJ07S
         IuDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786385510; x=1786990310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uvni5rvIbNookZfZcgjA1SBuMYV8QNEvigVrBM/wZOg=;
        b=A2Dyg2Nx8rHls6YtVWusqq/z0Mpu1AAGx6eim5MVEkl/SN5WaK/NhzARJvLoZdm+a/
         8AKpr9orU8cbGGuExl/bqBBzxKjeFymr1b7aC0N7HXK+Wb4NBq9akid2J2yJLg539ieU
         2JTrod0pRLQIOhRMQOfnSzh7voaBXSCsIzkQPPKiZhPF8lTU7TK/3rqZ2Ztzcc1BliUG
         inCiDW/qf7RayPQ63zHBf/4XyXW344psFaRGAK30+y4qq8+MlX9jPC3p3SLrNWgjOpJ6
         Zu+VrUCUBInFgMXAILC2ro+etjCI+24Q8I5KWqkEwqX+DCke7jNDIgxHNUtq985nJA+0
         kCaw==
X-Forwarded-Encrypted: i=1; AHgh+RrHsIH2uFCToCrOzRwke1Ih0Z43SB63UP4qifYFfe+q4hR+yjLBJufZV2aMecg1SjJpPx0V/g5f0mc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuxeVODImJl2FLdmL33sxMgjmPoVqpInFlrO+USAeI4vfWFH4t
	R3LqB18GLB4h7VQQ88ozVXm9/vlEAuSdjKOtCDj9rOkPdPSIn+w3Z+b8IcKRoQ==
X-Gm-Gg: AR+sD10Pc9lcdd34P9AeIGM6yMBRNR/YV75D5YforzPg48NSgj+xDklH/t90AxGi+dq
	UbX6mXlqrU2/HABabUpdNc+blRp39O3PISzJvuoJlnXLu1xp/5vwaRk20HsnhsPIo+YWK5byZAV
	d/vorztFOxc0JjpHJa1n3ki3mgLl/H2AaDlBo7VJGJgf0Ew5qwu4IYhVpGNyzx65GQ5HuPJf+3V
	pRbMd+u9Tf4Zjg92rFRvLN9i0NaZ4IYvvXXxv42qPgqNRvpyKkeXIqbYDeByUgcdShfafRCQU6G
	nK76/Lwm8Srl5zpAtRAJ3htqCJRwhcu0sGDSS24nQEyCAG8PxTq0DlOHz9JiyfU0t14ZBArj35O
	u16hY4Qtt1a/6yP/CnsZTUllh/NOqiyOiO5OOFSq90NHSf2bp0ftDhHBwO6BgCj54D02jhsoa0H
	IqGMLL844g4Al+zX8rzEmEEgQvkx+I+x+8rIc/iFCbSRg9yFm+A7X2PrNixW7U63k=
X-Received: by 2002:a17:90b:3b4e:b0:38e:5c6:4db9 with SMTP id 98e67ed59e1d1-392823702d4mr16298190a91.11.1786385510167;
        Mon, 10 Aug 2026 11:11:50 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fa9:fa00:b1a9:6513:83c6:1d23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d53b873asm472795a91.17.2026.08.10.11.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 11:11:49 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Dave Jiang <dave.jiang@intel.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Alex Williamson <alex@shazbot.org>,
	David Matlack <dmatlack@google.com>,
	Lukas Wunner <lukas@wunner.de>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>
Subject: [PATCH v3 09/34] dmaengine: ioat: convert cleanup tasklet to dmaengine BH
Date: Mon, 10 Aug 2026 11:09:10 -0700
Message-ID: <00e0c9c2fea2a0b00a2f3a91bcea240c6021648a.1786384168.git.allen.lkml@gmail.com>
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

Replace the per-channel tasklet with the shared dmaengine BH helper.
The handler continues to run in softirq context while dmaengine owns
the common scheduling and teardown mechanism.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
Acked-by: Dave Jiang <dave.jiang@intel.com>
---
 drivers/dma/ioat/dma.c  | 14 +++++++-------
 drivers/dma/ioat/dma.h  |  3 +--
 drivers/dma/ioat/init.c |  2 +-
 3 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/dma/ioat/dma.c b/drivers/dma/ioat/dma.c
index ee93b029f9e3..c7a63dbac6e2 100644
--- a/drivers/dma/ioat/dma.c
+++ b/drivers/dma/ioat/dma.c
@@ -110,7 +110,7 @@ irqreturn_t ioat_dma_do_interrupt(int irq, void *data)
 	for_each_set_bit(bit, &attnstatus, BITS_PER_LONG) {
 		ioat_chan = ioat_chan_by_index(instance, bit);
 		if (test_bit(IOAT_RUN, &ioat_chan->state))
-			tasklet_schedule(&ioat_chan->cleanup_task);
+			dmaengine_schedule_bh(&ioat_chan->dma_chan);
 	}
 
 	writeb(intrctrl, instance->reg_base + IOAT_INTRCTRL_OFFSET);
@@ -127,7 +127,7 @@ irqreturn_t ioat_dma_do_interrupt_msix(int irq, void *data)
 	struct ioatdma_chan *ioat_chan = data;
 
 	if (test_bit(IOAT_RUN, &ioat_chan->state))
-		tasklet_schedule(&ioat_chan->cleanup_task);
+		dmaengine_schedule_bh(&ioat_chan->dma_chan);
 
 	return IRQ_HANDLED;
 }
@@ -161,11 +161,11 @@ void ioat_stop(struct ioatdma_chan *ioat_chan)
 	/* flush inflight timers */
 	timer_delete_sync(&ioat_chan->timer);
 
-	/* flush inflight tasklet runs */
-	tasklet_kill(&ioat_chan->cleanup_task);
+	/* flush inflight BH runs */
+	dmaengine_kill_bh(&ioat_chan->dma_chan);
 
 	/* final cleanup now that everything is quiesced and can't re-arm */
-	ioat_cleanup_event(&ioat_chan->cleanup_task);
+	ioat_cleanup_event(&ioat_chan->dma_chan);
 }
 
 static void __ioat_issue_pending(struct ioatdma_chan *ioat_chan)
@@ -690,9 +690,9 @@ static void ioat_cleanup(struct ioatdma_chan *ioat_chan)
 	spin_unlock_bh(&ioat_chan->cleanup_lock);
 }
 
-void ioat_cleanup_event(struct tasklet_struct *t)
+void ioat_cleanup_event(struct dma_chan *c)
 {
-	struct ioatdma_chan *ioat_chan = from_tasklet(ioat_chan, t, cleanup_task);
+	struct ioatdma_chan *ioat_chan = to_ioat_chan(c);
 
 	ioat_cleanup(ioat_chan);
 	if (!test_bit(IOAT_RUN, &ioat_chan->state))
diff --git a/drivers/dma/ioat/dma.h b/drivers/dma/ioat/dma.h
index e8a880f338c6..4bdb1ae937e4 100644
--- a/drivers/dma/ioat/dma.h
+++ b/drivers/dma/ioat/dma.h
@@ -111,7 +111,6 @@ struct ioatdma_chan {
 	struct ioatdma_device *ioat_dma;
 	dma_addr_t completion_dma;
 	u64 *completion;
-	struct tasklet_struct cleanup_task;
 	struct kobject kobj;
 
 /* ioat v2 / v3 channel attributes
@@ -385,7 +384,7 @@ int ioat_reset_hw(struct ioatdma_chan *ioat_chan);
 enum dma_status
 ioat_tx_status(struct dma_chan *c, dma_cookie_t cookie,
 		struct dma_tx_state *txstate);
-void ioat_cleanup_event(struct tasklet_struct *t);
+void ioat_cleanup_event(struct dma_chan *c);
 void ioat_timer_event(struct timer_list *t);
 int ioat_check_space_lock(struct ioatdma_chan *ioat_chan, int num_descs);
 void ioat_issue_pending(struct dma_chan *chan);
diff --git a/drivers/dma/ioat/init.c b/drivers/dma/ioat/init.c
index 737496391109..788927820d86 100644
--- a/drivers/dma/ioat/init.c
+++ b/drivers/dma/ioat/init.c
@@ -765,7 +765,7 @@ ioat_init_channel(struct ioatdma_device *ioat_dma,
 	list_add_tail(&ioat_chan->dma_chan.device_node, &dma->channels);
 	ioat_dma->idx[idx] = ioat_chan;
 	timer_setup(&ioat_chan->timer, ioat_timer_event, 0);
-	tasklet_setup(&ioat_chan->cleanup_task, ioat_cleanup_event);
+	dmaengine_init_bh(&ioat_chan->dma_chan, ioat_cleanup_event);
 }
 
 #define IOAT_NUM_SRC_TEST 6 /* must be <= 8 */
-- 
2.43.0

