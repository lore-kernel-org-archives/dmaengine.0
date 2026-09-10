Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF0853359D
	for <dmaengine@vger.kernel.org>; Thu, 10 Sep 2026 21:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789075236; cv=none; b=m6lNjzTofnAaPMOrLO2JVSX1jUgXlTvuVo8e2qhsbTBiZxI3dWNhOpm43jd0nXUTPYntv6qID9UxxgoVSm56UV21TZTZ38u/zR+X9ou7jFx2Fn+WCqOU25dnL8c3J2BiykFPnXdGFx3Wy29vz70rLoK7lejHqy6wcz4Gv3VKx4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789075236; c=relaxed/simple;
	bh=dIpPv2LDgNjkqLCjQTco+SsfikFQw6to+dKf+3PmTkw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NGRmb0yk2Bx5ZGSOJnEXTWH23EWkvJukzzWkVaJCzJN3yaN4xoSb0anOGm0WeCeDpNeS8gC4MMIsgh9pB32S2KMgi6EyN3LoEjpKwnTND/EHNLthkCwsvG1hNFhg/GiT1lwJr8t4jOtNFGRBQadsemZC5avEO5u+xSUSyYzhscw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jUuk10hi; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jUuk10hi"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-853f8c34ba4so225408b3a.0
        for <dmaengine@vger.kernel.org>; Thu, 10 Sep 2026 14:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789075221; x=1789680021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WcaRkjFLJlQ6IrC07cf6523DmJ46vlkl5Xth5RPErjY=;
        b=jUuk10hi71DWKjBkJdBjHpbLkA31mE9n5trbOgwLTS1RcmudiPnAn8CF6wX7kcHThC
         SThez5aXJEixt2F12BScnEfiDzaHtHH60mKSQ8HgbprKZ6xGxBeSMxrMetpvQFk8Bpfu
         GTAZVzaUDu/6aeOIA/X1lwNKwctlwvJyZ7gBHcn48OO5aaiHB0ELOaj3TiFYS37fe4R7
         FIaJMhOPT1yAmq0T+r0qzYWnEjIY0sg3CPr+2YzRPE49fdCKdn7nhS8E9GplcoYPa/eZ
         uiaZCm3yW6lb51U6pcxA47wsCPw0wjFOwf7usSVPx1A2viVmgF5i2usbACQnQzoteyuT
         YeLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789075221; x=1789680021;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WcaRkjFLJlQ6IrC07cf6523DmJ46vlkl5Xth5RPErjY=;
        b=YrzkCG8BOoeDxf5Ig5ifRvyUUsr3VWYYW1vIu+0jwCf1nyGqZaHZsevkVIF6GENNe1
         z+KlZRspJ7f1l066mM9vI6SZ/LQ482kl9tQZGYs03/jaIpszX5/qxbsdfgTlvvowrnSJ
         AbUQWUs6f8cVDVKW5mocV6nZkBJVg1+YZVNh8daPmHHH+poxrt6cU+nHbm6N2igod/XD
         ZY8LMblOrti91UaKa8LcHAJT94CMqy5W3Ic3dfqcCjyG41Myo6RiLZs9YF+EoxAnqhPY
         YsV+raoswpcTJkYYw8Scxor/mUqTguMBF6O688/Rhiu/iPjA+8slDQbPY/Ic0XhI0/uk
         7E/A==
X-Gm-Message-State: AFuF++kN/gOg2xFf7604ryRWfFnXoUIi6pFRZdHju0etBisfSfXtDXqf
	0FhAxC2ZwMg6p5SF9wPFnPnVjKSTKipMZKfiJO0hC2uZ3nusuAR0LHRyx6XJxA==
X-Gm-Gg: AYBFou1G7FA+hEDeFQnZ0dz6CskmQJ7ugmIaCC8fvm4HXmoSIhceSGqb76Uiz0rNk3O
	WANXymal7PRsz8Kr1rhKS9L3pL3PGbEdMiXgSleYAu0MGw1q9G3+GuEOMai7AfJpaTZFQ/eEuFg
	gMnAkDU3Df+VMKjv6wzJDk0yvM3bTXhEsweaKJ6z82oDpQoPAk3w5z2oXU1BLZV68G3goNs/jD3
	an2+nnkKHlTIe4V5S9hYfQSsYw/wt48qBHMhEXOXko9uGp84wKnEYSACNZmf+jwf+7cSRs/mgiv
	BNRvSbKiE/Q9WJqB1bvJgHBKS8+LOLySwtDYLh5/NvOOVTbN1f7+g1hNcrQrm3DHRxaGcGNxeCJ
	0e5fUclRwymtSuJ923r1AbEZtXuHSic5hh5dK+sm2smELTr6ugloL2QPtjaIbftb2sOadJ8UdT/
	kjDBU086KOCZQJF3HJbJoRC53TwqZdQuv2h7ZyDZHsi0in0Qq+GdjZRqNrcB+6wR61tzcVYYqRU
	WXEIHKKxSmjZVap+r/jR0dyYDze6TG8+Rc86QI8sNurPVetxKBfgT9hlUg40dMe/EE7DwchfSd8
	GFpanOsnCkiO+RnmiEUElbo1dQ9ec02hNPKkpK6ZnZsVHoxd
