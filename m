Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793744782;
	b=OJ0yClbYSXPb32dC7tUvQHspr/8v+IhSTbDDRE+7DlyulHM8WQLto8act0qLaSGLy3pO
	 EHCUvKPpB7SakPEC1f2JQZGdbHIMgWb7MvneX3mM1AVT1V/jq75ETQZbIAAfbWY5AErn7
	 luAicY+6dlXY78RPeo5QnxutcEEffolkfryjEmIbzMe+u9aES3/uiwxntiyVcuODHGupM
	 YPlWcSbbC1E7cnbkmGAShA8Yullw2UbXDKFfOOFqATFNFra6kdx1JSCdgNB9Qq8GHtLZn
	 BV+L2QLG9orvBEGZMECeWxshoPMWTI57HwiWTf98AI8mrzImFmf21V5PfiP1UVmIaYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793744782;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=53Mxv6Sk+QV15vE2tUEyM3M6ZRlSEp1NTwwg3jt+yx4=;
	b=FnkkAkpNO8zar1mven5YWYqu0epo7EjLKZUGFL/LC0Yk1iJjp4lHsr/MDtyU3lJZkAB0
	 5Rjpayx+4eXFDNy9eMOygRwsD8Ikjfwp9UH/E5UyI2hcXqXzZNxPjCWOShfLWPb3wGqO5
	 ypM/GH3xfk1y4Ohn7l7S7sfxqmHLc/wRejkA1hScRvCT+w4qL+ie/UxB/+q91U6hKKRNL
	 xycK02+NUQjntlh39p/Fg0Y/kLa+fq8tN6hFCqU8JdA9Td94pBLZK3SpX9TQzo0ONPT3S
	 IAjXt7NyGpd4ReQnFptqPRsAz/LhbvCuteCZMZGC1Ipw/VB0Ie3B4+0KxyoxRp1S3rQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jpqcMezn;
	arc=none smtp.remote-ip=209.85.167.177
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8693606D825
	for <dmaengine@vger.kernel.org>; Tue,  3 Nov 2026 22:26:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8693606D825
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jpqcMezn
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-4ab8cb2a6e4so93892b6e.0
        for <dmaengine@vger.kernel.org>; Tue, 03 Nov 2026 14:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793744781; x=1794349581; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=53Mxv6Sk+QV15vE2tUEyM3M6ZRlSEp1NTwwg3jt+yx4=;
        b=jpqcMeznvYhVooDMyNV9kX9spxN3n0M/xsJWgGWyKsIda13X7kTZbKJHk9gFrEbbi/
         YBNufG3ENVGo0jGoqG6f2nSVZwsalTV23KZ6K7hf8unEjh4hfBm6SHGs8joX6dJCgcLO
         AukjPVONFeug11OR+g7KK4XHH+ElkHT3ah+ec344LEmr8CLi0Sl3TL4pSmPdIegGNVtb
         1JRs74h0UGpkip8UC/9QLYLqSOb95GR0gzuEitUy/lFukTt/qfUY/wvQVRE9WDbilrZY
         RyKypMKnzE9AegSM+yZ6MsdzH59JGEWthRmDGLu3qEfWQXS4op2P8pBZlI4ipM/zrdK+
         aB9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793744781; x=1794349581;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=53Mxv6Sk+QV15vE2tUEyM3M6ZRlSEp1NTwwg3jt+yx4=;
        b=KLOkUyJKq03O/mzkN2vo8a82V0bN9gtIMu1jz2wYWPi9SsKnRI7UCdfx3orLVkirYg
         Dv3HoF2BcxbOh9I+BW5Zl0ak/m1i+4d2YQZv1KNL/KwjrymJR8UnFrQ7jKEUqo5C7dkl
         rfW8bkVh8msGLELpUgwtN08aF+KvaAVr0k5B66V8Q4GdjmXUM1L5C6k7sunr6ijYFhi5
         WXcp+Ry4m20NC2qRB37zRw1YV2GjeeyMx9vdKba4qYdpmon+3BfpI3aiDLVnK+/GVZLx
         dqRtG7dYujf2s65UmPDAGMyAg1djfrQ0z8ou67xIVb1XK1OUZugpcQy7EH34BoxxW+Q5
         fBfg==
X-Forwarded-Encrypted: i=1; AKwUvBxDJdddpcyvebj+fJUOsHLDACICrVCvNa8ry2qEDIb7eYYiF4cyBW3suWaHCIuCkLL9iNjycaIViAg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8pjvTyYAUCFs43zBn+XgJICz6TqAbj8v/2kLxjgZA82+8o4lGD
	DjFoXdQQXLUBgK2duatwTxuFSE5i9ShbOX2euXmmBVtOX+5411thC/RN
