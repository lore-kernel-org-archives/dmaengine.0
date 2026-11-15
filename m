Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794727194;
	b=UWSDO3S/0OONHwqYRWZFtc/LkXEWLI6LG/9Y0eLlMwmkhlgHVuhUJ9eNSJGkDoqCfMZ8
	 1WEqhm/+3Q69iblyoolqazEETY9HpPEc5w2vJL4ytIEINsXp+2byxt942ulhM7+zP5IGO
	 yqb0hv7HidTLba3bh+f+Xn71RL+0yJqhcag76Cq2WuXYl4zUBQTWoMWxDBaPbgPeL6a2O
	 EozBie80hJkrLI2AMs069LD3Gt6wFtY4qePGJEai1xQObiSnBmAa63lBikS9AKBIwg992
	 HwBBbunfBbV1PvCnhqB71+DsnodYxjGvpN9fAvpWs+/zhSp15c7ZakH9QOdI9KPZWng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794727194;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=5OFiyLgPB9gonzWakO9Dintvadbo1GwHe3HBflThFw0=;
	b=wmFwyyKBK8ZLlgmOe/PtzceNWEBF8yde4QFZnjR75uO7TKT58FkC5vNNNZWUVkzVTy9m
	 cVFJ+S/KdvzssSQjdsMWyaahoEHUdim7Lt6TM43n8+FQcmOM0vAz3/MVza540bOfXoAXD
	 N97Pij01LvAOi0T7ZP2Qv15elThgq176JnN+iwHUutw2RUYOdT5V3GBfFikgdk3lIvNGF
	 50nL5kRdX++lDiaINt4gd5bZD3SAAJdYpOqVn+guaXABhKPQzThXy+6KjnHGP0jjyb8MG
	 GXA8dv+UKDA37WO4TA/oddWeaKxhPGuGF4Zwmzrpwgf2Z/AIu6rEfIbnHo2AJhrdYmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ceYAJYjk;
	arc=none smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D45606A88E
	for <dmaengine@vger.kernel.org>; Sun, 15 Nov 2026 07:19:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1D45606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ceYAJYjk
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-71adbbf09d8so607151eaf.1
        for <dmaengine@vger.kernel.org>; Sat, 14 Nov 2026 23:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794727193; x=1795331993; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5OFiyLgPB9gonzWakO9Dintvadbo1GwHe3HBflThFw0=;
        b=ceYAJYjkTQE+MYaav3vU0DXG3mM4qLnM/7WEl09HG8qfVIon/Pa2fjcGYoxVkzUJB0
         YSzh3u6CxFDsSXjM5oKN6+Lklm6zB+AxWgEielSZgXCO8U//Dw2SGyjY1h3Tu6PEQTs3
         NISiOlin3w/1Lh/8R2+ZtNnFfnf5hJ05lVbo7mf6uFOaXWgI9+ERgrZIItse+iKRWVmM
         a4Z6Tn+Mn6GYLFkWxckyqM1nOB4O5Y50OJA/nKmV+b53K/vOtp3PW8BJq5ggyxNpI1Hj
         yeaa/ydlgHLcRNwIsFAJRIXgyG44HWwNOJSDDFgVpllx6dx3XujIkbjCa3pcBIc3hxO3
         o4rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794727193; x=1795331993;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5OFiyLgPB9gonzWakO9Dintvadbo1GwHe3HBflThFw0=;
        b=RgumVcL9MB2EfOVJ6JysOGCdXa1nxZVxbXuPh5Ty5BsPcp5mLLEg72Z3TWu6qKolXF
         7DZoDOKM+dXhOI/cq7qR+ahnq+ShMYbvt+GraB/3a3jdklvlHEnTRMpQtQKUehTAYhdk
         aHmLAwhTY6NYN2CQpf8NR/K/P9lDaWIfbqXSPnb81mZ5RJnODFvTR2sVWQUQjErWQbbv
         Zrc2uzGb/5wWUztFee6jYC0DWV6RtV0BUsHKR7rKc/icN3za57BqSE1/plFkb7RLvltn
         QIurCYNPZEpPdbCqwC8ae1cgK+SXG2Mgiom7PfqCF3fv72YP4lw289A3BgYkfQ77+X+7
         kHUw==
