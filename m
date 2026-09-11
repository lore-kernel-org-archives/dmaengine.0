Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F914BEE25
	for <dmaengine@vger.kernel.org>; Fri, 11 Sep 2026 22:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789164404; cv=none; b=u6VrUJYQPEHslBY7gw8ovsI4AzIP4kjfln3FtI81Ph5tm9Abuwjpdjjds/NbIUhm7Q51kbMnMvp6cTnYqsLIL626kr++do1xrST+xRjVhGWjb5qojDW7SqeytsUY5LgVN8QUrPJHsS484YEzziWZA/7YesWXt+DEJnzJjvsEf5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789164404; c=relaxed/simple;
	bh=aToO4pp8C7M492LuZqiVte8e2Tu4lbhA5eT7W+4ZbNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H04NnqDXuNS66Bf2qHqMZlRAj0wrtGq/ojdpaAhQNBw4zW9/M0ycJY+OhJ/QpiU4ykOJScHB12XVtj6Q/4ubVcHxx7sv/o/Du70pQETpQkbQ3WVkYNtL+LgZG/V1vhGanH6rlZm4NAUxYbv0j34qEBi9wRugw3jDMDlstQL5CHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nPFseqjZ; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nPFseqjZ"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2db18fe433fso332375ad.2
        for <dmaengine@vger.kernel.org>; Fri, 11 Sep 2026 15:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789164402; x=1789769202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nnH05WBvR/80ATWuPrHor+2LYakQx2ATwEyMS0URpoA=;
        b=nPFseqjZsrrDLE5vdfrynjpEIjO71l9a6hWuJIOeRlENyrzsE9R1pIR//67qqX6wiv
         JwUdI49YfnuSv6UvI9GChucjNlUENcanD+RQ4CrMksuUIeP+8tHJ1IOggtsM5nTfy0k3
         YtpMH9Zf9y9WXj1EJS7mJf/Ux/Q10RipfQTPqG1osYvn8qdLeJkN/u1eG2C+btkLR2vV
         cym+92irSjuj61HbrG6QBk/rHSqRTiKXfBeCc3gL7oy8CIRTzx4MwZ8J8Q7Z9PZcksUs
         a1a0jvvQIxe2S2vQb8pniZDKrZeum0DjgjiDrRzb3PLrxfWvk0u/o3caO70fw8KdplJY
         rZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789164402; x=1789769202;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nnH05WBvR/80ATWuPrHor+2LYakQx2ATwEyMS0URpoA=;
        b=Gecs2B/OT9OobNqq6HdFIINXdbN66ys6iHMUJzm4XlhwSq5rdMQO0WXzrSOoQjnoVS
         KK20LT11spBde0TY9AeC4gSMW8x8yvFK4lYYgGIjhAap1f40CQCSkOq7aZqXlD29dE5X
         WuCKbHaP95ymHjsc8BPQsFblkYVZx5Q0xlwYOCa958m2oONSuto9ZdJLy7NVWZIpD1Xc
         xgRms58KvP7cp/Fbin5q6XoxKR2J1wt8AbYAvGJKOqgVjFJAChXKJ8Uknv5HzKr+7NZq
         h9bAcRKzeueJpcQCSxBY8qqsrBoxz9CCKDjrpOrv95AOThSH1V+L1mQSzuKpzS/ByXaC
         lkMw==
X-Gm-Message-State: AFuF++nem7jXL14JXHJKdmVnW/J6HTj6OIXtczGTojfQNPQK/XrXGjYj
	pyqAwlTQeAaL096AyJgniTQ+einr4o1DjHNBmkNnvdQ+ePQcGdsCyd86r/Tx/g==
