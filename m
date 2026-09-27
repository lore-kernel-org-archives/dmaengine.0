Received: from mail-qk2-f41.google.com (mail-qk2-f41.google.com [74.125.230.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C25353A7E
	for <dmaengine@vger.kernel.org>; Sun, 27 Sep 2026 20:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790542350; cv=none; b=fo+AyzkSZ377OMigJtXWXJoUbA0b4cTuVS2MaVqauj0IseDdrThOMnaxGSsNw7PR7UKuRM49xxfmTvixiSQJgcKAUVTGZ0cxTXR9M0UQU3UjYRQfagounMz5Sig/wBKEVhSUkgp62g01kVjS51P3jfLSQ+079t2i3INY/J44w64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790542350; c=relaxed/simple;
	bh=t6xMn2L9d8s2ZCbQSuTC15GbJiy2EoeNXqPok1pTSm4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Yv0lujzo0q8G4n7ZibNZIocD3nDwtRXWTFd7iKeGJ1j8q0UXaMBs00DTtn3yfF4YQYi201WejbxWOlvqPzr1qtjjE6wi/VpkGqE3gMLIg7maqk2EixoIjiaObFSXKCc1zwrozo2XZJUgmjkEXVcV8Us04xYoDNcKFeDVNTtM94A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZT056UXK; arc=none smtp.client-ip=74.125.230.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZT056UXK"
Received: by mail-qk2-f41.google.com with SMTP id af79cd13be357-93bfa7b2093so281136185a.1
        for <dmaengine@vger.kernel.org>; Sun, 27 Sep 2026 13:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790542348; x=1791147148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HnxJD5ci4IByxWX6EfsPiJVcCaBAaDyK9ZZdVOk4Rrc=;
        b=ZT056UXK6hCtnkIHLujja5X/VtVxGv9NcumFDxrZPTw3hHlGcE96x828Dkf9Fzrz3M
         jI7Qarz0VtgGd0Qn5m+ldpEhiOGulCL9PrIwREQrtbQUwYBqMAR+AXkH4SJ8kD9eSAZx
         Mv6t6nxe5oCIeglmxDkaa4sdfUPuLdelvP3usbzEtp9oG8jNW8wqhGKNIMloLSgfWgfx
         qR5Rf09BNVtnrMtnpEmwXS498XJtZDiI/ZpDPGjILj8CM5+SSxsZ49CdkK4722qnmaFh
         p8oEkiDiyEcTPXB9TfnRihcOT5cHibOoFxDSSYxjRcedaKnDSoHY/YPrCsNtpeFtJr/I
         b2Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790542348; x=1791147148;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HnxJD5ci4IByxWX6EfsPiJVcCaBAaDyK9ZZdVOk4Rrc=;
        b=JJGc3Lqj67aV8IHtcbhJ834nY151C+BUil0u1dp0ohieFRo4Uq/7nAVVyxM1K8k1s/
         VBv5MxADZhiwjD9/7htaal9oKWlmA/kMO5XtZ0akrQIUSKfn3X7hhEIEaV3a8jGkETk8
         iVvZsWYVC9aYDfvxg35JboqCp8GHKff4ZIT8ssqKwxaUVDJa0PmM1Gq3TfDZSiPmuQMP
         TQp+waa2UPT6xFvnSc3ZJUqcSFu8p+ZhzAB7j5ZptXC4/lkYt4L9JPvoo9Fpgyr5cgaf
         CflU7QcoSWdMvGTvhPr1OYztDYkBZTeqIumlmNKa2mghVhZtu9CD4qn3pUR4CF2mUHgt
         h2ZQ==
X-Gm-Message-State: AFuF++kBJcKTA5Zp6j3PG4bycot7GOsZy2Od+3KZwdjV4qDLq4NGpjzm
	SqudqErJk79+Cb6acdEqRS58EvKVfnSbGLAvXwgQzuH5HlkFjM9nAmAvxuqtXWeC
X-Gm-Gg: AYBFou1hA9/2LYHcPpezP/HOvO5gtM3C8I26Q1hdQuLkp7OTf5uS9elMc2FbTJF5D4q
	BASGS7y+bDOnUlKJ8ncsoS7EWD0aEiOwxhpK7kZvFUChU9xwGJhxsZaxWdV/iT8crophyorzsjp
	qnPwJ7RdUv0UEB8DuuN0vMVpug8r4aM0VDAeqBFxm0nr5jGWcAH0KozQxLGYfhjeU8NEXK/Mq78
	NmXdH9cJ2yR/SqIgQJmgKpT1SZ2d/2ieDwVYf3ECQSgkjpdtOI34WiLMnhCDCRKsDXhUVfG3Iq6
	UD56ga3+xpSm9vIdpYtKSqIwvN0xRc8MfjhQwwHJB8BD/qELcI76A08j0IN9eAXPgIxOLtT1WYV
	LfLUOEaG5bU/MG2kYtoZyCrvZk5KEaQHM283CZaZYhM+eI7i5Z95S3FHW30WwhtlG/fpDAyWoiB
	rMTogNwSGrCEiN5wLRPEezlybPjozJ8efiIFSOq+99TuR02CaMvAMcuUsMo7wAoeWkPGIacJsUQ
	izIfu0pajFNSIgtgPTIl/xgPx37OroIk2gtYLLbdv8Uxd+E6t1fsiffjPFdSkeREmAiwj3KYYfZ
	emRAJsbC+UEkoUck4fZnoRfY1KNnxOmoX6PlfltsofCw/R4o
X-Received: by 2002:a05:620a:bd4:b0:939:57ca:7e06 with SMTP id af79cd13be357-93c43c306f6mr1758205385a.9.1790542347934;
        Sun, 27 Sep 2026 13:52:27 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c6a38594esm267970885a.35.2026.09.27.13.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 13:52:27 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] dmaengine: fsl_raid: use !desc for NULL check
Date: Sun, 27 Sep 2026 13:52:24 -0700
Message-ID: <20260927205224.29640-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

<= 0 is flagged by sparse as being used for integer, not pointer
comparison. Fix the warning.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/fsl_raid.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
index 9cc289f7129e..8e7026682d0a 100644
--- a/drivers/dma/fsl_raid.c
+++ b/drivers/dma/fsl_raid.c
@@ -346,7 +346,7 @@ static struct dma_async_tx_descriptor *fsl_re_prep_dma_genq(
 	}
 
 	desc = fsl_re_chan_alloc_desc(re_chan, flags);
-	if (desc <= 0)
+	if (!desc)
 		return NULL;
 
 	if (scf && (flags & DMA_PREP_CONTINUE)) {
@@ -470,7 +470,7 @@ static struct dma_async_tx_descriptor *fsl_re_prep_dma_pq(
 		src_cnt += 3;
 
 	desc = fsl_re_chan_alloc_desc(re_chan, flags);
-	if (desc <= 0)
+	if (!desc)
 		return NULL;
 
 	/* Filling GenQQ CDB */
@@ -554,7 +554,7 @@ static struct dma_async_tx_descriptor *fsl_re_prep_dma_memcpy(
 	}
 
 	desc = fsl_re_chan_alloc_desc(re_chan, flags);
-	if (desc <= 0)
+	if (!desc)
 		return NULL;
 
 	/* Filling move CDB */
-- 
2.55.0

