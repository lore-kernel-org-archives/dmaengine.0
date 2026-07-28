Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D463DDB0D
	for <dmaengine@vger.kernel.org>; Tue, 28 Jul 2026 14:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785247716; cv=none; b=BUw3vm5GMeTlneS/mWJD5/QNODLoVEvnO9jRVK0cwCW0HxagnoTi2JYAcQaXhdRcguHXQMYPvTeC/sj+EJQ8SYB/SJQd1VasomPGWH2pDttYDSRzUSBCn3QK/G+Ta47Wzhw5WZ83tZdFKVt8aX7KOGyq7bwwjdXH5OAes6vXog8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785247716; c=relaxed/simple;
	bh=rcrXOB/MDti0XujRnNl/f0gqeQyDm9VyutAE6mB3l7I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GoZEp6+wgDziG6z8edsnefhQcGiSr+TQAmot4ZVnzzBf9yPWd0CS2ceKP31pm/PFSM+JOmbKumx2Tbf8qm2cnQGkqkhaK6Y+fDREI0bLHML2C3pmke9E97aopGa6kC+XrjS5KbX/Z8S5/Tx4rKi51ZSKKAgcPfzHVick7ZEiwfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=r4yo9+0P; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="r4yo9+0P"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 251C31A12E3;
	Tue, 28 Jul 2026 14:08:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E7C97601BF;
	Tue, 28 Jul 2026 14:08:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2AECC11C141B3;
	Tue, 28 Jul 2026 16:08:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785247708; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=NZ/GiBhDFTiUo4Y3KYKCP9noKNO98CrnzSpzv4RAto8=;
	b=r4yo9+0PpuBPRGIsvM5ewdpMv8spc+ZcLUlVxMTFvz0aD/LZBKs8Qey0fnFDDWJa4QiCCJ
	eHLYE9bGMzxC8r1LE3MKYKZ1FQy4lmuCA01UTsOYa/URO2YU4hBKXrswLEMc8tRpSjVJuA
	6KQ34lZMvlfqo2whyh/ulTk5rAMk1jdSBzOzEEKCbUjXIGF1+lxQlPZ4BCLc514duwtKtj
	4zpXUZvUBe8iMlcWwzW3ndpKxZfEszQ4mZR6AiYzwnuGssW8UY5QtIzKH2KLcpgeDPP6c/
	Yc6pEaLqDR/LknrKm8osqiMBQkXs14Adfw80s7PjW1h3AqMzDg+GlOe2lPgwxw==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Tue, 28 Jul 2026 16:08:12 +0200
Subject: [PATCH v7 1/2] dmaengine: fsl-edma: Implement
 device_prep_peripheral_dma_vec
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260728-fsl-edma-dyn-sg-v7-1-10dffb4167c2@bootlin.com>
References: <20260728-fsl-edma-dyn-sg-v7-0-10dffb4167c2@bootlin.com>
In-Reply-To: <20260728-fsl-edma-dyn-sg-v7-0-10dffb4167c2@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Frank Li <Frank.Li@kernel.org>, imx@lists.linux.dev, 
 dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3

Add implementation of .device_prep_peripheral_dma_vec() callback to setup
a scatter/gather DMA transfer from an array of dma_vec structures. Setup
a cyclic transfer if the DMA_PREP_REPEAT flag is set.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 drivers/dma/fsl-edma-common.c | 116 ++++++++++++++++++++++++++++++++++++++++++
 drivers/dma/fsl-edma-common.h |   4 ++
 drivers/dma/fsl-edma-main.c   |   2 +
 3 files changed, 122 insertions(+)

diff --git a/drivers/dma/fsl-edma-common.c b/drivers/dma/fsl-edma-common.c
index bb7531c456df..c5f5951c988b 100644
--- a/drivers/dma/fsl-edma-common.c
+++ b/drivers/dma/fsl-edma-common.c
@@ -673,6 +673,122 @@ struct dma_async_tx_descriptor *fsl_edma_prep_dma_cyclic(
 	return vchan_tx_prep(&fsl_chan->vchan, &fsl_desc->vdesc, flags);
 }
 
