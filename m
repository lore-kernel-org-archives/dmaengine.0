Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C335383CF;
	Tue, 22 Sep 2026 23:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790119881; cv=none; b=Bi9oyMgG/MAQZNKuzvfEjVhH2clI32Pdu5/PGivLSZqtn3YfB7DmJ8s3pJO3xe8rSWNX69iq6xvJ6XqIMcXNJzUCQt8Dqb+bZ5DqElJlDsZShnXsN2o6PQjeG5Mp+0dLTPMwH4C5BYgEYchZY8NCYMSYjr7pDQ1U1ZB/pRQVpJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790119881; c=relaxed/simple;
	bh=/D47I/YLn5JUQyWdz2ZJaIxW2nvcEDXq7S2hRW/62vk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mejohJ+K+3umJkTiQxSbDCTejexCES3BHfkvnotnypMk37OkqLRQ3xahTuC+Ds+/fyEAqmfFq9iG1COZKNS60Cci7EpOfDuaNu3E2fSbRjEMjb2Ymni1+1d33IkDzbs6eyDI7c1M2VwNs04QmTsGpccSt7V/sMmty1xJmh4k3pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xx5BKkgA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xx5BKkgA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69B1F1F000FF;
	Tue, 22 Sep 2026 23:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790119879;
	bh=T3CGMs65UgTtSjE5rOTOmynjt2cIKoLVq+SzJmwGzK0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Xx5BKkgAzeyjd1NEISWTf2g/KjiQgrb4Nw3mKecDgI5r4DoltGKwvg/MkqnKwnAPO
	 dst7l5My7rc5E7PKlrnXwoOHylo2gzgewXkZ0WNzeDlQjsQ4P3fFkBKqkcE1pJwua5
	 9jK/wuRfaxBSE0f+FR/F7Icp/vf1fPrr0E/uy36W8F/6ApLHDUbWkw2e0IhUq/y7hJ
	 5ePN2HnlHE9Ws+BUKnRNc27q/j21/QZwW5ZRX2+YGOBMgWTLFLDaujEAQbB3am71Ll
	 xHfbxsN5GI4BpvbkaDlZtDTxIpOT/gUDJf9vrCvl+5eQzJCu0bJZzPF9UMj0+IsDKN
	 iVTwVQW2Bopyw==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 23 Sep 2026 01:31:01 +0200
Subject: [PATCH v5 16/23] dmaengine: ste_dma40: Validate disabled channel
 indexes
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-dma40-fixes-v5-16-709d160cde76@kernel.org>
References: <20260923-dma40-fixes-v5-0-709d160cde76@kernel.org>
In-Reply-To: <20260923-dma40-fixes-v5-0-709d160cde76@kernel.org>
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
index b628f8577e41..b7d228706014 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -3427,6 +3427,15 @@ static int __init d40_hw_detect_init(struct platform_device *pdev,
 
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

