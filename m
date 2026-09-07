Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5912501F5A
	for <dmaengine@vger.kernel.org>; Mon,  7 Sep 2026 15:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788794295; cv=none; b=DEUHWruYzkxIBTaPwjZmuIRTyYgkOdH61bp3nccApgnFNElTv6S7CdNnAasTYjrYNIgu2PE9r2BS5gvoi5STHI9IVn3ZYX3J4fLM+yGwnNT+zvKroGhFYGmqT4yqY5YsTviAaQmtOKAe72k4GU917Ah7p8ACE7EhCioZbUiL+jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788794295; c=relaxed/simple;
	bh=fh4C/z0gOMcS2SxNxy2cC8TlLYkqOtVy2+16qwp+aMQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CI8HPGb1j0y3675S5fnX1J2o1r/EFFbjN+N0oEiaxWL2kEkym1KrJg0W0AYFwMgGylNUPxY5HHvSMhmLqtXDoYX9Zex6tVNHJQGKUHv2v9+qggk5NplMIO7QD8J5Ajj4isXy7SR0UeURtrEPsAy1326Ly4GoxMRQdvSU5aZ64E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=eME5Hkm/; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="eME5Hkm/"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d6e954afbdso22909285ad.2
        for <dmaengine@vger.kernel.org>; Mon, 07 Sep 2026 08:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1788794293; x=1789399093; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nvKdQrCWkYxqdOjbu2Fib0GGvdK3uXcjnoDDmIYN5Pg=;
        b=eME5Hkm/RBryDwHnhCIuHVbMPVfQuArZHHF0RlazoFeo7ywvJs1nnqLf311e3cudZS
         vIW3N9wAQVv7aXPaFJOudLEuIlAC5C+Ie6wS8QLCwuNbPWQCM5I9Ey726BF7Nj6r4rvq
         ldcAoEoasW5zrXgajl3foG1x5tzzuQJ5blVIeW3vjkNpryarNMWbahBGA4oQnSQLuXeH
         lQ2lx2J84clTZGk2kARplr8GtHdxJTiO6k1NAR4wAc6ZocjlVyuw1ElgtsGtff4feFCZ
         6x4+CbkN1E8zyqrJFelmeGzLPtwmhfmHQqdoKkGwGqBKRtSOLIHh8EaUFnA0UHnAYQBY
         DI6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788794293; x=1789399093;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nvKdQrCWkYxqdOjbu2Fib0GGvdK3uXcjnoDDmIYN5Pg=;
        b=Zvho+Lmjxff/pvHq7lHEx698QmyA3C+etVRexyQNBWAUSD2IrUtaCurMVNoYUZ1JzR
         qbeNP8Rb570fcg6moLw/ZySvg4oIfztGDQ5kEn5pXxvURPmNEb15eWbrk4ifQIbsvXZb
         pqJ/zljXjjOYI8a2+SPdsuPMAExmIfgp+kd2S1bcYL3XnGQYwYcnYMhSiozZfKuMmcXt
         mAdneYktuWo3+yxjvKFESAoAHs20mGXFb0CQ65l278dogEb49iIUf/ctcvG0oncc4dNE
         DdEDs8fpdEz4vVIVOTQHzzNuPdIS9yIXzb8LPcEzfhVumj2D0ytO5rd/G330em/AA8GL
         CiUw==
X-Gm-Message-State: AFuF++kWfw7W5D5/e3Hp3NMcoD/5qi2zpREckcg15dKJq9lXAxHOcBDe
	bkKm2XJpv2WVc0V52eZRTrjgsD0h3Je7JyuKUoeyX4SyLuRnKJilffLTpR/CJg76V2k=
X-Gm-Gg: AYBFou0IJpRz5pSrqmIz5ygOe1IkFsU0XHK2ZPezwq+KhhXd4M7D+JzOdyv/tSDMgt7
	Ye3e3Bt4bt1Gr/UyhP5Tc84QAP5wylz2FZKx0e53URX7iOxerkuSJk9v3jkhFf6H6r5G9X5ZkLS
	vKI6WCqAdUnOv39ddZ1XMN9Sd7CtK6IPLXyXOyW7w21KLA9Xm0+0iWVdkxDLfN4e56GRCrTirFi
	Gk9YJUVBpiNIZgnuWgLSoPHHiZKJbtgDJ8463Ai6aa/KHtmT1SRXScqRiaHOMDh00Gc5/CGHx7P
	pMA5NQ21tGYSjZMiBJ0mfKJEEy4yYxwhgrLHBb5aH5MrpLmmwLmru9MYloAanju7dLl9xD1f7cp
	5gla0of1ycMVMJD28dOjz6qk3XWetvk3xG/zGHs9qnoQdw6rIbPKkbopgaC6jGDSSGlVcJtqUM9
	TgcxI+op5L8v958GKdwwElIkbD6c2UeZUeugQh/2D2VncLK6R19jwxjvP5exy2Mm5He5FcX6DZZ
	ifYdpX5umflKy2B
X-Received: by 2002:a17:90b:264e:b0:398:9bd1:3215 with SMTP id 98e67ed59e1d1-39b262e28cdmr37304540a91.22.1788794292966;
        Mon, 07 Sep 2026 08:18:12 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:9f74:2a4b:1c38:e2d8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435648esm33474770c88.5.2026.09.07.08.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:18:12 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Mon, 07 Sep 2026 16:17:45 +0100
Subject: [PATCH v2 3/4] dma: qcom: use named initializers for
 acpi_device_id
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-acpi-dma-v2-3-0ffe4a007992@thegoodpenguin.co.uk>
References: <20260907-acpi-dma-v2-0-0ffe4a007992@thegoodpenguin.co.uk>
In-Reply-To: <20260907-acpi-dma-v2-0-0ffe4a007992@thegoodpenguin.co.uk>
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, Sinan Kaya <okaya@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788794281; l=1191;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=fh4C/z0gOMcS2SxNxy2cC8TlLYkqOtVy2+16qwp+aMQ=;
 b=lEzBJa92p79RXBpbg9r5dR33uOutrn5E0hxQ7UxPS98ZaD2IkJ4e/zkFY35j88BW8cf9ythBf
 J/jneLU7bDoDs7qzGYXOIFNTn627bmSfgSTZmlRaZKicK3+XFUoz2k/
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Use a named initializer for the acpi_device_id fields which makes the code
more readable and consistent with how lists are initialized in the rest of
the kernel code base.

Unify the list terminator to have a single space between the brackets and
no trailing comma.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/dma/qcom/hidma.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/qcom/hidma.c b/drivers/dma/qcom/hidma.c
index c939635be21d..1349066b1544 100644
--- a/drivers/dma/qcom/hidma.c
+++ b/drivers/dma/qcom/hidma.c
@@ -935,10 +935,10 @@ static void hidma_remove(struct platform_device *pdev)
 
 #if IS_ENABLED(CONFIG_ACPI)
 static const struct acpi_device_id hidma_acpi_ids[] = {
-	{"QCOM8061"},
-	{"QCOM8062", HIDMA_MSI_CAP},
-	{"QCOM8063", (HIDMA_MSI_CAP | HIDMA_IDENTITY_CAP)},
-	{},
+	{ .id = "QCOM8061" },
+	{ .id = "QCOM8062", .driver_data = HIDMA_MSI_CAP },
+	{ .id = "QCOM8063", .driver_data = (HIDMA_MSI_CAP | HIDMA_IDENTITY_CAP) },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, hidma_acpi_ids);
 #endif

-- 
2.43.0

