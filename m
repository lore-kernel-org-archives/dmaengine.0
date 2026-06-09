Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630E94071FE
	for <dmaengine@vger.kernel.org>; Tue,  9 Jun 2026 22:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781043607; cv=none; b=PjOSJ9ycj+mB//6vUSJnGJVVxDrhMuQcwlv3G86PDqXUEH6NH7H7+UwHsZrFBs60uOZiexW8Za4OHkrqR8dputiX0tjBvvdzNmDsIprAHDG8Prn45B8uwNOksTs1Mlun2p/NNeCHNKTUrZPjuwp+Efd4e5oYeziyWpiiGDaEdlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781043607; c=relaxed/simple;
	bh=QNstBAc1L91v28F1oF1V1UBDhakUFuGDQ4mwwDQaYVc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r6inpZAo5l0EACCxn60kR3bx55tk6dBCBbglftGaQRBjkO9MRtPGFEjH2K3PtnMqZrcsYcXB4ugS5AbJwaNVXqJYUkQsPwpYAR9Jsg6bQ47A6o4lhmjb6nfrNkQRnqXrIIK5NB0S1EPx4spm5brz3c/1/Ps/Yy/mORJwFGv/zP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oOkkrGal; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oOkkrGal"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c8589498839so2708567a12.2
        for <dmaengine@vger.kernel.org>; Tue, 09 Jun 2026 15:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781043599; x=1781648399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1tT9xKJ0Z4ILZqTxJ8ZpiwY1jbcqBK/pYbLAZ3NF4IQ=;
        b=oOkkrGalBPfrahHB/2lhvZ0ibia84S3xEnmw8VJcr6PUBVDsQErd/MaqJ8pPZIpaNh
         RNSAVGdMceMpBD7IusPlRkTi2E6ErC5YbFKWfGl8aT4vSWPiu/0AjAyqs0cogUmf1Rzz
         ZbjdxBwmrlp7ufEyRXKu4FGZgMneCUJrNsMMC0tLODW19YaFUPNAuExcOdOeY6qIDO0D
         Wp/W65U/RFXoJMyGtVohfWdqQRJNzB5QxQJg/moCI3HbqWIHgD7zhzehW7Zzf7ekTX8u
         PxwWKZ99n7ehOcANvz8u0KF9IlPJwBAVMHVnK8T92r0igfsykZxQa0ChWTlxK2d1OIdc
         0Grg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781043599; x=1781648399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1tT9xKJ0Z4ILZqTxJ8ZpiwY1jbcqBK/pYbLAZ3NF4IQ=;
        b=i6R3J7PpzfuGUCRqu8nwMl9igehkGbYGny+Sgq0UTo0Rx/xWoYUd6gtsbTY21zTQZw
         ehENX5NDnnDmUwvwnnZg3fyjOsQuxMysXUDvXFyvbkXVYwhUJW/UQiCYluC+YSkMfZ+W
         j3P+7zLSRoc9AoKh+aTs/zyXwpjT2Iw0qbzOPpMGlH7o7KknAXLEmHtD57dC9WTc1eXk
         jTwCtimFQcraVlZOPHiJUgNYfq6ZzvI/r5w4Ok0BtOg41yccd58y84zFfbIylVg1oKrL
         NYcHdC1a8FNo38I7P/8uB+bzL6I3fvohJCKR/Vxxlf9hEumdxwBZxRwLSLKDhQLBKRR3
         4pFw==
X-Gm-Message-State: AOJu0YxHUz8PPbMSKVOcUecmkl+qp2P/fARjCPoz3zjmStiLLUO+fZ8d
	430lbTmC7q1sxPEaFIPkU52xUh9vYnqmKhVpf9OdvYotPe0JEgIc3005vtCNT/2I
X-Gm-Gg: Acq92OFzzQqEJ103582DNpAODvfU/1DUe0J27FH1RyaBtsw72KyBZ2+50xLgtiXjHz0
	5fqMiHnw5vonYjZQ7MVXqLfwyMvSwqLX8YPDhIdtgzZ6kMaH6w9F5wpRew3+O4ua6UqYBSb0/HN
	vwVp/wAWpStkp09K+9CwgqrZgPHCsbjQd7mIMtWxlR6g402oDu2QutpOyJ88Kk/qEcORsta1lFU
	a/4wASRbvscndyr+fPjZj/MnN1PMPzbGpFag8dEbGnoQ9iA+5JxsNt0bASzYJvASVcVufDdiX7j
	ovJb9Vo6Yowv02eBkmu2hjlNsoeNPC5Cj7rIom/AfaqfUscooc5qIs5q4wNWwepQ1X3uZGlJwYz
	xC75lpMe6IKNNHqZZDTtjJJI+mQhgvvQdx64oscaCNlEyZD0YkjnHa1zcwOyObLxfPBbsa1KJh/
	6F9HhIr2+W5O7l1Qh2VpyVVyMEqB7ok0gMgRgbfzydAzA+Ubxl91jccEk9Q9FkyD5UoJDhwYGb7
	ahGh66dRfdz5tFqGKd60v7Gv5rQiPpKhfZ80DLD45sd0w==
X-Received: by 2002:a05:6a21:104:b0:3b4:7eb0:479f with SMTP id adf61e73a8af0-3b4ccd3a851mr24318303637.5.1781043599239;
        Tue, 09 Jun 2026 15:19:59 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df04ff24sm19661834a12.14.2026.06.09.15.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 15:19:58 -0700 (PDT)
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
Subject: [PATCHv3 07/15] dmaengine: fsldma: fix request_irqs unwind freeing unregistered IRQ
Date: Tue,  9 Jun 2026 15:19:18 -0700
Message-ID: <20260609221926.35538-8-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609221926.35538-1-rosenp@gmail.com>
References: <20260609221926.35538-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When fsldma_request_irqs() fails on a per-channel IRQ, the unwind
loop starts at the current index i, which calls free_irq() on the
IRQ that request_irq() just failed to register.  Decrement i before
the loop to skip the failed channel.

Bug introduced by commit 586f54672b33 ("dmaengine: fsldma: convert
to platform_get_irq_optional()").

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/fsldma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index 4475d50a94f5..c04a7fbd2ed0 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -1088,7 +1088,7 @@ static int fsldma_request_irqs(struct fsldma_device *fdev)
 	return 0;
 
 out_unwind:
-	for (/* none */; i >= 0; i--) {
+	for (i--; i >= 0; i--) {
 		chan = fdev->chan[i];
 		if (!chan)
 			continue;
-- 
2.54.0

