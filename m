Received: from mail-vs2-f16.google.com (mail-vs2-f16.google.com [74.125.227.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C30524AE6
	for <dmaengine@vger.kernel.org>; Wed, 23 Sep 2026 13:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790171436; cv=none; b=psJccBAFdgUO5epbbf0WnZo1iLb2NkqLFdPg+J2drmnNJzT1RY8SQ+7LvAJrjQwfG5gw1bubx0Nvj0qn9w6/5O29bJoQxoIBAzAmkd5miiFqvIIWTw9FXhYUTFMyc7dtqQcGcWt31uphtCf/84A4sUiUyeWigjEBDyKE8/Hh+zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790171436; c=relaxed/simple;
	bh=pc0FDD6IR7pFOD7noF91D54mnHrzpCH4w/W7A8vQcRg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e8hqzdYlAbh5qmb2B7v3AS88MlIDqJ4GKhJN4BYNvRS5X3Tr5/DtsH3bnxTvbWhSn4Y37MBz9lkm6nk+qxt52gInQ5oMBB1vpHRkaBJBl1jm8WZubH30yHjx3jihOK+MT0IBh9mX3bhvXaXyXDZ14k0vpK//qaXxZFsyXvwxBu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ie7k14XL; arc=none smtp.client-ip=74.125.227.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ie7k14XL"
Received: by mail-vs2-f16.google.com with SMTP id 71dfb90a1353d-5c67e5292fdso394473e0c.3
        for <dmaengine@vger.kernel.org>; Wed, 23 Sep 2026 06:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790171432; x=1790776232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2SglU6SsyzFxHFyMmhSwCTOipsWKClut0lOm4koa3sM=;
        b=Ie7k14XLYXwZhS9e3z65cqdUOciSzADvJZlfnypfy5tdumIN20Y97QQIsdEdLbxlL2
         evK5A0R4gs/GYFzKwsExv8ofZNQtY910r/mQETygvg4UOGa4sQ6rgAzYbTAMajahAqnB
         dTqv77xqccDbnnv7lo0LjruUEeBQPgyZqO3O2ODMMKkawDombR44drMd7DjaQmBwtADF
         VE0x0K6n42smys2IygUpReg6FIb9ValhQ7AltsDDwh22eyhw2+i/oEyLmFmkSTPdNDfR
         SsLsba8lwwu1KIXiZj3vZZ4gxUTOgTzsprQIHhZ+Ugl2n8aX8F2zk4220+inOzgEWuwe
         4wkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790171432; x=1790776232;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2SglU6SsyzFxHFyMmhSwCTOipsWKClut0lOm4koa3sM=;
        b=OxN+ad60ZYuhQ4pdQxHEMlmnvTNtxIHi2uIglE58OTZJe0i1bRuzfgbCUKfHNNfAw7
         ZxWi+ohBUSCoBbUsyHOc4W01FhUskPjiBL5sKoylTx4IgNpCLr/SWnC7DhC4Po8K4sf6
         U5kqoT7wbS7D1s9c7sC5fOqZUKjBEL6q0P3lSQlMOHW2W3ESaXWJL5W3d7iWCIIDK0uI
         Hwn35AW5Eociu8PWe+sJFJgarenkPELGpmf7HfRS300UgVWRuRVI5rq6d+6fwCHX74Kc
         o+h7Nf/hJCwczfEFZZvATpvxaMCSy4gO3f2+OxtJv0Qa4/7llzFwFgCbklCJs76FE6an
         VLUQ==
X-Forwarded-Encrypted: i=1; AKwUvBwiugpXiwZuOKMY5JBhu/lrlUuC3y9o97vFuIJCFy1liMXcF4fWSPnipAK9X3xxMV6PUPVCXeierAw=@vger.kernel.org
X-Gm-Message-State: AFuF++myqSnAFcJPFVJ5KVN/XzkYYeFnlhkunOPqEWVWdH3wZJk8U7PI
	GzzshavAlDxukujsMDYqgyAZ4m97emt0IDolM1hDD3o05UzB7KMHXS3v
X-Gm-Gg: AYBFou17BPzu2a94vqOLBitb9M5ukcAbbGdZQrGPZ127acFxOfbpYgab3HbH0vOOlJu
	H0WZVjXFmoYOxfauts+eRbG8jxl7d8WEn9VRZArDkzRHCaVFQv6A4AiXKn4dZPpfpUO/aOhQD6a
	haoHz5PHGjjDHMgjezW7CC6lCr2gpkRxhKirs/VT2LvIOhfgA14tj0JT7Wx0SR2y8tUvchk4KXe
	SlorXJviHyQew7LtffH9N7pVIg66XK84ohbpg6UrAzDauGnD/mQT8YIWp3MZTIhPadVA2vAqwd2
	O7pvyiLXs8FkZaCtaBgIc+vI6EW2dArEVDK5XzsWbwi5RY8QldNrgP5TQRwazpzZ4Ud0bHbE32S
	tuEAD4iEih6aLlGJeFzEqvPwlLm2vMFj1+m+0Ba5OMkp7C7CqOhJRDBzNUFnzc5/TTweHhF6d2i
	jHYEQNzonVcM3rqITuv9tZM+mFh9F1OsBX5Ct9MnKy30qNe+8gsfxv9IguX1Vtdh0=
X-Received: by 2002:a05:6122:2093:b0:5c9:a60b:e5d4 with SMTP id 71dfb90a1353d-5c9f165664amr3033636e0c.14.1790171432428;
        Wed, 23 Sep 2026 06:50:32 -0700 (PDT)
Received: from beelink.. ([187.13.30.172])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f04c2a36sm3263916e0c.5.2026.09.23.06.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 06:50:32 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: zw@zh-kernel.org
Cc: linuxppc-dev@lists.ozlabs.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] dmaengine: fsldma: kill the channel tasklet on remove
Date: Wed, 23 Sep 2026 10:50:21 -0300
Message-ID: <20260923135021.1858325-1-qwe.aldo@gmail.com>
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
