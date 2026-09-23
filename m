Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38955446BFC
	for <dmaengine@vger.kernel.org>; Wed, 23 Sep 2026 07:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790148353; cv=none; b=iJNvq4M7r2ruS82q6m5rZfxHEWu3hptCHV0BFmMO+62m5dh8YLqA/IRF4EPWA7MfTT8WEAeeWdjqjNuRjDcFb47eKRE/nS4mPKAqTG6DKKSLYxpcHsaFVZU/CCgV7GNtnJmXeivEJbgjwaUWlXaRswzFZeDG+saIQUoVFeoqs7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790148353; c=relaxed/simple;
	bh=ztbtXJT8GDvreC8nZav70VVvbuRpS94hZVXtCzOGUic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qVSqCU7qsS3rLICFObWYNOuaN96uednhG/vRAmHaFoQlOcvQA+M42AoiCBKK7AOZl/IclaDxI4KchfwZ2w96DAbQntbAUP/FPjm2a7zLQIO7qJDI8LY4WeYA9GxVV4kUNo7FqBcXLfif8TastpRic9gGdke7mBqLl15ljvNsY0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FhogjmTH; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FhogjmTH"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-39dacf053eeso343875a91.2
        for <dmaengine@vger.kernel.org>; Wed, 23 Sep 2026 00:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790148351; x=1790753151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XUW9zlJk8CVD2x9WwkVbdCUyIQznruNWJ5NGWNfGy5w=;
        b=FhogjmTHx9RHhH0FAsb7BiPa6MoWguDcfE1b5Eumg8YLBiF10p9/jYCoc6DYTAD5W0
         DyUhuzacC8lElU7zU1xOkxF+Y5HIFBZ2YxHHHs2a0vpkx+dfwoobfQhOv+AEwo5i7DZd
         lS1JOfslD+fFOHGUAOrkzm8qoYxr5qtWqoWcy5hEvi/JhMy2XecoOfT7hCOqSAjWAIN+
         PfntDq2MUcpthsjElUn4N9i+LA2F7c4utv5rfcOdyBo0S53Do8AJV6uZgaRglHTGk6+w
         QT0WTnuChEP/1Nwo20mEzGoM6yIVM01wP48P2JzaiCzLh0/nbmOSyVTWl5MYlbNntpZe
         LWgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790148351; x=1790753151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XUW9zlJk8CVD2x9WwkVbdCUyIQznruNWJ5NGWNfGy5w=;
        b=PNWzPXrxB0ekllUC4jke5dUgx04nu+DoM/oZOBuKFoK5dTgPQSKaO17zLO1ufdjZE9
         FlTlHN+pe7jrQSa24fvrHa64JBIQr2VPBypplcsmSCnoXV6VeLZ9cpN/+zwMrx8ZFwor
         9ZLYFDIhhHXbt39NLBC90L+p5gXrprUkjKqzNSWd4KT1/VB3FksY6rYJz3D8GHzUKuRa
         Z7mUv7B80v59tpUnhXuhxD/QpgeDJnxqp+vV6WO70wLYW+EykJz4/WGo/jVGon5BGecY
         n+fM4mc4gVh8MBMmtQf23VcxF9APYbjOupgdVhY8Y9mQYch5GSHdDwp6IorLVOzazDAo
         NblQ==
X-Forwarded-Encrypted: i=1; AKwUvBwPR7J+wseCx/MVM2ABnojR7nmurIEx86MSg2hQw4KHX1J81tlFWAG+2OiSHn0D/D/931qQ9UGMKpw=@vger.kernel.org
X-Gm-Message-State: AFuF++l5n8adhwhOlKbyM80HoQ7Ivrm3p3dwXDwqv6c5o7wXR/cWvb1N
	UjN5AqzRfJs1kzyNo8mSMz+8o883Q5K4Hhbdyx2QOXWQiQPNO7c7elV4
X-Gm-Gg: AYBFou371oDFFGyOe4T+AevsyWCBUV5Kikc0vkrxFqqS5hzuJb9Ra+FycWKPgn8eiMf
	8+9VUYGlq0cvRY7AAFJ3bwBg+8iqfqVVs86/4rLTVCxW0X5ayg2hB4ya0uESd/Ut+hdYJBwvnoa
	+ZFVeucsV9OZZOau0g2ccM8tCU+1iptGKUkoVA4dcv5NjyCPChg/aI4rjcu1r1w/8n861Knea4N
	MuDa/bvoM/DVvR0jaoeHOs4NMAL9YF2+gpLkXTVRill4DT3rTclLB/YkXsLddNWir/KQtyQ4yiW
	I0yQ1vMFP8o/PeWpvgI4uzlLkKq14DN6/mo41mRubay2AjsQA/D35HwZ7ePVfZYEVwvlRBZwRm0
	M+V2KkkNl7259b+Qdxk7O2o7pzJl4ynd/YomxkBfZmSePz7DhPX3Kvs82ve1j3wE7uXEZWeQPXp
	wYYEjfwkLiHFS0Et+blnilJUPdRinK1GncOkE//FA0vgGrxWDtQevxne0SmRVzUgmR9iWhnRYJR
	hwjNDG2Zw3bozb9KXGN7M9mSzorpPph9GNjHKmH6YMv+MUaXs7SWPhw0LGbT/a2CApXzJODa2NJ
	Y0gOijzrAcvB1g==
X-Received: by 2002:a17:90b:270e:b0:39e:6a7e:ee20 with SMTP id 98e67ed59e1d1-3a07e659a2dmr1634764a91.44.1790148351423;
        Wed, 23 Sep 2026 00:25:51 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07db88298sm3940945a91.4.2026.09.23.00.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 00:25:51 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Vignesh Raghavendra <vigneshr@ti.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>,
	Chuhong Yuan <hslester96@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 2/2] dmaengine: ti: edma: Fix missing pm_runtime cleanup on probe failure
Date: Wed, 23 Sep 2026 14:25:32 +0700
Message-ID: <20260923072532.19307-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923072532.19307-1-phucduc.bui@gmail.com>
References: <20260923072532.19307-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

pm_runtime_get_sync() errors were not checked, so on failure the usage
count leaked and pm_runtime_enable() was never undone, leaving
runtime PM in a half-initialized state after a failed probe.

Switch to pm_runtime_resume_and_get(), which cleans up the usage count
internally on error, and call pm_runtime_disable() to balance the earlier
pm_runtime_enable() on that path.

Fixes: 23f49fd2ea9b ("dmaengine: edma: Remove dynamic TPTC power management feature")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/dma/ti/edma.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/ti/edma.c b/drivers/dma/ti/edma.c
index 8be9e71dab76..5254ce7b8514 100644
--- a/drivers/dma/ti/edma.c
+++ b/drivers/dma/ti/edma.c
@@ -2650,8 +2650,16 @@ static struct platform_driver edma_driver = {
 
 static int edma_tptc_probe(struct platform_device *pdev)
 {
+	int ret;
+
 	pm_runtime_enable(&pdev->dev);
-	return pm_runtime_get_sync(&pdev->dev);
+	ret = pm_runtime_resume_and_get(&pdev->dev);
+	if (ret < 0) {
+		pm_runtime_disable(&pdev->dev);
+		return ret;
+	}
+
+	return 0;
 }
 
 static struct platform_driver edma_tptc_driver = {
-- 
2.43.0

