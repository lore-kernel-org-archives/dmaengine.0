Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978EA384CEA;
	Thu, 25 Jun 2026 08:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782377984; cv=none; b=FacRYKP0mErcDZ9VQNjRsQdyNOv/1gQlsS2grB+L6gbSQQswxxLD8Yq2EQarNRm1y234uZPt5S/y04t3M72Q/+D9/f85xO2ZhSzvr/ny4/VWAiA8cfbGY58jUw8kN0RZH+DDIqXCMKQZs2BDZqMHsE1dXuL6URnbxdwb6mCWGyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782377984; c=relaxed/simple;
	bh=syIUdyu1xWcoWr0p4kpqxq+c6k9/6ho+XigYhdJfCPs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nxuhr5+bp6O9OShmwATC/8z0YeFmw7WFSBAhzpD++DPVnFt14t9atdznCdAU+YqU7Wya2bY/acMonkozTTQEj3zzPhijIlZpEXB6QrXUMOOpS7jgBv2zHHZLa3PMGmxCWsDaDGlglOgr7CfafMO1LeKeOqryYdEVrmKK6/RZkNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yoseli.org; spf=pass smtp.mailfrom=yoseli.org; dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b=KncRG5Kf; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yoseli.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yoseli.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b="KncRG5Kf"
Received: by mail.gandi.net (Postfix) with ESMTPSA id F3DF03EBC2;
	Thu, 25 Jun 2026 08:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1782377979;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XCzXft9NlsCoIM092yOw5c0isnDLHn+QcrWCYc/COcU=;
	b=KncRG5KfwUQ4jMqbhzLkQLOl+wJ24IWHbBnyNhzocse/kjaLxhVvqkItRn2t7omBWRkqU7
	pqUR/KHXNUip10AP0dWjqwqH/rdCbax/Cs60SYXuSKYNdpp4j1eCNm4vxrj2MErfdexGKx
	D6DErm4wNnzK1Ajpc42K+HJjHKDG6lHUxDo75HZM32Ay/IFTFXtLJl1bad7s7SHfHcJXH1
	6eKbl1PUSvpT7d/KLEXrYZx6OtO4KTcKNNe0agBVP1PjTcl9otGN2jIXiqlcXuFchAJeLZ
	P8F0WvEYrkRZKCXxgnNsjV4nMc/y1c/Im3U/JL+Z890/JO4ED1YNjKvSuhkn7Q==
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Subject: [PATCH v3 0/5] dmaengine: mcf-edma: fix 64-channel handling and
 modernize IRQ setup
Date: Thu, 25 Jun 2026 10:59:36 +0200
Message-Id: <20260625-b4-edma-dmaengine-v3-0-44be00ace37d@yoseli.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPjtPGoC/yWNQQ7CIBREr2JY+w0gUHXlPUwXLfy231QwUBubp
 ncX6mIWL5l5s7KEkTCx22FlEWdKFHyG8/HA7ND4HoFcZia5NNxIDa0CdK8GctD35BHkRdhKGKN
 cU7G8e0fs6Ls7H/Wf06d9op2KqDQGSlOIy346y9Irfi2ENMULNoyuo4gwS+CgW4FKK+UMv96Xk
 HCkU4g9q7dt+wGQplW0wAAAAA==
X-Change-ID: 20260625-b4-edma-dmaengine-281c71664da7
To: Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>, 
 Angelo Dureghello <angelo@sysam.it>
Cc: Frank Li <Frank.Li@kernel.org>, imx@lists.linux.dev, 
 dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782377978; l=2705;
 i=jeanmichel.hautbois@yoseli.org; s=20240925; h=from:subject:message-id;
 bh=syIUdyu1xWcoWr0p4kpqxq+c6k9/6ho+XigYhdJfCPs=;
 b=lQdLUv1rlC5XNwxd3Yr3u8l1qOZP7cTW5Fr5peUYhmHUsl5v5i/36K43J3zxcXoRYpPoGHOgs
 3fgTbbKWL8VARKcnbhStheLeyrqjlD7AfSYpMMoCY7EXqKfBzLsUHaa
