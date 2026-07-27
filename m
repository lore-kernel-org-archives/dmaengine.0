Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C5142A16A
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184308; cv=none; b=sXLAwVi/xWLf0ExbWsZGJ19UkR+bScc0N49oIm08zsZcfLudBMoZTGHiDAIaWGfL1WFMk+Pp4/Yr3acVLkpty4dVJJqLFVJ4ivtrbI+ixcA28pckuihBhgC5TeK9A0WyUOH6c+U9Li1JsXNl7LlseEeU4ruf/K3afqBUbIzy/2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184308; c=relaxed/simple;
	bh=dfK1Fc6Qw/OmRWwSYNowGLxISiw6Dk4jhByn2IbQBHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KjBtpx/KlmDFT992O6M0H9lWFY5Bl8xm1Y0HBhj269qiZD0bxWSLrTEuRbPYN2oMpqbdp1YVq7/EOgcS26DrbW/UQzSYtDs0lUtz4jAi0hjMBLUInE+MtbiNJztZlt38bJo/JcExeT3cTqBCV9jrKNo3VKbP/hdXrRI86RDaxo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eCRFvQEC; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eCRFvQEC"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2caced6038eso4707975ad.0
        for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 13:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184306; x=1785789106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q2XP6yBpNA7SQvHygf0aGV7DQV6XBLGAfPztCBlAdto=;
        b=eCRFvQECaOOt9JqvKQKQYJxrbXeM0VvLdiudwdjZC3azyIhvCoa5NuZpveIVK1Y/4I
         1FOKhKPrBBrYy5jIf/uFQppUPHI8OezoxfNwY/69NYo4+7S5ExfoxXBI3YAIH1HL+VDT
         fsUcOW5c/fi5N2ljebFJMnE2KLHZMbxT1dvfisDXZkA4tbA+EEaNSgijjxU6PCW9/wqj
         QcGLZJBjDSmS8SQiPFPf1vnrCMdoCDt354dZa6HaSqUXobxVrOgHoaC+MxatcJDxJ0AJ
         FqjMhtZftqJ0AXq+JBtF7B8iyAOZhNPs0wmeB2yGbcB7ucQi2UC700bgonjOZxXYAGt4
         DPtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184306; x=1785789106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q2XP6yBpNA7SQvHygf0aGV7DQV6XBLGAfPztCBlAdto=;
        b=cxx7JADIcdyK8/pVAYTtQFq6kHwBxfh63MT6Mpyr8LLev0fSZGTK9FT1En7j1DY8bI
         tUh7+RxgiBjaYRJSfjrYVE2SoAzM0dNsBlonoz1fIQwbtnG4xEokdra07kWP2+FUxXUD
         DRoLePY0uow8zGnPRL+ukR7mHCQVSi+ze3v0+8sFvP5MrqJ6Ipk+AvVygBA5giKEo5qN
         Ntpp7/Fpyw7Ec3J0e/J1pkWlKNCYEbkM1I7SuaprzgloOEu0dc6AGB8RaiWB3mUX2mvm
         2wU5Z3L6epUoh1GiGtzk4xYSblKa5IC1W1iu8JeDtsGwY34XB7vrYaeGtvWQRQ+mWkZD
         ZdYw==
X-Forwarded-Encrypted: i=1; AHgh+RrcOQnpOLsK4FAsb/EGNciWF0gUmw1kcN/KOjluQjYe2g/cVHe0RWH32p5868P4xJWp0GqGZA4uJxg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/ZoFp0WyFdBH8gZymWWwLxVcNLeE7rx+diQiRqO5wxxuRqJRC
	3lOrakF9NmxVKzy3QpQmYRymeZNAnZMevacYaLDs3kLr+6proJAy5HUK
