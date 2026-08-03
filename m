Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8BB342C9E;
	Mon,  3 Aug 2026 16:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785772930; cv=none; b=X1T/D3pBN0uGpER/SgeUmJTslf2oNd8GCBfUl7QV3qnjBmMNquxSKjD33dVatsVvuS/Vr535vsiTdZBmtLkGx33pf6k6w0CtxunBEW76HxZZOpZ2nyr0jiHUcRwlYhHB8v3QL65twQqUuPkDPxtS1PVSVgH8OAuph84/MKua5JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785772930; c=relaxed/simple;
	bh=+g+S3z+R85NA2OgDud7z7Tewl32hJbS/FZavoTeM4JA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gx7xAmvnXoyS9vOM4Jy/X14gD4x8ZfrgpB2vjjrKQzGj6j3XFTTYw9xHGDUxgN19/YzlDScmCU0t7JBdZ2uEpLamWuSNCYmsp47PXA1XGAUi+O4W+F0aCFa02c148BXLrWbXeKd9JDeEYKfW7r976A968d/WfSsF3a6LJKj1DVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=qv4iiAFE; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="qv4iiAFE"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 831E34E410B9;
	Mon,  3 Aug 2026 16:02:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4FC7D6029B;
	Mon,  3 Aug 2026 16:02:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 75DE711C30D48;
	Mon,  3 Aug 2026 18:02:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785772925; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=BNY/5TDYlBCYsVNRRmsCX0iAWr61b4r/o3mcDpI2qBk=;
	b=qv4iiAFEUxTCbj+SSNaNi4jSbsJIY+0ZzB/9pDoD+IMIzoElHbHhm2oMUhYLyBWOqVX6lJ
	6FZKqqniA/jL66r9og/vBeOlCOVPfiQQVHGCf3w1w59Tj6252bAYq+0U60uK6Yxi/VfC8v
	WN7BxoMWlVMyctVF04UCjZ3oZdDdmXJZ+PZG3W0tfqNW6bPvURyUGcpOrVZpq6IamJ2PSK
	Mu1/3vLSuDcQM+qcYDXv9eB+swSDqcQShrHqPGF3gX3Rt4DTA6m76ncmrvuglJGt6v5lj5
	wcL/LkXMQBNqtvC97P/nejKahb2gK3OpEFvLPwL5CvWBcSWdQbD3QXbYoryghw==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Subject: [PATCH v8 0/2] dmaengine: fsl-edma: Scatter/gather improvements
Date: Mon, 03 Aug 2026 18:01:59 +0200
Message-Id: <20260803-fsl-edma-dyn-sg-v8-0-dc2b0317206d@bootlin.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHe7cGoC/23RTW7DIBAF4KtErEvFAOanq96j6sLAkFAldmVcq
 1HkuxfSSnGFl08aPp5mbiTjlDCTl8ONTLiknMahBPN0IP7UD0ekKZRMOOOKSW5ozGeK4dLTcB1
 oPlKrmBaAQoeek/Lqc8KYvu/i2/tvzl/uA/1cmTpxSnkep+v9ywXq3J8uWKMvQBmVyNA75CEq9
 erGcT6n4dmPF1L9hT+EjqlW4EVQSgrrQ5AgsRXERgBoBVEEa3owoHUX+h1BboV2R4ssgvGog+0
 ceLSt0D0EzXgrdEUApY0G0zmUO4LaCLCzSVU7CHBWORRRQCvojbBz6UXXDizE6GSp4vl/YV3XH
 5N+VRZOAgAA
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
Changes in v8:
- Enforce that major channel linking in not used when linking a descriptor
  in fsl_edma_link_sg() by checking all TCD, not just the first one.
- Don't compare the descriptor link_sg_id with the CSR LINKCH field
  if major channel linking is enabled, to avoid completing unfinished
  descriptors in fsl_edma_tx_chan_handler().
- Handle the completion of the last transaction of a linked SG chain if
  the previous interrupt was missed by checking for the channel completion.
- Add comments to clarify the assumptions I made.
- Link to v7: https://patch.msgid.link/20260728-fsl-edma-dyn-sg-v7-0-10dffb4167c2@bootlin.com

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

 drivers/dma/fsl-edma-common.c | 241 ++++++++++++++++++++++++++++++++++++++++--
 drivers/dma/fsl-edma-common.h |   7 ++
 drivers/dma/fsl-edma-main.c   |   2 +
 drivers/dma/fsl-edma-trace.h  |   5 +
 4 files changed, 248 insertions(+), 7 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260428-fsl-edma-dyn-sg-960731e37da2

Best regards,
--  
Benoît Monin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

