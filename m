Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF293C553B
	for <dmaengine@vger.kernel.org>; Mon,  7 Sep 2026 15:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788794287; cv=none; b=nLbXjhHF13kT/CtMWArmo66ujQeaeQnUL3XI2zad86KEXBhfqP//7qcDlvl363/L9wd/9tAzgIvJOhZrZwAMxgyB682tQfJFoPW9IImNLzJf0DwMZySjvFYwTMBnnhNAl9LzPppbcHov3U+hJSiDe18OgKd2THJWrgf0v5p3eSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788794287; c=relaxed/simple;
	bh=wi3N23N9BdZtUoN9NWpI/GnFso98egox1jks3c5pCJ8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sSFCBDyxB158iwYdTH5uDGjuEDAGwqYJN5UKt72WpEF5p847dEAF9KeN4Zi3uvPZNGbHwPQxhbQoirWWt603zx648eLqUoc+Q8VfLCBVFBYKWKfS/z9+xA2vuCO1fWUN9DkzFUrVLR//X3CAbJqg8Ag6xdWUdwakd97hVCxPKEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=sD+UiZPI; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="sD+UiZPI"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6b1afdf98dfso2320859eaf.3
        for <dmaengine@vger.kernel.org>; Mon, 07 Sep 2026 08:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1788794284; x=1789399084; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nL4d6aFEfv8KmOGv5PZG8XQQu0qz+kYwSNFh+zYXjxk=;
        b=sD+UiZPI3qY8CHRYiJoQ2FbTp4VG9AL2VRHOhzQPVolfQC6W/wytjkRBqSWfH35uwT
         jdHGqlLJYU8/AJvkivZiR5Qc8IivuK5mn1OKRiOsB1aaHu+KSCtSvYh/L10oC0+Y90L1
         k8R9+YIAn+fJV4U8DWviL2qvIjRQvkohilGxoc1PrQxYcmNG2OLezcoSnlBE47fhJiD1
         hH9CqqdTZNP22vA1uJbzQFSgm6YsNOzzTQLvnN8J0rU6tiqQVL/EJnkapU3DEFHvfRFW
         5KLnyADab9CXbbKkPlqF/oTS03Z8u8KF9oez0wLTGpctunS/GP4lRKLZQGniKD0w0kqo
         s2Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788794284; x=1789399084;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nL4d6aFEfv8KmOGv5PZG8XQQu0qz+kYwSNFh+zYXjxk=;
        b=gdK2o0+hKIhlZRvjq8ZOAEFzDhKXXqqTXR+pqpW78Xgly2D6+hFtcuf12l7qIrskVs
         CsFsFCzalByzR6pDyEaa4tqJgiARUf+ekdd+epzmRI1xileZZ2Vyq9jS48rqJYNyojF3
         ysE8tqg/DplXGbmrGK8gb0NWfy7pFcxWJlatD8TJS/GL2A6D+2ut53v/kKXMLGVt8c0A
         yLgKlUZZP4AMeQsTpN1DAdhfUYyZnmZ3SquAc/y8EQFwjVIe2TZncUU0U4MokIhsWP8h
         Mx21GNNPzMwwmpsUS1X5BuURgDjD5en27YaZs9AFPAHDBG+rX/2Yf1yZZdU7X317zQ4v
         LlPg==
X-Gm-Message-State: AFuF++kypvRkom6PTdoCyL27CPI0PUBCGdD9QQBd+2IJH2SLD+45sXX2
	K03nASIQDaUST4C++LclqkVwmQeHv3tR4CnPWlG4NrBZkoeoa07pfcaO9OB3uVnyEsc=
X-Gm-Gg: AYBFou01lQ4oAHfMptYZEjnD7SwfnJ9qvaYwueOCwsApBdEFga1uhUo5Y44O0Aw85Xk
	8uDHU13ox1NlGuiXUVVhT/Pw9mkQSsw/7e9L4sqeQUMDICOetQ/8TtexrWqCIgyRmoXwgMwq2oM
	ILtiQWCxKtXbLiAe4NoNsHC6QauZYTmkiQsXs9k2BKdZwMkCrg0ssQbbOeqwn231M17MDP41MSH
	+RQbIXOtjorcAQN4gsmHjJKbBcOetSkakkIYrByHQCgn+X6y0Lvt+RaNoiqM5joxVrSnlrU09aR
	JZTIF/5d7BPEUalsHqfnQEYexBXcIMnlaCP5Qf1NwyhWA94EH+WTfPLcBEOksvU6WogcP4UFTQR
	lZF5hPbqqwC17nrDr1KJeEAKFKSiyPHBnq8jnUbxvvQyOhatX854lUXueOPBVkEIbsJPVF9Jkn5
	0wtCqhabvO//WGv8MAkFb42cqJ3UeZsEpdjzCBo/wBtC2DhTxvn6T+A0FWY4lZsBOnBTcl8go5B
	fxVsw==
