Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202972;
	b=wyqwD9kMFJKbUWLjR2orTuXuO9D6G6tUsdI2+++BFWCY+KQ7QxjTsmqCiObYJTeVvayX
	 jHQ9OfuA++m8yaUzegVIhS0ExlZjBr8otgK0lws+H1OyD1edNTchO+cpnbTmJhHyLXhQo
	 uD2VFvIrCzdw+oz2/Ehq6nXsAefzu5FHvJpMVMn8YGtDXj0p4eHE/8CNhPTJDrZfioIdW
	 bLGGDdyQHH0Lhwrh2rEMrM6lBmX1MnckKMz/E82CWfFcrmpTI/KrdZKJvmba44WYcOCzq
	 Gs2OgD4zY/inaAg1PXt5wZ1b7RROiZLpa5WnVbXkmpTZzbFm0RR/UqYTzvT3dSfa4dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202972;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=6MNqx8SelieMagco0tCtX+Et6uyqf4e8xNdGXpW/e7g=;
	b=TU6g2fKM2heNXDqrrZZXouUY52njgM1iftsc2y1PYApgjFbH6V4CJczs3HaGJOfw3/ai
	 LyOJfJr0khXyv7TMPfBzVrCGqS+e+NdQcd5lZZY5v0oHUma5w05M5TdlRRrHmknnhYPmB
	 qJcOkdKRTBXsKVLusw56aK753AuEWj1D+CT9gQ2uhpNSyFoD7WZoS+WcfcdCW+r6vRcQP
	 bHVBmQpq/ZzFfJRdDwdvRoirZRW8ilInNYLAvqJwSIz/FDWAchhKgh7LwVVSLxjKMfPwP
	 Sl1P7HAasVOB0Pe/SX02otQeovhE137yZhE0RdEnqyESbP1q42gCpraaLmDNAW6taMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VDDBoHPC;
	arc=none smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180B9606A6E9
	for <dmaengine@vger.kernel.org>; Fri, 20 Nov 2026 19:29:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 180B9606A6E9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VDDBoHPC
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-71b30ed75a1so802956eaf.0
        for <dmaengine@vger.kernel.org>; Fri, 20 Nov 2026 11:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795202964; x=1795807764; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6MNqx8SelieMagco0tCtX+Et6uyqf4e8xNdGXpW/e7g=;
        b=VDDBoHPC4r0P9LzupMd9R5QRJUsXTf7e6q6/7iPt7oKGKSmiWyNI+F6MiAX8Nekhgb
         kcBAiNXhLXJZeubUlcXynjabkPIjdi0lZGV2Z0QnOFxD+6Mw0uNuW7DxMdpNPYrjUIaC
         BN/N0vVY/GneOLwR6vUE+8EcP4FqE00cBUTz5ImMTy95rSwEcatFiZMCnWUw5cloYdVL
         PvBnAaOPclMcpC7DBf7OZ9eVlWwO2SuVtzMeZa5XYamXwWP86gVNathg14wxcBsE/EZb
         bbwj8+ZSem4jxLw8+AaZR07QDvN5hm6uWycCONLpqu6QQaEIqGqeXPCMJS0FoHSywfsv
         K/CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202964; x=1795807764;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6MNqx8SelieMagco0tCtX+Et6uyqf4e8xNdGXpW/e7g=;
        b=z9+4okdHPSMtcLzPBiuzF9LAUsKcEQhCVGb2buo108uYVos24u5TKbM9HOWUxEW17d
         sZ0wSS/oRpQn8G5AN4UDKHWD3p/ROoTyz1bAFY1rihIXO3jR6OdDex/el8IP/L4jzfBq
         JUlfgwFa7MXjVPuPY6HDRygrJBdiHPmDSjc+GQoVdG2cvIHjvJgg3B1MbTXOtfc30X6s
         kgzpS63tIEou081K3ctQbSLNpteZVVYqaQ8IO+UNPMBbw5hcydlKt6EIuaqnPXh+UvGu
         oeboKhF0tyME5hlRA2Z+cV9h84S/2ixEWee3fmWWK3XmjiObUQxSTVt328dKV+lLIcBI
         gysw==
