Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792532662;
	b=xj/MU+wbBKleJAFbrYgrXdLAtGcGt+VpCcL92JLmnZeqsLCS/dsVf0xdL1qoDXCVEPcQ
	 /xYLCNHth7YLl8bByHxt+GXBhcWymjg3Xof6fYsHHpWNWqaXeP1KjnCoC+7760Cv2jx8D
	 8hMcF4ibZm1JAEcLTOCA6A2Y9HFOnuhDTqbnhW9rAYP5F++fTCFMrPUwYtT1v3H+Yo8wq
	 dhh1Q4QMC2FfwPkm7xwsqYru/a6YNy5zSppSpb4p52dWmxImKPvmYj41Y8yTX5KjK18Tt
	 4Acd4F0bPBFBrwOG/4PVlFIVyJfc1FWuczrgF4jMyt4Cajxj3Ynk7TfrfsRQfAD734g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792532662;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=qixMFLQKVMmNskruooKfS/1sCqg+Gqo0bQrcrDyhyF0=;
	b=DOkEBGnKyS7FICmfKwi5t72HlAMtHK1qrN5lY82imYoC8rkax20S9RnbIX3tObF9aQsA
	 IrKe9aR26sVJqTIkA34gr/0MVUv0xYhyWbHybSbltNfJqtBz9I8OCDvhsGK40RwqYS73F
	 E2rhwrgDs1rOYe43J7tXxg3Tul9dgQkATdhnytOXmpfgU5JgbTPMlT+PUWy+kKfl3Dg4k
	 I4vpoMut1PARWU58FL4HqDr24s/ETtAK0INIOItHRoithat2HzVTq4ZSNtkiJ3PXuOa/4
	 kxTdLuEBW0AbMTaTR8WbqUOv6IH9OS/PEvZfCwPY6yhG2MdUv4onlppD9qYmLCUCTYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cUJVCm16;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BB6606A31B
	for <dmaengine@vger.kernel.org>; Tue, 20 Oct 2026 21:44:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35BB6606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cUJVCm16
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-398b3c37877so87682a91.0
        for <dmaengine@vger.kernel.org>; Tue, 20 Oct 2026 14:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792532660; x=1793137460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qixMFLQKVMmNskruooKfS/1sCqg+Gqo0bQrcrDyhyF0=;
        b=cUJVCm16Z+DpPimxR5tNFKd7OiumeNsRlBKsES5RBw9fwVnGfPg24+R4e7bRVl2irG
         7MdCuKNH1BFpMAWMJr5+oTCUriQ2uKF8etftyhJ2N2nLgQ7RGuGqkQGwSU1pAtVCNL3z
         tyPLWoUZhR6niwkZ3BIHidnQJDVTyNCC0MBOB8+lBMSg5SZe/w9rrLtYi5JWqJ/QhrAW
         8U9m6CtTT84eukhVdS4Fsgq+YEJG6bYX5xMLKZ8u5CZ5qfHdOFPsvG2R8HklLj1XG7WB
         8jMKbtq6sGP3/VTGErSvKMDVdhp+t04AcCeHsBsNRDk6FQOQd/TbZmOlIsMGoZ611Zm4
         MDCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792532660; x=1793137460;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qixMFLQKVMmNskruooKfS/1sCqg+Gqo0bQrcrDyhyF0=;
        b=fShemDHV6dKidNhHQjMh6Uv9ZOYjwnRqBZt4qMCLeM3zqwrsJznkZWRWOKKNRC6ykA
         ePCnnocWc0n3r9gniOayT6163ErpU5Y1/kdQCl/A9PEvoK4mnyZWrGVLacOrHStiBDoD
         gF+jUFGemnAEU6y82WPC8ctokQg7ibsWCFoNOv0qLi245R7hwyGPK69kSYbiQPyvuXqu
         MOg/yGlWpng+9wVpFjMHDK//2g4Gt+FEbRvQd2Fhi1WoxWLYtwXRidk4A77478xro7/P
         HtArbBCWXp8spAuiYl97JnKXcTLP9/nlfJjgZ7KkTOhvksiGWJWgxgvol/26XxVBVvNk
         Q25g==
