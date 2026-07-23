Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E6B483821
	for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 18:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784832417; cv=none; b=MNKJ22pBsKhlOiW3VPn7jymWtb6YrlF8tpJx/2Py5zN2hzAG5DHywhNj+VY9ErKFdVRW1UoNSW5mI/trJGM+E5E9eR/n7B2gyMhTB1ksOFnruIlfPV8g1/XFgNWEGNlj1jTJa7J7qcr/joHSkog6aZFcv5zzUHmteQoe6MFWaP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784832417; c=relaxed/simple;
	bh=JlumXXFYa4YT2z0t/Rv8VpE7rH6ygFShwNbbT7uFZdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X1yI2jrplD7k8UE50YiHsPypj+PwG+xman/tOEVdG8KYmgtO8TzKeyzBx7Qn6ss9EQdOmGf/mt6y0GObYwotOc77w6hvMRz7iU4FknB3XVMLSN/ihVDZxrw43ASfrYVjgz5xcWZXnd4ODSnF/QMD+R65jJodgSlaQS3f0iJMsdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fHyUgATG; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fHyUgATG"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-382ef647e20so1066337a91.1
        for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 11:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784832409; x=1785437209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=inEAHAT4FZx62nofTUdSreIh00cPh6gTjTfAeZvFyf4=;
        b=fHyUgATGzbfJZ2vlpUBJVp3yHBjyEQS5sswCIU+IiRFhFsId1U5H605OqFcKZ5vrdu
         n4Cm1lK5dxN/St6pRWMW9qoaFjT0vkRxROtV2ajqGZGDaVBjTRokb5lSb9El9sbOfMaf
         ckjXvJV0YrCmTO/Kg2SAk6vEsWEJEoQBAjRCQ9EDZmanz1WtOypXp6Ln894rMLA9zX9c
         lRg8M+rtEEyvB7FfT0+qxhdVCsWOhjV+GU+DtQqK2c1AqK60aiSansBLnNSceQUDhFsq
         nVf3cTWkjwvXExj1CDdEuPlibtyPDDypRehic92vK9OkV7n1Qz26JA+DSv/QERXOhquX
         Sy9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784832409; x=1785437209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=inEAHAT4FZx62nofTUdSreIh00cPh6gTjTfAeZvFyf4=;
        b=klMhO3eo1HXHSKpq9IlIKFnfd+UcrvKA6E4uPragHP+FjcD5J6grdkibPqpOReufcq
         W/jqB+DY/2j1CP7Nd7xcinb+zUhoIig5aCYM2FKZoRBRc93ddJUnr/MAyFO7EGUJuTex
         21P4LeFLgVciiit3qeRK1D1LAtWf7FOaRkoj16xOBfNF0rsGVKV8e1ptkiVH0YriDVRf
         9u2Cm5nNfICtQtMLXT0tZiCROtN7971+wUC6/A7SXejoZH/sQxyRUT+jgSnaBDypgf4N
         zfwbKOvZ5MuxQ4ioGlrCb+FWJufMykiTCe3hhC8s+0alRdjG9wCVY9mavIlDF+YgawFH
         8hGQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqnfn5n3W/ABeNGU2U23/g3PTfTKGbm5WJ23nvE9SwlzaBNXFQyvakoPjARe64iI3x4pbnDMTnAQig=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCZPwIgFtHN47hMbrdQE11Tc+29EmN4cDVx81r+RhD0BJqoCro
	WSFK038xQZ0dB9fbg1IKVVo4BBSoSHWb7mRxfaB0c8qJHlxn2q1Kpu9T
X-Gm-Gg: AR+sD10lRZ44VB8S8//h6kcUTzfSxLvQR1vuhZRZg2zptbTz/fHRdnjUZ9EPhXAZboF
	26cixAZGdc/Qx5i2/7KdT+n/BDUMZhWSUSu4AqyZbEtWqsEisJrTUTk4xjpnFxV4rcuHAyYDoEA
	xk+QYQ/Joyv+skSNPuGmiVGe2CWvUwBioQmWz0KD9B4SE2iaOfC5z3z9osYC+9rB4veinKTBXP6
	QR4xd0AhCRd8lbXUQJpxh8BZQDz+1mx4ADHCTZ8fI2EMx1+i4/5NXq4Ougek2+3Z+R04FoeRbRi
	8RV03Hz2s2tHb9D22HAiJY3Kv2H+pAhzGLKtZrg7hGhkT+1lJS8jsfIHeVvQXj0RIhjuL3jDYWE
	kfKvZmCaQklB72ebDlJztGw5ZG8NPZpBzfpqv0eF5ZEIoiAvNWcQgUh1QhMGVuMQ6fanzv2Ec
X-Received: by 2002:a17:90b:5603:b0:38e:7eb:d07b with SMTP id 98e67ed59e1d1-38ec6622023mr4815354a91.34.1784832408660;
        Thu, 23 Jul 2026 11:46:48 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f03af8a45sm308155a91.10.2026.07.23.11.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 11:46:48 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Julia.Lawall@inria.fr,
	Sinan Kaya <okaya@kernel.org>,
	Vinod Koul <vkoul@kernel.org>
Cc: cocci@inria.fr,
	dmaengine@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 19/36] dmaengine: qcom_hidma: remove conditional return with no effect
Date: Fri, 24 Jul 2026 03:45:21 +0900
Message-ID: <20260723184538.3888637-20-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723184538.3888637-1-ekffu200098@gmail.com>
References: <20260723184538.3888637-1-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both branches of the check return the same value, so the check has
no effect. Remove it and return the value directly.

This is the result of running the Coccinelle script from
scripts/coccinelle/misc/cond_return_no_effect.cocci.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 drivers/dma/qcom/hidma_ll.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/dma/qcom/hidma_ll.c b/drivers/dma/qcom/hidma_ll.c
index 53244e0e34a3..f081aa787f0c 100644
--- a/drivers/dma/qcom/hidma_ll.c
+++ b/drivers/dma/qcom/hidma_ll.c
@@ -677,11 +677,7 @@ int hidma_ll_setup(struct hidma_lldev *lldev)
 	/* configure interrupts */
 	hidma_ll_setup_irq(lldev, lldev->msi_support);
 
-	rc = hidma_ll_enable(lldev);
-	if (rc)
-		return rc;
-
-	return rc;
+	return hidma_ll_enable(lldev);
 }
 
 void hidma_ll_setup_irq(struct hidma_lldev *lldev, bool msi)
-- 
2.43.0

