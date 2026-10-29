Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793312993;
	b=DBUT20mBxvN9K6LrNGcnu9O5ustoU4J6WqI1ITbrJIIqwOIBY5PyQZEh4v9BxORobwpi
	 zcuV1ZTm3EYQH8ftfutzkfwrxCjj/LfntiMFaHuFsYniyyumW0nqA6WUM+j3QQNpmV1DQ
	 V7xdF9BCBxiNRQol05BgZoLYq79HDYNcQ9xTBQqcYiHgac2xpEPntP/6fghBeqb0C8uk3
	 kSi3iJPurIaMteg+1Mlv8eP74PtCv6Idw4pXnoSb1GE6wrb6ogVlewT1J20c1lmXpy2hA
	 SO5XAJ6WnxmslBy75SnG9Q6+OfPkF7Jb8OxlW2FOQ9+8GIM/VmrONrJ/5V06hiOV3fQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793312993;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=V3aVMBEgHd2ET1QgNtXDVMmlRouLoSPiwRHkeRlkC0o=;
	b=cxYHlQO3AKxpFyisbmwaai2XIntPYudT2fQdjTvy3UcNJkJzDENGLoPxi4l8gJ03zPZd
	 +9R5Po/CiIzVhovAw9GBc9L1JkPiJ4YVTdqH2IdL8Yyvfq644h0EnwJEzaSg0HIQa41WL
	 molgx9PMZvPtBLURXP2xitCV+q6OjXQmjuYyjQnPJ+CXrhnu7lKeencIPGlk3DUxzdym1
	 MaNg6DTfa28y7HmPiujSy6Y4VSLJ4hJ0bmUmV6OacV+GtibtJtZ3wOFVbDVqzf9R/0F4K
	 RqKCx186CH8gx0SUotZ6o4QBAN6JSb2JhFSKksapCsx+EtmQJCDPMMQ88ffoeQ8J5HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hVVekswo;
	arc=none smtp.remote-ip=209.85.167.182
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B73A606A33E
	for <dmaengine@vger.kernel.org>; Thu, 29 Oct 2026 22:29:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B73A606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hVVekswo
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-4f55a53898cso55154b6e.3
        for <dmaengine@vger.kernel.org>; Thu, 29 Oct 2026 15:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793312992; x=1793917792; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V3aVMBEgHd2ET1QgNtXDVMmlRouLoSPiwRHkeRlkC0o=;
        b=hVVekswoHQdlz999Gs8Vn53cZ4nPwjP1ChbWRh7eRX7VPs6Zj+KVXjA2hKpvJyujV9
         Wb4OsXswCplvtb1lruNW12JAIsKHANaKRTZrVWrrijuDhohTwxAQElvuS4M8euvWhlmh
         zevr2+ysCbGCuDw6cCUAkBsF74haeyOmXM07a3TaepvBekGHZw5OPU57iSeUZiaENZof
         YCmww+32cGJFBJwQVNALyh983falWd2hmLWQ5+W/BYAGTukPoXp8q/5+MDuNBvv5vqqc
         sjgg6XRXoJdK8exrS2plfVFm2itdH2BIW+GfpLetEqbe0VoghF6dezKfMdxAoDKCHHtv
         tifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793312992; x=1793917792;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V3aVMBEgHd2ET1QgNtXDVMmlRouLoSPiwRHkeRlkC0o=;
        b=NpV5xNsrqtlBV0auobv+5TUdn3VUJobmUgnDgkbzxLGTuG2sz22uP2oXlN6zscPwjC
         fr68PsR4JhH1lOj32pCFPqmeIDS6oN2t9Glbd6VP9SpBU2wrQfDPXNIPzmrP0OSeWGaH
         rhLD+W1MhvrOSH++SzGUgZ86CEh9pRjMsowaFXvvU+P2si+whMft9HLClGlWNK943+CZ
         Gn1xEzi/rkGxf+kmE300HHjO5lz+znJA/X5uKZX9eA6+RzPfhynAr/cj0nswLBq6rOAb
         gX5Xh+0JixTE5d0ScpB8ljV1d53JlND82txNqrrZch89coU8FFz4OM4sr32U0iGvTCsI
         elsg==
