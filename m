Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF67949250F
	for <dmaengine@vger.kernel.org>; Tue,  5 May 2026 16:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777999384; cv=none; b=lMseE6vlFaYBBpe0/zFFYUgT5L88OoSZ7BAdTVTZpOcl5fMdOS8aNRn8gsSp2VEdd26LLfil07qSudGV0RvaJ0xiHgjaZL469hggi2GEaAAgn0aCQr8oXnyUdOR7AbVk4NeNStkr/8oYvXBHimIWAHBUxzLbqLxcHp1W7Ytfjmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777999384; c=relaxed/simple;
	bh=3U5qlkQbYGi2ITNovAKaqhZe/HcrCUtHOFfL425wVfA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=neNe7zaAs8DOzQpNl9yB1AMAq72eKaMMCGr6z+s21CQnxXrGpvI8IP+FK60NvE72no8o+hJd3Y+yoml39sk35H3WDk+8K6zY+Fqf/VUtUgFTJTCytmuSWCR8Q17EHMKz4yV1d8Dpi1oaI8UTbtMPVno9EsjDfLTPPAKyT5QfPXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SpmHyewB; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SpmHyewB"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-38e7d984096so61814101fa.2
        for <dmaengine@vger.kernel.org>; Tue, 05 May 2026 09:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777999380; x=1778604180; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dfJomzzs+6EwPzI9gpaJRLIrvQo1Be0e97bZAOXGBnE=;
        b=SpmHyewB0PVdCj4QphZC5byQL5lzgx/rQ9YvXl+MQ83Ngpc5i2r1u3f2lrlXH9e2+O
         8bzhGyyE5eE80O9H6ZGR+RakQ54M3dmpS+VrlNLsBtmIWi2comzC+Yym/JMJA7UKhVWs
         frz+UXWVifqDAtgi8W/yYc1iJjjeUe9Tbpcnh/YkSC2+8JSSJywft2h/LSomrulXRuU7
         G6Db9qTQCD/de6GDuhU8aYGPKCkUuSVWmfap17xzNLec6ZzuMtznTweJGsnjCCHSP/vS
         2+GiV5vPaqsObT8CsrsyXj8Uu5wMAnr5jnSBX+svHVZE68LJj9lTQpyJQnn13QixvjBt
         pqIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777999380; x=1778604180;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dfJomzzs+6EwPzI9gpaJRLIrvQo1Be0e97bZAOXGBnE=;
        b=OIi8R+PQnp+kMPrJMxvtIEqeYqeMBffck/01hWh/0BRO2jvwiu/tZItYGpdHtSNjTi
         FcHSAzqKQd27kmD+55j1BL25O0RNFOCUu1tGswYK9MD5Bl0ruODR4Gz0JFQXoBvYuM0t
         lDvQb0MKzBnHxQuq3yksK8T7EcLFduxln8dvC27bqedGMkKOcS5qXFbrZzn/haD1dNox
         VxN2GQrbzZrJXyWP9NajBnzIpqmNnqGBSHkp4HMQIH+9jBTOgA3/0zrCGUnB59+tclme
         A7s1ehuxpQ3KWxTY+B+plmKLwXvfnjypP2BUh0V1eny+IKfiYCg50jFfpYbRILsnq7ZK
         /b6w==
X-Forwarded-Encrypted: i=1; AFNElJ8LzrD5KwvNyQTbVbCxvUvapNTEMj1Ax2cydSr55ce+es6n/ENbaGqQpmJPqru8YCEzZfSqzcp9OWQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqFHSTBoR6IogOPukDdLMxjqIi/VN4hAP+DkUrcSu1NUDJ3toF
	UIXPQfc+f8dhTpkX27G4/3XxJI/AXhyhJlXsgVsa1EBEME61P5jwrS88
X-Gm-Gg: AeBDievlBQtg3UheH+ZSzcgg6720wqEhrlJtjIkGD9+ExDAHW4O3ixx+ZiAn7JBDZl2
	kPaslJCvk8rypLIh+fupczwfPezXvMEfGeo+a/EPl6zUfnKr83yK3a3OQlyoacwlYYhXM7XdGDh
	XWDKRZHheodPrOafljGoN/8TZnwlUMGcNO/3s5YoNZ6c/P2lewbCwPIzJVWAlNBQpuHKON9glfr
	iI5YcDZ1U95rL0fQwdez/SxFRwXlMqZwV30V12BJiIsljIMmG6n9R0ARlS8pdHRtcRsuFcq/Fuj
	6P1v5bEmWv9RI3WUSjAvDZ0hQtjAQSFgJhgxfU5PMBb8ApiQPt9aCAJzudbg3ExiqylSxEikjRQ
	y9QVLIfihWl7uNN0cM8EzWbVXB1VqsBo1TbTLqOb3osCkl/YwgDBLIDOLSP4kbzgtsdyfBc9FSu
	ULMMHTa3Kw4JaVOXyjh24IGHvQf/iJLyR7oPIiaddaaXvEWaZEBEZ+NJpbeG+XTwe2eHB3b3lH1
	T7J
X-Received: by 2002:a05:6512:799:b0:5a8:65d9:612f with SMTP id 2adb3069b0e04-5a865d961b4mr3428455e87.4.1777999379966;
        Tue, 05 May 2026 09:42:59 -0700 (PDT)
Received: from iszonyat (host-185-69-74-59.kaisa-laajakaista.fi. [185.69.74.59])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c342548sm4055042e87.71.2026.05.05.09.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:42:59 -0700 (PDT)
From: Peter Ujfalusi <peter.ujfalusi@gmail.com>
To: vkoul@kernel.org,
	vigneshr@ti.com
Cc: Frank.Li@kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nm@ti.com
Subject: [PATCH] MAINTAINERS: dmaengine/ti: Remove myself and add Vignesh as maintainer
Date: Tue,  5 May 2026 19:46:05 +0300
Message-ID: <20260505164605.15878-1-peter.ujfalusi@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As I cannot spend adequate time to fulfill my role as maintainer for the
TI DMA drivers, it is for the better if I resign and hand over the role
to Vignesh Raghavendra.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0dfad67f66c0..f1575f1d2d8b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26408,7 +26408,7 @@ F:	sound/soc/codecs/tlv320*.*
 F:	sound/soc/codecs/tpa6130a2.*
 
 TEXAS INSTRUMENTS DMA DRIVERS
-M:	Peter Ujfalusi <peter.ujfalusi@gmail.com>
+M:	Vignesh Raghavendra <vigneshr@ti.com>
 L:	dmaengine@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/dma/ti-dma-crossbar.txt
-- 
2.54.0

