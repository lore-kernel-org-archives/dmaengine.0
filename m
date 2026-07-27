Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA62F42D768
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184269; cv=none; b=GFFRCj+OSvhPOLaQ9/BcGIeO7ImlV3ockJ+DrO+ybvwsvTaDKTycfDYlw0gsZqfK6T1fxGyaIB7dR0ZLJ/Vupxw8O4CcgjlqMz1fJvZHUnhQMPWFs7/PBTarvell34dZ7gpcVJqjoIt3gpVnN/KIL/ec1KHvQdk27SieUEgYWWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184269; c=relaxed/simple;
	bh=4lKN0zxyyykusIdLDuaYhUaC4CwGpbRa4W2vzb1LEuE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n9UNCh0V8ItvltNUXd54WIN8BgDpTdnkQl6XQMIOUoV00aA2IMD1YafXAQI6iHHVA0uEptYlqa/NV/rcFjXcJHo+SZWQmc9z7+Roqzxz90MGs4C33MzYKPaXOWVFRHQVZ1MkQxDNOjJ7e8FNIl0ZwDiJF2M637aC8HSbBWB0Nco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M7jr5AY2; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M7jr5AY2"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cca0c5799eso29752825ad.0
        for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 13:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184267; x=1785789067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sa3tfC8KOPtChDmpcRt2oXEtiFfA9yOH4me4ekfnls4=;
        b=M7jr5AY2eerGEHJK9T5hO8WMtfD4LwEhjZsxXYkul365MLZ0+yFVd5u2loa6479FHD
         SRhDieqNZE/MoKpxTmPIDIcksr1KMTrYfdDEdQzAhjR0xz2bJY8404E9Y3rWGuDBpC//
         aE06QXgT+BzmdbjisOKK/biQXKXU9RytwLRYRDpT67CYZ8Eoh2qEkXfP941Em2zmZr3s
         faL3SpJzhl8kiwGTkS9z9YX4OcySbfcN+PltsTsPB3uaYXi5s1ZF3lWYfsPRAIwA5G53
         OaD8tjJs1R6F38Gju3CoEaaziv/4564b5zLdXFh8zHDyq8NlWNJzj0RZgrJcBxePJv8E
         ULAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184267; x=1785789067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sa3tfC8KOPtChDmpcRt2oXEtiFfA9yOH4me4ekfnls4=;
        b=beX4sf8a0Ffw8mnkHWoPjTG7RTJXnf1vZSUS57CzI2PoJ2hCv42lH16/9IXKW5iR1V
         2D4l35Cvz8USzQ4jqPqLeLDADmNSFTR+C33xsxpv5wAs8FsuXeYPJWgMgF+tOEOeDZIo
         Bb/qltvBgIe840ZAVI2bsFMP3p0WtGLEDGkmBdHQ1dZhXXLciCOasIqhpIaB53T7c18A
         LpTXJTUHndnmGA9e/AENMOVd7N8qlktH2kjYV8L4L2UnwDsTUdlOM3YL0bGrfY3pmChA
         631zOWQq78vkzXHmyB9ZnFNbsrRWMuJ0rGyW8rX+fPzgnVLC1E4w3QNESgYn1wbaYgRG
         lFuA==
X-Forwarded-Encrypted: i=1; AHgh+Rr7HEVaQVft2+00uhWBCSnF2MIFn7Cyn8SF3j4ffFpTC5U8GbUOgXkXx8L0VNK3Ge9wrseyCM2t4Yk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxqz1YP+udUvcx+yn87jxdy44A/L2kxcSy3+S2Ypph6FWALW3z7
	TnlPY0lU8y9nFgqsrWwalRq6A6ihdQmMlz9qL8lYXueJouzuytO83hGp
X-Gm-Gg: AR+sD104+w2s0yFMTIEAwsQpPcD/tJFWkoarpU1P9nSU2tDdtUXcM6Y9Mzeu2z1GKGV
	lmanVWX1kFN7xVn6bCwXvKYQyW5HFf1lhfzdns52kETOXQtJdsOw/GaocFAZvEuT0vPhSfuPNmL
	0XOZoBCBxMLmx9l2+Bjb8sFKnvD8ecwrVyq4nXMhM2fa+u3WHy8FOUZESZKsU/doNopnOk09Q9S
	O3WlwFCFdzO8ntyxJezDRGmnD5fWu25SwFTyhkq8nrjQFb6ehBkz3Nj+NuxgA8xE3IB+efq9mBP
	OX5ksxwctT5BrKqIgW9YPzXSE4IT50Yj4Vnuq9W++1xA++m0zyphbAoVb4upBay8JzcEvkh1cat
	FEOjKB9l4NgKK7j0JsgGAG30gauU+T1fs6ymS8zDPiXl5PGh7Z8Ko+ETn3eEeOFEcdG6fCPzr/U
	+b2+w/
