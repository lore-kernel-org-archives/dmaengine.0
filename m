Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792798715;
	b=ekn7MdygHVYL6AbAuxowgUnjgzR+zO8Mx7m14JXmYrCcp3oRv7niSiE42yEFaOXZR6HM
	 oQ8lDCDSesXtFDeymAyhZGgJmp1v4lahBGstJRjZ7FSEuv/qpb1nhG+LzUjRi2MhVzwKC
	 KFXXBbdkfR3gdoZr+UQVgEDW4G7/ANjgEM1H6Evk2Q+leMgIuFr7H18Fl3xM64Voc7z4X
	 /NdeJWiTOsfFjBKY5/4oauiOUVcyLOt07s2ifRHZjAZ7yYcAL6OF/M8AXGlFGkmttfLtM
	 9iEJkaCRqHY5w/qrGyEx2MfkLe5p9a+NLP1s9wu6m5+220XHMPZjnHMEagb01lSFPbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792798715;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=F1ArQRepK8gqW1fEvOkHLMAfG1V96lqFmDa0NrMk7WU=;
	b=fQvIkXnhCTTfmXQGJdFxv9hoTv0mDl5XnXDaLsIDxLTOrzhIDeW31TUsAzunmTh7bWBn
	 CBXdjO6P0S/0PomaaG90NGilBw9Q7M4tx3CWcYLwg7SNRLM4BSD+dcq8IycLCRKDltOZT
	 y8jr3ZYe5KVchcJ439gIxz9YDZkUgEgURFnxI+8yWQtacyrdxUTDqomjr/Pd55aQUMfmY
	 5oF893keE7Xuuat5ajWhb0ytC816VHtXqWDSGQakKbWOIL+FrR0wFgqRFiNZOTPS5vkHA
	 1vIOcv6V2kLBbWLnlhDo4ypgMdZ34b8rKNhXQ646zKEhRwQnkqWNz51ZPk66+zNMGeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kChqaT5N;
	arc=none smtp.remote-ip=209.85.160.50
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80814606A32F
	for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 23:38:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80814606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kChqaT5N
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-4a755bbe158so746622fac.0
        for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 16:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792798714; x=1793403514; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F1ArQRepK8gqW1fEvOkHLMAfG1V96lqFmDa0NrMk7WU=;
        b=kChqaT5NmBZqpA3iflROJTJQAX6sH8dLUdwc51nspheaRIkaMBH71acpp6mw09x5h5
         Li0RgZkGbC9v0NBFtqZdD6GtSVJquxQ+DE5t1IkniXQUmfVJ1P1i7+M8XVayfhOUQx21
         w1qS+jsKAvoorh1y1leFo/GqE6P+GTWYDBlW2G8uaSoYLZuMIRHFWHUXL2cI7DhypToe
         B3jLeHS+XBFLzeBeWBsIz4HT/xqRJxe/TGtPa393U/iPKc60NeeZkxpQirF1CMfKclVC
         u26Padv+x+JbLNdrlzEWq+5DsNIzGHAZIn2VpYKY8LSDd4+nmDrqhUkQkICUQGRwiwjL
         BkQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792798714; x=1793403514;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F1ArQRepK8gqW1fEvOkHLMAfG1V96lqFmDa0NrMk7WU=;
        b=Te/7JTDS8/zHZ0P62jpGJeLOmJ3TFw49EUYo7ExVgtiWc5oJAMutV5GYIgXDMuN2Jh
         VaNrALIkFieG57IZMS6maUoDHEiNBF2yL1HNDVeXwm7iJz/Fpms8iNyL1HFCadhQWRdU
         ZXJ9YY8CgKEUdDasxCp1MrlAxS0zgjJF5MVRw5/bLHdP2GIFsmJQnrF9ikkn66G6jUZw
         ePtVMvUKTcxNcxf2tEWL2MNeUGDRIWevwKAgBCGEdaAvSHoguFWUjaeI1BFc9FWAuXIt
         ODN2yWgx+YD4+WLTD7Dy6DwmFClenaH5aaWARCKaHBkPKX5NwwWMzngPddBqVvjz3zy0
         Z0BA==
X-Forwarded-Encrypted: i=1; AKwUvBzKGAeU6nFrasnkj1gkGnZfX/G1OBr0aGIjm+tib/+xehXWU9UJgzw7KKMes1kIer6fXwaY8eveayU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIPVB0InoAmL84X7r5LVgG7diHtNoyr8q+MR9uY0IgGoiyPtQOR
	j/H6h/ix7J3rV3TlRZtosDypvLQ1UsdRZIpbP9tSMyjZARxaCTLmhYTc
