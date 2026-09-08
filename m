Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80E04968EF
	for <dmaengine@vger.kernel.org>; Tue,  8 Sep 2026 21:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788903220; cv=none; b=dlmg4rzAkcICzuRB/dze4ZBndy0/F4Kl68l2whHzN6yGs6KzI1vgbesRUrIZcGdS3iSG4FY6nUp10pTu/hTN6B64GUxoEqpveg1dDfVmT9t12LilGQgwtyQDy5Ool2ykvzUil2mOUH95y+6BKA51MjDD0NB/+LwXVBglZJj7Byc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788903220; c=relaxed/simple;
	bh=gQYMQIZ0a0qQpuJQGl9sxe6tSFIiwDa+pVKYc1H04vk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EVCsHJ+YMXhVdUgj2ub/9sHTqWe994+MS18/dtvpjYP4F0kfPC/zuPOIIH8thk6e1fOsRggAVNDREso6zpNQi2b4gemvqJfcdvy4V8qxMfBYRiTgEv5Q2yYY2kgocGf3l+ZoRaPUJd76eKpxOexlAoKbU2jfCmLjE1EW7LzSQVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mnxykDN6; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mnxykDN6"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d94c868ea5so51421955ad.3
        for <dmaengine@vger.kernel.org>; Tue, 08 Sep 2026 14:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788903218; x=1789508018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yHiWJUkqXIHHnljOBGvidp4XfKDa865c5NPgCl6nJgk=;
        b=mnxykDN6MG7lKokO4lIuXto15ET5eg4fZ+6tV2sglQPz2txkLps9M06CHFBSVsXupR
         EX6t+pZA37xFldmE7Yt3XCEATvl5kAmL0cpMGuhNVkv+aa8LSrce9OEwVfr88cEhoX7w
         mCJ4Ld4F8BeWPwkVV5agP1SQRw7k61LIA0C3pn2qx2GpfWYixWteqodoJub28k+/ngt7
         402sNcEr4EV9hMj9nasdR0fM1ID0MUX/J0nAgURSN/epn5reO8GBu40Z0M50Xnbx/2ot
         yRZ95c4j0rFNqXyy4VI351vl28RSXOUHiCqkklJIR44SwitSzw0cvicTGDPAUptMUcz3
         0vtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788903218; x=1789508018;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yHiWJUkqXIHHnljOBGvidp4XfKDa865c5NPgCl6nJgk=;
        b=GHu4aqWvGmoVbWlCDYEy2aL5gnPUde4oVELtLV3gqi2NJKhpjB+LrABuW5ukWdKIN5
         ddZyi+Yrq5XOagCnaYMyw8qW1WczHKoM59eWR8BrdEWcLvyzCg4AFxXq8kdRNJ+aAzr9
         bwpkrkXN9pc1fyTGWFIxaPEmGoInbSozzcjHnkuJsxAeus3g3oJ8y7/USQcy+J/B2eKw
         vXUYQ6Y4WbaSNhQhrykrMd1cSqyQjtiNCVOQN6xYSsCJ4JoFBA0NKt4o/zndpPIGj0Ss
         O3rExXjimFs+jRspoTEHNfE3aA9PVG4R/l2LmAO5AWF6UfWZO/jK/m+XOYLQaQpe67dW
         pm/w==
X-Gm-Message-State: AFuF++k5BvD1EnXKD60jI+L4oehuhi4VJeIXMqdHI7boGLyICAM4g2jB
	gLf7xLLdCcvtIrYG1U23N6gS7glfcD2bJ0LiYRZGfOXzNo1BP3cGzuKAFy2nvg==
X-Gm-Gg: AYBFou1F+HFVKy60iysf5pr4YRW7yDGp8hXkkSQv6rBmHx6ra6wAxMFUdu3OWHYbKCI
	9UnT9QrEqm2t3cJed1bDe03y70xrqY3UkD71emHnZYy8P4B4qBkVU49oM1X8xKP6/mMg1PIbk4g
	zRAFv8Il7Tcn6f5WPgOZYRxnhbfMNy0zj8nVtzFm1LNQi/75hVuyNddTxKHu+yj6CZKQc/lN0cM
	L0I+rm3fW6A/5OiHoDK4VGX8tktTJiBJ84xBPotAVoScQrkMCx4kgAFL6iTCUjBI+cRNJX/k5Fi
	/pP3UC3hzRh4+dzVfnW6xzehhA5VQnrAa4yR93pa5DZQAoPYKY6WcXalxIkpTw2wlbgTeVIVNkO
	BzNvzVgbtICMtmX16DCRTa5pldkBRqRxo3Tnf8kVZI7fydLcs7vFZTcI1H+8XMF0/PVANdxqpQe
	i+z2214HtnTXi6anP/m1gz2P7DUbTqNTNz/ywAJUKeZSjkKdJSjG17srpotVDVnXbXS7O/HqbT7
	OXTu5LEG0C458z/fU1zuiivHg5MHGrbX0Q20N8rKtkyEuitB7bd1bTzD8qi8i2XthgEj591s/M7
	RH/yy7HYqDAwYs92B4dj/VIFOc+iceIR6D3eQQ==
X-Received: by 2002:a17:90b:4c41:b0:398:9bd5:490e with SMTP id 98e67ed59e1d1-39b2623ac0fmr46132348a91.21.1788903217940;
        Tue, 08 Sep 2026 14:33:37 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b25f8d2c5sm28700771a91.2.2026.09.08.14.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 14:33:37 -0700 (PDT)
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
Subject: [PATCHv2] dmaengine: bestcomm: ata: drop unused local variable 'inc'
Date: Tue,  8 Sep 2026 14:33:34 -0700
Message-ID: <20260908213334.593584-1-rosenp@gmail.com>
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 v2: use suggested title
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

