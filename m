Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793744779;
	b=NdPwj208X1Q+VESIDdYetFJpuJRlIiqb+tNgceBGusptyRWZu83gkMluoqyiXuc9Z2Pe
	 sh5VldkJ7hiIe2gAnHZdmxWY4ppV89AVbCsHVUOALGabX9zkOLoL22mQBNPZtNGAQnpYh
	 Jc8x5RQT6RZCyqfEfYXi2z8LeuiwTq9syPdBt08C+lZM5C85dHdBma4aMCw9NaxF5hsWJ
	 1us9KpAhN5yHj/0CZnhtJGg6zB/PQzV8jmBCLzS4Ec+L//1CCnrhPW0MISJsPS+aqT0Kj
	 SyVa02ubL6wgTXDaZKYQOupyeLwp3Mydb8IDygM7xdQfqU7dHut4CJXk9xAKsN2mR2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793744779;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=OS2UBcR5n5u6jJuSGCUmpdlBoEKk3jjjMEO5gyi3TM8=;
	b=JDM+yHWdHKFaQq6e2CvJ6jLNHiaJapMJLzwCCSnQQBjDP69Kob/EgBMGlgEJQE97Dq5l
	 Z9hkxxrBSuLLB4HSXs0KF82qpaSQ4cry++GSi7HvHJnOfXkcX1YZ6mzApGr8TQEuNSgDH
	 QwvfWgyc/oJTXvv4uVdSOp3uocIxrV9TkZNm8Tf6erof7FAmGzW3DSoZXtXKpGqOxGRlo
	 49x/EWJ3HO0zqnuCNViMxAT8fVtL0v1Qs/d2lpHRML0pb/o+kUNgROozOnbTDGs9sLmzR
	 c3IY1u7J+iehonzUfLLbNuXws4VeL2aVLrKcgk451gKM6pv4tpVyuyI+PsADB/f0jxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="tFMaa7U/";
	arc=none smtp.remote-ip=209.85.167.178
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78927606D806
	for <dmaengine@vger.kernel.org>; Tue,  3 Nov 2026 22:26:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78927606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tFMaa7U/
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-4b190cdc9feso87410b6e.0
        for <dmaengine@vger.kernel.org>; Tue, 03 Nov 2026 14:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793744778; x=1794349578; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OS2UBcR5n5u6jJuSGCUmpdlBoEKk3jjjMEO5gyi3TM8=;
        b=tFMaa7U/EPvWCJKXZ6ZVDPzrLj96GdU0G3vCTU6OXsFkiS8ic9DdBhM9e93NiUpipL
         u0+hBeddxPHKptEdjYPJNPcM6b1HiJdMGK1iDdsdJNyqkwmtswRYumFyAp0pgSUOzd8t
         OCsGp3isgWHB1ReFTUu/BqDlPxHxAuB7kK+TdOH7hpnR2ZLarblJV/EvBJ+UbCHACsTh
         UiigkxjrTsmr0Qzz6BXt7PZ4GgQWYTC6ArpAk5tUCIwahRnqdAwky8wic5jsAbpYFsDS
         s03ltWCGE+Fr7LISzrztj4xyjjlG36r6biFlqdVeY3Fpn0LkS+PSQeLsb8Q8u2hAoSjR
         8wag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793744778; x=1794349578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OS2UBcR5n5u6jJuSGCUmpdlBoEKk3jjjMEO5gyi3TM8=;
        b=xAIPncgcj3ZaVYa5Rhjtw0KZ21l3LhKOcMZEi1R+/3aFcFiKuw7kNmwXOtpcZXalk4
         6h1Amq8deUXhd7b4sM7+91gVUC4qdImul+Y2nlu1ALAji7bZVPDlRPof4FA/7n1KoVJg
         vx/pOF3g62tqNckLQ3t/ec34doxQ/gZq8xlowEafCM87wvRLRNGt1Cn25NqTZvFXa6fD
         wrAcBq9tMQD4qqe4UlVVK6UZ2XzCUxxO8ZSePLQXReoCwFb5OP7SVTbPIo+3xwn6Y/2S
         aYEhKG4yG1vL+9R9o1mTKT0SvuM+XAVQWRZz4Teo6TGJc/zKetocZ5yaqhlhDLAgDUK/
         i/0w==
X-Forwarded-Encrypted: i=1; AKwUvBxnqu/Aju/rodIK9iMLZU7LN8V/pwzhgJNCoSOTa4jW6Fi/iuenvs2S78tC1ZwpyipL58bRrtifkC0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/EN3li3q1nARlieZpIHO4HUvSwkCBytr4rFtfs+TIK3oIlUbBq
	ybcUna5126h63IWCDUSnrsRMzW3SHtbDvzSDE1Xx4paVCukFIvSSB7tB
