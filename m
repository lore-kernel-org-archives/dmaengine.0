Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202969;
	b=nB7pi/GLkuVDGtd7InlAcNLJSdplr+Tx1s8QquQ48tj3d0Vt9sdGyYUuW+sgR/jrLjGS
	 0Un6TTtcx58jPw/51nFekB/Ye96vqbr3dESMqlDNpwY/4zc3MqIXU0Yh7IlHEao3HJOd+
	 EdLf4Gf77tMd078ToJxTSzEM2kMyf9VjnXd66QkrWg50SPktWXNADGpdPvM5L9aoDBM4Y
	 oP/41627EWArA8EcLNkOnLaVtMTkEEK8qJhvOsR/T0DEfp7o0kfLW/FV8FP/dcJPFsxTo
	 1fajzn3AfLCybl2k9LbS0nqYZpDwGe9oJ7Ho8A3rkSVbKBfHDDOHkas95sYV9ghJZag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202969;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=P+uR6LSFUuS82mC117S1N7GIewTkAQxRxMN6R5yzzdI=;
	b=q2iL6QgjJOQmnVfEGkswuL/aa6BybBWBRs195lzUF3vhogZ1JRbNDBVtHYP/4MDp5HoO
	 fqZczDhxVgSYoPppLOmGn9DQ3Mk0i5EZKeM6sI6wAgC7PTRnnnsclLezxOaQGzfsDeXnh
	 pPya563C/7hvD58xGGXxW2Rg+7Ia1gxoOQ53wAap7ADinkiXzaQiLVv2fm0Ly3qeCL005
	 4pRSc/kYJRmZwXSgD1KoRRmfOM3Tbq1cKNHS2YT1L5OsIMbRzlVXO8tf6YuorI6lLHjzc
	 mKYLmsf0ZHbFnGzO5zzvpxsx034maGI7XlcZG498BNOQjhqtEQhn72G79XgEt2/vW5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IiWIgmAC;
	arc=none smtp.remote-ip=209.85.160.47
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A58F606A6DA
	for <dmaengine@vger.kernel.org>; Fri, 20 Nov 2026 19:29:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A58F606A6DA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IiWIgmAC
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-4b5138f0991so1324308fac.1
        for <dmaengine@vger.kernel.org>; Fri, 20 Nov 2026 11:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795202963; x=1795807763; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P+uR6LSFUuS82mC117S1N7GIewTkAQxRxMN6R5yzzdI=;
        b=IiWIgmACyebbT9WvoWjjV4QCmCn8NN58c1DAhYi/wI/dT+vfl+dYfVUv4YyzduE/Oe
         n4ovgbxRJYWG7zMomXcHMRVjGF2Q3VXgRBnzmxoyRmLrAvnMyqk229YauYXT6CbrHK7F
         99yBShRRMpV93TKuEZXfYfsEkQwAiRXN2f2u4XyHU3H/sZRFbwOZ1MDDMZz0DjMJmKd2
         b0GdLn2oA+z84Gr7Fu7vaVk6Rb6UFFTZTwM4+/Hbb7eOqStIaxZ77YOQajEzzbX/fZ8z
         yLAZ/JOvokZBbQ13uBpo+WVvvyWbklQnvLOnJ9SoQJErJe4iUUND/QHohUyqzpa6Oyum
         9MfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202963; x=1795807763;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P+uR6LSFUuS82mC117S1N7GIewTkAQxRxMN6R5yzzdI=;
        b=O49+fA/ClVrpS/wtGplHx7nMRXbYfCLNKIIrGV0g0k9qET89EbMhHzyMQgwzHOFt32
         ITo0b9F1p4Py+EEa3vRgQrHlma/EXRZ+SKu0BAJRhs65cJ1zuAI6Iy1h+dT2aVDJ6t7Q
         dxya0nSw77fzZFqRcAWDmKqv3WFneUe4gTEAy8KnMJa9T8/l3RsTjIT1pkCbtUrxs/M0
         WA4KAy+5QI/rk+dX+a+lksPFaD+mxdsmjRw00gHIY8twM1Hbl1ScLne0LFXv1b6u+jYS
         /Ggog6RsGErZEcl9ZQNycvrgDxFM01vXF52lNrRsy0DElyxq2R4XGpzFjR1Yv+gu+VLk
         MocQ==
X-Forwarded-Encrypted: i=1; AL+hErE11yk+aqGzQXAK1mwriGbmZLsb87v15aQt/0d90Q5r38YHnu5zY7Q7XeY37VwyimFGTi/rz4w90YE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/l78iM+BnJ+XPYtuLoQDpvlJzaXVVCV0c3p+KVDcmOYD6ttnsH
	hozzW7ximSTRtSbXQ9azdw3JAH3EBxuEqGPihdtTjY1GWCmSl1Arnni5
X-Gm-Gg: AYBFou1HrjDzuhG1CFwjZRdolWHwEhY0g5IPhuxPPppxutNOsgf1egpEeEy16FnY/nE
	1oD00qmUFS4q5o5RZ4OlSRyB/B1BdhZDABp3JvZHzYwpC8JIbsbQIcuQppjCtq8ByYCpgugRqaI
	S5awLgD79mJDBjILuIYoTQ331XFm5885bnpBfBr2h8sl919Pz2AykINxeLCWeR5/L2FsN3Yx209
	riohAcQazCcH8pr0q7M1pqSnw7ATh75P+xM0U3W6XxUW1ScvmlB46XL0pn4/y5QvfS8/00RnuhZ
	q0pMKMIAxRuCOHvPzw6Q7HyF8f6+M6WVRj0mNJpBc62R61nF/N/fParhddW5JWNIa11/AtJrxet
	mf3cl38iXW8U2GzqqB0BdOYb4bH7+YFAgYg02Y/9crpHcXwd4O9YTBTWWPmFQzC+P3rEq8ehXTq
	EeoOtWGqc975jdkmAkdo1E18YU3FxBnS0QdGVvJ4swa/2BnwHSrFoa3cXDzXQc7mAC5Wmp2Fh4e
	CKzH9OuZ9u84Rhfcii+CeibxwfYcVaMf3wkzY7XneH2BIia8rsi7KMO2U4PN21IfAKgdXFEVsT8
	6u1BPp+6j+g+yLA1bTBTvJHOGt/boRbUP1vs1/G5DLHGc0adLsiRkzcFjzOkWwu3gw1q7jsv7fS
	X/v+oYIWpNh1Sk/MILErD/bBft3a9hm+MbuCvgCuhTo9zVprYyrPUoFuJWk5fUFVSPcVbyoY392
	N5tsi/5V9fZtPTbaSooICLvvn2WjADG0sG8uuNhmqnlfwTiV7yRow7
X-Received: by 2002:a05:6808:2229:b0:564:3e9e:b4b1 with SMTP id 5614622812f47-5797c0b7852mr4356033b6e.18.1795202963128;
        Fri, 20 Nov 2026 11:29:23 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc5f7ae7dcsm3434498fac.8.2026.11.20.11.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:29:22 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 12:29:11 -0700
Subject: [PATCH v11 5/7] dmaengine: dw: extract hardware-LLP residue
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
Message-Id: <20261120-submit-dw-dma-synchronize-v1-v11-5-9b9166bc2cc7@gmail.com>
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
index 0d2407c6472b..b556a39a24a9 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -281,6 +281,30 @@ static inline u32 dwc_get_sent(struct dw_dma_chan *dwc)
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
@@ -338,23 +362,7 @@ static void dwc_scan_descriptors(struct dw_dma *dw, struct dw_dma_chan *dwc)
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

