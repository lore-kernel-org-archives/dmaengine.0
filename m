Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793312997;
	b=ohI8KKl+KQdk9/4PBEzGEXOzbqmPxj77hEvFMK2jqh4T+HqIndIUH/d8dm9Udesb1EKe
	 pDLCpFSo31N6fHwGGYlMEIWO5lrCsK/1pP6g9Lv+8IECg/IlNbtJcS9GW2ALbFmi9sfYh
	 0hz12ukYQIjq5DKXqLmwaiQTa2+KMJgTri15I+9hvuAYROOH9UBVZZnpn9XQkdtnnvCzG
	 pr4UUuEh/JoegLN8qfu3fkgQ0WRSfDb73om6Qrk6xvG+69Gw8DT9wyN3erNO38CXMyRX3
	 T7M+FXHSKjiAzoNjeLsH1Hc1nuqcycaLE1eq0shfm+ENVBp4zQOVYBnY2gWXYBztpDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793312997;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=yCAhvvfFaIXRbwj4Slp/VrdUH7ygbm1KTvnKrDnSH20=;
	b=Sb/lupz25gXL4hCwblsgZEDXEaniD1sIH7EnyTGGX/i1YKHlO2FCQoUzY2B0xzxnEwwQ
	 qCJ7bSkvnDoieQ8EkZXMpWG20r1tEzTKStBujBfOQ4je7G6FS6DH6A3sNvC9C/my1y7qw
	 Kcgg82yUdxxBYlmsGaOGFIF4YLNMBkxnWmOzka7UjifnL9eOwFDDRSZr1tTuAxnwMiwx6
	 vZvMJSJM8UwtueRB5CXyioCRx9jQnNs9QWluuWpaUCFcY2TbXSAPZbRhvfZc3WW8yPArF
	 cXr2sYJ0ilBZtlYhO3qhCd7CbVh/f1nAdzZcoosVTQSjoDlKsT1QCll656M6fKzrB8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OxM1ucKg;
	arc=none smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1B260A2634
	for <dmaengine@vger.kernel.org>; Thu, 29 Oct 2026 22:29:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D1B260A2634
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OxM1ucKg
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-843b6f8e2c7so212099a34.1
        for <dmaengine@vger.kernel.org>; Thu, 29 Oct 2026 15:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793312991; x=1793917791; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yCAhvvfFaIXRbwj4Slp/VrdUH7ygbm1KTvnKrDnSH20=;
        b=OxM1ucKgDXPG7sbLLGQmeUDyCJPtiza8J60dj2KfoAsXC3e3up735bPPc1uDnxeyVD
         vnK0PXPZ23856N0bPn0moU8dFPy7NvnEWibSy5TDuHuKxK1dPvDU8yHZcrnEj8E6gr9w
         t4NfyO9fsJO87rUfwicAk6gwAKS6fwpFXQW3qMrOMge+RR66yqlU5A7nalACnHKK9+fp
         0gY0n5gu5jFtkVMNbGVH28o/p13o7LjspXvqKnaM9SQEXZvDmwLZs7RpjAIw5T+5Sx/0
         PY9ypdK3uPJMkon9AMnoC4/YZGeKIQqK213YEyHJtmQ1yFHZ7iuSeobHbDddpU21jJgv
         rF3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793312991; x=1793917791;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yCAhvvfFaIXRbwj4Slp/VrdUH7ygbm1KTvnKrDnSH20=;
        b=1AExxuzn4/cLi6IA5iwm+scEnTbpJnN7EKDq0HHU76xu4vDeEi50DbSghIUdysRnBj
         eLdmnRPaCZJJ9lKgv6Lh+qwckiWMqBU/HTybRpN5OwKn+kTQSVLp3hxpAZxJEcPoyikS
         4wyTWWjaRcCShWs9A6hWaG9PpLm3A+yGP1sjd4myaqTEfXVlaGqJqlwa+JyDZQFQq9mO
         TUmgZh1a1E7eF2mnXIDXGSRZM0/j0oP5z/6mrrlhmGHNsO5mb12XcujWksxrIL1dDLhN
         +xVYElTnC8K/llAS4UUgcRLzHrM5Ukl6D6mrkOM+/ND1fXXkeHBfWv+yJak+SGdPuVho
         ewcQ==
