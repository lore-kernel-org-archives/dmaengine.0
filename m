Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794960482;
	b=UP+2y//P7EcEKPDt/MoVpQyvD6bO3g5RA6vwsQPoYV7Q612+TKxPwNvfYSfOHWAhLPdX
	 dp1bfORpMdp+vLnGRB2L5rbtQDBnR4LYjNvHHuTqk6WKIzyaP+zfbQD5vksn0lTBYYslm
	 zLGkAY41bSXiRjO1EmvZLUY4HtBLptNPvu4BeSIZnzfPr0AH1wtVeJvDqHZdlgabJDFOv
	 naC09b0IaybrbceBsazkkV8XhKpUzvDPSUgKcMrlT5cCugixXDfkw3yw1U5VkifROoErT
	 d9YfDmuy95xMkZelVzKjnbzn41CIsmLhfDZa4rkf9dEygUWxtt5KJhd2GSBrJWE9vxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794960482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=mZsB/3h0Hi2V5kBvRnVnvINwTmkVKxUCHl38ser2nf0=;
	b=a6oWrdmXf6kyPl1Bi801idcPTeDM8lHvNMKs7ZyeKiBsPmPzxrmBGU76b85KxJsJPRkw
	 OsePDTudk7Hhhi+qXlo1G7XHG9Qru5Rbp+sJelPwIQXQx/7qUVxooS2c9warlnZbuyfy8
	 QsFnCnhpjGmwv91IF7lGHzzs46B9qaVeNsMPrwgRXZSZizXQZR+ltIM6NyC4OoSzz9u7d
	 yowmyspsjbN5g0rDJLqh59xWhqmQL1mqBjw/H3T8frwfDMJ+Ng10TEhNUWhVa2TKUYzhy
	 ddy3GS7LMzhnQqNy04Ej0PJQCmmBP8AHJ6AOKx7N080DzbPBI7dcncJdaob616Knb/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kixrYyYk;
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7810606A8A8
	for <dmaengine@vger.kernel.org>; Wed, 18 Nov 2026 00:08:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7810606A8A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kixrYyYk
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-847ac7ccd85so228484a34.3
        for <dmaengine@vger.kernel.org>; Tue, 17 Nov 2026 16:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794960481; x=1795565281; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mZsB/3h0Hi2V5kBvRnVnvINwTmkVKxUCHl38ser2nf0=;
        b=kixrYyYkKrlOhQUpV7Bbau/38e0d9V4iKAMOql8QUSA3egSSN0joWIRF83HrY1O4kg
         wj6ICoLrnHb/G6xt7SNMZPqazbcfErGjFUL/tRuopwFGT4UKBBtZ+szlkdWU4DiZyj/e
         F2HeY9fEvrrvvgukTWZnoAnliGwWSPMfMQ1tdZM8zGXiPMAPxpxrSDGV2iTF+hiTXtIe
         y298fgM9+rPC9lFhlWEfyQi/4ikh4y0YJpbivMTIkf4SE2d3UHFnFzTPRl8bR5oN0ZsO
         9NLtwNS1vPpDaHM7qMwLaES6RhMunNluxNSkMaTWDXGusG6ZpLPMVdog6U1HinXqdxZg
         8MMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794960481; x=1795565281;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mZsB/3h0Hi2V5kBvRnVnvINwTmkVKxUCHl38ser2nf0=;
        b=uuAztbcRWLytV7G4wRvgCN7K3paSjyZGUoRNsndLZ4LS0cRHG1vhnOT6mLVPChRHQ2
         w0wUgbd5Im2n8fkFJD0hqL1jT5n+m1vSbpbGSKVOLhLIELNVX4zEzFXeh1/Ipg15YpSq
         IIdzaUqxr97aafVUweKpUIDvpaHlF71TIZnQlRd1JQSOLKMw0usaBLN0LsP0zr95R4c7
         bA3VO3rTebxDG9sgb6gijc8Z61cu4M068SUan252Crmw9+913MZJn5nGxmZOyIB5kI/A
         EBJF5RQPZX0eNLkTaRw0LOyZ6VcjDb9QH3cgYHoMIK5QoZjFhumeGEAEjnuOJcAbe70A
         JhQQ==
X-Forwarded-Encrypted: i=1; AL+hErHLvkksF5QPXlKcNB6w9uW7rNuW/YRKpKBcEu95exILMNhN+RrsTqR4EhNkAOJQBT7di8vXFwpCMvo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AncXcmRuQJnTqMUayEFITPIWZ3SMH9mXDvYHoNy5nrtf5yuRH
	4pNGI90gaPS1jHLmWKFbKGrfEdhdIt1RzU9H+0p7GSJcewwezFaelOUicBqhWPsjCY0=
