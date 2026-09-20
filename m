Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620952475CB;
	Sun, 20 Sep 2026 19:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789930845; cv=none; b=g8M2ptHeVtPh80DQhOAcq3DQaEP0aK8Bb2jRxG0eNPlf0JyHsqRFBPyHMXml8sciNOPX3V6fP20D7FczxW0FHE7NNtkrmPM5GbYkSO4r3Jc92DGbf0UC/7Xlh4TOHNbOj6HLbGc1YOrgcPZxSlenWicTMc7w5mhGom96CXnwZVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789930845; c=relaxed/simple;
	bh=0DkHUQHRfoqKL9gYxGMnkizsZmvgpbBQdsRd3+M3fKk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m8e8kwMNvOnKywniiufk0LnTLhoc5d9fvMVz1x+ZsL8rMDjyb7ASdU8/Gnumhlieou/VrAkfscZ+8zwZtAoFNVolcWGMvb3PMQ7SZ6Srg1vqSAdC2/iNuTjI/bsytMJj867xyy9ND95oJv8I9tV2otcPKtRDA8Mr1WWrVau/tIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SXVuUvhb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SXVuUvhb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C40751F00898;
	Sun, 20 Sep 2026 19:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789930821;
	bh=BW5ZyFWexrE/4Lt3ob2eE6u2cq6GMiXMHfOpGtcVFZw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=SXVuUvhbLkEoK0HPfc0lajHFl3E+CfSeThngaQGyjyQjgt01WzliQ8f1x/q5drVyb
	 N6mqIKhlQAF/I7Ifq2Dk29XBhNue4i4xnSf3w99IewZeqmftT2pgyiwqj1GTpY10H5
	 hen+D7jot301E3p22Qc3/xxMGNXw5QbzrhUvJ5bpEs/eg1ydoPXUZLjEmKYLO6X98D
	 hfqG+nDQpgx1ag4JA6ToN4vbno9x4nN/P9lgJWkegxH76roveOCSphRkq/LU5n9Bl2
	 GkY4Gt1JEbxhYp0Tk2f11kg/aTt3OdP5gPzPJ3zGLwV0d8ol08Zj3P5J09ImXk2rJn
	 r6+6Y6/W7E1JQ==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 20 Sep 2026 20:59:57 +0200
Subject: [PATCH v5 22/23] dmaengine: ste_dma40: Validate fixed physical
 channel indexes
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-dma40-fixes-v5-22-5c55cd7f92f9@kernel.org>
References: <20260920-dma40-fixes-v5-0-5c55cd7f92f9@kernel.org>
In-Reply-To: <20260920-dma40-fixes-v5-0-5c55cd7f92f9@kernel.org>
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
index 41c7561314c1..a3159a657040 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -1906,6 +1906,14 @@ static int d40_validate_conf(struct d40_chan *d40c,
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

