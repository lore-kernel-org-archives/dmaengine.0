Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8886643634B
	for <dmaengine@vger.kernel.org>; Tue, 20 Jan 2026 13:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768916026; cv=none; b=tZ5PM5ZhE+y0VY/WBfIL7LwWQL+EFumbKfVUUWPNSE6rxvbQNliH/V++VsOqkPHgWF4KnATyVZIrGFeg6NOhKTraXo/icJPkToaQqsHJCjpIoAVBfk6qvCmhh6+Q1RKmJVCfcUQpp3wIRjv/eDXktQBFRIcuuj2tMEuvLju2vfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768916026; c=relaxed/simple;
	bh=Fmghef1Fww0dPCiuwecGEhxAwkx9U8pFSKi7M4eGW50=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G2vbKciH7mqOUjNXdSyYOdOw2DsLu/yWl0h/fkDP1GYFg1//imuIJgZ38TIZFlgOTBa6Suq+R08LkoJv+WTlul89XF5jq3r77JD6G7zG966SYaSBI4ToqaN4Zpi2W1vJxH6aLdvMvBb3JqJxkN+c1ZKvZVsljm4sA/7SC6tEyXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=TnXml3zX; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="TnXml3zX"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43596062728so172980f8f.1
        for <dmaengine@vger.kernel.org>; Tue, 20 Jan 2026 05:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768916023; x=1769520823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Avajm5y4036daHiMDTtwCw98gx6dBRxK0z6ouokSi1g=;
        b=TnXml3zXzsfj8ZbBW7Or2o8WzUlAIN3JOgoYfajkXdNUVgVsVe8B8aiCF/unq3ffqV
         IdIR0RAxg2Dx7nNzj+QLam1Woy+AiZYG6TtpzRf645NUjwen17sLklAXwt5gMSUUhsGw
         tbXhxgcDh+0iwp+6mjTfyYWQLY+TLGEDQgh0Er44v32Oc0K476+wGfKfL1iYfqpFwo+2
         YoOq1fWnce/2e0mAdiKStxX/Gu89o3uMsglh0cHneno1TjpDJYHP82IaI6Bsi62zt/t+
         b/seE7sMXjPelb4bFNgATpui8Nc44wNoXQ74D/tEsCYRgmTkA4w5gpAoYEJa2SLeA9B9
         FelA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768916023; x=1769520823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Avajm5y4036daHiMDTtwCw98gx6dBRxK0z6ouokSi1g=;
        b=wR+jlAVcS2/Vl7tVBorQ/4VB9vHyFVW9V5sGrubCL72I5RHv31SsFNIdnukYcJ8S9N
         FNxulKTobQ3kWakNhdjNYDGQoByMAaILzZqcVZvMGdmc+QbgiYnOFdYPcaGngE10ooua
         HBMy87KEuPvZkesDsQqJm5JaKA9/Dco9SLEwr4cosZGjmTiK/fJnlFpXQ+17EsUqdXf/
         HBvtPVNN61yo3EMt1E51NI0gFkCIdg3vbn9riWc7N8CuurRNW1kDygTeqmykmk24YRE9
         b8vfmg4TUCmEa6vdAS0p3ScNeqR4S2DC8LBfIkPNn6Oe1ZHtVhvh295siqmpHkYYPWfz
         xFEA==
X-Forwarded-Encrypted: i=1; AJvYcCXeqWTk2+zM/0fYL+OI1RnZt+zxL2PQe5R4tEtjBShi3htqebX5X6L02FjT3sGM6yQxV3nXTp/PrmM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqFg4AafVlItKkkT24YoDuxTVhspIP6cvaxnPCLS0noHs4kkDD
	mfECxuB4k4tuNgeHD7mUBoFXHlrdLaakoadCQbHSD/BFn+e9XOp6XLpnUBcPMbxHhBY=
X-Gm-Gg: AZuq6aLESoU+lqBdhQF8tpOXgoQKO72Jafr0m2Q22+46vgyg4CI6+8hBYmLSUIAUsvS
	gXW3VyrbG5nkPrM95tH5pZBIgI4f5COrg4wAfMTg4TVjlf29tArRYiC5bNtmXQkfB0vBnkvqVcS
	odiyUGQYbKHV2CAm1D+UyA3fyUuq7PAnUF+zwSGcYiWZqpTE3JDXDhLXtD4DpRt+WZVU9iKwoGq
	dciT4icUHNE4tbRNAtuQY6QETHtsSCwlJStHhZnwl4vnR9ILgGXgrNtJ1qyFNYffMPag9ALXYc4
	e94B7ErjJwZUfVNIIUr6HXcy4e64yAPwv6xc9+QrUXY8jHfESHg47REL2Wnr7OEQfG/1XEoLUeQ
	54KgBQ0MGI4xjH3vjpQW4XMxHAkutkS70xYe0PzgNANxPkqo3ToOCKIo0mIlUvhet7gNOPvaS+P
	8H7BTFhd8zd41dlRaVVVgft0gpO53E06M30mgWdag=
