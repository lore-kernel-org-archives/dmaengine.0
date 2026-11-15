Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794727184;
	b=yddGAp8oz2vUeo/njOvoTh8rc58aVy7Ym3GylEEM48N1q8eDhaQW/EAXjcyqPR5mIuhZ
	 v+gC8hGl+LUNqkhXRpTaA/kSEHE6lpWLkH2/2C2dBL/it3kwE+lgAELcUWO4rI91vvD0Q
	 2ld8ZWWTHuNWkJN2Yki7DrOBfJQcfAlH9ZzVoY+zLRQemw8R6LxSd82wfaKF0VYiZcpGH
	 ixVKfEpND0J6BbKZVbJGmimi8SF4D1633ZNBDYlZrXrqLLl/SCxs5XwKmfXY5zVhWPq2j
	 ojdPDE21E0H3HGuQSm+PMowvQKIs4Kuc5407OvaGW8SgFMZ4MMQdX0x3EnISyUdQjyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794727184;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=OS2UBcR5n5u6jJuSGCUmpdlBoEKk3jjjMEO5gyi3TM8=;
	b=QlI08PODkCgyNn8F0Fceg/ujErggJ/Aujk5AZ55Va3tcoMbN+/yG9OaoKEw2XdLM/lwP
	 Au/xtizywdo/7AjxnwhJfisX5468REBfMiZN4oLg/Qt7B8UXu+tHdGEpAIIGYUHm6aLk+
	 8sOqBE0bXmdzFd96w2E87expzDbyDdC4grdrvd6EQ8TeZeCxDEdeOQuHz6OubpzNgxXcq
	 8XB/HpSS/jaqtEeN0ETZNnou7EfQXDYRf0rBy8llL2HMdRKt+YUHFu013Yek0nNF+4/Cx
	 dolSJD9GZXAisZwI54r/GE9KtZ5pVS9a9xy6AMVHifEvBeh3/SdxPZnAv9z2UA9uAew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xrz58Soe;
	arc=none smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D35606A335
	for <dmaengine@vger.kernel.org>; Sun, 15 Nov 2026 07:19:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3D35606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xrz58Soe
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6de2f213b7aso887255eaf.0
        for <dmaengine@vger.kernel.org>; Sat, 14 Nov 2026 23:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794727183; x=1795331983; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OS2UBcR5n5u6jJuSGCUmpdlBoEKk3jjjMEO5gyi3TM8=;
        b=Xrz58Soe6mVRrL1DqwdKRygaPBSGaJEq7xhHj0c++hmICPBmBOcPadHiJWj1z+iT0M
         dQGFrvd/VdkQRYlAyPbIY4o7oBeUdhO/zV/m2YqENIxD1b5vW5CYkfWySGU5CV6RU+xD
         xRYeR/oKqtiMa2ScTfRYwFB1IWvgxUk5ZDeoHeJa/uhd2AbKPS43nsDnvGHbYgWb/J1a
         uOikHHJlCJQgIECMrY5P3J8VulRZpnMAAusb6nqJW451uY73CRYWSEVaQzK0m0EqZ12U
         M5QEYPeYfeVW94CG1ougP0Ml4QedH+3iugWeKl4BYQNqIJIFyfxPfWW4uWjGURMdwCQD
         KPAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794727183; x=1795331983;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OS2UBcR5n5u6jJuSGCUmpdlBoEKk3jjjMEO5gyi3TM8=;
        b=pzqSD093/HCEMwnkYQkGndLGf9drqvG57Tdzl76aGI2+bFUMXwuxe5NqhJ7mRqUX7Y
         xIpIRGnrWqzPiYtCGIw39rot4AO40vZGAuPKCgeaccVmhSPqXQlUjZL2qzby8L+rvI3S
         fybdYaRi4F06o2Irgs08Biri4xaPCt/qxXdS8P2RPozoq5pjJnuz8eKf815eG4g0oAuM
         ZEdIv4IkoGMHpM7PXpKTO0uOmxDqOU4ugCZIyd1QoY09pRxL+vCAyy+DNuWOH7iQIWCp
         fy6npD3vGRe9sDbRX/zU2CS6EZRmfWYeMhgiHnDu8FR+cjGyg7o+n40qIReZ7qdn8Fd2
         cWPA==
X-Forwarded-Encrypted: i=1; AL+hErFUqVY2L0f695PM2ibYqfe3e4FrQ6jXLb8XIJPaviaKlOYqUtM76xSu+JoyxTgEqORAPyQ1c2Mt314=@vger.kernel.org
X-Gm-Message-State: APuU4Z8B+DF9pMynsMGaLaqbTOxPtebfoCozHHym6yNQB/uwv0jQqSlm
	Oxp1MZryNxabFjqgfuBIuEcIjA6S2OvgJK2UmJC3fW16YXxXO65UA8+1
X-Gm-Gg: AYBFou341TkNXNxDfEd5EzZNvi81kfjV2vHuZ0pZ/KoM4DMro4HRfQizHesISQLlSw1
	lFas6qcZOYRxF7AkuGcj0653/jkXHt+dwgg+pB911gUBg8embDyil8hojNQF8hRcMTjOgPCI5SD
	HXU9YAvQ3W69ulD/483Qq38HenqjT+hX9t3MKy7PzAO8ng32xxFYHET1j3K3RykNy8lKmCtShG/
	/+7rCkmmltOoQo48QByI0u2dRfh0bJ8zhcSflu4PDgdVPXEvQvLBpr2sRAiJcqOXDTM5B4x2eHl
	IBQK/ww7MpomU5M77XBk2sW37NW7Mmluz06yce6AyHE4AkQOI9rIHrLwjQAPhEu+0EbPosGqarr
	wRJWLF8m/Frd6l9JjnUcRhdOPMTT7mbwqm/0Mc1Nua3gQ6VjOahd58B9ztrlp46DDMBCdDWBFwO
	c9+gTGlgKWUx5nzdtPQvi4UqrLj153zXiJcDKhO2gglDEcqRiHvVsZ/yTHG1iFgVDpRhtbhbP/Z
	nqDq0+0pSrMNR84i+U+L27SY1rB89gK/HvlbTI4EPdIFXaHUSl9D2vxW41ipFJ8gBxQpHmYrmDW
	gkoxKTPJcHqJAli5TQrsOpk2htuyl4Tl0r4999bbCdJ4Qr5GiIuwHBt+m8H8mxxV8qGGZNv8rY+
	rawagglE3Nik0aVSmyQ4MCP8sYn3zVnxi1gvc9PJ0z5GrxVUsBE7SVgiNctMjJ+IrbiJwKD1vQi
	v8fRkVQejfg8EfTKKQO7Ei5m/WNBFshEKerRoepQ2sCozfEK4dcIQZ
X-Received: by 2002:a05:6820:2485:b0:70a:549:292e with SMTP id 006d021491bc7-71ab4f908f5mr3485508eaf.28.1794727182620;
        Sat, 14 Nov 2026 23:19:42 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ae860ebd7sm1145321eaf.8.2026.11.14.23.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:19:42 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 00:19:35 -0700
Subject: [PATCH v7 02/10] dmaengine: dw: serialize error recovery with
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
Message-Id: <20261115-submit-dw-dma-synchronize-v1-v7-2-8d58f3d49e4d@gmail.com>
References: <20261115-submit-dw-dma-synchronize-v1-v7-0-8d58f3d49e4d@gmail.com>
In-Reply-To: <20261115-submit-dw-dma-synchronize-v1-v7-0-8d58f3d49e4d@gmail.com>
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

