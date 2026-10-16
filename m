Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F1B20B80B;
	Fri, 16 Oct 2026 03:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792119625; cv=none; b=CvjF2UScQpFXGqt3JC21dNV1AQcJ4fgiXh0gVJcg3QID3+NjJuW+skQ+B+W19UUAanbFAqvHFN1ImGe5g7lH6tLF9Sgv9wPL3C8cp+JCJ74I2HoscYTwVPKhmaQd/q7ooe6sobBc4s1EfQjKalj+tLTavxVQRVANPHO39n+/weA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792119625; c=relaxed/simple;
	bh=mGydzSGvhJpw6HwBSJr8ANj9qRn92a98piESbh9Ntus=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=O4hBlMRAhkVU5gUpqVmXTCaUNhj3+KAAG5kzlykdNxE0p9f1UFFILe7qoQLLGXSkl4lIkEvKNUQg7S0+dD6xeIS7klpuZkvHB+ug7jih0Q3XGPWw3sJgDXCqPvn/0fevYymQ2MQ0mMLCivnQnjyHDyDtU3sln/Kvs6akxRgqLyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mSJaC6xi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mSJaC6xi"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 58161C2BCF5;
	Fri, 16 Oct 2026 03:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792119625;
	bh=mGydzSGvhJpw6HwBSJr8ANj9qRn92a98piESbh9Ntus=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=mSJaC6xiAw1na3gObLHjPnwIlDoeQHwA4xFqza7Z/ImSzkHO/7LYOJHUBTwnrNzmF
	 QB8ISP6O68MMitae9GYsSuBHfivK7Hum0POK5DKEyrQrX1ujoK2UAF9Usv8ZEtLZZ1
	 Sn+y+voLp6XiYym6aHoL2x4QGeXQyCtUAsTULObuDd1b5/Mys8pb+2NfwYKi6vi4uw
	 t2KRpOctlyQrXAL+SZEkwWEsd12LDA41r3aKBVHVLTA4skq5DlGonn9Y3RrvVV6trZ
	 jmy7yel+3Gu4gLyzuDr0Fl9PXuejPWhSrr2lPhGZ3rtollac/CIBvteioS6TNP2E4l
	 bpgKgJTCbCx4g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D38BCCA463;
	Fri, 16 Oct 2026 03:00:25 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 16 Oct 2026 03:00:17 +0000
Subject: [PATCH] dmaengine: amlogic: Fix regmap error check issue
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-fix-a9-dma-complier-v1-1-024421d5b3c8@amlogic.com>
X-B4-Tracking: v=1; b=H4sIAECT0WoC/x2MQQqAIBAAvxJ7biELNu0r0cFyq4VKUYgg/HvSc
 WBmXkgchRMM1QuRb0nirwKqrmDZ7bUxiisMbdOSahThKg9ag+60uPgzHMIRVa9nYqLe6A5KGSI
 X7b+OU84f8l1hJWUAAAA=
X-Change-ID: 20261016-fix-a9-dma-complier-178b6e667983
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: linux-amlogic@lists.infradead.org, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>, 
 Dan Carpenter <error27@gmail.com>, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792119618; l=1413;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=q70ArngI8F9kaZ0a86j08SCXsqeF7k11fJnEBCve2NM=;
 b=b8gfpJGQQxHZblcSRlbmR0x8knLQCBnlci0XZWs2RwdViFJw9m3CKpHz1TgeXXp0l32aEMgXU
 OP7Nu80bFXUCx/LJjuNHlrhQbpiIIcJgZoXLxE1W51B5c/WyZhuq40T
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

The func devm_regmap_init_mmio() only returns an error pointer on failure,
Use IS_ERR() instead to make the intent clearer. And Fix the following
compilation issue at the same time.

Smatch warnings:
drivers/dma/amlogic-dma.c:636 aml_dma_probe() warn: passing zero to 'PTR_ERR'

Fixes: b84b5197e344 ("dmaengine: amlogic: Add general DMA driver for A9")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/r/202610080953.C5TYlCaA-lkp@intel.com/
Reported-by: Dan Carpenter <error27@gmail.com>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Fix regmap error check issue.
---
 drivers/dma/amlogic-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/amlogic-dma.c b/drivers/dma/amlogic-dma.c
index 78ee2337ae71..684121d13fca 100644
--- a/drivers/dma/amlogic-dma.c
+++ b/drivers/dma/amlogic-dma.c
@@ -632,7 +632,7 @@ static int aml_dma_probe(struct platform_device *pdev)
 
 	aml_dma->regmap = devm_regmap_init_mmio(&pdev->dev, aml_dma->base,
 						&aml_regmap_config);
-	if (IS_ERR_OR_NULL(aml_dma->regmap))
+	if (IS_ERR(aml_dma->regmap))
 		return PTR_ERR(aml_dma->regmap);
 
 	aml_dma->clk = devm_clk_get_enabled(&pdev->dev, NULL);

---
base-commit: 42c31fec1ca76b8b5f7759def122d418dff2cd4b
change-id: 20261016-fix-a9-dma-complier-178b6e667983

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>