X-Forwarded-Encrypted: i=1; AL+hErE7ZBSNVA0tbhC2r8ur55odhPwCfMwW8/IB9RpINW5Bp7nZHALWsnOUKoYM6T8+303vWZ3VnXjnMJk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8iYi6w1mHcLk2bQbq2fgdACKvoAx6/pqg3HWyItRt5HvRpfqrl
	IY+blfOeLjRKC6v1R6+g9ZvzwBkMNn7ywYknDxBU2Ga+NrP2AuojYnD1
X-Gm-Gg: AYBFou3NmgbxM/3UiV39Bd4yiTV4lDbg/nffKOLK5D2TFeNEOM7AYfXgyDXJA7wt/FF
	LSMxrSXvixh80Z3xBOKzAmZdf7KrmVqTSi6hq0xFtkeXM9RzCXRNJ0ehcs8tByFMje/ypsRQgFp
	W7C6OVBqHl+tSzQnOzpfXICaA8qg+0sO/NofH19tqkhq+ODmJtbhRKYywm2M9J3B1ZZrMirX7pe
	aMCbXqkOJLN3sPX1DFMyfPKRX//yvyROkuZfHABqVQsb9nu90fWTjV8DkXRA5CM5ag0bCWg7MQC
	aWUT39Ym94EKwpNO++0NBhRf1HPo2RsngG9qheURWvMzjnlb+QJRjaYAgGP2UN6+yT4Den29d4e
	6XI+hjaJFOfQ6buO1IcZ8olvLxoEKCADgzDeGUhVQ4SNyQ79dgAJ/vUPX6Dqd+AfHuleeqXRQO2
	obwr9LNhHmm06ztiCjGBoQIHGG3S2omah+ADD8c1m5cc9U/DYBP+vLQu2xxfV6UYp1AnhVgLtDy
	md4U9QO6DULAV139+3M2vXWVgbJbRMqPnVa6rvX0XZ6WMvaDYwUwPNiebqORmZ5vPZfBVnXfCZc
	El701h+LoDCzg8ThgRnMR8bBq7AP5GSAYEPKnrK0sOlhQDecVV2RSFziJNVqo9TbdZZliCA3tug
	uUGZWa8M4mJJvjjSRtxFaHDicqEAaSRZkke3xy8zWVwLxsBaUb7FdnDcYDhv0Vq/pSfRGfZjod7
	VsO82//t2AZXPgqdvu9bYXculBvbfNkdrsoBpt7Ftv3sB6VIQrmjWJ
X-Received: by 2002:a05:6820:55ca:10b0:71a:ee76:d7d1 with SMTP id 006d021491bc7-71b3953f78dmr2753238eaf.67.1795202964033;
        Fri, 20 Nov 2026 11:29:24 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc5f7ae7dcsm3434498fac.8.2026.11.20.11.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:29:23 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 12:29:12 -0700
Subject: [PATCH v11 6/7] dmaengine: dw: calculate residue in the status
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
Message-Id: <20261120-submit-dw-dma-synchronize-v1-v11-6-9b9166bc2cc7@gmail.com>
References: <20261120-submit-dw-dma-synchronize-v1-v11-0-9b9166bc2cc7@gmail.com>
In-Reply-To: <20261120-submit-dw-dma-synchronize-v1-v11-0-9b9166bc2cc7@gmail.com>
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
X-Mailer: b4 0.17-dev

From: Serge Semin <fancer.lancer@gmail.com>

Calculate hardware-LLP residue while looking up the requested cookie under
the channel lock. The descriptor scanner updates cached residue only when
no transfer-complete event is pending. If a status query completes the
current transaction and starts the next one, that new transaction's cached
residue has not been initialized and a query for its cookie reports zero.

Have dwc_get_hard_llp_desc_residue() return a local residue value from a
fresh LLP snapshot. Keep the persistent residue field for software-LLP
block accounting, subtracting the current block's progress when reporting
status. The descriptor scanner continues to advance software-LLP blocks
and complete cookies from RAW.XFER, including for polled transfers.

