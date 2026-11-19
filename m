Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795082550;
	b=m0jEA7R/1GdMD5htqgVhl/SaX5GoDCNXCTRiF4mz1VCPj/6XKLG8w7mku50nxW+JgqvS
	 kMbdScq1C8/14ZGuCtD3fUv8e6cXltl2sQ6D/p2JvunWWLq+2EmFGFFBYeHVFbFBMrwE9
	 gkcjDw6zt6I1T2FLyrkF4YOzjPB0M/5D8saH9B/GNzPi9bx4pTA4+/bt+DVZ687aZDclQ
	 AARiFig1QQ1X5SDMZ0em+sIqiuyiMhX3UJ8lWgd2FdMmRVVAajDmeQbdS7+pzisPv7wzL
	 ITCcFkRQ7EFkkwtICOS5FI4S1G/oP/YlZ29qQ2yLQMFrNO7aM2Vas0e2WirBeihqksA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795082550;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=OS2UBcR5n5u6jJuSGCUmpdlBoEKk3jjjMEO5gyi3TM8=;
	b=4qq6oIiMVujK5FvYjob71RDdNGkEsVm2aEivjuJkDci4s+u4qBVCwGlfLAeOWBH67H5K
	 isw2UvmPrk3m0yEUAeMk8cmqzGvRruZsqDGN8RzKEsJNJhChhO8RPEo86Vm/0IJ4zjwan
	 Z266oNYy8IcwvM87HwuoUlVQ7fxR52XZeyXkwHfJ5TKl5iVBfjdjJDEf1w9ZX9t92Hpfm
	 d9Bo348ERfrs1erEq7g09yja2eBd96A4bW7L4VNGnf6y5VeLQbXeO+4lMjDjYEMeRlHea
	 KPAqPmsJH2iDctgy4uVeyDqt3IoJvZctkgMUj6824qLuCxyG1/Rm0Az+Oje5gDWjdsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JrK1ZFEH;
	arc=none smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46CEB606A338
	for <dmaengine@vger.kernel.org>; Thu, 19 Nov 2026 10:02:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46CEB606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JrK1ZFEH
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-70b875f6f13so1727413eaf.0
        for <dmaengine@vger.kernel.org>; Thu, 19 Nov 2026 02:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795082549; x=1795687349; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OS2UBcR5n5u6jJuSGCUmpdlBoEKk3jjjMEO5gyi3TM8=;
        b=JrK1ZFEHOpFtaoo/a2oCwxsveMnQt5RFF5F9ruEezsTy1vL94EGMT4gp2WTbCQkR/q
         bKFzZCJeSHz7grx17qtAZEgaRZQ2Du6VYubvaxZoj6mtrVtaoS8L+KG/MQ0qLiehpdYA
         fyQHRJsYuC0NbxloGvrh6j+/3Xb6JDJ+89TnfIp1Hbq6Snbnkge6NF4X0PoVmjJBejK0
         W3JRaGdCKuc9eMMyRfiecjkjQlTY7GJN4mMLxmi70wiie+Y+fEWs8StYwDFH/V7I/VIu
         hbKKJFPL+J1Jm9hxeQ3MMEpL6mdV9yPFvheTLDNKAW4tZi1r+/GfKOJkWjFLL44Wu42z
         UrGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795082549; x=1795687349;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OS2UBcR5n5u6jJuSGCUmpdlBoEKk3jjjMEO5gyi3TM8=;
        b=SkKNuP1VduNTrlxi26Y9153NaP6HbPvU65VaHsO9oR6a4POFSIUv6UUbcZON7cnrV8
         l5XAd+Z0Sy92jTsMSh4PbNqk/pvcOC6jqi9279fIbkOUbN//NypwE/ZJUanYo9jSmGeg
         RuOZ/rwTfbY1vvubG5gqf0Su+HUqCiO+Lzdl0OuoJRjCWznUooHoc3/n1GCn0cO4LGLf
         9Ixe4KoaCRDeMzzw54sxhRcFJmFfdma7JWBp3CBcW+uGhYi9/+RFyMTwcs/Grlw97A3x
         mEUdd6Wal7MjmxcC7ViD0dxgu/rIr961p1szFe6nD9ucOSeOPHHD7GeKwLWR6cmrL1XF
         IwOg==
X-Forwarded-Encrypted: i=1; AL+hErHqKDs6ux6A0nmJiTE3hV9LdOfoY8Lw/yhjKeRRQlOWezAK/CsiO3WK+y5IIHIpx1ANHSwNv0Pvnz8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ECQU9d4CWgEVdmxMi5mwQboaoislUim/pU9SJ9T9FRK37lMZK
	EK12oNtNJdHvb0GNqBej0XXWxmU89n5xzhEoxUo887erwP1ZP/0QrJ/R
X-Gm-Gg: AYBFou1B178Ob/F3+54tqEkI9KUSE4eZB5Hj97hpX7KMxPr3leHh+IuuWpGcxEWR6wS
	Ya9zZ3d6MLHJ0GW1F+LG7cT2/3T/mtNnCZMvHbN3tW8UaYTURgqVqubWPjctkmiSjvVNMxJsqUL
	gKpA5649WN2RtkUk1j0BdNPi2NJmIhMjL/1gr3ZVT/mdudm35Ukwaed+1ZtLOWylxkzo9cTRgx6
	zNRG5snyrjb1WttfxXLpl6UV6e0xIByby6NQ5zYA6OoOvnC/wfAItHIEga08e0NIs3wUkQrXEP4
	Ijx2bzmtJxMb4Z/lDSXrsU1j2XUf44VigvkrXNxkgKeSHhbdXz4wGx/QhH1eviv/ZT9TYhF8UN+
	AHQPwCRyboWjzYlPsTw3yi5Eu4kEswRtTHP6BVLHBJnDj6592XbKib15pkwxfpOm6fC9pSNTDIK
	RWPfht8TvCmBjs+VzwmB3UyHezG9Oa9ugvxJyJLVPYG/ZTNIhSqksVUih1GZR1DFk52MngqaWpy
	Uu5ANxbpQMi6zCCaGLgu1ke9ePeugQnJ+EXkE4IT6pyDk0/KTo8FuPpXyjo/JXCu6mYPL+NTo2n
	c5/yTbVGLOvh8IPODKXb6Rkf0rpOVxsJ/ZWko7/F/DuML2nxx/zVfq3hP5y2YZcu/WL9v80Teos
	hMoUvD1GpdAmrr/6ts9FZVjj5jQCvUzpc4OPXLu0Gz4HQ5KM3/G/zDv//BS3C3RgHYcls/6ajdf
	4IC/T/W3R1aUoNreJgePkLcar4rf+GfrnhySNW1XLwDSKlsJlB6+Cm
X-Received: by 2002:a05:6820:1388:b0:6fb:b922:8d30 with SMTP id 006d021491bc7-71b182af0b8mr4808799eaf.2.1795082549183;
        Thu, 19 Nov 2026 02:02:29 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b18fbb9a8sm3906194eaf.0.2026.11.19.02.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 02:02:28 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 03:01:36 -0700
Subject: [PATCH v10 2/7] dmaengine: dw: serialize error recovery with
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
Message-Id: <20261119-submit-dw-dma-synchronize-v1-v10-2-3a737597a0d1@gmail.com>
References: <20261119-submit-dw-dma-synchronize-v1-v10-0-3a737597a0d1@gmail.com>
In-Reply-To: <20261119-submit-dw-dma-synchronize-v1-v10-0-3a737597a0d1@gmail.com>
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

