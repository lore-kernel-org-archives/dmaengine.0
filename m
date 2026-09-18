Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF554E80B4;
	Fri, 18 Sep 2026 16:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789748695; cv=none; b=k3JL2ui4aBNJbs76OVUFpxYiif1Oa4k0maAx96x8Oblcua2hELN8GYY1vuAsfJf9TriweacP7YY3roXR+LQa7YZ1M8Sw+yhunm9h9075HeFf9/ktuC6jhJpJgYCEUwTaNBY7xvFj/Kx4K7mUU+EjJx2XTY1/hp9bFqhH+ycYvUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789748695; c=relaxed/simple;
	bh=rC0cqFFxjf6JrEHtE0wwzoCTU9Zvxi1Fj6OdKdtFlgU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kL+mf1JfNLEu9DHBa9MjRqTwpvnZdl0ENILYVi1prM0XAt7j6+WAr+g2h1YRSwe7UP3AEaKnMSJr9x49SSd+WmjiMYHUw2kAOBMW/JKs5aCVXYI98P2vjiXD4dvmKDL+DacjD1yrKJmOmz2wOHFmGCMwQ0wP2byDJRtnqTetMUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G/pYbIlQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G/pYbIlQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93A881F0089A;
	Fri, 18 Sep 2026 16:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789748693;
	bh=Kkk0cS/AA4NY5ZBt7UlXUYSYYr9k4NC8p7ki+Ja268E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=G/pYbIlQ0L6ZCwJWnYi24kGqojr1fIMfKXn7XeTU/Zkt2I4LlwUEsTftdBlWwdfre
	 7yYU5B3W6SeSuarteuFhUaF0Tm3A+Vku4PJVFGhLCMMRjCf4i8PoOvkTxdRrkokzwC
	 z7rIHsdF0orplbn0qi9JqbbmFqGAnsVLZNpO0uARDERmi2yxhVNmakt8Mvw+Wr6jLM
	 3/hCyMFtID+x88/LXLwB9tBieqVyU/5yO5jYK6x7lOiqSD3oaEq43bnEsOf4ZRhW5c
	 u/iaFOuYZB2zDlcij2cWA3SIM2+YWuIA0tiaefnyvqPEntGa2OPCmAfkrS2hTTaYNq
	 P7d6fOy6tP3gQ==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 18 Sep 2026 18:24:34 +0200
Subject: [PATCH v3 15/22] dmaengine: ste_dma40: Validate disabled channel
 indexes
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-dma40-fixes-v3-15-8dd8450669e8@kernel.org>
References: <20260918-dma40-fixes-v3-0-8dd8450669e8@kernel.org>
In-Reply-To: <20260918-dma40-fixes-v3-0-8dd8450669e8@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

d40_of_probe() checks how many entries disabled-channels contains, but not
the channel numbers themselves. d40_phy_res_init() later uses every value
as an index into base->phy_res, whose size is the number of channels found
in this DMA40 instance. An out-of-range value can therefore write beyond
the allocation.

Validate each disabled channel against the detected hardware channel count
before allocating and initializing the channel resources.

Fixes: 499c2bc3cc89 ("dmaengine: ste_dma40: Fetch disabled channels from DT")
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index a53155b1fe1f..6a76e7d8ebd7 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -3278,6 +3278,15 @@ static int __init d40_hw_detect_init(struct platform_device *pdev,
 
 	num_phy_chans = min(num_phy_chans, STEDMA40_MAX_PHYS);
 
+	for (i = 0; plat_data->disabled_channels[i] != -1; i++) {
+		int chan = plat_data->disabled_channels[i];
+
+		if (chan < 0 || chan >= num_phy_chans) {
+			dev_err(dev, "Invalid disabled channel %d\n", chan);
+			return -EINVAL;
+		}
+	}
+
 	/* The number of channels used for memcpy */
 	num_memcpy_chans = plat_data->num_of_memcpy_chans;
 	num_log_chans = num_phy_chans * D40_MAX_LOG_CHAN_PER_PHY;

-- 
2.55.0

