Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3FA503908;
	Fri, 18 Sep 2026 16:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789748692; cv=none; b=UBDsjn/eUdkn6qSJMmod4vWFnt2ASduatktfy9ZZYWQPg7lLuldl+OTz1LCSm3EbCwPhU+owKm+ZiUiRZ0I8Z7Fb2Owna4PUc00/9xPOifjNTzYmr9xmy4cb86dPVuQ/7KcqaFhafBLbqA1Nig2eptk97PZOxFjGvjFC0FyK98c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789748692; c=relaxed/simple;
	bh=v2EOLTFfeA8k6yqbtlb6hAvN4UvDMlhC2aLAdKhwabA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IAAG6KtUZWgVxY1wXUZVyVjhitxkPx5cmZoXfO81IPU4Lc2jmtaFRrqdOOaFHlZ+Q8eaSl6AjyScZqMcS17T59VBFP3g3iZ/ZqX+2/1SjSpfWatgmLRpOxS0vu3DpZ5GyIVoLvsv7INDVXwGqzip6yoQNUrWtPCr/p8M0VV8UPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XJ1G0xN6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XJ1G0xN6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4277F1F000FF;
	Fri, 18 Sep 2026 16:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789748690;
	bh=PK3RN0qjafLxz/7L3a7owf38c/JZMJpaVg4fKXKpcqo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=XJ1G0xN6T0v/wCNHLtiLknk5w03IzDsWij5sPNad8LUmD7STYL7nJBuk8dfoImPrg
	 Wmqb6dw7Z5qku/10lNX5MdwUsvcGeUe3ZCYrfWCjcQm5uiKsKGTbyV2Jq8BHFoMzVd
	 DHa8SJSYF4l/GrNJAmveI9JLsA32JCoJbZk9mDRk1FqM6loGaHXVpAXei3A2aMEGBX
	 6s2CM9ETloSctMEQNjK2o1ZMlfF6QWKzW7ip7jXvCT0R3y3GD4JrOnl4/q4G4YQkQq
	 g9vKuW5eYfsuNvsTGTmwS2irVSqkGmAIzq7JbkTuIChhYReR3B56jxDfTDP7CItGfs
	 NBKj+FU1KqROQ==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 18 Sep 2026 18:24:32 +0200
Subject: [PATCH v3 13/22] dmaengine: ste_dma40: Put the LCPA SRAM node
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-dma40-fixes-v3-13-8dd8450669e8@kernel.org>
References: <20260918-dma40-fixes-v3-0-8dd8450669e8@kernel.org>
In-Reply-To: <20260918-dma40-fixes-v3-0-8dd8450669e8@kernel.org>
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
index 104447f7080e..557b9620c488 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -3632,6 +3632,7 @@ static int __init d40_probe(struct platform_device *pdev)
 	}
 	/* This is no device so read the address directly from the node */
 	ret = of_address_to_resource(np_lcpa, 0, &res_lcpa);
+	of_node_put(np_lcpa);
 	if (ret) {
 		dev_err(dev, "no LCPA SRAM resource\n");
 		goto report_failure;

-- 
2.55.0