X-Gm-Gg: AR+sD13xS+mzXzNijtyDgCPnG4OAIXvHvxUO+oHDeuZxpdPBFJciuZIfa1SfTPCQ503
	NqmUU8u+qMnWxsrKhr7igaZwBi5jIS2osWuQr43lq2GDL4FGb+82R2L0GX9NLdbsHHg8WtRFzjm
	jrF1wxtXZklnfY7sNp9YUXg+Z8MmhBmPohTKfxPXPbOL1Y4SmxzQAjzAA5QktlyvGsz3ntb/QvP
	UhVy7yTGhMc/NtwLwWwF3LFeqSENIvXwZK8nYM2+VBMuKJm+ts2wBn/bJ+gH0aaxLRJ/tvTG3tQ
	hC3FTVBaIlBkn0MCiT6xvmKeTQ6Fa222p6UyJH15AOZ9LqUmrS66GLvrgFf0jl74Zxf0ZlNWjSU
	yJbyCIzIWDbvfTQ7E8gavuwolZOTw9CVm1Pq2LOF7ecpOJEmnIG3LqFTUPspM3SCg9G1V7Xome+
	M2wLxX
X-Received: by 2002:a17:902:c952:b0:2cc:92ae:b36 with SMTP id d9443c01a7336-2d01221ee93mr2217845ad.24.1785184306489;
        Mon, 27 Jul 2026 13:31:46 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde59b768sm41551805ad.4.2026.07.27.13.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:31:46 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>
Subject: [PATCH v2 11/64] dmaengine: mmp_tdma: hook completions to dma_chan BH
Date: Mon, 27 Jul 2026 13:28:39 -0700
Message-ID: <6b016025aba50032c5c1560d237923294a2f6ab5.1785183549.git.allen.lkml@gmail.com>
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
 drivers/dma/mmp_tdma.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/mmp_tdma.c b/drivers/dma/mmp_tdma.c
index ba03321eeff7..d1ed2886f0e7 100644
--- a/drivers/dma/mmp_tdma.c
+++ b/drivers/dma/mmp_tdma.c
@@ -102,7 +102,6 @@ struct mmp_tdma_chan {
 	struct device			*dev;
 	struct dma_chan			chan;
 	struct dma_async_tx_descriptor	desc;
-	struct tasklet_struct		tasklet;
 
 	struct mmp_tdma_desc		*desc_arr;
 	dma_addr_t			desc_arr_phys;
@@ -320,7 +319,7 @@ static irqreturn_t mmp_tdma_chan_handler(int irq, void *dev_id)
 	struct mmp_tdma_chan *tdmac = dev_id;
 
 	if (mmp_tdma_clear_chan_irq(tdmac) == 0) {
-		tasklet_schedule(&tdmac->tasklet);
+		dma_chan_schedule_bh(&tdmac->chan);
 		return IRQ_HANDLED;
 	} else
 		return IRQ_NONE;
@@ -346,9 +345,9 @@ static irqreturn_t mmp_tdma_int_handler(int irq, void *dev_id)
 		return IRQ_NONE;
 }
 
-static void dma_do_tasklet(struct tasklet_struct *t)
+static void dma_do_tasklet(struct dma_chan *c)
 {
-	struct mmp_tdma_chan *tdmac = from_tasklet(tdmac, t, tasklet);
+	struct mmp_tdma_chan *tdmac = container_of(c, struct mmp_tdma_chan, chan);
 
 	dmaengine_desc_get_callback_invoke(&tdmac->desc, NULL);
 }
@@ -583,7 +582,7 @@ static int mmp_tdma_chan_init(struct mmp_tdma_device *tdev,
 	tdmac->pool	   = pool;
 	tdmac->status = DMA_COMPLETE;
 	tdev->tdmac[tdmac->idx] = tdmac;
-	tasklet_setup(&tdmac->tasklet, dma_do_tasklet);
+	dma_chan_init_bh(&tdmac->chan, dma_do_tasklet);
 
 	/* add the channel to tdma_chan list */
 	list_add_tail(&tdmac->chan.device_node,
-- 
2.43.0

