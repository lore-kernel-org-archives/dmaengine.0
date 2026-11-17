Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794955743;
	b=jW6t8Kz5KwUTHzoMSJgbw0qtoKn5cmOJI8DEHFab44ru67wf7KUtQ1bxhfdiSzHynUMC
	 Sxaz9nQ2H5UE3pc8dzw/IT9ttxt51oAgBLroN04NuqAN+/5PfbM5EDrMIkdKcJCX8h6Ob
	 EbMIRdwK1iNf+Xs2bA07hMPsfAC9w/elXBXHKGx6wnm7HtUDAVHzPkkd0fToqeUirv4aj
	 U1Raou9nnGHu4cJ2//msYgbTbCXHe+eU6/tXQ6NuAz7SqOyqcrTb89n7WdvRALVsAABcz
	 3xWfNXWGjx8WNtQsdRFXgYFi5tDzHojN7wF2q7u2IVeyilCk6nZySxodCR9XBKgGHvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794955743;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=OS2UBcR5n5u6jJuSGCUmpdlBoEKk3jjjMEO5gyi3TM8=;
	b=3NW+hlNqyggZMlkI3CPoUxjdkttY4CJo1SNL+x7qmc0nzDV7nLdf9HHS6unos30sb2zn
	 g0O5LL+KMy8FRlRiCCxPbcuSEXv4Hcw7zP3LiE8UwohLvBFYJVMpXDk1zmsHwzmKCYvRZ
	 0G48xhkhKxexHVTIYFM+I5wArZHLTE1brTiv9ZX5fs95+kMGy8vvhZFW7APnwZmFsmbzI
	 8Btoaon80zcvAwDcZ8RJLOObhEiXW0crGBiBzCl36MGlWATV/zmvbu8Y4AFF6iopqO+NQ
	 xihyg1i+MtKnVgixGXy8dFRtcYkQ9FR5ZQSw130/Ja1nzgQX/aQujyMtAdf5ZIdwvmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hqs5FAtb;
	arc=none smtp.remote-ip=209.85.167.175
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91849606A8A2
	for <dmaengine@vger.kernel.org>; Tue, 17 Nov 2026 22:49:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91849606A8A2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hqs5FAtb
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-57728d87699so104415b6e.2
        for <dmaengine@vger.kernel.org>; Tue, 17 Nov 2026 14:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794955742; x=1795560542; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OS2UBcR5n5u6jJuSGCUmpdlBoEKk3jjjMEO5gyi3TM8=;
        b=hqs5FAtb/l2lFZVbNANYpUobM0kxuJ4ncJAfURemCBqRlXF469IVUDfOOPy+rQ297p
         XlnXZ5DDxt/8PERRhtvJLa+Zue5BebERINoyUEkReDe5nfkwNyp49NtXluCSdh7/I5To
         h8FFH/rPNuhPVlJwJyI3wHenK6msmV4Xc3ONfyB4AI6jOA4EG4RTnQi5r4XXjW+6UrMz
         tfZ7/s2nYG8y9qzMb0Kyg5KphJGMPKq4knV+ghbi6geUXfsaoFrPz8hFeiSSYfJjX6cY
         5SnCO3SyIG44N99/GjMx5qu4oq/PCq2qpCaDFGla0K9tInS+N8DCf70jgIPuRgkf1HzW
         wggA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794955742; x=1795560542;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OS2UBcR5n5u6jJuSGCUmpdlBoEKk3jjjMEO5gyi3TM8=;
        b=r+LPYq9WUrMxBMLDqE+6VMf5+xdzSnLZ3f1eAoJauS2ko5SzNKW7eD89tejmXDJVQP
         bh+ck+oLTVaEY1Fb1KhPKwFjDbcnbwoz4wnejFexXNwbcGMnohASg3hmfBc4utVYp9Oo
         hJqnLzd9kAnbcjGkqrY3fqPpR59o2QxFqKQTbj9Jwgq/nQ37VYtRQ6Ql5TDnpfLwnuEa
         dyGlJiaanCMlroUQb8Gp5QjsgKvP468kw0gy47C0CjRaAdwOdZPHOsowpGoYsZWVTaSL
         G0Q55jmNhE70G+I4EiafQhAJBZJGf39bxVH+6Fo8EtFyRfAb2/7oW/rYr8FKFqQJkILi
         eLwg==