X-Gm-Gg: AYBFou0n8Kvlu/rEbsCAtSSdGaSJ8Qaf0Fhvgn/LzPw3RhfU7THy2+f/RXDhs/ZZyrw
	Z+lhVBJdF8QbxLOjNDMES57tTd+P4PWkZeuXN8jkJdA6rgHm26/yryeprzCS9hKXwJ8i9dysoOa
	rxUeNtViFSQ5lcg3MJoOyg0slAnsRGlEaxcu17zaVyhy6dTvTf6NW0KNZoDHkwKtM2HJCuf2e+5
	vc+mTMJklPGsxQZTgLl1Y3ISXGHTrwVsfrwJZHPcHEbVsWGLDbV2jdq3+jLc466NIPcaDtnP7JV
	fzJi5uQ/il46nob0k+steTs8cbbZVIs0FYF6iM2Drm+L4aFk0Y0LQDrpOhNOidzPfD+9tkoy1sS
	Mw3g+3xDEbbbJRBERkzAt1RjXBLPdb4VxDwvh8NOagz4LoU0xVGyjCQDHKJugDyEsFFXSts+d4r
	NPyz2xSXok0iSGXugTv8bdzT3PolbVV1DzzjAQlfwGoqor9DhZkqNOR8qhRTXEB5S/Wz7iazKmh
	9OJu7bG7fl/KIoFIJOnBFp/CEVNjCR709gnwXxp/sFpGsJUarsd9OFjIi+xSTsYIMhJlb2G20vb
	vJGI6zBTJYiCGx6CFONQNcVzdSz1wOZcwPECORphCtC4bXl55w==
X-Received: by 2002:a17:90b:4b0e:b0:398:bee5:61d6 with SMTP id 98e67ed59e1d1-39dbc725258mr311632a91.24.1789164402015;
        Fri, 11 Sep 2026 15:06:42 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d9d58adb5sm2091295a91.3.2026.09.11.15.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:06:41 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] dmaengine: ppc4xx: use devm_platform_ioremap_resource()
Date: Fri, 11 Sep 2026 15:06:40 -0700
Message-ID: <20260911220640.178074-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the open-coded sequence of of_address_to_resource(),
request_mem_region(), and ioremap() with devm_platform_ioremap_resource().
This eliminates error-path cleanup for both the memory region and the
ioremap.

The two separate initcodes PPC_ADMA_INIT_MEMRES and PPC_ADMA_INIT_MEMREG
are collapsed into PPC_ADMA_INIT_MEMRES since the combined call covers
both steps.

Also emove unused PPC_ADMA_INIT_MEMREG enum value

The PPC_ADMA_INIT_MEMREG error code is no longer used after converting
to devm_platform_ioremap_resource().  Remove it from the enum and the
corresponding error string.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: cut some stuff from description
 drivers/dma/ppc4xx/adma.c | 46 +++++----------------------------------
 1 file changed, 6 insertions(+), 40 deletions(-)

