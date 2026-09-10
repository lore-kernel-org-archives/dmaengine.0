Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370633AB29D
	for <dmaengine@vger.kernel.org>; Thu, 10 Sep 2026 20:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789071902; cv=none; b=cxZp8UPntfukvIPB7/Jnp6BvB2ax08F/40sks6geFOplbBKMtVcHJd1V2Bar2zk7a0H4ayp+BV5cIYEtvqIQ38Q88mAlpbmoQx0zaDfKyGsuL0u3TE3FFnxgZJthHqoAxHkfSV0eyGJfuCqEZlSPLxvEwXY2z0GcCKV5zcgczKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789071902; c=relaxed/simple;
	bh=crUU4hqfzWmg1FxOzOMfiI90weFHQvv57LQbmKwL7Yw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aYyL5lDepqS1r2IUwU/TVqhMopVsqNUzNmFobtFc5ye0PJgTMZ1Wh1353qwzCs6G+r50fxZ2laQntSrpPb7Ay3lnP7bNPKoGe/72julgXc4yIef5Dp1H1Fd03EFU3ZaOQKxrf0Uc7Rg2X7iNaPpsc+3I2D4z9tASmVkMoSh9fHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nQCWkfPj; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nQCWkfPj"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-5306baf6b53so2821211cf.1
        for <dmaengine@vger.kernel.org>; Thu, 10 Sep 2026 13:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789071896; x=1789676696; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5fAMAx/mtgGUhEgU04FWSZ/Setac6qTqsovVdgc29/U=;
        b=nQCWkfPjTNUt6F2uPmDrzaazyiYjLK+H5XqAZBgfcki2pvq9YncI1c0R+DT9NYgxdJ
         lqPxeXFDwNPcLcZHktp7UYCkxi8CpwI8t+OHSL9HqqUgwr/bSoDvF8WNfVlmO13byOi1
         dzIETdeYzI/oBkOTtQggHs8s5/UvlLyIe4k+WEe15AiMoaKIwtYJKTB8XSWALj/SIxZf
         HmzXoVRBIOTDbvfshpBOlCNbeHwCObufM/VtFL7Yqthq0mA/XbX5ILYCAv6vCdCcF6em
         p9MHC+35YI3tvnY1VqMkvc+9QjPvOs37r9kLz2wsiXETpwmmUehOMKhMyFoB//qMUo1c
         /vfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789071896; x=1789676696;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5fAMAx/mtgGUhEgU04FWSZ/Setac6qTqsovVdgc29/U=;
        b=sPVROJNC8+fzVcSdkUVgCghPV75rhmFj9U1w/qYzMDUyDktRp1CKxvsuUM7cU7pjyQ
         Vzktsh4SexktGYscixyLUq10g27V7XpL09N5WlldGyOzncLGuU2b/Cva8gXjgzuxFUBM
         whwRCLj8un5yUg6UMy73GvCn4qao79G/MW7J44mmNw2DZdYoFemQzrHE5lG5K8lLvjk3
         fcXHa6i1E6zllAWrbX1pV8lwUKTgOc7W3KM6A6dE7l1IDN99WrdNHMh+zD1Lr+Ze+cJY
         ObPASDFGMRAuaRocF6EXilC5Zq6k+qZNfKz4Q0MRaxbRoWixxhQeknUnChUqLHtVKF1q
         eOEw==
X-Gm-Message-State: AFuF++lVc1vKRuskQAux8MQMlGqo2cU4fPt9u6US9RS0ZrJZBGZJIvz7
	8m72GjxSD8RMXqK/Wr1N0ffiKKY9qsn2EqfqX3l5OtTDPWdtvC15GlsZAcyzEw==
X-Gm-Gg: AYBFou2wtL7FCM3o0SZNxAzhtfIdshCAcuCQ3Co7v9ujB5Z2lvirFrkuyfWqDZj2Lxf
	YY4aTDlSs+OWhUYmqd/bmosz4iqhKi9/S3jYm8EwjavC211P+9UGRezydnqIZTni/10XRDQn16q
	Rp+3JXQ3YTf2a+zVf+AghQ/AzwcGxv8P7ZudDlTfJVzp4hGqnFgpx+NLmj5vHhfL2ZRCRuLnGnT
	JeRKplsMOSjqXPtYqJwlHHy8ZeLwHDr+/c7E0h6kch0vbo9ktk5H/2TeX6G5fDjTJHaSaSaNbaL
	nawM8Pr0Q4sV9v7mHeuY9avHi4IXuqhcKCOCy9oNLF4mgveTNkQuVbJ9A7IM1EA3JNg24CYGCmK
	dfdhwJ5rg3bFlePUDIJmLxHYGoW040a89l6ZxsSSGLOhYyv27vWaz9TSJ30DMfuITGl6oYiB+Q9
	NhiBpYtI7FkxFpxZRANq9chYCSLco0dOjxXMLWPVsfEbBkw38lbcYSfT5TXzmyqz+wLB0mZb1aI
	M9hNwXy/8uSXIIsfa362Hfc7RjZEUFCrFxa8e53x5sszeMb50WG8UBiYKIdEvN6nt0vNOFJBB+0
	xtaYtjLxyE3Qng5gk8hYkQOedcttKbIINNt6bmqAhsTi2hayBg==
X-Received: by 2002:ac8:5a0f:0:b0:527:809c:f9cf with SMTP id d75a77b69052e-530c85979bcmr17636911cf.21.1789071896008;
        Thu, 10 Sep 2026 13:24:56 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ca489107sm2035371cf.14.2026.09.10.13.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 13:24:55 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Zhang Wei <zw@zh-kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linuxppc-dev@lists.ozlabs.org (open list:FREESCALE DMA DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] dmaengine: fsldma: fix kernel-doc param names to match function signatures
Date: Thu, 10 Sep 2026 13:24:53 -0700
Message-ID: <20260910202453.47887-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 v2: split up from series
 drivers/dma/fsldma.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index 22d62d958abd..6ce0e5668dc2 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -681,7 +681,7 @@ static void fsldma_cleanup_descriptors(struct fsldma_chan *chan)
 
 /**
  * fsl_dma_alloc_chan_resources - Allocate resources for DMA channel.
- * @chan : Freescale DMA channel
+ * @dchan : Freescale DMA channel
  *
  * This function will create a dma pool for descriptor allocation.
  *
@@ -738,7 +738,7 @@ static void fsldma_free_desc_list_reverse(struct fsldma_chan *chan,
 
 /**
  * fsl_dma_free_chan_resources - Free all resources of the channel.
- * @chan : Freescale DMA channel
+ * @dchan : Freescale DMA channel
  */
 static void fsl_dma_free_chan_resources(struct dma_chan *dchan)
 {
@@ -873,7 +873,7 @@ static int fsl_dma_device_config(struct dma_chan *dchan,
 
 /**
  * fsl_dma_memcpy_issue_pending - Issue the DMA start command
- * @chan : Freescale DMA channel
+ * @dchan : Freescale DMA channel
  */
 static void fsl_dma_memcpy_issue_pending(struct dma_chan *dchan)
 {
@@ -886,7 +886,9 @@ static void fsl_dma_memcpy_issue_pending(struct dma_chan *dchan)
 
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
2.55.0