X-Forwarded-Encrypted: i=1; AL+hErGvUTQtU4ctfiletfNqvvsoyEVG9uqwzX1j/fEFNIROp+aRhWTct8zxWHcAbiosEoOkCFyAvibA7kA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Ca77J26Acpg8oLkZTHO8dkOEYtSuIP8vDEA8zaVLwktCAcdBJ
	iAKpQXwIjtx8Gbw8M/gCJ4uNsXiwvhMpYwMObM/tsZVBwGN0SEzYDexk
X-Gm-Gg: AYBFou3XP3Ia22x35lo84xwllovXCdTnJvD2hztpf72OHHBFMeZ62oRxI5UTtLLjXXO
	7BR7DBLdL8ch/VE1Oi0KkoG8W/BOtlVP6frjO0qYpZAlmqL9x14f0e335xWRWqzOzO20KxrPywi
	3ZBQnSZBVFL+cOZh/Ku3tdL3vwnqCsNnRe8vNm24idH6S3ewwPLAhCxewkwRWeQpoeCuatMbLlU
	t1CKauRhF7yd1oWuPELu8hs57x9szz/Cm6P+FwoiOdBvFvdol6CCQBD3xlsav5q/rNy93GJKt63
	NZMFIy1BCrT9nboOf3Ad9dRgGcQaRHxVo/owp6ZNxPyoo8wsIo1Z3FupT+/vwl/umDHJa0a2zF/
	KtpQ3GEB5IqqBeGEa2etW5+Etz9Kv5Zc3k8Bz0gKfyoGTou6c16f9fOuT+YuHOoE3qaibclECyd
	ozWjcBAGNO6xE7qDu5EgoNCyHo/QoVzG6BfQaQ1yT36jfEAH6lq77veggQNkXy5hqCijbSdqeS2
	rT7FR6BHyXJH6y6xoOwI4qRRMKKd2bprIQJPJRSzZmltn3dt8ga9lCIpDAu8kdXGGP84AFeq7eY
	M5VqVo8GHOR8hUJyhXL5FNrV4AGZeWHZo6nNq3U2TTaMumWaUU/zDQ7R4USXQ2/hJZjzOwTIEIu
	RXODP8SDwyha2a5sFxxMt5i76LKxfrRmRkSVgKzWuhT12lQ/4iaqYccoohIrdedYVE1MyTrwPO7
	9smIXxvQlSxnIdqJ68LMA5USSapEmUZe8Jt+yIhqhzc1ljJmGBysJOn/hbwfJWnj5rf7gjMf128
	Q==
X-Received: by 2002:a05:6808:3086:b0:4c3:d087:4446 with SMTP id 5614622812f47-5773d02801fmr1580025b6e.42.1794955742318;
        Tue, 17 Nov 2026 14:49:02 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4b74560af5fsm583066fac.16.2026.11.17.14.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 14:49:01 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 17 Nov 2026 15:48:37 -0700
Subject: [PATCH v9 2/6] dmaengine: dw: serialize error recovery with
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
Message-Id: <20261117-submit-dw-dma-synchronize-v1-v9-2-7dc066ed0bcf@gmail.com>
References: <20261117-submit-dw-dma-synchronize-v1-v9-0-7dc066ed0bcf@gmail.com>
In-Reply-To: <20261117-submit-dw-dma-synchronize-v1-v9-0-7dc066ed0bcf@gmail.com>
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

