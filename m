Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794366919;
	b=JKjCg5zQxMbtyq3BoGB5pmnWyylb38MAE1UqR9beXwnac5FAHdxvUPWYtvifRy4gut4i
	 gRWxQlGq/M3avkvv2l/A1OQFUpcmLoaLKV5hSjem4Gi2yrUnxdXNfq7QnTwPSm/HF90HI
	 TBsyaCSq71FzJaferLmK+w1mfmRTIN6Muvg6PYoLRfRRYAgBMcs304rRiS/bsdnM31N1S
	 OXaxmwwJ/WWL6HV1e82VcfrvJf9kTbLGCowmnqgUwct3+JH9EVd791KX2dhbtNVBsaWrY
	 Ivsn03pLWdv/hwTp4aYsxJn2Yldj8mLcirdH5vtVm30gnmE8C4BXlp9b/8H47jJE/SA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794366919;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=xNfeFAhewK30cMhIlYuw1thd6KiIfjfyu0K7WwqCHvM=;
	b=gd4JEu0u6nkp469xGhHXA7GSBNwCpRlS379tbQVnNlItpsqVPmKZaE2TJuTeENtB9w2T
	 YVlQJHBQx3bsvEBZnsMxdIeQ+BDV5Awhw62Rg0vxAfdE49JM2LitPFCkgXCtVq9wwCpv6
	 M37TbvDQL66pKuauZQM5CxM0B7GpSAFi9k4D/kr7BE0zC1ciB9kpMD8+GgTMmCaul0HFI
	 lbQrdN5/v8uC8IbpvlQnQO++JDJ52puWSJ4LF6V7rDBzKVXW6c0VqBAHpncGoMyzWWX5G
	 OBtg1fJiWRH9ePwKBqMQgFPRtJrMvpEyPvxtA0pi5zlDvqJfr27MYLJfgYU988qg4lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bAXbaY1f;
	arc=none smtp.remote-ip=209.85.167.174
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E26606A332
	for <dmaengine@vger.kernel.org>; Wed, 11 Nov 2026 03:15:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3E26606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bAXbaY1f
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4ed6d69bdfaso1687337b6e.3
        for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 19:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794366918; x=1794971718; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xNfeFAhewK30cMhIlYuw1thd6KiIfjfyu0K7WwqCHvM=;
        b=bAXbaY1fqjx39f3SUdMC2J3pHKYtYCin5S0DQBWyHTM491GWOKpa7aES29NJP9yUva
         tf2RSMf7dGOOraZFeDU5dfQYM+QMTwVy0cMCcEHtu0lzwEL1bK+ojIbZD3h7I2Echid9
         7zt7gx8EDSbmc3MF1I00A3jlVd+f47Kf6yCAjGzrdiPlXlNnD9fOmfBgLT2o8nGIClwH
         60IfHN82xaTGQFw0YYkBulu1uMz5z2VgIhWMtj9g9iljXWs14BIjPsx1YUynmzxm8geq
         G3okIjI6eQqio+aXcsoe7DR5r/Ql0tVhf86rDEf/bZG19lNkFaNmTo5tC+ZLbFqTFxKi
         gPyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794366918; x=1794971718;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xNfeFAhewK30cMhIlYuw1thd6KiIfjfyu0K7WwqCHvM=;
        b=tZTsAKs7+dkSpLkkyjyobnHXsT4BwkJQaSWqpXY/EvmRKj/KGeAWaP4ngo6rl3DyPP
         BFWQyv4eR8OtEMfgdB6+aonnKeo8ET0Ooa7Kr9bmQZrf/rNbA6sGPrcZHHM4PfYyiKxL
         Lm8hFW0d1SIfsaZhvKYf+lU8zv2ExoPo+i6IL7zhu+ibLFon0aIHOrw/ZMuN8whSbLgZ
         HwCd5MBIdH+1ylcuDWbhXQx8ikXRMVuqBBFjf/L6XYzMvp8c7oP3gNyjMJ0lJV91kYnd
         GmbEagq940xZAC7FjMffOwRh6qhtu0tEYIifSPG0hucFo8BDh+p36w0hq+HNs4AgvEHY
         lEig==
X-Gm-Message-State: APuU4Z8ncylqGJOGlosyAdovGy4y9k16tBGtj95/eoIfRLr1iOkFL6vN
	CGhLP84QdQZ7w6AMJJX7Zc7kwzWS39T9RctmKyipTP/UtnbYxljl+oLi
