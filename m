Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3709457E72
	for <dmaengine@vger.kernel.org>; Thu, 10 Sep 2026 21:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789075645; cv=none; b=sOLlc3Bw1PcCSar6ehy+yqKXJ+hlZu6cpxb+Cp1zf2P4ps712NFvDwv2DKW0CcIwyxgQmqVhdMmtxjJxOX5DfyhzZM4G3ysAEyVrXt5Y0KC2D2Y0u11Fkc6KrX9kI9D/gaZqRJm0L4rw2Uclwawd22h4SlVXhyPaSaz21lpOAJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789075645; c=relaxed/simple;
	bh=aaWDf2Y8OUVV/DuOP50oCYw1JB2P8lsqtrXUZ2Gt2bc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NGBwzx+oNRQLAQM0rJ0cDLuyM5Dm5KWSg/ouHrmMzeshVFpkUBKHE3A/C9iCVIhmMgAuwF8ntwd8318K/EBGc5GbGoqjlD+ccI9kwuXg9sJNVwhG4q5rGp3pQ4SlZ/JLnRxXyMEgcSLD9B3k6vUR5G9/Ec+tTSUlXDlvG5okvHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RwsmlmjA; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RwsmlmjA"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-53016020b2fso4407041cf.0
        for <dmaengine@vger.kernel.org>; Thu, 10 Sep 2026 14:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789075643; x=1789680443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hQ/m1bh13HRSAAm/Dn2ucW4zjUQh0zEldVfEHRn3I7Q=;
        b=RwsmlmjAnbLrqalYP7Uk1s5H9tdNV+K55NTw5EqdlRB4hzE1XL57FfD9uo35vBX8wO
         yyI6Nm7GLWewJYdbchIJO3vh1RFUUFCwJpdPeKMgBBzCyCR0Ygz/1s5Pz/TxUaz5ClMz
         vLkRdh99kjuSzOwkDYXyB8xpw/gVCF+Cn4Yfa9YQK2axs06HT9OTjmyznn+NStXhXDfQ
         ijbaa/65VgAzw0yj7xKDfY6owhuByEdhm6g1yIj96mVVz51hqYMFO2M/hKoZfr3eECl5
         dHeElkOhUyXcM+XoSNPQLCud12oPsIab5k62AkOXY1OXuenAPVXklGXEl8KhCsM0XuYe
         a1IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789075643; x=1789680443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hQ/m1bh13HRSAAm/Dn2ucW4zjUQh0zEldVfEHRn3I7Q=;
        b=dWxO9yzXdO6MR7x45hWIhqXk3DuItg58xp/c4Ve8QED6FEI1pq73gyh/SM8d8Bmaj7
         zCLkUpIIv6i365aSnaX6HKIIVrL2bL0Ujvy5E5YlTzMobS5N9FAzDES7kni5nJA7hJBz
         QgJxQR3B3yMMMARNhqyLlHoFLYm7/9cYhw/E3qKKrA7/ty4nw7SKhrFaAtHIDP6Z8hwB
         leVYMRzkMTn1pQKwV/MGnKlgPWc/CfiFWre3uK7+PDSIy8CSrVgy2J/45HpQR+IqZk3f
         Crgve2mmzHfSFLpDvQ/iwdYtnSrQ6eyYE9jT4qEib+K5yLF9frAWTQhbgvSw7qJGc6jW
         /znw==
X-Gm-Message-State: AFuF++kU9SAnB3BbqPWL3mfqTLNFNgO2FbCNUl/CymFUGG2n7NsEuEgR
	5R5FuDaHiRtInbbBoGfso2A4hyT5Tvj6g7GxBpgnyXDmNDs81JlDDLFaMKWr/w==
