Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2587C3CEBBC;
	Tue, 26 May 2026 08:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779785283; cv=none; b=hiCiUl7BlAlV4CIRMqrXhJjbGU+OT318B7DQo6w0XMJNlb9g1ELieUMLWwTv4dEuFFpziFiZKdMh1Mf/DM9rwzxM1z0rx705bZYY6pKGc4jVzLHGFjAni52mP/yZ1v+/nGRwR5OPdtt/xXayEWaEI+8mW8dMonOFv8nYW1rjJ94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779785283; c=relaxed/simple;
	bh=Ix63j2ZVDp+zmFw7/HmTbwuDBZAfwIj21b78ccIHkEg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FpgVOhyPFqUDmn1Nyd0mT+lfHcsHkCPAsY6CPBz4VSB0MCdNsD4r/wqYRb1GoBiw4fm0+mN323hsQ2uhKFJ3n3C59f4FexATPKxaVfSk8f0aXAml3SzhISczeIWBvoqEKmq6sPem3BB0oQdj7f8/8XbZ+7jdCu2nLlXFctttnrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OgMDwijR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OgMDwijR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BB081F00A3A;
	Tue, 26 May 2026 08:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779785282;
	bh=eBq2EtSdW18GdR3eVuCaJSBPEyIAcAZy8dUcYAo1pSA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OgMDwijR07UHDSqhzp1stEW0tUVszC+6gLS9j6Sfb0Ujs7gbvSc46l1Itp2aRjaFG
	 81yb1TCV22VBNWanxDiJz2NCIxvWz76L4BzBrHgx1bjfjLiP+d+I5WQ99T3oMYi0Fs
	 TrsTnugpMqahVb4X09x2Kl36WSHPlBjlPmvkF0wEc5PykKHwac/FtwwOSc8PHQvhqW
	 iSoE4tvJyR35v6j2cRYTfWJBRyzqsKSuvAtr3S1c3uZogDtQQGeHAraLOwFKUPbBUI
	 hoxwhKAmDi3xqrJpaWQTUj0haXjnDbdOtfJN/Z06cKnNBygR8aAkmXxRNo8i9D89TZ
	 r4ZtOv7cPqu7A==
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
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Frank Li <Frank.Li@nxp.com>,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH v6 08/18] dmaengine: sh: rz-dmac: Add helper to check if the channel is paused
Date: Tue, 26 May 2026 11:47:00 +0300
Message-ID: <20260526084710.3491480-9-claudiu.beznea@kernel.org>
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

Add the rz_dmac_chan_is_paused() helper to check if the channel is paused.
This helper will be reused in subsequent patches.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Tested-by: John Madieu <john.madieu.xa@bp.renesas.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v6:
- updated patch description to reflect better the changes
- collected tags
- s/chan/channel in rz_dmac_chan_is_paused() to follow the naming convention
  accross the driver for the variable of type struct rz_dmac_chan

Changes in v5:
- none

Changes in v4:
- none

Changes in v3:
- none, this patch is new

 drivers/dma/sh/rz-dmac.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
index 76bac11c217c..217657513fa7 100644
--- a/drivers/dma/sh/rz-dmac.c
+++ b/drivers/dma/sh/rz-dmac.c
@@ -286,6 +286,13 @@ static bool rz_dmac_chan_is_enabled(struct rz_dmac_chan *channel)
 	return !!(val & CHSTAT_EN);
 }
 
+static bool rz_dmac_chan_is_paused(struct rz_dmac_chan *channel)
+{
+	u32 val = rz_dmac_ch_readl(channel, CHSTAT, 1);
+
+	return !!(val & CHSTAT_SUS);
+}
+
 static void rz_dmac_enable_hw(struct rz_dmac_chan *channel)
 {
 	struct dma_chan *chan = &channel->vc.chan;
@@ -822,12 +829,9 @@ static enum dma_status rz_dmac_tx_status(struct dma_chan *chan,
 		return status;
 
 	scoped_guard(spinlock_irqsave, &channel->vc.lock) {
-		u32 val;
-
 		residue = rz_dmac_chan_get_residue(channel, cookie);
 
-		val = rz_dmac_ch_readl(channel, CHSTAT, 1);
-		if (val & CHSTAT_SUS)
+		if (rz_dmac_chan_is_paused(channel))
 			status = DMA_PAUSED;
 	}
 
-- 
2.43.0

