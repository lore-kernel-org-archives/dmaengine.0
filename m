Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316660;
	b=pGKDdmvkqm0crdVIds9uCL/e0FVeTeDGsHn3Nfizr8fl42myDna7KdgBNhvxO1UfUsOg
	 +vhJNzD4mgELdlppdqSju4hl0i4nirAWJSOGQJNQGvb8KieBGDZqsfFmW3btFqb3Dc97M
	 dp08WQuBNTjCO4QlRaRYByMxZc3xWpO2oyNYIdxszuyu7POfBQ+qAxAwrhO1WwvR97oo8
	 q6jFh2n20EWbAjJZZbkT9wzPudlGvtDnORqclgScMO4xAcOeY2CyE4TzyknmJyMSyXtQZ
	 lEl4cufCMUqV5bu902vqBd21sMiHY7Nc28WdcFG0G3g9Xqkf52mVm139gU+hJFNoaHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1ZQe4ZEx+yAdgmqarlo9rAFQ6pOj0pg3LDUb//64KOo=;
	b=wAEJAxQu+ZURLaIEkSRw97pzMbEeDb3T58H2xTX1VNP1+2rfjye41WouVYzglp3+sFrg
	 IbctD6x2BiYmIFebZVv+dTEet0evYj8gHcPCtQeg5dIAnLoiR3WsWbcZ0Ywh4PFfuwmJT
	 0c28SNkn8nsADuRpfVE8SJqBJty9J4NbXEE4pSiEY19Q4PrraxZbHwOZ2RRVqcPfum5td
	 HyR59jpEyzusu/6xrUBcsjfL4MXbEuALs9TDW7jDWuPJ9QvJTu/gFZNTA6ND1ki0Sy/bF
	 nvN3T38czh/e60YvdAKEXIW2Z5VWW2y7ag/z/7ClBcLDJQeqU2kpZuAnaNSty1ZdtLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GwyFaAkY;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D9B606B2EF
	for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 13:17:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49D9B606B2EF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GwyFaAkY
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso925640a12.0
        for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 05:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316660; x=1794921460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1ZQe4ZEx+yAdgmqarlo9rAFQ6pOj0pg3LDUb//64KOo=;
        b=GwyFaAkYkQ+iXObJwQRiVIeWXFOaGVVEiQl7OQX0eBpgVvTp4gleCubPwbaChzzqLa
         WF5YCTdlFX4+z2Q39DAlsnNajIwsvyiJEkE3bpqAl0TxBDef3lxV267U1h8KVloKrN7Z
         1cu6ECVZAPOKN8Rttqk8llnpODT1gfPqxZpzMEMIvxcrV8LnzvxkuOVsu5fZsWK9dar8
         HDg2jXcPnP2WhQ13Oys+2VGvzXZddpeILje2pCwEop8t9ilXWYnb8PoyoKU9yOXIj/L9
         RMeX7i5cmk6ClidQO+JiEdcJUNfBclwQDO7D6huKjLUw0YqwNK+npQGU/pvxxzCwvNRk
         GNhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316660; x=1794921460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1ZQe4ZEx+yAdgmqarlo9rAFQ6pOj0pg3LDUb//64KOo=;
        b=EgY2Vu6T9tu54CIJ0ZRwtvC9dFpcB0mwWrz9HZFBinGHic5BCOyfWfsZ7dH2WH0uJm
         /+rFmeC7HuTEZ6ZTQ6o/Z1F1iiE1Tq76vawvSvuWt7GUCPebPMMjbAoyTkJRqjlCyV01
         eQ1sREWLsXxBsR0G6zRue25dJLyo7M8gL/1JQpiLt+8YN3vQIKDR2Z6y5gDvDGax8306
         Hgl51GmhFk7xTn2RGkdE9/yTUUZz9xNVYFfgG4kd7k9dAPal1M887OUBIUw51qX4vw7E
         NtYIAEaxKyu1zOKLT6HKFQs8cn9UUXlxYSpw+ASt3QSQN72z9yGuzhO7kwDc7GJksWB3
         y/KA==
X-Forwarded-Encrypted: i=1; AL+hErFGc91ZtiR2jXW07EVt9cxc/dmykSvPJUfzZwhv7SKP+J2xZjU8QiDpZquUK2KXZ1vJQQYpS1AaHsA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+YLoVovVpH/vv+F4gqRFh3JzcXd/OGfnYehY4f/WgidaJsU4lh
	hbfi8vnxIpweTEh+S60t5IFsT4KOVDrXLUMlrM7d+eTuCZd9DJ4w+8Wc
X-Gm-Gg: AYBFou3DD1lZmP6ulbQi+SJRc5RJN2Wf2Qe2h8/IUing4K41kyjwgMDf0LxPDJ9CN02
	NCmUM/7sBJA9LwdprWOKEi9dHoAuZ+01tDxmBNCQg+euab0pJLOtwjQe1w+dcgOR1wKs4csMLyx
	BhZRc6YOd6CoKeQaWFmWArLfZfuzwQ89k2STp3K8VhhrHVZO8OttogZsB8GYlRTVbZ9IktHWr0C
	jxW/AD182U2WFK5JRNkouUr7DHD9wFer3LhEuqYx+gCF7eR/HKwICKATtQGx2KPPnmMDuQNGqSF
	EcQ3tUMWuSAMs/6dQLDMaCe8V618pIidzREKUJC+DQ6fyT2De19CAGgPUs1t59sYha5Ok9nTPyV
	Vwo8gQT7VNdzIsEPb6XuHCkUZkBFdZdWDaVAV9KMzdM2ZS55+FBSe5s1GdhpuxYSFbmMDJvvjDB
	yHVBtBhm4/kMqG6CvQ4wNisfjDdyJ9m0GRdDPOXO6nuBsCrRNWrODdtmtV/jFaiOusylKg/dHzf
	dL8eXvdTctfShdR8kRO+Gy56RUwlHr/BifxDQ375ZnfbkblfORXtQrRU4z2bd3k1DcfsfmCZAH5
	6TkixK8JDecWhHWUV1fdSK+JTKp2iSn5
