Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316584;
	b=hm2LZ+ctlmViPS5iADj34BSyAPO0kG2YRgifDx8HhMXlouQlqAW33Fktc5PSdSWYkuNw
	 y52c/ieeY6v2rYy+tQoHqjhJAAZ9Q+DZahGhehL4Z+cmFZEiR5JvvkDP/6lGADqY1bXbd
	 XoE3WxG8lBNPmEYQ9E/+bATkNPTVvqfi4UETWlx1VmbzNY8KYbI2eeOVQvYNphQlLPzNz
	 6S1zl+3GHkwEOUcRzIgxfTLOUk1q5+vVauVVs/xUtr7ga7OMRUIG/I5kUwudXCVPE7DXO
	 1/3BDyOOmXLsOhod7T8HQ0K2M38rQqXsMrm7zXZAiBXu9Dd1fhZyUZ9Grp/aNcITHwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316584;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tNHJn9+12fNEQ34eO/c7NVFW+pmN+XHfboLXouQB4y0=;
	b=gjf9WUgGU6KTpJhYiENzBiQPiBpfo2fC4pBg5x3bnrBonHM7hZN3Csup9/aJZ3sOgL1y
	 NuzI4AE1KrCgv81TA/dgz2NpTa6uILjrv54mJQmk84qikOZUgwG/WuSgAIfcbFU/zE/sm
	 bRw/Pe32VQVft7yx0cX0h+7QVrcykAu6tGO6FGpNLuPhb3OUd6YklA3SY//V05Y03hwW1
	 fvDxNfMK8f7BH4ggmEbh3b6BbML5JvToAfxTa1Fo339mkrRxlYSGYaTlOdKjRn2lwWI9N
	 NbofSnwQjIFyisSW/sGf+2xuSoNmEAQQM157SQvpfHM+N2cEqCgCUNdd6dlJhPH/yiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uto3P2Fr;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C57606A7D8
	for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 13:16:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41C57606A7D8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uto3P2Fr
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cdba1b5ed8dso911514a12.1
        for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 05:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316583; x=1794921383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tNHJn9+12fNEQ34eO/c7NVFW+pmN+XHfboLXouQB4y0=;
        b=uto3P2FrRcUyUWnOnqTIDAYdUJE49YsFpMVsnZPQKj2mAhRRsf7IXwc4aZzoZHnaaY
         1SHReAuEMltlv/vxT5LifSs3Nf/Hfo3Vmk6KsNCYuDZL3ssnI4afTNX6a+ifGK36By7M
         iisInZH55a9U6uXDQwR2M14orKTvjgqmZ0Vwl8ZAxZysOb6nriyvzE2bYxlUn2Q40CIn
         frgW2uVG2HzATzoY/smOLwbwQ3rj3kNqBOyrp9NjiNhwtHdQJQsHpdKASYOVQf8qKgRT
         rghLPDlqdKMv980bDOnQ69u3IHoNGyeiItQU5uwoh46He4HU5uy5I3slp5EPtxHmNmEO
         xd7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316583; x=1794921383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tNHJn9+12fNEQ34eO/c7NVFW+pmN+XHfboLXouQB4y0=;
        b=MMt1m434ot0FApOlChzPOyelOr/FrmF5B6RS/cGKIr3n3CIf1AfaSPBBggWX1zvy65
         VVnNaJkHBY6GPsnTbIBpoXPxozSGnl8cxiS9M479ZSYeK6RtB3SWrP6JS1C4sf2yZcZM
         F6Sll6Ugack+Lln9jbQK/egXyX2/18kAHXzCu/XBToTuhnxKd7gCmRbSjcV2kEresbCd
         oSIF2IzYTOz4r+yOpf6Q83ExVFWMMKkTIRGRm3JpgSkecEeWZnopOc86GpJMQlPsEjkm
         Dqib2/RAz9uowmdL4MtYFqmExvx1DiGijhCJesBPgyWq1/ietZ/nJegNO2ytmuF9JOjO
         0qAA==
X-Forwarded-Encrypted: i=1; AL+hErEth/iRK7ejNihgsZaPtkcl5XH7pVO6pK9IlI9hNRdmnacl7vbcjjYhFTI0VNg9IJBrQztBZtsCzAA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8is7on3KMJjFfTupXxS2jc6CvWJoustFFiCe6J49biROQvseUK
	S++bcEFMipb7ovU0qpSr/FeKH/CVI/ozyX5i6zcplRoqZes2f7kimkzo
