Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765FA468C10
	for <dmaengine@vger.kernel.org>; Tue, 15 Sep 2026 07:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789456832; cv=none; b=ulmDG354HFEbk87W9Wo/hm+6om+B+lY66hsM/SWMTV3ExbBmVme+TylhE0QRPe/u4OU1Z+dY6kSQPWX+hQ5B2bNMykCGN3kDpmgCgB2xRGqQNKa+76uvV9ZpxEVAcPRnUEtoWLtXKIRganOZftKIdk7meUIrDdL5/QL3GqSVq+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789456832; c=relaxed/simple;
	bh=F6QeRzEDWK5t1xhcyR513pNWKh1fKRnRhF3y+a++YlU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TWtSAXcumUShVw4h/E17o+/CWIWlPYWDFMVmUjYrMn1q8fROwpsTD7a8miwczu7LY9Lvhl1m2/NEqqfoK5JftvGC0/xj2vPcGwGPYfq77cy0pSVzl9cBUmU+KpobmreKs1A4TU6kb2yBtthyWraKe7vMKa9339KW/fuPBvo+ESc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iw8aaud1; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iw8aaud1"
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-93a0fd41a7bso271203085a.1
        for <dmaengine@vger.kernel.org>; Tue, 15 Sep 2026 00:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789456829; x=1790061629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NMRsbHWbqWxYa7/sB3UvfZ4V+AdJ5sViuPlZizxgnu4=;
        b=iw8aaud1s8C16xdDTCRF49TY1ifSNf/SrQQz3QR5zJM56w/SPGexi3tsRxGuX8Kpso
         j9GTr4iCJx6zcJpueDmApQ1wpSU4vpJ4cvoVNgpIh3odHdCcN/ijqOxfAkfP4RLXI0zg
         wsXs9/F+WBn1GS44Mwt1R6Bl8TlqvBW8fYoUcM0GJQmzmcBgLc19btHMX3pw5glW1NzY
         CV7tgZdNvgrUE9QKoldsQpiymU8BQUS4fC/4XnWlJ4PlVuWM748OanjKvd2uTJKHpSCw
         pUWMHyIgliSm/rrPjroHw7gceihCRyWZWBZ5XNs4rEqF01L+23DhoTArVDGpJuJRX/YS
         GnUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789456829; x=1790061629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NMRsbHWbqWxYa7/sB3UvfZ4V+AdJ5sViuPlZizxgnu4=;
        b=SevEMxWLV1ir8y0qsR6jJ8oEBs1JiJA9hPvzTeCA2qJ+GWRA5BvSyxCOxIyWjlT6SP
         qirAOni0sS6PNX3+Cxk3jVYhVyd64p3PZPao6DXn39kDIZYiZU9621aNEHzjccQwv38H
         b1asA31A3tc9ls9TtMDD1cv9UtY8Ev4IDrx+t2lnmL6ImxK1VFxQDUQpfcLqnzRL9oyR
         s2qlUgbsLqJuKcGl1lW8Dz6jIZfJFjmkVmJEulNiDTWV2za0BPZEqQf9q9u0Zix0PrHa
         T/F4m/PWOtJba7J/PaUPMEm4QhEzHWn1kW3PtMgRmM+EjmFU89opceGGqBe2W4Kk/NFU
         +R5g==
X-Gm-Message-State: AFuF++mfSEkTa5bWJD5C4JguALFmxXzk7GFW4DWOx0brVoMKlv9GIhJc
	zf4yI4UO2Z7aDTh4XuPMW5MAlWSUaVuGKmILnF+z2vNU049ABwkfSEG3Z00RQQ==