X-Forwarded-Encrypted: i=1; AKwUvBwJ9iS7MmSsu8N1jnpt1UrrPF0Ow6U9METvxvK9CJFpCDQ//cFxYS7SkzglO/4wvsrBUrreSI5pZFE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKg7x/jlSFSGP9ohtVHvDOaa/4Dg75ZZEt8kE8c5DCKeF1Ob+jj
	k+Hlj0gog4pkmXGHIz2x+GGhgv0voiWZwJrONA9eLbIQbbG8UV/A15Rs
X-Gm-Gg: AYBFou249pheorjaUF38CRYlsxzUidCYxzvoFXl7jE8PiXUZVdubxwvP8fgbLLv0BBr
	EFai/LjtHBw3DoVX/nTIUXgfzEYEKamkwf8ZE6/mb/6r2w49CUtabalz5HyY7Jn7ikWY7kTAJP2
	VEOhfA9I4mB1wR56Gkws5omKUB8+RC7zGxLVpFnpJKqyQsYl/csSbWWr8K+5jU8i+1aHD8Ugqav
	NV9lgJ2C8Tr3TiA+Av+f82BtTQn5DN4SD3pKp4kSwTfecT7M8P238qWTGxzZyxZ+pOv9m0Fluow
	fNcmBaO8Z2sZUVunqt8c6DQ/Acs6dtb37lXsAzQlxEXqq3lKxsKp7sdBBefeuvP7j9hHV858VZ3
	UnuRJRCk4vv9D9DDRVgiY3Bxtz5E2N2z/2qzmsVp7cy3MS38HLZTE4cg40B9shDhf8X87RCbgfU
	nzSzNtkL5miztjoSBkCe5S8nUtQLcKDR1nWQ1dzczolawlb7nhuiOigw2mnxsb52NrklFBYZTjW
	7YusDKzW02mAuKCGv/Vjoulc419/Hqz5kv66sgDbXZwMmYlH1mU/lNcj1aKbTK3Q/vsJdmLAf0w
	sZV9vXxR6wdd7kiTt6pWnI7eNJJEo6Pa8bka4XPqA5bmfddMa0goFMxPmiHWG1vU0T61Fggnyz4
	v/gaGQeXcTxlbdFTQgiehVrYYV07ZV05lIy8JXlq0i+xdg41cN6KoZMSnTmcqdMnVqzNWRtjj98
	fWKT7E4eANYFvie1uBU3YYTK+vJNdPoeauJxou2Uoke40YlxHasL93JaxWP8c7cMI/exb+K37fS
	g==
X-Received: by 2002:a05:6808:c410:b0:4df:5cd0:89c1 with SMTP id 5614622812f47-5640dcf25a5mr483692b6e.23.1793312992335;
        Thu, 29 Oct 2026 15:29:52 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fc49880sm236130b6e.2.2026.10.29.15.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 15:29:51 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 16:29:38 -0600
Subject: [PATCH v4 4/7] dmaengine: dw: calculate residue separately from
 completion
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
Message-Id: <20261029-submit-dw-dma-synchronize-v1-v4-4-fea447d9f285@gmail.com>
References: <20261029-submit-dw-dma-synchronize-v1-v4-0-fea447d9f285@gmail.com>
In-Reply-To: <20261029-submit-dw-dma-synchronize-v1-v4-0-fea447d9f285@gmail.com>
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

The descriptor scanner mixes transfer-complete handling with hardware-LLP
residue calculation. A status query needs the latter for the requested
cookie even when no transfer-complete event is pending.

