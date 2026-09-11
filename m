Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29872485928
	for <dmaengine@vger.kernel.org>; Fri, 11 Sep 2026 13:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789132325; cv=none; b=NabA2AjtLcp0r+GLEPWf7fQ/0BOH48surDC9s9s328q+FKnRYhllMO90tBgYYehETjaURzKoCKD7riK2LMLEsXYg2D2S19GnugXreLfFfpGNVqS5z4Ul/MiYe9Gev1e3yx3MMNCV+TkyU62C7iDqNkSAH3qc1zq1sxb8ovuLfEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789132325; c=relaxed/simple;
	bh=vQx0LZLiBDwWTtHum9mo4jwmgd1rYnoisRw9FB2pl4I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y8vLoWwvTL5mhvOW4h7fTZrpnNr9HLcCFIvrCr0JQdZJTdCjHZXFtgR1f+34Z8NDHlDs/1IoU2zpuWi9KO+Q0+4S3RfcgOaAgz3DZuirh9NGkyI7dey027bUeHyU6UOWDHctoNosGQRlznH6tyKY4Zcl/8cc1m2XPO957qilI4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=21vLW6ds; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="21vLW6ds"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 575464E401EF
	for <dmaengine@vger.kernel.org>; Fri, 11 Sep 2026 13:12:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2B4F5601DE;
	Fri, 11 Sep 2026 13:12:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E319811C7AF8E;
	Fri, 11 Sep 2026 15:11:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789132316; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6QMygRXKwHPoD6Xp5us5gF6zFOpvLCwx/CyKoLpaAKo=;
	b=21vLW6dsYA8fl6zrUWORwVcnw4tF0A8gMN8iTj4gCV+aaEgwvnYT3DkfGpIgAdsYL4kG4M
	67iPXm5zWsYnZEn1kNhXXbUKo0dwtIF+63iI/Y/F8clx1AXVhMj0HH95z4KUr3bd5hrgK1
	i68MXGnGj7LimGXYnPriUlXFre9aLvO9f7QZ/HxZmWX3S9Ibiw3kuXucyuMfjnG6+llvd6
	QLZCeGTvEOgR1yFrOSDr16PlvBaQkjnPPTvDV4h6N8uWL72z264W1qDEIutcdp0oGz8wEd
	R29z87g8BMBxJKrNj0vtsliCq9sBGA13i8CwI5JfxSM+OeGY8iu2HEqUCDg2AA==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Fri, 11 Sep 2026 15:11:37 +0200
Subject: [PATCH v10 2/2] dmaengine: fsl-edma: Support dynamic
 scatter/gather chaining
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260911-fsl-edma-dyn-sg-v10-2-700eb72def57@bootlin.com>
References: <20260911-fsl-edma-dyn-sg-v10-0-700eb72def57@bootlin.com>
In-Reply-To: <20260911-fsl-edma-dyn-sg-v10-0-700eb72def57@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Frank Li <Frank.Li@kernel.org>, imx@lists.linux.dev, 
 dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

Implement dynamic linking of scatter/gather transfers to enable
chaining multiple DMA descriptors without stopping the channel.
This avoids waiting for the channel to go idle if there is another
transaction already issued.

Add fsl_edma_link_sg() to dynamically link the last TCD of a previously
issued descriptor to the first TCD of a new descriptor by setting the
scatter/gather address and the E_SG flag, and keeping the channel active
by clearing the DREQ bit.

Also in fsl_edma_link_sg(), assign a non-zero identifier to the new
descriptor that is stored in the EDMA_TCD_CSR_LINKCH field of the CSR
of each TCD, after checking that the descriptors are not using channel
linking. The use of this field (MAJORLINKCH in the datasheet) as an
identifier for dynamic scatter/gather is suggested in the i.MX93 datasheet.

When the last issued descriptor is the one currently active on the
channel and has a single TCD, the scatter/gather address and CSR are
also written directly to the hardware registers to ensure the link
takes effect immediately, unless the DMA controller requires the DONE
bit to be cleared for the CSR change to take effect. Clearing the DONE
bit would disrupt the interrupt handler.

Linking is done in fsl_edma_issue_pending(), which iterates over the
submitted descriptors, links each one to the previously issued
descriptor via fsl_edma_link_sg(), and then moves it to the issued
list. This ensures that transactions are linked in the order they were
issued. Linking of a descriptor is limited to 31 outstanding descriptors
on the issued list so the identifier fits in the LINKCH field of the CSR
register. The value of zero is left to identify non-linked descriptors.

