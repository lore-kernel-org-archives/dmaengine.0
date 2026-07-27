Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76573CB54B
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184345; cv=none; b=USCIiV7sh27tXBHS0tWEZzsWMI0wkdqA9DgHDsaIFouC3kBX1xUapWdVjL1j0um5+hWkzoJzgEBpAjNfsrW7pGdSBwbYtrSt88wm+4U/dOntZwDMdggyjgHnxvP2j4ytM4NBc3OqYOJOUCfDMvMpAMDzRQmXPWQ5MPIGq8oX/Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184345; c=relaxed/simple;
	bh=8vCKtZR6MUxxODQNW+wG7bxS9zsKEdKJvL4+Ni8zM5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n/88r1sf+64LdbR30b9tBuxq9RDezet9tp9UYmA4bDHN9GzHNIqdIGY6mQeOp/BRyrXfLljlqYw5eCyHQDD/8QP+xR5wzos+z7VT6123Pwnx8axeRqwELrmjgnr4UXBExDeEnjcoMxPiutAJSAR+232zDgv69JSPM87+LXwSXfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jEfI8pYZ; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jEfI8pYZ"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cea3004256so33774985ad.0
        for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 13:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184344; x=1785789144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dJ7s0OZXSBQkDnzpVrUp569VipY5QppQ1cZnFPXTJMQ=;
        b=jEfI8pYZyRch1TXlsO6Ukd51B+otXQULEXY8P2yZdEWiJzBvefpjXk22x8bY66vZ6e
         4b5GAIU8oYXxfHsZPKeoLckNwusbvrohjksM71tT/MQ6wYpkv8FydRPmsE6awrRgr9if
         uxfOn+zvtTnDXqSL/aX5QkmYGAAbUF7tPKcZjkMq/4+kaoeMBee73BJZYnc4F87Af5pI
         8XVXVX+yDfwqiUZ8D6EFoDSu8TTvfeFYKb//ri2GoLMZZ/8Hl5j3iKQCLgglaYKkcT7f
         L5d6w6GoNK6RY7ce3pYWa6p5fyBVjogs+JRLFwbRJVGwaC0yDI0J10nWWnkYxOOc8GYi
         gEPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184344; x=1785789144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dJ7s0OZXSBQkDnzpVrUp569VipY5QppQ1cZnFPXTJMQ=;
        b=PHDj+FooJFdbDKTpN9lWhoECnMatpo8KrZRSjwiReZW9BiukaIprkoJvL9iJLTtl2c
         fJLCaSnlaoNqhblyqzGiiAC8pc6bvtuVmAa6JAmWgcd2dQ7+8qQ1ZKNeDbZoVu4mg8eF
         azKCXI7MjUYGQU7/t9WIDd9aMQGRzi9tbdHFO5f/ytItz3yX8gqid3lBpZ7ed+q20ZNF
         uNh2Kknc7NqregoTXQR/lxQE8+gWSy3SJ3phjIqmxo+xEcMl2oTjxb+OjgdmstqjGEVd
         vzweyDlBPkq7EaTMPRnE6WubphoSnz6fQr4vWxUWt6qtfx5T96U6m6zgPLqPoS15ktp2
         n5iQ==
X-Forwarded-Encrypted: i=1; AHgh+RpXS0iRNNTKeyFOKMs2oGikwgYyyg27GkY2lHcBKus/Ul0f9G925kU1zz2nOVNwH8HCiL1uWZykcQA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyHGf7U1Ww5RjZsO9akz/prqL6yIHjVmMH902CIQ/JxdUO7AW1
	LjEaXcC+BcTZM7+A1cAortP4k1ZHtE8L6DfXzPVZtRUkS6+S97uZpgRyzrLnRw==
X-Gm-Gg: AR+sD13BYKAg86EJyb2jrZ38YdiP6Z6bNtIUp69acgVYGO/4pvSa/e17By7Voaq/LUq
	1bIw/wXrD0kS/CAg8PDIKsbLRP71JhFzENlbQ+qtMOMe6UUBP1NdWee0vbHqxsEXBiRvleXZT+V
	jUU7tTbyCnFlokzba21SY2YxGmyHeWrtu4cABHE8fD/IGGPwavQlaZfqqg8y91ThK5noUXeF+y7
	MZJCPJrAzmVETFsC5hSo43RGJq00MXMdKAPMiaLh4tc52J3RtezNn+5imPT1iGvI3pFVUGmcCQD
	D3ZudC+WvT8F05YNHAyebRBUVboWPGZrfbipNBSARigHGzwwPVujkOJxgLS7A9B4UB90c1ryz4B
	+Sgpd0MvoqhyGBbr/lVGSWX6gnOaK1bNx+GRaredV3ryyJW/lya5uLPHHEloWqeMlf8z+QB4Rcv
	iNrjI7
