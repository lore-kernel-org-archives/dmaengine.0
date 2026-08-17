Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90ED44236D
	for <dmaengine@vger.kernel.org>; Mon, 17 Aug 2026 13:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786975057; cv=none; b=R5hr26OmlWbVDx9/5tit7k+suWzyNOSxDsFUKSrCf5Wpwb8VVdGhz2ct+sESgER15xaRSjTurmllWipa+XURpppNSh5nlQhToYT+NdfKoAM7aBMpzNYxKFM1GQQAyIAm9p5c0aDMxtjd1muF1pRPJ67FTX0QZO2rQFOG25eErLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786975057; c=relaxed/simple;
	bh=PZI7MMxmJVNzbmV5bnrz48F2Q3n5UxIGaRjcpiHxuHk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SmLgN4f7pzybew1P0xgeuMAk5bA4WNZLyGHoz6qA2SaMCyEzUUPZjuP3M8++ISVSg925uQADcONqQx3ENQK1L5ekKrycwysiHjUkfWqq629SqUcPy3YAI1ujmRnRpphR075BOlRb96+WMQQyhsR3Xo2fNGgCNDxayAldMavpN+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=soundtrack.io; spf=pass smtp.mailfrom=soundtrack.io; dkim=pass (2048-bit key) header.d=soundtrack.io header.i=@soundtrack.io header.b=tEpTIBqH; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=soundtrack.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soundtrack.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soundtrack.io header.i=@soundtrack.io header.b="tEpTIBqH"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a09571dd5cso445570a12.2
        for <dmaengine@vger.kernel.org>; Mon, 17 Aug 2026 06:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soundtrack.io; s=google; t=1786975054; x=1787579854; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WLmqosVfHRUnCpTXG/vmgJdRPIFeEEdEr21ji49UgUg=;
        b=tEpTIBqHOBDANpCGB3UUeUWv7fsWbUyEVdhtcDtwO4ow2BV1/qXXoNsn4KpTBZceNS
         +epRX8gxHhp3p7jD8atP/eTILwMrLYloFOlBsRqnmQK7pK8S/VQaeg1hwZtNyAKdqKbW
         XhxA33Er+1OhNraUijNWjhKECGmKgR5Hjaqsz8TDqZOlZ/WmWKjpS8eZ/SpVAHXR2DvK
         qtSS0NCcAyYCwKi4zaQT5w9kZc7bvntfyunBiIIckGK5/3/Zp1t3s+aL18avXya01HuK
         nXvhhAvdM5DohQnoyNoi3atR92f7m0KTP0MOgmIMF/GfDw/Mzo2K3xoYdI4PjEkG0hqN
         V/JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786975054; x=1787579854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WLmqosVfHRUnCpTXG/vmgJdRPIFeEEdEr21ji49UgUg=;
        b=k9f20lW8AsfU+KU2r6ZnnOWcN9IXl1GygC2Z/ZujSJRL/07MPMRZm0VbBo70hgglpr
         APRx37QbW9BDkh+Z+V4uUZtWKxp2xXvfXZnVzX9TNEVd090qjmm+5ZiliHnviHlnhbup
         wPmMNGBmrb/LB9UdJfNNqwnvaAgyMXw3romCUTyP8JrI6CdldDdg1se93njIvtPn4SMV
         EoWBkVGcoVouRt4NrYwhlYND4R2zq07wZxdtBiKFmIOnQlCsNvT2oW917yBRMavcETzB
         /6YfYqS4/WqYVd3IJOPC/nkHQlshuObZYbF2X4V8h2P0PCOB2GutzhdeEqx6wFmtSLVC
         qSYA==
X-Forwarded-Encrypted: i=1; AHgh+Rpj+Dj879sTv4WrzzOCSdKnmoIvwJLq2a+I2Wa4KVir0ru8O5ATg8LBHAKplMDpKFmRA+SXQyZ58W0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+UCP0W0l5i8MLaiBU+uRH363ybaAxjUtMD38lqZbebJfV48yV
	iBd13yqNDIwFo3CImvicQSX66gGw644VariKGQU74p3QD+yNVqSxWtPoEA1v5Y2Q9lo=
