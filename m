Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795295108;
	b=x9uNhwGU/YJJAl5+xNNl7QptWfP5iKfGMqxc0lRY7ax2EK36XQWFBfNYbIyCGtCavXdD
	 jkJZ2w7k7IpDoy1B5heJ2HkEJG/yBoRMiAnQE5fmhqEb2/IjKV/rSbAiSCTUStWCmX6rg
	 /XHFiBJc52VrzrZ2KthzXJFO66eLr0xMCCnjsxlpV9VT4OWlSzpB+z3WGDZ70p5c9aaYc
	 Dtt9/yH1Ae9PLNniWPOkHrZ+5stoEKYAIRe8M3YA5wNmQFxask3JQUtJ1C478kDQCSE0O
	 neAp/GLf93IF9GUSKTDUX8pLc9osYe0w+Ij1WKTp9XS06YWAtrueCZRSqDfKC19WP4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795295108;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=OS2UBcR5n5u6jJuSGCUmpdlBoEKk3jjjMEO5gyi3TM8=;
	b=pR1aOpE2QLWle8hzCf8ALThOlvMX2nlQUS4NZXv/Gvr15ibbZ8XN6PlBbjxC56fetyTx
	 3ua/u4hyC4sghHgz/PCZD6g1qLWs3+Gx+UeUu2c1fH5LztniRVybwbG3FBMxHX+sTvbaR
	 tYByt9OWE0LBsAfdymZPl+mNMYOHB+i8WMjkoiUx1wR39JIG39YzpPOU05Xlkg3tkQQTP
	 nLKYyzyUrFE/Pg2bucOo5tzQQC2kB6HCZ0JkgxXx6ZWhkGRq/UZD47EE/Xhhst4V2K+k1
	 26JWaDKk8osNSppzgGdKEOS3bf2W5v74ExZ5OPdw/teWNb6b04DztsrcWhhp7ht3vTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ScglfkVr;
	arc=none smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F64606A33D
	for <dmaengine@vger.kernel.org>; Sat, 21 Nov 2026 21:05:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2F64606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ScglfkVr
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6ddef424972so1719325eaf.3
        for <dmaengine@vger.kernel.org>; Sat, 21 Nov 2026 13:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795295107; x=1795899907; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OS2UBcR5n5u6jJuSGCUmpdlBoEKk3jjjMEO5gyi3TM8=;
        b=ScglfkVrQoDBqFhOeralbC4w/qT4T6PObOz6mK+IdCelxDotSwRIhwn2xFhIq58UCw
         9Ws9TLsKxgZ+df5vHvYjs7AfVWtkqkmO4z5IYuDMwTB53bvSWCWrm80PVAD8qVLFE1bi
         51aAiOrtNxJrb//NaKrtnDcPW2DSoWag4FYoSMSILeZxKZvwxDKAlpKCqWzFhPtciMvl
         2um69p/pZRns+nP59bF0WvIurw3GI1OdbFyPBnYiXd1Vc2FifLWKuactqr5GgX83VGxv
         iMDbEynITUiVK78dkIMLSTi864Jh9Lbw6F1+P+vkJ7DAZWwCM1maohG/hTKi9roYkkRC
         N77A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795295107; x=1795899907;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OS2UBcR5n5u6jJuSGCUmpdlBoEKk3jjjMEO5gyi3TM8=;
        b=EwLTJf+nQN7Fe/vEQc1esa890z7wWnU4cUXTE1Yrs0BY3XWAmYjNfh494+6vr+XW8o
         iIC8Ybi+8CL+i3WFCTBujFyGr23NXQ6Ld3I46VJD3twfHlNjTRS/8hzqftefndH+evJG
         J80O3NwpQSMpOO5bwBK0VLO4I9NUTg6BKEE9PkXsUJ1csFylNeRZsXtc5evXwQizcMxs
         bnkZy3La1qaf4MEP1oGhYA4r+HM54pRanFTYFDGUiqYibvyyrYpaMjvQ+c0YFxEETliZ
         CgvoJYTkL35HLPomJ5nFiAFLHyqS+12QE9Bkjwn6tCSgBQMsIZUwdBlnE/ggorNOdvqL
         tQzA==
X-Forwarded-Encrypted: i=1; AL+hErHIopBscCKEGhGOh0Wfwi2I5wA4u2lxkPI59Y5bM/7PiPQZ7hOtoZ7QP0h9Um1haYCzLl3RAGWzOEI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8EhbChM1UrrQVOYO1z6cMSScN51nCurcWAQVlER54A95QbMQBd
	ZelronzL/7Yd4Fl0KVW2HyCm/RkYI+zIqGMRy2xRealP3dcxQk7yrGGj
X-Gm-Gg: AZFdTZenz7SzxQLFP2qxi9ZGRjKS8MQbyfI1HrGLvMN4B4q7RJ5zMzr9jLZPV4JW/vv
	CFw7yzl9wr9C4wnYFRNdczPqYS6GgtVaGkMptuN0RsQ/hS0fvEiQCnChGat8cNH2CZ3O6Xz21ey
	i7ejg3p2RlSLfhihPjPSGW0G2p1iYqNolFwxgmqtNdiWBP0YoN7W/b4eRsz/YKgTvatZYuXecgx
	azCLEGRxaCS86gsErdxi94+tFNrZ9K5dgDSP7VvrhqDc7/fbcdJ3OAf1ogiLWXjiRS/d9V/aHbp
	rKtqZ7ReKJ1axf/DGD9poBaf5MFHmaEUsozalMOd+GqDfJFYmFMDtpMicYfkFR4x1IbK70+rchr
	DE70yYSsDvFAaZF2MfWJ3IG+bwHP3jXburl75L7SExX3nf0y1DbowfnYUePHQFMimspfTCTVqmD
	i/LkRcmYppw7FvZuDB4LKjAaMXFp8Li+SutaB8/XVd1Ba1MHZRS3fD6oLsFwuhLjE2SBP2TGvYp
	hWqdpajyX7g51Yy1I6ZBCeUf6Ani8e9zxsHnyQMusg4tcgSOUUUe96Br5H8SVZcAIw93Xry3I7H
	Ca3FA9yKF3gdjmOkEDXYP1iXyvdwyYxqAXxBrDs19GSWIiVlisshBBdul0jCTvFjMkMQb0drqGr
	ikm7z9n0xrBktp+dqz53Li4U0HzN9zbNywhLP8Bu+6uoJ3cw1iQiy7SEh1X7ofCCgrbC9XNRdNN
	SHZbLBEUUbk/K5XRXGYOvTtGDF2a3vwTUdlv99qWLie5g4BLvMyEu/
X-Received: by 2002:a05:6820:5081:b0:71a:e645:ddc3 with SMTP id 006d021491bc7-71b39483a3bmr4673731eaf.34.1795295106782;
        Sat, 21 Nov 2026 13:05:06 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380e4a6dsm4635728eaf.13.2026.11.21.13.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:05:06 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 21 Nov 2026 14:03:17 -0700
Subject: [PATCH v12 2/7] dmaengine: dw: serialize error recovery with
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
Message-Id: <20261121-submit-dw-dma-synchronize-v1-v12-2-f51eb635209d@gmail.com>
References: <20261121-submit-dw-dma-synchronize-v1-v12-0-f51eb635209d@gmail.com>
In-Reply-To: <20261121-submit-dw-dma-synchronize-v1-v12-0-f51eb635209d@gmail.com>
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

