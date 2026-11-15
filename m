Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794727188;
	b=FcouFzh0gh8G920R/oxX6+reyqBznK9UFRFCY82a9FIFI/52k9gkZcMV1jZcKFnHwsC0
	 omcfYwdhVpFAKmJyzKOir9EmjDK7IokBB8W4g44YM6BuUMOXvM656jTcIPs8mI34YGmx8
	 ItJZ20eJ8KqkeAnldYtVUq2xf0OEaSEYz61ul3CgXem7ycK9fdv0Zy/hJB8q7FadJj1f1
	 qTDwRWjholGUOhS7OxpcfZUuLuF4lWMuFIbcaAVkgVgJkB+pHBQ2We7GBBYMQTc/gOf/h
	 C1+pFcj8O+Q6tneIinRpcHv47a8TANZ60du3XKh5+QETHsMexQVf7z3V71xbac6InFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794727188;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=dTZw+th+8Oe1DXeAcCeWuqBX9XGzYLMqzgYNqTgZsHI=;
	b=saYo+Q8QiGBEhNHfRo4b5UIoUf6YFzVOCozfBLBSWgtcRrovf2ZEckkrb9QkhxmzkaZK
	 GyPrpy3hgo3bAoc+41WQ5d/RiY0mmFt6oE+B814A79bxQMT0Wv0ZiqptRWkDIBqqv8a9y
	 L07lFmg3jeIH7HUezMF7aHh5RO/QBqzk6phq4K3dFMgR2iaFAtXrt35Z8pHEXsvEgFkrn
	 f34ufN35hzBMZX4F4WNwr9wbjwLiLVondGPAyKh0KsChY0Ly9jDYqCgNoQTD5D5M3LB/7
	 HHK9ThVLEeRyCkUTxQhsqDxl6CYq28xgqdTzhpFyO/RrvRVEsLKWum0y8KtEefJszlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ck/EJRgd";
	arc=none smtp.remote-ip=209.85.161.43
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED8460A2600
	for <dmaengine@vger.kernel.org>; Sun, 15 Nov 2026 07:19:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EED8460A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ck/EJRgd
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6de2f213b7aso887289eaf.0
        for <dmaengine@vger.kernel.org>; Sat, 14 Nov 2026 23:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794727187; x=1795331987; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dTZw+th+8Oe1DXeAcCeWuqBX9XGzYLMqzgYNqTgZsHI=;
        b=ck/EJRgdKqGC7cXPITkzdHjaQLHvhByrX3uVCO7/7RrT7F8xvaxJYD868XZ5kzYi0R
         08JM4XEK3L6R2MHR4KsC1onDpWWIvEZ3/NWe/HdOTt/zDeIj1SiVLWY6MXYy+lGHWEL9
         C1Im4dZ0EDQ+SzQRHRUe1Yq44tks9mBZRPawFZOB0oL7PgfwxuGyHFyE0014fHiCpgoj
         DFeUj2I4dmwxjaDLgqgcI8ud1Hh37xNgdKtzUzHvsXLeUkI5TGYt/4TPCVi+aRgep75U
         DrQJRsIwwt3H56Cm9edMcuQUGtL11d3OUoROlJTctxKyeqiUtDSy2JV2Ox612UvYj5R8
         lntg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794727187; x=1795331987;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dTZw+th+8Oe1DXeAcCeWuqBX9XGzYLMqzgYNqTgZsHI=;
        b=aXGJMXLSRCZHUZYGlPWCe32YviAjXBf5ugTyjw0qp14NImqXw0QHjH6sCaoz6CWNG8
         frOEVDLmTWOknNZ21N/wpttKwGqkY3WsOsjQGbBL04NGEL5hxb1sduP/8GJkZxxshBFO
         051eu0My7SFGrmYQlZD77bYMLd3DNANKAjAYzx4hhOb3cPmaPH1vhV89+D6Oqo+r53GS
         a6PjHxjxdg2yTrLFbMoiSPgsVT8htw4URD0opgdT1KBL6U250o1x8pJCa8vGxxD9xjcN
         BKLvEKhJOg4tWac80T1U6di9jjEvvigcnyUpttRZlg/jZZPMHWudl8w17/6PQZmXLY1R
         EF/g==
