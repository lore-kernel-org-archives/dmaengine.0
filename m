Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E573F7877
	for <dmaengine@vger.kernel.org>; Tue, 25 Aug 2026 14:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787667373; cv=none; b=tLeIK4Cplh1C0E2i/2VaLU9mF4+8GD3YOl7rubHiCWN4uF8e06jwudi6cWJGfhvlSuzVY4l1ti74D/P3uYz44ehKi1fNSdeq+0v0DveAeeLukZiosu6cAxq7P8ngYCu30UCI5K6GFUwFibpS4jLm+SWZcy9zijSUP8P4pdq3L48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787667373; c=relaxed/simple;
	bh=aKFEgkdy12fOkGTPvTGdvZQ9bGN8VFbuHPRwMqZWar8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U2CiIMXZ3ZesXOpPBOybMRjeUYlIdWcUB7zqB26qJ8rX1dqz03DYIUY+eYFCWJdSAAXipS2xJmLtD/Gks+f98beYudFL7X7pJnF01iqYfoezcIgsseLQO/3YPYLQQY2epwiAXPxfug6uNeyLJlahpJemtbhrvJWEmgiX8eQeq1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ioXD3o2o; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ioXD3o2o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=PIBmS6EA2uGDBW3mkk/kPkTL5Fmu7GbZSSjquRSWNsc=; b=ioXD3o
	2oYJ9VCwr8aJsLwTiglvyREsIStgdi+ZXOmRQbvnOYxmrvnXbIxsSOfbppvPYZEY
	TUEJ1Wn+6taLIhVhzZxQLP2VoxALbLjC7hN0Hy3aG4RvZ+7i3W3hQLprZK9Rut9K
	upqXycFQ0KmnW7OOeI69adk7a9nliT5wJjQWvk7ohR3Yq7Zv08OEJDBN9Er1H/Jr
	hMQtoxQ1irO0FDzxC4lFhPE6TxRzcV1yHRKedjz/OUU/stE+ucSHR20NXw627dS6
	eTgHxrw7SR1Lk46zmK6OLrJyQwwDIpNmiib1bs6GKlQEUdioOx3jpMs7nqSEQB+J
	OwpLYyzWxGXBUYLw==
Received: (qmail 534304 invoked from network); 25 Aug 2026 16:16:02 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Aug 2026 16:16:02 +0200
X-UD-Smtp-Session: l3s3148p1@9nEZvt9ZJuIujnus
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	dmaengine@vger.kernel.org
Subject: [PATCH 2/4] dmaengine: sh: rcar-dmac: SMMU doesn't need IPMMU workaround
Date: Tue, 25 Aug 2026 16:15:44 +0200
Message-ID: <20260825141542.30901-8-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260825141542.30901-6-wsa+renesas@sang-engineering.com>
References: <20260825141542.30901-6-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

R-Car Gen5 doesn't use an IPMMU anymore, but a SMMU. So, the workaround
for the IPMMU becomes optional. Add a flag to distinguish. No functional
change.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/dma/sh/rcar-dmac.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
index cf07c17847d0..9c5210257097 100644
--- a/drivers/dma/sh/rcar-dmac.c
+++ b/drivers/dma/sh/rcar-dmac.c
@@ -219,10 +219,12 @@ struct rcar_dmac {
  * struct rcar_dmac_of_data - This driver's OF data
  * @chan_offset_base: DMAC channels base offset
  * @chan_offset_stride: DMAC channels offset stride
+ * @has_ipmmu: flag telling if DMAC is connected to an IPMMU
  */
 struct rcar_dmac_of_data {
 	u32 chan_offset_base;
 	u32 chan_offset_stride;
+	unsigned int has_ipmmu:1;
 };
 
 /* -----------------------------------------------------------------------------
@@ -1877,8 +1879,9 @@ static int rcar_dmac_probe(struct platform_device *pdev)
 	 * can't use it with the IPMMU. As the IOMMU API operates at the device
 	 * level we can't disable it selectively, so ignore channel 0 for now if
 	 * the device is part of an IOMMU group.
+	 * Not applicable if system uses something else than IPMMU like SMMU.
 	 */
-	if (device_iommu_mapped(&pdev->dev))
+	if (data->has_ipmmu && device_iommu_mapped(&pdev->dev))
 		dmac->channels_mask &= ~BIT(0);
 
 	dmac->channels = devm_kcalloc(&pdev->dev, dmac->n_channels,
@@ -2000,11 +2003,13 @@ static void rcar_dmac_shutdown(struct platform_device *pdev)
 static const struct rcar_dmac_of_data rcar_dmac_data = {
 	.chan_offset_base = 0x8000,
 	.chan_offset_stride = 0x80,
+	.has_ipmmu = 1,
 };
 
 static const struct rcar_dmac_of_data rcar_gen4_dmac_data = {
 	.chan_offset_base = 0x0,
 	.chan_offset_stride = 0x1000,
+	.has_ipmmu = 1,
 };
 
 static const struct of_device_id rcar_dmac_of_ids[] = {
-- 
2.47.3

