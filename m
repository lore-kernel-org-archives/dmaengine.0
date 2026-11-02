Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793648062;
	b=l6qVUDKhhDg1Az8iReCh3oOacb+9t+7HRBt7b44q6taPxSInBNVLqCp1tELeC9tQdmH+
	 GBVnWG0c2BiuoAOlbsp3FRm8lXX3MRY12alvlWx9Gs3HLVwrSlPkrvL/oS94XNTcom4Vn
	 hCppNiwzUYhiy6++deM8AMJswRDXkkqs6GJTpiKH+6oRWQPn5hTT72ZRClQGBeXM19O4Y
	 YtQqnqU5YxBNCxgndmJkxtGZ6gRkyA4CrgIBbRb1jySiigvz68RJIWpMU5yZyYxiTZb/6
	 kcTy/XPJPVYp8KdHWD/IdyfZTWpRhW82IXUdNgoC+z0/WfFmdM9wE4pRzMbM/fHb2Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793648062;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=OS2UBcR5n5u6jJuSGCUmpdlBoEKk3jjjMEO5gyi3TM8=;
	b=qEB8U6a4an+04PBCmaoccZtFQGSDdZQ7MymV3cPWJ6g9NJzVqEw8hMBVgqFHBzAtP+zi
	 NUyL3b1cX2yuAujvzUltso9D7KVv12tzhgJDsYLiYRoYtI+Mv/csOPTonEVHVJ+YPv5NC
	 y4UGWNrQ/y84lzsmoyEGwDB2rFJphAOQL6eLh8N9z/VPtTFxmgf5L972ZDeINWqkNvV4o
	 Lv09wxTkTmBhqc1114lNSrbYbG8CNU7/1M+CG6uS/zmtxbB7TxY9h6E7Ctv/xkyKPknSl
	 3m09eURr+yncfEns1G61zPlTO1nyXZP+Cbed6gZSTX9ShcN6lekkic4T9HXYcC1cH6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h0yJUUbj;
	arc=none smtp.remote-ip=209.85.167.169
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F6B606D812
	for <dmaengine@vger.kernel.org>; Mon,  2 Nov 2026 19:34:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0F6B606D812
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h0yJUUbj
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-4b28d9537bcso2471860b6e.0
        for <dmaengine@vger.kernel.org>; Mon, 02 Nov 2026 11:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793648061; x=1794252861; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OS2UBcR5n5u6jJuSGCUmpdlBoEKk3jjjMEO5gyi3TM8=;
        b=h0yJUUbjstn8n0lPMZb2BE7TQtnBcd7AjiPCy5Za2PFXpMbWiPRPEUAR3nxKRQRIRU
         IHc7q36oNA8OzxDC9sdg9ozvovc++jE1fEuB1D9drsvaMpjc4g8kTD+Jd7BLcEWRHWti
         BoUycOYQIiQbwZOuObVYf+XY7/LC6Y7NHPIEyGdxnfsX9OxyKj6ObXEjWe1ta1/CDno8
         r+b19zNJGWoiNtz1K9MpYYDv/OcCfMQemBYW4PIY1wIdRuOXp4qx3KPvDaFPcoanTelz
         McjMRvBAg6xVWnlZ5P1d6DLDD+OW2D1GHBb6HNtggdnSLguDawyCkuVntdjtGQjbUezQ
         eayw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793648061; x=1794252861;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OS2UBcR5n5u6jJuSGCUmpdlBoEKk3jjjMEO5gyi3TM8=;
        b=ojTutsynelgrKMWE7vLpTFdtxtbHgj4yoawlQ9R8Jqvnh54eR8Sqgx1IuCKpLGmP08
         kFvrd7Tx8ql3ErPUEbQgoGwrcMMwb3ISuujs0c+PzqGInF8mBBx1VInq5ne6k0SUoTIL
         OcQAqk7moyZ8XbK9RrIkcxcqraOlwd3ho7kq5euqLljtGi0GbSoJEeAOl0firbrSvkst
         RJCIE9RBWxbfezffxnpnnbSD02vet8lZro0m1V6fMko2YdhQ3J/4JiyrUypBLuO9E2ox
         Tstc8xHNNf5r80c72Q0kYY8FaBGM/LUZ6RSEptHcYHca5DOZhGMnIGCSvC/MSnT3qBNb
         TRNQ==
X-Forwarded-Encrypted: i=1; AKwUvBzGIWHKWqsH8CqOgSFR6SFZDGYTzJA8cCLY18ho8LOdHIighQZHAMJfvt9+z3t2ZFSG6JVm2CY+vPg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKp9t3MmA+EU4DiUy2MFbKaO9ZSGoTnnzkAwPQXidWD8D2BUprD
	oCCT259CGRzlqkCDqQqwdIVsGQR1VTOIK8ZiT4kId9VcP80l1hXFEVAa
X-Gm-Gg: AYBFou0rT3AF08L11VRkrl7vlyuDFfj4vfYcNwznAZXnDQ4vWRHr5PaS5gI86mxMIkZ
	GmB5h2p5jaYX0duzZohLBkc2C8HKlMU3sdp99we+NiGK0V81tfTtCZud5Fk6s7Pxg6NjW++NMTu
	714aHtwU0j+bjNqGACtYN+r1q0uArJtJO4adzXpagQmyOCBYYuOuhscOQYXgvV5zwZlyNpUCnlp
	KQLz0/N51cjwIH7fKlVNdF9/V6Kwh3ZL6IHrY3yMZ0R7bqLhd6VhRyBzHteKR+ChXkDmiJoELy1
	EPd1sLXvS4jVTw+Xjt4yCFfwpVYykqP+xeksvOPxVk3NQYJhKABWhmS1kqq2JSx/WpHIN52d1d+
	EzilXz/i+UHk0ZUv3KOSyuXw98I1xYnHvW8EZ8jy8QKfsMzDaQN5XyrMwIaVVskha0bYpV2StaN
	xiF6fbgSEZqvNPKpKbvWsExCJE5xcIaa/TyGPXtPKRLYKUpAfgh1Fq1b1w10ZpC4z2j443JYXLm
	4xaqiF3Kn/3s3kDU8m9K+1T3/uUtvAJ/QH1iYrKGwSeldD1nnTzdla5G3dPfQGimv8pHAPtmeZV
	Fw2EobQRT3kfBWX3lKIOHW8UMk0zFcVTVtYsCUdLOLMrsQniDubfR7viMvsZxVHfVkHRn1dif3y
	2dx1tCrd2YQYtxtJnSlr2AMo3Me8DTku3LAGOJ91jHjDzfjtb8x1GJHFhHElqoBNqq+6I2e/LZE
	ZHga8kdF+qfVYeeV7TAQRFR88OKU9H5Z3GkkqFN0aKHhhWJuw3ajOX+2C+j7mvDu5YuGWZ61c2
X-Received: by 2002:a05:6808:1304:b0:50d:26fc:e6d3 with SMTP id 5614622812f47-563efbee16emr7279840b6e.43.1793648060817;
        Mon, 02 Nov 2026 11:34:20 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fd93451sm8558249b6e.3.2026.11.02.11.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:34:20 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 02 Nov 2026 12:34:14 -0700
Subject: [PATCH v5 02/10] dmaengine: dw: serialize error recovery with
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
Message-Id: <20261102-submit-dw-dma-synchronize-v1-v5-2-d3207758fbf9@gmail.com>
References: <20261102-submit-dw-dma-synchronize-v1-v5-0-d3207758fbf9@gmail.com>
In-Reply-To: <20261102-submit-dw-dma-synchronize-v1-v5-0-d3207758fbf9@gmail.com>
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

