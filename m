Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BD83AB466;
	Tue, 23 Jun 2026 06:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782194762; cv=none; b=TdYUvCS4sjizy5eg7ls39nshwIiDx5oqIXmsLB6mUW3lbqPFMJbdbZnOpai2d2L6eYnbt3DrzeDj8VgK3ZoQxBsSiNwadrx+7RaGx3FA6XKE5SkxwzG61JbDwY8UAK/Iexj+lOYsuZmBQuOoep81lkrKRzM7la4nIAMP5mGLwPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782194762; c=relaxed/simple;
	bh=cn98g7V11zJrp3Rc1IvOQIJ4VnNNGkohcNr6rfwpkFM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cYnrt3dHVNderKR5lCCpFwhHdquI6Cs+j/B2HbbcyZ4nSbE15VgfLX3k+0F0aHwO7+fG5VmmIt4QhImL36rrbrlqq4BcU095bD792DxrnVtqPSBKbL6dPyabJ3IW8r7kJEwRuD/ImW+WbuJMM0r3F+XmX0EfZaJ1LAWFH8P8U3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowAD3Z+tFIjpqg+PJFA--.29888S2;
	Tue, 23 Jun 2026 14:05:57 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Olivier Dautricourt <olivierdautricourt@gmail.com>,
	Stefan Roese <sr@denx.de>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH] dmaengine: altera-msgdma: fail probe when reset times out
Date: Tue, 23 Jun 2026 14:05:54 +0800
Message-ID: <20260623060554.13523-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAD3Z+tFIjpqg+PJFA--.29888S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Ww48Cr15AF48Kw1fKrW5GFg_yoW8CF45pa
	y7Wa45GrWjqan3tF40yFs8CFyYgF1ft3yxC3yDGw1I9wn8Xr98W3y8t3W8WF48Wry8tF1f
	Aa17Ja4ruF1jqaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUr2-eDU
	UUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

msgdma_probe() resets the controller before publishing the DMA device
and OF DMA provider, but msgdma_reset() only logs a timeout and then
continues to enable the controller and mark it idle.

If the reset bit never clears, the driver can still register a DMA
engine backed by a controller that did not leave reset. Return the
readl_poll_timeout() error from msgdma_reset() and abort probe on reset
failure.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/dma/altera-msgdma.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/altera-msgdma.c b/drivers/dma/altera-msgdma.c
index b46999c81df0..f60a4e86a246 100644
--- a/drivers/dma/altera-msgdma.c
+++ b/drivers/dma/altera-msgdma.c
@@ -466,7 +466,7 @@ static int msgdma_dma_config(struct dma_chan *dchan,
 	return 0;
 }
 
-static void msgdma_reset(struct msgdma_device *mdev)
+static int msgdma_reset(struct msgdma_device *mdev)
 {
 	u32 val;
 	int ret;
@@ -478,8 +478,10 @@ static void msgdma_reset(struct msgdma_device *mdev)
 	ret = readl_poll_timeout(mdev->csr + MSGDMA_CSR_STATUS, val,
 				 (val & MSGDMA_CSR_STAT_RESETTING) == 0,
 				 1, 10000);
-	if (ret)
+	if (ret) {
 		dev_err(mdev->dev, "DMA channel did not reset\n");
+		return ret;
+	}
 
 	/* Clear all status bits */
 	iowrite32(MSGDMA_CSR_STAT_MASK, mdev->csr + MSGDMA_CSR_STATUS);
@@ -489,6 +491,7 @@ static void msgdma_reset(struct msgdma_device *mdev)
 		  MSGDMA_CSR_CTL_GLOBAL_INTR, mdev->csr + MSGDMA_CSR_CONTROL);
 
 	mdev->idle = true;
+	return 0;
 };
 
 static void msgdma_copy_one(struct msgdma_device *mdev,
@@ -896,7 +899,9 @@ static int msgdma_probe(struct platform_device *pdev)
 		goto fail;
 	}
 
-	msgdma_reset(mdev);
+	ret = msgdma_reset(mdev);
+	if (ret)
+		goto fail;
 
 	ret = dma_async_device_register(dma_dev);
 	if (ret)
-- 
2.50.1 (Apple Git-155)

