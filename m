Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316628;
	b=XGzRmTSKq25xQEgIf49UmjGWCE2ORpw5fi1u3TLZeHpw/M5GIBReohUyhBAB2Rk8e/Kw
	 tycQC3NMRn69P+HrNZ8AGXyj7+OmgwIee5A4J+gY1gQORHNbjTImAKWpsp4U/Hhq1e7X+
	 AKZoeI/yJmKjI09vbdqURdUN0gTpPhc5SjUt7J+E31k8vpvrMlerdGmB3ONcHpOpHwVOy
	 KeSxgdoSikw8p2PXhfMk5HqiRBW3gQB+JJdWdK8WRP3iUKRNzO6BAWu76srJNXmw7gdK6
	 qfUSuSb3XLmPk/Zht7C/h1WTw79PWubHKpDmBHo8TYCoayGQPqk8e9KmLrY6MbalUaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316628;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=k7zLnAyoVidxBagrObrQW+VXa8Bn65haoh8mvK0I/ys=;
	b=YrKz/gfBGcHAgwH3pCAn23vs3oUcVzmxl8kZr7ces3cKdi4WU0/JyvxFOJJ/wxnPTm7h
	 RFaFtQlvnjoCyga6xFVAhFvb8ChUoFczzEkuxJApZMHsJ18+/H1klwUH8qKDVXOrlL3gt
	 JuYQDO0fuL4p4iSupJPno6FAR4WPr6e3ald7hVZEVN1wP6QSIoZuwjTVjbZr53mUvaoWR
	 vszHVMcsUHbBqMAKekY3YD/w5YodRpSU0nsMI24d6e5NGvblAkBVIsmNxSN/PmE2q8m/Y
	 d6GyNpydrRFs9MSGuP1qs8JMKci+G4l8PDiZwP2Y8FO5xw1PHmLnnrZpYBIM/nKiKcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iJzPMyHL;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2355C607078F
	for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 13:17:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2355C607078F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iJzPMyHL
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cd60c5da24cso1031144a12.0
        for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 05:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316627; x=1794921427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k7zLnAyoVidxBagrObrQW+VXa8Bn65haoh8mvK0I/ys=;
        b=iJzPMyHLL8Vau2nqkZYnF6VgvsaI+kZjntDLJrch4Thy32nLJ4Q0yBzu6DO8M3nksm
         j+P4zjMSF+awp8SypcQjduaQtVsMmSic6tznF5VhJpJ6jg6XF9+B4VMxNtAxJO40ytL7
         dWOGXg5BSSHU74ldFVreAa9MyX6LuwviTyupbVF74809p8icjKEKqZ30Jy+dGxC0QW79
         QIoCGL8YQB5ENB8xqZSN9dYzMKZwVKjRLVxyRRTxTstCvfeXk/u7QlmNyXnwrdX7tdHa
         LK30mgXbdXMtZMtL/6bXe0nwwdExgpa3c8K2nxm4CrUC8wgeUSBy0yp0F9QLV+PC4yDC
         Yn1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316627; x=1794921427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k7zLnAyoVidxBagrObrQW+VXa8Bn65haoh8mvK0I/ys=;
        b=kNfWnG0JaS7KC6otaf8yd2ouuLyPkzWznEBn2c/NAwcAa+b+iOhVQLpoZs8yv9bjHm
         CrvFy1ZTLcebBZ2O6QH4Ba+gRfe5nz0baSIlP73SXdrTh/0vYwNkuDXjbhG3HkxWbfD5
         LdqRTzTohefmZ8/ZjYHMEYCvuNcXZmgO4YOU5NqYFDkAuzzUJXhlh+Qe+fQJIcpI2bdk
         5M5UsHu69gagNGPljQI1np2Sgu6PE4CNitsXi5r5AwRWB249N6NFUpxjz+aIPV5DkM3e
         zGSHUIiyjgQKRCKKfrpjFuAVM59aM6RF6ncUQIIr6mUsXubGvAku2FthQwA37UjNoYwo
         t2Uw==
X-Forwarded-Encrypted: i=1; AL+hErEuwrm+DMAz9PQh2SXvn2ZpnP9aDkmyv3fMYPq5actlXu4nt4VQqiCx2YuFz8qFaSyLObaC1gVv/U8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9k13jQtnhWAeSoxIp30ouhI2SW9VJ3kVtwPtVxz5LBmPUm5fOT
	/ieSoJIP90SD0QOTaEMU6+7OhvwP1ChX2E8NAyPKxXPBkVA+Hxzmbf7l
