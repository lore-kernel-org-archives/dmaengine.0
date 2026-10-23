Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792772858;
	b=M9aNYzbod63wD58Ef/mbms/ResJCgXhvUGtHA1nks3Yq2/7V9jNLZOpmB/dOf9mU3p3s
	 wxDBXNhoSy/Po9Zjn2SYwyTyVOK4FngUeJ5P97Hc1YgKypooyP7BF8kDrJrD2nfbwTu38
	 sLK/DkUaSk5Smi9BP3uDfA32UdLNHa6ccD3sPZR1HEBPtz1GsSGX67dvvb94KcGqyNHFl
	 MVML5MV0TV6LdLNBNZCoIHC2BI4Vs3m4voPZjNUFjdAyyloHC7CcZViIpMePde590Zwsi
	 oWlLX8wHiXo/Au34E93Eh14WKj7Wdo9Zm91RfcCqNJIPDL6U6mx5yT244Gu+cu7uUcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792772858;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=NcEoJJHS6s0Ldxcf7QTPPdL5n5yIYzYW/l921a9eHYI=;
	b=DqYymBeJeuo89TSpRmuKf4EzBbvVdS4S74tVx3Jkn+6ytoj1pq1q8kfOwyaZSfGeUd6I
	 wHdl/TlFi1NJPgFpOPqghlTVVkI+k2GIUZEY4gsBU2dc6pGN66Nc1dqr4cdpROd0Qnq5z
	 8bQQ+Mz+602J5ep3cfSOiown8HcJjf80EYg9s85kjwUsV9hlPa1W1qHE0NmHvCRs99WjD
	 kzQkdEfupdiqun3WqYAKJqINEyroS0U/+vjbPJZI6z+G7fMIGahhCT5Ie634wFs1FQnKH
	 puARi1ETvr4bBCzrthXDL05sYv305HwlJSxPBBRN2s1M/3eQIBVExjqe4mAH9DcSMjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bstAkr43;
	arc=none smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229FA60A2605
	for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 16:27:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 229FA60A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bstAkr43
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6de1fd5f572so535956eaf.3
        for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 09:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792772857; x=1793377657; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NcEoJJHS6s0Ldxcf7QTPPdL5n5yIYzYW/l921a9eHYI=;
        b=bstAkr43KzEfnOvQVvQpkrC8EZcMp6H2yQHgpP4YuHjnzJC+a17LoDM5bdUOUNW14R
         HMEgiATvdmlwKaaPHQqESqvPfVEEWC3ZiMmMAFGk6/Zn4oSNgmztKNNiyTt7IW/zV/O5
         Z6rMDPxCaqmVFUycbjRBX85w6Hegt/Z3CWp8SLFIs4wrlAhwK3f/uw1WRvmzsNkGFTHh
         xDNPJXpn4thBivAWoiAar5mDqWYGhYwUCC9TuD++5KpUkDGnmr7j0/t4oPdwO6olyMod
         cHDZA5MKEuAWrlB6q6F1VAPAmY5VqZiDyA83jr44FUA0obY5NInDglv2mqUQRUUqzxQp
         vtJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792772857; x=1793377657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NcEoJJHS6s0Ldxcf7QTPPdL5n5yIYzYW/l921a9eHYI=;
        b=BO8RwIc5QAw16qElIn3unQmXTSRnTAkEL+Adn99FickAzIGgcjaFbBv/tBdZotCZ7t
         kL+zVEG+UsUkZw5szwbeZztENtOqQFhqLPlT4GsNGagN6G4nwY5qaN1PyQZrHJWGqmul
         VXo+aR3hKeucbnqSYUVvtn3du8qHqrF4534EmEjQHREnMlEPRI72UQyhEHv34bOVUwR3
         H7rdTRjlrpFa+o4VPx1+51+VfL+/BCoDpkzoME8bfmeJtSO/Ris684xW0j+GWWijXjYe
         A/3QcrbdeRhH4dBFHkeGtzihgXOIcXDB8QFHPxPmuvzTB+9/dJm4wJT/6gjBjCZyoNLl
         aw6A==
X-Forwarded-Encrypted: i=1; AKwUvBz2gBAyz31ckAQU2JvRpF5K2actFBmZuCzApBn0CzqIwBxIGGQzpHYWylA/L/segda6QwsowOCAdXY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6nrfRxB4iX+3fCk9NgSWf6ImzbQEeA+x8d5wxv9HOR784GUHQ
	8RwgSI/7FXXm2fQW8EN8owx9qSRVkRYBPGzuwQjmllW9yhgnNSH1oXvz
