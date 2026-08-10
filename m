Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2D6435AAB
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 18:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786385589; cv=none; b=htvUfUkI20OMq+TWxH46X+pnCJrNdziSPXLL+cFWh6flQubgKs+Sih3SgNd3foXVppR94l7QtqHaRSHl0ImG9Rt7t+9WmHrUhs7+qE3tcX6C0coBmJHTpeJnknMlo8sym+Vo5pzjIXn/K5is9cQtvsZAHDI21oA1Xjo7N4FWW5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786385589; c=relaxed/simple;
	bh=M2tjM9OM2jW7mIXJbUz9os6KWE748qrFtlcoYqTAwpc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KCOrQ9WNs+ISYSFPzcjKS3jOo19TthTTlPAEUTYzNgB6yC7Tf/bqnxgTOsmKiD9oevnMlX0on6R6GF2yXZAo9s4jmP3/DTf3DnfGIaHUgTtT6Mc15uJQFr4J5IEt4NBY1Wc/LhjFfk2g67yYsEBbIZJoOpa2ufMijvqgOF5ZjKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K62S3M/6; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K62S3M/6"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38deea72eebso2144600a91.1
        for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 11:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786385587; x=1786990387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EJOBxc6+q+BiKolJErn0fFAfNOgr+mvYNTLLRlR2Uys=;
        b=K62S3M/6jCWDVy3xLTpzpHEc6ES0ufwBEKMyEc8qyfA4ENOhy+NNuae+ezikN780N7
         MTbiaSsnSJwvEPZSzRv05QVtC8ZCm01ZvnebzrbNuRXTS+8wqkmJK4f1dMsHjbMEx+GN
         W0nJgWDexNOeEgvjuE6rxwONZf+ZDvKwN8kz0wkvh75D/THxDQqyqv9+wYlwoNcxXtNa
         adWJM+RAQC3CBpu9xQgGCpjRcGJ/BO48eAusPGglV20Vyx1eY5OGVF2n0BbEI7ed/jBu
         QhIb7p74mPD31o4uB2VPGVSaIE6N/ge+Z/cRpzQgeLK04WGlMhtNKOXDfmpcRIbHYngF
         jl3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786385587; x=1786990387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EJOBxc6+q+BiKolJErn0fFAfNOgr+mvYNTLLRlR2Uys=;
        b=BmpvMHqRvM9Fc0M43L170qtIq7iEoi6z9nly7rzWG8AjxVXTDmQ4/2t1hRQeH/EddY
         PSwIEusp1Yx7CBMgnzcXuzd2kZfaJhxfhg6b/o7FHSvkF3zsKBYcNe81dU05wJQ7YL1S
         3K3p0PSJng57XV+5VtFFTo1ZLWLvldbVxroAjTAAk6n+4xAihzMbM/27S+S3DYo1pj4h
         ngzocQ/hkC7wdEp4LHm0/D6ZmLz6jyPy55wHgn7BwTjS3Z5yVBTI0A1BasEJi+A7j7hU
         +c2OEPKjzxLYsmdXefRPo5KTxeJrKNpLLUIwi/M94E3QNNIRBd6NIdFvD9Y/8GVUWNLM
         yNVg==
X-Forwarded-Encrypted: i=1; AHgh+RoGhlaHIxwKxN+d8j4hTQgzW+5XU87OXU/1S0lfygnG7jhrjmNXcyHhlRY2MVKgh2i1QgO9bU+vyZs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc291fE3cEfeNHnCirtwWniR0wjVI+mZ71PpUvfL3PythdV8l2
	jk7ea6VD2lJAbRTl5Xg92vyLlwFkI5y3fE31egVXXzI0OJD1InbqE9g5
X-Gm-Gg: AR+sD12VXQffQBgPO6ihc7pyXva6qaM/BZeTSYPdGxbMdCKwqqC47XnjNio8j7XyX3Y
	fBL+3mA4HH/K6LcsY3d2GTyM0d5IQ8TWSfDvUdbd8pLPriXi7PtHAAq+RTVGNa9tC/uuyTtk53p
	CAZI7MJMC3MC6Hf4Tk4sZm/DBXEjsKCT7Ra+1G2KBtkUktBkG1Yr375ujSMdyqNXxKdQwbvABwJ
	JMeGL85feUuQqJRZkRPKcyhXtQLasOcvxIDby86IMd8i9vxh0VU1j2QoOekAX/GKTZkn4+etM8X
	ebhtN+RTC6ZPeap0OiranXJ8rc4TFT9yy7bS9SH3xTdEbCyRhxd0DZsa6MYuvz4EBvXlC/eXLff
	9iT7agjLAjjeNqRsp3E2sjUiybWXaXwr0bHil1bt8NcH1tCDVfvhAT+vaDErrHrSy6rTxuSvA5C
	uAwKOSE6M2g8HWg+V6EKksXCWPILXatqU2EU8hPN9BuEsSfV3DDy8GZvwy9+Fvdp/J5tyJ3eJuA
	w==
