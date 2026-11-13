Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794562601;
	b=gL9S2brSDlJlqVncAerAiWySJGDsnjQV/ScKl5vSa+GTlAmz4fp/mg4vuA45biy47Pg/
	 E2OiWBLBZv5eenm45yLP0NoDmkeQtISj2sNt7UxAIbch051yc2RAHa/HBRhUPX3TMfVPb
	 X9w3plLtm5PLBJzoDnwecPOveBw+FbXu+ltUmTvKIt8izN1nwaRQJMZ54wZW93PANX1uy
	 BBX3jTriPCOkRayR7OrmjEys6CfuywvP97dq+EH1R9GhcUGEVqhYXH+67sA2VeDhjUVcG
	 A1Gve78bCbIBa8DqereVlJ8qySslv97f5salDH2152AAcKwf+WMqbwX88XJAgeB8bVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794562601;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=8RGDeXbdt83hUd3Brk6p8Eodv6wi4lD1lBh2U2cXcg4=;
	b=afL71SZzu2sEwj4q0Kb30qSLzil/j+lImkLR43a5LNQQqRM5Sfyox/1UUCC5ovVUcXUE
	 xpKxQ/RsqMuq1/sNbHY4bJsqqq8XavH4uz5rLFav5ZJtntOjlOq+VVwhDsBDVOdkc0nnS
	 4CEsjHQUzfhCIPB6T63whFWbeiyonF5MZL3Tn7vEeisRzTgDERsj/90G0lXmYRICD3N1R
	 pG36b9UMJAdSfgH9TIH33E1Z4RARBteK/4W9L1un6Pa5E2oxSPlv9mlq6kEqyTZj6CAY2
	 z0aREM3oQSzI+fe7G34DS23jcqQG31EM/WDRQ+j4aNd2ihYUWc74LlcNGbc0/Da1POw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="tf0zc6/i";
	arc=none smtp.remote-ip=209.85.167.169
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74401606A897
	for <dmaengine@vger.kernel.org>; Fri, 13 Nov 2026 09:36:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74401606A897
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tf0zc6/i
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-4c5d8c7f326so231127b6e.1
        for <dmaengine@vger.kernel.org>; Fri, 13 Nov 2026 01:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794562600; x=1795167400; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8RGDeXbdt83hUd3Brk6p8Eodv6wi4lD1lBh2U2cXcg4=;
        b=tf0zc6/ihUlB9o2k5KIi4wlybtze10y72hz29w4B7FTwmYC9G1c1zPGPPzw88VbADP
         oFXuXhEfxivmWgeexwv4+BPp3ERriMPxx3uJOOQ/Mg12ABrCFMH9OKag9U3V9o/0YYye
         3i8t7WuOvFfnwc1FJNNQNDb6Bj6c/wJ14jxEfJelb7ibQJLan+sFp/bOYwNtU9ebInnD
         5eB26N2XBxvbrWH5+ynf33ywYkH5Q6Wb24csxQKU//5wp1huffZNup8QAqncLsoYYEak
         rE1Tdaclcm/7S44OoUVt2ISoRqR8kBtJtEhm6ekeUvdMCbotzsNbeAn2l8im1ZtPcAzi
         jxJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794562600; x=1795167400;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8RGDeXbdt83hUd3Brk6p8Eodv6wi4lD1lBh2U2cXcg4=;
        b=axRp/np91yRX2WpV2RrG7aN/8W/OomLmEZAX3dxJW0auP3fBisNbqZmiSyaBa5pUgP
         vZu6flN9Mhn8vl5ZXxYA5GaVQi4YfzHfabilsJ5N/vQQ5ZIA3XfTDTv3ZQckXpcP0KlA
         B0lNphM3CV+Qc02wUOv9SIRgDcDB1hhuQDlJy2b3Sj6ClUlhr9LLzs8CETrGvFbJnBX9
         9Ieaj8RLT/zY1a0G+G+mMcJq/xma8Y/P1tUKHI9KGmpHuBcSErkMiTjBc9n50Ek4fsFr
         yvjENUAj868JYjK1EKVssQsaG0iI25CMDMcj2UF4tLHbor+deLISgd7zO9Vu1zLGN/ig
         81uQ==
