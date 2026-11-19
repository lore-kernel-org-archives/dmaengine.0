Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795104115;
	b=fuTRDFDE+wn/9Ufl4Z0GLV1g/ml/ol1dkFgrcSUf3DMmMEIjO3bOnSclH5DEUD0L0pFf
	 zDWaMwFcwotUtaBPZ3cDWrSe1jCFmYXXNgXBEueVuaQLqicok3tTF9QgKe0q+JTD6v9d7
	 oDTdU5Ol2I5fmwPp0I2cFI3k8gxOdUfetz6F9W5RhJRdsENkvxcKWu/oRjwwJ1J8A7D7w
	 nDPyny4Pji3hzKry6E48hf3yJcmZgazuwAtC38gUU5VZ2RDilb7EDpp0Kmzi/NYP+v9gz
	 h8HAx8QaGrlGK4zcsuikWJhVH+BR8KrSMg/a8POe9NfvNGguEmEIcYy65uzNjdDy1RQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795104115;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=mYHbWr2Lm9koLQ90cthmFtpM1NIs5yfnk09mZGH6U0A=;
	b=JY4x+xKRFvOtxG3bea8PUwMoy0m8eJ3su1tIciKqx42TyRovp3N8kUwbOItt1LB8dqol
	 0gxE0NapHy1L4zDppkGzt0Y8EKSgev6t2UWo+zVMi5ZsgTR2R8y32RoMl41P7CffCX7WY
	 JQc2MH+Qw/MJbKYJh0KQVdWdv8m2rwjcoOSTGncSPgHvCLrHAEz2+7GsH04cXPts10rQk
	 VFSa2bkO/lj3ZBqKmtjOCNudjxoZu8soK7PZZ2tzGDIaZg7woyiGjKdllAZrr09AjS7q4
	 qQBjdQc07FoEawWjgmuJGJsW2L7mzHvqSOg8MelLl2fANWDXNP/uwNuPHaUdnsWkNCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HzEEcQnO;
	arc=none smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945D560A3809
	for <dmaengine@vger.kernel.org>; Thu, 19 Nov 2026 16:01:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 945D560A3809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HzEEcQnO
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b335eeb340so21738207b3.0
        for <dmaengine@vger.kernel.org>; Thu, 19 Nov 2026 08:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795104115; x=1795708915; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mYHbWr2Lm9koLQ90cthmFtpM1NIs5yfnk09mZGH6U0A=;
        b=HzEEcQnOI31sexECRROkUGPEd4VFZeHrnhrS1/ASuq+7bKJ9WQfd9w/kiUwOlycBsg
         wJdkJYzZ3tHSASmimq882ku6AewZUZFAqAYCBYPuY50exnlqlDsXv7BWngotcbdNeY//
         XiD5uFBC2q4FbfuhSW7fLBCfl8wnIJI6BqZGeHJDpidp6J9KSlhBcs9i9/35Qk+tMQWQ
         kLI+tJhyuA2jdifpcJLJYFzFPY6GuJumc4wvNy9IInlS/0ERr5Kc3fi5xBxua01/ogvr
         ZGPi3nj17R//hagWaXpS390EdUytkSh17ylN/cSm+ARmwR42YUNcLH63mRoX/RGu6DHW
         EGAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795104115; x=1795708915;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mYHbWr2Lm9koLQ90cthmFtpM1NIs5yfnk09mZGH6U0A=;
        b=liBYxTuHtCG9trmEPOh2PJ1WIz768Vpdl2iJQ7ipUa9k7aEC7wtnLFrYHfyCLs3uCE
         CSSLGmxM5U5xYMhU5CC1gfryU1Lq+PnUNSU7R5vscWjk8xXAsFh4PdeLiSwvEEeW9M4J
         hOwI3SuyfXvTOBqt8Da3wo7NdqEkMLROYemUVrsaMXQCve4p4/n5WNc3ZWsrgOYAxy8p
         TjerT+stk3lvI/2HOPObF4oSDMnN6DOika6AgwEJxTYG+0HMoLR0z9cHeKRtUfHA5UEJ
         hAMY+8xthxKVnVG18WjrJFocgmQz6QnCnp/n40VxZtiQ8DrguOzZtF3Y465V5L7hqm27
         uJuQ==