Fixes: 4702d5244ca9 ("dw_dmac: return proper residue value")
Cc: stable@vger.kernel.org
Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
[james: retain polled completion and software-LLP progress]
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw/core.c | 49 +++++++++++++++++++++----------------------------
 1 file changed, 21 insertions(+), 28 deletions(-)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index b556a39a24a9..7a66dc75c546 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -281,41 +281,41 @@ static inline u32 dwc_get_sent(struct dw_dma_chan *dwc)
 	return dw->block2bytes(dwc, ctlhi, ctllo >> 4 & 7);
 }
 
-static void dwc_get_hard_llp_desc_residue(struct dw_dma_chan *dwc,
-					  struct dw_desc *desc, dma_addr_t llp)
+static u32 dwc_get_hard_llp_desc_residue(struct dw_dma_chan *dwc, struct dw_desc *desc)
 {
+	u32 residue = desc->total_len;
 	struct dw_desc *child;
+	dma_addr_t llp;
+
+	llp = channel_readl(dwc, LLP);
 
-	desc->residue = desc->total_len;
+	/* The first descriptor may still be waiting to be fetched. */
 	if (desc->vd.tx.phys == DWC_LLP_LOC(llp))
-		return;
+		return residue;
 
-	if (lli_read(desc, llp) == llp) {
-		desc->residue -= dwc_get_sent(dwc);
-		return;
-	}
+	if (lli_read(desc, llp) == llp)
+		return residue - dwc_get_sent(dwc);
 
-	desc->residue -= desc->len;
+	residue -= desc->len;
 	list_for_each_entry(child, &desc->tx_list, vd.node) {
-		if (lli_read(child, llp) == llp) {
-			desc->residue -= dwc_get_sent(dwc);
-			return;
-		}
-		desc->residue -= child->len;
+		if (lli_read(child, llp) == llp)
+			return residue - dwc_get_sent(dwc);
+
+		residue -= child->len;
 	}
+
+	return residue;
 }
 
 static void dwc_scan_descriptors(struct dw_dma *dw, struct dw_dma_chan *dwc)
 {
 	struct dw_desc *desc;
 	struct dw_desc *child;
-	dma_addr_t llp;
 
 	lockdep_assert_held(&dwc->vc.lock);
 
-	llp = channel_readl(dwc, LLP);
 	if (!(dma_readl(dw, RAW.XFER) & dwc->mask))
-		goto residue;
+		return;
 
 	dma_writel(dw, CLEAR.XFER, dwc->mask);
 	if (!dwc->desc)
@@ -355,14 +355,6 @@ static void dwc_scan_descriptors(struct dw_dma *dw, struct dw_dma_chan *dwc)
 	dwc_retire_cookie(dwc, &desc->vd);
 	vchan_cookie_complete(&desc->vd);
 	dwc_dostart_first_queued(dwc);
-	return;
-
-residue:
-	desc = dwc->desc;
-	if (!desc || test_bit(DW_DMA_IS_SOFT_LLP, &dwc->flags))
-		return;
-
-	dwc_get_hard_llp_desc_residue(dwc, desc, llp);
 }
 
 static inline void dwc_dump_lli(struct dw_dma_chan *dwc, struct dw_desc *desc)
@@ -967,9 +959,10 @@ static u32 dwc_get_residue_and_status(struct dw_dma_chan *dwc, dma_cookie_t cook
 	desc = dwc_find_desc(dwc, cookie);
 	if (desc) {
 		if (desc == dwc->desc) {
-			residue = desc->residue;
-			if (test_bit(DW_DMA_IS_SOFT_LLP, &dwc->flags) && residue)
-				residue -= dwc_get_sent(dwc);
+			if (test_bit(DW_DMA_IS_SOFT_LLP, &dwc->flags))
+				residue = desc->residue - dwc_get_sent(dwc);
+			else
+				residue = dwc_get_hard_llp_desc_residue(dwc, desc);
 			if (test_bit(DW_DMA_IS_PAUSED, &dwc->flags))
 				*status = DMA_PAUSED;
 		} else {

-- 
2.53.0

