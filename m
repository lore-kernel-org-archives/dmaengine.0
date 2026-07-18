Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25F527BF93
	for <dmaengine@vger.kernel.org>; Sat, 18 Jul 2026 05:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784352615; cv=none; b=VLIkyDhz91ymbKCwkvF/qlKXTEc7FryOThG9dpRSF4KVeOGK19sHmgzSSVAqtv41YojwAQN/B0Msqfx4sBV26BAqF4UHtuUTEnr5otucru0Bj/J1Z01YgDn9zINsYnI/G5yzqHAXBp2m0L7V2D/95nm/SzMZYP/FcIXeEVZERNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784352615; c=relaxed/simple;
	bh=8kPjGTUaP18Q45Q97MOtgfZfhKk8Dkarx8mxqFnsCio=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dc73yRnwxr/ta6+fZsmKOo2o31ev3UhqGzlfuegY+LCjYwaep013UcoOxTFjXiPo/FfoWetngOeBTa4vfQHpuS7ytwL8zT0fPv6kGbje7zLWFWmOmYkX9cxwXlg9Hs8mzQKjg0nK24KAG3NUyb2ZhCiWLnY5ulXPt1jUDkaeNq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bwn+OdHN; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bwn+OdHN"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c96bfabc8d4so3083777a12.3
        for <dmaengine@vger.kernel.org>; Fri, 17 Jul 2026 22:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784352613; x=1784957413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kNh8yPHZ3nF4tNXYQMK8u6v2cWd8FxLX8ivrzzQ2ac0=;
        b=bwn+OdHN8h12GXRteUdfK51pg+Ik37bIX3sD/NWtjDODhbyZ26qnk2erIm9qxwpL0o
         RB5aSlM0I6DEtZc4PeAbw7Nk6QoDnq2UsA+9mlq2WmbJyCRxPti23qb4k0l1UZTBBDqn
         XVuO4Bvcl2Z/Y0aacgOGceG8Q+N27xk0u5jG5I+HM8TA3D6ASUANvPQd3WfqROcg99gB
         OzS6Xu4sPifeU2cZaQjVEoyEB7g8YKMMgCkinvLY5Pxoscu95h8zczA8IN+i+KOoAn7s
         E66opougvt+J7tsHTQ2LirjGBLlUE98TWPt8dLxjHagHoS70cDOkSFNNK9be61eFtq5P
         QFJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784352613; x=1784957413;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kNh8yPHZ3nF4tNXYQMK8u6v2cWd8FxLX8ivrzzQ2ac0=;
        b=jCFxIGuLuGXB34jYGjxjw66bjARhRZZct1gmI4HJsmXnEaTUuKbdetgC/FSKlRACJQ
         Z7x0t2nTW4YG9IIfqLiV+pXc+lUorSiGkqvBy8YJhlaRfM5JmyveOfANVHHU3WmEcJQi
         e7s8fSLLitHq3EGXCOGXT2NT1XPde9UlZfnSNV6SRL+3BrekAL+1modL6zJimjOC1c0H
         B41wq23oGGxclk8MJznEocF6TjSFQxMmJA8A9oTW7xtbKOnytYST8Y2mcaSQZNCIktXT
         P6v0DfwekSDBzQMxB7YisOE2F090djq8/HgVFKNeBHdYuKa61PuT2V7x1MiTZ7v3hjcu
         2aMA==
X-Gm-Message-State: AOJu0Yy0oBedZYdLF7b1Sx54FVaEgPE+fHT6ON3sa5c/O3yDQ5sLc/5a
	kdnJScBIVvb0nAF6Psq+gnHoCFbKfdponnn7ZLXUnJFOpINtEK2tNHJqFJTZTw==
