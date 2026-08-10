Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF214438478
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 18:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786385613; cv=none; b=YW+aTklqn3cxCf5zj6iQIkrQzQF95hAVBIuUSA+37nNaDyD316FlT8vBkx3d+RcN4h+qmcfirWN7xwjKQAVqeLVMQLpNkIYwXvCorsxtQ1PYIavJh6ZWcjfDfOYgkuAiTdmQIYcsstvrcyyA/Gjo+f6ZfSRxWz4MMJ/WDKtDBXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786385613; c=relaxed/simple;
	bh=28om5El0TdZ4S+gnFdSdluPfV8TV0Ds5qbfPBcio5bg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D/XclmBlQiHQ9G/zcWa0+eI2fJdhjwgPIxdcaFItlvPK8lsMMaKRT3peQ8SMSDJGP/ld4Zm1HYsJW/nYeq2AiA9Sns7Cddn3uC7hrF38pYe3zCzUdh6VmYljobbC3AAVFJuKgFDApMKjFWFyaw1kcGsDQ7+xaK43Fw/T5DX6jlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ao6mXLe9; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ao6mXLe9"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so1633769a91.2
        for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 11:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786385611; x=1786990411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=whlCZPyT2KYXXz/hQHK+/7ZGUcx/5GtxWUD+aYLMk64=;
        b=Ao6mXLe9JHP69qbmh/F4BxBWpG5bnPxrdmzs+YEbZKsBbAtzvFMKBKP3b0jGt77eYL
         BMYozG4siHNIYZ4utTLi6tO0F+rf7R5KSv0KHMCImB/BiQtSy5Ed1iD3rM4XLtqZkS3T
         8O4oREC4H4YSVoEjzQkaZrwv71Id8IDPJYmZ26vCMacrtVf/+TjIgt8hDqF5DEEhO8yF
         SvSXt8xhc2g+JmJLqJiSbzVDwyFnPwB8d9WUtOHnV+xoNhvh28tat7lE7Y772gFcqhiD
         /8z3mVoTF9oZj6gX2t7/GVotPWe/zyBGy9AjudeTmT7sgkPUHQRohHlQdPP5GsfUin1N
         KGGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786385611; x=1786990411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=whlCZPyT2KYXXz/hQHK+/7ZGUcx/5GtxWUD+aYLMk64=;
        b=Vp+NmfGHIxE1ZJ+3OTgchwWHi36VFPEX7YhgZkHbW2Q8TTiFj1hSDKlYr9PdlTpUuL
         i/BJRvEYOtCG6KxBCJyWoPLsxWMmg9ZvdOqHdYxgNyZi7DwfPb9tnkNlOKAcjAjI9tER
         uR+tQGtiUj402hDKgjVNihlH1BZhmqPOWPgrFt1ggDcmbx5X2ir48QCAp/hDus2SNuXV
         KVnJ9WAd13OFpU9DacQUJRIG5MoO+03EKpuIHHqVce8wL5mNIcN8RpR9XAcX7UA7lxle
         TFP1YIZZGu3vyvIqCvc4kLuecy/5KR96DyBHuzSV+ujON01R9NM5BtmkMbjE3F62qcy1
         IOCA==
X-Forwarded-Encrypted: i=1; AHgh+RooNBMhePqwH65HYqNkxAhg8hEJQfkExKYERMVBBg6f6/4+fnQzlm8HMF60bMk3FbfmQeUFT9+UtOg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyAuMDNKx2WKWfNYVMQUbkxYQdPAsc6puIjx45jSmSOs8uRGS7
	XaN8TxgEq+PHV4A9jVcb4kHSJkrcbrTt7vkZSRKeW6TouuQusQ6hRFL+