X-Received: by 2002:a05:6820:179b:b0:6b6:b5c8:7432 with SMTP id 006d021491bc7-6b6fd1cab2amr15396165eaf.33.1788794284261;
        Mon, 07 Sep 2026 08:18:04 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:9f74:2a4b:1c38:e2d8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435648esm33474770c88.5.2026.09.07.08.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:18:03 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Subject: [PATCH v2 0/4] dma: use designated initializers for acpi_device_id
Date: Mon, 07 Sep 2026 16:17:42 +0100
Message-Id: <20260907-acpi-dma-v2-0-0ffe4a007992@thegoodpenguin.co.uk>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJbVnmoC/22NwQ6DIBAFf8XsuRiklKQ99T+MB4RVtk3BgJo2h
 n8v2muPk8ybt0HCSJjgVm0QcaVEwRcQpwqM035ERrYwCC4Uv3LJtJmI2ZdmiI22VvYaJULRp4g
 DvY9U2/04Lf0Dzbzvd8NRmkP8HF9rs3t/smvDOOODMeps1aX077PDMQQ7oR8X8rUJ9fKELuf8B
 SmmaE29AAAA
X-Change-ID: 20260904-acpi-dma-ee1add4bae4e
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, Sinan Kaya <okaya@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788794281; l=2877;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=wi3N23N9BdZtUoN9NWpI/GnFso98egox1jks3c5pCJ8=;
 b=6u7XMl18GxIGtzGX7ctGJC+yePbveKR/UO9155kGs9pCUoaPrpf2OJhQbgWyAoctwtsI4F2Q1
 HYkg8tfJdgMCDT/zVVrInKU7RmRSO6B7uettbQQZNDQ8JNcHZ/4DyxX
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

This series is converting lists that contain the acpi_device_id struct,
which is defined in the include/linux/device-id/acpi.h to make use of named
initializers (which they do not use currently). This work is part of the on
going effort in the kernel associated with device-ids [1]

The plan is to convert acpi_device_id::driver_data to have an anonymous
union, similarly to what was introduced for PCI and I2C device ID tables.
The goal is to increase type-safety (most of the existing casts are gone),
to improve readability and to make use intent a bit more clear:

```
union {
	kernel_ulong_t driver_data;
	const void *driver_data_ptr;
}
```

But for that to work all lists containing the structs need to use named
initializers first to avoid triggering -Wmissing-braces. I already have
patches that implement this and touching a lot of kernel subsystmes that
use the acpi_device_id struct and that list keeps on growing. Therefore, 
I have decided to split the series per every subsystem into:
- pre-clean-ups that convert the lists to use named initializers
  (which is this series)
- actual implementations that make some of the modules use the new 
  driver_data_ptr member

That way the task can be fragmented into manageable and independent chunks
of work and makes this effort easier to review.

Tested builds on x86-64 and a64 in Yocto using 7.3-rc2.

[1] https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com/

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
Changes in v2:
- Tidy up messages and wrapped at 75 chars; added Reviewed-bys from V1.
- Link to v1: https://patch.msgid.link/20260904-acpi-dma-v1-0-0fcc63d65d4b@thegoodpenguin.co.uk

To: Viresh Kumar <vireshk@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
To: Sinan Kaya <okaya@kernel.org>
Cc: dmaengine@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-arm-msm@vger.kernel.org

---
Pawel Zalewski (4):
      dma: dw: use designated initializers for acpi_device_id
      dma: loongson:  use named initializers for acpi_device_id
      dma: qcom: use named initializers for acpi_device_id
      dma: xgene-dmac: use named initializers for acpi_device_id

 drivers/dma/dw/platform.c                    | 12 ++++++------
 drivers/dma/loongson/loongson2-apb-cmc-dma.c |  4 ++--
 drivers/dma/qcom/hidma.c                     |  8 ++++----
 drivers/dma/xgene-dma.c                      |  4 ++--
 4 files changed, 14 insertions(+), 14 deletions(-)
---
base-commit: df2908090cda368b01ff43709f51890076c56157
change-id: 20260904-acpi-dma-ee1add4bae4e

Best regards,
--  
Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>

