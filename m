Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E706B436BCE
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 18:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786385585; cv=none; b=dp606ypm+TjnHXdqQAq8SDkPu9SYllz+oTvgQ/yIBeuCS/RMXvadRu8geLxUf7ioj5ZUyz7DH8uvpyNbBs9SASOsvSEdx9j+u4mu/2FGwByrwDlkBIsxigiURggFcodfmw/n3oyINMEFGohgQqKwBLyVoUInhyOm3AerGAJGjSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786385585; c=relaxed/simple;
	bh=3CFQUipgutG7zGOxIQwj3/4HlpUprdEllsKNk/2j+Aw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IamYFdoi2KSjaym14TGK9CJnM1k6MNtSLTBPfnm9BAoVWYVMiV+MrGN4pwXeSkhwtJXkPtjzjEDGW0qx1C2l0ZWsCKi3HpOP48Jpxe19sGcIu2TfdrLsxtPChImcqJqH2C63DuBza3w1HcM4HEj11PQQ5zKWEEsxfD3nGVmRSeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ajA01zET; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ajA01zET"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-39266382df6so2373218a91.3
        for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 11:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786385583; x=1786990383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JZgKiUZo8rcVQaKfCZHOhgCQwcsfKBYG1i72H4MRQjQ=;
        b=ajA01zETtrUDFaZPJ0+xYiQDQV+UAt5FoqJLZxTjang0/tLJTHRfkX9ms/Vbnkg90H
         uNsAv5pxDI+Mxxb/3PRHkc2XscfDEkWD6UqCmGLkhX/niIRTAJiOjRJ8taofEZlIw3x/
         nfKELcbiftc08o63R41SCU3FosMwm6K/L/Vd6LrBC9o7qJ9NrYQKSku5826kFtK0R3qY
         O0M+g3rxF/RDwoNAF4pntCsY3cyfTQQ4vEp561WcEfgZ+Mz2OZLVoFDyfNSWgt7Tkqio
         ITE5MS4zJWg7DPZx1ZmaHy3Vqb5r1Yt/rdFNahuj3d/cLNa0q92SWoTyEMFWYI66nuvk
         56/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786385583; x=1786990383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JZgKiUZo8rcVQaKfCZHOhgCQwcsfKBYG1i72H4MRQjQ=;
        b=dfaCG22XbdEY3j/7dA5wpVlm8g8yxEtb6TAM82hzPfMSniSkIduB3BzSx6JFYe4b0l
         daV1atZwpgMcCqdLgm47LVXZW+Nyl/DTfAil3cB4is4ZTHVoihHWDpak2duc21OO+ipg
         p0cHuF+M2KLMws9MIZT/UY0s66P/bpbLPPhpFkRd+Wkpx9RDCe7Rryep3hgRlbVWwsDx
         h7UZktAv+NT+JZTGFegHjm6iga0cEdmiz2HMuKx1W0OY5nyhpfOEHwtVa5GqDurTkO47
         6ruZrtDsg6NT2azaTg6Uh1HbEuqv608pgcQXWELm5asXz4bXOtdgGRLlD5wuPdp1mTHI
         +L8A==
X-Forwarded-Encrypted: i=1; AHgh+RpfOrOPSvJ7Exu/TnHKOW5g0WbeObRG+MbxxXr+apo5eHa87QdI4g58tBW47UkLp09O6JpASAm0Qeo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjcPNu3eQEMU4dAbFBQdW7/NE4QD4a+e4jzT6vRLnDmBGMMFJU
	R+GsjYbdG8gkyQDDIiaGTNC95SBh80YVPGcHX9s4bLb0mqx13NLzpf6c
X-Gm-Gg: AR+sD13Lb2tb2tz5BUQ251+AkclTPrLSUDQX3l6SFgsA4glaS1I1ScBWTUzc87HBTbv
	2pwZHXcff8pFs8sR+yu4twPoZpDdvt6UeTXd3FfukOUrxD87ENLR56vXEMKNvNtxeyCPD4FEyCH
	bNQ9ybmwSqq2ZjECRkESiuS6yf66XtShzDCOvuePbdXp2BPzNvXRYh2V9w0KA5Kq9vliX2Tyf5p
	OF+6a9WXzbDzE8BAHigfGIlMe74krkqt53GPXl+B8qQVguEDygxu5LXWAsGbB379aSy+0XKUbRh
	dVAKPwZ5NSb4R1mMG1tR+Z9b26Ih4AoVnPtXXK2o8GbrKb3lp2MJt4f94VBPdwiXGaF1jv1uluE
	ipmUDlmokpQlfc697nyCPjjIXRmMJKaomy8tkisoCTkJwvB/9D87yMkwGWd/8NUPAWJ51Py4WQy
	3+GIKzuAVS/KVvpTYWHxMVjz85t0xaVmCh5Vp1NLjP7uXInh1Da27Zk+5zY46o1rA=