X-Gm-Gg: AR+sD12z25d4K2j1QWU6gqPjuarEKeOCmccCnNUZhJdGiZNdOoZIiQc2VhRYd1pwBG5
	s+7WQz9yqeOd7UFzGXqvFEUJNmk4FYoEI7WMg1y0IINno0K2NBHMrzGdxrND47Jv9NWDXfTrLjX
	UD1S7GGiBlmsYnrggVjWyTTHOJ9pJzEk6vJAC4SDWTVlpinlbGgaQ6ns3cKamWEzNlCyTZ8ehQ8
	AYud4cCFNXpgDOitjtByTtMs9oWUKzek/xGwRtb3fpXoGv+G+MAflWRipwseIvuTa9mFLKkBnYN
	VV30zfVLGcx98RjvUB0vRX34rB6rWwj8XTjnLEf0+MWKJ8lMAjeNST2eV2lQXW3hagpn2+O+cgt
	mIlmLj/ok4t1amL7YO2iZgAcsktX2hWCA3lkgkxSOLUQD34G9GWFV6IKbyycjg8qLp2aEki2D0L
	x2ZAJvApkuQHyX01wM7AG782LeM27KHs9QHKA3xRfBwZRHrzAzsOJvWKKWXcoYJn8=
X-Received: by 2002:a17:90b:5446:b0:380:f389:447b with SMTP id 98e67ed59e1d1-3909d89bad6mr31304315a91.11.1786385611271;
        Mon, 10 Aug 2026 11:13:31 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fa9:fa00:b1a9:6513:83c6:1d23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d53b873asm472795a91.17.2026.08.10.11.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 11:13:30 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Sinan Kaya <okaya@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 32/34] dmaengine: hidma: defer callbacks via channel BH
Date: Mon, 10 Aug 2026 11:09:33 -0700
Message-ID: <702687c28f440bf017c6e57f630bb65d22d3b217.1786384169.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1786384168.git.allen.lkml@gmail.com>
References: <cover.1785183549.git.allen.lkml@gmail.com> <cover.1786384168.git.allen.lkml@gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move descriptor callback processing out of the low-level completion
path and schedule it through per-channel BH work. Drain that work while
freeing channels so callbacks cannot outlive channel storage.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/qcom/hidma.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/qcom/hidma.c b/drivers/dma/qcom/hidma.c
index c939635be21d..486a2c61a9fb 100644
--- a/drivers/dma/qcom/hidma.c
+++ b/drivers/dma/qcom/hidma.c
@@ -90,7 +90,13 @@ static inline struct hidma_chan *to_hidma_chan(struct dma_chan *dmach)
 
 static void hidma_free(struct hidma_dev *dmadev)
 {
-	INIT_LIST_HEAD(&dmadev->ddev.channels);
+	struct hidma_chan *mchan, *next;
+
+	list_for_each_entry_safe(mchan, next, &dmadev->ddev.channels,
+				 chan.device_node) {
+		dmaengine_kill_bh(&mchan->chan);
+		list_del(&mchan->chan.device_node);
+	}
 }
 
 static unsigned int nr_desc_prm;
@@ -155,6 +161,13 @@ static void hidma_process_completed(struct hidma_chan *mchan)
 	}
 }
 
+static void hidma_chan_bh(struct dma_chan *chan)
+{
+	struct hidma_chan *mchan = to_hidma_chan(chan);
+
+	hidma_process_completed(mchan);
+}
+
 /*
  * Called once for each submitted descriptor.
  * PM is locked once for each descriptor that is currently
@@ -181,7 +194,7 @@ static void hidma_callback(void *data)
 	}
 	spin_unlock_irqrestore(&mchan->lock, irqflags);
 
-	hidma_process_completed(mchan);
+	dmaengine_schedule_bh(&mchan->chan);
 
 	if (queued) {
 		pm_runtime_mark_last_busy(dmadev->ddev.dev);
@@ -203,6 +216,7 @@ static int hidma_chan_init(struct hidma_dev *dmadev, u32 dma_sig)
 	mchan->dmadev = dmadev;
 	mchan->chan.device = ddev;
 	dma_cookie_init(&mchan->chan);
+	dmaengine_init_bh(&mchan->chan, hidma_chan_bh);
 
 	INIT_LIST_HEAD(&mchan->free);
 	INIT_LIST_HEAD(&mchan->prepared);
-- 
2.43.0

