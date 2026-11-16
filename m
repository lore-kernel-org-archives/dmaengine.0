Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794800607;
	b=vhzzp+NFIozkbqKdeRGgyq7YVnDRQL//RFQn2v72T7W1Sa4ys7riA+ZLXJr5svOLl8fL
	 84YK123N+D2Y6SchPDFb4/Ph7xvQ9rQH3+QUr4s74mH4ibpbbL0uwqgo1p+AttLwPW0Pe
	 VxYkNoICoiq0EFytUKH8LbEsKl2kFt3wuGKWSH/KYJYmp+hXd7cpYI2LMOCfHOTD0iePK
	 /PknbXGSaBoNf4anbG4rwrw3n4dfp73a7SUTZKt7+e89w7vxwWyxvIFjAFb+76D90bq0/
	 M+OO3i10bQ28AEpnocMm9/6d5u/xq7Q6n1VTvA0q70+PanakjReuD2c7ePcRc5l4Bag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794800607;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=eHfiIPPPyeG7mm6lxIdPhmX/nwJCmqyxv51o3cPcj0Q=;
	b=ELdOFAXAvk9CWsGL5SOT6ZBCfS8FbVfCph04nMMvsSlMMl4PQLJz+EOzhNXOdb6L+TnE
	 XhlYEUYUh24pWd6FAxz3NYG/fQ6/tcS9C1e4PEZHntNBzEVExfhGsdGMSNcgXKC99602E
	 LPPmT2OXohqchDASf9bF0lcYy2XLaw7oxVoPpbU8Y5yD5zgiWkwgV7/t/0k5GYAJaEUaK
	 sOkMU20FnHomS4yhtqB1RrA/ZqgcROwmU25onUEmy0jgbS1EAHSjJZUR1d5A3TFxAacbI
	 wzXAIwR8dYfQvOeyq+omJSkD/dF+2TjGp7tqsVUGSbyKNBHBWsvi5biJQjv/jDS/GBA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oXNMYjGM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95EE5606A31F;
	Mon, 16 Nov 2026 03:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oXNMYjGM
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794800607;
	b=iq8mfRWlMrpFViKYlGFGjCpXbZOP63wRqXGIYE+ciFQoTGieNZmzpfiaqKX1K+/UtiYB
	 LSN7ZGCQmNOpPv3CiV54Q52vuoH15nPZZh5+ZHycXm2Ej1zgM1EIjNFpgjq+4Kt40D1aR
	 CG+CfUAlOn0qpjtpX2ccROdiT9K4a8jp71ppy0oL7nLxvxvSzyQMxcdxfZaT8zjy9MD2r
	 PrhXASWITt+v8BhCnk6Hudjcg8tCp6BAz6swM/G7RboStsxXStjYcWKLWuHR3h0GxK1GT
	 Zh/enDgLOBQw740mrzoECv/ln3yvrPRz/0RqsgrJXIYLrRgBELJsZdhrVRIcG/IPjQQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794800607;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=eHfiIPPPyeG7mm6lxIdPhmX/nwJCmqyxv51o3cPcj0Q=;
	b=c7BRWWHojW7YaB01Sp59HgEgPwYDNCZFactInl+Yy79Rw16dOJ0N+V52F23hQnGuuzRZ
	 725Hg959T8JuoygC59ce9tTKMQVbuLZs1Q5fDbjiquDJKfPGx5n8c5ItN9tYcEV3x7oPW
	 w6kMicUyISf2vs7t8T2IQ368PKuipGfdBntZ26xet1U/7q5MJnTO5F0XeQXn6zQkijdIe
	 5gWW8l9W2QuhAP+XkyUqfNyeSPp9lSfnVgRF94WLHWsDp9nhQ+8RrmcVcc8Vs4zw42FVg
	 BG76NF6k0w17Mjt9mbhADolJjmPRM8y8dBtomRBqUTbLiIFq2Cqx6am1qgTvCc40Wgg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E70E81F000C7;
	Mon, 16 Nov 2026 03:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794800607;
	bh=eHfiIPPPyeG7mm6lxIdPhmX/nwJCmqyxv51o3cPcj0Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=oXNMYjGMdHw2JtieZhhQgQ3KWBiTdRHjqhk4ZFWOzsIuBbplyGr8AYOBHufbm5SWY
	 C9dd6k5S2Vm4zmNkT0pO1ePaXzVvwwOaZCzAz6gBrf60DRMPG/r4QBY8pJ2bGoK4bY
	 QoH478LNndG+EOQfmLmhkb4ORazwnWiE+8fnnUtRObiL0WFZtV5b5VRepV4dzYMmWQ
	 nNKZdERRdnOuWxbdLRiwIFNaN7al0fHzR83vnOjeKzh5+J74TzHr8LmiFxjM5+YvB7
	 cmieEmpIhoDlnDdn3TGU6XRLm5D6gmhPDchuvdZTViCKRKvVfvmO9x3x0iT67ldYgq
	 4zd9Z/AeUHqKA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 73FA84A2FB;
	Mon, 16 Nov 2026 03:43:26 +0000 (UTC)
