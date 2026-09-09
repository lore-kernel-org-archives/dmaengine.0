Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC61248662E
	for <dmaengine@vger.kernel.org>; Wed,  9 Sep 2026 09:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788946857; cv=none; b=D51X8OO/Y2vq9OuTrmjKowmdimQjtwDRPVL4Ar7FSTcwEoB+oIcnkhaquBh3Yt4FCDEgP+j8N+bFe2SDv4KQbY9GLsP3UhyGG1a/cjbYfQWPadijES4c3ImwFOP1rodrKLpIjwkw9A2WD3HOjHWFT4w24303PtedkY5MYN50lEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788946857; c=relaxed/simple;
	bh=x3U1A5RYtIJVvhFbn/0bE/azW3v+9++bojRTs/FajBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eZYa4uspEMttJ+3rQHw7SX0K/sogGzn9/v3JWWnjoVP7pVw4J+ifj5P5BpBaEzY/6jQNUvDlUK8rCk4DdmdD7FCedN3f1ZAagS4RCZYr+9I3I8sa+R5sI0aGsFkhfv0v4YJBe6I8tUWGhZHgj1YHTEGi3YKedVbaDn+yve7SDAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Ol1jl2RI; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Ol1jl2RI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=FK1+V11H2fOxpAsxjNoz82SBePkbNuKY+LhL4EQZIHk=; b=Ol1jl2
	RIy9fbL/bUlHrsfTTUSK1NSFlhvq3+i1SFd773mAsnjc98pIuppZfMsCKtsblD9O
	1ppz3jRoy60Tn8ANBnAZ45Wtzev8szOwqyuNtidz+gY6CKMs2mLBli5C7AfyhcvW
	19MjF5MSmQ95ZfbjDFErYNqtcuabS5Yv6+cGzK05FR1ibY6Xni/2ZadFR3fOlu/i
	Vhhn+J7jigjt+p3XXZ3rJ0g5JKMKFko+doi1+tphXtgVG93jzzjtlO6FYcOI+kyy
	FjllzqIiHqQZNT0qytFYis78DL6Cj90Ou27hXZCyEchfe6EC0IGOKvbNbfJWNKmI
	/lhL8grxrTfohziQ==
Received: (qmail 3073051 invoked from network); 9 Sep 2026 11:40:51 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Sep 2026 11:40:51 +0200
X-UD-Smtp-Session: l3s3148p1@b6ePpQlbHKJtKXBr
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Frank Li <Frank.Li@nxp.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	dmaengine@vger.kernel.org
Subject: [PATCH v2 2/4] dmaengine: sh: rcar-dmac: SMMU doesn't need IPMMU workaround
Date: Wed,  9 Sep 2026 11:40:11 +0200
Message-ID: <20260909094009.2167-8-wsa+renesas@sang-engineering.com>
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

R-Car Gen5 doesn't use an IPMMU anymore, but a SMMU. So, the workaround
for the IPMMU becomes optional. Add a flag to distinguish. No functional
change.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---

Changes since v1:
* tags added (Thanks Frank)
* renamed the flag-variable (Thanks Geert)
* added a comment that Gen4 might not be affected

 drivers/dma/sh/rcar-dmac.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
index cf07c17847d0..4eca52aeec02 100644
--- a/drivers/dma/sh/rcar-dmac.c
+++ b/drivers/dma/sh/rcar-dmac.c
@@ -219,10 +219,12 @@ struct rcar_dmac {
  * struct rcar_dmac_of_data - This driver's OF data
  * @chan_offset_base: DMAC channels base offset
  * @chan_offset_stride: DMAC channels offset stride
+ * @broken_ipmmu_microTLB0: flag if the connected IPMMU has microTLB0 issues
  */
 struct rcar_dmac_of_data {
 	u32 chan_offset_base;
 	u32 chan_offset_stride;
+	unsigned int broken_ipmmu_microTLB0:1;
 };
 
 /* -----------------------------------------------------------------------------
@@ -1877,8 +1879,9 @@ static int rcar_dmac_probe(struct platform_device *pdev)
 	 * can't use it with the IPMMU. As the IOMMU API operates at the device
 	 * level we can't disable it selectively, so ignore channel 0 for now if
 	 * the device is part of an IOMMU group.
+	 * Not applicable if system uses something else than IPMMU like SMMU.
 	 */
-	if (device_iommu_mapped(&pdev->dev))
+	if (data->broken_ipmmu_microTLB0 && device_iommu_mapped(&pdev->dev))
 		dmac->channels_mask &= ~BIT(0);
 
 	dmac->channels = devm_kcalloc(&pdev->dev, dmac->n_channels,
@@ -2000,11 +2003,14 @@ static void rcar_dmac_shutdown(struct platform_device *pdev)
 static const struct rcar_dmac_of_data rcar_dmac_data = {
 	.chan_offset_base = 0x8000,
 	.chan_offset_stride = 0x80,
+	.broken_ipmmu_microTLB0 = 1,
 };
 
 static const struct rcar_dmac_of_data rcar_gen4_dmac_data = {
 	.chan_offset_base = 0x0,
 	.chan_offset_stride = 0x1000,
+	/* Set to play safe. Needs testing if Gen4 is really affected */
+	.broken_ipmmu_microTLB0 = 1,
 };
 
 static const struct of_device_id rcar_dmac_of_ids[] = {
-- 
2.53.0