X-Forwarded-Encrypted: i=1; AL+hErHHUOpqm55wzkbIpb+22HufqCLMFZrfWAsggiIbdYIMaKVg3rrc61o779gjB8nlZBAeh0SIG6bzhuM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ypeZkYll/8UsLGU9q9IyGrSAFuugrXiDAB32cPF6Gi/hN5M/b
	1fW1Mqak8QyFacbI01MKTEly5BvnX0IjPCKd536p9uVw+Yv4TAvx3Sda
X-Gm-Gg: AZFdTZfXh0DWzVdqJTzU878Pm/hFLXymuDi7wgbFpkXPtH4PWlviMS4wXsiOtgh6rcJ
	Oxe9KIySwTBV84+coF8GjR/jf7ZQQKQZGu9/6USNgDBS3BABdsSzlEIMCoTChD5H4uX9hGJlJ3R
	p+bqXq2G1ls/OHey5Mave+e2uS7/rTLYTgxrbBsLKt7LsHIHNBZQf2PTTpBCGNTHrV6TZh0eAZP
	RbTJqTtP65sG1GghNsDAWUIKrmgHz4Vv2DVmSYhpekbGQ5nHT4YjKjrZl/c1xlvXAKHpYCHKtQR
	eZbwc0LHvrVehRTnae9pLJNQzI8pkuCZDnYl+fJiwyAubDhZ2Soc+OcsYAEWHJIPqRYY8Fgzkut
	JPbXdrM09VjGKus/3MbUVh++tdvv89O+ljVkeeviqgwpcopeylzw/rC8yiGIWKCz6AaWBhbUdW0
	9iENp6F91r1ybshK5B30TiDkevWnowCG5IbEcAhs5/T/Ki6P9kB3GyowSF5EgRk11LAN6PYYEyk
	jIO9FKMXvBbquq3J1NuCshb7fTjk0g+UmSMimKSgdpcyyWgeziIUnM9l4O8uod2g64F+PB5Jlfb
	c70CCup6fnBH7kXBC58e/d7gcN/WyATAxhgYbnhSxRcA73LXPys3keozu28Hvn1ewxrCdQRQb5U
	NqTIsh9dK2QNy9nIyteE/C0uSJSAouemG2ugQ7biJXpsd7GOubp2E02+xPjy04lK4k6F8lTTFaV
	FBN8q0/MtukSiWaoXZKKKkAZp0pSkISD6PkG0R3a9UkoksVvrxzr8fRPeFjgvPNAV9zPAAsr77
X-Received: by 2002:a05:690c:650b:b0:8b3:2d65:2c83 with SMTP id 00721157ae682-8b520435671mr866647b3.17.1795104114474;
        Thu, 19 Nov 2026 08:01:54 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52031aa4bsm623267b3.34.2026.11.19.08.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:01:53 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 09:01:01 -0700
Subject: [PATCH v8 6/9] dmaengine: dw-axi-dmac: retain descriptors until
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
Message-Id: <20261119-submit-dw-axi-dma-stop-pause-v1-v8-6-f8e7fe60594c@gmail.com>
References: <20261119-submit-dw-axi-dma-stop-pause-v1-v8-0-f8e7fe60594c@gmail.com>
In-Reply-To: <20261119-submit-dw-axi-dma-stop-pause-v1-v8-0-f8e7fe60594c@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sergey Khimich <serghox@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>, Baruch Siach <baruch@tkos.co.il>
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
index 99b648d4ca76..2547f9596ae6 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -1202,7 +1202,6 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
 {
 	struct axi_dma_chan *chan = dchan_to_axi_dma_chan(dchan);
 	int ret;
-	LIST_HEAD(head);
 
 	scoped_guard(spinlock_irqsave, &chan->vc.lock) {
 		bool enabled;
@@ -1219,7 +1218,7 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
 		if (chan->direction == DMA_MEM_TO_DEV)
 			dw_axi_dma_set_byte_halfword(chan, false);
 
-		vchan_get_all_descriptors(&chan->vc, &head);
+		vchan_terminate_all(&chan->vc);
 
 		axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
 		chan->desc = NULL;
@@ -1234,8 +1233,6 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
 		return ret;
 	}
 
-	vchan_dma_desc_free_list(&chan->vc, &head);
-
 	dev_vdbg(dmaengine_chan_dev(dchan), "terminated: %s\n", axi_chan_name(chan));
 
 	return 0;

-- 
2.53.0

