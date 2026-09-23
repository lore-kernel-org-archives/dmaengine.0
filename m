Received: from mail-pj2-f14.google.com (mail-pj2-f14.google.com [74.125.227.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966C1442B06
	for <dmaengine@vger.kernel.org>; Wed, 23 Sep 2026 07:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790148349; cv=none; b=rb1G9xBwvnF17W7Sjr45eZ55Lfkj0v7dXKSnYaF2ZVYIax5PzL78ZLEU2aykgP8S0SovZ3aHgyQPnDAVLXkqC6yOu56M5QzVuqeLI0eYWUNNzFSU0Vh8jD5gLxerIx+9D/k5RsPJwlI45KRSy5DMesjNLq9oCnxcL8NSyN4m6P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790148349; c=relaxed/simple;
	bh=FMFvu1leO864za4bNNq5n0XaGNSTdbX/fyBf1f/TriE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TiLmroxAYUDU6oJhlWTuiTGiDD1T5fkEsf5CL3FxSQL38iSpEHB+DZLaXDxJyVadL4HrQiQ6dAAnn7Z2Jy9H6CIk85uar+z/OCIYz9WAxKmWG9kSfkgYcF1hHsJnAZzAgnCJC2BaznXHRkocI69DRZqKFTgSk2T8s2o1eXnfOqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ii2yvOxv; arc=none smtp.client-ip=74.125.227.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ii2yvOxv"
Received: by mail-pj2-f14.google.com with SMTP id d9443c01a7336-2dd58e1e2c7so3087005ad.0
        for <dmaengine@vger.kernel.org>; Wed, 23 Sep 2026 00:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790148347; x=1790753147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ayvYqvX3S4e1/XKaNC/+yD+owT/i5dd1ypLn+dC7fQg=;
        b=ii2yvOxvVByI9QX0WcIV1QTs3M2ejg+bRdz0atp3CeFyTTgs3C6UCtIOvqpONTkOjt
         NqgcnH9tv4c+QCMq14zNyQBnCM9hSEW+ZtSHQHteZHGxu2P67ivojFQJF3udcZWey7sE
         8rxH/djyX4WTjSw4B/5kLsEzbUX5LiFRlGrqKNznWi6RXS2ApszyiW0JjJ6Vw5UNRp5r
         QL9AkQNzP4+4ESwJ0HHff26pGR1XTb13Il1KFY0U3C390p9WhUyV/X3c6XG5jf5aXRG7
         XHI7MNjZCukqoElpU6+PJx7RFvZFOF8xKR6+xUFlFqn7oOXJCizpXptdv9Wt15KqboCU
         Uj4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790148347; x=1790753147;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ayvYqvX3S4e1/XKaNC/+yD+owT/i5dd1ypLn+dC7fQg=;
        b=j9p/DXrNCXoZ9ait9xBy2UdjDUYTMRGFwRNjwaWAYeGwvB5I3BrVDoQ8dv9yETraot
         eqXRxKwqf7FhcO0GcU0OM3TyNkc/1jpJV1IEuBwbLIXv4R7P2FWCg501+5bNeFXtC3fB
         FNMiAJTjiJUXNGctCKQPk5qjzEv0lCJLpMihzyiuEIa2isn3tZyRJNYe5G640BFIuDen
         NaAcHxdg1lSD37bKbIdEFQFA/2oaG6l+yKr3LyXp2Xj4ed969y2f2XJz/czL+GVYt0Fs
         0rBvgxNT7+D1sN9C0ifxxaqw2yVd3X32+Z3PYpn1oYpoWdokwKYl9QLqjmh4w946q2CE
         q1dA==
X-Forwarded-Encrypted: i=1; AKwUvBxOFnLjuCyO3S4yn5aMzl4T9e21/KoYBOugrqLZLeAJoPVoKayZJgjOfwayfcP16Re5tRxeyVliQLI=@vger.kernel.org
X-Gm-Message-State: AFuF++lLzM/sn9B/C2bflGIR3/qaqCsNhCABrKBfxNNUXUek9jzqGd7s
	iDtGKRKVu8cAfISeDZ9Udr+kFwNwVYPZXItPYaR+EXMmoA02DVM1EouX8doWwA==
X-Gm-Gg: AYBFou285RyyBDC+ytCtTUifr52No2ninOA3RPUzuAc5dmUrUQKfCAfMMwnvoTjSJKx
	rgWxc3uf8jgYaFcQwcP7OJzFFW+CIH5HqjlGxaSzRWV2ymUt9vcX4aviVIWthecY/Cse0zX96tH
	5g+Li9gUMHlQoSe8wkL0SF+G53qn9n5l+I33+jYvSdYKH6bZDbTafMgtHQRTFxkwDF7eNT8OHSd
	I/UegV/LHFOZfwx5mpyoLunUIROsEMkEdO5GvEQOXeiBh0+rrCX9KWWyVT1z3ra7EfCD61Py3Ef
	B8SyV5jAJOcLwsjHYqwB1YhmCuNnntJrf2UkVFEffjw2EPDBB9eNwdRP43xZkAzS4xqo+ChZ/a0
	e2EaMaMTtFhWgbRNFwy5uETdlemacufJ7cy3WNcD6WuHNi2H6HqipMYLYxMENbiqMF/w6qT/O3E
	kQ2VutxQhWk/muHCuBNCZEYgzL40i3IYaMpMRQETTku4QdHkxc837mS2t7UE22mTWUebb8PD7jA
	Wgs1CsLyFEZhsztVpkPeg9Ho4q805yQnojT/H+YvIdjkeGv7SmImcqm4EE/+ShqDjaVC/HflRAa
	iFZ9BDfKY5LuJA==
X-Received: by 2002:a17:90b:4d0d:b0:39e:6a81:5a97 with SMTP id 98e67ed59e1d1-3a07e716582mr1529832a91.43.1790148346921;
        Wed, 23 Sep 2026 00:25:46 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07db88298sm3940945a91.4.2026.09.23.00.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 00:25:46 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Vignesh Raghavendra <vigneshr@ti.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>,
	Chuhong Yuan <hslester96@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 1/2] dmaengine: ti: edma: fix pm_runtime usage counter leak on error
Date: Wed, 23 Sep 2026 14:25:31 +0700
Message-ID: <20260923072532.19307-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

pm_runtime_get_sync() leaves the runtime PM usage counter incremented even
when it fails, but the error path in edma_probe() does not call
pm_runtime_put_noidle() to balance it, leaking a reference each time
resume fails.

Use pm_runtime_resume_and_get() instead, which automatically drops the
usage counter on failure, fixing the leak.

Fixes: 2a03c1314506 ("dmaengine: ti: edma: add missed operations")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Update the commit message: Change the function name from netcp_probe() 
   to edma_probe().

 drivers/dma/ti/edma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/ti/edma.c b/drivers/dma/ti/edma.c
index d97db5af3555..8be9e71dab76 100644
--- a/drivers/dma/ti/edma.c
+++ b/drivers/dma/ti/edma.c
@@ -2345,9 +2345,9 @@ static int edma_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, ecc);
 
 	pm_runtime_enable(dev);
-	ret = pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
 	if (ret < 0) {
-		dev_err(dev, "pm_runtime_get_sync() failed\n");
+		dev_err(dev, "pm_runtime_resume_and_get() failed\n");
 		pm_runtime_disable(dev);
 		return ret;
 	}
-- 
2.43.0

