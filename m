Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793734694;
	b=jX6LajZZWGlZNB8BL73s7h8PWIxGZMYMOqAISJWFiLdK4VuNHWzM7l1/HtOmUc0m/D9p
	 QBQ2228S8vvUK3PEyTm+YyLce3BjGxE8Bh0lokdrpPPO0ZmN3lHfYWwDH4S7MonJgBmnf
	 Fu3KXWFOAttvByPEaLSlG+r8E+Yk7EhJRblRFxV72h7dHiSCejIDnwlfWI8T9QtnRkX9K
	 73VsTr0YCMQtGbadea35rl1XnTd9YDvzfyPMHLNzv8is0kAv1LtqcK2YLqj81xNk5XAdK
	 tHjtleqoQsqr5bmUmmI7+BNpbPjJcxjZcw5hQNqfQeNvmasAYj7d9OfuXVNxt5BeRPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793734694;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=d4hMQmwIgsvART1qT+lR5n44NTeGYh1EUuuwM0Np57c=;
	b=ghUObq+A6L86q+nYtbqviHaTh9YiJG1vzm0MHuqr0Y7+JPt64NPsyCcbzdZNXyqYswRH
	 rFAMu2gkexsh/C035QiMc8ILT3b0N8BA2+17T5yMR5v7WWU1b45nE6rEA78+6Oa62QYvA
	 UOxO7P/kBQfiUcCQNFU6xf50cZsYnDb1dF0/15cjrLibB7SUOS2/5+JHAY8oTiKO5s3bS
	 q7YzWe6mFFLJbkkJEZDgNonvdffqWg2A+dpy0FYytXBmY4VoiCg0FMzDIJ4fyJrMfrPfB
	 KhQUI6vSqS55g0OwQ4t8fHpaI2YWJ+WiF6sF4FhncVFmv54A88yuetAesLJWQzJBZiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=d10f2oT1;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1F3606D810
	for <dmaengine@vger.kernel.org>; Tue,  3 Nov 2026 19:38:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D1F3606D810
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=d10f2oT1
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so47329695e9.3
        for <dmaengine@vger.kernel.org>; Tue, 03 Nov 2026 11:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793734692; x=1794339492; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d4hMQmwIgsvART1qT+lR5n44NTeGYh1EUuuwM0Np57c=;
        b=d10f2oT1bDEU2Cq8Gs/pPNbUmM+Zy1dXr+ZAb3ZisXWERlzDu60bNTpRpaFkdec4pc
         alF2JIXYmc7Qyvq+ORU7OhTiHVwxqXU0d0Ps65FEbcJepQGJ+Awuggv26P5JZXi2J4py
         84SKut2YMCLT/WHl+vb2GStWKkQ4TDbAjyD3Q138WQSr6kr7+uqy6MRz9O7oO3OvC8hy
         A+8WziwjuEsIQMmGISW+ZkmiHSJUpQx8ScfKIKfHNdaykMqkSb0XBXw854V446TUW91b
         sVwlPqQxD/qfYEW12fT7C0tsygmQO5vq391A4o6wg6rOVWsuMVD72hHW07pXg1OH4e78
         tqVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793734692; x=1794339492;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d4hMQmwIgsvART1qT+lR5n44NTeGYh1EUuuwM0Np57c=;
        b=fMPldKClrpU+u41rdgK1HBBaOrhAIlW+J58VDPOegxbgSAmQA/8EzlkLLHRuo80Bu6
         SzEDtaS5abAdKS+86XX2jMaR+Ik64PgJYIT9ZW4E3CRktlENg5x/vXEnUgaCvBzUWvLv
         ePPUCOJGuJhPLQSfjCBYAfnuDnNJ96NnM756exF3ag0i9xFfMO+RLuBVrxAOR+SHYJjl
         nOuER2I6GKt8p0Nog9yVAGEzGM2/vTPmhpf3Id0UaSJFONaN5sgKQqNxJGRaopuHb4LU
         A//WdTUzmTe48dbV9XD2IPatwmAFZhiWe/X6tZ0B7hwdrTnzmEZLjJWzNhTAAqISPTFv
         W9ww==
