Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793648066;
	b=V9oH6TPBs+dX3wldIbU7xXd6bTWza2BHqM7nBeFjCVmDhfPWj23F8lxwvaXlfB5XlzeL
	 lZysvKVjjAxDocbdiW3XdU2XUuMCVTrq8NJhgYpys5uWVCDkpeaMlm3NthLFv+lW9+gz5
	 Th21ulyNjiGKKIvaYN3gxGjWabJ8RXMQk0KjnrTMsNU8SAGIx0CO4gxYkw+G9qcnZcXqm
	 uYRsoUqGgagu+r1ptJ2Ra8Nl1lZklmDLX1FXeUhk89TGrMCtVJzR8ygHyiF3fapcfDyZV
	 6OB0PAvVTQI9tK747tPUNhC/PfzYki9uFizULSShlRALZCrUjCEMZ2gkiyzVGDQ3M0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793648066;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=we0IY7azuqrxgazeOlN6J6HzN84gYfiRNJJDQ0SPzXc=;
	b=Clfm6BDPPZh04S96w5lwKwUK0r6T5Z36RjKpUNBCbIJXJ8ih7U3zVORGapszAPOjGuqx
	 tAd6mdvRwAIIqnZMoCERwozcz3Z35K3OxBQNwbUDVgpcbYnZTtlndirNp637lZS5vuuLB
	 BQiNVEw+fFa0m0SJnli98s7d4O+Bt1b2pBEf3Ft4OVG8YipYgcnqu93be4LOA4tdKJKN3
	 plmSL2kGQ7sfUitFEm/uPbJfWZkqDxXk2zRFEjzpc9Yg7TA3u+mMFkbec837025qv/rvH
	 ZpCyBfhJcLlfDmA+vi7ES6BQQ+THzTzZtP6h/G5skXmTtydXjwb0LR/nFBOufliOkBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OhbnuhEY;
	arc=none smtp.remote-ip=209.85.167.170
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A732606EE91
	for <dmaengine@vger.kernel.org>; Mon,  2 Nov 2026 19:34:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A732606EE91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OhbnuhEY
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-4ab8cb2a6e4so2512999b6e.0
        for <dmaengine@vger.kernel.org>; Mon, 02 Nov 2026 11:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793648065; x=1794252865; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=we0IY7azuqrxgazeOlN6J6HzN84gYfiRNJJDQ0SPzXc=;
        b=OhbnuhEY5hQumMRRHARHrab+5rBbDHoVSPboSFMXgqrUiLEDA3eUOUhUk7f3wSjZDf
         o3ZjR7qxhdyOowh14jY/EVOjlgvT+MJ1WOAHUeuNIwW2y0GDz6hpkWc7g63h9vxHmfj/
         9b+TImu/vOmqEvg46VftQACpb7dqnua8Mni11fiYhoc3Ao2oKOwyBQqlyNOZaHHl781F
         OPGRYvzsvDaD00FztxS4zx54t2mbqU2a9US4lPttUd51xPBKIBF9mMZuvJM4Iz6GjygL
         KCuxnlSoBu8GJNHH7iP5r4gYcAEQ9Xx29FOVkRd/SwXuE2mD4JwTIga2nSR/UlzE/tJF
         9DcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793648065; x=1794252865;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=we0IY7azuqrxgazeOlN6J6HzN84gYfiRNJJDQ0SPzXc=;
        b=wRvenGfgbSO9igSC3YzJEOkU6wvsGfMGyXfIY8aP7JqTwYu6aDFncW5+nluRd617/e
         UVKKQKmcdnXUacAfM+XsuUr0Kue2i3eZ+otDVastrYz43j/tF7krOaR3t7j4F4ZBJ5HG
         fhIcQBa122AIvtfuYqcfRCdrmtV6PxZw1JeDH/yG5TS3ze9z1ij5kjL+VrokmajDSafi
         iJO3TbrdkGZhPKiPHJduX7TuB7I1y3XxGZEpRwV4IJ6vFzpcWHh6kFunkdeuJXRgC8Vr
         OVlsmHFHF5FoeklcXcMS2pY3jW7vMo4pv7YDQwT2ekdhI/CtE/uFq07SvVh2VBLzVxGr
         l5mA==
