Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02CE47277C;
	Sun, 20 Sep 2026 19:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789930817; cv=none; b=aG8IVuAouLjoFI+vGcdqUJ1+NryW49K2nMiJ2sKZfOsYkzrNux1urwwo2N8n9RbWlkP2FsXHsQDV0e1bAzESCbpttPl1B4PKxQB8sIwU7gOyi32lb/ya7tOHd2k6ex75xac3ZmZQyZxwaJpaGQ1/xz+zYtAeKy6EVLjcvT12QqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789930817; c=relaxed/simple;
	bh=fRrTAeyGu9rSBpyTBvu14Ae2r4fc0i1Zxo7Da4x9CaU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sz+WqEJ0L2j8ENqz6zzxa4JfcG3ZqCmPyFvvtwsGNF/2c2dhaGGHOpOJ1orceWq4iM6tZ1DF2P4MajUZ0j+WC8VqtOYFSfFbzv3RlhtjMxLgQPl/qpyB4auKyJwpP90sPQkDJUauHgUluzsovYqDbN5Aidyz9wB+41CeC5zEGp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RPq1Wy/b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RPq1Wy/b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 697321F000FF;
	Sun, 20 Sep 2026 19:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789930815;
	bh=6YZBm4QYdtdeSTXary8YRcz6e3RGF/Dy3gibjj5ztVs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=RPq1Wy/bWFeifhckzA4O2YX+3tlZG5Jt+eRk/YPIdxQRcfaP6NOXbrow9T8AE8oRe
	 1PcAFTYdrR4ek3owiGjWpbkoG3B5JYzwQUaGOcl/uX3XoDWtCt7av5qAvDA2BmdPbY
	 yd+NZSa7BEWFz9kNRb/kmD4Dj3i38S7ZkBWY6d5zCLJZCz+7lJHwiN0fWvl1ty1Raf
	 zYSeBc2UGspzrXkrJJ7wviQxKOZ1HeNB+zC22PyKtDu1B8isaAn+KMiMSL3V69caf9
	 Or67khXUUGWZ8f1QKupN6Xw2lJv4BJVS+Z+FM1BAlD7hcEHbqZlBVZkzjGdrobQ2b7
	 Vz72iOGa7o1vQ==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 20 Sep 2026 20:59:54 +0200
Subject: [PATCH v5 19/23] dmaengine: ste_dma40: Fix logical channel bounds
 check
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-dma40-fixes-v5-19-5c55cd7f92f9@kernel.org>
References: <20260920-dma40-fixes-v5-0-5c55cd7f92f9@kernel.org>
In-Reply-To: <20260920-dma40-fixes-v5-0-5c55cd7f92f9@kernel.org>
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
index 2966a8167c22..b4dff597fa7c 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -1872,15 +1872,26 @@ static int d40_validate_conf(struct d40_chan *d40c,
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

