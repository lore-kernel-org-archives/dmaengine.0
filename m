Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CCC4A9D64
	for <dmaengine@vger.kernel.org>; Fri,  4 Sep 2026 14:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788531069; cv=none; b=tDDMJVRSw8fb8Sz2PyI/blNPBdoPBQ1gf+jSNT2UDfOO1uqn3eZDvmH42y6CCheS94Tc2En4cVCUsBA+Vtbk05EHgVbl6XeBtMVcvJYbpNgz0w9ccW/AGhk50foVvZj13y6I+S22Svqz4ZdDZzl/rCJm2GpfLN+2HEMyLvhfytI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788531069; c=relaxed/simple;
	bh=HLpKxIaKGd7G1q0JMJ/3LmoPDegXjEccp9RbG0O8P0Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CT9AgZyUdgh7cfg9iwqL/QNAZUvDjwnUqzhu7bKVzfaf7Lg59GOiTOaCVB7hdThBBzxw73cxw4qeh2XRpgtX8wSzntLXoGiPTC1ynJ8rj+Q1VsF4AK3xncwxFqZMcaZMniakc7aGwfyOCPiUVDY9WuAOVacuVgBRpMkIpV72kL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=Nq+VBNJG; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="Nq+VBNJG"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49ccfbe062eso8715545e9.3
        for <dmaengine@vger.kernel.org>; Fri, 04 Sep 2026 07:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1788531066; x=1789135866; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aEqUQC0KLTMrpqR3R5TYtWC0wMSU2dt7BIPd9pMyARM=;
        b=Nq+VBNJGF3Mgkl+YXFgKDMirc4NXRm3su8RxPlJLeDyhGTTV3PSaz0qKrAD4y71RiU
         3R1EtrJcW8mrsdW3lw5sTrV6TF0oniuqHcqALv18yY1f7Jd7AcqtCxTVvEIYFBFnXze6
         v3yANxZ71qQ8NAcOPzQK1loPvIL1F0Lx/uVjJpH7AZSONjR2tJR4bbVu9NZVJW7uHi/5
         C2IuWjdXVd08fnvotHJU3x1beK+4PZOibQ8sAvbFNtpiCat7gMETkQNnhWAlaM0IfrdP
         eCtdL1o9fpSZCBqJq4u6RO1oGSxWBwmMDUAC5hAuYQNTAE34t1G9Jcvsu3QtTMSaKMAA
         9dEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788531066; x=1789135866;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aEqUQC0KLTMrpqR3R5TYtWC0wMSU2dt7BIPd9pMyARM=;
        b=AanHI4tuMvJB69NtuFJ9tXeheHBGn/4LF9w7PT8vGhcfT6SXf/Cmo2qpz4PhqWRyVC
         DkpctbcRFGeKFtKFJqJFD3VYsY4cL4sI/sFh9rT4vJQIfJv48YTlUa3q6IKetASgkpMT
         PNJwQhcpckYVUPp5V8IUArP1w+MBr2FW0Pyb1bCieLyZ7M5vCHJ/YDxXFeXerU22Yh0t
         7GywKX2FsMuhfSUeBsV8BsNEUmSICa6UISdEoPAnLvajsPv6WwO894K9H1y5UN7yy2bv
         Lln6VeiIQypJbMMqc4s6WreSPUqPgGxYGVS+YdjsN4KzswOR7d370zIZXVeyaI27K6Yq
         R7fQ==
X-Gm-Message-State: AFuF++lCjY+2xkcVCmh17gHvSVH3QcLz9b2Vvi+WthIrNo/Z0R9YqwNQ
	idtQyeie4NEVmWlc8mezNusxOECK7Q2RcBqFdqdUYXKAYMWwPoQMkJY5tGp2GQPP/aI=
X-Gm-Gg: AYBFou2uMbkdzBH1VEMjZpSKwxwP//6iUm737NZTQvgr9L/BgjgMwJ898yaENqZmFg7
	QfWB32FLTW9MSUHvt0upJESpUAgMCl3gB5jBt54KeE7hvL78JxgtL29YAc8cH7WcRwX2xOiPOi6
	b2MYASfTIPABDyM98B7xR8ups9KyaIcbnsvqQyPSVBp++tjm4HOZ6qApN3AbuUNq7xs0UEkQcaD
	Qc0LskrnHzkm9ujSK/Ois+7s5s3GS6Yj9wkt+757Ac7yJYbUChEc0hC0GP7zjVhQvaaKiVFd+c7
	cKEC68UUmcXQ+WHEmoCBxLCD589Fu8VvigFicHBBw7MOWrNucr+l/f0dZw057+PVnbJQsqMlKc3
	zFEkiuncFUy8zmE+FARS204EQ3DFVl9/XM9rN8BMPk6epUSti8w+YrEel1NzqGTDKekRsZXQxRq
	6zFkk2azOU+wipZYns1SNL6Id6oVFHQVbz5VC03IVio9PLs6hzYs9qaeCTru7Ear4=
X-Received: by 2002:a05:600c:a087:b0:49c:f467:7ce0 with SMTP id 5b1f17b1804b1-49cf81dc377mr57050405e9.3.1788531047704;
        Fri, 04 Sep 2026 07:10:47 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:2568:24c4:f44a:8310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce46696e8sm138287045e9.0.2026.09.04.07.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 07:10:46 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Fri, 04 Sep 2026 15:10:41 +0100
Subject: [PATCH 2/4] dma: loongson: use named initializers for
 acpi_device_id
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-acpi-dma-v1-2-0fcc63d65d4b@thegoodpenguin.co.uk>
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
 bh=HLpKxIaKGd7G1q0JMJ/3LmoPDegXjEccp9RbG0O8P0Y=;
 b=VUi6AEMzf8WJnaEudtuz0IHlOiaxvFSP7LnEodkr0pKvhd111g4p3/8O+pPvejHm0kaaH4H8x
 WiqccCXL8MxC2XW3/g1uTW9wN47IBEzG2Ky43NlIT+FvWjMpNrO6Ilx
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Use a named initializer for the acpi_device_id fields which
makes the code more readable and consistent with how lists
are initialized in the rest of the kernel code base.

While we are at it - unify the list terminator to have
a single space between the brackets and no trailing
comma.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/dma/loongson/loongson2-apb-cmc-dma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/loongson/loongson2-apb-cmc-dma.c b/drivers/dma/loongson/loongson2-apb-cmc-dma.c
index 1c9a542edc859..70880625c6e92 100644
--- a/drivers/dma/loongson/loongson2-apb-cmc-dma.c
+++ b/drivers/dma/loongson/loongson2-apb-cmc-dma.c
@@ -709,8 +709,8 @@ static const struct of_device_id loongson2_cmc_dma_of_match[] = {
 MODULE_DEVICE_TABLE(of, loongson2_cmc_dma_of_match);
 
 static const struct acpi_device_id loongson2_cmc_dma_acpi_match[] = {
-	{ "LOON0014", .driver_data = (kernel_ulong_t)&ls2k3000_cmc_dma_config },
-	{ /* sentinel */ }
+	{ .id = "LOON0014", .driver_data = (kernel_ulong_t)&ls2k3000_cmc_dma_config },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, loongson2_cmc_dma_acpi_match);
 

-- 
2.43.0

