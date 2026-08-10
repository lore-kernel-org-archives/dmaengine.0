Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705DA435531
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 18:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786385479; cv=none; b=UvX1v2JgMa7+0gzyG4viPlNlbe1nUnRCgeN5FCa5gNrz5b2Ihg/tAxk1uu5iE/U50c63wVEPzq76kwGGvEZIVQnXUCLzYG0H0PUq6n1GBgJjHq9BsEiWxXrLxDrprvuSw31r1I4QroF7G0FqUpMS3PcA5mTGSBABE8r3X8lOKXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786385479; c=relaxed/simple;
	bh=esXYBAfmKoYjtMYG1Fhxmw5GV454BNtliriMAheUUpU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oNMY3skB2ZL9hPxkiNJXX025gMxSjQIpx9iY7XNY3SesLj9I7GH7h81hzP+kye2s18LSkhOCLgRCDf42ArZVtmd/aCFEsvdODCXZxBEF3EQ3eTIw8olYSP7eB9emG/V7gP4r95Z2gq7WxcyBGcjKk4RB6x72ppnVuBA6nm7/SW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lVFEbffi; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lVFEbffi"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-383cb94f742so2368074a91.3
        for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 11:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786385478; x=1786990278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nkIvExABzzIA572IGBET5kLr9qvjxhndAMy4fFMeZZY=;
        b=lVFEbffisosuok+ptDfBQfSBdb0A2KwCgL7YHLxXDe5uM+4E/HReB7RDZI0s6ON7BQ
         ZZQ7/Y4XJ+Eiz572ziLsrutp7rNNZhFMLMZ/238nC7mjJfTfpBaNu1er2HRU5Jzp2oRG
         yd6kJRs9Ymf4mtsU2ZnjWX66O9OG+aktzwKe4LMQgZtzEPTqzZMAZk3riejfpJ/ZQdwc
         htTepJRm+34YUR7K6i3KeXNlCWIuYXpmnSRNrmBhpdvJm3YmNaS+TCBPVaKjZnYzlbBC
         vVINsJU6yp2avWSZUUxcN0aU1b67jJj73PZraEnzLoMv5J8UwCE8kgyLxsxmb20dWhav
         gbag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786385478; x=1786990278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nkIvExABzzIA572IGBET5kLr9qvjxhndAMy4fFMeZZY=;
        b=s71YLF8ccL16/gfHCxTN/+nduygK1mQ1rHD076hCpUcyyzGciyDlPXUnwB67mwlGcb
         MyxdidbJtmoSAkzpqHlbZ9IT9DRKweKnAWGJ0mVBv2aQUiRKZmnsFrmVR2EX2fbB9zjK
         DaZVdjc9zp5dfWEPCUmTO4Xb6NKw7XnsjOvhNek9pOMZKV8p5QDb5ndzrTSa+aYx9Eli
         r3ZCVvLRxgemqfwOKTesAHN4lJITla3cJYQKkNO8RNLtWMcJtZ5E9pJgdgLRmaAVkX8P
         2EZNCqni4mu31NpVb8PTdx+pUUQ/xxxGewNfPbgZR2Iq5wX1zkuJXp0xmEpIA1wS1V+6
         9y0Q==
X-Forwarded-Encrypted: i=1; AHgh+Rp52QCkGNIRX0NYDYWcrlgLQ6rzdYh1Of5S/fTod6IwwS7cvKb2tZZTzpcDKc4I/vs0j7f4jyLVbaw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGtGJzrQ9omnZAYTthHehkj1Hr/eDANsUJozJksqiMH9jSrj0V
	iUtdHrihmB7iMY0Ru8rSx21SMRKystLx1svf3nmXHuHYs981mSuUQ+8G
X-Gm-Gg: AR+sD1206hlJS0nqf26w6UT8EPnVpwUkplTItfEj8dgnwFLhRFawiwk7EiLogvyp71S
	s+AuHMdl/dWchV9oQLFqXKpF9O185DXjRSYDdl/nZWTgPKR2KcNSEknDxtwK52ocx9TD/yA+NtT
	PCqVe1FuUNB73C9CCrBT+vBnFpgIk4CoHl433wixbX8knKYa4nSm+OA6i7yVcvrJykJN8FctdYQ
	DwHWAOHyZmcyYcV8V2GJAop9Hv8B3iy3m2MTFmSFvQ/OhJupADESFmiIFmpeNnQE0HpiI3ZLN6T
	b+k+JH+8iStfyUujittLwSMxAVm2C8uL58/kRJLgVivcK0qD5Rdyg4Kq4mDTLYl9vMNwcBYVECJ
	Z2nL9y7SWNXTWwIORX8o0FMX7aX3YEg9nfTi3mDEu9xTlttAkCGhjgfihbjzZ0pMJZBOESIU2Dp
	CBOfjFfVi87vDdRvWEzs26g6wOjV64QBi+dZLOmQpUoHGU22eGvFDrIvElXtmp5+U=