X-Gm-Gg: AYBFou3pmiub2ClPXRAq+1zydr+kvYwiJcdScuFDwFhnN27pG4a9DBbzWIs87SYitv3
	xiHHjzRm0o9+buoRsUMOymXuEWpRhLTnRbJROo4zGDL5XXLJPdlk+LpmmIVfMO0RR7JERW2mALF
	ZsN6nAoJTv7MgI5OmS2UpW8m54+x3TMe7SD0/hm65JhnOOT0NpmWEuNixyl4pq35Khdrl8YEovo
	GVvM0H6KwZ2GfK7hbK138L3vKQ/zm+/gc4/WtNOTsAdZNP63aMkLihZ5Z0SGkYg9Kh+3nKT5VTE
	b5C/YkC9FwHWXuysnbZWZWpbutExhIVt8YQa/U1NDnPk3YoqC7JVGmjmgyYRqROnmQJ8WhW8VyV
	jujFwls1dDd+FKGuHmoSdGrg0F1v7djdKEfv2EgemWBASCS3UnBMIG/tmwGXP7Y2XHEOICHrnqE
	J8gvtPc3g575dFgnSgQipUsAuzA0XuzHPu/ycEMwFakqbD4VUU+54eC9heUqqhEQ+x9LKjtzX0R
	f/jB0xOmE1s5Lq6orx67vieTa4OoL1547qm9r9bE484+GrNHJde68mYSp5h3HHyCD/5/8lFd3pq
	jzfiTRoHPEeghWcE5x5U+Vr9X61aBLckqkZeCYzkJvc4JrCwtg==
X-Received: by 2002:a05:620a:4455:b0:939:6dea:374a with SMTP id af79cd13be357-93a29be35a4mr904680985a.46.1789456829104;
        Tue, 15 Sep 2026 00:20:29 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939ec337d23sm1126447185a.2.2026.09.15.00.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:20:28 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv4] dmaengine: ppc4xx: convert irq_of_parse_and_map to platform_get_irq
Date: Tue, 15 Sep 2026 00:20:26 -0700
Message-ID: <20260915072026.54904-1-rosenp@gmail.com>
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
framework manages the mapping. Also allows dealing with -EPROBE_DEFER.

While here, fix a latent bug in the err_req2 error path: the error IRQ
was not freed when a subsequent step (I2O setup) failed.

The struct device_node *np declaration is moved to the scope where
it is still needed (I2O register lookup).

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v4: handle -EPROBE_DEFER
 v3: use _optional
 v2: fix missing free_irq in remove and fix description
 drivers/dma/ppc4xx/adma.c | 39 ++++++++++++++++++---------------------
 1 file changed, 18 insertions(+), 21 deletions(-)

diff --git a/drivers/dma/ppc4xx/adma.c b/drivers/dma/ppc4xx/adma.c
index 279a431ccae3..0b4ba9a2fe88 100644
--- a/drivers/dma/ppc4xx/adma.c
+++ b/drivers/dma/ppc4xx/adma.c
@@ -3865,28 +3865,28 @@ static int ppc440spe_adma_setup_irqs(struct ppc440spe_adma_device *adev,
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
+		if (adev->err_irq == -EPROBE_DEFER) {
+			ret = adev->err_irq;
+			goto err_irq_map;
+		}
+		if (adev->err_irq <= 0) {
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
@@ -3899,7 +3899,7 @@ static int ppc440spe_adma_setup_irqs(struct ppc440spe_adma_device *adev,
 			adev->irq);
 		*initcode = PPC_ADMA_INIT_IRQ1;
 		ret = -EIO;
-		goto err_req1;
+		goto err_irq_map;
 	}
 
 	/* only DMA engines have a separate error IRQ
@@ -3917,7 +3917,7 @@ static int ppc440spe_adma_setup_irqs(struct ppc440spe_adma_device *adev,
 				adev->err_irq);
 			*initcode = PPC_ADMA_INIT_IRQ2;
 			ret = -EIO;
-			goto err_req2;
+			goto err_req1;
 		}
 	}
 
@@ -3927,6 +3927,7 @@ static int ppc440spe_adma_setup_irqs(struct ppc440spe_adma_device *adev,
 			    XOR_IE_ICIE_BIT | XOR_IE_RPTIE_BIT,
 			    &adev->xor_reg->ier);
 	} else {
+		struct device_node *np;
 		u32 mask, enable;
 
 		np = of_find_compatible_node(NULL, NULL, "ibm,i2o-440spe");
@@ -3956,14 +3957,13 @@ static int ppc440spe_adma_setup_irqs(struct ppc440spe_adma_device *adev,
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
 
@@ -3987,13 +3987,10 @@ static void ppc440spe_adma_release_irqs(struct ppc440spe_adma_device *adev,
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

