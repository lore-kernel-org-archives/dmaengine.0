Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C07143634B
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 18:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786385625; cv=none; b=mw4k2fzeDS2tcZCzdj0ou4VLrbBaZPYNYwjZrUEeqK+7JQWvxQpDvcdCN654iX0Xkk4bGTBJjBRlj2ur+P4ld6idxMKwRAshmjzhogW3Gv4HOQTdkK9OXZn0kDnlJqtS3SfgZSrYlBIRb3K4kG9J4C9I3RgRHUq6ARlKI1kwBz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786385625; c=relaxed/simple;
	bh=0Eb8GRKvMJHasoh02hWFih058UEYzEaV5ZwlBwnYodA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JF7vl3w9deUY6fWszNYocxNrLR56AOW3627FnItmwxDAyRRqWHKYLyY5pmNN607bCzRnWs8hf0YHSxWfDc0PMnuP8S6qjjZdwkrK6BvvxOJSXtWHzAW8XwbdZeHORrnqmvNNnQ9fcnpKuT8m3XGpMfjf5l0Z0iKOKtGEIlNYht4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G6gQg008; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G6gQg008"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso2827500a91.2
        for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 11:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786385624; x=1786990424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CwhhaAGdCkcDIiyyyywufIBhF9Feu3uUwtXlOqQT0nU=;
        b=G6gQg008M+lMrX8Dw493FoxwK4Mygi9p2lRudqQFKpeo0nZUCzrBeQeTM6YoduEJ1j
         DuuUvelujl3MXjd4LW+C+V0q0PDIRqm/UVylvIKomn3LubWg+RIxcTx3JYOyOb4vLdFI
         2MYs10r0B7U6+bwznivU+9kyhIrMaKf5wLqELXUR/bZkle4zy2J+kokPdBati1Mm4Dli
         Y++oHEsBBCxNpvF1bCdLxxHBz7QaYVPqwiyxg3E2hxrNBiYMM7X+UUPGL7dIZ+2QEr4E
         4HkgEY2BnAVPPg/nFTIJSOGM2Y2DU2MscqoQtEN8+U0sR0AYSLlT9i2P0QQnTUWbvDDj
         9iuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786385624; x=1786990424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CwhhaAGdCkcDIiyyyywufIBhF9Feu3uUwtXlOqQT0nU=;
        b=V4cE7JRm0iEjpWwlSKJNiS/okK/l2gYt0aDj3F8I3U76P+YZiWD6BhwynKYeHU8z3x
         AGXA0UIWbqEFe9ZkwRhD9Qj5GadQK8RuZXuc7q4PAVnDM7NHxZ1bxAyRcJdbY6KJGm89
         +FTF6clFq0qqadeoBsLT+vWOMtnFZ+S6sbx4cQex27tL39hIGdWCvkTVM86nLQoliBT4
         VkfBU5gy7iL9AED/eeekewqOvUIGxg7G6c2Yw2c9xufhkSH/0Wp5TEaIfmJS4buP5O3C
         TXY+sOu8JZB9YvHYo6Nmp2qx8tdgs7Wq1haDPnXFt+nF5KtOfBeBZXMmB4oXJFIIfJTc
         EeHQ==
X-Forwarded-Encrypted: i=1; AHgh+Roh3P/qjA662HAKXiAhEV0FhwxVSuugM6Dg8mS4/88draq3mjvOnToLRX2yl6MJGzdXmhrUsnwTx+A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx1Bkz9YGCL/kDixd0Q2DokH8tXp1ha7/DzlHlGJzpu72soCyJ
	zGu4IYkd4NIjCTaBjQCxu31ikPcm9UN8/AJgEPdCdtykx99cE2A742k3
X-Gm-Gg: AR+sD10YXqHSaAfq7ZgkSRsKIRB4dxO7MSk/rygzry0F7FevBGcZcMJ+sFaRFDL793s
	lXCBJMknGtOAvdsvTV+11qS4yVV+Y34oZ31IDEEjxR4mGIGrn7zR35F1xBNAm/fappzoW7E4FIn
	LHSQqxi0WHRKPDrlKEPnRQn4lAJ7rbZctUidaZ84xdmSTPpBM5bI25B0v2O3x3BvmHQuCywJUwu
	5DFPc/1GYEVZUICnUSjs9igW2iyGTQJxF1KTELqT40KcZtcXYFe6RhhGlFjlaXJjRRmk09puYR1
	4qN/XkHuRh4vunMSW2tGr2GEkFpPXL9mXIXsL4/7t/wCziafdgc8D20XdGj8IJZmPzZeVK2NUVs
	lg3jTZW9n92Mq3aJCHocTqSDwiKemT5TWJ3/rwV5q4MrCEi6aewJWS03lk2CIXen8ULMQ73XXvw
	znyMNhf6yBA4UopjhPw/BtvGDHiJRiaaFV5ZDtwXY5VYAco3ZnTpppBu4Nm+hS3s8=
X-Received: by 2002:a17:90b:288d:b0:38f:26c7:165e with SMTP id 98e67ed59e1d1-39261ff3945mr30245873a91.9.1786385623771;
        Mon, 10 Aug 2026 11:13:43 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fa9:fa00:b1a9:6513:83c6:1d23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d53b873asm472795a91.17.2026.08.10.11.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 11:13:43 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Logan Gunthorpe <logang@deltatee.com>,
	Kelvin Cao <kelvin.cao@microchip.com>
Subject: [PATCH v3 34/34] dmaengine: switchtec: use channel BH helpers
Date: Mon, 10 Aug 2026 11:09:35 -0700
Message-ID: <c91231fb254131d62306600a19d8f97231b3158f.1786384169.git.allen.lkml@gmail.com>
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

Replace the per-channel descriptor completion tasklet with the shared
dmaengine BH helpers. Client callbacks remain in softirq context while
using the common scheduling and teardown mechanism.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
Reviewed-by: Logan Gunthorpe <logang@deltatee.com>
---
 drivers/dma/switchtec_dma.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/switchtec_dma.c b/drivers/dma/switchtec_dma.c
index 71d9868ce613..849f1f2f8105 100644
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
 
+	dmaengine_kill_bh(chan);
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
+		dmaengine_schedule_bh(&swdma_chan->dma_chan);
 
 	return IRQ_HANDLED;
 }
@@ -1041,6 +1041,7 @@ static void switchtec_dma_free_chan_resources(struct dma_chan *chan)
 	spin_unlock_bh(&swdma_chan->complete_lock);
 
 	switchtec_dma_chan_stop(swdma_chan);
+	dmaengine_kill_bh(chan);
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
+	dmaengine_init_bh(chan, switchtec_dma_desc_task);
 
 	list_add_tail(&chan->device_node, &dma->channels);
 
@@ -1138,7 +1138,7 @@ static int switchtec_dma_chan_free(struct pci_dev *pdev,
 	spin_unlock_bh(&swdma_chan->complete_lock);
 
 	pci_free_irq(pdev, swdma_chan->irq, swdma_chan);
-	tasklet_kill(&swdma_chan->desc_task);
+	dmaengine_kill_bh(&swdma_chan->dma_chan);
 
 	switchtec_dma_chan_stop(swdma_chan);
 
-- 
2.43.0

