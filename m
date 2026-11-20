Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202961;
	b=0QCyyq53ZdUbw0EBovyrt3vDArhVP+zr77dj+cIXFNvjMbhxyhvEvuTWKh49+Eq1GTPL
	 oVFHPG6qlsfljlVf9zsMoESSIfvZ9Vl/3r5fl0Zw82OFxMo/4U/CVC/7SN9Vrb9PVdyLM
	 17Mfmwz9u1b6zx0dz0C3NiRwd9MAt+gzaa2BDXvv5gy/O0OmND/rMUyzTEOG+KzctoeQp
	 HjfWCxwoWDSkkicwRp3BxYejqv5/Icn7bOvmS/JI/FTWrllFJuGj1sz72XPWzL3qEr7ah
	 c42eMNc4WVPFWZ1gagknZJUPlcX9EQFK0GYog4lDT3djQ3gjvzheKT5jLWTujHJXNig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202961;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=OS2UBcR5n5u6jJuSGCUmpdlBoEKk3jjjMEO5gyi3TM8=;
	b=eXyqXOL3A/59ndb2V9yvTFd24DBR5hPxWTtG+Fvh9h3aGTN+Rem2aqC7gKz8IKMHdulU
	 ps45xKlGSkeGo/n9wTMZs8+GyrrJpW/0xwvxR2acbeSaYAtc3eHcJoE4LO3ERBR6ZQF74
	 CnOuWERNkOeIWa1urXWZdNs30pBisprBWc+OGsY1nfWi0caJinkBjSW81wWtvpRXmqlY0
	 XQRWSvs7fG8Gf8Rna0eDiYPwiFN5Mhbr1WI6/ZlR1tlTKGyfKRHCFvRcVh4IzniaFqABN
	 V5zZSZ+exmATUnTSDt6iDvBryUMnLXHzpa325qErp+2ISUrYthe+5wYi/EuEjgwhtnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GEOB0blT;
	arc=none smtp.remote-ip=209.85.167.177
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED038606A335
	for <dmaengine@vger.kernel.org>; Fri, 20 Nov 2026 19:29:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED038606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GEOB0blT
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-56431524c22so594823b6e.0
        for <dmaengine@vger.kernel.org>; Fri, 20 Nov 2026 11:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795202960; x=1795807760; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OS2UBcR5n5u6jJuSGCUmpdlBoEKk3jjjMEO5gyi3TM8=;
        b=GEOB0blTq1pdOAK1AAs4SvedVsy9ZgE9IV6E9LjdV6BFVFLwS256U0naIqpqYOFlEP
         i2k1T+PSD/ANlTcK6J8nw2UgAXL5pdrvabNAvOltMG6QQXMcudk0c08rY3nnfWiVKt/7
         12rFq/m1fcZMf6G9Y4lq4gBWQYgOMXGJAQaPaVZ7qfooKNaXVgS8f9SpmbVION3h0+MX
         qLG+G3MiX/mpSBs9TFKssUrhJGTWy/VMGidxkUyha0B7wm7VBR6adtVJT6cpT0q9/Wo+
         2xxoBaebcN68gy1ia2rZCqTqMHICDWNiZxCEYnJhOOZw9nKJoSxqBActdTpxH9Z9YdcL
         qTxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202960; x=1795807760;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OS2UBcR5n5u6jJuSGCUmpdlBoEKk3jjjMEO5gyi3TM8=;
        b=JaKVXkwEr1XQVmjVthhw+QzPgnHCZL6H7IKW1MPmg6BvWgocPyPx0abiyxelXHsTuF
         jGfZQ56mvWPyMAKe2gmaalxKaAJ0PUAuJg7wrKNXWLm7qex1z2lFt9S5+ERxmenjnn3c
         GzZLRHaSkmoxluh3VW/xX379zJ2X9mVXV5RRTogAOJybryFkstRqo9lORXLOHgxA/wmv
         y0/iF4aqGkph9b5Vj6kn+0Kqun8Yb+nYR1vhmasbdFy3QPmz2gNn1Z2wY08FJMx/zmjd
         YMZBwD06jJgrjuRableRv4G/sj8seTRxB+bOxo/FQRqrpkait1pea5rsD6EatfCu2JaB
         yzFw==
X-Forwarded-Encrypted: i=1; AL+hErEDcetAjGCPly5Yr0bn0kXBzw9XdzKI46g47pEPHAX46sObhcQ7VjG8L/a8FzqMbh84ezI2EqfzM64=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WTkrYSeXUunuwi1kBxaHYWVmYyDCTGlKlcRHxz5NhEgYz70Io
	LgrIDsXLi/wZoZA2l+IwnMsYSuKdONVSxbzhb4op91Lie47hiJ19wdrg
X-Gm-Gg: AYBFou2cxZ9NegUBWDMUruVaNGhn/os/R/6GBoCR6bTzyCHHjxPh4T2NiQsTp6vecXT
	rKRtfHjZQ6OuhhwKmLWVkjjHkhfBj2Kl/9U4pEKVAeBqQiqDpunv3ZJe8TAp7CjBm5EnWnIdYe+
	hBF8s3Fjn6Wxvwj+kQUVQ+ohh9S4QE8drTKK5ISp1qQ2VoGqpG9LtucPt1E8cL0Mlb9VGIx2gOj
	TyMAB9GxdI0jo4XfWIC2YG3GuFS3nRvBOOp+6lbitjD7/G+/S+FswS7rtnxHUv6jMg7ScRwAOtP
	oovgNPupzWI/Nftm3n4zN9AZSqbBSQiUC3AOLCI5Pkp0QyaaHq1yiv2eM6vdcX8NhvD8pU0hRG0
	Np967QsEEANGh/fu3uDrGWGViV/DtvIB7q62WS6KuRvEeI5bcwyPceJCwZ73cDjp9iEsOW2WuP8
	gHhC3PqfCdx+j8sZo8FwfUuow2oup0P5uVz5G1CRU5lxyHApEm7cx+YeDNqSlQcczM5oSrO/liZ
	JOKtUr3RSUVdObsy8HPkBKgUkMiEJWNSz6MOzGKAh6k8rPZL8ozw60yMgKGnM3ri1enCx072by2
	FNechO9BDMtxyzt3P3+ZymYoZ3+Otadwlz799luNXg8pVRlwGlkmgVU6e7GdDPYul+Us2NCOdXP
	8fpBPt3iEM631UkMRBwrOgr41oNcIpvDQ1ApOQ731xDjAV2p+gFit+b4EUjL2sbf7D1wvsl+U/2
	I58tiTh6QZjemaYH+9tiPl5GaDE1K9RFfcNQCCP72dq3LdhvVtkL3P20p4la8cMqB02IorxWrPb
	Q==
X-Received: by 2002:a05:6808:301e:b0:4ec:d580:2440 with SMTP id 5614622812f47-57a0bb73636mr4665554b6e.54.1795202959832;
        Fri, 20 Nov 2026 11:29:19 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc5f7ae7dcsm3434498fac.8.2026.11.20.11.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:29:19 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 12:29:08 -0700
Subject: [PATCH v11 2/7] dmaengine: dw: serialize error recovery with
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
Message-Id: <20261120-submit-dw-dma-synchronize-v1-v11-2-9b9166bc2cc7@gmail.com>
References: <20261120-submit-dw-dma-synchronize-v1-v11-0-9b9166bc2cc7@gmail.com>
In-Reply-To: <20261120-submit-dw-dma-synchronize-v1-v11-0-9b9166bc2cc7@gmail.com>
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

