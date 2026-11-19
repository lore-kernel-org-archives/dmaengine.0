Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795082556;
	b=qjQhiVK8LJK5JrzhYuFRw2ulns/UwkoJ/YoHIA2+K7pwzhHVY3nK0C5UWdmGwPU37CCV
	 oEtZ6dxdaRSsNzC268ZvRFkeMRzSQAjt00PujQePv9AZ6Osccno3EMBWLD2CaIJe0hMwD
	 Ros291LuhrY3t5polNMfPkjpon12zpPqXOsc14bs5uvLFJs8nNsbJA18Ygqg1ls58B7a3
	 jdK/MTOSrIEmFPJtaR8a8E+lWj9T5jRVVmc+nmE1qX/Be8yVR6dUOM40stGKFYRxeRaz8
	 pmqklJbyNkv9WJYGvhWcbn9m160euBerjsRqDdLF3qgFefeiVVNZDl7NpVFo7bt+skg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795082556;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=HgAhw8d5YaKxhipigIjxpyoY1rnfpWAZBnQgXb85Z0s=;
	b=sDadNbV5Vh8Yr4sZ5ruUzq1ke0MYdCkW39yGomsd6ffHkDcv7b/0HzTV/MiA1fPUMngW
	 2eb+LtHXXtoRUtWc1uv3rH7Czx9ij/Gz8byOmDuHkDzVp6o/JJFcbkK1sCJ17IwGEa1PM
	 iO2dqLONB5D9IoXxFryrj7tw5S3CqASZZBgLQwjZmtMTy6ACu+sKC4tA/OmtQUSjbMV/w
	 qtv6ITj2JTCaOMstqQN+UjajdTkoDb8GApKlFfF1Ce1jFLqYmA9Tvt1zvbNljMzg8fZ5S
	 mmfZO/ZNz5ysXdwPcqNDzA8bPOV/i/QnJZPx13XgWJICV7QX2T4HIoTOIAekl0ZfJyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zdTIfOeL;
	arc=none smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB1E60A2613
	for <dmaengine@vger.kernel.org>; Thu, 19 Nov 2026 10:02:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FB1E60A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zdTIfOeL
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6e560e00a86so1261073eaf.1
        for <dmaengine@vger.kernel.org>; Thu, 19 Nov 2026 02:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795082555; x=1795687355; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HgAhw8d5YaKxhipigIjxpyoY1rnfpWAZBnQgXb85Z0s=;
        b=zdTIfOeL/7d+RS4Zt6Awzo6rb6wnu6WousZ/R88LlA3yr0tZDPkSAtaCaKBBXX/qb9
         NpQrleP8lK5nW65IK+0le216BnWWjIgMO5H1Gw9I9zt3VnnHGdJibzVKovL3Cc860dpJ
         r2/SR6Eq0um1536Nfu5IE0PQcAhb+W7DQn/tkfXU08UyncERGTkE3Mx8D1bOGB0vC3x4
         3OzPFY1bVX3GYIERM1dUI76jQscxbzQzTNZZm6vWAGCOBlDfUQKGuD/tDUPgTU/2FXD4
         hLEsyXsYcEuVyi+A5m9H7sHe1V4Ug8hj2zL3/TAMqS5QoWQdyzlBuf+hU/vSMvIuQfJf
         LL8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795082555; x=1795687355;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HgAhw8d5YaKxhipigIjxpyoY1rnfpWAZBnQgXb85Z0s=;
        b=Immk/fMBaxRaYi7Q+puSOBMCvUhkomeNZK6G9RZo1pSIaML82IzJcISnjww6HaSncQ
         Q+TGAM1XHA/m7HH0pFrXK01PDxRdNTI4kJBOZp26py+I2Yo8uBFI6TNY2OWZpNw2oXsE
         IAEhJePQ0+UK2HBsUYrbFAnEGJA9lpWjzdJ+ZhJhETKX6uD0tAiem/tzI/PRiq0VPVm8
         aej2qgdmMZ6BqN8BPDU9frjCtpxwmHq2B6JhbZvDCwRb1HJtSmqnw/concWemhXn8BMq
         Z15TxvJdg424zJia6c/k9KR/cpO6Q9+dEpSqPbtvCy1o3AZGBBopC2CvT+tg8AvxHZq9
         p/sA==
