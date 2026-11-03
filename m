Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793744784;
	b=h/OrgN0h1ssYPwvA38QBd5ekS32VgjkA8fP/PQB1YtQ+mphvNEMAakkTZgvnEsPjRyDz
	 f1QcEoE2g2lB6Z3J7vlIgfm6R7KgGzESW6kjyE/rng7S5QCc/AMWnosOc9HDvXwo8c6BU
	 GE+6jXK194gkrhYL1xEfxEWy2QQ5lg0JG6cyEdxmRvhNbyFBCxygr1BfZkV5MRoLbUbPc
	 DMbUJFwwB78BIEmol5jGNolZ20tbQaH7qabtlQ3Gbad1509AC071TzxQ99iVOHy+W+vw1
	 I2OOkJ79pOQsU3enUgBEl4OwzT1n1sDyvFMlfWk7a68iiuY1xU94Oknmg8Y1j+u+dYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793744784;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=++8WqsJMyURRJ440LK5USP3Z9FP1iHwW4W3cxDaZhko=;
	b=ATACHPex0LEzZHUui2vUAAh7m/MxmrseeOyoCZzOLPMeM6FIz5hgBT754mIiRAL15jjE
	 DjFPAC9i5yUDoWv827Ko3eivE/LDNGMKr8jvtjSW/vodHnfpfZv4CB5l7k1JaL7oOuUTr
	 /gD63Hf2BflfvdGd5ZKZMCdQ8WXeI5R0p+BXKPmj+x0ZNf9IWgmz5OrivCr78PLWx6Fsz
	 +sXm0Pka1AmPeQh4q9FIs/eML3PzwF0BIvQAuz3AdlI5XxFRfZn6UfTttwtT+7M7R9eTL
	 DhiB1O4+u83NIxO7r5qT2B2N8LcI5NWXWlEpDoINkGUKmK5YY2/n+oPF4DSFxs4AUVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xMwBvpYu;
	arc=none smtp.remote-ip=209.85.210.42
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A53606D83E
	for <dmaengine@vger.kernel.org>; Tue,  3 Nov 2026 22:26:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18A53606D83E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xMwBvpYu
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-82109f51565so23253a34.2
        for <dmaengine@vger.kernel.org>; Tue, 03 Nov 2026 14:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793744783; x=1794349583; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=++8WqsJMyURRJ440LK5USP3Z9FP1iHwW4W3cxDaZhko=;
        b=xMwBvpYuuEO3tDh6hIParK5xjv1SMp0/9tL0d2NHizCm9pjh+vvgxIwExphwSXncKM
         PdA0ZDgFNfcWhXn2bez7lsvpwzAAi0dlDPM9O//+3lslT8rxjbVxFGHYH4ndfPBJwUkl
         +Q3PB40ZzFoJGgRWJ7mVwcAXSuDvzhAT9GS/QCMSNjXHe1uy3YSh8bSi4eFHKKTUAx7g
         oHqVbeIhuDMrGU5XN7y6ek6d/c6DP4o6qpE284c4StQQ7iYJRHh10Qb2Lf6VIX732m0M
         Joa9k5DjiDpCXsQKHM/FSeL5hODEXYwKdsiEsDab3zQyUCBOXUjjg9YYKr+4mTaG8ZIz
         kOpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793744783; x=1794349583;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=++8WqsJMyURRJ440LK5USP3Z9FP1iHwW4W3cxDaZhko=;
        b=XdjZ8J29f4OzdSqKieyVsyN0g9WrST60gmjyNK423/Sl6Mq/IKwFBAYEEZaQszAj4e
         bJDPcZFfvbDMXw25BCbA75AOaLPHkpQDmbya7LovpSrNJCsskbwSuPHi3eDKDj5hFcsU
         l3fI6Dkw/VzQcO/aBoNq5bBqHhEnQX+GAEGePh/d++qfgLo8tyWQnsCQ6UJw0TQmA0ma
         Xiriwc3eJ9nN6WoJkU2WwL9R6nIYtGxtl9zP3JUModVJIyP0NV53fB5p8H9S7qbDs1AR
         T85JKGH2svV0hfY/NY3rTmYjx9VkPMxJAq3hJhvqi0Srmt+oawJKEev6pVWADaunCqkB
         kleA==
X-Forwarded-Encrypted: i=1; AKwUvBy8bJdJTsTXLy6YBXL7+Ad0tLyhXvOEJgXi0eEHD6cC40+ZlAhRAOf8rzwf48Sj/fWYX9uM6qnN2o4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hgnE2NQQCWzdlDYE4bqptijT+qAfStAhuN6D7jq/+B9CQxiVE
	nvhQP9PLuH5k8Q2GdfgV6GVJqcAnDdsg52gAhCvdEeJ3EN7FKhMyjCZy
