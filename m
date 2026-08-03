Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA6D40C5AE;
	Mon,  3 Aug 2026 13:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785763258; cv=none; b=PYbq1FHTnNfnn2yfPZAVTVbxYxioNSbD7d5Y6++cedBztLzpxPB0wp6Eti9Dhevj245D6LHcZ8OGOdDeQmW0rbj5rJqgYkTRClJRwZ4lXYuwavj8raAgYIYAOrkUe+rKhvaz2sV+qKdZsfz0Aei56biITObQj4vxeWogZoyTxXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785763258; c=relaxed/simple;
	bh=N/Q2BZs2GsIvqmqEPKL4yjBnHG0dhXCSTr4QUD4HJ4c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=cx9O5W13ljlPZHDNPzNWDjSAkGeJxAXdB6OHkSuwHPEfviiU8C+Qa2bolPvy1pVXoaBGtTHyHmWM+/elXudA4HCsjqJF04r4qMGD3eQweuHLRl1tvrh8Rj7Jx4fDwdLNTT9udGaRI4p2NEAJZuC9CBCl1+P4IGJeG0TsAjfYfOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lJKkTeeU; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lJKkTeeU"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6446A5B3;
	Mon,  3 Aug 2026 15:19:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1785763172;
	bh=N/Q2BZs2GsIvqmqEPKL4yjBnHG0dhXCSTr4QUD4HJ4c=;
	h=From:Date:Subject:To:Cc:From;
	b=lJKkTeeUY4c+U6weXKsg8d6C5yARqgzNmC8jbA8RcMdsHjvCzO1zwH0LjZjRnx0Ez
	 ALErel+OgcmDNwLK08ojO3333+U9ipNX3kAZd/bcX9i48Ckd+0/EONr7n3utARp1Tf
	 y7h1WNYyVrh7kHN2qEsS132Sj1c70oPjMf2CyIGk=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Mon, 03 Aug 2026 16:20:05 +0300
Subject: [PATCH] dmaengine: xilinx_dma: Use readl_poll_timeout() instead of
 atomic variant
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-xilinx-dma-poll-fix-v1-1-892302c4847d@ideasonboard.com>
X-B4-Tracking: v=1; b=H4sIAISVcGoC/yXMQQ5AMBCF4avIrE1SpIiriEUxGKmSFmki7q5Yf
 i95/wWOLJODKrrA0smOVxOQxBF0kzIjIffBkIo0F6XI0LNm47FfFG6r1jiwx0SqVspcFYMsITw
 3S2H+qnXz2x3tTN3+puC+H3t1F0t3AAAA
X-Change-ID: 20260803-xilinx-dma-poll-fix-15ab556a7f58
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Michal Simek <michal.simek@amd.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Vishal Sagar <vishal.sagar@amd.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1752;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=N/Q2BZs2GsIvqmqEPKL4yjBnHG0dhXCSTr4QUD4HJ4c=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqcJWlpXPCpymGRS5mHpwrq8lQsKiORGsxwzJEh
 AKxs7O5PA+JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCanCVpQAKCRD6PaqMvJYe
 9RUDD/9axI59nT6bxN31t6u9c53RZg+Q4UaDJqwJJFKrUVNyGlLRGWwc7OcoWfedos0jQqd+O92
 TbBY5JoPl55RtRCz11ggHIWs4o8c46dsg/XPr+R2+TeNYwgoH/a1qXkIqbPSF99PCVRP8enBGuA
 jhVfTzOfvxAwnM/qEpcIcmituVdTq2dLuQLccU3QfhC+c13uQ7n4YvkjpmZwT8AOASrFgxoYDIP
 pOC2jG65aHgoxFLvqJydejSrMBkzn72Z8FCdkKfrf7H8XzpEcbtw0mDRYVrKroMvEnBOxPhOyii
 5jHlcWRCd/mBa9j99I01P58FtiZjIsHwhO+5zHarSKMU5PQbq9wjKkG+P68tfHLQPJMJlj/4dHL
 s6R+YCCbdsikBdPalmziaZ1SDNWuBjtV7WfdoqZeNsLUVMd5YtemgtcRJzqmlfFdNmYbr2Zrzpj
 c62KTeBRtcSa49IwEB69hKQD1YzkEuPsQYyjfnio+pdmv44NldlZe4P6TkrASMlM9wlAvPINegC
 s7ryooJW9g3sNXcFKdgRjDXfqG6uBkM7YIorSzi4B8NCgZMi9u9lmUos25/4lHAw/HkKxdmASBD
 E839ChlYwOCFerIm+gvOXJynbtc/XIjtRkte/DXb3l+MLDl1qYVkzUzSEwSqGKNbIEhWXrSKVPD
 c0vTxOpmg+hBxdg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

All callers of xilinx_dma_poll_timeout() pass a zero delay and a 1
second timeout (XILINX_DMA_LOOP_COUNT). With a zero delay,
readl_poll_timeout_atomic() does not measure wall clock time, and the
actual timeout can be much more than 1 second.

This is very visible when a channel reset never completes, e.g. with a
VDMA whose stream-side clock isn't running. Probe appears to hang, and
only minutes later fails with:

  xilinx-vdma a0050000.dma: reset timeout, cr 4, sr 0
  xilinx-vdma a0050000.dma: Reset channel failed

Switch to readl_poll_timeout(), which checks the deadline against
ktime_get().

Calling xilinx_dma_poll_timeout() from atomic context is still safe even
after this change, as readl_poll_timeout() with zero delay never sleeps.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/dma/xilinx/xilinx_dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index 404235c17353..6e8c786147f7 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -530,7 +530,7 @@ struct xilinx_dma_device {
 #define to_dma_tx_descriptor(tx) \
 	container_of(tx, struct xilinx_dma_tx_descriptor, async_tx)
 #define xilinx_dma_poll_timeout(chan, reg, val, cond, delay_us, timeout_us) \
-	readl_poll_timeout_atomic(chan->xdev->regs + chan->ctrl_offset + reg, \
+	readl_poll_timeout(chan->xdev->regs + chan->ctrl_offset + reg, \
 				  val, cond, delay_us, timeout_us)
 
 /* IO accessors */

---
base-commit: f5098b6bae761e346ebcd9da7f95622c04733cff
change-id: 20260803-xilinx-dma-poll-fix-15ab556a7f58

Best regards,
--  
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

