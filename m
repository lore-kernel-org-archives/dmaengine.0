Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1CA42B73B
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184284; cv=none; b=HBRHa+sIfZmlsga9KVmggM0c0ndCMOldRgEl9t3ETtF+WBVarppP5hk/kh/lCwAyql7Rf6BckSe4wVswctoE3FIVOws/w4oUtO/2FjghSEGhSjqZEv3tGv2oX46E8tlTzfQ7KZ5aEGczmQDYEunsdo9lE7/0qHm8VwYpBoB/+bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184284; c=relaxed/simple;
	bh=i0FDSbt1uAzCXWGP4bUanol6OUtTbMWMvzOl9/YKe/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nuT49/X5Lecl+uKB+ZkNbyuxJY9vPBhDVJkKLTEBJxTgEo5zEdOFCpYsaF1fR485J3Y3yv79Pcj70fzpYLzKI6C5j1FN+VqnyhDUMKoc97sxMexW0326hCJXTiD3xpWz4aqB98EPZl0FaimxdbkHdtn6HWhKfdVJfH+enY4PKRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kakI4BZP; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kakI4BZP"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cc891373e0so32757535ad.2
        for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 13:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184282; x=1785789082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=11cxArXzbsYVzuqf8d9QUd/PaTvhX3sCFFqleWOmTTQ=;
        b=kakI4BZPiSt1n7qA8PRJHk6d3rwvy7kQKGjovJDBsaVbowcblDmcAmfZjhH52+i7H6
         UPpL/LqhbL8yaYlCWSOYlQw1F65mMe3XoenqvR4cxDzrLedMYVSO5Wr5sEnBHbuuhu1q
         DCNoOSeoyxyrDwYhkhIfN+Z/0FEx2o9Fm2nk3cJAljAiFiAwi+1l2+RknJLVGcHybsN2
         Cwj/Q36LMK7+JJL6aUkH0oq9ZB+1X5UnVLQkEv1N4IjI4vQXaSo3EQz/4KjNI3Srr9nA
         K/j9jQPGkk+br7UQE114xuzdWc8Xe+H8zkhep4gzHeORwExQUBTaagOeY9pW9LvNGMDL
         zKQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184282; x=1785789082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=11cxArXzbsYVzuqf8d9QUd/PaTvhX3sCFFqleWOmTTQ=;
        b=AZqtcWIAbD3adfXbd47I8P3akI1fox+YlMUuXF9wDrusU3PY0nOgba1NeFCPi2UnsN
         90q2q/ETREXVWbfIn46apS/wUJPsegBxPKDhjtgn1Iv5nXc8X+AwWvwBumEIJ2NmvBjC
         ZYjDYp7N3yybsYbeS+lqi8wsi3rCXQS+O9vYw80EhdKR+skiOl/DgrVYILpRsOfnc2Xp
         Q3uGVXyt2atbx7sQM5AhfOLLCV2U/l98u/YAl9/krMqKN1toz+VMMwEYY/qT2loApT9v
         EZkEWbzQMKcJxoL2ZP/zvJIB+57bmod5jT+sFqFG5k81Hik5pL+/Ax3fapsF3rQjYB5+
         9lnQ==
X-Forwarded-Encrypted: i=1; AHgh+RpIWAoUcHxB8cHUFb2Q4azUZI15SUzWCayGQo5nLTNS8v8safXk8n5wB5RKgAdUERiYMqsTPHdVWd8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlH/iiYC1QsP8/f0lh3DWP/jK0r/shI/UXpSOGh+t0UqKr005P
	46NdAw1sqUwuDOQ7Uhyvx+O9pQzMfGSGxyKGaAOO6ruqJa1lOiFkMavs
