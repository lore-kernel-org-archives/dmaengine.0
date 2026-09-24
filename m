Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0952348C4B;
	Thu, 24 Sep 2026 08:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790238943; cv=none; b=rdn1lw2PZZD4PaNNuZeXJBccweeStazsah+1aloLMwojItvzjAUS899HgNmxf5Qj+Hm0ayhB5Cz3vcLpgt6+7ddlfvk39MI0c4BwAkDoh7C5fkbpQRYx4HYVFu06epB3x+c75QmD6m0O+v5Vkt/ThSBmgAABzO/KfRnww48Q3Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790238943; c=relaxed/simple;
	bh=9epaYxzJgM8JZu0r3Mz++/XaZ0eTGhkexSXDgZAYIfs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cmSoWbUI7PY7/NfFcBi/oIjcacA4XNH5YPYNddWd9jWZXU6ISPxGIhrHC0cj1D7wqRDlLoAaKjnG0cfl79UyGd4B9mkODKF9HytShQ/nkgc2brF1Uol8fxftKrautooHy6Z2O+1mh6a13poOyjFACZn9+5Vp6wWdH2J8F9Md5H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=exp/ylh2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="exp/ylh2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 865F01F000FF;
	Thu, 24 Sep 2026 08:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790238940;
	bh=N+PmdzHw5oerRZTEHuVkBUXt+WvnpLsgkAlJ3Voa2t4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=exp/ylh2F6ZCYIkJd8yhFOxiC23hlixZTnYGWFLPfEVAH/t7u+RRiri6SJsY1oTSi
	 oQ7xin5KRJU55g7aYcwlE4aXYiY6HH0/gGH+H2yntqlc/lXcE9VbwNPBJjmiPKgxEP
	 71Uo04CkMenoyTReccHy0Fs1u+brYrKQwwiDDC0Wkm7pElFGLfXJzazp3tOd/gLI50
	 rVZ7yYI61VkrzYxZ6/+vDaUYxgxhHsoLAojyHhwxj13BKA0NXm6FtEe07tgFPXBLcA
	 snvhYGfzjIO3D2FUnklRpvWwEtOyMXB/YJSZv5SHbKPgZmgq9Qm6O5MU/kGYhLpDjg
	 9WJ/mwr+IP0PA==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 24 Sep 2026 10:35:26 +0200
Subject: [PATCH v6 14/23] dmaengine: ste_dma40: Put the LCPA SRAM node
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-dma40-fixes-v6-14-fdb6755020a2@kernel.org>
References: <20260924-dma40-fixes-v6-0-fdb6755020a2@kernel.org>
In-Reply-To: <20260924-dma40-fixes-v6-0-fdb6755020a2@kernel.org>
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
index b25e9ed5fcb9..6599104ecdde 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -3775,6 +3775,7 @@ static int __init d40_probe(struct platform_device *pdev)
 	}
 	/* This is no device so read the address directly from the node */
 	ret = of_address_to_resource(np_lcpa, 0, &res_lcpa);
+	of_node_put(np_lcpa);
 	if (ret) {
 		dev_err(dev, "no LCPA SRAM resource\n");
 		goto report_failure;

-- 
2.55.0