X-Gm-Gg: AYBFou1hc0/5nCPjPuwCsRBAGT4fkUBOiIujc6Y/WVfHAzmxFy1l94+sv+wPFZ1lGIP
	dkTWIGuEm8Vx3P7Es68hjWAl/TB2HJY+Qem6mu8V/O08TOihOsd4rDkh66306jFeeWXpQihqgI6
	ORxafO/a7F1WiifJJhbiwDCkI9XDd/w1dDrWrWI2IS95sK0qwx5AnaHfTAJ6WZiK+geRguvC+cf
	Kw0J/VUEryFyym+FXL5T8OomYhI9h6maAuBfkD2Y77E9skqA3IPi87mBDhLF4RXoiOa6f3Gu0CU
	TEHs7XVWV2mF66oTzBbS7L1IDYUwwucvyhyQ/invF/pX/fq6pv1qWnQnqRzRWVdDB4Wtn6toQ7U
	YhnIVZ9iEvYw4RUXhxVfFEBU+estqHvKxWgIvW4qRLoeqbuDP74Ukhcce3CJiOrfEWiN1Xp4qE0
	cjO0k08TV1oNSoyb4SU7CXi8UYn6VEW7BIBd/J0jWvpN3mK1pdVcLEwdzc3KjNpKO0bcJyC+qHV
	iXeaSl3QYerAeNxaNk+7ygM9HcR2w2okespDvBW5ldhVLxOVW6c+gTlVrUsmh3o1LjPSGg3be9W
	C/geMTGC6oQ8FktvxTW3AXnC9LHAZtLX3JNrlZhgEbGz8lbL8UfR+s5Eqyvovv1j/kj72boycwD
	GiLRZaVo6AQaPkGZkvSewOW+vxVA3dD1S2y0CaQRHP2+TulV3sk7f/YjpdyMcw+Kqe1+kQjz0KN
	ci1kjpmVB7ghXh8ovIq14LzipLpupVLexdwKdGblXuKQmWjlgGejI=
X-Received: by 2002:a05:6808:309c:b0:574:524d:f252 with SMTP id 5614622812f47-5774143060amr1944911b6e.24.1794960480831;
        Tue, 17 Nov 2026 16:08:00 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5777b393d40sm434954b6e.17.2026.11.17.16.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 16:08:00 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 17 Nov 2026 17:07:45 -0700
Subject: [PATCH v7 6/8] dmaengine: dw-axi-dmac: retain descriptors until
 callbacks drain
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
Message-Id: <20261117-submit-dw-axi-dma-stop-pause-v1-v7-6-d5f2309afd72@gmail.com>
References: <20261117-submit-dw-axi-dma-stop-pause-v1-v7-0-d5f2309afd72@gmail.com>
In-Reply-To: <20261117-submit-dw-axi-dma-stop-pause-v1-v7-0-d5f2309afd72@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sergey Khimich <serghox@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>
Cc: Mitch Barnett <mitch@accuratesound.ca>, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 Wang YuWei <1973615295@qq.com>, stable@vger.kernel.org
X-Mailer: b4 0.17-dev

Termination frees every descriptor while a pending period callback can
still refer to one through vc->cyclic. An executing callback has already
cleared that pointer, but still receives a pointer to the descriptor's
tx_result and can use it after termination frees the descriptor.

An error interrupt can also move the cyclic descriptor to desc_completed
before termination. Looking only at the head of desc_issued therefore
does not cover every pending cyclic callback.

Use vchan_terminate_all() after stopping the channel to clear the pending
alias and move the collected descriptors to desc_terminated. The existing
synchronize callback drains the tasklet before reclaiming that list.
Descriptors already detached onto the tasklet's private completed list
remain owned by the tasklet. Repeated termination preserves the retired
list, including when called from a completion callback.

Fixes: 1deb96c0fa58 ("dmaegine: dw-axi-dmac: Support device_prep_dma_cyclic()")
Reported-by: Wang YuWei <1973615295@qq.com>
Link: https://lore.kernel.org/r/tencent_C00D995A9F70206DFD1330DCB1222EEBCB07@qq.com/
Reported-by: Mitch Barnett <mitch@accuratesound.ca>
Cc: Wang YuWei <1973615295@qq.com>
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index cd9a5b45d295..97098367535f 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -1203,7 +1203,6 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
 	unsigned long flags;
 	bool enabled;
 	int ret;
-	LIST_HEAD(head);
 
 	spin_lock_irqsave(&chan->vc.lock, flags);
 
@@ -1224,7 +1223,7 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
 	if (chan->direction == DMA_MEM_TO_DEV)
 		dw_axi_dma_set_byte_halfword(chan, false);
 
-	vchan_get_all_descriptors(&chan->vc, &head);
+	vchan_terminate_all(&chan->vc);
 
 	axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
 	chan->desc = NULL;
@@ -1233,8 +1232,6 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
 	chan->cyclic_restart = false;
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
 
-	vchan_dma_desc_free_list(&chan->vc, &head);
-
 	dev_vdbg(dmaengine_chan_dev(dchan), "terminated: %s\n", axi_chan_name(chan));
 
 	return 0;

-- 
2.53.0

