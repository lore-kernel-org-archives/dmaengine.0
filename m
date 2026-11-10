Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316563;
	b=YjQ1Cp0uMVn/j1kp8YZyalCOFN3LCtCBJTpS+67z5Sd2JE5Zo9Dze+JLp/DOfASYIS8M
	 SuxCRjD7YRQkj9hGJf1Vi/0g4U+nd4z76F2aXZnlXaEmNt/oWUqKQxvJJ3fS9YkEqqTJh
	 PekG2/VZVB7LOozEvOfVrqVi4n+UTk9Mhk4s3WxMQDdvQV+7Cf7PXvWmf35CNh4AhIEK5
	 f7jPLUNK2vHCb8e5U8U757ardbdYWiuGxGKbSfz3IH3kimUcc/RINWvYjpXWt6Ep3q0Ha
	 a1njokL27THztvf/GMG9wDNO4Pr3VhMy73H1UwEYJF/SH+N9ZCaaVoaFN7HpQjPOHvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316563;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=x5xprZt5NhCzwKafxuBKE8lrYdP4CbowwmixO5skWSc=;
	b=0OxgK/nVPKUREV06kNyHsNWAkwWV713zNIDVom2Vza17EnJuW12Bvq94pvU2oTLdkJ8G
	 9r15MijiLJtRcLWT1aos1OhGZDmplB7HZSNPdrpQIvfMIxOOqp2eXCLSCGwiATNf6Tn4h
	 HEaH1g4TaRlLJpe99FLmKXtf62yY6eepXkcifeJzhJZxRFxVOF0aBTN0RdkXXwIvbGFPL
	 mQ6FS6SWb7RwRyx0QOTBN+CBjKLkFHCDIhZ6H4Z3FhvO3V5YpfBvf6ujQN49GaXyrmkdc
	 VNMmZaknDu/LRmnwY2vjKWgqxzbS7o3dBCn6MFhBF51aHsIzjEutm5dnCMtXDQhIlTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cwtTOuk+;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463D560A3806
	for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 13:16:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 463D560A3806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cwtTOuk+
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b09a83d12aso1360094a91.2
        for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 05:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316563; x=1794921363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x5xprZt5NhCzwKafxuBKE8lrYdP4CbowwmixO5skWSc=;
        b=cwtTOuk+6xgyf6G9J7gkaWOMI+dOo5JpGD9h+viPFQLnb3n1dujfrVMHhzk2tDfZqm
         MbMYkEUIzcozLznCqWQKPdjhglfEZ53B/1wrUcbJbVAaKOCsmwFWfKK919xWQUac8O6b
         VeY8TItOjRbz6jDHujqbr97BIsklZQn7sncvV3M9Gt3AqziDa9K1ZFf5tPAW0hl4ySuN
         noxGIDZW5ZwBXycT8ngQ71wuiznDBdsAZPCIZKXuq4AldCaFtdrV0KSVQVD0IuuvgvYX
         kF4gqrL5cRje0xNJ6jDNIw0E0UtjXQE7L85QuoP0yT0Ix6MVIpPmZXDpXTNQyCZIDy7D
         skXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316563; x=1794921363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x5xprZt5NhCzwKafxuBKE8lrYdP4CbowwmixO5skWSc=;
        b=BEA+1yqgfKSMTIb9U0b7APlqqCNzDfvY/cAtnx/PwJt0/UxcGfuu1xCOoHlKLPsHCi
         TytHlzrAdBg6oREiB9Ec3w8oZ1PyEgQEjOFJpBP/AmjYKq1MhjdWTHVG3vRH+CkWsAAX
         lQCNAGDYc0/IAT1Coh/6LP+HzX/H+WbJug0GfUWIOZbMjhyqlW4cmzlPpQaeiP33Y5hd
         MtwRDxvbUJZKflydzh9nPPyWiL5I/Wz4AtEZEfbKdtTCFZq5+ATHVRZhdM13q9cCBeFA
         KhOevQbc8NMQDjfREFwptO9StFa5R3iEQ1taDV8yY3lkcdMjEhY5aU3zNX/WsP8S3T3d
         eBpA==
X-Forwarded-Encrypted: i=1; AL+hErEE+Imhp9xCq+WnmGFBQGdOULXSt/hRkZwVAU50yUq66ujE6X/+J2nabNr7RuikP6YkIOMSIE5aHdg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/FxRkXaBAzYlokBkaLPxL6fX3ivbTrEZLEKcF6ERcNqYoCDaCt
	izfQA9HudJng1oLjDTcxvjsjyzVI+EU5fLA4Nl5WOZRSnKVFwMpCWYHm
X-Gm-Gg: AYBFou2L7Y4fR3Ug6aAu3IAaZ5s0Pw7Xai24b3e8lNtmj+nuKo6fNnaWPt/CaYv79Ov
	7wWk6ymOJIr2Zg9/IxxdAKtafx6cTRej3lGT03Pmld0Wzxap9/Go9m6maSIcABN/FbidO09qcP1
	/sLUTeaPeKfgohWbmj3dBIOy7x4MPhOBdatH+gZsPDBGAC6gI4TA3Wzc6PyHVIK/J5hLITHKLO4
	9Ew+JdM6eSgXkT1AieNQTU9TPPuylF2LY5QQZFsThQpW1CUkFwonbQEYPt6vO8SeYldhPQEq5R5
	9d7/f69GZRDLwGfnm9fxaAfdSctfiYyXXBHTBwtHTJeCxjUT4JmWFvU9nLvAwckeK0qxq8ow+ng
	rTXEeyyx3TYINREKWdd1cLLQX5etpmjQ8r7V3QVupNdnvlef6rezKwm605uUIqR1CtuccEAuwEU
	h8QAlTYQhL0K0odbJPKy/0IZ5fnxUlLgasy9CxoPZ6b8Q2ouFf+t+cZjDJXi5KWUZhCLUQJmWnG
	IE8H/WEVnRwUbnHpZjHBFYtvZn+hpK+/9z+HTiVWumJq5OmggwRJe2AWpvlQCV+7wyvrUWyEfKZ
	hjoZxtu+3ocEATsa0RJZ5PJd9OY4Hs3l
