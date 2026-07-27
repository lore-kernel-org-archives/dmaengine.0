Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA2B4398EF
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184865; cv=none; b=dhgmB8A/nP2DIafcfIW52sPdgREMkQt+c9CKSuFUOe+Nxje1lxFjJ1UyzO9QkwGC6UL/1Z9tIZVPuiThsQmTkdmBQlshN65QyTNrwhVfk0AbQ1psioPwsrad4PRsTdjLQgckE0x/Qkd1E81fpmFx3MMBa/Dkvq+84s9v5yQFwxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184865; c=relaxed/simple;
	bh=FyKAMmX0CxgscsP+BPCFodUDhZmInNUYJC9cJrNgEPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e3ez05ZxhLo8GaRkdQLiGIw4UwBPqWprmHF4vkf8eRGkV7w+tjDYfSpqiO/COpiGc8DPJ/iQJ56xLKjfEMMRZT0xIqzOji79jWZSBwY2AZvWXGLj1cH1BA+5K4xWrCO8LQKYzdsNAYQHtAL0f/sAWaNJjj7oTO7B/1cBJ5/meV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZM6f/hAA; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZM6f/hAA"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-84867f07d63so3846073b3a.2
        for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 13:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184864; x=1785789664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MoGDnKIkCWUYPRJHysO+SEgLQsJmuE/s2iHiDIk04IE=;
        b=ZM6f/hAAXecIRfZ6WLN1SAXsTj8XPj4HGltdblF/8gJJfbFtAPHMZEcH0flZ0EvDl9
         l2FLFpAhKKtqZ8QFe14UpJLr1O/+vlcWceDhR5ZS8WjzUf7AqSTSqG2C+Fg0fssx3M6s
         pg242evWRugLADiZyshwRFZk9dBtgBmPZAy3w1r5NOlmeMqaq+cTM9Gk8FGuZbNxRPZS
         olhc1TNsNORL6InvCTZtZASAIXhnFWMgM3tQSbiS0IRLKjPelrqk7maWczDtH5HTfMYr
         yXEIn9/NWevxUybTYQ48THuopWHdGWCg6vVmEgx83JRq9+CpFIBG69u49BUnqAO/ZcHs
         x42Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184864; x=1785789664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MoGDnKIkCWUYPRJHysO+SEgLQsJmuE/s2iHiDIk04IE=;
        b=PAEOHcQqw0zHJ/Iyfrwh83aFLS+BMiToxmi86p3TWrE+65z5RBev7t7bzcj6jVmZZa
         zqOxTRlQ5/oNWoNqrhoN7mT7NoDEMAXlhvW77iuLwrObV4s/N/56HYrAZ20lDLh1ou6z
         X85B9v4tNsgf9k4PEcit3pSv3wLdDD5WoSSflz9DNHU4SVWs5ArFwmNWVOWdV43dDv3u
         tbeqKw+9qhl42np5lYqRHPx0t0C/eYzgO2SkBFjKdX096/W37IjAhboP1Bocu8A/L0IO
         ppU9iXdVMFA8adLeNITTO7IDutCtiK2Jb5px87yThct5esK0mUSDTBZHia421ZOiDqyU
         UfCw==
X-Forwarded-Encrypted: i=1; AHgh+RpP9zvs9EMnMKhV2yuD+s6r1u5BrHMZjjOq2qyAohaqQKY4/G2ERTA2/qmTmKkFA+eiZ8hawdJ3JJM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2PaZTk5ZnDVtExKzNS93WG1iTgRBNop3M9idZ2+66cEJC7EVK
	kYHmGuuDAYyKwZYOok0oFIYvoJYTJXoOSFSTj/GuS2IkI3rAKyuXTWbu
X-Gm-Gg: AR+sD12RTb6xn/9TJbxPVQQwNcAxGUUhPx31/pTFdVUf/+1CHiQQj5miJgS0uc7IdN/
	cVlSAlj5bTO7VNajdsd+Z7w9cWN/a6VzEI13kUxYPnV/AhAh1L2bRZ5W/Kg22X+g352+qCqlyjU
	5H9NaDGj4GoUw++uS6TZlcx3QqZxzfNL5Lkfa621/C1w536ydQFr7JVo3boRtkOszRNqseFyc7j
	MNysKe91aia9oW4RDjiD4v+cYfQ6KcKufQl9yZcKdDUCzX+EXmY0WXYy3k1RM1pkiSYoFcl2gTD
	Ap6C2F45KisD4tbFekP2RBPnEfemnxR47ZgDs/0zrvx3qfqDNwXij+mAH2k66xQCQnhYzpfi/IG
	1tLK+AJ99wNkIZGkI5IUB9a8VCFNpQmhE6NahhxvoG/dl8UoxsoH9QfELGs5iQx2fNa68+u4Jqc
	AY6Z6MosqEkF881io=
X-Received: by 2002:a05:6a00:9283:b0:848:63fb:fd91 with SMTP id d2e1a72fcca58-84e59546fc9mr8715283b3a.41.1785184863402;
        Mon, 27 Jul 2026 13:41:03 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e533d1351sm3583338b3a.39.2026.07.27.13.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:41:01 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v2 56/64] dmaengine: omap-dma: use dma_chan_kill_bh
Date: Mon, 27 Jul 2026 13:39:18 -0700
Message-ID: <152e342e252b9196a372924d76ff3536b4a4bde2.1785183549.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com> <cover.1785183549.git.allen.lkml@gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

virt-dma now dispatches completion callbacks through per-channel BH
work instead of its tasklet. Cancel that work during teardown before
channel storage is released.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/ti/omap-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/ti/omap-dma.c b/drivers/dma/ti/omap-dma.c
index 55ece7fd0d99..10cdbcd12fe6 100644
--- a/drivers/dma/ti/omap-dma.c
+++ b/drivers/dma/ti/omap-dma.c
@@ -1521,7 +1521,7 @@ static void omap_dma_free(struct omap_dmadev *od)
 			struct omap_chan, vc.chan.device_node);
 
 		list_del(&c->vc.chan.device_node);
-		tasklet_kill(&c->vc.task);
+		dma_chan_kill_bh(&c->vc.chan);
 		kfree(c);
 	}
 }
-- 
2.43.0