X-Gm-Gg: AYBFou0ZWJhFk3BLiFCVnxvPTtLvYWiXAx3ON2tXI59EYukVyhoWs2BqtYwX8yGUFwl
	kmms2RS/6jty1hNbd6Xw+j910n6Q8OgF8uzw6FjJ6tHqbMC93GE8azlau4Sn0NCiTt/Cky2QZ9F
	c8CMzb0eisdib9yWbXXU9HO6zE1vmAqsRLkGYoDr8X41RL4G/qdWhMDM7/pNp+rvL3s157GhpsQ
	HfmWXdCqhPfBepFx3shEOfwR41r99f01J9CMyyB12V+DocpHHTu0wCMsPks3MfOd6SjOqimAFZ2
	NK4WqyMoIo1MJiLu+BrpsrWwm2xnwyqp2S09QjBCw0oCiRdmpPq1hKSY7TVppy0Zu69Hm+IQ07E
	ZPgDtauFr5XThWQc87xiH/3r8g+tFpnrUPvAS9xMsnuwS3YstVZooE0zgmXL+A9XYBxszCNmzot
	IVfswds8oMNb40QG00zbaKL07TF/AxUqFTD09TVKn3eOB+J9ZIsUHKwOp99CMWd/+O5Wl0djx0X
	ONpLWZ18+GebhTjgnycxK99Z3HwAMISpSi1sxxbTuD+BoaRJQ/WFBoH/yrcasFerhFUyc8gMCQc
	GdOoG6+t8+3H5Jip9t/7YO2lPPtWqAhxbNm+Zb10BcXkZ9A48K4UWSs8oiC7NtA+jqyqGHORYnv
	hrCddvvM3EyTFemdFz1h+gqge7BM7/rmd5hCi9QbXtuKWqR0Wx8phekO5wPmy/on8mpGHKI5/S/
	/GiM4=
X-Received: by 2002:a05:6820:1621:b0:70b:8379:c170 with SMTP id 006d021491bc7-70b889b7a5emr1671116eaf.27.1792772857121;
        Fri, 23 Oct 2026 09:27:37 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70b9aed3144sm372801eaf.12.2026.10.23.09.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 09:27:36 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 10:27:25 -0600
Subject: [PATCH v3 4/4] dmaengine: dw: synchronize completion callbacks
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
Message-Id: <20261023-submit-dw-dma-synchronize-v1-v3-4-c62bf048f5ce@gmail.com>
References: <20261023-submit-dw-dma-synchronize-v1-v3-0-c62bf048f5ce@gmail.com>
In-Reply-To: <20261023-submit-dw-dma-synchronize-v1-v3-0-c62bf048f5ce@gmail.com>
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Maciej Sosnowski <maciej.sosnowski@intel.com>, 
 Dan Williams <djbw@kernel.org>, 
 Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
Cc: Serge Semin <fancer.lancer@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 dmaengine@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2

The controller tasklet can detach completed descriptors and invoke their
callbacks outside the channel lock. Terminating the channel does not wait
for those callbacks, and there is no device_synchronize hook. A client can
therefore reuse callback state or release its buffers after
dmaengine_synchronize() while an old callback still uses them.

Disable and re-enable the controller tasklet from device_synchronize,
outside the channel lock. Disabling waits for an executing tasklet,
including descriptors it already removed from the channel lists. After
termination, a later tasklet run cannot acquire another descriptor from
the terminated channel. Clients must continue to exclude new submissions
on that channel until synchronization finishes.

The tasklet is shared, so other channels may schedule it while this wait
is in progress. Preserve those pending runs: tasklet_kill() temporarily
owns the scheduling bit and can consume a concurrent scheduling request,
leaving controller interrupts masked. The disable/enable pair leaves the
scheduling bit and pending tasklet queue intact. Other channels' hardware
transfers continue, though their callbacks may be briefly deferred.

Fixes: b36f09c3c441 ("dmaengine: Add transfer termination synchronization support")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/sashiko-outbox-180707@kernel.org
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw/core.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index 6d27af3c0f2d..d80be93f0c49 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -910,6 +910,19 @@ static int dwc_terminate_all(struct dma_chan *chan)
 	return 0;
 }
 
+static void dwc_synchronize(struct dma_chan *chan)
+{
+	struct dw_dma *dw = to_dw_dma(chan->device);
+
+	/*
+	 * Termination removes the channel's descriptors from the lists, but a
+	 * running tasklet may still own a completed descriptor and its callback.
+	 * Wait for that run without losing schedules from the other channels.
+	 */
+	tasklet_disable(&dw->tasklet);
+	tasklet_enable(&dw->tasklet);
+}
+
 static struct dw_desc *dwc_find_desc(struct dw_dma_chan *dwc, dma_cookie_t c)
 {
 	struct dw_desc *desc;
@@ -1318,6 +1331,7 @@ int do_dma_probe(struct dw_dma_chip *chip)
 	dw->dma.device_pause = dwc_pause;
 	dw->dma.device_resume = dwc_resume;
 	dw->dma.device_terminate_all = dwc_terminate_all;
+	dw->dma.device_synchronize = dwc_synchronize;
 
 	dw->dma.device_tx_status = dwc_tx_status;
 	dw->dma.device_issue_pending = dwc_issue_pending;

-- 
2.53.0

