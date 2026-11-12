Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794471787;
	b=gCa7Rg8d4OrsrvuzNnAW41lpkoeuaFVShoMHJhuv1bUHvQ6NIRFBUPCUZMzeHirtmpwi
	 b/GyuZWZT9HP8hwZoizvCpKx5RsdxVkQlL7WEHTWYUfeTA3BqvMyfubouITI8rZDRHL9a
	 sDQLlb09mim25X5JsOW9D5Prb2yQXaWdQck9jh2wA9alpsQrMoqMd7YGc0ortz17RcUqo
	 C3DfHIu89JKNnrkvzRmH21ArA3/53cmYpAUS8s1dK56MfMzoHVfiJXGYV3erwJ19FS7tu
	 Gc9+Lv3YE9xznjhhu3jHml2UrGu/icJ5u6qlKw0uVVOSo/DcrrbcFmK2MIh0BbtpuGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794471787;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=AOVjVYWiGu1+2CTZWPQd/l37VMMlzCbF4uz2qUZJc8U=;
	b=4VNaLKf7DY+6sQAlZo8gS3fzDe7bTmav202kIOeohLWj9XVnX3QNSFVqeyxVa1fN+J77
	 /lHeoHbnA6aqGB+BObMSFNHRLu8NdjOdEmSTITJs7xaxB0ymm6mCtBC00y8NUIGTdHbK5
	 QBuRRIr3ke0TV/VshK/GH6K/emdMFmoEtJ7nV5+27AnR9DbJnXz819fkv5eC3aGHd/Xg8
	 paQwwi++rcJLaLvGTJM0ZMtL3QRvABbcf+nw5K57QmxMIPvOmc2NuaLENkfKalSTzDLYg
	 hF6KyFj3ciZ7ER1N5oa1D8dpImG79oAOafTMk95SlxUHEg6yOrbRnW0418I6ZlK2Zhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nebyfDoB;
	arc=none smtp.remote-ip=209.85.167.182
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E80606A327
	for <dmaengine@vger.kernel.org>; Thu, 12 Nov 2026 08:23:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02E80606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nebyfDoB
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-4b28d9537bcso470672b6e.0
        for <dmaengine@vger.kernel.org>; Thu, 12 Nov 2026 00:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794471785; x=1795076585; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AOVjVYWiGu1+2CTZWPQd/l37VMMlzCbF4uz2qUZJc8U=;
        b=nebyfDoB1rNHZ+Kch5TPoQSZP2hovXmtIfL0xayLYT1vS0/h66ZJWayqk7Xuzqpyfk
         nt/DFcQIp+EORJzLARh413fLVZFXMiLs/5h/M6h2DUh22cdVSswUuCs1I97M4ZhQBHrA
         NiRSCH6D2i3XgwxRyJhIyl8A+RMoecUVP3sDLzGwHceMYONiFm6z789t3Z/y37oZ/GRQ
         7q5A6CjAEHsZ33yKA1Kjr3kBmpvgFcCmyUEYZ6c1zXJZ3Am2UjVWuDiz4FERC1WOdPxD
         vummTuDZAu+Jr43hHftitntzuLeFhREiPL2qiLTOmCR4RL8ZV2vt7TU+QEYyB65Sa9/+
         c08A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794471785; x=1795076585;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AOVjVYWiGu1+2CTZWPQd/l37VMMlzCbF4uz2qUZJc8U=;
        b=f0PMqwxZ1JXaYyWb0ZRy6NKd7jfCiJDasVlVA3gmFGiFVd22mh7m6MHLC2igrx4CpF
         g/7Z6UIm/kh5vvtPPEVakRgSC5cAQaKD4KlTeAwWRbhL2oGaJqmKX9Lcs9fXlSHO1rOt
         4P05+qxCmeD90galVbo1zvFlkDbu+Sn2VDe6Pz+dB1eNyRoAEP6NDapqspF2dRRVRebz
         2EHE+DayIqDrtZ/2Cj2xCxQEYecN8ZL0MdZ3BCPy9qwI7jBlUuskdhdF0eN0LNi5grHT
         8XPKRglPNnIubC1oPTzb03uYedh0k/FlE2hJt5IauAzB0OXXxPHpOv5AbxhYCMVnUfXG
         SMBA==
X-Gm-Message-State: APuU4Z96TJ1xgCi5DljcONq7LzYkV0msEHAu+pPfbOH9U8vlsBaxs8tb
	puBX4GwNgpU/wVRtuUR362YXF0FSSU7VoZKw+nDfh65ufU5AD6RR0u3w
X-Gm-Gg: AYBFou1NEDLAucFkMF4qw60SIYC7yKQnTC//g5bXKil7wJqpAj3Lj7aIXB5zfVJ0Gwg
	BMb2vysEOpUgZAmGcdTRPfgdf/gfLtc7VoPfEjbsRtM9MARVPIfIkL7hcDw+Mu/sWT1BdgsjXQX
	heEUNxaIFq/g6vx9B8scdsX9nWuZGNsfZ/FW/cksOZg4Es7VjdRf51u9YFtKuoc2U73/E4/G0Ws
	O1yHwQURQ0mJ6QCE6Qie/QdIZnnhZSxw8H+dQTS4tGzBrnndZFaKMtz5a/8C3v1feMvL//0k20H
	Jon1yn3syw/9LPr9stAF14qasv555OXhXwSdoMxqQgJXUKI1qDbB2OveyNDL50AJchGwnQnbNDK
	lRlknaZsZLP9z+2cvE2qg+SdSV8XyZE058S+QzKoD6uZcL2ML22ls5M+tGpsCdFPneJ8rQTEfjJ
	fM8mbP7uYfLp1cX7xp8rj0/0To23+XDR3Hx+nuK7rxBs3Sf3tH3RFQXS1QKfF+pCF34XztT7amW
	yFA1h/ZzcTqCFXKAlEPLOJMrFJzb50zPvq+EceG9pnmXDRjogSELrBbchPxHB5FOduWi5rbl5dX
	IPVfb3TOiE3+l9cO/2FwueKKIYx0ldNufwM56Ilr1wHQADDuxP1AIQaNsL+EcL9gmh/jrM7MYvb
	vKzhb1+OdOaW+Y+vaLbxS1ilLk8aVowmXYmLh+UiUrToXYly5D9957zbGOCljtCuAqTZb29mn/P
	IuyA4bdQIWW/PFjwbNFmyUVnWG3rYlvXPpN4Ckz6dQ/AG2W3r8YYM=
X-Received: by 2002:a05:6808:150b:b0:4b8:4703:db97 with SMTP id 5614622812f47-56cd86f35e7mr1457409b6e.32.1794471784939;
        Thu, 12 Nov 2026 00:23:04 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905d3bab2sm7411157b6e.12.2026.11.12.00.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:23:04 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 12 Nov 2026 01:22:51 -0700
Subject: [PATCH v4 2/5] dmaengine: dw-axi-dmac: poll the correct enable bit
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
Message-Id: <20261112-submit-dw-axi-dma-stop-pause-v1-v4-2-3ebc24b243db@gmail.com>
References: <20261112-submit-dw-axi-dma-stop-pause-v1-v4-0-3ebc24b243db@gmail.com>
In-Reply-To: <20261112-submit-dw-axi-dma-stop-pause-v1-v4-0-3ebc24b243db@gmail.com>
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

