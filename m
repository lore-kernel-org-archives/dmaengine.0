Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E57435A87
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 18:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786385539; cv=none; b=uDcyCP3VsMsHgL+9Dd1+G/IomlOlqmLQIyXg8w3BK4KJsbxLq2Tu9BSVfRPCy8rLfqJEowsJWhBR4DaUS1fctTi6+cMdMA6LkwaEBsr8jnYXBOhg0TzF/MNByVxOjzG3RDfwGVul/hCkVn1hErdV3DYUPE15LCTNYYLJuFu34fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786385539; c=relaxed/simple;
	bh=bG3LJpjkYmT6FBZfH9s4KWN3hchwrzKsnI6tFBWtiCI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V9mX6AmZDC5OtzH/RYqp/y/UUXfgBGVq6geGqxxIE2xQoR37N7YQbQ3VxTmNDZzvsbte4MxwQmMCJazdXdZn3++Yv7t1Khu8dwotST8G9s+GJVcicL14NOWa4hLNOKatXH8BfSyeAuurhXIscjhBephASGNS4MKuDN29u5cdiSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ff2yZfLB; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ff2yZfLB"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so2477492a91.0
        for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 11:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786385537; x=1786990337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZsNf5bjfoDgYvX/JyiuMylIj+fn5WBmscP8FbbD1RRw=;
        b=Ff2yZfLB1Nkf7WuF2TJU1lwEWEyXjML/Xmvp3r9zNnNRf7nyvGs0m8OGEIxoWLhQEF
         U1eW5a7Q9IM9xAaUiTnA9NdiFGpewqNCK8A61NAKBGyL27AkNal1fI2JRw1GxMhhWhaO
         4kkSHTAYx9u+2Wkz+NynX+wtA7kA0jSGTzH44L5QCpR/wHLEeRMhDbWyYTQVrL1Llp42
         IGRnCg+QLvKqK58hdLWvH4Qm7lbeqTQbppfVDlNisBGGp3Xi4K/xS8DKRt0Kg5vnS8D7
         ieSuorFDIp6L9Iqe/kFcATgyYnFbcMRQLMc/RmV/6hQ2UJyVFSBMux7Qb9jbUIOsHajA
         nq+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786385537; x=1786990337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZsNf5bjfoDgYvX/JyiuMylIj+fn5WBmscP8FbbD1RRw=;
        b=hoCIfb8ULPNK18cezw1zQE0Xu87iPT5fzzX56HYYFXgESJ58Gs2eDSxw5FGl1bRcp3
         D5Qx5YFthzUNOaByDx3HqlQ0YAZ70KycTi5XCS6UPkNQQXIdAdry+7OBabq/8jhjDLpI
         vCOE1bGoggT3ht3ayNoEC0vm/Hzf1d7Z/Pxr3J2E57A6MHtQNi89e5Fcf9NzlNLBE2Gv
         gLUsx0oSo6uuI1zHM9kU+Ur+KLggfrht6YOXyt2xC5Miu3VSR6IkEdmcQyro1/FmRTas
         p2KEC/fol0kWhU2nBjlo3o7Gh9Y+z07hMjc9TQxtC4M5ISPN17wvk+UvmTGSuYkMhr3a
         Aduw==
X-Forwarded-Encrypted: i=1; AHgh+RqV7sJp29GztuyATm3lBqN3TOi+yDJtRUmhV93OtitSMiRbgKsPhcHY3VRq7svm6UAwyBQz9zHAeqk=@vger.kernel.org
X-Gm-Message-State: AOJu0YymfYdpAFfWQUUw83wv5SgB2yDiAwVKGzqy+xRn281jO+c2w+0S
	A1ZABJ0wHDkmZigkEg9dTIgky/fmmtbpEMFVLdd4BRxbLfWaCX31BOb0
