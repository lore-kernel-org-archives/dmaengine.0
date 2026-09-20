Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD13F29ACFD;
	Sun, 20 Sep 2026 19:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789930811; cv=none; b=oJeeXnizE+6Fq1IVdTXGVbm9oumcl6DqBnIdAl18mzU1pqcPQ4nHCh8VaZ2ypNwZ6T63Tz6iM4Cgm3Q7Ubxk1PzdVH0LMcZusP7CXM54JmkjfM+RK/rYBxpi6IgKQJQ29xhhvKf2wc3ygtBj389S0TcpN9dE00oveNjT5n5dnPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789930811; c=relaxed/simple;
	bh=f9GXmsG4DQXg+pMhDI7BDJ9JbYZrlN6R0C/Bpo7Y/04=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YYQ8XuBYMwvqXrG87ZdtQv75iTZ09H3zwLSSXisRAE1dKlAktNq48pZ002GWsQM5oXcrI3tCpfGykemR35UnkVESaaUnjuSs/9l6PwrI+/UbZ6iHCmkiXD1sL1ruUqrcoFZUyB1pkqEbbQv4WCXW2j/6ysgjSa7OYlIoxJb7KA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ShB50YeO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ShB50YeO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C9331F00893;
	Sun, 20 Sep 2026 19:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789930810;
	bh=IR9O33ZpjeX+F/Amv0wsmUXcpj01Ficx3yQ7jrfz0TY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ShB50YeOY333dsv7KFE1/Sc7DK1xuD+x+n8aqsuTkAuOME34pm5BPERaC7Uk8XUeJ
	 6TwzVobnFIEALdAIedwZZ8l+3X2sP9fm9psDXcATdMJ2HKVMPaFbWzLm2ZtJaR4Pbu
	 EwshK2bpRONaTc3NTkvXn1NFjAjRqHirNlDU9dvOf36OgHyjDPuCrR3ZxlcOhsFxjA
	 4AmqaJjqoL9CC+q/JiIvzl9KNCyFAXfULp6kAOaoW7dyd3XVSPI4DFMwztQjBMZJxR
	 XeLawYuKQWKjB/ukLyxP1pzY07tjJ8cVQd4j2EdPbT1x12bmKtGYfzxv71Yy+1wnKm
	 jyAYF7cR8K71A==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 20 Sep 2026 20:59:51 +0200
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
Message-Id: <20260920-dma40-fixes-v5-16-5c55cd7f92f9@kernel.org>
References: <20260920-dma40-fixes-v5-0-5c55cd7f92f9@kernel.org>
In-Reply-To: <20260920-dma40-fixes-v5-0-5c55cd7f92f9@kernel.org>
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
index 48dccd432ff4..8ae236d8270f 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -3413,6 +3413,15 @@ static int __init d40_hw_detect_init(struct platform_device *pdev,
 
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