X-Forwarded-Encrypted: i=1; AL+hErH0sFB7qlAj1NjEELDSWfFOYVp/stMLYzy1BjqydtwNR+0ftU/NJffzic32fJtO96hiv5tLvAtCvT8=@vger.kernel.org
X-Gm-Message-State: APuU4Z++5lvDBWnaGqrAd1HK5fkm/3HD/x8XnaaiK3OyNbtVlxkZodUu
	VRvzFx48ihSog9xvwXb4c9JiuEJ5XC8rmfJbdQcdojJ8giVTxGiEA3nW
X-Gm-Gg: AYBFou2QxrPtpFxgCn99MkiZrPI+dgIBfpRiTWAOQRxo3TtlUnbpc7mmBBNLmYBxLJp
	M3hs4TtcxrwCtl2Stt67JGiPddYeTw0U6kR1mhWmVgmx+4HevjxcFwE1dO5nxHQ8LfIaAahraqR
	OiNg20BcDqz6mhtfZ+63nUq1PGckOIyqkgvaVzR3AcE6lHwmS9LLOboNDnTfGW98HyK65g07XIF
	rRiaJCOfGxlmEMuEUdP9GS02hvNonlq6coJ6/0oDn8K3liizMXLVZCkL3eLH6YgyGVpCHbFM1da
	eteR1s9PoVzFbwgugByZgYg+dW30tkyAfIE2cH7tv8qA4zpio/DjTPL22uniECctqFTftL+fwR0
	Xqz9sfvN4eFTibQzfX9mCigECd/bMzOpF8V2ZQxqvxDLoon7O8vuykAtw4eq8Zp0y3NOILq0hee
	yWMXWUiHph75hLiedXw2wYOibXh3IWCd4B8OgjR2io+7+q+ORgTGbv8vJCpmo/rsehM7kn+vLVq
	3CmyJdk3T1M3bEqylVXscaMZfYY4UarJNQDI29/okjGSGzoBaMNb30JcbK4frIMFAuwXqyHM80j
	RZu7JnoI5O9TTm4rIikAk/DTJI6d/bFd2b3dijjJ7CaQrX1sXL7M3OmARnmtRNx59Prtob39B4G
	KmkxMS0E4xTaaqxA4/arMdXW9oJfNUuw+PHFWOS554BmcmE9Zmn2bA98HGtr5A9hhfhj/yXUhMa
	xyvduhRPFFXQxtL9c1XBIFn7Ux0mMAaDb9rSBp2Gs6q4leExjAfCY=
X-Received: by 2002:a05:6820:a29c:10b0:700:371e:ee02 with SMTP id 006d021491bc7-71ab50bdde3mr3199222eaf.53.1794727186924;
        Sat, 14 Nov 2026 23:19:46 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ae860ebd7sm1145321eaf.8.2026.11.14.23.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:19:46 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 00:19:38 -0700
Subject: [PATCH v7 05/10] dmaengine: dw: calculate residue in the status
 getter
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
Message-Id: <20261115-submit-dw-dma-synchronize-v1-v7-5-8d58f3d49e4d@gmail.com>
References: <20261115-submit-dw-dma-synchronize-v1-v7-0-8d58f3d49e4d@gmail.com>
In-Reply-To: <20261115-submit-dw-dma-synchronize-v1-v7-0-8d58f3d49e4d@gmail.com>
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
 James Hilliard <james.hilliard1@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2

From: Serge Semin <fancer.lancer@gmail.com>

Calculate hardware-LLP residue while looking up the requested cookie under
the channel lock. The scanner and the status getter currently take that
lock separately, allowing a descriptor to start between the scanner's
residue update and the status query.

Have dwc_get_hard_llp_desc_residue() return a local residue value from a
fresh LLP snapshot. Keep the persistent residue field for software-LLP
block accounting, subtracting the current block's progress when reporting
status. The descriptor scanner continues to advance software-LLP blocks
and complete cookies from RAW.XFER, including for polled transfers.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Fixes: 3bfb1d20b547 ("dmaengine: Driver for the Synopsys DesignWare DMA controller")
Cc: stable@vger.kernel.org
Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
[james: retain polled completion and software-LLP progress]
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw/core.c | 64 +++++++++++++++------------------------------------
 1 file changed, 19 insertions(+), 45 deletions(-)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index 5a1caca7ad68..d9127337c849 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -267,41 +267,34 @@ static inline u32 dwc_get_sent(struct dw_dma_chan *dwc)
 	return dw->block2bytes(dwc, ctlhi, ctllo >> 4 & 7);
 }
 