X-Gm-Gg: AR+sD12u10l9TjrAyzysi9H+6lvL/EPdxouj5meW0mnZCE7+RfKv3HlAWocjvay88KR
	vQ6HTlt6FsgJ0jUiQN074yWE/J6BGjBnVSDFHNtpN0LQXjZdQ/p5lfsJWZUVTre/e3RFnl7zQg6
	704rGT1GOcvkkmI4Zx8dI3+1hVPEMwVpS3WwDfo5Iu/WcEGj6rZySTqjNzwy8v+pxX//SH+6GGD
	g9acZ8Lce8cH/YqoVSMoe4r05N1opCeyr4pXj7I2bmV8XCjHYive4oqHCGjOqvQymP/+go9+bVx
	sIrZIToomhixwxkEkoiRz83e8q9/PKbf4/eU2X2L/I6QsDYj07HTzuEwwfoS7rCvcROizRWWKMA
	H4B8rRKB7jAd2kyIHkE3R5m9ygUYuW7E5MHo9xo2rc0vrpIrR6Nwl0YKxVnldo7Ax/dDM4QzqTC
	YBuXtTH2wk65DVrQW3K/P9o+X8HU3BBim4jRgPRjPpoh7UT0pC8OMW2mA10xEdCBM=
X-Received: by 2002:a17:90b:224a:b0:383:5a16:bd70 with SMTP id 98e67ed59e1d1-392cca92597mr3389754a91.16.1786385537188;
        Mon, 10 Aug 2026 11:12:17 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fa9:fa00:b1a9:6513:83c6:1d23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d53b873asm472795a91.17.2026.08.10.11.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 11:12:16 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>
Subject: [PATCH v3 15/34] dmaengine: pch_dma: convert tasklet to dmaengine BH
Date: Mon, 10 Aug 2026 11:09:16 -0700
Message-ID: <920e972b55af0bcebe09383f5f00cf5dc75e5cf6.1786384168.git.allen.lkml@gmail.com>
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
 drivers/dma/pch_dma.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/pch_dma.c b/drivers/dma/pch_dma.c
index bf805f1024f6..eb372aa328a6 100644
--- a/drivers/dma/pch_dma.c
+++ b/drivers/dma/pch_dma.c
@@ -91,7 +91,6 @@ struct pch_dma_chan {
 	struct dma_chan		chan;
 	void __iomem *membase;
 	enum dma_transfer_direction dir;
-	struct tasklet_struct	tasklet;
 	unsigned long		err_status;
 
 	spinlock_t		lock;
@@ -665,9 +664,10 @@ static int pd_device_terminate_all(struct dma_chan *chan)
 	return 0;
 }
 
-static void pdc_tasklet(struct tasklet_struct *t)
+static void pdc_tasklet(struct dma_chan *c)
 {
-	struct pch_dma_chan *pd_chan = from_tasklet(pd_chan, t, tasklet);
+	struct pch_dma_chan *pd_chan = container_of(c, struct pch_dma_chan,
+						    chan);
 	unsigned long flags;
 
 	if (!pdc_is_idle(pd_chan)) {
@@ -707,7 +707,7 @@ static irqreturn_t pd_irq(int irq, void *devid)
 				if (sts0 & DMA_STATUS0_ERR(i))
 					set_bit(0, &pd_chan->err_status);
 
-				tasklet_schedule(&pd_chan->tasklet);
+				dmaengine_schedule_bh(&pd_chan->chan);
 				ret0 = IRQ_HANDLED;
 			}
 		} else {
@@ -715,7 +715,7 @@ static irqreturn_t pd_irq(int irq, void *devid)
 				if (sts2 & DMA_STATUS2_ERR(i))
 					set_bit(0, &pd_chan->err_status);
 
-				tasklet_schedule(&pd_chan->tasklet);
+				dmaengine_schedule_bh(&pd_chan->chan);
 				ret2 = IRQ_HANDLED;
 			}
 		}
@@ -877,7 +877,7 @@ static int pch_dma_probe(struct pci_dev *pdev,
 		INIT_LIST_HEAD(&pd_chan->queue);
 		INIT_LIST_HEAD(&pd_chan->free_list);
 
-		tasklet_setup(&pd_chan->tasklet, pdc_tasklet);
+		dmaengine_init_bh(&pd_chan->chan, pdc_tasklet);
 		list_add_tail(&pd_chan->chan.device_node, &pd->dma.channels);
 	}
 
@@ -930,7 +930,7 @@ static void pch_dma_remove(struct pci_dev *pdev)
 					 device_node) {
 			pd_chan = to_pd_chan(chan);
 
-			tasklet_kill(&pd_chan->tasklet);
+			dmaengine_kill_bh(&pd_chan->chan);
 		}
 
 		dma_pool_destroy(pd->pool);
-- 
2.43.0

