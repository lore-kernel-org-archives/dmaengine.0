Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793648064;
	b=ZVIITaQeFN4+rt+4BKpLbeZyd7C4saxDVNeJ9B13mpuqBNeJeuhUDvKlf6fc9gXYVfGv
	 l9ul9D5Vv1fFeiqXlISCHKhYuBnq6UKJhUoSY3weMDYTGrlotv2DHFGSK6iT0v3LtxlQU
	 rmml/P/arDlqvXhztKHSNSlyfg1fzRCL0+ph3atXygEzyHFcAp6Q9NNnofj0+A27CpyqG
	 f+cy0EZbCHxw2QdDdmeCq++xzTd7nrSYeyJGXXvmVPosbpDjd4sdWLDV66vLRJsT9bz3e
	 D5vMc2zbqDtDnXkn+Rr/rwr15eto6trHr1S56w2v/rIHi4G1STUcfbZaz79DL3cWSmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793648064;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=DzyeQhcNwNETnkmir5YGLg/TCJo3K7P6T54Vfd2MVK4=;
	b=ZDmsMiLkWd+wgqJJz5NyZ8rpT55Bjwf4/QDzV4MVMAWnjxDqZUDaxOnm4ODeg3Bc+yyW
	 SFzfHr8brtdBATZ5gwn30MjoIiy7ItIyk1iXcNVHDNAw4evviqcb8ELeIYFu/YKE9BR3t
	 Y0M4bvK1fTT8HcfRytPG4OEKsFZkb1JnG2nDxzyZJZk+KKDOTNjf3mlhOgHqRp7kiOxIt
	 tQenruOVaheUdnhO5OtjdiXCDqPWoH8DKPmA2nrneXQV+k0L4vzhTGq7qoWTGqIz/dMWk
	 oC51QBVkrAafK/xKydO61nyI5WDTaGcS0ivEpbq26ymfQIINHiQqwVV6aAcP2mAY75A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tzDHT2nT;
	arc=none smtp.remote-ip=209.85.167.174
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A774606A332
	for <dmaengine@vger.kernel.org>; Mon,  2 Nov 2026 19:34:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A774606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tzDHT2nT
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-51f2e9e6987so3105130b6e.1
        for <dmaengine@vger.kernel.org>; Mon, 02 Nov 2026 11:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793648063; x=1794252863; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DzyeQhcNwNETnkmir5YGLg/TCJo3K7P6T54Vfd2MVK4=;
        b=tzDHT2nT9L3e91K4uJShuCHF1FzLra85E7U15csPvHypdzE+ZVMxuvELUxTnr5g5Hx
         8rnv9Ji3wlxbp2OjXuTvSt0lx5+wg1kqUesCrneqGaAI315GilIR/jT1bNyhf5ZLrGGa
         ivrJimj8CqXE1/KAQYAYvQNg9HTGU8gWB5rwYQxXKZ53PXTZksTMW0Q/CyAm5Xr16woO
         V0IcOU0xUFBsQLjfc18Zi9rmAsX4Ci5+IgU6cGyDHrmL2xdJEcxACG8hVQ/yKGj0E048
         lZFt/mzkVQGR5g9LSRQjWG8wutDrCN6P0ZwbhZMEm/UO0sxtsTt2LvRrD893X69Akilg
         HD9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793648063; x=1794252863;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DzyeQhcNwNETnkmir5YGLg/TCJo3K7P6T54Vfd2MVK4=;
        b=qN2K/Nr1SXxmw1MtQ0dLDIbJnPeDeLeBXGnvHp0nwCZ8LRdi3XDZGHmI6lbL19agag
         EMZVOOmn9K6JfJmEuz1/n+ZzaG/aVYzAQfra56t1pzF59AFgVsJl/V4MT+G506yvJ4Sl
         Btx8UbWJP8AaaNx3wPhPjP78LDwRGidojmMHcQd/SH5LOY3EJcrXX+USPPKaRXjxRZqX
         NCRfrzp4byTOJOsRmjOBDGML106/vyif63KR1Z90aw8eTuD3BYNDg80XWfAxtg0AjYwo
         rHjN/Rwx7i2+/iWORPjDsYD26KsC9EhPGl9sN2cYAiKFTweZI9J9PUdcs6VvdPx3ZXhA
         z2Og==
