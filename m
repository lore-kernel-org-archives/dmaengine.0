Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781932;
	b=18yhZMB8jkHsW5/guGrfmGppiWv2viYn7M6gq4b4r7+H9mhaQwrbtJNQ7xYKv6Kh1VI5
	 sFRV+fUB8wcjTDb+AKWvwOHkel2lV6QgeG8kSdxe0Q0RCZI5ykobii3qSSZAEezO0jIme
	 BILxXKkCn0dBHgymuYv2lSCryb9zr/J47usQfmzbGWn+ueC/q4JRVKAwXor3D14rzFW8n
	 EKYE7VVIpv/auev/oP1YCaPtjKfx7tqfPJM3zhot9HHSFnkEL0Pk6KAO+R7XKERkef9rS
	 fH2Xr5QpUoURRNp1iRLFvxYad7ArCQtnqis4AJXzHb2vYca5K1C87MjpXLtIj+WqUKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781932;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GOyuBOF8a8yZZPK9VBtSqGhwfFQMXh8N+abb8hJTCiQ=;
	b=DFqqXgaez/QQ79sOVe1wgmmAtRgFcT55raKWC6u3lutAU53vLD0HDsQVXT0vw5KnleAH
	 KTOOvr1cjfNLUKN/CJAQBWmlJdYbUZdJQ801OAe/Gbsk7lTgY3J7oKdNVIkq6yf3NNSoH
	 LpRS2zt09n6m7zQ5PMgu4Lo2IAHbNhPetkMepSAnL/945NgSKSsHMG5uelAzmf1TL53dt
	 YstEtWZ19HnjQjZW8Zjahm8m8GqTRDsdrntyW/axsXftJPusfDxH0N+0Epp2aREJF/nDW
	 RMOzJkSOVMy5mT31Qif10qqOI9agdFwa402V6TETkUiKPBXMFKkzEYckIEcbW/Wc/Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Bk+dQz1R;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A15760A261F
	for <dmaengine@vger.kernel.org>; Fri, 27 Nov 2026 12:18:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A15760A261F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Bk+dQz1R
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so5033617f8f.2
        for <dmaengine@vger.kernel.org>; Fri, 27 Nov 2026 04:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781931; x=1796386731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GOyuBOF8a8yZZPK9VBtSqGhwfFQMXh8N+abb8hJTCiQ=;
        b=Bk+dQz1RJPEOaU8C7jk7QY1K0V4efd1qfGIPw9Av/4rR4y7jiJ4BLwJP8RiG1psv1E
         WXOf8wVGNFLuU9gB4R2mIP9iwyYHCU4hkKwDgXn3JwZRjZJW6uC/zpHPkt8dfs9vY+/1
         riz6B56rTXoKQdqamDsJL0xTemfdXo552kxQ4bhVhCLCP3ZEepkpMwPI76wFFBQh1c3i
         vqbrzbcN82w82Kf6b3E4Fk1leYxZ1D1FCJKDFlIs+3Du1RAldh4nstao3hq/gW6k+eTH
         1FNgVUn7CDCkiDWZXwMQcBFLULXcZ6b+R4smw7Ca7+lTHi7w7t7U9uSc+j1+4KczAmDL
         YxNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781931; x=1796386731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GOyuBOF8a8yZZPK9VBtSqGhwfFQMXh8N+abb8hJTCiQ=;
        b=el3msMtIZVPOzxPToQfCDTIcdsfCkEg61gIlPq4Gg9Eh0zbQ2NUimw93dp9TITdB9o
         KZf8l8jWJp6HLnxmYeNAY2+LlIl6KgMEhnlzzxX7JdwbIYNmMUbPKaiA3CNXBsIaITgp
         mwLREGy7qFPI7pEm9rXuMJjDSiDmzi7lomnVXu6YVBMNot4dOrQ9JNJ6lWlbsfkg8i0A
         ftizoczl84WxZCo0l3c7or/PKXipjnNw5h/SNNIMmqqnfL8Ihjjc0Uc9Jnsp9Tk6C2Vt
         sCIfrY8BOPV0KzfyViYYBiatWQN6g9zeKVy3EegCR9ck855OR1olybjrESaDoIk8bPwW
         WCxQ==
