Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445639;
	b=MNUMyw2d7JAbQ+wXxzhC37wo1Rf6Z5QG6HFDKfEtidNNy1iRpD8FR/vV5mYQ1tQVbfy8
	 7gf/pCbGLWG6W5doR6xY4aVeIH4TcO7XOi3He1XYunCBMQvi+bKYfAJLATzwlayglJ4g7
	 6wesfu8+URJ1cvp5QryucHywezigv/DFqX7pzlws+4ix6yOtLwQ8yFe+ZkRyBDO1oo0mB
	 U6KwfoFix6Kic57VBsFYwjvIHQ1IYK5IpCKB7uW5sRs+bDdl2JiQCfNWkKt/xeDSgACao
	 UcJgwbFLHMc7fJLzdZ0eexIakVCcaS/BCBt5Cu8a+z/Fa7PvoJR3aajK8z8NAIQPfRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445639;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=e9DOyZqREfCbWSQdjYH3Cx6SxSP6lHmhvZmakX1uIME=;
	b=KFkJADT5JikCcxu2p9x0xG71mQTdEzkpXkm1RPJAkiE7tcE6f4zWPXa5CXi8Ek9gF5Ar
	 L+aWoLlnzHIrjCm/jJZJTtVT68obEJuFHXOn69ol8TBJoto1WVOilpDfmejuoLHjrgWk9
	 Ceg2oL78itJDiFYNAM/94py2lQ5GwdzlnUX6Qya0FkpGUqHLt+ym7nR6/RcxB7Cjg/xZo
	 HVZ5c3af9qGGVWYxQCZLmNSH2SK3elHKueZRF2oRV5tx3z8pBaopvgpxA8NdX/U5V98as
	 Lxlh8B4Jlb+va7x0lqYnPIEAleEQvJ+ggMWR8JZ+dkOD5GFEz1xT/paTAmQ+98U6RhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=X8w3s+pv;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B47560A6F74
	for <dmaengine@vger.kernel.org>; Mon, 23 Nov 2026 14:53:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B47560A6F74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=X8w3s+pv
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4b467581b98so31921635e9.0
        for <dmaengine@vger.kernel.org>; Mon, 23 Nov 2026 06:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445638; x=1796050438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e9DOyZqREfCbWSQdjYH3Cx6SxSP6lHmhvZmakX1uIME=;
        b=X8w3s+pvpaCGcbWfHlueVmKlcAFu5eOTMn9IkRJ9Wv2gD5ChOcjomxiXlnm6Z6INqv
         Pl4iV+jNC/VR7ornt3rYfsMSf9Kw6E45ycHivcpMnbptH2Cy5/utWa3TwIddim9Fy6yn
         sz2rEDn0AUi2UDfK0IGudk1Qf2TMBJ0bLosL/EItDTb3CupSMVb+CznueIo49VZ6+CHi
         1I2BSpSBLJ1FdGxC+UWB5q5zlhig+u5c3e2lfUzXXfNzAL4FPp8s63OmhpgzCtzn6ega
         yZuByST9S84L5Rx7HHi6iNijVICaNtwWEHcqljiq01KfKpw0ZS0r4CYUp21XS8ASwHQ8
         LHlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445638; x=1796050438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e9DOyZqREfCbWSQdjYH3Cx6SxSP6lHmhvZmakX1uIME=;
        b=v0jpvnf+U1tYg5NZp9dMF/U9L2JOCm1wjCaICDzW15k+IEQDbdY2FkMjIt0MGg8fbd
         4d5mCGs04qlq4puD4ZLiwQ/9Po+ch4/YHd4YGaGY6yZCReox553QspibOoGT9Qmg6gaV
         l6OBlPVkN53k2eXbclszu7k2fp1FORdgUomwfeLAprhvoL+ViTeRLzklpVlbJ8r2osCQ
         Xd77sDe2fc07K71LToTgMyibSXuPkOGksbkyOiu0k2RoRr8cqwYlINykeHXIWvXawkIF
         i66ndX/D7LTl4k8u8yPaLKMCnbwKdYCqXwdK0HuEB0d0q2FHMACvE3uA3beiYKzk4VgT
         0nOQ==
X-Forwarded-Encrypted: i=1; AL+hErFjZDHymeOxCM5tkNXYLGOOLZVAXooGkWO9ETnX5/NTWet4LEQsMThhbK5ctDhPINDGu+tk08du7cw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9iUgTz/k6d3zKTA9WbBPJi7aS7gm42LQSaXAnC2xReeRU6xTHl
	Td4XMYpWbaK1f3SGNRjkdFwNP9phkZw+yhRgSO4nk2CD0zwzFC1LjvRgrmmb7KCInRA=
X-Gm-Gg: AZFdTZctLU/K4bxGBMLfodY17HIvmRuHhe6IHFVqYDfOJIKzhkokp21/TfbOml43VYJ
	8AWX+G5/zdsN4J9Q31zegfQqe6YLOqqPdTxYbLGcwWMO5h6WRpIw1qdgRwTx4KYZhsbKcOODZSV
	LFtqbnS7do6yCN+AwltBtNg7IEvmei7Y9vSw6uhY5Dk4B+xxj5BAHggLJH5PP9l3F8D1cqCqLuj
	hhVmPqB4DmnpP9UMfjScTJq6nqOoHQ2ZzgwRKZ78OoW1QPOHeE0raY222aNTAQtOvegBVg1FiXy
	UObNpDJSA0MMmuZPXfmst9O33WrIP/0oRHXbQAtbTgcWWzYEVOesID+5d3B6g9h0mxeVDBVdwkk
	OBpTndjRG+M6RrcZ6h/hOabtSKTynzVKVojGZA2z6z2BD673T8fJzZhGE9lkBaPDwX31s0i/hNq
	8GgpsGMM/wEv+lmJO1F0zKmjDBS5wrCvv9vd7EvIeKGbHg2vjkT1Apton343GwtfpONm72NG6wG
	xnhGtM/osWtRgB7K++bZjg0gNTqSPYhYiXU8nde02AbEMqCdu1b7v5b0Sco/RkbaRFcO8eAJbn3
	8A2qR+fjOx6A8kFB/18nEQMYw8U=
X-Received: by 2002:a05:600c:674b:b0:4bb:6947:3e1d with SMTP id 5b1f17b1804b1-4bb8892c0fcmr226742705e9.20.1795445637861;
        Mon, 23 Nov 2026 06:53:57 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8526cbd0sm469509035e9.0.2026.11.23.06.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:53:57 -0800 (PST)
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
Subject: [PATCH v3 18/28] drm/vc4: hdmi: Pass the CPU physical address of MAI_DATA to the DMA engine
Date: Mon, 23 Nov 2026 15:56:56 +0100
Message-ID: <20261123145728.29082-19-andrea.porta@suse.com>
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

