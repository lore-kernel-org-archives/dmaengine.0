Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795015738;
	b=h7TAwSRVuZiGnk2ZWymZ171R87GIPPFP62142dyvNV7S034zI7Tc88wYEgKD215vbSe5
	 B6S6qI4bUJzcO5T4QfFULmkF4Np4JiUZakWpnL9STBDBXiH9v1WueWpj4tX5qKVnhFyCJ
	 SkXA22WHepmtsJVwIh0yw8EZlYrmZuPrbhCgCqg6JBfDatCe0Nx3hMneOycTFcCmRnFmQ
	 ZYtd+fAyzfY522Uvm688G/0m6O4D23dk8wu8p7Qr9itLbBK/oKqCx5pRForOfDvvlMLzc
	 7XxKxGDipsv6ftpjrYeZHTiv19TNurVMQyRrIVxMJIDGiQbBBhukKEMtDdksGIc33rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795015738;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Vwg0PMEd8sJ4yJtQjtLbWSELD2pw9lJLZFEOJ73Wi1s=;
	b=ijQCLsbZb8n9M8Gepu+gqeyVK8Oj+BvL1qu5fWPDW4WzmTbdW3QQgIZ9XzyRhzYr/lHc
	 A9JyBI+COJSMF+NKs5JdOpoR97WVSmyVib/YDKv7vGBR7lANJ4nBg157czHiERqxBv7eB
	 5u4YFUL83C7c/7F8o5TVabllGQWKRP2NrT3L9ZdIY7WdaX7dkUa0FPyq4AvgQWopKnQuE
	 HMhZ2GbM2W0IBLK/o64c7XyjQZcmRXjo+P6ZjfosVipeb4tLOMnXy+Hj58awCX+ZKYyaj
	 Bjc1WQlxfXvx39w7ji3FhhxSTPgb/t1K1cBD1RPCD7fFOOhhc9a+KBROWuRlodhyEug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="s8Al3wZ/";
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49035606A337
	for <dmaengine@vger.kernel.org>; Wed, 18 Nov 2026 15:28:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49035606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s8Al3wZ/
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8b6a88e4341so571817b3a.1
        for <dmaengine@vger.kernel.org>; Wed, 18 Nov 2026 07:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795015736; x=1795620536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vwg0PMEd8sJ4yJtQjtLbWSELD2pw9lJLZFEOJ73Wi1s=;
        b=s8Al3wZ/wJLJLZVUJSpx+ewxs2DAhPArX2XFkCHig55UUkXDMnQ794zy+S36h+eE1Q
         O18KxyPxh+q+tdb0rsryUGsZC47avqf9rSKJDIIF6K9YX8tGwECCkGCDV9jhtpyH/yN2
         vWPX7pWcOKDg52Wk9lz2e7c6K3qXRhGgKAOpdTERRX6d4iF+0TyNoQnMAzGqRxmNe8+B
         9L5ljdXgKN/M+elOWbyMhOtFaYpujL3TX49tMaF9hEQwTaUIjtuh+7TuJhbg47TNe5W7
         QKWnvgLd1+cgVh7mgGkUbdQ3iCmjRFBO/+2yra06pilVD5ytPIiJtjgzFm9G3KLWM+q7
         RAiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795015736; x=1795620536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vwg0PMEd8sJ4yJtQjtLbWSELD2pw9lJLZFEOJ73Wi1s=;
        b=wjqhPh4BmcV64P7mfdqXqJbYPg0sgmkHqql1G5izFE48px5IVDbwLE6Z7WKEDRLAcv
         Vn/RYIZmEFfbHGNe9DUI5gjOxkLifgtEmrRGA+fMhutUKksH+DIVa0aBocr/OP3WyetL
         +QGdo9rvSnTlqMyYiHeJ7S3mwVDwjvYCu0TeRa2rX913qZpb2CyCw/alEPYAmuk/gGhk
         N5IwLrcag/+0oKVHpcJ6wZWpzyi4IQSKKyNID9WwZSHj1Q4DVnH4hf4keJDo7BAx5n/+
         Wf6+lmHRtP5vk/3Q3lzmq5+JM/1PmKftYvofrK8g+j3R1AhYEYTmgy0Z7AGPA4QzlRFd
         oMbQ==
X-Forwarded-Encrypted: i=1; AL+hErE7F1gwOkS4UxqtNOkyYGVgViFg7aGxo3zcgr4kzfohfEgPfEQQAIx0W1Lt3XlpSvH8tHyKj9Yxj8E=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ct6kPn8VcRrItGuXtpOmA4ELgYrwKpr0pDWZF1G6Ot7TrVLHX
	tTrY8LngA0WW0AZ1Gwtk5Xu96S7UtgVVqwa9Mc6qxs8PZ7ifST+DNrqS
