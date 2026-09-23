Received: from mail-ua2-f39.google.com (mail-ua2-f39.google.com [74.125.226.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41885304D1
	for <dmaengine@vger.kernel.org>; Wed, 23 Sep 2026 13:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790171594; cv=none; b=Bf/TAnv+6aPGekA8hnipNwRbMxK1RvLNsR0I9UE3pTcUCtgErwBf7+bUTJUUHmrWp0pPTTfZo7WSTenS808iHzDVQVEtWoBItVj4EfYF6oN+BsGjY/8vDaFHvb7gpigoDHyAjGWmYoFYYi1262IJtO/kDc8Y5Q1TNUAufpUDb+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790171594; c=relaxed/simple;
	bh=pc0FDD6IR7pFOD7noF91D54mnHrzpCH4w/W7A8vQcRg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gZp7DtmRcpTGLJl9Snh3NpFYGxQMqXaFvD/CsRIVIHkU3Ow01VV3k7WHkuLgmxVIpBiEg0FAR3y3o6kDhNzc5nDM4wyR1gwrjkD7o7HrLjM2u+nTlJOYX1tYXgcBdMekl5qkiIKx0zwbxUw2iHCNcnP3F2P67Lyh2oCEPzHAGaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QFsDq/JH; arc=none smtp.client-ip=74.125.226.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QFsDq/JH"
Received: by mail-ua2-f39.google.com with SMTP id a1e0cc1a2514c-982db8d3b1eso317404241.1
        for <dmaengine@vger.kernel.org>; Wed, 23 Sep 2026 06:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790171591; x=1790776391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2SglU6SsyzFxHFyMmhSwCTOipsWKClut0lOm4koa3sM=;
        b=QFsDq/JHrtEo26ZX9kLZzebgNEJYM1rcVa325fdWYhFm/HLwr0vP7wNfJ15PQDBnuI
         /K5iZLplxUXb7geAgbH8Ilbwftq9fFQ4h2NmJjqiLOQuaL+9NZ148TFZl1NybA2kz673
         hB7RAKFT+5Gh68qsM+H2zXgL8UlazdmF3SaJCQKfvd3YaXX1HD9ZGWaPPUq8AQQ73Ncz
         7AXOXKdfr6A+gkRjTAYJpLvzEJQQP6q8iChyZF/uqYVXLzd9c+/Kht/TO4b91OLnZgFf
         NKxHhL/fW3B3ruplMQ/VfdqcXSE8wddph7IfSbuA7u/KukBXHcY/FRtJwJFSiNctpdWV
         iu9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790171591; x=1790776391;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2SglU6SsyzFxHFyMmhSwCTOipsWKClut0lOm4koa3sM=;
        b=GpcwZexNuDESES5e8u6esj8kMxGgKtfjYLVa/d5pci+Vz18UYmWHOKv4baRvE79MUh
         RrBTwwUhaGjtoUtTJ7ptl+640u/+aPBrh9p7XmgugbyTJ5MtoLZuIes+yGiKpHNtf+2u
         hOjo7pQhaMuFImf5LxwCJCOXLHam5Fg15adrdaLrCJsQkjP5ojEI2uZLYJAn3I8l+iUp
         2HJ55oB/dl/B0zyAtgo0jHsZmN3PTzuGnipIBihE0dvAw9xUDtjcYmecJQaRYAUH9/Nq
         7JZnCYFMtQPmubGubrX8MBC/QU334Qm6J/Udoe03EQ5GW8HXq8OFaGJqWcqyZGWVP/4N
         8SHg==
X-Forwarded-Encrypted: i=1; AKwUvBz2ZB1YZkAUfqppp9Bg34rSLNAH+f1qnN6oJ3TsTr23sz7gPt+8ZrAPEd6X+tS+9w4iYCv2U2MfPfM=@vger.kernel.org
X-Gm-Message-State: AFuF++mYMIYPnZy0r7Ie14Sz/ZNfexJexdEXopKEsGNlItBJ0D64Dhai
	G6AHL3m5wNQMxkrKhtXRWu7/nc5HyvajuzcXzCxrZ4g71HdRpYNTBym6
X-Gm-Gg: AYBFou0AHXnjpkIPXdK1IXoRgiACftWy0xu2yVEEbaWKHWakv5jCXWASvYcNVgUOOdD
	SdskMhv33UQfsNlZgpQbUYzLLdz35G37M1hA7JMoRTtmPjRYCp0bRIpUoNUQGRCZlDv+vBh5HvH
	Zss6ORy2jxY3XoUJSG2D7cv2+mUdlWFJ6/gr6Dvxs3YaIPk/7mJPYqAvFtlv1jWqKXDVWgS5XPd
	fJTWLj2khGYNw4RndxniX9SGuovkVZRLlGi99NYwR8GBU3qEPuQVxwAIVCIE5PkzXpS3gsJoqUy
	EVXik8zvQpmTsh4dBh2EqHcr3mRdGNyUqYvRh3j9tc9JhPoYNLxd0jWYHjcJjCmY55mK0HC6g7y
	fAWwwmua+MERBqkaZFlIRq6/211E7zJRiCyw9XPL6MbRZQoDs3WChH7S7r5qUhIxyflg10R0wR1
	b5nzRP6SyxxA2G70jqmhoOdWTfgh7wvfFCCuSSNZI/AK+SZHJvCTTVrqeucfXDXmo=
X-Received: by 2002:a05:6102:3f8f:b0:7a5:1d50:ac35 with SMTP id ada2fe7eead31-7ac1db3268fmr2130763137.21.1790171591494;
        Wed, 23 Sep 2026 06:53:11 -0700 (PDT)
Received: from beelink.. ([187.13.30.172])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7abf35bdfbcsm3911189137.1.2026.09.23.06.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 06:53:11 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: vkoul@kernel.org
Cc: linuxppc-dev@lists.ozlabs.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] dmaengine: fsldma: kill the channel tasklet on remove
Date: Wed, 23 Sep 2026 10:53:01 -0300
Message-ID: <20260923135301.2448228-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fsl_dma_chan_remove() frees the fsldma_chan structure without first
quiescing the channel's tasklet. If an IRQ fires just before the
remove and schedules the tasklet, dma_do_tasklet() runs against the
freed channel struct, causing a use-after-free.

Add tasklet_kill() before tearing the channel down.

Fixes: d3f620b2c4fe ("fsldma: simplify IRQ probing and handling")
Cc: stable@vger.kernel.org
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
---
 drivers/dma/fsldma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index 22d62d9..0e2f848 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -1205,6 +1205,7 @@ static int fsl_dma_chan_probe(struct fsldma_device *fdev,
 
 static void fsl_dma_chan_remove(struct fsldma_chan *chan)
 {
+	tasklet_kill(&chan->tasklet);
 	irq_dispose_mapping(chan->irq);
 	list_del(&chan->common.device_node);
 	iounmap(chan->regs);
-- 
2.43.0
