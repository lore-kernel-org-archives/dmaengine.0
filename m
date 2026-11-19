Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795053297;
	b=CUiUV/O9ynUID09rtAB4Ml7VlkrbafFpyUoqcpkZ52EbPr5vUOFQ9EU5/Rb/bqnj2tg8
	 JS961o7gDfXByVitCUCzz9tPMt6F9ashzRvEJWC5KsKW41xMhCoq+a/LQW8GEjX8RJMH7
	 nLVkZkA21DJrfL7VCBBS30QD082mumX47Eq+SfvsotFKDtFZvUbb5h4XtXlWpbJgLQ4ej
	 kMcnu+r+6YOkrtaYrtTPiTVLRs4sSxE29GUbnkw6kEQ4AV6LEzXYgK0CpTPOdI2ECiyhR
	 p2zS/luvd024URlg4kVQYvlox472Atd9DtlOGw3O+7rKeK/pQkjUeGQ1axQ3ks74mjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795053297;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nDoAWY11ZCr0ihHoFalCpChIz8Et8oFGy4RrYPRx3SQ=;
	b=KKTerVNLtlkefgxjgGmviO5653qHriQaNg5XyGGPXoN4SXApN6TOBBaHwB96JANRn6HO
	 nW88wd7uN8igEF0MuEcOfoT1HhAoekCMCwId+9rkwYMtjDiJB7usOYTZS4jgxAyZHQXbM
	 XM8YKbZa87cMSd37hqXEQrhRaHfiKZLP51TvVXcu6eSI8UtGwmv6sEtdrKv/TFMrzdrxd
	 WHYJ3B0ERXDUTLQhgxquFLkfNAa8BWDuzlwSoCL4t+tckBoe0vnq8/jr3XbeeXAhTSbR1
	 Zmsm9rELO99cPvZxemN1E0krtgPDjgaQtMUEgezKOeWW4ZC9muhC3yCRJaFMnCdoVhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nltqhrd0;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF71C60A260A
	for <dmaengine@vger.kernel.org>; Thu, 19 Nov 2026 01:54:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF71C60A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nltqhrd0
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cddac941ed1so752999a12.2
        for <dmaengine@vger.kernel.org>; Wed, 18 Nov 2026 17:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795053296; x=1795658096; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nDoAWY11ZCr0ihHoFalCpChIz8Et8oFGy4RrYPRx3SQ=;
        b=nltqhrd0MMDZ7546deiSsw2uwq42t4c3i4uOD0uXOHy2rm2POJCcz0TxFstDHvoHpM
         /7crJUPoUAefBTJsrcZgBfnDlE7lNpDD/qTTwId33wMljgUFI61lnGlVDcLB1YofRILd
         FQUNgnLEgmL3uaUgOIGiu24veyJztsWw/OMqkQbHz8X5G+bHP8OojWbSlR/cjnoU1va1
         4cXxRINSVIrjwcRrrdxFNK2+yD0MrGLpdL6QMQ4MqtQO6GuTvicIdWLHmnun1fGBX/b1
         aQHourZFOB3X7BBJZbioOFbRdaH/AxGZg7lUk+4G+UF4GQxmu5WqJa1nDWRqIOXzCj7q
         qcig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795053296; x=1795658096;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nDoAWY11ZCr0ihHoFalCpChIz8Et8oFGy4RrYPRx3SQ=;
        b=VOexnLmvrDkaKNWcTYXlp6vB7+cbYhrq5b+GApWZZ6CqeQj7lpOVsjD44N4U9y2db3
         v4kcA2b5lHOJ3el76rw+bUR1zjUYsMG36qFTQD+DxRjI1iyzFMzqFhracchKKFMdoxwP
         fzM+MmUnmrNSO8HXk936KwlMXuJJ8qYuyp/cJPqLTXEV0kRYEFnTLVK050x7cQU0hVLU
         21ynLAiOOcFTgJyW+RNTiRLz08f45mMJGSYsNDJOwgDQ3/vbaihZcopB9AL2GozBYkq1
         Mj5MgcvyGSDiWkweZlofLvT5pnSkAOFdd+qyd1aN92hfMBJ41T4yxjcss4dVXzstJvZ5
         KtkA==
X-Forwarded-Encrypted: i=1; AL+hErGNlqNl3fNMcL3cj0qjrcqpolqOtr0Hl4KTz0tR+xh9b2aXQOypAkaa7y8CST32k5ifugHxKEMXvUg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+GhkQm8FIfV8WFylSf/2h7O70wHFz7i/a/MCEjmLDUD7rW+XI4
	F0RHb8oRwTHbvXD6oucRyOeKIaPVam/SOeIExnsS6USGvtIbOypp5ZgM
