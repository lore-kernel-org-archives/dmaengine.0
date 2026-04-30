Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5B63ACA7E
	for <dmaengine@vger.kernel.org>; Thu, 30 Apr 2026 09:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777542591; cv=none; b=RobgQPW91O1XcnUC0STt1nxjwCx0+cmqtvkiUTjNj4ptzh2hqbHB1FkdlseGBLaR5uzBzRXOoOsy+9ZkEvJg+3Jdl5yPnP73sSFQXv7UQKAa4JMiApk9kILYRDCG19QTVbTkbxY6ni/GSzrR9QfOvwlY1dI6oNVrECzK8TRFZrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777542591; c=relaxed/simple;
	bh=a0dhxN5cfkc0NB88URs2LR/24fGy77fKRmKXsOfOuWU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TN37ZPpI6n/ambkh8ci7k4Iiy7UNfRW1XxHYDxTLcl4+uzkOEXaZd8RhRY8wuNJ7cNR4OmWpne7nxzbt4zAUFKS9wR2eQfeuDrrroL3dJehFKPAq+r59Ir/xF2Ygws5+b9Hy+lH/pT7Bcus69/ST99RGwXehZpTOovfi6aQr8Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=sGlQr6Xn; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="sGlQr6Xn"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BC94E1A348C;
	Thu, 30 Apr 2026 09:49:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 915B460495;
	Thu, 30 Apr 2026 09:49:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BFE7F1072B8B2;
	Thu, 30 Apr 2026 11:49:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777542581; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=9LF0fKRjrJRDsIu0dM6XuR1BpD8QYSV/p2523gg017E=;
	b=sGlQr6Xn5Fu+Qd1yBGPuQOCetBsBs+VDvVNaxxmXnIBX6ABALqJRO2iGG1HXDys21u9RBE
	4si0TcUcCP06dB+kDmhcpMOBBLIesx7Thj8ijB6xizTPoFaFQhU01nkhVoYZ3CZO/YX0dM
	P5sT/KU+y+BJMz8kC7ifyKLEo3bdTXeJIbb2yezKIdOEajYZZziHjGViLDzrKzlQ7dP+bK
	XbFS1+x+SjkdwPH/0LPLhqWtUPg/lLFVicpDcZDkMz6J7VYz9Xr9oRRp75W8uXWkxiqq43
	INQxq5djni4wPeIzvDdGL/kx3F8URGr0ar+kXeBg7yxTjdf1vniEgSTdgsLXGA==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Subject: [PATCH RFC 0/2] dmaengine: fsl-edma: Scatter/gather improvements
Date: Thu, 30 Apr 2026 11:49:31 +0200
Message-Id: <20260430-fsl-edma-dyn-sg-v1-0-4e0ecbe2df66@bootlin.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKsl82kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEyML3bTiHN3UlNxE3ZTKPN3idF1LMwNzY8NUY/OURCMloK6CotS0zAq
 widFKQW7OSrEQweLSpKzU5BKQWUq1tQCz7lkFeAAAAA==
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

I am posting this as an RFC since I only tested it on the i.MX93. The
dynamic scatter/gather chaining should work with other eDMA controller
with split register layout.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
Benoît Monin (2):
      dmaengine: fsl-edma: Implement device_prep_peripheral_dma_vec
      dmaengine: fsl-edma: Support dynamic scatter/gather chaining

 drivers/dma/fsl-edma-common.c | 174 +++++++++++++++++++++++++++++++++++++++++-
 drivers/dma/fsl-edma-common.h |   4 +
 drivers/dma/fsl-edma-main.c   |   2 +
 drivers/dma/fsl-edma-trace.h  |   5 ++
 4 files changed, 181 insertions(+), 4 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260428-fsl-edma-dyn-sg-960731e37da2

Best regards,
--  
Benoît Monin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