From: "Jeff C. Jensen via B4 Relay" <devnull+kernel.nullptr.com@kernel.org>
Date: Sun, 15 Nov 2026 19:43:05 -0800
Subject: [PATCH v2 2/3] dmaengine: xilinx_dma: Fix cyclic period count
 truncation
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
Message-Id: <20261115-xilinx-dma-work-v2-2-681ed00c15a1@nullptr.com>
References: <20261115-xilinx-dma-work-v2-0-681ed00c15a1@nullptr.com>
In-Reply-To: <20261115-xilinx-dma-work-v2-0-681ed00c15a1@nullptr.com>
To: Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org
Cc: Frank Li <Frank.Li@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 Suraj Gupta <suraj.gupta2@amd.com>, 
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, 
 Alex Bereza <alex@bereza.email>, 
 Folker Schwesinger <dev@folker-schwesinger.de>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 "Jeff C. Jensen" <kernel@nullptr.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1861; i=kernel@nullptr.com;
 s=openpgp-2026; h=from:subject:message-id;
 bh=YUWNqOn/+Zb1scbFCp7ICqUXI0F0lLN8QDUGg53bhVo=;
 b=owGbwMvMwCV2439B4wpuQQ7G02pJDFm/qu+uvPpBVkHu+WbX4IaZqbyrbzYI/c0y3Wkv92Cax
 hudZR8+dpSyMIhxMciKKbIcPzZtZ76tf11R9f0qmDmsTCBDGLg4BWAirfcYGQ63mp6z7lC443r1
 fMTf+i/3Ko8cllddclx0bs9WnS9HDzAzMhxc+/ePzrqTOc7zKqs/9qtb1kSr6fZcfLG82Ec7av7
 sx0wA
X-Developer-Key: i=kernel@nullptr.com; a=openpgp;
 fpr=C7C696B96F3D4F7E727BDF7AD8FF7081A80B1108
X-Endpoint-Received: by B4 Relay for kernel@nullptr.com/openpgp-2026 with
 auth_id=1265
X-Original-From: "Jeff C. Jensen" <kernel@nullptr.com>
Reply-To: kernel@nullptr.com
Content-Transfer-Encoding: 7bit

From: "Jeff C. Jensen" <kernel@nullptr.com>

xilinx_dma_prep_dma_cyclic() stores buf_len / period_len, a size_t
quotient, in an unsigned int. On 64-bit builds the count can be
truncated: a buffer of 2^32 + 1 bytes split into 1-byte periods becomes
a single period, and the transfer covers one byte of the buffer the
client asked for.

Compute the quotient as a size_t and reject it if it exceeds
XILINX_DMA_NUM_DESCS before narrowing it. Each period needs at least one
hardware descriptor, so a larger count could never be prepared from the
pool anyway.

Fixes: 92d794dfb699 ("dmaengine: vdma: Add support for cyclic dma mode")
Reviewed-by: Suraj Gupta <suraj.gupta2@amd.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Jeff C. Jensen <kernel@nullptr.com>
---
 drivers/dma/xilinx/xilinx_dma.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index 6f00ab41b143..ba4fa1aafc50 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -2511,7 +2511,7 @@ static struct dma_async_tx_descriptor *xilinx_dma_prep_dma_cyclic(
 	struct xilinx_dma_chan *chan = to_xilinx_chan(dchan);
 	struct xilinx_dma_tx_descriptor *desc;
 	struct xilinx_axidma_tx_segment *segment, *head_segment, *prev = NULL;
-	size_t copy, sg_used;
+	size_t copy, sg_used, periods;
 	unsigned int num_periods;
 	int i;
 	u32 reg;
@@ -2519,10 +2519,11 @@ static struct dma_async_tx_descriptor *xilinx_dma_prep_dma_cyclic(
 	if (!period_len)
 		return NULL;
 
-	num_periods = buf_len / period_len;
-
-	if (!num_periods)
+	/* a period takes at least one descriptor */
+	periods = buf_len / period_len;
+	if (!periods || periods > XILINX_DMA_NUM_DESCS)
 		return NULL;
+	num_periods = periods;
 
 	if (!is_slave_direction(direction))
 		return NULL;

-- 
2.43.0


