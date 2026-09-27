Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D72A385D82;
	Sun, 27 Sep 2026 09:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790499834; cv=none; b=dfutDKDwIMaZXBpUylm9J0ubc9eDmHS81UZhvOAox5vmZ6fMRCqIE+7pbpByOOb2BQwbKVSH5gJSukXGpszsgcyaHmWs82fVHiNptciUczwEnmMZ3kmNJLlVHh4Lz7VRn8rkzRvngiX1trlAgK+M56+Ou7BLSwl1PLSKImgBKl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790499834; c=relaxed/simple;
	bh=u+O8Tsh727T8oK7dDNwu3/yZt5clHRqJVWOPKq7iC2Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AZ+Zs+tnSuCNU2CmqR1gdWrmgFM9nGQJCwf8xbpdcMYFZXm/Uw18mPBdEW1L+fDHhBPteNpoHS/F9R9V3gA5UVCwKCpC7z6a6L1o1Rf6JJhWLurq5VnJoIdfEoQI0ZbU/MunjA0ZpJHWLymuiLH3cxDC8Gv8Gk4wGXCpd+RPnP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WpJ/ed8d; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WpJ/ed8d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE6691F00893;
	Sun, 27 Sep 2026 09:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790499833;
	bh=NBo7XeCtcdPzIpxYYXgoB8KFiM5azu2zMV5vXzhwyOY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=WpJ/ed8dHQoQig2HNeVZP+kYUDkMnlcYKmej6pdwi6uHHDGkA1qiNkw4hV0jT3vrP
	 QyCIXTVMFQhSULpkLNzvDICVKPP3jfYSGhtcYTZ1BoEY20N+ZVi8G36IogB3oBixgT
	 YkjACjojtIZsbD/YCfSvYnRgLS9lJTLZCfgH7kiIXK0EDCEowfrC+i/HyBzyJUxjit
	 77fqZQSo/xBj0p0ViSbfJZyY5nuBEteFNDvv0hDmA14Nuy5Nuys56+3jaljenooWGW
	 H3JGwLyiY8hfe+QkCIViF0ed9+uIQhta9qFGB9pz5FoN2+idLjh2TKcOac7XK9C7Bm
	 8bAlccYuIs4hA==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 27 Sep 2026 11:03:29 +0200
Subject: [PATCH v7 16/24] dmaengine: ste_dma40: Validate disabled channel
 indexes
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-dma40-fixes-v7-16-89f595e8851d@kernel.org>
References: <20260927-dma40-fixes-v7-0-89f595e8851d@kernel.org>
In-Reply-To: <20260927-dma40-fixes-v7-0-89f595e8851d@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, Frank Li <Frank.Li@nxp.com>
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 43a6ded6aa09..32dd63a2c27a 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -3419,6 +3419,15 @@ static int __init d40_hw_detect_init(struct platform_device *pdev,
 
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