X-Forwarded-Encrypted: i=1; AKwUvBxwYJD3nNdcXqLR+ESHKOTv0IlqOK41eK3sSUZWzs3M//stG9fQfMenfA1k+mqjQpdaBq9Irf+TFag=@vger.kernel.org
X-Gm-Message-State: AFq9FYIu8d0879iJ93gGa3z04BQIkh2Vkym+BWjLcx1oYZxmQPUhVTUs
	gKEu1Nioivom9T0z4HWkBmaeZRdxttoZdlx5T13U+FStA4b3T7eFkU/k
X-Gm-Gg: AYBFou1FmfIIMpgUV+xA5PLJUisXP+9vNr9p7wgMhRt/c0RlUYyAS1zBMDgi6pnJM6C
	sahI+4rG/KpAmszzPkD3MiCI1yLPNlO4TFXwIsZGKeLmksaMqRG1dI5WJDMAtGemgTlk4h6N0Hn
	M8B4Ex5LcCvHxdUlX0quEm9qy151TEv1jUK2xNKZhOCXqjoocygBru9LmYQTNv8/OlV1ofoj1YL
	H7or0T/lggZqo6dyTDKWZarOAyFAa352mgE+ljvWL198qO5oyIaOgrD6Fnkny9qvlH5FPQ1q8ZB
	IcfYFB1nzzCsAxIHJlryHk7QQUBLX28dAhjyUxLMedEnCNCjDAkUZp4GDcNI1OIcL0BSvSiUzwv
	2VYv4rvTGytFbnvYYhjXj7uUce7SvvNGqiDH5/S+X36g3v7OP0IjAICcMbPzFaSV7afj/iupCF8
	08Yz7F8dZpw+oklHofGo7KFs3z+jscnd+PWRSwrx/Lz4EgVfRG3w9R56/dfojMiNZ8fD/zmMSem
	czKVMUDNLlUIfQEBX5NOHb0OoKacO3ABOnN5gEXnZtElyLCqiT1zsGwJLJz2GRv8aM3jvXdbP3t
	mPhnYyJmfOvqX2uSGFR59TiUT913oRcA+cLNPyzuM0+Cagmx464I2kDK9u8L54XxyeUmvSfscrW
	xmydVDA5Q3iWctaTHzKweDcBrqjc5g/KWvZL+6T71ciF14J/m+eH+lpCLA6B6biFhIPa4AlhUdB
	1dpkodXtSSx7ECyWg5QoJcsQrXz+jO/fO8x3h/m/ydD3mkZemDhHu8
X-Received: by 2002:a05:6808:178b:b0:4e9:cbdd:457d with SMTP id 5614622812f47-5640dcb7433mr7328390b6e.11.1793648065100;
        Mon, 02 Nov 2026 11:34:25 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fd93451sm8558249b6e.3.2026.11.02.11.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:34:24 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 02 Nov 2026 12:34:18 -0700
Subject: [PATCH v5 06/10] dmaengine: dw: simplify transfer-complete
 handling
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-submit-dw-dma-synchronize-v1-v5-6-d3207758fbf9@gmail.com>
References: <20261102-submit-dw-dma-synchronize-v1-v5-0-d3207758fbf9@gmail.com>
In-Reply-To: <20261102-submit-dw-dma-synchronize-v1-v5-0-d3207758fbf9@gmail.com>
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Dan Williams <djbw@kernel.org>
Cc: Serge Semin <fancer.lancer@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 dmaengine@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

With hardware-LLP residue handled by the status getter, the descriptor
scanner only needs to process transfer-complete events. Return through a
common unlock path when no event or active descriptor remains, and flatten
the completion handling.

Only one transaction is active on a channel. Detach that descriptor before
starting the next queued transfer, keeping cookie completion under the
channel lock and client notification outside it. Preserve software-LLP
block advancement before completing the transaction.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

---

Changelog RFC:
- Instead of just dropping the dwc_scan_descriptors() method invocation
  calculate the residue in the Tx-status getter.