X-Gm-Gg: AYBFou02U/VH1SJ7LnMH6bwgiXN5B9XuIIAy7VMa/P6encTguawBTIIW6LZ2iU3Vo+8
	xqSgbZhAl1myYIGceUCGt8lR6VLtMu+K9OvvaKO1a3BLhOlpGIoPwdRDFehEZ9KU0Ed1vpsxRAB
	ZgXOz46d1p7LjWBmb6pUtovZ79TLRCIRi4W+pSmq+MMJZl4/fLdX+TubR3FP/a7xecnJ7kFaKu8
	qCKH+60btVmLZgqJUwY5hmV1Z7UwMceF1d4O7M2wzO+0rJCs7FvTaVYJATQfEX5dFupuPQghyEV
	BY5WOXGmawDWUZy0FxVDqQCYm0EqExD+nUbgVQOc66cDKeyiOVjIhqCO9RC8LqfU+xWes7D2nQ/
	zy8bbCjCnbx2jndlczX3YUtME11kGhNRqxacGoE+iD4OK1aqUrt9x/Io6gnZIkBJcIk/Xo0AG9Y
	g+y3PojrB/iYgNfEoGkKuJeKVWO5KgLjOiff88dtxlyrlT2SFv5EcfUIcBXgb1Vrv98mZfm8yBL
	4vzEbpyMNpbvv3Q1th0y2P+1f6u2U9nY/W3eCWJ83pZH1S+sf53NkBWlm/WzkdKDd1YqxlhvKjx
	gbQhY6wepZXWScucadgcoKs/tj+BsISNdKNRDMa61XpxjVSw
X-Received: by 2002:ac8:7d56:0:b0:52d:882e:4986 with SMTP id d75a77b69052e-530c8527d46mr21504931cf.4.1789075642737;
        Thu, 10 Sep 2026 14:27:22 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ca4f08f5sm3180891cf.26.2026.09.10.14.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 14:27:22 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] dmaengine: ppc4xx: convert irq_of_parse_and_map to platform_get_irq
Date: Thu, 10 Sep 2026 14:27:20 -0700
Message-ID: <20260910212720.70721-1-rosenp@gmail.com>
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

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/ppc4xx/adma.c | 28 +++++++++++-----------------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/drivers/dma/ppc4xx/adma.c b/drivers/dma/ppc4xx/adma.c
index 279a431ccae3..42fc1791662b 100644
--- a/drivers/dma/ppc4xx/adma.c
+++ b/drivers/dma/ppc4xx/adma.c
@@ -3865,28 +3865,25 @@ static int ppc440spe_adma_setup_irqs(struct ppc440spe_adma_device *adev,
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
+		adev->err_irq = platform_get_irq(ofdev, 1);
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
+	adev->irq = platform_get_irq(ofdev, 0);
+	if (adev->irq < 0) {
 		dev_err(adev->dev, "no irq resource\n");
 		*initcode = PPC_ADMA_INIT_IRQ1;
-		ret = -ENXIO;
+		ret = adev->irq;
 		goto err_irq_map;
 	}
 	dev_dbg(adev->dev, "irq %d, err irq %d\n",
@@ -3927,6 +3924,7 @@ static int ppc440spe_adma_setup_irqs(struct ppc440spe_adma_device *adev,
 			    XOR_IE_ICIE_BIT | XOR_IE_RPTIE_BIT,
 			    &adev->xor_reg->ier);
 	} else {
+		struct device_node *np;
 		u32 mask, enable;
 
 		np = of_find_compatible_node(NULL, NULL, "ibm,i2o-440spe");
@@ -3956,14 +3954,13 @@ static int ppc440spe_adma_setup_irqs(struct ppc440spe_adma_device *adev,
 	return 0;
 
 err_req2:
+	if (adev->err_irq > 0)
+		free_irq(adev->err_irq, chan);
 	free_irq(adev->irq, chan);
 err_req1:
-	irq_dispose_mapping(adev->irq);
 err_irq_map:
-	if (adev->err_irq > 0) {
-		if (atomic_dec_and_test(&ppc440spe_adma_err_irq_ref))
-			irq_dispose_mapping(adev->err_irq);
-	}
+	if (adev->err_irq > 0)
+		atomic_dec(&ppc440spe_adma_err_irq_ref);
 	return ret;
 }
 
@@ -3987,13 +3984,10 @@ static void ppc440spe_adma_release_irqs(struct ppc440spe_adma_device *adev,
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

