Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7B73368B0
	for <dmaengine@vger.kernel.org>; Thu, 10 Sep 2026 20:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789073189; cv=none; b=YRWyw8N/0gUd6lonNZnaGAbb0DP23HPb0enmaW0lwdRTzSW5toks/gmm3SEvyRknmNQhNGrf6Hg2g/GMV1NmxINMg8UVbK+eLuoN0W+Ag3OAGXbfCiokzduAbPpEY6uHhB9tOqPhDKUNJuAiJ4u2cDb4XDEersybF5Wn/bw2yxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789073189; c=relaxed/simple;
	bh=lzV2GCpFj14QmF4NRzZkeUqmBn932QHppgumDndrz2c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NFO+HD4flTXG7kqAkd8D6X/Fq+64O2T+dBMCbG9lnJ284MLe0XRTJg3CP9O2Mv0zswrXw56zd211SuBoez5cTVESsgAsou6Uce/pR4/ZoA1vbX9JqiPmUTJenjhj5KETUVrliCNHTQubfjGe6hGIaMXa0hyB3D39VI6hBWIj8IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ipMIb5l0; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ipMIb5l0"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so194730a91.0
        for <dmaengine@vger.kernel.org>; Thu, 10 Sep 2026 13:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789073187; x=1789677987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D5NzLm00d+6PWFDYExUVxG0yq7opmcUTWEJmvWiRjsQ=;
        b=ipMIb5l0LpDsQuqpIWaa0fSGg4advAEpuKKdE1y+kM3+XK8t9NZEWxxDlMLIuXjr8Q
         0dEOJIIPlB2oYpbUgVxfIKiNEQyb0VoHlXFDZfTp8M7AgJy5l2OcS7yPU/e98XgUxQUl
         lusMFWIJDvnaGRIaY8v/twEDUZYDXj4WS0SwltSIflbO+D3P6gPNC1EM3L/3z1qZkcZx
         eogRNyUN6zYOU4Hgs2X1Mpc7twuMHWlKIQSmv/+mHZ9aeSBOEj1CB9vvQZ7opYp0HlII
         7Xgzzkai+lqPmT0JwTZq5C/O0Bbbr/M+Ws7o0gLBZ9GiTY+wgka+GB+4CwHe/oOxgu3r
         Xckw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789073187; x=1789677987;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D5NzLm00d+6PWFDYExUVxG0yq7opmcUTWEJmvWiRjsQ=;
        b=I0A7fye0pO+nbY9Y4KNMnW3AX2UUXCjd7oKJN6KfMlSClaG5PlnOn1b/xqYCaCoWoh
         zgpbGhFowAfVb5wuUn+Duus/6vWmZCMhhc7e13A1UU4oQHorTRsIBHz7ESJg9ckDJ6di
         v0E+SxkXwY01fkAHQy7AwEXZ8tCFqnXnS+Uxp8rPjNe6rsoBI4ZcMpKuTENEx8kOphd7
         CriZp/hBCIgoUx1KHRFPWiMjssTsVmVNXwDMQFZulKe+epeSMyNQ5bhLlLWOzHSLXEkL
         DHKrTFENbSSOF4bwLKkLRdrapo27TT1wbol4g0WM+WPmTbMbTeemUujDMIXxQKY3544W
         hQJg==
X-Gm-Message-State: AFuF++mLwmc+jm/v7bZwYCRCBlCk+AjYB+F8a8p+58IgPls5WOP2nTtr
	0ICAC/o/24+pkOVEVCDQiSXKMpynjgls8mkyrWvHRIK6ih6gA9GpjlFPHLANvA==
