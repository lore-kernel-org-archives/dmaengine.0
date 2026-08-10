Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBD0306B3B
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 18:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786385549; cv=none; b=Pimd5WzRzbG9IsDJE3zjj+gq3XLgqJL3i1AZZ6x4XaxPN2VRwMfVd+swxzdY1MUmUcZSSeaArAgdiLUkzZazkXQO2hlbUEXAwspMVse+xMJwcm0f/h20MLYxSwZqeQPZF5x44xcCYVoOzsa0MpvV5NCCxH99VbGPRD99pnf5IeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786385549; c=relaxed/simple;
	bh=pENuedcacRmz3eveVQ0ur5/dSuhphtm9HwZx70Dq/ko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I3eloEuRJDcmGdqFameemSu+Z+JM4uGnTDW6QZkIFCSQPn44RSGLb9JYFx11JCy3fyvnYGRGSyUQ15dDsE3KVPTdtiKHcRN5npBweVxTFEZdj2iU+cjXXfn8R7z7dVtErmCbD8cSpAIs26tp67U+Wn2VNspzTcnJwsIZvd/RljE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l4EwdvTU; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l4EwdvTU"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so27585a91.0
        for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 11:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786385548; x=1786990348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RKITIRCt5MQ0SXKJ60mBhkacHyjlhp0Jg3BxwJ4h1sA=;
        b=l4EwdvTUS1Vr6qKxOhdlH1VMgxmhHlaotmU+s+q4JrZwT7c+RnEDuHUiajNSej/HiJ
         Vfa4bf0Xwx0mPp9rJrVjZAxKXHfqzOR6MfE58R4BOlOW5LsQxxEoeTsEItiQSN+uyeYD
         qd400Zn/z/SB3u3pkmupaK+YdZym4qZ0wY0VrJFdEUnty1Nomc60GzJ0C8MQCQXvACZL
         5jLPooqGxd7PPUh/yO4WTnjZQ+tW7CgKsUZW7C4qASoZdL7hT2aRMyPXhAJdwSDrtSgc
         +Fr+q7ALThlbvrJlzyeU80FqicR+JxBRudVXl8GimGfS496O9Y5lp5KD8vvJBY7HUH0K
         y+SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786385548; x=1786990348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RKITIRCt5MQ0SXKJ60mBhkacHyjlhp0Jg3BxwJ4h1sA=;
        b=FK+wEy52yeNlvju8rE2kBPG/RXmtBtIjOS/JpAkaBVfowkj+Tkly5/Sr8at4MXWabD
         Zn97Z9j2Ymo4g11/QNXw4ZYKGMAqXBPAeT77TFqCx5uoYq6xRDfck/b429lyRIwI+ruL
         oR9e4/nKVDlEig+qVG0aAKVB86hjc3Tq0++oixSbWh8UYodO3sEmQ0K1xicrR9eLX8h7
         mqsQjBYDTXlH1NYGfkzh3lOs3HyYkgaT0H0Z5dGnBtZWl2NnuDRDsRboxLqQjmS7lHCB
         sdU70T9r0Hea3c9fZZPD8XRx/8EjoCUP6HrUFW3w7POpSwVvooUcQQClTifdhTOcgs6J
         QSuA==
X-Forwarded-Encrypted: i=1; AHgh+RpUFlSyVZyBvHtV5DO9xBrgzopn1fdDcKph3I8gYtqiXS80ldIeRrpLnJmgPp/RX4qxMeR51o7Cp6U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1g9DDHPJt6te+UIZemQFaFz7d3aelFoBeD7W2QJpFpptIqwEc
	JEVF0imqDHktxefugBQoKQf/8uaTf6rv7VWPsguw5ehEDzNaG6w79/Js
X-Gm-Gg: AR+sD13zC3Z4Qm0nUzB/vldLIonQwPGwkEtcAdQDYB/4F35gSqe6gmdE22wpelz67DC
	i/QpRpT2EGWPjxRrP7pOqSNI1O9VFZoOc1QL4p9HZnz2+imEMxTX/WAQZx6UI8Nk6mV5jHpFlKA
	fyQtnrqzZgC+UbqtkZLWgzoEHXz/TX23RvfKKrh8wfzjUhkaDbPOmpV/xvXuWAWKxR0R5ubZN/E
	aVNZE8efpc2gZd9KF707WyLywqDfg6+gLcj7j7gqlfm4TclrbP0DRqmrNLmMQibzaX1uekR7KR8
	1mNjKFmszm07A5OkJijiQGPy6DpjhptMimbeB9jo+I9ubRSc3ooAVvjj6aVzroiicM0GG9k7JTZ
	iFESncxYwxTGDtKP/d5cM8bkeGSIYMzNvAZUo2HIfB7Hg2x+WmYt45TvAOTPAfM8NUuDAfW5fK0
	nrPuUgSQgUWdzM1aPghTKHzE6HcfTBY9/8Xjw8W6XFGKeoA2T7I3Yr84OrcWdfEOk=
X-Received: by 2002:a17:90b:4d8c:b0:381:6c5:3f63 with SMTP id 98e67ed59e1d1-3903c544f17mr39654241a91.6.1786385547524;
        Mon, 10 Aug 2026 11:12:27 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fa9:fa00:b1a9:6513:83c6:1d23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d53b873asm472795a91.17.2026.08.10.11.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 11:12:27 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Colin Ian King <colin.i.king@gmail.com>
