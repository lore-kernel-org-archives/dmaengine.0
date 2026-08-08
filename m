Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B2B37E30C
	for <dmaengine@vger.kernel.org>; Sat,  8 Aug 2026 11:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786188178; cv=none; b=DDLG7rvoWZ06/9hWMHgRaC2ujAEYDur1qHgV+wCxCMx5hGsrgSzh+zamsuYI0jvXKNeLMfZEVVMFrDFxxXnDkMENGraC8temxK1bKLt5nbXfv3KRY3Uw1BB+x+jWzNcG/HxNeNMaE7mJrbxqM69uWEQTi1ozCuGYalyicnx4FVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786188178; c=relaxed/simple;
	bh=YmTG5vVK/FTTLwiYHkfLbcJlBmEgt7LnpaAC7mAvf8I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oG5K9y6VuFF8BuWtZgX1Tzl4QabiKKypRpDzD7U8dK4Ty1zCA97k6/6NuCtK+BTb4H1W2EeGKzyEdSRluzBC61be1upsyLsOreJrg6/Hv4YaGFZfzt4CGOe1mnspCu2+/06PRkCQ7ijeQ/dvObALqJO924Jcq7PkQes0xWMYEpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ByaBF6Iv; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ByaBF6Iv"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ceaf8a1265so6673655ad.2
        for <dmaengine@vger.kernel.org>; Sat, 08 Aug 2026 04:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786188177; x=1786792977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MEwID2P1yRmU8Feq+ODsi1JwIGprGXNdUwcJktuS+tc=;
        b=ByaBF6Iv7LYHgN28kQY44npWWC3vHDwDY+kSHIWm12IKGjmvgfFjw14t7xqflCi6FP
         cjWbUjwBMuySXxYhNhql9lS5TQ7ql3sM5CZuR9wjm8gn0jnOXTDrkeWFopmt+HJcmcKt
         b8CPYMnKP43GBVhK7aXXqc4sWk3dx0qlP86MXq2AfqG+7XN0ffP869YJwDA3oTrC9X6o
         839TPXdf7bJ0PLT004h3F5O6slPPye8Bj0VH8xS8rWideciyN8y5DVW7uve+TsopUO72
         lirD5HttjqYCj2o3mc+tCBOoWAXr3S/gxquo+c/dtLR5I0GOitaGnmrUU5IQVikjF9WA
         0TFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786188177; x=1786792977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MEwID2P1yRmU8Feq+ODsi1JwIGprGXNdUwcJktuS+tc=;
        b=rQ77iM1nK8oyHZfUkBJjneMkuX21aAaL0x+2HV2KN2xcgOn4+6kZRluStoM7Qay6SM
         mDGfhm1AZ0vJu63Ah90I1675QWQfvxvR0nV8pWL5IZNvLz35fKCndrrBE6N/YYMzU7o7
         sGj8Wjx/iAn9OcAT0j2ZL48qC2QRFOoRwm5RGwLOOXqivlrD1O1ycWNGVY10sVdKjTvw
         RnZ4fwaCYjGZga+lsKgxXFCZfEkD93Dz56qjags1vCJ0VRFv/orAh/SNYBxmlbn6CrA7
         LyHYQKirCV67mvAmtvVesrd5gHuhzqEi6f2HV2PZD9z5DWRJglUgFIwPErsUtDEKu2Sk
         0Qhw==
X-Forwarded-Encrypted: i=1; AHgh+RqLiH77E+2vNVqSx56TuW0Ce6G5rzC+SD74x5e24l5wg2mr590WgFcHrlSvQIFC/6ohY9I4wLMFcWQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz30NzLHLQeD6JOsDt8gKDSu5+32cf/goQBS8KpNjQl78FTs00l
	rkjVeG6RM9a6kWUQ0JwFBKIVU1kwAEC2UUJ62F9RhLYGCGEFZPaC7MU+PIkEAH194q8=
X-Gm-Gg: AR+sD11NIgEWb6G283cHWzwGywoNNdJ25UWb+X8+zXevT0po48Vbve0nxvwd+3CpWiK
	bkIVzOY6jjDe6A4PAMccMqTI/1Pm8fTINWewOrZ1Rv3VI2lgmfZvLj5oU7MZiRU8cyC2yUfyAyx
	3nxr2MWDnjt64MubrhgJjj+wcuVzX7xXL3l+th3J71jXaWRndedqH2JFh1GpImDEFZyiwtrZBtU
	5Tkv6f+wnQqUiaK4aYeSCzg0T7EUZDSaHYI1YdQ6cHatgxuxTVTpbvsuMDGOnrmTpFxPEAf3dxg
	4N7UR0y7WfLcLu8e1Pvo/L9i2TtbYwHu8fqoNOUNS1lhjNl8rNv+l0+ckyL3XWiUYqwnQ84X/qE
	t9aAi/aGuHG3DX6MPkn+OYWctSOqGzaEhdoYKGXa5GbXxSAg7Ct8ocK5heMfF1kCsAKLemqQqSA
	uhyZwqTu+k/K5olCvwQY1PgilRuTLCV6X5vvtmvYNCjKI=
X-Received: by 2002:a17:902:ef4e:b0:2cf:b68a:2050 with SMTP id d9443c01a7336-2d0ca775824mr364281175ad.15.1786188176638;
        Sat, 08 Aug 2026 04:22:56 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::f280])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d14dbeeda6sm18048745ad.42.2026.08.08.04.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 04:22:56 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Sinan Kaya <okaya@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] dmaengine: qcom: hidma_mgmt: fix autosuspend cleanup on probe failure
Date: Sat,  8 Aug 2026 19:20:43 +0800
Message-ID: <20260808112043.2781244-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hidma_mgmt_probe() calls pm_runtime_use_autosuspend(), but its failure
path does not call the matching pm_runtime_dont_use_autosuspend()
before disabling runtime PM.

If the autosuspend delay is set to a negative value while autosuspend
is enabled, the runtime PM core increments usage_count to prevent
runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
during cleanup, this reference is not dropped and usage_count remains
unbalanced.

Add the missing pm_runtime_dont_use_autosuspend() call to the probe
failure path before disabling runtime PM.

This issue was found by manual code inspection.

Fixes: 7f8f209fd6e0 ("dmaengine: add Qualcomm Technologies HIDMA management driver")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/dma/qcom/hidma_mgmt.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/qcom/hidma_mgmt.c b/drivers/dma/qcom/hidma_mgmt.c
index 4805ce390ffa..470c88f36d25 100644
--- a/drivers/dma/qcom/hidma_mgmt.c
+++ b/drivers/dma/qcom/hidma_mgmt.c
@@ -168,7 +168,11 @@ static int hidma_mgmt_probe(struct platform_device *pdev)
 	pm_runtime_set_autosuspend_delay(&pdev->dev, HIDMA_AUTOSUSPEND_TIMEOUT);
 	pm_runtime_use_autosuspend(&pdev->dev);
 	pm_runtime_set_active(&pdev->dev);
-	pm_runtime_enable(&pdev->dev);
+
+	rc = devm_pm_runtime_enable(&pdev->dev);
+	if (rc)
+		return rc;
+
 	pm_runtime_get_sync(&pdev->dev);
 
 	virtaddr = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
@@ -310,7 +314,6 @@ static int hidma_mgmt_probe(struct platform_device *pdev)
 	return 0;
 out:
 	pm_runtime_put_sync_suspend(&pdev->dev);
-	pm_runtime_disable(&pdev->dev);
 	return rc;
 }
 
-- 
2.43.0

