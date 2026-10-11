Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CE52FE56F
	for <dmaengine@vger.kernel.org>; Sun, 11 Oct 2026 20:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791750251; cv=none; b=cGr5fG8VKgVLZqhuHV9Fn2XMB57zclH5CUYaYs1o5vvITm+5fgvFY5YA7qr8IimJaKg1pkW9aa0r8TOPxWv8dZ7Xl9TvEO8MOROFJvJn2GjPzOkuans4hZm5RMjSTEJF5ugGwxsBo2Fykg6iyzGQdgLcT0QQPoEpQXr8dgLWNZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791750251; c=relaxed/simple;
	bh=JhCQBqYnJdpdOwhBA8D+Toq/EXOxfct68OJa+cDfYkM=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=JHpFxukT6CrRmC33+DPqPMiYqsyg5LJqapxJlbKOVwe4oXGJtXnEK95xuPggsd2IWWtqgFrK5qqrbBHQaUEXy08pU1CMeZ9d2HjdxExn+MiNQ1phB5Ev8d1JGJceIc8xT/Qor8wpFdFwIa9CLkY8QwBHMcDIM/VxNmhTL3tQaYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bElK1Wea; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bElK1Wea"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-53397554beaso14904931cf.3
        for <dmaengine@vger.kernel.org>; Sun, 11 Oct 2026 13:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791750249; x=1792355049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pWMpy5IfG30fH79TNnvrohqFgTd2rKQhe4mM8EE1gH4=;
        b=bElK1WeaOgXdYGopdQ1zlkiXGhfwhEhzs/L9qFIxSMGHAmxoypzSbxzgZPZ54pXOpe
         sdnaq+ia+zToE/aqB1ST//E4pxXdOM6UEEqhSEJK9C87A/M8Px4/w/Y2Zy0sf2i9DQ4s
         xcE5+rMl5MrmjSTDGnO5ihG8qYbxHv2L4JQJGtOu63CUXIKJFqte4SBss5C/AMM7/JiX
         FhguIwKxUNJhMys1kRvJLttqjBVAo5/bGrEP+X4V/idujg20QHuaTyNek5MQB+sXkyxn
         z8ywd4EqWZhygmeekVWOV1wDh3SFjDpJNo4gY0DTsJj1IDDdxqdL+4JCk6chJOA7x8pY
         HsIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791750249; x=1792355049;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pWMpy5IfG30fH79TNnvrohqFgTd2rKQhe4mM8EE1gH4=;
        b=CyeFTqPcli+J/MOeqsv8PfXXBlUWszZ8JcEcQPOjjy+vXU+yvy/k78K0pLc+wGBDeW
         AXTRiCSORlFWAQGLpyMm4V88nCeBsHks5myktolIEmX179HsOlx2u6YNfwBttGTWdAni
         E6szZ6lV2Rxf+6Og2CJrKEBziJ9patsXLBTmuKIaalbAk7Db8BxnPL0f41hDb0FvOTOM
         HZW/oG+vslUcwL7KxBUdzlTzI1mejEk3SIeI4VQ4I0qOewKLcqjvB4TzG7nmre8rZj0L
         aey+AqEZUW8OG4VUYqRYCe5WcHNTCe/Vpa6uKP6fwFne6y9O2IEoXDJZiwtltPAtbOHd
         OlUg==
X-Forwarded-Encrypted: i=1; AKwUvBxRsxO0ogIiosS8D16FiIVrESxsqjolW1Fc6gHhhN1KZDatJ7MipBmYH9qQ1ccGzzUvq6Q3D/86TXk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPuHsOqol3gofjWfg/4jGjmb94OZG2v0rKI9yHZfdiLq/u5oS0
	psDfLAvp1e6UPf2jnsUD+qXjhDOz50KYrjolcBq3GO5NDk6a0fnWOkE=
X-Gm-Gg: AYBFou26SwujXzkhZxolDTukszNlxrxU5+AKM88kv/p+UiDS8k6YGIsaFfWVbuNjIwW
	h3SVIE0wJY67c07PYOR+NfYx5rol8WdNsWMigmjkEC1hvTTT9yA9lM/LbfyXxAvFPxN/KMJsMTw
	tyhS+Lc9BbahMPOZiXC6Qx7ckIZktxCwvtiIuq7+MVoHfjY0cMJPop1TqwForJNfpWH3jvpD6Rj
	qFSCSUE0+l6FHuCNXTigTrVLaNMigxesNZUsXFdvRjUOirjw2lC6FedqRPxGOoPEzB3+M9u5/X7
	vD+qBBKiG2q6TIopVBxpAGEllBipizjijXOuXFgge6Nfpq/XhZDTp+qxuMtziP61YgsPfj5hhUg
	datSGhq2G6seII2YmXI6/NCptvNO15jLpyYKBDoTABKUtlE9n2XMnnEKTFkGcE8ik52u4sot8n0
	jyzas1xS8X4OKX0TSebFDGkDodsVVzCDnnzoxHRf3E7VZ8VsuPxJXBfwDGhEamSitsh+BEUaiWr
	4U/n7FoxJ+0sgTlwOIFxwn+MasbwvdXd06IGX9dUgs6Qx0iSjHWzfeCQ9qtPP7ASpjYqNlW2v6h
	SFtS5njDMepX6VjNwU+Oglw/4z2V
