Received: from ultrarisc.com (unknown [218.76.62.146])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99CFF2D7DE9;
	Tue,  1 Sep 2026 06:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.76.62.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788243438; cv=none; b=eh7X/dfRovZP5HvSo8ZM85PiCFe0cLTbyVyXDqwNt8Qz2i6uW6jwpBxnCvGzXFakKJksvMD1BQKncNLlMEDlz6neNkkxBWiQBDJu9csypzoA+y9su1hxpp81YMAebVKYWPO7puPOIi7OYMSSFiP11LhEPD9Ab6KPxvK1hVR44b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788243438; c=relaxed/simple;
	bh=/uweQL1KQ1bUorDSL1+vZtHM36Y1TpbJA1wqhlrkM0c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VYG0369ESvd5+XQ+iQWHLpiFfGtaO5UxZESefCJRNmBjHMaYcUj+jSS92Mkwv+Ky0LMClrWBXB5tfr/z/41Bp4XONa2sc17OaOp9u7Cx7rqYyqJ3I8cF4hyJd4nlnk5uwDeGQg+yn3gY5ikg8XdXSjtB2h46cDknXl3AeqSdVEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com; spf=pass smtp.mailfrom=ultrarisc.com; dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b=XlbFEavY; arc=none smtp.client-ip=218.76.62.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b="XlbFEavY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:From:Date:Subject:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	References:In-Reply-To:To:Cc; bh=GYX5/lq9OvdPuuvzJQOy/6WxyPW5pgg
	6WIHJlZnW0q0=; b=XlbFEavYAXDzpbH2oCfpfWgGzw0ULhkAtPC8Sqh783jBnv5
	BP/jrmvh0r8abKDuu8U1tPt9FZqkwKlc5Q8VcIwjr5fGrre+3Hu6f2EIOpWoCWXS
	xI1q8ivmoSQnRgvyPAA4fBZ1QRy44f3xH5nEufyJLcLm1fSopCLMgS5lfj2A=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwDnrwbjbZZqXCAAAA--.118S6;
	Tue, 01 Sep 2026 14:17:16 +0800 (CST)
From: Jia Wang <wangjia@ultrarisc.com>
Date: Tue, 01 Sep 2026 14:16:07 +0800
Subject: [PATCH v2 4/4] dmaengine: dw-axi-dmac: Use bitfield helpers for
 registers
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-dma-fix-v2-4-d7f0459ebb14@ultrarisc.com>
References: <20260901-dma-fix-v2-0-d7f0459ebb14@ultrarisc.com>
In-Reply-To: <20260901-dma-fix-v2-0-d7f0459ebb14@ultrarisc.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Pandith N <pandith.n@intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jia Wang <wangjia@ultrarisc.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788243415; l=9532;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=/uweQL1KQ1bUorDSL1+vZtHM36Y1TpbJA1wqhlrkM0c=;
 b=8tErHPPho+4SNjyIp6Z8keYhVaHCExDqC8AES1P6YAywYVwkXcHqIegJ4yClr5/M7htTU1RSK
 5EXW3zN//k/CM5fuhASsOeBNQ1lNIbwYPwo0uS1PAAz3SMDT9YX+cXy
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-CM-TRANSID:AQAAfwDnrwbjbZZqXCAAAA--.118S6
X-Coremail-Antispam: 1UD129KBjvJXoWxtr4UtrWDCF47JrWDAr4UXFb_yoWfKw43pa
	y8GayrXryjvF9a934YkFWUuryjv3W7Kr97Kry8Xa12krn8Xrn2vrWqgw13Jr4qqr97ury8
	Jas3GrWrW3Z3JrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmE14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr
	1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4U
	JwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
	IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4U
	M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
	kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I8I
	3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxV
	WUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAF
	wI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcI
	k0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4U
	JVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7VUjMmhDUUUUU==
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAREWqVJKMAYAAHse

The driver open-codes several channel configuration and descriptor
control bitfield writes with left shifts. Define masks for those fields
and use FIELD_PREP() when programming the registers.

Valid field values keep the same encoding. FIELD_PREP() confines values
to their respective fields, but does not validate handshake numbers
supplied through DMA specifiers.

Suggested-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 69 +++++++++++++-------------
 drivers/dma/dw-axi-dmac/dw-axi-dmac.h          | 44 ++++++++--------
 2 files changed, 57 insertions(+), 56 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index 61230d2b1c56..f8ab8d072222 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -7,6 +7,7 @@
  * Author: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
  */
 
+#include <linux/bitfield.h>
 #include <linux/bitops.h>
 #include <linux/delay.h>
 #include <linux/device.h>
