Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CAE5217723;
	Sun, 27 Sep 2026 09:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790499840; cv=none; b=PLVCDDvhrp85LMsAEDmhQq4tu3Xr4d1p6ht+ZIGsayLDbVOK+MeB+fHilaWXK/DE7Hx0AKACQOTHyxGK58BSaTj2LUkVcEyNhtncfnaNfzVGldROFyrOapyg/Wt0rTMvBx1U9ctpKlxHjH4cWS+oH3fsKvFB9deComumHwa/9RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790499840; c=relaxed/simple;
	bh=G0zJrD7XjBwG1zurJXn4yIMbb0xE/NpWs3APjfMdzsM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IMS+iGO9tFMxEmmXVskpASD1cr1bUxSr0VPW7CWP0DhOyJ6c8mGWi1MdxnDVCtNfoZt+00vhLbT4esZzel8dPe9KbCC4AiuDVo2NUroUS+QxnhgHAYdvoFh7ZGkpT9xBayf5gEhwCN31bzSOn/tHXKG6+NLU+O+v/zQEqvAGS78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BeCJuMvD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BeCJuMvD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ADC01F000FF;
	Sun, 27 Sep 2026 09:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790499839;
	bh=gh2qvCk2yGMuvzSzxbtQqIUBtjqvqlHvWEPc6PwKsuI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=BeCJuMvDFAxti86eg0F/DVGcr4HdaVfyDGrZF575Kyin7rtAJnA7xJw4GI15QKWrn
	 JwysDdkF/TNjNh0b4/edRUkfemD8/l0NRrm6QqVgvEAs3l1qEAytRdSysbEsV6NgFu
	 HzdsBdPIlRWDfePskjREHhV6bp+65gSddY+2swbRjsuSn+L/Y9s6umRJrnuT8RkbXC
	 X4ZtI6RVW/mBw5k609nUsYYukWQTIELldEO/PsSPkoVN/Z5BiH/uqBF4YA0BkewK76
	 l/w4I+NEVzF+9yHtcf9pLZCilGXXrrZ6MBxHsiu3wbTzh/hPPJKxXubaT9uLm8qEJW
	 5/IzQmHgd5dhA==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 27 Sep 2026 11:03:32 +0200
Subject: [PATCH v7 19/24] dmaengine: ste_dma40: Fix logical channel bounds
 check
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-dma40-fixes-v7-19-89f595e8851d@kernel.org>
References: <20260927-dma40-fixes-v7-0-89f595e8851d@kernel.org>
In-Reply-To: <20260927-dma40-fixes-v7-0-89f595e8851d@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, sashiko-bot@kernel.org
X-Mailer: b4 0.14.3

d40_validate_conf() checks the raw dev_type against num_log_chans,
but d40_allocate_channel() derives the lookup_log_chans index as either
2 * dev_type or 2 * dev_type + 1.

Validate the dev_type against the derived logical channel index limit so
channel allocation cannot write past lookup_log_chans.

Fixes: 26955c07dcf3 ("dmaengine: ste_dma40: Amalgamate DMA source and destination channel numbers")
Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/dmaengine/20260618051539.15E201F000E9@smtp.kernel.org/
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 1b1edcb72480..fcb074928675 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -1881,15 +1881,26 @@ static int d40_validate_conf(struct d40_chan *d40c,
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

