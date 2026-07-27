Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684C8435ABE
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184848; cv=none; b=NnRWMn1PTTWCl0sQOP/tRQqowqYBfMTA8jjbKJ6IsuQ7KJvnpYkPEpg5ATLNUWvGC7ZMTZpr/eyJy+VKPMI1VBuWcRzEJXQYSjunU3htCgK3QdAR53CneLtBRkV5QAw/GajYNggaaxOIpXwPsR+8aRctpba3h794Y0m6hYQ2xpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184848; c=relaxed/simple;
	bh=FHcZkRosPyGWf6IGLaSzA6Oth9bY7ni4VX3ClpMLNk8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b9vbK6aVl3s4pVQMJb9FOSJehrnAUN3Etdx8hSxN5XE6haV4Vq4zObZdHdtpiX13qNUR5pbXOStKfXb1ajH4CozZa5RFSr8FV9fZIPas1IkILnfCMWA43HzE+bU9vKMNEWFVdkMtsGsYOMV0gVuSiHwRUphDReehKSPZRco1OMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FN6Txm1M; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FN6Txm1M"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-84861fc51f5so2449085b3a.1
        for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 13:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184847; x=1785789647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zSR2im6S6cq3HZXRJKoCqDqu90Syd/6myKnwGeWN+t0=;
        b=FN6Txm1MIUFWN008RUjAfyO/B/NX5taytfoFhg7+cBwCLSjTNos21aaBX3MZIuC5oj
         487et0dRnFIOQn/V/g6TrWNul5dvhZHP9gOaINYRlFa5joXpJEC/0RsHMrlnnQMeE6r/
         NBFusQ0/YqHTQ0HgGyqVY5mF57CwgBYXPSFSgu0xRb5unkksXaHA+OGNLPCAxq+ZpDKL
         6mP8tmRRLDoqOfUMFENIp6NG2B5XLCLUNgkTTxvsP/PTG1ccDxKDYMeWIKF0MLZ6b8Ox
         URM1MutX+YJxO7l3+xAD1AEVbzd7SPdrXorduf1ZU33Kc46lG8d28G0Wn+yqp4M2CXQs
         I5iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184847; x=1785789647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zSR2im6S6cq3HZXRJKoCqDqu90Syd/6myKnwGeWN+t0=;
        b=pdy4v4NZohERc1HSfH3UmDnuoVwtP+0Oq9Q/U+yRxWgNJt9kfuYrbsKver48wgKRmv
         wZSzGbAS2JSZnBa+hY+v/9Ezhr8fcVK8CZUsAonTNghzZxBn6wMZmI21OyzBuyN0/FWk
         H3Z/z8ManxG/HB9aLgB7vGqUBomJ2uzQRtym+9wAhweJc87ZpGKExRP52B5ko/eEvbzm
         7nAa4nrvzKwCFtUkSjrzpbwcod8hxBG3OlMPEOiRJEGjmyCNROhCC8y/EaDOwKu2APEY
         7O3Lk+U2JPiVv1lI1veFFduuCWUhR8NRgOZo06XkRJioS+BXjuMhIl8LydAlVZwbd0Yr
         2nnA==
X-Forwarded-Encrypted: i=1; AHgh+RonNHe51bzLbvk+NXe0EM6W7YIEH64tDwWGKTpEZIlgVQ5z5AAEGyl7hEGWJVlHhQfJUr6Ln76cyuY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvl02/IbZv9zWMSoAkfKjTO/2FNf4fqL63ihI9nRPv/hatJhGX
	wy+kKTfdB9hTJ01AcjFeygogpITgVGZj33NOiKPb0pk0mKRvjQVAeIib
X-Gm-Gg: AR+sD13nimFmomwsuBvxDbRcJp91hwFjfvgS2YkjhaaK1qtu3ki9WqIpUjD8kHOZzyk
	ZYFbuVHVZk/xUTp1YQu538/WIeK43ctWhHSqXujircIYwd80cNKuRedzEH0nJMOs0gBgF0a9RKK
	5X9vy1Fmno+OOyN4Ol+whGhhXkNX/OBs98+6C/6j5zdvKBxsy4QJ/KmM29v8IuBRM2+2omMFtRZ
	1QvjB6Y4+tyLQSNUzG6KLvaEAdN5WCn/c9Seqg2dYGRdTTssBmp2Bjta2YF6wPS6YloUMXvKA5j
	+qvUauZJIwcD/2nl19l9oZ9ZhERXhonj/WUvpVZQ3Msxr4/v0o5m0WK2OaGfUaASRL9dKOm1L/D
	OWMx36Wqgk9fJEg+NfDmeFoab1LrEYj3gBRWqGG2SfhXMMT8CwVeYVkQFenumBsBTwunYm1WfqK
	hRLxn6
X-Received: by 2002:a05:6a00:4489:b0:848:559f:1450 with SMTP id d2e1a72fcca58-84e8d425932mr798902b3a.74.1785184846760;
        Mon, 27 Jul 2026 13:40:46 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e533d1351sm3583338b3a.39.2026.07.27.13.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:40:45 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 51/64] dmaengine: bcm2835: kill vchan BH on teardown
Date: Mon, 27 Jul 2026 13:39:13 -0700
Message-ID: <2079c09aba6b298cad25fb95b062ac370a65452b.1785183549.git.allen.lkml@gmail.com>
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

Use dma_chan_kill_bh() for virt-dma cleanup.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/bcm2835-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 06d830d36882..68e86c8d3d43 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -829,7 +829,7 @@ static void bcm2835_dma_free(struct bcm2835_dmadev *od)
 	list_for_each_entry_safe(c, next, &od->ddev.channels,
 				 vc.chan.device_node) {
 		list_del(&c->vc.chan.device_node);
-		tasklet_kill(&c->vc.task);
+		dma_chan_kill_bh(&c->vc.chan);
 	}
 
 	dma_unmap_page_attrs(od->ddev.dev, od->zero_page, PAGE_SIZE,
-- 
2.43.0

