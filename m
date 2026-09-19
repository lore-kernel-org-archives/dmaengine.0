Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5695626738C;
	Sat, 19 Sep 2026 22:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789856556; cv=none; b=U6qrXNbDDt7PtG3mOPqUPZ0oB+YB2lxb9qP8NAL/qYNlxUubjZbtUD8nvFvOWiJcLIkdkDh+rob1a88VOXXBejUAQr6PbdRLASps9iTYqR1QYpMmBTpc82jC1SXbyPDNf3YPOEB4f0owLaKS2wY5ZFqTk3HQhOomLBR8L5DRd7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789856556; c=relaxed/simple;
	bh=rnXKeOsQPsAkCdhFJ9zcVR8MdXjqYiY+FW5CI3yOF9I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b+0Bksfl7KMluIec+JsvywA+Bep3QmZs9kX2WKNJbhcOCwd0ahjTUJLbkHIXoo+2ZIMjCIkyD7nz72qAdT5Ht01V2CJ/FRQdjd++2u/pUkdB5nS51N5MXpQtXSdO2Q64PGMGkFfeKM+HdTtD0Gz8P6/xLxwFVif9j7Uk2LZwrEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hW/V9RJB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hW/V9RJB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6D0B1F000FF;
	Sat, 19 Sep 2026 22:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789856555;
	bh=mN/vFB6kl+8QOvAP66Lp2VKYJ3ZuyV+F0lKMgi6MIfg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=hW/V9RJBsaF2PUFK+GEV01vG0lVzoxIw3tVhThzQjsIm03H1N+0dWU7tMM29qSprH
	 yyqYwfLhrJB0ubfTgFF9br7KZzb88sp4FXXT0VXZsJZmhJdmRCfe0TZrzEtU93ze2g
	 LGabnDwDUzORHg2GkJdy67jxR35rIzquZrXJVLn9izoj7DbtcfEVrwlJ2vH3l1WCkn
	 rvv4YZaijzElPZ1vAn+AakUi7S8GFrpF3tTXTvNYEUUtIQORxPEoNDIegyLiW5BMeT
	 actI2Sav/OrCiTcQKLmMwyH/qnx6z0hh2c4zyl8hWrGbjUzEdKKPTcN+VG7XTPV1VT
	 rGjV+qWTqbC+g==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 20 Sep 2026 00:22:21 +0200
Subject: [PATCH v4 10/23] dmaengine: ste_dma40: Fix probe IRQ leak
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-dma40-fixes-v4-10-d751b2d9c23f@kernel.org>
References: <20260920-dma40-fixes-v4-0-d751b2d9c23f@kernel.org>
In-Reply-To: <20260920-dma40-fixes-v4-0-d751b2d9c23f@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, sashiko-bot@kernel.org
X-Mailer: b4 0.14.3

d40_probe() registers the hardware interrupt before several later probe
steps that can fail. Those error paths jump to destroy_cache without
freeing the IRQ, leaving the handler registered after probe resources have
been released.

Track successful IRQ registration and free the IRQ on later probe failure.

Fixes: 8d318a50b3d7 ("DMAENGINE: Support for ST-Ericssons DMA40 block v3")
Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/dmaengine/20260618051539.15E201F000E9@smtp.kernel.org/
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 73560d482343..075c9b18d6c2 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -3687,6 +3687,7 @@ static int __init d40_probe(struct platform_device *pdev)
 	struct resource res_lcpa;
 	int num_reserved_chans;
 	bool runtime_pm_enabled = false;
+	bool irq_requested = false;
 	u32 val;
 	int ret;
 
@@ -3810,6 +3811,7 @@ static int __init d40_probe(struct platform_device *pdev)
 		d40_err(dev, "No IRQ defined\n");
 		goto destroy_cache;
 	}
+	irq_requested = true;
 
 	dma_set_max_seg_size(base->dev, STEDMA40_MAX_SEG_SIZE);
 
@@ -3846,6 +3848,8 @@ static int __init d40_probe(struct platform_device *pdev)
 		regulator_disable(base->lcpa_regulator);
 		regulator_put(base->lcpa_regulator);
 	}
+	if (irq_requested)
+		free_irq(base->irq, base);
 	if (runtime_pm_enabled)
 		pm_runtime_disable(base->dev);
 

-- 
2.55.0

