Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316648;
	b=2CPI91I3doobl626N0yTFIoLXOi1niS2BroFw6oxpBGEMNfYtfdgKuYMjjzL+KgYiVFZ
	 PI+z7R9z3U2Q8bKFtdOVBHAtUEbwzKqSsheehXCm5z2NJkES3sM9lpm/LSqTA8zqSw5Yd
	 UgDJerbVcU8e9WjHPs7Fo0QvW5WjjLptOQk5IGL85POZscEM2RJh5fQR8cmxM1GSJOxIo
	 Gf/cQ5v5LWmihgR1JBb3tKPAck7ipXylCsMIy4mg+FIcEIgBUDQuE4hnffXs90CZANP1+
	 uypHdUJkeVFQ9LnpJObhsZg3V+Td0RD8kcumyRc7dFElQ89+P5dstPD52tq0uWqSWCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316648;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wYslcRexAqYsTQr6XAo48lObPwNop7Xx/VHJGBH6Ypo=;
	b=HlUprd2kl4lfRGiDlMb/5Uff5YaQIldIZuNN4xGItZmdi/mEIhmle+VLG2KV7/xkfDfY
	 pf2dCBbpbT9m3os5K+/VeUJaxbbpFLEpEgjIX31OpyE5qA7EI3Xu8ysrQ59t/ml/HJhsR
	 Evq+f5FbUm9JU7T96vnAWDh4wpLpKzx/dafSPgX5iaHgX/R5FHVfK5A3aNObivlxSUPfL
	 W77Cg54cMBJ3eD1vmFz2W47ISGV2EcNnbvOupB1uvymd5janGVYz3OWt3Zo7oLHI3gXHe
	 7Ki8DeAZjuJqfuPo0jh9lu5KY+eQ8jF9Mg8T+4TEw9h1hc76MiLHukJZ1g2pfLdu4IA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ddJE9tOl;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4293A6071E62
	for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 13:17:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4293A6071E62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ddJE9tOl
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cdb9f760337so986492a12.0
        for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 05:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316648; x=1794921448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wYslcRexAqYsTQr6XAo48lObPwNop7Xx/VHJGBH6Ypo=;
        b=ddJE9tOlxv8auuIIyDtHpiXFuRaeATRkIZKBSkg2hIKtmNOIGoxU0cLQFGDJww8p3Z
         XzX1F5GwsmJ9aYld0QyR/SR4915LTdTUup1mgkhRzIZWGdlnL6hCdpzTlxx+PI7XoP9J
         WTESIoyd7at/67EGo1MTa4GZlpUWVwhN7cdHRKJyZs5tm8Ow34Jt+IflRad+ntnmA/nC
         ukuyz+OUA0DhHBWiK3tBMvYYnupFqoRJR7qlSDu1NDLOrOk4h5DUeBYvMe1S9NW9sd/J
         uqJYQvSe6jX0snl08oUZ6eAvgycT5AYrUu9xduaXe43wvIDN9xzGora0WWXOdcweTyON
         p+og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316648; x=1794921448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wYslcRexAqYsTQr6XAo48lObPwNop7Xx/VHJGBH6Ypo=;
        b=YCPjjNk5AOMEv2EoAuYYINwermq7yATlycJd5gH7tc+wNqdWuhP8JyN5eunUw08C0W
         ed4bwi0lwq4PqkvBqhE7LHrKgCjPcqY1CIdj2bxtm9oMCD+w6ATlpDmAs+wKCzCyYrqY
         BtDuFdUq7bgkL7FLguGFZ8WA5c/uDW3ojYGj/QS5O69q3KGx605iSnz40jV7DSsUtbI8
         GNpgtTpX/GDrOpHKMcD2OAevMq5YmGCxyU4b+LsXhlPaPvenOR6Hc3wCGw2isIO6AIiU
         vWwbDNTC8j4hFoBpU5eGvPulmHGUJ3tPpL6l5Hs46qoYEgOfXkrjArqPZyntIUupdAay
         anvQ==
X-Forwarded-Encrypted: i=1; AL+hErFCX+L6a9Im8pjUpjyweFN/dVYG6JiOTZssTkUzRk6+03j3uyIcNl1+dmKFu2gUHfrPE+TxewYZd8Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z9a545OtfXI3V3ymbERzA/f168tBFJ5Yi1cb0c0TsOwu/AS/8JM
	6YdLqMaeA9stu3Wzo4VK6S2mhQ1ng6nizSJqCPIjkLYKdRkGe/Nm2E+I
