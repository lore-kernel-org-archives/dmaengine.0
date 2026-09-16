Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3E03C1966
	for <dmaengine@vger.kernel.org>; Wed, 16 Sep 2026 08:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789547071; cv=none; b=dvRDiQeXexHVfE0u7LPeWWvjx3fbsNbYMw01I+U7RBq1dhxY7f4YXyF2whcs8gOp1Fs8nd0sKmPt19SdAwqHElF5B6G3RrSaPPw5OFzg+9NrVdwnwi/wMQeD0Etz2RebYKTHPHtVhG2jwz9b9WMCpXFm1s3Y4Hpf+XoUBQyZUko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789547071; c=relaxed/simple;
	bh=g8uBSMPifiQxnfvJtoapPRLsvdZMMJIbdJSyrdf1uf8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Sa+kuWN2aHXcqoAMpvN1wEHImXEXGJTM8vEeyiMmSpug8FEfrjBrI07hKFZ1bHQdTu2P/C0y19xRDLA8FrjQREya9cHvLuFgUVRCHWhRNoQjH7E1nJNOC8XyfXFnkvVYos7z8uvaVl2Seyf93e6osr1XYou09NaTZ5jiGnjLHjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=rsyge08l; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="rsyge08l"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 37982C5CD57;
	Wed, 16 Sep 2026 08:25:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4FA4A60337;
	Wed, 16 Sep 2026 08:24:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2F28211C7B017;
	Wed, 16 Sep 2026 10:24:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789547061; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=SVAN+3IUpX5RA1dOezK1YWO9DvSgx4s6NbQW+cUqHz8=;
	b=rsyge08lMMwcBYBTuyd1oWuldElUhrw14qjiqv7b5OSkul4t9OnhTAQzLDGuMbABpEZrPJ
	7dVJqWRmYGUixZUstGve2oewYzw/uHg3izpUjazmff9+I5dn+lEl13UgsHXudHeICrRM0g
	kHMtoUYsW3oJOb8cEAnvnaYYroEVNk0Gw/C0dBygzMq41A+g8b64OoJ6m9ToYvy2IDN89v
	kBFrcdeF+4fPIlPawFfWLQwMZDHmuoQZr9U9Os3YkdCX4/KvVwJYUtTyiODbRvOuc52OWk
	adP78IoaGLN6C6142kXv7jo1AhUfMtfLIlH4NB9QAL6Bo1z3DwIAdFiDiRa/Kw==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Subject: [PATCH v11 0/2] dmaengine: fsl-edma: Scatter/gather improvements
Date: Wed, 16 Sep 2026 10:24:10 +0200
Message-Id: <20260916-fsl-edma-dyn-sg-v11-0-02792de71b92@bootlin.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIACpSqmoC/23RzW7DIAwH8FepOI/JBsLHTnuPaYcAps3UJlOSR
 auqvvugm5RM5Ghk/7D+vrGJxo4m9nK4sZGWbuqGPheITwcWTm1/JN7F/MAECA1KWJ6mM6d4aXm
 89nw6cqfBSCRpYitYnvocKXXfD/Lt/beevvwHhbkwpePUTfMwXh9/Llj6/nQJlb4gB64IKHgSM
 Wn96odhPnf9cxgurPiLWIUGdC2ILGitpAsxKlRUC3IjINaCzIKzLVo0pontjqC2Qp3RorJgA5n
 oGo+BXC00q2BA1EKTBdTGGrSNJ7Uj6I2AO0nqsoNE77QnmSTWgtkIO5deTNkBYkpe5VWCqAW7C
 hZkLdgsxCA8SDQCdKwFtwoOXC24ck3wXlAOg2yqBYQNsXfOHA5wA0DeiEipMf+N+/3+A44wyJM
 XAwAA
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
Changes in v11:
- Add missing bitfield header (Thanks Vinod for the review)
- Link to v10: https://patch.msgid.link/20260911-fsl-edma-dyn-sg-v10-0-700eb72def57@bootlin.com

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

 drivers/dma/fsl-edma-common.c | 255 +++++++++++++++++++++++++++++++++++++++++-
 drivers/dma/fsl-edma-common.h |  15 ++-
 drivers/dma/fsl-edma-main.c   |   2 +
 drivers/dma/fsl-edma-trace.h  |   5 +
 4 files changed, 269 insertions(+), 8 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260428-fsl-edma-dyn-sg-960731e37da2

Best regards,
--  
Benoît Monin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

