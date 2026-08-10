Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE25C43552F
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 18:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786385494; cv=none; b=SYjy2B13NorHjFcuc/AsALQa2wwwXHQRflw5oFaWHhuH1OFUV3r1ygo4hVRuOtLCF4Pvyw/5ldGGey/pjNSfRbHImop7ZPm092p6scDXk5KytDpBfOb3DQFjxa7cncADYTNCVgpWe2v9i0bDP/7VH4+jPKSAysFf2/r7kvf+woE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786385494; c=relaxed/simple;
	bh=LBzB92irw5KAqCLccNraecQzjq1lzupy3Iz7fMnTUNo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZOtGpr3hnntAWv3runC3o3hX3a4eIYvw77tGObNBNzDXmqc7Wu1y4qFNFmO7YuYFkO16YJtvU2KpG3G74N5kXPjUBZcFtzamFZePE9Y5l1LXz0nAvlUnPZbp5agKxbhrudknPGLAibFxjbg3rQtxO563vFVb4On8CNIbeBo9WPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lHWqptK0; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lHWqptK0"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38759bcd877so2460246a91.2
        for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 11:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786385492; x=1786990292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4yXuD2jr+8+yiFdSw8m0g6Y3dHN/pV7/GzguiUuuNTA=;
        b=lHWqptK0exBrJ25QbUPaRgP3cA/+y+a4XP5mPGups4nUFP+NRdxN9rvy+pVSlu3ux0
         DLZIZ+hCHZOQ054VxgypBhy7DZz4Ra8p7W6/Yn3Z9Zyubb9UhxuprEkPG/i7yazFLzKa
         Q+jM74QbPSzlYy+e4TVq5dgUDfBnpGQSPMxVgmVzOvtq6hWVbUlsj2XqvV5v/iZMxN4E
         kGSXi+CGwwilsY+IlWzfyL2iIz7CiIZAq2ZSPRB9bPSIFyWMIArz5lIB1nAHlyMCUZgj
         oBhetjb+Mgp8DfgFtb1dH3XCVzgjzpaTdJq7eVB6J4n717fiyOMKY63lwTclGx3UmHsA
         S9wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786385492; x=1786990292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4yXuD2jr+8+yiFdSw8m0g6Y3dHN/pV7/GzguiUuuNTA=;
        b=TneZ0F59wWEwFsas34awldX9Fcc3jtth7D43yf+XbOPHgdLv7fDncdxGHccDz+qQ/Y
         pEGuxWEhLZR2I8FHNnhBZh4Ie8qLIDKyHsf8VN/y9kH32odcZNX9kJDXTY/E3GyJ5DyA
         seAn2LrRaq9RypYnfHxY6NHIKcUvdcHRu6tlfOk+NyaviLKof4yaEC8otL4f5Z6NRGtl
         F6m2mKXz+UyLlursKyOLNHOAgc7FqnPzNrdO+1PZKZPNnAKxLZs0ZjilQgxaRIQmzvtt
         Yz7wsNVq44puVAVEGebuz8JDRyPy6TY/447g5vzRanZ4cr19VV4ZApxXKgr9EBeLTfib
         n25A==
X-Forwarded-Encrypted: i=1; AHgh+RoYM4HCdfFz/ozQWPbdWotApyNqywLsQsuHW1GzGALI4d+ACxsJo+81y1GJzwiM/o3z0PIApPfi+4I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDzxYs+9Sq2ibpp69TvwE7MOsO9VJQrDOyTj3icu3r9p88THZt
	+SlwysbZY2y297/wU916yragw3hnkd16OzqWIy94VH5f/o2fT1H/368vYad9WQ==
X-Gm-Gg: AR+sD12BkH6hom8gW7DIR2d4r27pvSfpa5ByuscwA8zS6owwGT2U55gtTA4AkIex1YH
	FHsXCFu9DL9MH0GLRbP0znbmP3+YTMc1K1EjINqVHnfYnIHS6m1fk/2ki8WSz1H+NyJF6VhR5bb
	svRUwABQ6Mk2hsC+m02/hEuMFn6nJJKiPt2zc2vDbFM9T8EOGfKlP4jbEy2jZA6M0k0Q8HUY8/8
	j4wdmGekMtsh10rJKZx8uH6oQxCg3ivLxnEbz+BIuHAXs6VmiGt5QjY4cXhbEVAP68XJx9Q0GwC
	JLGx8Lkhn0wSJNG2pvRkocBZUt96e+Hg67aA5agkHS7KxSRhbDuNVRs4yVG0Eoihy+7dohveBku
	GFCAO9CvYM+kj3j/b/4xxvNuIGVNrrXmxV1PuL6xZMYNKvrFqzmuUjOFk9fvn4TMzpNVzxUyMAK
	sxRav4j45mdH918gHBCifdoA35F3rVQ0pbj9XJGTjU9qM6PdUFVJWLPTzMQCzIukw=
X-Received: by 2002:a17:90b:510c:b0:380:540:d499 with SMTP id 98e67ed59e1d1-392cc936992mr3651691a91.6.1786385492418;
        Mon, 10 Aug 2026 11:11:32 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fa9:fa00:b1a9:6513:83c6:1d23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d53b873asm472795a91.17.2026.08.10.11.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 11:11:31 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>
Subject: [PATCH v3 07/34] dmaengine: fsl_raid: run completions via dmaengine BH
Date: Mon, 10 Aug 2026 11:09:08 -0700
Message-ID: <5619f788f9ce69629aaa113d882ad3ec91dfd0be.1786384168.git.allen.lkml@gmail.com>
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
 drivers/dma/fsl_raid.c | 11 ++++++-----
 drivers/dma/fsl_raid.h |  1 -
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
index 99945845d8b5..0d0403945d91 100644
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
+	dmaengine_schedule_bh(&re_chan->chan);
 
 	return IRQ_HANDLED;
 }
@@ -670,7 +671,7 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
 	snprintf(chan->name, sizeof(chan->name), "re_jr%02d", q);
 
 	chandev = &chan_ofdev->dev;
-	tasklet_setup(&chan->irqtask, fsl_re_dequeue);
+	dmaengine_init_bh(&chan->chan, fsl_re_dequeue);
 
 	ret = request_irq(chan->irq, fsl_re_isr, 0, chan->name, chandev);
 	if (ret) {
@@ -846,7 +847,7 @@ static int fsl_re_probe(struct platform_device *ofdev)
 
 static void fsl_re_remove_chan(struct fsl_re_chan *chan)
 {
-	tasklet_kill(&chan->irqtask);
+	dmaengine_kill_bh(&chan->chan);
 
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