X-Received: by 2002:a17:902:e810:b0:2c9:c517:d070 with SMTP id d9443c01a7336-2cfde6880d0mr92860635ad.3.1785184266851;
        Mon, 27 Jul 2026 13:31:06 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde59b768sm41551805ad.4.2026.07.27.13.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:31:06 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 04/64] dmaengine: at_xdmac: move irq bottom half to dma_chan BH
Date: Mon, 27 Jul 2026 13:28:32 -0700
Message-ID: <06f8d1586f29e59ffa367c04b49400a81c0f16cf.1785183549.git.allen.lkml@gmail.com>
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
 drivers/dma/at_xdmac.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/at_xdmac.c b/drivers/dma/at_xdmac.c
index 901971e8bae6..aa918043e37e 100644
--- a/drivers/dma/at_xdmac.c
+++ b/drivers/dma/at_xdmac.c
@@ -228,7 +228,6 @@ struct at_xdmac_chan {
 	u32				save_cndc;
 	u32				irq_status;
 	unsigned long			status;
-	struct tasklet_struct		tasklet;
 	struct dma_slave_config		sconfig;
 
 	spinlock_t			lock;
@@ -1759,9 +1758,9 @@ static void at_xdmac_handle_error(struct at_xdmac_chan *atchan)
 	/* Then continue with usual descriptor management */
 }
 
-static void at_xdmac_tasklet(struct tasklet_struct *t)
+static void at_xdmac_tasklet(struct dma_chan *chan)
 {
-	struct at_xdmac_chan	*atchan = from_tasklet(atchan, t, tasklet);
+	struct at_xdmac_chan	*atchan = to_at_xdmac_chan(chan);
 	struct at_xdmac		*atxdmac = to_at_xdmac(atchan->chan.device);
 	struct at_xdmac_desc	*desc;
 	struct dma_async_tx_descriptor *txd;
@@ -1865,7 +1864,7 @@ static irqreturn_t at_xdmac_interrupt(int irq, void *dev_id)
 			if (atchan->irq_status & (AT_XDMAC_CIS_RBEIS | AT_XDMAC_CIS_WBEIS))
 				at_xdmac_write(atxdmac, AT_XDMAC_GD, atchan->mask);
 
-			tasklet_schedule(&atchan->tasklet);
+			dma_chan_schedule_bh(&atchan->chan);
 			ret = IRQ_HANDLED;
 		}
 
@@ -2317,7 +2316,7 @@ static int at_xdmac_probe(struct platform_device *pdev)
 		return PTR_ERR(atxdmac->clk);
 	}
 
-	/* Do not use dev res to prevent races with tasklet */
+	/* Do not use devm resources to prevent races with the BH worker */
 	ret = request_irq(atxdmac->irq, at_xdmac_interrupt, 0, "at_xdmac", atxdmac);
 	if (ret) {
 		dev_err(&pdev->dev, "can't request irq\n");
@@ -2397,7 +2396,7 @@ static int at_xdmac_probe(struct platform_device *pdev)
 		spin_lock_init(&atchan->lock);
 		INIT_LIST_HEAD(&atchan->xfers_list);
 		INIT_LIST_HEAD(&atchan->free_descs_list);
-		tasklet_setup(&atchan->tasklet, at_xdmac_tasklet);
+		dma_chan_init_bh(&atchan->chan, at_xdmac_tasklet);
 
 		/* Clear pending interrupts. */
 		while (at_xdmac_chan_read(atchan, AT_XDMAC_CIS))
@@ -2458,7 +2457,7 @@ static void at_xdmac_remove(struct platform_device *pdev)
 	for (i = 0; i < atxdmac->dma.chancnt; i++) {
 		struct at_xdmac_chan *atchan = &atxdmac->chan[i];
 
-		tasklet_kill(&atchan->tasklet);
+		dma_chan_kill_bh(&atchan->chan);
 		at_xdmac_free_chan_resources(&atchan->chan);
 	}
 }
-- 
2.43.0

