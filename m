Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C671384CD5;
	Sat, 19 Sep 2026 22:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789856577; cv=none; b=nJQQsZc+JQlo2jM2GTlNXNoARTPz07GH9+/jukvDKBmUytywuwUixG65UQv20+Wfn0KES6JCziw4zlYLdwuui93ltLAR2cpKn2zPdCkRzD2SIYoYNf5sXerrvJEufKeSd852Z/IZkOzKgVdNLji6moz06XSrp87TOeuscs/JVSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789856577; c=relaxed/simple;
	bh=N24a9IyqiabBC9Qg8A+5iVJyhiOEzDCNeCX2vFxT/0U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P5vkwNU2yOwj4oCqd4N0wH1p4Lrn2oBujH0nGr2PhPTGNkHidperAaNjuo6b4BmYnESba0jATHPJaoumlDSJPk61dKS/6gIqPy/Gkr9Y4g1LyLe+aRraQKJcddiaNhYYcr7BTM//kZMDJ5E6q1E7zwZy+juQXg9NLsG7fKiDmPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AiqsgXyp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AiqsgXyp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA8E41F00893;
	Sat, 19 Sep 2026 22:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789856576;
	bh=t+1gilrbRJph5MjFNEfZjAqnaySCqm6sbdHneZwyJyg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=AiqsgXypKC8LbPv7g474m1Lzd5+D8+DpEzmrbaCeCFbezR8YSOrKM5AKOsOHsxj8i
	 jzuKQ32FOKDG63UpMNwxEnoXuc/yU28LW3WHqc6AnhoivTnJNnaUuwwyeBgJyJexEr
	 YucFeVdLKRchPGE23iEbPqGp2DNtqIWSJwc5yBBMZu7Pwe+WyZNTQ4O6oN+rWKDKTS
	 I+sohurCu1J9olKZ4t9BVOfOhemsyPs65Ddfb4jQ/QP46olmIbVg6r9jmS/gY/asEV
	 Rr19dbZf4LTJ6p1ND2yQ0ByoJdNG0IqCN9QxZB5yuwWuC4yBb+Ycn4j/Y+L7VC88Od
	 KX9ideK0y0Rpg==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 20 Sep 2026 00:22:33 +0200
Subject: [PATCH v4 22/23] dmaengine: ste_dma40: Validate fixed physical
 channel indexes
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-dma40-fixes-v4-22-d751b2d9c23f@kernel.org>
References: <20260920-dma40-fixes-v4-0-d751b2d9c23f@kernel.org>
In-Reply-To: <20260920-dma40-fixes-v4-0-d751b2d9c23f@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, sashiko-bot@kernel.org
X-Mailer: b4 0.14.3

Fixed physical memcpy allocation uses dma_cfg.phy_channel directly as an
index into phy_res when use_fixed_channel is set. d40_validate_conf()
validates dev_type but not the fixed physical channel, allowing an invalid
configuration to access memory outside the array.

Validate the fixed physical channel centrally before accepting the channel
configuration.

Fixes: f000df8c5a0e ("dmaengine: ste_dma40: support fixed physical channel allocation")
Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/dmaengine/20260819225008.5F9651F000E9@smtp.kernel.org/
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index d68828acb186..0fbd77588231 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -1884,6 +1884,14 @@ static int d40_validate_conf(struct d40_chan *d40c,
 		res = -EINVAL;
 	}
 
+	if (conf->use_fixed_channel &&
+	    (conf->phy_channel < 0 ||
+	     conf->phy_channel >= d40c->base->num_phy_chans)) {
+		chan_err(d40c, "Invalid physical channel (%d)\n",
+			 conf->phy_channel);
+		res = -EINVAL;
+	}
+
 	if (conf->dir == DMA_DEV_TO_DEV) {
 		/*
 		 * DMAC HW supports it. Will be added to this driver,

-- 
2.55.0

