Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9A3421239
	for <dmaengine@vger.kernel.org>; Fri, 24 Jul 2026 23:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784934008; cv=none; b=lPE/FTdGLU8qyPzBST+K+Z4y4B84CnREe2HMxkIa0yQsipRTLp6tvmmUx12DMTCh+CMUIemMA1sUWmzMlyRPVMJOkSi0ITwUPv3YQmToHSYhc0bGV2tR5w3ol7hnjqAMO1jFsHGj/c6Qk8pZu9p1FrbSY1qYM4S+YrZ6gTfwM6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784934008; c=relaxed/simple;
	bh=4pBlsWm+5sbUVQxH31HUjiphsO651Ia0DfjKkHUNPI4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZYCCM3XKWXkhwCoAYxIEsJ7HeU3vo3x4hZJQ3vgzKRaLiXke3ptQqdsv3nqL0CBIzAnlZ6ou3AfFEvofQoNGdsTMDDRAfIHgfjy/SLtrinzMjN9SLGiBp/wMtPzxfLAg/q2im2cqZz5BSSBxgdKcvmBavHzrXxD5yaOwBrnqLps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q6NLzddS; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q6NLzddS"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-448b89f700fso749608fac.2
        for <dmaengine@vger.kernel.org>; Fri, 24 Jul 2026 16:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784934003; x=1785538803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ESTD8fjQr67xhujYSv9nCY2fZpeH0iTV4/0hUbjiKHU=;
        b=Q6NLzddSrRbfRK4Vg1WXduY4cAb/+Gl+1kfE7FJSrfmUiPQ+OVyt+eX8yI4v918muZ
         TvgCUXXLQuHz3xHj6L5fNncaQSuUmru/kd65tbhlouzvfC5s8vRWtaMnCeGfQt3MnWUv
         x0BNaZEWskZTWBzMSKo0jLZLQ1AdaPQZV478xDiDzzsWDA7L3YYSaDvL8QtwW07LOEmF
         9W1hd3lV3LOwybWfA/I2R1oFpTDP8+ZaY5kvvb6Rnvflr/M7Q4HRzePhbDc/n87I8weB
         c0fQDeo/kHqC3z+9Hl5kNd4Kg1YlXmHuBfVsHlNUhdVawmib4BlHKHUIECGyJ9rJUx+o
         Gn7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784934003; x=1785538803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ESTD8fjQr67xhujYSv9nCY2fZpeH0iTV4/0hUbjiKHU=;
        b=mASCHsjQcXU3QEtjAFzKXyMI0jGfL3f8fP3t/AUhXQ1WzFmMTT/Oz2bIfNWnCfohH8
         CQ4B9/Z2KtbZEUSQ2xPzulzZuEXJNsP62IkNhLghKYTCE4a/cUsUCSmjRKF4UB0mjusn
         NhUjFjJuIViZanqsRXY5l0Yp4LGsG6ReBPbtjszg5IqeU7mNLby3eaoxOiVZUlOLGpJ+
         qElhHL/ts3Y9cLkSQRxWzcy0UW5aIOaUjPPFoxDsNofezOx5JP8KwLBXAaYMbfKPChxk
         9o4POiqSD+VAgVHw1PiKGUHtRGj5hX3t2xQZcvtN91U5/0vjCM+Y2u2Kg9osI68ILNSh
         s2Dw==
X-Gm-Message-State: AOJu0YyzlvtafSAJQB5yT8PDtW689GHoPsxMbe7wKwT8j5UUmJ0BixIJ
	nrwrark7Hn8wGEGe/03IzMVTqZBH+PhkHIpQMIV+1fBXI44XghRb7FoM25cpjg==
X-Gm-Gg: AR+sD11t7RvH5G2MEkCBI+JQm/joC5rfn972p8MNVYPBKJdELaAshMEUh2sadsKXNMo
	lFn5tFZajoHE4Wsik4rjyX35v+bChO5yXZaQYIQil6q+SR/pL1xEDxHZl8VbCK09AtZ0UKqLQjQ
	Xeh59Od4Blh/6/WNJDBQyKvdBsKjzY8bNBtnFqdY7vJOiq3C++crXUugwuygB/uyDMKjaENPr94
	aMsx+V5hPQEpqnGjA41BEPRwYeEDR45pDQ3vH7oe9RYrovX5DKCpAyCcj2VJRVgC8jV2++E+2x+
	o69IO+IuTFF28KNSW89IZpMx3q7+1aWB7dJU+NHbtjLDCF7LDzOKrWFI1CTocbDjtdeDg+gT5Ha
	TAsBmFunDxCnxIbLy3sELmR/t3wscqYf8S+60prcPNVrVClQoojtjXvZ69n/Cj6IQmouuNOPC6w
	48bjspmTOnJBPuDWfc92kRyMB/I5zAcxCU4H67s21wETJvs1+iKk3935sHtx6Lqu8X0zPh0LSmZ
	4kr0+vo/wb3Spu9aEsUL4Fikm0/KFA3p5VHr9JCt5cLV0YpM3/I7ai4zVWHqZpRQg==
