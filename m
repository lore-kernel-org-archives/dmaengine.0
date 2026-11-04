Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793807217;
	b=aPTRs63OMy2gVgDgz7MNe4GwLHqj0peaf0l+zKBwZd2woleh3MBXRkupjeP2KzdIwncR
	 X2RrwD9tnn1WOGKQp0nm8+2zw3+bmhvxLgZlLYyhiYqQCEDh3xz5RJBFQzHy9B9siuxge
	 4fNgyo5vS6snzNJ9HXwIuiGLzWbyXFTqVf/I7iSrfl6Qe6zinkjIP+CemkMkm4qxxbPiH
	 Vr3fXdb5MFUGSjMBteqyce6LLU8y5S8eadtSr6PvUoHQkEt+fV/J9+YnLHO6iS46JDE0t
	 npid36FHiwv1nwAuubOoMJ4Cd4sds6bbWSFAe88KXDo8vFcj2Zxbb4r5Vw1gSU91T9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793807217;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4ZtoVpi1gN7tNnAF3gZlJ/8Uzhv/+0rBLH8eXepcNcg=;
	b=a5Q2o/crIIqanJxEeZQccMcdWglAWQiWbdkSO9bOaKNsPbxTKdu5CzFBqW+RV+LSz6Em
	 k9PptjNoPlKzlUrgU6HSLecoH2T2ZWTrRURJk3+s/RLuM2lnQ0R771eYAhmmgZjv7hAqL
	 FL8RzQRViagQZs4aLB+xSOvIQAGG4o0rond6LSAJzVT+ZYdYA6e7x/7/bOcVkirXxdY7n
	 r5P280V4jE8GYz5mrnpEeIam6OcWJab4MbOwS0z1BkjiFpCmFRxyJ0qeCfJk5Mg6CD/d+
	 HQdffVbGHIa2Jt8g74Uv4omTWJKYhlDdNoCsLOGHLeuwmzmSlCbhabOGscVTSs0bRDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qg5M8x7p;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35E6606A331
	for <dmaengine@vger.kernel.org>; Wed,  4 Nov 2026 15:46:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A35E6606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qg5M8x7p
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8a05b210703so508544b3a.0
        for <dmaengine@vger.kernel.org>; Wed, 04 Nov 2026 07:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793807216; x=1794412016; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4ZtoVpi1gN7tNnAF3gZlJ/8Uzhv/+0rBLH8eXepcNcg=;
        b=qg5M8x7pKnkEWIRPnSieYl/u6skDGtffHNW0BCOLkfSheL/FIhnfd5TXZgkZ3zxbLb
         QUIUuKHni0Y7AyHBo+hlmYDD/KrJCeH0uIcpaOjPvM+J8EA2Kx8ydkL0dj2SQH2jRzLk
         c5JgIswVk0CF0cYqet0z9Z6SLR+fXIXzWAQC5fyr6+A0QsLyI3nUv6N6YZHwiSUPRizY
         AdTLMeaQVcwIdmmndzD0b2GPcbEnwbz5u1Ad3u/E7aPXrWD7deKDSkvw+Xe68okvsQkX
         kPOJBC3YZ5WDaSPpe3SDQ7l+QeLPq8l7e/dylczhCRawdkp8/EilC8tX+VwnaA5Ngral
         BzHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793807216; x=1794412016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4ZtoVpi1gN7tNnAF3gZlJ/8Uzhv/+0rBLH8eXepcNcg=;
        b=THd0+Ov+htzgjBdRirGisnKVkO05pOUdkyC8v9aP6KveyPJZEj9ek3pLl5E4LE4MWf
         sZA+zoqE5J9aS0BXHiaMF+ZbwI0d8Q5kDSl/8rJ1zntjP78nNV5MUnCYugjwhC+xEGLp
         jvV5P+gL95z0Q1VqbaK6lvMaa9gb9rlLgS/Yo9gQfj7YJRLnIZjLAwvVUFOvkINV2H04
         fQo7ij757GEpC2SmlB38AKChupX+htPJq0jS8MbNZJg3/Rt8+wHRaNHauYjRurNvPLTf
         GFBMU0ZQJ93GjH26PFKEutE2Pgl07WySMgBx3rUOyTcs9ugpV14rroAYaJnM/PS3x91D
         lQFA==
