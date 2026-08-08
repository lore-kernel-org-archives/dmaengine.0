Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06E0243964
	for <dmaengine@vger.kernel.org>; Sat,  8 Aug 2026 10:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786186633; cv=none; b=g+uXe9HZXSfqI7AWfIayIPk0pQTbWv2D8CjCdDxp18AwnU5eU05mboGdUCOhTWOB31FofTiMydeW4QUW+zzif61xzcp5LqY0IyGHYYgx6tJx7guuPlnjiZVYrwGDUA8MO+sFfk0Hdx/i1pMEaNjipo/0ygEmGyJoTUctrzXi4wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786186633; c=relaxed/simple;
	bh=tb66UxTSAQrQUkai6y4yVLMKfp5NW2EVJnReCmrxdwk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FNCEWyAKWyVcfh8prB3MLeS9z0A6WNYSfpustPXd0P19NgM+eXrSPWC9OZNvrnF48YkmT0o1vRvrK1RVT0RLi6+pcainTm1iaJ2AT3q+7WLaALo+Owba8vsn5tGi8vIabY9KhGfBBQUOS6EXUEXoWnKngxa5uo6fxURTyhgsHIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OBqLjq+g; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OBqLjq+g"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cab973140bso6033095ad.3
        for <dmaengine@vger.kernel.org>; Sat, 08 Aug 2026 03:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786186631; x=1786791431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Be6DCppg/DEo+f3Oq+NlhfXUFVlwKCwHdneTqVx4xfY=;
        b=OBqLjq+gA5gThtZGrTiw2PGoIq7592z7KWZVoTZViQkVoyhaNFQDEMfBpul7CEybEp
         ZxBieoJ4jXkaCpw8BLEMJ0L73PxPd3fEScInk3Qy6MCdQ9/jdsaQgqNsLrPsTjrSPYUp
         EK4FiS++xvz4OwzkH0YxatHY3bEE21IDQUjFvAJUlQm7tDCvV2UMm5CTVWuq1XtBHCk+
         /395/SbmNhFUbql64hkV8NoqX0s/vWv8CkoYQdCdC7Q0lVxZOmxoLvJc+8SrNblGUItN
         mh9rAgcF9lmSpuRzeS1Xz6ahZmWcbGa1TVG/u/1dkFHd/VBR7N+39UerGefGsXKgBVZc
         hp5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786186631; x=1786791431;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Be6DCppg/DEo+f3Oq+NlhfXUFVlwKCwHdneTqVx4xfY=;
        b=cd/SC88yw72840PJSuknf8zE8HXMhzO/Vl8YsK9M/n2RcWcYA7bH/tnhZYjSTXVtd6
         81k1/Y7SBZIUV7muCOI3ffB+CgTIOJs0naKi4WVpfqaL3SOV1s4Ook1yrH+OrOKAR5zT
         FHy4BJK1djzV5fTjOyck568iudBjooZ5BrduVwE0xqBMoZIXbNWVpUARG+cojghr0Tap
         73miv1y9CP6Vh/+gsPg7xsWa4PGBNTmSfq7pqBb5eliXhBsxn6fB8ieTNQq0W5QmrUhK
         J6Ok3Ep7dogy33kXALMlXORm7smlzqxc/ZW/ipIB4e2a8FoqlDSWHAG/qehPDxU3LjAA
         O+8w==
X-Forwarded-Encrypted: i=1; AHgh+Ro4ooNFPBe4/WihIDzjIaGIydVj+//u2xwOFkbpBK2Xieau/VxSNlxsP+Q8Iuyk26uBDKLzT7buxJM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMZ8pG6Ng/O+n710aFTmZ5teNwmoJcOXigfig2xpyEQneceXuj
	kqahamyVCUo4+GDveaBM7Rty3nZu749w/yqw6G4RYezOty32BBIDAg0P
X-Gm-Gg: AR+sD13HHcvWgjGVkjLeI5DQkViw14CbxRVrv7g44u+o9Cxl1IacBNStGHELjCaR3jC
	TwvkRcxP3XwKhpd4QjaDZuZJybxvbSM9sRewEKfJYGn1YVSqMJZCp4tW76l1chsE3zJLTB4KJ3V
	xk3OKyYnFzVHKJLB9cL1gHjV9VLORVt8CQ9aAuvVcBjQiff1tJPBiyFr/WXCD7zoAmGaeORo5jp
	UkiG8OEYB6N9kb6Dbd5JVWV2T9nvng9znIMl915s8IcirDVGjC4F5ulFwF1Ravci1LFxvNKV2+D
	txMESJaV9svy4cX/3L37g0AGmryhwzZVB4BMSpP7Tn35qvhVAI2k9yY6zwvJoK2HvlWw7092skw
	dGVULoO2mVpJI5oR7wAoXzLzV40FRqh4abiIW8TZ6fCBx3SPZkcZ5e+evc+7scIkWl1dfWqaBSn
	dXEi1hjxUb0BXwqAXMspskS2v+Y0mykyV/J3PquYB4q8Knogx4Vg==
X-Received: by 2002:a17:902:e5c1:b0:2d1:134:b86e with SMTP id d9443c01a7336-2d2a845758amr69362385ad.2.1786186630914;
        Sat, 08 Aug 2026 03:57:10 -0700 (PDT)
Received: from lgs.. ([118.193.39.24])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d14da67e21sm17661175ad.37.2026.08.08.03.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 03:57:10 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Srinidh Kasagar <srinidhi.kasagar@stericsson.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dan Williams <djbw@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] dmaengine: ste_dma40: fix autosuspend cleanup on probe failure
Date: Sat,  8 Aug 2026 18:56:57 +0800
Message-ID: <20260808105657.2762974-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

d40_probe() calls pm_runtime_use_autosuspend(), but its error path does
not call the matching pm_runtime_dont_use_autosuspend() before
disabling runtime PM.

If the autosuspend delay is set to a negative value while autosuspend
is enabled, the runtime PM core increments usage_count to prevent
runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
during cleanup, this reference is not dropped and usage_count remains
unbalanced.

Add the missing pm_runtime_dont_use_autosuspend() call to the probe
failure path before disabling runtime PM.

This issue was found by manual code inspection.

Fixes: 8d318a50b3d7 ("DMAENGINE: Support for ST-Ericssons DMA40 block v3")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/dma/ste_dma40.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 0d9ffa3e2663..e2ad50e0fec4 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -3654,6 +3654,7 @@ static int __init d40_probe(struct platform_device *pdev)
 		regulator_disable(base->lcpa_regulator);
 		regulator_put(base->lcpa_regulator);
 	}
+	pm_runtime_dont_use_autosuspend(base->dev);
 	pm_runtime_disable(base->dev);
 
  report_failure:
-- 
2.43.0