X-Forwarded-Encrypted: i=1; AL+hErHxeuLmjZBSvmJsGH0FFYNU15+GoABXiXWx8v4wCCFnqZpz07hVSqwqzs272ox1eEUq+qK/sYphOSQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9jr06AlvnWruKIl7DglNEYMvJIeIqPiV28565zgqhtKOHxVKrw
	i7IOTIzC0F2M8WmtptjZGx8pZw0MKyjlilDPD3zJXtFImrvm7eaFyvxGkaaLkmkTF1k=
X-Gm-Gg: AZFdTZemz49e3gBxw/bWy9peQR+BvihOdkikJ4NY/or4w4/p11Ynbs0kAtRhRd/H+h4
	O+ZjVG+9iYB8aMSeDwcdc/Ivc4YT9iPQiqRUtJF3K2hgPPuGuT6tTcuFmb731jayHPKlNGnH10C
	G6NW68CRybesUlhqgWS6EycaPsfE5K6TV9tjTPknyKI0ufLrB8nAzgp064DYOUj80rbn0b3pYQ2
	EMPNAaRhqkEsKEd9JB7Vkafs2PSXmEh6LizQTJE1gmMHU/7Xpjcxd4L89e9q8w3j76JYLOqCksk
	uPZkKBcBpusd5gYv2+mFtLofkT3Ho3/YP4cEIzX8qbTPPC+Be5hloST35y0TgBzFf8kZb656hGQ
	sExvJFAnSQBy7UcULXPQMDIUmNMAp+8WvB9bCKSOGeKQWgaB4lLznwA30FaIcDvwV9m2WS+/fQN
	Tusp2QDZb8ujq/FT42EsJ1abjcdCsOV+Qlklw4GtzCZ5NjImyG6yG4D2A+EuyhQOe02YJTRlBVW
	Uatis14fbHccAes0paXjcDNJuFKTklUHQ9bAEhnILcTqaFfEDVVIKCiXlnW4+ZYI8lqoJRSK3IZ
	EcQ5X2nEAGUAcUVhFvsqimzXXkf/
X-Received: by 2002:a05:6000:4616:b0:4a8:cf12:6f34 with SMTP id ffacd0b85a97d-4abaab6318fmr47199743f8f.4.1795781930826;
        Fri, 27 Nov 2026 04:18:50 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4bef07f9e0dsm3453019f8f.53.2026.11.27.04.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:18:50 -0800 (PST)
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
Subject: [PATCH v4 07/28] dmaengine: bcm2835: Support common dma-channel-mask
Date: Fri, 27 Nov 2026 13:21:57 +0100
Message-ID: <20261127122236.4976-8-andrea.porta@suse.com>
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

Nowadays there is a generic property for dma-channel-mask in the DMA
controller binding. So prefer this one instead of the old vendor specific
one. Print a warning in case the old one is used. Btw use the result of
of_property_read_u32() as return code in error case.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/dma/bcm2835-dma.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index d65a93be5fa1..d2e000e94347 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -982,12 +982,20 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
 	}
 
 	/* Request DMA channel mask from device tree */
-	if (of_property_read_u32(pdev->dev.of_node,
-				 "brcm,dma-channel-mask",
-				 &chans_available)) {
-		dev_err(&pdev->dev, "Failed to get channel mask\n");
-		rc = -EINVAL;
-		goto err_no_dma;
+	rc = of_property_read_u32(pdev->dev.of_node, "dma-channel-mask",
+				  &chans_available);
+
+	if (rc) {
+		/* Try deprecated property */
+		if (of_property_read_u32(pdev->dev.of_node,
+					 "brcm,dma-channel-mask",
+					 &chans_available)) {
+			dev_err(&pdev->dev, "Failed to get channel mask\n");
+			goto err_no_dma;
+		}
+
+		dev_warn(&pdev->dev,
+			 "Please update the DT, replacing brcm,dma-channel-mask with dma-channel-mask\n");
 	}
 
 	/* get irqs for each channel that we support */
-- 
2.51.0

