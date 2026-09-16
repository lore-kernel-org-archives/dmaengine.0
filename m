Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81FA4C33FF
	for <dmaengine@vger.kernel.org>; Wed, 16 Sep 2026 18:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789583195; cv=none; b=VMGZENjVxxXQSRjdvCbrdLOd9zDm/UASekIzdf8JoPKX4H84ywKq8bJhuaicID5+fhY9zz0GfV9tWkceEwsblFiERFE4yrR2M/oG6jglwDjUR07lY11t8lZpsXsNVM/795Cv7+m6G73xk9lplU5KcytAR3QzqGai1KlMuj2ZCb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789583195; c=relaxed/simple;
	bh=GNxsq3DEd0OupAM1FU8rmNdSLAturH1q9Y3h3zM5v7w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cVViR/lgEzMe/4leqzYY6r6j7eGy8oC44M1SiRU7UuzucGWvVTtCf1WZshKmBqLY+tARPLa7PJtmKg+RN2gENfWwlVoMuiedsWh8y2jSlHHOuDBv/THXU4mMwnTU6LgIUZYjxm4gQrB/rqDsxMv0igrxLTbjwWF2rWaq/dbMp0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dqO57nQE; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dqO57nQE"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747f0b25dso110625ad.2
        for <dmaengine@vger.kernel.org>; Wed, 16 Sep 2026 11:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789583170; x=1790187970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5SYEHHFdFUQMvCrFTNUuus2zKfer/EUyGlnTHD67nkc=;
        b=dqO57nQErKNh1epZ7F5tTAfRQDq9P1uCigFpcabEhERzaQy9Lx5LSsmVWJm4Dqp17K
         DGth5KQWOSPQIs6OR1sZjV5ziXOylx8nza0mzetWmdqX1/+EO7bCfoUPGbVgf80MH0aA
         pLLdmitKpA7kLQSzJ3UaVHZ3otAl5LjUy94YhJvXtxRcJwq1je3TAfAdn11Idtt0Q69x
         IQ8QUJq5QBQvDsZYSb2hnFmWnlAMRwXuKsiu8jxfAY/+6wq8q3rnBkQ0TuViRBUjk7bb
         MZcWtmjNzJ3zLzcG4F844Ce1dMAllm3bqCnFKtj0BFq05qvAdBN33yoqRS6wbqNW0BFa
         BU2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789583170; x=1790187970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5SYEHHFdFUQMvCrFTNUuus2zKfer/EUyGlnTHD67nkc=;
        b=Y994+9XkZwmpy78dj8GTVLcFt+mQGA+QBJsYH9KTi9XSgeJw9etO4iyND7SztApfd2
         UE9FV9WSwWA9ouaWvqxqtfP0D2hQi4dhVdI5hJkVAKYMsUuNeKTl/4kO+GbTikwS67GE
         NTY6g4YtCKA2XBcBQ10ulQ8naB+2w33KGs/ETf30JlwMjkXzWbhjiOqavL1o0QCsUD/o
         MdHrPv3YHqERwzkz2KXLn/Z9mPRNplQU7kcpaQuclqpeRULXDf8f4/X1BR4ibj3VN9CB
         Q5DdhZNseBWS5lr5nH3P0bxhTZg04fDDDU88CWa/uu5OF4Q4WUnc5pgVjmLpnLSFFbyq
         OOlQ==
X-Gm-Message-State: AFuF++l/njthzuyQCYLfctEqZ5kspmRMCMnTiqxAIx/elL/netW43wwb
	kC1/gpsmr+DX/Da296JPqM0QyUCMexaZ2ayVQAvXb+tB8v2+sNGvgmDEKuTJm5Fo
X-Gm-Gg: AYBFou0HNeZWdX77lNseWISu+30LFqL8VimtfOMb56kTsbnLQMfCjCgaiXIDWdgMCTy
	bwie+dGHZVPxgxICa9uBZS2TQdC+f7ixNaVSIG+5thd+bpT6ub8yPAqwqA79RenLVtP7r1lthNu
	7BHPe63tPa+ayTO06kGaGIkA4LowbuojH9vnH5/CRxMXFbzerxndPOg2OokCgibZZG96mwg59Du
	gm0qBY81+/tTz7KFOJeWfF7Cs3TCvQrnVDFMCwejvebOs3dSl6cadDSdVVnkKJ3qG0HoB4nfngz
	1xdfYxv+wVJhAD1T8FwI9KuBk+RF/b00xrsvts4g9Iekw7rLXYoUKpX5Fu3caEfcSZBwhDiUiUZ
	ybp0ePS/9Z/8DFK4SAS2Ev9/pHKYGnEiPNZL3DB6+o0h6jSyj8OhvBs+s93mfuIkIOGS5twPiCn
	9/VGyhAijhmx6BKAorxVWQJ4jshmRy9ZJDJr+f+7fIbA2N/D48XjYxniUeoCBUNRUOdZZrvkC36
	6k4oACt2UqUajQ4iGxdl+KFPGamhOpoR9P+OCixg+E4/yGMosUYP+lkjI3qOpRPSbhlvb9t5ERH
	MqVfi02h9KDQuhGBzT5iEd25NpCH4/u9ujIezuiYM5MJoFKniP0UtVn7uPM=
