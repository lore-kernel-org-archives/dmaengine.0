Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E3D4248AC
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184307; cv=none; b=VTJmdZ7W9H/tatfGupMtt0KXETVtBuRgiiTXfEN+LbOzm6XODkj76ifNxPRRW9EzDvzIalHqZeh21F01uW1d34Fjh5Lxdr5nBsjpI/3tkxFG804kpLtFdxF5I73xWRlOr9cx3uP6ho6F7lLkHVp806JSVIYNEgpWdWDiIkPUiUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184307; c=relaxed/simple;
	bh=xf3Du2Fpo9CK5dgZjDt5xtHIEA4sFcbqDi02Jj09FsU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KwfaCsVo6cheUJDbKDtcJ/MixqD/uobl4HIExMopFGAk/7h/48AMCkiV9190kEpsRgxsqa+2uCkk+sAaFzzWgx/ptCBhsJJeUqF7ui46JuKaMQf8nScihh1sYqPKzuPjTxjFg6ErxJJg2y1E5D/H+x/dsvA0cBFPfdaGO7LfPW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ic/MoEV4; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ic/MoEV4"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ce98cb8165so4078835ad.1
        for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 13:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184305; x=1785789105; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FIEQFZVXjWUQfSinW/V0lYSYtgH9eiGD5iMhL2ZY5Jg=;
        b=ic/MoEV4HbVeurpXK39rF4pIrFGLcRAutplAX8jknmRfd/tCum+U6SWXMlczUDNI+K
         eEFNIcAh01cu+qvlx2m2YTRqzSt6RcJoxizd4by8hUV4eLUxu/Nux7j65gGvvZ032eMv
         pORQZeTDRzaLMQURNGdMNkKrKS2Qr35Q0a4jBYTafSABFxbQB2FXZYpFXpGW2prcHZpB
         0tZ2LUscFYXuRYGfpFj+LRqdFctyaZhRm9A7q4uW2N7LtlVVUItcXhG0mITXiSuk+NrV
         B2kOSv9kryWB8un1tBKspX65QzYs6HAd5qnFEe5aE5zKq4WyG5EIN/RpFCRJe6z8RDk9
         Xm4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184305; x=1785789105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FIEQFZVXjWUQfSinW/V0lYSYtgH9eiGD5iMhL2ZY5Jg=;
        b=lnfgQWSQb2RUVUf4DRvLQyZn85TywBHKXmhNfmHa7cEMq32GLiei9e+WeuB4XIpjrv
         GJCoE5f3hU7ht8I61UcXt1VEUH/eit3Y+qDGo0I26bg9iy5PHuWYmxhtrXpO1tCnifC5
         kHy9LnK7Puo3nGP9G4nOaeS6wlHMb//KZb4qovU0CzAQuY/Wkdr1uZtp9g4GSOLlMngL
         Je2A3KAXcvZxsVwAdGfhcLRTlaREqHvJef+Gves2k+m8ZDXM5AlTG2SIVrTDhkGkoUvM
         TbUWfTceIEYpOgAmnv3lcQjQnyE10gAl8ZP/gEbzovemOvycOLMBwhAI7OX1W9QoU7tb
         KJ1w==
X-Forwarded-Encrypted: i=1; AHgh+RoKV3nyq4A7KtzJMAwZM8K/FSkV6BuzYPs5yKADB3i5Qp1/Gr7zibyL71uM/Q0SlPO1rFciQwICSus=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRvugsJw//N898fNMwWZ/y9oeebmevrMwZrjlpwKHr6V0wasux
	75oGOjwPgd7Od5rGrj0QxtEhZKU4UMHYiOhszzE4ZSPytWx2Vg2p4Jzv