X-Gm-Gg: AYBFou374mO261mfHTET/7DniR2/pBrVVZ13m48jm9F6FlGmuIcTqG9MAGZLRiSmSl7
	rDToMy+wZYu3EKhPA7XfYO/wj6Lb7Jb8DCn3Qh3nusei9hSUqJIjoMEKKfxYQhwac7z7jZMGVX1
	gYQ4M3C8jKZCwy9ON+Vj+ubxNlKzjiErPBGQ7JcqHXK1DnMNCZOQJ5mjrlsiaozvF4I6HWc9cwB
	ISuUT8ALF0vTGBB58Ter04iPL6HDyXhqeZDckC/iwlHlNwKntcotLVwCtDpeqJIQymsUJF5V+4t
	0xZ8ziq/K/oqXf6fTzyNw+3NlKG2vgl+mlGjEei8Htdvv+7hxwJWACfwpixf3qPAPPKuWsobbvg
	gFV9UgiYsi/g8ZooQWEXxEvkhdhQ9gYhml3ByupmlZ3y7HmL635DsqiMAa1XuRNu5fXx+1na6OI
	h47jxdgJoVPm8aaWYAFvd2RabzHBQJu4Cfzpde1Rww2XEi2bT2o22BncB3aCDSqQI2JT0WTqktj
	IMEhE/HpFPic87qPVLyM/LDnz3jfhS/Os1T2ykayBgJ3jEoS8S+sKkyceDloXpqxjc+Z+sVSvWL
	ybKDtHrNc45vfKpVQwX7iTjvo6yTYB/OhGRat5FmJUO1bX9f81dTj8J4ND5/SAHyok7F7AztRo4
	aUkMPlQZF/G0mVHzKOT/GiXficl/j9CNDpsNOpFjyAC0djW6bjEOE1VJjBNGIpgZrxV00yoAgoV
	nCuee0VnO+55QMa1YpTpGiT8i0dfTpxz/FBEL1OnYYDDOagXRjKaCk
X-Received: by 2002:a05:6808:6415:b0:564:b24:af6a with SMTP id 5614622812f47-5640dde8044mr9712839b6e.38.1793744783016;
        Tue, 03 Nov 2026 14:26:23 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9ef58b1sm128435b6e.3.2026.11.03.14.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:26:22 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 15:26:08 -0700
Subject: [PATCH v6 06/10] dmaengine: dw: simplify transfer-complete
 handling
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
Message-Id: <20261103-submit-dw-dma-synchronize-v1-v6-6-2ee0c348224d@gmail.com>
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

With hardware-LLP residue handled by the status getter, the descriptor
scanner only needs to process transfer-complete events. Return through a
common unlock path when no event or active descriptor remains, and flatten
the completion handling.

Only one transaction is active on a channel. Detach that descriptor before
starting the next queued transfer, keeping cookie completion under the
channel lock and client notification outside it. Preserve software-LLP
block advancement before completing the transaction.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw/core.c | 92 +++++++++++++++++++++------------------------------
 1 file changed, 38 insertions(+), 54 deletions(-)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index d9127337c849..3cc8579f8829 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -297,74 +297,58 @@ static void dwc_scan_descriptors(struct dw_dma *dw, struct dw_dma_chan *dwc)
 {
 	struct dw_desc *desc, *_desc;
 	struct dw_desc *child;
-	u32 status_xfer;
 	unsigned long flags;
 	LIST_HEAD(list);
 
 	spin_lock_irqsave(&dwc->lock, flags);
-	status_xfer = dma_readl(dw, RAW.XFER);
-
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
 
-				child = to_dw_desc(active);
-
-				/* Submit next block */
-				dwc_do_single_block(dwc, child);
+	if (!(dma_readl(dw, RAW.XFER) & dwc->mask))
+		goto unlock;
 
-				spin_unlock_irqrestore(&dwc->lock, flags);
-				return;
-			}
+	dma_writel(dw, CLEAR.XFER, dwc->mask);
+	if (list_empty(&dwc->active_list))
+		goto unlock;
 
-			/* We are done here */
-			clear_bit(DW_DMA_IS_SOFT_LLP, &dwc->flags);
+	desc = dwc_first_active(dwc);
+	if (test_bit(DW_DMA_IS_SOFT_LLP, &dwc->flags)) {
+		struct list_head *head = &desc->tx_list;
+		struct list_head *active = dwc->tx_node_active;
+
+		if (active != head) {
+			/* Update residue to reflect last sent descriptor. */
+			if (active == head->next)
+				desc->residue -= desc->len;
+			else
+				desc->residue -= to_dw_desc(active->prev)->len;
+
+			child = to_dw_desc(active);
+
+			/* Submit next block, including for polled transfers. */
+			dwc_do_single_block(dwc, child);
+			goto unlock;
 		}
 
-		if (dma_readl(dw, CH_EN) & dwc->mask) {
-			dev_err(dmaengine_chan_dev(&dwc->chan),
-				"BUG: XFER bit set, but channel not idle!\n");
-
-			/* Try to continue after resetting the channel... */
-			dwc_chan_disable(dw, dwc);
-		}
+		clear_bit(DW_DMA_IS_SOFT_LLP, &dwc->flags);
+	}
 
-		/* Detach the completed transfer before starting queued work. */
-		list_splice_init(&dwc->active_list, &list);
-		list_for_each_entry(desc, &list, desc_node)
-			dma_cookie_complete(&desc->txd);
-		dwc_dostart_first_queued(dwc);
-		spin_unlock_irqrestore(&dwc->lock, flags);
+	if (dma_readl(dw, CH_EN) & dwc->mask) {
+		dev_err(dmaengine_chan_dev(&dwc->chan),
+			"BUG: XFER bit set, but channel not idle!\n");
 
-		list_for_each_entry_safe(desc, _desc, &list, desc_node) {
-			list_del_init(&desc->desc_node);
-			dwc_descriptor_free(dwc, desc, true);
-		}
-		return;
+		/* Try to continue after resetting the channel... */
+		dwc_chan_disable(dw, dwc);
 	}
 
+	dma_cookie_complete(&desc->txd);
+	list_move_tail(&desc->desc_node, &list);
+	dwc_dostart_first_queued(dwc);
+unlock:
 	spin_unlock_irqrestore(&dwc->lock, flags);
+
+	list_for_each_entry_safe(desc, _desc, &list, desc_node) {
+		list_del_init(&desc->desc_node);
+		dwc_descriptor_free(dwc, desc, true);
+	}
 }
 
 static inline void dwc_dump_lli(struct dw_dma_chan *dwc, struct dw_desc *desc)

-- 
2.53.0

