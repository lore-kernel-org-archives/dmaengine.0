Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B337217723;
	Sun, 27 Sep 2026 09:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790499842; cv=none; b=E81hy11lzOd47SQxOa6T+VaWc1itx8jEIo9EM87v+R6BadhRp9YSibz6JVnBtcpdHUXGeXxIc9zOba2/MPBQzJRoB8jkMfLvi9UrbmdBul0XkMjvrkX36SOitULvSJyZSX0GWt03NNeY3+lMe7kU0HN/cayJItU5t17cUQmpQL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790499842; c=relaxed/simple;
	bh=apJLAnVTVTmGB5IzLARelUz28kAGZsFrZTkE1KwNFoc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GM9vINMP0XY9lZfupBdWwDSRbbuTa86/t98o/BFO/25qES4WJAzVyY8CSuFnOkBnj+YrGaCdiDXIh22kC9NyrE/6cUNpiXlwzyHd58esb2uBXpljJe+aoPw2talzn2MBn1/3I8ZHaVYDK6/NqTxkjhaHeXz/921PYknVnLOEpUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hnzSMaa9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hnzSMaa9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 746511F00893;
	Sun, 27 Sep 2026 09:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790499841;
	bh=w2H3l3ErDtOq7B1C4bCVeM8037TqmE9BXV3git03Q8s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=hnzSMaa9a2BJEBiY0x9HtcFzOKDVMSg2wtfSxBCCTpHoZAFE/rjkP2xMUM5/sRZ9v
	 RDKM3vm1gFCPHOkmBRNxLctSicksco8FsgXQKPXFuFC1rFqdwUaZMXGFyhsuMaz5Ch
	 B5i7cSf9ebXMIfJOKHwO4t7NOKJ7NaQsq7UQjvOEWgD6eqpCs7G6Pc2L43oSU8fUEs
	 imXHlioRbaDPhqpwXBkq3XIJhYIcI+Fq+SLP+aQttkDNXQ4i0s1GoX9ihXRL6IhB/Q
	 CTbIPfnG9lwEU0bJg2cCC/m3+vbAAtlYdN0MK4Xd/VtpAHC94KTvN9l5RW/9dAltHX
	 m9FCGWyOLPIfg==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 27 Sep 2026 11:03:33 +0200
Subject: [PATCH v7 20/24] dmaengine: ste_dma40: Fix event group bounds
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-dma40-fixes-v7-20-89f595e8851d@kernel.org>
References: <20260927-dma40-fixes-v7-0-89f595e8851d@kernel.org>
In-Reply-To: <20260927-dma40-fixes-v7-0-89f595e8851d@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, sashiko-bot@kernel.org
X-Mailer: b4 0.14.3

The dev_type validation can allow values whose derived event group has no
matching physical channel pair. d40_allocate_channel() then indexes
phy_res with j + event_group * 2, and __d40_set_prio_rt() uses the same
group to select priority and realtime registers.

The physical-mode validation also compares dev_type with the number of
physical channels. However, dev_type identifies an event line: DB8500 has
eight physical channels but 64 source and 64 destination event lines. The
event group determines which physical channel pair can serve an event, so
the physical channel count is not a valid dev_type limit.

Reject dev_type values outside the hardware event-group range, remove the
incorrect physical channel count limit, and stop the physical-channel
search before a partial final channel group can index past phy_res.

