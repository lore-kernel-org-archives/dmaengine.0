Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BE736EAA4;
	Sun, 27 Sep 2026 09:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790499830; cv=none; b=CFYohTOWzYSc8iINeidsFeE7yEuT/3bdziqdDRykIWunkiALt28vgT3VFmRFm7dRHx3QqJipMT7RKiLD0oOmEKGuEvFzUhuLRTUBca+d6N8hPX1mtCi9FxxKt1xdJsJMuh8aJtzX40DiOM+0kCW5Xymeyc9B6jadNuPGAe5T63o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790499830; c=relaxed/simple;
	bh=3/KM2Iv5Qo4HIbSNkQd3oPsrXN9mNuLyi1UCDA4dSU8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nKzlBeX+6xYJO0lHA2qXpJOY4LFri9rNJ6AUpBi5sZZqWblU+vxu7Vd3FJVaQ2EgbddZIpPq3u2hM1sl5pRpqjoHrb1OCBeyn9rw0gB3lNR7VpgQuDgqe+osmnEhJLpWYKFTlDJh9X3XBZpv1akg63ByEyKCtWiUhr3XJIjfyYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WaD4SoN/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WaD4SoN/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05C091F00893;
	Sun, 27 Sep 2026 09:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790499829;
	bh=g2VL/fOzVA/PmswDVVzKPN4Z5tTbVLKCVOcP1ZpXI7c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=WaD4SoN/FFGJLS0oqEnP1DNzF1lpmmQedrjGvaWgFQ34w5bMT0RrfXG+j2qyt3zD7
	 Dvar4j7q4Mses8DQDNgL8tUkfOBMJY5zLaHzT5o+DLh1/p8MRbT5lBxlbPSGG0hAvt
	 bCujITVHZ54fl3xZXRbP/F50UIFasIgUZQZQrWrkH2yTptKii++E6OwU0OonFh+ibo
	 JRrcp99+dGCCx0z49x+FuPWfe+U3VC0hO25WNBUhz2CXz6Om2W45gf8coQnoQkdfac
	 MUfor7+9vPpm0fU0tNfw37DzthEIuuyNPF1iXQroqLaLukx9fM8epZ6S/MhDZZfUIF
	 mIbcKDAci0yYA==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 27 Sep 2026 11:03:27 +0200
Subject: [PATCH v7 14/24] dmaengine: ste_dma40: Put the LCPA SRAM node
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-dma40-fixes-v7-14-89f595e8851d@kernel.org>
References: <20260927-dma40-fixes-v7-0-89f595e8851d@kernel.org>
In-Reply-To: <20260927-dma40-fixes-v7-0-89f595e8851d@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.3

of_parse_phandle() takes a reference to the LCPA SRAM node, but d40_probe()
does not release it after translating the node into a resource. This leaks
the node reference for the lifetime of the system.

Put the node immediately after of_address_to_resource() so both the success
and error paths release the reference.

Fixes: 5a1a3b9c19dd ("dmaengine: ste_dma40: Get LCPA SRAM from SRAM node")
Assisted-by: LLM
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index e3756d8edc61..70f2a6594945 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -3771,6 +3771,7 @@ static int __init d40_probe(struct platform_device *pdev)
 	}
 	/* This is no device so read the address directly from the node */
 	ret = of_address_to_resource(np_lcpa, 0, &res_lcpa);
+	of_node_put(np_lcpa);
 	if (ret) {
 		dev_err(dev, "no LCPA SRAM resource\n");
 		goto report_failure;

-- 
2.55.0

