Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794826388;
	b=ZzW/Az+mVrxR8amvfX97z9RecwOk/So3OugZmwQZ45Bow/NTLcnmWTQXM/nKsWFRBdQK
	 uvYmXNVX8PJiLjLqkyc8XRpOKnv/6oSXN+POZLqnoN5o+LkhC7xBEJS3B5CoT4NieDW7h
	 OJkKHFMTk5hIByJL287di1rJBOsRd7N00lIfV8Kwj7ei1NffXYsXZrRIdOZAk6A415Qbw
	 32bYmcOV8sGqdiQamrksKE+maDjXYXXhg42eII1trEnX6zLJ9S+h+KWpR6wKVxeCCDQe3
	 xgk5zdEUn30FP+9zzoODtPKZlAc2otbXesSyvwTt3eefa4F/f9huXOdakxI2yTwW6Bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794826388;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=OS2UBcR5n5u6jJuSGCUmpdlBoEKk3jjjMEO5gyi3TM8=;
	b=eeE9MBw9o1in5lWlxHMdD/LP+DLBQrN1u9dJRukyte2RrTy/J2PPV0uxpblT7R/GEZPd
	 awHnEsvqrfmXMO+c56I0l8GJkFAmyRL4v0A7ltvZ64leRa4PP1YtyvLMbLBEK76ZBbg3T
	 3JdFC3JCfFPlqRMHM52OyxcRHFLfWXNEf7MXPpOGXlN4lEguPqxFBX/n+gE8/Cayu0J4Q
	 pZnwR2Brn4S/rsf1OE85AKJI+dkfjPKC99xbOSBnZKHYqaV+uwD/WxIKWHVZkbQ9BFdFE
	 BUgbyM9MYtV//HRpFuVr5rkVTWgvnO7+nbxhQYopJZMFRHXFE7b0KnYRAI7APyGHCvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=StV2Mi3B;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23BB606A898
	for <dmaengine@vger.kernel.org>; Mon, 16 Nov 2026 10:53:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D23BB606A898
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=StV2Mi3B
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-8629fc8ad64so1222469a34.1
        for <dmaengine@vger.kernel.org>; Mon, 16 Nov 2026 02:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794826387; x=1795431187; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OS2UBcR5n5u6jJuSGCUmpdlBoEKk3jjjMEO5gyi3TM8=;
        b=StV2Mi3BI97CD0DPv/Jo8/0Zf3Qt9SNZixrrMcNNMtQHTv85C6dS710kuy6nW58Dpb
         PMD01OWRfDniSo+2G2knh6ZhxItF1KIDIRicLw0g91YdKTo6a9J514ZyDlaIX1SIiXor
         d44nZEjivsOeqmy0tmru7fJReZwx75gFdhFp13FaWDTsxuhtR2QupOkwG53SsRjSrqXL
         B3jLTeh9YqOQvcqVY40LYlJ0wiBodCbxoSSn6YEg3Otn1/EoswRXHP7D2GV7IIiSt9Oq
         Pjw8XGLOPTTdprU9xGSDixXfIDoiNngpHV/2e2IpesNd7CtTRAJG0wh4If6cNjFksgaD
         D4wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794826387; x=1795431187;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OS2UBcR5n5u6jJuSGCUmpdlBoEKk3jjjMEO5gyi3TM8=;
        b=t71Kf2OTDz9RC/HyVVarFUpvcrH+HlD+GwPAPfvNuuwCAysfWHLOHw5/wCnEb8jMY0
         ppgGIMxXbs71XtzmAxVzRuh7aopEigdgbQ73GnYJR2ep7Qz9hIvE0wa0meT9R8nuKuds
         mNGY+wzCT0k6fhjtxsn5cHBiDbJ2RtMEQWo+uoptqRuJ+tkcbBJsYbxhFvazVmb/VpEM
         SRNEyLdzmAXIU+4quaWMv8lIAa0GA7X6w4pfkD3ADWbvEQKoDMLF4HEBhjv1bK8amGGg
         LT4PHgFDtprfZGJhDtuL9++Z5hS39TdNkLTK/WCsfm71nnc0teb7I+8EMNowW3EwBTF7
         C3PQ==
X-Forwarded-Encrypted: i=1; AL+hErHNSiRZonaTPWtp7YgOV8OPmU8oa70a03EQz/5mNN7pQec3LY15OsyTa6Z3hYnSGLyWYwweuEN+dm8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xk1BJXgyJflBWK+yrbvZij9h33vejz5vaiLfPDKPcl+kQjEeN
	4dwpcBNB2Bp66uNo3ENgwohHIG/P+GCRLSFKuEg0o93KzpP2a4tL4ZQW
X-Gm-Gg: AYBFou0K+0HtTs21tOIXtP7g0NX66HY7FewEDp8mxVWHYfkk6BnJkSXYTGYysY7Aj/Y
	z5YpCVlgUq1fA142QkQeTVGjRJRaniDCswCKUvZYxgRw6oMfCxtcTVaJ3t5tCFLzSBXq0yCVblA
	fnKGAcdEN4g+M6kqe8IoLB21sYp7E7asJWMu/ZA6dfQ9MeTtf+jlBRLHwUOfc5J8zCM96boHBED
	v8bkrRhFgOQCgADDXBGpGR65QPKUT7dsk5IOsh4CfipwhA2OR7PH7j542rYOYCzWimbNeMB7vth
	gpHFjbY51AzQnyCgCmRYYTxkJUC3qQncsF9ushvXonUt4+DZarK6G+kqzzK33hkUlWBNOl9J12M
	TQZ/3sUazf3qgNCRk7EVHJw0c/6R/esXLjRnRnITZuWIULsCH1/c4WDL+5jVfeLLH9R625iasXw
	iT8IlSB+svaoMTaQXl9tD0bumkUYr/zjkcJtkxxgKbYlR110UWNuj0yvarlN2ltmaUFjySEf3mh
	ApkjD8prE26tzILi4cZa/Ms3ev/HRdgukEy851ndYaZ7n5Zt59E6BdKelHCqZjNkogoUPl6ChW1
	3Av2lygsXTXhsd7QyP8Zr2mI6GeUhZAWZaAs0oBgyCFfItjfgmhQcYU9Gjrtzm/VSy+ZIdw3O0b
	s7aM+fvioeWlaQkCcYFMqduhTbeCj+QUM9gW+3mQj9mfrMd/qypgtSCPBz5QbdiLZL2crEtWIKy
	OczzQj8jIQMiGNggE+h4SIGiPE3qJ6vNTg9n7VkUuDoritnWPoIFgFP+c9NoPRAHZXIBVOjln3
X-Received: by 2002:a05:6830:4492:b0:81e:b506:592d with SMTP id 46e09a7af769-862898ade72mr8685264a34.27.1794826386804;
        Mon, 16 Nov 2026 02:53:06 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862b08b8b5bsm5555546a34.5.2026.11.16.02.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 02:53:06 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 16 Nov 2026 03:52:30 -0700
Subject: [PATCH v8 2/6] dmaengine: dw: serialize error recovery with
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
Message-Id: <20261116-submit-dw-dma-synchronize-v1-v8-2-4a82d64fcd1a@gmail.com>
References: <20261116-submit-dw-dma-synchronize-v1-v8-0-4a82d64fcd1a@gmail.com>
In-Reply-To: <20261116-submit-dw-dma-synchronize-v1-v8-0-4a82d64fcd1a@gmail.com>
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
X-Mailer: b4 0.17-dev

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

