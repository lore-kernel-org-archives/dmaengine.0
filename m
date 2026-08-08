Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F35367F5E
	for <dmaengine@vger.kernel.org>; Sat,  8 Aug 2026 09:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786182431; cv=none; b=tZuBrkPjBZ3m/mSHCv2zz82hsNmTp4p9SYbK01Lxjk+Q2OBhVlx/z0xo5TAEVqQMKDJ1mwwAjbSBixK5Pc8LATPuJJ2VFDIA7LrKD/NJCM5veBSuQOtu4qIJ6f9e0AjYB8Dtbum42HGp4it8LSo0RVykm9b8aU9HoAFRaQtVTCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786182431; c=relaxed/simple;
	bh=n+VHIM10UQAdsOrOgWwVd3HizjL61jNMNdfdNzv9CBg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VuEy9XiS8Yros6tJfC1AicstnSoSlyt9+cCMjJNLkM1uuRdg4DAFnwIu3rOgsZLk98ovRFoVD6+aL73hhFIn1zWgRjHhvSjZqfpOOP0dnB7dKpJdv3a3Du4NWipkCwrmeWg7YgMSg+aGfl3OScsg0K88xrWY7jPQ6vmU8xAgtM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mNPNuTdg; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mNPNuTdg"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c966b9ee9cbso153161a12.1
        for <dmaengine@vger.kernel.org>; Sat, 08 Aug 2026 02:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786182429; x=1786787229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tyg/k3QHvoAlSDHqgJ9zjC2EsZ+xAbQy3JHE+24858g=;
        b=mNPNuTdg+jbnrMnh5lFO3AtQXsacgAv7WBq0wgfGs0uoej3WdA6v9hWhoIJ0xK13dk
         PI9cdzfmCItvjaEcmguNPOgq+BktK9RZF0mK8W/bAJdzv30w+DDas1dLHtQSyjlfXAE+
         Haapmp3brnJv1Bv4a7hqiRJniSlwyEM3NV9PHesm/w5TBHxECO2XVwfeWTsK4GuXdkV/
         48C0VH4I+pVZ7EWp1EiZy2Y6epvdXBoZ9Sz6nULX3pWK5hjnk9Ih0J2StYVUEEhRSpfq
         UNzJ//3GdhBakHSzFWcjMzZseOM1784W6qCxN/CBzWIydJc+C8TlaKS73zmYyGI5Da+r
         b/TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786182429; x=1786787229;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tyg/k3QHvoAlSDHqgJ9zjC2EsZ+xAbQy3JHE+24858g=;
        b=ZRDpjlSW/ZJSKHjiQMhInmIYXX2o0HI/i6QguVwYNzB0DGJRE6RxApNynmGiC+4YSu
         VmYTiRhO1M71DB6otvdhr/hBZHrijV/vf28w+ROBM9KCvnXOs80HOfuzSJ2XHXcoKi9B
         R9zI1dJCSlF63e1XwW2UXEAfeSR3vKqdC8vxcy6ZsyP1D2oirlZ+AKT6Zqnd9EQ3Kg0F
         aV9RM0BaGfa3HbA8zfnGTnRI5JLrLODR6x3qslo3/SO8aefin938liZcZKx2U/8PR5P8
         mYTC5v5PiSGhCxm5qS/i9qGBONAIqN90eXJVGxESjOFR5riT0vG+OAIly7od6pKccOiX
         raYA==
X-Forwarded-Encrypted: i=1; AHgh+RpIQDG0P9mW94cwXDudQIjg1u8Bumc7PRKc52s47apPTJzeUEFpTFA7XrJGWwB3UeoOOeMP8MsYUWw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBTcnJ/2R1UV+tgqqLGaYW4W4KEJjxEJUnwQchuLBzvM71Cfy8
	vi4F7Rn47xmYtEVmmVdvuZ6aYkQ03S3OXQIaI8EIM7wWccnp7RYlwu9w/IBBE4sI+bI=
X-Gm-Gg: AR+sD13A253IEnHbA2xkMURo+TSPgd3f2z0ibZOiyssqnt4CiYDa80pa1G1wWQlOmhm
	nQft5PEmON9VyqtfDqWT3RKo7R84WdQdiC1d9gVwId2qEAHM7ByyfM78srUo6uiMpFHVUVVwTkn
	5KSpIK3nRx1dTvz0Txh+jtb3xcOpzQ0dBnKn0i/mB0pJUiFF9wE2r59RiyUstxKyeIyO6s0KsK9
	wLYzOcRQx2pFc1J835fC3a61Hy+32WgsrCaWWVJ9ILU7iPWZptnv/NtTpZw8q6ztWaA1Ki+oV0D
	Uejg+9bUXlCSKOHvvAoY+MWPqO9fh5ju63EONM26l/w2WT9u3VwbJ9So7lpzRGP4JwoqW3d41+K
	J3X9Xs+tzwoLjwuRxiZZ+BbgywFfeAODEFCvxNamj3QFQqQaSEKL4DhRn8i8/v9fXDc2N6RD4BV
	4wO9nmYP3hQa8dx07R7r0hMOkKmaNhvhb7SBianjXM8lM=
X-Received: by 2002:a05:6a00:4b02:b0:847:8acd:747c with SMTP id d2e1a72fcca58-84f2e022980mr30903415b3a.13.1786182429006;
        Sat, 08 Aug 2026 02:47:09 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::f280])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a51e9fcsm1983113b3a.36.2026.08.08.02.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 02:47:08 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Russell King <rmk+kernel@arm.linux.org.uk>,
	Ulf Hansson <ulfh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] dmaengine: pl330: fix autosuspend cleanup during removal
Date: Sat,  8 Aug 2026 17:44:52 +0800
Message-ID: <20260808094452.2752443-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pl330_probe() calls pm_runtime_use_autosuspend(), but pl330_remove()
does not call the matching pm_runtime_dont_use_autosuspend() when
removing the device.

If the autosuspend delay is set to a negative value while autosuspend
is enabled, the runtime PM core increments usage_count to prevent
runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
during teardown, this reference is not dropped and usage_count remains
unbalanced.

Add the missing pm_runtime_dont_use_autosuspend() call before restoring
the runtime PM usage reference in the remove path.

This issue was found by manual code inspection.

Fixes: ae43b3289186 ("ARM: 8202/1: dmaengine: pl330: Add runtime Power Management support v12")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/dma/pl330.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
index 25ba84b18704..8baadd104719 100644
--- a/drivers/dma/pl330.c
+++ b/drivers/dma/pl330.c
@@ -3204,6 +3204,7 @@ static void pl330_remove(struct amba_device *adev)
 	struct dma_pl330_chan *pch, *_p;
 	int i, irq;
 
+	pm_runtime_dont_use_autosuspend(&adev->dev);
 	pm_runtime_get_noresume(pl330->ddma.dev);
 
 	if (adev->dev.of_node)
-- 
2.43.0