X-Gm-Message-State: APuU4Z/bxzMryVqdzl0ZIZrfhIc6XDDG1kQyIoQF9g8fVxRYc5Bgb6vp
	bz6vVzT1BnBSvAiTgNwvqu32uGPWSW6gP/VFHlQbPlMyOnF1DvDgkoVH
X-Gm-Gg: AYBFou0i82s7wxDladB72cxuUJWjNaVArEVXn+hxnstzfJraZMncHBgyfp8vdh72d6a
	PhPY0JSYiDD2wOBZNbHusOYDx6ZaKN5aRIHHcIVXwEwmun4m5jLHuwe1N8BO8NShLpUBGSUEyAf
	5uqtBdozsC/Mid2+isduXpJS6ru5ORpR7Ap6NN3yRFBIPgSE5YUSp+qVERLx+1DCI/4+U+06lge
	u4YK3MDt1yIUkiGhnTwPVIMPKQg5yevQVb3biT1elSbFN/ijoDtm4U/hQ6hwtOhsAYTQfDUGwff
	9d2i6Ve8ZjjdgUArjGzqOfsJQIS1jBEvSzFWVm6O++vjVrqiy7RAICtu4KDtynngMggrOeb0EiG
	EiNgq1GWUOwAw1UvxOMASZqMfxbzQQFzH8z262jVus6kwNJUlsMImeOvBXKb2UrM/FhpPRoTo3A
	2FHCEXyQWEOWszQKYB0CLLC2t7P572lrIKElDHh4Afgp3M3gpbMgsbaBaTT6Jj9xDNbIawSwtua
	MNr0NNVa8L1iHBgQCgw5CPdWbg87dH06wqfiw9oFClyMIJfVDJi8adQXivpBZwKKUv1V2pIM/KT
	8bP5OW/ulaqGMC/YBiUdhFs5U92wFGjtslcU5VUcNMRAu7Z49Puc3C3fzFhzDlzuRLViV8b8yA4
	p9m1lOSfhdj2agf+UXAhEQsThnAdiJr8EHFkoa2PkQft1gGvE5N1HuuRc05ev9jDsSAzVPAez9y
	WaYb4y7/PSqgY5IEDzWMalb9lOJZNZmP3b9FE8ONM3btF2vISNB1OK1A==
X-Received: by 2002:a05:6808:1713:b0:564:b24:af6a with SMTP id 5614622812f47-56e647df2a5mr1662991b6e.38.1794562600249;
        Fri, 13 Nov 2026 01:36:40 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e6fc42a8asm1627607b6e.3.2026.11.13.01.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 01:36:39 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 02:36:34 -0700
Subject: [PATCH v5 1/5] dmaengine: dw-axi-dmac: keep cyclic mode in the
 descriptor
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
Message-Id: <20261113-submit-dw-axi-dma-stop-pause-v1-v5-1-8523a27b5788@gmail.com>
References: <20261113-submit-dw-axi-dma-stop-pause-v1-v5-0-8523a27b5788@gmail.com>
In-Reply-To: <20261113-submit-dw-axi-dma-stop-pause-v1-v5-0-8523a27b5788@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sergey Khimich <serghox@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2

dw_axi_dma_chan_prep_cyclic() sets chan->cyclic before allocating all the
hardware descriptors and leaves it set when preparation fails. The flag
also survives cyclic transfer errors and channel resource release. A
subsequent noncyclic transfer then takes the cyclic completion path,
leaving its cookie incomplete and its descriptor on the issued list.
Its zero period_len can also cause a division by zero.