X-Received: by 2002:a05:6000:1817:b0:435:9144:13fe with SMTP id ffacd0b85a97d-435914414e8mr1903692f8f.26.1768916022893;
        Tue, 20 Jan 2026 05:33:42 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356996dad0sm29331439f8f.27.2026.01.20.05.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 05:33:42 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: vkoul@kernel.org,
	geert+renesas@glider.be,
	biju.das.jz@bp.renesas.com,
	fabrizio.castro.jz@renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH v8 2/8] dmaengine: sh: rz-dmac: Move CHCTRL updates under spinlock
Date: Tue, 20 Jan 2026 15:33:24 +0200
Message-ID: <20260120133330.3738850-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120133330.3738850-1-claudiu.beznea.uj@bp.renesas.com>
References: <20260120133330.3738850-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Both rz_dmac_disable_hw() and rz_dmac_irq_handle_channel() update the
CHCTRL register. To avoid concurrency issues when configuring
functionalities exposed by this registers, take the virtual channel lock.
All other CHCTRL updates were already protected by the same lock.

Previously, rz_dmac_disable_hw() disabled and re-enabled local IRQs, before
accessing CHCTRL registers but this does not ensure race-free access.
Remove the local IRQ disable/enable code as well.

Fixes: 5000d37042a6 ("dmaengine: sh: Add DMAC driver for RZ/G2L SoC")
Cc: stable@vger.kernel.org
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v8:
- none

Changes in v7:
- collected tags

Changes in v6:
- update patch title and description
- in rz_dmac_irq_handle_channel() lock only around the
  updates for the error path and continued using the vc lock
  as this is the error path and the channel will anyway be
  stopped; this avoids updating the code with another lock
  as it was suggested in the review process of v5 and the code
  remain simpler for a fix, w/o any impact on performance

Changes in v5:
- none, this patch is new

 drivers/dma/sh/rz-dmac.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
index 36f5fc80a17a..c0f1e77996bd 100644
--- a/drivers/dma/sh/rz-dmac.c
+++ b/drivers/dma/sh/rz-dmac.c
@@ -304,13 +304,10 @@ static void rz_dmac_disable_hw(struct rz_dmac_chan *channel)
 {
 	struct dma_chan *chan = &channel->vc.chan;
 	struct rz_dmac *dmac = to_rz_dmac(chan->device);
-	unsigned long flags;
 
 	dev_dbg(dmac->dev, "%s channel %d\n", __func__, channel->index);
 
-	local_irq_save(flags);
 	rz_dmac_ch_writel(channel, CHCTRL_DEFAULT, CHCTRL, 1);
-	local_irq_restore(flags);
 }
 
 static void rz_dmac_set_dmars_register(struct rz_dmac *dmac, int nr, u32 dmars)
@@ -574,8 +571,8 @@ static int rz_dmac_terminate_all(struct dma_chan *chan)
 	unsigned int i;
 	LIST_HEAD(head);
 
-	rz_dmac_disable_hw(channel);
 	spin_lock_irqsave(&channel->vc.lock, flags);
+	rz_dmac_disable_hw(channel);
 	for (i = 0; i < DMAC_NR_LMDESC; i++)
 		lmdesc[i].header = 0;
 
@@ -706,7 +703,9 @@ static void rz_dmac_irq_handle_channel(struct rz_dmac_chan *channel)
 	if (chstat & CHSTAT_ER) {
 		dev_err(dmac->dev, "DMAC err CHSTAT_%d = %08X\n",
 			channel->index, chstat);
-		rz_dmac_ch_writel(channel, CHCTRL_DEFAULT, CHCTRL, 1);
+
+		scoped_guard(spinlock_irqsave, &channel->vc.lock)
+			rz_dmac_ch_writel(channel, CHCTRL_DEFAULT, CHCTRL, 1);
 		goto done;
 	}
 
-- 
2.43.0

