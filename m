Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B80371046
	for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 05:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784783020; cv=none; b=oJ69XkNjeAI4M89vM8UZ5ytfxaF881fVH9oGfZB0dwrU7F2EjGv9qEsNqZW543dC5N7LlZBBDMJfj6GwS6oajRbvbhkTntFQwi4xwT7U1u8scQ9wdMn4K1Q2u6otf/9Tv36vHmyl70U4IFIL9PZEtbyDYqgPfhT/iC0LUDdMGmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784783020; c=relaxed/simple;
	bh=skQWyoAlV2srUCKAXpPBBhtgCB/hc0IaPGKzd9nnIJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EYha1vl2E2BlsqpeROb60e+1+upVBcPid0Z7pHj5kMFOuwEhpOyEfLdb9cMFG3/5VE4dRlReUBLPiO/hDJ649I175r5OUOZaMl1fq4AozwJECa+Q6cQhl2doUWjhJvIlZFt2YeHhf+UxnesxC4ihP+Oue1iAGlJPkTPqd+K1Ekg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gkODGc4D; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gkODGc4D"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-382ef647e20so208347a91.1
        for <dmaengine@vger.kernel.org>; Wed, 22 Jul 2026 22:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784783017; x=1785387817; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2DrCCgjjRhvhXwPOzjA88mH14we2i+73DIlEmfsWFVA=;
        b=gkODGc4DCvOfTn3TWq1QuS+m3yA7C/62mEVNCMR8u0K6Ie6s59+0obP//mPwIvijUl
         Kh/jFVZbWINCqt/KsHa8QdNESvirmcMAelTYplNCJPCF/h5IqA7sBDqIyxfFsiaNwhmi
         9Fqe40IK16mS7sKqmYGf51O3jpG982sKPwmNRoQ8JvszNl3DEGiqE1lfgADCW1wtEi1M
         V6ED6vmHbtpe+CmmFXXecsM/NspBjgzqA8MT8baYIz01lMEXf/AFMsjVVK8qrd3m9zy4
         /pfUQVlb1EtZBxg1QE8krroYbGTNHcZLwjuhlKwSpotWSV4ksnfPP5zBLf/R6HKnTsEb
         cFcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784783017; x=1785387817;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2DrCCgjjRhvhXwPOzjA88mH14we2i+73DIlEmfsWFVA=;
        b=TVxmH3/CLAX+tmtBWCHcPQQ4kXGxeSsrWx+1q1vFAtrsNR7k54NKUunbWqezZetjJw
         T9j0CtASkcCnm28q+I8VCEWrInmpqm5tg1B0MmzoGUCEZxPpFs1FJAnhAE4l5bG7y7f2
         tSvjCe5jQbL5rPc7IAy0ChbbKAF1si5mGl+TCq5PcHOOy/8ot8Kt7dvGyjOSCM9Eqwst
         XNKoJ9ReZTVomzS2/SnAJOjHbDePootLSZOypODGbkF5oq6r1gdeP/q4pz/2fTfnGZns
         2TzbgWC2a5oiMz5eou6VinkbDf7Kzqwua0BDfHdq2BNTSAoMEKu1ZHit6FChXvHQzpjQ
         YA8w==
X-Gm-Message-State: AOJu0Yw/N5+ahpbnKbEVkf1eMie44jWtynjeeqsGXVurdLTjLhYeR9fo
	qZ4HKLGQfT4qBhJfMB1Mv/0Rk9uA6ToNSlWAMaj0/pzmyUPCH2GV2fyfigH1Bw==
X-Gm-Gg: AR+sD11zu6TyI0ly9PULkp2eNoTMLHGFQfzU8bAViXC5/yAi2cqE9Tsvb7QWszTU5Cc
	w21uaHxpBcCJAnmVd2HS54p9lXch0vGNDCw5ECJBJJK+6xsyBsSmh7bFGQP9sUNgkFGme9IK9F2
	K35yTO9uH63w8LxVw6e4GyoBkmF5pL1cF4gZnAujJ4n3zfYRBLCTj6gg6Rn98TH5UqeQuseEfiz
	aqZ3NOTMTsxjRCRZsEVV73VGdkNMxFogrotRmyyIXSfiZgu8g/CtQY3zvzkwCCV5CZkF14DsLye
	JLmnZCdhHSWqxJ3NN1jt7waKNGki8lBAzE6OWkHj+X+AAKmfbtwklSWOzAf5U+2oS3VjIzW9O2A
	D6FArSou2RmmYtG2aATNkT/IdDBa6ERMylRs15OqBWV+Myg82bjK0FTzOyoKIHaZgpUK0zoM8q+
	xSzTE/dic3eau2hS/sb44NacQDKpwoxdHtKPsB0xbxoPguef/L33+o2eRw4PCdDwO42k8KlMPBc
	ZXFsx+xo4TFqJllGww8yqOWCoth31r2qzvqGAUHKN2G1eo4SDP0GkE=
X-Received: by 2002:a17:90b:48c9:b0:381:85c0:1d9d with SMTP id 98e67ed59e1d1-38ec660080amr1742228a91.27.1784783017427;
        Wed, 22 Jul 2026 22:03:37 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38ecab4c518sm291676a91.3.2026.07.22.22.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 22:03:36 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Eugen Hristev <ehristev@kernel.org>,
	Rosen Penev <rosenp@gmail.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:MICROCHIP AT91 DMA DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] dmaengine: at_hdmac: fix sparse '__iomem' cast warning in memset helpers
Date: Wed, 22 Jul 2026 22:03:34 -0700
Message-ID: <20260723050335.270146-1-rosenp@gmail.com>
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
 drivers/dma/at_hdmac.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/at_hdmac.c b/drivers/dma/at_hdmac.c
index e5b30a57c477..f9c336630fa2 100644
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
-- 
2.55.0

