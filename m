Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793949978;
	b=VauJs4xeeaurOs+rmas3m90jpBt2r5RSv78tBduVw/ik8CEvwtWqP7qPzDfiQJKKMoU1
	 djshs9C+obBFXSnPDVWqQZEf5Fv+YlrVkXhBjCI4DF3Y1DXDKm3+bVJtLhAmVSBFeV6Bo
	 7dGEMFX3vkdl9LPWZSUPBknVF9TmRVdcowxNFa8gDujsav1m6kKCWAVL8wYyLzIwfb7UG
	 UwuuTv/6/kSFpPH51BSk/UVbxrUO7gQJiInJXsgyB0KLcGFP/XcDLOa1R7hJUUpluAoac
	 Yx7h3ug/Wnbn0HNsCBpQl+ySE+BzuX0buB9XvU9hejKBbAkaNts5ezVgVkBvx66YaTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793949978;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uX2ZGs6EwvXrx7z1KhmYJO6G0yNzijk1f5Wl5IdM9HI=;
	b=H/RFWTP74OCA7iOUhJmVkxK787eOXKUB5HLmb9i4xlIRVT4VhptK1CGux9xiQHGnXCOD
	 2B43D+VCG3WL0XqO15VipFL1PRri+ff4AZbNFSCHe0zmbk0kozE+iyNCHN73aj6f0c9bF
	 PFBojTE99urJ9ryK+ym8dt1oEIiwxLfDvTq7uWQlBK5zHnmBCjxvdklOFma/lnemga+91
	 o0go1ZEJvQ7o6N3vZSXZuFqb8mQamk9H3fpZv+fSzDDS1IBvmW3NEyF/FJOKfBJBjy7NL
	 J7RxzqP2rKBTKZMlMBa+eWoshWdljfhzbzZtK4rlTncTSKGPnEakNmiyhi6dgtJOmFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wwmut9Ga;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F188F606D80F
	for <dmaengine@vger.kernel.org>; Fri,  6 Nov 2026 07:26:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F188F606D80F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wwmut9Ga
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ed1f1a7695so969915ad.2
        for <dmaengine@vger.kernel.org>; Thu, 05 Nov 2026 23:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793949977; x=1794554777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uX2ZGs6EwvXrx7z1KhmYJO6G0yNzijk1f5Wl5IdM9HI=;
        b=wwmut9GadiMoOHRx7X68DKO9jBcSnJlN8hSTjT1gvaC3YKyBqjxQ1+HIlYK8iClGdq
         uNt7JD+2lb9SgHWGTDAknbBJiECFgPslB5jKhcTuLdpt4hAgVYt2d+6GPju4aoMa1Ei+
         UxjzpbVQuiVbQnxgXzq1QfPrFUPuqela95zoubJ8VG/75Td75zu4QuOFMasRzZpo9+hw
         GwE6tvGtA2ihngoOWUnjQyM9DwJKpEPqDLZufafQHg23bGx/ihAeAVtRReREhJs0LDBx
         6mj0jPsmyyvcfxAw/Hsr2vewdetw3tauHnDLcFmzy9BPkXdWl/lFOkNU5izuLN0LaBk4
         cxyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793949977; x=1794554777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uX2ZGs6EwvXrx7z1KhmYJO6G0yNzijk1f5Wl5IdM9HI=;
        b=qo2S1qLP1E9vFRKBnVz9Lwa+cER5x9PnoafDLjbnlnxGk5eLzD4BRi8yjhV6E45+54
         uXVn/1+S3kyspF4C3HI0lnuYuN6B9fpn2VsN20OyBT5UHFfbqEgjVy4CQM0wppbT9mLI
         m0xHSI7mxt7HPgqBI2momJpeDFBA/WjGPZ69PbdN8fsPxgYnSxoiz1UhdJMdSxbTaJCU
         UlMhe6J4YlYBjAWT06lGybxKhWuGr9BhVm1Z4aThV5k/PI6ikA5k8QnDHGDrAPX0LIqQ
         6TXDJhluD8TGVd0tdaUjYtU/cwKo5t8bbA2LosmW6QFR6jvXfP3aIZFQ78Lov82OEVCH
         wMGQ==
X-Gm-Message-State: APuU4Z/lXNZqPrTWciVe6R/hVUTaGd0dD0Sie/j4dQ7CjCALvPOvJ6bR
	Ufr+UkMGbyQaXKdzhTWmhoxRrMnH99h9lTuJiM4eM1B56r/GhWxLgeHTZwXNRCDa
