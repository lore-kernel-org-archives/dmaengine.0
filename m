Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D923AA50A;
	Sun, 27 Sep 2026 09:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790499844; cv=none; b=WKVWgWta1tYGErurVkDvzHt2IBf+yMJOUIF/KcAkQg0rZmQFkBB85DPdjbJx/j21xf3qidUeRLbST+Wx3Pqu+/qND4Qw7Vr8ZcrB3Z9AQMuCf708MYzE+kiSHc7IUoMDBzzK95BwiLAGIQZGoBdSAIxoDl0ta20NeIl5OybcH00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790499844; c=relaxed/simple;
	bh=eoD/CJdZeCoqR7avuZQL41nN2+HKaD8VGvKf3yj0iZU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bnbXBiuHwvqEOS4egu+F8Akogfk3ISJc8ZVTazLZU7Jp94yQg/Xr2vYrf7uq3c4bDzc8bDg3xk2KS/jSA9DAtdRkEoN8DDw1TirwMF2pDJi6JMt2hIsY5x/NMm6xiJZY5x15XUwHrj8PCsFOAzp5LNucp3W15jv1Rfl64GyOD5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VFT+L7QX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VFT+L7QX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A58E1F000FF;
	Sun, 27 Sep 2026 09:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790499842;
	bh=mVkqWrj7VspOmQM0TEYbQ1d896eIsO3V3sZQT4ujkrc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=VFT+L7QX5qlJmJA+liVL2c7J2UyAfN4yI+OQLMAH21hYWmrhSUCFVX+bJYc9gv+Vl
	 v47SqhnOE9apK0zC39Uw9o55qE7H++x1iuI3XD3LcQNeYEvXIXvFPIkdsIH741Thy9
	 TyzjpXOODNcWHnpC3bTT8EFMae9qbZYmblZbhG6YzI0lJxAF1EbDxVfZU7kaTKHVbp
	 BMhhR90zMk7wWeJ3yHYJZwuHh4N5iS8AVrKFmp5uP8PQ+a932yu5qT2xQL3tlYcBRi
	 HnrmNFJQarPxY69oq7dIc9D0iQm2k+RbM8CxaUwmU6cBOTCCr7SIvrrLW2NluoP9Nn
	 yaB0Rdur6GQyg==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 27 Sep 2026 11:03:34 +0200
Subject: [PATCH v7 21/24] dmaengine: ste_dma40: Fix V4B event group mapping
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-dma40-fixes-v7-21-89f595e8851d@kernel.org>
References: <20260927-dma40-fixes-v7-0-89f595e8851d@kernel.org>
In-Reply-To: <20260927-dma40-fixes-v7-0-89f595e8851d@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

DMA40 physical resources are connected in pairs to event groups. The
mapping repeats after each complete set of groups.

D40_GROUP_SIZE and D40_PHYS_TO_GROUP() encode the four-group V4A layout.
On V4B, which has five groups, resources 8 and 9 are consequently offered
both to event groups 0 and 4. The GCC clock bookkeeping also treats these
resources as group 0 instead of group 4.

Derive the physical-resource stride and reverse mapping from the
variant-specific number of event groups. This preserves the V4A mapping
and gives V4B a ten-resource stride: resources 8 and 9 belong only to
group 4, while resources 10 and 11 repeat group 0.