X-Forwarded-Encrypted: i=1; AKwUvByHOTzG6esNPNKNBVWju48lqpjF+pQ9e5RtEj29OcD6b8ynyynsS8rqpof3XXbRmhOfYMwgGh53nlM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLC5Oiq4k9OF4uvbVQVhJk3oI9oKAg0rNzNdjqxJuIsP0yer1Pj
	9UR7f1549xr+eNKRbylJExUgumFR6DxBL9yp7yGy14OPSwUOyqCDI7lt
X-Gm-Gg: AYBFou3F0wjmaxQfIn5e65LZck1Y7JzdcqTVPZxDa0Whokv/q8j5KCTB8DyWIVPB1vw
	1bKRvQjQoL2w8CGawC/leiG178Mk3jx/8EJDZfLcPxEnRYvJHJyYXBzvgLdFiqxCdQ9yNwPmB4S
	m4Ezf5/RVuKrE+Y/XziaAjCnQEJLU1nJvIluyAM7caJ3jph55ru/3zK626/ZHt4P98fvkao2EBM
	1XLkdC/hUKr+ApmdV35Ldvcg8/tAZ053ulpTTeX6ikqSwPTHByKndbAku7Rvx7MX7Y5jooSp+hL
	/uQGetwF57K01GCmQZFp6SkyfLt87F/GAjgLFVRzDi7Fib7IIVkRm/FdH1dJ9AOTP7TnvNYUU/T
	pAIqXQxJzg3GFPzG/Sp0qmRMZQZwp0N6ljaQhKlrZen5F/rOFjQau1d/jjiSqZBcfCPyHfAGfVX
	FqxcTssdUbAvS7GkjvHYqL7RanOGlD69ELnh3J5CY17N6n5LauvyIb+FNbTSHtCJbngB+LVrQdV
	WLr77o5mJ2+EiTi0bE7hiMkL44a7bfgg53EOFgBWfSMPYN2EKDeufxYOr+Byj1VlVvClzxsxUmz
	LwiAohn56xN061KfUaNB1Y9XYioFMP2cJ7CgnINWJbybefowj5m04w/prm7WTBfvvIZtFutL2j1
	vm7nrs8+vktW8K27r4yrGwezuj5065dj6+4D6w7uNHWAbTgoewhWoBX+tkg5CVZdFwJVG1CA9sh
	nFL7vSjfhLoFx4XoHhAb7ScYucRBB8a72MgO+3x/hXpwwpn4q3/qE=
X-Received: by 2002:a05:6808:1904:b0:4b8:46e3:e223 with SMTP id 5614622812f47-5640debc697mr4798058b6e.15.1793648063113;
        Mon, 02 Nov 2026 11:34:23 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fd93451sm8558249b6e.3.2026.11.02.11.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:34:22 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 02 Nov 2026 12:34:16 -0700
Subject: [PATCH v5 04/10] dmaengine: dw: extract hardware-LLP residue
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
Message-Id: <20261102-submit-dw-dma-synchronize-v1-v5-4-d3207758fbf9@gmail.com>
References: <20261102-submit-dw-dma-synchronize-v1-v5-0-d3207758fbf9@gmail.com>
In-Reply-To: <20261102-submit-dw-dma-synchronize-v1-v5-0-d3207758fbf9@gmail.com>
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

Changelog RFC:
- Instead of just dropping the dwc_scan_descriptors() method invocation
  calculate the residue in the Tx-status getter.
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