X-Gm-Gg: AYBFou2Fc1OkJi3j1Qb7L7Ba0CHHHgXB+8a3NUiEDapT1WoPE6hDJflCMDLBdkCYyls
	Y/yaBOq+SjEJqMmJDD3mnPZn7zc/83RfMRaY8GbPVX5nlGDRMSMtKD/2ZssjfhEy1ZxFjafa8h3
	XlDSr0exdGH7S5nb+CV6Hmx1Nm5WVRbU3d8xst1qBOZtokuQeXEjo5d8Eo45mFvFI67fYorERIL
	8soguqf/vFDj4Dqi4GNps/sDgySYAHbh8ZrbLT6mPn0HenO+ijCmuLJkywnOZMVtprsaEiGjfyc
	C6saV6zCmIvzQ8+1Zp5YI9zPAYFyppNqHFXQKaTHRJsI31E/iRJ4MpaB+5uERfCBH9bNenIO9pl
	fJ6KOWvmSbkRXY8KxcfaVZWkKeWZZUfk/qUloD8BMJX1aJ+14/Mz+yZHKx15Z4hSK3H7XVdMv0l
	DRRSgVNbO56QiPNK6G3Xb/X1UUSoQPB/BPrDLmDYr3ggfB0N8Z7vtfq00Jh9xccd8iOa+a2xXWZ
	CQbW6BhyqMvb852gixNdAubJpuxm+3X79xjizNBHrDI8DFMXK/OQaQ0XPnXDnO7JW7hAdeCbu9r
	U3cUxh3xuVtwwlBsyaqHbRvfcYRBtXhkBm8U9KLmM5baOUcO3xaTbsjLSpZLjuObn5F1gjH3fIQ
	ndR/bxV5l7JAqNaXATpw+Dk1LGhU91ePyMa/vcUGoYs54z/6gq/b9clsqbkrvtf2p8AaSBxMlbQ
	dq21iSPeiRIneIGU6bwHwpmpToT52DiRX+YVDFQFMQMgI1s2Pm3wU=
X-Received: by 2002:a05:6808:5387:b0:4bc:cf33:7024 with SMTP id 5614622812f47-5640dddcbf6mr9361158b6e.42.1793744780622;
        Tue, 03 Nov 2026 14:26:20 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9ef58b1sm128435b6e.3.2026.11.03.14.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:26:20 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 15:26:06 -0700
Subject: [PATCH v6 04/10] dmaengine: dw: extract hardware-LLP residue
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
Message-Id: <20261103-submit-dw-dma-synchronize-v1-v6-4-2ee0c348224d@gmail.com>
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
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

From: Serge Semin <fancer.lancer@gmail.com>

Move the hardware-LLP residue calculation into
dwc_get_hard_llp_desc_residue() so it can be reused independently of
completion handling.

Keep the scanner's LLP snapshot, descriptor updates and early returns
unchanged. The helper reports whether it found the current descriptor,
including when that descriptor has zero residue, rather than using the
residue value as a completion indication.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
[james: extract the calculation without changing scanner behavior]
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw/core.c | 58 +++++++++++++++++++++++++++++----------------------
 1 file changed, 33 insertions(+), 25 deletions(-)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index 2d69fab06601..5a1caca7ad68 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -267,6 +267,38 @@ static inline u32 dwc_get_sent(struct dw_dma_chan *dwc)
 	return dw->block2bytes(dwc, ctlhi, ctllo >> 4 & 7);
 }
 
+static bool dwc_get_hard_llp_desc_residue(struct dw_dma_chan *dwc,
+				       struct dw_desc *desc, dma_addr_t llp)
+{
+	struct dw_desc *child;
+
+	/* Initial residue value */
+	desc->residue = desc->total_len;
+
+	/* Check first descriptors addr */
+	if (desc->txd.phys == DWC_LLP_LOC(llp))
+		return true;
+
+	/* Check first descriptors llp */
+	if (lli_read(desc, llp) == llp) {
+		/* This one is currently in progress */
+		desc->residue -= dwc_get_sent(dwc);
+		return true;
+	}
+
+	desc->residue -= desc->len;
+	list_for_each_entry(child, &desc->tx_list, desc_node) {
+		if (lli_read(child, llp) == llp) {
+			/* Currently in progress */
+			desc->residue -= dwc_get_sent(dwc);
+			return true;
+		}
+		desc->residue -= child->len;
+	}
+
+	return false;
+}
+
 static void dwc_scan_descriptors(struct dw_dma *dw, struct dw_dma_chan *dwc)
 {
 	dma_addr_t llp;
@@ -354,34 +386,10 @@ static void dwc_scan_descriptors(struct dw_dma *dw, struct dw_dma_chan *dwc)
 	dev_vdbg(dmaengine_chan_dev(&dwc->chan), "%s: llp=%pad\n", __func__, &llp);
 
 	list_for_each_entry_safe(desc, _desc, &dwc->active_list, desc_node) {
-		/* Initial residue value */
-		desc->residue = desc->total_len;
-
-		/* Check first descriptors addr */
-		if (desc->txd.phys == DWC_LLP_LOC(llp)) {
-			spin_unlock_irqrestore(&dwc->lock, flags);
-			return;
-		}
-
-		/* Check first descriptors llp */
-		if (lli_read(desc, llp) == llp) {
-			/* This one is currently in progress */
-			desc->residue -= dwc_get_sent(dwc);
+		if (dwc_get_hard_llp_desc_residue(dwc, desc, llp)) {
 			spin_unlock_irqrestore(&dwc->lock, flags);
 			return;
 		}
-
-		desc->residue -= desc->len;
-		list_for_each_entry(child, &desc->tx_list, desc_node) {
-			if (lli_read(child, llp) == llp) {
-				/* Currently in progress */
-				desc->residue -= dwc_get_sent(dwc);
-				spin_unlock_irqrestore(&dwc->lock, flags);
-				return;
-			}
-			desc->residue -= child->len;
-		}
-
 	}
 
 	/* Residue describes source reads; only RAW.XFER completes a transfer. */

-- 
2.53.0

