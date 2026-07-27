Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A122B3D9DD8
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184800; cv=none; b=fOc26YY3xYrHvU64Xw5XUSWO52Z4VOZ3leZdluHlD+4ojVMmk2C5P1XGmot5P1ftXvh5WhgRJE29iU9huaRPvqQXsOcTSAi8l+X8I8xEIVW/KyW9HwsaY5dblsbY9W6JunWZ3Lj2MMdvJBd7fJ20CwdH1i1udiHsyuwgMn6k2kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184800; c=relaxed/simple;
	bh=G6/IJHg9ZfawuIhfMl16xfedAJ/VcZRm//94paOs4Pk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AB1FZulqOVolMxMZZUNoKcVw+szEUILmZTCFuoy1RC0strKK0SZE6NXPiaN4UMPJFoxvBum5VS7NV1f4ojZOq5YIsQeIiiVZAUi4dUsvvNjTaQt1yxddNUCfE4LE0NsoJMzZbFDwjqHa1Jiuu+z0QctlDT0CJDbswdB2ATzcqXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rHDiVath; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rHDiVath"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-848593533cbso2272365b3a.3
        for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 13:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184798; x=1785789598; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YDT8AeYU1cj6+14UCdg7b6IhlALSVP8OOPhCYBI4fqM=;
        b=rHDiVath01YJZWEO1lvb750p+2ugtTqVJDYBRQNdC1QSyI5XQ5MKgEUG+PgGE3rWD3
         qQGx6BfNP4uRVKoJuKFfzudfKqEBEM1VFzkNTVIMw5Ts5HXwPN5qgbFljdzHuOfdg3/v
         owHKe0MpVHKCKhzOBDxo8rc/5gbXE5w9/a2TSEgAwuntmu8P7zg5CnOqqb3rqPG5+XEI
         hQricWgEfOLTXfzIDi5UZuEjBk6/SaGEVV5YmbDtilR6Rn9H8OaCgLtzunrc2eFLBBBc
         fB5Riz9h5/6jkJYcXPRLiOdBc9/YoCFnt4QeAFwrjxngknC/kvYkqhHqosGMjuAE3NHr
         jsUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184798; x=1785789598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YDT8AeYU1cj6+14UCdg7b6IhlALSVP8OOPhCYBI4fqM=;
        b=LxLRaXNfoSQYsio+hfHKI719PRivh9wxOf4IQo6XuPqs9um06R95pOB1AAGBwLrYdr
         mspWV6D/t4Ve80xP2kQUl1eqx8U7gZtI7/U71pajWQEftrqZyxrcDPHVOrNE+Hd+NUJ3
         wSFyk+MD0M4IJwfk99HpKHn54eEEHa119TJAwP6gYGAIN3/fpzOSp7AaeXzvGIxgtM9D
         7LwFvBmQV2BgS16bYdR1T8qUj/AZra0eWOJv+72XgwsGIkolRDDLIpFlxPtMGFu60svm
         gerUqxp5Dd7g8ujTDbJTs96PjQgFTVka8FT9cekQNDwfJ+Ej/f8fiQ0L2mCvlS0DZ8i3
         chBg==
X-Forwarded-Encrypted: i=1; AHgh+RrLFEB89wss83K/CDk+ile6cg6OqKvRydAELOetT72axz4gFeNZAtPdSfH7ZFcpk0qQIlZ8Mrt4khU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3i+nZeXz1HZsSCoqfYtr8i6pHYgkDEg9Irk2kXNL5CcKMt9E7
	ErK8Dd3ohcWCEmczCXkRHeb/FCrPrRRHEfIkPIIurCgHN88J5yuzTk1i
