Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED036377EBC;
	Thu, 25 Jun 2026 08:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782377984; cv=none; b=cQs1jp8TjroMfjIZUOPj0M3xvMvTSKNI8selYPvi4EUGMB0czY/B2LzZmM1Z/SI/LJ7TTqqxLIrLUuulaXEbGdGVL4ia/p+vPj/BMCOjfRDZEDg/OqbNtq/O3syof3PlH5lfTM7og48hGW7Y6eSjJTH6oMnUWC5w8gBbz6H4yno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782377984; c=relaxed/simple;
	bh=myRm+UUb4ysEUMgOO7I0SC+6ueJuAJPTtDeEFEIpr8s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dQjNiLpAt3UqTPG3LLkXbzFo2LCMjuSADXWOn0+oolHFI4S/VM5VLc7xtOVoFHXg0fa1VN2dUaBMMrBJO7W39fDLP0W9ic7jvX/3eUlV+GI//6OPMTJo8l6306cyXkncUVngoDkmJn774THqApOyZx9MM3Yg/K5KgH9A/i8FJXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yoseli.org; spf=pass smtp.mailfrom=yoseli.org; dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b=RTfDf8/U; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yoseli.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yoseli.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b="RTfDf8/U"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0B0673EBCA;
	Thu, 25 Jun 2026 08:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1782377981;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8s4AKYdEBD0QdUpYfCn6mP5zMlYwA7GhcWTDzQQl1BE=;
	b=RTfDf8/U+x0vPWw7vyxjt2Rzv1OTZDb/LyTMw5vaBmzjqVVhWkr/y0mzHKelOFfyA/9Kfl
	Co1dCRkDcSvtiyDkYXTCWRCo2eCdo8VkAoNAU25t68kM52OfdIiavVRZnU7hUOjJYdTsOY
	WJ/0Zogmq2cHIDu/9iJXe1VL3S3Qzf7OKv1fg4wq4XrN0FN2VliMWDYK1q82NF++hN1SWv
	kuc/LdHSR/me9j2bfvYL0WtEN8YNGtvkcM3wriIhgIBtvOl41P/QlS97mKv/Ah3DFLqS78
	+CVHRgKo/s0famQB56RfTuB/WrV038gljjPR3WK5IZDU752UkthHhXqT3aIOFw==
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Date: Thu, 25 Jun 2026 10:59:38 +0200
Subject: [PATCH v3 2/5] dmaengine: fsl-edma: Add FSL_EDMA_DRV_MCF flag for
 ColdFire eDMA
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-b4-edma-dmaengine-v3-2-44be00ace37d@yoseli.org>
References: <20260625-b4-edma-dmaengine-v3-0-44be00ace37d@yoseli.org>
In-Reply-To: <20260625-b4-edma-dmaengine-v3-0-44be00ace37d@yoseli.org>
To: Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>, 
 Angelo Dureghello <angelo@sysam.it>
Cc: Frank Li <Frank.Li@kernel.org>, imx@lists.linux.dev, 
 dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782377978; l=2577;
 i=jeanmichel.hautbois@yoseli.org; s=20240925; h=from:subject:message-id;
 bh=myRm+UUb4ysEUMgOO7I0SC+6ueJuAJPTtDeEFEIpr8s=;
 b=fvLKk22dpIGkWIvdhG3vQoC6tO57KB3xWKq7vvb9LiAQh9+gBz/O6XZCONdRR86nEiv/n/tA1
 +Sfk69w6c4GAitpChxQpRlxxeEUOjMyvxNQxU9iTE4xShBgpL0pmlKj
