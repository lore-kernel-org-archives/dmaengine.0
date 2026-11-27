Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781935;
	b=iY79aChZYJAE8yFocc7YfrpUqT51mgn8p5+ob7VGHY9EVFZCuLSPvgl+4rrU41lYme9E
	 O+ShPDJA3fC02UL2serseiZI6hYzTExaFNVgvLtckTCMl90w3UGhGLcTOEvCfI0HhWVR9
	 uOc5Jt2w7utp+JxyYufPXrmMpKkMaDwTc7XEqHdM0CDHx8SduJiKBHYRGLeDYTblD9yz5
	 FIPM4iRWcYUAFUgV0J+0kFuUfRvZTg1IE1uwV3nDiRFVwyzlfL4BLTy51/3e6ergE4p9C
	 JD46Tqz0PBVOY67YvvRu8w5WdFJLHRl2knUtEirH27YDS2q69gt1okp4s8e7c9WJCNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781935;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nvvEuWhQRTxmdar/fCUOSARTg5nDRBRjuSNvJv1P61U=;
	b=DeKpMUJvnMtJkPuMnwAZuSrrTJGXX5DBjde6SvdD8VWhvoCR7x+RBL7Nz5MeDzJHAvy7
	 Zt2iw4piQXBzRywBnvY3DE/13syOq+Pjg/1RA8VygsyrjxjIx9ZCbLrbG3fajzwBb/6K2
	 a9AktwHYYEUVgunGj+GFJbOOYWur7468+nlJtby0qaMwIyQGXmyM3ABuFfm4y4uICj+DN
	 WsE5sv3lAVQ7ZAe2381n3f6qAtKkmqq5NpHZ22AKMQOBO7t8tfreT1wnlbMIJ69My6ssb
	 yFm/DUhWk1G3zDSFZiqLBGR3A/eYtjtDYbpxBOyNR9L9uE6DK55LPDHK0mD1UCeylHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=fX9B0SIL;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAF960A263C
	for <dmaengine@vger.kernel.org>; Fri, 27 Nov 2026 12:18:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAAF960A263C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=fX9B0SIL
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso3649703f8f.2
        for <dmaengine@vger.kernel.org>; Fri, 27 Nov 2026 04:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781933; x=1796386733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nvvEuWhQRTxmdar/fCUOSARTg5nDRBRjuSNvJv1P61U=;
        b=fX9B0SILmEh8F76TCxRPqNwZrOyG8r32Icr6Jigt2ztTYcXfaXHVVPSBDvjJZgQZZa
         t4KeG1rvtDeLvUYLmgayXGG/12HY8RMXbjutqr7DzfaPG9wufX8OjNpK5yFPkZnX0JuO
         6S1WbElCD0q856RYuLJtyDTKdbtKWG1jZCW2bd8ABLM+2wVEQbHdLxvnzkxkXgVt7bvs
         8VdkDWY3Oan1uTdIHSuimSBVUfDRbejgPhL7Rp/Y2gJtlinK9TkHgSXa+uLeaxeJixVY
         2fRwNS+hPlYgNecjc+GXy4RIA1q6gPSjQ99s2L/zM6+HGIhhE3Jg3TxG1619W3Jsug16
         y6QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781933; x=1796386733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nvvEuWhQRTxmdar/fCUOSARTg5nDRBRjuSNvJv1P61U=;
        b=c6rdqo8cELSq7nlhdADxhoVpeWO2iZr2cRLmr94gCjr13JMXL5izkRvli/mPlYHHdv
         oaBn4VKxYiBkSCrvgBp5CXCKTjjOHmIJ0bwtYWlqI1N97v8ALfCOzQN7aHsfCpXB/RR9
         6jrkAjUO9wAZ7aWIx62LtAU2ZhZP5a3EybnCDr+5k/dMyhAtdwb6DOF0otCOyQD3qHQo
         OCB0j3K64njVeufkbV0pkfcCYLVeZSZj5KDqXHfHUfxaNCgXbMQlFXtMWsMJhZCzFiaU
         9ff81/oh1sV4k0zGzAyZ7VUhCEIMYQh6it/jqdgY76AH6lDdKdT3PsgIQ9R8cIsDGeX0
         bZwA==
X-Forwarded-Encrypted: i=1; AL+hErFR21dHjou4fTVURrPPulnVnOLph89jlH2ETmOHEstlagykZdtugxqT1iZruVWVSFGNT6QXpKvLXgc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+l3kMfX8DOQP+uXtb5MbiQz6zw2T254mzxOapXJUDlM8Be3fav
	p3iqAfjMSIAOoxC/pNwiiSTivGeUJfwVELjx/0uA9Lr+o/6mVN1oHIJcE4JZUvR4v7I=