Fixes: 26955c07dcf3 ("dmaengine: ste_dma40: Amalgamate DMA source and destination channel numbers")
Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/dmaengine/20260819225008.5F9651F000E9@smtp.kernel.org/
Assisted-by: LLM
Link: https://lore.kernel.org/dmaengine/20260819225008.5F9651F000E9@smtp.kernel.org/
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index fcb074928675..91dc143f9a80 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -82,6 +82,10 @@ struct stedma40_platform_data {
 #define D40_LCLA_LINK_PER_EVENT_GRP 128
 #define D40_LCLA_END D40_LCLA_LINK_PER_EVENT_GRP
 
+/* Number of event groups per hardware register layout */
+#define D40_EVENT_GROUPS_V4A 4
+#define D40_EVENT_GROUPS_V4B 5
+
 /* Max number of logical channels per physical channel */
 #define D40_MAX_LOG_CHAN_PER_PHY 32
 
@@ -522,6 +526,7 @@ struct d40_chan {
  * @high_prio_clear: the high priority clear register
  * @interrupt_en: the interrupt enable register
  * @interrupt_clear: the interrupt clear register
+ * @num_event_groups: number of supported event groups
  * @il: the pointer to struct d40_interrupt_lookup
  * @il_size: the size of d40_interrupt_lookup array
  * @init_reg: the pointer to the struct d40_reg_val
@@ -536,6 +541,7 @@ struct d40_gen_dmac {
 	u32				 high_prio_clear;
 	u32				 interrupt_en;
 	u32				 interrupt_clear;
+	u32				 num_event_groups;
 	struct d40_interrupt_lookup	*il;
 	u32				 il_size;
 	struct d40_reg_val		*init_reg;
@@ -1883,6 +1889,11 @@ static int d40_validate_conf(struct d40_chan *d40c,
 	bool is_log = conf->mode == STEDMA40_MODE_LOGICAL;
 	bool invalid_dev_type = conf->dev_type < 0;
 
+	if (!invalid_dev_type &&
+	    D40_TYPE_TO_GROUP(conf->dev_type) >=
+	    d40c->base->gen_dmac.num_event_groups)
+		invalid_dev_type = true;
+
 	if (!conf->dir) {
 		chan_err(d40c, "Invalid direction.\n");
 		res = -EINVAL;
@@ -1899,8 +1910,7 @@ static int d40_validate_conf(struct d40_chan *d40c,
 		invalid_dev_type = conf->dev_type >= max_dev_type;
 	}
 
-	if (invalid_dev_type ||
-	    (!is_log && conf->dev_type > d40c->base->num_phy_chans)) {
+	if (invalid_dev_type) {
 		chan_err(d40c, "Invalid device type (%d)\n", conf->dev_type);
 		res = -EINVAL;
 	}
@@ -2065,8 +2075,12 @@ static int d40_allocate_channel(struct d40_chan *d40c, bool *first_phy_user)
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
@@ -2086,8 +2100,10 @@ static int d40_allocate_channel(struct d40_chan *d40c, bool *first_phy_user)
 		return -EINVAL;
 
 	/* Find logical channel */
-	for (j = 0; j < d40c->base->num_phy_chans; j += 8) {
+	for (j = 0; j < d40c->base->num_phy_chans; j += D40_GROUP_SIZE) {
 		int phy_num = j + event_group * 2;
+		if (phy_num + 1 >= num_phy_chans)
+			break;
 
 		if (d40c->dma_cfg.use_fixed_channel) {
 			i = d40c->dma_cfg.phy_channel;
@@ -3467,6 +3483,7 @@ static int __init d40_hw_detect_init(struct platform_device *pdev,
 	base->log_chans = &base->phy_chans[num_phy_chans];
 
 	if (base->plat_data->num_of_phy_chans == 14) {
+		base->gen_dmac.num_event_groups = D40_EVENT_GROUPS_V4B;
 		base->gen_dmac.backup = d40_backup_regs_v4b;
 		base->gen_dmac.backup_size = BACKUP_REGS_SZ_V4B;
 		base->gen_dmac.interrupt_en = D40_DREG_CPCMIS;
@@ -3480,6 +3497,7 @@ static int __init d40_hw_detect_init(struct platform_device *pdev,
 		base->gen_dmac.init_reg = dma_init_reg_v4b;
 		base->gen_dmac.init_reg_size = ARRAY_SIZE(dma_init_reg_v4b);
 	} else {
+		base->gen_dmac.num_event_groups = D40_EVENT_GROUPS_V4A;
 		if (base->rev >= 3) {
 			base->gen_dmac.backup = d40_backup_regs_v4a;
 			base->gen_dmac.backup_size = BACKUP_REGS_SZ_V4A;

-- 
2.55.0