Update fsl_edma_xfer_desc() to avoid re-initializing the hardware when a
transfer is already in progress, allowing seamless chaining of descriptors.

Modify the transfer completion handler to check the DONE flag in the
channel CSR before marking the transfer complete. Since this flag is only
available on SoC with the split registers layout, only link transactions
for DMA controllers flagged with newly added FSL_EDMA_DRV_CSR_LINKCH. This
flag is set for eDMA3 and EDMA4 controllers which are able to perform
dynamic scatter/gather linking.

The completion handler also reaps issued descriptors whose link channel ID
(EDMA_TCD_CSR_LINKCH) has already been passed by the hardware, marking
them as completed even if their corresponding interrupt has been missed.

Add trace event for scatter/gather linking operations.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 drivers/dma/fsl-edma-common.c | 138 ++++++++++++++++++++++++++++++++++++++++--
 drivers/dma/fsl-edma-common.h |  11 +++-
 drivers/dma/fsl-edma-trace.h  |   5 ++
 3 files changed, 146 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/fsl-edma-common.c b/drivers/dma/fsl-edma-common.c
index c5f5951c988b..76fbd2bc5154 100644
--- a/drivers/dma/fsl-edma-common.c
+++ b/drivers/dma/fsl-edma-common.c
@@ -55,10 +55,36 @@ void fsl_edma_tx_chan_handler(struct fsl_edma_chan *fsl_chan)
 	}
 
 	if (!fsl_chan->edesc->iscyclic) {
-		list_del(&fsl_chan->edesc->vdesc.node);
-		vchan_cookie_complete(&fsl_chan->edesc->vdesc);
+		u16 csr = edma_read_tcdreg(fsl_chan, csr);
+		u8 link_sg_id = FIELD_GET(EDMA_TCD_CSR_LINKCH, csr);
+		struct virt_dma_desc *vdesc, *tmp;
+
+		/* Channel is DONE when a TCD with D_REQ set completes */
+		if (!(fsl_edma_drvflags(fsl_chan) & FSL_EDMA_DRV_SPLIT_REG) ||
+		    (edma_readl_chreg(fsl_chan, ch_csr) & EDMA_V3_CH_CSR_DONE)) {
+			fsl_chan->status = DMA_COMPLETE;
+		}
+
+		list_for_each_entry_safe(vdesc, tmp, &fsl_chan->vchan.desc_issued, node) {
+			struct fsl_edma_desc *fsl_desc = to_fsl_edma_desc(vdesc);
+			bool id_match = (link_sg_id == fsl_desc->link_sg_id);
+
+			/*
+			 * If the transfer is still running,
+			 * don't mark as complete the current descriptor
+			 */
+			if (id_match && fsl_chan->status != DMA_COMPLETE)
+				break;
+
+			list_del(&vdesc->node);
+			vchan_cookie_complete(vdesc);
+
+			if (id_match)
+				break;
+		}
+
 		fsl_chan->edesc = NULL;
-		fsl_chan->status = DMA_COMPLETE;
+
 	} else {
 		vchan_cyclic_callback(&fsl_chan->edesc->vdesc);
 	}
@@ -931,14 +957,99 @@ void fsl_edma_xfer_desc(struct fsl_edma_chan *fsl_chan)
 	if (!vdesc)
 		return;
 	fsl_chan->edesc = to_fsl_edma_desc(vdesc);