X-Gm-Gg: AZFdTZfYzVEhLXuDhsm3HcQxcrVoNorroNnu3cWZD7Atcp7dXkc8lLFTbCJPdwgtCFM
	goUM/Az9wbktkCXQClQAxWU2W2wLS79zhhZ8tj45GlqO2QxD6FKuK3je3D74t77WzoDaxc8ittr
	KJbZrTXhBr2Hz+C2+3wwUzsGvvOf8M2EttqXsy7vhor0sJrb9LEn/wFhCs9XD7vnduiZKjvM+gO
	CgXOLnJbbNVL7QUG+7kCyuKnJiqckliuzufT8pEhMMKQjA0VWLpKqoTip4hVcqKdQFR12GCnMSX
	zS1FPLRWx72F5tkjiNS5rCFAtorw3Hktv3GEXqubRZXowsvim7xCLmkK10cf6HNk8dCRpS1ukym
	vlL0LzWXTMYIUt0KcjnaEKEqUVk+2+ZoMGEB9n7VKnwPFVHclekyKzj4KTVeIY6UWJ94xnw+6l+
	y/JwlQjc9ohJ7C5QL3gCBhUe/OJJmiOuDQN8K3vaowgjdQAppDEF+xAJbJ33W9Khbgj+O0PjEFf
	HmnbSxcwMZKOIhw5e4C5p6mQ3/F+KkzS8F00DGTKdVi93u/CzorX7MLx1tTzADrvsVt6GOGQrlO
	k7HkZgmVeZu7030Bu649b6IGET1Q
X-Received: by 2002:a05:6000:4028:b0:4a6:bc53:246c with SMTP id ffacd0b85a97d-4abb3956374mr49731029f8f.42.1795781933498;
        Fri, 27 Nov 2026 04:18:53 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110ba3sm38491893f8f.35.2026.11.27.04.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:18:53 -0800 (PST)
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
Subject: [PATCH v4 09/28] dmaengine: bcm2835: move CB final extra info generation into function
Date: Fri, 27 Nov 2026 13:21:59 +0100
Message-ID: <20261127122236.4976-10-andrea.porta@suse.com>
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

Similar to the info generation, generate the final extra info with a
separate function. This is necessary to introduce other platforms
with different info bits.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/dma/bcm2835-dma.c | 32 ++++++++++++++++++++++++++------
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index eb306397b0fa..0ba23ec6b6fd 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -255,6 +255,26 @@ static u32 bcm2835_dma_prepare_cb_info(struct bcm2835_chan *c,
 	return result;
 }
 
+static u32 bcm2835_dma_prepare_cb_extra(struct bcm2835_chan *c,
+					enum dma_transfer_direction direction,
+					bool cyclic, bool final,
+					unsigned long flags)
+{
+	u32 result = 0;
+
+	if (cyclic) {
+		if (flags & DMA_PREP_INTERRUPT)
+			result |= BCM2835_DMA_INT_EN;
+	} else {
+		if (!final)
+			return 0;
+
+		result |= BCM2835_DMA_INT_EN;
+	}
+
+	return result;
+}
+
 static void bcm2835_dma_free_cb_chain(struct bcm2835_desc *desc)
 {
 	size_t i;
@@ -659,7 +679,8 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_memcpy(
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
 	u32 info = bcm2835_dma_prepare_cb_info(c, DMA_MEM_TO_MEM, false);
-	u32 extra = BCM2835_DMA_INT_EN;
+	u32 extra = bcm2835_dma_prepare_cb_extra(c, DMA_MEM_TO_MEM, false,
+						 true, 0);
 	size_t max_len = bcm2835_dma_max_frame_length(c);
 	size_t frames;
 
@@ -690,7 +711,7 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_slave_sg(
 	struct bcm2835_desc *d;
 	dma_addr_t src = 0, dst = 0;
 	u32 info = bcm2835_dma_prepare_cb_info(c, direction, false);
-	u32 extra = BCM2835_DMA_INT_EN;
+	u32 extra = bcm2835_dma_prepare_cb_extra(c, direction, false, true, 0);
 	size_t frames;
 
 	if (!is_slave_direction(direction)) {
@@ -738,7 +759,8 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
 	dma_addr_t src, dst;
 	u32 info = bcm2835_dma_prepare_cb_info(c, direction,
 					       buf_addr == od->zero_page);
-	u32 extra = 0;
+	u32 extra = bcm2835_dma_prepare_cb_extra(c, direction, true, true,
+						 flags);
 	size_t max_len = bcm2835_dma_max_frame_length(c);
 	size_t frames;
 
@@ -754,9 +776,7 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
 		return NULL;
 	}
 
-	if (flags & DMA_PREP_INTERRUPT)
-		extra |= BCM2835_DMA_INT_EN;
-	else
+	if (!(flags & DMA_PREP_INTERRUPT))
 		period_len = buf_len;
 
 	/*
-- 
2.51.0