X-Gm-Gg: AYBFou1+hG8qEmqDDS1GCDRQfTDUewxQABXNm9y2o0s9AEpI9sb0p7ODqpbpjqh1ZKY
	vyRbiseWLZOe6s+xneXWDVflPoVZx/PXi/gFx+UEDKfpzh+0z/sB2M9eL+xhPtCddlBg/1863rr
	OLXHZZBcju4aeZIE9xkJlOGbOzmfRzhjXo6ogxVRyQvaGZSkdCMPcc4AlQZqQl60n+74BUcD51a
	7evFH+ogxqg300Cm1WzAA9MLhBBxAwLfT0BmkVXqbPJvUwxN59YWFqGCF+k022ie4ZLP+mLJKRl
	P3Bi56pJtAV/kzoV05IfxfOVnR4jbjUjH0KeVhHJ2J9F61gwFBeJ1LSVuGonCNZCbLNfAKfAn7L
	9ytcMKMSC/f2W+tJ23wfetirhMC1Z2oxqSfXafZ9eixi2Qx1BKrfPW2pN6lUEZkHJ/I7VAUHR1l
	JMW6ftVV8ZaotzWIentMgMwqDcDZGyb5tbhr7YqWbDWwpmu5iPEaLNXr1xU8FuJ3LWZXISWnNy8
	hAZ4zmR1tN7h7tqFgYqekOqKlXar18AKbiMFaChHsoN/gx/KXuilP34YnkbVdYsDD9/RkZQ4DaR
	uEX7wjQTdxJ8AmhFpXxBNX25dQ4+B6CdFgoLFaZRnVIo58g4VTwlJWWONNyn6nqIvH4ZHh9UthW
	/8YG8M056SsQo+YfABD2JS9voBvgMqjVbjnYWhgoVPa1iJOlJn7EufEhOR2HR6V/Ai7kmQw/azP
	tupselcUPpnXxl8YvQEOLdDsRD0qWyP/PCYJUVeQJ68It+BGU887E=
X-Received: by 2002:a05:6808:1a10:b0:4b9:e88f:89dd with SMTP id 5614622812f47-56b970ec98fmr844578b6e.43.1794366917929;
        Tue, 10 Nov 2026 19:15:17 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm3999345b6e.3.2026.11.10.19.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 19:15:17 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 20:15:12 -0700
Subject: [PATCH v3 1/4] dmaengine: dw-axi-dmac: poll the correct enable bit
 during termination
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
Message-Id: <20261110-submit-dw-axi-dma-stop-pause-v1-v3-1-35fdfba8b61d@gmail.com>
References: <20261110-submit-dw-axi-dma-stop-pause-v1-v3-0-35fdfba8b61d@gmail.com>
In-Reply-To: <20261110-submit-dw-axi-dma-stop-pause-v1-v3-0-35fdfba8b61d@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sergey Khimich <serghox@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2

For channels 16 through 31, the channel enable bits occupy bits 32 through
47 of the extended DMAC_CHEN register. dma_chan_terminate_all() only reads
the low word and tests BIT(chan->id), so it can conclude that an upper-bank
channel has stopped while its actual enable bit remains set. Descriptors
can then be freed while hardware still owns them.

Poll axi_chan_is_hw_enable(), which already handles both register banks
and the smaller channel layouts, instead of constructing another mask.

Fixes: 495e18b16e3d ("dmaengine: dw-axi-dmac: Add support DMAX_NUM_CHANNELS > 16")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index 7520c78f55cc..2c2435c36ab7 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -28,6 +28,7 @@
 #include <linux/property.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
+#include <linux/time64.h>
 #include <linux/types.h>
 
 #include "dw-axi-dmac.h"
@@ -1181,17 +1182,17 @@ static irqreturn_t dw_axi_dma_interrupt(int irq, void *dev_id)
 static int dma_chan_terminate_all(struct dma_chan *dchan)
 {
 	struct axi_dma_chan *chan = dchan_to_axi_dma_chan(dchan);
-	u32 chan_active = BIT(chan->id) << DMAC_CHAN_EN_SHIFT;
 	unsigned long flags;
-	u32 val;
+	bool enabled;
 	int ret;
 	LIST_HEAD(head);
 
 	axi_chan_disable(chan);
 
-	ret = readl_poll_timeout_atomic(chan->chip->regs + DMAC_CHEN, val,
-					!(val & chan_active), 1000, 50000);
-	if (ret == -ETIMEDOUT)
+	ret = readx_poll_timeout_atomic(axi_chan_is_hw_enable, chan,
+					enabled, !enabled,
+					1 * USEC_PER_MSEC, 50 * USEC_PER_MSEC);
+	if (ret)
 		dev_warn(dmaengine_chan_dev(dchan),
 			 "%s failed to stop\n", axi_chan_name(chan));
 

-- 
2.53.0

