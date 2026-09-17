Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F71466B1F
	for <dmaengine@vger.kernel.org>; Thu, 17 Sep 2026 23:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789687774; cv=none; b=Ihivh0RsDeUuphiLo428o910n54XmaMaJ/OcpCsLCGxIWXND7R/h9P163C4ApJT0lPPj0JLFlhpwBUqMImydbjvjkOA8uRkDaFta2xmCkFuX0+R0y8APB7p4LNvNwJVOH3qT1SB5vd88na5DiXysMkmehVYfIImSdCTrYF0gjKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789687774; c=relaxed/simple;
	bh=vfCvItZUJWIDnmANtREff/s++lH1r/4XwMRHbFSb2xI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QHK7A+ErZssRCyjbgSM/ZpJXHSN+N2EEWyxoRLL342Uw05STBFxlA/FGeRxTg+BQrInwbRzk77CScuvdtflHqk4IVteAYaKfP9dTPJmDR6y0kqyMJkypPAa47Wr3uHi6aAe06C8Np9gaLV7UDKLRAONDw8zwnPa6G9LpnT/8Y18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GN+M4EGS; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GN+M4EGS"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469b2e1d5so182362b3a.1
        for <dmaengine@vger.kernel.org>; Thu, 17 Sep 2026 16:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789687773; x=1790292573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/iL1Xh9ZZ7puvXidIO52nL8OUfG9aWJVfXlW3+EIGwE=;
        b=GN+M4EGSJNy+rkLks2Ie7SHo60SlA46PjhNZw1xKaMa2GqyGWfoU0IPrxnHyPm2rCs
         wxSNb/wltwBwXLdyh6CaQ3jITe7YinALWG1P+44K+mMuHqmOOiu0reNvNGrClzNtrAm1
         Sswv9vK8vSus2guNV6Ky4JI3kS7PpAjt7Sr7kGeFCCCBpJz/TEbhV0YQrRSzR6Ei3Kkj
         WdTLyJn4rPMPxTe7LZOVNtWNQyErVnEkUUWwUVHn0R3IvyQzGlUsSMlKL9BDGRgFfrwA
         1+ImM8j9lLFLqpEVQkLzrKGRp9qhnIGHlH+SubkCqMJc3HAayHvxQrrQzxmreVIhoBuK
         r+bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789687773; x=1790292573;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/iL1Xh9ZZ7puvXidIO52nL8OUfG9aWJVfXlW3+EIGwE=;
        b=MboxUFCfoo5k0Eu7e9lEXRKf0D9yr2tRHQzsGXO0aUAMHgLmCTZydt8EJamp44wWbR
         OuUUSdQZ5uTwu0jUFxaRvzNi6/IldzXYVgyAi4QiLhbYm/NE8URYbS+xRByMt61/gJWg
         t0kgI5bJ8SR4Xj1JzXqo8sW6/FfTPjrkSDz5W16YzDwz6aPvrDaFNzIFKYhXjb/IESQ+
         3lsYxS+6HRql832fOheaBnwIetpp+hHbhBsGbYh0KMRCZL+P7A0ygTg94+2mgz1MKPhZ
         ls9qRFLde7OR6uGkt3Kf5toSMat/EkQTe4bhhr8/Uv9/72MENL9lo2n9iBTzj3575h/m
         w8wQ==
X-Gm-Message-State: AFuF++nOMyh7Vsv30kBJx39+ckHTe3aNX2C6sTZCudqQxYSi606/GIYK
	Femx5Ql+UVuYEvO6f2PZQRydBN8nmXwgsYJVL2sf/rAeEzhsa7Wq2LwsnkZtSw==
X-Gm-Gg: AYBFou0oQFP3xGX3GCNRFeBX1GCjUfUnPKQ7x0pZWZZva5H9HBQeveSebY9CJmfT3Zk
	agYuPwpOHhSp1dsMQIiXyzvlybKbnnBERHUhJi3d+RjMu0+bMihzvcagzgqM/vUljahiJFamAf9
	jHGH73vKhZwRM0/PYmcNBQnchAcNw8Zxub0K46TKtN5vZKY54a12DDCNKrxTcGVS5sRrfQ43avj
	bx8aCdbRw04hmKZHubYhlDvzkAlZt6reEiJ9HcKzSgaI9fRyHwmSn1/TOv1hC6SMAJ3m3+JP5s6
	xFpUhsqjHzRpM3QHJST9Kq8Z6HHjY7oBPPhYaQhK/iKgvtkkhHGUBZnalVbhbPWTpF4ZLJUCz/G
	bPCulJz5LgReyXxOOGK59W7UvalHe2NOdn0dEei29iofy8l8oM7apNMzp4i1/Ip8P4lTjXkxvKD
	lH4aXmJh3JDlV6so96DcsMEvQ5L9JEue7CK3EHu4PGiGZNKC+gl9p1lXEwlHqBiIqmJ7ZEniDUP
	kDHSBR7rTYfBymBvD4l3ZS3YjQfr+Iu2ytGy4ajcECq5LQ59aQmzloEDVwHOiWOQT8dDhunAziU
	JkqHnmSWk/ugKEbTT+xv+62oe7ATMu2Ld/uU6FSHFUAQHmgv
X-Received: by 2002:a05:6a21:1b81:b0:3da:ec28:2cc9 with SMTP id adf61e73a8af0-3dd8c53b1f4mr853759637.23.1789687772800;
        Thu, 17 Sep 2026 16:29:32 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc52e4bd4c8sm113418a12.3.2026.09.17.16.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 16:29:32 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] dmaengine: ste_dma40: allow COMPILE_TEST
Date: Thu, 17 Sep 2026 16:29:30 -0700
Message-ID: <20260917232930.128927-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver only uses portable kernel APIs and AMBA bit-field macros from
<linux/amba/bus.h>. Allow building on other architectures via
COMPILE_TEST for wider compile coverage.

Also add missing HAS_IOMEM as COMPILE_TEST also enables configs that
don't necessarily have it.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 v2: add HAS_IOMEM
 drivers/dma/Kconfig | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
index ae6a682c9f76..04a2410d94a4 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -448,7 +448,7 @@ config MOXART_DMA
 	select DMA_VIRTUAL_CHANNELS
 	help
 	  Enable support for the MOXA ART SoC DMA controller.
- 
+
 	  Say Y here if you enabled MMP ADMA, otherwise say N.
 
 config MPC512X_DMA
@@ -559,7 +559,8 @@ config SOPHGO_CV1800B_DMAMUX
 
 config STE_DMA40
 	bool "ST-Ericsson DMA40 support"
-	depends on ARCH_U8500
+	depends on ARCH_U8500 || COMPILE_TEST
+	depends on HAS_IOMEM
 	select DMA_ENGINE
 	select SRAM
 	help
-- 
2.55.0

