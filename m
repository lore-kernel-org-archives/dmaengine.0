Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BFD437472
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184851; cv=none; b=hNRiFBmIzOB6VyBxHf0BjGmq9oBXOIeJF8J9nofNh33bhJ/Di9gziQ8MYyPhjv2ZC39arrmZr6A1/qVKND51szhhZa9EQjYbcpQcG6WqyWHiig1Xggkidw06XZGmpYt5bqiAKfQSMKjuCj1GzDYqPIZe+nUGu8uItvPMZKg8WRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184851; c=relaxed/simple;
	bh=5ve5pDndsPDZP0WKi71KXPZDrEU7yZApxPl3dO0zEos=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VN5HFxad7HxK6NvK0f/PzLP5/iQiQXBa99ZWl05v3EFipMyZKJTtNIykrWOkleVHpVdgJWg2WV/0wPz/7M8Oueuq3ZxSFCDIlJ+cc4bf4AY6lMEhoXum8LUDocebS4srPR04qqwqhnmZ/2Iqxan0NOELxHstA+0QN2XpuEuBCKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f2QdUkuV; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f2QdUkuV"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-84a2c90e383so262332b3a.0
        for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 13:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184850; x=1785789650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/b+8WgLLJBmMwH1bgcPTkNLrF2BAsgh2u+/vqL+9Le4=;
        b=f2QdUkuVPJWBcZ71//k/0hI5eLt1GxPDyaPBfW8TFyBFBfrHveQgU7As61xCkP13aO
         K3tX0YajHutI89OSu+owOs/p0Ifc4SUpOm8ZBsCQMfRxfzPdL6EzrUdB75WIVYrQgqiS
         HT+67GFPBjHlHF+pC4dgDLXr6IisWXR7mueU7Ta1afaAEfxPtydBMiBEUfl/TD9A4mWz
         qTFJJe4dn3y15EEc3/ER8oiPBvo5T7wz3LprJG3EOBvLNHffY7TPJxEgudtVbodre4qH
         2DfJjUxryd+Slm1X890k+KjCzL129LPXa+3ywTWggJSNdOb+NP56OQk+lTllkIM8B4kM
         9Slw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184850; x=1785789650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/b+8WgLLJBmMwH1bgcPTkNLrF2BAsgh2u+/vqL+9Le4=;
        b=on4ZwDyIkmay7Ss/PHp8F2CKntlAThN1LdDQbhvyEjcwX229G+iblqwSYEdS7NGDMY
         TWVLubxtvijH/kNHEWdyvXNLRWYsJ06Da0MCEyKAIFaN5G5Opl99YsqhhChgHEW9UeH/
         2lwJ9DaGs5PNL/TqjQ3wPHGcRso+cUnW66ylc72wlpqD+X8nMMJZMHPDfuE4atI+In6a
         LGrtIpkb8YXx4ng+m8Dwh7MpIsUtp3ZEAt7PtvNksokrTetdNacfZccx61firWwhAFMH
         kcC5ibPgEyhgYTlpTS5HoVykTGrVrG1LmzJPldcL0kAxX1rMB6ryo3CtjItVMwHgTaew
         qKAg==
X-Forwarded-Encrypted: i=1; AHgh+RrWXtDtp+V9xWJcjaD8fQ6r8Z/CFnd6yOtNONcyGpvUCNA5ptrI5sIHgUjADn1soTEzoTMarjJYAVE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6R3al/bLp5FYZ34fjUZED+pcMacmUSDWP1CLOi1zUVi5UX/L6
	6wR4C2TDeNkOLJAqMESG0wBD+01Qn8nn4xfw4cVx8AR5bE335NeA9mvU
X-Gm-Gg: AR+sD12MDgUBPTPwwTvF6RDEBu3ABeSw+t62N4V+iaKNt+wuPyDPQe2qof50MNSD58o
	DwiwYw3/W6SOdrNoFVJZVVCXY66hhd4vo7GZ9XBQrv9seZey9fsStpt/eHXBf7QAYcrOB9sAzgs
	grf0irjyc+vzkvXVDPk4jSWi6Xi4FzXjlW8LJUIc7zEqfN8lrPDTbD/6ZhO9VM7BTze79X+qfy+
	/sOVGbXBXjUfCIjgBjyBUuJ8xmownaEhvOsRyLzuVZ84rZkTLIUr/DEX4E5gpyidNZuNIIl/IqW
	hrk7vHTehvyhrVD6hcYDE6/1HI+5EhipCo0KYgVBErmPvvO/j5SfhsyHFIeoWAu8oaR7e/86YMC
	g4f9xM+AABXooTnmBYPsCsoVqPJAywK7sTexv+cF0+KxUN/iDCQZK4JuguuX6v9mbOJIAz5OUws
	H37stxTqN/UrW1lnk=
X-Received: by 2002:a05:6a00:4511:b0:847:8d0e:5d83 with SMTP id d2e1a72fcca58-84e8fc8c483mr207641b3a.26.1785184850165;
        Mon, 27 Jul 2026 13:40:50 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e533d1351sm3583338b3a.39.2026.07.27.13.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:40:49 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	linux-tegra@vger.kernel.org
Subject: [PATCH v2 52/64] dmaengine: tegra210-adma: kill vchan BH on teardown
Date: Mon, 27 Jul 2026 13:39:14 -0700
Message-ID: <131ec17f48b91f3981df2d5e84fae5d43195d32b.1785183549.git.allen.lkml@gmail.com>
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
 drivers/dma/tegra210-adma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/tegra210-adma.c b/drivers/dma/tegra210-adma.c
index ceaee1e33e68..598abcc4edaa 100644
--- a/drivers/dma/tegra210-adma.c
+++ b/drivers/dma/tegra210-adma.c
@@ -811,7 +811,7 @@ static void tegra_adma_free_chan_resources(struct dma_chan *dc)
 
 	tegra_adma_terminate_all(dc);
 	vchan_free_chan_resources(&tdc->vc);
-	tasklet_kill(&tdc->vc.task);
+	dma_chan_kill_bh(&tdc->vc.chan);
 	free_irq(tdc->irq, tdc);
 	pm_runtime_put(tdc2dev(tdc));
 
-- 
2.43.0

