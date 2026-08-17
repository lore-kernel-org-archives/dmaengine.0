Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A684B04AB
	for <dmaengine@vger.kernel.org>; Mon, 17 Aug 2026 01:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786931871; cv=none; b=d/+YCUgWRy/ikDuMmXCVitDF6xhfaUBfMU+CdFFjmmuktCGvxQ2DZvcfJdBdsDHuifqmLSRNo81qk8TNDo+COOgitQxb+tq3ybq0S8yRtZHu5xl86fCLXV++0aGN85+1K/xBOVzrO9f7MraudPUmli0fjDCgERltCtfx9YfHssQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786931871; c=relaxed/simple;
	bh=Hz4ObJV+aM2uhAt/A/zHmZJqxzUXNUNqj/B6kGUdPI8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ITailq0q/XSu/L4msZaDR1y6GLk2KlwhvPfzKeIJkn4ta25z12g9pd7JZzABhoyU3DR/j4DyujfGrstprop+IdhSPITAToLkL3In4UvYaNJm186jua87tzvTy6pr4zeXxcLrWc46Omf9D4K1uw4L7wV+Ef7hkpoX+dZ1a2BhcFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q2/fmjiI; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q2/fmjiI"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38de840f2f0so2334015a91.0
        for <dmaengine@vger.kernel.org>; Sun, 16 Aug 2026 18:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786931870; x=1787536670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qno0hu8R5c/iO9pOePKA/0ucg9v1/4p0E3krT4EeorE=;
        b=q2/fmjiIQ9PNCZyTOXwVtybkiQBjiWlByM4Jv7ThOPR57VkzoaH57O4OuvrTB2edfz
         zPKgK9srUb/1s8oG+QTM/CHCtMtsk22X0+h3HvYO04jcD0q0VZ94j3R9Nh3E6ythUci+
         tBv/NX0O8Jd9naYAvzHzZ9ekuO5PrVPeidHSpPSGb28IcJBVDMit48OU/oV6XraTHfTS
         ozuIlmLBULSnjVaEAkSUXPEoRTkI+EA4r179UPU5oyO3doqgSSe3p265iqWpu6LQSnwP
         /+zKxfcgZwLSArwQxiNn+sCGrbiNJfszeERwEYwNgSapm515av4MAWZkOxkiJsdaGzEV
         LCkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786931870; x=1787536670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qno0hu8R5c/iO9pOePKA/0ucg9v1/4p0E3krT4EeorE=;
        b=bcmDk4+NnWF57sAXSvn1oGSaWT1BxnrdtnKP+AVWH07qBVICvCep0iAXaniF5Y5rqi
         t5+iAfipX2Tu8jFY3GLK70w4UvdoOrjbX2Nq9Dkg8/VOb/OcbeKAybODDNGFr+gzhp1R
         DCKhLFAtU5qTqhCv8y8sxVQQ55P+Nosz0rRWqX1PEtiRi9XGwSrzZFn0M5sorNl9nRXB
         fxTweOAMIRnlUBK3nFMrQ05Rv3EmTXiXD0l5rqO4tcaXUDdDasILLDKS4qjsspzBEti2
         Z5yEdUmF5/ubke8cFE5W+JS4s6hUYDH8/lUCojTVuSNiID4WnB7K9+Ib60AIF5+hj7zl
         53MA==
X-Gm-Message-State: AOJu0YwoMMo+GKOV+PyEuo+SnZ8vcGVwDx4SyxSDMCpPH3g1pZmIiNIe
	OJWQFS1YAuCLKDzhBXHB/8vOiOSEIDi95GmQNgXHFDa2gXSBt1UQtEeywAIxPQ==
X-Gm-Gg: AR+sD10vxRnbdAYODHFSK0v67ttDDFywEul9wAgyYGmkIaUea1fQfbChCBDY6kqPYw2
	egA6RVGVFj7FlZStyLyyu8Yr70a6uFlC4pNmEUakW9POWqz9KmTw2UnBudfZgozI7bZvIrXXU6h
	BsIQ+UGICsLkgi0kUCxASSroW+dD6YYzMso/MYDFROEh5ADzMTc+WX1EHUNj7t8kBYY+0uYsjMN
	rWrnns5UC0g0lUbUF3VgUK6XaHKso1MOvF1wytHA2sA6CMEHEiVDmYSxnrlY59U6PAbYjOT1fMc
	x5WMSv98GjDeXvEZgDdtIq/0XpTZjHuBstcgwFTp3y41tBeaPh3AJekaRfr7HcPWVT1JYiJdW/B
	PGMHfJB5ckzTx5vR0Mjr6zwHNkce9zuK+l6XUgciCS8fvlCBvxEu74YyUmzpNxxIteYp6bkDb95
	EoUDSATqnqZcmmaj5shvqOTMVjkvmqpKcC4Q1ZQFfBSfP+xMAqnRK5Izi6H46FBufuzFdp4L3eM
	be91Q1i1pls9Rd/JfkDWj33HkgE7AAugiuHGQvhzKfkqo8MwMKBgyjEcgraygwWg7S6+AwdkHxx
	m69MUpKJgkLFaSiQlP8ZkgQ9WSRwgNIJxF+qCTLHhdWMi7Nh2Q==
X-Received: by 2002:a17:90b:1d45:b0:366:10f1:3d91 with SMTP id 98e67ed59e1d1-3933b7c3b71mr22482431a91.1.1786931869565;
        Sun, 16 Aug 2026 18:57:49 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3933b68adefsm4249481a91.3.2026.08.16.18.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 18:57:49 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] dmaengine: bestcomm: ata: drop unused inc local
Date: Sun, 16 Aug 2026 18:57:47 -0700
Message-ID: <20260817015747.136689-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bcom_ata_init() declared and assigned a struct bcom_ata_inc *inc that
was never read, tripping clang -Wunused-but-set-variable:

  drivers/dma/bestcomm/ata.c:58:23: error: variable 'inc' set but not
  used [-Werror,-Wunused-but-set-variable]
     58 |         struct bcom_ata_inc *inc;
        |                              ^

Drop the declaration and the bcom_task_inc() call that fed it.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/bestcomm/ata.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/dma/bestcomm/ata.c b/drivers/dma/bestcomm/ata.c
index 502a45d76adc..40126f3f189e 100644
--- a/drivers/dma/bestcomm/ata.c
+++ b/drivers/dma/bestcomm/ata.c
@@ -55,7 +55,6 @@ bcom_ata_init(int queue_len, int maxbufsize)
 {
 	struct bcom_task *tsk;
 	struct bcom_ata_var *var;
-	struct bcom_ata_inc *inc;
 
 	/* Prefetch breaks ATA DMA.  Turn it off for ATA DMA */
 	bcom_disable_prefetch();
@@ -69,7 +68,6 @@ bcom_ata_init(int queue_len, int maxbufsize)
 	bcom_ata_reset_bd(tsk);
 
 	var = (struct bcom_ata_var *) bcom_task_var(tsk->tasknum);
-	inc = (struct bcom_ata_inc *) bcom_task_inc(tsk->tasknum);
 
 	if (bcom_load_image(tsk->tasknum, bcom_ata_task)) {
 		bcom_task_free(tsk);
-- 
2.55.0

