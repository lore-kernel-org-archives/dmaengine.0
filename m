Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD59A42A15C
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184807; cv=none; b=s2Kn71tjKlfm7f5sY682O/WBZqQFTZI3Sy5P+jFkIj2Q0BqKzfFuQyMh0k5LLn3eVHlQj3wP978/YM5ONSofxHpOZ98cn1j0lNL9UGx6rIEldMhvTC+xnyiBh0VHlacVMPH/dJXk1eyOYDeDWPjlxU3T3IB702VpTUbKTdRV0Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184807; c=relaxed/simple;
	bh=2jZcgCzCEVl38crRipj7RMxe2For40ziYHzmXu2VVDQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B32Ps2qg6hsEyRshNNDJigY7srEYQFLVlz3Q96cQBGg9gLWZh3L8Ho0xoMag5sU5IHro/ZxApHal1V+kIu1nZd+4iboVjpkD2vEdK5HQRCNZo1Xlc6V4Y8DBTSb82AB/0OjL5EItpPsJgEDhn8Ya7lg7DMkUPy5HdpmIU4MjbR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AZkyKAVS; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AZkyKAVS"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-84830c774a0so3273552b3a.1
        for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 13:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184805; x=1785789605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oeL4VH/wJ+0Ks1UPiIcAQg2Nhf0EjSs0A+K0oVFBK0I=;
        b=AZkyKAVSJHH+tY1Zz1uoREb0xwkpzUtXljwMcG9LCFErRbC3X6USoy6Qed9LVWk4a/
         bL20yZNH+6WpS7Exo6RHd7TJIF75zBQnkZcMedzp0iyoTrZnQ7WfH9g41bLSmtn1olyq
         Kt5I7K+a4k54vQuir3lS1VlvMov4F75/FOANHoKGkhM/+nxfBGWUgq+jGtHRMJh71XWR
         9WuqdPv5Lg528iI+pn5k9rV6gdWlcBuKVGmIfSGFWqS+S7+1q6peKmqS5nJ//m2UjL4d
         r8CfvHvTdc5uzKsBDCIkw0NdUfVFXbkJZVNA4wOwEiaFjc5RFq5Q4C6YegH+QdLw9jeu
         E2nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184805; x=1785789605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oeL4VH/wJ+0Ks1UPiIcAQg2Nhf0EjSs0A+K0oVFBK0I=;
        b=MsnMN/euEYNZVdKlESiQC24vWsLk+GR/lOJ5DDIbMB7Cv7/cvGOphdyN+gBDY2Dx7A
         QVHgcNksW5plzwKYkRaxBBulnRzJ8J0ITPuQ55k0LPzWNu8mR7bqjT2akPGMZ6gIwH9U
         i/FXVm/SsOXnmcJhLnZISv+KBcshUanIk44rhGjkqxR41Afj7+I2ukxikvFatdLBwouC
         p4slMiH8HaExDoHvUF/WkvYz2IXAlf2EKJ/fggcqiGiA0F8yySBYiJZ+1Y1W7DubCD3Y
         34Dng524+V2dP31nxeX0T07acumJN0Gi4tAtxRbT3i6GXGKOQXx3D1QgNWLOSb6TA+KW
         I4+A==
X-Forwarded-Encrypted: i=1; AHgh+RqQkVWrU247EfDnV/69j5aNQoeseu+wMez0c6Xd+L+0lBhexNuwMHoqvBJ7Sor8Sgs9W4w72G8S9Qs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy04rU9gPPAZd3dMQHwvBYB6HjEtRL7hpYIuqv3wyYo1BrruBjj
	o9JkhHz67XI2szCn5Ye3zPD9VxnktbeFyYyvPwfDarKGeXZFfprGBrmPp8Dv8g==
X-Gm-Gg: AR+sD130aXd6Mjty92EVKS07d5wc7hfTdPGOeIbddvWH+mqeyWDRM35u6fhMun56crC
	bUqFtaBYqDwf6Q5UMWtmoB5PX7gKFMx3f03mKcgdVYs8zb42sEd8knJKPML+CwqMLwmOdQBojI9
	G8JI4Qy3RoE85ZyKwIGJbQtXEvmgx1v5cACRpLFwBOBn7dxjA0CH+cINFfQB1hkJiB2/DOMgZUH
	0r054KcNIB/wj5zCKJz4i9DjPlYewjUgYnEjxtb3Tz70kihY5bpW1JhXszhbAM2gT/r3umCo1Wl
	3jr0PRo2h029nmVPeCm4fs8YBlJi4r/tbVH8S0JfPr7Nw5ZFjfoiNETVsRmdXUfCb8gMXCDvrju
	vRol3f96p+dKxgGVWm8GDXXHW9tzgxoEDjHonjIbFwy8gWRgg8dp5QKEwI2c5TUtW4NcZnTcqRI
	acncjt
X-Received: by 2002:a05:6a00:2e13:b0:845:2ff5:b66d with SMTP id d2e1a72fcca58-84e59564874mr7951886b3a.35.1785184805097;
        Mon, 27 Jul 2026 13:40:05 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e533d1351sm3583338b3a.39.2026.07.27.13.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:40:04 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>
Subject: [PATCH v2 37/64] dmaengine: idma64: kill vchan BH on teardown
Date: Mon, 27 Jul 2026 13:38:59 -0700
Message-ID: <2c94850384fc8c4f1a8847a1bc1d1aa69591b7fd.1785183549.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com> <cover.1785183549.git.allen.lkml@gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use dma_chan_kill_bh() for virt-dma cleanup.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/idma64.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/idma64.c b/drivers/dma/idma64.c
index 5fcd1befc92d..8e25d828e553 100644
--- a/drivers/dma/idma64.c
+++ b/drivers/dma/idma64.c
@@ -617,14 +617,14 @@ static void idma64_remove(struct idma64_chip *chip)
 
 	/*
 	 * Explicitly call devm_request_irq() to avoid the side effects with
-	 * the scheduled tasklets.
+	 * scheduled BH work.
 	 */
 	devm_free_irq(chip->dev, chip->irq, idma64);
 
 	for (i = 0; i < idma64->dma.chancnt; i++) {
 		struct idma64_chan *idma64c = &idma64->chan[i];
 
-		tasklet_kill(&idma64c->vchan.task);
+		dma_chan_kill_bh(&idma64c->vchan.chan);
 	}
 }
 
-- 
2.43.0

