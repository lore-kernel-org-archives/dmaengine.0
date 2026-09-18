Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F80E4B7A53
	for <dmaengine@vger.kernel.org>; Fri, 18 Sep 2026 10:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789727653; cv=none; b=aR6whQsh4GfUo7ZK4pcSPjY6UFn2pCftPLb+vPUnNB5t0y3Q3TDQV92joSilcTPB3sVkQ91pNnO2+GTWKUSjg0i2ZU5z1lMvx8YPMzbsmM8Z9h0YVtuEdJMbeQ+VYBmo7Q2BMStvaGARN+deNWwsSCC+j2R2jsjf//F9hRz4Qq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789727653; c=relaxed/simple;
	bh=tBXQatbn7sU+nbitBb2rTHgOZjrL0HzLxIliF5ozd0g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cNCYdnQB0Ebs46TL1R9FYCrDgrhyVh1kAkBuqAUOnlJ+A9gdGL/vpGDoL0Zr8VeoRhwV+vwNbGZBfEQwCXDrH6vXUXxH2FBDIL5yfLZ802DhP3mbRMGXiRorPf7B3y2Wz7eqpzywilv8jGoIii6QZUXTwFCT6VsDncqFzcDo2B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=SSXYjeAt; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=H3rO7Kmc; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="SSXYjeAt";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="H3rO7Kmc"
Date: Fri, 18 Sep 2026 12:34:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789727650;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=mVpdqKTWBYAvoeI03to4mBT/nTsgk06pfHn6xUhfobA=;
	b=SSXYjeAtl/UMxxsk5nb5ltd5fvGgFTkDSrt+vMG+Fx3M72pAIc2hURSkz8Ux9NFE0CXF71
	jHc+WDA0CZu0Jo/nWs/YBzQJiyRjuoKhPXwcYmXLuzD72ubjrYBn3JqDkZxzFs+s9aheIu
	XcAYts/N5xqk23jL7iVD2YrpmJsZmBpgt4DCCO7RkXtjPlgd74SJAFxnwmjn4pqwj/eBeW
	PDRoWUL6Qufhtu7So+H/JSV0fqLtiZ491SoJxwLfVhbp36QPb3fRyeUFshA0v8S6cYLs8F
	TfqKtSX0pI7Ktlp82Boosd5pRDBmX8i3AlTSQkvT0N6YKvwGvYXLe2la/iAz9w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789727650;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=mVpdqKTWBYAvoeI03to4mBT/nTsgk06pfHn6xUhfobA=;
	b=H3rO7KmciACG2zD6u4BroOvtP8Zj/EjbflWROUA08l9uyWWs6VEns15zO7SvroMGgbKB2o
	BdqHvs9E3nxhFzAw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: dmaengine@vger.kernel.org
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Subject: [PATCH] dmaengine: loongson: Use %p for pointer formatting
Message-ID: <20260918103409.UV4g2ON7@linutronix.de>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

The %pK format modifier was meant for /proc kind of output, not general
printk output. Since commit ad67b74d2469d ("printk: hash addresses
printed with %p") pointers are hashed by default and the behaviour can
be controller by `hash_pointers' boot argument.
The policy on %p is to not introduce new ones. This is the only pointer
output in the driver.

Remove the pointer formating from debug output.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/dma/loongson/loongson2-apb-cmc-dma.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/dma/loongson/loongson2-apb-cmc-dma.c b/drivers/dma/loongson/loongson2-apb-cmc-dma.c
index 1c9a542edc859..27f8f7a5738d9 100644
--- a/drivers/dma/loongson/loongson2-apb-cmc-dma.c
+++ b/drivers/dma/loongson/loongson2-apb-cmc-dma.c
@@ -337,7 +337,6 @@ static void loongson2_cmc_dma_issue_pending(struct dma_chan *chan)
 	guard(spinlock_irqsave)(&lchan->vchan.lock);
 
 	if (vchan_issue_pending(&lchan->vchan) && !lchan->desc) {
-		dev_dbg(chan2dev(lchan), "vchan %pK: issued\n", &lchan->vchan);
 		loongson2_cmc_dma_start_transfer(lchan);
 	}
 }
-- 
2.55.0

