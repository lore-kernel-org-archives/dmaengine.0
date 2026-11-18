Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794960480;
	b=4ErE6UTT80YaJn+WKHGJfN0xevQgABXjYpZSLDiympZiX3WMZ3/tHbslYhfESbb5CIj3
	 XYQGcRb/5kng0Aqg0AsZPcnws9rWoeb8Fc/gOZk41pNLtsPuiSb2jVg3U3nciICcRLW8i
	 jCiKYDYca2W8poG+rjVF0XcNAh9dSCPWDQH8CQyen8dVQxCsRrLsu4KAL6cuvfmkjEWof
	 89yv2FJTBiM+MRy+bzBOLuFdWFQuhAIJxzg0a/E2lfw/9elK0VFdx7MGAsByMtaFLV4fN
	 bpCBTsCrAXJZ3783lpgdWVVaZvbRSifIRHunONQUjAzwtromyLFd+6eIvtX2hP7hqqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794960480;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=v2k4jFluLeaP0eKylJ7J9HI4auhBjQtbrBm24Guvwz8=;
	b=EdDc2B2OUugzdNuS/r4y1bdK8MFHyN0JiCuaM2RsO097Mciei2qz5aHTTpbcZK3tod/Z
	 YP/pzbs2A8r63bSSBd1flWAdehSVR4yWjo9Y5UTC8YB9D57bLUeGsekX3beGUU0dAzusl
	 MmZHTxoNZEmAPSUfrvDN5QlI2Q9C+Y9IFRGy5oKsr18yoMMeoB7NnJfRuccTOHxlSRIx5
	 MhdDJI5oSZmPYRq4gXywwl+Ufjw0vB9ymDSuXaQSBnHjngXHX6S1/HjoNcODys4nE9kSA
	 VcpK26HBnK/PhmM0hsUCbImdXJzTSB+NxsvOZs20mmOOfcORSZjnv9wt0IU05BYN7xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="prnQ/qiP";
	arc=none smtp.remote-ip=209.85.210.44
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B573F606A33B
	for <dmaengine@vger.kernel.org>; Wed, 18 Nov 2026 00:07:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B573F606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=prnQ/qiP
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-862b76e3c8cso154281a34.1
        for <dmaengine@vger.kernel.org>; Tue, 17 Nov 2026 16:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794960479; x=1795565279; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v2k4jFluLeaP0eKylJ7J9HI4auhBjQtbrBm24Guvwz8=;
        b=prnQ/qiPlE65zIvnXobRHhIMQyIlwwD8KCllVt7YPKlF7LGSkrGug6bsC34rlwftEn
         dJWarqi4gs/GKi3Vo00u43bWTWb1mSpH4/KiIREx6RHq5VzsdLrURUO9TamkdSzjvN0g
         pfdvzNo2b1/4XNiX4JrhkAQk7EKK/oKnIwLGSxsqORXHKyTL2lZWx0j8uGSqA3T3vFj8
         0qIm+HxSTFAoY3LVGh0yeBecMlDRfo3q5oF65fyf5DgOeQ7wr5DVThrK2ZaHqaTQJFif
         IgVxcJk24eD+QEVuHOrwsq9oGlUd/6f1x+fRluxui3rIm4WHthzjMtFLBnU33D/kp2be
         F59g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794960479; x=1795565279;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v2k4jFluLeaP0eKylJ7J9HI4auhBjQtbrBm24Guvwz8=;
        b=puVgm0V0Kz/5St/5FNmJk9cM1YSSk1K4Rtxdr4QQ/cgzEl5djNJaAM/w773bQqtqHk
         K9bnmw+Vx5helA7OmtnqAzB/OXicj/HDOKWIjhhTwftLHy2tFH4ztg49wT/JPQAr05tB
         ANoplfrXLlY/P/pOm/tIw4c3dxDa4ECNEY0L8dxnKwTKPlXBOVxIxsYEUht28gcbRCKN
         gPyVJFIB9e/O72CbTqlObFdTMlLm9HL54OANxbZIozEaToxZ/SRBLYICwKUxiYJXIRv+
         UFKdggMus/iEe7HPfQ3d2vBkSwTvIRzf/lLom5GsLCAjVwlN+0sTIFv3laZj5b7oBd9O
         qNEQ==
X-Forwarded-Encrypted: i=1; AL+hErGSFBX/7+uZ4CNU2qd+HjmsKUGcHwylnwM6/bFMVi1KOLeIivInEf5kOd5W/3wY8zMyHW2Y53WjZTg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jJsfq++xSQwAmOIuGhRVWNMMON+9/mCXCFyOOhsS0jeSJZZGG
	F89+J2qrfjLcBhHoVVX1T8KrQ9kKZ82wa+DBdj5usmjpyFoky9Wy/3Ix9ApQdm8WVAY=
