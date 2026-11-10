Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794279972;
	b=lNkufsM60V3EwMv3XKVckH1oOhvUeDZv8d2b0H+uqDg0WS9JznQ9zlb9HhlsB+Lx0ody
	 mrebDmcd2nrKotbLlm9kjlSmMQA1/gXvOtA0mQJV6QYDn1KlpRuOgkAhnXjDlnzz7V7x3
	 0XlVJbP8swKorXDMi0ZhK7nt+JspUOPV0c6aWEZtzVEYY5yO2v25Ype32mvcUYXuL/tjN
	 87dsttzUrtMb4RHJBJj8lJnCF0pm27BLVrFQeL69Hwl8jAa20rQYOOMLBkiIQdL7y0X21
	 c2dZeVpbas76cymBuf2lLHO7rBMZagCXNQluvttlzk/w2h5BPpyW4zvvjLinHy/cMng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794279972;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=tQLRzDw4bvXr9ZRnrhDdzQH9SFs0wSZAanziz/iGjrs=;
	b=sMkabgP0UvHH4qw1276ghK1m9B7uwIyT9NyfdsN0eOQhXI1osoXrrTJ+XwSOaWgqDW7u
	 L6AzR+f+gnsQRYN9sS7zJ5WneRAyF23OFOP6m8hyMI+qiee3HHzrif8fMOyEj1OHmDaPy
	 4EkwaIsuzjFy/KVp8uT3ksyeHBZEDS3zqUAaoxw21DMaGLDes1PCCTUw9sXuB+11FtZKk
	 Ep+0Ofzppv/WIlShJNQ3T3ERfj3FjYzlxsgwKc3cYatFOejFff4NsNDg0wZebqDzuRNHM
	 U22IaVC3iG+Qnjnqp6mqEjnLKLj+Q1JNZKOVBPqJIKdJGRRKyWQEpkqO4MdVZjicx6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QF6Cop8L;
	arc=none smtp.remote-ip=209.85.160.52
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680E760A2605
	for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 03:06:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 680E760A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QF6Cop8L
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-499f20c7054so754087fac.0
        for <dmaengine@vger.kernel.org>; Mon, 09 Nov 2026 19:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794279971; x=1794884771; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tQLRzDw4bvXr9ZRnrhDdzQH9SFs0wSZAanziz/iGjrs=;
        b=QF6Cop8LNly7XYUHJuMhHwcfiT7U9lwvwQt0TcT+ptRcGB5T9VPK6WriONXxboB4Ht
         WX7lmBFZak799sF9mbU7e8zlZu9ZNVAIONWV22NewD7d1tl2fLniikx439Ou31GpzJ4E
         ATYeedgm1TtVXc9iA3/9QsNmbCTDJXzuLYVcBTm03rNbXJo4Yy4NA9j/Eczc4QfWpaJo
         59vRgWFoh5F5z+vbqXwNdWGz2a0RxZiKUrF095A9ox/a0WMxFfvnHCb7epxy0EN7IEku
         0ZQTWxByb0WIMa0XWvYkHFG4bCIViWlb6qiVq9x3kCskxgwOiys23uf5VMcOCQFo2tVe
         MsPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794279971; x=1794884771;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tQLRzDw4bvXr9ZRnrhDdzQH9SFs0wSZAanziz/iGjrs=;
        b=JjlvpImmgMQQFYs4vI0riWCUw5k57BGW2vt61pWviFXmXo4vWxwJGBVe4/dcI4ZVl3
         lftu3Mof/6wf/cqZCymbahWYQYPttd5OY1e6BjWWeCp5pKrcIDvPyMUonZ1pNBnzwTda
         HWHVcG6bBIU5+T83RFdEWwmcyGFJk9D3h5BWmUIVyerbsV7ejLiU6PjAHJJhc0xr9EEa
         5I7sRnfpWXhchj1hwyXPGddmU7uvAcCcM3zd7xa8UYtlqYcNtGG7nzNFHtkyeoNkF38S
         H3i+oO01LV37aVjc4T9ih/qgGaoRXSobOdSEMGmdYebB1tROqNMiT73ZeW8UstM8mjBb
         pkNA==
X-Gm-Message-State: APuU4Z8RVv47ye5jqdj1KkPblJI2gUyo6PzxeMT+Mm9SkaEYfPsormqU
	vrbyzIEZkfcBXsX3mvnwyQ1re/Lb/bHSsRfunSgbgDexeVReGZ6uwUmy
X-Gm-Gg: AYBFou0VdVHaU8egkqPB5dH84/Aw3wNwUcBZXdHxZ5nQk0Uaz7lSsKdzDulcZ3CU91W
	BvCOq6SO2U60HHEdJ5IMoAujr7feGfw0VteurODCJWc33LZMvHHOSpH944LfPXfrENc8yOBLMGy
	09WZ7eQnTAgqNnh/PZW1rqs8Wdz4OCrbP0m5PELqcp+bNh4o+hoGr0Q8k/iQOVPVuLa7VcO2ZAw
	UiVOKe2VV8i9eV7sypGXBBgWyjF8/PzqDYz4VyqbTDWiquFVx7UZsOi4e0GrLARUlv/Q3qN5gFu
	4b/UZVGYb4P4EwSO9Tn8KuidjPCfR/DN/G7VacYTq/Jo8d48obTu0I8Gxjx1ayP1QFYCRIyffpo
	BgBOUL0FKg+PmwME6aPtIzaWU4uwRk/CeVuPok4Z7dH9bkUZvMei4lMm0d/TltUSEoi4nqPtDgd
	knD75nKiDwNcU8pF7jJPw1w2l+Q4S+zoHQhGn/Sz99yAnS8vzn43dKzeOxIDWw8LToZeN4vE6oE
	B/PxnreCWqodPo/qjC6VrhTSAejhWkmBoaUwRAZ/oPo31OU9z8fCG4ELzvlJIOkoo1nMUd3M6mg
	+KgFUE2vkJ+8S8G3Hy9Spg+wbYXCFWke16D5IJ0CF5zWF26iFqFxP2hTBJ/RyabHlU7prYwbZ5d
	UrIO1ggQgDAGBnnKsrcMPPAnb7G8TlAPT45z+jNfTbxfOLXXNoCGz2nZHzcCM8h3JJUO5Y95Kn5
	+jD8i3a8Z48W3J+buqBLk4RIGfMmf5ouhg6NMjq/WtGmCmvUs80vEp
X-Received: by 2002:a05:6870:b3d4:b0:448:a3d6:c2d2 with SMTP id 586e51a60fabf-4ae225894aemr852134fac.10.1794279971434;
        Mon, 09 Nov 2026 19:06:11 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ae22fcdc93sm683389fac.10.2026.11.09.19.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:06:10 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 09 Nov 2026 20:06:01 -0700
Subject: [PATCH v2 2/3] dmaengine: dw-axi-dmac: retain descriptors when
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
Message-Id: <20261109-submit-dw-axi-dma-stop-pause-v1-v2-2-64adc48df793@gmail.com>
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
index 457ab9c47ceb..281d7c79246e 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -1187,21 +1187,24 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
 	int ret;
 	LIST_HEAD(head);
 
+	spin_lock_irqsave(&chan->vc.lock, flags);
+
 	axi_chan_disable(chan);
 
 	ret = readx_poll_timeout_atomic(axi_chan_is_hw_enable, chan, enabled, !enabled,
 				       1 * USEC_PER_MSEC, 50 * USEC_PER_MSEC);
-	if (ret == -ETIMEDOUT)
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
 
 	chan->cyclic = false;

-- 
2.53.0

