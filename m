Received: from fsn-vps-1.bereza.email (fsn-vps-1.bereza.email [162.55.44.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA7844238C;
	Mon, 17 Aug 2026 15:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.55.44.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786979726; cv=none; b=HrcxCC4qNcSjBw9KX6UJ4QEke+mSbT2xDfXInZRkrScN+J+wedfogThTCaHjUtKAO+1EeBOwJB+m62/519qFVuk2zYPaG7tJoRf3r5wH9r8oupKzRuNDtcI19JuFnZLgEmicAAWsQjpfLWKqpJ3LSFdF5M8CsqJV7eFVJXqA1Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786979726; c=relaxed/simple;
	bh=1497zUvLIPaY94WCQ59GMwR5OvxqFEndUqy4aycPD3c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gUM7JvLVop3O6/A2TNyMeYESs3OU3fUzkf6E4CGQTPEgQTJGmnHwD/Lpzjn9/ZIiJSJl0kI+iUoFc6GfM/FJGQR8M2qN0+h9nQjVIKtSbBOx+BiOAGf7Cn+/rPxJK0CX8e9yG6rDHQIT7xYQFaPhwGL1xAkLgVr4sarkXQc7ZIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bereza.email; spf=pass smtp.mailfrom=bereza.email; dkim=pass (2048-bit key) header.d=bereza.email header.i=@bereza.email header.b=VHkD5Rbc; arc=none smtp.client-ip=162.55.44.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bereza.email
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bereza.email
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bereza.email header.i=@bereza.email header.b="VHkD5Rbc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bereza.email; s=mail;
	t=1786979720; bh=1497zUvLIPaY94WCQ59GMwR5OvxqFEndUqy4aycPD3c=;
	h=From:Date:Subject:To:Cc:From;
	b=VHkD5Rbc5ws3HydcpdXBVzFG+GHtChl9wfwpVXebrtNu74KkjNSKDrgd3J7W2pyE3
	 YkAE2vEAUEJ9o3RTp4gC24LEWGZA2CKFdPabN12S0XYH+jkzDulmRLLi+lK9CRljGy
	 6fGVetl9jF6HOBKn3S2cxJX0CENm7TAaaabdIVQXHqN2m2gBRcrsz91aj+9xgAyvF3
	 lfeUcsw9xytW0Vs2mn4GECFG0DmiInFKhqWZmzecMTw0klmt8/tlWpTBn14727RlBh
	 V3kgJgz1KPdZk6ChlaGhmB0wB/eJHfEKxol1z2GwC37wAnD+3cqJXJ0xj3GvtRf1vF
	 XoSoLyb5ZPFVg==
Received: from [127.0.1.1] (pd95bbad8.dip0.t-ipconnect.de [217.91.186.216])
	by fsn-vps-1.bereza.email (Postfix) with ESMTPSA id 91EC960279;
	Mon, 17 Aug 2026 17:15:20 +0200 (CEST)
From: Alex Bereza <alex@bereza.email>
Date: Mon, 17 Aug 2026 17:14:16 +0200
Subject: [PATCH] dmaengine: xilinx_dma: Fix hardware buffer descriptor
 chain after cyclic DMA
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260817-fix-hw-buf-desc-after-cyclic-mode-v1-1-1fe47e701d6c@bereza.email>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQ6CMBCF4auQWTtJQQXiVQyLdjqFMQqmA4Ih3
 N0Ky2/x/reCchRWuGUrRP6IytAn5KcMqLN9yyg+GQpTlKbOKwyyYDejmwJ6VkIbRo5IX3oK4Wv
 wjBSMrerzxbqrgdR5R06j/ePeHNbJPZjGfxi27QfwDVavhQAAAA==
X-Change-ID: 20260817-fix-hw-buf-desc-after-cyclic-mode-cf0a7834ab50
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Michal Simek <michal.simek@amd.com>, 
 Kedareswara rao Appana <appana.durga.rao@xilinx.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Alex Bereza <alex@bereza.email>
X-Mailer: b4 0.16.0

Using the DMA in cyclic mode modifies the hardware buffer descriptor
chain in xilinx_dma_prep_dma_cyclic so that the last descriptor used by
the cyclic transfer points back to the first descriptor, but it never
restores the original descriptor ring. This breaks using non-cyclic mode
after cyclic mode with an error like:

  xilinx-vdma 86000000.dma: Channel 00000000354d5c8d has errors 100, cdr 6de40000 tdr 6de40400

The only way to get out of this error state is to rebuild the hardware
buffer descriptor ring by releasing and re-acquiring the channel.

Fix using non-cyclic mode after cyclic mode by always restoring the
original buffer descriptor ring in the same manner as it is set up by
xilinx_dma_alloc_chan_resources().

Fixes: 23059408b6a3 ("dmaengine: xilinx_dma: Fix race condition in the driver for multiple descriptor scenario")
Signed-off-by: Alex Bereza <alex@bereza.email>
---
 drivers/dma/xilinx/xilinx_dma.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index bef2b031dba1..6d00aa97c8fc 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -756,15 +756,25 @@ xilinx_aximcdma_alloc_tx_segment(struct xilinx_dma_chan *chan)
 	return segment;
 }
 
-static void xilinx_dma_clean_hw_desc(struct xilinx_axidma_desc_hw *hw)
+static void xilinx_dma_clean_hw_desc(struct xilinx_dma_chan *chan,
+				     struct xilinx_axidma_tx_segment *segment)
 {
-	u32 next_desc = hw->next_desc;
-	u32 next_desc_msb = hw->next_desc_msb;
+	dma_addr_t next;
+	u32 i;
 
-	memset(hw, 0, sizeof(struct xilinx_axidma_desc_hw));
+	/*
+	 * Restore the buffer descriptor's next descriptor pointer to the value
+	 * set up in xilinx_dma_alloc_chan_resources(). Otherwise using the DMA
+	 * in cyclic mode leaves the next descriptor pointer altered and
+	 * prevents subsequent non-cyclic transfers.
+	 */
+	i = (segment->phys - chan->seg_p) / sizeof(*chan->seg_v);
+	next = chan->seg_p +
+	       sizeof(*chan->seg_v) * ((i + 1) % XILINX_DMA_NUM_DESCS);
 
-	hw->next_desc = next_desc;
-	hw->next_desc_msb = next_desc_msb;
+	memset(&segment->hw, 0, sizeof(segment->hw));
+	segment->hw.next_desc = lower_32_bits(next);
+	segment->hw.next_desc_msb = upper_32_bits(next);
 }
 
 static void xilinx_mcdma_clean_hw_desc(struct xilinx_aximcdma_desc_hw *hw)
@@ -786,7 +796,7 @@ static void xilinx_mcdma_clean_hw_desc(struct xilinx_aximcdma_desc_hw *hw)
 static void xilinx_dma_free_tx_segment(struct xilinx_dma_chan *chan,
 				struct xilinx_axidma_tx_segment *segment)
 {
-	xilinx_dma_clean_hw_desc(&segment->hw);
+	xilinx_dma_clean_hw_desc(chan, segment);
 
 	list_add_tail(&segment->node, &chan->free_seg_list);
 }

---
base-commit: 0d995da5fb97e8c312834575604d4423eb6225b7
change-id: 20260817-fix-hw-buf-desc-after-cyclic-mode-cf0a7834ab50

Best regards,
--  
Alex Bereza <alex@bereza.email>

