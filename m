Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA5D415F36
	for <dmaengine@vger.kernel.org>; Fri, 11 Sep 2026 22:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789164196; cv=none; b=LIUesiNdH9Dzzd0DVKQ0khV2V1a07tjKNwLMdpkhDYcnTDacAwep3+Jh/Gw6uFYfAXYM6Qf5ewgtqv57oCpMRUQVrzJaOMRazBY12dRsTveDWE8GEh27nuW0+Djkx3yUPc+C7HR4MlFFxb5IHJO/Ty1SUB59pYvDzhoO0CPdTi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789164196; c=relaxed/simple;
	bh=bgXr923ghVlip3r6x6+z5U6Xal6p9E4suYNMGgbS1Y8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FXplZcXKCyRaMydvbgb3KSyz1BZv5isf6XajOlLNL8TwTEGVg/KYlvYX68pSwZP+Dp8dhVISWTnummcGvRMzOCUPvgrvsYEjEuYuleTYuLSZ1EEiyYJhc47VMSKtUPp2VyD8LTte3iJl6CKwTPpZUYQjMwl6HzTma3XfgA+0W6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eL2s3rhp; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eL2s3rhp"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb76c9deeso551551cf.1
        for <dmaengine@vger.kernel.org>; Fri, 11 Sep 2026 15:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789164193; x=1789768993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MTvNlTXK/FgGXX/0xQqG6bODFlBi/r6tMJBj+Ky/4Vg=;
        b=eL2s3rhpXd6spDadpLnD2BEBtWtWqmLRsPuCyumKZeywr0NjlMKZg/CpxVEQorOcsZ
         x585IwITnVUGgMdRnUJUuh43brhIQMci6bLiY9bGpXLxzQqjZEemInvqXZeqX88tEzUw
         NguKhOxw0t/dUn7c6OrB6Dvh3onKdNsq7RlWaiRAR9Hdn9QoiENpR6vK8U4Wv2v/Rnvf
         sW1kZW76sjAJv2yzcaem6d1kv4cuvtqKBmKr8XK9kaLmmoDKD/8xifZToAU4GHlPrPkc
         M6OF8J/dOsjQx62v4HsSM7fvUgx3uk3mH8uBKNUrellIJwgmi8wDhs4ytMx8KMo/Hr2l
         9Fbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789164193; x=1789768993;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MTvNlTXK/FgGXX/0xQqG6bODFlBi/r6tMJBj+Ky/4Vg=;
        b=FghDX+XdHJYANOIH5HpG1+JBNcyOuL4/fzWeNzUTiATmVgOyFg2jbk725K2ov+0/UW
         8Z//+w0tnLcfLY+ukU7UnzzgrDW48pgvc7HrAPsVMT0xjOF02MjCS/zMl+MNJMJjMEq2
         OKS3bDhyjclqWs+mNfEAR9aY/WVC286kT6yNlX9KzQdnVu5+JpVmZ5Na8aAMT3aOXCYX
         btE6ByhHopHocs/SKt6oilSoHFqZSiD+zMna6x/w9UnT5xpiZaipsALgbz4ef6+780SM
         fkD/BEWRPp1bBDsgQmxYMYSoshQOm/2QGUDcp/A3Prj+8RdycaxAVPBmc6dNT4HrRpHi
         LKqQ==
X-Gm-Message-State: AFuF++nthToahZICnRlVpbr0JO1Tk0/riqK2/vhrfrO6Ievo76k9wpco
	297ytPeo3NVa1vKQdeg+YIVkUzaS79OZIOjMO8STHAmRTXqPgDVai2uHzhfVHw==
X-Gm-Gg: AYBFou2dGkXoqVkiznlXelVz+aTbTjpqMiL22hMFjoTW+XQ4Y9cl2E6qsIGA+cTI3z2
	k0qAkRNXJL9uzEkkjwmoewn0We/mYn+ZosheJ095qWZ8M6XNr6FAsPI8XcbCL94MVkdSemMzbWR
	aBPKFlRxM0VjuFn9zl/IWJ+ax7+Eo/INUD4QgD8na8DEbOfv0iEn85vOIk4Z7qWE+VPu+nWu4RH
	JwhHnRMse7gf8i6PxIAiH+maFXzY+oz6JDDFUQYfLPDbmxFCN1GCJsLwgoqYGaWsxyzRQJtFwui
	TPcy5KscVxgYH3dwlX2x5FiY87aWQr9uUKEIqDE/sFPbI/FxKODy9sUWdW+ElV/W4gMteiLz+Vx
	wVJWfZqm9GTOAveYACNZx2Qhlru6hsmqzonkmvdlNMvBZ1pxSrQaM1tf+0qxW+DyX3IHu69HrZ/
	YQIH20pW/B9lQhywJ4BTpy4w9u+jbOmKcufi5fzl8GoTnHO0oRxHED3CZHIO1+x1Rz7t4/DB2rB
	iRPM5SRUbaofVgXoUTujcVpP6lS/7u/a9w1eW2RJ4yHfXHU+LkoRxfLldKgOCnrwQ8g4axLS+QK
	hA2N6hS0ksnlpXRbGO/R3hovs4iJlwDkPGMtdos3savWB3n+
