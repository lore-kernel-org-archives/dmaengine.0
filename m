Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443574ACC83
	for <dmaengine@vger.kernel.org>; Fri,  4 Sep 2026 14:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788531060; cv=none; b=Wku4hbNOGeTAir7Fd3lb83Y3F0giQ7CeHpiCtJBM1TTM34zOx4WKLrMDReQ7rsDkI2AVNyftreIPuq/KOS/ErpAwXPMLnCaozEoIqDUkqJO3cOr4TK3Z8SJnBXcvS3TrkpRXYfkEF27exbAeEVx4cgf8PYuIapY1yZJ/w/HRJL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788531060; c=relaxed/simple;
	bh=aQFEA3y1X11okBv1IVhRwHPokxBF08MtJtdbM64IarA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XbusZtuDftaf3eK04efvCnoiU/oM7awrduUU8YitUyBdc8aqEGPPumnMLus5pytI8ALWCJ19M4ZZRviO8g42tuc63gt3mJtyGO+Ro3VDAc+QU4I9Ff5z8LWEa6NAq28MO6cPLakal/g2YAHvlcV+GYUv/kESn7Hs0y32O30Cbmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=ypaBJMHp; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="ypaBJMHp"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b4ab4b4179so964140e87.0
        for <dmaengine@vger.kernel.org>; Fri, 04 Sep 2026 07:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1788531057; x=1789135857; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K6e/qZqWNu7/NIcUOvkEH6TkAX0V7d4LsbvVhn7euaQ=;
        b=ypaBJMHp1XDOANgmjvC4oC9qR6VUJ+ncHk0Cty0ie3gYgRFoGTh8SAa4b8nU7phhby
         QLEnRDscPNsS0TOsdPe3/ijnpkTNuYN9OquoEghkPxzVrKIh8sfF3ccLit2tPqZoE8d1
         IyFOoyDTnm0w7lyIWCRnIt7FNv19MtxWQ5N+qu0tCZJo8aWTdNfXqKuDiXNVxN3joPVE
         jil38YmTVkRra0v+zVjFcht0qluIqd0DzuRByMyVsFlsnz9VxpRmpFswBeorYbJgIY4p
         WO6H4JMelAwcYVpb5BQNW/kaV8rAFWPL35TSZou33hGtOceOivxx3NOpEb+W1J8rqc7k
         nl0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788531057; x=1789135857;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K6e/qZqWNu7/NIcUOvkEH6TkAX0V7d4LsbvVhn7euaQ=;
        b=YfQbdI4ht80eaLsa0G7NGsOTenL3qMoZmL2n6afmgDkwP3ivPSZWzVf3x/blCptTyQ
         VQHTLInTZAj4b27Y/KzI06s0/7RXAUylHmPpLXPIc61c0qStqztkgn/nLDqsPhcNY7Ak
         9WeL8o/tT0Nl8gSNL+XrAwPbvt9uqtKd14Iji9/dcAkwX9DwyWVdLXUao9jMviqiJ9Ty
         e7A320KJ+8GB2fqeabH0Xfbkl5zrdz8bpI0PhytQuK93jJwjc08KVHi9qH0Tu4CXEzMm
         hbCfmqtF0ccRb5RjGOBrYJQqlxMTB3QhS93wL9BJRPU/x/fB+y4PZFxgUMBID9TCIcfe
         U9/g==
X-Gm-Message-State: AFuF++mT2F73E/BQZBzynSwTkBORBj+Tohhqi9PmJqVtwHfKhNjennDx
	nm0noQX77pRq9vyGnBV+sZgohd2N2DbDPP3G84Jydm3PyPy1z9cPXtqjHf2ZBDakW6taocM1HoY
	m8JRu
