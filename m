Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794826390;
	b=vH6JT/TJlGNPtqmutClqT+rFT/BaK8fsTxuT2dEjrVJKjswIUDSrTTNxha93f6wsJYzs
	 cmdAYH5vk5c+jw9XIz+PTlWgF4k7sTmC01U5R/zZi0f4xeC0XJIiq9Vcq8ZvrkntLBAuB
	 LaH7UrHN/6geGbjNpihWGDO4eJ9wPN+QYdoxFLHVVT4Jr3jlhnMzo4a/Hl2Bn7JCifTDx
	 9vK/lMkBFEoYOYz8oTxL9YCdwrnixgPgWP6Qws76w/fCC2RhbOrfzp4dKFhpYY2Pp1H9E
	 i+uoi0QHWQ6vMqsyd4dkgCX0EJTU4vgoz1F4Qcdq2vM9DANabUR4eY0syeh6Y9XUCgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794826390;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=t5hHzWFY8QOCU0RYZOwwYvawpWnrIbJa8B0acXUTVWs=;
	b=kcvQ9NNHbw5eg2ZNzKdgXepUGDMdyPG7gmgw4U0dUpU79jiak7rfAxhlaYuSQxbdzGVK
	 xM3X+th6MKc/i1gG+7uOpXSIzguep+yictZmB12H4R47ht7U5oSqQvvz1TBCWhQ3PO2le
	 hZ5KzMN6vj/G3k6viwHOFExJKPd6YhR0rJNxBYdOaaGUwcto5WPsYsPx0CApNaKdfSLUb
	 xcH1PKTwMOzAXJJ2yONZj2/9UL8JFEaeLpNWBHoAPsJoX1eeZ4Gsot9FMLa4W6LxeIfEE
	 4JV9/9G0HmtvRrMUb1WhQZUIXypA+LC+AZ+vfKKbcZvOXtDbHRk12ypJvJGhTaUKtTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uF3d0HFY;
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0E0606A8B9
	for <dmaengine@vger.kernel.org>; Mon, 16 Nov 2026 10:53:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E0E0606A8B9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uF3d0HFY
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-86210f31496so2674692a34.2
        for <dmaengine@vger.kernel.org>; Mon, 16 Nov 2026 02:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794826389; x=1795431189; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t5hHzWFY8QOCU0RYZOwwYvawpWnrIbJa8B0acXUTVWs=;
        b=uF3d0HFYUTmJUh5kgskypMm2Ak3E/pN05uZNT7oQ+q8AcsWOviUYcar4iAFxio3LRl
         W83h6YZyUt62Bejbm9gVitEJwl2mx3K01IeTqbJMCQATfVKgZAZT2Aw2IdBiZFwCTjTx
         exOF+gY+7p5OXk3V5aRqLR/Emo56toAYbG88Aox6O1ONkFNT6SkBwNAgV3fqQ+BmXbrX
         umlqmR8SpnerjC5JzNybWH0tBr+M9JB7CO39K49WCzefoJyGyYnF3XR72NdVQk14K9mE
         cgWuEPsQXPrcJK483oSrTkJuEbnltKu1b+NyTNkLQMJXMpPa63XBuhTBl2wFnvzzhSEm
         Jk2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794826389; x=1795431189;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t5hHzWFY8QOCU0RYZOwwYvawpWnrIbJa8B0acXUTVWs=;
        b=I7LT1rEuIed7pyXzE0sCmzcC9x/gn3uq/T9dVpzcSMalYVSkYfPR3l/7BuGXPueJbF
         LPCP53QcoshbqNAQ31Oxi/ikIn2xjkRvSNJfeHhoDW9ega7vDXocNXTzNo2Qoy82Kg0+
         FF9QS27CHXUmEac2DnT2PAyOXugML2fH/N9t3euWzFHTtTXtzpBOFFMnAMEv5YySV2G9
         o3lm2ldzy5nBfqreIKDUDuwg/27dVbIdkcpXD27Ifr9yImz/LYUPv5PCjwLS7aBxeSMA
         f9bFwNEHuCDZSsGgo03acOAcy8mO0DNzZGxsjV01PLSL8GUddx3bWk74iPqV5asOR/Qz
         94cQ==
X-Forwarded-Encrypted: i=1; AL+hErEOXpm+rWk16+CBp9XZ4dhH0v+CZw/ZIv0eg9J52jqSsKEqEw+nI4pnAu81cB+rHJj3ejzgl9uJUcY=@vger.kernel.org
X-Gm-Message-State: APuU4Z90T0JX9ZcjZfwpDAOOgv97osEEGu45okZUddsnpUPfghhkbua0
	4Xa0E7ym1h35AuDiAtJvvj4la4f+3GGS2GibnkD6HUIBu2av37A7JgAg