@@ -101,23 +102,23 @@ static inline void axi_chan_config_write(struct axi_dma_chan *chan,
 {
 	u32 cfg_lo, cfg_hi;
 
-	cfg_lo = (config->dst_multblk_type << CH_CFG_L_DST_MULTBLK_TYPE_POS |
-		  config->src_multblk_type << CH_CFG_L_SRC_MULTBLK_TYPE_POS);
+	cfg_lo = FIELD_PREP(CH_CFG_L_DST_MULTBLK_TYPE, config->dst_multblk_type) |
+		 FIELD_PREP(CH_CFG_L_SRC_MULTBLK_TYPE, config->src_multblk_type);
 	if (chan->chip->dw->hdata->reg_map_8_channels &&
 	    !chan->chip->dw->hdata->use_cfg2) {
-		cfg_hi = config->tt_fc << CH_CFG_H_TT_FC_POS |
-			 config->hs_sel_src << CH_CFG_H_HS_SEL_SRC_POS |
-			 config->hs_sel_dst << CH_CFG_H_HS_SEL_DST_POS |
-			 config->src_per << CH_CFG_H_SRC_PER_POS |
-			 config->dst_per << CH_CFG_H_DST_PER_POS |
-			 config->prior << CH_CFG_H_PRIORITY_POS;
+		cfg_hi = FIELD_PREP(CH_CFG_H_TT_FC, config->tt_fc) |
+			 FIELD_PREP(CH_CFG_H_HS_SEL_SRC, config->hs_sel_src) |
+			 FIELD_PREP(CH_CFG_H_HS_SEL_DST, config->hs_sel_dst) |
+			 FIELD_PREP(CH_CFG_H_SRC_PER, config->src_per) |
+			 FIELD_PREP(CH_CFG_H_DST_PER, config->dst_per) |
+			 FIELD_PREP(CH_CFG_H_PRIORITY, config->prior);
 	} else {
-		cfg_lo |= config->src_per << CH_CFG2_L_SRC_PER_POS |
-			  config->dst_per << CH_CFG2_L_DST_PER_POS;
-		cfg_hi = config->tt_fc << CH_CFG2_H_TT_FC_POS |
-			 config->hs_sel_src << CH_CFG2_H_HS_SEL_SRC_POS |
-			 config->hs_sel_dst << CH_CFG2_H_HS_SEL_DST_POS |
-			 config->prior << CH_CFG2_H_PRIORITY_POS;
+		cfg_lo |= FIELD_PREP(CH_CFG2_L_SRC_PER, config->src_per) |
+			  FIELD_PREP(CH_CFG2_L_DST_PER, config->dst_per);
+		cfg_hi = FIELD_PREP(CH_CFG2_H_TT_FC, config->tt_fc) |
+			 FIELD_PREP(CH_CFG2_H_HS_SEL_SRC, config->hs_sel_src) |
+			 FIELD_PREP(CH_CFG2_H_HS_SEL_DST, config->hs_sel_dst) |
+			 FIELD_PREP(CH_CFG2_H_PRIORITY, config->prior);
 	}
 	axi_chan_iowrite32(chan, CH_CFG_L, cfg_lo);
 	axi_chan_iowrite32(chan, CH_CFG_H, cfg_hi);
@@ -677,19 +678,19 @@ static int dw_axi_dma_set_hw_desc(struct axi_dma_chan *chan,
 	case DMA_MEM_TO_DEV:
 		reg_width = __ffs(chan->config.dst_addr_width);
 		device_addr = chan->config.dst_addr;
-		ctllo = reg_width << CH_CTL_L_DST_WIDTH_POS |
-			mem_width << CH_CTL_L_SRC_WIDTH_POS |
-			DWAXIDMAC_CH_CTL_L_NOINC << CH_CTL_L_DST_INC_POS |
-			DWAXIDMAC_CH_CTL_L_INC << CH_CTL_L_SRC_INC_POS;
+		ctllo = FIELD_PREP(CH_CTL_L_DST_WIDTH, reg_width) |
+			FIELD_PREP(CH_CTL_L_SRC_WIDTH, mem_width) |
+			FIELD_PREP(CH_CTL_L_DST_INC, DWAXIDMAC_CH_CTL_L_NOINC) |
+			FIELD_PREP(CH_CTL_L_SRC_INC, DWAXIDMAC_CH_CTL_L_INC);
 		block_ts = len >> mem_width;
 		break;
 	case DMA_DEV_TO_MEM:
 		reg_width = __ffs(chan->config.src_addr_width);
 		device_addr = chan->config.src_addr;
-		ctllo = reg_width << CH_CTL_L_SRC_WIDTH_POS |
-			mem_width << CH_CTL_L_DST_WIDTH_POS |
-			DWAXIDMAC_CH_CTL_L_INC << CH_CTL_L_DST_INC_POS |
-			DWAXIDMAC_CH_CTL_L_NOINC << CH_CTL_L_SRC_INC_POS;
+		ctllo = FIELD_PREP(CH_CTL_L_SRC_WIDTH, reg_width) |
+			FIELD_PREP(CH_CTL_L_DST_WIDTH, mem_width) |
+			FIELD_PREP(CH_CTL_L_DST_INC, DWAXIDMAC_CH_CTL_L_INC) |
+			FIELD_PREP(CH_CTL_L_SRC_INC, DWAXIDMAC_CH_CTL_L_NOINC);
 		block_ts = len >> reg_width;
 		break;
 	default:
@@ -708,8 +709,8 @@ static int dw_axi_dma_set_hw_desc(struct axi_dma_chan *chan,
 	if (chan->chip->dw->hdata->restrict_axi_burst_len) {
 		burst_len = chan->chip->dw->hdata->axi_rw_burst_len - 1;
 		ctlhi |= CH_CTL_H_ARLEN_EN | CH_CTL_H_AWLEN_EN |
-			 burst_len << CH_CTL_H_ARLEN_POS |
-			 burst_len << CH_CTL_H_AWLEN_POS;
+			 FIELD_PREP(CH_CTL_H_ARLEN, burst_len) |
+			 FIELD_PREP(CH_CTL_H_AWLEN, burst_len);
 	}
 
 	hw_desc->lli->ctl_hi = cpu_to_le32(ctlhi);
@@ -724,8 +725,8 @@ static int dw_axi_dma_set_hw_desc(struct axi_dma_chan *chan,
 
 	hw_desc->lli->block_ts_lo = cpu_to_le32(block_ts - 1);
 
-	ctllo |= DWAXIDMAC_BURST_TRANS_LEN_4 << CH_CTL_L_DST_MSIZE_POS |
-		 DWAXIDMAC_BURST_TRANS_LEN_4 << CH_CTL_L_SRC_MSIZE_POS;
+	ctllo |= FIELD_PREP(CH_CTL_L_DST_MSIZE, DWAXIDMAC_BURST_TRANS_LEN_4) |
+		 FIELD_PREP(CH_CTL_L_SRC_MSIZE, DWAXIDMAC_BURST_TRANS_LEN_4);
 	hw_desc->lli->ctl_lo = cpu_to_le32(ctllo);
 
 	set_desc_src_master(hw_desc);
@@ -978,18 +979,18 @@ dma_chan_prep_dma_memcpy(struct dma_chan *dchan, dma_addr_t dst_adr,
 			u32 burst_len = chan->chip->dw->hdata->axi_rw_burst_len - 1;
 
 			reg |= (CH_CTL_H_ARLEN_EN |
-				burst_len << CH_CTL_H_ARLEN_POS |
+				FIELD_PREP(CH_CTL_H_ARLEN, burst_len) |
 				CH_CTL_H_AWLEN_EN |
-				burst_len << CH_CTL_H_AWLEN_POS);
+				FIELD_PREP(CH_CTL_H_AWLEN, burst_len));
 		}
 		hw_desc->lli->ctl_hi = cpu_to_le32(reg);
 
-		reg = (DWAXIDMAC_BURST_TRANS_LEN_4 << CH_CTL_L_DST_MSIZE_POS |
-		       DWAXIDMAC_BURST_TRANS_LEN_4 << CH_CTL_L_SRC_MSIZE_POS |
-		       xfer_width << CH_CTL_L_DST_WIDTH_POS |
-		       xfer_width << CH_CTL_L_SRC_WIDTH_POS |
-		       DWAXIDMAC_CH_CTL_L_INC << CH_CTL_L_DST_INC_POS |
-		       DWAXIDMAC_CH_CTL_L_INC << CH_CTL_L_SRC_INC_POS);
+		reg = (FIELD_PREP(CH_CTL_L_DST_MSIZE, DWAXIDMAC_BURST_TRANS_LEN_4) |
+		       FIELD_PREP(CH_CTL_L_SRC_MSIZE, DWAXIDMAC_BURST_TRANS_LEN_4) |
+		       FIELD_PREP(CH_CTL_L_DST_WIDTH, xfer_width) |
+		       FIELD_PREP(CH_CTL_L_SRC_WIDTH, xfer_width) |
+		       FIELD_PREP(CH_CTL_L_DST_INC, DWAXIDMAC_CH_CTL_L_INC) |
+		       FIELD_PREP(CH_CTL_L_SRC_INC, DWAXIDMAC_CH_CTL_L_INC));
 		hw_desc->lli->ctl_lo = cpu_to_le32(reg);
 
 		set_desc_src_master(hw_desc);
diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
index 97451bb8b16a..b4ed241e87e2 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
@@ -234,9 +234,9 @@ static inline struct axi_dma_chan *dchan_to_axi_dma_chan(struct dma_chan *dchan)
 
 /* CH_CTL_H */
 #define CH_CTL_H_ARLEN_EN		BIT(6)
-#define CH_CTL_H_ARLEN_POS		7
+#define CH_CTL_H_ARLEN			GENMASK(14, 7)
 #define CH_CTL_H_AWLEN_EN		BIT(15)
-#define CH_CTL_H_AWLEN_POS		16
+#define CH_CTL_H_AWLEN			GENMASK(23, 16)
 
 enum {
 	DWAXIDMAC_ARWLEN_1		= 0,
@@ -258,8 +258,8 @@ enum {
 /* CH_CTL_L */
 #define CH_CTL_L_LAST_WRITE_EN		BIT(30)
 
-#define CH_CTL_L_DST_MSIZE_POS		18
-#define CH_CTL_L_SRC_MSIZE_POS		14
+#define CH_CTL_L_DST_MSIZE		GENMASK(21, 18)
+#define CH_CTL_L_SRC_MSIZE		GENMASK(17, 14)
 
 enum {
 	DWAXIDMAC_BURST_TRANS_LEN_1	= 0,
@@ -274,11 +274,11 @@ enum {
 	DWAXIDMAC_BURST_TRANS_LEN_1024
 };
 
-#define CH_CTL_L_DST_WIDTH_POS		11
-#define CH_CTL_L_SRC_WIDTH_POS		8
+#define CH_CTL_L_DST_WIDTH		GENMASK(13, 11)
+#define CH_CTL_L_SRC_WIDTH		GENMASK(10, 8)
 
-#define CH_CTL_L_DST_INC_POS		6
-#define CH_CTL_L_SRC_INC_POS		4
+#define CH_CTL_L_DST_INC		BIT(6)
+#define CH_CTL_L_SRC_INC		BIT(4)
 enum {
 	DWAXIDMAC_CH_CTL_L_INC		= 0,
 	DWAXIDMAC_CH_CTL_L_NOINC
@@ -288,17 +288,17 @@ enum {
 #define CH_CTL_L_SRC_MAST		BIT(0)
 
 /* CH_CFG_H */
-#define CH_CFG_H_PRIORITY_POS		17
-#define CH_CFG_H_DST_PER_POS		12
-#define CH_CFG_H_SRC_PER_POS		7
-#define CH_CFG_H_HS_SEL_DST_POS		4
-#define CH_CFG_H_HS_SEL_SRC_POS		3
+#define CH_CFG_H_PRIORITY		GENMASK(19, 17)
+#define CH_CFG_H_DST_PER		GENMASK(15, 12)
+#define CH_CFG_H_SRC_PER		GENMASK(10, 7)
+#define CH_CFG_H_HS_SEL_DST		BIT(4)
+#define CH_CFG_H_HS_SEL_SRC		BIT(3)
 enum {
 	DWAXIDMAC_HS_SEL_HW		= 0,
 	DWAXIDMAC_HS_SEL_SW
 };
 
-#define CH_CFG_H_TT_FC_POS		0
+#define CH_CFG_H_TT_FC			GENMASK(2, 0)
 enum {
 	DWAXIDMAC_TT_FC_MEM_TO_MEM_DMAC	= 0,
 	DWAXIDMAC_TT_FC_MEM_TO_PER_DMAC,
@@ -311,8 +311,8 @@ enum {
 };
 
 /* CH_CFG_L */
-#define CH_CFG_L_DST_MULTBLK_TYPE_POS	2
-#define CH_CFG_L_SRC_MULTBLK_TYPE_POS	0
+#define CH_CFG_L_DST_MULTBLK_TYPE	GENMASK(3, 2)
+#define CH_CFG_L_SRC_MULTBLK_TYPE	GENMASK(1, 0)
 enum {
 	DWAXIDMAC_MBLK_TYPE_CONTIGUOUS	= 0,
 	DWAXIDMAC_MBLK_TYPE_RELOAD,
@@ -321,13 +321,13 @@ enum {
 };
 
 /* CH_CFG2 */
-#define CH_CFG2_L_SRC_PER_POS		4
-#define CH_CFG2_L_DST_PER_POS		11
+#define CH_CFG2_L_SRC_PER		GENMASK(9, 4)
+#define CH_CFG2_L_DST_PER		GENMASK(16, 11)
 
-#define CH_CFG2_H_TT_FC_POS		0
-#define CH_CFG2_H_HS_SEL_SRC_POS	3
-#define CH_CFG2_H_HS_SEL_DST_POS	4
-#define CH_CFG2_H_PRIORITY_POS		15
+#define CH_CFG2_H_TT_FC			GENMASK(2, 0)
+#define CH_CFG2_H_HS_SEL_SRC		BIT(3)
+#define CH_CFG2_H_HS_SEL_DST		BIT(4)
+#define CH_CFG2_H_PRIORITY		GENMASK(19, 15)
 
 /**
  * DW AXI DMA channel interrupts

-- 
2.34.1

