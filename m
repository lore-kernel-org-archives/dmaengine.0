Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7BB37DEB7
	for <dmaengine@vger.kernel.org>; Wed,  7 Oct 2026 15:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791385283; cv=none; b=Hovsm9BqjMtQCJxL3GZlypictcqfhY3EkKKkMi57jF83FKEX3b46I9x+wLMejwE3GTdboxZmAjnkZW/barlmNiH3JgsAwedOLDsZyrqyUsNibfLfQZI85CdxLwomom9FsIObFQetqFFRg+uWNrGcirlweHJMlNIJSkNWqapDVyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791385283; c=relaxed/simple;
	bh=+Q/r9VtgwE43/bNjNDFZadcuZgbsQLVges7hS/tJGdg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f0KWuja65gXN5itSEHXDRtDlOS+nYUWdNg/mCwdlqD+JHa5F4laUkQ0VNk801mpeVGwM5CoTZqpyplwf8IH+GjcA90Wwycj94I3ekhVX+boAOylp/3Cjln37JGP4PPqOhOS8x+/X08kPdaYmUJyThZOOK+2c0bDQVgA7xqJQRP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Www6lXGZ; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Www6lXGZ"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-39647aa9d52so1825810a91.0
        for <dmaengine@vger.kernel.org>; Wed, 07 Oct 2026 08:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791385275; x=1791990075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sCVuSf7dl2NiMq0WjgbGPuLseqx6JkndalNFufVz1Tw=;
        b=Www6lXGZuw3Ro7bAcldxsGZipLQoXVrFORI4Hi+4YyBmeBN0tWSCp1wr1tJI1emKni
         yP2/cIs2+0vfJaWxowXzcjjuzzn4bo+GU8AcWS3pVQ+yuX45R5RnRlleQ8RFeoVaSZpo
         R/hsjOpkpemxeEUkVJaKepJWPF0uGy4DkGufuZJmIx8oX1ukujW0LM6YO5mO7ws7evVL
         gEFUMq6G7u50WTI0eNQKyfuwzHzW8vxuo8AVntvrMEg89QXsfOryT9lCzG065r/ezRW4
         POOKloMXitQMVPbO1m9mEl7WRnoVkFWpz9vmDUAtPy1Tt7UA/DOKMCopKEPTUdh0d5pt
         JgwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791385275; x=1791990075;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sCVuSf7dl2NiMq0WjgbGPuLseqx6JkndalNFufVz1Tw=;
        b=yC705FcI2z/ujoO16UO+hVt3l14As1B0yQJPtF1TihWmK6i0iTHo4a9/fTFGRY5JB4
         FbrMhEltAxgR0w/O6X1/W+svWDGlXDMSy873GJtojjjV59zlEfBsApOtU8wZOxsSGCBS
         6B2roF4BO7faf3gWVbeXF25xsSz9L4PpaZUsLF+wcskoTgNOVu5f868peVuqfhljjEp1
         B4Wzc6nT1HpBMprSiySKehtL/JtGjlYVY9VjVZPRtLBatLMtrRj/417l5g3MVFHoPoYM
         hfibfQwLVYdzgUkjzjY8s6SOOn8ogEgIrz6gNojV1lSqW5+N0V3nvKd9XH/0JqUdmQVA
         gv4g==
X-Gm-Message-State: AFq9FYItpCfv29tO3oBuYE1NhUMWLlJVsvLQliAlBL+pnDlueEqDPKZ+
	THxZBQyvbOLT6/Tj2ggcsu4pjWXf0D2C7SXnupDlvfRTSByuQdGUXlxg
X-Gm-Gg: AYBFou2VkjUy4Nc97dGWOHZNjulbWsb28yYCN76HMoJjfrhYu6hT5mZuGk96gnqVXVe
	dnnpSyeQythd0+KDSsHejhPU4JjPqAioLBAEE7eNIWSdKonl4Jx0w/+kdgQMVVmyUXq8krAPA0r
	GGn/tUwqyqVgKK7vTf4acbEPEQ7QfdfmLHBw3owsJPsNkR53r8iDXAEbGHD2J1ujJDW7BjiYfGZ
	8cijgSxyPK+USUMonULh3QOM+u9ix1RPh8SBEwI8M2niCMSjn0qk3MZoZmPdvyQmrZf9M/O1Q35
	hZHCHUiRAH3GY/rkRYrMd6zuSzUhF/vsXTxF6tjafWJ9fCyHI/Zd4MWWs6rRTk+y6LeesyxcEtu
	z0v+SeQXvWKID0vUNR9bl8utgJyGD0Ar7ucHq+2D1nMFSYNyFG38u9eg4I3167EUWjwhJgfrseW
	XfRx6NMA0pbYtOMlSBaUX1wyZb4kdQ8LMlc8Wyns8Eel0caRgq7EKjFR9QOQUEeKiGXmDNHzPg2
	rYxUWgeOhnbhf6BQHu10+uOZ25S0tn0mV4FleJjGLoD9POqc1ACFU4T32Pd
