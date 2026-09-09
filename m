Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9806A4854F5
	for <dmaengine@vger.kernel.org>; Wed,  9 Sep 2026 09:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788946857; cv=none; b=YZXzZ+fULfvx17l7yaK6C1o1hgMZHM09I+cb5B+Pi1Z277Tr24rpY7cK4Lfun7CbKY1qBHgIdG8/04xqD7zX9WP20MnE79s+CSMst6lvLU7dYwNojN8eXKFWYelDU5inXlr2zxwX5CUcxdTCqPRs8CWtHoq20LXRPxaTWXBoCwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788946857; c=relaxed/simple;
	bh=L77rxMkgZWfD7B4F2wyn/oT1lJBdHFUefh1lWi5LszQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rxuEN2uDFNgkX1ZELFcSl086zLcxyRK5ZJQKZzPNEt1EVSgiSK6rCtClE9JjvPBqpB3z8GmedoImCuXPesGo0EwdBr6hhVEDeaJFsdLxK6QLJUm29wgmFODX4eJuq29q/LPZm9CtVPZj9MKtJiPinbFXrX3N2ieUS+kTQbktRSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=TUHNSSKy; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="TUHNSSKy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=RVRQXDcG7QTyL5pcU9ZlxPryFKB7SqsHm8WjQjA8ECw=; b=TUHNSS
	KyLQ6CC71tworlEY9y4uVc/9ebstfnToOVxKITGOM9PQYWABOKBrop/OcYfs4oGF
	Tw919DGgFioK+zCn553xus50BXbX5wnvty42S2fqX32Y4X+KK4kpp0ffMa8QBUoI
	ML9R/1t4y3jZThWsuAhlLGe9ms5tdjJzj86EHLFejRG+L5o6+RvZXJl2iS302/zv
	YXXIbJ1r9NvPLUweBof8LAF2Hf4JE0ehx9kEMLPDtotmEQcldUiJpHD2+dgh3xPZ
	gcEWqsUuGhVDqOSTeimdsi4ejA0JykVsSYI+L8bNMHOy9vcL++yytM4VZtlG7G61
	Fk4xqB9zwxXu+JYw==
Received: (qmail 3073012 invoked from network); 9 Sep 2026 11:40:50 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Sep 2026 11:40:50 +0200
X-UD-Smtp-Session: l3s3148p1@6Dx+pQlbFKJtKXBr
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Frank Li <Frank.Li@nxp.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	dmaengine@vger.kernel.org
Subject: [PATCH v2 1/4] dmaengine: sh: rcar-dmac: fix style in struct initialization
Date: Wed,  9 Sep 2026 11:40:10 +0200
Message-ID: <20260909094009.2167-7-wsa+renesas@sang-engineering.com>
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

A new member will be added to the struct. Before that, adhere to coding
style by using a single space when assigning values.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---

Changes since v1:
* tags added (Thanks Geert and Frank)

 drivers/dma/sh/rcar-dmac.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
index 44eab2d21d54..cf07c17847d0 100644
--- a/drivers/dma/sh/rcar-dmac.c
+++ b/drivers/dma/sh/rcar-dmac.c
@@ -1998,13 +1998,13 @@ static void rcar_dmac_shutdown(struct platform_device *pdev)
 }
 
 static const struct rcar_dmac_of_data rcar_dmac_data = {
-	.chan_offset_base	= 0x8000,
-	.chan_offset_stride	= 0x80,
+	.chan_offset_base = 0x8000,
+	.chan_offset_stride = 0x80,
 };
 
 static const struct rcar_dmac_of_data rcar_gen4_dmac_data = {
-	.chan_offset_base	= 0x0,
-	.chan_offset_stride	= 0x1000,
+	.chan_offset_base = 0x0,
+	.chan_offset_stride = 0x1000,
 };
 
 static const struct of_device_id rcar_dmac_of_ids[] = {
-- 
2.53.0

