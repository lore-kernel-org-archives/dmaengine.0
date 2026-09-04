Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC71E4AD7E8
	for <dmaengine@vger.kernel.org>; Fri,  4 Sep 2026 14:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788531063; cv=none; b=DCS6INCtWYBq8Uk62HxLHMGaYvqeyEPwRiMGo79xo1ufovp0Jh1XXWc1m9o9TV5VauEuZ7r4X02HgKVkqpbHT4JUhywRfa+i+SM9056a2nGybPliyyJS+FFrw2HXAfG0cv/4D9xtEs3EpAVTWqT7LgwGnZz/lFFJ5l/oueMMBTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788531063; c=relaxed/simple;
	bh=YI1OpqXpFveygflyZ7spNdU2ImPBQOBvJey4mLcCyjE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NZw6ryKAz2JhEjzk+h4NePYtR2A9yNn5zbFDb6uF804pwPt7YjWU+jntx8EAQAF543DwxXL1QNIQHBiTVFRRlsA/vp2gYkGA10EgnfP2sCL7Cqpy+4Twfu3lFzIosnnweYqlJlGbBTEls27Mcw88OJ8pzywabbP+pHVonGOilRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=EOK4dUJN; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="EOK4dUJN"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a6868f18aeso1576588a12.0
        for <dmaengine@vger.kernel.org>; Fri, 04 Sep 2026 07:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1788531060; x=1789135860; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VUQuboyMNJgx1gV4X+dcroiSZBt7U++vQNPSBw1f83E=;
        b=EOK4dUJNrdx973UjcKKWaiIGIh+ugJpi2uangjdKLYd/7xRDzOhtkhglKDaBCaEo5F
         wUiV6cn9hj42DhV+ounzSwkDPyLfdhAqdPTDJ9p9A6veuASyX6zsACG7/s1MgW3Asi9j
         6ZIHFTkk+hmkUnlDaAubafc0ARxAO8P9dDqMwBzAhiIyUItaPnhgSXGSfP+AqfYv58xI
         7HLV5QrVUFp/z1W3N/t2LmwwfKhZM7K6q5SKcSRDHzKo0pk3py0wGsiTckWxGdx+1hx4
         OJgoBhi5UySbSlcLFtG65Gw4CME1JyYpPhVRGYCLT8TNsC5Bkx551j1fcnHPZH8JW8am
         U/6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788531060; x=1789135860;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VUQuboyMNJgx1gV4X+dcroiSZBt7U++vQNPSBw1f83E=;
        b=jApZgcr1Od7e6f1X4z6C0sBgKl+XsvcVe7y8HEr+Zot74cMcZrJYJU5res6JEQS9fQ
         R8JwP3DbcufwHy3gkgycqquAJnVj9Xn9jd1hcdkq5gAFrdrnXegbMFj3OrQ28AeEm3o7
         1Oyv1Lms/NCIjkhm3nCvAI/FHFvIZiqamm5anEo/Ji2ewigTBb3QsRXm0ylfJBEEJ4oT
         GZASldACiJGixMGfhnXq7mVllRBUxfE+7y3HqYwfl3561XDA9QgUPQ8SpTVxneYuXeZ5
         pOaqgKapp9Xy1wgp99uJBNTLGjeUiyOygNhYdCph4h4YUe9JJ7u/pgNzD/nNeLqJUY0M
         Zeag==
X-Gm-Message-State: AFuF++lUqVYC9Em6GruJ+ceUhDLjYgRqQoOasTyFqkgZA81RkA9Bdls6
	exRuVeZdlOCtw3d21ni6GtXI7HZl1Ai0dO8MqSkvnd9YfYCYuJb/lZ+E3Y9LxrFruE2rWAi1ZvT
	nU196
X-Gm-Gg: AYBFou1azkUA7m8JL0iGFo2fgZz320EqKj4WkutkfzVRjAyLLbo5N5S6cvGGm2ML2Uj
	fJzrmOI0nhVMyz9Daz0Sa3uZ6fBq3/1gEAgR1Suc4jtMPuHTpZy00hlAvqsgurrpCZexUD7qwx6
	crPMb0V/5yvvnyGWRM+wDJxfiKfyJP8cubWNhwLWZS7upHXyE8nOrktQorbZOLo6kZK9d8CjvDw
	LbdHiiApSWKOE9pA0fqZd5hy6T4bF4adJ8AGZWBNbxcxSmE6IvXLo8wXqYCLm6HaYjfpIem37yt
	tbz1rOXh8d8bQ8+bTWBKMmv6vK/uF0Vl0Y+5AHq22TDLp6BARmdztlqoBUWX+DmwqeDeRqEmOBo
	mp6CSQSJr2tUjbwJPIjEsvfI1JNVn3kiGy7mu5VmCZDUn65NzL9EW6dbMWgBX0PJs+6RhdkKjGK
	cBsmzDixdbi5xUyQf/cDBC6Ku4wcDWhcNixtf2BffyQ8Ts8uHPB09YrJkMfWKN4sfQNyh8GrgUj
	/s6Jw==
X-Received: by 2002:a05:600c:608a:b0:49c:fc6c:bdfd with SMTP id 5b1f17b1804b1-49cfc6cbfe7mr36426485e9.20.1788531049864;
        Fri, 04 Sep 2026 07:10:49 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:2568:24c4:f44a:8310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce46696e8sm138287045e9.0.2026.09.04.07.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 07:10:48 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Fri, 04 Sep 2026 15:10:42 +0100
Subject: [PATCH 3/4] dma: qcom: use named initializers for acpi_device_id
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-acpi-dma-v1-3-0fcc63d65d4b@thegoodpenguin.co.uk>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788531042; l=1212;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=YI1OpqXpFveygflyZ7spNdU2ImPBQOBvJey4mLcCyjE=;
 b=+jWpb9zoHZPf04DHZ75KRlkA9qQYrBTOnieAY7Gxd2mvQ/1U/LI4RfXElHT7e7IMRJ0Wf6aYt
 fAc6tSNVnY1BFsbQ5LNTLeX1XyLY/oK690JWA0i99VWhR2UDOemWfcG
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Use a named initializer for the acpi_device_id fields which
makes the code more readable and consistent with how lists
are initialized in the rest of the kernel code base.
Also drop explicitly setting fields to 0 where it is redundant.

While we are at it - unify the list terminator to have
a single space between the brackets and no trailing
comma.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
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

