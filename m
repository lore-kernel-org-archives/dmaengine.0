Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C7C480DCC
	for <dmaengine@vger.kernel.org>; Wed,  9 Sep 2026 09:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788946868; cv=none; b=G0+63s5ETGgWRXpFPWmSPT6R38z2oTpwHnouGlhp+Ev03TuKvgCZs9TCuZTN1tIMNMHoM4D48KS5bJasYfG14G6JVsoU/PCmlZC7thZli7ZoEJAUMAYTHnBDYGmlR2SDm30j3YBx8o+8jzipwkWSqO6bgpYc+8XOjSiw+wig58Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788946868; c=relaxed/simple;
	bh=Z5ZpANA8LdJ+eEXBYf1SzNMgEsbFE04byQJV8epJFas=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JBDBHKwYuCrRxR1pOZd4ATA04TK1ufIrTRX3oZphsPbV1e2WWO57Vs6cW1paDC9Yt/xaDJboNBM2oYA4qMsxBytbdfFqF4/uVLt/cstEpPiHn1RGD/E1qT55dskE1Yjv/bcsODgbx6e+zvW3mA0FcmleoUcIBZHbrmlyQFNxSxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=WJye3z6B; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="WJye3z6B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=S2U7HapKauAQzvkKY4+by650HTGsyAOfQg9qhcv3guc=; b=WJye3z
	6BBrr72F8pnbU0Wpclm/DEuqCYaiNdXbtv3F0Fkj158h80k7aCMnV29XL30+uWs/
	IZsseajIryfrGE9a/wNoG9AJj5amYFMUaIAYNen7nwbdIIVYj3AA9BOQ9fWzxoCU
	lrExBd2Ku3JtNZ12GwjMF1AuBRT2Ch1GP9kPSRjdGhD+O6PA/6plCz3sAi9gDtKB
	he72P2dh83JPA+Pt98JONrSi5gxRzWFk373S6CwtKZutXFnaf0J4FNR4czwAnQ3Q
	DIBmwyx3cR4vSw/sHsIpiUu42vRNs4pNVqVcOMahTRm98V/j7VOc77Pl88erj2iy
	+iktg1sxiMiNHTog==
Received: (qmail 3073125 invoked from network); 9 Sep 2026 11:40:53 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Sep 2026 11:40:53 +0200
X-UD-Smtp-Session: l3s3148p1@iZ2xpQlbKqJtKXBr
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	dmaengine@vger.kernel.org
Subject: [PATCH v2 4/4] dmaengine: sh: rcar-dmac: Add support for R-Car Gen5 SoCs
Date: Wed,  9 Sep 2026 11:40:13 +0200
Message-ID: <20260909094009.2167-10-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260909094009.2167-6-wsa+renesas@sang-engineering.com>
References: <20260909094009.2167-6-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Gen5 is very similar to Gen4. Of interest here is that it has a SMMU
instead of an IPMMU, so there is no need to set the flag for a
workaround. Make the module description more generic while here.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---

Changes since v1:
* reworded commit message to not include "we" (Frank)
* tags added (Thanks Geert)

 drivers/dma/sh/rcar-dmac.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
index 4eca52aeec02..3ad8aba5dcd4 100644
--- a/drivers/dma/sh/rcar-dmac.c
+++ b/drivers/dma/sh/rcar-dmac.c
@@ -2013,6 +2013,11 @@ static const struct rcar_dmac_of_data rcar_gen4_dmac_data = {
 	.broken_ipmmu_microTLB0 = 1,
 };
 
+static const struct rcar_dmac_of_data rcar_gen5_dmac_data = {
+	.chan_offset_base = 0x0,
+	.chan_offset_stride = 0x1000,
+};
+
 static const struct of_device_id rcar_dmac_of_ids[] = {
 	{
 		.compatible = "renesas,rcar-dmac",
@@ -2020,6 +2025,9 @@ static const struct of_device_id rcar_dmac_of_ids[] = {
 	}, {
 		.compatible = "renesas,rcar-gen4-dmac",
 		.data = &rcar_gen4_dmac_data,
+	}, {
+		.compatible = "renesas,rcar-gen5-dmac",
+		.data = &rcar_gen5_dmac_data,
 	}, {
 		/*
 		 * Backward compatibility for between v5.12 - v5.19
@@ -2045,6 +2053,6 @@ static struct platform_driver rcar_dmac_driver = {
 
 module_platform_driver(rcar_dmac_driver);
 
-MODULE_DESCRIPTION("R-Car Gen2 DMA Controller Driver");
+MODULE_DESCRIPTION("R-Car DMA Controller Driver");
 MODULE_AUTHOR("Laurent Pinchart <laurent.pinchart@ideasonboard.com>");
 MODULE_LICENSE("GPL v2");
-- 
2.53.0

