Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793312996;
	b=of9UZlfg5HXVicSKDBl/N81/R9OF0O7ERn1kwglvgNRnF18BorNoPL/hUPwfNyMtlXuC
	 VIoOFz2zOcdxf/zyJIzwFkwmxr+BUZYKtff3GVEHjNA6vwiGoMhqQ4e+vPeHEgaWNIv/Q
	 /0a4G/CSb1NCKQf/Vqtzr0yh19rP5y8kvnkkoD4W1VQIc5VJnmtdElANNdQjpj9R+cPC3
	 ZTVQ4HxULNWwV4ilfrZZbo+TaWIgl1hVADb+vqproC2TZ67yqtA1zF7mcyGTXh6W7258h
	 3o7OgMKee+JE6n7I4FI69Gf5ySt6SfdzpMoaCxGEvxZGJOIOUYLO4niPspqBw7Duh6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793312996;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=wkIhisdDZBkDpi2Ngf0GdoFEgXXogA5sytIiQ5NQ4z8=;
	b=GhpFRFt0lb1hsHf8AHiLG9/plEUhXeVfVqyTvMFAFHDciWtKgefEsPjBlVkWN6jbwUTc
	 5OmH8To1Et92tCyNZ8xmNsAOPTsA3eEQ7obNDH9rUn/aTd8hIUiSaCcaG81uP/N6JQDzj
	 UtkZn6HpAfzdsHJ1tMpo6NiboRtKIP8b+72xJM5wlNPodeYIZbuMEVMroFllmERz2P/C2
	 ZljqrMrlAhWFRenl665TVAH2R50DkgKZX6Fr77qroFkn3oP2gxHfZvsTMp/Ym66kbLNh4
	 5Qg9IwvGLiB/ijSdati6dOiYHL1ZEE+SQkJAjZ3Pgk/EuYiL3NmXcXnhOgnCIbRl3Uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RNR9Efno;
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D4360A261B
	for <dmaengine@vger.kernel.org>; Thu, 29 Oct 2026 22:29:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2D4360A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RNR9Efno
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-844a8bf7e25so109180a34.1
        for <dmaengine@vger.kernel.org>; Thu, 29 Oct 2026 15:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793312995; x=1793917795; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wkIhisdDZBkDpi2Ngf0GdoFEgXXogA5sytIiQ5NQ4z8=;
        b=RNR9Efnolrr+Tv9pm9QqjboB94rb3QbKuu+iJXO4ui75czgSEYX97arGLUAsN9mwo2
         B50CHn1wvxCqxQCsXAFdR+7ydwiXXqH0SYNxsKZp6tGp+lzWZBCuGO7d6NaT6SWqAah/
         4oh5JKgWkM6Mn4xhGHrO/636qy3uWRezfa2BPyUK2oVVonW2O/EQe5p0bOJ0CI9J0n9B
         uKvmM+L6elc+Qm+WjsLg58z2wgo/+S2tZiMvIJAPe+Dgz8dWV8WyL/smx5HUOKvydH3w
         lowo1cfPCa8eR5h8J4jeIoEziEYkFV7djX03DDN1ASjBCGAAarILZr7aTW+aQ25QklH9
         dMJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793312995; x=1793917795;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wkIhisdDZBkDpi2Ngf0GdoFEgXXogA5sytIiQ5NQ4z8=;
        b=N8QIq6PkrgrwbFpeySF6ZUUej0eqYj3+bi/+6yfaMDsLRygM+Urd1JJXvhmJmQvWU0
         3rQQ3abg5zVKFR2+m8JVWAe51cDGGCBX29MX3oJ/5VIAud4G6xT51A6PpO4smhut1P1D
         SqvszYmUmdeEiRefhfMRnhq1QVZPCjwWkV9H08u7b+iu2PdgbM1MAgZhG6YQu1K7LSLs
         va2d/AxX1FkvqLkI/3k03XzObR6vFvqmdcs9yMEX77c15J/c3psRq8dKyavqa4FmsR0+
         4ThsBec8PYS4FDpkhKe7K0b6vhc+xkw9MGxstoDGn9VwkAm1xg33Djs+nCpjhPufjuBN
         19+w==
