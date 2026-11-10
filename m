Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794279971;
	b=Bx1D0xaJZw71/n5gz9/SS89hpT9eoCOhcpdVDCOJdQa6l3gm1+RkmJfixvF9PDON+k4R
	 vB9EyL5lEhzqe1cmb0ofWqf2fUqkdsf41h3YThhzEMhFHolmxLbbgm7O1s2y2dGAz+DJ3
	 fbfZfvKvLB07U6IbaiWsYqc6b64NPtUtIEKOxfvzP1ELiIar+U1hl5wJHh82ata4kaIMm
	 IELiqgAfWbrutq/ycBe5eQQ8pW5HHJaud8SqmxrhQ+5CO2vzP3kqzJ0BJmnzX6OP80YuE
	 rMypad+x8cHvCzC3aaE1wpv/vlO5Ml6d+qGGgXceG1dvcW1U0O2Q//JFHXnJa71fpOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794279971;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=Ug8MJwHaWSiOw+BHVNavljfyb011DwYiwgVO7CXvMeM=;
	b=ISZDFzkgtXWHj0zc9D75Zo+HZETuSlKC6G39R/2mPV8IM5v7X7/E5yUCfsDH3xexhkNM
	 zjX9NDzuPuadPRXkSxOyF0Onx3azaBXx7nXSqDrJK8pAcYw2k4E2EVvwnEXnuQgud/e52
	 ohRU5rkEEAzoMQ6jK6s1n6vR21/1zDpMc3xr9pC/SLCgk4uJUDEN3rk2FYeWlIsBPhBeP
	 ZCWq1gDq/qeHN1YuHWijfRcvOzVYO1WPAfcW6LoTibjrCvBAQmuVRV9LZ3CQ9Hxtr0yk4
	 XaMQYHteU6IuPkNSRUzp6d4pjqzAyav3qoZMa2vZa2ZjhUvb37ldbmF8cjg+0rqTy1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rZyMi+v0;
	arc=none smtp.remote-ip=209.85.160.41
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54BB5606A335
	for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 03:06:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54BB5606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rZyMi+v0
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-4a71d0c4233so643151fac.0
        for <dmaengine@vger.kernel.org>; Mon, 09 Nov 2026 19:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794279970; x=1794884770; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ug8MJwHaWSiOw+BHVNavljfyb011DwYiwgVO7CXvMeM=;
        b=rZyMi+v0oKscy2pU4t8gYjWoNwxZilFVMTHC8+tcJcyZostJ591xlb+hLBeDrb/THp
         iYDmv+BfCrhxV0+XlJb6dBGMocU6QxVeETOJTDH70UInX1IQ7q5R69IKrYJJ2LmGXl9W
         6qyWQJcIN7QDkfSkj8OcKzRV5WR7qvMqvyyUUce1rd5q2KfBePo256DE2O5tS2wrB5YR
         Y2vzT6K90SQdl+ejItDiZR9InYP7ZpUZ01irosYt6PIIwjnFUs2vTEUIx2nMul9BlrIx
         0SqpkS7++Xapujd4kghet1dc5y/K4G1sxwXwD8hJY5cR7LiOwsa9tKwkr6VfyMjsS+gP
         PJMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794279970; x=1794884770;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ug8MJwHaWSiOw+BHVNavljfyb011DwYiwgVO7CXvMeM=;
        b=R6pei/brRFinh/TGThtsRaPDgVaM0aUVu3IR7fcDTV94xO656CnYjJn8AQK7Ld5jEp
         6d7FVslzC8VOzXSVCS6fNWbrkKsK8nkbXcRcNlcytAigyfRdNxC9aJGqHsE+N9tj0DV8
         4CYHxXQ7vaPrCtppVpVaxAppXgMpw0ZiUfVOepJFD1lkUYm2Un+K6yLydMQVTvrqNGpl
         QfpHQsmwIR1GmKK8SFiwjeuyhONSA9wLbAMlP2e0wbK9lZRoEyGKcXbRaZEBpzkfzhfv
         ZGFcfy/fNyP/ihdTuJn4iJfTCUm4npHD8w3V4pKvvwsIUNpPVbOFv1fg2yqGCkOhrykS
         WmDg==
