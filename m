Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792695175;
	b=UcmqlR8f2IqpnJ3O4W88HynD0slLf+8tZ1K2iMICGPyQ01UObU/2cO5egRRRUaUSqZAS
	 fNVfE7yjVDp2vj4T/ce7YTcr5TqIAyi3OY/e9d5AAsKwtObL0xlVu+OHH0lSsBZKPvFgw
	 MoFJa8kJKeeJ9kHRojAU+mibtXSZw10JCdnVGdjGJTSycg4y57df0Q6QfRhu5TWg/Ssho
	 OGvnhR3zdqcXI9ksHolIObOEVJCioCjYB9nUGQSVi9laYX5tuK47yTKP0PRgGbn4LwphD
	 XZ5bPz/p9itpdj6an3M1KaCr9fbIuXpJ2q9vthR9y0xuLCF+WejmCq4jrg5HuUJoSuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792695175;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=KbJm5SGXsdECTH4ZZRdz2rXhZWT5LUE28XcGXGMl8J0=;
	b=uvC8DJ0rQ409BHCUI0DNlE3iT7rqrzLAc6p4vAgzsiCAIhNJcfdPWglynjpKokPlyi2z
	 bnd1RW46tWvtLvkQwEmv/LUfpQIUGTc7WiuuAY0NzkO3bzHDTWfrqWlz8tNVpMaswQbO9
	 2wK6cjEtirmoJSywfxt+gMFAdupJjxizECZaL7OJ4lbEGa5fW41V29aPxcIZhi5Wp4Xfa
	 yv7G0g0TYEIl5ioLAZWHtc2FjVuHo16xSLEU0GD3nRxLdHElgRt4P7hG25WpF6K6qI4Ry
	 p6va8KJ/B4LE2FT0g8/EK/QjxLh87bgGTHztgeMuYAmejAfIfSEPGzrvqhf8mtVi2mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LHfk67pa;
	arc=none smtp.remote-ip=209.85.210.42
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6834060A2610
	for <dmaengine@vger.kernel.org>; Thu, 22 Oct 2026 18:52:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6834060A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LHfk67pa
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-845f3fa7f38so30476a34.3
        for <dmaengine@vger.kernel.org>; Thu, 22 Oct 2026 11:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792695173; x=1793299973; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KbJm5SGXsdECTH4ZZRdz2rXhZWT5LUE28XcGXGMl8J0=;
        b=LHfk67paldhYAuv9kaDjn79xOy88fVU3TrAO/kbwW0obhlMHE6xLXBCW5C4DA1VdB2
         Iw3znsq3xbanboqW47ChizQwQ1P+jW+7oqaxabGNJsORuLtagLQje/CiEjdwKYyACitU
         2qWZ640MRg0bZvZfhRlqiE1LD7CyusNqHWQt/SXf9Bvx2hYW074YifX4NxL/lfHHWIfw
         j0QrmROhLNGxriITCFflR1/JLkvCptktrFO8569G19CO/0Lec2O9r+jampJ1pP5YSGnn
         vFFigWaIXQmYMs4E/L7/TTU3FyklrXgYlounseFxb8HLmpOhVynKXXELqrYg3y/9HjH4
         4zKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792695173; x=1793299973;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KbJm5SGXsdECTH4ZZRdz2rXhZWT5LUE28XcGXGMl8J0=;
        b=O1/x9D2OTOY3w0zG8sSB60gW2iY9h4gCrZLakk8QoXaSW7ayKdlwzIiRUcg2FGi8/w
         OOHRAyOi3Qwz5lg4dnmGapOWfV80AbKG6L/Y+dLKmo6PRmmwH5NBqfGLIsIiZgNJC6TZ
         nH7XBTB2p2mC1+rotxJMtrIDwGCoj5ggj0Y3TxFb0Ra0ax1GeoHhSnjv6J5LdxzG1V5U
         JSZpCG3oxygvXjuCF/c6elXbNIY3LpKocnnos3KGtnznsX8J2dUPwlzEyXj9Ia3ekmEE
         9HfMQFlOaPuPuJdt/XoUdGAU581rRsu0auP1BEp+Kuu+tbTh+LtmLH7BUdzW4I6XhH5v
         DvWQ==