+struct dma_async_tx_descriptor *
+fsl_edma_prep_peripheral_dma_vec(struct dma_chan *chan, const struct dma_vec *vecs,
+				 size_t nb, enum dma_transfer_direction direction,
+				 unsigned long flags)
+{
+	struct fsl_edma_chan *fsl_chan = to_fsl_edma_chan(chan);
+	dma_addr_t src_addr, dst_addr, last_sg;
+	struct fsl_edma_desc *fsl_desc;
+	u16 soff, doff, iter;
+	u32 nbytes;
+	int i;
+
+	if (!is_slave_direction(direction))
+		return NULL;
+
+	if (!fsl_edma_prep_slave_dma(fsl_chan, direction))
+		return NULL;
+
+	fsl_desc = fsl_edma_alloc_desc(fsl_chan, nb);
+	if (!fsl_desc)
+		return NULL;
+	fsl_desc->iscyclic = flags & DMA_PREP_REPEAT;
+	fsl_desc->dirn = direction;
+
+	if (direction == DMA_MEM_TO_DEV) {
+		if (!fsl_chan->cfg.src_addr_width)
+			fsl_chan->cfg.src_addr_width = fsl_chan->cfg.dst_addr_width;
+		fsl_chan->attr =
+			fsl_edma_get_tcd_attr(fsl_chan->cfg.src_addr_width,
+					      fsl_chan->cfg.dst_addr_width);
+		nbytes = fsl_chan->cfg.dst_addr_width * fsl_chan->cfg.dst_maxburst;
+	} else {
+		if (!fsl_chan->cfg.dst_addr_width)
+			fsl_chan->cfg.dst_addr_width = fsl_chan->cfg.src_addr_width;
+		fsl_chan->attr =
+			fsl_edma_get_tcd_attr(fsl_chan->cfg.src_addr_width,
+					      fsl_chan->cfg.dst_addr_width);
+		nbytes = fsl_chan->cfg.src_addr_width * fsl_chan->cfg.src_maxburst;
+	}
+
+	for (i = 0; i < nb; i++) {
+		if (direction == DMA_MEM_TO_DEV) {
+			src_addr = vecs[i].addr;
+			dst_addr = fsl_chan->dma_dev_addr;
+			soff = fsl_chan->cfg.dst_addr_width;
+			doff = 0;
+		} else if (direction == DMA_DEV_TO_MEM) {
+			src_addr = fsl_chan->dma_dev_addr;
+			dst_addr = vecs[i].addr;
+			soff = 0;
+			doff = fsl_chan->cfg.src_addr_width;
+		} else {
+			/* DMA_DEV_TO_DEV */
+			src_addr = fsl_chan->cfg.src_addr;
+			dst_addr = fsl_chan->cfg.dst_addr;
+			soff = 0;
+			doff = 0;
+		}
+
+		/*
+		 * Choose the suitable burst length if dma_vec length is not
+		 * multiple of burst length so that the whole transfer length is
+		 * multiple of minor loop(burst length).
+		 */
+		if (nbytes && vecs[i].len % nbytes) {
+			u32 width = (direction == DMA_DEV_TO_MEM) ? doff : soff;
+			u32 burst = (direction == DMA_DEV_TO_MEM) ?
+						fsl_chan->cfg.src_maxburst :
+						fsl_chan->cfg.dst_maxburst;
+			int j;
+
+			for (j = burst; j > 1; j--) {
+				if (!(vecs[i].len % (j * width))) {
+					nbytes = j * width;
+					break;
+				}
+			}
+			/* Set burst size as 1 if there's no suitable one */
+			if (j == 1)
+				nbytes = width;
+		}
+
+		if (!nbytes || vecs[i].len / nbytes > FIELD_MAX(EDMA_TCD_ITER_MASK))
+			goto err_free_desc;
+
+		iter = vecs[i].len / nbytes;
+		if (i < nb - 1) {
+			last_sg = fsl_desc->tcd[(i + 1)].ptcd;
+			fsl_edma_fill_tcd(fsl_chan, fsl_desc->tcd[i].vtcd, src_addr,
+					  dst_addr, fsl_chan->attr, soff,
+					  nbytes, 0, iter, iter, doff, last_sg,
+					  false, false, true);
+		} else {
+			if (fsl_desc->iscyclic) {
+				last_sg = fsl_desc->tcd[0].ptcd;
+				fsl_edma_fill_tcd(fsl_chan, fsl_desc->tcd[i].vtcd, src_addr,
+						  dst_addr, fsl_chan->attr, soff,
+						  nbytes, 0, iter, iter, doff, last_sg,
+						  true, false, true);
+			} else {
+				last_sg = 0;
+				fsl_edma_fill_tcd(fsl_chan, fsl_desc->tcd[i].vtcd, src_addr,
+						  dst_addr, fsl_chan->attr, soff,
+						  nbytes, 0, iter, iter, doff, last_sg,
+						  true, true, false);
+			}
+		}
+	}
+
+	return vchan_tx_prep(&fsl_chan->vchan, &fsl_desc->vdesc, flags);
+
+err_free_desc:
+	fsl_edma_free_desc(&fsl_desc->vdesc);
+	return NULL;
+}
+
 struct dma_async_tx_descriptor *fsl_edma_prep_slave_sg(
 		struct dma_chan *chan, struct scatterlist *sgl,
 		unsigned int sg_len, enum dma_transfer_direction direction,
diff --git a/drivers/dma/fsl-edma-common.h b/drivers/dma/fsl-edma-common.h
index 205a96489094..0d028048701d 100644
--- a/drivers/dma/fsl-edma-common.h
+++ b/drivers/dma/fsl-edma-common.h
@@ -496,6 +496,10 @@ struct dma_async_tx_descriptor *fsl_edma_prep_dma_cyclic(
 		struct dma_chan *chan, dma_addr_t dma_addr, size_t buf_len,
 		size_t period_len, enum dma_transfer_direction direction,
 		unsigned long flags);
+struct dma_async_tx_descriptor *fsl_edma_prep_peripheral_dma_vec(
+		struct dma_chan *chan, const struct dma_vec *vecs,
+		size_t nb, enum dma_transfer_direction direction,
+		unsigned long flags);
 struct dma_async_tx_descriptor *fsl_edma_prep_slave_sg(
 		struct dma_chan *chan, struct scatterlist *sgl,
 		unsigned int sg_len, enum dma_transfer_direction direction,
diff --git a/drivers/dma/fsl-edma-main.c b/drivers/dma/fsl-edma-main.c
index 36155ab1602a..6693b4270a1a 100644
--- a/drivers/dma/fsl-edma-main.c
+++ b/drivers/dma/fsl-edma-main.c
@@ -841,6 +841,8 @@ static int fsl_edma_probe(struct platform_device *pdev)
 	fsl_edma->dma_dev.device_free_chan_resources
 		= fsl_edma_free_chan_resources;
 	fsl_edma->dma_dev.device_tx_status = fsl_edma_tx_status;
+	fsl_edma->dma_dev.device_prep_peripheral_dma_vec
+		= fsl_edma_prep_peripheral_dma_vec;
 	fsl_edma->dma_dev.device_prep_slave_sg = fsl_edma_prep_slave_sg;
 	fsl_edma->dma_dev.device_prep_dma_cyclic = fsl_edma_prep_dma_cyclic;
 	fsl_edma->dma_dev.device_prep_dma_memcpy = fsl_edma_prep_memcpy;

-- 
2.55.0

