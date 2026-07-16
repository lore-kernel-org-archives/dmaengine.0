Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E806C34F27F
	for <dmaengine@vger.kernel.org>; Thu, 16 Jul 2026 20:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784233797; cv=none; b=XZXP35gKHkgdo+t2G2VAYMcNNXkfkP8uHsUyzKjYtgYu2mKoXT/M8MMCPAdtfnwQdrtPrvT5ERFNjdp4TcmS4vnUk3yqNgWBmCFQyZwS+E+PxCW/sC7YPKJEzRdJy4geS8qYMEqWhi8+/6XViBU88Z972sC576rqW9qby6Ch02Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784233797; c=relaxed/simple;
	bh=IJeXEkvaYFI2ijYHmji3XnM2xTV5dy+jj6rf7SrwbqI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ml0D8qb8/x1qePcmZwp9vKqeJtqjEeld17jkOA9B1785mv/0AvF3ESgTx6xjMbWVTfsRkju/eSGIPGx7okTJ9vfXWuhR3/Bdfm5bMU61neBnlOXk/ekMPK3/RsvA7PVJ0Y5ohqLpK1go2QOO4feLRU6pocWTgttddQ3Td/oMsZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MLCgeyW1; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MLCgeyW1"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-84874b52eabso5017659b3a.0
        for <dmaengine@vger.kernel.org>; Thu, 16 Jul 2026 13:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784233795; x=1784838595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fq5+Et8VCLx3YNlIRBYElnfSV6kqx1OSwg8TLAZrMWc=;
        b=MLCgeyW1elEKq4u6vnf07npCC6EEOIPz2PU0jDlk1gGKvOqctznswNDBBfwdN13IuC
         RLVjUk+o0KkcVqG3xOn3voCScfBJi5j8Lfmwz0vvNi7UkX0+p5lk3xh7PO1Py+ECP/1O
         k2/3XH0qXiQlqgj0q44xpKvVlU1WbkvCQDtJniJN7Gwg61DucumQXqyt02ycVlhI5B5V
         HaDBJC3f7MIlGgroq1IAhaIUeyskpMkc3uJdkwGuUrrCxdbgYcddGaorf+5yLs/A/Bit
         n+ZUYTgaC0H9s/FfEF/oqzIMETDp9LOVlF0H0ZeLeycbM4SZweDtGKcRNeMFeJGcD25n
         +KUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784233795; x=1784838595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fq5+Et8VCLx3YNlIRBYElnfSV6kqx1OSwg8TLAZrMWc=;
        b=heBG0jPk5OcXKUrb7b2Piu2VlqUuNJzpvX4/GezH/OniHh3NqHmvkrshwedWmqS47I
         OEeAxTNdGP5PTgI+s0yg4ezx/OYzqfpv4mKCrM5q720qju+9ANrxcBd5NiuvabLZc49m
         LKPQyefXUeGDn+//VpC1htWA8hbxgTi3OZzoGUiv09sXx/i06GHNEiOEPzIujqbzxqSQ
         uSMLFydSAQ/Fjf+Bw1wIs52p5hYCFs4FTeeFZig8j659cFJmy/cPfkiVlguUFAfc3mn1
         V/XBS8nul6WwiWgX9tiBT64SMg7IgPjL8ZK6VgPBqteVUOIU72qY3waFQW6wrpRwqhU7
         bEGA==
X-Gm-Message-State: AOJu0Yy59hhxGuToRR8IW0nOyTeq3AqHhqS/yqcXg4XDSPv4Qd/ymYDZ
	GFYjGjdIm4Wo2LakAI0jXL9eUU6PSWgjxs0zLrsKF3qpqblPVwqQHqJU4TGCaQ==
