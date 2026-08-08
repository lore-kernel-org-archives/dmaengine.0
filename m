Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E573B14D4
	for <dmaengine@vger.kernel.org>; Sat,  8 Aug 2026 11:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786187217; cv=none; b=F+r3ph/ddCWjMD4RSdsdK4BUg5Gh8Na8wuQ9tNpHW9GIoBc/YSbLE77mgweoKocCYQL4ZFG/K7e+bfEsFyH2/Erv2WCLY9LYFES/VYdrHr0HAtgU5Zl8bHnE8qpbWaI6pAKPKzfxP7Nrd8SDjtl3kqxu8JEm/WoBkdwD09UJuXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786187217; c=relaxed/simple;
	bh=J/ymqtZ5t4rqiTSWSp7zbVWBqr+7P+uQXvX3Ct5nAoU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ylb4TZSLyvdtYJlwWUp86+TyfjZA8aI+BKfjSuQ8itA2uiMJXV236oxByzBdl/ekboc+YJhR/hkqNZ8WT1YPQxgyQJhmfIc+P8LgrnCzyJw4oBWml98T6bGKnEBeBZH+Zx6fWe9XNrvxjzMm3iv793ez+QXMAxKAImOu0Vdr0oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fy/Yj0Ki; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fy/Yj0Ki"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d02b4c3601so4415985ad.3
        for <dmaengine@vger.kernel.org>; Sat, 08 Aug 2026 04:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786187216; x=1786792016; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M8p77R5oDeTzUjp3uZU2mFPZEkph6YP/aLn1kfdoEnU=;
        b=fy/Yj0KiYipgqOQm5AZt3hYehKtzjZWKSsuMQS7Vi8iviYvCrYXWm8avEU0qQ7HJcW
         s1MwSE7S1VVPPnT5NhuU1EYkUwviPOH4xcveqLDXnj+cWkLUEQEOOMrRuBrLuk+igfhN
         Yt66gBg9mMoTKVnHRfQvy3MhuZV4LNCvgPc3XCSddrjxPKC7nvEY5sx454o3YkcwMpqr
         qXMN6jrQBvVHtj3v8Map/3vrL7jrSvjZJ53ff1jquW5RhjVJ9nxZ+tsAmCGTM11eK5ry
         fVmBsxcMSj28JmPOZHF0P0t8g852+inlgmq5OY6uGBUnbS+/m3mkFaXfJnp6U5l+1E3B
         dAsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786187216; x=1786792016;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M8p77R5oDeTzUjp3uZU2mFPZEkph6YP/aLn1kfdoEnU=;
        b=Yk6A13KoNqeoNphX2jefonykMg9XpGSWiXXUmEQU24ROplaJm8c5TdNLDjmyoHOy2K
         uJ88amEgdMrbup09Ihe2JLzyDJcx4PUigKUXsvHl7DIQiggUG51Z0y4t7h3qajbOQWtt
         HxuBHOomfT+2Zoia7MVSwALeLWBRqExipUK1jF7fTbpx7OtCachI1rfcErS+1KCyjyFU
         Oz9ebnDZQU/FTR/G0dnS1M/jP5Hf0i3ydT9XLSfUBL+/KpsSFGfwKNhXz3ttiKKrUoHM
         7qdcE02tEAMS/zuy+ria7kv46Wg/jg84VsBWfWzPoKNq0pNTX0SG7+xQW6AXYpvKATBQ
         Ix3g==
X-Forwarded-Encrypted: i=1; AHgh+RrYmqGv6YabxVuNd+T4DXLMbaJwNzO5B2KMxDteZ5tbcT5N49rXfXwBQep7kF98qYWrAim+0xqSMuY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz80Q0gKYXqH2p3GW4La4UnlPz8B9dpLyWzzIuFd5AfyS5ErdDs
	m0euGOAebSFiyqRxE65rUx6x8QwBVaO56S9m1NUIB0BDOAJ6jEnu1Dg/
X-Gm-Gg: AR+sD11rqmKeNZ3+kHN/zl9Rx0oJHEwrjlOh8z85LRJYp6vHxxPV+6/AaKPa+mlVvUx
	1bXDPege9EmAMIaxdGP3GS1+dmoC7yEwxqSIzXeLNwyXGWDicxJt1ge7weRgUaDHvbyNa18h1M/
	6eOS1ni39elhdW+iQx95Opuap/2mkKKvgjClu2p8K2a5lqZFV1VPNL6zfINpG8PL2oKsyE4OH7M
	PLD8puroSPREWvw0cmgDn2DfrkN6i4Nv/yF/IMVnn1c1s97P0LxoFLVpSsx6prH6N3cJtVWQors
	xB7UinmQpTkXk57K+dfxBmAApjWwSDqPN7OfagxeaxzNiJoWi/oGfDw6mHijWkYAF02o3jsBKoJ
	hVf0+LPawNR84JD1ITJwoOSzn4qlUKd1z8AGgkpP7qSjPYuTjHxm9rqBdm5kb6oWfftIchsqjzJ
	uCB5WWBl9l6i+lh2QI5KK/8mXkGfuOu6lkQHNxTuJaKSFhJV/fjBagyRfJAw==
X-Received: by 2002:a17:902:e851:b0:2c9:de53:f84f with SMTP id d9443c01a7336-2d0ca9904acmr318334315ad.19.1786187215843;
        Sat, 08 Aug 2026 04:06:55 -0700 (PDT)
Received: from lgs.. ([101.76.249.46])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d16c4e1182sm18019325ad.72.2026.08.08.04.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 04:06:55 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
	Pramod Gurav <pramod.gurav@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] dmaengine: qcom-bam-dma: fix autosuspend cleanup during removal
Date: Sat,  8 Aug 2026 19:06:42 +0800
Message-ID: <20260808110642.2770355-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bam_dma_probe() calls pm_runtime_use_autosuspend(), but
bam_dma_remove() does not call the matching
pm_runtime_dont_use_autosuspend() when removing the device.

If the autosuspend delay is set to a negative value while autosuspend
is enabled, the runtime PM core increments usage_count to prevent
runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
during teardown, this reference is not dropped and usage_count remains
unbalanced.

Add the missing pm_runtime_dont_use_autosuspend() call before forcing
the device into runtime suspend during removal.

This issue was found by manual code inspection.

Fixes: 7d2545599f5b ("dmaengine: qcom-bam-dma: Add pm_runtime support")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/dma/qcom/bam_dma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 1bb26af0405f..05a3b1f9e0c2 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -1401,6 +1401,7 @@ static void bam_dma_remove(struct platform_device *pdev)
 	struct bam_device *bdev = platform_get_drvdata(pdev);
 	u32 i;
 
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_force_suspend(&pdev->dev);
 
 	of_dma_controller_free(pdev->dev.of_node);
-- 
2.43.0

