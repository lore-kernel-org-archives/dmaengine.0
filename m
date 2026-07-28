Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FC641E6B6
	for <dmaengine@vger.kernel.org>; Tue, 28 Jul 2026 14:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785247712; cv=none; b=Puwe9J9oSlKSjE6a1Kb4nHcNICOglocTnXcJ9+vFg/OATN/RW1L+tcqP0Dm19Lvqkpbw/fW8cScAW72Bw5U5ZJT0fc6vFrcUak4DJw3DJkHIXJaBRto9lHZFp2qha6R1jr68j+cjXM58OlHVqJHp182WDDaZl35fL65bNpSbYPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785247712; c=relaxed/simple;
	bh=x2+G/odJw4xHvMsf9arW1NonpHhYnLr/7o4P8OxuveA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qzx7d3wHfrGIMDL2lI2tpSWzPdv87oi7wGunZm3AKySx12QsIadQ7NfzxnYNnVOqDGtLAcXcWZFfdqtryULApvr31fuhvD2VD+KNYC3RVRmoli+50H3zSTGfEZVL3S0eBkpzEXEWK7Ec4H0kGUZdm1iU4Je00wlXTUFzAi0F9cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Ca1LMq6V; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Ca1LMq6V"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E007D1A12E2;
	Tue, 28 Jul 2026 14:08:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A4D5F601BF;
	Tue, 28 Jul 2026 14:08:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 80F1C11C141B0;
	Tue, 28 Jul 2026 16:08:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785247702; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=Jh9FzmUGpN/j0uxY6oTxZkjjR7LOKAjS5e/Hq7TJIVU=;
	b=Ca1LMq6VAo4ryoLTiBzR+az26ethIPkLJWd0ToGRolUFpp2ImaEurEdvL9kH+hww6USt8q
	uJL15QpJ+EEoq9d/uzRwWrCh36VNb+kfk01vDRwGsw7e5/UW3wDWIqKhox//OvuztJL8y6
	1pRVY6bUGBVwIqdt7ucIdHuFhntAQhFltDz5W8CTh15U+qT/dS6tmpDGpjEnwgJBXHWnLR
	MrBZM24cjOKDozziLRHan4mRCfDeLS3Dq7KpkiRxbCnto7jBO/Lb2Yb+6Go4Jxg4GFTRqo
	WtJ87LYQTSdVm4UNAMlmebkFzlp3frZEzvDIylwnfy48xrSVa6f+r+c1SUiVXw==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Subject: [PATCH v7 0/2] dmaengine: fsl-edma: Scatter/gather improvements
Date: Tue, 28 Jul 2026 16:08:11 +0200
Message-Id: <20260728-fsl-edma-dyn-sg-v7-0-10dffb4167c2@bootlin.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMu3aGoC/23QTU7DMBAF4KtUXmPk8b9ZcQ/EIrYnrVEbozhEV
 FXujlOQGuQsn/Tmm9HcSMExYSEvhxsZcU4l5aEG83Qg4dQNR6Qp1kw445pJbmlfzhTjpaPxOtB
 ypE4zIwCFiR0ndepzxD5938W3999cvvwHhmll1sYplSmP1/vKGdbeny5Yo89AGZXIMHjksdf61
 ec8ndPwHPKFrP7MH4JiuhV4FbSWwoUYJUhsBbERAFpBVMHZDiwYo2K3I8it0P5ollWwAU10ykN
 A1wrqIRjGW0FVAbSxBqzyKHcEvRFg55N6vUGAd9qj6AX8F5Zl+QG1uSuvDAIAAA==
X-Change-ID: 20260428-fsl-edma-dyn-sg-960731e37da2
To: Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Frank Li <Frank.Li@kernel.org>, imx@lists.linux.dev, 
 dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3

This series adds support for scatter/gather DMA transfers via dma_vec
and dynamic descriptor chaining to the Freescale eDMA controller driver.

The first patch implements the .device_prep_peripheral_dma_vec() callback,
enabling the DMA engine to accept an array of dma_vec structures. This
callback supports both regular and cyclic transfer modes.

The second patch introduces dynamic scatter/gather chaining, which allows
multiple DMA descriptors to be linked together without stopping the channel.
This optimization eliminates idle periods when back-to-back transfers are
submitted, improving throughput and reducing latency. The implementation
carefully preserves cyclic transfer semantics and respects hardware
constraints on platforms with split register layouts.

I tested it on the i.MX93. The dynamic scatter/gather chaining should
work with other eDMA controller with split register layout.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
Changes in v7:
- In fsl_edma_prep_peripheral_dma_vec(), make sure that CITER/BITER
  values fit in their registers.
- Add the identifier to all TCD of a linked transaction so that we can
  always identify it when handling the end-of-transfer interrupt.
- Handle missed/coalesced end-of-transfer interrupt even when the transfer
  is completed.
- Link to v6: https://patch.msgid.link/20260710-fsl-edma-dyn-sg-v6-0-831b96be3f31@bootlin.com

Changes in v6:
- Link DMA transactions in fsl_edma_issue_pending() when they are issued,
  not when submitted.
- Add an identifier to linked transactions to handle missed/coalesced
  end-of-transfer interrupt.
- Link to v5: https://patch.msgid.link/20260702-fsl-edma-dyn-sg-v5-0-16787185be49@bootlin.com

Changes in v5:
- Rebased on v7.2-rc1.
- Add a call to dma_wmb() to ensure that dlast_sga is updated
  before csr when linking scatter/gather transactions.
- Don't update TCD registers if updating csr requires clearing the
  channel DONE bit to avoid a status mismatch in fsl_edma_tx_chan_handler().
- Link to v4: https://patch.msgid.link/20260518-fsl-edma-dyn-sg-v4-0-8ce7d95b1ce9@bootlin.com

Changes in v4:
- To keep transactions in order, link DMA transaction to the end of
  submitted list first, only lookup the issued list is the submitted
  list is empty.
- Link to v3: https://patch.msgid.link/20260511-fsl-edma-dyn-sg-v3-0-98a181775dae@bootlin.com

Changes in v3:
- Fix formatting errors reported by Frank Li.
- Add fsl_edma_tx_submit() to link the DMA transactions
  when they are submitted, not when they are prepared.
- Link to v2: https://patch.msgid.link/20260506-fsl-edma-dyn-sg-v2-0-66439cdd414e@bootlin.com

Changes in v2:
- Drop the RFC prefix, as asked by Frank Li
- No code change
- Link to v1: https://patch.msgid.link/20260430-fsl-edma-dyn-sg-v1-0-4e0ecbe2df66@bootlin.com

To: Frank Li <Frank.Li@nxp.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Frank Li <Frank.Li@kernel.org>
Cc: imx@lists.linux.dev
Cc: dmaengine@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Benoît Monin (2):
      dmaengine: fsl-edma: Implement device_prep_peripheral_dma_vec
      dmaengine: fsl-edma: Support dynamic scatter/gather chaining

 drivers/dma/fsl-edma-common.c | 227 ++++++++++++++++++++++++++++++++++++++++--
 drivers/dma/fsl-edma-common.h |   7 ++
 drivers/dma/fsl-edma-main.c   |   2 +
 drivers/dma/fsl-edma-trace.h  |   5 +
 4 files changed, 234 insertions(+), 7 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260428-fsl-edma-dyn-sg-960731e37da2

Best regards,
--  
Benoît Monin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