X-Forwarded-Encrypted: i=1; AKwUvBw9r+iJ+P0P0Qltw5Oa0R5nz69/9h9Wcw9Mf58R9Ar2hUkaS691mBcCxCE53K/GRvzR+KXlP4J6UcQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJjKMIHlesIKIEWt/vMiBC2zhnNdQwgvDFfofAbZI5tHCa9Bfw
	kVvAvL5/ZV1KwoBtBNBR2jRDotmfIKhJ+3etSOJdEkItJ9z8hZ9YfmqR
X-Gm-Gg: AYBFou2QG4RQ63iQYvv0iJUguaH8wnSMpm/yov42qItCwgK+f825fzSHr2w8PNR0xSj
	sz6EtdOP6SVuDB5FyL7tmPC3o/8haRyLIPCtq9jGnBrQWfNCGdEEgkcxT3BCGMQjJcpc4qoqg7J
	8eOsxB17cW0A4+TMqrRDGWwOl9BccsOI6KolxIyqvyU0p2OpDgQ9Pxgh5zEQBoOqfgWq6KHAWZ6
	K972IT/eyjKDOveigCsiWgoIr9Fo1aAwoXZdy+wV1GMkMNafnJLPBvYW1A7xAQFCiTRkOefLyKp
	cDPRqImRrk5tWrCdI9ubvjxesskxnx99HIhL0C3uhQ3BvMAnrJDP54BRWo8urifXiULp9tQzTtV
	OyblnHHOflcSel9Sx2T+EvgsDGS7T8l2r3R6vyg3v73pDtpwv+Zs+4wH2CaMFdtbt0spb57puEi
	BdzBqvtD1T8a82sFeo4alrvxtPjwVZsPrm7c2mBy+zrDlkMkfCwoEYyL4rmtdg8GqJIFDoKBOKm
	dyb36zyahjllzvUInBS1Hah6BlDRIz4lRsBj+68BfV8SvxqPOlvHMPsQU8dmME7r910bzXRjDJY
	X6UAUDHX3hSy6h+75P4+kXsPP2Q56PLVLdemQJUTvKthmlkPsL0N39XF8HjLfYFmZQleDk5cb9t
	EbrznrQVGrvm8JB92hWSyzy7GhKNHDCZTTCFE3ISDNoOZEJR4TPNRGH199988GWi4zqHzybqiLK
	QQKdk=
X-Received: by 2002:a05:6830:82ae:b0:804:d4b0:a36 with SMTP id 46e09a7af769-84d08f1169amr5063899a34.27.1792695173289;
        Thu, 22 Oct 2026 11:52:53 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84f7703d288sm536083a34.4.2026.10.22.11.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 11:52:52 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 22 Oct 2026 12:52:50 -0600
Subject: [PATCH v2 3/4] dmaengine: dw: serialize error recovery with
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
Message-Id: <20261022-submit-dw-dma-synchronize-v1-v2-3-5244e94dca8c@gmail.com>
References: <20261022-submit-dw-dma-synchronize-v1-v2-0-5244e94dca8c@gmail.com>
In-Reply-To: <20261022-submit-dw-dma-synchronize-v1-v2-0-5244e94dca8c@gmail.com>
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: Serge Semin <fancer.lancer@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 dmaengine@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
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
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw/core.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index fbc46cbfe259..1df028970c4a 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -395,10 +395,17 @@ static void dwc_handle_error(struct dw_dma *dw, struct dw_dma_chan *dwc)
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
@@ -406,12 +413,7 @@ static void dwc_handle_error(struct dw_dma *dw, struct dw_dma_chan *dwc)
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
@@ -430,6 +432,10 @@ static void dwc_handle_error(struct dw_dma *dw, struct dw_dma_chan *dwc)
 
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

