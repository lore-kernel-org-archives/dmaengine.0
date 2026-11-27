Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781948;
	b=C2/CMWfmYtZHdB0J79z5A8DwUE2f559NZVInhTdnahdyoe1wbx3H3Bw3HKbRPq7gSQBk
	 44SOJE9o4+EvAX0L59KnxcBW0bhdnXCt8K80Ib0dEG4k4nHdO+k8bHPa62doxiYPSDH6Q
	 QPpD+XTAUn22tfp0fGu+Efu+gDtnsbdeVKSFke0+5I28TIQIgVLW5vhDIXwH1V5l3aFb2
	 R4aor8xPawQv0Qrms8p3Jg2kNTcayzv1wvmSaiKmlw2Z+DDPJGn5Q/rNGMBADLgjqAj/P
	 4xKg3udKOgo0btgxFNRLtSFUIJpl3RLo95FKiZtRVc37ZOKAufK5uWGY3GIgkDYapBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781948;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=e9DOyZqREfCbWSQdjYH3Cx6SxSP6lHmhvZmakX1uIME=;
	b=ZVJaK9h9whAfP9ILlGEA1VjAm2/u1lMRFFh3/lJDU0H1qLk0L6vqEkGKo7md0LVHFbO/
	 4Kyjw8gnPXbF0XXHm2ih0OhymYL5xliZfa7uBq49Gje0uOv6qn27q5ca+FnQi5VB2jMhC
	 9d8kxYZeSq/EnSBPH4izOCG9gnGtYlLTH3k3kJoK/mcXZTMstFC6oTye5WuN7SP+P4bYP
	 Va0LWErNt5Iv0kLamKLkxTWAc5F2sDi2DO32pBif+vz3SLrvd6hXyu38CZSpsJZ3cuqZ/
	 OkVya8pd07YbYLfrR5xVI3dlZ2anq12LBS5+jN5+Zc2/fFaaqTxZiBmDZHfjszqt51A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=WllOvn5u;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EAFC60A2607
	for <dmaengine@vger.kernel.org>; Fri, 27 Nov 2026 12:19:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EAFC60A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=WllOvn5u
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso57789545e9.2
        for <dmaengine@vger.kernel.org>; Fri, 27 Nov 2026 04:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781947; x=1796386747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e9DOyZqREfCbWSQdjYH3Cx6SxSP6lHmhvZmakX1uIME=;
        b=WllOvn5uE7PEqBx4nz/fhWIWp0pckyNOrWLbE4T2SAwmV7G84ROk+sGybcH86YhF0j
         ZapnCNmaxFFBFBXTlpkCg/Xvx+5/9rcBx5jUorxOZ9UC8MHrfEDyCD+H5vSJBDgjO2l2
         0W0J5DMx0TBYkUAYEppFs7M4pIkaDNToXVKeoNDVkTqcFhZeJj/atPKXp7Np6p0extn2
         Ko/fJrqpr14grUInFeIQ6tKKSrWWbPTRK7aVfOuJsx0/h6VdPyetkeqUi6CsLjjUdJkl
         BvlVY+/g56q3xtXQ7dmeE9sRh8IM24SUCNkfnMgeh0ILDnCoY8GkjahdLNInwygQJcxQ
         pVwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781947; x=1796386747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e9DOyZqREfCbWSQdjYH3Cx6SxSP6lHmhvZmakX1uIME=;
        b=JznTzRCweGrEJ1B9LU9N4VezLtap1PL+TYi0hIqsEG7zS2LashSE6a2qnz2mmg6P2c
         iKDumTymctCrZBXvhXFRd2e0mB/8qtcG8KMt558bcF4c++TuniEUKNbaWQKFJqG5YnGt
         Vpbk+ITDtVOQ/3/zp3m9agP9253xVXu4VGkyU/ZXzgGhBksYtIdBi74amymXIh1bFHDO
         P1I6/n/B/xttS/jcCiPzBsw3yil69h3MuPS7RcI0RfWz1Srn/z0qqRtKhJD+UeA8tjf/
         bWsaQ+86/mq1+u7vu4rBDlXigFcwGnLRMfJ3Hy91rnYD4SNFBCJblKRPtuXSlXga7tqj
         qjNw==
X-Forwarded-Encrypted: i=1; AL+hErGxatdNKNLz9JPijLjWYCx//0AYv1IEOVytCCGSaOu/GFvf215YdzdCKAlYJUWjPxNlJlKbb14Nttk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qBIsHa5rY/EONcC0Pm4bjWxzHeiykHGD9rPYGavYERiWQaBP4
	5IPLWs6jVyXM21ls7+nOpEIrJWZVWHx4uf5ju3U6wsg0KztNg+tM2mNZQ+hTbiIR8ZM=