X-Forwarded-Encrypted: i=1; AKwUvBzfRTKhnecXB0LFKoR8DPt6Y71BMp1iTPsr683GEq26SKZfLw+48lFx8my2eKk23wt5gkNPcjWrb+0=@vger.kernel.org
X-Gm-Message-State: AFq9FYI7ZrBkewvS9kbmIZoOwNFdFYPISuql9M1MIVZT/DeuUsJb/cq6
	3T70eyEo5a2EjxJ82YbPSPzbdAl+By7x9u+X1YldH4uy6LwKjtCEZ9s+
X-Gm-Gg: AYBFou0YY8TqaWp+zRMWO6IoKASBQGsJ1/ASvw1IF7fcrLItBMVqT83S0dvCemCPAtk
	xpS8z3wHb4t9VoxKcVZq4ZFa5X1KrDF06li5gRsO5QATNY9AXLM9etbzOW0d+h9M/VICFRHFKDS
	zB8BVF8w0qFLsmL9QhMvFwznYRbX5wd05lLI4uG6Dbqtecg3aOalaeIF1LsV+q5QsxD08Axpjmr
	N88+C/ZVJEEh/v5wTIvKMyRr9mYFilL04YDKgcfUWRkDCXZsfhfAaGv9/Orz1HLv/TCVcmnITFD
	dL6HI2108DC/M5/19pLORIMv6G8Ao+GXBQaOlq0p2ebn4dhcSKC/FwnOzJ+3jONj05TKXEYC5dG
	4A15yw9N1fuMMrtk5iGlo+8VXgsQ3PlMDMDOYTIBlWom0sVcErsWqiseikM4RzJtz5nvAN3TCDR
	lg39HHpKLZqtpbMtzzEDJ9bwsiMr5TeiBAO+b2Ff9udywkPKv//5UUyKshH9zVIZIyoFN4yplFV
	T0/ru3UmQnvaBgtdv8uLKGmrAhl95Nae5v4/NL7seLBkEpQleUu7qGhDk8HGcoS0dF51reCmXnA
	/kMNofhUPh87HfRXdqqxCxWTEGtd0sZ5sVSahDe+Rg9ewsH4jCJO2PN372GuBiFshTPb8MykvYn
	tCurQ8Wro/tJ/nsdllXhd3+nRDTK4sW1ocJuiYvjwXDckXJL/mRhjbg5qnojr71UqOQppt5/fFe
	UBM9ahr1QAe4Y3PesoJfbh8DreOjKpdCZfondtGBegf//hds3TonhZPlwb6mU9h/HKuaZY+/yfF
	A==
X-Received: by 2002:a05:6808:3189:b0:55b:f88d:6ed4 with SMTP id 5614622812f47-5640dc19ccbmr440937b6e.22.1793312991208;
        Thu, 29 Oct 2026 15:29:51 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fc49880sm236130b6e.2.2026.10.29.15.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 15:29:50 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 16:29:37 -0600
Subject: [PATCH v4 3/7] dmaengine: dw: complete cookies before releasing
 the channel lock
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
Message-Id: <20261029-submit-dw-dma-synchronize-v1-v4-3-fea447d9f285@gmail.com>
References: <20261029-submit-dw-dma-synchronize-v1-v4-0-fea447d9f285@gmail.com>
In-Reply-To: <20261029-submit-dw-dma-synchronize-v1-v4-0-fea447d9f285@gmail.com>
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
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2

