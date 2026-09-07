Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D3737EFF4
	for <dmaengine@vger.kernel.org>; Mon,  7 Sep 2026 15:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788794299; cv=none; b=syeZ3n1EE6CgeOnWR/tilCI+SxYRWrnhH22MU37EiUPMtXJhEgGJYGrbGYvEYcFnhEc+0C4GZVt1PtX7S1qCJZhmHGf+q3p2I42ytMN55bZnwtAshwDFp1cM0HdqjkFXzfk7oa5ds9at3PyQgcemzvrnNMiMYmJFO6cUwRJ7jYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788794299; c=relaxed/simple;
	bh=BNXdpYcV6rP8Kzo2tOByWtdS1/BlwS7HT763SKS2iMA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jfkBrDwnDByLa2r7beXaGTY/Wz96Y7cQJpzZ3OzbxhoJplib4XFJTbU4ydEwc1UOIynjSEOnA6kpoJs/MR848neSAzEXq2AR4vNGvuizKONRAVx8cBnGHSSxxvWrYGpt38o0vfCrq17B4y4gSy+k1MeT9FwPdpCNh6ElaAVCluQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=IuRRNzLc; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="IuRRNzLc"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7f4b94d72acso3100979a34.1
        for <dmaengine@vger.kernel.org>; Mon, 07 Sep 2026 08:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1788794296; x=1789399096; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VkAqAr7Z12LCHxwZegG/ZILA0Oydr34Y894kuKUR6C0=;
        b=IuRRNzLckf3EAepyWyFzkAXsStM0b/WM601tIf4iQ3rVpHIRk43XQbPLqyJl9YPzWt
         ykUky9lQmFihPFktZmIkcokW7iIKpDz5sENNr1Fj8OJDAmsjXWEnNwJju5VcrUvMO4+k
         Uv84N7Cavu72P2+Iw0oqqtqww6GNIP2zYJkoVS7K6in4WPrC0yqs3N++Fq0diCVkXkR5
         i8vVkM9iCzCKqAhvGf9Qfvdwzi8VFxt7Nii6VP32cuOo1ORz68MXeCQvNHfDR2elf/gf
         BcOW1MmuUmkwIYTYlTarM51eNahWIEPSOurPlMbb8N7bh82KsD8s02KDjoY8one8xZpR
         Ou8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788794296; x=1789399096;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VkAqAr7Z12LCHxwZegG/ZILA0Oydr34Y894kuKUR6C0=;
        b=gcz66CcZtiBhmpAUl+C/xIXZxTO2JHEia9jWiDoUvcXsxFK3DbyKLwE/kTUDJlIily
         44dCbI7ZVqW5R9BIc+q2PCQj8JvWC0BX3tSbT8uh5sADOGEA3kCnezc294LqUtSnJFs1
         nRswT1lOsqO512e7uHkNfC9o4JSDXsZ0AB04RqtgUHloYX+3vDMyFRFIk/f7Rt/k7igb
         z+topRmeS/drBLJlfHo7lhuGngdgkJHNK6f9E+EOuJehfPY/B0SwgyX6DZ0ssa1u/VYV
         akfuEaPHQ2YqjsyhHyv65+RHxfRGQYDblCs2X0AdNtYRSCtf9/vbdux+x5NFQazm1PlD
         qqTg==
X-Gm-Message-State: AFuF++lB8V3rdDaKfwCOFdty7f+/3gg7hYaemTE1LcYeLQ8YRDr3OKpH
	UGZexDrFn6C72PafRJHq7ZVw3OOu7VI+I4DJNrxDprU0dzfw5+mZsckUvM2qCWIJ9oo=
X-Gm-Gg: AYBFou1owAQNqAhqsv8Q20ElMDFTjmBGLFoPU0docyogNKXr/LPxseGEDpb49ifqqLF
	qmEWxMtQ/jBnxdyA6HemONHJVXsvLC856r/Ht3Kb+zipSVL+SI61KYONlV2zLZv5ZVtIbhKiSlT
	6CcZLTjLb8rlYcrnLrCgPk10pUNWiY89ulMa/4gd+EfVQ9Vvhyuxs9swxJABMtfZCeifTuJXWao
	Wr8QkZ7G73Dbc0Mqilj+zJXr0ChIXgMqMvYA9g4M0+zWsD//r4T/pCHyNdJKQKmliW3m5mDinhE
	n+ECr+xpL50RWS5+uaPddZ4+FHTDu7uQf6I6xTJoMTDAbb1nz2hCB5CIhwV4UXjvRYriUDE1opE
	Zhan8Us2FzKuTErQBZva426qOLUNssdL411OR95Z+70atYX/NOU/tjc4Gb/tA1uzz685aUR1O8j
	T3eGoZqIH11kWVF+f4YZyBUdb5QfRU3ULAEiAc25ERKUe3kw3wuUXJ3Wq0zakTF0vTh4yVc0uTS
	qAwAQ==
X-Received: by 2002:a05:6820:4df7:b0:6a1:4507:3544 with SMTP id 006d021491bc7-6b6fd7c9e58mr12538158eaf.28.1788794296030;
        Mon, 07 Sep 2026 08:18:16 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:9f74:2a4b:1c38:e2d8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435648esm33474770c88.5.2026.09.07.08.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:18:15 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Mon, 07 Sep 2026 16:17:46 +0100
Subject: [PATCH v2 4/4] dma: xgene-dmac: use named initializers for
 acpi_device_id
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-acpi-dma-v2-4-0ffe4a007992@thegoodpenguin.co.uk>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788794281; l=1050;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=BNXdpYcV6rP8Kzo2tOByWtdS1/BlwS7HT763SKS2iMA=;
 b=je0Q/Lb8ErmaZ8GdkEHJKU6dpuWT1QFFnOIu2k51oXK8LE5wRyQGaRgXY6JQ8isasnAQDA+Qm
 6/xLWprafnpBIJxN0OmBP0LngcoNeY1WMh/YEBdL7MX14FsKewoV36/
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

