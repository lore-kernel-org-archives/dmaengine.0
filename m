Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA0849A3A4
	for <dmaengine@vger.kernel.org>; Thu, 17 Sep 2026 23:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789687628; cv=none; b=Eeb5Y6F/rzyhOUeTmpyyIbH6PwgxGgy9vs6ia3i2XtDtM8bdwbi2fnCoXH1f8wojt2GW28xtqFYNZ38PHGyW+kIarXhzyQz5hfeJKn6B/V/Y1i1X/sJJKXzC7mXTEo3DiMR6L9w+X0lo9FEfnEHQbuI9Cgg67dk6VFXfIzaAcx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789687628; c=relaxed/simple;
	bh=yBKr/eFWCN4LJ8fao7hTzzhrSJaRfcKNa2vNZ9IH9ws=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j62WqtiF+Cy9GrnMqLVNGdYqtcpaC2WS3PqF94pcBvfaDNn+gKvXigdFU0cOoK3O6QsuwjFqCbJqyoGerTs3yxjBFhN4Ekp0ImjE1RkeD9M2R5a1D1cDGN7RQYC9S+UkQP+EolH+/Q1CL2NmmAAfV6ntfn0cx09gSQzb6q1XMdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GSCmdgHa; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GSCmdgHa"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-8633a38df87so103440b3a.2
        for <dmaengine@vger.kernel.org>; Thu, 17 Sep 2026 16:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789687624; x=1790292424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QRMvyEtwaxb58dn+Goh2wKcYLRls4e3sN7FSxEQqpqs=;
        b=GSCmdgHaF4j4IZ4l390Xz6j4vRJiA9p5JU8AIEyYMbV/0DbG0yWLB0nLWTrWDS2jGf
         XBVzZ+41TMt1uujSmHL0+o/rzTnTYutveJ6aKmU7ptbtV4Gqf7hv4ph1hHfW/pa4pqZc
         ENSkIJoWLQjj56Nnr+K0CUfdYH6bPXS9xEX/CIBM/WEt3cdYMeOH/LBbP4oH9nzAHkwk
         dpyAbkUgS98oLAisaXILyWhGVWccy7lUMZr3zYrhkjhx/EE10Fu1y6z4iGKsxO0KklOq
         iZdcJpqp3IxS8H06ozpsWeNl/2z4Wy3jsgDY8k4E8MzHTWnRl/ONc2PAu9PSFJzloxDc
         8S8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789687624; x=1790292424;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QRMvyEtwaxb58dn+Goh2wKcYLRls4e3sN7FSxEQqpqs=;
        b=f7+ilJs8JH6ADzR2NclovWy6mTE1Qs49MHbiCsCOx+0PqTUsnFcbvjwVhDTOkh5Iml
         4efXRXbOXjA5Bm+HI8KwRHAynE/BFeC7vu/toFPAx6SMpZBPhEf+2f6RhSNhd4um6dRr
         fsfJjvnMjgU1glJVzDLr8ENrIxeBUnQDziKL00xK+11NGWCkSJ90WJBykWYR5IT7o/VM
         LzHuvWqN1rBSph3zvjnMWnMBqHLiqKnI02mex+sHQikDjffFX+fkwPo+6IF32C7xpoGy
         q9nTPZhj+KmroQUk0EUaLJ3QV2pzfnak6OWjRIc92+359FozInJF2rIpnCP0cQvpdKIY
         6T3w==
X-Gm-Message-State: AFuF++ldSv+rmA1KtBy7MZFvkYf34cbPJ5otIjwsBX2QPTnvoTMwVNCG
	u9wok8HW134mPjvi997fg7toYOrjLdPVw76Zh4B0i/Dzhun/2ztRbQ/22sLE0Q==
X-Gm-Gg: AYBFou3A620ln7krwpoAydlKLZC70qxDae9OT4d1MmvMOVP3gpXtMpsr2OGs1LXVQdK
	XWZYH4HZGLDiJOIHCVfHpPvEbtHjygaFqnwchbh9+3SyyyGyvV0BXyU88gLfANqadhPY8P0re8A
	lJluu/s955NrR0Lf89QXeG87dSOs8YSmJ1AkSZaDi+CIkLplrSXwXqgQ8kuUfm4GAbBHb4c65Cr
	S18V2K/VqAu3RxoToXduWgjYl0djUKS4AL8GkVJ8c1FbI5VxoP6+zL9FH5Oy+/Hqyq4N96txiTT
	MOpmXDjqShPHi1nOTcYML4mtPglAMAvxzcZB7h1W7zJ5Haw8xsebZUvMzHVc+Gxm1Rtz29ws8QA
	Phqg4wA1s1gX1COS91F+Am5RDCZ7ba7nixr/2T6rq25AadDE1oA6nTo0AX2QNs6xHtcDh8oJGrj
	c6ElUe7A/LwBxhyeUJ8kcNtNWDunQykQTTWdLp+I6AVRUSPJY/fBHMWI9UFeSWssEmXzL/zSKa8
	mCgv4596Spss01LB8xGzSSQr0Y1Gi1MKyamRqzci1UfOKGn2GGsHikPrnbN7vpEwA28aCKEcVz3
	gGRR4IE9LmN2Ev4tuzh/VmwsWZCCMzJJMxr2H9FeCZi7aTRz
X-Received: by 2002:a05:6a00:2192:b0:85b:8606:627f with SMTP id d2e1a72fcca58-874de70f424mr1059860b3a.26.1789687624373;
        Thu, 17 Sep 2026 16:27:04 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-874b37cff50sm353903b3a.19.2026.09.17.16.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 16:27:03 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Stefan Roese <sr@denx.de>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] dmaengine: mv_xor: protect MBUS window access with a spinlock
Date: Thu, 17 Sep 2026 16:27:02 -0700
Message-ID: <20260917232702.127923-1-rosenp@gmail.com>
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
Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
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