X-Gm-Message-State: APuU4Z+kXsSbaQv6OYQT2ejQDkCFfC39tZEHAxIhBTsN6bsxrI8XL/Hk
	12KBysdQgipRdPIyDcX1aHnNFBX14OOUQ/CKa6Fo8soLdukY6cVrRbGm
X-Gm-Gg: AYBFou2UftHbTWIq9Gn4yXxRcTTwtfKMqHIv6Xrww1um7nI4n4yeASOULlOZTmtnVY9
	2jdyUTBUWxxTg4+/MZQAosQnxKoG5tHcoHoJ7A9VdMmf4VS7IyXGfY51yXd8vunzWkAsG1wkR+2
	h0D2x+9CpDTW+CC0hVu/bGyUOnqrCDLXEtUKQMP0S28455kR4YK4gAp5hG7XfwJsnQ5rqjCGrYw
	r3K69UlJT64NQqQ8DyleUN3orrcQJwvrCI8tH48+ideqm0WRTznP64poY11e1iowzTZg1VjDgAx
	h/EZcykgssN3TKmatnfYSSyep9vvNM0GX1DR8VIEuzk7SiOHXgOZBrhWmDmI2IW2FVP1xROsh/C
	VX7GpTynavTKUUperT28w4GUaXhnM0jBhvMR8EKb759enijgwcLo/qQhqykXrSvyvBDnPXSOVYP
	mfQBjrEXYrFiAfDVDUlAnqjYu7OcVR3VJOEOhvGSns/3RXd7Dguazd4mpMvZt72aKixYNpZ+Bm/
	6WTk8lK84dGEZ47qE0nLARcjxAr5ZcJOoBYNqlx6vb9qH6SEDClsqvZUWFgCG4ACnJz0N8pQi6M
	RSgXTONBKpC16IuYl0SUugFgiC/acsprgfBXwk7eplDiZxJyQ9zl4u6Ahm6SF9sLZ8mQfqr0V0w
	8uSBIXQ7F75MPE6B3Q5/AFVHrhSA/g6zP7nLfGu/HUr6rILg1F9TfPdOIK/8s6qbqcI1dO192li
	zajIg1a1udohk51nofss3lerlbWwqAXK0D3erYOXNVtrpNPt7ANhpVOw==
X-Received: by 2002:a05:6870:5ba8:b0:47b:7709:5568 with SMTP id 586e51a60fabf-4ae225909a7mr825584fac.10.1794279970242;
        Mon, 09 Nov 2026 19:06:10 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ae22fcdc93sm683389fac.10.2026.11.09.19.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:06:09 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 09 Nov 2026 20:06:00 -0700
Subject: [PATCH v2 1/3] dmaengine: dw-axi-dmac: poll the correct enable bit
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
Message-Id: <20261109-submit-dw-axi-dma-stop-pause-v1-v2-1-64adc48df793@gmail.com>
References: <20261109-submit-dw-axi-dma-stop-pause-v1-v2-0-64adc48df793@gmail.com>
In-Reply-To: <20261109-submit-dw-axi-dma-stop-pause-v1-v2-0-64adc48df793@gmail.com>
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
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index 7520c78f55cc..457ab9c47ceb 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -28,6 +28,7 @@
 #include <linux/property.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
+#include <linux/time64.h>
 #include <linux/types.h>
 
 #include "dw-axi-dmac.h"
@@ -1181,16 +1182,15 @@ static irqreturn_t dw_axi_dma_interrupt(int irq, void *dev_id)
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
+	ret = readx_poll_timeout_atomic(axi_chan_is_hw_enable, chan, enabled, !enabled,
+				       1 * USEC_PER_MSEC, 50 * USEC_PER_MSEC);
 	if (ret == -ETIMEDOUT)
 		dev_warn(dmaengine_chan_dev(dchan),
 			 "%s failed to stop\n", axi_chan_name(chan));

-- 
2.53.0

