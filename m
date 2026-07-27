Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5301430CCD
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184858; cv=none; b=FYrr5qPWo9JCaHxtyq2w6hsugGz9SevaV795+tv0bvs2XbylmiIZJ4lpTEr3WgUbRqiRyJ4GxlTz30Avzh+j79hNOp0JWmSMroCjK0gEJB0e6NE2GOJcwCXiu/f0W9dNGnlZ0+K7LifesxiBcvtHW3mk7L1sPawL37ebYDvbEzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184858; c=relaxed/simple;
	bh=gig1NuDDpkXp1HDGOICEX26KJNtnJNAjC9jbrdNS798=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F7zUNVUeErE5mP9aZta9wV1RvuPQGVpiaMPeZzp5/IlhojkoigjnLhqcqjUsN1k9rPKahNrQTan8CBp/YA8Px0pRFuVkG9up7Vs1Xqf5NEbHDf4M+gwfRWG7pXE/hI9+DhzblvKK3spG8od6mvMgWP8JyYYwPm0U6K23WIV4ZBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eUdut/eX; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eUdut/eX"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8423f236418so2401140b3a.1
        for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 13:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184856; x=1785789656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=om6sFqIt54MeIPR8JuvZB/nykXuoEdIS2rN9GBy01yA=;
        b=eUdut/eXUMMKPc+C+W+VCQvMCfnXiujZU/spVAftkwMcba6C/npQSDnaBkDtMbo8rg
         g5u4s0VjlYwPVR6AWPrcp6QTXmT5P4dnK3jKJkcOpPf8XUiePk6uvriVF/dpjpp7mr/m
         OuCU7n1GAByHSOy2EwoHgUsIBpV+Cn8d6AnAPmw6WV+BXNFBRpZGl9Wt2vDU2U/VP/6X
         w4HbllwKoyakG7EEvF/6HUC2R5rxfxbtFDtypN2NcJtWYOjOmtTom0LHqORkf2iFHtQA
         oYuFr9R8c3DBWFP28qJfE39N8cLya+rLaHrO1R4W5825cK0cDMzAGmJZXUEk2jcovOil
         ZRxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184856; x=1785789656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=om6sFqIt54MeIPR8JuvZB/nykXuoEdIS2rN9GBy01yA=;
        b=IXDG9PbypXpJREelTFjnSCOhUPRA6lyfuhP/IUZWfw2KqOq7Nb1fSV/mXJTOoZMGeY
         Hn+/dz47pPBAQQLcrKCTHd2556yZ8oSQFtkTSKxim9HQ/PgR+qzMyJEaTZ/ydEdf9np3
         UpPqn38VVsoj55hYqVcqlRiSrW81/XnqdPEizm/KDVoE+8lsYc2uqZVAlOxkixwRXn+i
         1s4AjtyPALF/9wXtSExhpaoU5rgZsQ4omK+cGLyx0i3iiSJp3sWrpPmHdEmqCsmWpshH
         6YsOAH6IWWOHo5S+nIZVD7kVAkqjoJc1Ua3umxEBbLdlfrCHmiw1Q/Uj7slJhEZN9m/E
         hCMg==
X-Forwarded-Encrypted: i=1; AHgh+RpiNZ8OeursVg1GaI9LMyDnlYsgHc66KIymXhfs7dqFf4JJRuaHVdQiLOW/hWZYXENpP0trXKh7YW8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4gXSmzYWZr+R4/4e/En9j5dO/90xyFdLK7a6JXDyhSaOWKRcU
	WTOJHYThbKLTPr46+SJR+BCLMQXK63pYGi5YrPkMu0um4ltbZIwhWDkN
X-Gm-Gg: AR+sD10ZajGWsC5PomQ+0TqxlOHPgCmkJflN8M0uUEjI/xfP429b5quAltk18br8yn4
	zQKo3jvj6tXbsuRMD1dabVJyzTmXhw8DTzaigBOoIEoft4DMiViHANRiwhhb5FuiFQJom3Ktt/a
	ZxTpU5NnFFI3MCQGvFV2klX3zMG9JiY5BHpVQkXjm3+QaSqbP7/y9P2T9vPH5JVs3SrN4qpoi7h
	/a2iRPV5pdS3WrdKop71m2nJr2yaXXnsbkJk1Hj93T1a88aRTx14UuzGdsx5xr3fBVZ5IoHfvuL
	1N5JtT3zfamf4w0xaBIPmL0rtwbqaI+mVXIxewW6UM990IR8QD2pi3lT8sLTm4iaE2bCUq/Su/D
	gLPPrxm9qvMQCKAjsR2tzDRpzmv/PfxBAegBh0/g6mQSrPITbW8sz2ps84M4HBE3KVA/NwEv0r0
	mEUNHs
X-Received: by 2002:a05:6a00:14d0:b0:847:759e:f61c with SMTP id d2e1a72fcca58-84e595750ebmr7724480b3a.47.1785184856011;
        Mon, 27 Jul 2026 13:40:56 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e533d1351sm3583338b3a.39.2026.07.27.13.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:40:55 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 54/64] dmaengine: st_fdma: use dma_chan_kill_bh
Date: Mon, 27 Jul 2026 13:39:16 -0700
Message-ID: <025035b9fd1b5a4ac763f71c024c3fc30549633c.1785183549.git.allen.lkml@gmail.com>
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

virt-dma now dispatches completion callbacks through per-channel BH
work instead of its tasklet. Cancel that work during teardown before
channel storage is released.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/st_fdma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/st_fdma.c b/drivers/dma/st_fdma.c
index d9547017f3bd..d4cff851e1d5 100644
--- a/drivers/dma/st_fdma.c
+++ b/drivers/dma/st_fdma.c
@@ -733,7 +733,7 @@ static void st_fdma_free(struct st_fdma_dev *fdev)
 	for (i = 0; i < fdev->nr_channels; i++) {
 		fchan = &fdev->chans[i];
 		list_del(&fchan->vchan.chan.device_node);
-		tasklet_kill(&fchan->vchan.task);
+		dma_chan_kill_bh(&fchan->vchan.chan);
 	}
 }
 
-- 
2.43.0