X-Gm-Gg: AYBFou2HiAsSrJ7aUOv1FlsNG/5RO535wxZY3W/Udi4nJH2dVJxEXLMLcG5vRlJ/Skf
	PCk97dnefbFNem3UUCrQO7lA99CgEy88nigk1QnjmRdrB7YTr/YBWieYT5LHJa5V3WoxeX59lxY
	C2gYpUkT8OJ0kYB077/Oi2r/Fw4h6yZpp1hPFTDmHL5hX0ju5qD3UgG0iSawLkGH9G2D4NllkTi
	K9Q4U0+CBGV0/VVuhNLjiwIwvSNeYdCZLahQpBCK25C8snE+tBWWCWj0PJwXIpqS4j0xelPPNHi
	NtXQQz9sARKNEaJbriwKNMci7y9yAUNY92iGiG9bdsitef+PIgr2btsVkvxOJD2TW7it3OYNTEa
	E5v6n0He6vG1bRo/bgsj+RtImqe5O+FqwY5vXuPPyPRfANEP9NAwU8VGu81cka95dtcij+coy4k
	asD2ip40bbWNk9ZdJmn29dNTCvVARJzgraYlmfZu1Axe6siKfaLcJTutZAEChaEfUdLi2rjrMf9
	eqCoah6XbRPPQuz4ILqLCD+SO/GqQSRyOs6OzuKqJi5AUpjkGEdcMpTBP+35xIyAU1Q5I+aPjlh
	2Q2ihE2Ai9s3hdazYs49gLNNTirvS6AIE8GtGGdHII7QI19k
X-Received: by 2002:a05:6a21:a10c:b0:3eb:b9e1:4341 with SMTP id adf61e73a8af0-3fe98af4d5amr2641588637.67.1795015736458;
        Wed, 18 Nov 2026 07:28:56 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5ca7aa2b3sm1419153b3a.9.2026.11.18.07.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:28:56 -0800 (PST)
From: Hyunjung Ko <hj351016@gmail.com>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	dmaengine@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH v2] dmaengine: stm32-dmamux: don't call runtime PM under a spinlock
Date: Thu, 19 Nov 2026 00:28:43 +0900
Message-ID: <20261118152843.1126665-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <90b4417d-f2fe-498a-8128-3229eb284d8c@foss.st.com>
References: <90b4417d-f2fe-498a-8128-3229eb284d8c@foss.st.com>
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

stm32_dmamux_route_allocate() calls pm_runtime_resume_and_get() while
holding dmamux->lock with interrupts disabled, and stm32_dmamux_free()
calls pm_runtime_put_sync() in the same way.  The runtime callbacks
enable and disable the clock with clk_prepare_enable() /
clk_disable_unprepare(), which can sleep, and the device is not marked
pm_runtime_irq_safe(), so both sleep in atomic context.

The lock was in the wrong place: it did not protect the runtime PM call,
while the CCR write in stm32_dmamux_route_allocate() was left unlocked
even though stm32_dmamux_free() writes the same register under the lock.
Move the runtime PM calls outside the lock in both functions and take
the lock for the CCR write instead, matching stm32_dmamux_free().

Fixes: 4f3ceca254e0 ("dmaengine: stm32-dmamux: Add PM Runtime support")
Cc: stable@vger.kernel.org
Suggested-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
v2: Amelie Delaunay pointed out that v1 was correct but incomplete:
    - also take dmamux->lock for the CCR write in
      stm32_dmamux_route_allocate(), which stm32_dmamux_free() already
      does for the same register;
    - also move pm_runtime_put_sync() out of the lock in
      stm32_dmamux_free(), which has the same sleep-in-atomic problem.
    Link to v1: https://lore.kernel.org/all/20261118082853.926607-1-hj351016@gmail.com/

 drivers/dma/stm32/stm32-dmamux.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/stm32/stm32-dmamux.c b/drivers/dma/stm32/stm32-dmamux.c
index 5731871..8290122 100644
--- a/drivers/dma/stm32/stm32-dmamux.c
+++ b/drivers/dma/stm32/stm32-dmamux.c
@@ -73,10 +73,10 @@ static void stm32_dmamux_free(struct device *dev, void *route_data)
 	stm32_dmamux_write(dmamux->iomem, STM32_DMAMUX_CCR(mux->chan_id), 0);
 	clear_bit(mux->chan_id, dmamux->dma_inuse);
 
-	pm_runtime_put_sync(dev);
-
 	spin_unlock_irqrestore(&dmamux->lock, flags);
 
+	pm_runtime_put_sync(dev);
+
 	dev_dbg(dev, "Unmapping DMAMUX(%u) to DMA%u(%u)\n",
 		mux->request, mux->master, mux->chan_id);
 
@@ -139,13 +139,9 @@ static void *stm32_dmamux_route_allocate(struct of_phandle_args *dma_spec,
 	}
 
 	/* Set dma request */
-	spin_lock_irqsave(&dmamux->lock, flags);
 	ret = pm_runtime_resume_and_get(&pdev->dev);
-	if (ret < 0) {
-		spin_unlock_irqrestore(&dmamux->lock, flags);
+	if (ret < 0)
 		goto err_put_dma_spec_np;
-	}
-	spin_unlock_irqrestore(&dmamux->lock, flags);
 
 	mux->request = dma_spec->args[0];
 
@@ -156,8 +152,11 @@ static void *stm32_dmamux_route_allocate(struct of_phandle_args *dma_spec,
 	dma_spec->args[0] = mux->chan_id - min;
 	dma_spec->args_count = 4;
 
+	spin_lock_irqsave(&dmamux->lock, flags);
 	stm32_dmamux_write(dmamux->iomem, STM32_DMAMUX_CCR(mux->chan_id),
 			   mux->request);
+	spin_unlock_irqrestore(&dmamux->lock, flags);
+
 	dev_dbg(&pdev->dev, "Mapping DMAMUX(%u) to DMA%u(%u)\n",
 		mux->request, mux->master, mux->chan_id);
 
-- 
2.43.0

