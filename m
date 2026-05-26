Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5EC4313534;
	Tue, 26 May 2026 08:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779785252; cv=none; b=sMlLz3M+ttyx9pMWZhSM7ON09jChEERTZGwvMFzAqdIna1z7CAkyZdHC1lSRt8FfbkIx3rwZt3YUFIic1qCxV9GiwLbu/aeNEjoUReMadQpLWAN/TOAfakr5HviH7Drea784AWmUXlObR0FcSzdqmXL6hF7g0u1qxZQEDM8tD6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779785252; c=relaxed/simple;
	bh=Em4TGyXCgUjHyYhSI61lFhPDE7mV1YFdAchhWA6h32o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k6Oj/vEQgb7grbemuNT3itVTkkG8pjEUOGO8BsvJk+Vu14h7b7TRdOIsJjDJO/IeJqnbXB2JjWDDO9q6Tk0XyjpiJfGNuIOwsTu9/nCn3OAnUzRAziFs0gQYJmQy2SPYZnyG4IRBL66ZeD5EiPgwYCA7t/q6gBBY2lWVT1ztPqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TTAV1XSu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TTAV1XSu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6C4C1F000E9;
	Tue, 26 May 2026 08:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779785251;
	bh=q+xvWTRQdtA9TmNdQAgrWOSu3zCjt6VhewfshtUD8bI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TTAV1XSuxR6duoDe0Jlln6YT9b4m5/zHOzMcYDHJ2f/sb2q5bp4vT7BYOjdnuoWoP
	 0UumyappC50MQ20tXdjK7JWP3YWMqhKeJNy4vYqPne4IZK8zoQ8//Z/EVxao6Y1OAf
	 W1kTHFO7S/hsmpMyuKqW5u8mKjBxBoz+LPStpcjqbRHAH5N/49UExav2Fy5ViI1VaT
	 ZvsNqqmvGk1AjOnzXrTL1Y8L+/HFu5WZxpCHDfPvr1tl+1KecGD7qCN1gPUPEst3N4
	 vaHpGAQc6aXvlglmkq5QGjYvk/76kCc3El2EQB9HjsEwVUL7m/KECmONeBilm+x456
	 YOtpnTCMJYCxg==
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
	stable@vger.kernel.org,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH v6 02/18] dmaengine: sh: rz-dmac: Fix incorrect NULL check for list_first_entry()
Date: Tue, 26 May 2026 11:46:54 +0300
Message-ID: <20260526084710.3491480-3-claudiu.beznea@kernel.org>
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

list_first_entry() does not return NULL when the list is empty,
making the existing NULL check invalid. Use list_first_entry_or_null()
instead.

Fixes: 21323b118c16 ("dmaengine: sh: rz-dmac: Add device_tx_status() callback")
Cc: stable@vger.kernel.org
Tested-by: John Madieu <john.madieu.xa@bp.renesas.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v6:
- collected tags
- updated the patch title and description to reflect better the changes

Changes in v5:
- none

Changes in v4:
- none, this patch is new

 drivers/dma/sh/rz-dmac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
index 9f206a33dcc6..6d80cb668957 100644
--- a/drivers/dma/sh/rz-dmac.c
+++ b/drivers/dma/sh/rz-dmac.c
@@ -723,8 +723,8 @@ static u32 rz_dmac_chan_get_residue(struct rz_dmac_chan *channel,
 	u32 crla, crtb, i;
 
 	/* Get current processing virtual descriptor */
-	current_desc = list_first_entry(&channel->ld_active,
-					struct rz_dmac_desc, node);
+	current_desc = list_first_entry_or_null(&channel->ld_active,
+						struct rz_dmac_desc, node);
 	if (!current_desc)
 		return 0;
 
-- 
2.43.0

