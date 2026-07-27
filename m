Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCBDD42BEB8
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184319; cv=none; b=DmapT4BZG7X5OKYSL0dzV0Fn5fpkbjYnJTl/eSHZffTOjOvgrlkcQY8jwZ2NQ/8Diuzcplu0XI0qblgnqqZCRdnm0HSiGK3vKmmG9z0nUwVS1LsRYNAbX8hJLpmzrvFlbE8NXlmP95exHq6rQlMb/R4OSvZaCk9qX3w8aRCbSYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184319; c=relaxed/simple;
	bh=J3VKNEdFAAo+UuM5SW7cLaHeFou73T8tm///APbl6YQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gf0E7oFlg80kdzvodmOIiT2SekSRZhCN0XHATsvC3eFije9/0A9C+tx9trkRsFgYTgdTgSbC+ky9WW69GpfBlxg2QxuP9W1lwvz1zisJMQr/l4F4ad2Hj4eiv86IGJDKIh16JDv5BGpI61R9q4mKYVmUFH3gAU59ADRwahWrtI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ictwz9RY; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ictwz9RY"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cf27856f9cso41102765ad.2
        for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 13:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184317; x=1785789117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R1xIi9uEBJJusV1JgfzAtL1JCAhMgUNucNOCrJdZRRo=;
        b=ictwz9RY10msFctOvi3yLd1yZGg1+OQiqVQvZr5uJDDIhY40O6wjCvzcHMJD86Riqq
         jWUu71JIeogWjq/af2UyaFrBh445xTOalOi43zm2sWjekZBxZ+GQSPgk8GRK1COAwxYi
         Cuorxi7vg+HTNpxtCRoK7/wgwYrRRtBC2UjxVfWq6mSB9F+xGP14oju9TFukQ5L8fyWh
         SMfVWuLe9xm1wXsljEfkOCT4i/7/CqNKYvzHZ81MUiJI+5Uu9b6dU8U1+KrnCcFq3ZRo
         uOCvBTFfv8s7bFg6aPHJ6oFoXPKr1wwZPEsYczbv6ffzUH7dMblfO0AnIrtP6FnFihtw
         Imag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184317; x=1785789117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R1xIi9uEBJJusV1JgfzAtL1JCAhMgUNucNOCrJdZRRo=;
        b=iYbX9T3BE15QGmQ61Mm+j1DlOgrVUGBYGJPKNdmyMGDEwlyrD8gAQQ2OPC1p9irZXi
         bqTjMhNxhi05Bude71J2Ayakiu1uloHn/QXYoY/8oVfRV+v6ZLAG5WrZ3cgOyymj7VvN
         FR4pPhhr7jguF15hfM2G9kytd4nWzZ8TrkBBkHbypsfFyui1oLKB3dnE1/5yIzHASMy9
         OT/afeoRhWuC0693ea3YNEfwJeIvgX6AKoFdqWosuolktc+/C5/QFuqGcrCCvh97Pd6m
         Rb8WP30/mIzXoLNMcUME2o1LM3QNdpwLHVVwW/rNWg6xzwZcHiiq7FnHlFvYGpVCkhyJ
         f8Ng==
X-Forwarded-Encrypted: i=1; AHgh+Rq3nN/TCq1AAGc7KoQrMcaQD0+GwuTc4kWY+1nO3a/2PF+Zw+C3OEcai+BbhuaaHHcgNDFvnPmOOGA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbGS7b+h1GTgh5rIOEgUHFWMmpbfD1of6bYY0ifhyNWU0MP1j0
	t/gll0uAitufYpweXzamm2RCm+W6JZw/p3y3ardmrE4469WdjRnXuUv/