X-Received: by 2002:a17:90b:4a87:b0:3a8:c0cd:57fb with SMTP id 98e67ed59e1d1-3b166cbd030mr2853475a91.42.1794316562378;
        Tue, 10 Nov 2026 05:16:02 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:16:01 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 08/33] dmaengine: imx-dma: flip per-chan tasklet to dmaengine BH
Date: Tue, 10 Nov 2026 05:13:08 -0800
Message-ID: <bb9ba66250d97a83048c5bcce45b20a1ea6ca6af.1794315350.git.allen.lkml@gmail.com>
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
 drivers/dma/imx-dma.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/dma/imx-dma.c b/drivers/dma/imx-dma.c
index ca1d08e90a06..a9d05b2e2205 100644
--- a/drivers/dma/imx-dma.c
+++ b/drivers/dma/imx-dma.c
@@ -145,7 +145,6 @@ struct imxdma_channel {
 	struct imxdma_engine		*imxdma;
 	unsigned int			channel;
 
-	struct tasklet_struct		dma_tasklet;
 	struct list_head		ld_free;
 	struct list_head		ld_queue;
 	struct list_head		ld_active;
@@ -344,8 +343,8 @@ static void imxdma_watchdog(struct timer_list *t)
 
 	imx_dmav1_writel(imxdma, 0, DMA_CCR(channel));
 
-	/* Tasklet watchdog error handler */
-	tasklet_schedule(&imxdmac->dma_tasklet);
+	/* BH watchdog error handler */
+	dmaengine_schedule_bh(&imxdmac->chan);
 	dev_dbg(imxdma->dev, "channel %d: watchdog timeout!\n",
 		imxdmac->channel);
 }
@@ -390,8 +389,8 @@ static irqreturn_t imxdma_err_handler(int irq, void *dev_id)
 			imx_dmav1_writel(imxdma, 1 << i, DMA_DBOSR);
 			errcode |= IMX_DMA_ERR_BUFFER;
 		}
-		/* Tasklet error handler */
-		tasklet_schedule(&imxdma->channel[i].dma_tasklet);
+		/* BH error handler */
+		dmaengine_schedule_bh(&imxdma->channel[i].chan);
 
 		dev_warn(imxdma->dev,
 			 "DMA timeout on channel %d -%s%s%s%s\n", i,
@@ -448,8 +447,8 @@ static void dma_irq_handle_channel(struct imxdma_channel *imxdmac)
 			imx_dmav1_writel(imxdma, tmp, DMA_CCR(chno));
 
 			if (imxdma_chan_is_doing_cyclic(imxdmac))
-				/* Tasklet progression */
-				tasklet_schedule(&imxdmac->dma_tasklet);
+				/* BH progression */
+				dmaengine_schedule_bh(&imxdmac->chan);
 
 			return;
 		}
@@ -462,8 +461,8 @@ static void dma_irq_handle_channel(struct imxdma_channel *imxdmac)
 
 out:
 	imx_dmav1_writel(imxdma, 0, DMA_CCR(chno));
-	/* Tasklet irq */
-	tasklet_schedule(&imxdmac->dma_tasklet);
+	/* Schedule the IRQ BH */
+	dmaengine_schedule_bh(&imxdmac->chan);
 }
 
 static irqreturn_t dma_irq_handler(int irq, void *dev_id)
@@ -592,9 +591,10 @@ static int imxdma_xfer_desc(struct imxdma_desc *d)
 	return 0;
 }
 
-static void imxdma_tasklet(struct tasklet_struct *t)
+static void imxdma_tasklet(struct dma_chan *chan)
 {
-	struct imxdma_channel *imxdmac = from_tasklet(imxdmac, t, dma_tasklet);
+	struct imxdma_channel *imxdmac = container_of(chan, struct imxdma_channel,
+						      chan);
 	struct imxdma_engine *imxdma = imxdmac->imxdma;
 	struct imxdma_desc *desc, *next_desc;
 	unsigned long flags;
@@ -1142,7 +1142,7 @@ static int __init imxdma_probe(struct platform_device *pdev)
 		INIT_LIST_HEAD(&imxdmac->ld_free);
 		INIT_LIST_HEAD(&imxdmac->ld_active);
 
-		tasklet_setup(&imxdmac->dma_tasklet, imxdma_tasklet);
+		dmaengine_init_bh(&imxdmac->chan, imxdma_tasklet);
 		imxdmac->chan.device = &imxdma->dma_device;
 		dma_cookie_init(&imxdmac->chan);
 		imxdmac->channel = i;
@@ -1211,7 +1211,7 @@ static void imxdma_free_irq(struct platform_device *pdev, struct imxdma_engine *
 		if (!is_imx1_dma(imxdma))
 			disable_irq(imxdmac->irq);
 
-		tasklet_kill(&imxdmac->dma_tasklet);
+		dmaengine_kill_bh(&imxdmac->chan);
 	}
 }
 
-- 
2.43.0