X-Received: by 2002:ac8:570e:0:b0:530:b2e1:2f3d with SMTP id d75a77b69052e-530e81fc928mr1035211cf.52.1789164192682;
        Fri, 11 Sep 2026 15:03:12 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ca498d52sm30368671cf.15.2026.09.11.15.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:03:11 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] dmaengine: ppc4xx: change to %zu format specifiers for size_t arguments
Date: Fri, 11 Sep 2026 15:03:08 -0700
Message-ID: <20260911220308.176962-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several dev_err, dev_dbg, pr_debug, and printk calls use %d or %u
format specifiers for size_t arguments (len, pool_size).  Fix them
to use %zu to avoid warnings on 64-bit builds.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: fix subject
 drivers/dma/ppc4xx/adma.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/ppc4xx/adma.c b/drivers/dma/ppc4xx/adma.c
index 1bdc781efbb5..39498779e241 100644
--- a/drivers/dma/ppc4xx/adma.c
+++ b/drivers/dma/ppc4xx/adma.c
@@ -799,7 +799,7 @@ static int ppc440spe_chan_xor_slot_count(size_t len, int src_cnt,
 	if (likely(len <= PPC440SPE_ADMA_XOR_MAX_BYTE_COUNT))
 		return slot_cnt;
 
-	printk(KERN_ERR "%s: len %d > max %d !!\n",
+	printk(KERN_ERR "%s: len %zu > max %d !!\n",
 		__func__, len, PPC440SPE_ADMA_XOR_MAX_BYTE_COUNT);
 	BUG();
 	return slot_cnt;
@@ -1989,7 +1989,7 @@ static struct dma_async_tx_descriptor *ppc440spe_adma_prep_dma_memcpy(
 	spin_lock_bh(&ppc440spe_chan->lock);
 
 	dev_dbg(ppc440spe_chan->device->common.dev,
-		"ppc440spe adma%d: %s len: %u int_en %d\n",
+		"ppc440spe adma%d: %s len: %zu int_en %d\n",
 		ppc440spe_chan->device->id, __func__, len,
 		flags & DMA_PREP_INTERRUPT ? 1 : 0);
 	slot_cnt = slots_per_op = 1;
@@ -2030,7 +2030,7 @@ static struct dma_async_tx_descriptor *ppc440spe_adma_prep_dma_xor(
 	BUG_ON(len > PPC440SPE_ADMA_XOR_MAX_BYTE_COUNT);
 
 	dev_dbg(ppc440spe_chan->device->common.dev,
-		"ppc440spe adma%d: %s src_cnt: %d len: %u int_en: %d\n",
+		"ppc440spe adma%d: %s src_cnt: %d len: %zu int_en: %d\n",
 		ppc440spe_chan->device->id, __func__, src_cnt, len,
 		flags & DMA_PREP_INTERRUPT ? 1 : 0);
 
@@ -2279,7 +2279,7 @@ static struct ppc440spe_adma_desc_slot *ppc440spe_dma01_prep_pq(
 	unsigned long op = 0;
 	unsigned char mult = 1;
 
-	pr_debug("%s: dst_cnt %d, src_cnt %d, len %d\n",
+	pr_debug("%s: dst_cnt %d, src_cnt %d, len %zu\n",
 		 __func__, dst_cnt, src_cnt, len);
 	/*  select operations WXOR/RXOR depending on the
 	 * source addresses of operators and the number
@@ -2553,7 +2553,7 @@ static struct dma_async_tx_descriptor *ppc440spe_adma_prep_dma_pq(
 	BUG_ON(!dst_cnt);
 
 	dev_dbg(ppc440spe_chan->device->common.dev,
-		"ppc440spe adma%d: %s src_cnt: %d len: %u int_en: %d\n",
+		"ppc440spe adma%d: %s src_cnt: %d len: %zu int_en: %d\n",
 		ppc440spe_chan->device->id, __func__, src_cnt, len,
 		flags & DMA_PREP_INTERRUPT ? 1 : 0);
 
@@ -4071,7 +4071,7 @@ static int ppc440spe_adma_probe(struct platform_device *ofdev)
 					adev->pool_size, &adev->dma_desc_pool,
 					GFP_KERNEL);
 	if (adev->dma_desc_pool_virt == NULL) {
-		dev_err(&ofdev->dev, "failed to allocate %d bytes of coherent "
+		dev_err(&ofdev->dev, "failed to allocate %zu bytes of coherent "
 			"memory for hardware descriptors\n",
 			adev->pool_size);
 		initcode = PPC_ADMA_INIT_COHERENT;
-- 
2.55.0

