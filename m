Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944794248AC
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184302; cv=none; b=iwdC1fQQSNWaOiAXdYVtex1IAeh9ZTzhdBj91IPbcf/+04sJ8RoXgOOXWKjxDTPWDQKGta66v83udF75fGmPBUl7blPeZAi7FV+dsM2DkFoowEomvgXTmI9t5qSthH2e/YaN+dKHhsWY0M5mnUA5+LKAUcSW22fyU6v/oReHKNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184302; c=relaxed/simple;
	bh=8lt0NO742wDRRwsIxyXXxI1ttL6X+ST6+dwV/qIBSeg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rJyWKvON8uhIQfO3ERovdeWhKCaHVb4LCbqptmmWEpQpJqvbZLRLsWG04LDKQkI3jnrEsIj/4WshXKzPVLHMxIzYviLt4pjVv1dt7BHNUy+FNvCBPtHoxDcJ+WcpzFj0DjhR/y9o2m9cW+Z5d5AXj11LkuqZdC5W9PoH39EzOiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mzp0Me8Z; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mzp0Me8Z"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ccf2360620so29542235ad.3
        for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 13:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184301; x=1785789101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zvdv5sKttbh8e355tGZFShHXAV1Cowe87JjqoNvTFS8=;
        b=mzp0Me8ZUBQAw0rxShKf9dki6nLwd+qmFMucve88F0dHZr0x/HV+ybo1ypguEp3HRA
         mzyBdJmDtY/Sfu5zARXxatNm3C1k3vP8vHhjk6iHG+JIKAy28tOTlH07ckAB1ycdmwXu
         nXZ6UbOOYtjEz2WHnKvI4tzIcfY9wy4QItHJdY0V2L2ISQFAkYCPNjxrKGOoB/WHjdpv
         Qh0qsYJoaGLRZEUVqilQWqo7DL21wXe7HCYLcZxmb/L/0ssQPPZ9jPCb2DSNXKGHYqUD
         B01Azt6VXTSg1sGv7/hSG46WYdZ1MpZai0hF6QALDENd4xUU5YnOBYvY8W0jcUKlTey6
         WdHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184301; x=1785789101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zvdv5sKttbh8e355tGZFShHXAV1Cowe87JjqoNvTFS8=;
        b=Ze2a12j5IcBscNPrhxl85geK8esyURSNGQNZ7LR9beR7Hms0MHPChVBfnxVsEYQExW
         FfkiFjbpJX5lEyhoj6pMlFfIypFP5lQx5TPfD72rXLftD5JiRwQNDMswYqdruE5q1EFI
         QzJGMEmyqsyC0bJy5FVs+qiSDm3KpXwtOkF4Te0vLHTdcsCNHLAaDvlmMGA1cONrAOQ/
         cIiHcrrRAiDTT2mUvliMowEqWlQBVtx7wW7GneZaBVpyprhTQw96Lbtl/B8Igg4NrRLO
         wc93JruZX882jNHe+3qrY7QUgbgIhPp0ZBXKJiN1lqcgMuCa83AGpJuB0BNyIncltQ1Y
         jy+w==
X-Forwarded-Encrypted: i=1; AHgh+RqUVbViGwREj3awNFkYzmxNFTj+Vv8fnFALi4GswE6bm6n8MRAiVYXpa2mLuossItQlJBMnZuUpnbc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsnvgmNQyAwcaEPkuYQMh5r8nXkwY6fMse/uZGNpstHdVWEnRJ
	Bwj65X9IskyiuLe0iJPNY3wCRhHjK0EYKen8H9lOqBRVa0AtIllsZmEE
X-Gm-Gg: AR+sD11pCc7K+/+O/rq/nLuJMMFJcpWDbJD4iSY+aEOQb8H+EvOV6WOnoer8gLPE/0T
	2/wqgLbjbiW5WzYjpzSESpSj0QsVylWLLCULilWiYGNx0YQIfZzm8e9fXh8nXA5Ysq9yeh9pQnG
	Pp4o/vQhR4vBMI9mMx1/2qF7YYqiUlMAg4brxcdIK36cpzFOGvPbA670n4sIsUwDKj0e/UTMZc9
	RQOojKYNOMuLFn2vohk0A/Xf8Er58KjW8Xz1+VkvJxafsRO+boVLx8+V21mv7pTm/pfR2zUhBpU
	Fu8RNf52ilh0RYx/Aqq2kNr/MHLKKb8zJuGr2cLgiQjyklML9L7/qSN/Cu+hqa6VMlehafnzc4p
	1s43jmGZxhi5N+ZxaF5t0Wm3EV6pyejWxACN99huxwdVrvhFUCVXa9EzVOO3EJpkYqvCyJzN2Kk
	+fIqwK