-	fsl_edma_set_tcd_regs(fsl_chan, fsl_chan->edesc->tcd[0].vtcd);
-	fsl_edma_enable_request(fsl_chan);
-	fsl_chan->status = DMA_IN_PROGRESS;
+
+	if (fsl_chan->status != DMA_IN_PROGRESS) {
+		fsl_edma_set_tcd_regs(fsl_chan, fsl_chan->edesc->tcd[0].vtcd);
+		fsl_edma_enable_request(fsl_chan);
+		fsl_chan->status = DMA_IN_PROGRESS;
+	}
+}
+
+static void fsl_edma_link_sg(struct fsl_edma_chan *fsl_chan, struct fsl_edma_desc *fsl_desc)
+{
+	u32 flags = fsl_edma_drvflags(fsl_chan);
+	struct fsl_edma_hw_tcd *last_tcd;
+	struct fsl_edma_desc *prev_desc;
+	struct virt_dma_desc *vdesc;
+	u16 last_csr;
+
+	lockdep_assert_held(&fsl_chan->vchan.lock);
+
+	if (!(flags & FSL_EDMA_DRV_CSR_LINKCH) || fsl_desc->iscyclic)
+		return;
+
+	vdesc = list_last_entry_or_null(&fsl_chan->vchan.desc_issued,
+					struct virt_dma_desc, node);
+	if (!vdesc)
+		return;
+
+	prev_desc = to_fsl_edma_desc(vdesc);
+	if (prev_desc->iscyclic)
+		return;
+
+	last_tcd = prev_desc->tcd[prev_desc->n_tcds - 1].vtcd;
+	last_csr = fsl_edma_get_tcd_to_cpu(fsl_chan, last_tcd, csr);
+
+	for (unsigned int i = 0; i < fsl_desc->n_tcds; i++) {
+		struct fsl_edma_hw_tcd *tcd = fsl_desc->tcd[i].vtcd;
+
+		if (fsl_edma_get_tcd_to_cpu(fsl_chan, tcd, csr) & EDMA_TCD_CSR_E_LINK)
+			return;
+	}
+
+	if (!(last_csr & EDMA_TCD_CSR_D_REQ) ||
+	    last_csr & EDMA_TCD_CSR_E_LINK)
+		return;
+
+	/* Set a non-zero linked SG identifier to all TCD of the new descriptor */
+	fsl_chan->link_sg_id++;
+	if (fsl_chan->link_sg_id > FIELD_MAX(EDMA_TCD_CSR_LINKCH))
+		fsl_chan->link_sg_id = 1;
+
+	fsl_desc->link_sg_id = fsl_chan->link_sg_id;
+
+	for (unsigned int i = 0; i < fsl_desc->n_tcds; i++) {
+		struct fsl_edma_hw_tcd *tcd = fsl_desc->tcd[i].vtcd;
+		u16 csr = fsl_edma_get_tcd_to_cpu(fsl_chan, tcd, csr);
+
+		csr |= FIELD_PREP(EDMA_TCD_CSR_LINKCH, fsl_chan->link_sg_id);
+		fsl_edma_set_tcd_to_le(fsl_chan, tcd, csr, csr);
+	}
+
+	/*
+	 * Set DLAST_SGA before enabling E_SG in CSR: if the DMA engine
+	 * only picks up the former, it updates DADDR at end of transfer,
+	 * which is not reused.
+	 */
+	fsl_edma_set_tcd_to_le(fsl_chan, last_tcd, fsl_desc->tcd[0].ptcd, dlast_sga);
+
+	dma_wmb();
+
+	last_csr &= ~EDMA_TCD_CSR_D_REQ;
+	last_csr |= EDMA_TCD_CSR_E_SG;
+	fsl_edma_set_tcd_to_le(fsl_chan, last_tcd, last_csr, csr);
+
+	/*
+	 * Update the registers if the engine already loaded the TCD,
+	 * unless doing so requires clearing the DONE bit, as that could
+	 * lead to lost completion.
+	 */
+	if (prev_desc == fsl_chan->edesc &&
+	    prev_desc->n_tcds == 1 &&
+	    !(flags & FSL_EDMA_DRV_CLEAR_DONE_E_SG)) {
+		edma_cp_tcd_to_reg(fsl_chan, last_tcd, dlast_sga);
+		edma_cp_tcd_to_reg(fsl_chan, last_tcd, csr);
+	}
+
+	trace_edma_link_sg(fsl_chan, last_tcd);
 }
 
 void fsl_edma_issue_pending(struct dma_chan *chan)
 {
 	struct fsl_edma_chan *fsl_chan = to_fsl_edma_chan(chan);
+	struct virt_dma_desc *vdesc, *tmp;
+	size_t issued_count = 0;
+	struct list_head *pos;
 	unsigned long flags;
 
 	spin_lock_irqsave(&fsl_chan->vchan.lock, flags);
@@ -949,6 +1060,21 @@ void fsl_edma_issue_pending(struct dma_chan *chan)
 		return;
 	}
 
+	/* Count the issued desc up to the maximum number of linked SG id */
+	list_for_each(pos, &fsl_chan->vchan.desc_issued) {
+		if (++issued_count > FIELD_MAX(EDMA_TCD_CSR_LINKCH))
+			break;
+	}
+
+	/* Link the SG descriptors with the available identifiers */
+	list_for_each_entry_safe(vdesc, tmp, &fsl_chan->vchan.desc_submitted, node) {
+		if (++issued_count > FIELD_MAX(EDMA_TCD_CSR_LINKCH))
+			break;
+		fsl_edma_link_sg(fsl_chan, to_fsl_edma_desc(vdesc));
+		list_move_tail(&vdesc->node, &fsl_chan->vchan.desc_issued);
+	}
+
+	/* Issue the rest of the descriptors unlinked */
 	if (vchan_issue_pending(&fsl_chan->vchan) && !fsl_chan->edesc)
 		fsl_edma_xfer_desc(fsl_chan);
 
