Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B9114A60F
	for <dmaengine@vger.kernel.org>; Sat, 18 Jul 2026 23:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784418751; cv=none; b=uFPQRL5KAFtteDDrWJDWj6m0rWmAeNO0JJh5otlZHbMNdpeLZgLgNVqOxjI1oshRo7D9wN+GPCQHNKsvWnhsHvh6muPCoBukUedWAhuRuYVyPoc48EMVb41jS7fDRx9M+jHw+ZVgM5IAqYo5UDFLX60pmh/ouWze27+KOxRqllE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784418751; c=relaxed/simple;
	bh=Vkgon4DnVRYgHLRCpVCHXeHbSiydfKmoskzK7n0qrls=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IJZ/EtvbLygeAzTgsI66rZaJ05+Oyarm6jBUrCC1ktf5nGekxDSA4yU0RwG+gCer65q4/2MO+GDgVqDDyj2RXZj80Livd55g4EttkIV+DMrGubAUw2LxHxitD/hKh8beR7zf1vij8yNustcE5HVWY0/YpHnsKZBYKc7FTGP4Uqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RfJH5uNk; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RfJH5uNk"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cacb8416a1so55171535ad.1
        for <dmaengine@vger.kernel.org>; Sat, 18 Jul 2026 16:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784418750; x=1785023550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x92z5yoBTdRatbHpYv8nFIoqSUEj68C60XRNNUbrW/0=;
        b=RfJH5uNkwOYdbIpy+w3lOcs/m9/EOP0SYEk6I6Q9KiSooON5OkHtK51FS8UqnJNqnn
         RxdNpycYKPStJ3Nt1QiJ5tz6kJOiYL0rx/GJ/BfMSvmL1eyKTEHOG8HoZsb9FzJcgQvQ
         hL2O+hAv61zG9GCw//4GOb4NxZS+KIufhArxGVKNXGHG4CWFuYLSnRNgxYsx72ENjPIv
         KN2Nr6IC3+pkuKcdL+Td/dnRY25QaKT8TWCpEuk0HCtFmzMeqAzvZPRF0oTDt3lMTSnD
         n4nrawUXf6GipRNOvE8X3aP5Y9p3JiBv8W8q/lE4H7LXq0NIR8wo9SrrUDlrSL1G+Otj
         p49w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784418750; x=1785023550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x92z5yoBTdRatbHpYv8nFIoqSUEj68C60XRNNUbrW/0=;
        b=aKO7y0wdEsFv0FvK5JtqbBLgAnenYfijyJfZbZAvMosbjr7jK7xbRyDgSt+jfohDbf
         yx4mK5Hlnaivaao+xw5DmzVxXvlgAcnUy795zQErSG5EWjGTXP2I+b0eaMI6ZNe2ExYo
         dqEaq9u2V3ammZSSGAOwRE1bGqeb1GyA98mEPuNqWx3EGO8Mro4FAZnANXA2zriWTG25
         Pnl8JvWMahjK9TaP4Eb3CKIwOnI2QVyfp0cas/O/L1P3OBzV4NBJbyEpNaLdKmkx18wJ
         d8pEqfUB6DHbwVcuaHsY29mQvTbVuS7JCsStptggA99kNOARi+1hGP8eubtmCmjolcqa
         zuIw==
X-Gm-Message-State: AOJu0YzhJpPaA8Ab291fTCL0iKN7+9spnnpBcRh5nn50HZNmiWWiSaHC
	Rds2vJOjqcf9W1HhqyfYzeqlq+Vp4u08PqwHZ/5czGRjmZsWFZVsVJbPCHxAUw==
X-Gm-Gg: AfdE7ckwtNyRhZVadZZcJ2aYKrsMDYseYLCiKOt+qCYNkfFbHKuasjRdVOEfE3fQb7x
	KN1si6l1Vqkwq6OIaGV1v6YQV9NP+QNUt26imntZbL3LQAAuCNNkwSBQyg4PU+FwINEhkx7mT9r
	lis6Se0XaLo9SyIl9kqxqmW4n+6nfbLdxQbsSuGrwtGe8DtpHQE3I0pRlrN2Z5ipI7HwEoNhqHy
	KUA20LyhKywqOdjqBBPkeZkmCMj1A/JkahkB1KrXiRqL3ka0lOTNIm+Kb46YvftXp/hPxu9zPtt
	wlW8SHs1/4CEs+TonEKYk0QaTsddCLNtG5BJGld0gGn0Zl0ikx6LeD+SFZGYMspEkFZNLstYUVU
	4hHIaLt2BbQ3AnD/gRctdkrkLcnpT+qv9VGAKp0tsbfhFFMgrbLKwIIshmPMLdbzrHwxZrsHH1O
	OP07P4JJm535iQbjndnPNvzYEv2JaIwfwFNcJl4MAbOsv4aMphNXq4dsJEOnI7BzrCPaVzD8V/F
	2qTWEZJ9a3+Z0usK6jbsWew4pamKNM4Tk9KW/OUoXV4xJymAR386zWax8hxjMGLXg==
X-Received: by 2002:a17:903:186:b0:2ce:e747:c5d4 with SMTP id d9443c01a7336-2cf34a34131mr90565875ad.46.1784418749895;
        Sat, 18 Jul 2026 16:52:29 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf344f4481sm32999155ad.32.2026.07.18.16.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 16:52:29 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Harninder Rai <harninder.rai@freescale.com>,
	Xuelin Shi <xuelin.shi@freescale.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] dmaengine: fsl_raid: avoid free_q underflow in free_chan_resources
Date: Sat, 18 Jul 2026 16:52:27 -0700
Message-ID: <20260718235227.385108-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fsl_re_free_chan_resources() loops alloc_count times calling
list_first_entry() on free_q without checking whether the list still
has entries. If descriptors remain un-acked or pending in submit_q /
active_q / ack_q when the channel resources are freed, free_q becomes
smaller than alloc_count and list_first_entry() returns the list head,
causing list_del() to corrupt the list head and dereference a bogus
pointer.

Walk free_q with list_for_each_entry_safe() until it is empty,
decrementing alloc_count per freed descriptor, instead of relying on
the alloc_count count.

Fixes: ad80da658bbc ("dmaengine: Driver support for FSL RaidEngine device.")
Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/fsl_raid.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
index 30aaca81d855..db86f3e4e460 100644
--- a/drivers/dma/fsl_raid.c
+++ b/drivers/dma/fsl_raid.c
@@ -614,18 +614,15 @@ static int fsl_re_alloc_chan_resources(struct dma_chan *chan)
 static void fsl_re_free_chan_resources(struct dma_chan *chan)
 {
 	struct fsl_re_chan *re_chan;
-	struct fsl_re_desc *desc;
+	struct fsl_re_desc *desc, *_desc;
 
 	re_chan = container_of(chan, struct fsl_re_chan, chan);
-	while (re_chan->alloc_count--) {
-		desc = list_first_entry(&re_chan->free_q,
-					struct fsl_re_desc,
-					node);
-
+	list_for_each_entry_safe(desc, _desc, &re_chan->free_q, node) {
 		list_del(&desc->node);
 		dma_pool_free(re_chan->re_dev->cf_desc_pool, desc->cf_addr,
 			      desc->cf_paddr);
 		kfree(desc);
+		re_chan->alloc_count--;
 	}
 
 	if (!list_empty(&re_chan->free_q))
-- 
2.55.0