Completion detaches a descriptor from the active list under the channel
lock, but updates its cookie later when freeing it. Termination can take
the lock in between and complete newer descriptors. Completing the older
cookie afterwards moves completed_cookie backwards and makes an already
terminated transfer appear outstanding again.

Complete cookies while detaching descriptors in the completion, error
recovery and termination paths. Keep the active-before-queued ordering
when terminating so completed_cookie advances in submission order.
Descriptor freeing and client notification no longer update cookies.

Fixes: 3bfb1d20b547 ("dmaengine: Driver for the Synopsys DesignWare DMA controller")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw/core.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index 51c5460b4670..1f7afcd01565 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -236,18 +236,17 @@ static void dwc_dostart_first_queued(struct dw_dma_chan *dwc)
 /*----------------------------------------------------------------------*/
 
 static void
-dwc_descriptor_complete(struct dw_dma_chan *dwc, struct dw_desc *desc,
-		bool callback_required)
+dwc_descriptor_free(struct dw_dma_chan *dwc, struct dw_desc *desc,
+		    bool callback_required)
 {
 	struct dma_async_tx_descriptor	*txd = &desc->txd;
 	struct dw_desc			*child;
 	unsigned long			flags;
 	struct dmaengine_desc_callback	cb;
 
-	dev_vdbg(chan2dev(&dwc->chan), "descriptor %u complete\n", txd->cookie);
+	dev_vdbg(chan2dev(&dwc->chan), "freeing descriptor %p\n", desc);
 
 	spin_lock_irqsave(&dwc->lock, flags);
-	dma_cookie_complete(txd);
 	if (callback_required)
 		dmaengine_desc_get_callback(txd, &cb);
 	else
@@ -334,12 +333,14 @@ static void dwc_scan_descriptors(struct dw_dma *dw, struct dw_dma_chan *dwc)
 
 		/* Detach the completed transfer before starting queued work. */
 		list_splice_init(&dwc->active_list, &list);
+		list_for_each_entry(desc, &list, desc_node)
+			dma_cookie_complete(&desc->txd);
 		dwc_dostart_first_queued(dwc);
 		spin_unlock_irqrestore(&dwc->lock, flags);
 
 		list_for_each_entry_safe(desc, _desc, &list, desc_node) {
 			list_del_init(&desc->desc_node);
-			dwc_descriptor_complete(dwc, desc, true);
+			dwc_descriptor_free(dwc, desc, true);
 		}
 		return;
 	}
@@ -441,10 +442,11 @@ static void dwc_handle_error(struct dw_dma *dw, struct dw_dma_chan *dwc)
 	list_for_each_entry(child, &bad_desc->tx_list, desc_node)
 		dwc_dump_lli(dwc, child);
 
+	/* Pretend the descriptor completed successfully */
+	dma_cookie_complete(&bad_desc->txd);
 	spin_unlock_irqrestore(&dwc->lock, flags);
 
-	/* Pretend the descriptor completed successfully */
-	dwc_descriptor_complete(dwc, bad_desc, true);
+	dwc_descriptor_free(dwc, bad_desc, true);
 	return;
 
 unlock:
@@ -945,12 +947,16 @@ static int dwc_terminate_all(struct dma_chan *chan)
 	/* active_list entries will end up before queued entries */
 	list_splice_init(&dwc->queue, &list);
 	list_splice_init(&dwc->active_list, &list);
+	list_for_each_entry(desc, &list, desc_node)
+		dma_cookie_complete(&desc->txd);
 
 	spin_unlock_irqrestore(&dwc->lock, flags);
 
 	/* Flush all pending and queued descriptors */
-	list_for_each_entry_safe(desc, _desc, &list, desc_node)
-		dwc_descriptor_complete(dwc, desc, false);
+	list_for_each_entry_safe(desc, _desc, &list, desc_node) {
+		list_del_init(&desc->desc_node);
+		dwc_descriptor_free(dwc, desc, false);
+	}
 
 	return 0;
 }

-- 
2.53.0

