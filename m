Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445648;
	b=l6bWz8AIkDci3HYQwrD/FBOj7dfSMad0bxY16DQs0U1RFKeW6uqz0JNImGyePIZnSUcP
	 LBf3zzKvP5cXI35Cak6AL9xtfLreHZXRQuQSr6lorHV+xCEXbH16T1hZOPnOueFfpBn9/
	 nS7h69IxaThRzm/Z6xqgoHTVPqGL5HxMDWHmJVbhW/ny4OvLn6oDQ2saIAd9dMmxN5NHL
	 4Nst5EwXRlQ3CA/T9+ivLqf+RoZu6zT3NUY58vH1SkXfN5NKSXFrdj18v0QywqphUxu3I
	 cGawT7+tf1zjgzORJIrmp3wzQq3VmQZ65TeSOxvu13UQIJb57P2F7LIo2XydRMOaZkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445648;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vFGaXI7w6YoB2AF/0GVKcoFlsFRelQZrfqIbLHit2Pk=;
	b=SXqfLWCawhOd9utHowaMHflOGFEJXRQaQP0bsy8aKTFpiXvOGZLclQKrixTqu7XbtQqp
	 bfjTd4i+CPGyC1Gp+0qMCjUyeDArtvNxbKlkOWbWhlgmDOSNoEkscdRK+K8J5XpsCo2FX
	 dlxS9vD9198kSsor+ZlnQglbcoSmQLamNJROdrEvITQFZlPtDDMkEiev9UikafSWqtX90
	 NGhLXiUwY/QLDzvMvh7HVxeg94ytgGzPXO+3qNdYLnPgIVKUqRMrZ5eby6SbpYHJruroa
	 7C0TTTJUpyE4R4s9kEJFJ8xCMkIkSssifKVRUCt+jcwTgANgfEaYarLa1KRDdVPuLLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Gf4oABcd;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A78C606B0AF
	for <dmaengine@vger.kernel.org>; Mon, 23 Nov 2026 14:54:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A78C606B0AF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Gf4oABcd
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48dee593f18so3268042f8f.3
        for <dmaengine@vger.kernel.org>; Mon, 23 Nov 2026 06:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445647; x=1796050447; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vFGaXI7w6YoB2AF/0GVKcoFlsFRelQZrfqIbLHit2Pk=;
        b=Gf4oABcdK2jy2nzIAQ/OfHqcxS3CQPw/HJ/SnE5vuEs26Tx6OmnMfa1TT2owBWaEi0
         ot7hmUF6yM/UqatFH17Rw9GrIZmUofi1h/6U/mBQeyzNpy4kJKKn3TYYtdaDtXIMPIw8
         /UJVsrkOKFX1FAXT2JvT95IZj+Xuwe6vjX1g1ntmNRoMZyItzxkn8XZUdG84CIqwdNEU
         tDIaJoXWS/B8WngO3UJ5zmIRUtaAzO1yxtHS6BzTZuUibbIyQ/JTjVIT8Lucv1XamG66
         o8KiDOP5BmWY4nYlQf/aBr2E3EqURH29Mgb+c1l32c1RVkTXb788h+x8zv3UJhzbccMG
         yL0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445647; x=1796050447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vFGaXI7w6YoB2AF/0GVKcoFlsFRelQZrfqIbLHit2Pk=;
        b=eyTSnLC/JeRPaA0c8zkts2+zbTHiceJ+GfLXLMG0OB/teqV/6EXt93Sr4Gg19xVoDb
         WW9hDFBpk9HEaVydRpmE36wYZRy4PfjHZAd87Rf0658mA9w4cd5J5lhk88qLvGRaHjNT
         u9LtAiH0uaB22r/cUgSbG1G6S3wR5yPbfEPgjcMu3F6gy4BTBjqEInmpVyRK0f1GXSrK
         slgwNsRLwSNDgPhzPMXPrDK5tpMY5c89Ax1FWkXQD8ceGGQ7Y7yuFng688yGE38o1WgC
         Q1Ze/CUU4LEBHehhoahY9sxSrsYudZbtmpy5etGn5oaP8lrHzYVzi3VxLz0k8+cswsj3
         6hrw==
X-Forwarded-Encrypted: i=1; AL+hErG4Jm/SDnTIl5WXpO+nc98kAoAXr6Fg4xSUfxTuH6849hVTGBSoeJUSF6I0zrWVE5E0+3VJay3f37g=@vger.kernel.org
X-Gm-Message-State: APuU4Z8dcaLtRApVzjMRnZZGTZ30MeKMSGZ9aUpqSEFtq+Ofvwi2EyIi
	pn0keinUCXgjQs7+6R/Lctiay283Di8nJWi4Mo/N+rEO4AlwNM3DsJmWGR9Jj2m3otA=
