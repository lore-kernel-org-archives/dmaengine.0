Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316576;
	b=u8TSW8syP7faG4y+f4PX3pHEGB1OTPU7BLosD+KFjgrlu4RLEMKoq35XLpV0UJ8+18kV
	 nWacAADqDJUn4k3p5H20K2G7MkgwPR+dxUNf8hYlv4N5B4+WuoPimX8duv0pcw1IDjIdc
	 MCD5dqPVvpprxpHuCgS1kIsoNER+ML6FtTPKTM3DKyPe/Q4xrsin2+TFBwTE1bdkooOOk
	 MOyjVAn+Gaenz0R357G//nsMGtoG7k0fTYotbXDeL8v+IanttlYYgv+GJ4tJCn4EWZYgi
	 hyfze14Mz5m6RblINcjfxk75wcJ3e/vSCRCT5H2fsdm+8nXIEITj/mXSF0f2+5TZwvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316576;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xwC9sqXF5mh2uTIdq7M8qAdiSSeBGCn6t06LEK6oyCI=;
	b=3/pEU3CDpiuo/V5viAac13Z3ZL2MuvygbS6+KAAHu+AZ1Dmvfja25O228Ha10tIOMBdU
	 TPWOW7dVmiikpzWISK0I7PtLEDzc/uGxaptyJ1ImNnCQvWPu+bkh7oeXgh1wTAeylC8AX
	 qu0TqvzHH7nDmkZUo156RlWr9ICa9EbtZADhNgjRDcjIlSO+OMMeEK22R8sNb89Gid9h9
	 RBNlUtWLlqXLOgu/IMzmbZwBslxuZShRhN7XVFf5gaCF4UfcOq0tzVf7fOaDCvgYcZzVc
	 ao7+1ge6uEgToqbeteCRksucRc6tc5Wt0Oi1uoxxXPnqOVpOuAuPDTk7l9wIur4PEgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=slYXGY7A;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B325606BFE4
	for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 13:16:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B325606BFE4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=slYXGY7A
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so1111318a91.0
        for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 05:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316576; x=1794921376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xwC9sqXF5mh2uTIdq7M8qAdiSSeBGCn6t06LEK6oyCI=;
        b=slYXGY7ASWEuctXx4XOIeuT6w5CHZs6EEJCudNCGQY7AotNNdk1jfY3ajKzoHDDsFE
         3XpneljvuXIivgxCR0L4Mc0FAzGiw3yM0ywKOcik20dB9xoEu8+OhgRRIuQfnRxHY2uG
         qKP/nzpthHzfpeKaJsZ/XI+cS9yyvVx2/qxYMPKw0aTji45tv8Vli7/1ov8ZfMERA4Fq
         NhoFVxJZUhIlkAkyPQ9SVPXHNrqok1LHMUBeE6DO0+sllViKViXS6G3XqEsYIrteMDvS
         e0Kz4SEo4h8T5aWm1m/uIBoUnKq1GJzznAf0wPFB3SWslQTrUrqzHulzThRq5npQNEtI
         tppA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316576; x=1794921376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xwC9sqXF5mh2uTIdq7M8qAdiSSeBGCn6t06LEK6oyCI=;
        b=SaK11SCfRIzRig31mhy4IkQJPbtWDI8CHEwNaurQ4DIviDIVjKXJGwB/ydN/ipWT1C
         jluFE+wx0nOWdVhJVLJDYl/KJ1wgsniay53CJ5qpWlVWXT6m2hv8EJ4t5PHipcxJ/Uck
         nyDLERhmxU6Hpkvs+YfcNixbiEM0GyroLnOrrfTZGvjfNSkXkIR/lLqQ1D+ZvMeofPlr
         jVUKY+BptEWyHhvrFfiH795gd1/Y3uiMTyFfSPt+GlNFqiGBDZSA2g15A69NahEKxFuI
         aritfTOISJXjXRdjmqv1AiA6JF1rp5KOaGNm1upH+BL4Ji+MMLjrXCqrE+D5uHr/pKy5
         IAXA==
X-Forwarded-Encrypted: i=1; AL+hErFub3lcvJ4UDASSiYznaT9iwqCgX1HvGCP9s4i4o6sldLp1du5WUCtIEjOXgNQktUYb0y+JYt7vnO4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9q5ejriTc4uEK6NVxlGKr1ciRiMkc1tuajRBCbbYJKNPiA+VHQ
	8g26UkUhfLsbglbrTNkIPwlvFFzBewncYb/WKu+oO+xoKlxz1i1cBiTL
X-Gm-Gg: AYBFou1iyj6qsdYzmSEewSeZL6E1SUya86frJejZowZUQ2EdQvJpI5S47vJnnfgDcz4
	QykkoSGZ090lfsapb/nyeNS5w7yIUDUMQMi+TDDhr7w2ryGIEwk0JzDjdfO3U1W1wFBOSxcPU9g
	vgIklLHfmguh1LwkPyNnpgdhjCivASGeyesvn8xfvv9TsJ0IPBJAFPVuHdXxg3vl67e0QvUcmRp
	yOUpLx7g+NtRjeQRDwFfSJXoOfQbrtR/3U3DXOTHx4EOCziALGL+e/WP5OxcNLw8LuLDdHOJI/N
	Kbaieug181toy0LVTCiVFrXnbt/VvyBmFRZTh7qEDH5o/XD0+/DQgxJdtTzXrw97aRbAiDf9/1n
	6hc6lwmTKpHPbetWMEKHkQIpWwXAjFV94YGkhpWXovPAhk2xRXd30Tt87Lp2jU6r1HDCvt4xP68
	dvSyp7vFeu0O7xRmu18NW1AcNYPIdCpFMEVbXj7fRkWnWS4Ermfq620Zv6NZotYFu5O8guKcEPj
	RKosvzQJ+KUE8WFN70AXXER4MLdgKS/4uFy66uNJStsmg1UGAiANkR7egTFGhD6/jX1CkMCE3+h
	F1SmKDtORcNxbaztAubngSadbdSNzqc=
X-Received: by 2002:a17:90b:4b03:b0:3b0:99f8:eba8 with SMTP id 98e67ed59e1d1-3b166cfd406mr2820964a91.66.1794316575604;
        Tue, 10 Nov 2026 05:16:15 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:16:15 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dave Jiang <dave.jiang@intel.com>,
	Frank Li <Frank.Li@kernel.org>,
	Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lukas Wunner <lukas@wunner.de>
Subject: [PATCH v4 09/33] dmaengine: ioat: convert cleanup tasklet to dmaengine BH
Date: Tue, 10 Nov 2026 05:13:09 -0800
Message-ID: <6736142ec0740f8d1bc2e26eca05732ec4752913.1794315350.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794315350.git.allen.lkml@gmail.com>
References: <cover.1794315350.git.allen.lkml@gmail.com>
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

Replace the per-channel tasklet with the shared dmaengine BH helper.
The handler continues to run in softirq context while dmaengine owns
the common scheduling and teardown mechanism.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
Acked-by: Dave Jiang <dave.jiang@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
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
index a57024c4b066..ab5068d60110 100644
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

