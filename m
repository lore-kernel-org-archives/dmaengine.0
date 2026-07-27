Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CD2438485
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184861; cv=none; b=uA2INHRUKoJPlF+bqTVrj+7r47v4zx5zY4rQRF7BgfpNcSodHjrITM95a0jB6GYwP+g8Ba9yLVTr2XvaklpVa4uguU7Qq+3SlzgUNJMuxg71O15S+JvRAyKaD9kYl8IwJgMiJ9NvD/iocvGHtk6FZBebKMcfKu2/MrUwnycJMbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184861; c=relaxed/simple;
	bh=SQwxSUtIBBj4RrttKVUl3hvy9l70UXNdS3dcjJr2+ZM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SCUmpw2kkfl2/8yAzISVRhee2xbQfS+E+KIr55uMvqQ/yqQOB/FhoCabiBfd5u9DKiSMEKGlAGGnSJqfMVyPQRpb0FDgx4VlmezT4c7aoztOXJPvh5q+zQNA7ASsTwMwU7Y+uOQM4b/MgpbH+z/+/UIXRKqL3Lt+eU+K54cZCwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BEytKq1M; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BEytKq1M"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-845c92bc464so2608797b3a.2
        for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 13:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184859; x=1785789659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L4xnrxY6hyCblG5rdEl+ABf/Yty/8w8iGAzjnhjNo58=;
        b=BEytKq1MQlSb+sfPByRke9lCVcdKHX+tfm7YWpRNxacPcre/IWr+V/yvLvNWpN/xuW
         f39GR1K5wZdAef2UeTWlWNlnuHOlyrL1OLKWY70sQ+JSoiAd/gxGs+YvQfXINGXnhfvD
         thMPKHLzaJ7JED1i5driSW1DTkyZNfGbjCYcZ8S8KtkTez7gJvjXvkWAtfEv718WA+On
         6CTncppdnfpw8aN84pR+wxJi8BWsSZmW41UF4zmWpPysTvdJboEpfI6emjyOBytVEacY
         nEcWdmCnaElz27P204YIZlANr8tez8gEApZOsTCSiLenPtTxTyA5p17tcRT+Yj0u5+K8
         fiVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184859; x=1785789659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L4xnrxY6hyCblG5rdEl+ABf/Yty/8w8iGAzjnhjNo58=;
        b=hk0hZddfUIg418OR9b7MSGhalfX0cpdD7uIZUn5fUbZ0EVkhuJv967nNqnyAKQzRrB
         Tp6jmdCeouAjaIDPAM+MrwMQieyqyjWSkl1IJitHbPN5ChdPrsRpQKwrBQtjF4tIjnbn
         TpdEjmDXg+u6P2US+AhrV2jzd7dfrGL5yiHnfVOElqCPYl9oGlkk2SmZIpto9Ce+qW2O
         6mTay1IaijoeuFNZAiFz+DQw3yLe+ptbsZ+xA4IXbY0YbJJkV2xruK/dStPSxd8OIcq8
         pPZ9EF5ztexYzlNMyRhBmC3ejsmJUiQK3UV1pNkQl6LVCc1T7k5zdpeChNdmHLJ/Rjf3
         nJhQ==
X-Forwarded-Encrypted: i=1; AHgh+RoCVTDuQvQpm++/cikf7ic7b/LMM+9gDBHOQyyCCxccQn4YPexZxaCZC+JJqCSxPsK4PcWZpWVq/7A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBdk+XwNL8swzbDGq1JXMctrxjafEFEC8Yc+MaF6H4PdDzROvG
	vV5t9U5SIik8B0XJ8U8AGn2G02BNJMRb4wM0eHfwd6kge6cJLLLx+XZD
X-Gm-Gg: AR+sD12b/TVAdBap7Vu+j0DTecbEvSlsgxUu29kjDyTXTfNdSxnQPOEZWi5fmmX8EbQ
	pf8oZi2HkUvIIqvD4VpLswl7dQjVF0Hf7EK8zGMSb6uKinclYfiGft3diXgHqlmLHQyIJiNZxeR
	FefDTVBjw58YHef4UCD2WF94cqVIbZ/uz8/0+8i36QKa47oLJ3/Jpqp9gW2tTHd9ddXBzwvrF+X
	8zPqXeNCK20wYxndIhhhnSRFoiFR1201/T3s3LpJ8VlTflE9jjZmcuv2kYqnmfp04aisHwatum7
	Oyfp8BLhVohAsEGsjjBWBzIx6kgpSwrgO0gb01M1hC0ugd30NbN+ZRPUsi9fyxDoMfAdDMKCV9k
	w1OKZMucFuoVcZFeMZPJg8fbX47cI59kWvChzWIkUunRKNtctdLAiHlaj5nOZR83QQ6bT7HmpkS
	XpWtBxUdz4sBtRXVMM9LSH9hNTrwA14ZaoAzK2CpcTr5jYBK95OrTYMS1ZqKn1+4g=
X-Received: by 2002:a05:6a00:1790:b0:84e:831:9a1a with SMTP id d2e1a72fcca58-84e594683e4mr8126317b3a.21.1785184859453;
        Mon, 27 Jul 2026 13:40:59 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e533d1351sm3583338b3a.39.2026.07.27.13.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:40:58 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>
Subject: [PATCH v2 55/64] dmaengine: dma-axi-dmac: use dma_chan_kill_bh
Date: Mon, 27 Jul 2026 13:39:17 -0700
Message-ID: <8b42f611df2e037246dbf58d21f3d3bfffe17de1.1785183549.git.allen.lkml@gmail.com>
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

virt-dma now dispatches completion callbacks through per-channel BH
work instead of its tasklet. Cancel that work during teardown before
channel storage is released.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/dma-axi-dmac.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/dma-axi-dmac.c b/drivers/dma/dma-axi-dmac.c
index d47ff27e1408..d26bfa852806 100644
--- a/drivers/dma/dma-axi-dmac.c
+++ b/drivers/dma/dma-axi-dmac.c
@@ -1195,9 +1195,11 @@ static int axi_dmac_detect_caps(struct axi_dmac *dmac, unsigned int version)
 	return 0;
 }
 
-static void axi_dmac_tasklet_kill(void *task)
+static void axi_dmac_kill_bh(void *data)
 {
-	tasklet_kill(task);
+	struct dma_chan *chan = data;
+
+	dma_chan_kill_bh(chan);
 }
 
 static void axi_dmac_free_dma_controller(void *of_node)
@@ -1302,8 +1304,8 @@ static int axi_dmac_probe(struct platform_device *pdev)
 	 * Put the action in here so it get's done before unregistering the DMA
 	 * device.
 	 */
-	ret = devm_add_action_or_reset(&pdev->dev, axi_dmac_tasklet_kill,
-				       &dmac->chan.vchan.task);
+	ret = devm_add_action_or_reset(&pdev->dev, axi_dmac_kill_bh,
+				       &dmac->chan.vchan.chan);
 	if (ret)
 		return ret;
 
-- 
2.43.0

