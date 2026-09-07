Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C1C501F20
	for <dmaengine@vger.kernel.org>; Mon,  7 Sep 2026 15:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788794293; cv=none; b=GqJUvuXKtCeD/5Wjiq6rYFJw4cQYQm+2/4UykFYBxhGlducBZNQtGSdOzgLQ1zD36ScutnIzRLcgeSeo30qxvivfeDIxMehckfjpZmmHLGiW1af4a+bmLbiGenasBrowB5+ua777nRZmjBlkyb84/dmAACSMSfJucombUNCciV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788794293; c=relaxed/simple;
	bh=mcQe2swm15Nmq8Y4i0Yhh/Z95MEtTy60FNwFlQB0qyY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PXCwaHHECjBAW+lelreWq2oKln6lWyY8ZlyrOpW4WR87Mf52ILH2R1FvW6QoI8YfoFAHukw7HQVpS45Wa76y2pAJ2dEJI33vwq3db8NIO18zeUJz7hvp6wTajhei5+igfS2+jPf0kpQzoFo1XM/d6xNcOKkKkL4MaqAXG3SGlGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=RfLUiM8S; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="RfLUiM8S"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7f18c0e03e3so1801593a34.2
        for <dmaengine@vger.kernel.org>; Mon, 07 Sep 2026 08:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1788794290; x=1789399090; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6/+QTxJeld428JJetLUQ3w0n69IV3ON69coAVWlYDS8=;
        b=RfLUiM8SVOO3/6fpi3aEeLT5ZrI3Df5mvd5Ss68J3++h2IUWFOo5f+fgDN4PT8L9I8
         V4yPA3kwnKegOJcmnUiQQgUjZryvee5/0iLJExwQqvyg5Zz0wrygl4PR0ee6rUY+M4ov
         DkdAniAZ79ojkQH3qD3UPPUpjhzHz09Dqs5P9piuU6UH2+rTUXWSIp0xvCRcUKHZrhAb
         C/afoA+Np44SzDjE9GcPwvdTjOwxZeWT/XhGFroXTYX53eLo6bJkxh6OimTvYEj/EBUN
         F8+6daWQ9Pp6ejp/rMzTgBEfgC5vkEnxNL6K69emsmnAd08pYqOuBNRLa9Zmk215EHZp
         k8eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788794290; x=1789399090;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6/+QTxJeld428JJetLUQ3w0n69IV3ON69coAVWlYDS8=;
        b=moN6UoQDTwMlPtzD3mUmRgyPwChDpZ6yvDnk4lz59OUpEXa2s8T24dSvVajoINVxpr
         wZdVdQgfYAa37vP+dqeP9tB+cp0mPt0B+vpt+e4HsuAr5RsbVEcBPWFRqit6IkZLRBjX
         BUVrhgQqIojlFy8vqbxS/JExb/E7lZ6HebH2ym/S8Vebo4YxptGcj5DmpbcR52h5XKZX
         wqR3ioT+KuO2GS4CGn4MADuh7T0+r7GwGjebW2e0FqJxxqLmahthPKaY70KXrXft4hTg
         rrFno5NwT3WZbfFJqRX+kEXy9jkgXrgC4vfwHIYfpttwKeQj4zvE7rJd3DNUuosQzhbz
         yTWA==
X-Gm-Message-State: AFuF++kNQp/xdpPrOS4jO/wIjmDpOP38/QGxpNQYz9W9APi4XiHoEVfo
	pO2QhMekPqOgAcBkWVpnyTGVhR6gy7/0W/0xgX6ZzGx57ZQfw5fciKEB6/extIl32sM=
X-Gm-Gg: AYBFou0VSVhhl7rdeEluTwPg9csRzB15AAGxrDCBcFV/jTATe/srsaetaeUJ/Fm/9ic
	9qEvHSt78LO8C5EpWv347q/tgV+VPgQ/Kp0J/EjUQ1FWqArdEZk36Uj+2u/V6zZua8O0xg/EVP4
	rpJm1mGp8TCx+SkEfhj+5Fo8xLS9Dxv7rlU3bojgANVF7HPm/4LrztnYd/Ov2dDpOWae1wXs9L4
	BzLAvuntzi7eISMRyQwjfNCGdKPz4eM+RFtMnA5rvYm4MM1P7oQn/TbGlrrfiT3pWD3uSdEdcPF
	zi0uFxYcbU6lUNfnCSaqIi7cPufI1kaxtr2mEih7tGXtRAe3rGu1BUad64TUOWtB8y1GMt2UAr0
	XlbyfBbSf0Q3yqajwCaYMG2VaYZlp2lqDZK+zOTGSNW57j8JJ3fe5T8IwU4IivssZjHvxyLBIHZ
	8XGfRyW1o8v/roHSJ6IL+OuJ0nCZvBcG3USmRUnASAAZuaEMt8v050fmgWFWy2wGIV1RUj1x0Nr
	suELQ==
X-Received: by 2002:a05:6820:2d0a:b0:6b7:46e9:970d with SMTP id 006d021491bc7-6b746e9a2cemr11233302eaf.61.1788794290114;
        Mon, 07 Sep 2026 08:18:10 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:9f74:2a4b:1c38:e2d8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435648esm33474770c88.5.2026.09.07.08.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:18:09 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Mon, 07 Sep 2026 16:17:44 +0100
Subject: [PATCH v2 2/4] dma: loongson: use named initializers for
 acpi_device_id
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-acpi-dma-v2-2-0ffe4a007992@thegoodpenguin.co.uk>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788794281; l=1307;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=mcQe2swm15Nmq8Y4i0Yhh/Z95MEtTy60FNwFlQB0qyY=;
 b=pszIBdV0kK1FUCRktbAdGOChrW7kK7Mrhm9RZ+xiLFOk6gHbzZ0byKwiP/SEuuQTnubZrHIKI
 wm5fKOJhDzlDjf8gv7eIzW7XEibz2iIYboaTNCrbKOe1r2p7eKDdhSY
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Use a named initializer for the acpi_device_id fields which makes the code
more readable and consistent with how lists are initialized in the rest of
the kernel code base.

Unify the list terminator to have a single space between the brackets and
no trailing comma.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Reviewed-by: Binbin Zhou <zhoubinbin@loongson.cn>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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

