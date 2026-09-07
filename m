Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3959A4F55BD
	for <dmaengine@vger.kernel.org>; Mon,  7 Sep 2026 15:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788794289; cv=none; b=g8E6cLyizvs7eq2ceAKED2AkLdl6SDR0TbwVwBMShobWa2qDojbBhViIjHioNcdOdgMtgcb4vIE1Efui6GMeUuBcYKDI98pRDP35A7wCQKHzAz5uwKdVFrSkc1vJra9QqX5XE/+uGZNW4yT7ZrTZHH4O3ZsmkamtpfAo4bRJC1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788794289; c=relaxed/simple;
	bh=va8ns/bBhpmYtLXNPiYEfLUAZMKLwaGubpO1KCldYUk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LAJ9/ugpyiFzJq76kG4tetPsqPjMFEHNfxULdaKFy39z58p81icLMIoRNy/iqAmErqjPMd1uixn4CijCyr/Sr5jFc+/PFvcKh3z9US39sXw3040aiJJ1Au55N6NkhSbGr9UrDE5miEVD02Ogm5JF9VhSH8w1bXOSrc+ya2yCTss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=V22U7rax; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="V22U7rax"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6b8ef7de4bdso801255eaf.1
        for <dmaengine@vger.kernel.org>; Mon, 07 Sep 2026 08:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1788794287; x=1789399087; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9+l4S9i2/odgsmU25aLrv/j0FQJOeyHwyvML57y2qNw=;
        b=V22U7raxB5IsMGZxib2SXg2+MAj9Ieisrxl9mjjzeoddV0b57yVAdkkX0VeZFBOPd2
         NzZP1rXjsHbohsSyy6J84cFPoppXezcO+wd0q0p3drNK8Ca63FhvlxCJ7AMg9X4MAhtZ
         q1qaKFUi3RYwgRGoOE3izgl9YjgxA83CPvs6ACx8DiomyDXtdxqXCLiDfXvzKv3zJLi7
         z9OHeli5eKAXjdazfENKu3BFZg817JnbaugLGgq4RN6qwm/25ke36/y0UBDKcFrmIF2C
         TsVJ0fXl3ej+cYarPoJHhukNk2awlnljdqAKSQP9KpQ2+gQydOlQ99UVEuDeqhuEr8JG
         nWeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788794287; x=1789399087;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9+l4S9i2/odgsmU25aLrv/j0FQJOeyHwyvML57y2qNw=;
        b=p6Iz1QTjm+32e7RjTZGFfcLVjfkvhYykUVvMJIMrqRhJ0dz4R/pHVKMVVf5fVHs8ln
         54zM8D3nSSqEqc88WNl5yFa+TF+pN6m5kVLFLCVg7lmGggY0UU7zeniPR65UK5mZFWYb
         zTnffd4WfIOEWRJTdl8vmYGKDPhgCV7/RPQYUWdNyxFs6WQdq8vK6ALwLZSISpbLNBbQ
         53jbydKgobaUaM/+Zn74zusS4HDnkq/sL15v/ZNpwOkTZFpXugTlE4+oxhmlBFZDJXYL
         xzydTsiF2wCHONbS8DJMycwD9NF8v91eEU8+t1nmJKXcmG1rI4i9XnTA0lijW6/TRkdh
         Hyrg==
X-Gm-Message-State: AFuF++l9koXUcfvglFXRC/imR/A4nmXvsJw5iDMu15+fkcDwEEy/Hk8e
	ANy2XEtB818Fgq6IHu2zn87M0NEo+PaLNL8uPZUKDx3C3UYogyrr6MBMOZhORWA/UUC497WsM3A
	hhu12q1E=
X-Gm-Gg: AYBFou3e25cJLN9om9eAOr8wehAr3kCrlJYFZWH4gSvyTB0flMxXKhBRD5RstAGludI
	sZWbAQdK/cVhe60cPqW+/7K9VgBgrEiFSPcqPD+XdQlhrMWtUzWzeM+XsVBfvn5JfzpGTgwoTjN
	YfYxQsu9DmCcdxSXS3/BN8uy848j0QsoYEOFLEuEoEAOwGgPt7tV/m2TUwIXpw+aVUWTjlUFnJx
	tnxrFEwQTybPdQ+hfupRe1Re3D8dbAsPWXWWgyh/kmnqlsbEIAv89uMi0hK3kxeL/mxi/Q7uYMm
	lDAQvU4t8V4r3l5i0QPclhpbcsjJTbVeFs+uG9hJp4JDHx4yRRnFG/9uOiWodFv3JtytKUC4H8+
	yeI3ucn/3NGRRN0sUi30U9/mJzMYIaLtgdYlUG+WRFB/UcaZj/xasoWpyd4kxza/KWXj+4XPZnh
	c4gXLYbJ2K02t74X+owedjT3SUz3Em4LV2t9Cnn0KwETt4D9zJ8ERI3LY6za3/ktFLKjTu0XtKg
	leIlA==
X-Received: by 2002:a05:6820:2014:b0:6b7:8396:f3d8 with SMTP id 006d021491bc7-6b78396f894mr11053124eaf.58.1788794287156;
        Mon, 07 Sep 2026 08:18:07 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:9f74:2a4b:1c38:e2d8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435648esm33474770c88.5.2026.09.07.08.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:18:06 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Mon, 07 Sep 2026 16:17:43 +0100
Subject: [PATCH v2 1/4] dma: dw: use designated initializers for
 acpi_device_id
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-acpi-dma-v2-1-0ffe4a007992@thegoodpenguin.co.uk>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788794281; l=1594;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=va8ns/bBhpmYtLXNPiYEfLUAZMKLwaGubpO1KCldYUk=;
 b=TedocPl1NreIF92NrfJkqDUsjvEsPgxpyubESs8DTRbFl2CC9mhepRIdAzRhAo6g3W9NBuj1q
 76+8Ig50mOpD0kUrR3X3JUTL5YwCFkjht9NSZxEezIGieoocqZ2v9m+
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Use a named initializer for the acpi_device_id fields which makes the code
more readable and consistent with how lists are initialized in the rest of
the kernel code base.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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

