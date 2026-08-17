Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2431518DB35
	for <dmaengine@vger.kernel.org>; Mon, 17 Aug 2026 01:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786931950; cv=none; b=K2ibaHYeY4ykoG91JNzUm8LAzkoeb6GhaH5UF8g9MtfRrBok22hzMEXgy10m5dUF/uh9D/Jl14j0GbhrQcZ0BDMmbn7aLuxwTsU2cBxjzUZIEYWQwpeeOipOksVEfYk4yiGjQeGRv0RKkrGaQALR9Oo16je5VzD20YYjW68zG1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786931950; c=relaxed/simple;
	bh=RuCLVPGwAemRLNx9SaxW8N85ZjHV5LY8CLq/tkx1/wI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UFEMyaAosEIBzWJ1IYQBynU5LL3nj1V0UmN97QZ1bLps1Eokhn+FbddfudZgweOkQPrdki4bpCICDEh9QiFNtOoAeaCV3N5PzSuFWwhPKDomuX1UZAgN+ota8IHQ3ftQsy7F8+u5iglib4WKRDFkGaNj8Fq0Ds+qukJw4xpyKq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BVFugLLO; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BVFugLLO"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso1491164a12.0
        for <dmaengine@vger.kernel.org>; Sun, 16 Aug 2026 18:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786931948; x=1787536748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=J6jChmtmBb8/IkJl2ssoRJSpFg7t2hMDp94b3eWR+RM=;
        b=BVFugLLOXw/XCPCw1INAZZ0QlCXkYL/GQdlgGSJH4Ee5yM8L1OsLM/JNRJ+kL+2iEF
         GBETLMyNBgGbBpSEdu/QVQ9fZNX6eKPPpc6vT/AdSrN3fNBndDyykhe0AHatw8RN+faW
         PNTHIImMkwFTx7zF5R3OYLKf3KsAo1BcEsQniNBycmckGW5D03oqJ5hl5VglE0kLSUtf
         CAZGcFy3WEFMpez+M3Q2dDTKomV6mSrMFp8qPzbZXLni5UloN2gjFxf+sk9YNuuOtZZ/
         xTKTgPMU02wudMA2NCMSk7R08RQDzrHdfHkNZ/EQSmownVv4jFPpOISpfn37Ubcc2/F8
         BJGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786931948; x=1787536748;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J6jChmtmBb8/IkJl2ssoRJSpFg7t2hMDp94b3eWR+RM=;
        b=ldW7b4SNcvfQGesz7iHvCXfmXMVPv5PP/WglCGLSGKcYpOiTB9iA+H+3AMDVsViW97
         mh0U65Ch8qYCdkR4TDpQ0iLQSOTgUd3O5a3gThlRHhYOO7W9RRawnOUx10wCWlrHrS3R
         YkEKLRaORDaDofYSaQWDBDXOZizUaSf251rUM2T14tW+5hLU3NKhLLxgbM3EdAfNIqBF
         BQoVJMZIUiLx1Q0WZVt7LIP20LVgGAmjtSSJ6HllIfXqicmh9avN2La1nUeYX0tmrK+a
         jX1wzx93lhtC0SpfD/7dtSFWEORSforNX5/v4idUxXBNsJ0+czEIP6NaENyCBfnPW0Kg
         6HWg==
X-Gm-Message-State: AOJu0Yx6Sat/AePgCLwNsC+VLGyOUdv6q5cZ6hZB7dvksqaiBi3WHYoA
	E1cjXUb3XCW4/Vg+4igPEqexKriOX2Q4WNgg5jHxy7gzdAA3IQvtArbRA6hlNw==
X-Gm-Gg: AR+sD11ck3q7HfdRUQlci1gBFPjhVGYU20D+ub3ALpucSmfq2WUedjrsGOkDsLH9+Qt
	g4e37cejRSum24fOhZRv2spTPLARUqLBt5lxuA0a/K2qwyuhnarBboIoVxVwgQ0cgV19VJOmGGo
	QOcY75qfqICRzpZcW7uFYew2SFmEIDOs/srBdsNrlo2rF1uE9VKyn3EEAG1e69HhhUsY/70ulAL
	zCB7d5hpXg96yEU2a19f9w/1nsuZ3A4u2d5IuDUkYjA8u5KgExaVSM4VpE6T12Fy/O2W6YUB+1O
	aF/yJ/oiaKY2sGDQ9ycQS6N1KDOvU7HJC4CHU9hwH+bgmbp23h/HUg6ztjL1xt+5wDB7rU1P92g
	cfDilsCiJZiP5pgSxJQdaY3F7GDa7RKFfuOWTBvmzEPBYyxxVmR7DNaEUK4c6tdWj2ehwdffWTy
	bPVbEZKq2RNd/z4eQccw/gwG8+ik3ow/SBkdjeeJKrtfMcY7KTy2dhn8JJne1EjgJFnCvBossNI
	LI4de5tsY0tyns1ooSkfFVtjNAjwTtUA28BEbl7W5ugbpdoSGLVF7B2LsbENGo24yNUg+qfE8c4
	0lLMwMRSB24MAAlvtaZ6VQkEcaArpwsrcQfailX1BS5HZC45
X-Received: by 2002:a05:6a00:2e96:b0:847:8e98:9a4b with SMTP id d2e1a72fcca58-84fde7a73e4mr21312157b3a.34.1786931948190;
        Sun, 16 Aug 2026 18:59:08 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517cfeb3d9sm2104113b3a.11.2026.08.16.18.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 18:59:06 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] dmaengine: bestcomm: gen_bd: split struct bcom_psc_params from array definition
Date: Sun, 16 Aug 2026 18:59:03 -0700
Message-ID: <20260817015903.137062-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The combined struct-definition-with-initializer pattern confuses the
kernel-doc parser. Split into separate struct definition and array
declaration.

Also now that it's fixed, it warns on missing members. Add those as
well.

Since this is just a lookup table and not modified, make it const so
that it can be moved to read only memory.

Assisted-by: Opencode:Big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/bestcomm/gen_bd.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/bestcomm/gen_bd.c b/drivers/dma/bestcomm/gen_bd.c
index 75d1a6f543df..00dfdc4b8eba 100644
--- a/drivers/dma/bestcomm/gen_bd.c
+++ b/drivers/dma/bestcomm/gen_bd.c
@@ -254,17 +254,23 @@ EXPORT_SYMBOL_GPL(bcom_gen_bd_tx_release);
  */
 
 /**
- * bcom_psc_parameters - Bestcomm initialization value table for PSC devices
+ * struct bcom_psc_params - Bestcomm initialization value table for PSC devices
+ * @rx_initiator: RX initiator ID
+ * @rx_ipr: RX interrupt priority register value
+ * @tx_initiator: TX initiator ID
+ * @tx_ipr: TX interrupt priority register value
  *
  * This structure is only used internally.  It is a lookup table for PSC
  * specific parameters to bestcomm tasks.
  */
-static struct bcom_psc_params {
+struct bcom_psc_params {
 	int rx_initiator;
 	int rx_ipr;
 	int tx_initiator;
 	int tx_ipr;
-} bcom_psc_params[] = {
+};
+
+static const struct bcom_psc_params bcom_psc_params[] = {
 	[0] = {
 		.rx_initiator = BCOM_INITIATOR_PSC1_RX,
 		.rx_ipr = BCOM_IPR_PSC1_RX,
-- 
2.55.0

