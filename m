Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FB2448CE8;
	Thu, 20 Aug 2026 13:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787231705; cv=none; b=KB+ssAV1BqsEFAAn6bpBMbPUO1Zhod5Lmc0SPretFOzTPs0To2ZNmzqH5PSdiXpnRzp+0SkVGPLyd81lEeZXXAoE1D6BIf2bhlE2izZVQJXiR/nuAnm3l7243B9yHUSs9rTWkE6+fdeRLKwXR68g/UxbT6x5GkOp9WwKihNslZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787231705; c=relaxed/simple;
	bh=GuPabj8wAryUCSTxSMHBsUKt262J1FgMFsi6kFuPSog=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W5OXbFzfFiUfbykq9YDFjSXSrhJletYVjpWJN3Joz+f//Uv2IMGq+Eu5uMLJGLGtczATGqcg39LpZOo1iLSR1e4jcqV9G8tWQLWUKvy6OVu3QF7ckAfJx/LYSJewXn1LbRGG/sgYo0jDt68hzAZm5iqQexxSiEmkJWpg5narLeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O4LPwdFh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O4LPwdFh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC01C1F00A3A;
	Thu, 20 Aug 2026 13:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787231704;
	bh=uTFUeU6MFdSjY3Yb/Nnu5w74qMFxGlugxQvrMWiC7aM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=O4LPwdFh2EzGb9tTk8rCu7f+pP4iTxL/8DK32gAYF/vNzu+K6qqJDSvZm4KXHSPY4
	 AXxI0gZ65WbY8A0fSE/9nIiunFUbtWOspxgamduWNtcyuQjXGyhQ1F5NsSlLTcKYPP
	 E/mx9GfR4avm+M9AZDoR6kxdJGymdMMCgx3OdpxkV4ZOpMjfoj6gGDDHTpwX6yryVB
	 EgY5wdWWPfTI8ZnfEEvyKcSk9GJfZtKjGVNqaZvvaJxCPjsi9GqGJG6VsHLzWwi5/0
	 lZ9sx5qGAAj/DD4bwgoOcZgO+sce/09wv+sfIBZ7a/M8Y2aewz4AwAmHoz2DZkTcMZ
	 iSsTJjZvJMEBA==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 20 Aug 2026 15:14:57 +0200
Subject: [PATCH v2 03/13] dmaengine: ste_dma40: Init hardware before
 registration
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-dma40-fixes-v2-3-63238334c707@kernel.org>
References: <20260820-dma40-fixes-v2-0-63238334c707@kernel.org>
In-Reply-To: <20260820-dma40-fixes-v2-0-63238334c707@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, sashiko-bot@kernel.org
X-Mailer: b4 0.14.3

d40_probe() registers DMAengine devices before calling d40_hw_init(). Once
the DMAengine devices are registered, channels can be requested and a
client can issue transfers before the DMA40 hardware has been initialized.

Initialize the hardware and set the DMA segment limit before registering
the DMAengine devices, so no globally visible channel can start from the
uninitialized hardware state.

Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/dmaengine/20260819225215.5EA2F1F000E9@smtp.kernel.org/
Assisted-by: Codex:gpt-5-5
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index dd449d4285ef..145f7105218c 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -3634,14 +3634,14 @@ static int __init d40_probe(struct platform_device *pdev)
 	pm_runtime_set_active(base->dev);
 	pm_runtime_enable(base->dev);
 
-	ret = d40_dmaengine_init(base, num_reserved_chans);
-	if (ret)
-		goto destroy_cache;
-
 	dma_set_max_seg_size(base->dev, STEDMA40_MAX_SEG_SIZE);
 
 	d40_hw_init(base);
 
+	ret = d40_dmaengine_init(base, num_reserved_chans);
+	if (ret)
+		goto destroy_cache;
+
 	ret = of_dma_controller_register(np, d40_xlate, NULL);
 	if (ret) {
 		dev_err(dev,

-- 
2.55.0

