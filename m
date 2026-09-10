Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6654718E8
	for <dmaengine@vger.kernel.org>; Thu, 10 Sep 2026 21:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789076618; cv=none; b=gaTgCjUNjO69jdcB5uZ25ECD8mnufDGetNYF7MS0vVX+7Jr1t9ypdPqVjJkvH8EhMDSK8trF8+ynyENhAiW0xQIgo89HPP0dPn7KbZxtUWWjnQeJCldGypwXykCRT0Qt4RJnYvLNUhVdaGDj/dAr0phJ7O1hFWbIxgHKOwZSwC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789076618; c=relaxed/simple;
	bh=hF1OOna5+siVkl98K1uKmIL7QgQiQ9Fmb5h9aoxyeXI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i2HLbtPHSoNXJ7TZQ/dAcNpfLOIUdakdpQQaiXaufgYbmi01K+0gqDKky+uZdslWBfhd0ToNBSEeDCLNnNc3ikP3fnZQCXWQCJjhzD96vtpDXhmenClu/ASSUCyKpYfX9CNIkpMCcVzhnsi0yDXkma5WcWM5B3l9WFfxZepnCuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VMB9ylAm; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VMB9ylAm"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d6fe26ef1cso2235055ad.2
        for <dmaengine@vger.kernel.org>; Thu, 10 Sep 2026 14:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789076617; x=1789681417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gOaQ+0e1S7d/dfvzPb/zhOODMpmgq3yDQAQBbqXoi4c=;
        b=VMB9ylAmBRMA+pK/2Sw32tKgVJ13j2eHYJXyZ8ZeJZhuSYH3akn2oNSmYR10YiEzul
         wy7qK3rSRgP4og3sB+lNW/cMT1R3xPKKOnqGIeYk4jMrHzpSSd9ql52m/USA8yHD9nuA
         X+jaZrYcTEzHq6pbNoH1Pa2+N/lKzjhd4oJp3dZKBMwSXxEZQz++sPTKlmM//o2E59PT
         toqcrEuipNgQlGviglj8HJsNST9t+tWpBYaOdqkVqiCsT/6DqqoQeLbiQxaDsz4FZEIv
         DdVTQT/UpmXpZw2JJ45eKCSMbR+B/Lzqx+VdQW3jRwh/M8TlnrPzdbPlTv1joiCEXB42
         7nqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789076617; x=1789681417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gOaQ+0e1S7d/dfvzPb/zhOODMpmgq3yDQAQBbqXoi4c=;
        b=YHJy2pOhUVBJDSlpFNlRe+7KblyniJWp9KvSHK8T80J33w2ugv7FVrIKNHs2kud/EA
         mL1WAwBJp5IlxtaHq2X1q00dlTQ34M4EvM4K+HTow61dtMIbpwarzqGePqd2QfmMQyvc
         FEI+qXU/fZKUA8oF/Wz6qTqvLYD2CgzR3KEQPEbD07TR8R5TUlW5NBkOb0eK/evt4bDw
         /GC9xwNyKydDgRtI0QLQxbLN9EPb1zaWNiTy2a0eS7K6/3BGXYIfdjVDaItI2RmCZdNC
         xDFkJpi6Pabt+L3ye2qM8UFHC+zo+Lu1d3umWMm1JEyRVdlu24b2Mh98RjTS5bTIMPtO
         gYDg==
X-Gm-Message-State: AFuF++ncDZMP1S6FNzVNCJYzoYIaGkjJLhifsgKTjqWnU+oTzmCSmGkB
	LcqRvSo4D2/6joL41rzvS0xbw+UfduM42rX+wpKAynF8eoVRlNRvWE6++LBTiJCn