X-Gm-Gg: AfdE7cklzwbf4WkWIyl4Ox3zDdZ6PSGbFea0i8nzKU4iEf3JbWfUUyfBrliSCPHKkBE
	dr0nTRHqOJJXlK3/6y0WJQr36jcJXfLJ7ofc84MNDz22d8Gjw4O0CxjRO9HXI2m7p0uelUChX5y
	BwfJqXHjrp1OFB1tZoP0Mc6W7pD3gwrnBkD/aTQ//QVVUAAYA6L4VY51gFyYQoIKJzFZ2CCkuZp
	9H+6KPwGP4mRwlHGRVlCt1eMoQNjC4oWDSlhux6pRRcBbEsbyd4bfo9X3FHYvtao0kkMBAv+lQL
	xF3Oq6YMTjocvwLscfGD8Z1S4dp95Vc+1w5KgT+VH8UTlqgzl79WN0pDRCm2Eih503jV4NGAJVH
	7H1X/OIXSBJqxMmi23isKogKGIOnIsQK5B1HK6wlWQO00WP5xLcpnG7qzATtZ5AtWy+oyZBj1AD
	kcR4jbUMVc5Q7J0ASsJZdHVym5u8TSw0PtFZ6K4SyrZzFIKBOi/0hFLZHtb8o0hhcQt+lNhcIjr
	mmevQKoy2NIq965zNxy7+hmbWTluIjYpZjCKQW5jBynw37nMZRKt3g=
X-Received: by 2002:a05:6a20:7521:b0:3c3:b656:4f5b with SMTP id adf61e73a8af0-3c3b65651c6mr3529595637.56.1784352612912;
        Fri, 17 Jul 2026 22:30:12 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb51a1cb3ecsm1862221a12.29.2026.07.17.22.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 22:30:12 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Harninder Rai <harninder.rai@freescale.com>,
	Xuelin Shi <xuelin.shi@freescale.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] dmaengine: fsl_raid: don't invoke client callback under desc_lock
Date: Fri, 17 Jul 2026 22:30:10 -0700
Message-ID: <20260718053010.3074329-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fsl_re_dequeue() holds re_chan->desc_lock while calling
fsl_re_desc_done(), which synchronously invokes the DMA client completion
callback via dmaengine_desc_get_callback_invoke(). If that callback
submits new work (e.g. fsl_re_tx_submit()), it tries to reacquire the
same desc_lock and deadlocks on the spinlock.

Collect completed descriptors into a local list under the lock, then
release the lock and invoke the callbacks before moving the descriptors
to the ack queue.

Fixes: ad80da658bbc ("dmaengine: Driver support for FSL RaidEngine device.")
Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/fsl_raid.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
index 2d86f61105e5..bfaef6245695 100644
--- a/drivers/dma/fsl_raid.c
+++ b/drivers/dma/fsl_raid.c
@@ -162,6 +162,7 @@ static void fsl_re_dequeue(struct tasklet_struct *t)
 	struct fsl_re_hw_desc *hwdesc;
 	unsigned long flags;
 	unsigned int count, oub_count;
+	LIST_HEAD(completed);
 	int found;
 
 	fsl_re_cleanup_descs(re_chan);
@@ -182,8 +183,7 @@ static void fsl_re_dequeue(struct tasklet_struct *t)
 		}
 
 		if (found) {
-			fsl_re_desc_done(desc);
-			list_move_tail(&desc->node, &re_chan->ack_q);
+			list_move_tail(&desc->node, &completed);
 		} else {
 			dev_err(re_chan->dev,
 				"found hwdesc not in sw queue, discard it\n");
@@ -196,6 +196,17 @@ static void fsl_re_dequeue(struct tasklet_struct *t)
 			 FSL_RE_RMVD_JOB(1));
 	}
 	spin_unlock_irqrestore(&re_chan->desc_lock, flags);
+
+	/* Invoke the client callbacks outside the channel lock. The callback
+	 * may submit new work which re-acquires desc_lock, so holding it here
+	 * would deadlock.
+	 */
+	list_for_each_entry_safe(desc, _desc, &completed, node) {
+		fsl_re_desc_done(desc);
+		spin_lock_irqsave(&re_chan->desc_lock, flags);
+		list_move_tail(&desc->node, &re_chan->ack_q);
+		spin_unlock_irqrestore(&re_chan->desc_lock, flags);
+	}
 }
 
 /* Per Job Ring interrupt handler */
-- 
2.55.0

