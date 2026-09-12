Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C554611E1
	for <dmaengine@vger.kernel.org>; Sat, 12 Sep 2026 15:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789228007; cv=none; b=UgjzMzSX4NTnCCxfM2fuG1D5kEIpeRz8+Eo2bF7kvWV+UHlg51c0lEKYMjjfBR7NI9s263gSYzqQEy8+4d2sOpRzq+kR2wV20zg2eDNviyndKsE4gaazC6fERgtwkW1PWo5NTeT4EulLvu7nzRLu6ldqZD1GrFCDpDuFRLy0/7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789228007; c=relaxed/simple;
	bh=LkZk7eDOgro1jEZi3/1gCjcZxD/PbBiJGk1sivjx/Fg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q+gFIQaRRODJ6q8xD5/sdcybdDvFxbbhrJi9OX4zA8QcHUo4Przqlrldr10lj6O5PKr8qFEl/+yVGzJD4uTDXNRexNs/Uu+Flz+eS+YlcO3gmn+pkuJe1NVqC3enGOaheQG8eowYBCSMIGwiVC+8GQ+hs66B8FBEDjKvwNGGSl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qsGkoY1I; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qsGkoY1I"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39b9184fa80so713436a91.2
        for <dmaengine@vger.kernel.org>; Sat, 12 Sep 2026 08:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789228002; x=1789832802; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G/YDrfc3Xwk7gOrxAX9QzohKyWwy1OWumC+p49dj5dE=;
        b=qsGkoY1I3TK6hmq2NxBYIMBjSPX2U7xAW+8UcsfFprr5CF/xo9ystJcWg39QEY8LBL
         LqL08KUoYHmY0Q/ZqV+AITS+2ChpfjVI9aUZZ7RIj7Lpv7vVJqkEIW5qDRtnVphyHhTU
         tu8BK/de0eBqchuNpHPIEGKz+jQAhF4te37L0JpSiKWVXyrKqoAsLAtadgMjzdDBxuxG
         CFB6desXClM/Rafxl8+NpzoJiMvHiTawD+0hLUq4O27eoZJymDiTU1k6HZHcUsXUZ9rV
         OjJQ1LZ8MceGhIyX0JiuqeOjIzFOwKT54BPFjZ66XcPi+TTm6z7qewDSssjCIo79b1EG
         eJGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789228002; x=1789832802;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G/YDrfc3Xwk7gOrxAX9QzohKyWwy1OWumC+p49dj5dE=;
        b=JQLU6T3nbROMaYtmzY742ztFXM+6551Vs71sqXiDoV5n59vMWHkxrMuaD1kCh0ZaXI
         ZB2HWgDQ0SQ8c1wKcnPgOVimH5GJXu5GECQnf34tyfZKq9JNRggyIAcTFQKknZC/3otj
         qLPGVcldbMnw7z6A7rSRMXo6zgjEJkYPC0liYVGMdqwmHt7VBgTKh9oftY+EJNwAzo5i
         kWcH78JuSQsMO+b9OO43kHXcKCEZ3BwWuJjDOXIMgiEFOCIZVXGzKmNPhUXkpJMSZDbx
         XymrjV0EM56Jm7SEkhiF/yjXMN82wAVTQknZ4eRYioNxGw4/5/n7LuIa6/6qrd20cGbJ
         VPiA==
X-Forwarded-Encrypted: i=1; AKwUvByuvSm4A+XWODFI4En857/dmcXBJtjnn9Din+6rWwqC8lJHruIfiQ2mP0uyY6cevP9Y8y30YUPTnTU=@vger.kernel.org
X-Gm-Message-State: AFuF++nTMwZzc1T4jQKKQmW+dpVeQXCTrZX7oZIFdP4uBY+HuEvJN3Tv
	rh8EGt4bY3N/tCg83FlCEYWo9KG+beu6NYqhPgbBBNdu+uGhBlgQRGJ/
