Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F00484227
	for <dmaengine@vger.kernel.org>; Fri, 11 Sep 2026 13:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789132316; cv=none; b=XJdonNMLRrjWFT91U8+CDB5n08BS3HZ1eeYIt7fg1S9NepWrBuUKVPGAqCTploHkVbYfOZgZnnuMyzt5LN3vdRPLx7l26fgI39mEGtTC4E5/qWHDEKssV0amrWD3ttvXItXIKgynETkTzgdMVDzRIRf1GFmwDVpBiAp9Ll3ATrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789132316; c=relaxed/simple;
	bh=/JurTHwn2B43+frPHF5U/11p25b0aEztmatHqJ6KDDA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DGua7puua6MBnSAY3+MEnjPIFEKbVhmEqTTi42OyPTWd39zQqWdoQdcApMwZT/2x+Tr0ekhBEftPZln/QAGdQARtFVNe/pTik3nhA9qMSHOKsfElNq/agAwHMbGt9nEDPjwNke4jiNxNcIAGIU7544TUgMfMQnzPOOscNpB4R8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=N90MhQFM; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="N90MhQFM"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id F230CC653FE;
	Fri, 11 Sep 2026 13:12:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2CFFC601DE;
	Fri, 11 Sep 2026 13:11:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A741A11C7AFA8;
	Fri, 11 Sep 2026 15:11:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789132306; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=K2veW4tdfSPkWWlOWauDWcU2EEO/NWAUWYakYOcJC7s=;
	b=N90MhQFMo+zHubFJ1ZPjluN4nKaMWxvx+Td+wWJc3NefQyCKv8CLEUQTX/RyTDIJeBtER5
	5Cszk1rsRDk/bpO+kISEY9S/8LM7eTjtZH+IG2uiZkeyzx19QIYFZl9MSeRol9Qd53qAYG
	FwR+oYUr47joXKQL3IPddMF3G54X7i776lLbe8NjaunFxFGwHr0G1iirolN/Ceaxpt8s9n
	I+dCWEofCQGMyQHMEiPZOM/wNCvxf7wONE+EL+6vedk/i0X0BtqH5wrFHndCvbg1RpQIKm
	9Gf8BQ39fgy5slL/XTqeE+8kBZHMxkXwfaHTmvQxR33Vdd7Hp1NQbBkhvI51IQ==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Subject: [PATCH v10 0/2] dmaengine: fsl-edma: Scatter/gather improvements
Date: Fri, 11 Sep 2026 15:11:35 +0200
Message-Id: <20260911-fsl-edma-dyn-sg-v10-0-700eb72def57@bootlin.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAf+o2oC/23RzW7DIAwH8FepOI/JBsLHTnuPaYcAps3UJlOSR
 auqvvugm5RM5Ghk//jLvrGJxo4m9nK4sZGWbuqGPhcITwcWTm1/JN7F/MAECA1KWJ6mM6d4aXm
 89nw6cqfBSCRpYitYnvocKXXfD/Lt/beevvwHhbkwpePUTfMwXh9/Llj6/nQJlb4gB64IKHgSM
 Wn96odhPnf9cxgurPiLWIUGdC2ILGitpAsxKlRUC3IjINaCzIKzLVo0pontjqC2Qr2jRWXBBjL
 RNR4DuVpoVsGAqIUmC6iNNWgbT2pH0BsBdzapSwaJ3mlPMkmsBbMRdi69mJIBYkpe5ShB1IJdB
 QuyFmwWYhAeJBoBOtaCWwUHrhZcuSZ4Lygvg2z6L9zv9x9hPSAG0wIAAA==
X-Change-ID: 20260428-fsl-edma-dyn-sg-960731e37da2
To: Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Frank Li <Frank.Li@kernel.org>, imx@lists.linux.dev, 
 dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.16.0
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
Changes in v10:
- Don't move backslash in fsl-edma-common.h to minimize diff, no
  functional changes.
- Link to v9: https://patch.msgid.link/20260909-fsl-edma-dyn-sg-v9-0-60bb2e678e8f@bootlin.com

Changes in v9:
- Rebased and retested on v7.3-rc1.
- Drop the check on CSR E_LINK flag as it is never set in the driver.
- Add FSL_EDMA_DRV_CSR_LINKCH flag for eDMA3 and eDMA4 to indicate which
  controllers can link SG descriptors.
- Count and limit the number of linked SG descriptors once per
  issue_pending() call, instead of O(n^2).
- Link to v8:
https://patch.msgid.link/20260803-fsl-edma-dyn-sg-v8-0-dc2b0317206d@bootlin.com

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

 drivers/dma/fsl-edma-common.c | 254 +++++++++++++++++++++++++++++++++++++++++-
 drivers/dma/fsl-edma-common.h |  15 ++-
 drivers/dma/fsl-edma-main.c   |   2 +
 drivers/dma/fsl-edma-trace.h  |   5 +
 4 files changed, 268 insertions(+), 8 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260428-fsl-edma-dyn-sg-960731e37da2

Best regards,
--  
Benoît Monin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