X-Gm-Gg: AYBFou1uwZzHPs/A4ciJZtF/dJlV37lQ2L0zUTq88xBf3m37WJe1zE/D+9VBaltCEBQ
	oRoVF4YAeP1SAMDP15wWIS4FXWhDI0UFvnqt6MYrBPpe/nXmUR/SHOZY0rS24U/ntez+m5Bd5IL
	fae3r8EJFvFLQXYI64K6wI4MkvuNNDatXh4z56GO3cflhzPex7dvpwTzUGYQBbNV6Wz/M5FIdSZ
	vbYX+2wugNEwOm4xU02MNew0VOxs7NZWyZh4vxZOwb+DKL32veDlZ4CJ9ikVulZHcAxTzFfkuyu
	XD3NvHSUWBdFYQiU6N1BbOxYUBLXTl+iTnteTbP7c9naT51jNAU4FCN7BQ0+1GZIiWrXDqDcf0i
	4ALULnyVImOceKhhrwFgCZlYsNvdJb8RzsGqR0tQYQhbE1qKebAG8JAfr1JHzHiZ2/NGeZBJvFf
	2ArA67M07rlkNyVx9J3npf5DOQvbR04H4xo3Vv0xMtKUXqgv7P1Fq4y8wcgickAbekCDDbaVgGA
	nSsIA==
X-Received: by 2002:a05:600c:8b11:b0:49c:edfe:d525 with SMTP id 5b1f17b1804b1-49cf82417f7mr123193155e9.10.1788531046019;
        Fri, 04 Sep 2026 07:10:46 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:2568:24c4:f44a:8310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce46696e8sm138287045e9.0.2026.09.04.07.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 07:10:45 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Fri, 04 Sep 2026 15:10:40 +0100
Subject: [PATCH 1/4] dma: dw: use designated initializers for
 acpi_device_id
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-acpi-dma-v1-1-0fcc63d65d4b@thegoodpenguin.co.uk>
References: <20260904-acpi-dma-v1-0-0fcc63d65d4b@thegoodpenguin.co.uk>
In-Reply-To: <20260904-acpi-dma-v1-0-0fcc63d65d4b@thegoodpenguin.co.uk>
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, Sinan Kaya <okaya@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788531042; l=1528;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=aQFEA3y1X11okBv1IVhRwHPokxBF08MtJtdbM64IarA=;
 b=tyyOQHQxn3xZTIwpXhIMj6SJta67xRTd+ISo1iTYGpKgjWvUuVu1brMOnuUK8WgtSIWS8O4K8
 lKUl70Fitp4BMp1y7eYgsmIfq9Ht+bjFbiM1Jh4heAF8v9mXQ/WDsNm
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Use a named initializer for the acpi_device_id fields which
makes the code more readable and consistent with how lists
are initialized in the rest of the kernel code base.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/dma/dw/platform.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/dw/platform.c b/drivers/dma/dw/platform.c
index c63fa52036d7f..5c1c97eb28a4a 100644
--- a/drivers/dma/dw/platform.c
+++ b/drivers/dma/dw/platform.c
@@ -141,14 +141,14 @@ MODULE_DEVICE_TABLE(of, dw_dma_of_id_table);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id dw_dma_acpi_id_table[] = {
-	{ "INTL9C60", (kernel_ulong_t)&dw_dma_chip_pdata },
-	{ "80862286", (kernel_ulong_t)&dw_dma_chip_pdata },
-	{ "808622C0", (kernel_ulong_t)&dw_dma_chip_pdata },
+	{ .id = "INTL9C60", .driver_data = (kernel_ulong_t)&dw_dma_chip_pdata },
+	{ .id = "80862286", .driver_data = (kernel_ulong_t)&dw_dma_chip_pdata },
+	{ .id = "808622C0", .driver_data = (kernel_ulong_t)&dw_dma_chip_pdata },
 
 	/* Elkhart Lake iDMA 32-bit (PSE DMA) */
-	{ "80864BB4", (kernel_ulong_t)&xbar_chip_pdata },
-	{ "80864BB5", (kernel_ulong_t)&xbar_chip_pdata },
-	{ "80864BB6", (kernel_ulong_t)&xbar_chip_pdata },
+	{ .id = "80864BB4", .driver_data = (kernel_ulong_t)&xbar_chip_pdata },
+	{ .id = "80864BB5", .driver_data = (kernel_ulong_t)&xbar_chip_pdata },
+	{ .id = "80864BB6", .driver_data = (kernel_ulong_t)&xbar_chip_pdata },
 
 	{ }
 };

-- 
2.43.0