X-Gm-Gg: AYBFou1JIbeHUPGTuXzFpUo1fG/EBeC27lu6y8zsQ3ZTMgWCKXFtqTRys8BMNFZKEPu
	LlHojzbbu++bbkopJRuhM4YCdtCkUbK0gbmrzmY9Zfaz5j7j+oXdVEipsh1NaSTCHtdRkSEaJ5O
	5P4drQoY/uFQlPYWeLdzPCfA1qbEIfEvLAAispxNBxJanbCw6J1Sia6f5/40Uv2uVXQBvlAxAUz
	+EPj4DaqpMYr5gnq1l/RBac3mqVco+n6J4TdjwJGyZUsBOY8091AfMFnaEreJL2iVfsO74QPHCU
	XFJ7H1jvIlTKH4rxe/WxRi861nprHDapuncoxF1z1OHFi+mwGpR2/PZTMKG9BYfvud4fyhkN8H0
	LMB2/8NyzAkPP1TrT8Rlr7dZ0duCqi2uguvwfSKBtQv3nJ5uIwfoKeDJp+G1vyHMrxyfrJb8jRB
	Bve2LQHqYuy0pHwSxoGv9r4NXwsv14ziKvxjcTxpyEfm8xOgwRK71FofuIVC2cnhbNBUXt8eyFl
	rmmVQTJuqna67NnDEAHVWNkIP9IibxxLq5YEsyG56vuJtjvsN0qP8xnDXYEHfUCQCw0MCXrAZtt
	ya6uTswqvuHkHuRt3Q7m91uiDlwkez7t0iV+BzBz89E9FlIj3d58yQ==
X-Received: by 2002:a17:90b:564e:b0:3a0:d7f2:5a58 with SMTP id 98e67ed59e1d1-3b1678cf0a3mr1857467a91.3.1794316582495;
        Tue, 10 Nov 2026 05:16:22 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:16:22 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>
Subject: [PATCH v4 11/33] dmaengine: mmp_tdma: hook completions to dmaengine BH
Date: Tue, 10 Nov 2026 05:13:11 -0800
Message-ID: <a2c1dc1636f90da881567ff0166f32bab68e6cef.1794315350.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794315350.git.allen.lkml@gmail.com>
References: <cover.1794315350.git.allen.lkml@gmail.com>
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the per-channel tasklet with the shared dmaengine BH helper.
The handler continues to run in softirq context while dmaengine owns
the common scheduling and teardown mechanism.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/mmp_tdma.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/mmp_tdma.c b/drivers/dma/mmp_tdma.c
index d7dd58970060..873b383e405a 100644
--- a/drivers/dma/mmp_tdma.c
+++ b/drivers/dma/mmp_tdma.c
@@ -102,7 +102,6 @@ struct mmp_tdma_chan {
 	struct device			*dev;
 	struct dma_chan			chan;
 	struct dma_async_tx_descriptor	desc;
-	struct tasklet_struct		tasklet;
 
 	struct mmp_tdma_desc		*desc_arr;
 	dma_addr_t			desc_arr_phys;
@@ -320,7 +319,7 @@ static irqreturn_t mmp_tdma_chan_handler(int irq, void *dev_id)
 	struct mmp_tdma_chan *tdmac = dev_id;
 
 	if (mmp_tdma_clear_chan_irq(tdmac) == 0) {
-		tasklet_schedule(&tdmac->tasklet);
+		dmaengine_schedule_bh(&tdmac->chan);
 		return IRQ_HANDLED;
 	} else
 		return IRQ_NONE;
@@ -346,9 +345,9 @@ static irqreturn_t mmp_tdma_int_handler(int irq, void *dev_id)
 		return IRQ_NONE;
 }
 
-static void dma_do_tasklet(struct tasklet_struct *t)
+static void dma_do_tasklet(struct dma_chan *c)
 {
-	struct mmp_tdma_chan *tdmac = from_tasklet(tdmac, t, tasklet);
+	struct mmp_tdma_chan *tdmac = container_of(c, struct mmp_tdma_chan, chan);
 
 	dmaengine_desc_get_callback_invoke(&tdmac->desc, NULL);
 }
@@ -583,7 +582,7 @@ static int mmp_tdma_chan_init(struct mmp_tdma_device *tdev,
 	tdmac->pool	   = pool;
 	tdmac->status = DMA_COMPLETE;
 	tdev->tdmac[tdmac->idx] = tdmac;
-	tasklet_setup(&tdmac->tasklet, dma_do_tasklet);
+	dmaengine_init_bh(&tdmac->chan, dma_do_tasklet);
 
 	/* add the channel to tdma_chan list */
 	list_add_tail(&tdmac->chan.device_node,
-- 
2.43.0

