Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794580162;
	b=sqJsrVceMPkQkUPdJYJ6PNSk3CIDrCDPMouKNOlF2yYzU2xJ2oRX25Zxz7s9Flgi4hFL
	 y1GSF6aD61klIeGgu6bpIKKbi10vaOFmeUcoECeVZziRPihIYYfm+TdzuXsNx2LSBh4Kc
	 4ZcrJUTcjFrQvAsvJ9/0pktqylT4DD21mm4wOVs0khFD25+9laldNedq7sv3dvcDi3nq0
	 RtQSM9DRydeTUhqVQccd/Wxd8PVmta6GaZ6pVyGnEofnvOW91Ztn9dadxOKD8zbF/mzSw
	 bl7hNTuJ1eJ0NOibENxIRxdxDncgedmCU0ZnQva03xD/oPVGmDup1g4/0Sx//K+EWYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794580162;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=+VW2a2FlpkoYri7OxarJqLZD4cdEwC1TTj8jbHlqywU=;
	b=lGvsYHYzTLe6lTkNu4aOyThgI9NexVPR8UHQ8GZ0M6TPF3Ul4UGXiP7ep9VqC19K6DS1
	 cyt0i3hfs8iuWBRi2n1hVWwaqQjSLK6fImGBZHbP36cmvdtRf+s2tetLwf/rtzuF//CP2
	 3mBL+enBsXJH20SxFagnvlBGCbHTO7nu9KKvfMm2gcxDoYU0iGp40IwZ1uDunXTti0TMZ
	 sh8v76y1SJkTpDS5HX3ENah0I2Yjw877f6kFrlq3rq9SZAYnQsNHArUCjlGOwxaTmQgEm
	 mA/NYYRZ2imdseOEMSGBsW25jRWK+OPrHGPb4mw/S+UQlZ8yQiYRyAjSwiiJfLIlMxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Tmx+zTEa;
	arc=none smtp.remote-ip=209.85.208.72
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3C0606A8AB
	for <dmaengine@vger.kernel.org>; Fri, 13 Nov 2026 14:29:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E3C0606A8AB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Tmx+zTEa
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-6a5d57a8d51so1254341a12.1
        for <dmaengine@vger.kernel.org>; Fri, 13 Nov 2026 06:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794580161; x=1795184961; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+VW2a2FlpkoYri7OxarJqLZD4cdEwC1TTj8jbHlqywU=;
        b=Tmx+zTEaQFQb/WWOUToBJl9NzU8GF5g6BUH2uB0ZfBB7h4jtcUoUg63cZqEt0V7Qf9
         EHOoedDAQHEiddwxudhCToL7PsrkmDAvjltNaslxDWBuTdLlAUVZ4ZWY6uu8wkuYyITL
         XKHX7Ew8BV8yTi5uPm/oeBYqpnkAgbud1f2pSb0+K6h7Exx7nF45JYjMT+P+BR7I20ZF
         xGMLaFOLYEThIplsGfgVzQVGUPAeNjZdCjNQdWpBewkYCFt+bRU0WQXheIkmYXQwf+t9
         ptz1dnS1isIJYOq67l3ltRBS5U14sVpeAR6K7rLzwSJeR48cpJXgWm53SgGnrplusQIs
         whxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794580161; x=1795184961;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+VW2a2FlpkoYri7OxarJqLZD4cdEwC1TTj8jbHlqywU=;
        b=EQy8E9tSiyqnp/B4QpxTZIaAbdW9tqpG9O3OKe3k07qBlCuzpJn9wa/XQrmH4tB6pM
         OYioBVUp3NdkAyYTbDkQDPwmD8rONtVr7hWVYtba6fV5KH5xXvOsYmNlpMU/qGXlpP7o
         gbL/xjc+oxvo5BmN+mO5bcgP0CKfLTCbE+nBmN6JAq6p139fZMetoAMYfqYnjcP2gfUJ
         NiX+r+eim9tQ4FvTv2CwOliZ0MUDuC6GqHWdz5/Wu3YEkcjVUIxw/37EiqdEWodTLvG9
         4e8uP8vqnf3uoVdz8dKo2BxbpQVnY4UbdLvyb+lK+oMetY56FAOs01ij+2Mbxfw7eCI8
         MivA==