X-Gm-Gg: AYBFou0vsHPSm3FMFx/a1MfGvSX6lopco3eRXmhkpRRbOlMASVDHJWY0yh+3WVG+jcL
	aso7Mj9eJyxlWyqL/v75uJrrmwWdO945yx7E387MTpXNPf6mpYLC+NiBgalbXFJ9ckkKW70H3Ei
	C5qa8tfWE72TpIMMJ7r3WcQrr9uuk0H6Q/L/yWavWAZF69oT3Cc7Zn5sAPvVFhXRK1WuRyP6h7g
	GtHU9EgLTVtWa07I5YLdz1oHsqGNS3QyJcOAb58Ye23AvrMjxE9ZwmXNAjo2ObL1h89S7Fj4vYV
	W8sTn32UoObHCQZg0/zexYWZh4nnSiFS2jn/r+xDzdiqPXDm3UpfmD7hsu5Cx85zOqn7XX1sYUD
	lhO+ItzIya2ohKLB6zXiwBwScwaXbCV8PCElHVtKvti4n4qc4AHaNSxE2uUR+3cvyjZNkgXi6D1
	7edrfHXLq7wJcrrjKDAK1bpPCdreHcMXdNouGPwx1h9yl+BB5mkiwbGLq9OunBKrMjU89xtrUnE
	+gx5qFk1D9TYtIjBTwHiSPIPsBHlIEZvHgWYSbfzmNQJyEbpCiLkYVmozWNdvwmgnvMOy00CRVU
	pEokDplGrCXJzNDmT7YzPUtqwZIruMoavjQG12zRApp8OvHo
X-Received: by 2002:a17:903:26d0:b0:2d6:f988:398f with SMTP id d9443c01a7336-2dd2a33ff1emr25239445ad.12.1789076616696;
        Thu, 10 Sep 2026 14:43:36 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cca26cdsm2021275ad.7.2026.09.10.14.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 14:43:35 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Anatolij Gustschin <agust@denx.de>,
	Yuri Tikhonov <yur@emcraft.com>,
	Dan Williams <djbw@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] dmaengine: ppc4xx: check dma_map_page() errors in probe
Date: Thu, 10 Sep 2026 14:43:34 -0700
Message-ID: <20260910214334.86689-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In ppc440spe_adma_probe() the helper pages are mapped with
dma_map_page() but the returned DMA address is never validated with
dma_mapping_error(). On 440SPe the mapping goes through the
SWIOTLB/direct map, which can fail under memory pressure or with an
IOMMU, returning DMA_MAPPING_ERROR. The bogus address would then be
programmed into the CDBs used by the async validation and
mult/sum_product operations, causing the engine to DMA to or from
arbitrary memory and corrupt data.

Fail the probe when either mapping fails, freeing the pages and
unmapping the first page if the second mapping fails.

Fixes: 12458ea06efd7 ("ppc440spe-adma: adds updated ppc440spe adma driver")
Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/ppc4xx/adma.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/dma/ppc4xx/adma.c b/drivers/dma/ppc4xx/adma.c
index 279a431ccae3..89e778896d7a 100644
--- a/drivers/dma/ppc4xx/adma.c
+++ b/drivers/dma/ppc4xx/adma.c
@@ -4156,8 +4156,22 @@ static int ppc440spe_adma_probe(struct platform_device *ofdev)
 		}
 		chan->pdest = dma_map_page(&ofdev->dev, chan->pdest_page, 0,
 					   PAGE_SIZE, DMA_BIDIRECTIONAL);
+		if (dma_mapping_error(&ofdev->dev, chan->pdest)) {
+			__free_page(chan->pdest_page);
+			__free_page(chan->qdest_page);
+			ret = -ENOMEM;
+			goto out;
+		}
 		chan->qdest = dma_map_page(&ofdev->dev, chan->qdest_page, 0,
 					   PAGE_SIZE, DMA_BIDIRECTIONAL);
+		if (dma_mapping_error(&ofdev->dev, chan->qdest)) {
+			dma_unmap_page(&ofdev->dev, chan->pdest,
+				       PAGE_SIZE, DMA_BIDIRECTIONAL);
+			__free_page(chan->pdest_page);
+			__free_page(chan->qdest_page);
+			ret = -ENOMEM;
+			goto out;
+		}
 	}
 
 	ref = kmalloc_obj(*ref);
-- 
2.55.0

