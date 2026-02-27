Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6092D45038
	for <dmaengine@vger.kernel.org>; Fri, 27 Feb 2026 02:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772159355; cv=none; b=Oci5ToQHfFOTMz8CYDB8CS7UNabeqw3RAHzu46QQRRfpwpbi4BUhEVnoHc/+buK8GayeiegyW7gziB0uhlsFaK2kGG6j01pW1EjL/zoWIcBW677Lf/st6tnNw6tCMwQ6fPqtve0x1qF5RzlgwBVaSQvfww2P3pnxdpeBRBEkBdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772159355; c=relaxed/simple;
	bh=8TdoH2MKRVtRvlZ5GAxVX3aaw+GpMrF7v0/hsi1WOZo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L8KMn95g2BLQ8aC1ea8ZgsLnoVm/8dawafBhU1z1akBn4qd2v2azSKf8ysAmpO9ti9dDAJs6KPCof/s4fyUTgHVf/BLli0mKhzG76UPZV8SSqdxqBdwu3fgY53LkE0WVY/2bYucf5yCC6Is4H7peeMs/RDy/a0yytLtramwCpYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=szmaagvf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="szmaagvf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2BA5C116C6;
	Fri, 27 Feb 2026 02:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772159354;
	bh=8TdoH2MKRVtRvlZ5GAxVX3aaw+GpMrF7v0/hsi1WOZo=;
	h=From:To:Cc:Subject:Date:From;
	b=szmaagvf3EaIh1UX3R/axs4NhkqxXPSl+u6ticCtJ71Vt9w5QauKkhixvNosrjs73
	 y71kpuMA0CY8MW2hrq99yvgvrTYkKnEqfHLyCz+Ak0sz9bLUMlp9KY9bjqhziPsEeI
	 dtBTwCtKFSF53zF1+WxcB02I0loTRXLnqWzkDF5nxQ+K+DASN/TpoxwzMJSUp4HiHd
	 pAVGR55uBeqwTkRwB1wNHcg664V7FIIFKNB4bY6gEM1rE8t1ot67R/CIpKB078fPUi
	 zP1qa+X33c6mjwG6Yk69W4aN/IQ5ANEBVh+u5pMMh45I7dyd8i+V6kLc44azvBg6ej
	 F3rRqEJecS9fA==
From: Vinod Koul <vkoul@kernel.org>
To: dmaengine@vger.kernel.org
Cc: Frank Li <Frank.Li@kernel.org>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH] dmaengine: xilinx: Update kernel-doc comments
Date: Fri, 27 Feb 2026 07:59:05 +0530
Message-ID: <20260227022905.233721-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two members of struct xdma_desc_block are not descibed leading to
warnings, document them.

Warning: drivers/dma/xilinx/xdma.c:75 struct member 'last_interrupt' not described in 'xdma_chan'
Warning: drivers/dma/xilinx/xdma.c:75 struct member 'stop_requested' not described in 'xdma_chan'

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/dma/xilinx/xdma.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/dma/xilinx/xdma.c b/drivers/dma/xilinx/xdma.c
index d02a4dac2291..35a31e07f0e0 100644
--- a/drivers/dma/xilinx/xdma.c
+++ b/drivers/dma/xilinx/xdma.c
@@ -61,6 +61,8 @@ struct xdma_desc_block {
  * @dir: Transferring direction of the channel
  * @cfg: Transferring config of the channel
  * @irq: IRQ assigned to the channel
+ * @last_interrupt: task for comppleting last interrupt
+ * @stop_requested: stop request flag
  */
 struct xdma_chan {
 	struct virt_dma_chan		vchan;
-- 
2.43.0