X-Forwarded-Encrypted: i=1; AL+hErHQPthhJ/ywVstBD5hcsvVh0m4fcIuAmC0iFflXv3K2GgJ1rwMlXczJN2bZNHZgH0iz7ziSZY41HIo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+MwtqpItbJv61aMkUIFKW+/7KWfrtqxkgNsNBDMkVq2dLkPjaY
	8jmnO4zAL5PcGnZyleWcE8C2eWxV8ErUx7W0Z6lIKNMPMlbN/IfdK3mdPMNRom4X+/j+MpeW44B
	7ybNlSH5IKt6r5w==
X-Received: from edbbf5.prod.google.com ([2002:a05:6402:1a45:b0:6b5:5ee4:9030])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:450a:b0:6b7:6485:23cf with SMTP id 4fb4d7f45d1cf-6b7c0c71b38mr2368602a12.42.1794580160615;
 Fri, 13 Nov 2026 06:29:20 -0800 (PST)
Date: Fri, 13 Nov 2026 14:29:09 +0000
In-Reply-To: <20261113142910.3477757-1-smostafa@google.com>
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261113142910.3477757-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261113142910.3477757-2-smostafa@google.com>
Subject: [PATCH v3 1/2] dmaengine: qcom: bam_dma: Take a PM ref at remove()
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org, 
	bartosz.golaszewski@oss.qualcomm.com, Mostafa Saleh <smostafa@google.com>, 
	Frank Li <Frank.Li@nxp.com>
Content-Type: text/plain; charset="UTF-8"

bam_dma_remove() calls pm_runtime_dont_use_autosuspend() and
pm_runtime_force_suspend(), which on a BAM with its own clock disables
bam_clk, and only then writes BAM_IRQ_SRCS_MSK_EE and terminates the
channels, touching registers of a block whose clock has just been
removed, causing the board to reset.

Sashiko(Locally) also reports, it then calls clk_disable_unprepare()
on a clock that runtime suspend already disabled, which can trigger
"already disabled" warning in clk_core_disable().

Hold a runtime PM reference across the register accesses and the
channel teardown. Once the hardware is quiet, disable runtime PM with
the device still active and drop the clock exactly once, balancing the
clk_prepare_enable() in probe.

Fixes: 7d2545599f5b ("dmaengine: qcom-bam-dma: Add pm_runtime support")
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/dma/qcom/bam_dma.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index f67a93a37d48..8a1f4e5d24d1 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -1403,12 +1403,10 @@ static void bam_dma_remove(struct platform_device *pdev)
 	struct bam_device *bdev = platform_get_drvdata(pdev);
 	u32 i;
 
-	pm_runtime_dont_use_autosuspend(&pdev->dev);
-	pm_runtime_force_suspend(&pdev->dev);
-
 	of_dma_controller_free(pdev->dev.of_node);
 	dma_async_device_unregister(&bdev->common);
 
+	pm_runtime_get_sync(&pdev->dev);
 	/* mask all interrupts for this execution environment */
 	writel_relaxed(0, bam_addr(bdev, 0,  BAM_IRQ_SRCS_MSK_EE));
 
@@ -1428,6 +1426,8 @@ static void bam_dma_remove(struct platform_device *pdev)
 
 	tasklet_kill(&bdev->task);
 
+	pm_runtime_disable(&pdev->dev);
+	pm_runtime_put_noidle(&pdev->dev);
 	clk_disable_unprepare(bdev->bamclk);
 }
 
-- 
2.56.0.611.g1030f0b940-goog

