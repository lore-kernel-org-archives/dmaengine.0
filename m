Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B9A23A561;
	Wed, 23 Sep 2026 03:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790132568; cv=none; b=Ft1JjOnajaDTLptp4E3AwgFg2FCxkBIXs9tiBZEtP/5zyP281L7fBLjvfgwsjJ796CKBrSiL8YG5yLrlSV1rE7LmyXdg1k6PJ1NUyr5IOuxHRFpdnuPLDqDe+E2SAsSpv59qbODHOv1hmq50uTD0VrEGn1o6x3vTWMgINeBxOnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790132568; c=relaxed/simple;
	bh=OpBMzIh0s7WPZekJWq2eRPQKXNnq6MxgX9eyXEZt7zI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=czgc5bT47SLrZVp6Aeta+iZ4PVUolCtAPuL2DcMuup9eIRAnTwLwXbk/GZDHX4sopyv+7eG5oxDak6ppPBC9yWulfRuQlTbOVb6mumww0402bbmb6rbHugVEL+0JxThR5txleuEcfZaerNtS6MG3h0VPY9ao0Rrt6ESo9tCU6rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=F8h+xpBU; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="F8h+xpBU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=k0
	W+FEHgDviHkmWS5vK0O5npEnjkO1jC0pRxVJqPdSA=; b=F8h+xpBUbn5b/9sYIT
	r85If0+pItbsylU5oaEbm3ufHgR4BqUNuhW3r88vKtTpBZ9XZjEJsvI9HY6sBUjH
	yYtA4HL0bNtvEpESZqE51ac1ZMJGoTBr+L94vnfEzwsccBzz9G+OFXKP/OSZ7wWy
	xRUIfKQVHmPk1SuamLf7rc020=
Received: from LUOBO-DINQG8T.hobot.cc (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wB3tvFDQbNqX37yAA--.32722S2;
	Wed, 23 Sep 2026 11:02:29 +0800 (CST)
From: Rui Wang <wr574332525@163.com>
To: vkoul@kernel.org,
	Eugeniy.Paltsev@synopsys.com
Cc: Frank.Li@kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rui Wang <wr574332525@163.com>
Subject: [PATCH] dmaengine: dw-axi-dmac: report paused state and residue in tx_status
Date: Wed, 23 Sep 2026 11:02:01 +0800
Message-ID: <20260923030201.859-1-wr574332525@163.com>
X-Mailer: git-send-email 2.53.0.windows.2
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wB3tvFDQbNqX37yAA--.32722S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAw4fAw4ftrWrtF1DCr1kAFb_yoWrZFW7pa
	y5GayfGryjgrnIqF4rXw48Jr4rZF4FqFW2vrW5XasIkFWYgF9akFn7Ka4FqF1UJFyvv34I
	9a1Yya43GF1UCrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piYFAdUUUUU=
X-CM-SenderInfo: lzuvlkittskjqv6rljoofrz/xtbC0wXogWqzQUX0zgAA3Y

The driver implements device_pause/device_resume, but device_tx_status
keeps reporting DMA_IN_PROGRESS for a paused channel, so clients cannot
tell a paused channel apart from a running one. Report DMA_PAUSED when
the channel is paused and the cookie is still in flight, and clear the
stale is_paused flag in dma_chan_terminate_all(), which disables the
channel and thus implicitly cancels the paused state.

Also, the residue of an in-flight transfer is currently derived from
the number of completed LLI blocks, so it only advances in block-size
steps and stays stale for the duration of a large block. Read the
current hardware pointer (CH_SAR for MEM_TO_DEV and MEM_TO_MEM, CH_DAR
for DEV_TO_MEM) and walk the descriptor's LLIs to compute how many
bytes have actually been transferred. Queued descriptors keep
reporting their full length and cyclic descriptors keep the
block-granular accounting.

Tested on an FPGA platform.

Signed-off-by: Rui Wang <wr574332525@163.com>
---
 .../dma/dw-axi-dmac/dw-axi-dmac-platform.c    | 60 ++++++++++++++++---
 1 file changed, 53 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index eebed2474..4e1b8654a 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -352,19 +352,51 @@ static void vchan_desc_put(struct virt_dma_desc *vdesc)
 	axi_desc_put(vd_to_axi_desc(vdesc));
 }
 
