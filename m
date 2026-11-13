Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794562603;
	b=KOeWpyVuGs7As0KYwB4GFyuByFifn3H3GtqO3dIUTxHQPRVbaJAXJwrMj0s3eIh+k6yl
	 PtGBJcPyV79r3KRR3HFNhRxvRg8IM/zRplFJQxKGtMzc+wcD0E9WGZ76dui7kl8yyHna7
	 etYja5aT8u5oga9m580SjtCLWgAViJ9Axvuw6zk07HX/vLt7bPDs4mJK6d+94MdWpJGCR
	 vN5H8NajkTnIVOUQDNgf8RHLrCz3uabca/6RwwfofSx1uuidxW4iv/wHWQwamVrEWv0QQ
	 SAhX5JqH/rVhNUUPbLtngsQxZ5zqo6t32lLhgERyKy+gVC0jEKTMNOKkndYNSZrIJqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794562603;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=AOVjVYWiGu1+2CTZWPQd/l37VMMlzCbF4uz2qUZJc8U=;
	b=lpHrWxvqwd0gyQvogM7mtx11mZUo7IXdJyz7vuWse2/jojKrgKwDgGD+p01fhPKBvgoz
	 sA092TUAzalJ98SgceFEvlKgLkImnvaekGrTWisLHRY5bsYMnQNALv2WLYv0UpnfKBfZb
	 Z87l0u9+x1BJL6PuoBw7MlwU7onpMWPpUPP2PAAAzy1WWrYNUT1W/752TLiLWiPBhj8Af
	 CpSP3i71DuskG6XZUFTJAGIAs9li0QpAHCF5nLqL6AHSuMiXqMsGlCYjHInGBn0PJQ2J5
	 KCKb6mhHStKwcW3OuFatl70Tk8VoS5sxDxbctkYcuwOVlwj+CeC+UVTswQTRR8qhYvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YZqKS8CO;
	arc=none smtp.remote-ip=209.85.167.180
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF550606A8AC
	for <dmaengine@vger.kernel.org>; Fri, 13 Nov 2026 09:36:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF550606A8AC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YZqKS8CO
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-5641f26ce05so833012b6e.2
        for <dmaengine@vger.kernel.org>; Fri, 13 Nov 2026 01:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794562601; x=1795167401; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AOVjVYWiGu1+2CTZWPQd/l37VMMlzCbF4uz2qUZJc8U=;
        b=YZqKS8CO+L47qI+y071rEAYWsqn8na8lPqPIfRIuKVIskEb0dO8N2TTSUgOKp9OHMi
         dXOJjdntFBfJR9n/mWYCP2y3k+NFaz8kz3cxsxurmXBbaqQwH6PHFJuTuP8s+5dlBA6m
         VezmHGZCz2/Fxq6MbEO30+gLcJdoHDVcUZuFyjJNeZ0/WKBqN9y4ryFOabHueE3xEo/y
         b/qQdVwSgkKbEoWhcC6tI887c7m/N9chrlN+mQ55g8iWRuOWmbAbzXDSZwNGM5fjO5Bo
         MfltO8ZNnptKtZG5GMUZ92z0R2xaCxOhqAHQsAvHaeamh9uZNu6Ws6a3VTcwTY2g4u/w
         bVsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794562601; x=1795167401;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AOVjVYWiGu1+2CTZWPQd/l37VMMlzCbF4uz2qUZJc8U=;
        b=JVvazsbMmE0fqrnO2yjx+9dEx5FrbWWF//ku0S9kVVfQZEB1EgqRLnIINAiNq3AbH6
         d6C/0hDo/L4bjTOiVeZCYB7HT/KRBLx4zmjG/fOT13STmh+Aarapu0gBC0PLWIBqvdO1
         6PAEbRgLKTYD5bEEuiXUsOXEWUREIygxGHZPIzNZYprY2nxF9nzO0X4gX7D62U4Xx38z
         6VOiLLk2zENJ3xnXyl5fo3N6bUdBPszmPjb6ahYtDaQezAqSlxr4ExiMCG+x/hkCCbxW
         Vp7Fe/FLzU+KpPrN9Htj/KcIyNHTwhy6Q4Ltx0fxyIbIxb79Zyhc2qU4B2j4BNYMETMB
         YiAg==
