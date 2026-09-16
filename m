Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9476E3AC0CE
	for <dmaengine@vger.kernel.org>; Wed, 16 Sep 2026 15:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789572486; cv=none; b=aY9G3CGZjsY5eWJYSd8eEzEtnmvZIlG0pYOYlC2fMcNaV8flh+Y0iulxhJIPbYntPqjZxcKpY6hrxDYUcAXb2yjY5gc83wKwsabCOGBjsq+cChR4lJiXz8hPBep3K+q6DGfWTVv6iXuxlEGeFNQPeKoACs9gBQ8EwLKZJuIIqRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789572486; c=relaxed/simple;
	bh=/JpbrBR+OVjJpbG1LD4MSanTICNv4h/sWdJw0dgCPcI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MX58vb+xfaCNH345GNfIM1tVOrWESfItgCgjRIUPlw5HkJCGrXB/COl6JphlbeZHMK5bK9IACHzLdTKu2STtiJTjslmY1N24gBpObOF3ugPksnIyiFK7cSTmCJCHYMj3/gcPLUwuphxCFlHtOmHLuMtj5JPlF5cIKrpg4L3KSkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=ey2bpWat; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="ey2bpWat"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350faaso549706f8f.0
        for <dmaengine@vger.kernel.org>; Wed, 16 Sep 2026 08:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1789572480; x=1790177280; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=272OvMcHmohpZ1MgcLqkDT/DpXSmh2FGVJu3ZCPDf88=;
        b=ey2bpWatG3D6ewyK/3VWY/RpAA8CVpKHJHALVRbUaMVNEs3z04zPqPqe4Iu+0WTMWf
         NvUXQqm9fl07zyNxouWfNRshtbeJHDFqgfPwa0TJabuSPCvq8iVKnBm0HpZZgGsFb9Qz
         QRY65A2oJj5feU6sDC9rKyJRRsltI68T5NlDDlJE/oQOXhnfG1jjZURipTp/R7v/fcPS
         D8OoEOhtKD5YNlBoQKVTtFLLIZCoUGVz1qdR+gc86t2tTD3TasLLQ+i9jvdezpVk35/k
         NRWR1F6UF2p0oj8f2jN/1s1kJ6Mb+S8ods9PlvCwxwR1cuDum/QmhWBEks4tKyIZtUgZ
         t9Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789572480; x=1790177280;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=272OvMcHmohpZ1MgcLqkDT/DpXSmh2FGVJu3ZCPDf88=;
        b=UjsuPfEo/4RkevXBx6oi0gMi404mCY5+WeUK87JS8hTKH60FnWuMEC1FuMXy+YFwbS
         olQA1t7/0CNslgMuBQPAvUQZY35976tG0r4O362vILd4aLF4X2U/cCcUV4DIEGoekLum
         L/KwVN6orSzlcNE+Z8+BloSKdn1gGiTOWMijZ7gL+JbkwshwGwNVNuz0hRQVA4S8uRW2
         jRZKeBu3eftRC7K3Zx8DWuTBPBRc+2bYIF5iF/Hm4rxlj4K7K+9znUD24GZKvz6Xp6+t
         3cezFbYmtcW4JGAHHFmIRV0Os8UUfO3yyJjIFPbjtfWw/fCyIrJ2jrun0LV59DgkPQ/W
         YA9Q==
X-Gm-Message-State: AFuF++nuelN3kN9dvx9WmSQ2yWP8A3oY5w4UZ9U476ToDV9fZH7TrzGe
	4Pq/VYO87SkILxIs5hFO9n06GQ5IcD1YE2VeuItCTQUgGsbHgbu1bJveLQPpIF8ED6E=
X-Gm-Gg: AYBFou3o8/BbfECgqZRN4MWldqRcHwlBAjUFujGlFC5e0f/Ts/wpqDwQ5UrxNU5YGoB
	Q0GTcWhFyRT/kWSEDgwNLILDQLLi9+igCpkiQOb2prfXqUDk9GXMA10AMBDem1HOQB4SrZkR5AB
	ZikFWXoxGfKcTkIoGRIp+5jN0a2p0sT7oJX65LHYHGGc9pYqCx+Gm+El2+0P6cogwGELiLTNNO0
	VdS5ZWlUc+gsY3PnVJdyXgijKf/ISv48b3WhadEBo8gHUGfDzILEl5EmBGEXV4hjecAWi965HdD
	eZ+/4C63mq+ahA5CZrXDjNfw1+HDkSwBIkUpVf9Llr8+OKsarpN8s23vaB6eWHgnkh3UsmDFSqZ
	3qBNX5LG+GWRet7PmW3PN3vD949UR4xEFhTv/LTosQPlf9S7t9H4Cvfh+maN08EUxFVxolwbN3J
	5g761Q9NwVQDBu5brLAX8J18c4Bj+DM8RQv1G76SkWpiVhD9OyAOy0fSTR8+jUNlBuSzGZj36Uc
	FOa/nvYT3Q+5Nk=
X-Received: by 2002:a05:600c:8011:b0:49c:ffe3:2b3f with SMTP id 5b1f17b1804b1-49eac45c233mr34194015e9.3.1789572480413;
        Wed, 16 Sep 2026 08:28:00 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:f89:61fa:af44:9a4f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf37e69sm7886646f8f.29.2026.09.16.08.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 08:27:59 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 16 Sep 2026 16:27:54 +0100
Subject: [PATCH v3 1/4] dmaengine: dw: use designated initializers for
 acpi_device_id
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-acpi-dma-v3-1-0dac05654967@thegoodpenguin.co.uk>
References: <20260916-acpi-dma-v3-0-0dac05654967@thegoodpenguin.co.uk>
In-Reply-To: <20260916-acpi-dma-v3-0-0dac05654967@thegoodpenguin.co.uk>
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, Sinan Kaya <okaya@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789572477; l=1636;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=/JpbrBR+OVjJpbG1LD4MSanTICNv4h/sWdJw0dgCPcI=;
 b=TI2PRLu+PWJwKb49U1K2vwZ2j85bEZfhXEHR8NJ+d63p/wSMy7K3t4wGWHCvZRvfhjdfwrpJj
 mt4OqQOoSpSBmb96hvLhHcQlKlhLNCaAB/spt580AE9pnNsSg/0wgfv
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Use a named initializer for the acpi_device_id fields which makes the code
more readable and consistent with how lists are initialized in the rest of
the kernel code base.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
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

