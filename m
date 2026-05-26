Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3AD3CEBB6;
	Tue, 26 May 2026 08:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779785307; cv=none; b=qn//ltF1jsPAYaUbNwEm5/F7FTy7xjMSae3uSkZ6Ylr9j1GzDpsOHWnME55ecpk8WDtFTnbpqAw+hfqcghGnisvrGhNstkSJtwwWCYS+mA2sB/o5ipsVw6CX8IOZiXgV8Uiwr0Q5tjeGWeK06CjGUJJvdvAffogW6UQzFpQptoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779785307; c=relaxed/simple;
	bh=RGJ2GhZieeHp2+dVykslQCZ+byUuf4/vU3zgWYqSOgA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FPStrA0HpAODJyxSKu53hDWedttB/vmKsuJimOmQK/54bnpNxVlIuupG1rEjZzRIeZrgzhWsRHWj6yLP8mQNSdy/4UEtKmZP0e2xIilJlUfzcJCGmHxdqihEYldIMN/SGMMOl7d8LDQM1O1aralmmuyqOQ7AYMCaCgubWYmkYAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ko/XsXhq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ko/XsXhq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2385F1F000E9;
	Tue, 26 May 2026 08:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779785306;
	bh=t2Z7RErh2Nd3ARXirxEzn17ObeWEMX6ORjGzypm37vU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ko/XsXhqGYte9fwoUVkYHKJ8D/14gJ+2tusWsiL2D3sNgi0C0ttDakslgTGdmky6q
	 WJJPXNfkqt7RIXEmcBHBZmLbjnpZeUK341vFBDFRKmWIVAAqUl1u2/QA/7Vpk/0t07
	 1DnDCbaEbu4CgcI0KCwoUI97pCZ8TOMNQK36mln9aiKDMxEMcEl0CjejJ+RjM+orP1
	 WxzeCLqpeQw0+xM2WwK42Cu5rEGP0U72tI2yKDbmOnIPwkst7GSIGxyTZhb/yJbinw
	 5gqo46kA14cmiAWPLSilCgBlcGA1Gtb4VecKeusjqD7MxC5tqTVEmTRGMsGH6tr1lg
	 Gi/e6vpcTCxSw==
From: Claudiu Beznea <claudiu.beznea@kernel.org>
To: vkoul@kernel.org,
	Frank.Li@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com,
	long.luu.ur@renesas.com
Cc: claudiu.beznea@kernel.org,
	claudiu.beznea@tuxon.dev,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v6 13/18] dmaengine: sh: rz-dmac: Adjust rz_dmac_chan_get_residue() to return error codes
Date: Tue, 26 May 2026 11:47:05 +0300
Message-ID: <20260526084710.3491480-14-claudiu.beznea@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526084710.3491480-1-claudiu.beznea@kernel.org>
References: <20260526084710.3491480-1-claudiu.beznea@kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Adjust rz_dmac_chan_get_residue() to return error codes on failure and
provide the residue to callers through the residue parameter. This
prepares the code for the addition of runtime PM support.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v6:
- none, this patch is new

 drivers/dma/sh/rz-dmac.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
index 8fd8a4bd9cc9..93394b9934c8 100644
--- a/drivers/dma/sh/rz-dmac.c
+++ b/drivers/dma/sh/rz-dmac.c
@@ -860,8 +860,8 @@ static u32 rz_dmac_calculate_residue_bytes_in_vd(struct rz_dmac_chan *channel,
 	return residue;
 }
 
-static u32 rz_dmac_chan_get_residue(struct rz_dmac_chan *channel,
-				    dma_cookie_t cookie)
+static int rz_dmac_chan_get_residue(struct device *dev, struct rz_dmac_chan *channel,
+				    dma_cookie_t cookie, u32 *residue)
 {
 	struct rz_dmac_desc *desc = NULL;
 	struct virt_dma_desc *vd;
@@ -871,7 +871,8 @@ static u32 rz_dmac_chan_get_residue(struct rz_dmac_chan *channel,
 	if (vd) {
 		/* Descriptor has been issued but not yet processed. */
 		desc = to_rz_dmac_desc(vd);
-		return desc->len;
+		*residue = desc->len;
+		return 0;
 	} else if (channel->desc && channel->desc->vd.tx.cookie == cookie) {
 		/* Descriptor is currently processed. */
 		desc = channel->desc;
@@ -879,6 +880,7 @@ static u32 rz_dmac_chan_get_residue(struct rz_dmac_chan *channel,
 
 	if (!desc) {
 		/* Descriptor was not found. May be already completed by now. */
+		*residue = 0;
 		return 0;
 	}
 
@@ -901,7 +903,9 @@ static u32 rz_dmac_chan_get_residue(struct rz_dmac_chan *channel,
 	 * Calculate number of bytes transferred in processing virtual descriptor.
 	 * One virtual descriptor can have many lmdesc.
 	 */
-	return crtb + rz_dmac_calculate_residue_bytes_in_vd(channel, desc, crla);
+	*residue = crtb + rz_dmac_calculate_residue_bytes_in_vd(channel, desc, crla);
+
+	return 0;
 }
 
 static enum dma_status rz_dmac_tx_status(struct dma_chan *chan,
@@ -909,15 +913,20 @@ static enum dma_status rz_dmac_tx_status(struct dma_chan *chan,
 					 struct dma_tx_state *txstate)
 {
 	struct rz_dmac_chan *channel = to_rz_dmac_chan(chan);
+	struct rz_dmac *dmac = to_rz_dmac(chan->device);
 	enum dma_status status;
 	u32 residue;
 
 	scoped_guard(spinlock_irqsave, &channel->vc.lock) {
+		int ret;
+
 		status = dma_cookie_status(chan, cookie, txstate);
 		if (status == DMA_COMPLETE || !txstate)
 			return status;
 
-		residue = rz_dmac_chan_get_residue(channel, cookie);
+		ret = rz_dmac_chan_get_residue(dmac->dev, channel, cookie, &residue);
+		if (ret)
+			return DMA_ERROR;
 
 		if (status == DMA_IN_PROGRESS && rz_dmac_chan_is_paused(channel))
 			status = DMA_PAUSED;
-- 
2.43.0

