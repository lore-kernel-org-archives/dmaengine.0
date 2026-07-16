Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922E23537FB
	for <dmaengine@vger.kernel.org>; Thu, 16 Jul 2026 20:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784233804; cv=none; b=HG0Mp7yrzm99ZsSf0JG4IfQ4jwz8j0qiIZEuqPM0Ro3EYOmKhmvARx4A5C4Gqc2Kn/lh4hq8GHmoikqvtoFK2V3Xu3C1Cu6DAM1QWq1Qb20HptVA0txxK7a2XireO5VZ9K0AUrylm34Jswc0NwcvhxITsCKapn+TVlL5O7qKwOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784233804; c=relaxed/simple;
	bh=aiUf3J/DMgL7A60YXutHrKt7mc+0jAQzbAUeMGys5WI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nxiMr41a4aB2HUg9Qyc7k11B4fxW4GDP1d+OXhvOOyD8fnO8lbWUevXOBqRGVTmAfkUlkNcnUd0wTgMetFDu1F0wQSZ7xvHVijUVoFeTrm0Olf8refSZkUaJ+8xUvyCrT0VBs6YBQuNAlN7TQOeSozmEwrFZZOkNifLFfyGH49A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YsJPRtSV; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YsJPRtSV"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84862b0d5aeso7828506b3a.2
        for <dmaengine@vger.kernel.org>; Thu, 16 Jul 2026 13:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784233801; x=1784838601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j86JWTDEYzHZnOUJNqNzQRfU3fCHXDlbngSp/YHU0R4=;
        b=YsJPRtSVBWH+IFzozQT0+qPD8jorJwKOEuJy3ptMJmJqC4rawgSgbrrK++wI5PTb+Z
         VMp05bXXMC0p2Pf4+/wMwmGebT0tJ+wIjZ0QC2TxFceblvUgsLil9C3Av137LDo9Q2q+
         Es81T2fxhY0MNfDf47QKieK6T5NDrbmnLEGQoTjM6NXJnu+l6xkrzM7lJiSeVNI5fPOt
         bDrVeuHERr4+myV9Qjn/pBYDBgz4lHk1U48CzT2BUqBlcxcIi6YVwkEco4ElxcvxoW4J
         QE62N/SXN2jNqVZMk9w0qMDBMrS4kf6pRWZJe6+K1AfxPtc1OjHibIO5+Jhsou0k2daj
         qGkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784233801; x=1784838601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j86JWTDEYzHZnOUJNqNzQRfU3fCHXDlbngSp/YHU0R4=;
        b=pZP7wtFzzWOblLM/ZK2szQx3excSX4BNj6a879KYoeHLYgdwcvZbGREOh69KKDWadD
         BFmWHff6vfl3gI41PIdTWh1Zpa8ZL23o1hdc8qarhWy4AtvqBMbJaB6qW5++C7YY6nab
         rrEOb9tDC60l5Do7Wx9wPoCEFswEaHstadLx9bmro0/s2ZWAVxA5cghsK0cv18qkOrXC
         FrJrgTKYey1iJQSg91rtPeQszWE2A4lXr0VbjUfLPgMzJlbACxptAfdELglG0V0HMGpL
         cBGWEr7YnmKJ9eAyJymgfSka/wZpzFHqib7l5QGH3khqOAUERyDgSIPEpnyezGglKWu0
         XhLw==
X-Gm-Message-State: AOJu0YyEd1CktrpflrtHtXNN3tuHg8hxuU3kj16tl8m0+e9uq6+w9Rii
	uMTiW2xh1SX5sA7jF/3vdvjB4tVYNmTU5E7MgJei/dIfS2sm9GJl9F46ZYZFvA==
X-Gm-Gg: AfdE7ckzU3w3Yb0ZRs9igvWYXGcZ3QkPcVIF75PjbIeGx2w27PAcg/4mxsn23YEms+j
	66pqwyCmcRsRA/tOA39bn69zosqhUeFIl15Md1CwVaEIjnuL9/iKwEnTdXg/+7MxeE7Wv/ZrOQN
	mIabosGMch0nfo7RC9pGr6W2QJ7OqrcxkMiVeJPSUlWDKBaBWZYUgye32FnFljBeeV+vdOn4F5D
	gFL38gxvFgJm0MplQaVLeDbYKHI0hJ/BwQjP+lDU22tduj2enE8Zp2OyH0vuvDKHc0lqSU+WAPq
	MdFQrBOPa2ILhQiTQ44MLd/HaltzbfTm0TfyqpqN7k1I0D6xE5FsriRFjOL/FMlt/y9J/UPqByD
	PLKfuKDTcobHbJQOQOw/g57M4WpidO7wP9rS7xUV/RBPN8Oxz01kadkRT4wEWeL+MlAa6sW79Z5
	a1l0p1w5/itqi7qfcTyNOI5yksPLWAxV0ObX6LDcG/lNpqW3cgLejA7SApZxCzlJ7ItoBbuNAEg
	lzOPI9l4AR4cjKFf0QtsZYmPOYfDvXzoFJvNNsVFoFGNOlDJoC8PW4=
X-Received: by 2002:a05:6a00:6c86:b0:848:60d5:9526 with SMTP id d2e1a72fcca58-84a558201c9mr11417799b3a.43.1784233801270;
        Thu, 16 Jul 2026 13:30:01 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f26f703sm5536776b3a.17.2026.07.16.13.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 13:30:00 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2 4/4] dma: fsl_raid: use devm_platform_ioremap_resource
Date: Thu, 16 Jul 2026 13:29:49 -0700
Message-ID: <20260716202949.677290-5-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260716202949.677290-1-rosenp@gmail.com>
References: <20260716202949.677290-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the open-coded platform_get_resource() plus devm_ioremap()
sequence with devm_platform_ioremap_resource(), which fetches the
resource, requests the region and maps it in one call. Switch the error
check to IS_ERR()/PTR_ERR() and drop the now-unused struct resource
pointer.

The raideng node has a single reg region (0x320000, 0x10000); the
job-queue/ring children are separate OF devices probed independently, so
the region reservation added by devm_ioremap_resource() is exclusive and
does not introduce overlap failures.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/fsl_raid.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
index 524f83faf3da..2d86f61105e5 100644
--- a/drivers/dma/fsl_raid.c
+++ b/drivers/dma/fsl_raid.c
@@ -751,22 +751,18 @@ static int fsl_re_probe(struct platform_device *ofdev)
 	u32 off;
 	u8 ridx = 0;
 	struct dma_device *dma_dev;
-	struct resource *res;
 	int rc;
 	struct device *dev = &ofdev->dev;
 
+	/* IOMAP the entire RAID Engine region */
+	re_regs = devm_platform_ioremap_resource(ofdev, 0);
+	if (IS_ERR(re_regs))
+		return PTR_ERR(re_regs);
+
 	re_priv = devm_kzalloc(dev, sizeof(*re_priv), GFP_KERNEL);
 	if (!re_priv)
 		return -ENOMEM;
 
-	res = platform_get_resource(ofdev, IORESOURCE_MEM, 0);
-	if (!res)
-		return -ENODEV;
-
-	/* IOMAP the entire RAID Engine region */
-	re_regs = devm_ioremap(dev, res->start, resource_size(res));
-	if (!re_regs)
-		return -EBUSY;
 	re_priv->base = re_regs;
 
 	/* Program the RE mode */
-- 
2.55.0

