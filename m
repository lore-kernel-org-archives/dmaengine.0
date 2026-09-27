Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7993AA50A;
	Sun, 27 Sep 2026 09:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790499848; cv=none; b=LqwwTKRldARLKvZkfPDOhmq/0cIJKiherSiPhcd88lC1OcNxA8Ma2jbc6ikbunurVtkVxYU6rkhTbh/r2Jy4au8Rl8S8aSvGYhlzLY4Ysqh6ikbtd4Lf+RFG9cmx9vdFc2Mt2Ss1URoTR3JbPuUoHk1g+/OXtLb0+4IK2MLlKtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790499848; c=relaxed/simple;
	bh=H+ns+mAg5sUWHSyhS3os4ZZsC7+thEsSfn7wEWN+YUA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D8KNFircACmHuO4mOG2rc0sqkuWZn4B5dZ8htqQiLZp9r3AmIAQSXKWOXBfjJUuhY+/eHIxDtrIYJFr0VXDRpzccM0/Mn2gig6Xr6OBc5rxUb6rPkoho+iDZzipGGi9TXaW8PLzADanqKloemBZWcVdSe21IcSBEtRHF5MfCUsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K0XrjaUm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K0XrjaUm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 402831F000FF;
	Sun, 27 Sep 2026 09:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790499846;
	bh=nfKVZ9TzT3hd5QvFJNuGtYooC/yWIqPZvzODvrmio7E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=K0XrjaUm9R2qnKoby44UYkaVaapGy/7yn0pILXSw+Up9u9tTPeFBJY+Uu5Gr6lyrC
	 rHSMdWwFAn2HmbKhwogqownAlTTY9S022vgvWUCTV3hrwKRBZB6PX7PSadAe8dIf1Y
	 uH8RgZsJTJjGtk09DZYe04J73Up9RS2oCl5Wb5Px2324O8MaRbZo3ibXJxo/lxzjO0
	 O3Goj5thOmmNgRSLhanxDYJ2K6/1COUx8038BE0TknHFs16lHCDnTTvYP0gPM9Vq7w
	 Sj7kSBL7389o7z7oKT3Fx3riFswYMI+gCGPyQBAbKPvcc1hFfrE+ezs0qyKTisq5Bd
	 FhRbmYQPAiXGQ==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 27 Sep 2026 11:03:36 +0200
Subject: [PATCH v7 23/24] dmaengine: ste_dma40: Validate fixed physical
 channel indexes
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-dma40-fixes-v7-23-89f595e8851d@kernel.org>
References: <20260927-dma40-fixes-v7-0-89f595e8851d@kernel.org>
In-Reply-To: <20260927-dma40-fixes-v7-0-89f595e8851d@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, sashiko-bot@kernel.org, 
 Frank Li <Frank.Li@nxp.com>
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index fe9539138549..4bf969511439 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -1916,6 +1916,14 @@ static int d40_validate_conf(struct d40_chan *d40c,
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