X-Received: by 2002:a17:90b:2d44:b0:38e:63de:730d with SMTP id 98e67ed59e1d1-3903c598974mr46244449a91.3.1786385583218;
        Mon, 10 Aug 2026 11:13:03 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fa9:fa00:b1a9:6513:83c6:1d23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d53b873asm472795a91.17.2026.08.10.11.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 11:13:02 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>
Subject: [PATCH v3 24/34] dmaengine: txx9dmac: route callbacks via channel BH
Date: Mon, 10 Aug 2026 11:09:25 -0700
Message-ID: <c98a32a57c3e295c79806859547756e70bb3f1a4.1786384169.git.allen.lkml@gmail.com>
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

Use the per-channel BH helpers for descriptor completion handling and
schedule per-channel work from both channel and controller IRQ paths.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/txx9dmac.c | 12 ++++++------
 drivers/dma/txx9dmac.h |  1 -
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/txx9dmac.c b/drivers/dma/txx9dmac.c
index 05622b68a936..0547f645b51c 100644
--- a/drivers/dma/txx9dmac.c
+++ b/drivers/dma/txx9dmac.c
@@ -601,13 +601,13 @@ static void txx9dmac_scan_descriptors(struct txx9dmac_chan *dc)
 	}
 }
 
-static void txx9dmac_chan_tasklet(struct tasklet_struct *t)
+static void txx9dmac_chan_tasklet(struct dma_chan *chan)
 {
 	int irq;
 	u32 csr;
 	struct txx9dmac_chan *dc;
 
-	dc = from_tasklet(dc, t, tasklet);
+	dc = container_of(chan, struct txx9dmac_chan, chan);
 	csr = channel_readl(dc, CSR);
 	dev_vdbg(chan2dev(&dc->chan), "tasklet: status=%x\n", csr);
 
@@ -628,7 +628,7 @@ static irqreturn_t txx9dmac_chan_interrupt(int irq, void *dev_id)
 	dev_vdbg(chan2dev(&dc->chan), "interrupt: status=%#x\n",
 			channel_readl(dc, CSR));
 
-	tasklet_schedule(&dc->tasklet);
+	dmaengine_schedule_bh(&dc->chan);
 	/*
 	 * Just disable the interrupts. We'll turn them back on in the
 	 * softirq handler.
@@ -659,7 +659,7 @@ static void txx9dmac_tasklet(struct tasklet_struct *t)
 			spin_lock(&dc->lock);
 			if (csr & (TXX9_DMA_CSR_ABCHC | TXX9_DMA_CSR_NCHNC |
 				   TXX9_DMA_CSR_NTRNFC))
-				txx9dmac_scan_descriptors(dc);
+				dmaengine_schedule_bh(&dc->chan);
 			spin_unlock(&dc->lock);
 		}
 	}
@@ -1113,7 +1113,7 @@ static int __init txx9dmac_chan_probe(struct platform_device *pdev)
 		irq = platform_get_irq(pdev, 0);
 		if (irq < 0)
 			return irq;
-		tasklet_setup(&dc->tasklet, txx9dmac_chan_tasklet);
+		dmaengine_init_bh(&dc->chan, txx9dmac_chan_tasklet);
 		dc->irq = irq;
 		err = devm_request_irq(&pdev->dev, dc->irq,
 			txx9dmac_chan_interrupt, 0, dev_name(&pdev->dev), dc);
@@ -1159,7 +1159,7 @@ static void txx9dmac_chan_remove(struct platform_device *pdev)
 	dma_async_device_unregister(&dc->dma);
 	if (dc->irq >= 0) {
 		devm_free_irq(&pdev->dev, dc->irq, dc);
-		tasklet_kill(&dc->tasklet);
+		dmaengine_kill_bh(&dc->chan);
 	}
 	dc->ddev->chan[pdev->id % TXX9_DMA_MAX_NR_CHANNELS] = NULL;
 }
diff --git a/drivers/dma/txx9dmac.h b/drivers/dma/txx9dmac.h
index aa53eafb1519..f2abedb73d49 100644
--- a/drivers/dma/txx9dmac.h
+++ b/drivers/dma/txx9dmac.h
@@ -162,7 +162,6 @@ struct txx9dmac_chan {
 	struct dma_device	dma;
 	struct txx9dmac_dev	*ddev;
 	void __iomem		*ch_regs;
-	struct tasklet_struct	tasklet;
 	int			irq;
 	u32			ccr;
 
-- 
2.43.0