X-Gm-Gg: AYBFou3maFC0UNUopXdiNsxKtBZNoMlWN+knp5gHQAXOaSu0Y7j9njKkjNc29moq6Xw
	TcNrTmS81XVdhs7Bza/OimrwtOEAjGdU87g+17/wNfCI2Cm036IuR4CLIhjOG6/N6UZQ/T5hzel
	aOWfrt0ZriyDLxsEm5XRgHl9PidjC2QURdwCojSX7m7i186FpfhakjOiTaALmhKDG4DTUpibjnp
	5adLx8OuBdP5N/YwB9wGZU7v5LWwBeOcEiI+gG6sOYxlrQoso/Deogg0uEyfTpnLOs3+hDTqGjR
	1VtqB/AIRRl6N7+b/Uj9ZVMDsxFSALRWs9o0cNIpXnQCQX4gXlzUXYT52k1xqyP0JWN7eqBIYxq
	MBY96/IDkdvWa4IKSMbk7P/Pagw5OGGImJYPHV3/LwLl/9DZOEKUBz9jvErRePAjkdOEbMJjLvM
	rcQKmwwxrOZR4diwn+r1V7JfoiC5xjwkI+rR512Aafvj7A0TpMdNd6tXPI3UEnC/zXg/02kV+WT
	R5hTaJgKIFj8ahtnaPtgq4H7pAEn9t8huVjoq7Apuq2Yfah+8jlGWL+vGsk4fGDJ1aoKUuvhtJK
	bA9CVlGirrkeQocs/uvCKb/vzJvV23Imh5Fa6jQDNcEldGC2mB1UZ1dijQk/6WowVwOw/jWTu1+
	pRHYXx3O1DD2WLSBqZ7iIFeBJxQo4vQ7G+gA08P2u6+GtFgOUjU/vdN18y/qHDjlLgiNE4ltmBD
	jSrgLNSyWC3fPGHfZwFbJjymqyvupgeGDjBbn9uXCjmNaNlOglFms=
X-Received: by 2002:a05:6830:4125:b0:862:c685:84b9 with SMTP id 46e09a7af769-862c685a077mr2638283a34.10.1794826389152;
        Mon, 16 Nov 2026 02:53:09 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862b08b8b5bsm5555546a34.5.2026.11.16.02.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 02:53:08 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 16 Nov 2026 03:52:32 -0700
Subject: [PATCH v8 4/6] dmaengine: dw: extract hardware-LLP residue
 calculation
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
Message-Id: <20261116-submit-dw-dma-synchronize-v1-v8-4-4a82d64fcd1a@gmail.com>
References: <20261116-submit-dw-dma-synchronize-v1-v8-0-4a82d64fcd1a@gmail.com>
In-Reply-To: <20261116-submit-dw-dma-synchronize-v1-v8-0-4a82d64fcd1a@gmail.com>
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
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

From: Serge Semin <fancer.lancer@gmail.com>

Move the hardware-LLP residue calculation into
dwc_get_hard_llp_desc_residue() so it can be reused independently of
completion handling.

Keep the scanner's LLP snapshot, descriptor updates and early returns
unchanged. Only one transaction is active, so the helper updates its
cached residue directly without reporting a completion indication.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
[james: extract the calculation for the single active virt-dma transaction]
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw/core.c | 42 +++++++++++++++++++++++++-----------------
 1 file changed, 25 insertions(+), 17 deletions(-)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index 982a4b9bd678..504b6ddeccd4 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -214,6 +214,30 @@ static inline u32 dwc_get_sent(struct dw_dma_chan *dwc)
 	return dw->block2bytes(dwc, ctlhi, ctllo >> 4 & 7);
 }
 
+static void dwc_get_hard_llp_desc_residue(struct dw_dma_chan *dwc,
+					  struct dw_desc *desc, dma_addr_t llp)
+{
+	struct dw_desc *child;
+
+	desc->residue = desc->total_len;
+	if (desc->vd.tx.phys == DWC_LLP_LOC(llp))
+		return;
+
+	if (lli_read(desc, llp) == llp) {
+		desc->residue -= dwc_get_sent(dwc);
+		return;
+	}
+
+	desc->residue -= desc->len;
+	list_for_each_entry(child, &desc->tx_list, vd.node) {
+		if (lli_read(child, llp) == llp) {
+			desc->residue -= dwc_get_sent(dwc);
+			return;
+		}
+		desc->residue -= child->len;
+	}
+}
+
 static void dwc_scan_descriptors(struct dw_dma *dw, struct dw_dma_chan *dwc)
 {
 	struct dw_desc *desc;
@@ -270,23 +294,7 @@ static void dwc_scan_descriptors(struct dw_dma *dw, struct dw_dma_chan *dwc)
 	if (!desc || test_bit(DW_DMA_IS_SOFT_LLP, &dwc->flags))
 		return;
 
-	desc->residue = desc->total_len;
-	if (desc->vd.tx.phys == DWC_LLP_LOC(llp))
-		return;
-
-	if (lli_read(desc, llp) == llp) {
-		desc->residue -= dwc_get_sent(dwc);
-		return;
-	}
-
-	desc->residue -= desc->len;
-	list_for_each_entry(child, &desc->tx_list, vd.node) {
-		if (lli_read(child, llp) == llp) {
-			desc->residue -= dwc_get_sent(dwc);
-			return;
-		}
-		desc->residue -= child->len;
-	}
+	dwc_get_hard_llp_desc_residue(dwc, desc, llp);
 }
 
 static inline void dwc_dump_lli(struct dw_dma_chan *dwc, struct dw_desc *desc)

-- 
2.53.0

