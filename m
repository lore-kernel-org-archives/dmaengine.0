Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B07A435A94
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 18:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786385484; cv=none; b=j25oms/xCe4xG7NGUpLphn7sY4kAgPBgpzu5BWMmJBp3oXqegeiqnv3kK7fsnHisk5iZ1C8h9oi7m+BfRzWnphAHCOCeJYznqf/c8M3zU5lAzghFlWiDY9GIKUPND/5TH+iuWUeuMuSbtfXqoGTmpfH93dVyLLtl9NfdHdY3wIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786385484; c=relaxed/simple;
	bh=Z0855f1Ta+VEMIDJsjqYtSl5im3O4arPQPUi8a4259M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LO+77909HHPyknwir62uTZUmf9zTdSZ0NPQgIUmLlzq9aBEn2vF++y/QaR3tPcbe5fRGEG+WYbf4FyC7bwgqrOdpEd5wO/Y9qZCIYSlj5mL7el2GIqDpL+rUL0IplznKQM6d3DUVc7wwapoPkUrf8Z/WKZUT6NlKufGcGYOe/bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lZ/bKql9; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lZ/bKql9"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-381b831d535so2844288a91.0
        for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 11:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786385483; x=1786990283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z0Canle5rtkGjjXltqJt/4h8AMWrPL9Wd/WVDPCBLgc=;
        b=lZ/bKql9bWBDUr+qfJgnPvl/48GIicoEufrTZTn2qLoHJpXJMGSZnUo7T0QtkrquA3
         ZhPO8RRpEAAYsKsEsTqB3mIO5nwwDtXjlllQr132Wvcbj2ax/pk4zwVErEBPvfoD2J1r
         WOXsvTgrhhaXxq7aq3w0uulubTXUIn2Tq78Jn3gpnQT0QJBEu3fDpzV5BOC/4pyXhso6
         3d905T0ELs9wR1XDy1D/g9/I5kvNNbyqKHFGmnacFftaEJuXkv3BqU51DLdaFMR/l7Ft
         iFoW1GRjuy7s+QBiSSS3MkNkHhWkuJN1YovzqPM4CEY11fQGiKvfXXxPIkWveaxaYBdc
         M68w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786385483; x=1786990283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z0Canle5rtkGjjXltqJt/4h8AMWrPL9Wd/WVDPCBLgc=;
        b=M88qbfaQzEu3AflDMPC+iWta7RE793oK4r91b9XRMzzUXJ3zoZMFPjBtTkZ0Q8OjuU
         kSMwHJgTC0AX21JAqozoA/FH25tNYmOePjsCxw+zTV0uKkqJW/3ks1gvqWp9QeFP8TWB
         GT7mupnkgk/7KzNieVIDUfNriWok4GTYn/wrPIyYV3zwulLnSbFan5b0Kz/7pOq2UqlR
         ekghJwGu9/QpYHbfcgfvgXn3XRnXxJS+uIDZmyezu9/yqPL3pZ8+DDuBl5gOk9eu+Q9+
         Bq7dxd6LtGbkd5pAoqU+4oAMrMZy90u7TH9RrPe19cYIk/jAitrzRizroPQ5/gmv6/IK
         P+eA==
X-Forwarded-Encrypted: i=1; AHgh+Rpu+FMtr5n8ioNKVLo0uD5Vdcdwa2JBGWCKD/KmVJLj6IX7iHbetZnZhvRrGYT5URDjgXD92OWhy48=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6vt8iShL1jJH6LjSePlz3pb+ViP0w0z84BHxOdEwlUPlvi4FF
	X0TP6UzPBrvXXOYb87NDnwYVrC3giY4s4O3/HV6SNbZH6W5lahTTHptz
X-Gm-Gg: AR+sD10eLXrTZVIIvPaJ+/jFqitN5X9DlVR+WIGTXXCdtaa4IbZyNL945aIFzXz7/g4
	CjCzeg1xGdZeJ03wt3HGMteRzh1I03v2r0zkhU2qVMGmEBQLJXUX8tudlohEdFeapUycTnozCAP
	nPs5OcmEjfJzrr9+Giz4ovRTuoHtykS490PD0dBziHSSbOUXJ3WGJOtIy8uqixoyP3v9w5nv98i
	mxWpsWwZcR8odHGbccd4NNWN4j4LpaDE+d6k2MlO3GGovRP03OKf9NGfSBjV6tUPIjielGNk4nN
	31squ4SSxOIa6yESfCF8fAgYRMnOFySXoXGOokX83B3baotgsepv6IYnmIHk9yM7VsNOqb0DNHh
	FEBKWeHVwgIOdfYZbTP9bguLnngap659cc5T6HWLUfrVbE5S/bLTRmxA+applI46GEmc3fm8djq
	EtLC5y5Mut4QAZyLr44vvZDf82+Xs6CmvvtJchAfCJJUoUjZVUhMjP4AzhXQP6oN8=
X-Received: by 2002:a17:90b:3985:b0:38a:c3f:3b87 with SMTP id 98e67ed59e1d1-392620e6f9dmr23957113a91.12.1786385482746;
        Mon, 10 Aug 2026 11:11:22 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fa9:fa00:b1a9:6513:83c6:1d23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d53b873asm472795a91.17.2026.08.10.11.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 11:11:20 -0700 (PDT)
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
Subject: [PATCH v3 04/34] dmaengine: at_xdmac: move irq bottom half to dmaengine BH
Date: Mon, 10 Aug 2026 11:09:05 -0700
Message-ID: <452a0aad787e4d64a057f13f47302782e9b3752e.1786384168.git.allen.lkml@gmail.com>
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
 drivers/dma/at_xdmac.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/at_xdmac.c b/drivers/dma/at_xdmac.c
index 901971e8bae6..5a970f9f3831 100644
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
+			dmaengine_schedule_bh(&atchan->chan);
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
+		dmaengine_init_bh(&atchan->chan, at_xdmac_tasklet);
 
 		/* Clear pending interrupts. */
 		while (at_xdmac_chan_read(atchan, AT_XDMAC_CIS))
@@ -2458,7 +2457,7 @@ static void at_xdmac_remove(struct platform_device *pdev)
 	for (i = 0; i < atxdmac->dma.chancnt; i++) {
 		struct at_xdmac_chan *atchan = &atxdmac->chan[i];
 
-		tasklet_kill(&atchan->tasklet);
+		dmaengine_kill_bh(&atchan->chan);
 		at_xdmac_free_chan_resources(&atchan->chan);
 	}
 }
-- 
2.43.0

