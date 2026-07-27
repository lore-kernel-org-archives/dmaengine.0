Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CFF433BB8
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184389; cv=none; b=Vy6w652+ri8nW7W4glqsXrDGjD3x+6h1b+KMZJtEcDcMb2M5CcDlc30ouVnBHhUx+nlEtXJB9ZMvl/IpukNAX823q3+ev0dIW3rHtOzFCf7oECjBX7RiFh15JL2U8iX2sQYdq/jPBUEPbt0hThDYpJE6YFnkzZYnbnl7Ce5U/GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184389; c=relaxed/simple;
	bh=MzLR2tS6Q6SAm1ixiMppCOjVjaWLEJDdbikbXsKbfnk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=joD891G/LcoN/lCeeB9XscPPBaSKVNIOQaWUA5hWxUJZDgqfaCpz7yxr4bdeSSs1DAAd05ZQiZqNpoz4Kd3Gag/81CmgzXc3N9RxgzvFau/OlJR3z73gl27R2wrdckmDkPp7Movah0tXwuimSrxY/c+nS2NPiPwS6IuS09ZV9x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WqBixRx5; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WqBixRx5"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso29149485ad.3
        for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 13:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184387; x=1785789187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lqtGvF7iBf50PhdlFuPDRkLSBznZGg2ck1/bg13WMeg=;
        b=WqBixRx5yy5ydgV0cw5NfiShm01fWawtBP5pXXf6VIciCwcwDGwJSmR8Fa+qWKj5GB
         XxxCQ7MfEGuwZgol8iEJBTEkNMqYXfd5QFh36MvESQDyNQ2Nw7QB5vNvjBzQ4zPAbbg4
         jMO2CIWEq7u3fMptCk6LOBZu9oqWlt6eZIBwc/MLSEoBGba5Ep8rMswY4UAUsu/pIPC6
         Q1GT3cyLYpozeVplWh571kSdB+kkxLV6iMs9NUVyWTWBLwkRg0WNAFfnc5cxKRGDAXdK
         E1v/a8xTwO99AS4EbRx5GDXgTZYMyEn5dBdIL6NMcM5CFPtLhqSc3xEzlt5tQB4Y9nxx
         639g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184387; x=1785789187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lqtGvF7iBf50PhdlFuPDRkLSBznZGg2ck1/bg13WMeg=;
        b=aXMUTV3Bvv5AXE0pEN1qLTXc6jq20XWtyB4oqt070GKw6yfDv3zEAjjS0ERFpM7Rxi
         x3bnYRaTTSguBSvtsWRTK/Gi8aLIzWeaHFvvTsPJ/EFoDAqdaRYX+fN/nnoZm6Qv+ON5
         YzM5cq3OIts6ulgLKUMncoQgbo3H1UH9nmMcp4t0OhbWdqd1IwaZp8XfMXzDZ95Adaj8
         tP9KpHTJGbr1D+3nDUboixDSsUa///jyDw1qyFug4KIo2tLkhN/aSfNA0Vy6wIv6Ehuz
         UC9/zVAjk0rl+QtkWR35Exu74xqBS/5CI309YFgFL1HiL5iQ3dOLxQZYwl/92ueK2KZ7
         TEgQ==
X-Forwarded-Encrypted: i=1; AHgh+Roa3RCRKDkF7Bv3bK/YiPNtoXCP6mPyyPIZw4XMbFfLaQgrjsC+OO5oFuzAtMPRtcg4n+0Xz0ibOic=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy20nDpP7iA1293VArcxPg9UCqA0x+3Dqq1CzHDmQQT82BKNU2z
	KKgHQIyxATn6KI9883fgOGR1phMiShM6c4KzdYDDQpQt2kMV9uorEF6a
X-Gm-Gg: AR+sD10RTxxcdeCggptHeCGRb1jSvYV/Y7tstTkXPUCu2xyvwIGBzgkseSRGacJ75iH
	yWLbjg4t88hl4bpgNHwIthloXqX14qJdvWXF2c+Yfie/zCLJDnGidixUNzO81zm8lmTYLoiwY9K
	JEkgo2f4wKQVZxonh3SNnS72tkXATlYS1ALSn+zvhsyKBHJu3kRq4xdlDNPV5eNVLJdPc8ow+hR
	HarmKZzaqlDkSkqzFwJwMT4nzAot5I6eDTk7kzDLuBDknjY6mAyiMD9y0FH1oq0/EgYMmh9q+Lf
	MC8045pWiPLyM4aHvmeSARlijao8Or04/eX5Nv3aE6an1PnNYX6x7/MeFvPTPTl9dGP2dS3usBO
	W9OJq8Ks6ZeCNMaFCOVIlsoBIt+wGTfvnmnx5c8qHgXxR1CNRYzu5TgkPz3DF5Bv2papb7x4gV+
	e3WvdA
X-Received: by 2002:a17:902:f642:b0:2ce:d957:59c4 with SMTP id d9443c01a7336-2cfde687cc7mr90155025ad.6.1785184387350;
        Mon, 27 Jul 2026 13:33:07 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde59b768sm41551805ad.4.2026.07.27.13.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:33:06 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>
Subject: [PATCH v2 30/64] dmaengine: sa11x0-dma: kill vchan BH on remove
Date: Mon, 27 Jul 2026 13:28:58 -0700
Message-ID: <83cb2ec3443e6061816a37699d18bc1afc0fb908.1785183549.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com> <cover.1785183549.git.allen.lkml@gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use dma_chan_kill_bh() when tearing down virt-dma channels.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/sa11x0-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/sa11x0-dma.c b/drivers/dma/sa11x0-dma.c
index a6fa431530e3..ea4357da5e39 100644
--- a/drivers/dma/sa11x0-dma.c
+++ b/drivers/dma/sa11x0-dma.c
@@ -891,7 +891,7 @@ static void sa11x0_dma_free_channels(struct dma_device *dmadev)
 
 	list_for_each_entry_safe(c, cn, &dmadev->channels, vc.chan.device_node) {
 		list_del(&c->vc.chan.device_node);
-		tasklet_kill(&c->vc.task);
+		dma_chan_kill_bh(&c->vc.chan);
 		kfree(c);
 	}
 }
-- 
2.43.0

