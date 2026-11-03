Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=204.191.154.188
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793721147;
	b=kTsXQ8jHRSM10a2zyBbnE6holhWN1/e/oCq7O7oflOStRA7jEI+FstagMt7/98ThBBzj
	 5otLYJtKtuSbtm4ejsyW2NOW9T0H+xkw1QuPdPjZ4Cm8tQDOfiHu8GEvaUSL9JzPj5zHk
	 IIrn+uNHQBvssngdUS8kvbu6T2+s+eEBpiiEoTgu/WiKBeoWxM1hanH2VJ6+omjNhSU+L
	 WmnPtfgthxc4FSbDIbAi7g8J0plVvvjixAgY6JzTsE/vV/sq5JbRxuI8VusNd12nKH1sQ
	 xgva7hjyGfs+NQQlHHkA3DIOPCnWuN1/dZ5dl/gl0/Vvs9qi/aN6/+7u8sKKBJy3XVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793721147;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-SA-Exim-Connect-IP:X-SA-Exim-Rcpt-To:X-SA-Exim-Mail-From:
	 X-Spam-Checker-Version:X-Spam-Level:X-Spam-Status:Subject:
	 X-SA-Exim-Version:X-SA-Exim-Scanned;
	bh=zDpIwbl3ExpcBd/Ut28+eWWZUS4vYlZqd1RsBE/JTyA=;
	b=f2cgmXiTdWaVTnmHXIWKoJ9K7O607ZYAtY5rw8XLRjdJsGE1nnD3m2PevjqFFr2clm+Y
	 duCncXmHmjxGiBKDhBTLswmdAhdVAcuPQ8HHLqIjMmF3SorlDBFJrZ5RhZwxB2Xrp5VBK
	 izdAUPmcZiTQcUcau0RG0mlZr3AHoI7T4gEbXSm+x6pLg6+hS39H4ZzXD/y2THBZxyyWL
	 CNJAqOEyDJKKUc2w4atygnfv388xJdWbiIwzDfGrWfwW3DibVTle9/XiJg3PY76nX3KCv
	 aZBIZWVmENpNRm3yvVr/3pyf6VAyCoMyZc1MA7FyP6QLkBCnl8RWCVoXGGWtJmIR0Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deltatee.com;
	spf=pass smtp.mailfrom=deltatee.com;
	dkim=pass header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b="lC+/BlKQ";
	arc=none smtp.remote-ip=204.191.154.188
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4832606A329;
	Tue,  3 Nov 2026 15:52:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4832606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deltatee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=lC+/BlKQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:MIME-Version:Message-ID:Date:Cc:To:From
	:references:content-disposition:in-reply-to;
	bh=zDpIwbl3ExpcBd/Ut28+eWWZUS4vYlZqd1RsBE/JTyA=; b=lC+/BlKQPxKtF3kIeO8T0/LrKK
	5/v4tJQXH8NP0kjAJj561wf6ocXlphS7pHpduQtqGh9KEyRlINfhramirEUdRmDGv9ttfMo8eV4pB
	egf11S/MjNkVr+he1Ed9DN001VVdmXfs+vSzeHLjZtdMQcSCKiuMaAd9yOw2i6T0f4m2XE9h/x0W1
	DW6b3zA7ln7Aq7d7zRSCEJcaAxe5GzaSGLc5oLbZTsNCYqXGvIrwk489/bb9bgYSYTfGYsXVkeYgf
	3IXcNiiDS7EbNtQB9qqTOQCqPNnIVSp1DkcQrZwkEmf2/v6zDibcBmnUF+4q2Oir1G/gSNmUgNnN1
	mcPgdrCQ==;
Received: from donard.priv.deltatee.com ([172.16.1.31])
	by ale.deltatee.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1xOGoC-000000091Qi-3Ot3;
	Tue, 03 Nov 2026 09:52:25 -0600
Received: from logang by donard.priv.deltatee.com with local (Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1xOGns-00000001w7Z-05IW;
	Tue, 03 Nov 2026 09:52:04 -0600
From: Logan Gunthorpe <logang@deltatee.com>
To: dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.li@nxp.com>,
	Logan Gunthorpe <logang@deltatee.com>
Date: Tue,  3 Nov 2026 09:51:55 -0600
Message-ID: <20261103155202.461725-1-logang@deltatee.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, vkoul@kernel.org, Frank.li@nxp.com, logang@deltatee.com
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Level: 
Subject: [PATCH 0/6] plx_dma fixes
X-SA-Exim-Version: 4.2.1 (built Sun, 23 Feb 2025 07:57:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)

I got out my old PLX hardware to cleanup the issues that Sashiko reported
after I submitted another fix earlier this year. While testing, I also hit
a sleeping BUG that trigger when unbinding the driver which is fixed
in the first patch.

I think every patch is easily understood and independent.

This series is based off of v7.4rc1.

Thanks,

Logan

Logan Gunthorpe (6):
  dmaengine: plx_dma: don't call pci_irq_vector() under rcu_read_lock()
  dmaengine: plx_dma: fix descriptor ring leak in alloc_chan_resources()
  dmaengine: plx_dma: use writel() for the 32-bit PLX_REG_CTRL register
  dmaengine: plx_dma: add dma_rmb() after observing write-back status
  dmaengine: plx_dma: use spin_lock_bh() in plx_dma_process_desc()
  dmaengine: plx_dma: don't invoke client callbacks with ring_lock held

 drivers/dma/plx_dma.c | 64 +++++++++++++++++++++++++++++--------------
 1 file changed, 43 insertions(+), 21 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.47.3

