Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794562604;
	b=jTekUoeNwIrJiV77C1JGzOgxfLQlXkbIFw4esZRY4ufk0Gx+DkdClnQ02UoLDS5oej1i
	 NdwRmA5jGMycL2ji7D4IlCU9tvOcKbFS6WBRRnfyshrt99gMkyHYqyriJX7j/VaIui+dx
	 caX6sFhCvNqdH4gA8jJ9FipQjLwoulM96tA432t4PiECpQifVqPoCM/gbpQkjuU7J1kNI
	 Pdb4FQgzJs09HTnEB4WMdY2pajisjZTfnzo7/hTNC0boy0/z4yvvWBkhUY0XoRWzwV2un
	 q2KwzPXwmrTbXdrTUOD6cAoIN10DZHRcxzEuspjnPP3+lQri+lqhXpPqKYeNQDKdQoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794562604;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=JO4lonZbzonXjGudrUdKykQEm0Ub0u8cq6ZIlxF4Esc=;
	b=h5OLoiQPplK7vqLVU5+ko0JH08Hm9tVWKyuIumdUH5whLcf0p7zAdvMl2lmo1CruVsGN
	 dyJq0zfUyPc9nmn4It03sZFyimj0REEv/RXrneg/HouOo/M1bTokraX711fPtYYeb7BsO
	 dWwMpzvUgpIEUOMVp1iKRqa01U0SpCgqYk+5yFj+Fc/QC7nIGQQa2Cb7KFAtUCrgQeMMx
	 qb983ffJzB1oKYYj9RQMXevlExQRK/LixKNa0VoHKkVzT0owP03Wu1mxGJAYiJb4nEFM/
	 zSQEE8bBDLhBBr1n3fZNB5+R/lKd9x2xw0oehCNIC+eJKhK+pg/NdFIQyB9DAfdcKjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BFsdNnnA;
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D216960A2604
	for <dmaengine@vger.kernel.org>; Fri, 13 Nov 2026 09:36:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D216960A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BFsdNnnA
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-843b6f8e2c7so1394409a34.1
        for <dmaengine@vger.kernel.org>; Fri, 13 Nov 2026 01:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794562602; x=1795167402; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JO4lonZbzonXjGudrUdKykQEm0Ub0u8cq6ZIlxF4Esc=;
        b=BFsdNnnAw50iv/2tI17cER+y/Qt1fRUQBLRsCpXwAdoxuI0H5AiXutsT3RUW8Izuiu
         vkb6AQj84uUK7iYWj0QhFelllh0w3wTUnrm4QEaBe3lXU3nlpag3vjaZhAEuaoiy2XAh
         uZf8d+owfYDmZv30Yg8O3nuL/HjaGEPMwj7brszhTxyUTqAx/+zph90Kb98Dp+v7PMV2
         fAHoSESvSG7YhOFcrCcLbm7UBK04M5xe+WjjTlTVcB+d4D0h99altWAUAwkf1bPDcXQA
         1WBvxhWITRjpZm/GBNfBTbq415akf80peMST7mumMxcgDytMUs+fab4uwgut18iBmakD
         YeLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794562602; x=1795167402;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JO4lonZbzonXjGudrUdKykQEm0Ub0u8cq6ZIlxF4Esc=;
        b=Z3jzgOPv8gIx1Zzm4H1+p56qqeefZvxZJdwR7oqFGLxdhsxtl4XHuNAzd0FN3mVxFZ
         mULQ3keu0/viZ5yDhHQKk3exoCSSseQZcCoMFK+865JG0ikYbXXI9a5dnS4QmEv7ZX4n
         rNH4XKBNqGLDcsMlPxym4e7JhuELsLPRjLKEYfQ8G/esqitqx15tXFdwNAdK8gQeO8u3
         52u0PoOWtsvqONkBo7rXbb5dXCmhW95aO63Me1QZaQz+CBYKUbUxjDe7lQRzvFEINFNZ
         3l9yLGvU0TYXsc56APUjb/BkUgn1IKeIgNeqnnsyaZiaHZzgUjvDm4RlBGaI89GRY+cs
         HAQQ==
X-Gm-Message-State: APuU4Z+ncxfNY5wDlGRSlyqBb/nK4bHCd2W3uogmfLq3Cna7O2joO3N1
	LDG90SyxKzRWTFNP6C3Z+37VwH9+0kIKRCMJv7Ic9ZTqmpZaoqQFf6O0