diff --git a/drivers/dma/ppc4xx/adma.c b/drivers/dma/ppc4xx/adma.c
index 39498779e241..17b60704a702 100644
--- a/drivers/dma/ppc4xx/adma.c
+++ b/drivers/dma/ppc4xx/adma.c
@@ -37,7 +37,6 @@
 enum ppc_adma_init_code {
 	PPC_ADMA_INIT_OK = 0,
 	PPC_ADMA_INIT_MEMRES,
-	PPC_ADMA_INIT_MEMREG,
 	PPC_ADMA_INIT_ALLOC,
 	PPC_ADMA_INIT_COHERENT,
 	PPC_ADMA_INIT_CHANNEL,
@@ -49,7 +48,6 @@ enum ppc_adma_init_code {
 static char *ppc_adma_errors[] = {
 	[PPC_ADMA_INIT_OK] = "ok",
 	[PPC_ADMA_INIT_MEMRES] = "failed to get memory resource",
-	[PPC_ADMA_INIT_MEMREG] = "failed to request memory region",
 	[PPC_ADMA_INIT_ALLOC] = "failed to allocate memory for adev "
 				"structure",
 	[PPC_ADMA_INIT_COHERENT] = "failed to allocate coherent memory for "
@@ -3997,7 +3995,6 @@ static void ppc440spe_adma_release_irqs(struct ppc440spe_adma_device *adev,
 static int ppc440spe_adma_probe(struct platform_device *ofdev)
 {
 	struct device_node *np = ofdev->dev.of_node;
-	struct resource res;
 	struct ppc440spe_adma_device *adev;
 	struct ppc440spe_adma_chan *chan;
 	struct ppc_dma_chan_ref *ref, *_ref;
@@ -4040,28 +4037,12 @@ static int ppc440spe_adma_probe(struct platform_device *ofdev)
 		pool_size <<= 2;
 	}
 
-	if (of_address_to_resource(np, 0, &res)) {
-		dev_err(&ofdev->dev, "failed to get memory resource\n");
-		initcode = PPC_ADMA_INIT_MEMRES;
-		ret = -ENODEV;
-		goto out;
-	}
-
-	if (!request_mem_region(res.start, resource_size(&res),
-				dev_driver_string(&ofdev->dev))) {
-		dev_err(&ofdev->dev, "failed to request memory region %pR\n",
-			&res);
-		initcode = PPC_ADMA_INIT_MEMREG;
-		ret = -EBUSY;
-		goto out;
-	}
-
 	/* create a device */
 	adev = kzalloc_obj(*adev);
 	if (!adev) {
 		initcode = PPC_ADMA_INIT_ALLOC;
 		ret = -ENOMEM;
-		goto err_adev_alloc;
+		goto out;
 	}
 
 	adev->id = id;
@@ -4081,10 +4062,10 @@ static int ppc440spe_adma_probe(struct platform_device *ofdev)
 	dev_dbg(&ofdev->dev, "allocated descriptor pool virt 0x%p phys 0x%llx\n",
 		adev->dma_desc_pool_virt, (u64)adev->dma_desc_pool);
 
-	regs = ioremap(res.start, resource_size(&res));
-	if (!regs) {
-		dev_err(&ofdev->dev, "failed to ioremap regs!\n");
-		ret = -ENOMEM;
+	regs = devm_platform_ioremap_resource(ofdev, 0);
+	if (IS_ERR(regs)) {
+		ret = PTR_ERR(regs);
+		initcode = PPC_ADMA_INIT_MEMRES;
 		goto err_regs_alloc;
 	}
 
@@ -4121,7 +4102,7 @@ static int ppc440spe_adma_probe(struct platform_device *ofdev)
 	if (!chan) {
 		initcode = PPC_ADMA_INIT_CHANNEL;
 		ret = -ENOMEM;
-		goto err_chan_alloc;
+		goto err_regs_alloc;
 	}
 
 	spin_lock_init(&chan->lock);
@@ -4214,19 +4195,12 @@ static int ppc440spe_adma_probe(struct platform_device *ofdev)
 	}
 err_page_alloc:
 	kfree(chan);
-err_chan_alloc:
-	if (adev->id == PPC440SPE_XOR_ID)
-		iounmap(adev->xor_reg);
-	else
-		iounmap(adev->dma_reg);
 err_regs_alloc:
 	dma_free_coherent(&ofdev->dev, adev->pool_size,
 			  adev->dma_desc_pool_virt,
 			  adev->dma_desc_pool);
 err_dma_alloc:
 	kfree(adev);
-err_adev_alloc:
-	release_mem_region(res.start, resource_size(&res));
 out:
 	if (id < PPC440SPE_ADMA_ENGINES_NUM)
 		ppc440spe_adma_devices[id] = initcode;
@@ -4240,8 +4214,6 @@ static int ppc440spe_adma_probe(struct platform_device *ofdev)
 static void ppc440spe_adma_remove(struct platform_device *ofdev)
 {
 	struct ppc440spe_adma_device *adev = platform_get_drvdata(ofdev);
-	struct device_node *np = ofdev->dev.of_node;
-	struct resource res;
 	struct dma_chan *chan, *_chan;
 	struct ppc_dma_chan_ref *ref, *_ref;
 	struct ppc440spe_adma_chan *ppc440spe_chan;
@@ -4278,12 +4250,6 @@ static void ppc440spe_adma_remove(struct platform_device *ofdev)
 
 	dma_free_coherent(adev->dev, adev->pool_size,
 			  adev->dma_desc_pool_virt, adev->dma_desc_pool);
-	if (adev->id == PPC440SPE_XOR_ID)
-		iounmap(adev->xor_reg);
-	else
-		iounmap(adev->dma_reg);
-	of_address_to_resource(np, 0, &res);
-	release_mem_region(res.start, resource_size(&res));
 	kfree(adev);
 }
 
-- 
2.55.0

