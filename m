Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794826392;
	b=RQz3tDcJuBSlw7PUnUww0fS6mOGXNrxAm0SGJsN818qxNNQXpb3bRzS6OHJ1SzcHROaV
	 kg6MKHPIlbG9XNsKHq0/tQP+1xkZFL7CxN2qv6bm7Avf6oIrTAV1yTFT/4I+HS1NykK6w
	 6OtFiI76X6rTYydi6z8/2j09fMKdfyaZd6dCpvfj2/9m++7wd+cE78SqGnQMoubovGtEQ
	 54b0y3E1kj1vGlWE2cwRJrIYMfce+luYaC2UXAd/U/tcBLhLOH3svab6oTXhezsVvTc8K
	 htSOjop8hYZK6KmR3SKhttgdlhzhpGWO2aDlf4row0plNMrZxGDkpEsaquF0xkoQtyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794826392;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=K0i/xrW+wVH3BjomlRH87KMdUy4LFZjH49JteTT0ats=;
	b=P6nhmaj1Ssb7m1t/UTD+aab/FiufhEwoKIJ2CD4cRoYCFj2GfawEA65/yIjg9YdqsGTu
	 /g6IJmTggF5KC9a8cgbfwUJ5tzLzbp+46ivG+efjZACfR1Cotm7rUhva4yYTzUBo56G7r
	 2pr2GfQMuOPlQF86StPkmYMA9bhHJ1rDKsLNcqu4Hovfj2yR/8+2sCGtyhpK8n5KLh/o/
	 YsDIWwii01m+CW6Y+w2W+yK4MMFDYEBIi0iaPH3qNcTgflC6HNyjzjsyr9w0xB9ERZUIY
	 55g616GsygSYinadmeoQjqpTyOiucZ/SbJEJ66sH4A8GxIaGzUMNGd7yvWtKeDJv6lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GmUsAtvS;
	arc=none smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4944060A2608
	for <dmaengine@vger.kernel.org>; Mon, 16 Nov 2026 10:53:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4944060A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GmUsAtvS
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-70b875f6f1fso3634146eaf.2
        for <dmaengine@vger.kernel.org>; Mon, 16 Nov 2026 02:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794826390; x=1795431190; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K0i/xrW+wVH3BjomlRH87KMdUy4LFZjH49JteTT0ats=;
        b=GmUsAtvSbwsdlAwC1mIYv0+NOcOmgCNdTQjqnO6xCvFfxWZvrT5ezUBenWrx+nUZ2S
         pQuvuU0uFb1KX4Y7THWkOT/O5GYufIiEykMHO+Ax5+Dh/rLaKD8XNa+5E+39NuZp9IQR
         yhPXodfJO+ukZQ6+wzD6iXDQt3/jj55apKGc88eV1j6tjf7gh+aspBXll+lbZ2lbJ+4F
         Pdp+NRat5FEHb85QMI/CSiOAEtoHrc6shQ68klDhOWQ5x2zHp/vi/0iZMtXSbec+iCb6
         RDS2XAr+oc6Crw3yiaxWfOT3S/bG1uB0f98bhoJPkLUgJUwBwapVoPPBy7m8hUPIOz+P
         FrEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794826390; x=1795431190;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K0i/xrW+wVH3BjomlRH87KMdUy4LFZjH49JteTT0ats=;
        b=IEzfiNBLnR9fPzMMTZv78R5PK76yVag7djVgQuu+1RmhZjVaBW1/rT5iDIfgnzofNl
         paRuRioRvadfnjmV6RdOoBNqKMtCqY2fYCmvjqV35eS5hOYcZc0NmKvrKoIJzmkCEwfk
         18B6w1Sa0VO80opUM0YLif1jS4IHhc1EjaJGzbl1Hkta/x4s0A9i0JKBLLDwLna33ATj
         jo+EppbCHLQVleTuEoJSOM+6gw4nLBRIKud07GKzQv6xWwThChQQAxSSy9p9lfqvcBHH
         yPqTEqCvh8aEdwjkcNTkM2odMl51N8CwU10Yy+ydfK9ns2h07tHyz6Ijzsytinv/BMA6
         zHWA==
