Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476C737C92A;
	Sat, 19 Sep 2026 22:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789856563; cv=none; b=SI9kCfnM/SyAEVE++uSkJj0a6WTabvvIFX2W84o/WpBHH9cbCiJ6HxKzdZbvgKCvuhkUxCdOH1pneiu8mJPXmqa4krTxfWaBUIaoK5fSI91YQdWbC5f+7Vxg36HzqH4N7xrSWja7udCqpmfkC9ihH8Y+qUCrfweHXkkFDhIOrss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789856563; c=relaxed/simple;
	bh=jpSw4KvUJphI5PR2oVsuM0J9bHVBJVZCSzp1+ybUovI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=doD4yO/+2x6Nz4stdkvBM3REXD9uyXCeHbVogyCm6fsZQFID0PIW0ZQUArCeK+P1aFeVlacoEYIyB2DiG1ab5p0Vl8WlP+oAhR4CJBL6IigkxJoUQZ6Jm3tWDY5dqT14SSwZB5mmphS7WoWcf7k7zdMZlusHivItpvz6mfIOK+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gm7Qg/eW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gm7Qg/eW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E16ED1F000FF;
	Sat, 19 Sep 2026 22:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789856562;
	bh=ltfXMTBIrzfTj/h0kODeskYSHtuQaLK4d/hNhV/8KVc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Gm7Qg/eWFNPFAqU3RswZ7BgDvZ0qPHVUjJPijBhq5Ak8b47n8xIudv86rA8egy6pH
	 H0UwOEsJZA/+3SM1NPqWqxmKFSU4Q11FH0iEc00S3ORY/g+GU2NhMzVgXMSOOkNd0P
	 yZZ3sqK7wRqtQPf5zHBpD+xoU0i090pwsPwGoF6tC3ML/lLhsPqZpiiKTAw9ghMIef
	 YWCcrSA7Ekc60cLZr83ZAbWic8hpXauBsN5IWtvbDbIuqYIuZweGEpTUeg91GeqDe8
	 KB6JLGlJA6UZI+g/jX2ksZ4zkx+IqN7HOZThELKX3T+dQi6httSJ0ow7BhYg59NHQn
	 eKDkxMc2HAmPw==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 20 Sep 2026 00:22:25 +0200
Subject: [PATCH v4 14/23] dmaengine: ste_dma40: Put the LCPA SRAM node
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-dma40-fixes-v4-14-d751b2d9c23f@kernel.org>
References: <20260920-dma40-fixes-v4-0-d751b2d9c23f@kernel.org>
In-Reply-To: <20260920-dma40-fixes-v4-0-d751b2d9c23f@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

of_parse_phandle() takes a reference to the LCPA SRAM node, but d40_probe()
does not release it after translating the node into a resource. This leaks
the node reference for the lifetime of the system.

Put the node immediately after of_address_to_resource() so both the success
and error paths release the reference.

Fixes: 5a1a3b9c19dd ("dmaengine: ste_dma40: Get LCPA SRAM from SRAM node")
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index acbd536cbfdd..9baa677278be 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -3744,6 +3744,7 @@ static int __init d40_probe(struct platform_device *pdev)
 	}
 	/* This is no device so read the address directly from the node */
 	ret = of_address_to_resource(np_lcpa, 0, &res_lcpa);
+	of_node_put(np_lcpa);
 	if (ret) {
 		dev_err(dev, "no LCPA SRAM resource\n");
 		goto report_failure;

-- 
2.55.0

