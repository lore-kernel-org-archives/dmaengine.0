Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792750598;
	b=H32U0eqfwGmE8bh0F6vZ3gYxlLYqwrF97ilVPkS68B9EucLMKAiYdEL5wB4Hn/VOxywv
	 NUcOKQokXH8fJXxaBwphHl2Qq6Ku9coii8i3G0hjjMUcFodeUyS1MwjlaAFuylX9uxCL/
	 7Q2ESLVFUSYsfwXm4FtE2bSC7JCNaRYA3/Bph7Iaadedb7uee6x8HkTtsj6sccXX8esCl
	 EVJuQA6NrJn0lNGiKhUDjTVSS8lL9H0gZoo51TaVW+u4pDiSmSG1slWQc5T7/7chRXjtQ
	 rxqD7FRPBasOaqBCG5ULoa3VN7SbpF5IEEa+yg7LvYuq+2iUgJOugs+BzrRcLmew1SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792750598;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=/z+CNiWz7aa6AS1V1mN86DIGD1P9Q5f6dX5ydwPWWJ8=;
	b=kizabbR97wAO8BO4wL4MNzDvH21EvBs2X2JHEoHPgJ9ldZMIqwYLTHur5si7gb/jTUy0
	 NJUCRohVUTDLtIB9TUkUo9dFUz1kz1Dw5Z5HpAo53f9QNVg+ke28WryYKJA4vAOyQBxJP
	 dOrZTSkNHgclpGsS2vWBhD5U/IajQ+s6RKkULUCc8ayUg6XEwwxGJFJjtVKKSMC8oitjv
	 U5lITZDUF9Zoh4+6Cdn8bTqynUPwai86V5+DHO6blsK4duvq0142m7BxVzp+UOoZhBA5f
	 ZdvOteTmCKSx6zfszM4GcDUcxPPPEm5bgDIECF2W2CY2oL0198MhjvYVBlSFScXzBlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=QjncHXzV;
	arc=none smtp.remote-ip=209.85.128.72
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D3F606A31D
	for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 10:16:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8D3F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=QjncHXzV
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a009f82bedso4124715e9.0
        for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 03:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792750596; x=1793355396; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/z+CNiWz7aa6AS1V1mN86DIGD1P9Q5f6dX5ydwPWWJ8=;
        b=QjncHXzVqh8zHbTAxnjVY0N8VzXDR70plAjCDKAabNbo1hsw9DqwCx5SyR7SCwOh7e
         jVgwxcf0zmCg/w+KYUn+2gIrMf9mMTVd1qW78Oe/EuDXm2PtJ163wPwLlqsrXvQ2f0LH
         O9Ak3UiRb9qdookhCrOwSDeuiy2nSEY6ijemnARRHVgJTGj5fluPCEvwJykaVbEaNoN9
         q3cb9+BO4+rff3u1vzHAqxJNp5a0eRx2I3jA5/aHbEZjsI2TJmcqhmOuolWFj553wtRW
         qoqtZmazAWwQwVeoJ2MAcx80ifdMJ3YzmLQKYSAxVfdVpiptiOr1HfBVm995w9MsgCAH
         P5gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792750596; x=1793355396;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/z+CNiWz7aa6AS1V1mN86DIGD1P9Q5f6dX5ydwPWWJ8=;
        b=VBr8ZXaCa9TBWkIM1VDoW8xgCwuAY1Nvp3SzOF4uT++oRxGTz1NXqWs9IRfCT3Vowl
         JHh5HPFfjrxbz8+JR7+Yf/9AW/ubKRRzEZPzz6IZuYURPf0zjLNJDlcyNGuY6NMex5AY
         qhlzlukXUMQTsEAoR/by40BGiGDrkN7HGFOow7tL00McIwHuuxFUgpRRnPEC9+4KAlSc
         rGrjuN86lEkoH04iI+TjHvsVfnC+Xb4Ih2BCXzYsrP6QklzluKmfw6Lpl/wcD7S1wlOz
         eo/1Mu3nUVCIi9nxfY6vVvyRf+oE/xsBVtyTM+u+T1Rw/ryyCUYQfwYyozgehyuflKUV
         9tJw==
X-Forwarded-Encrypted: i=1; AKwUvBzu4N46sPGpk95IQ1+7TJFKzxK4cEPcC4tXOZ3d4PSeik0HvuiL2ffP2uZ5qn8aTuPShgC85QyakvM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIvr3ooz6S/gN43vTkw58/oVw1Xv7j8amEyxFTp9EKp+oQNLiyd
	WXucfyR70ZicPMoifaXBDKk2tJMfTAKrwUUC0EBgFljtVaxpuLmzSFSXi3Gs1nIZcE1roW+ZNcY
	NxK84FOHRCQApOA==
X-Received: from wmoo1.prod.google.com ([2002:a05:600d:101:b0:4a2:1396:ef32])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1909:b0:4a2:1398:dd05 with SMTP id 5b1f17b1804b1-4a21398df21mr25661445e9.16.1792750595975;
 Fri, 23 Oct 2026 03:16:35 -0700 (PDT)
Date: Fri, 23 Oct 2026 10:15:36 +0000
In-Reply-To: <20261023101536.3965344-1-smostafa@google.com>
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261023101536.3965344-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261023101536.3965344-3-smostafa@google.com>
Subject: [PATCH v2 2/2] dmaengine: qcom: bam_dma: Do not touch remote BAM in remove()
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org, 
	bartosz.golaszewski@oss.qualcomm.com, Mostafa Saleh <smostafa@google.com>, 
	Frank Li <Frank.Li@nxp.com>
Content-Type: text/plain; charset="UTF-8"

Unbinding the crypto BAM through sysfs on X1P42100 resets the board.
bam_dma_remove() clears BAM_IRQ_SRCS_MSK_EE unconditionally. For a BAM
that is controlled or powered remotely the register may not be
accessible: the clock and power of the block belong to the remote side
or to the consumer of the BAM, which is why bam_init() already avoids
every register access for such a BAM when the DT provides num-channels
and qcom,num-ees.

The write is also unnecessary. On a remotely controlled BAM the driver
only ever sets per channel bits in the EE mask, in bam_chan_init_hw(),
and bam_free_chan() clears them again. Both run on behalf of a
consumer, which keeps the block clocked while they do.

Skip the write for both kinds of remotely managed BAM, using the same
condition as bam_init().

Fixes: 5172c9eb89d4 ("dmaengine: qcom: bam_dma: add controlled-remotely dt property")
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/dma/qcom/bam_dma.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 8a1f4e5d24d1..e01f0fec1599 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -1407,8 +1407,15 @@ static void bam_dma_remove(struct platform_device *pdev)
 	dma_async_device_unregister(&bdev->common);
 
 	pm_runtime_get_sync(&pdev->dev);
-	/* mask all interrupts for this execution environment */
-	writel_relaxed(0, bam_addr(bdev, 0,  BAM_IRQ_SRCS_MSK_EE));
+
+	/*
+	 * Mask all interrupts for this execution environment. A remotely
+	 * controlled or powered BAM is left alone: it may be unclocked, and
+	 * the only bits this driver sets in its mask are the per channel
+	 * ones that bam_free_chan() cleared.
+	 */
+	if (!bdev->controlled_remotely && !bdev->powered_remotely)
+		writel_relaxed(0, bam_addr(bdev, 0,  BAM_IRQ_SRCS_MSK_EE));
 
 	free_irq(bdev->irq, bdev);
 
-- 
2.56.0.307.g5fe7bd680c-goog