X-Gm-Gg: AYBFou3FNWVl7UFh7gXSe4cJyvYOvhMs1rxCSz1Pdn4+LGF79E35jhVsh01MYh/mPdR
	DfBQXJ6wM3lLtfAv8wMm0nf9dAEYLVPPW/x68HFlV+pbo0wcj/Yop7DbaTKg//lZ85EnRNI3mcQ
	xgRuw4jkQ3ZXeA6ppfUIPu3mIyeAcJog1IC7ryLvOZprYnPVJ/pRif5p33twMYLruxdhX+/fQx3
	n2r0dqDHZhh6v70OxjWUjFC9Bw3fQjDc1ewYHaGgBBUsOWo9EjZmuT5NKJa5vGI/8GUG/kFygwl
	Rp8lQfm0WWY/ygYN5lokcmBWHtkxHsdIOO+bD1TnxltxOwLE0lysykqeMt0mcpdU5KV1/O87MUI
	M0Hl2S9lrnHLhJr0i2AzXA3kAg87L23mEDKSdCPEHR/Bfebdy9K7wfu5Y1kFnpL9xWMa+wIEVuB
	YG9a/UEq9Rn/INIsS851Z/rY1l4r3lVqmpIyb5Iyftce+gvo34WcOM1CjGKhX9/0t9wD2sjJklw
	XKhy73VVxbQzTa/ESPJeGQuVE/bU1lQzV7Ioz3xDL+n1SEb6DSaynbkkGSFrzTqHHSgRLov5X2N
	asyCgNSVshLDe3JNhl2k3ZCoBpGL7Zeof360DEyIicDSJHGT+pYNAA/FtcxLWUKllHD7/tCVwOy
	YJFJ+a4l0PRWMZyiWwmjN0NWmjm78Ag0Lehyy79eBZip7OdzH9EABj4lUCRab1jVkTEDvP8kWqK
	oNMKf3Px/b5e3ILJe+sUKU1j0C5QqgqJnn4wGFs/QAsOyoTVYTbAQ=
X-Received: by 2002:a05:6808:14c7:b0:4fc:248a:de3b with SMTP id 5614622812f47-57740b4736cmr1444474b6e.23.1794960478756;
        Tue, 17 Nov 2026 16:07:58 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5777b393d40sm434954b6e.17.2026.11.17.16.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 16:07:58 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 17 Nov 2026 17:07:43 -0700
Subject: [PATCH v7 4/8] dmaengine: dw-axi-dmac: use atomic polling for
 suspend acknowledgment
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
Message-Id: <20261117-submit-dw-axi-dma-stop-pause-v1-v7-4-d5f2309afd72@gmail.com>
References: <20261117-submit-dw-axi-dma-stop-pause-v1-v7-0-d5f2309afd72@gmail.com>
In-Reply-To: <20261117-submit-dw-axi-dma-stop-pause-v1-v7-0-d5f2309afd72@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sergey Khimich <serghox@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>
Cc: Mitch Barnett <mitch@accuratesound.ca>, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.17-dev

The pause loop delays after its final status read, so an acknowledgment
that arrives during that delay is cleared without being observed and
the caller receives -EAGAIN.

Use readx_poll_timeout_atomic() to check the status after the final delay.
Keep the two-microsecond polling interval, 40-microsecond timeout and
-EAGAIN return value when suspension is not acknowledged.

Fixes: 1fe20f1b8454 ("dmaengine: Introduce DW AXI DMAC driver")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index 040c12d07db2..1a53fbc951a9 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -1219,7 +1219,8 @@ static int dma_chan_pause(struct dma_chan *dchan)
 {
 	struct axi_dma_chan *chan = dchan_to_axi_dma_chan(dchan);
 	unsigned long flags;
-	unsigned int timeout = 20; /* timeout iterations */
+	u32 status;
+	int ret;
 	u64 val;
 
 	spin_lock_irqsave(&chan->vc.lock, flags);
@@ -1250,12 +1251,9 @@ static int dma_chan_pause(struct dma_chan *dchan)
 		}
 	}
 
-	do  {
-		if (axi_chan_irq_read(chan) & DWAXIDMAC_IRQ_SUSPENDED)
-			break;
-
-		udelay(2);
-	} while (--timeout);
+	ret = readx_poll_timeout_atomic(axi_chan_irq_read, chan,
+					status, status & DWAXIDMAC_IRQ_SUSPENDED,
+					2, 40);
 
 	axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
 
@@ -1263,7 +1261,7 @@ static int dma_chan_pause(struct dma_chan *dchan)
 
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
 
-	return timeout ? 0 : -EAGAIN;
+	return ret ? -EAGAIN : 0;
 }
 
 /* Called in chan locked context */

-- 
2.53.0

