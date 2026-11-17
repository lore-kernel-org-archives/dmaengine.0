Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794955748;
	b=ZnPCSDp7Tx3Khn1WQI5144DkBuivxmjP+p9Lur+bqqS5/dy3PHpp7OUXNHdEAg2RbaDe
	 0pQfL0inrEdLj73BlxakKkPMhbaEbGyVnMJSpFvA3oJo7F9uQUBEuYtK9dh/WtH/EhBdY
	 80lWReWysVcC8Zpt6Yh510oqcsUO6z16G1x/UqYsUw0fPegqdmefQS1nCiCSm8urfcroE
	 ftuTl4vUbbi8Te/xDFpQ3hfkAhy65XrK4nry7wjyn692pggjc2sE99+D8m0NLANk6xR+A
	 qdwp7B1Eakr/tMUID6A/M9xhtW1xgf5H1PrV21h3SgeahEukhGkrHOLtd1JQ+ofFn2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794955748;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=t5hHzWFY8QOCU0RYZOwwYvawpWnrIbJa8B0acXUTVWs=;
	b=EZjLAflGxBCuhDAAGrLdEk4PvLqMqt7WoU1eyfdzSCUEJscGmXZQKQ1FOjozRmMbBU/U
	 FnCudB3E9dI/Hq0Qfdrb9GdrGitO1Zd2eUnZLyqIwmY8avvnwXvOk+dbWHvyMW60bdlIy
	 jRXSHfstA7OyqLamMMjqkMxsEcKEDgvw3giOWhiaYj5fZD6GtKMZFbZlk322SOQSDAqgu
	 A+RnxBgIaVGyBnQ4XSRFRK0gTulELdkSyEPwyWjxF+WHCUuuLbX8gAXPjD77cTn/wpIYW
	 lnBacoIwfamLq9lXQdhNKK2eeZXyS5AkTTIc5jesgYhjABwdeGGF45QFcH188DPDCWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AyEalmPB;
	arc=none smtp.remote-ip=209.85.160.46
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E2D606A88E
	for <dmaengine@vger.kernel.org>; Tue, 17 Nov 2026 22:49:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07E2D606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AyEalmPB
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-48ed0b68895so259434fac.1
        for <dmaengine@vger.kernel.org>; Tue, 17 Nov 2026 14:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794955747; x=1795560547; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t5hHzWFY8QOCU0RYZOwwYvawpWnrIbJa8B0acXUTVWs=;
        b=AyEalmPBMPz0b3MRazrgpn1GqD0jzv+rVAzxdGw50a8lsVqTI4DPBFMO+k0JYVDsmf
         z3/KU2ytnbK8urMj+N0WXVskL2/lyD1NVm0TvGSdssJbTWG/AONgYRKcWNxEr4Jny4ze
         1ROzfDVlSZjvYvxH9ksiWmjhvbef4NbE2y7UzD4HgqAuQHPID+OLueOELoVcBOhXmBSX
         P8z1lS33wbW1gz5rUmp8rZaW+9RNKw31NCfGWrN/DBiALPijM0YIVkouEU1m6aqqvPcn
         utQPa71Szxni148rJqxKscHx0JBB5+exfBRUXdS6V92e91rYSiwrYOI6frB9X8LPkDNf
         QiKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794955747; x=1795560547;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t5hHzWFY8QOCU0RYZOwwYvawpWnrIbJa8B0acXUTVWs=;
        b=Gc7LGNvJRIt/hC6/nHNpxKi2K12oIV9UOAOo5wlK+tU5Kpd5eIefdi+I2PlDpes8fM
         7Bw37wJJyNKE7by851OT2jQdvPM5bsnVUi4WGz7RR0mqukFeDywSa6n90FVF//Mrn5Qu
         85IGllQKUaptvSK5A73jDzZZc5v6DcTIraBuj2y6El6LTvUYGp62uDFK7lxqbHOTBWHq
         6z/mvulXc8HuKkGMti4TFd7AxU2pTNn+Xr+ReukuOkGOkaziaNoNpFQ5HuzAoB53NaU9
         FG/2DBp4GVPFmxNqu/U1nj5oq30Gk53NJtYZGbWv4cNUrOTvidNMejx5e17WgEMn9yqc
         XAdw==
X-Forwarded-Encrypted: i=1; AL+hErFIb1i7BfPnyxTYNoqNHGBqJaFOkbyoQE0ZU7kmkZIqFum4Aacq5tYqJ5ircW1zkbeMbh/YZzYsFGY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sC9BhJglGrhub+JlZbg4JprwDNz337r+2xNwYnVqq/3c7kg3I
	YBUnnqCWWmQ8jiBElZUFXfb8qK5roUMwY5Y3eBQJR4ut0nzxWxqb2+0F
X-Gm-Gg: AYBFou0RcmfNJ+zegq8FPT0deGPfHzUkrAIGW2SjXnxCASFQjvSeVzYWYK7O+EZAkPy
	3/G3+wL7MOXxWmJEyAjoyXg0HU98iOWf0ETIeWU09Xio/68PdB6BEGlwTNChh1UMGbdv0Hgcfy7
	3BvBReS+3XfJV+vfvBcTtFtZtOIUZlySqfAaz7NkcWHheeceoDlZ9WIJM6tLrvw9dUH3kpgjKYy
	ZXFIfn3p/xK2syITg46CbrimA7VxmYh5T7rglGhk4GiR+JoLusYy7KDs9HHOpl7PIwqFJ9WxOLo
	dr+V/25ZNgR/XUeAYvdfMiV6B8cMbJmaPx1ZUw0NAfhg71m6ASVPMNZ6ujW0BihLrisbG+gnawA
	2Zaza6hzlrW5fgVfzQ+nOFGcCLAOCyJVwPpi7+XP6bnYT5MEw1bJu2sKLxsokFplwbA8MNzPYLf
	yIblOUTBdAyIueMkzXvPEoMpwHZsBRL4WEgx5ZmOCkssFviBKhV+vLVXIQFHfHP2KANhIQwssvJ
	5PYyskXdhOCmKjaww0zQ0s7jSCFglaeltEQTps1aVaCH4hpKaTMGiyrVWVzS784ltumq/UE2Ar3
	5GAyeVh+ypo6H8vC+KlDPy5w1rZOWNFD/KQPsYHkpNxBsdY4hu7aqFbhdNp5g/7wEeRYVwOeXNz
	5KIQ3QyKlWYFDU9yN3xMD+HGrNA7ahQdDvLyHY9qCF6neAqS2exTlIpU+BwbuMY9Ny2pJZ2ziBl
	bTR3hjwO/FOb733lRNXeB/HzZoFZJMw2ezxKHmuc62Zlk6sP6jk6Q=
X-Received: by 2002:a05:6870:c0d0:b0:4ad:5d5c:29f8 with SMTP id 586e51a60fabf-4b7627ad063mr526790fac.53.1794955746828;
        Tue, 17 Nov 2026 14:49:06 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4b74560af5fsm583066fac.16.2026.11.17.14.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 14:49:05 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 17 Nov 2026 15:48:39 -0700
Subject: [PATCH v9 4/6] dmaengine: dw: extract hardware-LLP residue
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
Message-Id: <20261117-submit-dw-dma-synchronize-v1-v9-4-7dc066ed0bcf@gmail.com>
References: <20261117-submit-dw-dma-synchronize-v1-v9-0-7dc066ed0bcf@gmail.com>
In-Reply-To: <20261117-submit-dw-dma-synchronize-v1-v9-0-7dc066ed0bcf@gmail.com>
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

