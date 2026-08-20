Received: from mail-pj2-f6.google.com (mail-pj2-f6.google.com [74.125.227.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F64F3D1CAA
	for <dmaengine@vger.kernel.org>; Thu, 20 Aug 2026 07:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787212418; cv=none; b=WPBNybhdgluaMRADbmh9hzWWhbARvxBa0iomEJFt5a074T9cPc070g2FBF3lsVtOKyOX599flWGydbBn91MsXMSw1QHhedUyx9NRFe56av6YdO9PBtVBSznP4vspZdVYoHW+PaqEgH36dg0Q8yQEPbBKgyu+bT0Z/bmwBhJex34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787212418; c=relaxed/simple;
	bh=ITNfmmkH+y84MA9ezBK2LBPO9Ic0kUpKZBh66JEsozA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sAmUeU4C7X3I0BHOatez7boyQ5vor0GcpZM0/b9g16cZn9ghj5zvWiTMGSGr3t9mSf0qsSaHZM4Xf0S4QN0Ou7Sxih1ex6nkK/g8LITUwQtQZ0rVTqpUlcnPLFVi804sVh8k9xcay4Z++n45FRuiPMyVXxqGRbp1ZGKBgRVLKMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jW6+tnwo; arc=none smtp.client-ip=74.125.227.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jW6+tnwo"
Received: by mail-pj2-f6.google.com with SMTP id 98e67ed59e1d1-38f25802c19so384149a91.1
        for <dmaengine@vger.kernel.org>; Thu, 20 Aug 2026 00:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787212416; x=1787817216; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=L0UiEZlrtwMZFwrgYQ8WXdEOtHVrNhps0KaGb7MAtnk=;
        b=jW6+tnwoBUXNjw9eLsgJI+TjW1F5UccQXGwmqfO10ipNegBNa+AhA/CUKgCZ2CB5lQ
         iLSvfgl7dC6rgpskbf97n46u2dfEputpvtrRIHiNR+pZIPVx63+w9RNoQxPhOb+lQpjH
         TGy2zNy3LPeRyHytMLAZ7y5jJC7gJ6j1000SBO78R+lzXNV0LEm9RiCwCA/js0DgUXvG
         J7YMHI5tXr2yBuCfi8BFWygJOjm8NW4zE2wFvHGliRifKPMkdS015ZFx26ehaBO13SFf
         J+jj+5bnIYI5nrnyHT47pQiMQcvM0kqOxqbIRaVlG0AlNSuzrORRgnKvRIY1hg1GkyMI
         ffDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787212416; x=1787817216;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L0UiEZlrtwMZFwrgYQ8WXdEOtHVrNhps0KaGb7MAtnk=;
        b=TGS3j1GEJK7O0bdkFDeaEiHMcyRtWWKAb+Pj2I6blXX9m0FiBrCykIVesI1bfBrD/4
         wzScNp3Ht88IBOg1IU3WHft8iJXrChUVWeeFKs3vPcCtv911lF6d9Azdd/ucK1CQjyjq
         Lyw9yZqH+o6X/IbmiDujX2I8I/hDv5GWwdlLc4zJtfReq9WC4Owbqbu/waEM6hH3e/SM
         nf5HgH3rRFu+oHKgR+Pr9+yZXEaf6Sk55u/ayheEeegPBUa2H3GwwZMHpv5/NbfDzeGX
         OU0nr3xtNB6nz9Q7HuTAJhWJN7WFsou/frxb0rDbEgWSVR4uRt0R8uE7tngyQbF+Wlrg
         8v6w==
X-Forwarded-Encrypted: i=1; AHgh+RpX0/LY4mXH2KNW9GcQGI7DJOAW6x61g0lcaG+1goCCo9Uu/UR3EyU4JZqsxSj35MM9/pKZEIHUys8=@vger.kernel.org
X-Gm-Message-State: AFuF++njw8xt0tUx2uRMIJELaAnGahB29nFM4ZR46Wi3eMzo48ay+40L
	np0bs7PjJDQGv5sBi+QhQm+9w8wn5U/j9oDPyEMlsILWxDBg9/2SMcY=
X-Gm-Gg: AR+sD12/cq8dH2z+QqR8bgHo4CDBInu3HfNIywl06MxfFB9k6pozamheW7OYOLxT43j
	W2yZKeTJaMMV4GZUBzy1KVNRoqSVNpQMELS5QVHGuMk8ds7Lm6/Kf0cjUFpnf5VY2A3K5crKpx+
	bMKzJLvvllioWqPFA00t8lXat6gUHBkw2udENBBrRnt3Rzuty/U9BHWMJYf7zzzLckeHdRg/31Z
	Ujzx0f6VyohpIMhyREgvCD0Y45PnNrqBP6UdCqaUV1kuUXkuz3a8h1ZnftOztZsC6yz89QdMq7m
	xpr8rM0l2r8MdWrT1Nv0I7iAFz85k+VsPk3ZWx8t4cSCMe6Abp0KDTiShCkVO2ZWGS11LOXL3S0
	mDBwoi/OEip1VZw+5laA7LBZ2Wb/ZuI0JXL4GYW5bDEOIxORZYix9FBydphawJUlDIxJ27bDIAm
	I9taUWxFEr73Vhz3yh8O7eaJH1yaBKk719S+FqnrbBm++8tWbPOE8jvQToT17lCXjcTdlsdMtSi
	1CmC5DjiJdm
X-Received: by 2002:a17:90b:4ac5:b0:38f:efed:5445 with SMTP id 98e67ed59e1d1-3958125aff5mr18440206a91.4.1787212415876;
        Thu, 20 Aug 2026 00:53:35 -0700 (PDT)
Received: from DL2XHKPB4.dl.net ([103.63.104.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fb60a2bsm6019557a91.17.2026.08.20.00.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 00:53:35 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: vkoul@kernel.org
Cc: Frank.Li@kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Triet Hoang <triet.hoang.dev@gmail.com>
Subject: [PATCH] dmaengine: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Thu, 20 Aug 2026 14:53:30 +0700
Message-ID: <20260820075330.2065377-1-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the deprecated SIMPLE_DEV_PM_OPS
to DEFINE_SIMPLE_DEV_PM_OPS and pm_sleep_ptr().

This lets us drop the __maybe_unused annotations from the suspend and
resume callbacks, and reduces kernel size in case CONFIG_PM or
CONFIG_PM_SLEEP is disabled.

Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
---
 drivers/dma/k3dma.c   | 6 ++----
 drivers/dma/pch_dma.c | 8 ++++----
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/k3dma.c b/drivers/dma/k3dma.c
index e84f197fea76..e0138f5bfd65 100644
--- a/drivers/dma/k3dma.c
+++ b/drivers/dma/k3dma.c
@@ -982,7 +982,6 @@ static void k3_dma_remove(struct platform_device *op)
 	clk_disable_unprepare(d->clk);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int k3_dma_suspend_dev(struct device *dev)
 {
 	struct k3_dma_dev *d = dev_get_drvdata(dev);
@@ -1012,14 +1011,13 @@ static int k3_dma_resume_dev(struct device *dev)
 	k3_dma_enable_dma(d, true);
 	return 0;
 }
-#endif
 
-static SIMPLE_DEV_PM_OPS(k3_dma_pmops, k3_dma_suspend_dev, k3_dma_resume_dev);
+static DEFINE_SIMPLE_DEV_PM_OPS(k3_dma_pmops, k3_dma_suspend_dev, k3_dma_resume_dev);
 
 static struct platform_driver k3_pdma_driver = {
 	.driver		= {
 		.name	= DRIVER_NAME,
-		.pm	= &k3_dma_pmops,
+		.pm	= pm_sleep_ptr(&k3_dma_pmops),
 		.of_match_table = k3_pdma_dt_ids,
 	},
 	.probe		= k3_dma_probe,
diff --git a/drivers/dma/pch_dma.c b/drivers/dma/pch_dma.c
index bf805f1024f6..e6d7c72fce3c 100644
--- a/drivers/dma/pch_dma.c
+++ b/drivers/dma/pch_dma.c
@@ -776,7 +776,7 @@ static void __maybe_unused pch_dma_restore_regs(struct pch_dma *pd)
 	}
 }
 
-static int __maybe_unused pch_dma_suspend(struct device *dev)
+static int pch_dma_suspend(struct device *dev)
 {
 	struct pch_dma *pd = dev_get_drvdata(dev);
 
@@ -786,7 +786,7 @@ static int __maybe_unused pch_dma_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused pch_dma_resume(struct device *dev)
+static int pch_dma_resume(struct device *dev)
 {
 	struct pch_dma *pd = dev_get_drvdata(dev);
 
@@ -972,14 +972,14 @@ static const struct pci_device_id pch_dma_id_table[] = {
 };
 MODULE_DEVICE_TABLE(pci, pch_dma_id_table);
 
-static SIMPLE_DEV_PM_OPS(pch_dma_pm_ops, pch_dma_suspend, pch_dma_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(pch_dma_pm_ops, pch_dma_suspend, pch_dma_resume);
 
 static struct pci_driver pch_dma_driver = {
 	.name		= DRV_NAME,
 	.id_table	= pch_dma_id_table,
 	.probe		= pch_dma_probe,
 	.remove		= pch_dma_remove,
-	.driver.pm	= &pch_dma_pm_ops,
+	.driver.pm	= pm_sleep_ptr(&pch_dma_pm_ops),
 };
 
 module_pci_driver(pch_dma_driver);
-- 
2.53.0