X-Gm-Gg: AYBFou1EWxhfVSwrb5ZPAvLAz4sxw3KtdvCOdv2Mc0R4KeI5jBXSVcx4rDrU5FJCQRf
	MbH748SnTZZYrJROFypmL7bOzlH/46GmaAMaUFVJujhwMm+W2yvjKszLGfIBR2+GCSvMM3sHeh7
	OYHge2Bw0mEjHeNgAp76/Sr6YZKvjU78v/IFCeU27vKMdCyYdH1L+14eznl1z864VCUlRKzjCDm
	VOwyzTJxsQPRRp6b3TtdY1aYejTQHwTPEVtkFCLavVNcP5/Flv8AleaSo25vCjODR2eh4v7i0B7
	tKCGgnjIjw5ViDa23Rsisj63w2ZUCPBF0GsGGBVZppsZ1W38afFmJPu75YFQyzm7/ZdFwqXG5mc
	syFQ2GV8TVYTSjTrIAMdORvPWbJdVM4Orx/nZAsqfKCwl3IyNbEIY3PlULFYUmqqQbJQ130r3VH
	ksFfZ+rpXXdXgp6gCxkyu5kedKffOsJ0VyTs6fICu91aPnkKXzPc4eOhbPj+lFs/UKllqLQ3eaH
	7PJSCXfUpDg3iiM8XgPUBtHQQZKcP4LO3q+iTSt1VEJkjaalUY49a8/X/NyhH6ABDB5heT9J74b
	/L+2nPVl+9Y3OnKXJ+JEbB4oAEY1olHV1O51rKbALrj2JM7ZpA==
X-Received: by 2002:a17:90b:3c89:b0:398:ba9e:75ff with SMTP id 98e67ed59e1d1-39d9c35047emr828915a91.21.1789073187174;
        Thu, 10 Sep 2026 13:46:27 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d950913a6sm1261016a91.6.2026.09.10.13.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 13:46:26 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Zhang Wei <zw@zh-kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linuxppc-dev@lists.ozlabs.org (open list:FREESCALE DMA DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] dmaengine: fsldma: convert to platform_get_irq_optional()
Date: Thu, 10 Sep 2026 13:46:25 -0700
Message-ID: <20260910204625.55367-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the per-controller irq_of_parse_and_map() call with
platform_get_irq_optional(). The controller IRQ is optional when absent
and the driver falls back to per-channel IRQs. The corresponding
irq_dispose_mapping() calls in the probe error path and remove function
are removed.

Moved before anything else in order to handle -EPROBE_DEFER and to avoid
doing extra work. Simplifies the if statements as well.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: move to the front of probe.
 drivers/dma/fsldma.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index fb19c60540be..9ee8ae1aaf40 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -1224,8 +1224,13 @@ static int fsldma_of_probe(struct platform_device *op)
 	struct fsldma_device *fdev;
 	struct device_node *child;
 	unsigned int i;
+	int irq;
 	int err;
 
+	irq = platform_get_irq_optional(op, 0);
+	if (irq == -EPROBE_DEFER)
+		return irq;
+
 	fdev = kzalloc_obj(*fdev);
 	if (!fdev) {
 		err = -ENOMEM;
@@ -1246,7 +1251,9 @@ static int fsldma_of_probe(struct platform_device *op)
 	}
 
 	/* map the channel IRQ if it exists, but don't hookup the handler yet */
-	fdev->irq = irq_of_parse_and_map(op->dev.of_node, 0);
+	fdev->irq = irq;
+	if (fdev->irq < 0)
+		fdev->irq = 0;
 
 	dma_cap_set(DMA_MEMCPY, fdev->common.cap_mask);
 	dma_cap_set(DMA_SLAVE, fdev->common.cap_mask);
@@ -1308,7 +1315,7 @@ static int fsldma_of_probe(struct platform_device *op)
 		if (fdev->chan[i])
 			fsl_dma_chan_remove(fdev->chan[i]);
 	}
-	irq_dispose_mapping(fdev->irq);
+out_iounmap:
 	iounmap(fdev->regs);
 out_free:
 	kfree(fdev);
@@ -1330,7 +1337,6 @@ static void fsldma_of_remove(struct platform_device *op)
 		if (fdev->chan[i])
 			fsl_dma_chan_remove(fdev->chan[i]);
 	}
-	irq_dispose_mapping(fdev->irq);
 
 	iounmap(fdev->regs);
 	kfree(fdev);
-- 
2.55.0