X-Received: by 2002:a17:90a:c2c4:b0:38c:a59b:5189 with SMTP id 98e67ed59e1d1-392cca3507dmr3372142a91.15.1786385477700;
        Mon, 10 Aug 2026 11:11:17 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fa9:fa00:b1a9:6513:83c6:1d23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d53b873asm472795a91.17.2026.08.10.11.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 11:11:17 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 03/34] dmaengine: apple-admac: use dmaengine BH callback
Date: Mon, 10 Aug 2026 11:09:04 -0700
Message-ID: <cc5172b8779e4cd15f2c1c7fa93174aaf09dbffd.1786384168.git.allen.lkml@gmail.com>
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
 drivers/dma/apple-admac.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/dma/apple-admac.c b/drivers/dma/apple-admac.c
index 14a5ee14a481..c5d4fb96d3c4 100644
--- a/drivers/dma/apple-admac.c
+++ b/drivers/dma/apple-admac.c
@@ -89,7 +89,6 @@ struct admac_chan {
 	unsigned int no;
 	struct admac_data *host;
 	struct dma_chan chan;
-	struct tasklet_struct tasklet;
 
 	u32 carveout;
 
@@ -521,10 +520,7 @@ static int admac_terminate_all(struct dma_chan *chan)
 		list_add_tail(&adchan->current_tx->node, &adchan->to_free);
 		adchan->current_tx = NULL;
 	}
-	/*
-	 * Descriptors can only be freed after the tasklet
-	 * has been killed (in admac_synchronize).
-	 */
+	/* Descriptors are released once the BH is flushed in admac_synchronize */
 	list_splice_tail_init(&adchan->submitted, &adchan->to_free);
 	list_splice_tail_init(&adchan->issued, &adchan->to_free);
 	spin_unlock_irqrestore(&adchan->lock, flags);
@@ -543,7 +539,7 @@ static void admac_synchronize(struct dma_chan *chan)
 	list_splice_tail_init(&adchan->to_free, &head);
 	spin_unlock_irqrestore(&adchan->lock, flags);
 
-	tasklet_kill(&adchan->tasklet);
+	dmaengine_kill_bh(&adchan->chan);
 
 	list_for_each_entry_safe(adtx, _adtx, &head, node) {
 		list_del(&adtx->node);
@@ -662,7 +658,7 @@ static void admac_handle_status_desc_done(struct admac_data *ad, int channo)
 		tx->reclaimed_pos %= 2 * tx->buf_len;
 
 		admac_cyclic_write_desc(ad, channo, tx);
-		tasklet_schedule(&adchan->tasklet);
+		dmaengine_schedule_bh(&adchan->chan);
 	}
 	spin_unlock_irqrestore(&adchan->lock, flags);
 }
@@ -712,9 +708,9 @@ static irqreturn_t admac_interrupt(int irq, void *devid)
 	return IRQ_HANDLED;
 }
 
-static void admac_chan_tasklet(struct tasklet_struct *t)
+static void admac_chan_bh(struct dma_chan *chan)
 {
-	struct admac_chan *adchan = from_tasklet(adchan, t, tasklet);
+	struct admac_chan *adchan = to_admac_chan(chan);
 	struct admac_tx *adtx;
 	struct dmaengine_desc_callback cb;
 	struct dmaengine_result tx_result;
@@ -886,7 +882,7 @@ static int admac_probe(struct platform_device *pdev)
 		INIT_LIST_HEAD(&adchan->issued);
 		INIT_LIST_HEAD(&adchan->to_free);
 		list_add_tail(&adchan->chan.device_node, &dma->channels);
-		tasklet_setup(&adchan->tasklet, admac_chan_tasklet);
+		dmaengine_init_bh(&adchan->chan, admac_chan_bh);
 	}
 
 	err = reset_control_reset(ad->rstc);
-- 
2.43.0

