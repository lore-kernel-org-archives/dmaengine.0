Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B9A3B960B
	for <dmaengine@vger.kernel.org>; Tue,  7 Apr 2026 13:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775568938; cv=none; b=jQGs9dYdQyyeOeHUW2HrnXHUWhHHtRczGx1U5vKdVMqOmbAHPJEsaLz9n1dbhvuFmUvd1pXOXOYN5QtZf3VlWgkWJK8yK6sfpLO54wRh5rFpoemJSccYS2s2mSDDMszrS2qe09aHrrVxizwW6DKWD3E8oNHyLTNEma3H5X9mWhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775568938; c=relaxed/simple;
	bh=wlgiHcw/Rk80blgSRKmBaac9zbE36CHj3pI+3DwhduA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sj2dY3Cao5/DKNZoFWuZwaBXKYAyBiu+XXiBqXLqvWXpw46NbiaLpav9UHQJZRenEKybZJ+xvsiNGLeZYVknoGXIHjBtgzuZq74WA81oQMfg7IgDUpwNXBax8bOeIrhoN1OY6Z/9+0SHCCScCFPKtz5fAUPpdIK4RhrxsJy4e7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=l+sATYvk; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="l+sATYvk"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43d01d6b50cso4780527f8f.1
        for <dmaengine@vger.kernel.org>; Tue, 07 Apr 2026 06:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1775568935; x=1776173735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CTJu85pQngl59MNDpS68s7UI0YBuMw9BWj2f+iVnYOc=;
        b=l+sATYvkvpwAyWBkV456ZreNDwKAqQXW58CplwrCTzkqJ+DQKpIHT60q20zwd+pzDd
         eFqJUckAiVGJXpwV05ky94WIJitohLI/a7jqvTHxmVlpMKQExsCaakDqylGOXIbhA5e0
         F7pPcDU5ZKE61CGudJ2rUYCpKijaMEBIV9jkRe7wg2ymZsWtpBsKsA/CwPnToYR5binA
         FA5RjiKlOcXl0QHxC/7wWSIGtCHOO6V0cUgamc0tYk+2iYtqxnSXExDGkHzO8UBkDvy4
         rgYqXmq8ZfIH1+frnYpIfX8eSjSZPWHgwvKMvl6YRQRzNp420xNSh8YjNc5F3CFUSsRC
         IG/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775568935; x=1776173735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CTJu85pQngl59MNDpS68s7UI0YBuMw9BWj2f+iVnYOc=;
        b=Dhv7UDag94ZgAFwXH1A79k5KAgh+36N6/+iMbdB86eLd3VC2PeiABUCc0otsU8bwo8
         ErlZt7eWMe5yRF/i0SMWv1q1mzKTGafM2T/KtACrRG1nqNnO34R7KVPk34/IFvBPzxcH
         Ix3SjGXDZCX2Daoxgr7leoEQQi+3lSGF5uE/KDKIKk6NeOragUcrxpU+az6UFb5yA/BL
         MpPY/jGNxET55Qb4XEbd0anoylRFTOV6RSnjNyJ/ezIFqttvD+/lWA23dUzHw8+0gAoN
         5aEyaN7Ax/bRZvjelJgArbEhGj9qUvU0ZMfdX1pTotZ/yGKbJlPKRzas3qibUgaelCnw
         PLEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjIIz+S8/dJgUxSAkz8jtk0lW4xJzqX5j7wUpMy2MImKlnaT37uvUpiPdGmBnAfeZje3oATBP8ukM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTkYKXIvqet3M+8NYoHYY2rs7tBmUO0Oc7NZmFBjatW24Cv3XS
	5NZgDTT3q+hrAth9czslAUI123fLVzx6xu/xGVnvzvsUiokmy7DwUSFNYFF1YQ7i8uk=
X-Gm-Gg: AeBDiesz9lXNNJTJURnEPFc5RF/UimmlNzPDmDSJswViU++RbAeZZqm4n1R/PCzyW9v
	l9skzTMrYVIF4INgY7YzLtlDTGtFwhJMeARQ46ZhBFye+s8YpxTbQgu0NsnaodWVYKttQL22r9v
	Z813AAMc3B9DFwJEOGFXJ77iQFOvw3aSyvaxtKvoDgSBdqA7T3vLNAotKJYALtxbA5coOTrvu1V
	vzHIdWlMScOV+bksg2+yH5g0dn6+qpFsszXTaNxQ1HKbkI8wYFb5aaFNyV26ysVX4Kzfbfw8/N4
	ALQCDggyvehc+kL5G+FG2Kzyjgva4SCjz9ZguCbshFDxCCFksbMAkh+9fmzst7AqlZnEBVnoQfh
	i1HOYPeBKqjE0/GcaCnF6KyeATbfAsdklTwKOWFfRx09D71meX6AQ+xoblcVRyuTH/e3D5Wu0wS
	wg/WPbw7+sl6gdcrN5eOKSTo1tv58DKGgJVzLh+ZFJbCu67SvP61pD
