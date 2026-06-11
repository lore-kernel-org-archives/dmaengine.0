Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780D233ADB5
	for <dmaengine@vger.kernel.org>; Thu, 11 Jun 2026 03:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781150009; cv=none; b=KVo3V/MM2qMWNtjFJ81XCKXZrrKIytCCS5PkH3sqVTeM5B/LnEUC2QwfyGP3ArGONUgBINmkR46qLZXADQJqTUYc5pTJUZaNIIAhiq9nhCECbkAx0iKgP1kvb6/R34WegjPyF4KPiB/iQ4oSCEyZVIgrbNpgZudKUcbWLfQ4WU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781150009; c=relaxed/simple;
	bh=Yy/+xRHJiX/hDJ5xQsjisJqg3r4yly3VHd3NS0SNXAk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bhTDVILh955sXpox0fB9RlR/6EFAAAi/z+MqIhZCGryZicfaMsN3LEelXLMWqRtThABhR6Kt5YwXmuoz/c9RnR4dpL+6R88IMsf+grLfLVobZQG2s/MTTvXHmmeqq38NyL0he6oC5xAydirZE371y8LDm5XzVwKWRA4m0pTts48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iTc9+OyB; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iTc9+OyB"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-36bdb11bf8bso4426765a91.0
        for <dmaengine@vger.kernel.org>; Wed, 10 Jun 2026 20:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781150006; x=1781754806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9N+wW4hckA7+pUN5DQbu3VTnKoKBAMqPRZDxheSBFcw=;
        b=iTc9+OyB0Ta1O9T3y2riFYWqWEQPrAaZSZo2mHggfUU5NWaURzi/glz+Bo68MB96Av
         1gChjETzOMjxyDVJV+XaVkJJM41qo0pmOfg6D869ZIs2qb1MoivXfEylxbo9nxyIsm1X
         LrwNqXyiQru12IPic7eXppJF7UV+Q5TvuEAYN8U5GwiushSZPctxBfjflxIKWlP94KAT
         pj2gknfJ7P+AB49H2udexJen3o658Jxp+X/aMQKjhoskGD5UtcgettEX3Tm+rVYMP7HM
         K+jGP3glH8VysvLmFzj5G/5xv7LdWleNjI5A1Dp1VX9ZE2MrWdR1qM0ni9K6Pm9gEujh
         XrCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781150006; x=1781754806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9N+wW4hckA7+pUN5DQbu3VTnKoKBAMqPRZDxheSBFcw=;
        b=ObivXsT1PXNGEDgZMIR6FWXSMJUThytdd/jjjFeWb26M4m2l7b2Qkiw72C1b6PDc6V
         NK7Sh4DUlz8r6cURdViNtEOlWm+Wa14j1tzOx5kzRVzSAUhtZ2zcXRNNxpMz3iy3LeMN
         F3H+WVM0Aqf27oKtK/93JFRglkJ/bvd2M7fb5w/t1iwONFi8YZN+oUnyRTcpPQJqIm0W
         /41g0qeugVDVgr4C+21jk1WydY7M3ri7FZJB1Bw3Ct1ZnhfhfhBElgNE2C/6DZZJ9GHL
         t22cjcisnRQmH9knH4nyNLvDxHWqz5Z6Urhfc/bQYkB2eQnABUdoB1s5vlozzKh4zSUu
         k73Q==
X-Gm-Message-State: AOJu0YyuaVCZqH3b3BDK9h5Ub29aPofVyb7DhB9+HwbVPuYFeA3E0ZiA
	4L3ZyxkojWXcGR6JAxA7cczXt27TfKLy/g6GhgmZ0eDNmVHaqCQAKcwCzcO4fw==
