Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781958;
	b=q/tNEMc9MXY331TwB2eSMapB5XqKEuvTVgt2a2zMy9Vsv4sPC0VbmaaqTJ9jDYZveqEL
	 YqEYUiESCp6jNTbuUKXFtlFuuPz7bDhTA9coP0kA5Xuwwrr4eZJOu7T6Eu9Lp/cgfw5PD
	 d83LaPK9tICD3RgwMRe/MvWpK+xjpw9ivqTTwlUd4FiUUqXohV2NtG0ayu9PtnYGFynTE
	 tvwD74MQnc/Ih2Dt7+oNnTo1IrVH+a79QXewZQF/vNN0Hgz9daLFc2zadva17/4kahOGL
	 N/3jbgZAS57pco9ilBpIDLdDBW4sItMLE+Q5cd/sEnhKsy+HNRifqds1ys93mxCpW2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781958;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fIqrTXpQ09CNC8YvGhqJeuUImdcgkDCbE32TjDI5dig=;
	b=l/rXqt5opjFENnsIgUSYFqKkkq2+uO6WWCYonFi4ZdItm4/CembTW63PVyGLDMnAE5Zf
	 Q1Z6qbgEpzoD6tL82JdWkbikwmOBpsfjV7sVBYcQ+OeFN3C+eJaFlUCH+BnKA4+5lnjlp
	 6A6zdq30D2JaKAX3uEDUrSYZ3FyIBc+ulV1GYojH2Z5mWWymGfOUDTfog0OP8xNRQqHyf
	 sq8UcPl+mi8WmgmTuq2QiWyVNxxuvkvPp89X8xoBO8PNVCM3Yp/wDKroP8BHAR9M+22Si
	 0mI/2h38t6vWuq6+qOCAeRtDiJSX2ra0Ag29eCHSOKqUZnZ2H6O8uiA6Brl8/LHFFNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=DjIBRJaE;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28766606B825
	for <dmaengine@vger.kernel.org>; Fri, 27 Nov 2026 12:19:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28766606B825
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=DjIBRJaE
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4ad6219f7d8so7274445f8f.0
        for <dmaengine@vger.kernel.org>; Fri, 27 Nov 2026 04:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781957; x=1796386757; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fIqrTXpQ09CNC8YvGhqJeuUImdcgkDCbE32TjDI5dig=;
        b=DjIBRJaEN4ZJKOZQQ9LSVf3UfMicBxgc0aHX+/pe4yAfyDZkY3cA7uwfQAQnS1sSZc
         +np2LfT2AfMmvk1vRPqdWujPE2eSeSG5aTT3lZFH/wwat4beDVyk8OxOweS0gVX77XL0
         G+c70JHOFWOCxAlQ/kszgaNLUEgpZl5N/fH7ZMfplH7ZYT3hWITx6eKpG5q4xSt4Nwba
         t0sx/xVNqt7rnc5wYAQSJevxknVYK1pGLd24Zftxid9DwtqMsn+xCwyBvZrnYBeC2kxU
         ENbW+tlztZTKqjd06eEVC4ZVOxfACQbMJSVXUUa168xebAnbEmrZluP388evlsbItXWf
         0eLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781957; x=1796386757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fIqrTXpQ09CNC8YvGhqJeuUImdcgkDCbE32TjDI5dig=;
        b=G0m7aNt+Tllt0TaDmCGppfJaCYhoNU6SbExFfm+mmRhjhAz413vCHoNa3eTuptRmK3
         hDadFg+XxLtRntoCed92gme0pynGA5TZLz1bGvzB16Cz8Mj2d1on8U8P+7Sia9TDUOBu
         SVqBk3MVRsR9QtWNtyK5573ibaiTP6PlK/C6Jcl0j1+1ApNCgBb1E4ij8RrY9PozsEZC
         Ra/gyp2MfPpj4FNhiNGuH92Teh35OsS2Rtl7/x2CtpWFjaTE7ogLVTgBdlw5uHRBiTnM
         8XfRxEbqJejthsSd0A6D1yvhVlU/13ugc2qf4/VA5eM0hYxrFibqdrgBaTlWJCq2FmWI
         o/Cg==
X-Forwarded-Encrypted: i=1; AL+hErHzvTz1g93KE+mruhfDMG5Wirspw1vzz6HSmeF1/kPoPsOl/2ZY/OvzClAV3zsZrJfwhY55ugpyV+U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/keI1kc5MCZt7vSQApXZC/ao18nRiuYhhU3ID+9yr1lynixlDf
	zhBRVkO5678RdVDz3obdFv+JOomES60ISo/QZq4ql8TW9ef/sh6RhzZD8pj9z2PlNMY=
