Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2C3435A97
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 18:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786385491; cv=none; b=lPNrzuspe/jtOO5SdCqbmHZxWvo5qBpnghn+ic/9dWyjL5O3d/OFYnhT0i1mqHUlb3LPEGbtyL8L9fJB3Exrk0D4QmmdZecuuHxS57mljJzas98l6P2rqd62viBdQ658m8IUMt7DqMCxTTambR+fn1/B4ohKa0zenOpTRN00fzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786385491; c=relaxed/simple;
	bh=4tYVT9QqLmwTQUUuN/J5bGbv/2gfEO0sUizgH+taHNo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PvlKxXi9e0iJ03AQcaUMiQA4lkpeDd6fdpKym3F3C0Rmnp+RrQlkfFj9Iw5zx4FdnAGoBzsF9bCgDCKoa0ZOAGkHymDYv0nzY7fHSg9eU6AQIglfA03MWi6kjrqS1CttXIH4c4GMIwA55vKx1j9piCqaP+t8+rWxVN69ULI196k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YA4wzzM+; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YA4wzzM+"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-39266382df6so2371208a91.3
        for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 11:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786385489; x=1786990289; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xHByj7whypjAGcgXNhTkpT6ldplRWJVWN4PSrjNWnv0=;
        b=YA4wzzM+vQu+qmHPKraQ34aYBVJZ8PoUv7ht6vjvVrCk8UFZTADDkwykpi5Xcv67pg
         0AXcH+gWmaQU2+5zQILPKoodkaoGwpQzAMJU+NgygYkSekebXHqhiULD8CHbhNdLslAf
         NKU7kGLWTmtTB03bYHy48uRRlcOgjSW7yc3+ZjQwrFiwEwMBJ42gpHK/6aPMBsfveTfw
         P8HA+EpAT1TR4w9+auNGJe6KCf0GZWe4Sah10sb+ZNpmZYmmgtlzZhXe+zXSJgVpe/WN
         WOV0DEGJY0VymIH8taJyMNhjtr4RY5prT8NbXpqoMLTM0qor+luJS5bTWyl/g6OPjOFP
         CROA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786385489; x=1786990289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xHByj7whypjAGcgXNhTkpT6ldplRWJVWN4PSrjNWnv0=;
        b=ruPFPQEE9wfVG4fR80d7vWnNCuqrSYoBfwhMytbyk6z2gAP3cL/6W5Six51WcNQ7sm
         Tw1OgVsfnp48+2X6ng7bzOTCmHb3pJULsg0dfEKFwW638NK+vJ/w5dJdgDny5VW/dAbq
         8SLsKn6jr49H/2tjZ3yDeYEcWK0SQSuX7VJtZY+hpPmLR3iqCCOufxld6ss03ovfPFmZ
         az0apE5TDxpIMy2lP22jQrM6Tp7x6Puo2mTstdCHDi1atmVdhY6W/o9vmX4T6ceuqZev
         HnF0fUEBvRlIImWUymfiF/EQ1GMFwfLlQn+lWiQMbLTtfcztzNy3FbE9u8/gKN7Gj7e0
         UI1A==
X-Forwarded-Encrypted: i=1; AHgh+RrlLdFMZuZ0YL2+gkhyBKoQ9rS76+EEo4jyVAdaalQoHX4eMw1t741CsXuvita64sPC6mKbmb681bk=@vger.kernel.org
X-Gm-Message-State: AOJu0YztO9HlBpgp+pMNhpQTqvg3IzlrlpCKj3NVWuGv9XliD3t0T2gk
	nhduS6+M6oLpnM/zuUU4yyyJhv1rToGUJs241BE/Nr2L1k6/pv0SRzpOpDBN5A==
