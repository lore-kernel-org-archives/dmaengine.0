Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591D8523792
	for <dmaengine@vger.kernel.org>; Wed, 16 Sep 2026 15:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789572492; cv=none; b=E/hYGko7cbPrZ3n5P/d91I2cjOgWSv7X2fj8+4fFLKr0812KsXolPNVikePB+j481wOhb90y3PLH/NIg7qGuUyyB9OHmz1GFUtR5TYWz+1wuDgbjQOwwJhOXvYhVZmfzd6Ta5++hj7IfW2T8mhlwpqaPTYy2uI456kVyWvziIQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789572492; c=relaxed/simple;
	bh=BNXdpYcV6rP8Kzo2tOByWtdS1/BlwS7HT763SKS2iMA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EsJhEnkPZUFUHO1r3GbkF5z3ouASiIw2EEp4DLZm/RtOhauuzWNsiP6kT3zjSKhiADw5Lja5jLlauJcaG+5otsTny+t4K4HsF5STQUffHinq0lRcqDHDqL0AnxuimRZGDcp2rnlirpj82Y4sj0D+Cn/qU8p3vMOMiDcfsAQPwH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=W9gjuXhB; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="W9gjuXhB"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485933b2522so709138f8f.0
        for <dmaengine@vger.kernel.org>; Wed, 16 Sep 2026 08:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1789572484; x=1790177284; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VkAqAr7Z12LCHxwZegG/ZILA0Oydr34Y894kuKUR6C0=;
        b=W9gjuXhB/nuDHOWVpMdIBp4J6v9pOMGvpTv6C+68C3+LguBZOL96AWTXGOBxvTCFpH
         eY0PL2n6ovqLP+InAFXz3cgB5LDwBhSpj/PTUEK/dk9MW6nQwz5UaA4rHqEPVifxqPfj
         vgzc/Cv2kP6LdGoWmizj0e7CwGewfzr4BwojDKWxTRBoEpc1PBMGPzTVJbG9mjRGQZ9F
         yj1wYf5hkPWLKjMzd6hoc/UVwFJhhJixuOzvSjIirxenT5k13hnFxbrfSF6PSk88fQ8v
         py8JTF7shY8gliRRzghYQLqOrymlVuvHIxJi94wh2YVsHjzxGPr5pnM5TmCHK9fqyESr
         Y/fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789572484; x=1790177284;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VkAqAr7Z12LCHxwZegG/ZILA0Oydr34Y894kuKUR6C0=;
        b=u2rldxuzfKwPCTYd9ggqle9N+P/mrbqCRtaVoCTk0ijKuDmFq5Rt/i97Bp90e+dLYz
         utMf1vYRy54E2+pcabrs3e4MM+fxOROo7Z/wc7CcBo+Z/q6VZHC8z6G2g/219m2Rb81F
         K5zwbm56oS3fnOsQwzy5792ItW4ebOYslj475fngXBMqv5LsrlqYlwhHsc/kwfBT07wt
         EfT1Eqj3+q5zEdGkEfRw+v65ovUGQ//YQvU5od//+bEYacC2/yte0Gt8b0abiegx/j3X
         tjM/wmOpwt+fmX5VDXjz4Lmg0QKT3iJwa24vFcjMa2SSXi85kU9uaK221eQQVBxxLpIb
         kyKw==
X-Gm-Message-State: AFuF++nK+hE5S/m2rz2iTx1QrW6KP4WFT29u/egEAx04J4Ib/0urH40Q
	cZUKFPONpyRmKuHmLdCFWTPQQHgl0DawXjBSMnt0kd716WfkcIbkkeSD/vXpEK5Qos4=
X-Gm-Gg: AYBFou24HvKn4X78cjkIYQTv5srUjhmVf2eaXL/EzfLZ1LTyadNaLo40RXQYmYfzHqd
	YGF3FmxzzRYZ+dJxtPA1nK9ka3iNzVSe5fgxGjQtnyk5voAP0ahmc22/dJLi9aqUzs6adVZbwSV
	EaCKBaf+XKvwo4SDulXWWxSISOUHTqrY4XblvFpStkF4rbWoYPnrpgsC5UC74752G+v3XJ4Rl6w
	FzgWtwuSbNtDg68qZmNB8LMkT6M1EW370jl/cGK8JNAbwSuI/7lxRLFd7U2wWfyXYPLBrsvZUzT
	8+0rDFz69tu214o2rJ+1OkhAP4Ja3F6dw+1f0/2rVsItP/++Wr8xLW6ATUTrnS0cvSCL6glCMm/
	McVUzXMkfu7i7qjrQp/ZVOGky4A86Evchdbe/yAxxbzeD4CiGQPGzHiFGfBg8sX7pTGQ+mgWmJ+
	ti9jjIHtoBcsI6voXr30KrYkdN0cluCgLv8H14MrQD05GJB9dX2UaqY7fsZ/w1EgbLtdVDw7uyp
	cNR1YoHEt58iqdqETWiK0p63g==
X-Received: by 2002:a05:6000:4543:b0:487:62d:37d6 with SMTP id ffacd0b85a97d-4870d062278mr6043828f8f.23.1789572484275;
        Wed, 16 Sep 2026 08:28:04 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:f89:61fa:af44:9a4f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf37e69sm7886646f8f.29.2026.09.16.08.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 08:28:03 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 16 Sep 2026 16:27:57 +0100
Subject: [PATCH v3 4/4] dmaengine: xgene-dma: use named initializers for
 acpi_device_id
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-acpi-dma-v3-4-0dac05654967@thegoodpenguin.co.uk>
References: <20260916-acpi-dma-v3-0-0dac05654967@thegoodpenguin.co.uk>
In-Reply-To: <20260916-acpi-dma-v3-0-0dac05654967@thegoodpenguin.co.uk>
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, Sinan Kaya <okaya@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789572477; l=1050;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=BNXdpYcV6rP8Kzo2tOByWtdS1/BlwS7HT763SKS2iMA=;
 b=AClNkxjacCjqu2lCKsZx+DsWrRbiQu6gec5tz+hmBFOqGuNzaQ14tthza4xwpktAZM7gOUuZa
 Yhu36sTa6osA945ATkMT1gSapeUJJUG5HK9qcNADI/uNELqdvAyplxP
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Use a designated initializer for the acpi_device_id fields which makes the
code more readable and consistent with how lists are initialized in the
rest of the kernel code base. Also drop explicitly setting fields to 0
where it is redundant.

Unify the list terminator to have a single space between the brackets and
no trailing comma.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/dma/xgene-dma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/xgene-dma.c b/drivers/dma/xgene-dma.c
index fa1173e49900..8d1c58ca0d48 100644
--- a/drivers/dma/xgene-dma.c
+++ b/drivers/dma/xgene-dma.c
@@ -1800,8 +1800,8 @@ static void xgene_dma_remove(struct platform_device *pdev)
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id xgene_dma_acpi_match_ptr[] = {
-	{"APMC0D43", 0},
-	{},
+	{ .id = "APMC0D43" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, xgene_dma_acpi_match_ptr);
 #endif

-- 
2.43.0