X-Received: by 2002:a17:90b:58e8:b0:3a8:786a:cfed with SMTP id 98e67ed59e1d1-3a8a153a870mr1453009a91.37.1791385273896;
        Wed, 07 Oct 2026 08:01:13 -0700 (PDT)
Received: from localhost.localdomain (101.120.85.136.bc.googleusercontent.com. [136.85.120.101])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a89ab81bb0sm5107544a91.5.2026.10.07.08.01.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 07 Oct 2026 08:01:13 -0700 (PDT)
From: Ginger Li <ginger.jzllee@gmail.com>
To: vkoul@kernel.org,
	Frank.Li@kernel.org
Cc: dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dmaengine: pl330: Fix lock-order inversion in the channel release path
Date: Wed,  7 Oct 2026 23:01:04 +0800
Message-ID: <20261007150104.38253-1-ginger.jzllee@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pl330 uses two locks per transfer: the channel lock pch->lock and the
controller lock pl330->lock. My static analyzer reported that they can
be taken concurrently in opposite orders, leading to potential deadlocks.

The terminate/stop paths take pch->lock first and then pl330->lock, e.g.
  pl330_terminate_all()
    -> spin_lock_irqsave(&pch->lock, flags);
    -> spin_lock(&pl330->lock);
and
  pl330_pause()
    -> spin_lock_irqsave(&pch->lock, flags);
    -> spin_lock(&pl330->lock);

While on the other hand, the channel release path takes pl330->lock first 
and then pch->lock in pl330_free_chan_resources():
  pl330_free_chan_resources()
    -> spin_lock_irqsave(&pl330->lock, flags);
    -> pl330_release_channel(pch->thread);
    -> dma_pl330_rqcb()
      -> spin_lock_irqsave(&pch->lock, flags);

Freeing a channel (dma_release_channel() -> dma_chan_put() ->
pl330_free_chan_resources()) while another CPU is in pl330_terminate_all()
or pl330_pause() on the same channel is therefore an ABBA deadlock: the 
one thread spins on pl330->lock that the other holds, and vice versa.

Inspecting the driver code suggests the rule that dma_pl330_rqcb() must 
not be called with pl330->lock held: pl330_dotask() and the callback 
drain loop  in pl330_update() both releases pl330->lock before their 
dma_pl330_rqcb() calls. Thus, pl330_release_channel() is expected 
to follow the same manner.

Let pl330_release_channel() manage pl330->lock itself and keep the two
dma_pl330_rqcb() calls outside the critical section, and stop holding
pl330->lock around the call in pl330_free_chan_resources().

This was found by a static analyzer on Linux 7.3-rc4; it reported
DeadLock::AllLock (Certain) for

    pl330_free_chan_resources() <-> pl330_terminate_all()
    pl330_free_chan_resources() <-> pl330_pause().

Fixes: 91539eb1fda2 ("dmaengine: pl330: fix double lock")
Signed-off-by: Ginger Li <ginger.jzllee@gmail.com>
---
 drivers/dma/pl330.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
--- a/drivers/dma/pl330.c
+++ b/drivers/dma/pl330.c
@@ -1805,16 +1805,32 @@
 
 static void pl330_release_channel(struct pl330_thread *thrd)
 {
+	struct pl330_dmac *pl330;
+	unsigned long flags;
+
 	if (!thrd || thrd->free)
 		return;
 
+	pl330 = thrd->dmac;
+
+	spin_lock_irqsave(&pl330->lock, flags);
 	_stop(thrd);
+	spin_unlock_irqrestore(&pl330->lock, flags);
 
+	/*
+	 * dma_pl330_rqcb() takes the channel lock, which is acquired before
+	 * pl330->lock on the terminate/pause/tx_status paths.  Calling it with
+	 * pl330->lock held would invert the lock order, so keep it outside the
+	 * critical section - the same convention pl330_dotask() and
+	 * pl330_update() already follow.
+	 */
 	dma_pl330_rqcb(thrd->req[1 - thrd->lstenq].desc, PL330_ERR_ABORT);
 	dma_pl330_rqcb(thrd->req[thrd->lstenq].desc, PL330_ERR_ABORT);
 
+	spin_lock_irqsave(&pl330->lock, flags);
 	_free_event(thrd, thrd->ev);
 	thrd->free = true;
+	spin_unlock_irqrestore(&pl330->lock, flags);
 }
 
 /* Initialize the structure for PL330 configuration, that can be used
@@ -2358,9 +2374,15 @@
 	tasklet_kill(&pch->task);
 
 	pm_runtime_get_sync(pch->dmac->ddma.dev);
-	spin_lock_irqsave(&pl330->lock, flags);
 
+	/*
+	 * pl330_release_channel() takes pl330->lock itself and calls
+	 * dma_pl330_rqcb(), which takes the channel lock.  It must therefore
+	 * not be called with pl330->lock held (see the comment there).
+	 */
 	pl330_release_channel(pch->thread);
+
+	spin_lock_irqsave(&pl330->lock, flags);
 	pch->thread = NULL;
 
 	if (pch->cyclic)
-- 
2.43.0
