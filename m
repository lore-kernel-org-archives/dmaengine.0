Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C635230C618;
	Thu, 24 Sep 2026 08:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790238954; cv=none; b=IpXXIByQrt7vhWH3JiTyOneeYq2bOweRC2tYlFpH8c2WiGCZezXlE4R0V/iE3gVlXxs/ojAWCDxejN+j58xFyGRmoglIkX5K3Z50a4hmMWzvQYOwviVT8wdA8u4vzmVIKdcuGclALuAZAq9hP5aH6sxxWOnCKFbyNUPaUwSBrEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790238954; c=relaxed/simple;
	bh=ADHeXEMrealWds48tHRq3rMAFJkdCSVNJ3Vw1kVG3kM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gCjJP0M8TnHzA2nVk2BojLd8m6Mbju0+cgG/+cCUjCR6Q0gMwLTucmh5IqZGKbS57a1+ZFENCnkxaHE7ov19pICP0TNxp7fkEZsfAHWXAFaCyE/jgoYVAYueaykQOJtKT7xGqkCpD2PhIbItB+Y5KbbFUdO4H+Is/Wsp17qboaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nvVcOv1S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nvVcOv1S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B72B1F00898;
	Thu, 24 Sep 2026 08:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790238953;
	bh=XhOjqw9tPt5CRcr/10vR61Bg0hBKNb0rTNXjEf/Al/4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=nvVcOv1SVm+jx7bGxW/y8GBWRNfvo1buSe44BX8BURLgABMyKDiJFYg6Drn+tuaKx
	 BBSAvTQ8jgUOxqURL2od7r4MzDSvBFR/RecYMoqQd/Bm2DJqa8BXZUcgTtYN2a2/SE
	 5wuImsHm8xwa5t6GOWlVTg08TLIIwVYjj2x2blsotkck0p3NHgM4SUHTeqU1kDCL4c
	 dgiBeXGh1K7z2ws1P8c23KonazRCb/soeI5c2XHgkAmtODPmHQKGqcsB+6opsWgnya
	 Q3zDXNszgaoG02QrVi+GyBCm8p4XiwpJkgsXqFhNkT5rgMxpOULwjP0xWUfQN3mPrJ
	 SgobQbAtCzegQ==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 24 Sep 2026 10:35:34 +0200
Subject: [PATCH v6 22/23] dmaengine: ste_dma40: Validate fixed physical
 channel indexes
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-dma40-fixes-v6-22-fdb6755020a2@kernel.org>
References: <20260924-dma40-fixes-v6-0-fdb6755020a2@kernel.org>
In-Reply-To: <20260924-dma40-fixes-v6-0-fdb6755020a2@kernel.org>
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
index def2416fb1d0..d65bf6cfea53 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -1918,6 +1918,14 @@ static int d40_validate_conf(struct d40_chan *d40c,
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

