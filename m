Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792520353;
	b=ekdaB1C5ptnoSHSbOKULjlI4mkikbwxJQLE5b6Pwe5AwLlfr0jGX4rIt79Z1/3vt2rFi
	 xi8eZ3QHsfSZfFLeHWvVwcAPeOKBPTUsvyExe+H+yfCGEGBvz8QI5JyPyTUaRwdW6n9Jc
	 xzJLqARiX3wqjQMFKARBy+rp1Jthynrep9ey8JEdTqvWOx3q2LYeOlGCjQw5+Gcn3MSki
	 jRRTlnsK3WgWgfIFKdRzCulI1MJVjSaGbcNeNEXP7HSeOS6/TWGvSkuq/4HuulK4LNDc0
	 4cln2S+RIUU7+2xRMuf3100DODfToHRheiP1EwCK6s1Cr+rQPbYv3OoKE5znKdJzTUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792520353;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=SnxMWKGlV+c2EqOY30MtZOJuq1yab/xpnTKd2bRgBnE=;
	b=TKkDZAMyZnw53oNAVduiv+uD8pFOnweSqctc3drPKei6AOrJzWKWC0AFYvhQvZaZWLQR
	 dwMSxzIV7HLaUOH1H0hOKQOLmfO0k/4qLRZ784avlsVJ2LvefqpvlccUwevZfQOy+y/wP
	 QmHweZrMZzcURPmk8o6pK5VaC/Ji1zeSlq+hV+zJrMavmrlEXT7L/lLTruHQ4Ta5cOWmu
	 8OkqlrwNZxK7k0NheiPmvqdBOhESvAKfHmGzEVYAO8KdAVmkuhar3WufLMj3G6o3cOwjp
	 FSjPGWT7y63yVw9OT+GqY1JR33oF6bta0zavKLEFP1joKPSh/RJoTG3gbaFXQEbr0rQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b="smDL6/rq";
	arc=none smtp.remote-ip=209.85.221.70
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3849A60A2616
	for <dmaengine@vger.kernel.org>; Tue, 20 Oct 2026 18:19:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3849A60A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=smDL6/rq
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48e0461e040so2771695f8f.0
        for <dmaengine@vger.kernel.org>; Tue, 20 Oct 2026 11:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792520351; x=1793125151; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SnxMWKGlV+c2EqOY30MtZOJuq1yab/xpnTKd2bRgBnE=;
        b=smDL6/rqfAmgtPJP+4u2OnkT2l1wG6zLmt+8uUTSaEAwtKBRBYT8eKScnaJbXThUgy
         Qcxhp7XRHSpKXJOwY8TPKSi9GA3Cs2DiIDrWObn8FReUPm3vnRRoZUA9mORZx+kyuDW0
         USjXV980X5fhyuQdlx2x+mYAzHMvwl0xU23+wqIqo7TRNJKPvFSdjdsVtPsQpe6c0NLJ
         ZhKEKWo4oem5yXvA9S+sqNERzGJiZIoXjF7iRrYEy6xdoGTBwfJxRspLeafATZX2vKp/
         dV7y2/728X8BvBqjXAWDod3v07Vl2DnSE/lxXAnlOjPRJ2ekmJSuYDtwZGL9Cz0hY6uG
         l00g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792520351; x=1793125151;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SnxMWKGlV+c2EqOY30MtZOJuq1yab/xpnTKd2bRgBnE=;
        b=IHcIm1dh865YdnqUxwgqyevweSsXNVVRlGFnzpx85iFIREdViGb2StQfKETgiAdMdQ
         K39Ql/p2j8JjVkk2ARLElxq+xrrm4oyCej9o2dWBFmLZukRC33T1d+s8iISuzI5p5tUi
         3mcWKdytRecI5HjNfBc6C5eOKczqbZwZ/x/TGKKnXnk2COlUsS4fMAZehmZVLx+mo9CO
         3j1k3E4oGNCLavoPrkfEEqMMkAhQEBd72+6pq2IMFwhrGnA8ZgRBx+uVwKf5n/SHUJza
         ajs4i84keAIo6VvHIqKiBCjGPIGpPHw3ZLiyhg3x7XXzc0d14TkxsGqVD0eqAiz6/6Sa
         isCQ==
X-Forwarded-Encrypted: i=1; AKwUvBzhsb+s+ELq9yVxBuPJG9OVSr9LeT0Pd1WYu3b17pQpZUN/qAKatHV0M3ByFYeZrk1T0AbIQVWs2Dg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/U8ObhFcqedsWKP+d5QyAHlIc5H6juPXwyVvpxzN9gpQnDuz7
	CBGaQ+Zn8R102Fhbi2mpguunzaFcf5t2PAAFPHCAfLJBkxej0Gb2mtU1meCAIEKvektSaJOEupC
	TTMkqKOyibQ1Fbg==
X-Received: from wrwl1.prod.google.com ([2002:a5d:6741:0:b0:48d:faa3:7b10])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4287:b0:48d:fdc0:65be with SMTP id ffacd0b85a97d-48e07f9fb52mr21138869f8f.38.1792520350473;
 Tue, 20 Oct 2026 11:19:10 -0700 (PDT)
Date: Tue, 20 Oct 2026 18:08:02 +0000
In-Reply-To: <20261020180804.140766-1-smostafa@google.com>
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261020180804.140766-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261020180804.140766-2-smostafa@google.com>
Subject: [PATCH 1/2] dmaengine: qcom: bam_dma: Take a PM ref at remove()
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org, 
	bartosz.golaszewski@oss.qualcomm.com, pramod.gurav@linaro.org, 
	andy.gross@linaro.org, Mostafa Saleh <smostafa@google.com>
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
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/dma/qcom/bam_dma.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index f67a93a37d48..bd583f78e0c1 100644
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
 
@@ -1428,6 +1426,9 @@ static void bam_dma_remove(struct platform_device *pdev)
 
 	tasklet_kill(&bdev->task);
 
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
+	pm_runtime_put_noidle(&pdev->dev);
 	clk_disable_unprepare(bdev->bamclk);
 }
 
-- 
2.56.0.212.g129ede20d9-goog