X-Gm-Gg: AR+sD13mdLst2tu0cUl/XWJ84eX5I+stuiD6lrd3+WJtsUq5WXl9RVOKq5sM4qf4meF
	PnEfGuolbIvZ8sbKh79RqcD+vejs7hwT4vU9lQu1ZIfiV0jRtiCQLgkprboH7Gm8dtUfgCC1+MV
	W2nwQUnUq8hLtoDbcpeJRyAQh59GKOFjq5Gel2oFGk9n5eeOjGVAdBn9mxP69SXqMxouUiFmCDw
	RsQpso2FLV6EqTpyqiAdig/hw3+FttPX6UpqZdiUHvc7UeyKLr+3w6T2YuD9uDvtrSlXlQCsz5z
	FY9AkudcTiiid+yy2MGbUnwrPk7stxiwmUYmyOSDMdLEXl6TH/XCVYV3rPkU3hVP5XBrm3asDDi
	FXCODSW6JwLX7gPDZdGYPviFHm39/b59z9B9jSVfeLh4y8jj28JfoTGempU36EynRp4jhdmrlOn
	Qw294J
X-Received: by 2002:a17:902:e5c1:b0:2c9:d56d:afa3 with SMTP id d9443c01a7336-2d0121ae6acmr2557695ad.15.1785184305223;
        Mon, 27 Jul 2026 13:31:45 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde59b768sm41551805ad.4.2026.07.27.13.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:31:42 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>
Subject: [PATCH v2 10/64] dmaengine: mmp_pdma: replace per-chan tasklet with dma_chan BH
Date: Mon, 27 Jul 2026 13:28:38 -0700
Message-ID: <feaa4d0c6c7c9a3be4fe8202d91abe66f2555034.1785183549.git.allen.lkml@gmail.com>
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
 drivers/dma/mmp_pdma.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/mmp_pdma.c b/drivers/dma/mmp_pdma.c
index 386e85cd4882..3fd9ef59a142 100644
--- a/drivers/dma/mmp_pdma.c
+++ b/drivers/dma/mmp_pdma.c
@@ -116,7 +116,6 @@ struct mmp_pdma_chan {
 						 * is in cyclic mode */
 
 	/* channel's basic info */
-	struct tasklet_struct tasklet;
 	u32 dcmd;
 	u32 drcmr;
 	u32 dev_addr;
@@ -374,7 +373,7 @@ static irqreturn_t mmp_pdma_chan_handler(int irq, void *dev_id)
 	if (clear_chan_irq(phy) != 0)
 		return IRQ_NONE;
 
-	tasklet_schedule(&phy->vchan->tasklet);
+	dma_chan_schedule_bh(&phy->vchan->chan);
 	return IRQ_HANDLED;
 }
 
@@ -1047,13 +1046,11 @@ static void mmp_pdma_issue_pending(struct dma_chan *dchan)
 }
 
 /*
- * dma_do_tasklet
- * Do call back
- * Start pending list
+ * dma_do_tasklet - BH worker to process completions and kick pending work
  */
-static void dma_do_tasklet(struct tasklet_struct *t)
+static void dma_do_tasklet(struct dma_chan *c)
 {
-	struct mmp_pdma_chan *chan = from_tasklet(chan, t, tasklet);
+	struct mmp_pdma_chan *chan = container_of(c, struct mmp_pdma_chan, chan);
 	struct mmp_pdma_desc_sw *desc, *_desc;
 	LIST_HEAD(chain_cleanup);
 	unsigned long flags;
@@ -1170,7 +1167,7 @@ static int mmp_pdma_chan_init(struct mmp_pdma_device *pdev, int idx, int irq)
 	spin_lock_init(&chan->desc_lock);
 	chan->dev = pdev->dev;
 	chan->chan.device = &pdev->device;
-	tasklet_setup(&chan->tasklet, dma_do_tasklet);
+	dma_chan_init_bh(&chan->chan, dma_do_tasklet);
 	INIT_LIST_HEAD(&chan->chain_pending);
 	INIT_LIST_HEAD(&chan->chain_running);
 
-- 
2.43.0

