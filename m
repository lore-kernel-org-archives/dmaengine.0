Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AEA217723;
	Sun, 27 Sep 2026 09:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790499845; cv=none; b=Kuh3eECWyJwx54Qg+UVvUPALxrGxZzL7WF33BbU0l8Jl2YOrY9+nNt8TEaY4JUfIYwK3BRC4/8Is1A0wW6qEL0Fn56rChnQHTHkQMJyotU8texOE5Qkst2GmqeU1OUrcDLQiMcQScs9qw7QqCUYxOQXE+70pDEA5y1p6CS2MngM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790499845; c=relaxed/simple;
	bh=6DyfMww4siCOrLTXJiqC+vd7n4uzPVIHfV97gY/VmDA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HQsyoZetHsHE80ZRL1/yf6PxIgLKjE5szZ/rsqFJJoHssbC1IARpTqvP4uNS/YbYJs/mz0PRiay4wRQJxlmkfawOJ24X0/FniYN5a0+gjrLIm0KlBSzmOyTUuAk1drMo/eRKZSeFvwRrOMVd/GeBptKZin3EqxIaIS6FhlgSwNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NdDpo10r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NdDpo10r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35DB01F00893;
	Sun, 27 Sep 2026 09:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790499844;
	bh=PKwKG2tuGIzD5lAgRMTUX77s69TzLUCkmZv2XPdJaMo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=NdDpo10rWeW2xB2XQO6Zv7iOsEoHjJQ/pyhtt/i3AL9/L8UNGzgNc3epbuyWKVdHk
	 j5/rCpbEttCaMCnOlqe2V/CWKfu5xREIN/PTB7K42YlijlOylOuqYZ/27ZYZLvcHv2
	 UhKIGdRSDkjobxIRINCcvjE9MarN8EEMCjlrcv78ASOWdnL0mBIBKm/7BEAn5uS6wl
	 oI+6+yHYY+GgJbZ7bHnFkFDRYmvL2BmAN87Hnf3YtB0fnztF1W7omczASHVbg8G3wD
	 gA47UFTzbMSEzIQzm+jJqE8TvNBtN0PCo6SVG3vXZGUaKH7iuSwo33wV5yECZmdSGp
	 5BiWQQHuKYfVA==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 27 Sep 2026 11:03:35 +0200
Subject: [PATCH v7 22/24] dmaengine: ste_dma40: Search all blocks for fixed
 logical channels
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-dma40-fixes-v7-22-89f595e8851d@kernel.org>
References: <20260927-dma40-fixes-v7-0-89f595e8851d@kernel.org>
In-Reply-To: <20260927-dma40-fixes-v7-0-89f595e8851d@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, sashiko-bot@kernel.org, 
 Frank Li <Frank.Li@nxp.com>
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index a5471a9157cd..fe9539138549 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -2124,11 +2124,8 @@ static int d40_allocate_channel(struct d40_chan *d40c, bool *first_phy_user)
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