X-Gm-Gg: AZFdTZcy4XxYWazit85WyRsz0543+235rpsio0/dSmrm5jZVrCOENzbeB3MGRz0Elxj
	AIg3H+4/SKXW+Z/8HLK4mqpxC8sxHu5H1uHLD2T5Q4V5EGqdhBev47Oh2VGm8qJf8yzvtKwsbwO
	OqWPbAG6FO3HkqjlzBcoyjezTwLQOc5096oZ42htuf3kJxwQ8K49tzlAy///S9W/KtG+AUIIav/
	mdANjZOO3z7sJj5obCgY/DwZEv4J0nuw44qMaVVOLMsB04xUsyMP5mdVXNk6sFhv7XL9V7Wmg9c
	Ht10mkDJky3i/ta7B9GNcEDFpc5ODFTFFhJZU294b5Jjcv0PD3QHeXyOySUUC93O35t9hFzggnR
	0+ATf9ug9XEsBOeTxftiRCAsHt+nAev/K5qMkAT8kmEhC+jChOSs02+FhVaznkB7m05qk28Lfns
	fGKcmz3Q7Gf911x9a8Wg+KLswgyhVrNdWPfucz5duwLfkJ747vhSfM4Rj1gVBPSp2niNLR+N6MB
	aoOw8W2vor5bKiO9OsU0T4WY81VszOirlNYoBstBAmRsOYM5XBRUl6LPX0UR/lCHRXQNDRkiBYi
	LiyliG5eWQOAoI7JWs8QXVjJC74+tgkule1TYtyGmjIi+gyNuQ==
X-Received: by 2002:a05:600c:1389:b0:4af:83ad:8f70 with SMTP id 5b1f17b1804b1-4bb88924f66mr488154985e9.35.1795781946969;
        Fri, 27 Nov 2026 04:19:06 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9065744esm373251435e9.1.2026.11.27.04.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:19:06 -0800 (PST)
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
	Andrea della Porta <andrea.porta@suse.com>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v4 18/28] drm/vc4: hdmi: Pass the CPU physical address of MAI_DATA to the DMA engine
Date: Fri, 27 Nov 2026 13:22:08 +0100
Message-ID: <20261127122236.4976-19-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261127122236.4976-1-andrea.porta@suse.com>
References: <20261127122236.4976-1-andrea.porta@suse.com>
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

The address of the DMA slave is handed to the DMA engine through the
dma_slave_config, where it is meant to be a CPU physical address that
the DMA controller driver translates into its own view of the bus. The
driver instead reads the untranslated address out of its reg property,
which only happens to be what the BCM2835 DMA controller expects because
the DMA engine driver used the address verbatim.

Now that the DMA engine driver translates slave addresses itself, use the
CPU physical address of the register resource and drop the comment
describing the old workaround.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 2cc46036f11d..9dc1a67aa7fd 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -47,7 +47,6 @@
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/of.h>
-#include <linux/of_address.h>
 #include <linux/pm_runtime.h>
 #include <linux/rational.h>
 #include <linux/reset.h>
@@ -2288,7 +2287,7 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
 	struct snd_soc_dai_link *dai_link = &vc4_hdmi->audio.link;
 	struct snd_soc_card *card = &vc4_hdmi->audio.card;
 	struct device *dev = &vc4_hdmi->pdev->dev;
-	const __be32 *addr;
+	struct resource *res;
 	int index, len;
 	int ret;
 
@@ -2324,22 +2323,19 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
 	}
 
 	/*
-	 * Get the physical address of VC4_HD_MAI_DATA. We need to retrieve
-	 * the bus address specified in the DT, because the physical address
-	 * (the one returned by platform_get_resource()) is not appropriate
-	 * for DMA transfers.
-	 * This VC/MMU should probably be exposed to avoid this kind of hacks.
+	 * Get the physical address of VC4_HD_MAI_DATA. The DMA engine
+	 * translates it into the address its controller has to use.
 	 */
 	index = of_property_match_string(dev->of_node, "reg-names", "hd");
 	/* Before BCM2711, we don't have a named register range */
 	if (index < 0)
 		index = 1;
 
-	addr = of_get_address(dev->of_node, index, NULL, NULL);
-	if (!addr)
+	res = platform_get_resource(vc4_hdmi->pdev, IORESOURCE_MEM, index);
+	if (!res)
 		return -EINVAL;
 
-	vc4_hdmi->audio.dma_data.addr = be32_to_cpup(addr) + mai_data->offset;
+	vc4_hdmi->audio.dma_data.addr = res->start + mai_data->offset;
 	vc4_hdmi->audio.dma_data.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
 	vc4_hdmi->audio.dma_data.maxburst = 2;
 
-- 
2.51.0

