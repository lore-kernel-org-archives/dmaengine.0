Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794808883;
	b=D3isdCD5MxihYVRCmi5ka9grRdNjDo/6v+1e0paoC7aoJw2zU5LGJs74x8j6G16ys+eK
	 aeoiOOArHIW64nnkIi/Qz9c1fZuQ5lSRnDeMvOEV9uw0oMrI2YPcqrtfsGTKhbpfiYn4k
	 H97T/mH5xueRieQP81VvbzFxgX4RKscqfSqZE3JDYkkohvnAL7nu7kxLx9SnUlvjUfYpC
	 1uCZa77ZJt0vMPcasblb9cQUH4ZaKlLzQRZx0cndr3mAAR8HpJOGGLFJvDixvK59REGou
	 N2lpNnaTJ8N692RubwSLJvhG2hmlbcK2Fe8umVyLC/e1yIkxmnMXByzym7Mm2VMTmVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794808883;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=v2k4jFluLeaP0eKylJ7J9HI4auhBjQtbrBm24Guvwz8=;
	b=NXDmN+J/ZJdb8QbODoZlhF9iEdC6OZGDZyL6Bc/Jcj0WMCk7P1Rclzmu37Snfk+HnbmQ
	 bhAtN51o96VEtw6taVWB7JDvNscMl+GFlXrAs9pUBGuLNxjqhUp0J1ob4j1R5VUuF57Zn
	 mWZAkvapcf5IoX07qoaVYedEofAwWiOXb3QmIlmjnKvpMSs32+JRQFkgywUfzh/zDoonO
	 k5KwKD8OtfljpoJzO49ARh3tcFYJhNjSnaniV2LvOigQbMDOk9kK0ElMfGoH/9gwQyL5h
	 dL8l2O3OAg417Bc4ckO8GWukmnNMY2XIz5F1XNCwiYt+9JtccGgKMAAJOc6CcfWfdbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pgsBwVID;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF81606A8B0
	for <dmaengine@vger.kernel.org>; Mon, 16 Nov 2026 06:01:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BF81606A8B0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pgsBwVID
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-862b3a39d0dso557841a34.3
        for <dmaengine@vger.kernel.org>; Sun, 15 Nov 2026 22:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794808882; x=1795413682; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v2k4jFluLeaP0eKylJ7J9HI4auhBjQtbrBm24Guvwz8=;
        b=pgsBwVIDHici6eujMavjEja2MEUfJMeh/TBaeGD9M+4EvBTY3zyWjpf9JRTOMyYWJf
         22OqVv4nnp99NV+q6v6NXjBtw+AthV2blL614liTUoajd/31BdCiAwL+iZtTzuYh7MU4
         IXvSMZZ5GtR/ZCl6PhLM/RLn+E/4pNAZ0b0TdL6jj+dWqI3xGtxwNUwa1fisaQSsr+aq
         g9TSvrtc4YLWFtl/4Nau4ijj6ueKNZU5IptpiL/vMkH1ydKLWwIbGY8Ix/OTWUOJGoEw
         YPY6vi4dZ26NUXjmTCYCOda0Svqqz4DquG+FTX4UeBUa2veNrjqyOMZlTuxO3aDqVYrm
         fSUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794808882; x=1795413682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v2k4jFluLeaP0eKylJ7J9HI4auhBjQtbrBm24Guvwz8=;
        b=kl+RRTeubfbP6Lb8dLhFJpMMrQA9W3oXLUlpd0c1AaWGgTsHazRShpiJn0MWkj4m6S
         yP1QEm3HN9cxY0JiKopYhs9kZ+EpmJkkisLKgmrF1lPDk3qGjs9kwMcDq0AQbBHgCmcV
         RENb1EJnv608swk5RWq7ruSk+KRCm6KYzi06ZhKEF6jtA5Q8q1raPT2rR25DSl0wn6He
         fuMFXw/TG8v+/m4QJ1+yjnI0LAkBU5uPy3wUcZSYUBXreC6NHmN4qNmjr/mfUqOwTgrD
         185Vvan/ldu47t8ey3ox1ExiXcg5fGmsW7IBDKCx3g9y4N3J5BiSuZQIfePzpxfcfiBF
         n+eA==
X-Forwarded-Encrypted: i=1; AL+hErH2fzIVn3uHE+m9oiC/scrkjB3wYIfsq18sMfOOs+Fz0zasP44G+7eCK+M+wU/xelsA8a7IfNkh6q4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+pI3ZtESNuVJuIQ382EYqI83P2lRUscaDA1PY6Rie8iCspbSr
	4Z/UrmqOQYdJn43iQbHup14H/O1WvjJo3Tp3JMn7PN5Mtlhj+slh24b7
X-Gm-Gg: AYBFou0C/2TjcHM6BeCH6zELPxpuXlmVVmYvY4od1ZQlmQ/5bTKdfv0tR+u+UveFeCK
	sRNrfIvQ72QhVDKc5p2dcMfmlJk6KI5klla0NmxLB4Zjn9HJRM8jg3wx7rwH2N/SanpT+XZv5iJ
	WSj06kVTWrvWBB07bong0HAyFWxNvaU6VfzS0uM3dJtATbZOQEaMyFnzNhN9mdFuGjw6jKoGOb5
	nbct2xh0fqIoFyw6npuUANziQaXEhoopQowJ45FmsQs3R1NNlQX0oJWGN2SpSqrqpNMnmxJzaf2
	mdkG2hOcQSrC4K/gFo+LSejuWezOTWXUaru693G6dD72IVE/aoi2b4+77AzyxGtUGdk1uqFF1sw
	s6Bik8yJfD0XroCXsv3uE7Hkis3hnSCzKJYiSSPglZiEC4HtXYf9b6DWSgVXMZ5tEZe9QH6GLdm
	K/ffqTFDG0iWhuOpskJPgPrnggcgJw+sKLz9sPbPW6hM2l290Jontcwg7UH5c2k50R2mMtOutwH
	vzGfhlio6wf0EbG20Df3UeqK5kVuyo8sLfV3B4QYrKLV01F/8C9ejoRF5/dPrBsK80AvQ88n+y+
	S5CQEi5FETJmvhD+MuY4q3CSBODRjQM09yvwPjhSUotgg8KJ9DKKyPTzllwIVJs3QVRRzKPmKLY
	f4322kDGJV+EZFz3bFLX98h3RO/1loc6hH8NhBRgf2GgZjYWs+06sO9mLdt5lpZW8eLXIZBn7Jn
	6pX3jctx6WZSKglZw2P733Bscxq5uza9SI6edMpch8/+nM+PBYNi3sdZW8cF4hLFgSRLk9o2tQ
X-Received: by 2002:a05:6830:2704:b0:85f:49ec:c96b with SMTP id 46e09a7af769-862898682e9mr8769881a34.16.1794808882430;
        Sun, 15 Nov 2026 22:01:22 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862881a965esm9375160a34.25.2026.11.15.22.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:01:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:00:45 -0700
Subject: [PATCH v6 4/7] dmaengine: dw-axi-dmac: use atomic polling for
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
Message-Id: <20261115-submit-dw-axi-dma-stop-pause-v1-v6-4-bcb23d1e7029@gmail.com>
References: <20261115-submit-dw-axi-dma-stop-pause-v1-v6-0-bcb23d1e7029@gmail.com>
In-Reply-To: <20261115-submit-dw-axi-dma-stop-pause-v1-v6-0-bcb23d1e7029@gmail.com>
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