X-Gm-Gg: AR+sD11hIZSe4NX6e8FjuEG7AabkTZISZk+9GBc4CX9+N/nguF9nctBCayAmDHuMMy0
	76odI3fLVRQOHYPdz6Doki+yPQwPUAazTk5mmVG+i+lDG+B2N6cTNOO/ATvwuol0uX6lIezcdc7
	1NwNy/uvz24dDnfC0ObV2Oxn2u1ROKtWQRqey8X0AtjEegNn1OtjhtB2IhFI2PX5dW09alhEEzb
	bi2DJgb+PMPOe7nfQb0qzKytfuUfByxpd/kBc4USqk8AIPmJ7q86CXUQJ6TatvXJVRo1tndY5w1
	bj0ySwAtR5j62eJzqEpAQKr2Qsv1k8Q3nZa4kpgIU/2U8iJUOOf1amrd1fwBzvJLCxFjwh8ZutR
	4nIgscINgoys0s1UvXbSQNGvovIbuTDAkOXJLkY3FgS/l4B6d+KwjjiIUuosnon+lCaGxPJsCs4
	X1qIWc
X-Received: by 2002:a17:902:fda8:b0:2ca:c01e:8837 with SMTP id d9443c01a7336-2d00f380107mr7109805ad.24.1785184316966;
        Mon, 27 Jul 2026 13:31:56 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde59b768sm41551805ad.4.2026.07.27.13.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:31:56 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>
Subject: [PATCH v2 14/64] dmaengine: nbpfaxi: switch callbacks to dma_chan BH
Date: Mon, 27 Jul 2026 13:28:42 -0700
Message-ID: <0ca89b05c6c34edde9745324b832f37f8a12922b.1785183549.git.allen.lkml@gmail.com>
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
 drivers/dma/nbpfaxi.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/nbpfaxi.c b/drivers/dma/nbpfaxi.c
index 05d7321629cc..aea94451258a 100644
--- a/drivers/dma/nbpfaxi.c
+++ b/drivers/dma/nbpfaxi.c
@@ -174,7 +174,6 @@ struct nbpf_desc_page {
 /**
  * struct nbpf_channel - one DMAC channel
  * @dma_chan:	standard dmaengine channel object
- * @tasklet:	channel specific tasklet used for callbacks
  * @base:	register address base
  * @nbpf:	DMAC
  * @name:	IRQ name
@@ -200,7 +199,6 @@ struct nbpf_desc_page {
  */
 struct nbpf_channel {
 	struct dma_chan dma_chan;
-	struct tasklet_struct tasklet;
 	void __iomem *base;
 	struct nbpf_device *nbpf;
 	char name[16];
@@ -1125,9 +1123,10 @@ static struct dma_chan *nbpf_of_xlate(struct of_phandle_args *dma_spec,
 	return dchan;
 }
 
-static void nbpf_chan_tasklet(struct tasklet_struct *t)
+static void nbpf_chan_tasklet(struct dma_chan *c)
 {
-	struct nbpf_channel *chan = from_tasklet(chan, t, tasklet);
+	struct nbpf_channel *chan = container_of(c, struct nbpf_channel,
+						 dma_chan);
 	struct nbpf_desc *desc, *tmp;
 	struct dmaengine_desc_callback cb;
 
@@ -1228,7 +1227,7 @@ static irqreturn_t nbpf_chan_irq(int irq, void *dev)
 	spin_unlock(&chan->lock);
 
 	if (bh)
-		tasklet_schedule(&chan->tasklet);
+		dma_chan_schedule_bh(&chan->dma_chan);
 
 	return ret;
 }
@@ -1272,7 +1271,7 @@ static int nbpf_chan_probe(struct nbpf_device *nbpf, int n)
 
 	snprintf(chan->name, sizeof(chan->name), "nbpf %d", n);
 
-	tasklet_setup(&chan->tasklet, nbpf_chan_tasklet);
+	dma_chan_init_bh(&chan->dma_chan, nbpf_chan_tasklet);
 	ret = devm_request_irq(dma_dev->dev, chan->irq,
 			nbpf_chan_irq, IRQF_SHARED,
 			chan->name, chan);
@@ -1478,7 +1477,7 @@ static void nbpf_remove(struct platform_device *pdev)
 
 		devm_free_irq(&pdev->dev, chan->irq, chan);
 
-		tasklet_kill(&chan->tasklet);
+		dma_chan_kill_bh(&chan->dma_chan);
 	}
 
 	of_dma_controller_free(pdev->dev.of_node);
-- 
2.43.0

