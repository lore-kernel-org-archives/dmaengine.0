Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0CE449B0D;
	Thu, 20 Aug 2026 13:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787231718; cv=none; b=qWm3qsMUeDZkyAJUA+mzLwbhkTTtvc0L51LKkVn3yQZuQAZLtAVMKl3Q2dAWFgtN1PWTRU+f1advb5RSGDxV9Os4LUHQBQYv4W6osFGSLCkI93NCntrJ1dyUczyWgRtY2urs5VMJ+9Cw1TFkse0RH6YwZ3T5F93+idr1HpEBi+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787231718; c=relaxed/simple;
	bh=SJGrfiGu9oZftzAbdLrPaiqdE027jWQNi1PAF5vSPIA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NWReoi7SAsZy5hgesHODGtwNWEalprJ8q3T0rmteIPoL+Hc5LrZhta9GSA8ZdZev8kdn+kNqI8UDWrxzRMLNux3Nqp54PCLcBazBY6c6hEvYkmMcL1MWMs5UPkSh/H94Ti8XLYqfagHnZOD4LzsHvdnHpFpHy0q/u4D9e2bKhJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G5D7/vdD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G5D7/vdD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 707721F00A3F;
	Thu, 20 Aug 2026 13:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787231716;
	bh=MJbVkidE81swqfrdTllXRH1sKjMnZrHWBpz8893tdAI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=G5D7/vdDjWf5ijggwqv2Y3hTwxK7aT0sflPulEzj/iOPAzYbrqCbJb3TVUg1U8L3A
	 BgHb/l/ivWPGP1GaARRTH2iXHO63Vw1D2zknagkIxsAkCCPPE0C0PzJCaeTHeQcnIY
	 KAuRo93nSbAGBDyWO7HypskKmkhnagC82l2kjeW+lSlVTYzy5lxXVmpZY7IcUht5mJ
	 qXkH2/1r74t2atkhYHjyXhcjsJ8XqBE/LMAeiYJkNsF532+QHJ4TKNV9qObJmkYzeP
	 X6V28L1dG1T+dz1s/T7d8IxDe0s1AQU2GVzHwY935ffGq9jZeMXZ44K1qpv+xVGIT8
	 f/16ig42LM1Jw==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 20 Aug 2026 15:15:05 +0200
Subject: [PATCH v2 11/13] dmaengine: ste_dma40: Fix event group bounds
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-dma40-fixes-v2-11-63238334c707@kernel.org>
References: <20260820-dma40-fixes-v2-0-63238334c707@kernel.org>
In-Reply-To: <20260820-dma40-fixes-v2-0-63238334c707@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, sashiko-bot@kernel.org
X-Mailer: b4 0.14.3

The dev_type validation can allow values whose derived event group has no
matching physical channel pair. d40_allocate_channel() then indexes
phy_res with j + event_group * 2, and __d40_set_prio_rt() uses the same
group to select priority and realtime registers.

Reject dev_type values outside the hardware event-group range, and stop
the physical-channel search before a partial final channel group can index
past phy_res.

Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/dmaengine/20260819225008.5F9651F000E9@smtp.kernel.org/
Assisted-by: Codex:gpt-5-5
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 7c777e410c10..e0c694a1fc8b 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -1739,6 +1739,10 @@ static int d40_validate_conf(struct d40_chan *d40c,
 	bool is_log = conf->mode == STEDMA40_MODE_LOGICAL;
 	bool invalid_dev_type = conf->dev_type < 0;
 
+	if (!invalid_dev_type &&
+	    D40_TYPE_TO_GROUP(conf->dev_type) >= D40_GROUP_SIZE / 2)
+		invalid_dev_type = true;
+
 	if (!conf->dir) {
 		chan_err(d40c, "Invalid direction.\n");
 		res = -EINVAL;
@@ -1921,8 +1925,12 @@ static int d40_allocate_channel(struct d40_chan *d40c, bool *first_phy_user)
 				}
 			}
 		} else
-			for (j = 0; j < d40c->base->num_phy_chans; j += 8) {
+			for (j = 0; j < d40c->base->num_phy_chans;
+			     j += D40_GROUP_SIZE) {
 				int phy_num = j  + event_group * 2;
+				if (phy_num + 1 >= num_phy_chans)
+					break;
+
 				for (i = phy_num; i < phy_num + 2; i++) {
 					if (d40_alloc_mask_set(&phys[i],
 							       is_src,
@@ -1942,8 +1950,10 @@ static int d40_allocate_channel(struct d40_chan *d40c, bool *first_phy_user)
 		return -EINVAL;
 
 	/* Find logical channel */
-	for (j = 0; j < d40c->base->num_phy_chans; j += 8) {
+	for (j = 0; j < d40c->base->num_phy_chans; j += D40_GROUP_SIZE) {
 		int phy_num = j + event_group * 2;
+		if (phy_num + 1 >= num_phy_chans)
+			break;
 
 		if (d40c->dma_cfg.use_fixed_channel) {
 			i = d40c->dma_cfg.phy_channel;

-- 
2.55.0