X-Received: by 2002:a05:6871:7817:b0:448:558c:d833 with SMTP id 586e51a60fabf-457f280d0fdmr441239fac.34.1784934003379;
        Fri, 24 Jul 2026 16:00:03 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-457a07c9427sm5974953fac.9.2026.07.24.16.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 16:00:02 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Rosen Penev <rosenp@gmail.com>,
	Eugen Hristev <ehristev@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:MICROCHIP AT91 DMA DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] dmaengine: at_hdmac: fix sparse '__iomem' cast warning in memset helpers
Date: Fri, 24 Jul 2026 15:59:58 -0700
Message-ID: <20260724225958.43925-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both atc_prep_dma_memset() and atc_prep_dma_memset_sg() declare vaddr
as 'void __iomem *' but assign the return of dma_pool_alloc(), which
returns 'void *' (not iomem memory). This causes sparse to warn about
a cast removing the __iomem address space at the dereference site.

The struct field memset_vaddr is also typed as 'int *', which is
neither the type returned by dma_pool_alloc() nor the type used for
the actual writes.

Fix by declaring vaddr as 'u32 *' in both functions and changing
memset_vaddr in struct at_desc from 'int *' to 'u32 *'. This matches
the actual usage and eliminates the need for the (u32 *) cast.

Fixes: 5d8c5bea0da9 ("dmaengine: at_hdmac: add COMPILE_TEST support")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202607231110.8MqNRj0Q-lkp@intel.com/
Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: remove extra cast
 drivers/dma/at_hdmac.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/at_hdmac.c b/drivers/dma/at_hdmac.c
index 7b6aa9bbc3c8..f24e64219fb5 100644
--- a/drivers/dma/at_hdmac.c
+++ b/drivers/dma/at_hdmac.c
@@ -244,7 +244,7 @@ struct at_desc {
 	/* Memset temporary buffer */
 	bool				memset_buffer;
 	dma_addr_t			memset_paddr;
-	int				*memset_vaddr;
+	u32				*memset_vaddr;
 	struct atdma_sg			sg[] __counted_by(sglen);
 };
 
@@ -1097,7 +1097,7 @@ atc_prep_dma_memset(struct dma_chan *chan, dma_addr_t dest, int value,
 	struct at_dma_chan	*atchan = to_at_dma_chan(chan);
 	struct at_dma		*atdma = to_at_dma(chan->device);
 	struct at_desc		*desc;
-	void __iomem		*vaddr;
+	u32			*vaddr;
 	dma_addr_t		paddr;
 	char			fill_pattern;
 	int			ret;
@@ -1126,10 +1126,10 @@ atc_prep_dma_memset(struct dma_chan *chan, dma_addr_t dest, int value,
 	/* Only the first byte of value is to be used according to dmaengine */
 	fill_pattern = (char)value;
 
-	*(u32*)vaddr = (fill_pattern << 24) |
-		       (fill_pattern << 16) |
-		       (fill_pattern << 8) |
-		       fill_pattern;
+	*vaddr = (fill_pattern << 24) |
+		 (fill_pattern << 16) |
+		 (fill_pattern << 8) |
+		  fill_pattern;
 
 	desc = kzalloc_flex(*desc, sg, 1, GFP_ATOMIC);
 	if (!desc)
@@ -1168,7 +1168,7 @@ atc_prep_dma_memset_sg(struct dma_chan *chan,
 	struct at_dma		*atdma = to_at_dma(chan->device);
 	struct at_desc		*desc;
 	struct scatterlist	*sg;
-	void __iomem		*vaddr;
+	u32			*vaddr;
 	dma_addr_t		paddr;
 	size_t			total_len = 0;
 	int			i;
@@ -1189,7 +1189,7 @@ atc_prep_dma_memset_sg(struct dma_chan *chan,
 			__func__);
 		return NULL;
 	}
-	*(u32*)vaddr = value;
+	*vaddr = value;
 
 	desc = kzalloc_flex(*desc, sg, sg_len, GFP_ATOMIC);
 	if (!desc)
-- 
2.55.0

