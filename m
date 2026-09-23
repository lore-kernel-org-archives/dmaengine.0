Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923E93BB13A
	for <dmaengine@vger.kernel.org>; Wed, 23 Sep 2026 04:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790136534; cv=none; b=eLy+W0+H9Pm5KrojZ9+8I50/BkLIqRIp6rQbyIZpnPsU2J+dW+JzBUNJnF1biGLhL52Pm5xioV8sZzntn3Q2tpiRzc0ma0Y4YH4D20dge5s2/8lhYNaZ+Ja0Mzdd4y4JwyaegNUIdkSLn48qYH3X+MhNRYhSQcE3KQa5tZtoAws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790136534; c=relaxed/simple;
	bh=ztbtXJT8GDvreC8nZav70VVvbuRpS94hZVXtCzOGUic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xv8VewMCEcG1M2ulVtv57CKpdws7ddh7VJIxAOp05mNnAZIdMJBSpkefPp+QqtUra3DcAoFd0mi40dWfhnESaVHj3MbECjsIHTRTZ20Uj2i6KrGbsyFO8DIDifdQzkayqceMPXDqLD+aV1fbM0KdQZCuDiekdrPG5RdC470WORE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OdYnT3XU; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OdYnT3XU"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747ed6d6eso2973635ad.2
        for <dmaengine@vger.kernel.org>; Tue, 22 Sep 2026 21:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790136533; x=1790741333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XUW9zlJk8CVD2x9WwkVbdCUyIQznruNWJ5NGWNfGy5w=;
        b=OdYnT3XUA2VNfnqg8kfrbgJYkbKquz6SlPqPUfRQv4Xl795WWsY8v6/m0FxeSsemBx
         4oQ5VMgQH+Ah9/bX2wgnhA9sMGRsuQt1DcC/eIvN0f/gDe022uMnWQcr9zAe86MSZPvV
         tkhIpk4XRmjv/2V13xXJFZyOfB8TVH6qM1znvGdmYNbJ8oo8ozc5A3t0vYBhILJbBHHA
         TZ8DxPLgozjuHvR63uba+tnAX1sYLjXbJNaBTzYJb1TGKC35XB39H0L6kvapZemSu688
         Y2yceXivquZeIpRHm+PYK7IEnDmqo3gRqkPQN+g6izs6TlWPz01E9mywIFodcDaTt8aQ
         Yx+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790136533; x=1790741333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XUW9zlJk8CVD2x9WwkVbdCUyIQznruNWJ5NGWNfGy5w=;
        b=cyZJITqSWv37yUHY60LrIoGBf67t6qI6p1/J1hA0VZ5uhamuuhBXULeVpfJs+5J1qg
         uxp+MeOkm9NGW/Hub52aQLUa06bzjmd1NWMnOW0Au1EURQ/wMD7BMDraGTnorScNeCXv
         awXLoBxSJ5u+iJaVJYnr7V5IHaFErbMJhqyryly4p6Ps6m57L80mzLK4h9bPdUPvUXqt
         y5D2Tt09ktqicIKTUa+p8suhIxF0z0EBCi5S91eL8nLBUe5oMIO7C/1//0NEiyAMKHwk
         juwd2hZZLUesVSVHsEgemSigHowH6mnDTeoeLCxaL4GB/W8onaGO4LGbyrB173qbwE9d
         Wkig==
X-Forwarded-Encrypted: i=1; AKwUvBwL/TR7fPxr0j9/aRE8wFOMacdAcdyQSF7I+pMCqkVDwawqF3Do5lmcQ7jaSSPBaMGvGoM8QY2uUnw=@vger.kernel.org
X-Gm-Message-State: AFuF++kfUFheGFMKq3EtOe6GUGU2jD86aIaT51DegOk7gEOMRRMH6xq9
	SFr1+3JgIgW6k9DHJciwJeZ1xPtvXM8IAj6ILUcKDWwco2xrbUw/XQ8U
X-Gm-Gg: AYBFou2IuT7nQvoih0bkHlPOzEQ/krfzvle/1EhehM12RsEDtsZFeFGYzRx7ZElT5y9
	MwLjMh5WZKMN/fKxxGwEAlsVlDc05lY2TCCUtUu80vXwMSKs0feUQVOtsdoGBmaXcOwGVkYUJWN
	PLKdggPJjvmXzrA2AfPdq+gjBEAzCpT3oOUBvjAwmUkQ6w2oSSBSY0eB29FEaATHktoa51ffrKh
	qmlZuW8sltgdWcYzAbXvIJB3LcpjqvVyC3E7dXRgngNDObj/KKIlYXuxG3Y9MB/Pc2usZF4QaSt
	4l5L530ZkYyQTMt3XV8lh0uOHLiVQKnwAO7HhGnM6ZUE8j22CkASo1mh1HHoEeatKx8dDuzTEiy
	4UJlh+iQzzilbe3dbITevqGc/RHTgK28n0FF0kZ6wYNRQNYuybwkUqlKvQ7XnC/b5SMcykHLucc
	bx/RasLOQOuhxYyg7knmDjwk1a6vIkpfC9ExQTJGI85gCo/CFIXblZs2GZUXpR01SbwVGy9RI8p
	k+RIhmFvdsSnQxGYbMMr/BW6hispE3xZXYpsiPZs+NgDDmIOxFHixl6zhs0HtDdGJu3oCEy9VD7
	NFbgOUCid2CpGi5sCjNmENOA
X-Received: by 2002:a17:903:234e:b0:2dc:fcfc:bdeb with SMTP id d9443c01a7336-2df69d3649amr12917965ad.22.1790136532444;
        Tue, 22 Sep 2026 21:08:52 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a60c674sm3980515ad.81.2026.09.22.21.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 21:08:52 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Vignesh Raghavendra <vigneshr@ti.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>,
	Chuhong Yuan <hslester96@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/2] dmaengine: ti: edma: Fix missing pm_runtime cleanup on probe failure
Date: Wed, 23 Sep 2026 11:08:30 +0700
Message-ID: <20260923040831.10936-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923040831.10936-1-phucduc.bui@gmail.com>
References: <20260923040831.10936-1-phucduc.bui@gmail.com>
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

