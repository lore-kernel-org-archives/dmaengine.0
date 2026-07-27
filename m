Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550DA42903F
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184317; cv=none; b=meuldQsRNBISBUpPs+aa704fDAFrGSiNt5LJzgb3RfyEODv2UzOGlwYgEZtB9fs1aQBvi/Fa2yORoqi5ljED+r9I7Xeh+T5RS5GGghw2KAmS3bp5/YyChsxNk1LjaFHcPziW+7PTm+pOv7ZEWCZHgN2dA6NUzjrDZscUKR7wF0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184317; c=relaxed/simple;
	bh=F6swiu/pbHsFLDcyPzv04tz4oF5vseby/Ivc/N6dGAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fja0bpTkvy42ohU3N3YIJscvSMOT6uf04uZvjC45LLUI9i4OkkKvmoFACD8mPa38YGfpus8Sz1DcrgrulrGUaqDYOgRtZzFSEdO8uKW6dmwEw/n5fZ5x9GaYHP1XsGBs9B44HJkF9PyhWLWijpIxWMPi01FxvQz+C+S5z7YXDto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z3+IL3xE; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z3+IL3xE"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cad8076b01so38747845ad.2
        for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 13:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184316; x=1785789116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d0ft1nhloqnztuc290Fs03Kt4IzqAO7BmLTHY5joAAk=;
        b=Z3+IL3xEdOqqrSFAVRLHNVgAz17WY/qKhjCVhVivLU7s+1/UyN1u88cXn3IGThcc/7
         pDMeiC1hppvDfGMdAtiduo5+6Iij/Q3C21fqlcIxgZr76LYlmnrOUOWQaPChbUhje4/N
         xR8LhpyJ1B8errnepL39R2RWRj6+LsL6QV7tFlLCtae5Me3iM87/8YQdaq+NPHqY4xCf
         cYfQvlXZL6lvoA20ibkFpCRxUhCsGL+ET8bUTKEODFuSokhew2R76QkCk1XkYOXV1KMD
         +gXMovQ7T3aqZabIo/AZt6pWfUNGGYSVoDwvCNC9WWXxad8aIF0xsAPWc2W6T3T/ztgZ
         j34Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184316; x=1785789116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d0ft1nhloqnztuc290Fs03Kt4IzqAO7BmLTHY5joAAk=;
        b=W2pZDg0CJC/sAV/n5ZEQD2WbFVFXVHydVouOkcQptAT+PUhaW/iqxXz7PvbRqHibHC
         OquF/esVwh94+g/tBsgQBMhmX0+maq0xXyycB5gGDBGLdbLvjqMsTOABSIb+QCpCVaHu
         ygdFHbiUBsNMKvLXTby2MUebmN25MnGB0iQ0VYib9H+x2ThJlXb25vuzGVuFlge4aLzZ
         hdhzndg7AwnXMwLBOrqVREvvLbXWdOKDOyQBc7PCS2rkiTgTJwXQ6RTfPxOy12O1haF6
         0d/18H/LL9jf6YsQ0SKpSnh3PBZo+pxnl5uvNFd/Vq1A+7mxMCzIM6bb9OWKaqPPmPPy
         7j4Q==
X-Forwarded-Encrypted: i=1; AHgh+RriSl9GdnUH3u+HGxtpltjPtH9DJveloGDfVLgggzKEgg4q2bXmz6cWjj9ngJeL0Zlst24nTe6DwhQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyA9IW2D9ojmt185H8kOmrE0Gh0jQhxrM2mtfRSXuqGmFVu5ICr
	lqSgUAMxiRB15evI3eVH6yvO5VGD3shj6OCG3Tj3z0oYe/zHx+na7r4T
X-Gm-Gg: AR+sD10XX4LoA9SokKodoMGQxggz5/HsOb+yf/JM77DlDCKbN3eG6IOoJvpZPglT0yx
	UpsAlNORaR8j8zO85VL4pwcjuSX6OCC+1IXjur3NXvfBNPqANlr+nglh+r8/SQdV9j/yXMcKPWW
	XzhlDoNFBzzFSft8VOuO1aQREcKyRLliHez8nhfLEmBHdifMqDjnAwzl8sENmgqgagjzeOZkHdT
	1Yy/DpUAaaDlDkGK8n8MOHmTlnAIspXU7ImzvZ3Xamu+6+LwDktHtynFJJ5uYzMwERz6DjT/5ra
	8BL+8pDUHrA9waSGYNmwOBcCICxCX32eV+mbHweEtQKNDKCtTOXjFppgGlpttdXknZ4hXCpxck3
	Ab7rpZVRETwCftvdHiffJRaAoTAk5AFyMCH/4nDFMxCGriuZCbRSG71a/rM1gcTSPSKnRHwSFKV
	gLSAT5
X-Received: by 2002:a17:903:1663:b0:2bf:9760:b94d with SMTP id d9443c01a7336-2d00f42d025mr7516855ad.15.1785184315598;
        Mon, 27 Jul 2026 13:31:55 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde59b768sm41551805ad.4.2026.07.27.13.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:31:52 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 13/64] dmaengine: mxs-dma: use dma_chan BH scheduling
Date: Mon, 27 Jul 2026 13:28:41 -0700
Message-ID: <e0499d943001c6ef2142bfdc910f584dd575e8bc.1785183549.git.allen.lkml@gmail.com>
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
 drivers/dma/mxs-dma.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/mxs-dma.c b/drivers/dma/mxs-dma.c
index 7acb3d29dad3..8cecc0add82d 100644
--- a/drivers/dma/mxs-dma.c
+++ b/drivers/dma/mxs-dma.c
@@ -109,7 +109,6 @@ struct mxs_dma_chan {
 	struct mxs_dma_engine		*mxs_dma;
 	struct dma_chan			chan;
 	struct dma_async_tx_descriptor	desc;
-	struct tasklet_struct		tasklet;
 	unsigned int			chan_irq;
 	struct mxs_dma_ccw		*ccw;
 	dma_addr_t			ccw_phys;
@@ -300,9 +299,9 @@ static dma_cookie_t mxs_dma_tx_submit(struct dma_async_tx_descriptor *tx)
 	return dma_cookie_assign(tx);
 }
 
-static void mxs_dma_tasklet(struct tasklet_struct *t)
+static void mxs_dma_tasklet(struct dma_chan *chan)
 {
-	struct mxs_dma_chan *mxs_chan = from_tasklet(mxs_chan, t, tasklet);
+	struct mxs_dma_chan *mxs_chan = to_mxs_dma_chan(chan);
 
 	dmaengine_desc_get_callback_invoke(&mxs_chan->desc, NULL);
 }
@@ -386,8 +385,8 @@ static irqreturn_t mxs_dma_int_handler(int irq, void *dev_id)
 		dma_cookie_complete(&mxs_chan->desc);
 	}
 
-	/* schedule tasklet on this channel */
-	tasklet_schedule(&mxs_chan->tasklet);
+	/* schedule BH on this channel */
+	dma_chan_schedule_bh(&mxs_chan->chan);
 
 	return IRQ_HANDLED;
 }
@@ -781,7 +780,7 @@ static int mxs_dma_probe(struct platform_device *pdev)
 		mxs_chan->chan.device = &mxs_dma->dma_device;
 		dma_cookie_init(&mxs_chan->chan);
 
-		tasklet_setup(&mxs_chan->tasklet, mxs_dma_tasklet);
+		dma_chan_init_bh(&mxs_chan->chan, mxs_dma_tasklet);
 
 
 		/* Add the channel to mxs_chan list */
-- 
2.43.0