Move hardware-LLP residue calculation into its own helper and call it from
the status getter under the channel lock. Keep software-LLP progress in
the scanner and subtract the current block's progress when reporting its
residue. The scanner now handles transfer-complete events only, retaining
the distinction between zero source residue and destination completion.

Also search the queued descriptors so a transfer waiting to start reports
its full length instead of zero residue.

Fixes: 3bfb1d20b547 ("dmaengine: Driver for the Synopsys DesignWare DMA controller")
Cc: stable@vger.kernel.org
Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
[james: retain polled completion and report queued residue]
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

---

Changelog RFC:
- Instead of just dropping the dwc_scan_descriptors() method invocation
  calculate the residue in the Tx-status getter.
---
 drivers/dma/dw/core.c | 166 +++++++++++++++++++++-----------------------------
 1 file changed, 68 insertions(+), 98 deletions(-)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index 1f7afcd01565..1d6419e1cd3c 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -274,123 +274,60 @@ static inline u32 dwc_get_sent(struct dw_dma_chan *dwc)
 
 static void dwc_scan_descriptors(struct dw_dma *dw, struct dw_dma_chan *dwc)
 {
-	dma_addr_t llp;
 	struct dw_desc *desc, *_desc;
 	struct dw_desc *child;
-	u32 status_xfer;
 	unsigned long flags;
 	LIST_HEAD(list);
 
 	spin_lock_irqsave(&dwc->lock, flags);
-	llp = channel_readl(dwc, LLP);
-	status_xfer = dma_readl(dw, RAW.XFER);
 
-	if (status_xfer & dwc->mask) {
-		/* Everything we've submitted is done */
-		dma_writel(dw, CLEAR.XFER, dwc->mask);
-		if (list_empty(&dwc->active_list)) {
-			spin_unlock_irqrestore(&dwc->lock, flags);
-			return;
-		}
-
-		if (test_bit(DW_DMA_IS_SOFT_LLP, &dwc->flags)) {
-			struct list_head *head, *active = dwc->tx_node_active;
-
-			/*
-			 * We are inside first active descriptor.
-			 * Otherwise something is really wrong.
-			 */
-			desc = dwc_first_active(dwc);
-
-			head = &desc->tx_list;
-			if (active != head) {
-				/* Update residue to reflect last sent descriptor */
-				if (active == head->next)
-					desc->residue -= desc->len;
-				else
-					desc->residue -= to_dw_desc(active->prev)->len;
-
-				child = to_dw_desc(active);
+	if (!(dma_readl(dw, RAW.XFER) & dwc->mask))
+		goto unlock;
 
-				/* Submit next block */
-				dwc_do_single_block(dwc, child);
+	dma_writel(dw, CLEAR.XFER, dwc->mask);
+	if (list_empty(&dwc->active_list))
+		goto unlock;
 
-				spin_unlock_irqrestore(&dwc->lock, flags);
-				return;
-			}
+	desc = dwc_first_active(dwc);
+	if (test_bit(DW_DMA_IS_SOFT_LLP, &dwc->flags)) {
+		struct list_head *head = &desc->tx_list;
+		struct list_head *active = dwc->tx_node_active;
 
-			/* We are done here */
-			clear_bit(DW_DMA_IS_SOFT_LLP, &dwc->flags);
-		}
+		if (active != head) {
+			/* Update residue to reflect last sent descriptor. */
+			if (active == head->next)
+				desc->residue -= desc->len;
+			else
+				desc->residue -= to_dw_desc(active->prev)->len;
 
-		if (dma_readl(dw, CH_EN) & dwc->mask) {
-			dev_err(chan2dev(&dwc->chan),
-				"BUG: XFER bit set, but channel not idle!\n");
+			child = to_dw_desc(active);
 
-			/* Try to continue after resetting the channel... */
-			dwc_chan_disable(dw, dwc);
+			/* Submit next block, including for polled transfers. */
+			dwc_do_single_block(dwc, child);
+			goto unlock;
 		}
 
-		/* Detach the completed transfer before starting queued work. */
-		list_splice_init(&dwc->active_list, &list);
-		list_for_each_entry(desc, &list, desc_node)
-			dma_cookie_complete(&desc->txd);
-		dwc_dostart_first_queued(dwc);
-		spin_unlock_irqrestore(&dwc->lock, flags);
-
-		list_for_each_entry_safe(desc, _desc, &list, desc_node) {
-			list_del_init(&desc->desc_node);
-			dwc_descriptor_free(dwc, desc, true);
-		}
-		return;
+		clear_bit(DW_DMA_IS_SOFT_LLP, &dwc->flags);
 	}
 
-	if (list_empty(&dwc->active_list)) {
-		spin_unlock_irqrestore(&dwc->lock, flags);
-		return;
-	}
+	if (dma_readl(dw, CH_EN) & dwc->mask) {
+		dev_err(chan2dev(&dwc->chan),
+			"BUG: XFER bit set, but channel not idle!\n");
 
-	if (test_bit(DW_DMA_IS_SOFT_LLP, &dwc->flags)) {
-		dev_vdbg(chan2dev(&dwc->chan), "%s: soft LLP mode\n", __func__);
-		spin_unlock_irqrestore(&dwc->lock, flags);
-		return;
+		/* Try to continue after resetting the channel... */
+		dwc_chan_disable(dw, dwc);
 	}
 
-	dev_vdbg(chan2dev(&dwc->chan), "%s: llp=%pad\n", __func__, &llp);
-
-	list_for_each_entry_safe(desc, _desc, &dwc->active_list, desc_node) {
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
-			spin_unlock_irqrestore(&dwc->lock, flags);
-			return;
-		}
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
+	dma_cookie_complete(&desc->txd);
+	list_move_tail(&desc->desc_node, &list);
+	dwc_dostart_first_queued(dwc);
+unlock:
+	spin_unlock_irqrestore(&dwc->lock, flags);
 
+	list_for_each_entry_safe(desc, _desc, &list, desc_node) {
+		list_del_init(&desc->desc_node);
+		dwc_descriptor_free(dwc, desc, true);
 	}
-
-	/* Residue describes source reads; only RAW.XFER completes a transfer. */
-	spin_unlock_irqrestore(&dwc->lock, flags);
 }
 
 static inline void dwc_dump_lli(struct dw_dma_chan *dwc, struct dw_desc *desc)
@@ -969,9 +906,39 @@ static struct dw_desc *dwc_find_desc(struct dw_dma_chan *dwc, dma_cookie_t c)
 		if (desc->txd.cookie == c)
 			return desc;
 
+	list_for_each_entry(desc, &dwc->queue, desc_node)
+		if (desc->txd.cookie == c)
+			return desc;
+
 	return NULL;
 }
 
+static u32 dwc_get_hard_llp_desc_residue(struct dw_dma_chan *dwc, struct dw_desc *desc)
+{
+	u32 residue = desc->total_len;
+	struct dw_desc *child;
+	dma_addr_t llp;
+
+	llp = channel_readl(dwc, LLP);
+
+	/* The first descriptor may still be waiting to be fetched. */
+	if (desc->txd.phys == DWC_LLP_LOC(llp))
+		return residue;
+
+	if (lli_read(desc, llp) == llp)
+		return residue - dwc_get_sent(dwc);
+
+	residue -= desc->len;
+	list_for_each_entry(child, &desc->tx_list, desc_node) {
+		if (lli_read(child, llp) == llp)
+			return residue - dwc_get_sent(dwc);
+
+		residue -= child->len;
+	}
+
+	return residue;
+}
+
 static u32 dwc_get_residue_and_status(struct dw_dma_chan *dwc, dma_cookie_t cookie,
 				      enum dma_status *status)
 {
@@ -984,9 +951,12 @@ static u32 dwc_get_residue_and_status(struct dw_dma_chan *dwc, dma_cookie_t cook
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

