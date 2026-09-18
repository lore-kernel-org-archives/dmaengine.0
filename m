Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93074E50DA;
	Fri, 18 Sep 2026 16:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789748707; cv=none; b=EHVdniIJNWRskEjcW8RWbmVpBaoQWR4DlCq5++QaLWg3VjYm9PkKLlj2BQ0hgdzenCfROEWj65bRSVjQdm2IJokCE/riHXxuvHJOjv9hKEx5IxwhM1wApsm8tjp3wk8mSIAhkf/XSQKds4pMhcqjJOxq3TbZOM+b79+fA3d5vm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789748707; c=relaxed/simple;
	bh=rY0A+xhpmhqHoUS6Kj5Hsd8rvN3I0ktP9CVptu8KyPM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j7G5Nc5UvvYcNHZTy6unIvgjS5AFZ6FtHeQOkJQNV4BlvwTjOgqGO2ZXSrKNdpIXbVUlklTUiYLAqwJausvfp7uXMVCVBJ0N7RePHeIWe5uJVG/8m9Qz3N5/uTvuIeAgIDAZzUSRfBcwxylmfpdNpOlGqnJoZEe5yT5CIzyikK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YYYqkfGe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YYYqkfGe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11E881F00899;
	Fri, 18 Sep 2026 16:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789748704;
	bh=bPyHz/rlix4MYzTHaqC1YSeaDAIxRzqz7VhgZHzMd0U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=YYYqkfGeZRbaFWdydZB4ZU8fT12loSxz/Wg6pgYm13FUx0QXbqjGwsqq4Qe2BGzKD
	 CodhwV5B/4NRripR4j68N+Ynl8ZT0DWAczil/eWJfH58zDv8hH9mSYlUIIJUwuSPw8
	 ihDPRBSxX3Vg/FQo38byoHClbi8HL3INEpWpzr3dUsgZ1HRbWr57CtlD0+AUTni7wo
	 qi7cmneKo1KhJM0lyCBrzBZ9Qk264wpQneosKF2Q3L/AKbPR3QBpiVr/uV4Owcza2P
	 Ojwe+e8NGRf7PiwRedOSUHjKPsa/pD/FjkYgwNZSMwdyBhmrm27ivtjEjsQwPNsGfh
	 Zz3MXM+qHV3+Q==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 18 Sep 2026 18:24:40 +0200
Subject: [PATCH v3 21/22] dmaengine: ste_dma40: Validate fixed physical
 channel indexes
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-dma40-fixes-v3-21-8dd8450669e8@kernel.org>
References: <20260918-dma40-fixes-v3-0-8dd8450669e8@kernel.org>
In-Reply-To: <20260918-dma40-fixes-v3-0-8dd8450669e8@kernel.org>
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
index 37b96debe7bb..3310f5086122 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -1785,6 +1785,14 @@ static int d40_validate_conf(struct d40_chan *d40c,
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

