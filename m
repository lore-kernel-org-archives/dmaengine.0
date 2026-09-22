Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F83D5383ED;
	Tue, 22 Sep 2026 23:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790119892; cv=none; b=d2nIpuBeu32ATQLyfnvHyhwBLfxqSGRcw9+rWB9eGx2OIdYphjQ4+jIuY9e/IrQ1daoHWgsoqpHxIiLc3K5F4vPEzLwSbXLrw7MlMRagRWr0w3VFZWOWpU1+Lb6CEtVF4dZ/Lc04O0bOyStRTBF1IpvV9TWBpt6aKzWUPu7gzEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790119892; c=relaxed/simple;
	bh=v7OFLCKnKvAn0iaFKvfGn5DApzbC1i2FDVf9bL6D6Lk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pHHTIP6VuHjmydNDDTgzmB+lQw2UOOyOlvzIYSj0mxlosAO9ijVTaHE5RyETtMYuYmbQoOdGjQwioSf+iTXz07bId34/TpxJzMoP91sM6QPQ65oeIzwLNPNG1d/vkoyOFwyBMYMafvdPh/E+j1WonWducvz4h+7Agu+vfQMC7Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QYPZLCAO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QYPZLCAO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2BB21F00898;
	Tue, 22 Sep 2026 23:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790119888;
	bh=YLajMWBQaRBXHtqw06tP02v6B0dS+AnwROC6aY8XR6g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=QYPZLCAObBVcKHUopcYA+/MeTouQosXD2iyFgw/q9iMBpbNobjN7hVqv+Y8HEbYCv
	 gJawSYw8cKtvRjUMg36Cs7nkUt579D4cgn460giQBkEaZLSu83A5dzB7MNb4GbDBgC
	 nV3/MXjGiXjcxcPahm7sMAKGx1NUvyMJOHz52vefSLrvZef8GP1uv+GNkreDN749Hv
	 FdscEfZVGXi5O1234KyrbzRfVHUAAHxM1XVp7JvqEDmmiFT3SV4W5vzVR5mJoRrQVW
	 sPdysWJ66u/DQ0Q9IjMUBhisWCiLT1BvY9c3nxTiq+z9vXi/TTKbHRbfU+xg9XYzdT
	 TYFJJVpe/+tOg==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 23 Sep 2026 01:31:06 +0200
Subject: [PATCH v5 21/23] dmaengine: ste_dma40: Search all blocks for fixed
 logical channels
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-dma40-fixes-v5-21-709d160cde76@kernel.org>
References: <20260923-dma40-fixes-v5-0-709d160cde76@kernel.org>
In-Reply-To: <20260923-dma40-fixes-v5-0-709d160cde76@kernel.org>
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
index 9ba5e57a9923..e0f3f4ac0e3a 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -2111,11 +2111,8 @@ static int d40_allocate_channel(struct d40_chan *d40c, bool *first_phy_user)
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