X-Forwarded-Encrypted: i=1; AL+hErE2SzDRgy5prITaa/krZbM9uKBG9woHfqjeSB4aU0FNoGUecghsRISDJx9w3gqXlrgP3nj7sp47HhA=@vger.kernel.org
X-Gm-Message-State: APuU4Z83xwg59xArj8Z/DQej8dPxo9Rs5n3rsFt4umv3lw2dYS3YBqaM
	rip8ehwXiB5/CT1J4dwVynlF1cA9fzV/kqWt+Gt1z5Fdb17OneFXhsjV
X-Gm-Gg: AYBFou0qYgUf/3WlztWDl/Rf0oARX/6C9GkYy0pYHzZrYErYkG7/vytLrMmNEi8MYO7
	cU1kNanEu2F2Up5BDJ5OVSf/5RGfGvoTDQ0IA+3UfPTcFa7a1TuZ4/Zo6QpHfxtuGP7ECcNGGU8
	BeSclbC1TtMvYmy90rvK3HhFz+AAz28hz5465sf56STneq6Y8RcEqSecj+SJ3UWxaLw0DpuvMcE
	/zhH+hJWC9VL3F+j9oHsT9UF2VOEFL1kgVw9+Hqb+cGtYhOiNgE9WPjgc708YCZ0O1K1cOZpwuu
	lTpeOpkfO6uUcnOqTGm6DamXZWCNBlNhE0X8hbMQzZo+vC44DkMRWP9j/3wmVt0WS6RYb40DRmY
	xUg9KfWhUDr09GkfOMSV5Vb56NxFV2yTfjRdxoP1NXkrQGv7hm9GEA1kQEr8yEUaFqJqOxivGrx
	SIJLS2WMzcHG0BjVuFO/k0iYwiQdNz4aXkghvDRKx6XdO7lyfJPOXPt3iCP+h8bNRqJ7hj+snvr
	SqORdRPcvTKk2nMwXBsSCOfdhcBjo+InaYWk2g/NI+bfW/5MkKPoFVhlFem7XA/8WHRXgXX5sLG
	+T2/cTl9lEIXWvQEoJ14t1EvcYUHOaREC2bDOU9c/9TjvJ/dVRkhevN3LtNMSHLFVQZDSJII23w
	/xvquTHDvMRepGvpfYgDwtU2gL46CfipeB16L1JZAxB3VKbs/ELS/QTxyHgUxxdPssbAluK9sLH
	3BuW7JWHKLfldt+Mcd0Y8eJJyyOJebwO+iwb9YWCLJBsg2xjee1e0KmO0v8kn0HUlRvhUVPJdf
X-Received: by 2002:a05:6820:1f03:b0:71a:e74b:f97e with SMTP id 006d021491bc7-71ae74bfad9mr2617887eaf.23.1794826390315;
        Mon, 16 Nov 2026 02:53:10 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862b08b8b5bsm5555546a34.5.2026.11.16.02.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 02:53:09 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 16 Nov 2026 03:52:33 -0700
Subject: [PATCH v8 5/6] dmaengine: dw: calculate residue in the status
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
Message-Id: <20261116-submit-dw-dma-synchronize-v1-v8-5-4a82d64fcd1a@gmail.com>
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
 drivers/dma/dw/core.c | 49 ++++++++++++++++++++++---------------------------
 1 file changed, 22 insertions(+), 27 deletions(-)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index 504b6ddeccd4..565d01c9a29a 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -214,41 +214,41 @@ static inline u32 dwc_get_sent(struct dw_dma_chan *dwc)
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
@@ -287,14 +287,6 @@ static void dwc_scan_descriptors(struct dw_dma *dw, struct dw_dma_chan *dwc)
 	dwc->desc = NULL;
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
@@ -892,9 +884,12 @@ static u32 dwc_get_residue_and_status(struct dw_dma_chan *dwc, dma_cookie_t cook
 	desc = dwc_find_desc(dwc, cookie);
 	if (desc) {
 		if (desc == dwc->desc) {
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