X-Forwarded-Encrypted: i=1; AL+hErF/9Lq15KXzwU0xn31TeQLX+Opf9FUUqg7UYRZJhx6POLtRsYKcP4t9b1e78lvQHhi2YMfwyMOVt/M=@vger.kernel.org
X-Gm-Message-State: APuU4Z8aL/8+xA2FebsUZriry4KErPYKBowRFDFAdXdJNvoyRySR6ss7
	Ex04cf6E2AcjSMcJNFbDBf7qVJqiUYeZLw9qbqWYTpHZTNd2YDsuVAdr
X-Gm-Gg: AYBFou3OjRF9CwvLceeXe2w57rj+FpYQI2Em/d5aC/pBDBUbabEtub2t0Cyg9ld7km8
	Y0GM2/MNrkgLc+eFnp3EyLDLGSmDv++Sfcr1wZkAxHeOYJBWWIDzRCncsn/TswuKWj36NqUCgZY
	jDp8aGh6j1rnLbgJfglXkD+coxZAytjxicQoDp7Ql1yYnmyyV+tVrdXudXOxp25LSb9244RxiM9
	25B9aajteLqCXIzbW1Rf2LMT9VkntUW4kpkZmb/rzlsHQmVdq0SYNFCRmCb/MGjhm4OfcnLZo7Z
	6LSIsoPPBGyYqIqdkMzARxbrgxT/LXv9zTaoUy0w7VbQFobZvDGCmUAs965ZaI0D/zdV4q+WtcZ
	NgFW/z4OIcHmfQS9vphFLkjhmRJzWbIi9ZYbHCWnH7f3drxqwrZ4JNpDk/U1igmVe/y9tMu0dg7
	9LpVxsVrX1zAI/ff196hNPKKXZatO4GqkBIhVdP/ygFLlQi2vgdWDD7d1p2MOh5K3dbDGaeZ00P
	Ax4ReTGnDBQ1lHoAZ3vB+ty7fXGxC6/DzZ4g0JcW6NGm85SkA5hsMDb3kO+mY1D60sF8CF0oiJ5
	qgrdY4Dt2WMBvhnv/qDgQaVmv3DYTKURLI1laoGSNEaYk8LEJH8GSabVrKJi9HBQL1+pb8agQPR
	UC2xVKW9o7TttoVNNtZ9ag0pvtDnQ+eSoHNbqj7M+o4eIinGSYm7DKxESO49QO91S16vBf4hVtt
	/DKpq+/2HOBgmGS+xSlAiImIeH0jWMEhWhL73UaSWNkPFbDOg/Dkgu
X-Received: by 2002:a05:6820:1690:b0:718:984a:50cd with SMTP id 006d021491bc7-71b18476360mr4278894eaf.25.1795082555567;
        Thu, 19 Nov 2026 02:02:35 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b18fbb9a8sm3906194eaf.0.2026.11.19.02.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 02:02:35 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 03:01:41 -0700
Subject: [PATCH v10 7/7] dmaengine: dw: report residue for queued transfers
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
Message-Id: <20261119-submit-dw-dma-synchronize-v1-v10-7-3a737597a0d1@gmail.com>
References: <20261119-submit-dw-dma-synchronize-v1-v10-0-3a737597a0d1@gmail.com>
In-Reply-To: <20261119-submit-dw-dma-synchronize-v1-v10-0-3a737597a0d1@gmail.com>
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Dan Williams <djbw@kernel.org>
Cc: Serge Semin <fancer.lancer@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 dmaengine@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.17-dev

A submitted transfer may still be queued behind the active transaction.
dwc_find_desc() only checks the active descriptor, so a status query
reports zero residue for a queued cookie even though none of its data has
been transferred.

Search the issued and submitted queues as well. vchan_find_desc() covers
issued descriptors; submitted descriptors need a separate lookup. The
status getter already reports total_len for a descriptor that is not the
active transaction, giving queued transfers their full remaining length.

Fixes: b68fd0976286 ("dmaengine: dw: move residue to a descriptor")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw/core.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index 7a66dc75c546..f9761651c7ec 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -942,9 +942,19 @@ static void dwc_synchronize(struct dma_chan *chan)
 
 static struct dw_desc *dwc_find_desc(struct dw_dma_chan *dwc, dma_cookie_t c)
 {
+	struct virt_dma_desc *vd;
+
 	if (dwc->desc && dwc->desc->vd.tx.cookie == c)
 		return dwc->desc;
 
+	vd = vchan_find_desc(&dwc->vc, c);
+	if (vd)
+		return vd_to_dw_desc(vd);
+
+	list_for_each_entry(vd, &dwc->vc.desc_submitted, node)
+		if (vd->tx.cookie == c)
+			return vd_to_dw_desc(vd);
+
 	return NULL;
 }
 

-- 
2.53.0