X-Gm-Gg: AR+sD13SCPbLs3cddChxk+vVFAzXOY5vbwB7W64iPsqpm1A3/wNxhgoS2dTG6bYEyRl
	4p1kRWMNeSNTE5P6a0ZYnt7wFZozZN3R+LxSyBhTs+2jr+tiIB0GF2nRL58Lz7CdSnfGG8x+ro2
	OQjdoorjp4C3gzWqvGgLoy8Hitq4p561Wp87zo9wV0Jgzc5XIY+ffM2f2VAabH/ziIEaDG5qgT5
	grmIzk7z2aJpZe04tP4wwWkgl2iXse5aLw9bPFYmOvYOdQN+Ve4uOtin8MpAyoE4iuPu8DGN3JI
	yBXj1j9S9qEEQEiISbcBVtaCqfa3+Q+Lyv732s2RBp8aODgkDUfxH56c4akk0cq5dI9V/ehE6j2
	PYvG1/6IhBnSc6bOmna3+F8ijSJr1j8gNIkkeVMuEetmkzJQrXD25GtwOAzmQcVhTbzq+QsvoFI
	dd871x
X-Received: by 2002:a17:903:4687:b0:2ca:ec6f:aeca with SMTP id d9443c01a7336-2d00f2bcf4emr7352005ad.8.1785184282165;
        Mon, 27 Jul 2026 13:31:22 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde59b768sm41551805ad.4.2026.07.27.13.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:31:17 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>
Subject: [PATCH v2 07/64] dmaengine: fsl_raid: run completions via dma_chan BH
Date: Mon, 27 Jul 2026 13:28:35 -0700
Message-ID: <05046e6cf972767567c6fdc613297b1e69eabbe0.1785183549.git.allen.lkml@gmail.com>
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
 drivers/dma/fsl_raid.c | 11 ++++++-----
 drivers/dma/fsl_raid.h |  1 -
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
index 99945845d8b5..e91c18d3c327 100644
--- a/drivers/dma/fsl_raid.c
+++ b/drivers/dma/fsl_raid.c
@@ -155,9 +155,10 @@ static void fsl_re_cleanup_descs(struct fsl_re_chan *re_chan)
 	fsl_re_issue_pending(&re_chan->chan);
 }
 
-static void fsl_re_dequeue(struct tasklet_struct *t)
+static void fsl_re_dequeue(struct dma_chan *chan)
 {
-	struct fsl_re_chan *re_chan = from_tasklet(re_chan, t, irqtask);
+	struct fsl_re_chan *re_chan = container_of(chan, struct fsl_re_chan,
+						   chan);
 	struct fsl_re_desc *desc, *_desc;
 	struct fsl_re_hw_desc *hwdesc;
 	unsigned long flags;
@@ -224,7 +225,7 @@ static irqreturn_t fsl_re_isr(int irq, void *data)
 	/* Clear interrupt */
 	out_be32(&re_chan->jrregs->jr_interrupt_status, FSL_RE_CLR_INTR);
 
-	tasklet_schedule(&re_chan->irqtask);
+	dma_chan_schedule_bh(&re_chan->chan);
 
 	return IRQ_HANDLED;
 }
@@ -670,7 +671,7 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
 	snprintf(chan->name, sizeof(chan->name), "re_jr%02d", q);
 
 	chandev = &chan_ofdev->dev;
-	tasklet_setup(&chan->irqtask, fsl_re_dequeue);
+	dma_chan_init_bh(&chan->chan, fsl_re_dequeue);
 
 	ret = request_irq(chan->irq, fsl_re_isr, 0, chan->name, chandev);
 	if (ret) {
@@ -846,7 +847,7 @@ static int fsl_re_probe(struct platform_device *ofdev)
 
 static void fsl_re_remove_chan(struct fsl_re_chan *chan)
 {
-	tasklet_kill(&chan->irqtask);
+	dma_chan_kill_bh(&chan->chan);
 
 	dma_pool_free(chan->re_dev->hw_desc_pool, chan->inb_ring_virt_addr,
 		      chan->inb_phys_addr);
diff --git a/drivers/dma/fsl_raid.h b/drivers/dma/fsl_raid.h
index 69d743c04973..a40001a4db58 100644
--- a/drivers/dma/fsl_raid.h
+++ b/drivers/dma/fsl_raid.h
@@ -275,7 +275,6 @@ struct fsl_re_chan {
 	struct dma_chan chan;
 	struct fsl_re_chan_cfg *jrregs;
 	int irq;
-	struct tasklet_struct irqtask;
 	u32 alloc_count;
 
 	/* hw descriptor ring for inbound queue*/
-- 
2.43.0