Fixes: 3cb645dc85a0 ("dmaengine: ste_dma40: support more than 128 event lines")
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c    | 47 ++++++++++++++++++++++++++++++++--------------
 drivers/dma/ste_dma40_ll.h |  2 --
 2 files changed, 33 insertions(+), 16 deletions(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 91dc143f9a80..a5471a9157cd 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -85,6 +85,7 @@ struct stedma40_platform_data {
 /* Number of event groups per hardware register layout */
 #define D40_EVENT_GROUPS_V4A 4
 #define D40_EVENT_GROUPS_V4B 5
+#define D40_PHYS_PER_EVENT_GROUP 2
 
 /* Max number of logical channels per physical channel */
 #define D40_MAX_LOG_CHAN_PER_PHY 32
@@ -2027,6 +2028,12 @@ static bool d40_alloc_mask_free(struct d40_phy_res *phy, bool is_src,
 	return is_free;
 }
 
+static int d40_phy_to_group(struct d40_base *base, int phy)
+{
+	return (phy / D40_PHYS_PER_EVENT_GROUP) %
+	       base->gen_dmac.num_event_groups;
+}
+
 static int d40_allocate_channel(struct d40_chan *d40c, bool *first_phy_user)
 {
 	int dev_type = d40c->dma_cfg.dev_type;
@@ -2037,11 +2044,14 @@ static int d40_allocate_channel(struct d40_chan *d40c, bool *first_phy_user)
 	int j;
 	int log_num;
 	int num_phy_chans;
+	int phy_group_stride;
 	bool is_src;
 	bool is_log = d40c->dma_cfg.mode == STEDMA40_MODE_LOGICAL;
 
 	phys = d40c->base->phy_res;
 	num_phy_chans = d40c->base->num_phy_chans;
+	phy_group_stride = D40_PHYS_PER_EVENT_GROUP *
+			   d40c->base->gen_dmac.num_event_groups;
 
 	if (d40c->dma_cfg.dir == DMA_DEV_TO_MEM) {
 		log_num = 2 * dev_type;
@@ -2075,13 +2085,18 @@ static int d40_allocate_channel(struct d40_chan *d40c, bool *first_phy_user)
 				}
 			}
 		} else
-			for (j = 0; j < d40c->base->num_phy_chans;
-			     j += D40_GROUP_SIZE) {
-				int phy_num = j  + event_group * 2;
-				if (phy_num + 1 >= num_phy_chans)
+			for (j = 0; j < num_phy_chans;
+			     j += phy_group_stride) {
+				int phy_num = j + event_group *
+					      D40_PHYS_PER_EVENT_GROUP;
+
+				if (phy_num + D40_PHYS_PER_EVENT_GROUP >
+				    num_phy_chans)
 					break;
 
-				for (i = phy_num; i < phy_num + 2; i++) {
+				for (i = phy_num;
+				     i < phy_num + D40_PHYS_PER_EVENT_GROUP;
+				     i++) {
 					if (d40_alloc_mask_set(&phys[i],
 							       is_src,
 							       0,
@@ -2100,9 +2115,10 @@ static int d40_allocate_channel(struct d40_chan *d40c, bool *first_phy_user)
 		return -EINVAL;
 
 	/* Find logical channel */
-	for (j = 0; j < d40c->base->num_phy_chans; j += D40_GROUP_SIZE) {
-		int phy_num = j + event_group * 2;
-		if (phy_num + 1 >= num_phy_chans)
+	for (j = 0; j < num_phy_chans; j += phy_group_stride) {
+		int phy_num = j + event_group * D40_PHYS_PER_EVENT_GROUP;
+
+		if (phy_num + D40_PHYS_PER_EVENT_GROUP > num_phy_chans)
 			break;
 
 		if (d40c->dma_cfg.use_fixed_channel) {
@@ -2129,14 +2145,17 @@ static int d40_allocate_channel(struct d40_chan *d40c, bool *first_phy_user)
 		 * channels.
 		 */
 		if (is_src) {
-			for (i = phy_num; i < phy_num + 2; i++) {
+			for (i = phy_num;
+			     i < phy_num + D40_PHYS_PER_EVENT_GROUP;
+			     i++) {
 				if (d40_alloc_mask_set(&phys[i], is_src,
 						       event_line, is_log,
 						       first_phy_user))
 					goto found_log;
 			}
 		} else {
-			for (i = phy_num + 1; i >= phy_num; i--) {
+			for (i = phy_num + D40_PHYS_PER_EVENT_GROUP - 1;
+			     i >= phy_num; i--) {
 				if (d40_alloc_mask_set(&phys[i], is_src,
 						       event_line, is_log,
 						       first_phy_user))
@@ -3307,9 +3326,9 @@ static int __init d40_phy_res_init(struct d40_base *base)
 			base->phy_res[i].allocated_src = D40_ALLOC_PHY;
 			base->phy_res[i].allocated_dst = D40_ALLOC_PHY;
 			base->phy_res[i].reserved = true;
-			gcc |= D40_DREG_GCC_EVTGRP_ENA(D40_PHYS_TO_GROUP(i),
+			gcc |= D40_DREG_GCC_EVTGRP_ENA(d40_phy_to_group(base, i),
 						       D40_DREG_GCC_SRC);
-			gcc |= D40_DREG_GCC_EVTGRP_ENA(D40_PHYS_TO_GROUP(i),
+			gcc |= D40_DREG_GCC_EVTGRP_ENA(d40_phy_to_group(base, i),
 						       D40_DREG_GCC_DST);
 
 
@@ -3329,9 +3348,9 @@ static int __init d40_phy_res_init(struct d40_base *base)
 		base->phy_res[chan].allocated_src = D40_ALLOC_PHY;
 		base->phy_res[chan].allocated_dst = D40_ALLOC_PHY;
 		base->phy_res[chan].reserved = true;
-		gcc |= D40_DREG_GCC_EVTGRP_ENA(D40_PHYS_TO_GROUP(chan),
+		gcc |= D40_DREG_GCC_EVTGRP_ENA(d40_phy_to_group(base, chan),
 					       D40_DREG_GCC_SRC);
-		gcc |= D40_DREG_GCC_EVTGRP_ENA(D40_PHYS_TO_GROUP(chan),
+		gcc |= D40_DREG_GCC_EVTGRP_ENA(d40_phy_to_group(base, chan),
 					       D40_DREG_GCC_DST);
 		num_phy_chans_avail--;
 	}
diff --git a/drivers/dma/ste_dma40_ll.h b/drivers/dma/ste_dma40_ll.h
index 2e30e9a94a1e..55090cb31057 100644
--- a/drivers/dma/ste_dma40_ll.h
+++ b/drivers/dma/ste_dma40_ll.h
@@ -16,8 +16,6 @@
 
 #define D40_TYPE_TO_GROUP(type) (type / 16)
 #define D40_TYPE_TO_EVENT(type) (type % 16)
-#define D40_GROUP_SIZE 8
-#define D40_PHYS_TO_GROUP(phys) ((phys & (D40_GROUP_SIZE - 1)) / 2)
 
 /* Most bits of the CFG register are the same in log as in phy mode */
 #define D40_SREG_CFG_MST_POS		15

-- 
2.55.0

