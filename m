Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316549;
	b=oEmjviw7v927hyeSf+zCmuTgbviEZdJWHPkjajyIhFTFvgLq8bnuzlacvBELxcRwTzAA
	 9tTKqmvLfhk6rsBM7SZnVImoln342o3R73E0B4viQCHEpGfGs5xewncWmq2euEJyMWtGZ
	 Bq3Ymb+zhFCQtix7aRU3U+f0qbLwhtEFrWbB1cq81UBx9QRWcnQwP1cETeTgdri1qeCtC
	 YadSPDDh1lemg0V86hwouILGU+yFLe5SjWCkpJb/sQtNNrtTay0bBRUTOoaOgIjXdWEWw
	 /QOa6IVPQfj1zRB5z153h+wH0n//p8QWEQMBqJGoNiJll1YML9UQrQ5bREK1QHDhBEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316549;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tmWyDYjfuijNjJiMSishS4j7xOVi0f/pb9IeEqewhlw=;
	b=C8ocz5s6q08aF2CfnfXJ72ZkvZun5Ur01JT0l8aSMlge/W5Rph4DPesL9qIMu8NjripZ
	 gr6lkCFsc3ngvo2KhNsKt6fO14BUsGapIr5UAx3Oy+HBrqftm1CLs6w2qVbBvljL9a7Qb
	 OB2cWcVgc2XJqWACJfUcqzHSbp7i1NFw4bbV43YIBI5eQJSzbTUvPZBCZlhwp/BGFhRSN
	 kh74kT11AGG56YMysG5Rr6CfqC6oJ1s9RevlRiALmrzQ1WP92sdK4mcsf7prNf1Pw8rAE
	 2DMbanfPobHgOgb64z2jBng81FbgnFh6ResOVMw/6AVV04CTb5vD/LRWbHLx4HQ9ZuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="PLgT/NgP";
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D194606B6C3
	for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 13:15:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D194606B6C3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PLgT/NgP
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ae2b7e1e17so1244318a91.3
        for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 05:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316548; x=1794921348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tmWyDYjfuijNjJiMSishS4j7xOVi0f/pb9IeEqewhlw=;
        b=PLgT/NgPPcQZ7blFNaWoQ/9tiP04afaZP19I1opsbDSYxDRswCp0tnw7aF6hB+LVW/
         1MCELUCgW+aAZZyyPSJenCWHlYOUXIiqbNF41aUEf2fH8mgzv+4/32Xe6KpT3ZoyMc4f
         vjitGOfSUL9e8FGZptXqU1VAEdJRPW57UhrFdxvnTzBWf0SprZY1eBkLj7b25mk+DCu+
         a0CWFJW8vEQrsPFrrWAgzlStkkky/5EMXO2wDpau2Wm/X2v+QLecVJoqFTfsDbYSbNRu
         pn7j0lpf4WVPxy6Bak6M1oNKV3us+g94qKw5PFFOJQCWiomJiqvBATVU8KweFuS8CCY6
         lCIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316548; x=1794921348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tmWyDYjfuijNjJiMSishS4j7xOVi0f/pb9IeEqewhlw=;
        b=NAKaKhOgw/X+tAwAOUali01BA7TmlsMIWJDcDg5da3f5lHewEGpzZWJrTe63qCpe3L
         PwKPvxLly3VoDyMF1GiEeZlJy+ULWv0S63USf5INBIWSlYt2du5XUVZj9DYkzphYYjFm
         qQONn4Co4Ffe35IEQ3Ww49fLcWnsx14RlKAoWlKlY4WtOGEGLh7woFK7FtugZoF5KA7q
         /CyfoqOCt9NbcGubZ9BnNZtx1c10K++i0PaVczdfqAxDmd8x4a1qn+DawN1mo5WtQAOo
         6efqT6zQ6vOuyQzyitUoWKhcA+DBKSxWmUYWNVIEIAWIUgKOUczApmWi5a5jToUulWcM
         kSgQ==
X-Forwarded-Encrypted: i=1; AL+hErE7SfVq4Ng1GSb97vsy8XtuEIGa5WmwIU0AUFWtezXawSk2/cFSqeorsD3kJ8pPmrzWQyLtD8QpPFQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/S759CyD8SMjUtA0hjEVs9L+5nKKrXCKv6gFxQ4bKwIh6teRwo
	NDfGIFB8i9xvdfi145jKmXV91izWkGxLGwJbGKFfHSVI3791HIijbFRp