X-Gm-Gg: AYBFou1qc6GGwdDu440mcIBIE7LIPWVmHxLSvoPnumLqfiC3vmwDCdxIR2qhFN/WXlS
	d1eUG+G3f1S3Q9LHlBewK0aNjqJawwjEVus+ffcYiuL3pXIFcczDWi1yEXo4hE0iZfA3n+eSBL7
	rW2BMpZm8/dtPN8u+iTzsxBLjOfTkBZMMyGpaASKM4Nh5l6zuMAE+/80XISI4Ol4SN3vpeWBxfS
	YSXCaL5zhvYDATVeQxQXqMoiOmhqeSZu5p1wSH4dwgdDBHTdWzexDB7+X2vWM94tSzxG0xfq6Cd
	rStcyNkfu0Aw+nU9u3DPVstje81ppZsLf5AWSj70pZBsHoIOvKRJKj4jMi/rt8I8QZjjaRVOXga
	ggpSvqWnElQlFw+zHRpXVLczAmoNWe68F5jKeEDZIkByWl23AAOHkAVqqV6os7XacsUgJZXL2qI
	qBCxX5if+qyKDiRgyiM67kSmaaHa8dSOQUOOPR8IqQvkTggzIG5Wq70zkJ/1xsHzQCDOWZNdsvC
	spAMUugCTUG5RnyUZ3dkdzdlzoSk8vIUytfmfU4Dd9IwnFabm+gv6iN5jGeTlB6/TjfTmZmAt70
	YQ9wm6WH/in8/DfN7QjqAgdKge4alxDGha9zUEFaHzLh+c5LirsMsjhIqlAF9r7y+qmGi8tmMEg
	Fh8aObOLOC3vSYGMwP7TXKYEyDZ8CJwsZyl2qfJTfzO9hTZPZ1GAnFp7XhfFmSpS/KY+wzdfzsC
	bW41w=
X-Received: by 2002:a05:6870:af4b:b0:467:e082:b93c with SMTP id 586e51a60fabf-4a83f053a93mr469646fac.2.1792798714477;
        Fri, 23 Oct 2026 16:38:34 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a843225d69sm284345fac.15.2026.10.23.16.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:38:33 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 17:38:21 -0600
Subject: [PATCH v3 2/9] dmaengine: sun6i: handle the last partial interrupt
 bank
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
Message-Id: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-2-ef1acb0be768@gmail.com>
References: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-0-ef1acb0be768@gmail.com>
In-Reply-To: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-0-ef1acb0be768@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Arnd Bergmann <arnd@arndb.de>, 
 Maxime Ripard <mripard@kernel.org>, Jens Kuske <jenskuske@gmail.com>, 
 Jean-Francois Moine <moinejf@free.fr>
Cc: Hongling Zeng <zenghongling@kylinos.cn>, 
 Chengfeng Ye <cyeaa@connect.ust.hk>, 
 Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>, 
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2

The number of physical channels need not be a multiple of the number
covered by an interrupt-status register. H3 has twelve channels and
eight channels per bank. Rounding down the number of banks leaves its
channels 8 through 11 without completion handling.

Round up the number of banks to visit, and stop processing the last bank
at num_pchans so unused status bits cannot index past the physical-channel
array. Use the controller's configured bank size for both limits and
the physical-channel index.

Fixes: f008db8c00c1 ("dmaengine: sun6i: Add support for Allwinner H3 (sun8i) variant")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/20260706065650.34B131F00A3A@smtp.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 9d94a37fcf10..3a6525dd3d32 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -587,12 +587,13 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
 static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 {
 	struct sun6i_dma_dev *sdev = dev_id;
+	u32 channels_per_reg = sdev->cfg->num_channels_per_reg;
 	struct sun6i_vchan *vchan;
 	struct sun6i_pchan *pchan;
 	int i, j, ret = IRQ_NONE;
 	u32 status;
 
-	for (i = 0; i < sdev->num_pchans / sdev->cfg->num_channels_per_reg; i++) {
+	for (i = 0; i < DIV_ROUND_UP(sdev->num_pchans, channels_per_reg); i++) {
 		status = sun6i_read_irq_stat(sdev, i);
 		if (!status)
 			continue;
@@ -602,8 +603,9 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 
 		sun6i_write_irq_stat(sdev, i, status);
 
-		for (j = 0; (j < sdev->cfg->num_channels_per_reg) && status; j++) {
-			pchan = sdev->pchans + i * sdev->cfg->num_channels_per_reg + j;
+		for (j = 0; status && j < channels_per_reg &&
+		     i * channels_per_reg + j < sdev->num_pchans; j++) {
+			pchan = sdev->pchans + i * channels_per_reg + j;
 			vchan = pchan->vchan;
 			if (vchan && (status & vchan->irq_type)) {
 				if (vchan->cyclic) {

-- 
2.53.0