Resetting the flag on failure or channel allocation is not sufficient:
preparing cyclic work while an ordinary transfer is active changes how
that transfer's completion interrupt is handled.

Store the mode in each descriptor and use the completed descriptor's
mode in the interrupt handler. Cyclic preparation sets only its own
descriptor's flag, while the zero-initialized noncyclic descriptors keep
it clear. Error recovery and channel reuse then use the next descriptor's
mode without relying on channel-wide cleanup.

Fixes: 1deb96c0fa58 ("dmaegine: dw-axi-dmac: Support device_prep_dma_cyclic()")
Closes: https://lore.kernel.org/r/sashiko-outbox-208213@kernel.org/
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 35 ++++++++++++--------------
 drivers/dma/dw-axi-dmac/dw-axi-dmac.h          |  2 +-
 2 files changed, 17 insertions(+), 20 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index 7520c78f55cc..6dae63024721 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -801,7 +801,7 @@ dw_axi_dma_chan_prep_cyclic(struct dma_chan *dchan, dma_addr_t dma_addr,
 
 	chan->direction = direction;
 	desc->chan = chan;
-	chan->cyclic = true;
+	desc->cyclic = true;
 	desc->length = 0;
 	desc->period_len = period_len;
 
@@ -1117,25 +1117,23 @@ static void axi_chan_block_xfer_complete(struct axi_dma_chan *chan)
 		goto out;
 	}
 
-	if (chan->cyclic) {
-		desc = vd_to_axi_desc(vd);
-		if (desc) {
-			llp = lo_hi_readq(chan->chan_regs + CH_LLP);
-			for (i = 0; i < count; i++) {
-				hw_desc = &desc->hw_desc[i];
-				if (hw_desc->llp == llp) {
-					axi_chan_irq_clear(chan, hw_desc->lli->status_lo);
-					hw_desc->lli->ctl_hi |= cpu_to_le32(CH_CTL_H_LLI_VALID);
-					desc->completed_blocks = i;
-
-					if (((hw_desc->len * (i + 1)) % desc->period_len) == 0)
-						vchan_cyclic_callback(vd);
-					break;
-				}
+	desc = vd_to_axi_desc(vd);
+	if (desc->cyclic) {
+		llp = lo_hi_readq(chan->chan_regs + CH_LLP);
+		for (i = 0; i < count; i++) {
+			hw_desc = &desc->hw_desc[i];
+			if (hw_desc->llp == llp) {
+				axi_chan_irq_clear(chan, hw_desc->lli->status_lo);
+				hw_desc->lli->ctl_hi |= cpu_to_le32(CH_CTL_H_LLI_VALID);
+				desc->completed_blocks = i;
+
+				if (((hw_desc->len * (i + 1)) % desc->period_len) == 0)
+					vchan_cyclic_callback(vd);
+				break;
 			}
-
-			axi_chan_enable(chan);
 		}
+
+		axi_chan_enable(chan);
 	} else {
 		/* Remove the completed descriptor from issued list before completing */
 		list_del(&vd->node);
@@ -1204,7 +1202,6 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
 
 	vchan_get_all_descriptors(&chan->vc, &head);
 
-	chan->cyclic = false;
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
 
 	vchan_dma_desc_free_list(&chan->vc, &head);
diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
index d8dd07efe60f..3c86e5d468ea 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
@@ -50,7 +50,6 @@ struct axi_dma_chan {
 	struct axi_dma_desc		*desc;
 	struct dma_slave_config		config;
 	enum dma_transfer_direction	direction;
-	bool				cyclic;
 	/* these other elements are all protected by vc.lock */
 	bool				is_paused;
 };
@@ -105,6 +104,7 @@ struct axi_dma_desc {
 	u32				length;
 	u32				period_len;
 	u32				nr_hw_descs;
+	bool				cyclic;
 };
 
 struct axi_dma_chan_config {

-- 
2.53.0