X-Gm-Gg: AYBFou3zgJGCP0djEOo2Hl73OjmahA80fY/eRwDfIMNaY7ws4dzKTPdN1bOJW+xGtwb
	AnEcak9dm/wBnkGjY09bk2eDccYdlbsQwgylAdZm+6O/m65UsUlUdnpbOypHeN5mWMhhkqIoZe9
	tJrcMJ7oEypKdiwpbhQv5cakrwQRqkCLi3veRkZP23I0vNvGGs3DGTCkCJZK8PNtfk32VXRukhL
	86eoIZ4wRoYHmfbPqzgyMQiPqfsvSdYf+/DMFx8Fl7Yl/BoQZk5sHBdXwFer5D1x2D8EFyAM3pE
	PVtFr1+hOixWEOjI/yMvTPYhFRbUZgOKRvptCpMC1gZNUcpPPDkCUrPruSiN6KCLB3VOzyaxNL/
	hZw18GU/vHgka7fNzC68+Vbly713GtSAoYzlBCyLb88XF8WmdsbqZvOmIoVmMrwy7u2CqgYI2h4
	UXw/4PTv7aAs/6FlcEw4v9BhJPmV2PnBgnegU/BbOg2Nr9DiPyDZdq8GQ8g56FUHP0ClhdacyGO
	1VrqHTbBZcHyyCB6fJ/cx0pPKPluDFtKGp9A1xmuzxOxbYPyHsdaqe58C1JjmDKxpmiTaesv0Oy
	bj0aFHSHRNRlr/u4qAjaUe4YEiHMBSBPEU5vju2mW5DZnv9vxBMy
X-Received: by 2002:a17:903:22c2:b0:2ed:146c:cbba with SMTP id d9443c01a7336-2ed409890b5mr21876185ad.21.1793949977227;
        Thu, 05 Nov 2026 23:26:17 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:28::4:396])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47d89976sm2633715ad.66.2026.11.05.23.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 23:26:16 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: dmaengine@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] dmaengine: pl08x: Use the channel count from the device tree
Date: Fri,  6 Nov 2026 15:25:59 +0800
Message-ID: <20261106072602.77560-3-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106072602.77560-1-mmyangfl@gmail.com>
References: <20261106072602.77560-1-mmyangfl@gmail.com>
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

The Hi3798MV100 DMAC is a plain PL080 except for the channel count: 4
instead of 8. The part ID does not say, and the driver takes the count
from the matched vendor_data entry. The entry is shared between
instances; the adjustment lands in a private copy. dma-common.yaml
already defines dma-channels for a controller node. Honor it.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/dma/amba-pl08x.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/amba-pl08x.c b/drivers/dma/amba-pl08x.c
index 9f5e4f5fb877..27c61a7f2082 100644
--- a/drivers/dma/amba-pl08x.c
+++ b/drivers/dma/amba-pl08x.c
@@ -282,7 +282,7 @@ struct pl08x_driver_data {
 	bool has_slave;
 	void __iomem *base;
 	struct amba_device *adev;
-	const struct vendor_data *vd;
+	struct vendor_data *vd;
 	struct pl08x_platform_data *pd;
 	struct pl08x_phy_chan *phy_chans;
 	struct dma_pool *pool;
@@ -2698,6 +2698,7 @@ static int pl08x_probe(struct amba_device *adev, const struct amba_id *id)
 	struct device_node *np = adev->dev.of_node;
 	struct reset_control *rst;
 	u32 tsfr_size;
+	u32 channels;
 	int ret = 0;
 	int i;
 
@@ -2719,7 +2720,6 @@ static int pl08x_probe(struct amba_device *adev, const struct amba_id *id)
 
 	/* Assign useful pointers to the driver state */
 	pl08x->adev = adev;
-	pl08x->vd = vd;
 
 	pl08x->base = ioremap(adev->res.start, resource_size(&adev->res));
 	if (!pl08x->base) {
@@ -2727,6 +2727,17 @@ static int pl08x_probe(struct amba_device *adev, const struct amba_id *id)
 		goto out_no_ioremap;
 	}
 
+	/*
+	 * vd points into the shared id table; give the instance its own
+	 * copy before anything below starts adjusting it.
+	 */
+	pl08x->vd = devm_kmemdup(&adev->dev, vd, sizeof(*vd), GFP_KERNEL);
+	if (!pl08x->vd) {
+		ret = -ENOMEM;
+		goto out_no_platdata;
+	}
+	vd = pl08x->vd;
+
 	/* Release the reset before reading registers */
 	rst = devm_reset_control_get_optional_shared_deasserted(&adev->dev, NULL);
 	if (IS_ERR(rst)) {
@@ -2756,6 +2767,16 @@ static int pl08x_probe(struct amba_device *adev, const struct amba_id *id)
 		vd->dualmaster = !!(val & BIT(9));
 	}
 
+	/* Read the channel number from the node if specified */
+	if (!of_property_read_u32(np, "dma-channels", &channels) && channels) {
+		if (channels > vd->channels)
+			dev_warn(&adev->dev,
+				 "using %u channels, instead of %u from the node\n",
+				 vd->channels, channels);
+		else
+			vd->channels = channels;
+	}
+
 	/* Initialize memcpy engine */
 	dma_cap_set(DMA_MEMCPY, pl08x->memcpy.cap_mask);
 	pl08x->memcpy.dev = &adev->dev;
-- 
2.53.0

