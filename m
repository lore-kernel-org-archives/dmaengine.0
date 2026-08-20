Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D70448CE8;
	Thu, 20 Aug 2026 13:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787231706; cv=none; b=Rgxwj7t+UTk1qoHqk61sAdm/r7RxVNcNGGq3496XEDlRZlA6ZapVM5R1FGInfH2DIz3MmLwqC0hnjjP6GGq3mlXqqZQFfocRlp1tJb6guhZMdfZXa25ZbiI7ey3XdWQgFL5P6B5sIMPzqLKFUWYlFQAzZ3PAwg+qmOG6Lg3n5Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787231706; c=relaxed/simple;
	bh=kccf//tujt+/YQuIo8q8b1d+h7H+YPHJRgo5r82BRL0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jpNh42xoRraEKD33UIfj/HjJXx3cBQ3Y+sMVxGVkmUik2UEv7+Yt0Tyf5kx9ljq2drSj1q+7ywbeAGJk8GobPaVq9SfxfblrW3nMUpBOK1wc4/0vHFm4RGP6A13/KRsyGvsvEFqbixDby9W/Cfl2/B8+gojSyMIsP5yq96G4HPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GI4FZNdn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GI4FZNdn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 662731F00A3E;
	Thu, 20 Aug 2026 13:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787231705;
	bh=smxCBcOeo7CvjE8vP88um1idHa+J14ldag0mSttejpI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=GI4FZNdnyHWSHO/DxMGEdDoOg7iHAu6lbLY0JTdYgbMHY98d0zrka0Je2jZuvgefw
	 uXqlfP9/JtUuoQ0P0YGBxkpmJbxofRx9MI/0lE+7O488aJxiN1RABFFAem1UyZtjQB
	 QFTCUGW/Tt6GjDU0HwAsC+yHBqSri93cKrNkYXqZy3MmypkELfqYgCYJW2GL1UNckS
	 YxggHPF2IzUbeQIrNrg2++BJpM0h5EB5GGlEDP/RF4+DNpazCKjUcN3LuZsiUU1EQc
	 WFqIGLg1KN708zQqX0/KLA9K6DY1v1q+Ni56Nw/jfrKlANboIdyd/Ss0PY6U4F2y81
	 mjHYOr2ZZ+B2Q==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 20 Aug 2026 15:14:58 +0200
Subject: [PATCH v2 04/13] dmaengine: ste_dma40: Fix DMA registration unwind
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-dma40-fixes-v2-4-63238334c707@kernel.org>
References: <20260820-dma40-fixes-v2-0-63238334c707@kernel.org>
In-Reply-To: <20260820-dma40-fixes-v2-0-63238334c707@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, sashiko-bot@kernel.org
X-Mailer: b4 0.14.3

d40_dmaengine_init() registers DMAengine devices using devres-managed
unregister actions. If probe fails after one of those registrations, the
DMAengine devices stay visible until devres unwinds after d40_probe()
returns.

Release the DMAengine registration devres group before freeing the IRQ and
LCLA resources on the probe error path. Keep the managed registrations in
place on successful probe by removing only the temporary group markers.

Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/dmaengine/20260819225215.5EA2F1F000E9@smtp.kernel.org/
Assisted-by: Codex:gpt-5-5
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 145f7105218c..384c2f3805b0 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -3511,6 +3511,7 @@ static int __init d40_probe(struct platform_device *pdev)
 	struct d40_base *base;
 	struct resource *res;
 	struct resource res_lcpa;
+	void *dmaenginem_reg_group;
 	int num_reserved_chans;
 	u32 val;
 	int ret;
@@ -3638,20 +3639,29 @@ static int __init d40_probe(struct platform_device *pdev)
 
 	d40_hw_init(base);
 
+	dmaenginem_reg_group = devres_open_group(dev, NULL, GFP_KERNEL);
+	if (!dmaenginem_reg_group) {
+		ret = -ENOMEM;
+		goto destroy_cache;
+	}
+
 	ret = d40_dmaengine_init(base, num_reserved_chans);
 	if (ret)
-		goto destroy_cache;
+		goto release_dmaenginem;
 
 	ret = of_dma_controller_register(np, d40_xlate, NULL);
 	if (ret) {
 		dev_err(dev,
 			"could not register of_dma_controller\n");
-		goto destroy_cache;
+		goto release_dmaenginem;
 	}
+	devres_remove_group(dev, dmaenginem_reg_group);
 
 	dev_info(base->dev, "initialized\n");
 	return 0;
 
+ release_dmaenginem:
+	devres_release_group(dev, dmaenginem_reg_group);
  destroy_cache:
 	if (base->lcla_pool.dma_addr)
 		dma_unmap_single(base->dev, base->lcla_pool.dma_addr,

-- 
2.55.0