X-Developer-Key: i=jeanmichel.hautbois@yoseli.org; a=ed25519;
 pk=MsMTVmoV69wLIlSkHlFoACIMVNQFyvJzvsJSQsn/kq4=
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-GND-Score: -100
X-GND-Cause: dmFkZTGiI+TjZcRXyPKYPtAGSjOk24JrOJJ3Wpg06hmACYTjlFfj4wkTxJPX6XapZsqD8kcxRRj3hkNHo1MKGvGHp2NrxiCHanobZBAHYY+Dbyux+59gP99JdqkpgPe+4xErjo4TwGYRMcjECQzR22Zbbo4opv9gmA6OHjTAGKG8lqrXmr1Hrorb+B7A0RNUy07S0QlIXIGURPO1v1qmCa0D/R4foDBWQ6axE75F+qzwNk0sOxyb6RSKqhnfSiWaxYq8vZSNxRa1E4hcbNLWru5PDh8jF2+rjOPF4WM28/XX+B99p3ZdDO2UJmCpJ0ZjoQ9b32eiC42FziKvTyFEHmHLCq2KGaA3vLQy7eHYXyvE+mrD74brPXmlQZ3LtaB4sa1jjp5uE3UV0fJaB8jj2TRFI0qJdKmZ8jvYSS/AUhmmQfPKZMVPCmX6vD1WefQvXD3OAvlrKjF+PgKbFZhD6adz8iN3iNze5UnX2bPcNALoBTNl+8/d0VTd0a5kjwRJcIcnkf3C23tgrAmD/4FBU03cBQVO3TX643RDqsq8UQ0zgymoIilBJT3MCqOpijiHr7r0yax4ZdrRR2EkHo3EERohb/D7IKoVbB5LnEQmEwRq0bFXKexpDArl15mPZU/R0v5PSPPNLi7nfgB1dCJ8YddHXmWwQZjt6tJdjAfYiqgjUYt1rw
X-GND-State: clean

The MCF54418 ColdFire SoC integrates an enhanced DMA controller (eDMA)
with 64 DMA channels. The current mcf-edma interrupt and error handlers
only deal correctly with the first 32 channels: they test the status
bits with BIT(ch) on an "unsigned long", which is 32-bit on ColdFire, so
any access to a channel >= 32 is undefined behaviour and the
corresponding completions/errors are mishandled.

This series fixes the 64-channel handling and tidies up the related
code:

 - move the shared eDMA error handler out of the header file so it can
   be reused by the mcf-edma glue;
 - add an FSL_EDMA_DRV_MCF driver flag to describe the ColdFire
   specifics;
 - fix the completion and error interrupt handlers to iterate over all
   64 channels using a proper bitmap;
 - register the per-channel interrupts with devm, which also fixes the
   IRQ leak on the probe error path and quiesces the controller on
   remove().

The two interrupt-handler fixes carry Fixes: tags and are candidates for
stable.

This work was previously posted as a single series together with the
ColdFire/m68k platform enablement.  As the driver changes and the
arch/m68k/ enablement are independent and target different trees, they
are now sent separately.

Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
---
Changes in v3:
- Rename the patch subject prefix dma: -> dmaengine: (Vinod Koul).
- Split the ColdFire/m68k enablement into its own series targeting the
  m68k tree; this series now contains only the drivers/dma/ changes.
- Add Fixes: tags to the two 64-channel interrupt-handler fixes.
- Replace the "Add per-channel IRQ naming" change with a devm-based
  per-channel IRQ registration that also fixes the probe-failure IRQ
  leak and quiesces the controller on remove().
- Link to v2: https://lore.kernel.org/dmaengine/20251126-dma-coldfire-v2-0-5b1e4544d609@yoseli.org

---
Jean-Michel Hautbois (5):
      dmaengine: fsl-edma: Move error handler out of header file
      dmaengine: fsl-edma: Add FSL_EDMA_DRV_MCF flag for ColdFire eDMA
      dmaengine: mcf-edma: Fix interrupt handler for 64 DMA channels
      dmaengine: mcf-edma: Fix error handler for all 64 DMA channels
      dmaengine: mcf-edma: Use devm for per-channel IRQ registration

 drivers/dma/fsl-edma-common.c |   5 ++
 drivers/dma/fsl-edma-common.h |  11 ++--
 drivers/dma/mcf-edma-main.c   | 133 ++++++++++++++++++++----------------------
 3 files changed, 72 insertions(+), 77 deletions(-)
---
base-commit: ab9de95c9cf952332ab79453b4b5d1bfca8e514f
change-id: 20260625-b4-edma-dmaengine-281c71664da7

Best regards,
--  
Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>