X-Gm-Gg: AYBFou07jlL9SJ6caSPYUDAkWG71xkP4VKt7TIIPPqb9HEjmyoLSd+fFP/BhM2fpIXI
	NH+dzTh+8VAkeD3Xe5FXQtlw3tQcNue2Nw08Pa/BzYdAUP+iCjz/vBB+GimYJ1VWtRPq706d/aE
	0iqKdbYZTHwF+sUcPCmL5ZGYEVW49hV4hfc9BjXbqdOnw7AECWE8TPJxV+oN0Yfdp41QpTT0Q7w
	VtmQ+8fD2YW7ChT5EavKHhE9a+BnxuaAcDXuHzWAQnfYmv266cc0jwwxB9y8or4KQXHYaJyV8m5
	JKxAxEC7JBa8meqWlJ6Y3IaOU0qt8iYCa5AUkCT/arzY5qimeFOHh04wNByO663Qks5gMWE6aop
	rsYO7f5r69IhmJx/CEG/jM4Z2fxPP9WVr+NSt1jz+Fi4LHzVuThkRnt9XylZbM4FNXVq8mNFMoM
	hpRJVL2coEDrYPO7wwMjsO6Ksu8+H9ftdvbxYgAezSHKkWVQVZm7gJ2dAaVaVZXzFSWSKPEdyrJ
	otTde9t8xejjVg4cUUwm3YOks8JxCHgg4IEoGxGJ8V4rGUkXNhA/DINZwcw6ayPrvt3f5C3mAwr
	9cW1aq5/Ezfnl0iHOl1fAIxiicVG5sI=
X-Received: by 2002:a17:90b:2ec7:b0:3a6:d850:bf16 with SMTP id 98e67ed59e1d1-3b1679a3218mr1654613a91.23.1794316647670;
        Tue, 10 Nov 2026 05:17:27 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:17:27 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
	Stefan Roese <sr@denx.de>,
	Frank Li <Frank.Li@kernel.org>
Subject: [PATCH v4 30/33] dmaengine: altera-msgdma: use channel BH helpers
Date: Tue, 10 Nov 2026 05:13:30 -0800
Message-ID: <cdab3a18232b5371f09f3df30ab855e3b4ba46c0.1794315350.git.allen.lkml@gmail.com>
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

Replace the device tasklet with the per-channel BH helper so completion
handling runs via dmaengine_*_bh.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/altera-msgdma.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/altera-msgdma.c b/drivers/dma/altera-msgdma.c
index 567aea0fac38..9a0741642a7f 100644
--- a/drivers/dma/altera-msgdma.c
+++ b/drivers/dma/altera-msgdma.c
@@ -170,7 +170,6 @@ struct msgdma_sw_desc {
 struct msgdma_device {
 	spinlock_t lock;
 	struct device *dev;
-	struct tasklet_struct irq_tasklet;
 	struct list_head pending_list;
 	struct list_head free_list;
 	struct list_head active_list;
@@ -684,11 +683,12 @@ static int msgdma_alloc_chan_resources(struct dma_chan *dchan)
 
 /**
  * msgdma_tasklet - Schedule completion tasklet
- * @t: Pointer to the Altera sSGDMA channel structure
+ * @chan: Pointer to the Altera sSGDMA channel structure
  */
-static void msgdma_tasklet(struct tasklet_struct *t)
+static void msgdma_tasklet(struct dma_chan *chan)
 {
-	struct msgdma_device *mdev = from_tasklet(mdev, t, irq_tasklet);
+	struct msgdma_device *mdev = container_of(chan, struct msgdma_device,
+						  dmachan);
 	u32 count;
 	u32 __maybe_unused size;
 	u32 __maybe_unused status;
@@ -748,7 +748,7 @@ static irqreturn_t msgdma_irq_handler(int irq, void *data)
 		spin_unlock(&mdev->lock);
 	}
 
-	tasklet_schedule(&mdev->irq_tasklet);
+	dmaengine_schedule_bh(&mdev->dmachan);
 
 	/* Clear interrupt in mSGDMA controller */
 	iowrite32(MSGDMA_CSR_STAT_IRQ, mdev->csr + MSGDMA_CSR_STATUS);
@@ -766,7 +766,7 @@ static void msgdma_dev_remove(struct msgdma_device *mdev)
 		return;
 
 	devm_free_irq(mdev->dev, mdev->irq, mdev);
-	tasklet_kill(&mdev->irq_tasklet);
+	dmaengine_kill_bh(&mdev->dmachan);
 	list_del(&mdev->dmachan.device_node);
 }
 
@@ -847,7 +847,7 @@ static int msgdma_probe(struct platform_device *pdev)
 	if (mdev->irq < 0)
 		return -ENXIO;
 
-	tasklet_setup(&mdev->irq_tasklet, msgdma_tasklet);
+	dmaengine_init_bh(&mdev->dmachan, msgdma_tasklet);
 
 	dma_cookie_init(&mdev->dmachan);
 
-- 
2.43.0