X-Received: by 2002:a05:600c:46d5:b0:486:fdba:f5db with SMTP id 5b1f17b1804b1-488995d5fa9mr245123205e9.0.1775568934551;
        Tue, 07 Apr 2026 06:35:34 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488a91686f9sm285777675e9.10.2026.04.07.06.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 06:35:34 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: vkoul@kernel.org,
	Frank.Li@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	fabrizio.castro.jz@renesas.com
Cc: claudiu.beznea@tuxon.dev,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 05/15] dmaengine: sh: rz-dmac: Save the start LM descriptor
Date: Tue,  7 Apr 2026 16:34:57 +0300
Message-ID: <20260407133507.887404-6-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260407133507.887404-1-claudiu.beznea.uj@bp.renesas.com>
References: <20260407133507.887404-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Save the start LM descriptor to avoid looping through the entire
channel's LM descriptor list when computing the residue. This avoids
unnecessary iterations.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- none, this patch is new

 drivers/dma/sh/rz-dmac.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
index ef775ffa1099..cd639aa9186a 100644
--- a/drivers/dma/sh/rz-dmac.c
+++ b/drivers/dma/sh/rz-dmac.c
@@ -58,6 +58,7 @@ struct rz_dmac_desc {
 	/* For slave sg */
 	struct scatterlist *sg;
 	unsigned int sgcount;
+	struct rz_lmdesc *start_lmdesc;
 };
 
 #define to_rz_dmac_desc(d)	container_of(d, struct rz_dmac_desc, vd)
@@ -343,6 +344,8 @@ static void rz_dmac_prepare_desc_for_memcpy(struct rz_dmac_chan *channel)
 	struct rz_dmac_desc *d = channel->desc;
 	u32 chcfg = CHCFG_MEM_COPY;
 
+	d->start_lmdesc = lmdesc;
+
 	/* prepare descriptor */
 	lmdesc->sa = d->src;
 	lmdesc->da = d->dest;
@@ -377,6 +380,7 @@ static void rz_dmac_prepare_descs_for_slave_sg(struct rz_dmac_chan *channel)
 	}
 
 	lmdesc = channel->lmdesc.tail;
+	d->start_lmdesc = lmdesc;
 
 	for (i = 0, sg = sgl; i < sg_len; i++, sg = sg_next(sg)) {
 		if (d->direction == DMA_DEV_TO_MEM) {
@@ -693,9 +697,10 @@ rz_dmac_get_next_lmdesc(struct rz_lmdesc *base, struct rz_lmdesc *lmdesc)
 	return next;
 }
 
-static u32 rz_dmac_calculate_residue_bytes_in_vd(struct rz_dmac_chan *channel, u32 crla)
+static u32 rz_dmac_calculate_residue_bytes_in_vd(struct rz_dmac_chan *channel,
+						 struct rz_dmac_desc *desc, u32 crla)
 {
-	struct rz_lmdesc *lmdesc = channel->lmdesc.head;
+	struct rz_lmdesc *lmdesc = desc->start_lmdesc;
 	struct dma_chan *chan = &channel->vc.chan;
 	struct rz_dmac *dmac = to_rz_dmac(chan->device);
 	u32 residue = 0, i = 0;
@@ -794,7 +799,7 @@ static u32 rz_dmac_chan_get_residue(struct rz_dmac_chan *channel,
 	 * Calculate number of bytes transferred in processing virtual descriptor.
 	 * One virtual descriptor can have many lmdesc.
 	 */
-	return crtb + rz_dmac_calculate_residue_bytes_in_vd(channel, crla);
+	return crtb + rz_dmac_calculate_residue_bytes_in_vd(channel, current_desc, crla);
 }
 
 static enum dma_status rz_dmac_tx_status(struct dma_chan *chan,
-- 
2.43.0