X-Gm-Gg: AZFdTZfgLffnDdTxkQv44Uvx2m6BAARgFRKlqlCqhbQCuvVsix/Jwvxk7FkDBexzupx
	MEK0qKSokwIO8k/T+/akZAGziwYiC2ipoPm/+HxW/bijkjE8sY3Mx0i96AaDBX5DqUtQcvEm/KN
	QXmebuD/bd6FHjaVQSHs9mlI6TCsdtVfkccijNTbAQpFJi3i+vHEG3qQtw48dLiSNh/UojFiWmK
	EzOU/8tkWqjbVFVRm+ydhurjfryt4eec1pnoqYHBDRMZTLLyyCEZb1sUU7rV32x42BA0nf/a5ao
	YS/LE1daBrSbma9zFj5usRe+8mWA5FfVE1brtcd6+J0iWej9yAnsZfkyzdalftc+y5XJfHrQkmP
	qx/bZ56MeHVm1omod+ORl8yG44c0XE0y/RsEu8tk2ivbmHZD33cZBlnt5AfVqEEx3XP5bbvA9UP
	VW7b2oDEXypNSaJuqiV+2gcoosKB2BOpeThGIWt3lmpCAID8P6Kjm+wreiQpaWzTxC361ox01PI
	aIKQ0w9ei613C2IarnK02ZOiDzhcYlN3jCP3lZrgKxcS0FgqkCpThLgR8caoWcCDJk4IZsfGffp
	XVOBNoAQQF1QT7W3VQYd22G1QgM/t+q6PFnqGTAosFnX95ADzR7uKVZEtK3vVn3aNrXl4V18nnh
	4jHIA8uH3Zu8+rn6pHLNtaTOg3njWzv4k5SN0
X-Received: by 2002:a17:90b:2ec7:b0:3ac:a139:1b13 with SMTP id 98e67ed59e1d1-3b3d07a85e6mr4560280a91.29.1795053296137;
        Wed, 18 Nov 2026 17:54:56 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3fe03c3d4sm773081a91.14.2026.11.18.17.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 17:54:55 -0800 (PST)
From: Shan-Chun Hung <shanchun1218@gmail.com>
To: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	vkoul@kernel.org,
	Frank.Li@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	kees@kernel.org,
	gustavoars@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Cc: Shan-Chun Hung <shanchun1218@gmail.com>
Subject: [PATCH v3 0/2] dmaengine: ma35d1-pdma: Add MA35D1 PDMA driver
Date: Thu, 19 Nov 2026 09:54:45 +0800
Message-Id: <20261119015447.160470-1-shanchun1218@gmail.com>
X-Mailer: git-send-email 2.25.1
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

This series adds the PDMA controller driver and DT binding for the
Nuvoton MA35D1 SoC.

The driver supports memory-to-memory, slave scatter-gather and cyclic
transfers.

Tested on the MA35D1 SOM board with Linux v7.4-rc3:
 - memory-to-memory with dmatest (2000 iterations of 1MB buffers, no failures)
 - slave scatter-gather with a local (not yet submitted) QSPI patch
 - cyclic slave with a local (not yet submitted) I2S patch

Changes in v3:
 - Use dma_alloc_coherent() for the hardware SG table instead of
   kzalloc() + dma_map_single(); defer descriptor free in terminate_all().
 - Rename ma35d1_desc_submit() to ma35d1_desc_prep_done(); prep() only
   prepares the descriptor.
 - Rewrite the IRQ handler: read and ack TDSTS/ABTSTS once, then iterate
   the set bits.
 - Address issue identified by Sashiko AI review:
   - Terminate the descriptor with vchan_terminate_vdesc() when a cyclic
     transfer is aborted, avoiding a use-after-free in vchan_complete().
 - Request the IRQ after the DMA device is registered.
 - Use devm_of_dma_controller_register() and
   dmaenginem_async_device_register(), and drop remove(); a devm action
   stops the hardware and kills the tasklets.

Changes in v2:
 - Address issues identified by Sashiko AI review:
   - Program registers on descriptor start instead of prep.
   - Fix interrupt completion handling and return IRQ_NONE when idle.
   - Set PDMA_TBINTDIS on intermediate memcpy chunks.
   - Validate scatter-gather lengths and bus width alignment.
   - Fix channel request assignment in of_xlate().
   - Safe controller teardown order in remove().
   - Drop peripheral timeout support to simplify driver.
 - binding: describe the hardware in the description, and drop
   dma-channels and the dt-bindings header.
 - Use a fixed number of 10 channels and trim the includes.

Signed-off-by: Shan-Chun Hung <shanchun1218@gmail.com>

Shan-Chun Hung (2):
  dt-bindings: dma: nuvoton,ma35d1-pdma: Document MA35D1 PDMA controller
  dmaengine: ma35d1-pdma: Add MA35D1 PDMA driver

 .../bindings/dma/nuvoton,ma35d1-pdma.yaml     |  71 ++
 drivers/dma/Kconfig                           |  12 +
 drivers/dma/Makefile                          |   1 +
 drivers/dma/ma35d1-pdma.c                     | 662 ++++++++++++++++++
 4 files changed, 746 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml
 create mode 100644 drivers/dma/ma35d1-pdma.c

-- 
2.25.1

