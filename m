Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3593DB964;
	Sun, 20 Sep 2026 19:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789930821; cv=none; b=t0U9v/Px0HawWEFQNBZzciCgAzBohDypQ5yZIjqIobE5U1TY5nXOD1KQD1HdIGSpTf0NhmMGdQAgLKIaE9Y1dGRCbN+0pJCBcg9nSA4/Hb10+njUr15fG+Alf1dMZlQGdBkwamaEr3NuziEvJL+GnZg6764avswexFOmcBS/ehs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789930821; c=relaxed/simple;
	bh=uLZU+K+E7msl9KSp85bPuQLji0VhSbj2qwZPIiduspY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qfLTGTIL8+VAUKkY1grJ5KYkii91A3eVDK1S5w2o6CMnkSRqnH/JLebJUGNmA13JIsj0/zs6OV1Y3mW/0+bauK73NpFhP/wRFqcH4l5PuIiik2O+Yrk0v7+1pUoEUJV/U3GnNfr0CTZqlEqpIC1LFQsbUX4gdlw5yFXDJpaIAy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DkI1KLPx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DkI1KLPx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02AB11F000FF;
	Sun, 20 Sep 2026 19:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789930819;
	bh=VpyQBlCooLKGOvS3HE/8MEOBbMIf2BiA/yMWc70lvvc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=DkI1KLPxpp1AoJ4zCyPu0Y4/KNeB+CRqvsF16tVXPeoVW43fe/t3R0B5izXzmCa/7
	 /HhWo/auy1L0ogG/y+c22hMQzApoi1OBl0N0PNYwmnRSNTbx8pxxOGROxqQGgRu5Z5
	 TTrx6znf5k5YdSnHs1uFveMd13bHCReEvh0gIndefdkiE4/cvelfDlN1hQs3kMpnG/
	 TSAzQPY07F1lnliCgmp4ZzxkQvHTF9dYCf2gNSyTqgNX/COmwEtHE8FF7sAFSrSM4a
	 75zHJZXCwo4uVZOwjlhbeEtDvWEcU3dsJ7f+/r/JAeFYBXMHEbVi1sx3hT+h3rZsZM
	 g+VDv0O5+5IEg==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 20 Sep 2026 20:59:56 +0200
Subject: [PATCH v5 21/23] dmaengine: ste_dma40: Search all blocks for fixed
 logical channels
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-dma40-fixes-v5-21-5c55cd7f92f9@kernel.org>
References: <20260920-dma40-fixes-v5-0-5c55cd7f92f9@kernel.org>
In-Reply-To: <20260920-dma40-fixes-v5-0-5c55cd7f92f9@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, sashiko-bot@kernel.org
X-Mailer: b4 0.14.3

Fixed logical channel allocation scans physical channels in blocks of
eight. When the requested physical channel does not belong to the first
block, d40_allocate_channel() returns -EINVAL instead of checking later
blocks.

Skip nonmatching blocks so controllers with more than eight physical
channels can allocate fixed logical channels from the later blocks.

Fixes: 5cd326fd27da ("dmaengine/ste_dma40: allow fixed physical channel")
Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/dmaengine/20260819225008.5F9651F000E9@smtp.kernel.org/
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 13d1592bb3a4..41c7561314c1 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -2099,11 +2099,8 @@ static int d40_allocate_channel(struct d40_chan *d40c, bool *first_phy_user)
 		if (d40c->dma_cfg.use_fixed_channel) {
 			i = d40c->dma_cfg.phy_channel;
 
-			if ((i != phy_num) && (i != phy_num + 1)) {
-				dev_err(chan2dev(d40c),
-					"invalid fixed phy channel %d\n", i);
-				return -EINVAL;
-			}
+			if (i != phy_num && i != phy_num + 1)
+				continue;
 
 			if (d40_alloc_mask_set(&phys[i], is_src, event_line,
 					       is_log, first_phy_user))

-- 
2.55.0

