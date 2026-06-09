Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6183EBF0F
	for <dmaengine@vger.kernel.org>; Tue,  9 Jun 2026 22:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781043595; cv=none; b=Z8Wg6hw4/2rx0DT6BDHE+ybxSLcnkGpxFpJfi7SobJqWk8ptiup2Ia5bu0uf0lbF5Yw95S/HSfTGLs7sg5i1G4BQOnbwwBeBJ4I1RSfBlmHfxvR6GLxtXYZgu8TKLXwlyKNKBefi/tVKZi55XG7o1zOT4kwd7IBZoLN5a+LKwnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781043595; c=relaxed/simple;
	bh=RhXIYqhBSB+K4Y9o4QC7TbeT9dbJgsSR8y4PjJxpvyg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lz5IHwu6E/yt0igY4KlesXV1i5FdnYDV+SF7Sp43QOFmuqF8Fl/z6CKPhsH+37p8Zq0kn2cFMM/K8h2l+I6v9h1RkUV9ur2weLPSNWZeupfiV0WgQ5X3HTC+ILQGF2XaxdJHZmLS+Tq4zT6RE0oYneqevdJpMx9CcUZQKeV7ZKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DelHqHQ9; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DelHqHQ9"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2bf18c30bb2so44026345ad.0
        for <dmaengine@vger.kernel.org>; Tue, 09 Jun 2026 15:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781043593; x=1781648393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tNx4Xy1KooduVSVGOlll8hTxHBnljmtg7WB5wHO3xtI=;
        b=DelHqHQ9mmbMGkTL9idnRcVnHeUa1XLnhsSYteotP9/kqskhn8lqe+P1nFlC8OQmwQ
         Cx+fHosbh/WDvrig3xjm+Ze5M043BoQAGsqF9L1pEhJtiyf4eradnjPwYADQTSh2tnZ8
         1Q2dvv2IUC+bCffJ7C1o6oRS2mSdJ2KaapK26lYuaZBYn9fellzulMLEcN5vT67LEx/P
         2ffWFvu5xe+ujE7iienzP0U5Y14dbRSa/MERfB3AwnI+CSZWugCGmQMTtR4lLxhxwTXn
         bt28T/vaSgYKO6caNBI4m7K4xkkNgzEPhmB1ye6gzW0nEqY8boD1kAloc04vClknpCDB
         GP0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781043593; x=1781648393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tNx4Xy1KooduVSVGOlll8hTxHBnljmtg7WB5wHO3xtI=;
        b=f2jJbPSaWSN3ldpYasDdH8kq/kixSqWhK41+PGEjZAVCEXmmO1Oeoe8uWuVRy3BbJv
         +8XsW0xp5Ohqn3b6BNBbS2XuDrxrYspWLkqHbPSJlQ+ox4v6+9PnGXy0CtQ/90SS9l5W
         2PlbmZliYhL5238v15jUoG9M+w5vW34AQ0L1yoVCHlI9uHL3OzGlYPIYRKTdxnukgiM2
         qd3UkgfhGivZBkb8PNTc9Ub5KZp9CgRrP9aAvPXxFFXN6OK5/GYyjLXfHYz/P0OhbQvh
         RedccS9fz0Xawp+8OXB0+PduoaHbJzjEWUfLvCEPkyVPmXDAZ+i7d7ixEq8PPmKyf3/G
         S5HQ==
X-Gm-Message-State: AOJu0Yxr4TV4W8jXNfYPedPyqoJAwKcJkU3U8xmXMq26WEcAbnLW3eLf
	rCqUWib1i6Ef3xbSlxQRXP9BRN9RYHWzmhjwu6lDg0pQkBAt+xwX483mcZeiMSSY
X-Gm-Gg: Acq92OGwDG+o7UiehGHs7SJCl6GDEf4EyOBRHvFaq4l9W/ZI+SNFqsaXrXlcZKVwRKl
	bS0M1a0I2RunLYx01TI5IlojocZiSnWgMxhYi00Nw3u65ZFvNqBH6vz5Pc5WS42zw4pL31iKU6v
	9FONvfiM+UumN4qlDSz5ejAdKUhGxsZbzeRustdQZf59IYm/5WutWoYQZCfY52NKmTw23+3wbiN
	UwxAojmh2/DlemsBcwEKYZe2s23XIeNzuNN2Zw5VrGLPFV/QDkvF1ZoCh7khc9P/gSklwennkIE
	oGO68+l8XBcooHNTFvXqQY/55fNh7OsJ7SGJM9TNhvYnCG+ltUushBpHsTYTp+NXeLTrdEz8wDy
	2cpHVaTmcj0LYyJIt9tE4WyHfcxJnxNSrpw8EtCymFjrYFE4fMZNoYbc6Qwdg4ahA6tSqwVYy+Z
	NsXqcmfVXTcXPSdCc9aOCfJF1+MD7t91jRCYaySEsU/NIPb+efSIDMnH6VN8Gg9VJ8b34PjTLg9
	gHP3vnXUgye5b4/W82FJvhPLTFr00cvdFHY0mIqvPEp7Q==
X-Received: by 2002:a05:6a21:6113:b0:3b3:65c4:c680 with SMTP id adf61e73a8af0-3b4ccf7f2b8mr29078053637.25.1781043593166;
        Tue, 09 Jun 2026 15:19:53 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df04ff24sm19661834a12.14.2026.06.09.15.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 15:19:52 -0700 (PDT)
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
Subject: [PATCHv3 03/15] dmaengine: fsldma: halt DMA engine before freeing resources
Date: Tue,  9 Jun 2026 15:19:14 -0700
Message-ID: <20260609221926.35538-4-rosenp@gmail.com>
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

When a channel is released (fsl_dma_free_chan_resources) or the driver is
unbound (fsl_dma_chan_remove), the descriptor pool and channel resources
are freed without stopping the DMA hardware first.  An active transfer
could continue executing in the background, fetching descriptors or
writing data to physical memory pages that have already been freed.

Fix by calling dma_halt() in both paths before cleaning up, matching
the pattern already used in fsl_dma_device_terminate_all().

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/fsldma.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index 455d21d738de..1ba10d065278 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -748,6 +748,7 @@ static void fsl_dma_free_chan_resources(struct dma_chan *dchan)
 
 	chan_dbg(chan, "free all channel resources\n");
 	spin_lock_bh(&chan->desc_lock);
+	dma_halt(chan);
 	fsldma_cleanup_descriptors(chan);
 	fsldma_free_desc_list(chan, &chan->ld_pending);
 	fsldma_free_desc_list(chan, &chan->ld_running);
@@ -1207,6 +1208,10 @@ static int fsl_dma_chan_probe(struct fsldma_device *fdev,
 
 static void fsl_dma_chan_remove(struct fsldma_chan *chan)
 {
+	spin_lock_bh(&chan->desc_lock);
+	dma_halt(chan);
+	spin_unlock_bh(&chan->desc_lock);
+
 	tasklet_kill(&chan->tasklet);
 	irq_dispose_mapping(chan->irq);
 	list_del(&chan->common.device_node);
-- 
2.54.0