X-Gm-Gg: AZFdTZe01vpkSi+oKrP+Yc9R4uA4SFnNj1JukDZVSxdVx8Myu2YujYMnj8coAHpB6j8
	qBHUBAuOhG3UdtHffvM0HrxN1TxKx23DozMrHmQKnlViOw8CuFX1sI0on8JbnZcNeLaF7DXdkC6
	cUxX9mXaH1dGooguVJmBEWAW3s6nh2NAHzV6t7iTwYyuXsuiaUzs4lWw2A4QpejkeLv3r7Rq7s8
	pDwwzeRMf22V+3OAS6QvVSKxcUh8psTMFaLkqss38sKhL7mGRIitI/xoJp2nKvxf3Ykr5cQccs1
	mhThlKKrr6Z2YnRiODTB/U4yQQ4CIr2jx74+U3ybavF7d2uIm1d1D5Trwt+aRWVvAPZMWvCewPY
	Iiyeba11OYe+NpXmM5Y0rqMdrtSzYLwpsFnVmLO7F2oy0jErbCivKAKHOrs8oFXR2XAUa8WDIHh
	q/OqXnvUWLypcI2Vo/JKzPwn3J3J3JKtId59glCH8pIS+icRs7JJlAzL2t+jnqfpxyVLuHXuLYv
	mI3DhpDjPxZschCYcgG3npkyBRfl+zUUNEa/68UNe/Q+m4+LkZFwmC10IsdVy4ad/+mCh8PtII+
	rAacvkW7QZwsj4WFpHuLHTpSsrEH
X-Received: by 2002:a05:600c:5246:b0:4bb:60ba:49e0 with SMTP id 5b1f17b1804b1-4bb88930707mr522882365e9.26.1795781956697;
        Fri, 27 Nov 2026 04:19:16 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8d4f9aa8sm663488865e9.4.2026.11.27.04.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:19:16 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Saenz Julienne <nsaenz@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dom Cobley <popcornmix@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH v4 25/28] dmaengine: bcm2835: Add BCM2712 40-bit DMA support
Date: Fri, 27 Nov 2026 13:22:15 +0100
Message-ID: <20261127122236.4976-26-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261127122236.4976-1-andrea.porta@suse.com>
References: <20261127122236.4976-1-andrea.porta@suse.com>
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

BCM2712 has six DMA channels (6 to 11) with the same programming model
as the BCM2711 40-bit channels.

These channels see both the RAM and the peripherals at their CPU
physical address. The bus they sit on maps them 1:1, so device trees
without dma-ranges are handled by the same fallback as the legacy
channels, i.e. by reverting the ranges of the parent bus.

The remaining channels (0 to 5) use the legacy control block format,
extended with the upper address bits stored in the stride field, and are
not supported for now. The downstream device tree describes them with
the same compatible, in a separate node: such a node is rejected thanks
to the channel mask of the platform data.

Link: https://github.com/raspberrypi/linux/commit/99c26cc709c0e3658c3f8d78cfb856cc20bdd0e3
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/dma/bcm2835-dma.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 8fe71de2be0b..99c5e0b9298a 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -1546,8 +1546,38 @@ static const struct bcm2835_dma_cfg bcm2711_data = {
 	.chan_mask = GENMASK(14, 11),
 };
 
+static const struct bcm2835_dma_cfg bcm2712_data = {
+	.cs_reg = BCM2711_DMA40_CS,
+	.cb_reg = BCM2711_DMA40_CB,
+
+	.int_mask = BCM2711_DMA40_INT,
+	.active_mask = BCM2711_DMA40_ACTIVE,
+
+	.dma_mask = DMA_BIT_MASK(40),
+
+	.cb_get_length = bcm2711_dma_cb_get_length,
+	.cb_get_addr = bcm2711_dma_cb_get_addr,
+	.cb_init = bcm2711_dma_cb_init,
+	.cb_set_src = bcm2711_dma_cb_set_src,
+	.cb_set_dst = bcm2711_dma_cb_set_dst,
+	.cb_set_next = bcm2711_dma_cb_set_next,
+	.cb_set_length = bcm2711_dma_cb_set_length,
+	.cb_append_extra = bcm2711_dma_cb_append_extra,
+
+	.to_cb_addr = bcm2711_dma_to_cb_addr,
+
+	.read_addr = bcm2711_dma_read_addr,
+	.cs_flags = bcm2711_dma_cs_flags,
+	.abort = bcm2711_dma_abort_chan,
+
+	/* the parent bus maps the peripherals 1:1 on BCM2712 */
+	.legacy_bus_addr = bcm2835_dma_legacy_bus_addr,
+	.chan_mask = GENMASK(11, 6),
+};
+
 static const struct of_device_id bcm2835_dma_of_match[] = {
 	{ .compatible = "brcm,bcm2711-dma", .data = &bcm2711_data },
+	{ .compatible = "brcm,bcm2712-dma", .data = &bcm2712_data },
 	{ .compatible = "brcm,bcm2835-dma", .data = &bcm2835_data },
 	{},
 };
-- 
2.51.0