X-Gm-Gg: AR+sD10ruO5XOHsy4M+EpKckAeDXrAvHLIeLr1C4/R1bzMjg74vgXsijVwQq9ckNRzt
	BpxgMvT0sDcV+zpNoQu/ZDg5ts6xpgJ1h/59X929XCV1/EB/aRHSSDva/svZxBCTr5ezGJNXIGX
	Q9sRvyOeR4Zx7UxUz6CWSsse++HqXYlOzAMPADoUvKdTwbW9bERGTT0mriUz1PFEstKOD1/83Jm
	oxTYpawhYtcOL0MnEycdHMeZefJwlc0KDHPO/VPVNfYzIey8kKeuyT9CgI9BRklLKPD7qShhaJB
	uVbTN/goE51fJikh8k8t54QlqsrsA62+8RKeNbnD4GVhjOrbWLVeawkmS92LZ1IatcxcvpeGGM+
	zcCSdbKyaTqJgSRDf+MB5rrR20YVoXZrqfWs+iKLKcdgrz0aTBmET2JPMg9mhogYctOKKQaCm6U
	TL3a3ZqXEpU3nnQzHimE2zczWy1PQVYk52oJ2wBeCtLWE7AmZCCUPhC/873+H7epqkoSOtIsloy
	yO/djW0xGwshY6VAhAIG3n4vVU4GaPzZTVKKnMI7cxloGSwDy7L8LthQ60=
X-Received: by 2002:a05:6402:234b:b0:6a3:68c2:9a9e with SMTP id 4fb4d7f45d1cf-6a38a845a42mr7135042a12.0.1786975054047;
        Mon, 17 Aug 2026 06:57:34 -0700 (PDT)
Received: from Mac.localdomain (31-209-40-223.cust.bredband2.com. [31.209.40.223])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3d85319b1sm810238a12.13.2026.08.17.06.57.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 17 Aug 2026 06:57:33 -0700 (PDT)
From: Christian Lugnberg <christian.lugnberg@soundtrack.io>
To: vkoul@kernel.org
Cc: Frank.Li@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Christian Lugnberg <christian.lugnberg@soundtrack.io>,
	stable@vger.kernel.org
Subject: [PATCH v3 1/2] dmaengine: sun6i: fix non-atomic read of DMA position registers
Date: Mon, 17 Aug 2026 15:51:22 +0200
Message-ID: <20260817135723.12807-2-christian.lugnberg@soundtrack.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260817135723.12807-1-christian.lugnberg@soundtrack.io>
References: <20260817135723.12807-1-christian.lugnberg@soundtrack.io>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sun6i_get_chan_size() reads DMA_CHAN_LLI_ADDR and DMA_CHAN_CUR_CNT in two
separate readl() calls with no synchronisation between them:

    pos   = readl(pchan->base + DMA_CHAN_LLI_ADDR);
    bytes = readl(pchan->base + DMA_CHAN_CUR_CNT);

DMA_CHAN_LLI_ADDR holds the physical address of the *next* descriptor the
engine will load once the current one completes. DMA_CHAN_CUR_CNT holds the
remaining byte count for the *current* descriptor. If the DMA engine
advances to the next LLI entry between the two reads, pos becomes stale: it
still points to what was the next descriptor at the time of the first read,
but that descriptor is now the current one and CUR_CNT reflects its initial
(full) byte count. The subsequent virtual-chain walk starts one entry too
early and accumulates an extra full period's worth of bytes into the
residue estimate.

Fix this by re-reading DMA_CHAN_LLI_ADDR after DMA_CHAN_CUR_CNT and
retrying if the value changed. This double-read pattern guarantees that
both registers were sampled during the same descriptor interval. The cost
is at most one extra readl() pair per call in the racy case, which occurs
only at descriptor boundaries (~every 2 ms) and is negligible.

Fixes: a90e173f3faf ("dmaengine: sun6i: Add cyclic capability")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-sonnet-4-6
Signed-off-by: Christian Lugnberg <christian.lugnberg@soundtrack.io>
---
 drivers/dma/sun6i-dma.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index f47a326dd7ff..04fe1f5042e9 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -354,8 +354,10 @@ static size_t sun6i_get_chan_size(struct sun6i_pchan *pchan)
 	size_t bytes;
 	dma_addr_t pos;
 
-	pos = readl(pchan->base + DMA_CHAN_LLI_ADDR);
-	bytes = readl(pchan->base + DMA_CHAN_CUR_CNT);
+	do {
+		pos = readl(pchan->base + DMA_CHAN_LLI_ADDR);
+		bytes = readl(pchan->base + DMA_CHAN_CUR_CNT);
+	} while (pos != readl(pchan->base + DMA_CHAN_LLI_ADDR));
 
 	if (pos == LLI_LAST_ITEM)
 		return bytes;
-- 
2.54.0 (Apple Git-156)

