Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794471785;
	b=r3lPawE8RqCMONo3hGi8ONRReIXcA4i/2Ad3RMK9HuE3NR2C1KN4xwCSjvXOt5IamonC
	 FMcEq+0BWVR38x/QqYN+oI7O034wAWgkCljba6Q+ZBHqeYDYa14SinDODrqAaq/MnJXgn
	 B5kh9y9shVdO7L7XY4v/HAAY+84nvaAJrj/12d06rcBCuc26mBKgaMW0566VT0cwAt92k
	 8ol4qPJ1fmpwykVXyb8MzetEdSwA7mF/3AaU+J7Os5vdMnY+3MjWNTAu5AByPZ1f/CTuv
	 0u2ih4xrWHNOoA0Ns1+MyJy9n71TQWc5Fkdzd6Cwizg3+/ls4PvrQB4cnDC7z3uwqXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794471785;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=8RGDeXbdt83hUd3Brk6p8Eodv6wi4lD1lBh2U2cXcg4=;
	b=cXaP5RKy6VPrafPteKzpEWRBGxud26vRJBOJkBd/n5xScvB+Dd4vAI16LWZFD7vlhRZq
	 R4NvEy3X1hH20SZ+c4q7X3ylpEs/xfC6MTY7Yrll/2W8EyX5PQ/PNFNvIh0HKzz3Wqjxe
	 CFm/YB89YNvgjynnByFo+80xNtPPOf5dwt/V/FpRgSgIJwK7tJeffekjgvwmvFW0aGTl3
	 SZDX1wIHFt2d2FgIUdjR8aAWQR33Jq5S0KpkTIgCTcqtK9q2pRNaLUjDMxXMZa2LYHIxe
	 BGzqLAwPZTWc3pvlEq9JOIu7WFzuHeahaLDbeLVk8DqRX3rRp3RA2DKRh0bBGX06cLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OJYeJzA1;
	arc=none smtp.remote-ip=209.85.167.176
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF43606A886
	for <dmaengine@vger.kernel.org>; Thu, 12 Nov 2026 08:23:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAF43606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OJYeJzA1
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-4f48d91ba7dso2204387b6e.2
        for <dmaengine@vger.kernel.org>; Thu, 12 Nov 2026 00:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794471784; x=1795076584; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8RGDeXbdt83hUd3Brk6p8Eodv6wi4lD1lBh2U2cXcg4=;
        b=OJYeJzA1bPu9N5OdOgPqFCAMx9AewTZLtz/IuI2ooVcSSifmQdSaHg5jVZTKwwtnmN
         e68BqCRgWN9EWb3JRSJE/QIsbDOHRlOf0pNjM/bkwin/MBBSZJ/EBXiK0KHAznP5x20O
         Mc2tpeXls9/9L/5ZZ6qos2ooWFX5PQN2BrR7E5Pa/okDKP7sJyy95EzqssLS8J77fin4
         y0Iww423Tv9ZHPEJNR4Rped9BMs8KKxM5ajtEg6JdL/ssmp6+qq3TCtrCSwe4MCxgQ+y
         13e72Jb+cHBmY3gvgDuF0X3K3VM/6QwTUfp3gtjrwJpcf37lgdKsZKnK3kmG4f3YHlQX
         vBJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794471784; x=1795076584;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8RGDeXbdt83hUd3Brk6p8Eodv6wi4lD1lBh2U2cXcg4=;
        b=C7Snm6/gWW5JVcuscXSySMlTUBScS2GeYS/MeGD2YaJNBai1iHXIgKTOxbGo+EHyEM
         OUgkPf2lAkCyS7zqWfkWfocs8FUwSZJlgWg927fm/lZz5cEKo/RXbx+2ebvhcy2MSMy1
         wNKHURJsUR2ZYWxxd9l3A9+06o6iaF+yos7vAp0qokHLJukN4UTOTbg1mOeamEwVBOFR
         I4VpZ0BGZijHNXMwGaxksyxAoS4heAlAHB2rXnEvZDgSHxRf2ed8YINvoyCjssda6rfq
         UE2hphlqfX5nR2ImXUcTFZ5U3hsSkllrbb3JB0/g+JgbaEB3nekAPfVbtq38tk7B0RUc
         cjVg==
X-Gm-Message-State: APuU4Z+YDfGC2j3bjCF4xvfdw14zFlRgSxDZD/8Va0OAN/jBn9/iMeDs
	hHbt8qIeX1OtEviBoEMtMh3KOaRdOhdNPrBPh3UA6kJ2oZDRhyLkQOJe
X-Gm-Gg: AYBFou0AjkukrY5jdIrsVhu/cUutdDFO/v5MLyQ5Xz9Jyd9EdKz0QRY+J4x2CN1b99N
	S9NhE0JcO+11cRU+TZM0HuF5o/OZGptb2WU3B71Q5AUczi9v5LfCSgdA2X1cgw1HQhIMUuzO1wk
	svoy3mpVoaBsWWIjsXOQVsy/NxX4gWyvM0odR3w6GCHlGgkNRefT/AT4fgPC8TJC2UgDkUOzU8A
	Ii2nQtyncNhFBnnhCuGt12rDMpMNta6+3wNUgmnA2z+MbzoHeKIaBHXI3i0GKyiSU7K1qck0Pk0
	zgF3sCsaIYL01YVzRvLpZI1/agSgzaNLypzge79K8wgLeDyq1b9kolLKerkKOu8gTWpxH0D/AC0
	Fk5sUO+toPwsS1xMJzPYvBZiCqSvw1UXrn/RQT3RIuuecbX/N6g63cbknJOxyKZlzg2rsUydRGs
	5DbV7HZ2OyeFSnkBHO7UHuSVTevz6lM0g8kPMLX7fK4fHFxcXtpBTLg2p6Na/W5qKcdaxQUwi0x
	bb9s7eS91DtPmoTcr3ERIeETdYPr07MNArS2ZOQ2jPloVLTmmrvTyo66ftHUNZUdC5LvwjYbTA0
	J9q0Lt1HFhsMs75raR/d8h77ixnN1uzxWc6HnanM/JB2WUHd7nhn7OJQFb18f92XeH5R8fgTA5H
	vF7QVPKPec5ojfKKwQTkQZVZMSppx7YzOA1LJy5l/ewTcWYGMQAWsk83LhL1hlQYzh8guqsq7yz
	BdRZS62OV56560ZlQiCyFjpXmjSC2t0gUiTfsWyL/2nNUOPKjZvW0=
X-Received: by 2002:a05:6808:10ce:b0:4c3:ebb:63d6 with SMTP id 5614622812f47-56b97503626mr4350951b6e.39.1794471783661;
        Thu, 12 Nov 2026 00:23:03 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905d3bab2sm7411157b6e.12.2026.11.12.00.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:23:03 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 12 Nov 2026 01:22:50 -0700
Subject: [PATCH v4 1/5] dmaengine: dw-axi-dmac: keep cyclic mode in the
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
Message-Id: <20261112-submit-dw-axi-dma-stop-pause-v1-v4-1-3ebc24b243db@gmail.com>
References: <20261112-submit-dw-axi-dma-stop-pause-v1-v4-0-3ebc24b243db@gmail.com>
In-Reply-To: <20261112-submit-dw-axi-dma-stop-pause-v1-v4-0-3ebc24b243db@gmail.com>
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