X-Gm-Message-State: APuU4Z9hZT8z00QsuB4xMfePi7k+4RDYOhqTf6nQFA/BAiLHb71QBkIn
	d9vdbW09i8CO8gYu0MRx+6MJs7n2680hBboxtS7IpxCztcsO2gUJNu/E
X-Gm-Gg: AYBFou2VoR5OX6jxKGXeWuNEzhAypyMM/aqqINo/M2kDUz9LS5qDdgMHagIgLrFlu8n
	+qzOfqwiFYpqwa9ziSdF1P5Rt3Tmtdxmh3tn4vKCg6XTE4mPlZLh/Jpz4zAgGn+t/9+YpUPWaii
	+MTp+rUeKlSDrnltZPM3Gcn+2NQabS2NCDpzUx74PB1wmViTvvlSJi2Lap2KezNMaBqcvYIs6DA
	kuLR8VaUFPyk0ttQcPTsGexA2uYjMZe0VF43LepU5bLUk9GND5Kp2PVVqGM5iWgLdY7f3UnuyaV
	+dbqM1R5TLkAd1pV58LtJQj6Xc3lOAxsxr/zH77nq3q1uHbqKrsRB1U3odc2wC8sd9gIgvBaLLG
	nWBs03mdDHM99gSJDSjvJdEyCkZbvtsW1xCvwolGdYoHuTPNF2gt53pSaZD63HZAVV1VIC8eAj/
	rvIyn0kD/lpWCyRy2skUVTaWOTIJ04eT2JVo0K8amLZ/rO32TzAKBQfJKjGaslINkpmhxoU4riF
	RxIIfFNbkgyp+bL3D+I2aba6NOAdO1g8d5Zr6axiSfHVxUvSDx6YoWETsIXzWdPBr1onmzs3sIk
	v4oKLtbfYBrGn+Toskqq/FSaShZWSxoY/vWk/VtDLxCQEymlh9gV+6msxog7XOwH3K91OH1A1J3
	R8nWtcDNEZheuAboPm/NSRdFOs4Vdk/cGfxRNKd/vmvpCsPC9gDz4LVtrIoJh6ucy0ENbPRhPyx
	xgzi6/708c42RH62WQV+EbtKh/EBKDpcGSSPCRqRyJascORb10z4W1
X-Received: by 2002:a05:6808:3387:b0:4e7:3fd7:2752 with SMTP id 5614622812f47-56e6530f73bmr1545762b6e.54.1794562601546;
        Fri, 13 Nov 2026 01:36:41 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e6fc42a8asm1627607b6e.3.2026.11.13.01.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 01:36:40 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 02:36:35 -0700
Subject: [PATCH v5 2/5] dmaengine: dw-axi-dmac: poll the correct enable bit
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
Message-Id: <20261113-submit-dw-axi-dma-stop-pause-v1-v5-2-8523a27b5788@gmail.com>
References: <20261113-submit-dw-axi-dma-stop-pause-v1-v5-0-8523a27b5788@gmail.com>
In-Reply-To: <20261113-submit-dw-axi-dma-stop-pause-v1-v5-0-8523a27b5788@gmail.com>
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
index 6dae63024721..405ab9a78955 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -28,6 +28,7 @@
 #include <linux/property.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
+#include <linux/time64.h>
 #include <linux/types.h>
 
 #include "dw-axi-dmac.h"
@@ -1179,17 +1180,17 @@ static irqreturn_t dw_axi_dma_interrupt(int irq, void *dev_id)
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