X-Gm-Gg: AYBFou3b3jxsaTiNRfyKiACU7PlVj5XYvh51V7O8GOdoT2S4ULvZn+JCOVu4nKwr6mC
	xvf5/mhKJ1n2cziH4sINuhuAGXMgbnRSvA8+9cpT8BB1Ac66KU80J3Xv/LWGlexhFbKG6iPgmv3
	CCtlSGC7FEY4Kdcrzx2zDDSskNSOIHe2Xx9Bn6huMRN/tKUdJjVIU+oM1KyuKKSGoDoodDiCNNz
	rSVjwEf6AO17lajG+i083ZOsFbDfBJKD3jClJRnSbQe8f1dKKaI+G27R7PFyaYMcur4y9ugaPrs
	nKzWlwaoCVRirLQ3sWgO5n91gCLQIt9sMwvVKoU4Fz5T5RzZsItKZagtXsVH/egklK8gk+qh2b/
	ur7e8OFgaqbuY9Dd1Eka4XTzMpCzkZCGItb33Ypvy8Q5Ce+02Cc1KfWttTn/UsOIkna4rVhkXkQ
	0QRz90wcgddExu/6Jfge8lhGv3PvMppruPKgEyj4voyVqe8JOabFdLGF754ik9oliCjsvw0/0jy
	RTYB6S9pjBhub5rqeL1SEt0KmsZ3D25fLqolvNvCLG/+eDsSkfufpG00Ch6ncDCkLPeMobgYfgM
	Z0bOYyLcyqrNzaI3/sjUT4wj7T5eD7ya
X-Received: by 2002:a17:90a:d450:b0:3ab:36c4:b502 with SMTP id 98e67ed59e1d1-3b166cdd823mr2893205a91.30.1794316548329;
        Tue, 10 Nov 2026 05:15:48 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:15:48 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Frank Li <Frank.Li@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 03/33] dmaengine: apple-admac: use dmaengine BH callback
Date: Tue, 10 Nov 2026 05:13:03 -0800
Message-ID: <c1c55434e01772a1ecd12044feffe220f06cd72e.1794315350.git.allen.lkml@gmail.com>
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
 drivers/dma/apple-admac.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/dma/apple-admac.c b/drivers/dma/apple-admac.c
index 4531a301c018..2eb863d1bb58 100644
--- a/drivers/dma/apple-admac.c
+++ b/drivers/dma/apple-admac.c
@@ -97,7 +97,6 @@ struct admac_chan {
 	unsigned int no;
 	struct admac_data *host;
 	struct dma_chan chan;
-	struct tasklet_struct tasklet;
 
 	u32 carveout;
 
@@ -530,10 +529,7 @@ static int admac_terminate_all(struct dma_chan *chan)
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
@@ -552,7 +548,7 @@ static void admac_synchronize(struct dma_chan *chan)
 	list_splice_tail_init(&adchan->to_free, &head);
 	spin_unlock_irqrestore(&adchan->lock, flags);
 
-	tasklet_kill(&adchan->tasklet);
+	dmaengine_kill_bh(&adchan->chan);
 
 	list_for_each_entry_safe(adtx, _adtx, &head, node) {
 		list_del(&adtx->node);
@@ -671,7 +667,7 @@ static void admac_handle_status_desc_done(struct admac_data *ad, int channo)
 		tx->reclaimed_pos %= 2 * tx->buf_len;
 
 		admac_cyclic_write_desc(ad, channo, tx);
-		tasklet_schedule(&adchan->tasklet);
+		dmaengine_schedule_bh(&adchan->chan);
 	}
 	spin_unlock_irqrestore(&adchan->lock, flags);
 }
@@ -721,9 +717,9 @@ static irqreturn_t admac_interrupt(int irq, void *devid)
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
@@ -909,7 +905,7 @@ static int admac_probe(struct platform_device *pdev)
 		INIT_LIST_HEAD(&adchan->issued);
 		INIT_LIST_HEAD(&adchan->to_free);
 		list_add_tail(&adchan->chan.device_node, &dma->channels);
-		tasklet_setup(&adchan->tasklet, admac_chan_tasklet);
+		dmaengine_init_bh(&adchan->chan, admac_chan_bh);
 	}
 
 	err = reset_control_reset(ad->rstc);
-- 
2.43.0

