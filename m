Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795082555;
	b=dCk6nJVPqFlcHeMdQ3RBTmahX0PA2OjxQ2vY5hS9ZLz5n28rILzGergLAo622BwPufRC
	 UKXLqjjvRtGxn1BccK7+edF4kQrvCAQYSygXzckQQsMNEotLmj2vA0DEVlObqmsqOlCX2
	 rkVpyho7R+oyaKSlFlhKoSlE7q8Q53gmXS8QODwAQNhg4IG7XcNumUKn4BszacC/Mj+ey
	 9E30ked7eI8SlQEdfxK+Of+TViSj4VhWae/rKUHJiJwePeR5tSSyVvZk5N8lUxDcVLw5j
	 Lut1sGNS6DJXy+JkLwrseQEo/JCv7sve2BHJDKODEZJ1XFKBAw4YhfhyjuBJcS11o4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795082555;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=6MNqx8SelieMagco0tCtX+Et6uyqf4e8xNdGXpW/e7g=;
	b=EZ9Iwfl7sILGrYCWt80QwLwEeUA5Uo/LAU7IsYAxqi3zSbMHkAeXR9hk+bMe/j8J7exs
	 UT2YC/mBfPabcTfp+xtafyn4kQ8tM6S9r5zXtc3lNLMMLctzPc1tYvLKQ5ni+otk+1j9k
	 GxDSJ0InjsKj9BlwNcmGuc5LFKivHi/5f3/4P/ZNwNyfpJP+JSwhbiUGKvpyji3Um9bhI
	 2brvypE9hFlBYXtWSs9oRpCUui+lODDh2vwOMfAH9I0/oe37Knoy+auLeJqW4BNHh1FLO
	 y4h+0M9gAAPOyn1PYDN16x4ahVQPs+Vc8I6A8I7QMXKoRkDLldWoiNSfBXHzElKOblw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UqKCasXB;
	arc=none smtp.remote-ip=209.85.161.49
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B46860A262C
	for <dmaengine@vger.kernel.org>; Thu, 19 Nov 2026 10:02:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B46860A262C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UqKCasXB
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-71acdd32a53so774203eaf.3
        for <dmaengine@vger.kernel.org>; Thu, 19 Nov 2026 02:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795082554; x=1795687354; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6MNqx8SelieMagco0tCtX+Et6uyqf4e8xNdGXpW/e7g=;
        b=UqKCasXBDO0hLpycOtrLJqwUIDTf/hQ6qud9KSXX4mQviejJB9wmD+uX3qhmUW8hPS
         8vjLJEKhzphDLngcZOvczQ2rG0Elta2BtCDAVMiL1Zkovx+K5kkTBj7ksSJiEV2TRDgj
         eCq+v6N/8VRgxfUqGxeAzZBjcXOp1tpmNE0RteZpSsZThgOBrMsA56T+CSUJDMiHTySt
         PIdBQn+dhkAujUG/2xTDFxHShwyiR63D7Y1S/G8GvO7lXm9XZ2Jfs10Ky5r8nBRxYCaF
         hSkDCKK81qqsPmi8UsD0W0ACucUo4c/sm20nkaMMRjyIjXIjUGvn6jLAvwD7LfqN1jDc
         ow5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795082554; x=1795687354;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6MNqx8SelieMagco0tCtX+Et6uyqf4e8xNdGXpW/e7g=;
        b=t85uMNGMVViXOt2ZX9MA0MiJjFTDzs5h70OSNy73Ozgx/TQJuZqZEKLFfjOCScAaGt
         /yFCTFZi985KnAnMxPb/xcZoEHmHMOjTqx3xwhwhGkRMSjrInZy4D5xeB5HPkXa7xz7t
         BriZOUWwHgXAfwc1FN9UYBRjOOrqbSo4LQMjtSGORtAiJsm5XWxi/MaxtuilMtV9d8Td
         LX9GL7UX0ZNaE8xqJYfK4NTAeryGAlDtOFtz+8o4/qMIV7axOIeegCfGXCl636vCRlGx
         gynkE40CPUQCLeToGlGIDT5J4wdWrMmYpTSmcWDLHWPJpz75LQWC4c8ysrh2ohVxwN+N
         TLlw==
X-Forwarded-Encrypted: i=1; AL+hErHjyG7H8Sz2I+c7qdB7GGhItG+BwtaUD/plxN73fzoqHWCS//1pM2/OyXevVc5rJlPn2sXTzNoPFAc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0dViZ1G4i5oL/6trS5dq1pDDRO1WeKvNktpsU8paDhlQQ+Ur4
	VuSKTbg4HJmOkxihC+di95GCQP9AJQu/nWsAVszchMjRG/wN2sUbem75
X-Gm-Gg: AYBFou08CsEh4qmTnLG3OY7EDeVnjMsKk5KupQ0Uh2WeANF55WCyBQB6CzzzyBMFvW5
	3LIHB9hSj93/VvFAFpFgp/GTMsziqSDJ+l6k4l8dqp/2V57AKmKcV8io/KxGqAEKb8aisp1agWJ
	q71xCNImWQZDKdjyX2CTa8oMcGQyfxMQgetFb4/k/TWGE1UGYwtVHIR2Vwkwi9MVJ+D8+g0El6J
	w1j0bOn1p9uAE+Y8mmYAYLFW7Zh5HTIOJJM7rDgbHiUy/mnd/VgHnxZRGyC43jjLjn+S5EAZC5/
	erADkX7FOxc8Woh/9jM055+rX4+Y5ka/mEiBaUNq7PEbloraaYJGLyTOBrj4zQRV6si4KBEG7xe
	+cwNkC5NgOWgV/FwYZuVjXoSP/K42rXZgSFfMBz9MREz2koVhQfyhZPWNtAszQSVykH1kye0YOR
	Xq6jq597x9J4BCt5rGBYpCrr0f06U3NbGBDZRjQdG2Ag12VcaRTB+pXIGPwFTZKnOQIVN7QvQGN
	BysGoDjtpWua1vFa3IItqF8d1FM1J+oYTaC7BKJ5QJcS8H5X3uHevOEyX3xQ7POLibYuSwC+Zee
	hutrMi6Apu2ultzWprx9HpdnWj3en0aPlSVhO9YZBLxglK0gvFzoGodXPhOjSfNPsqUjm//TSrv
	meZgnANhd6ETD4UWRqZSQ4X/9aisnJ3YGLXstiERbwAImFXwA5uad2wrdYZSVpNc1lmtkmgpbhm
	j2X+nWRpTcZJTNgTKWqmx0SRTwqBv3JAhz6kcSxLlptKB5tXP2wEsq
X-Received: by 2002:a05:6820:16a1:b0:71b:1c49:5f22 with SMTP id 006d021491bc7-71b1c496c08mr3044704eaf.42.1795082554397;
        Thu, 19 Nov 2026 02:02:34 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b18fbb9a8sm3906194eaf.0.2026.11.19.02.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 02:02:33 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 03:01:40 -0700
Subject: [PATCH v10 6/7] dmaengine: dw: calculate residue in the status
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
Message-Id: <20261119-submit-dw-dma-synchronize-v1-v10-6-3a737597a0d1@gmail.com>
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