X-Developer-Key: i=jeanmichel.hautbois@yoseli.org; a=ed25519;
 pk=MsMTVmoV69wLIlSkHlFoACIMVNQFyvJzvsJSQsn/kq4=
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-GND-Score: -100
X-GND-Cause: dmFkZTERfnVehNAXUaQWJD0/6HJbgJtZl0Ej3OYaeHof8oDy1WB86V/78PQoPiPsUkMAlLJSzMa32RwYG0O7jJl+U4XeipYvUQD7YfunmGQPzf9T1GMhnJVE3XTdMMDTQYQM1NHSJ0Pe7NaHwLPFtefdoHse0N5UTpmZUux+iEWKv1OFgiFioAehx1wOQX+5jvl8e8XLYNNYaKByfpia8KxVMb06K+oUQwzDskJt2ZrW4fFJO5ncIkEfkR41qn6zsImliiXoF3w0CU5wasgCKIrQcmBCjhO4koX1KW97HomtLjfkrG3wGHoGXZrujKxrRMacqCDkrt7pZOPJALw8QekhuJJ7aJkEHGVYRGN7qt4+PN4oWFDGtQHICaS57Fr9whAL5Mrfyd8DcJRcFWPVdE0ZAKI+/ZpbPif+U+JakGVk3kIOoX0P2ULgHmzmAGEyeTIl4NYAUamyHENkI36lV6jGwc/UobxZ3oO/+1PXzdmZtQq7k7PQQMcwM35sfFGtphsQwvsS3R4PFLYaZ+E9IXoNaeeBoBQzUPHxjuA1gBpiN5Y/NjIJ63KAAB2k9+rs2njf9zFPDLFDjijnSl1XqiThhXZFca4+jygWlIuDsV5Gs6SydQnt7pPPNVeV7K4xAXjQKckttBVlzWoKMueY/6LN2T6tqye0nxluobLfZbg06usCIQ
X-GND-State: clean

Add FSL_EDMA_DRV_MCF driver flag to identify MCF ColdFire eDMA
controllers which have a native M68K register layout.

The edma_writeb() function applies an XOR ^ 0x3 byte-lane adjustment for
big-endian eDMA controllers where byte registers within a 32-bit word
need address correction due to endianness differences between the CPU
and hardware IP block.

However, the MCF54418 eDMA is native to the ColdFire architecture and
its 8-bit registers (SERQ, CERQ, SEEI, CEEI, CINT, CERR, SSRT, CDNE) are
located at sequential byte addresses (0x4018-0x401F) as documented in
the MCF54418 Reference Manual Table 19-2. No byte-lane adjustment is
needed - applying the XOR causes writes to target incorrect registers
(e.g., writing to CERR at 0x401D would actually access SSRT at 0x401E).

Set this flag in the MCF eDMA driver to bypass the XOR adjustment and
access registers at their documented addresses.

Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
---
 drivers/dma/fsl-edma-common.h | 5 ++++-
 drivers/dma/mcf-edma-main.c   | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/fsl-edma-common.h b/drivers/dma/fsl-edma-common.h
index abc8f7805515..64b537527291 100644
--- a/drivers/dma/fsl-edma-common.h
+++ b/drivers/dma/fsl-edma-common.h
@@ -225,6 +225,8 @@ struct fsl_edma_desc {
 #define FSL_EDMA_DRV_TCD64		BIT(15)
 /* All channel ERR IRQ share one IRQ line */
 #define FSL_EDMA_DRV_ERRIRQ_SHARE       BIT(16)
+/* MCF eDMA: Different register layout, no XOR for byte access */
+#define FSL_EDMA_DRV_MCF                BIT(17)
 
 
 #define FSL_EDMA_DRV_EDMA3	(FSL_EDMA_DRV_SPLIT_REG |	\
@@ -419,7 +421,8 @@ static inline void edma_writeb(struct fsl_edma_engine *edma,
 			       u8 val, void __iomem *addr)
 {
 	/* swap the reg offset for these in big-endian mode */
-	if (edma->big_endian)
+	/* MCF eDMA has different register layout, no XOR needed */
+	if (edma->big_endian && !(edma->drvdata->flags & FSL_EDMA_DRV_MCF))
 		iowrite8(val, (void __iomem *)((unsigned long)addr ^ 0x3));
 	else
 		iowrite8(val, addr);
diff --git a/drivers/dma/mcf-edma-main.c b/drivers/dma/mcf-edma-main.c
index 9e1c6400c77b..f95114829d80 100644
--- a/drivers/dma/mcf-edma-main.c
+++ b/drivers/dma/mcf-edma-main.c
@@ -145,7 +145,7 @@ static void mcf_edma_irq_free(struct platform_device *pdev,
 }
 
 static struct fsl_edma_drvdata mcf_data = {
-	.flags = FSL_EDMA_DRV_EDMA64,
+	.flags = FSL_EDMA_DRV_EDMA64 | FSL_EDMA_DRV_MCF,
 	.setup_irq = mcf_edma_irq_init,
 };
 

-- 
2.39.5

