Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD4B5372F4;
	Tue, 22 Sep 2026 23:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790119887; cv=none; b=JC+ko0w1ULUDpF2yy1RZSrX6rg2v675Yq9ZN7e2b3sn/qmDAC6NT15X0Zc5IhLJVAorTXsMnC0NdBWkcfBaPIu/lGEapEiyGGNVErz2rPU2Bzij7VdlmjOaZKJ2aJoped+6VyoK/Vm4nkwRnbK3gf0KpBTlj7zisDLKkFG7cMvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790119887; c=relaxed/simple;
	bh=ZenyrztKEc2KFHSzi7G0kUpqFsYl/ejK3eoVhtqDSMk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QPL57WlzjYnQKmU+vrEMBURcEEvGqdPO4Mm0avrBbD6wVmyVAekeLSdLr5RgkpO5gN4x/U+F8onBjQD/oU1hQpEGTgHCl7wfmGf/lR/+60E6gkHyZrpvumHb3Ef2ehQ37MDKY4mdNPib9IFY5ggQmnEy6aVbyeT4Zpb8p/BQqkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VCjHeNAy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VCjHeNAy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A4BA1F000FF;
	Tue, 22 Sep 2026 23:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790119884;
	bh=KepKskXMvFXb4t2nZSj+Y1ch4Yr/Ozzc0nuWPzMt9dY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=VCjHeNAyvKjsOL+QVwqyl6eQgb/c8qDQpBCiybytGevL6Gw53SplK/9HjO4NpUfgr
	 ZoJpwVk7JbN18hkHE8HtFabX45zIHyaqlAy/oR9sYqmJgKgdbF5LvuiyKsAdJfS/V3
	 z0zvg/23lXABQb6qzSB1+bn0qPPIMZi2GN2A83mSV94JfiVOS0Q4k1pxsZWuVNAFvr
	 8S7dSTaJ+cp7U6OOzzc8u9UBj2JiPwtPX5nsUt34Cw1N/gaSs82N6ytjnpV7meowvm
	 QW185PLeZs+i5yRpaJ9hhouMHmlipkEnUFvRLavpve7FUVFRwAEANJOgXoq/fULOE2
	 NT8HaK6cLn/tQ==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 23 Sep 2026 01:31:04 +0200
Subject: [PATCH v5 19/23] dmaengine: ste_dma40: Fix logical channel bounds
 check
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-dma40-fixes-v5-19-709d160cde76@kernel.org>
References: <20260923-dma40-fixes-v5-0-709d160cde76@kernel.org>
In-Reply-To: <20260923-dma40-fixes-v5-0-709d160cde76@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, sashiko-bot@kernel.org
X-Mailer: b4 0.14.3

d40_validate_conf() checks the raw dev_type against num_log_chans,
but d40_allocate_channel() derives the lookup_log_chans index as either
2 * dev_type or 2 * dev_type + 1.

Validate the dev_type against the derived logical channel index limit so
channel allocation cannot write past lookup_log_chans.

Fixes: 26955c07dcf3 ("dmaengine: ste_dma40: Amalgamate DMA source and destination channel numbers")
Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/dmaengine/20260618051539.15E201F000E9@smtp.kernel.org/
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 787567bed12f..0ba679a0433b 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -1884,15 +1884,26 @@ static int d40_validate_conf(struct d40_chan *d40c,
 {
 	int res = 0;
 	bool is_log = conf->mode == STEDMA40_MODE_LOGICAL;
+	bool invalid_dev_type = conf->dev_type < 0;
 
 	if (!conf->dir) {
 		chan_err(d40c, "Invalid direction.\n");
 		res = -EINVAL;
 	}
 
-	if ((is_log && conf->dev_type > d40c->base->num_log_chans)  ||
-	    (!is_log && conf->dev_type > d40c->base->num_phy_chans) ||
-	    (conf->dev_type < 0)) {
+	if (!invalid_dev_type && is_log) {
+		int max_dev_type;
+
+		if (conf->dir == DMA_DEV_TO_MEM)
+			max_dev_type = DIV_ROUND_UP(d40c->base->num_log_chans, 2);
+		else
+			max_dev_type = d40c->base->num_log_chans / 2;
+
+		invalid_dev_type = conf->dev_type >= max_dev_type;
+	}
+
+	if (invalid_dev_type ||
+	    (!is_log && conf->dev_type > d40c->base->num_phy_chans)) {
 		chan_err(d40c, "Invalid device type (%d)\n", conf->dev_type);
 		res = -EINVAL;
 	}

-- 
2.55.0