Subject: [PATCH v3 16/34] dmaengine: ppc4xx: replace irq tasklet with dmaengine BH
Date: Mon, 10 Aug 2026 11:09:17 -0700
Message-ID: <476a24b72cd4aa6bf62b120fc80965830616331c.1786384168.git.allen.lkml@gmail.com>
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
---
 drivers/dma/ppc4xx/adma.c | 14 +++++++-------
 drivers/dma/ppc4xx/adma.h |  2 --
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/dma/ppc4xx/adma.c b/drivers/dma/ppc4xx/adma.c
index 279a431ccae3..bc10c2b5dd12 100644
--- a/drivers/dma/ppc4xx/adma.c
+++ b/drivers/dma/ppc4xx/adma.c
@@ -1658,9 +1658,9 @@ static void __ppc440spe_adma_slot_cleanup(struct ppc440spe_adma_chan *chan)
 /**
  * ppc440spe_adma_tasklet - clean up watch-dog initiator
  */
-static void ppc440spe_adma_tasklet(struct tasklet_struct *t)
+static void ppc440spe_adma_tasklet(struct dma_chan *c)
 {
-	struct ppc440spe_adma_chan *chan = from_tasklet(chan, t, irq_tasklet);
+	struct ppc440spe_adma_chan *chan = to_ppc440spe_adma_chan(c);
 
 	spin_lock_nested(&chan->lock, SINGLE_DEPTH_NESTING);
 	__ppc440spe_adma_slot_cleanup(chan);
@@ -1754,7 +1754,7 @@ static struct ppc440spe_adma_desc_slot *ppc440spe_adma_alloc_slots(
 		goto retry;
 
 	/* try to free some slots if the allocation fails */
-	tasklet_schedule(&chan->irq_tasklet);
+	dmaengine_schedule_bh(&chan->common);
 	return NULL;
 }
 
@@ -3595,7 +3595,7 @@ static irqreturn_t ppc440spe_adma_eot_handler(int irq, void *data)
 	dev_dbg(chan->device->common.dev,
 		"ppc440spe adma%d: %s\n", chan->device->id, __func__);
 
-	tasklet_schedule(&chan->irq_tasklet);
+	dmaengine_schedule_bh(&chan->common);
 	ppc440spe_adma_device_clear_eot_status(chan);
 
 	return IRQ_HANDLED;
@@ -3612,7 +3612,7 @@ static irqreturn_t ppc440spe_adma_err_handler(int irq, void *data)
 	dev_dbg(chan->device->common.dev,
 		"ppc440spe adma%d: %s\n", chan->device->id, __func__);
 
-	tasklet_schedule(&chan->irq_tasklet);
+	dmaengine_schedule_bh(&chan->common);
 	ppc440spe_adma_device_clear_eot_status(chan);
 
 	return IRQ_HANDLED;
@@ -4137,7 +4137,7 @@ static int ppc440spe_adma_probe(struct platform_device *ofdev)
 	chan->common.device = &adev->common;
 	dma_cookie_init(&chan->common);
 	list_add_tail(&chan->common.device_node, &adev->common.channels);
-	tasklet_setup(&chan->irq_tasklet, ppc440spe_adma_tasklet);
+	dmaengine_init_bh(&chan->common, ppc440spe_adma_tasklet);
 
 	/* allocate and map helper pages for async validation or
 	 * async_mult/async_sum_product operations on DMA0/1.
@@ -4247,7 +4247,7 @@ static void ppc440spe_adma_remove(struct platform_device *ofdev)
 				 device_node) {
 		ppc440spe_chan = to_ppc440spe_adma_chan(chan);
 		ppc440spe_adma_release_irqs(adev, ppc440spe_chan);
-		tasklet_kill(&ppc440spe_chan->irq_tasklet);
+		dmaengine_kill_bh(&ppc440spe_chan->common);
 		if (adev->id != PPC440SPE_XOR_ID) {
 			dma_unmap_page(&ofdev->dev, ppc440spe_chan->pdest,
 					PAGE_SIZE, DMA_BIDIRECTIONAL);
diff --git a/drivers/dma/ppc4xx/adma.h b/drivers/dma/ppc4xx/adma.h
index f8a5d7c1fb40..9af1feaf0b9a 100644
--- a/drivers/dma/ppc4xx/adma.h
+++ b/drivers/dma/ppc4xx/adma.h
@@ -80,7 +80,6 @@ struct ppc440spe_adma_device {
  * @pending: allows batching of hardware operations
  * @slots_allocated: records the actual size of the descriptor slot pool
  * @hw_chain_inited: h/w descriptor chain initialization flag
- * @irq_tasklet: bottom half where ppc440spe_adma_slot_cleanup runs
  * @needs_unmap: if buffers should not be unmapped upon final processing
  * @pdest_page: P destination page for async validate operation
  * @qdest_page: Q destination page for async validate operation
@@ -97,7 +96,6 @@ struct ppc440spe_adma_chan {
 	int pending;
 	int slots_allocated;
 	int hw_chain_inited;
-	struct tasklet_struct irq_tasklet;
 	u8 needs_unmap;
 	struct page *pdest_page;
 	struct page *qdest_page;
-- 
2.43.0