X-Gm-Gg: AfdE7clW1+lB2r1oRmRKJcXg+3JwLvQTDXn+QIrZTQ0Nn8Hh+mFQPb+1EizmI7G44ZS
	qpPQSqtSIvR0oSBMGHvZNntrjla1466d8cuQazAsIU6sv1fdOvz38G+0sMVNm3FS7f5U6+kAtKC
	EqVWJu5NS4hH2dtntjL0Zwh9To0oS5Ah0KSGoisyRo/WuCxaxiUxoVmATNagBVCsJKQIJZmezIL
	kuj+NGdusIcqSfCJuZIzq7Dz8j2RG9673KyQAWsiSz4esEtDzI9fJUouFNkJfXOEur83q0kxrfC
	96//NNbKdIPtFLR6u8UNbyASoTK6p0Df7TMm/hrRgwiG7ZKlLw74GceiMbxBQuS1QKMAp0iLNBQ
	wz7O9RqDIWLaloTdy5ENkXbGpwMgpF7zO0uyiusCbFtCegOdyVz0Zaq8BbeWOQxh1V9LPtHFc0D
	LtP7C8XU36mHMrbDxiBfEng9E1gqZXQM2k1WkK4esIrQYjTMbpwo+NebJ6yyBkm7/TtjWYZaFss
	sum6MhdoKynywq51ggGiFfAfIoqQ6M9+weD6/U/KJaSao14vqa3TTI=
X-Received: by 2002:a05:6a00:4388:b0:82f:50cd:e586 with SMTP id d2e1a72fcca58-84c234f913fmr859680b3a.13.1784233795193;
        Thu, 16 Jul 2026 13:29:55 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f26f703sm5536776b3a.17.2026.07.16.13.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 13:29:54 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2 1/4] dma: fsl_raid: convert descriptor stores to big-endian
Date: Thu, 16 Jul 2026 13:29:46 -0700
Message-ID: <20260716202949.677290-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260716202949.677290-1-rosenp@gmail.com>
References: <20260716202949.677290-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The descriptor structs (fsl_re_cmpnd_frame / fsl_re_hw_desc) are
in-memory but their fields are __be32, because the structures are handed
to the device as big-endian. The driver stored CPU-endian u32 values
into them directly, which is both wrong (the engine would see
byte-swapped lengths/addresses) and flagged by sparse as a base-type
mismatch.

Wrap those stores in cpu_to_be32() so the values are little->big
converted.

Reported-by: kernel test robot <lkp@intel.com>
Fixes: https://lore.kernel.org/oe-kbuild-all/202008111749.yy85rFMD%25lkp@intel.com/
Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/fsl_raid.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
index 99945845d8b5..2778d07a05e8 100644
--- a/drivers/dma/fsl_raid.c
+++ b/drivers/dma/fsl_raid.c
@@ -242,9 +242,9 @@ static void fill_cfd_frame(struct fsl_re_cmpnd_frame *cf, u8 index,
 	u32 efrl = length & FSL_RE_CF_LENGTH_MASK;
 
 	efrl |= final << FSL_RE_CF_FINAL_SHIFT;
-	cf[index].efrl32 = efrl;
-	cf[index].addr_high = upper_32_bits(addr);
-	cf[index].addr_low = lower_32_bits(addr);
+	cf[index].efrl32 = cpu_to_be32(efrl);
+	cf[index].addr_high = cpu_to_be32(upper_32_bits(addr));
+	cf[index].addr_low = cpu_to_be32(lower_32_bits(addr));
 }
 
 static struct fsl_re_desc *fsl_re_init_desc(struct fsl_re_chan *re_chan,
@@ -256,9 +256,10 @@ static struct fsl_re_desc *fsl_re_init_desc(struct fsl_re_chan *re_chan,
 	dma_async_tx_descriptor_init(&desc->async_tx, &re_chan->chan);
 	INIT_LIST_HEAD(&desc->node);
 
-	desc->hwdesc.fmt32 = FSL_RE_FRAME_FORMAT << FSL_RE_HWDESC_FMT_SHIFT;
-	desc->hwdesc.lbea32 = upper_32_bits(paddr);
-	desc->hwdesc.addr_low = lower_32_bits(paddr);
+	desc->hwdesc.fmt32 = cpu_to_be32(FSL_RE_FRAME_FORMAT <<
+					  FSL_RE_HWDESC_FMT_SHIFT);
+	desc->hwdesc.lbea32 = cpu_to_be32(upper_32_bits(paddr));
+	desc->hwdesc.addr_low = cpu_to_be32(lower_32_bits(paddr));
 	desc->cf_addr = cf;
 	desc->cf_paddr = paddr;
 
-- 
2.55.0

