Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F2C364E96
	for <dmaengine@vger.kernel.org>; Sun, 13 Sep 2026 19:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789329353; cv=none; b=EAjfkxBZ0qsu2hQCDt7a0S7XBtCLnrXEH2+X6ExAcyoF0gd3JoQKWAQLraBjJeEOrwlDh2C47uvcCsxUFRRiRzE4sTQt0muDzf1ye9wdlsGctyVly/5FxvZp5nVS0/qH1Le0GnBR9b+kwP8blu8S2RhnoXj9s7xCqXtc0CKVk0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789329353; c=relaxed/simple;
	bh=QFoxZ466Caks+EI4SYrrKcFa463Pz1cC+OaV8EuuB1c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cMr8LSEB3dV9A1kw8NQufSNf+htuHzpJneK7VSnNflo4bkaSg9+72/v8nHKRDFS4eKN0p5c78uCBoGlibLF42Ok0OSOUeu60mVGBIzXxyArIMJvpXrptx+D3Y+MkpgJE1V2Kv5lw4IGKnxgZIM7NI/RxiM1PyVQaZH4dOq7Zqvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PH9uP14m; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PH9uP14m"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccdaea76so551883a91.0
        for <dmaengine@vger.kernel.org>; Sun, 13 Sep 2026 12:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789329352; x=1789934152; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zP/flU6LxzcXkCBWdWRdaNlDvIYWNpZBuwaTNPtJjVA=;
        b=PH9uP14m9o4WApAzd9bYijrKHG62dvKYCubHkEXS+AgV4vH5/Uq+LXRzgiiMa1CMao
         vlvZj31GOKjaU25pExfkbO6ZuA02nSWLGnxIQad7N1acICWb6UrN+aV99CjyVlWJEs5o
         9uXIJnsl11zLvt6+hsQs+2i63Kq8JXTmAwhb+Ay9X3PZtDVTR/4p7OiT8xG9M6rbT3X3
         5qnDUnJTBQmKKhrd2ldyMnDtvYoqAt96oUl1Xhp9buTHh8QkCMnSeTzgVd/rAsBqYVtZ
         uR4rAO7IMXZIXf7QRXNAXgSHgiQFHH6JiSnU1/vDn1E+n1PFTMlApuADkvAtv5woTgsP
         39zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789329352; x=1789934152;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zP/flU6LxzcXkCBWdWRdaNlDvIYWNpZBuwaTNPtJjVA=;
        b=OoTfs6QUvKusic1dHQuRDQkqNoGTrXvXXAu3ug0CzcQX4241ZLuQ4JQzgv9VZvm+VO
         7VagfQOQCY+G40FoyRO9AxnYuq1xfTmKpTAKZviiNFZxx+xpmeHxakthioz9oyywBL1G
         WAPBC1cJ3muFuskP1Sh7Cd6BukDWDvHWFSZHBObZj5JI5pbNePmkoIf419V2JqfLvGNu
         Bmhb/+cZknNSNp07A47fwz5vSy2ruuokbWEZay6vb57poXnuhpwDjI+G2QB2lpFiIs2y
         DlJ1UOMkkwFHsuzKqwq26+XDPOiUkac0h+jE9uMYL1Az+Ch8AVfgGtUrb3xiEww+O7Cw
         GTrg==
X-Gm-Message-State: AFuF++mZtsK0AxRL3jZUS3YHSA+wSVR0xTfKRdouRoNJe1NNs3p9/Znu
	H4gK7x99Bfp287z6syZk8BQusZhtZv870EkeKEbNaowsvjKjMIeHenEaLHJRog==
X-Gm-Gg: AYBFou3N67/U+Wu+44ZC73t0NqIDfRO3SsV5tOCrtWIfVpVXdznOByiSaW7CD15nSYb
	lAcxZa/ER6WRRY9qUX72vsVQ5QNwTKizen9oGqLTtdJYfS25Ivvg3ocOmpIu3z3scQs/fyefR/L
	9Nfzbav6kq95BxCg0bwOySGf4MQbajIv1w5zLDz8imVBnsjDpEpkwKOCOXZuhmj/Fjjl3ZSip4E
	/+YXsonQPu3O40gWTI+hazxrYYBRYXVBwvFEnI8oMBU5Vw+Asetj4z5xMZVWKBuxBxUdOeF6Nxn
	ab1G9bQBkbUhJG1sUa+CKY32warO2RAfw1U/MwUQ0N1ejZvR9QUHBh3KMA8xA5YvqZBHlok3HUa
	sQfTZEv2D/Y+Hb396Zv74dVTsYPon96mIP89KwpKMFzEreCDyEEzooEGCKoSGR0QXb92axHpcJH
	V5xLMMWm8Oh97Gh43bPzkbj1wTWrdLTSywvz4PIc7fYvrUgYBqH9bEGLaAYtPD/WmR1xt83zWg3
	6d0XJ/0o9Ksxd7JZMp/pYh6kpClSaOetyIcSUZrf8JuLCNDu3lb6WhGoNxFlzT9J9u6CT+DnL8Z
	fZKCTJ9pVJhk7zHAQk5EFkVl1tUZJucFf1N9su/ns8Nm6rv4
