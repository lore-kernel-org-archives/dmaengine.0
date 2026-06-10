Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DB93822BB
	for <dmaengine@vger.kernel.org>; Wed, 10 Jun 2026 06:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781074679; cv=none; b=U9kI3lguWWEMOiaoFDflj7ibhTtBLa1pUtytkT9Wdcs1USN3NpAtj91BMAyfkNZrWQUo+XK5bnSXH48QpHyO/JigVMi3pLCe+wGV5ZPQVR54uxsq27rogPYqHOYIC9gWioH7GWTa2HVe6LQp4mhInCxIo53le9fIqKBfxjJPM5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781074679; c=relaxed/simple;
	bh=ib1C5m9zUovsfnKC/Ob/iT89+FbnmfTIZHRjo7kccgw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MEshPeeBUGfxKoAFBLOtwSTFExPLx8YBHnM6jS6AQ0XA/2jPHUiAjIxMiSFIUb5uXfz90zakEmjJ9xcomAf1TOZv/cLbWkB8yRM8pWvBJCIjr1tFoNen+GXeMJu8y5l4EZC6DeeP9TzQGLrTS9yOE0wrYhgZB6LVtc3s2/Qx90k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dpdND8dN; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dpdND8dN"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-36d98b68d68so4157239a91.2
        for <dmaengine@vger.kernel.org>; Tue, 09 Jun 2026 23:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781074677; x=1781679477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X/UDBDLtZz00cGQrhKCz/1OR6H3GeXpDVyKQrDy5eXA=;
        b=dpdND8dN8GE0+9Crg57vMAD2+Ii7dKWvMN8GkqvaQrRVfLEruDIATELi0Peyks+MBc
         ZtEwgrGqkll9OiVUPTP/C4EfwYyeRUDxsuTmdKtkljbrwNHBfUjzleKblv3ZYD+2K4r/
         3kYLmd2ZHB5Z5Zh17Zvot06Kx6Jvhq/fPifk4XPODKRD8HJzIdEZHDHhGE38FxfSscC7
         6xR1NMp9l9GmYtI3eBMJUZVuEWPfFvUcPMw3XyLUnz4b3KMwmKgx34pIKzUUp++jfG4o
         C8Qyo96pBhh8md1wjDSmtCTu8RckKZOzaUwy2SMv5gQ43ux3JPyXDeXs3xCOP/h3wSS7
         YcIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781074677; x=1781679477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X/UDBDLtZz00cGQrhKCz/1OR6H3GeXpDVyKQrDy5eXA=;
        b=ezRWzV9qqWa2TnG7OfmlB6mZ7X6N91xT0OTMnRvww9KVr5tLImRvZyy+W8cuAwVC1n
         tdy01aQG8pmKIz7GEopZYsxxQt+QwFDXCWSwnJT9Gw6zaVgvbgJDke3fTgIL4tfJJuMY
         A1MjMiIm9gJ4mBIMZPT6d/V4BxMWo7/OIdUNF2kwqEiR2A1NX75oWxG/xb7+LYPHUSsL
         z3/dmDwB8em7lUePfD5exWFvhjC59cq9T0NGclnZ3Jgf7DKqYtJhoHsP0/cvShlo7qZl
         GIE2CkOVSG+gEGBd5VS4qpbz5ctKBXtMGpwygvAnCGXp/5MRcLnqbNVil/8Cb+p400f5
         h3Wg==
X-Gm-Message-State: AOJu0Yy4va+WQ+eRcUkgQVusSvjhnx4MatpepEpDPgLkd2N65GD2TW/p
	V9n4/eO0Tr8x2FCIYeCVwL1nz4dL9htxNFEnv+QDUeG1vKzhrpB5FJNE9coCnyjz
X-Gm-Gg: Acq92OED1LNzgnZp8MIjLitS7NSlFs4vOoxfeLKkIzmgvZZ9uPWuWCoyNYMgkaSmJa8
	DUCuaQYFyw/uSMvikt4DDx54E11tQeMFh7JtiqXHZvoYfMgW/eNxSIWjhnhTz7m/6rV2Tuyl9HX
	r2F1Y+B0mhvOfDSpkzcA5+72IBxOKXOKVaFkJ7A/XuWwTQ6yUuNbfMZa/ducvfV6otzQBwAgfrT
	uCMoUBdlO6PATNw5dFT3kdSSvjjxarlO0irczNZzApYjHL9YLw9dfXPCZP0qGwTW8VFl/vLlLi4
	VSzlyzghmSg5BK7tyfQ5wFlS8BS3n7RsSHvDsdcKBjhtaXczH04rFt9ROyMpBcSwZAs0JpU9x1j
	8peLi1V/GwaIiAqmbWKyQNy3COIj4tB5v7QaIAnCwufiHf8IaaUoXkYw7OwgURHILDMIlRrAhsE
	OFrAElQpiB+tMWOcTWt9vFN1ahMkCIQuXFAaPMJy2OF6+XQv0o6cwrYq+mnGA/AxP1H9R0VRjEb
	rC8Me7fminHIdL9mm5rQD6Iab6v5o7S4Z00oytdUwNQOA==
X-Received: by 2002:a17:90b:4b87:b0:368:ed26:15b2 with SMTP id 98e67ed59e1d1-370eec1272dmr25088138a91.8.1781074676914;
        Tue, 09 Jun 2026 23:57:56 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6bf830b2sm20064781a91.4.2026.06.09.23.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 23:57:56 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/3] dma: mv_xor: use devm_clk_get_optional_enabled
Date: Tue,  9 Jun 2026 23:57:35 -0700
Message-ID: <20260610065737.118211-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260610065737.118211-1-rosenp@gmail.com>
References: <20260610065737.118211-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace clk_get + clk_prepare_enable + clk_put with
devm_clk_get_optional_enabled. This eliminates the need for
manual clock cleanup in the probe error path.

It also fixes missing cleanup in a remove function.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/mv_xor.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/dma/mv_xor.c b/drivers/dma/mv_xor.c
index 25ed61f1b089..a97fa0038652 100644
--- a/drivers/dma/mv_xor.c
+++ b/drivers/dma/mv_xor.c
@@ -1359,12 +1359,9 @@ static int mv_xor_probe(struct platform_device *pdev)
 			mv_xor_conf_mbus_windows(xordev, dram);
 	}
 
-	/* Not all platforms can gate the clock, so it is not
-	 * an error if the clock does not exists.
-	 */
-	xordev->clk = clk_get(&pdev->dev, NULL);
-	if (!IS_ERR(xordev->clk))
-		clk_prepare_enable(xordev->clk);
+	xordev->clk = devm_clk_get_optional_enabled(&pdev->dev, NULL);
+	if (IS_ERR(xordev->clk))
+		return PTR_ERR(xordev->clk);
 
 	/*
 	 * We don't want to have more than one channel per CPU in
@@ -1452,11 +1449,6 @@ static int mv_xor_probe(struct platform_device *pdev)
 				irq_dispose_mapping(xordev->channels[i]->irq);
 		}
 
-	if (!IS_ERR(xordev->clk)) {
-		clk_disable_unprepare(xordev->clk);
-		clk_put(xordev->clk);
-	}
-
 	return ret;
 }
 
-- 
2.54.0