X-Gm-Gg: AR+sD11VYPcLYvLFwsalxpO9ghYmspKfvpP+NCyavpZg3eNH+2H5P39JVWZL8x5xTxF
	b+NXmYJ2Tx+5Yfv0g/CW7Rcjn1ITCZfZIDUlvgE2rQsgneRrAYHjWf7Ul5yitQG9Q9brmwnT9ag
	dIpmT0qimYZlVbU428qmKLzIfMYO62XJWII8LTDKu13pQ9hqv3odKFZ+jypa2Pz9gC9LZLAwmBn
	jEWsdpM9q7Zlnd3B95Yvxct0IHBqqEPVKq9Ze7Aso8XejacVIZi38BAT6DPcQv8kqMzi2DP/RaA
	Dtp4I7iGhqzir64xtq8wZgnREuy7uNU1giP7yfoCzYeCYMeSHazZaLq/ssyQ8j31zwMCfZN9EDy
	eRGehHFNhrkXKJ7roeML8tR17aO4R3sPCWgrW+22bTsxs9JtJ3K5D7Hy3/BZ/Fkt7KEIsuoCvQP
	8pRi2oFXLc9cZCViNO9s7OK5dJHC0k+GwdK+3TRxTSLXeY8DJHa1jpC3gxfSzRBLeUUN5UiFYgD
	g==
X-Received: by 2002:a17:90b:2785:b0:38e:bbf1:de3f with SMTP id 98e67ed59e1d1-3903c5d2f29mr48635260a91.12.1786385489431;
        Mon, 10 Aug 2026 11:11:29 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fa9:fa00:b1a9:6513:83c6:1d23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d53b873asm472795a91.17.2026.08.10.11.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 11:11:28 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Zhang Wei <zw@zh-kernel.org>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 06/34] dmaengine: fsldma: migrate tasklet to dmaengine BH
Date: Mon, 10 Aug 2026 11:09:07 -0700
Message-ID: <a9c4d258c73c2d7e3c23825db272cdfeacea478e.1786384168.git.allen.lkml@gmail.com>
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
 drivers/dma/fsldma.c | 10 +++++-----
 drivers/dma/fsldma.h |  1 -
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index 22d62d958abd..f52547611db9 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -968,18 +968,18 @@ static irqreturn_t fsldma_chan_irq(int irq, void *data)
 		chan_err(chan, "irq: unhandled sr 0x%08x\n", stat);
 
 	/*
-	 * Schedule the tasklet to handle all cleanup of the current
+	 * Queue the BH worker to handle all cleanup of the current
 	 * transaction. It will start a new transaction if there is
 	 * one pending.
 	 */
-	tasklet_schedule(&chan->tasklet);
+	dmaengine_schedule_bh(&chan->common);
 	chan_dbg(chan, "irq: Exit\n");
 	return IRQ_HANDLED;
 }
 
-static void dma_do_tasklet(struct tasklet_struct *t)
+static void dma_do_tasklet(struct dma_chan *c)
 {
-	struct fsldma_chan *chan = from_tasklet(chan, t, tasklet);
+	struct fsldma_chan *chan = to_fsl_chan(c);
 
 	chan_dbg(chan, "tasklet entry\n");
 
@@ -1152,7 +1152,7 @@ static int fsl_dma_chan_probe(struct fsldma_device *fdev,
 	}
 
 	fdev->chan[chan->id] = chan;
-	tasklet_setup(&chan->tasklet, dma_do_tasklet);
+	dmaengine_init_bh(&chan->common, dma_do_tasklet);
 	snprintf(chan->name, sizeof(chan->name), "chan%d", chan->id);
 
 	/* Initialize the channel */
diff --git a/drivers/dma/fsldma.h b/drivers/dma/fsldma.h
index d7b7a3138b85..cab33d010d51 100644
--- a/drivers/dma/fsldma.h
+++ b/drivers/dma/fsldma.h
@@ -173,7 +173,6 @@ struct fsldma_chan {
 	struct device *dev;		/* Channel device */
 	int irq;			/* Channel IRQ */
 	int id;				/* Raw id of this channel */
-	struct tasklet_struct tasklet;
 	u32 feature;
 	bool idle;			/* DMA controller is idle */
 #ifdef CONFIG_PM
-- 
2.43.0