X-Gm-Gg: AYBFou1z6+ryMpwJkELd4PEGDgyMM+QVUI+6fpNMVpKUsTl9N2iUnBr5vGrFT+zKpnV
	dba7gAF67MvV23wZeRmDo9XuVrjg68BFgeFq/aFZWJmur8UW2d8444mtaA4Q3Y6micOYAfPwUXl
	S7CP2qQyY5+Tr4uJ1E2XRvYQcA6BmbfHXXbP3MHK8IS+cnfcC3qVodDlq2DujsCr4IjlJgjl0uh
	GD6WILX2t12QazzXilD2A96hyFSsfzqlBI95wgBE15211irmvk8fy4jxzGBD5qMX+tFVTpxBt/1
	rcrpMCdVlah/rXRESTtpBGPlfQV/3gTzLVJVTxs218v6VmiEmPLxdDottVvsHYDlAiXpV1qs52O
	z5uL6+0+5ViXKpK+dtWiWiFWQSfwtNCNufFcmHPaoM+r/uw9QXNmj4B/10ZJir1S5GsZU+cx7hi
	oXBg41sLQoiunrVBkbxkSVWqWiLmuPD2Q09YNIC3FF1JmlVUARUwM98olXmCWF1d9UeOGhBDHqe
	zycleKWkJyIr9OWyGSu8UyiQTjfVoBcsu6w5KHLmW3AgZS4O0LqvGUu9Y0b2pcnQq7M4UWX0B0O
	iQAeKzGnB+q5z8yWKf7jUhzlqG+vbIGq2+OFgvdsnwSEi6yrcWhqiDrhZ2imKnEfSKmeowiu/5j
	7Y/IdBOWMhuRe/8MMEaIhTgzeXK/tW1ca15jxjRYp3ztz9BoFvum4tfMWIxORnaWIBuNgNeeu9Z
	hp60k8hRBBPOwnNERfotF+ijNnxUAYWZlm6oj4rrbfXYVyACwr23Rwxk6kcN+/s3vBvY7W9bh+g
	Q==
X-Received: by 2002:a05:6808:f13:b0:503:8f9d:f11b with SMTP id 5614622812f47-56e640cffffmr1509542b6e.43.1794562602641;
        Fri, 13 Nov 2026 01:36:42 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e6fc42a8asm1627607b6e.3.2026.11.13.01.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 01:36:42 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 02:36:36 -0700
Subject: [PATCH v5 3/5] dmaengine: dw-axi-dmac: retain descriptors when
 termination times out
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
Message-Id: <20261113-submit-dw-axi-dma-stop-pause-v1-v5-3-8523a27b5788@gmail.com>
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

dma_chan_terminate_all() warns when the channel enable bit does not clear,
but then frees the descriptors and returns success. Its synchronize
callback only drains virtual-channel callbacks, so terminate_sync() can
also report success while hardware still accesses the transfer.

Return the polling error before detaching descriptors or changing the
peripheral routing. This keeps the transfer resources available while
the channel remains enabled and lets the caller retry termination without
treating the timeout as a successful stop.

Hold the channel lock across disabling, polling and descriptor detachment
so an interrupt handler cannot restart the channel between the stop check
and cleanup.

Fixes: 1deb96c0fa58 ("dmaegine: dw-axi-dmac: Support device_prep_dma_cyclic()")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index 405ab9a78955..040c12d07db2 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -1185,22 +1185,25 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
 	int ret;
 	LIST_HEAD(head);
 
+	spin_lock_irqsave(&chan->vc.lock, flags);
+
 	axi_chan_disable(chan);
 
 	ret = readx_poll_timeout_atomic(axi_chan_is_hw_enable, chan,
 					enabled, !enabled,
 					1 * USEC_PER_MSEC, 50 * USEC_PER_MSEC);
-	if (ret)
+	if (ret) {
+		spin_unlock_irqrestore(&chan->vc.lock, flags);
 		dev_warn(dmaengine_chan_dev(dchan),
 			 "%s failed to stop\n", axi_chan_name(chan));
+		return ret;
+	}
 
 	if (chan->direction != DMA_MEM_TO_MEM)
 		dw_axi_dma_set_hw_channel(chan, false);
 	if (chan->direction == DMA_MEM_TO_DEV)
 		dw_axi_dma_set_byte_halfword(chan, false);
 
-	spin_lock_irqsave(&chan->vc.lock, flags);
-
 	vchan_get_all_descriptors(&chan->vc, &head);
 
 	spin_unlock_irqrestore(&chan->vc.lock, flags);

-- 
2.53.0