X-Gm-Message-State: APuU4Z9hOnURHT6Qe1Xqf8NQAiZ67W57wwsn5FFqLkFnJIPXid2Bjabi
	egwNY3N527nzYM077HCkFjK5vFtAow8YoTY6X3XzWK74bagS+UI0zYI+HdZUIw==
X-Gm-Gg: AYBFou2ThzlqExa1dltLIeH6OK1fuQPwBiESXw3RKvt60cOfHlwOIZQsmes6QSFFFp8
	y28owfmVjiiN6AoEoH2S/6RcXz3MPx2J7n8rAIs3dALMHi8horix9hQRX5Rs25fwQevR9noW2MJ
	Yo0kW1m/8X9ELBYQCFEg7rX2AHeP2PjxvybGXBCD+zk3wmaEddRiMav9oq0nvUCWCsL9eUDhcVH
	gqhAYVGEVYu/YSiQhy3mUg9hO/HIvG4aldsBXm7QLK1R8SDn0Eyhu6HA70HwdveMtn86XaZUBXz
	/Y70AL3ML2wNd6wx9/Uuq1KicFPcshhWYI9FIegBCsJScir34SzlvEGNZuK0KxiLToSdB4Fcfam
	MctMigJhD6forbCvp/wNJNVpX/09YNn5boejYR3yDE8I0YhCoZt7LBAQgOaNKqAkVLEVKbtjedU
	7zAJ3AanaPlNfWCVX2Lf1uFXMeyrogokNeAb9mNSIWsgz7xMuIMHTFSp7VBMwAV0V7QI9MXK0qO
	hkyg2YzYpLze7XHCVFauko9oHy2pqeIpC5qRd7ZqpFggiz+RcNZQYd2IS/uoAbqDODf9Pc8vpG4
	htJ5tmjXBbeqndAf+sJwn5cbhtnmhUbzSpnywwtBTS3aW7vX3SV6
X-Received: by 2002:a05:6a20:6a2a:b0:3e2:b448:ad49 with SMTP id adf61e73a8af0-3e929025a77mr14264569637.68.1793807215744;
        Wed, 04 Nov 2026 07:46:55 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:28::4:396])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb4694a0e0sm1372632a12.20.2026.11.04.07.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:46:55 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: dmaengine@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dmaengine: pl08x: Release the reset before reading registers
Date: Wed,  4 Nov 2026 23:45:38 +0800
Message-ID: <20261104154542.3131916-2-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104154542.3131916-1-mmyangfl@gmail.com>
References: <20261104154542.3131916-1-mmyangfl@gmail.com>
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

amba_read_periphid() happens to release the reset. A node that carries
arm,primecell-periphid never reaches it. Release the reset ourselves.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/dma/amba-pl08x.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/dma/amba-pl08x.c b/drivers/dma/amba-pl08x.c
index 543c2eb8cfa8..33ad6c42cd7f 100644
--- a/drivers/dma/amba-pl08x.c
+++ b/drivers/dma/amba-pl08x.c
@@ -75,6 +75,7 @@
 #include <linux/of.h>
 #include <linux/of_dma.h>
 #include <linux/pm_runtime.h>
+#include <linux/reset.h>
 #include <linux/seq_file.h>
 #include <linux/slab.h>
 #include <linux/amba/pl080.h>
@@ -2695,6 +2696,7 @@ static int pl08x_probe(struct amba_device *adev, const struct amba_id *id)
 	struct pl08x_driver_data *pl08x;
 	struct vendor_data *vd = id->data;
 	struct device_node *np = adev->dev.of_node;
+	struct reset_control *rst;
 	u32 tsfr_size;
 	int ret = 0;
 	int i;
@@ -2725,6 +2727,16 @@ static int pl08x_probe(struct amba_device *adev, const struct amba_id *id)
 		goto out_no_ioremap;
 	}
 
+	/* Release the reset before reading registers */
+	rst = devm_reset_control_get_optional_exclusive(&adev->dev, NULL);
+	if (IS_ERR(rst)) {
+		ret = PTR_ERR(rst);
+		goto out_no_ioremap;
+	}
+	ret = reset_control_deassert(rst);
+	if (ret)
+		goto out_no_ioremap;
+
 	if (vd->ftdmac020) {
 		u32 val;
 
-- 
2.53.0

