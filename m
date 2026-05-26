Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E283CEB8E;
	Tue, 26 May 2026 08:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779785298; cv=none; b=dMSKN7SfF50h+3o/XcrwE1TyFqfQCxVulqXSQR9JnzdzfTST2q+06g+vaTC+92rVl02G7i8yVXZs0gO8tEg7EkyOPMjtxQSHt02h0LxlElvDRFY0bk4YRxzN5Hipac8WDUmbfPnOLLBG2qkZZWpDzIEIlIpM57qEHDQ7g6VWBUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779785298; c=relaxed/simple;
	bh=iMvwQ/BKtWP57urrh8T+L5p5HB3eyMvJMt5pylBUT4o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hRZK3l556jn9LS6g/oRoznjCNHVcOWl4rwuSbv3VOd+UhCeNjwM2+nFMjy/PjgmgpiJsDHc0rUduUqUOkixBMVFZvVoYE9f61z9e54SEfnEgvSAhEfP4tQ9R7mA3UiZ/cwpXtXwEEaEHnfauzy9ElXDq3FlEjV0vt1/qZ63xatM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=au8YZC0s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="au8YZC0s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CDCE1F000E9;
	Tue, 26 May 2026 08:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779785296;
	bh=EhJnlm7aIME3IueJM+kqi3yB/0TLHFEMSHwT+k+SpW4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=au8YZC0slTD1baJkep3zFR1mDr3gC6Jtkua693GksXrmsDATeaCq0zUJ7NU+SdX6o
	 bAAb34agqhoFuln0Oq+mbbEzGu5tCgjPzVc3O4LAydNLSS5SG3++TUgvbUfR4892Fn
	 AHrEs875lk+0Q3fc9M/5AiDvkolhq56PYBOoE9ZvMUj4u9+0AUst6bnlZ4hMao+jaQ
	 ftrSeF/EduJeSLZReYa79eQVGy3721oGGAQoaVmkWDotXRKLzHm4CpcyRnagwHKA6N
	 zqnynefmnWrZxOCyWLvb8Q/ZJbhaJsBol40rXLYgU+CdG+HFEoGRFAlsXPTVUy7zJB
	 yms3moFO0uZeg==
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
Subject: [PATCH v6 11/18] dmaengine: sh: rz-dmac: Drop the update of channel->chctrl with CHCTRL_SETEN
Date: Tue, 26 May 2026 11:47:03 +0300
Message-ID: <20260526084710.3491480-12-claudiu.beznea@kernel.org>
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

The CHCTRL_SETEN bit is explicitly set in rz_dmac_enable_hw(). Updating
struct rz_dmac_chan::chctrl with this bit in
rz_dmac_prepare_desc_for_memcpy() and rz_dmac_prepare_descs_for_slave_sg()
is unnecessary in the current code base. Moreover, it conflicts with the
configuration sequence that will be used for cyclic DMA channels during
suspend to RAM. Cyclic DMA support will be introduced in subsequent
commits.

This is a preparatory commit for cyclic DMA suspend to RAM support.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Tested-by: John Madieu <john.madieu.xa@bp.renesas.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v6:
- collected tags

Changes in v5:
- none

Changes in v4:
- set channel->chctrl = 0 in rz_dmac_prepare_descs_for_slave_sg()

Changes in v3:
- none

Changes in v2:
- fixed typos in patch title and patch description

 drivers/dma/sh/rz-dmac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
index 557364443a5f..c9c00650ddd5 100644
--- a/drivers/dma/sh/rz-dmac.c
+++ b/drivers/dma/sh/rz-dmac.c
@@ -377,7 +377,7 @@ static void rz_dmac_prepare_desc_for_memcpy(struct rz_dmac_chan *channel)
 	rz_dmac_set_dma_req_no(dmac, channel->index, dmac->info->default_dma_req_no);
 
 	channel->chcfg = chcfg;
-	channel->chctrl = CHCTRL_STG | CHCTRL_SETEN;
+	channel->chctrl = CHCTRL_STG;
 }
 
 static void rz_dmac_prepare_descs_for_slave_sg(struct rz_dmac_chan *channel)
@@ -428,7 +428,7 @@ static void rz_dmac_prepare_descs_for_slave_sg(struct rz_dmac_chan *channel)
 
 	rz_dmac_set_dma_req_no(dmac, channel->index, channel->mid_rid);
 
-	channel->chctrl = CHCTRL_SETEN;
+	channel->chctrl = 0;
 }
 
 static void rz_dmac_xfer_desc(struct rz_dmac_chan *chan)
-- 
2.43.0