X-Gm-Gg: AYBFou0UMTWthQywKiEs3gWhIDIp+LPbhaqDZGFygMuLptQOEa2Clwllq5+CcIQim2p
	uTl6LbZYW94d3pWTBmRBfFyki4dDPVa7UceofCA99siBN8MpmO7+UFbvBZbHQXdz6ToT2+VzSlF
	pEizWH9S+3gHypUMg44yUK8z6tvOLWTI41q9nRotbcyIV6RZaHdV51DpbBFGEsHxGR5iYAOQOME
	bZbhf32GMnN8J2TPodoCdhpvY0uNeBvGQyfibRcTuSBVt21f8ldGSnEPb5GeXo6u/fZcis8whb6
	4ZfrLoNok8P3GYt21txiCfxbzoHI7j6xT4emqo47K4h5US1CBSPfxtxXlbZ4sdQfiSnQaqdcd0c
	aglWtQL6lLG0j8JCEAvwQNX9d6Gqrd5CZkK1AaMmxQ4GZ6DUkY2bSS8RHMk1HnqbQcxr7oWU704
	OtMfjGkvW98sTQ3lowGPCVfqXO1yv9PCy7vPZh1YNMtYPPZDtOMMWrXx4Jcg1IIDhs
X-Received: by 2002:a17:90b:586f:b0:398:9be6:f999 with SMTP id 98e67ed59e1d1-39d9c386bacmr17219294a91.24.1789228002294;
        Sat, 12 Sep 2026 08:46:42 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e602e7sm12214069a91.5.2026.09.12.08.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 08:46:41 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Ludovic Barre <ludovic.barre@st.com>,
	linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] dmaengine: st_fdma: fix potential use-after-free in vchan tasklets
Date: Sat, 12 Sep 2026 23:46:29 +0800
Message-ID: <20260912154629.1021632-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

st_fdma_probe() allocates the channel array with devm_kcalloc() and
initializes an embedded virt-dma tasklet for each st_fdma_chan through
vchan_init().

The interrupt handler calls vchan_cookie_complete() or
vchan_cyclic_callback(), which may schedule the tasklet. However,
st_fdma_remove() only frees the IRQ and does not kill already scheduled
tasklets.

devm_free_irq() prevents new interrupt handlers from running and waits
for an in-flight handler to finish, but it does not flush a tasklet
that was scheduled by a previous interrupt. Since fdev->chans is
devm-managed, the channel array is released after the remove callback
returns.

This leaves the following possible race:

  CPU0 (driver removal)                 CPU1 (IRQ / softirq)
  ---------------------                 --------------------
                                        st_fdma_irq_handler()
                                          vchan_cookie_complete()
                                            tasklet_schedule()
                                        return
                                        <tasklet pending>

  st_fdma_remove()
    devm_free_irq()
    ...
    return

  devres cleanup
    ...
    kfree(fdev->chans)                  // FREE
                                        vchan_complete()
                                          vc = from_tasklet(...)
                                          spin_lock_irq(&vc->lock)
                                                       // USE -> UAF

The pending tasklet is embedded in the devm-allocated st_fdma_chan.
Once fdev->chans is released, the tasklet and the virt_dma_chan
containing it point into freed memory. A later vchan_complete() can
therefore dereference the freed channel and cause a potential
use-after-free.

Kill all vchan tasklets after freeing the IRQ. This prevents new
interrupt handlers from scheduling them and waits for any tasklet that
is already pending or running before the channel storage can be
released.

This issue was found by manual code inspection.

Fixes: 6b4cd727eaf15 ("dmaengine: st_fdma: Add STMicroelectronics FDMA engine driver support")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/dma/st_fdma.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/dma/st_fdma.c b/drivers/dma/st_fdma.c
index d9547017f3bd..23071cbf1866 100644
--- a/drivers/dma/st_fdma.c
+++ b/drivers/dma/st_fdma.c
@@ -846,8 +846,13 @@ static int st_fdma_probe(struct platform_device *pdev)
 static void st_fdma_remove(struct platform_device *pdev)
 {
 	struct st_fdma_dev *fdev = platform_get_drvdata(pdev);
+	int i;
 
 	devm_free_irq(&pdev->dev, fdev->irq, fdev);
+
+	for (i = 0; i < fdev->nr_channels; i++)
+		tasklet_kill(&fdev->chans[i].vchan.task);
+
 	st_slim_rproc_put(fdev->slim_rproc);
 	of_dma_controller_free(pdev->dev.of_node);
 }
-- 
2.43.0