X-Gm-Gg: AZFdTZdm67SKHcFbPbVKU98upVO0t4c9yhOhL+ztj8afgNpLzKYToyNkW9pCFpPu/om
	z7QhsiSs4E9B8anqMdqS4NCMJT6q8lQTCKgOeogFMIQ9UuZWKf/qC+T6lQL4NM/FrUjvKbmJ2S0
	A6HYLO3k3KD6M1ibt7BP7iMFuInUs9myBBBnq0nOiKxDj35lUyLEpEv+DTjFDa09fahiqYn5AAn
	EIdSVgB+3BTZ7DGjncvTPh83EIOFIP8DQma4kVEhNviwwrEWsqma8qedegaLm10+GPr7gB7Sojd
	rMowfJo5BeYaM5meUbZBHUfZ37mXuaR78rfi9NtWjqIhuYBJa4hzJjrA2QScIiuudVzLdOiqIjh
	DjqdsCOxoFt7LxUQHukaQaAMqxAW5O5zptBZWPROia2oVuksgyQ2BLQBx2fXxvUwbgncargDiDt
	4QJ+Ucnj4UkfaOIzqUMuBGynrEyDgG7U/P9RNTSYCW1MYfaU39O81UcKmX/C+II50/GP5iZqgc/
	OWa09s+a65rrURKCi4D1C4kQBPlV7LzOYmtrh2lft2csE5QcXD9uWGFZdjV9h4fS47tKDd9TP1j
	l4tO4magiqc7KXo+rynxj+KdOxMN
X-Received: by 2002:a05:600c:1911:b0:4a2:150f:1607 with SMTP id 5b1f17b1804b1-4bb8880a584mr244080575e9.13.1795445646859;
        Mon, 23 Nov 2026 06:54:06 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906635c7sm185598285e9.2.2026.11.23.06.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:54:06 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Saenz Julienne <nsaenz@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dom Cobley <popcornmix@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH v3 25/28] dmaengine: bcm2835: Add BCM2712 40-bit DMA support
Date: Mon, 23 Nov 2026 15:57:03 +0100
Message-ID: <20261123145728.29082-26-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261123145728.29082-1-andrea.porta@suse.com>
References: <20261123145728.29082-1-andrea.porta@suse.com>
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

BCM2712 has six DMA channels (6 to 11) with the same programming model
as the BCM2711 40-bit channels.

These channels see both the RAM and the peripherals at their CPU
physical address. The bus they sit on maps them 1:1, so device trees
without dma-ranges are handled by the same fallback as the legacy
channels, i.e. by reverting the ranges of the parent bus.

The remaining channels (0 to 5) use the legacy control block format,
extended with the upper address bits stored in the stride field, and are
not supported for now. The downstream device tree describes them with
the same compatible, in a separate node: such a node is rejected thanks
to the channel mask of the platform data.

Link: https://github.com/raspberrypi/linux/commit/99c26cc709c0e3658c3f8d78cfb856cc20bdd0e3
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/dma/bcm2835-dma.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index a98ea67d3406..cf435dfb04dc 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -1545,8 +1545,38 @@ static const struct bcm2835_dma_cfg bcm2711_data = {
 	.chan_mask = GENMASK(14, 11),
 };
 
+static const struct bcm2835_dma_cfg bcm2712_data = {
+	.cs_reg = BCM2711_DMA40_CS,
+	.cb_reg = BCM2711_DMA40_CB,
+
+	.int_mask = BCM2711_DMA40_INT,
+	.active_mask = BCM2711_DMA40_ACTIVE,
+
+	.dma_mask = DMA_BIT_MASK(40),
+
+	.cb_get_length = bcm2711_dma_cb_get_length,
+	.cb_get_addr = bcm2711_dma_cb_get_addr,
+	.cb_init = bcm2711_dma_cb_init,
+	.cb_set_src = bcm2711_dma_cb_set_src,
+	.cb_set_dst = bcm2711_dma_cb_set_dst,
+	.cb_set_next = bcm2711_dma_cb_set_next,
+	.cb_set_length = bcm2711_dma_cb_set_length,
+	.cb_append_extra = bcm2711_dma_cb_append_extra,
+
+	.to_cb_addr = bcm2711_dma_to_cb_addr,
+
+	.read_addr = bcm2711_dma_read_addr,
+	.cs_flags = bcm2711_dma_cs_flags,
+	.abort = bcm2711_dma_abort_chan,
+
+	/* the parent bus maps the peripherals 1:1 on BCM2712 */
+	.legacy_bus_addr = bcm2835_dma_legacy_bus_addr,
+	.chan_mask = GENMASK(11, 6),
+};
+
 static const struct of_device_id bcm2835_dma_of_match[] = {
 	{ .compatible = "brcm,bcm2711-dma", .data = &bcm2711_data },
+	{ .compatible = "brcm,bcm2712-dma", .data = &bcm2712_data },
 	{ .compatible = "brcm,bcm2835-dma", .data = &bcm2835_data },
 	{},
 };
-- 
2.51.0