X-Received: by 2002:a17:90b:3d4e:b0:380:105f:8ffd with SMTP id 98e67ed59e1d1-392824b8b6bmr22135591a91.16.1786385587361;
        Mon, 10 Aug 2026 11:13:07 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fa9:fa00:b1a9:6513:83c6:1d23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d53b873asm472795a91.17.2026.08.10.11.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 11:13:06 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>
Subject: [PATCH v3 25/34] dmaengine: mv_xor_v2: use channel BH helpers
Date: Mon, 10 Aug 2026 11:09:26 -0700
Message-ID: <7503158dca9b831cd8efafd78de3124c3cc7202f.1786384169.git.allen.lkml@gmail.com>
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

Replace the device tasklet with the per-channel BH helper so descriptor
callbacks run through dmaengine_*_bh.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/mv_xor_v2.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/dma/mv_xor_v2.c b/drivers/dma/mv_xor_v2.c
index cad4d4fb51ac..14d563ec6bf0 100644
--- a/drivers/dma/mv_xor_v2.c
+++ b/drivers/dma/mv_xor_v2.c
@@ -139,7 +139,6 @@ struct mv_xor_v2_descriptor {
  * @reg_clk: reference to the 'reg' clock
  * @dma_base: memory mapped DMA register base
  * @glob_base: memory mapped global register base
- * @irq_tasklet: tasklet used for IRQ handling call-backs
  * @free_sw_desc: linked list of free SW descriptors
  * @dmadev: dma device
  * @dmachan: dma channel
@@ -158,7 +157,6 @@ struct mv_xor_v2_device {
 	void __iomem *glob_base;
 	struct clk *clk;
 	struct clk *reg_clk;
-	struct tasklet_struct irq_tasklet;
 	struct list_head free_sw_desc;
 	struct dma_device dmadev;
 	struct dma_chan	dmachan;
@@ -290,8 +288,8 @@ static irqreturn_t mv_xor_v2_interrupt_handler(int irq, void *data)
 	if (!ndescs)
 		return IRQ_NONE;
 
-	/* schedule a tasklet to handle descriptors callbacks */
-	tasklet_schedule(&xor_dev->irq_tasklet);
+	/* schedule a bottom half to handle descriptors callbacks */
+	dmaengine_schedule_bh(&xor_dev->dmachan);
 
 	return IRQ_HANDLED;
 }
@@ -346,8 +344,8 @@ mv_xor_v2_prep_sw_desc(struct mv_xor_v2_device *xor_dev)
 
 	if (list_empty(&xor_dev->free_sw_desc)) {
 		spin_unlock_bh(&xor_dev->lock);
-		/* schedule tasklet to free some descriptors */
-		tasklet_schedule(&xor_dev->irq_tasklet);
+		/* schedule bottom half to free some descriptors */
+		dmaengine_schedule_bh(&xor_dev->dmachan);
 		return NULL;
 	}
 
@@ -553,10 +551,10 @@ int mv_xor_v2_get_pending_params(struct mv_xor_v2_device *xor_dev,
 /*
  * handle the descriptors after HW process
  */
-static void mv_xor_v2_tasklet(struct tasklet_struct *t)
+static void mv_xor_v2_tasklet(struct dma_chan *chan)
 {
-	struct mv_xor_v2_device *xor_dev = from_tasklet(xor_dev, t,
-							irq_tasklet);
+	struct mv_xor_v2_device *xor_dev =
+		container_of(chan, struct mv_xor_v2_device, dmachan);
 	int pending_ptr, num_of_pending, i;
 	struct mv_xor_v2_sw_desc *next_pending_sw_desc = NULL;
 
@@ -760,7 +758,7 @@ static int mv_xor_v2_probe(struct platform_device *pdev)
 	if (ret)
 		goto free_msi_irqs;
 
-	tasklet_setup(&xor_dev->irq_tasklet, mv_xor_v2_tasklet);
+	dmaengine_init_bh(&xor_dev->dmachan, mv_xor_v2_tasklet);
 
 	xor_dev->desc_size = mv_xor_v2_set_desc_size(xor_dev);
 
@@ -869,7 +867,7 @@ static void mv_xor_v2_remove(struct platform_device *pdev)
 
 	platform_device_msi_free_irqs_all(&pdev->dev);
 
-	tasklet_kill(&xor_dev->irq_tasklet);
+	dmaengine_kill_bh(&xor_dev->dmachan);
 }
 
 #ifdef CONFIG_OF
-- 
2.43.0