X-Received: by 2002:a17:90b:2f84:b0:395:8124:ac53 with SMTP id 98e67ed59e1d1-39dd5570100mr3842479a91.6.1789329351633;
        Sun, 13 Sep 2026 12:55:51 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d95424fccsm16469994a91.10.2026.09.13.12.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 12:55:49 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] dmaengine: ppc4xx: convert irq_of_parse_and_map to platform_get_irq
Date: Sun, 13 Sep 2026 12:55:47 -0700
Message-ID: <20260913195547.41579-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace irq_of_parse_and_map() with platform_get_irq(), which is the
preferred way to obtain IRQ resources from platform devices.  This
eliminates the corresponding irq_dispose_mapping() calls since the
framework manages the mapping.

While here, fix a latent bug in the err_req2 error path: the error IRQ
was not freed when a subsequent step (I2O setup) failed.

The struct device_node *np declaration is moved to the scope where
it is still needed (I2O register lookup).

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: use _optional
 drivers/dma/ppc4xx/adma.c | 35 ++++++++++++++---------------------
 1 file changed, 14 insertions(+), 21 deletions(-)

diff --git a/drivers/dma/ppc4xx/adma.c b/drivers/dma/ppc4xx/adma.c
index 279a431ccae3..99aee726644e 100644
--- a/drivers/dma/ppc4xx/adma.c
+++ b/drivers/dma/ppc4xx/adma.c
@@ -3865,28 +3865,24 @@ static int ppc440spe_adma_setup_irqs(struct ppc440spe_adma_device *adev,
 				     int *initcode)
 {
 	struct platform_device *ofdev;
-	struct device_node *np;
 	int ret;
 
 	ofdev = container_of(adev->dev, struct platform_device, dev);
-	np = ofdev->dev.of_node;
 	if (adev->id != PPC440SPE_XOR_ID) {
-		adev->err_irq = irq_of_parse_and_map(np, 1);
-		if (!adev->err_irq) {
+		adev->err_irq = platform_get_irq_optional(ofdev, 1);
+		if (adev->err_irq < 0) {
 			dev_warn(adev->dev, "no err irq resource?\n");
 			*initcode = PPC_ADMA_INIT_IRQ2;
-			adev->err_irq = -ENXIO;
 		} else
 			atomic_inc(&ppc440spe_adma_err_irq_ref);
 	} else {
 		adev->err_irq = -ENXIO;
 	}
 
-	adev->irq = irq_of_parse_and_map(np, 0);
-	if (!adev->irq) {
-		dev_err(adev->dev, "no irq resource\n");
+	adev->irq = platform_get_irq(ofdev, 0);
+	if (adev->irq < 0) {
 		*initcode = PPC_ADMA_INIT_IRQ1;
-		ret = -ENXIO;
+		ret = adev->irq;
 		goto err_irq_map;
 	}
 	dev_dbg(adev->dev, "irq %d, err irq %d\n",
@@ -3899,7 +3895,7 @@ static int ppc440spe_adma_setup_irqs(struct ppc440spe_adma_device *adev,
 			adev->irq);
 		*initcode = PPC_ADMA_INIT_IRQ1;
 		ret = -EIO;
-		goto err_req1;
+		goto err_irq_map;
 	}
 
 	/* only DMA engines have a separate error IRQ
@@ -3917,7 +3913,7 @@ static int ppc440spe_adma_setup_irqs(struct ppc440spe_adma_device *adev,
 				adev->err_irq);
 			*initcode = PPC_ADMA_INIT_IRQ2;
 			ret = -EIO;
-			goto err_req2;
+			goto err_req1;
 		}
 	}
 
@@ -3927,6 +3923,7 @@ static int ppc440spe_adma_setup_irqs(struct ppc440spe_adma_device *adev,
 			    XOR_IE_ICIE_BIT | XOR_IE_RPTIE_BIT,
 			    &adev->xor_reg->ier);
 	} else {
+		struct device_node *np;
 		u32 mask, enable;
 
 		np = of_find_compatible_node(NULL, NULL, "ibm,i2o-440spe");
@@ -3956,14 +3953,13 @@ static int ppc440spe_adma_setup_irqs(struct ppc440spe_adma_device *adev,
 	return 0;
 
 err_req2:
-	free_irq(adev->irq, chan);
+	if (adev->err_irq > 0)
+		free_irq(adev->err_irq, chan);
 err_req1:
-	irq_dispose_mapping(adev->irq);
+	free_irq(adev->irq, chan);
 err_irq_map:
-	if (adev->err_irq > 0) {
-		if (atomic_dec_and_test(&ppc440spe_adma_err_irq_ref))
-			irq_dispose_mapping(adev->err_irq);
-	}
+	if (adev->err_irq > 0)
+		atomic_dec(&ppc440spe_adma_err_irq_ref);
 	return ret;
 }
 
@@ -3987,13 +3983,10 @@ static void ppc440spe_adma_release_irqs(struct ppc440spe_adma_device *adev,
 		iowrite32(mask, &adev->i2o_reg->iopim);
 	}
 	free_irq(adev->irq, chan);
-	irq_dispose_mapping(adev->irq);
 	if (adev->err_irq > 0) {
 		free_irq(adev->err_irq, chan);
-		if (atomic_dec_and_test(&ppc440spe_adma_err_irq_ref)) {
-			irq_dispose_mapping(adev->err_irq);
+		if (atomic_dec_and_test(&ppc440spe_adma_err_irq_ref))
 			iounmap(adev->i2o_reg);
-		}
 	}
 }
 
-- 
2.55.0

