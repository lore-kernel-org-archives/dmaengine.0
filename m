Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D1F39AD49
	for <dmaengine@vger.kernel.org>; Fri, 11 Sep 2026 03:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789099186; cv=none; b=Ec7tf1sg58Va+tRMad6SCBdnHe+sKjqtzSDr2ql4Uxp+KFaL5+9IozAY1mpNyfSlV4gkbpbkJUfRvxIK9BL9lUlNN2cMq6mU+Ee6sOvhZNx/pv0EjCKn9pHXegmIBDJpJmwUanVslZ+lXufEC1Zp9S9TwhML6SRKWsu6WUJi8K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789099186; c=relaxed/simple;
	bh=Tnjz936ULNEiExwe2yVHG0/SP0xwnDfpHmoyp43AF9k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FkQBLg6XJ+vqgFCntkjxPTrO0Bc8Wao9Sodx3IeNyedghumW5xJB137HYye87kFVlxjoz96G/+oXUQBuQX7EhQSME7RqxYFxT9vkVgMKRy4EsXoEJ1mEQgBDSABpddVetJGtNmMaGgX2yCB+Cb/cRGA2HOJElv/VgT8yr80gPcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mm1gX4tN; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mm1gX4tN"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d8fb334e72so3792475ad.1
        for <dmaengine@vger.kernel.org>; Thu, 10 Sep 2026 20:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789099184; x=1789703984; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MYkeC3Ia5PgGmEW30KH3F64q/RW3NflSOmAA4kLBPVs=;
        b=Mm1gX4tN6IAiSKm7bS2NaadTmJOB5HkmIyRv/ibieLIa6RXyE/csTWGM3SfKMinkfx
         33En3lQ34KstBM7oIKynj4nZy/ZPomgeKF8h0QEIx08QVqBEea8qR1OKLoWcohozWqC0
         OhHINJeqceiMlFbsQBgR+xpvd+tI5Ev2bw+sd2oqtGd/wfcIx6LI+5uBtq6sYL7w39zk
         HdRLiBILZLO61G9Q/a5gvKn8PoXD4m8Qo6t1j9w3Hahaghq5wjaYM4r+XaoQWDvO7KE9
         Z7m6NHj0KLql4+GVhSQRVzHq6/oNm4b+wzB/UVxV8k4XF5KHEv4rOD+xTS4pi/nI3BLb
         bsFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789099184; x=1789703984;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MYkeC3Ia5PgGmEW30KH3F64q/RW3NflSOmAA4kLBPVs=;
        b=k60hQCD97CojWoxxFENEp6ePBvVxJYS/QpCpteCbUC7SXtZVwRbeJ0MZtUmxjAEDQ3
         pZ22kSeSbGsRBpYisJZGRViPuYqq6VyAIVUG24mlqV/OETHWoGe4nTwlx3DJWdgjmDWO
         0DQQbwRN2FfLG8dAfoIYs1U9J8M0zJcMdzLPOrDP5KFECr2o+wWHrCwRhGq4aFwn/kza
         1SqpQZs1s9ja2TWnhEeZpST3dTdsY2izEKNu1/4ziLJ5rkAZJqSVt1zhDgehrsKYYerM
         E+JuL6iVdbDSSrK02N8XfaGxLW+NctwGYcupovIQMlVdWxp7LsqRDilAUBUzVnwq+Vxr
         KTHw==
X-Gm-Message-State: AFuF++m2T6fn4jqoLRu/9GN45o2bFaY6ZLhRION40ie+nEBTctQ/EMWc
	PXp9THEIArpieo6NH6A1bZ9A/eb7+LWAMEFBjPDpizq5ogpOUFoIspHXyGR6ug==
X-Gm-Gg: AYBFou3qpGZ4kavj3eDrXiO/35CJPmHpRRcrj46HIRSDDzuF0+81o4tPueUgIoDGhmR
	zmI/Je9O62FX/Ot6JdidfdyhhR5Qpo5ijs/RQV6lesP8/kG/pQYe5l6AbFpLGd5818qiXe+dHe3
	DovWh3Dj7wPh0oB4PnTVjXt+x2JScEanUIcuzAusI+iqJgLdoM3MXM90ZA8G8u5I++mTUTU6g18
	iRrROx6Pt6PjcksMMTyIqfnjGNYrPCx4gXrPsXufnCWfE0dpLQqBs1PCwQuPJOfLSDS7zopmue+
	bbzJrDBuUL2LkiAk8/OGD22BFmKl03ctvlS35WIG09Rpn6FS6WpLhoIakpX4sYlSzqgU405P744
	j4TdVfYmXCQdP4VPeOIYQMdr7gCY04i8dSzV5l8YM3GUdkbvdJhga7+ptQirsDODEcHuPh/JfE0
	puBp6ST9vPiclDDPw7Mvjft96QttakHbTTP45dFpMr4GJekY8lfartXaut9NjgGh4Y+WbVEF3fg
	PetyHryAd6ab+P2IUcJ+7Qk1WMe9FrAADN9LsD0X92uNejlOYdd340vAxkpS3NhgRMRTyFGOS/B
	2HpzRUNq3tV55bH0sRit/08Kzao9kf8eV9JnU/MSosBV6bqP
X-Received: by 2002:a17:90b:548f:b0:392:b509:b1a5 with SMTP id 98e67ed59e1d1-39d9c1db3d4mr3930172a91.14.1789099184008;
        Thu, 10 Sep 2026 20:59:44 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d9587c157sm2558603a91.16.2026.09.10.20.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 20:59:43 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Yuri Tikhonov <yur@emcraft.com>,
	Dan Williams <djbw@kernel.org>,
	Anatolij Gustschin <agust@denx.de>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] dmaengine: ppc4xx: use assigned variable for dma_free_coherent()
Date: Thu, 10 Sep 2026 20:59:41 -0700
Message-ID: <20260911035941.200551-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In some goto paths, adev->dev is unassigned. Use &ofdev->dev to cover
those cases.

Fixes: 12458ea06efd7b44281e68fe59c950ec7d59c649 ("ppc440spe-adma: adds updated ppc440spe adma driver")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/ppc4xx/adma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/ppc4xx/adma.c b/drivers/dma/ppc4xx/adma.c
index 279a431ccae3..d0863394c723 100644
--- a/drivers/dma/ppc4xx/adma.c
+++ b/drivers/dma/ppc4xx/adma.c
@@ -4212,7 +4212,7 @@ static int ppc440spe_adma_probe(struct platform_device *ofdev)
 	else
 		iounmap(adev->dma_reg);
 err_regs_alloc:
-	dma_free_coherent(adev->dev, adev->pool_size,
+	dma_free_coherent(&ofdev->dev, adev->pool_size,
 			  adev->dma_desc_pool_virt,
 			  adev->dma_desc_pool);
 err_dma_alloc:
-- 
2.55.0