X-Received: by 2002:a17:902:e549:b0:2c8:25c8:85a6 with SMTP id d9443c01a7336-2d00f24e8e7mr7931755ad.2.1785184343842;
        Mon, 27 Jul 2026 13:32:23 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde59b768sm41551805ad.4.2026.07.27.13.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:32:22 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Suraj Gupta <suraj.gupta2@amd.com>,
	Marek Vasut <marex@nabladev.com>,
	Folker Schwesinger <dev@folker-schwesinger.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 19/64] dmaengine: xilinx-dma: use dma_chan BH instead of tasklets
Date: Mon, 27 Jul 2026 13:28:47 -0700
Message-ID: <300282f7a29dc2125d22ac153075b0ac29591ce6.1785183549.git.allen.lkml@gmail.com>
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

Replace the per-channel tasklet with the shared dma_chan BH helper.
The handler continues to run in softirq context while dmaengine owns
the common scheduling and teardown mechanism.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/xilinx/xilinx_dma.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index 404235c17353..bf9f22ed1265 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -402,7 +402,6 @@ struct xilinx_dma_tx_descriptor {
  * @err: Channel has errors
  * @idle: Check for channel idle
  * @terminating: Check for channel being synchronized by user
- * @tasklet: Cleanup work after irq
  * @config: Device configuration info
  * @flush_on_fsync: Flush on Frame sync
  * @desc_pendingcount: Descriptor pending count
@@ -441,7 +440,6 @@ struct xilinx_dma_chan {
 	bool err;
 	bool idle;
 	bool terminating;
-	struct tasklet_struct tasklet;
 	struct xilinx_vdma_config config;
 	bool flush_on_fsync;
 	u32 desc_pendingcount;
@@ -1115,11 +1113,12 @@ static void xilinx_dma_chan_desc_cleanup(struct xilinx_dma_chan *chan)
 
 /**
  * xilinx_dma_do_tasklet - Schedule completion tasklet
- * @t: Pointer to the Xilinx DMA channel structure
+ * @c: Pointer to the Xilinx DMA channel structure
  */
-static void xilinx_dma_do_tasklet(struct tasklet_struct *t)
+static void xilinx_dma_do_tasklet(struct dma_chan *c)
 {
-	struct xilinx_dma_chan *chan = from_tasklet(chan, t, tasklet);
+	struct xilinx_dma_chan *chan = container_of(c,
+			struct xilinx_dma_chan, common);
 
 	xilinx_dma_chan_desc_cleanup(chan);
 }
@@ -1898,7 +1897,7 @@ static irqreturn_t xilinx_mcdma_irq_handler(int irq, void *data)
 		spin_unlock(&chan->lock);
 	}
 
-	tasklet_hi_schedule(&chan->tasklet);
+	dma_chan_schedule_bh(&chan->common);
 	return IRQ_HANDLED;
 }
 
@@ -1955,7 +1954,7 @@ static irqreturn_t xilinx_dma_irq_handler(int irq, void *data)
 		spin_unlock(&chan->lock);
 	}
 
-	tasklet_schedule(&chan->tasklet);
+	dma_chan_schedule_bh(&chan->common);
 	return IRQ_HANDLED;
 }
 
@@ -2654,7 +2653,7 @@ static void xilinx_dma_synchronize(struct dma_chan *dchan)
 {
 	struct xilinx_dma_chan *chan = to_xilinx_chan(dchan);
 
-	tasklet_kill(&chan->tasklet);
+	dma_chan_kill_bh(&chan->common);
 }
 
 /**
@@ -2745,7 +2744,7 @@ static void xilinx_dma_chan_remove(struct xilinx_dma_chan *chan)
 	if (chan->irq > 0)
 		free_irq(chan->irq, chan);
 
-	tasklet_kill(&chan->tasklet);
+	dma_chan_kill_bh(&chan->common);
 
 	list_del(&chan->common.device_node);
 }
@@ -3075,8 +3074,7 @@ static int xilinx_dma_chan_probe(struct xilinx_dma_device *xdev,
 			str_enabled_disabled(chan->has_sg));
 	}
 
-	/* Initialize the tasklet */
-	tasklet_setup(&chan->tasklet, xilinx_dma_do_tasklet);
+	dma_chan_init_bh(&chan->common, xilinx_dma_do_tasklet);
 
 	/*
 	 * Initialize the DMA channel and add it to the DMA engine channels
-- 
2.43.0

