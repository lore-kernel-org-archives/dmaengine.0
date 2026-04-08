Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8529F3C73E1;
	Wed,  8 Apr 2026 12:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775652112; cv=none; b=FUJHOMmMZoGvpUHbM383UWSozbz0u55GnPgsKdToRjCzZlMNZaVThItIDj4fQqRXkY6VX/eidCGcD90Im6ao2/KExgtgvcTJTneXox9GAm3XDQkekqBj2G9ZwaUrj9BTZ8j4cGkZeEFanIf3QXN1vyejeR8KqRDD+FqRSI4rCvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775652112; c=relaxed/simple;
	bh=X/lDO35rL1/Tn3k7QCVW9Udcj73gwaYAAXSPhJt5y1I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oHsN5E8LQapOCogSTrrs6GpOsSLHVm8Be4eKk8UAF7+OAcYp+0VzcrDIamFLeIdz+AND6Jcq6568DYwn1DB10+qQcqgJGePxBvm5/pjnIrmRwV3SZRpXdJNRvEWD++/DVRkeHEOASPA4QJBPa2mbSSwpdkkzgWTvBNvj3moNJEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CTWvMB9V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CTWvMB9V"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0EDA7C2BCB2;
	Wed,  8 Apr 2026 12:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775652112;
	bh=X/lDO35rL1/Tn3k7QCVW9Udcj73gwaYAAXSPhJt5y1I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=CTWvMB9VJdq9Hn5HWkdVvLsRRo1iq51xez2hahtMdPTHQ0Ih1NOefxfl2cuWK2/Eo
	 jbv7XPNZrXjlSiTAqpALyf4Csgbx8m8VB6oiv5OofCDD/kcjrWwom3geqptRz3kXbL
	 t7lWlVVocAscJefO28P9s26JRDAVri+IDhqrRl8hvXvted5mGze16slJ92uhsqYwNi
	 YJROnxKKy/P39ik28qzd/mGZDbWIhcF/TXEWrdc8eOGJcw+XZ60ecny0gRykqbFUpE
	 xV8W1xi9JYM+JqN7jd/QwqpTjkBpy8J/VdUOAen2QEQmEPgdojLV9y45+7uorUd33h
	 8VjUkaqKAg3Cg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 012431073CAD;
	Wed,  8 Apr 2026 12:41:52 +0000 (UTC)
From: =?utf-8?q?Nuno_S=C3=A1_via_B4_Relay?= <devnull+nuno.sa.analog.com@kernel.org>
Date: Wed, 08 Apr 2026 13:42:42 +0100
Subject: [PATCH v3 3/4] dmaengine: dma-axi-dmac: Drop struct clk from main
 struct
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260408-dma-dmac-handle-vunmap-v3-3-2456ad292154@analog.com>
References: <20260408-dma-dmac-handle-vunmap-v3-0-2456ad292154@analog.com>
In-Reply-To: <20260408-dma-dmac-handle-vunmap-v3-0-2456ad292154@analog.com>
To: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775652161; l=1271;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=QvJ5ia4JnsZhnq/kgtM2oBkAf3EjDDkcD8ZAMJui6c0=;
 b=VDVFL1nBPgidACu/Oxb7bKfwAFlRGTnHyQQTbmPz3w+FqQ3LJqFiZ9vT2jAI9qrJHTy0nsABH
 YIUgLcKB2CMD7LXdskLMQ38jX4EIoAyAfouFDwzge5o3xUbQ0hGKq68
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-Endpoint-Received: by B4 Relay for nuno.sa@analog.com/20231116 with
 auth_id=100
X-Original-From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Reply-To: nuno.sa@analog.com

From: Nuno Sá <nuno.sa@analog.com>

There's no reason to keep struct clk in struct axi_dmac. Hence, use a
local clk variable in .probe() and be done with it.

Signed-off-by: Nuno Sá <nuno.sa@analog.com>
---
 drivers/dma/dma-axi-dmac.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/dma-axi-dmac.c b/drivers/dma/dma-axi-dmac.c
index 127c3cf80a0e..41898d594be7 100644
--- a/drivers/dma/dma-axi-dmac.c
+++ b/drivers/dma/dma-axi-dmac.c
@@ -170,8 +170,6 @@ struct axi_dmac {
 	void __iomem *base;
 	int irq;
 
-	struct clk *clk;
-
 	struct dma_device dma_dev;
 	struct axi_dmac_chan chan;
 };
@@ -1198,6 +1196,7 @@ static int axi_dmac_probe(struct platform_device *pdev)
 {
 	struct dma_device *dma_dev;
 	struct axi_dmac *dmac;
+	struct clk *clk;
 	struct regmap *regmap;
 	unsigned int version;
 	u32 irq_mask = 0;
@@ -1217,9 +1216,9 @@ static int axi_dmac_probe(struct platform_device *pdev)
 	if (IS_ERR(dmac->base))
 		return PTR_ERR(dmac->base);
 
-	dmac->clk = devm_clk_get_enabled(&pdev->dev, NULL);
-	if (IS_ERR(dmac->clk))
-		return PTR_ERR(dmac->clk);
+	clk = devm_clk_get_enabled(&pdev->dev, NULL);
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
 
 	version = axi_dmac_read(dmac, ADI_AXI_REG_VERSION);
 

-- 
2.53.0