X-Gm-Message-State: APuU4Z+18XcBEnU6vV1AhQwdiPtGcHHCQCNrrqdYK13j5BenSxPo5kVg
	3NAcY/Z89ai2doRpveOoTnMp1jmSrgkC2HiIWYa61jRMQU5WRwdmR4/msB/VqDpWYKs=
X-Gm-Gg: AYBFou1mB5eYfvgNkh5bblk7bhdoVeh//J7/fmN2+tQx/ZmY4k85RjTcIOs/oQJFTBz
	qpswkvxDUGaeQo/LRoDWlF4GB0IV25DOW6l5K+3vZhSavasW7A4QsH0zSv9aNHVoWLm80a4YH2H
	NH/R+xXXk6vB3DNJ576D1ycAJyUkXyGNeqrtklVD0jNlmTKRqaW5dTq8jJzyz90r3bFWGWrz2hS
	tu5+fyQ5MACAOeOMMIS7Ey+ATxg079MAhKqwAC3V9HDAyfxcFa7a/GjK2uyAjnlSmMUuGRokRz4
	BcwKZD+Bx+aeJkc4P2XMVspBBTNRCUlMoQd+pZ/Z0qsDUNKdxc6CmgkCLvevnY5euNLMYKvUmew
	663sC/XetoUdnATZpb5scb1Ygby9qa0sVIYTKAEKadn5lEfXkMgtPAHy/88FyACP+1idvg/AyQ8
	YsgVd7Jm85KQtCYKW17W7Y5V/n0+TVznO2ZhOjUFWKEG1a5vZ+gMr5S6uAPSu2TCdsq5gc0Ua5c
	59Aa5BKeJZZzeIfMC3jlBfdUfporgq6Q13CovFJbh6WfyekKBuSUALvAfpnvgYh7Kxgr71i+mfq
	kQCkGQlZTtg8WZKHi0+vtbvvxg==
X-Received: by 2002:a05:600c:8b55:b0:4a1:ddca:8b66 with SMTP id 5b1f17b1804b1-4ac19234a06mr306335255e9.31.1793734692505;
        Tue, 03 Nov 2026 11:38:12 -0800 (PST)
Received: from localhost ([2001:4090:a244:81d0:2c16:1c4d:8a04:e0bf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a98e8f9fsm88604435e9.13.2026.11.03.11.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 11:38:12 -0800 (PST)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Tue, 03 Nov 2026 20:37:31 +0100
Subject: [PATCH 4/4] dmaengine: ti: cppi41: Share register setup with
 resume
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-v7-3-topic-am335lpm-cppi41-v1-4-d7213446c5f5@baylibre.com>
References: <20261103-v7-3-topic-am335lpm-cppi41-v1-0-d7213446c5f5@baylibre.com>
In-Reply-To: <20261103-v7-3-topic-am335lpm-cppi41-v1-0-d7213446c5f5@baylibre.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Daniel Mack <zonque@gmail.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Julien Panis <jpanis@baylibre.com>, "Mendez, Judith" <jm@ti.com>, 
 "Francis, Sebin" <sebin.francis@ti.com>, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3316; i=msp@baylibre.com;
 h=from:subject:message-id; bh=WMBFq4INcBNu7YqK+yhLsA4zE2pb8zqN0QE1SNt5kRc=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqxXFhK1mdy/2jndS05y8+utDSh7Nsk2Y72Lwe3NTzflX
 am8P0u1o5SFQYyLQVZMkaUzMTTtv/zOY8mLlm2GmcPKBDKEgYtTACZyO5+RoXuzb/2voM1Z2mez
 lq8RW99cYBq6v4rz85RrKpNlOAQPX2FkeHgibuGCv9v4C7REFCecZG57mc9byH7hmsLOcpc7zTb
 GfAA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

Both probe and resume basically do the same thing and setup the
registers. But resume has its own copy of the register writes. This will
always lead to differences when changes are made.

Create a separate function that is used by both probe and resume.
Note that the ordering is slightly different but I didn't see or found
any issues with the new order while testing.

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 drivers/dma/ti/cppi41.c | 41 ++++++++++++++++++++---------------------
 1 file changed, 20 insertions(+), 21 deletions(-)

diff --git a/drivers/dma/ti/cppi41.c b/drivers/dma/ti/cppi41.c
index e2a089066c6d..b62a26c2659d 100644
--- a/drivers/dma/ti/cppi41.c
+++ b/drivers/dma/ti/cppi41.c
@@ -873,9 +873,6 @@ static int init_descs(struct device *dev, struct cppi41_dd *cdd)
 				&cdd->descs_phys, GFP_KERNEL);
 		if (!cdd->cd)
 			return -ENOMEM;
-
-		cppi_writel(cdd->descs_phys, cdd->qmgr_mem + QMGR_MEMBASE(i));
-		cppi_writel(cppi41_memctrl(i), cdd->qmgr_mem + QMGR_MEMCTRL(i));
 	}
 	return 0;
 }