X-Received: by 2002:a17:90b:5485:b0:3ac:8527:3fc5 with SMTP id 98e67ed59e1d1-3b166b4157dmr2728930a91.3.1794316659586;
        Tue, 10 Nov 2026 05:17:39 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:17:39 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Logan Gunthorpe <logang@deltatee.com>,
	Kelvin Cao <kelvin.cao@microchip.com>,
	Frank Li <Frank.Li@kernel.org>
Subject: [PATCH v4 33/33] dmaengine: switchtec: use channel BH helpers
Date: Tue, 10 Nov 2026 05:13:33 -0800
Message-ID: <7b1ffe42093c54956a295bde752c3663d1284f37.1794315350.git.allen.lkml@gmail.com>
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

Replace the per-channel descriptor completion tasklet with the shared
dmaengine BH helpers. Client callbacks remain in softirq context while
using the common scheduling and teardown mechanism.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
Reviewed-by: Logan Gunthorpe <logang@deltatee.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/switchtec_dma.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/switchtec_dma.c b/drivers/dma/switchtec_dma.c
index a386c3a284e6..21b281ea7cd7 100644
--- a/drivers/dma/switchtec_dma.c
+++ b/drivers/dma/switchtec_dma.c
@@ -133,8 +133,6 @@ struct switchtec_dma_chan {
 	/* Serialize hardware control register access */
 	spinlock_t hw_ctrl_lock;
 
-	struct tasklet_struct desc_task;
-
 	/* Serialize descriptor preparation */
 	spinlock_t submit_lock;
 	bool ring_active;
@@ -584,6 +582,7 @@ static void switchtec_dma_synchronize(struct dma_chan *chan)
 
 	int rc;
 
+	dmaengine_kill_bh(chan);
 	switchtec_dma_abort_desc(swdma_chan, 1);
 
 	rc = enable_channel(swdma_chan);
@@ -820,9 +819,10 @@ static int switchtec_dma_resume(struct dma_chan *chan)
 	return ret;
 }
 
-static void switchtec_dma_desc_task(unsigned long data)
+static void switchtec_dma_desc_task(struct dma_chan *chan)
 {
-	struct switchtec_dma_chan *swdma_chan = (void *)data;
+	struct switchtec_dma_chan *swdma_chan =
+		container_of(chan, struct switchtec_dma_chan, dma_chan);
 
 	switchtec_dma_cleanup_completed(swdma_chan);
 }
@@ -832,7 +832,7 @@ static irqreturn_t switchtec_dma_isr(int irq, void *chan)
 	struct switchtec_dma_chan *swdma_chan = chan;
 
 	if (swdma_chan->comp_ring_active)
-		tasklet_schedule(&swdma_chan->desc_task);
+		dmaengine_schedule_bh(&swdma_chan->dma_chan);
 
 	return IRQ_HANDLED;
 }
@@ -1060,6 +1060,7 @@ static void switchtec_dma_free_chan_resources(struct dma_chan *chan)
 	spin_unlock_bh(&swdma_chan->complete_lock);
 
 	switchtec_dma_chan_stop(swdma_chan);
+	dmaengine_kill_bh(chan);
 	switchtec_dma_abort_desc(swdma_chan, 0);
 	switchtec_dma_free_desc(swdma_chan);
 
@@ -1086,8 +1087,6 @@ static int switchtec_dma_chan_init(struct switchtec_dma_dev *swdma_dev,
 	spin_lock_init(&swdma_chan->hw_ctrl_lock);
 	spin_lock_init(&swdma_chan->submit_lock);
 	spin_lock_init(&swdma_chan->complete_lock);
-	tasklet_init(&swdma_chan->desc_task, switchtec_dma_desc_task,
-		     (unsigned long)swdma_chan);
 
 	swdma_chan->mmio_chan_fw =
 		swdma_dev->bar + SWITCHTEC_DMAC_CHAN_CFG_STS_OFFSET +
@@ -1135,6 +1134,7 @@ static int switchtec_dma_chan_init(struct switchtec_dma_dev *swdma_dev,
 	chan = &swdma_chan->dma_chan;
 	chan->device = dma;
 	dma_cookie_init(chan);
+	dmaengine_init_bh(chan, switchtec_dma_desc_task);
 
 	list_add_tail(&chan->device_node, &dma->channels);
 
@@ -1157,7 +1157,7 @@ static int switchtec_dma_chan_free(struct pci_dev *pdev,
 	spin_unlock_bh(&swdma_chan->complete_lock);
 
 	pci_free_irq(pdev, swdma_chan->irq, swdma_chan);
-	tasklet_kill(&swdma_chan->desc_task);
+	dmaengine_kill_bh(&swdma_chan->dma_chan);
 
 	switchtec_dma_chan_stop(swdma_chan);
 
-- 
2.43.0