+/*
+ * Return the number of bytes already transferred by the in-flight
+ * non-cyclic descriptor, based on the current hardware read or write
+ * position: CH_SAR for MEM_TO_DEV and MEM_TO_MEM, CH_DAR for
+ * DEV_TO_MEM. Must be called with vc.lock held and the channel
+ * running or paused.
+ */
+static u32 axi_chan_get_xferred(struct axi_dma_chan *chan,
+				struct axi_dma_desc *desc)
+{
+	struct axi_dma_hw_desc *hw_desc;
+	bool dst = chan->direction == DMA_DEV_TO_MEM;
+	u64 pos, start;
+	u32 xferred = 0;
+	int i;
+
+	pos = lo_hi_readq(chan->chan_regs + (dst ? CH_DAR : CH_SAR));
+
+	for (i = 0; i < desc->nr_hw_descs; i++) {
+		hw_desc = &desc->hw_desc[i];
+		start = le64_to_cpu(dst ? hw_desc->lli->dar : hw_desc->lli->sar);
+
+		/* Current position is inside this block: partial progress */
+		if (pos >= start && pos <= start + hw_desc->len)
+			return xferred + (u32)(pos - start);
+
+		xferred += hw_desc->len;
+	}
+
+	/* Position doesn't match any block, be conservative */
+	return 0;
+}
+
 static enum dma_status
 dma_chan_tx_status(struct dma_chan *dchan, dma_cookie_t cookie,
 		   struct dma_tx_state *txstate)
 {
 	struct axi_dma_chan *chan = dchan_to_axi_dma_chan(dchan);
 	struct virt_dma_desc *vdesc;
+	struct axi_dma_desc *desc;
 	enum dma_status status;
 	u32 completed_length;
 	unsigned long flags;
-	u32 completed_blocks;
 	size_t bytes = 0;
 	u32 length;
-	u32 len;
 
 	status = dma_cookie_status(dchan, cookie, txstate);
 	if (status == DMA_COMPLETE || !txstate)
@@ -374,13 +406,26 @@ dma_chan_tx_status(struct dma_chan *dchan, dma_cookie_t cookie,
 
 	vdesc = vchan_find_desc(&chan->vc, cookie);
 	if (vdesc) {
-		length = vd_to_axi_desc(vdesc)->length;
-		completed_blocks = vd_to_axi_desc(vdesc)->completed_blocks;
-		len = vd_to_axi_desc(vdesc)->hw_desc[0].len;
-		completed_length = completed_blocks * len;
-		bytes = length - completed_length;
+		desc = vd_to_axi_desc(vdesc);
+		length = desc->length;
+
+		if (chan->cyclic)
+			completed_length = desc->completed_blocks *
+					   desc->hw_desc[0].len;
+		else if (vdesc == vchan_next_desc(&chan->vc) &&
+			 (axi_chan_is_hw_enable(chan) || chan->is_paused))
+			/* In-flight descriptor: read progress from hardware */
+			completed_length = axi_chan_get_xferred(chan, desc);
+		else
+			/* Still queued, nothing transferred yet */
+			completed_length = 0;
+
+		bytes = length - min_t(u32, completed_length, length);
 	}
 
+	if (chan->is_paused && status == DMA_IN_PROGRESS)
+		status = DMA_PAUSED;
+
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
 	dma_set_residue(txstate, bytes);
 
@@ -1206,6 +1251,7 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
 	vchan_get_all_descriptors(&chan->vc, &head);
 
 	chan->cyclic = false;
+	chan->is_paused = false;
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
 
 	vchan_dma_desc_free_list(&chan->vc, &head);
-- 
2.43.0

