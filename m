Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658E744C66B;
	Mon, 12 Oct 2026 08:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791792032; cv=none; b=gajpbAOXp1kcZ13Nusn0+y7uyW2PwgZYB+DsSJz3M3KduG0ipcKvnH7ckn2iAj+1JFR29rO7Og0bwNjNmKs+FAz8iSk3qxTFgPRChKoBEwPbfMgDSqnMFRFyGbKtRr67mOk271rwFZ5iHbKWmr/nqB4vYHlBRab9hZa097+4X9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791792032; c=relaxed/simple;
	bh=5EEOw38mea9xb3fj1kLycZgwAtj5BNQt6FxpnmmIBMI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DCezB9GmYMvj/QQCemUsx0w1xwpRp9M+ryBnIKkwily9v1UhgwJYi8Uz0GQMJNSi5GkPYuZXY/rSqYySn0dvaC3yX1Ze91augCXWs/dgMmHkjihlnJdPxDQ232dqQr7BS/RB1GZCShSj8UEXnCBVydMs64jEfLwcTDgPP1GSmB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fpJ0m4aF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fpJ0m4aF"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E53C8C2BCF4;
	Mon, 12 Oct 2026 08:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791792032;
	bh=5EEOw38mea9xb3fj1kLycZgwAtj5BNQt6FxpnmmIBMI=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=fpJ0m4aF8vCgc51IsuVJHu1SsLapZvZsF0eTvHu+qAvRGD7T/iPDYw0xLdYZKkhs4
	 BowDKDK6Cwv/AhX2SYNgcKsoYQTt9dWeu3mWnqUEMNXwCLp6NbLZHl0EgbLaAqayXY
	 D5OdCGMC8xPIzpnjxJRZIFvLviT4J0r9nmENuizaTrNzD+9ohR3wF+uyeH7p6NCL7/
	 vTWycDpSkXzQoiDMItxlDg4dUwwVsJLwYeU1hKNAxQBp+2Ok2u+DmgHvWpypZ/GTHO
	 K/oJS8eBWvnnrrz2SdG8+CKDCrOTwaRTYzXQxZz0EjsbvszMPK7PCCIivFy1SYzLcl
	 pFI6/eXxtdXNg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C557ACA9ED2;
	Mon, 12 Oct 2026 08:00:31 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Mon, 12 Oct 2026 08:00:20 +0000
Subject: [PATCH] dma: amlogic: Fix little-endian variable operations issue
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-fix-a9-dma-v1-1-2d83008f3e32@amlogic.com>
X-B4-Tracking: v=1; b=H4sIAJOTzGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDA0Mj3bTMCt1ES92U3ERdk6RU81Qzw6REM1NjJaCGgqJUoCzYsOjY2lo
 A/v73G1wAAAA=
X-Change-ID: 20261012-fix-a9-dma-4be7e61ba653
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: linux-amlogic@lists.infradead.org, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791792030; l=1209;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=MGtI9iPeIcfHpSdg3DM67l61qmbOpdtXMG6n3gxJRnU=;
 b=A+XdZzGpsG4iQCPdlMLMiPVu8hZGhXnsVB8XSC0u4KWuu7ga0GROb4VG5ZTLNWDfhZwbHUBoC
 BjLSaoVldXKDFRgl7yrxa1fKWbIR/FNBG73mbpSEC2brRf31LP/Nu1v
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

In dma_async_tx_descriptor function,fix the situation where the operation
processing of the little-endian variable requires corresponding conversion.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202610060235.PuCxWQdk-lkp@intel.com/
Fixes: b84b5197e344 ("dmaengine: amlogic: Add general DMA driver for A9")
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Fix the operation little-endian variable issue.
---
 drivers/dma/amlogic-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/amlogic-dma.c b/drivers/dma/amlogic-dma.c
index 78ee2337ae71..bbf5ae5ac705 100644
--- a/drivers/dma/amlogic-dma.c
+++ b/drivers/dma/amlogic-dma.c
@@ -321,7 +321,7 @@ static struct dma_async_tx_descriptor *aml_dma_prep_slave_sg
 
 	/* the last sg set eoc flag */
 	sg_link--;
-	sg_link->ctl |= LINK_EOC;
+	sg_link->ctl = cpu_to_le32(le32_to_cpu(sg_link->ctl) | LINK_EOC);
 
 	return vchan_tx_prep(&aml_chan->vchan, &aml_desc->vd, flags);
 }

---
base-commit: 42c31fec1ca76b8b5f7759def122d418dff2cd4b
change-id: 20261012-fix-a9-dma-4be7e61ba653

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>


