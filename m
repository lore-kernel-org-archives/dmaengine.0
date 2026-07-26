Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9148D189F43
	for <dmaengine@vger.kernel.org>; Sun, 26 Jul 2026 06:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785046007; cv=none; b=QYBn7ottUZEIHQ2uERwx02uM2Cv2CrJRNo7E3e/I8nYl0GL8JoUlUKUCnrAS4vrS/eeU0ZuQrQovOdPbzP/vkX2XQGdGFQLVkEjtRLgozjB1tIrtZtGmZGZNLRyf906RdNzlZ4Y2Uyvlt3QWCfQfjgNzLNgoZUYMUh9/EQ+do6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785046007; c=relaxed/simple;
	bh=kGdQSujpsiiifHsaVUlkBEHoyFe6PWGCLejtsszHFqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E01b6Yh1oj3pGFDh6VSjJ5VPETwxsYMMeYBVBhMjth4htIGUkOOTeV5vs2nRnIzc95PgAkUZKO/Ty86XBTlH2yD/+I0VcarGgTsrApfmfhlOETd3q1EaozA04npBq0K5+SNPNX/DFYZ0G3GvUzE20RaFn0uqZruMDBG02v66Nd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DEBpDJ72; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DEBpDJ72"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2caf228a910so12872425ad.2
        for <dmaengine@vger.kernel.org>; Sat, 25 Jul 2026 23:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785046006; x=1785650806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ag23eXBLMTCliH7FTzPeD+zjIZTX/IBTKJOhk5SVu5k=;
        b=DEBpDJ72hWzo/wKR4uLVX5Qx6Ix3UVDJXGjAskIDl/uxlY10oltV2n33pb5l0OlXSC
         50rAHK+a3N+pPQQdIMC4j5tQOAbb22cMIL5dfdQUblAmoJeJW/jXMDZYJiIiwpsLonw0
         jYFpTUB3mogJ9gNQkmXdGKOdXLYnjbHUa9aP1Ay4pvDPFqNFQLEnpFC3Uql7mgJEGYlN
         FNB3XTHvKHa3x8pcJk2wglcCSI6WRF1ysg64ym70Z7mlHkm3NN5ZKdQZ1VHPHOJcXW++
         3vD0BDU3D/zMaYg/rAQqKKgVDzZKH3lG5ZmbrGkpLDB9HUaEfixD2K/hoJvXBX8bUKul
         8Plw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785046006; x=1785650806;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ag23eXBLMTCliH7FTzPeD+zjIZTX/IBTKJOhk5SVu5k=;
        b=QiQqSLI9oFq6YdW9YfhrAWgFrsyQvkbQl8Oilf192nFGiYXtxosbUZUzkxDCqP8DdI
         orMjmzXDwf7hgeVnSeknc4H9zUuscpU9ewAXYizVt0iX5kZ/DPfQdEllXILMX71bT/1E
         ZGbSGHFQQqhr0810KkBNrPIXIeJqqQScZ3DO1v6E/dW+ax2hAbCKHO2J2egGmfJVGkVk
         Ki7jN1SLNrsDRH+yM9hlGjNHJa2aRsonzfsbMjNqaWcm53htqL9Jj7sDjf9H1ILUlfNe
         AZBWbAGMCbL1u7RMjc82pMy1mSRmXglq+5NninebRJFMCdtSp3xzRJIUFa1LX+7EiqIU
         6dJg==
X-Gm-Message-State: AOJu0YxekFt7Dcvo1gxU4Dv4FrIKNZ58kRJgsMYK8lWqMCJf6DZm4CSh
	oREtpr6SJN5e5jOwOzzfY7dT8E6/fJatokLv0BGuYVuB44++VqdMmgyq
X-Gm-Gg: AR+sD13Vay3K8PKVWwnvCaYzn2qrwx80unnqSxEiLvWQ9ZGkH3P50hXnHYVHxWay60q
	twVnbjrOkWZifx8ubJjxZjA5vzqXnRMa3wB5R2y50WJjB/cKkLEQTU6P8InhMqVKoo5Lk9D7d9O
	7U3FtORXX358H9YvkFrHrblnzOuFvtVFBHiEV2X0r1EfuaJ6ue23lg6GLa5kti8Rnu/WWhgynSc
	D9UIqr9W9zSF9CZT8hf8yDSWg3Cj6xOOPWBMrycxIGfHX2p4FTGuAZ9Sl5Q16f7b85XBnD3WojU
	LZzY4iF857b4Xv5N4/hXDMk/0Urze238N2tb0PV6MDISDxkds2+rX6QhIQ+mbqDrum+Kt1Y8Klu
	MXbYHuHa/5CwHvvS85RtPLzM3bWMI1WZZMnltwBU4ctkyqvX+qUC5kqmdVaDJlaPF6e518smyy1
	l3F8kxBVJZyjK53VwPGYTKi6ejSNZyNpQ=
X-Received: by 2002:a17:903:944:b0:2ce:d5e4:2fcf with SMTP id d9443c01a7336-2cfde8a2236mr40642175ad.42.1785046005911;
        Sat, 25 Jul 2026 23:06:45 -0700 (PDT)
Received: from acer-nitro-anv15-41.entro.com ([118.34.230.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde59b5b6sm16901225ad.14.2026.07.25.23.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 23:06:44 -0700 (PDT)
From: "shaikh.kamal" <shaikhkamal2012@gmail.com>
To: Vignesh Raghavendra <vigneshr@ti.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: dma: ti-edma: fix 'tansfer' spelling
Date: Sun, 26 Jul 2026 11:36:34 +0530
Message-ID: <20260726060634.18908-1-shaikhkamal2012@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spelling error reported by codespell: tansfer -> transfer.
No functional change.

Signed-off-by: shaikh.kamal <shaikhkamal2012@gmail.com>
---
 Documentation/devicetree/bindings/dma/ti-edma.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/ti-edma.txt b/Documentation/devicetree/bindings/dma/ti-edma.txt
index f719e1612b0a..d69264110e3a 100644
--- a/Documentation/devicetree/bindings/dma/ti-edma.txt
+++ b/Documentation/devicetree/bindings/dma/ti-edma.txt
@@ -3,7 +3,7 @@ Texas Instruments eDMA
 The eDMA3 consists of two components: Channel controller (CC) and Transfer
 Controller(s) (TC). The CC is the main entry for DMA users since it is
 responsible for the DMA channel handling, while the TCs are responsible to
-execute the actual DMA tansfer.
+execute the actual DMA transfer.
 
 ------------------------------------------------------------------------------
 eDMA3 Channel Controller
-- 
2.43.0