X-Received: by 2002:a17:902:ce86:b0:2db:5f00:ff52 with SMTP id d9443c01a7336-2dd8e752f3bmr75342685ad.22.1789583170008;
        Wed, 16 Sep 2026 11:26:10 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89e94383sm16110525ad.18.2026.09.16.11.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 11:26:09 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Stefan Roese <sr@denx.de>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] dmaengine: mv_xor: protect MBUS window access with a spinlock
Date: Wed, 16 Sep 2026 11:26:08 -0700
Message-ID: <20260916182608.13523-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mv_xor_add_io_win() reads and writes shared MBUS window registers
and updates the shared win_start/win_end arrays in mv_xor_device.
Multiple DMA channels can call this function concurrently via
mv_xor_prep_dma_xor(), leading to races where two threads can
select the same free window slot, corrupt the registers, or produce
inconsistent cached state.

Add a spinlock to struct mv_xor_device and hold it across the
register read-modify-write and cache update in mv_xor_add_io_win().

Fixes: 77ff7a706f01 ("mv_xor: Add support for IO (PCIe) src/dst areas")
Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/mv_xor.c | 15 +++++++++++++--
 drivers/dma/mv_xor.h |  1 +
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/mv_xor.c b/drivers/dma/mv_xor.c
index 0de2b1ad5c30..e7c6ec54ce25 100644
--- a/drivers/dma/mv_xor.c
+++ b/drivers/dma/mv_xor.c
@@ -497,11 +497,14 @@ static int mv_xor_add_io_win(struct mv_xor_chan *mv_chan, u32 addr)
 	u8 target, attr;
 	int ret;
 	int i;
+	unsigned long flags;
 
 	/* Nothing needs to get done for the Armada 3700 */
 	if (xordev->xor_type == XOR_ARMADA_37XX)
 		return 0;
 
+	spin_lock_irqsave(&xordev->win_lock, flags);
+
 	/*
 	 * Loop over the cached windows to check, if the requested area
 	 * is already mapped. If this the case, nothing needs to be done
@@ -511,6 +514,7 @@ static int mv_xor_add_io_win(struct mv_xor_chan *mv_chan, u32 addr)
 		if (addr >= xordev->win_start[i] &&
 		    addr <= xordev->win_end[i]) {
 			/* Window is already mapped */
+			spin_unlock_irqrestore(&xordev->win_lock, flags);
 			return 0;
 		}
 	}
@@ -521,8 +525,10 @@ static int mv_xor_add_io_win(struct mv_xor_chan *mv_chan, u32 addr)
 
 	/* If no IO window is found that addr has to be located in SDRAM */
 	ret = mvebu_mbus_get_io_win_info(addr, &size, &target, &attr);
-	if (ret < 0)
+	if (ret < 0) {
+		spin_unlock_irqrestore(&xordev->win_lock, flags);
 		return 0;
+	}
 
 	/*
 	 * Mask the base addr 'addr' according to 'size' read back from the
@@ -540,8 +546,10 @@ static int mv_xor_add_io_win(struct mv_xor_chan *mv_chan, u32 addr)
 
 	/* Set 'i' to the first free window to write the new values to */
 	i = ffs(~win_enable) - 1;
-	if (i >= WINDOW_COUNT)
+	if (i >= WINDOW_COUNT) {
+		spin_unlock_irqrestore(&xordev->win_lock, flags);
 		return -ENOMEM;
+	}
 
 	writel((addr & 0xffff0000) | (attr << 8) | target,
 	       base + WINDOW_BASE(i));
@@ -556,6 +564,8 @@ static int mv_xor_add_io_win(struct mv_xor_chan *mv_chan, u32 addr)
 	writel(win_enable, base + WINDOW_BAR_ENABLE(0));
 	writel(win_enable, base + WINDOW_BAR_ENABLE(1));
 
+	spin_unlock_irqrestore(&xordev->win_lock, flags);
+
 	return 0;
 }
 
@@ -1353,6 +1363,7 @@ static int mv_xor_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, xordev);
 
+	spin_lock_init(&xordev->win_lock);
 
 	/*
 	 * We need to know which type of XOR device we use before
diff --git a/drivers/dma/mv_xor.h b/drivers/dma/mv_xor.h
index c87cefd38a07..034db4d0bfb1 100644
--- a/drivers/dma/mv_xor.h
+++ b/drivers/dma/mv_xor.h
@@ -80,6 +80,7 @@ struct mv_xor_device {
 	struct clk	     *clk;
 	struct mv_xor_chan   *channels[MV_XOR_MAX_CHANNELS];
 	int		     xor_type;
+	spinlock_t	     win_lock;
 
 	u32                  win_start[WINDOW_COUNT];
 	u32                  win_end[WINDOW_COUNT];
-- 
2.55.0