X-Gm-Message-State: AFq9FYJqn7ZEWAxjOXSRdC1tzMOBrPJRm+wgBVqA5NWfPpnKAJWtZxom
	p2xTyI/O557lH8l+dWHtuGM1PVMax/gRoc6dFnEpMImzr3BJwO+e34cJepU2+zay
X-Gm-Gg: AYBFou3FKkMqW8VNi63afvW8M0UFPXkRrDm7hjUhGk/cH8A+xWgj/ZdwGo7QxM713In
	tk2proRlXIhdyuOw0Yv9hHmoiepqZWQidhNKLIFYw55TmoYm4fqP8ZDkNjMbcVgoc+fzUlKfGZc
	2BH2+VzsixVV3D+qjuzIDvddadgHX83yCiGdfQJI1yBo9oglY2IHmLJyl0iJILn1oHg/q/FilKc
	UZAutoYxhQRZMtQ3Pe6/yWIhEjutqnxw3LWVG3T6FrRrdClK1SiYnL2WOm6iENPbmE90Gx+d7Zz
	Hp8cPuKkDYHU8Uf3jCeqbzPz1sib/z416p31DrLPYsOyIzZHyAR2fac4BwJQjlENQPDWDWyN/ht
	sLIZazXxaFsbXR+ixejN/OaRtcW7IWkB2bMYfUSH9K5U6tW4u3EPAWdudAqmW6nyYAd/jyDo91M
	osPCVnCyvw5q0V0c/hbuWT9HA/8lbwZOGRgvyyf/N0g4NDPei29IroKXrU4XE7vQ1idQh8gBbj8
	bPR9PqXqqYr4qRrzuUk5OoT94pjGaFEucbEV+gBa0CtoMtVVQIeID/fBFXIrLaMH8QjRQO2d+Xg
	tdnvFK5DiJc+BG46n+BwnDLwlPmpPrLOlYz2bKzYKrrHTTY=
X-Received: by 2002:a17:90b:380b:b0:3ad:6738:db14 with SMTP id 98e67ed59e1d1-3ad86d63c56mr191921a91.55.1792532660502;
        Tue, 20 Oct 2026 14:44:20 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:37f::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad802957d3sm1216158a91.8.2026.10.20.14.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 14:44:19 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Stefan Roese <sr@denx.de>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3] dmaengine: mv_xor: protect MBUS window access with a spinlock
Date: Tue, 20 Oct 2026 14:44:18 -0700
Message-ID: <20261020214418.1525032-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
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
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v3: add comment to satisfy checkpatch.pl
 v2: use guard()
 drivers/dma/mv_xor.c | 3 +++
 drivers/dma/mv_xor.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/dma/mv_xor.c b/drivers/dma/mv_xor.c
index c4e0dce3ca64..da8eea8789ae 100644
--- a/drivers/dma/mv_xor.c
+++ b/drivers/dma/mv_xor.c
@@ -494,6 +494,8 @@ static int mv_xor_add_io_win(struct mv_xor_chan *mv_chan, u32 addr)
 	if (xordev->xor_type == XOR_ARMADA_37XX)
 		return 0;
 
+	guard(spinlock_irqsave)(&xordev->win_lock);
+
 	/*
 	 * Loop over the cached windows to check, if the requested area
 	 * is already mapped. If this the case, nothing needs to be done
@@ -1345,6 +1347,7 @@ static int mv_xor_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, xordev);
 
+	spin_lock_init(&xordev->win_lock);
 
 	/*
 	 * We need to know which type of XOR device we use before
diff --git a/drivers/dma/mv_xor.h b/drivers/dma/mv_xor.h
index c87cefd38a07..36c1fde6dfea 100644
--- a/drivers/dma/mv_xor.h
+++ b/drivers/dma/mv_xor.h
@@ -80,6 +80,7 @@ struct mv_xor_device {
 	struct clk	     *clk;
 	struct mv_xor_chan   *channels[MV_XOR_MAX_CHANNELS];
 	int		     xor_type;
+	spinlock_t	     win_lock; /* protects the MBUS window regs and win_start/win_end */
 
 	u32                  win_start[WINDOW_COUNT];
 	u32                  win_end[WINDOW_COUNT];
-- 
2.56.0