X-Gm-Gg: AR+sD12iB7R2qcKjg5Cv6YOzDHFoTMXhZRmZkwqTmITlDMpNPqRhvdxn+I3M+E7NTJF
	a9OynFw1opopA6C9i3izxPB4pP0FKNhsIilnRdaBTWPgrlDYLsICf8V5vfvFKl1LiSqfYr+NX4N
	tkCJYuj0fbP2Naj/VZcsd27+ridRLJSHx+T2vHTdrqJdgFdFeHIvanKwBcRONQUL4SEpPVt0NJO
	dHEaVotnMRs2R3A16eoJ1ZgG+PUxHkEEIAOO4DcthK+/3wxp6AXruFdn7LVBxM68/7pjJ9lVGbm
	891cHt+RmLY6ND1JxPj9rUlImNYaH7yEKUqwOfPu+WQvo8MXM6xNujM9b9bibsMefcFWTNqWpLN
	YAphfCSzPxvrRPTjLUOFDxt6EdxbioMwczwnWa/ZAAyKZxogwkYml3Jyte1HrxisoqrcfIdjkrM
	0M3wa3
X-Received: by 2002:a05:6a00:1a8a:b0:846:7507:4e07 with SMTP id d2e1a72fcca58-84e8d36e6d4mr793252b3a.39.1785184797919;
        Mon, 27 Jul 2026 13:39:57 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e533d1351sm3583338b3a.39.2026.07.27.13.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:39:57 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Olivier Dautricourt <olivierdautricourt@gmail.com>,
	Stefan Roese <sr@denx.de>
Subject: [PATCH v2 35/64] dmaengine: altera-msgdma: use channel BH helpers
Date: Mon, 27 Jul 2026 13:38:57 -0700
Message-ID: <b32241f06e946fd7bf92a4f2baccd23396db630b.1785183549.git.allen.lkml@gmail.com>
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

Replace the device tasklet with the per-channel BH helper so completion
handling runs via dma_chan_*_bh.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/altera-msgdma.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/altera-msgdma.c b/drivers/dma/altera-msgdma.c
index e23e5b441a24..5969bbc84ab9 100644
--- a/drivers/dma/altera-msgdma.c
+++ b/drivers/dma/altera-msgdma.c
@@ -170,7 +170,6 @@ struct msgdma_sw_desc {
 struct msgdma_device {
 	spinlock_t lock;
 	struct device *dev;
-	struct tasklet_struct irq_tasklet;
 	struct list_head pending_list;
 	struct list_head free_list;
 	struct list_head active_list;
@@ -684,11 +683,12 @@ static int msgdma_alloc_chan_resources(struct dma_chan *dchan)
 
 /**
  * msgdma_tasklet - Schedule completion tasklet
- * @t: Pointer to the Altera sSGDMA channel structure
+ * @chan: Pointer to the Altera sSGDMA channel structure
  */
-static void msgdma_tasklet(struct tasklet_struct *t)
+static void msgdma_tasklet(struct dma_chan *chan)
 {
-	struct msgdma_device *mdev = from_tasklet(mdev, t, irq_tasklet);
+	struct msgdma_device *mdev = container_of(chan, struct msgdma_device,
+						  dmachan);
 	u32 count;
 	u32 __maybe_unused size;
 	u32 __maybe_unused status;
@@ -748,7 +748,7 @@ static irqreturn_t msgdma_irq_handler(int irq, void *data)
 		spin_unlock(&mdev->lock);
 	}
 
-	tasklet_schedule(&mdev->irq_tasklet);
+	dma_chan_schedule_bh(&mdev->dmachan);
 
 	/* Clear interrupt in mSGDMA controller */
 	iowrite32(MSGDMA_CSR_STAT_IRQ, mdev->csr + MSGDMA_CSR_STATUS);
@@ -766,7 +766,7 @@ static void msgdma_dev_remove(struct msgdma_device *mdev)
 		return;
 
 	devm_free_irq(mdev->dev, mdev->irq, mdev);
-	tasklet_kill(&mdev->irq_tasklet);
+	dma_chan_kill_bh(&mdev->dmachan);
 	list_del(&mdev->dmachan.device_node);
 }
 
@@ -852,7 +852,7 @@ static int msgdma_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	tasklet_setup(&mdev->irq_tasklet, msgdma_tasklet);
+	dma_chan_init_bh(&mdev->dmachan, msgdma_tasklet);
 
 	dma_cookie_init(&mdev->dmachan);
 
-- 
2.43.0

