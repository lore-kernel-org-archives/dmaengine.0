Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE545383D7;
	Tue, 22 Sep 2026 23:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790119877; cv=none; b=sRfooeFW2V5zqmpvHxpglnsFftWd8sYpJMt6G3g/dKkSybfnFPSXRpgTG4TtbXBTBqf7sDXviT9QDwRUMHpmyul+TgoNh8d9CX1BvTXBhfS/fGDqQGGSX4Q2cvzUVenAxEQSZ5fGPsDRi5xGx5oMBgSUxmx33h9+igZD9LoQ/rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790119877; c=relaxed/simple;
	bh=btMQWFOd3KOvlvbyxaoeGzsI8EnK71CiebMXSo+70Zg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aP+hldMkmHjkWUtj7Y6AeN4ZM59sNnG7O4DbxuVnUy1o+Lzn0+lqhrZjhZgBoJ8lZyB+jKySQbcHpm7ufbvgXe929hLxplSw6uimCWG0ZImh5/5+XaTuYHDtTICNahJ92uq/2T1wecPW/nEBjCg6M5PmGCKpfDC0jhQXGMuE31I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IT+YUjiS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IT+YUjiS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F6A51F000FF;
	Tue, 22 Sep 2026 23:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790119876;
	bh=8JbQBE6ApjUOrH/PANq8XIdbzKItjx+Ap0UXh9YCXMw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=IT+YUjiSQiyoZG6k/fFNwB25JDP2tME4pKtMHzODJzoFNYVrZd0ionwUevQpnec55
	 6DlwYEPRtXVvycIctUMuQL903ZKgYIC6X4CL9wUf+cMV3llkacMtRHEWlCWnYeNDFw
	 kPIjLR3ppyKfK37BzUptqkahWkYcxZ7hyMN0Z5tH2aOszIoacYSmF4ze7W1JJqrIE+
	 bYcX+sidTaigWaG4pU11DsYXBOAUGS1vQ9ZI8aYW4KA7mdFbG4AyV95WHj6gyX++91
	 IL6BT/akh007rEBeAhwZPEne2OD9tTBOrqJVOjc3iYL7RyaJlED+5Ray7GC2yByuK2
	 ebsGXQi3MFFPg==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 23 Sep 2026 01:30:59 +0200
Subject: [PATCH v5 14/23] dmaengine: ste_dma40: Put the LCPA SRAM node
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-dma40-fixes-v5-14-709d160cde76@kernel.org>
References: <20260923-dma40-fixes-v5-0-709d160cde76@kernel.org>
In-Reply-To: <20260923-dma40-fixes-v5-0-709d160cde76@kernel.org>
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
index 8b2cd0d2dda1..fcb0eebbc12e 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -3781,6 +3781,7 @@ static int __init d40_probe(struct platform_device *pdev)
 	}
 	/* This is no device so read the address directly from the node */
 	ret = of_address_to_resource(np_lcpa, 0, &res_lcpa);
+	of_node_put(np_lcpa);
 	if (ret) {
 		dev_err(dev, "no LCPA SRAM resource\n");
 		goto report_failure;

-- 
2.55.0