X-Received: by 2002:ac8:6f11:0:b0:535:f20:c828 with SMTP id d75a77b69052e-5359faee760mr145505481cf.24.1791750249415;
        Sun, 11 Oct 2026 13:24:09 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b46b471sm65185221cf.1.2026.10.11.13.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 13:24:08 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] dmaengine: mmp_tdma: Release IRQs before channel tasklets and storage
Date: Sun, 11 Oct 2026 16:24:06 -0400
Message-ID: <20261011202406.1869441-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The shared IRQ is requested before the channels are initialized and
released after their storage is freed. Its handler can therefore
dereference NULL pointers or freed channel state. Pending tasklets can
also outlive the channels.

Initialize both channels before requesting the shared IRQ and add managed
tasklet cleanup for each channel. This releases IRQs before draining each
tasklet and freeing its channel storage.

This issue was found by static analysis.

Fixes: c6da0ba8dfc8 ("dmaengine: mmp_tdma: add mmp tdma support")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Compile-tested with GCC, W=1 (arm). No runtime testing.

This fix overlaps with Allen Pais's DMAengine BH v3 conversion. If that
series lands first, the cleanup should use dmaengine_kill_bh().
Link: https://lore.kernel.org/r/3cd07c8bcab908e352bf1570fb7a3c24cc0fe516.1786384168.git.allen.lkml@gmail.com/

 drivers/dma/mmp_tdma.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/mmp_tdma.c b/drivers/dma/mmp_tdma.c
index ba03321..965cdd6 100644
--- a/drivers/dma/mmp_tdma.c
+++ b/drivers/dma/mmp_tdma.c
@@ -353,6 +353,13 @@ static void dma_do_tasklet(struct tasklet_struct *t)
 	dmaengine_desc_get_callback_invoke(&tdmac->desc, NULL);
 }
 
+static void mmp_tdma_kill_tasklet(void *data)
+{
+	struct mmp_tdma_chan *tdmac = data;
+
+	tasklet_kill(&tdmac->tasklet);
+}
+
 static void mmp_tdma_free_descriptor(struct mmp_tdma_chan *tdmac)
 {
 	struct gen_pool *gpool;
@@ -562,6 +569,7 @@ static int mmp_tdma_chan_init(struct mmp_tdma_device *tdev,
 					int type, struct gen_pool *pool)
 {
 	struct mmp_tdma_chan *tdmac;
+	int ret;
 
 	if (idx >= TDMA_CHANNEL_NUM) {
 		dev_err(tdev->dev, "too many channels for device!\n");
@@ -584,6 +592,9 @@ static int mmp_tdma_chan_init(struct mmp_tdma_device *tdev,
 	tdmac->status = DMA_COMPLETE;
 	tdev->tdmac[tdmac->idx] = tdmac;
 	tasklet_setup(&tdmac->tasklet, dma_do_tasklet);
+	ret = devm_add_action_or_reset(tdev->dev, mmp_tdma_kill_tasklet, tdmac);
+	if (ret)
+		return ret;
 
 	/* add the channel to tdma_chan list */
 	list_add_tail(&tdmac->chan.device_node,
@@ -666,14 +677,6 @@ static int mmp_tdma_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 
-	if (irq_num != chan_num) {
-		irq = platform_get_irq(pdev, 0);
-		ret = devm_request_irq(&pdev->dev, irq,
-			mmp_tdma_int_handler, IRQF_SHARED, "tdma", tdev);
-		if (ret)
-			return ret;
-	}
-
 	/* initialize channel parameters */
 	for (i = 0; i < chan_num; i++) {
 		irq = (irq_num != chan_num) ? 0 : platform_get_irq(pdev, i);
@@ -682,6 +685,15 @@ static int mmp_tdma_probe(struct platform_device *pdev)
 			return ret;
 	}
 
+	/* Release the shared IRQ before draining and freeing the channels. */
+	if (irq_num != chan_num) {
+		irq = platform_get_irq(pdev, 0);
+		ret = devm_request_irq(&pdev->dev, irq, mmp_tdma_int_handler,
+				       IRQF_SHARED, "tdma", tdev);
+		if (ret)
+			return ret;
+	}
+
 	dma_cap_set(DMA_SLAVE, tdev->device.cap_mask);
 	dma_cap_set(DMA_CYCLIC, tdev->device.cap_mask);
 	tdev->device.dev = &pdev->dev;