-static bool dwc_get_hard_llp_desc_residue(struct dw_dma_chan *dwc,
-				       struct dw_desc *desc, dma_addr_t llp)
+static u32 dwc_get_hard_llp_desc_residue(struct dw_dma_chan *dwc, struct dw_desc *desc)
 {
+	u32 residue = desc->total_len;
 	struct dw_desc *child;
+	dma_addr_t llp;
 
-	/* Initial residue value */
-	desc->residue = desc->total_len;
+	llp = channel_readl(dwc, LLP);
 
-	/* Check first descriptors addr */
+	/* The first descriptor may still be waiting to be fetched. */
 	if (desc->txd.phys == DWC_LLP_LOC(llp))
-		return true;
+		return residue;
 
-	/* Check first descriptors llp */
-	if (lli_read(desc, llp) == llp) {
-		/* This one is currently in progress */
-		desc->residue -= dwc_get_sent(dwc);
-		return true;
-	}
+	if (lli_read(desc, llp) == llp)
+		return residue - dwc_get_sent(dwc);
 
-	desc->residue -= desc->len;
+	residue -= desc->len;
 	list_for_each_entry(child, &desc->tx_list, desc_node) {
-		if (lli_read(child, llp) == llp) {
-			/* Currently in progress */
-			desc->residue -= dwc_get_sent(dwc);
-			return true;
-		}
-		desc->residue -= child->len;
+		if (lli_read(child, llp) == llp)
+			return residue - dwc_get_sent(dwc);
+
+		residue -= child->len;
 	}
 
-	return false;
+	return residue;
 }
 
 static void dwc_scan_descriptors(struct dw_dma *dw, struct dw_dma_chan *dwc)
 {
-	dma_addr_t llp;
 	struct dw_desc *desc, *_desc;
 	struct dw_desc *child;
 	u32 status_xfer;
@@ -309,7 +302,6 @@ static void dwc_scan_descriptors(struct dw_dma *dw, struct dw_dma_chan *dwc)
 	LIST_HEAD(list);
 
 	spin_lock_irqsave(&dwc->lock, flags);
-	llp = channel_readl(dwc, LLP);
 	status_xfer = dma_readl(dw, RAW.XFER);
 
 	if (status_xfer & dwc->mask) {
@@ -372,27 +364,6 @@ static void dwc_scan_descriptors(struct dw_dma *dw, struct dw_dma_chan *dwc)
 		return;
 	}
 
-	if (list_empty(&dwc->active_list)) {
-		spin_unlock_irqrestore(&dwc->lock, flags);
-		return;
-	}
-
-	if (test_bit(DW_DMA_IS_SOFT_LLP, &dwc->flags)) {
-		dev_vdbg(dmaengine_chan_dev(&dwc->chan), "%s: soft LLP mode\n", __func__);
-		spin_unlock_irqrestore(&dwc->lock, flags);
-		return;
-	}
-
-	dev_vdbg(dmaengine_chan_dev(&dwc->chan), "%s: llp=%pad\n", __func__, &llp);
-
-	list_for_each_entry_safe(desc, _desc, &dwc->active_list, desc_node) {
-		if (dwc_get_hard_llp_desc_residue(dwc, desc, llp)) {
-			spin_unlock_irqrestore(&dwc->lock, flags);
-			return;
-		}
-	}
-
-	/* Residue describes source reads; only RAW.XFER completes a transfer. */
 	spin_unlock_irqrestore(&dwc->lock, flags);
 }
 
@@ -987,9 +958,12 @@ static u32 dwc_get_residue_and_status(struct dw_dma_chan *dwc, dma_cookie_t cook
 	desc = dwc_find_desc(dwc, cookie);
 	if (desc) {
 		if (desc == dwc_first_active(dwc)) {
-			residue = desc->residue;
-			if (test_bit(DW_DMA_IS_SOFT_LLP, &dwc->flags) && residue)
+			if (test_bit(DW_DMA_IS_SOFT_LLP, &dwc->flags)) {
+				residue = desc->residue;
 				residue -= dwc_get_sent(dwc);
+			} else {
+				residue = dwc_get_hard_llp_desc_residue(dwc, desc);
+			}
 			if (test_bit(DW_DMA_IS_PAUSED, &dwc->flags))
 				*status = DMA_PAUSED;
 		} else {

-- 
2.53.0