X-Received: by 2002:a17:902:f607:b0:2c2:cf20:213 with SMTP id d9443c01a7336-2cfde84581bmr86892115ad.29.1785184300927;
        Mon, 27 Jul 2026 13:31:40 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde59b768sm41551805ad.4.2026.07.27.13.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:31:39 -0700 (PDT)
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
	David Matlack <dmatlack@google.com>,
	Lukas Wunner <lukas@wunner.de>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>
Subject: [PATCH v2 09/64] dmaengine: ioat: convert cleanup tasklet to dma_chan BH
Date: Mon, 27 Jul 2026 13:28:37 -0700
Message-ID: <325f449ad6fca109ec1e8c34e4e12c1952272a8f.1785183549.git.allen.lkml@gmail.com>
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

Replace the per-channel tasklet with the shared dma_chan BH helper.
The handler continues to run in softirq context while dmaengine owns
the common scheduling and teardown mechanism.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/ioat/dma.c  | 14 +++++++-------
 drivers/dma/ioat/dma.h  |  3 +--
 drivers/dma/ioat/init.c |  2 +-
 3 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/dma/ioat/dma.c b/drivers/dma/ioat/dma.c
index ee93b029f9e3..827b46c6354a 100644
--- a/drivers/dma/ioat/dma.c
+++ b/drivers/dma/ioat/dma.c
@@ -110,7 +110,7 @@ irqreturn_t ioat_dma_do_interrupt(int irq, void *data)
 	for_each_set_bit(bit, &attnstatus, BITS_PER_LONG) {
 		ioat_chan = ioat_chan_by_index(instance, bit);
 		if (test_bit(IOAT_RUN, &ioat_chan->state))
-			tasklet_schedule(&ioat_chan->cleanup_task);
+			dma_chan_schedule_bh(&ioat_chan->dma_chan);
 	}
 
 	writeb(intrctrl, instance->reg_base + IOAT_INTRCTRL_OFFSET);
@@ -127,7 +127,7 @@ irqreturn_t ioat_dma_do_interrupt_msix(int irq, void *data)
 	struct ioatdma_chan *ioat_chan = data;
 
 	if (test_bit(IOAT_RUN, &ioat_chan->state))
-		tasklet_schedule(&ioat_chan->cleanup_task);
+		dma_chan_schedule_bh(&ioat_chan->dma_chan);
 
 	return IRQ_HANDLED;
 }
@@ -161,11 +161,11 @@ void ioat_stop(struct ioatdma_chan *ioat_chan)
 	/* flush inflight timers */
 	timer_delete_sync(&ioat_chan->timer);
 
-	/* flush inflight tasklet runs */
-	tasklet_kill(&ioat_chan->cleanup_task);
+	/* flush inflight BH runs */
+	dma_chan_kill_bh(&ioat_chan->dma_chan);
 
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
index 737496391109..314676e1cbc4 100644
--- a/drivers/dma/ioat/init.c
+++ b/drivers/dma/ioat/init.c
@@ -765,7 +765,7 @@ ioat_init_channel(struct ioatdma_device *ioat_dma,
 	list_add_tail(&ioat_chan->dma_chan.device_node, &dma->channels);
 	ioat_dma->idx[idx] = ioat_chan;
 	timer_setup(&ioat_chan->timer, ioat_timer_event, 0);
-	tasklet_setup(&ioat_chan->cleanup_task, ioat_cleanup_event);
+	dma_chan_init_bh(&ioat_chan->dma_chan, ioat_cleanup_event);
 }
 
 #define IOAT_NUM_SRC_TEST 6 /* must be <= 8 */
-- 
2.43.0