X-Gm-Gg: Acq92OGxjKAxz6eIT6Am6jtvaQoeVzhm809Qsu3dqyTBeHxFhG97KKZI9e6TIjq4sNI
	cutRtB7NWLOcBYZ50rh/R1MyjhYQoNu4939uKRDfphXMFfvyJxakKp1ZobET1TH1dwVgTkrCch0
	Nl7z24iht6cX5DkKLvLX23gS2I2wJ4RbDjUGBCINYrFJKjSqrsXkIgCTDZfLlCa0Ev6zpxYZDQX
	JXRl28qbk+Iuyt7aLjtHDNG5MYH/Bq2CQFQi94HUTqp020j/20LyowoiE2kiNf/ph9dD2qw7IY/
	TemCyhnsWZhrCshl2xedRJRio6lisQzdjzI8F3V3v5YcjKkvBb88rGfig8aoBmRm8l0IH3WpN/n
	VM5dXTTEtXLBzRzgnMsgocoEA5G54p1CgtAJzpBCkc5NK0OW1tQmtk+doBugZeZfEmsw8hhE8U5
	2gF99DMJgN98Zt/r/rOyOGDjA5dWJir+vxAQYF890bBmUIyULRnV7dAiyQBWy8tL9OEJztx9JoS
	85XmYZx2wRQg39MIILrVsM9sLpYFKxhxO3KoAanYMcr2A==
X-Received: by 2002:a17:90b:1a84:b0:369:f48a:f24b with SMTP id 98e67ed59e1d1-3778ebecbeemr1357925a91.0.1781150005805;
        Wed, 10 Jun 2026 20:53:25 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-377522a188asm910131a91.3.2026.06.10.20.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 20:53:25 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Zhang Wei <zw@zh-kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	linuxppc-dev@lists.ozlabs.org (open list:FREESCALE DMA DRIVER),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCHv4 15/15] dmaengine: fsldma: fix kernel-doc param names to match function signatures
Date: Wed, 10 Jun 2026 20:52:45 -0700
Message-ID: <20260611035245.13439-16-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260611035245.13439-1-rosenp@gmail.com>
References: <20260611035245.13439-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix kernel-doc warnings where the documented parameter names
(@chan) no longer match the actual function signatures (@dchan),
and add the missing @cookie and @txstate parameters to
fsl_tx_status.

These are pre-existing mismatches that predate the recent
devm conversion series.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/fsldma.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index 157db416eaaf..694c1b12bf2b 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -685,7 +685,7 @@ static void fsldma_cleanup_descriptors(struct fsldma_chan *chan)
 
 /**
  * fsl_dma_alloc_chan_resources - Allocate resources for DMA channel.
- * @chan : Freescale DMA channel
+ * @dchan : Freescale DMA channel
  *
  * This function will create a dma pool for descriptor allocation.
  *
@@ -742,7 +742,7 @@ static void fsldma_free_desc_list_reverse(struct fsldma_chan *chan,
 
 /**
  * fsl_dma_free_chan_resources - Free all resources of the channel.
- * @chan : Freescale DMA channel
+ * @dchan : Freescale DMA channel
  */
 static void fsl_dma_free_chan_resources(struct dma_chan *dchan)
 {
@@ -878,7 +878,7 @@ static int fsl_dma_device_config(struct dma_chan *dchan,
 
 /**
  * fsl_dma_memcpy_issue_pending - Issue the DMA start command
- * @chan : Freescale DMA channel
+ * @dchan : Freescale DMA channel
  */
 static void fsl_dma_memcpy_issue_pending(struct dma_chan *dchan)
 {
@@ -891,7 +891,9 @@ static void fsl_dma_memcpy_issue_pending(struct dma_chan *dchan)
 
 /**
  * fsl_tx_status - Determine the DMA status
- * @chan : Freescale DMA channel
+ * @dchan : Freescale DMA channel
+ * @cookie : DMA transaction identifier
+ * @txstate : DMA transaction state
  */
 static enum dma_status fsl_tx_status(struct dma_chan *dchan,
 					dma_cookie_t cookie,
-- 
2.54.0

