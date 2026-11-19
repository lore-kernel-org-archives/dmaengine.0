Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795082554;
	b=A9jo9MnKw3NhL8cbP6DYZJsyH+m6k0rZrq8mKn2FCFfk/Ik3KttCixDfm+Wf1YKOmA0r
	 k/39FlzXu+NL2eZcb02bXTW46sdJaVIAkTap4POhvyyF/Sy0Dd4H1li4ZI50W61memKY7
	 sc3aq/26uo5/CHcLBfESd9JlV02psSRBtylW0kpmyWC1I4iV6MEgi8pc2AnzZ7vFRxQoq
	 ZGjtndePlkgQgxADZMnCj9pj/kZnfV+998RfBVjCHEl9OgQb6Y2GEC4Xe8F2ERCwz2pD9
	 XyHxBNrLrhI4ozUR9HaiCCI4hcsEUJ3YTo6OArzkFBc4LetnGhjfjS/7BvDH8mVmtIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795082554;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=P+uR6LSFUuS82mC117S1N7GIewTkAQxRxMN6R5yzzdI=;
	b=CXTzu3ibLRq92aol+6i6Yc90m2Y0LaCLpq2oQ0KADWC4z88OfoVbr73oE85E5aiewuOF
	 mqw9V7k6f8HRYDm4Im7LIb1Fj4t8lFv1DQd6SAdIU9qUcJHEuIATnu+5qdR9D6Bb7jUQf
	 5trzT+sZltfgaJxlURtxR9Z6PIrTy7+BL2dNmxUZ9dHPm8Y2urfFFCHNtxVhtyHlA70O7
	 mAkB37PHiCAkxZHvLx2kCjPfQlNzFaANRx3fFFxsPWi4wXliLkHuM091WPSgeKvkBahg6
	 /NsEubiWsSUG8G6+1UKWQUV8AhBBeoJ2ojXMs6JT7fyHRhTj+5uat9g9ZXCBNUGrrhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cP6joHov;
	arc=none smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E031606A33A
	for <dmaengine@vger.kernel.org>; Thu, 19 Nov 2026 10:02:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E031606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cP6joHov
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-71aed54d4c5so1344261eaf.0
        for <dmaengine@vger.kernel.org>; Thu, 19 Nov 2026 02:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795082553; x=1795687353; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P+uR6LSFUuS82mC117S1N7GIewTkAQxRxMN6R5yzzdI=;
        b=cP6joHovQZxfV43Gj96NVapePF4F1oLgVJtWAla1AWdzBfxMQwA9jaN5Io5yxybHn1
         fVOFwfLb8NYuqrrwLt57r9meftxKoiWP3sgfCdZcBbBmyCuT718TuqYIR8ONvnzB8OSK
         OG6JsPd8IzNj2CzXWh7JUicQsOW+HgU+rJIX5oJlxOGBQIiOcrzf4EV2Y9Y0EKmHfsQs
         tuqz6xntkRNn6hz+gFoivwpsu7J9bkp640K9+1l3Wq/JMZ1WAi5fulfez+bGBvfhmL14
         h61m6Sa8RCzsjxzMlyGQGfu57E+/xvW0an9G/WJNgurm1+Fk11xbYE2Sx/xH/QzEA8dX
         ALXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795082553; x=1795687353;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P+uR6LSFUuS82mC117S1N7GIewTkAQxRxMN6R5yzzdI=;
        b=je8we5jXxEQw+nFIUay4f1mmLOf2UJN1SRlfB+o143ZOPgvZCA/aVeMZoEi1aV5wYq
         2uP3WVoNDaz6yKpDwK/0uEsPGTzhAdwqZKm/r4Tl5u1KP0QRq8THqYmRjXHteZhMk7wp
         FpUN/9Y19CfvstI6KnMjN4hitIwZtWcn0lzJJEIhP5KUTQXqcnDDE7pUldz+bw0H8QVS
         KnlTIc2pVE+VcC8Pp8BSQapgb6ZKPVGnHs31Z4YeglGHn6AY1J7ejl+nRT4eClkAMKqT
         Pi89iig7Crd9jZRKvxzrGCUKlz8mHOBYpATPVu4PBg1TcgIToiPBuT8ybMnKzDmpypII
         tCGw==
X-Forwarded-Encrypted: i=1; AL+hErFUbgGebtqkdjPe3OzEKGaxqZhaFhl+Opjzh5jPK3APyRH1dOLan33avwkmkA09SPUW7/aDLcSRIOc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mYTplQTRhJMB/biD4hw7fdi+uj5q8Wj2o9v+YkZngsHJUs5gb
	g14voPZxFFL9mJwAtNYDO5tg1Dx0TabdW+zVzFGZmvKGrktHNx8nJ01M
X-Gm-Gg: AYBFou1oyUTlpUNwn+Koynxg2QyxiSulm0gaCxD7ddI/j9IGjIo0SCMhDJQj3e5bWVT
	TR6A5aQ5NH+mGTjpvlgy/XtceqEE0r7paHGBViq2IdlvNj0a7V3UJQypWYYCd8YrmCcl15hWs4+
	tEClvrEpxi++6VvyE/dl/qt5qrr8FixVHyx30v1B4yDtFKm+WZDuhkOzJbEjZ8EL54H1t0t8/Ol
	YlPXeQ9+xYcrlPLqrzVxvkZlHgqvOrLM2s/a2SRRX5gXIiTL9FI0sg4s+hECWvHGLhcC6sjCJsp
	gYBtWCKcq2y64vdA7ohv2ojNdqAJ2SZItlbGc172+y4OODZTH3/Ni6lBCHcBMXTPky2kY/smI+Z
	MPO2AGs3kR3+tsCDoPQbC0mvKKnxWiW+AliVo27xM81QwtAKYuKoIWqzpgczSoENFwMoN3CHbCm
	P8e3LbF+6t1wFozX3Ht+bT08WiAEu0KzzXC0XyFowBW30oOAs77jDwfUkU8z6PnpO4QRRzlNKH8
	cqVDkofCXTOqeOkwtc0/ABDmc1zyMZ79T89Lkw8/p3SnQjbcLZTnhlzYBoFE27AbFFcQEWzz37v
	AyJHI7jNeI7Qo6qw//fYZEooDKvZPHcLIcX3TfZGRvOKO4lcIVrzKDFpoJLZMq83wwX7rPuLDFp
	0tlPmQ/OErWfsJ2LzZSxtVlH1CL0ohur0d2aLyN6rf4Ph93i5M/Q6bGHKjYiwSsf411TRvBXK+L
	MbbtnZFrKd9esYOjkNWP5NP0WkhDFreuzJFxwaXpLHHNyiBv9SbGZM
X-Received: by 2002:a05:6820:c5cb:20b0:71a:fa49:2f33 with SMTP id 006d021491bc7-71b1848ea22mr2638874eaf.41.1795082553010;
        Thu, 19 Nov 2026 02:02:33 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b18fbb9a8sm3906194eaf.0.2026.11.19.02.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 02:02:32 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 03:01:39 -0700
Subject: [PATCH v10 5/7] dmaengine: dw: extract hardware-LLP residue
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
Message-Id: <20261119-submit-dw-dma-synchronize-v1-v10-5-3a737597a0d1@gmail.com>
References: <20261119-submit-dw-dma-synchronize-v1-v10-0-3a737597a0d1@gmail.com>
In-Reply-To: <20261119-submit-dw-dma-synchronize-v1-v10-0-3a737597a0d1@gmail.com>
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