X-Forwarded-Encrypted: i=1; AKwUvByaMsppcUE07hnPTZs/x+Y4srX2xVHfqSQf+Dot6McDzy7FxkKmoMLjzby/AastftoCquuQNicrqCA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIr/FHuyAkZppa64HBD7ISgA8Q70D1hXe9o2BQjA0fQbaoGcXVg
	mm5HzWIyb7J347RQg5RkQAPtPmIMGXuEBoFjMUIHpE2S2m1wiBJ6DtEl
X-Gm-Gg: AYBFou02yG+NTNCgbA+alTgdTojiH7tkK6ZCnrw70PTKHrmQGF89IBoEB3Gn3GvLXjP
	5bQXlg8b651VrVv54g/CejvM86K00JSAKfLKvD6u9wW6ZtW4xsjbiNt4hee59JvCxT6xw+tU5Ul
	y+yYPC1GsrDzbhXBBB2qZgvP2xyeGpcCD0nMsyJeFhkg9AM2WadvAGNMe3GvFSQMUJ6ViBCARW4
	ipexNpR1iOa/ugJCIONyY3wR3n+UEWJfQr7hqFUVGwjPpUixhDAHvxEoSgk47z0B+N7fDx5i2wT
	9ZLBe4L+vzERp279ksgHzDsnjZpJfKeIN91oJ1hR8bhMiNmBxxGBEfYpDXsNHZp1zwEGPacwvc0
	cKBT6CCvGuin3ixVL3YOEapPgA3nSyuk9mBY8TVJAH+d1AdSBihNPzPnzB1Md7hoAz37qaj9uoJ
	KhU3i6DqxH1XuCF/pvmyoGDPsJVcrLOY5qIQEVhvfeL2Zj+6u8BKg7BjwtMwzm69FAHslyACs9r
	COaFkBD82D97A4qovQtG+RN32KvBgeDMSpHp1vOwKGGjAXnnZ4Zw47YEYAwkr4sg8jhMemTgPYf
	BsCe/GFRtqDS5XByweBQbQHM5HEDiQSsChWOtlIMwYOkI6vuL69PpOdOTK5WpiZT3gO8kUSxmT+
	eETguaJUZe2jn9aH7xtbqiHv44F/WhCZ79l7b+LDYBGTBVZzKW/rvv+STT/hXoZe+5DMd9j2uwp
	rcpYmYkLkG9jknuwhi9lqH57g0dmsTALvi1Zq6KqDTTgKXMr3VrhD0
X-Received: by 2002:a05:6808:1383:b0:4e7:3fd7:2752 with SMTP id 5614622812f47-5640e02af93mr409218b6e.54.1793312994747;
        Thu, 29 Oct 2026 15:29:54 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fc49880sm236130b6e.2.2026.10.29.15.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 15:29:54 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 16:29:40 -0600
Subject: [PATCH v4 6/7] dmaengine: dw: synchronize completion callbacks
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
Message-Id: <20261029-submit-dw-dma-synchronize-v1-v4-6-fea447d9f285@gmail.com>
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
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/dw/core.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index 3bda85adbeee..66065d7b26ae 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -902,6 +902,19 @@ static int dwc_terminate_all(struct dma_chan *chan)
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
@@ -1295,6 +1308,7 @@ int do_dma_probe(struct dw_dma_chip *chip)
 	dw->dma.device_pause = dwc_pause;
 	dw->dma.device_resume = dwc_resume;
 	dw->dma.device_terminate_all = dwc_terminate_all;
+	dw->dma.device_synchronize = dwc_synchronize;
 
 	dw->dma.device_tx_status = dwc_tx_status;
 	dw->dma.device_issue_pending = dwc_issue_pending;

-- 
2.53.0

