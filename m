Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E8A3A6B8E
	for <dmaengine@vger.kernel.org>; Wed, 19 Aug 2026 22:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787178968; cv=none; b=dXY5HTGN9anBAZKbYCG2smk76BcGIOEAnSIl+FbkiZOJKQ5ONhJAVI7/pxP4lmx59KZap1TeKBRf5qxax6/DQDUBCOWYhOPSdgBFd+QJ7VizsPAbyOqH42mFZkY2B/kLlakzRnauuWbRjQEvJ86zUrDjtEb2nz48cNab+LnxqC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787178968; c=relaxed/simple;
	bh=OLw/t1AVqnD6lzlZA7MtP5I+eSD5LUDPcGuBxA8s/5w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MtI9ylYzG8QMDoRLSWg6fRjxGiatlFe74JU03AlWlbCnb2JUzy7TeQCQFn9h1xkmwVEaiFkEJzCZ7TqudCLYg3dmlmQzqgADLUWymhh/sWDO6v9J8tzS+4FVJM6IwMqXbAsohde3IjvJ5ANFOilAUX30JRSI7Jv+GSgCI/xHH5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XImQRYv2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XImQRYv2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 944271F000E9;
	Wed, 19 Aug 2026 22:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787178967;
	bh=SDMwnBUXjHl/zW7gG8ATnC/Ap1N/RMb2uOd0nGOlPiY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=XImQRYv2ZcMrIrTzS3/risXVa7pLsQNGJKlhrfww2rlpIijH7IZAs6GKuAEX0EwVP
	 ZpX++e3l95oih6HsaNBYsexLQFfM8SbL7kDurbY9agf3G61G4znJase3U9Xy5P5gS/
	 KBs0HFPisHRsFfOo6KmhKHqrJB7GSlpHEh8OeHbcQaG7TEobCJOtTQDolygOmB7Bws
	 lrvykhkmVSpy+W4yuNLeC8vhRiKJ6bzro50p8DACVfXtrXTrVa8gdLL6BYsQPmRAEj
	 cIWHTu5WdwaLNU+GpCHnMQHSUaOo8KrcyL+ugOfG0SFfuulhn52ETN7Xiv9xV4MNf/
	 HsQCS8sDxWzWg==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 20 Aug 2026 00:36:00 +0200
Subject: [PATCH 4/4] dmaengine: ste_dma40: Fix logical channel bounds check
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-dma40-fixes-v1-4-5e14815ad689@kernel.org>
References: <20260820-dma40-fixes-v1-0-5e14815ad689@kernel.org>
In-Reply-To: <20260820-dma40-fixes-v1-0-5e14815ad689@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
 sashiko-bot@kernel.org
X-Mailer: b4 0.14.3

d40_validate_conf() checks the raw dev_type against num_log_chans,
but d40_allocate_channel() derives the lookup_log_chans index as either
2 * dev_type or 2 * dev_type + 1.

Validate the dev_type against the derived logical channel index limit so
channel allocation cannot write past lookup_log_chans.

Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/dmaengine/20260618051539.15E201F000E9@smtp.kernel.org/
Assisted-by: Codex:gpt-5-5
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index a723133d096e..eda3f91741ed 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -1727,15 +1727,26 @@ static int d40_validate_conf(struct d40_chan *d40c,
 {
 	int res = 0;
 	bool is_log = conf->mode == STEDMA40_MODE_LOGICAL;
+	bool invalid_dev_type = conf->dev_type < 0;
 
 	if (!conf->dir) {
 		chan_err(d40c, "Invalid direction.\n");
 		res = -EINVAL;
 	}
 
-	if ((is_log && conf->dev_type > d40c->base->num_log_chans)  ||
-	    (!is_log && conf->dev_type > d40c->base->num_phy_chans) ||
-	    (conf->dev_type < 0)) {
+	if (!invalid_dev_type && is_log) {
+		int max_dev_type;
+
+		if (conf->dir == DMA_DEV_TO_MEM)
+			max_dev_type = DIV_ROUND_UP(d40c->base->num_log_chans, 2);
+		else
+			max_dev_type = d40c->base->num_log_chans / 2;
+
+		invalid_dev_type = conf->dev_type >= max_dev_type;
+	}
+
+	if (invalid_dev_type ||
+	    (!is_log && conf->dev_type > d40c->base->num_phy_chans)) {
 		chan_err(d40c, "Invalid device type (%d)\n", conf->dev_type);
 		res = -EINVAL;
 	}

-- 
2.55.0

