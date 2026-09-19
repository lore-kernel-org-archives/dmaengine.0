Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E91726738C;
	Sat, 19 Sep 2026 22:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789856575; cv=none; b=ceDakw10Dyp+YLFdYr97HPAVy1PdOXmWtqZ69wK88FopPmYs2H62ylRgEwUJ2oWFRRM3d3GiCAcuGbwgrrYaGkCp1PYtPwfpdA1CKdP5z3LnP+A3JYquKIPRmb2beNkRszwAEYFPR4US2WZkbAae3fOLrCkIAGbXmMnGqsS/rx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789856575; c=relaxed/simple;
	bh=wbNtbFpkxy7NH+TldDHfBaE99g+qO8sU/s4PvhZvVh4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LkIkRB6KdEqCHqhUE5AdvDlpedIE8aupoalDNVWigeb3099BLL8UV7WzIPk9WIsnaYIxUoSfH2yrWSZKhWQ0IGe1Hz/SQWV4AJsle7E3sWeaCZW1GOe8RsCnGbgckNcV8+oGwo4iIxyUSzt7eyL7zWrtzI/yG4RlWK7OF4XotnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ihGB56/j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ihGB56/j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCF641F000FF;
	Sat, 19 Sep 2026 22:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789856574;
	bh=TIgAhGdZ0vZhi1SBiHaByMGToo2PxBt1MoT7IGFStKM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ihGB56/j0IfnfzfPzqdX5/Pdi+851vj8n1+kNMcJayhdqSVHKP3ajYeLFzCYRmO7y
	 o4pe6Pep2/2MTvqqLHZ6oUsufNRqm6PDmmqvWrKmKQ66AesSLXZOFgc3GAhugQETfv
	 9x4R1lZtxlcJZGyKlT9C1CuH85gOWOkOtA4YKAvs+0gz9FkzVP318fCYZhruE07uPZ
	 qaTsyrAbqdJt5D7XfklaJGhczJ87DQuP7YS9bNGRvoX6SsfR0qqwI9ysDA1zTba9fy
	 q80+oJNuqcoQet2Jf4xQq2R1eInab3kp8xkQJk/+FERdPO87zE7P90LxalRLQOO+YM
	 PkmC13oRTZ45Q==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 20 Sep 2026 00:22:32 +0200
Subject: [PATCH v4 21/23] dmaengine: ste_dma40: Search all blocks for fixed
 logical channels
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-dma40-fixes-v4-21-d751b2d9c23f@kernel.org>
References: <20260920-dma40-fixes-v4-0-d751b2d9c23f@kernel.org>
In-Reply-To: <20260920-dma40-fixes-v4-0-d751b2d9c23f@kernel.org>
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
index 1738a37da682..d68828acb186 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -2077,11 +2077,8 @@ static int d40_allocate_channel(struct d40_chan *d40c, bool *first_phy_user)
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

