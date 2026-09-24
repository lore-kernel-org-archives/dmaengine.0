Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC22740BCA1;
	Thu, 24 Sep 2026 08:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790238945; cv=none; b=e53MtXNO2KYyFQrvcNpoIew+w/AA718n2DUouYudqv+91+GOusPsGY5XTnTKANZDtczuv54dkyhM5phL7yUuF7oMmXL3WH+3WuSollgqNrUo0rNGcvd7cHE4zf73If5zpTjCI+vGAPOi5FLKkGH4ZOZ6lBJujGO3hWCWVECRj+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790238945; c=relaxed/simple;
	bh=Lt9ZIYYr3TlDUYwtUpf6PMATO6pIibdOxMaJUmOru+4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l2+bJ4q+5jEBtjqGGN5qTh9yPEF8JYeUvwND4jzYEg5KZmOx0PF/S8Wo9tzElWMgbOO5cSYp+MhRcJr8mVlHbw1RdMqFl8AENmHf+XfzyqvSchrtK9Spt/ElygKJLTFh2u5kjtFIFteKl7/EG5e43etZJJab/g71lw/ncfaVnGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EcvPFYYz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EcvPFYYz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABF351F00893;
	Thu, 24 Sep 2026 08:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790238943;
	bh=Hln+lihS1tZIgrOQVJKAGHGMApCGY7zP9TKo0jrhpFo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=EcvPFYYzT0ldo01mwTrdJrkpircXK9ZCVtf/gKGaJGR9FWzcXeRhbutNcgL6+txVw
	 kvNGl/KLq9iuGJr+TtPTcqhn3NkSc61J1yxQaPXr0L9/zdmC+FJci3gUIqy5b43ApD
	 jzlLaqucPH5AHmQmAFmmcPsz4r+/j7eJLvVFhNd/ipV3GtBxJt837qq3NJuoAXIwaz
	 ch7HuG8fHUz+zMNDYEJGItrKw5s6k4b5HPwNRdea6JmOxmai246Py6bpEh6n9h9x5o
	 KMRxLM/ESVCTJlrqOgPWy/aOirrH2/09gzTJw8rUbjeFCYFBv5BYmh5ujdLkglDLlE
	 +VJfI2OdFuRdw==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 24 Sep 2026 10:35:28 +0200
Subject: [PATCH v6 16/23] dmaengine: ste_dma40: Validate disabled channel
 indexes
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-dma40-fixes-v6-16-fdb6755020a2@kernel.org>
References: <20260924-dma40-fixes-v6-0-fdb6755020a2@kernel.org>
In-Reply-To: <20260924-dma40-fixes-v6-0-fdb6755020a2@kernel.org>
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
index 24994e9bfbbb..ed233676e718 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -3422,6 +3422,15 @@ static int __init d40_hw_detect_init(struct platform_device *pdev,
 
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