@@ -903,6 +900,24 @@ static void init_sched(struct cppi41_dd *cdd)
 	cppi_writel(reg, cdd->sched_mem + DMA_SCHED_CTRL);
 }
 
+/* Program the registers, also used to restore the context on resume */
+static void cppi41_init_hw(struct cppi41_dd *cdd)
+{
+	int i;
+
+	cppi_writel(cdd->scratch_phys, cdd->qmgr_mem + QMGR_LRAM0_BASE);
+	cppi_writel(TOTAL_DESCS_NUM, cdd->qmgr_mem + QMGR_LRAM_SIZE);
+	cppi_writel(0, cdd->qmgr_mem + QMGR_LRAM1_BASE);
+
+	for (i = 0; i < DESCS_AREAS; i++) {
+		cppi_writel(cdd->descs_phys, cdd->qmgr_mem + QMGR_MEMBASE(i));
+		cppi_writel(cppi41_memctrl(i), cdd->qmgr_mem + QMGR_MEMCTRL(i));
+	}
+
+	cppi_writel(cdd->td_queue.submit, cdd->ctrl_mem + DMA_TDFDQ);
+	init_sched(cdd);
+}
+
 static int init_cppi41(struct device *dev, struct cppi41_dd *cdd)
 {
 	int ret;
@@ -913,16 +928,11 @@ static int init_cppi41(struct device *dev, struct cppi41_dd *cdd)
 	if (!cdd->qmgr_scratch)
 		return -ENOMEM;
 
-	cppi_writel(cdd->scratch_phys, cdd->qmgr_mem + QMGR_LRAM0_BASE);
-	cppi_writel(TOTAL_DESCS_NUM, cdd->qmgr_mem + QMGR_LRAM_SIZE);
-	cppi_writel(0, cdd->qmgr_mem + QMGR_LRAM1_BASE);
-
 	ret = init_descs(dev, cdd);
 	if (ret)
 		goto err_td;
 
-	cppi_writel(cdd->td_queue.submit, cdd->ctrl_mem + DMA_TDFDQ);
-	init_sched(cdd);
+	cppi41_init_hw(cdd);
 
 	return 0;
 err_td:
@@ -1187,26 +1197,15 @@ static int __maybe_unused cppi41_resume(struct device *dev)
 {
 	struct cppi41_dd *cdd = dev_get_drvdata(dev);
 	struct cppi41_channel *c;
-	int i;
 
 	if (pm_runtime_status_suspended(dev))
 		return 0;
 
-	for (i = 0; i < DESCS_AREAS; i++) {
-		cppi_writel(cdd->descs_phys, cdd->qmgr_mem + QMGR_MEMBASE(i));
-		cppi_writel(cppi41_memctrl(i), cdd->qmgr_mem + QMGR_MEMCTRL(i));
-	}
-
 	list_for_each_entry(c, &cdd->ddev.channels, chan.device_node)
 		if (!c->is_tx)
 			cppi_writel(c->q_num, c->gcr_reg + RXHPCRA0);
 
-	init_sched(cdd);
-
-	cppi_writel(cdd->td_queue.submit, cdd->ctrl_mem + DMA_TDFDQ);
-	cppi_writel(cdd->scratch_phys, cdd->qmgr_mem + QMGR_LRAM0_BASE);
-	cppi_writel(QMGR_SCRATCH_SIZE, cdd->qmgr_mem + QMGR_LRAM_SIZE);
-	cppi_writel(0, cdd->qmgr_mem + QMGR_LRAM1_BASE);
+	cppi41_init_hw(cdd);
 
 	cdd->ctx_lost = false;
 

-- 
2.55.0

