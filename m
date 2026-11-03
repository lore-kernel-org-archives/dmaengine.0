Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793744783;
	b=aV1CD3Nne5HPpuDAY6WPvhOD54nfMnKQLJDMQw/W8+P4BuBOC5TN/Cz72NnkQJaFwNrQ
	 U255zzNe3gUbWkBWAgas/jjBGHw2DYocPoVAQw/hnxa54a/5KK6KZBh1tsn/VEGKde7ZL
	 H8cXK9F4JK18XZSf2NecquGuUo9CHnd79FwRePhmRNOOJkQTNi5rSSFLdsTaZ7Po3ARa0
	 oretHpBpL3YR8IFIm+QE3BwQrYxP+CHy1U6gltkXbI6XfzHLrkqp0z+ZcovFaR8pKAcKa
	 NZRO44AVGrl7qDsf1YfVXy6XVDRXfRnpiONpz0h0phQ9XdESHpXARUPKaKViR92DCag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793744783;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=NThV1TPzbyl8VwtDNaRPOEfbfjp++pfmcEFzeBnkmuo=;
	b=cFZMIgkS5XeK9TVkI7u9T9d4GvyZr7QKOvkA/MyRE9JbMjMVYYvjv4Nqj3nBhD6WZtd8
	 ynGebf8qiU9KfLCA8bVde2Jy0sJObqm16/s4VYW7evDWK80WTFupnpqniOCVBlDlnVqru
	 LNMi1GPBBm9CJj7WAdayp1utwtOOOYtpd66RSBuXH1ALDcyflhnew6l+QBDnFH8W4FL1G
	 LMHftXdkyyc4DPdUNaPZdIxSH5pUu5FmhduM9TdeKxEW9xiNxSMh8XeECfntFbrgfpDuN
	 7RrOCQ/rFAICfiaHaIZd4Wo/obkCQLbCaRw+sCw+9W+9KXMFsOiHVBbfCZCFp8tSUGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RcCVoY1+;
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1988606D832
	for <dmaengine@vger.kernel.org>; Tue,  3 Nov 2026 22:26:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1988606D832
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RcCVoY1+
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-83bbcfba0ffso71432a34.0
        for <dmaengine@vger.kernel.org>; Tue, 03 Nov 2026 14:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793744782; x=1794349582; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NThV1TPzbyl8VwtDNaRPOEfbfjp++pfmcEFzeBnkmuo=;
        b=RcCVoY1+op2uWII/J+lWXIqcTV1rWYFPEaGfvOByppSNijrTg2ZeUVrs/MhEeUTjge
         Ikcx/UPolZjb1zOlDimmdn8z8JoyGOD3VF7wd5Vjzr6GU8ebSarflkdbxGkzADBbxLFZ
         2JUKonW8qNbdrVIAJKCV1vj47aAhF6IdIN8KOzNiZgzrIypFVQ9Ag/watlaG7mRySRHd
         Mw50j84JZEEVtLlcGFl2hgU4P8xvqEGLfuk2DgkX0HV0HQDeyYoG5CMRj5t/rIueplE9
         en93CG8vue+3E/hQzAN3sh8XKu4qlSMRdz1jD/yF8QK6JYG/Bku4Q2YcFn6KWNtxxdQN
         LlYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793744782; x=1794349582;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NThV1TPzbyl8VwtDNaRPOEfbfjp++pfmcEFzeBnkmuo=;
        b=EgHfGGqnywMeEEM9l/mhQ74fCzUxl066CXloNqknPkDUbuSZE6pN0EKP9ylW13bUiI
         Q3oBEgDfB+oVVbmmstlPomtKlPSYB7YyD9IBUtLnydBboGbHw0nBSefyJhRgmSAgg3m3
         tsFke1BzRnB9MSlJq/3FnKxQxZK7dlW3HDkVvP0iV9lPdGe/7FDEWxBFTkH6AmB6tyT5
         GUCVuxBkZy2jgvaXoYoxyNrBA8rPcZ10+lLTxMpaHv2MUCP2/FhjKBAnsB5DbJx2CmnE
         P8YjET0kbwmdzwA8Q68siYm9cHFuV0Pm3hx0js9fTfgbbmeauOxIVbOJtRzlMr4bMWfd
         +/Jg==
X-Forwarded-Encrypted: i=1; AKwUvBw3dOukccPYws6vtTo6D0ZrIksD41lGw1WgKosXPJ3blV8UOP2q2oH46Fl50NI1gTWtxLM5x1QLApk=@vger.kernel.org
X-Gm-Message-State: APuU4Z96kte6YpOtYJLcG7mCPdtMWRlzqqIWWpoENhgvxsqZ3PrKojuU
	IZwTqRXRi/4vNS3wrzvU2eVVmP1Dd2Wn2CMz5p4lgSpX9u9EB4KwDtsR
X-Gm-Gg: AYBFou2ugrHs2OQrTqFM9UihNO2/6UFbPtFSEqaNxRiHDmAAqJVJfXPQQd5FcXu/suJ
	xQCdsz4lW+iIFTBtMkGIQv0F33fJZDP2KA7ENTwGg8bIwXb+Wg7fhg97H4X5lLZ5JnsBVvnObnw
	tlxFh7TKh1T583BBGNZrH0bHrhyiYVB6z+2Zs/Hjq0NHfG3iCnq/4DMImTvKSlBZ93R75nSyw33
	ufHk7mCW9mrGUujDE3NNpXkG4w/2ZmFJlUbKHo9i9lu0JNsjgNWfQ/wGpSYwQvq9N7lKwcjmn/B
	rFJelZ1Xml3aBg4AfMPw6XPPYJ192JtO9aKNhtYjrP6OHF+0H3tGLRyY2vzNXsRU9QonHzmKgDZ
	JuuL2h7NAJbENr9UFcewDBW39MVlCFQkagG9/7Eh2FRJcC6EjWUUVeDNsphX/KRmUu5JTgpSIOF
	aMe/8oG+TlikFwRaP6HODliCnvz3TSx2gSwL+WGDVhje+ycFuoE3RWLLig074YKV3pRLlAoz47q
	AZFlN50eglEJlKY+xqQ5/zIVQ8v4mKyvZKvyF1RS9lcGv2+cvDlhDRzFlbf88AkIAUDKP6WXqY/
	UPS2pkmZPEYQhlCyBcor1397IZWjnJQJ0gS2KzblMkp/TdT5M1dfQTdS8JoHArbcguh1wJn2/Ke
	BduC/ICFNxNTBzeoGxDBKs04xdTCWhNo4Vqg1nS8+tnm0kHViS464uK10+y6UsM8es/VT/S4v0f
	XbGg8iVUwtaeXfoO5aywKLOeQYECI/MZjQVfpg4Xy4HyKQ25xIa1E=
X-Received: by 2002:a05:6808:1494:b0:503:8f9d:f11a with SMTP id 5614622812f47-5640dd9c1demr9657792b6e.29.1793744781799;
        Tue, 03 Nov 2026 14:26:21 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9ef58b1sm128435b6e.3.2026.11.03.14.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:26:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 15:26:07 -0700
Subject: [PATCH v6 05/10] dmaengine: dw: calculate residue in the status
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
Message-Id: <20261103-submit-dw-dma-synchronize-v1-v6-5-2ee0c348224d@gmail.com>
References: <20261103-submit-dw-dma-synchronize-v1-v6-0-2ee0c348224d@gmail.com>
In-Reply-To: <20261103-submit-dw-dma-synchronize-v1-v6-0-2ee0c348224d@gmail.com>
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

