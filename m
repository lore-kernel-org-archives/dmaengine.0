Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E7037C92A;
	Sat, 19 Sep 2026 22:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789856566; cv=none; b=WkShweQdYGW8QY1N/E0nVhjRCul42Gmmqr4f17aCTSA9KoiPe8UjwOZbPQ90zF/JL8KwNv1i6mAAbSvTHafg4D/ViBybw9Chfx+dokXOPZVY5jx0D3Afb+jvkMo/DyBsdqHfnPpQsXMcaBatqKKE9EmSWdaY/kr6WgYtzA+/DgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789856566; c=relaxed/simple;
	bh=em/PQIi86SLliG80/luec67luy7jFfeNaHbrxcZT0k4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OOs77MCDP8QkgVxiiOJKso7+D3jIdU5fVRPwAOG0VG7X3cHNu5p1CHl6sTfOL3sB2NWeE79NAWtPXIheQr28FKEPab5vDNzicJ66DSLTV/PLsL5d76x4brVlXhO6oUmUROKsiQAZHq1XRbfIH8U/Yxn/7OkoeBvVMrM0IaUuB8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mCJLgSNg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mCJLgSNg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DC2A1F00898;
	Sat, 19 Sep 2026 22:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789856565;
	bh=K4h4XzV7KzZi7CQaSDPztPIv3iCbx6syAZ3ifxFNm0w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=mCJLgSNgmFO9UtllwY3K0rzalBTR84/YIN62zA3mGJeDuy7vFOw2NUrgf4MWr52Zp
	 VdItNyIifybZQk5v+8YkeYWTz6USG0gxbH78Holn7/fE4JdPY6TYMGM3xgbqDzmwqx
	 9jvQ4kuMO82cNTFT+93EHxbdHOeyRwO2J1H3tMM7+TZjokrOR1GlHb5Ow13zAY/c+q
	 rO9dVfYjWti7Me5M0UAToKltjKCfZIn95xQT7efFNB2RnP/Iu6DLK+QWk7Nn6u1cKn
	 iq35EpSjAblZisN5VTCecRs0Nvz18SrXI5qjGmjua5LUvwHBKxHwE3lCfVJey7jNnV
	 3dpNBI4X8qm6Q==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 20 Sep 2026 00:22:27 +0200
Subject: [PATCH v4 16/23] dmaengine: ste_dma40: Validate disabled channel
 indexes
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-dma40-fixes-v4-16-d751b2d9c23f@kernel.org>
References: <20260920-dma40-fixes-v4-0-d751b2d9c23f@kernel.org>
In-Reply-To: <20260920-dma40-fixes-v4-0-d751b2d9c23f@kernel.org>
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
index f3a0cdfe2d7e..28e68fbba1a5 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -3390,6 +3390,15 @@ static int __init d40_hw_detect_init(struct platform_device *pdev,
 
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