diff --git a/drivers/dma/fsl-edma-common.h b/drivers/dma/fsl-edma-common.h
index 0d028048701d..cbb077e98f55 100644
--- a/drivers/dma/fsl-edma-common.h
+++ b/drivers/dma/fsl-edma-common.h
@@ -42,6 +42,7 @@
 #define EDMA_TCD_CSR_E_LINK		BIT(5)
 #define EDMA_TCD_CSR_ACTIVE		BIT(6)
 #define EDMA_TCD_CSR_DONE		BIT(7)
+#define EDMA_TCD_CSR_LINKCH		GENMASK(12, 8)
 
 #define EDMA_V3_TCD_NBYTES_MLOFF_NBYTES(x) ((x) & GENMASK(9, 0))
 #define EDMA_V3_TCD_NBYTES_MLOFF(x)        (x << 10)
@@ -169,6 +170,7 @@ struct fsl_edma_chan {
 	struct dma_slave_config		cfg;
 	u32				attr;
 	bool                            is_sw;
+	u8				link_sg_id;
 	struct dma_pool			*tcd_pool;
 	dma_addr_t			dma_dev_addr;
 	u32				dma_dev_size;
@@ -199,6 +201,7 @@ struct fsl_edma_desc {
 	struct virt_dma_desc		vdesc;
 	struct fsl_edma_chan		*echan;
 	bool				iscyclic;
+	u8				link_sg_id;
 	enum dma_transfer_direction	dirn;
 	unsigned int			n_tcds;
 	struct fsl_edma_sw_tcd		tcd[];
@@ -225,6 +228,8 @@ struct fsl_edma_desc {
 #define FSL_EDMA_DRV_TCD64		BIT(15)
 /* All channel ERR IRQ share one IRQ line */
 #define FSL_EDMA_DRV_ERRIRQ_SHARE       BIT(16)
+/* Major link channel in CSR used for linking SG descriptors */
+#define FSL_EDMA_DRV_CSR_LINKCH		BIT(17)
 
 
 #define FSL_EDMA_DRV_EDMA3	(FSL_EDMA_DRV_SPLIT_REG |	\
@@ -232,13 +237,15 @@ struct fsl_edma_desc {
 				 FSL_EDMA_DRV_DEV_TO_DEV |	\
 				 FSL_EDMA_DRV_ALIGN_64BYTE |	\
 				 FSL_EDMA_DRV_CLEAR_DONE_E_SG |	\
-				 FSL_EDMA_DRV_CLEAR_DONE_E_LINK)
+				 FSL_EDMA_DRV_CLEAR_DONE_E_LINK |	\
+				 FSL_EDMA_DRV_CSR_LINKCH)
 
 #define FSL_EDMA_DRV_EDMA4	(FSL_EDMA_DRV_SPLIT_REG |	\
 				 FSL_EDMA_DRV_BUS_8BYTE |	\
 				 FSL_EDMA_DRV_DEV_TO_DEV |	\
 				 FSL_EDMA_DRV_ALIGN_64BYTE |	\
-				 FSL_EDMA_DRV_CLEAR_DONE_E_LINK)
+				 FSL_EDMA_DRV_CLEAR_DONE_E_LINK |	\
+				 FSL_EDMA_DRV_CSR_LINKCH)
 
 struct fsl_edma_drvdata {
 	u32			dmamuxs; /* only used before v3 */
diff --git a/drivers/dma/fsl-edma-trace.h b/drivers/dma/fsl-edma-trace.h
index 45d964a3726d..f4b0021d2bd0 100644
--- a/drivers/dma/fsl-edma-trace.h
+++ b/drivers/dma/fsl-edma-trace.h
@@ -121,6 +121,11 @@ DEFINE_EVENT(edma_log_tcd, edma_fill_tcd,
 	TP_ARGS(chan, tcd)
 );
 
+DEFINE_EVENT(edma_log_tcd, edma_link_sg,
+	     TP_PROTO(struct fsl_edma_chan *chan, void *tcd),
+	     TP_ARGS(chan, tcd)
+);
+
 #endif
 
 /* this part must be outside header guard */

-- 
2.55.0