X-Received: by 2002:a05:6a00:348f:b0:84e:7ec:aa42 with SMTP id d2e1a72fcca58-86b30122689mr1431259b3a.10.1789075220699;
        Thu, 10 Sep 2026 14:20:20 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b2a3c2ce7sm138814b3a.56.2026.09.10.14.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 14:20:20 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] dmaengine: ppc4xx: use devm_platform_ioremap_resource()
Date: Thu, 10 Sep 2026 14:20:18 -0700
Message-ID: <20260910212018.67728-1-rosenp@gmail.com>
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
ioremap, and lets the devm framework handle automatic release on probe
failure or device removal.

The two separate initcodes PPC_ADMA_INIT_MEMRES and PPC_ADMA_INIT_MEMREG
are collapsed into PPC_ADMA_INIT_MEMRES since the combined call covers
both steps.

Also emove unused PPC_ADMA_INIT_MEMREG enum value

The PPC_ADMA_INIT_MEMREG error code is no longer used after converting
to devm_platform_ioremap_resource().  Remove it from the enum and the
corresponding error string.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/ppc4xx/adma.c | 46 +++++----------------------------------
 1 file changed, 6 insertions(+), 40 deletions(-)

diff --git a/drivers/dma/ppc4xx/adma.c b/drivers/dma/ppc4xx/adma.c
index bcc54d584e2b..9decdd04a51e 100644
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
@@ -4003,7 +4001,6 @@ static void ppc440spe_adma_release_irqs(struct ppc440spe_adma_device *adev,
 static int ppc440spe_adma_probe(struct platform_device *ofdev)
 {
 	struct device_node *np = ofdev->dev.of_node;
-	struct resource res;
 	struct ppc440spe_adma_device *adev;
 	struct ppc440spe_adma_chan *chan;
 	struct ppc_dma_chan_ref *ref, *_ref;
@@ -4046,28 +4043,12 @@ static int ppc440spe_adma_probe(struct platform_device *ofdev)
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
@@ -4087,10 +4068,10 @@ static int ppc440spe_adma_probe(struct platform_device *ofdev)
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
 
@@ -4127,7 +4108,7 @@ static int ppc440spe_adma_probe(struct platform_device *ofdev)
 	if (!chan) {
 		initcode = PPC_ADMA_INIT_CHANNEL;
 		ret = -ENOMEM;
-		goto err_chan_alloc;
+		goto err_regs_alloc;
 	}
 
 	spin_lock_init(&chan->lock);
@@ -4206,19 +4187,12 @@ static int ppc440spe_adma_probe(struct platform_device *ofdev)
 	}
 err_page_alloc:
 	kfree(chan);
-err_chan_alloc:
-	if (adev->id == PPC440SPE_XOR_ID)
-		iounmap(adev->xor_reg);
-	else
-		iounmap(adev->dma_reg);
 err_regs_alloc:
 	dma_free_coherent(adev->dev, adev->pool_size,
 			  adev->dma_desc_pool_virt,
 			  adev->dma_desc_pool);
 err_dma_alloc:
 	kfree(adev);
-err_adev_alloc:
-	release_mem_region(res.start, resource_size(&res));
 out:
 	if (id < PPC440SPE_ADMA_ENGINES_NUM)
 		ppc440spe_adma_devices[id] = initcode;
@@ -4232,8 +4206,6 @@ static int ppc440spe_adma_probe(struct platform_device *ofdev)
 static void ppc440spe_adma_remove(struct platform_device *ofdev)
 {
 	struct ppc440spe_adma_device *adev = platform_get_drvdata(ofdev);
-	struct device_node *np = ofdev->dev.of_node;
-	struct resource res;
 	struct dma_chan *chan, *_chan;
 	struct ppc_dma_chan_ref *ref, *_ref;
 	struct ppc440spe_adma_chan *ppc440spe_chan;
@@ -4270,12 +4242,6 @@ static void ppc440spe_adma_remove(struct platform_device *ofdev)
 
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