X-Gm-Gg: AYBFou3/U+nnZrV2gSHVei6k/D4vFN5bxe/SZ3YIHypBTqLjg9M6Lo6csEzfWMq8Fmw
	CJTYxYpg/poJcO97KYzZTDzRTQzkV7KeJwtoDFP87LdAAxYd7RrFKEVWkIcSsRZFog39cWXdDTc
	yYgiq34buITO4gkljBEWUf5HBlTbdCRSm5atMHXvzKsIanspYyiQNpXqAiW37DjdBaNrTCLmH9y
	Xg8RU0dBemn9hdxY0xSAULlv4SRkPJWTTiVYeomaSuFhvi1i8Zcf34HqVSQKnwrm3BqyeXCaGmm
	uycQ8zo4xVEaNe43q5ocZ/H6uvO8G+KTuJ1TNT1An6SqcC3K0tG66CCB/AoG0fzSnrCquxFHAqG
	WP9vHOng90SLCY1eqK68+hKy0QvdruhAeZlb2lYQXTAbxN/9ZZLctoG0IZGydZH4qN6LvLttb7G
	Z9FUcY8X3ccA55rJ/L92EkFualR6A7IIZWaRqN/7e3zkRNRAK+/DaudcLw/ZbSRVSnXfwa8eGkZ
	RodUQU7hNfLA4woOgPv/0PnmFy0gij8mDYKEjwvT+44oPNRBS5pF/7c4q9ptNEN1BeSBQfJvOtL
	wg+cIrPC/Q84XQAGn24osHxIA5DJUco=
X-Received: by 2002:a17:90b:3808:b0:3ac:b2e6:317d with SMTP id 98e67ed59e1d1-3b166fa2a9dmr2789894a91.35.1794316627523;
        Tue, 10 Nov 2026 05:17:07 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:17:07 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Frank Li <Frank.Li@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	linux-tegra@vger.kernel.org
Subject: [PATCH v4 22/33] dmaengine: tegra20-apb: use channel BH helpers
Date: Tue, 10 Nov 2026 05:13:22 -0800
Message-ID: <23ec6d1f25c7715939ee1d00984645028f33ddca.1794315350.git.allen.lkml@gmail.com>
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

Switch the per-channel tasklet to dmaengine_*_bh so completion handling
runs through the shared per-channel deferral mechanism.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/tegra20-apb-dma.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index 7ff8c0241f61..2eca4a2567cb 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -194,9 +194,8 @@ struct tegra_dma_channel {
 	struct list_head	free_dma_desc;
 	struct list_head	cb_desc;
 
-	/* ISR handler and tasklet for bottom half of isr handling */
+	/* ISR handler for bottom-half processing */
 	dma_isr_handler		isr_handler;
-	struct tasklet_struct	tasklet;
 
 	/* Channel-slave specific configuration */
 	unsigned int slave_id;
@@ -632,9 +631,10 @@ static void handle_cont_sngl_cycle_dma_done(struct tegra_dma_channel *tdc,
 	}
 }
 
-static void tegra_dma_tasklet(struct tasklet_struct *t)
+static void tegra_dma_tasklet(struct dma_chan *chan)
 {
-	struct tegra_dma_channel *tdc = from_tasklet(tdc, t, tasklet);
+	struct tegra_dma_channel *tdc = container_of(chan, struct tegra_dma_channel,
+						     dma_chan);
 	struct dmaengine_desc_callback cb;
 	struct tegra_dma_desc *dma_desc;
 	unsigned int cb_count;
@@ -670,7 +670,7 @@ static irqreturn_t tegra_dma_isr(int irq, void *dev_id)
 	if (status & TEGRA_APBDMA_STATUS_ISE_EOC) {
 		tdc_write(tdc, TEGRA_APBDMA_CHAN_STATUS, status);
 		tdc->isr_handler(tdc, false);
-		tasklet_schedule(&tdc->tasklet);
+		dmaengine_schedule_bh(&tdc->dma_chan);
 		wake_up_all(&tdc->wq);
 		spin_unlock(&tdc->lock);
 		return IRQ_HANDLED;
@@ -819,7 +819,7 @@ static void tegra_dma_synchronize(struct dma_chan *dc)
 	 */
 	wait_event(tdc->wq, tegra_dma_eoc_interrupt_deasserted(tdc));
 
-	tasklet_kill(&tdc->tasklet);
+	dmaengine_kill_bh(&tdc->dma_chan);
 
 	pm_runtime_put(tdc->tdma->dev);
 }
@@ -1317,7 +1317,7 @@ static void tegra_dma_free_chan_resources(struct dma_chan *dc)
 	dev_dbg(tdc2dev(tdc), "Freeing channel %d\n", tdc->id);
 
 	tegra_dma_terminate_all(dc);
-	tasklet_kill(&tdc->tasklet);
+	dmaengine_kill_bh(&tdc->dma_chan);
 
 	list_splice_init(&tdc->pending_sg_req, &sg_req_list);
 	list_splice_init(&tdc->free_sg_req, &sg_req_list);
@@ -1511,7 +1511,7 @@ static int tegra_dma_probe(struct platform_device *pdev)
 		tdc->id = i;
 		tdc->slave_id = TEGRA_APBDMA_SLAVE_ID_INVALID;
 
-		tasklet_setup(&tdc->tasklet, tegra_dma_tasklet);
+		dmaengine_init_bh(&tdc->dma_chan, tegra_dma_tasklet);
 		spin_lock_init(&tdc->lock);
 		init_waitqueue_head(&tdc->wq);
 
@@ -1617,7 +1617,7 @@ static int __maybe_unused tegra_dma_dev_suspend(struct device *dev)
 	for (i = 0; i < tdma->chip_data->nr_channels; i++) {
 		struct tegra_dma_channel *tdc = &tdma->channels[i];
 
-		tasklet_kill(&tdc->tasklet);
+		dmaengine_kill_bh(&tdc->dma_chan);
 
 		spin_lock_irqsave(&tdc->lock, flags);
 		busy = tdc->busy;
-- 
2.43.0

