Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86F6514775;
	Fri, 18 Sep 2026 16:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789748704; cv=none; b=kDeH4BvliMCOAj1MT+lXjfgr+3FUm4pR6iaNL7Qjtd5zz9fiE7HRs0tcrRZCJDUqImsRXeyJXIlV+FEiMP4kxs3ABhHX4IBdns25nN2pbSlURt2yvyVbKcchkJZo509m0H3UWtajkDKJEgNuQBXhSzKXHNHoXJ02Bo6QA1IKxw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789748704; c=relaxed/simple;
	bh=zKn3WGRF0ODYjX9FJVXp4c3G1/NXMNKRnww4+4oedtk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TWeQuhFJvIkWolM+jhppXAcPKXC68im/VGId1HbSvcEq36Zfbvhod6EXwE0ymMeQGtiA04W6Wcq8RSldLioACZAuQA2y56UfaWNPXf6r/XEirop3wjtUj+tZEAr5OAApwOlPfC8jRw2k3eNEWTrFvS7MfO03xf8PJMjXz+xaPnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VL8njGO3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VL8njGO3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 432CE1F00898;
	Fri, 18 Sep 2026 16:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789748702;
	bh=frJQUA++maSxmMeCRVaGw6KM/SR86dota96GmpcFMtY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=VL8njGO3mQunfJMsiN6p/szHU4VLyOe4g7W7HlWn4BWmx/3MTDfUg14sLbtoEEZMD
	 sTcnuMl87WS+1WFTa1Tubcq5XRy3mgn/xjedPsMDQXpqWJFN+QBS/Nixk1cABc7w8d
	 ucl8ePM7yGFIMrujibKoPtqg9FpL/AaxQgtfjidwyAI2t7sdAgOjIBy5ByckXAaBkI
	 dPsRw8vsi0nzasw+FdxZ6i8/cv714IqQtdcwcWAqaX0zMEqzybdv1KollObkGXCrv/
	 xMPQgyqybpeVLjVtlP12gvNgOFc0B6w42tj4XkXbBDfFBspsNOIfXTlwy/f99naldS
	 Jgxz15h0iuqjg==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 18 Sep 2026 18:24:39 +0200
Subject: [PATCH v3 20/22] dmaengine: ste_dma40: Search all blocks for fixed
 logical channels
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-dma40-fixes-v3-20-8dd8450669e8@kernel.org>
References: <20260918-dma40-fixes-v3-0-8dd8450669e8@kernel.org>
In-Reply-To: <20260918-dma40-fixes-v3-0-8dd8450669e8@kernel.org>
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
index 5dbe11fceb4c..37b96debe7bb 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -1978,11 +1978,8 @@ static int d40_allocate_channel(struct d40_chan *d40c, bool *first_phy_user)
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