X-Forwarded-Encrypted: i=1; AL+hErG8HJjlSZx0O2OmGTMcgIBif9O4/eIOFRJkHAEw+8EJYZgw1AElAV+hwCRbC0JTQIcSZizVdvOyxt4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Tq1AI9MfXws1P2h1bU3sXYQEmEMLuAFYplhSa6e2L82awylih
	grTvmkUBh8X9uSljHZszJNDvuaYd8dx6zT/yDWhew6tvAMc1MngVvMhh
X-Gm-Gg: AYBFou2JezWm9+vrTUAcweW1u5tmGbMOVOYA0M97rg5b6O+AN4xkjzeTO6MoU8ZtRd1
	FdIrIWKC5aOxmKOUs5lu5kru9prlvSj28WPpQg3v81yzm6umtoVJ+STbOJjJnPyjasAKQkeE78j
	Q3Qn5xYJc0y1V7PedHJqmezkm7xR5UzzTHVtgAs3HoIEpJ5EmymiWGLvIdmnqmHyjro1kgF0zzu
	aADvPBH8/VIFurbMv5kxWfZKFuCu3Z7uh+ZouN8GCtvGQmouGLkcaFIt2It/9u2vCdga8bHNbqs
	P/J9huz6TvYtH7Oo2gR+p32Ix2ZUikpmK1H5u+mRJU9MbkdNeYKuAbq3EzDKGrbvWVQjyn4oeri
	qlPdfNmAhRryW7UwpajR+R5P9xMlrBPBhBHTYoGKXVqkrye/CnHADFoDp0sCoSpeV7D7frg+YPC
	tnLRzO7qIOhpclH77f6Y0sbbUvjLnAsHB5+js9e59m/BL26i0jAkWH+JdXMl9NBQ2PccVJa+1QW
	faiPLgRsZJBLsFUtVS+2IRJ3+6DzgYYaRLB9/w825nOP0OcGed6TV2oyLo+Kd0RhrFHiF4aYkZ6
	ZpDQF2xKeonWLT/OVyGJ0cY80AVjeklEZ7JXx85tOpGepSqNgwWnPz1Vv3V+d0iES1ruJK90D3d
	UCj+M5yPmPYwuDrELcNzn+vJ4E5igk/pm+WKCqjgNX6k+liT1Ksuo9EbpoUSIzZUy1kqMzhe6od
	x783Mxbjcij2xaMfIFlaOALtK3VPpl7S/ssGUv2BRTpr7FxrT2hSE=
X-Received: by 2002:a05:6820:5604:20b0:713:da3b:9530 with SMTP id 006d021491bc7-71ab5277f0emr2419543eaf.44.1794727192611;
        Sat, 14 Nov 2026 23:19:52 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ae860ebd7sm1145321eaf.8.2026.11.14.23.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:19:52 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 00:19:42 -0700
Subject: [PATCH v7 09/10] dmaengine: dw: synchronize completion callbacks
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
Message-Id: <20261115-submit-dw-dma-synchronize-v1-v7-9-8d58f3d49e4d@gmail.com>
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw/core.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index 56a422ba14c1..6f863fae7455 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -923,6 +923,19 @@ static int dwc_terminate_all(struct dma_chan *chan)
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
@@ -1290,6 +1303,7 @@ int do_dma_probe(struct dw_dma_chip *chip)
 	dw->dma.device_pause = dwc_pause;
 	dw->dma.device_resume = dwc_resume;
 	dw->dma.device_terminate_all = dwc_terminate_all;
+	dw->dma.device_synchronize = dwc_synchronize;
 
 	dw->dma.device_tx_status = dwc_tx_status;
 	dw->dma.device_issue_pending = dwc_issue_pending;

-- 
2.53.0