X-Gm-Gg: AYBFou2oubXxOnd9T4IzhDSJLw6dtDzCs5U6pv8TEE0k9JPkpRjJTpwHziYc0ifbhxv
	RNSCAVjga/dl/t1JN15qac4irZC0d4+51A6s1JNmyU3XJXgPHGj8C32HD1w8438mOSEQDEzttfS
	mmLSAla0HapZkphvybGB7TP80kKSo0q+vJ1f+b32p5R98nVZ7AeZvSjwvf7hAKHrruKpWBf8H47
	Iw3rTDh400DlZp/B/8dyrfu5k3xsUSOmwOhAxmpOY2IXkAYKBoDxgW3slEZxCHq8T/+o4/zGJ5Q
	iDVwNLD98dx8Ae/2Syagxl8PNNQrf9EEhiKGsyApG2NqiGXqv8DYY7ZprAp73+14Ur0GNlppXsd
	jxuGjVD314y4HfRj8nTvu6FJhBhcThB1bLhmC243cW5mR+Pm78wuUD14btVjLmSeVpH4FDTy2Lp
	iXDbFfzX/YLarHtCqcQNaz8tuLzveVWoMFdgkAaFip1vKmzCrnyL0PaVJZ/8NZZ894FUtFJIwYB
	Ts5RXAdh34Ur9zJPTrhXaJV22sY/9+wDJgCCOkkwnI6C2MRGT1z7NNGwl9Zy13ODinsKcZl1meq
	VZJOy8sPSbcvMT3Yzr1QI17eBNMAJgzLYjPEeOYIJ7ttlW05rV/kqvPTIoTS86+OIDXMn8Mbcs9
	61Kv52W2WlBE0bCb9qxnXe3gfoTAGToFFYjcRlVVPX9xvbcyq1gTVt7sMIwZMywn3uCRtTXiopg
	WF3zx6UYYf71z5l94sBrnN9Lkp5+mohXOE4Al0D7hfv4kSv5KyfDKdFgEvRpnVTyRMu7Hw7dzW
X-Received: by 2002:a05:6808:2207:b0:4e8:92e5:db5b with SMTP id 5614622812f47-5640de625e5mr10539802b6e.54.1793744778356;
        Tue, 03 Nov 2026 14:26:18 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9ef58b1sm128435b6e.3.2026.11.03.14.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:26:17 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 15:26:04 -0700
Subject: [PATCH v6 02/10] dmaengine: dw: serialize error recovery with
 channel termination
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-submit-dw-dma-synchronize-v1-v6-2-2ee0c348224d@gmail.com>
References: <20261103-submit-dw-dma-synchronize-v1-v6-0-2ee0c348224d@gmail.com>
In-Reply-To: <20261103-submit-dw-dma-synchronize-v1-v6-0-2ee0c348224d@gmail.com>
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Dan Williams <djbw@kernel.org>
Cc: Serge Semin <fancer.lancer@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 dmaengine@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2

The tasklet samples RAW.ERROR before taking the channel lock. A
concurrent termination can empty the active list before dwc_handle_error()
uses that cached error to select a descriptor. The list head is then
interpreted as a descriptor. Even with an active descriptor, moving
queue.next unconditionally can put an empty queue's head on the active
list and pass it to dwc_dostart().

Recheck the error status under the channel lock and stop the channel
before selecting its failed descriptor. Only one transaction is issued
at a time, so take that descriptor directly instead of scanning for
completions first. The scan can otherwise complete it and start queued
work before the error handler has identified the failed transaction.

Detach the failed descriptor under the same lock and use the queued-start
helper, which leaves an empty queue alone. Clear the software-LLP flag
before restarting so a failed multiblock transfer does not prevent the
next transaction from starting. Keep the completion callback outside the
lock, with the detached descriptor owned by the tasklet.

Fixes: 3bfb1d20b547 ("dmaengine: Driver for the Synopsys DesignWare DMA controller")
Fixes: f336e42f73d9 ("dw_dmac: Move single descriptor from dwc->queue to dwc->active_list in dwc_complete_all")
Cc: stable@vger.kernel.org
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw/core.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index 2a9db9e39f5f..f7ca9da5af90 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -403,10 +403,17 @@ static void dwc_handle_error(struct dw_dma *dw, struct dw_dma_chan *dwc)
 	struct dw_desc *child;
 	unsigned long flags;
 
-	dwc_scan_descriptors(dw, dwc);
-
 	spin_lock_irqsave(&dwc->lock, flags);
 
+	/* Termination may have cleared the error since the tasklet sampled it. */
+	if (!(dma_readl(dw, RAW.ERROR) & dwc->mask))
+		goto unlock;
+
+	dwc_chan_disable(dw, dwc);
+	clear_bit(DW_DMA_IS_SOFT_LLP, &dwc->flags);
+	if (list_empty(&dwc->active_list))
+		goto unlock;
+
 	/*
 	 * The descriptor currently at the head of the active list is
 	 * borked. Since we don't have any way to report errors, we'll
@@ -414,12 +421,7 @@ static void dwc_handle_error(struct dw_dma *dw, struct dw_dma_chan *dwc)
 	 */
 	bad_desc = dwc_first_active(dwc);
 	list_del_init(&bad_desc->desc_node);
-	list_move(dwc->queue.next, dwc->active_list.prev);
-
-	/* Clear the error flag and try to restart the controller */
-	dma_writel(dw, CLEAR.ERROR, dwc->mask);
-	if (!list_empty(&dwc->active_list))
-		dwc_dostart(dwc, dwc_first_active(dwc));
+	dwc_dostart_first_queued(dwc);
 
 	/*
 	 * WARN may seem harsh, but since this only happens
@@ -438,6 +440,10 @@ static void dwc_handle_error(struct dw_dma *dw, struct dw_dma_chan *dwc)
 
 	/* Pretend the descriptor completed successfully */
 	dwc_descriptor_complete(dwc, bad_desc, true);
+	return;
+
+unlock:
+	spin_unlock_irqrestore(&dwc->lock, flags);
 }
 
 static void dw_dma_tasklet(struct tasklet_struct *t)

-- 
2.53.0

