Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD2B446834;
	Thu, 20 Aug 2026 13:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787231716; cv=none; b=TSJg5MmCbQYpF7kAAPf7x8M5QGAbK3CObfCyTifFxbJYfoZEs6pFND7MVqQCpRXntJxYXBGEIY/7PWmNJ7Cc7OPzx3P50ZLGmqLhJ2kG+cXpHPwAI1gfpsAkndg6O4Uf1eCSYkrcyCLe95C9TGRr+lukktDcisJObVEmkUrI7Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787231716; c=relaxed/simple;
	bh=ty9BhdYHRegdFHkI7c0NtM9RN9WfScolTg1IMeSG70I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UrNHA5PiVFu3JWK6UUT86TRziKP8TSLtIvb7Br48TLCAumGSLenOjWo5fVDpc4j5HDXyt0UmjVqjlsuo7Sh2pkjZiNxQ5cV86IcFENqQASWGtZAaCK4wElNupuN5NszQtoDyyfnK1oyrxBDyuC+1qIaniOThKENFNb+9J/VaNh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BadSBmHj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BadSBmHj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7C5D1F00A3E;
	Thu, 20 Aug 2026 13:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787231715;
	bh=3k99wFuMuD1sWxwCAWFx5zZ0HWOKSsvaQfpsYwMdCS8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=BadSBmHjSzFGiC+51yrK4WE+ZwbEBnAj9tMYYX+Mdfwvl1rLCgQZj3VNfBS+1Ixz4
	 6EbcCC+EQ1DEY3s7JolDZlW1NuXY30THH0xf6GCH2t7jdA19vtOUq4ga7Ut/771OtH
	 NHqzTrKRisTsHXMT4uaDq8vxx6ZEQ9qUcmnTRL/+YWtR/XrtV7Z1I+ezyBmXUHY/63
	 4lCBTPlYLmqKg88A4T45myzg4Ns9+dhZf7Jqd93Q/IKUXAOrQ+G95bzIb+VckeQ20q
	 IfeNqQ4aderGQOIljNs5bVcWRJriRcS+yqUOR+Eys2Ilj05U6biu+VHBRd66vXXfcs
	 pdOODrrVvOy5w==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 20 Aug 2026 15:15:04 +0200
Subject: [PATCH v2 10/13] dmaengine: ste_dma40: Fix logical channel bounds
 check
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-dma40-fixes-v2-10-63238334c707@kernel.org>
References: <20260820-dma40-fixes-v2-0-63238334c707@kernel.org>
In-Reply-To: <20260820-dma40-fixes-v2-0-63238334c707@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, sashiko-bot@kernel.org
X-Mailer: b4 0.14.3

d40_validate_conf() checks the raw dev_type against num_log_chans,
but d40_allocate_channel() derives the lookup_log_chans index as either
2 * dev_type or 2 * dev_type + 1.

Validate the dev_type against the derived logical channel index limit so
channel allocation cannot write past lookup_log_chans.

Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/dmaengine/20260618051539.15E201F000E9@smtp.kernel.org/
Assisted-by: Codex:gpt-5-5
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 4e840846466b..7c777e410c10 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -1737,15 +1737,26 @@ static int d40_validate_conf(struct d40_chan *d40c,
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