---
 drivers/dma/dw/core.c | 92 +++++++++++++++++++++------------------------------
 1 file changed, 38 insertions(+), 54 deletions(-)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index 0d6b5bd8ea6b..e198c9f45f0b 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -271,74 +271,58 @@ static void dwc_scan_descriptors(struct dw_dma *dw, struct dw_dma_chan *dwc)
 {
 	struct dw_desc *desc, *_desc;
 	struct dw_desc *child;
-	u32 status_xfer;
 	unsigned long flags;
 	LIST_HEAD(list);
 
 	spin_lock_irqsave(&dwc->lock, flags);
-	status_xfer = dma_readl(dw, RAW.XFER);
-
-	if (status_xfer & dwc->mask) {
-		/* Everything we've submitted is done */
-		dma_writel(dw, CLEAR.XFER, dwc->mask);
-		if (list_empty(&dwc->active_list)) {
-			spin_unlock_irqrestore(&dwc->lock, flags);
-			return;
-		}
-
-		if (test_bit(DW_DMA_IS_SOFT_LLP, &dwc->flags)) {
-			struct list_head *head, *active = dwc->tx_node_active;
-
-			/*
-			 * We are inside first active descriptor.
-			 * Otherwise something is really wrong.
-			 */
-			desc = dwc_first_active(dwc);
-
-			head = &desc->tx_list;
-			if (active != head) {
-				/* Update residue to reflect last sent descriptor */
-				if (active == head->next)
-					desc->residue -= desc->len;
-				else
-					desc->residue -= to_dw_desc(active->prev)->len;
 
-				child = to_dw_desc(active);
-
-				/* Submit next block */
-				dwc_do_single_block(dwc, child);
+	if (!(dma_readl(dw, RAW.XFER) & dwc->mask))
+		goto unlock;
 
-				spin_unlock_irqrestore(&dwc->lock, flags);
-				return;
-			}
+	dma_writel(dw, CLEAR.XFER, dwc->mask);
+	if (list_empty(&dwc->active_list))
+		goto unlock;
 
-			/* We are done here */
-			clear_bit(DW_DMA_IS_SOFT_LLP, &dwc->flags);
+	desc = dwc_first_active(dwc);
+	if (test_bit(DW_DMA_IS_SOFT_LLP, &dwc->flags)) {
+		struct list_head *head = &desc->tx_list;
+		struct list_head *active = dwc->tx_node_active;
+
+		if (active != head) {
+			/* Update residue to reflect last sent descriptor. */
+			if (active == head->next)
+				desc->residue -= desc->len;
+			else
+				desc->residue -= to_dw_desc(active->prev)->len;
+
+			child = to_dw_desc(active);
+
+			/* Submit next block, including for polled transfers. */
+			dwc_do_single_block(dwc, child);
+			goto unlock;
 		}
 
-		if (dma_readl(dw, CH_EN) & dwc->mask) {
-			dev_err(dmaengine_chan_dev(&dwc->chan),
-				"BUG: XFER bit set, but channel not idle!\n");
-
-			/* Try to continue after resetting the channel... */
-			dwc_chan_disable(dw, dwc);
-		}
+		clear_bit(DW_DMA_IS_SOFT_LLP, &dwc->flags);
+	}
 
-		/* Detach the completed transfer before starting queued work. */
-		list_splice_init(&dwc->active_list, &list);
-		list_for_each_entry(desc, &list, desc_node)
-			dma_cookie_complete(&desc->txd);
-		dwc_dostart_first_queued(dwc);
-		spin_unlock_irqrestore(&dwc->lock, flags);
+	if (dma_readl(dw, CH_EN) & dwc->mask) {
+		dev_err(dmaengine_chan_dev(&dwc->chan),
+			"BUG: XFER bit set, but channel not idle!\n");
 
-		list_for_each_entry_safe(desc, _desc, &list, desc_node) {
-			list_del_init(&desc->desc_node);
-			dwc_descriptor_free(dwc, desc, true);
-		}
-		return;
+		/* Try to continue after resetting the channel... */
+		dwc_chan_disable(dw, dwc);
 	}
 
+	dma_cookie_complete(&desc->txd);
+	list_move_tail(&desc->desc_node, &list);
+	dwc_dostart_first_queued(dwc);
+unlock:
 	spin_unlock_irqrestore(&dwc->lock, flags);
+
+	list_for_each_entry_safe(desc, _desc, &list, desc_node) {
+		list_del_init(&desc->desc_node);
+		dwc_descriptor_free(dwc, desc, true);
+	}
 }
 
 static inline void dwc_dump_lli(struct dw_dma_chan *dwc, struct dw_desc *desc)

-- 
2.53.0

