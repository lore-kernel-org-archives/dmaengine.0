Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA814399E3
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184870; cv=none; b=WUe983rD9081BQdN3uV/AZD8kZtfc2Mx4eFDxM8QMZG9BfXnENtrp7QhxYS10sHdjm1yVgwSDC42KW6RnGVAywls/xI32IhITs76dAthTMhHxa/PUE5xlSMgmOdvSKcmsAVVBPC62yuejTaYtDt/ubB4VoKVfJLN4Jdegnokl8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184870; c=relaxed/simple;
	bh=WuDST2c7eSMVoTQAwKtS4jLRAOZRb6zgk2fEMYNZnCY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i1dc1eQI0CcHcJlp3tDqAUt2yfLwthvHezzP8ZS5R6Cx+F90EEGniKYXkUi1oN2lyNaDslZSOuZcNuf6NBJUfXulzEG+8pAa29afwQRPmo5zZjMOw1+vBTwNPpVC0QwJOlkTrd5hVg/PWuoZeNrrSZLD9BasHQur4+GOAQZTpnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LJ5CI1Eb; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LJ5CI1Eb"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-84864086bfeso3048895b3a.1
        for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 13:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184866; x=1785789666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7T/BY/OyVfCUo+xKfZvd0kqssbZ49hf38/cnMLJemrQ=;
        b=LJ5CI1EbFat0E2lVgjkN1P7nA71QmDwSe7w4FP3FAf+Q1LRFQHEhCNyYy3X82zmZaB
         /28Ak4t0KOsRU0OGi7NhXHXuUS0PrPpnmoJSJUAZU1saDs978p5WGxRgwRWypd3SFvRZ
         V0STk4gLrqsdmstlcvDoF1t1UZidHLrUQ28Y1kx2pYyWgY5S96lTfW0BBVtD4AOT+fOI
         20i0DGZANF7E/yY52YThBlzfPjoV4jdl29wW1bGhljFg/pkelAa5KRYSp+anXpXeAKdW
         LRTGPzZlnq0V2CTH8fOPIXPznnRNVz/P07DZnWpC5zBl/0PXQluwc4FfTQm7ABCcOJbp
         OBFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184866; x=1785789666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7T/BY/OyVfCUo+xKfZvd0kqssbZ49hf38/cnMLJemrQ=;
        b=qVhUJ/l4vXYkSm1IP2cHlO6mtNhCnQdOAKtWxm/6neSZg6C0VUgZ0Et+iNPmf9NnBa
         2XD59EZaUnAsG4GHcO7i6OPxmGgIX2jpEfZQNVDMGA7lc8hoqpysVZ8t8MWLns0ClXJg
         fM+RBPxFERZ+H7NZHH++iktVvD19rpp6iceX9NzQsFDCG3DuTKZmWe0me799n269hNMC
         AeJe9KvEiptMLTvqvC6/6fLBMHpYQrTmFYhvKtM2v2fZC0wdFNGBHp9xE1m4eubpup23
         hMwwC3W22YfqApzoYVl6pewloFXp3QdScLoSAunbO40bsJNfmdRylYJcd2BNtmdtcyxI
         /2sg==
X-Forwarded-Encrypted: i=1; AHgh+Rr6rIFTFRkSbpc8cRbg+1XsQMsr11zZTLppFWGVqQ56Rf9VcqO4XEmWZrhzmcdUpEwDwQQBpA+apc0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEZcAEKhgITXhzg5spUtrhJrzRBqARm4VkWk1IE52GnhpsBjR8
	ggDQ5Muzpz3ziqkaqwNjH6Vl7OcbgJb8nwpVg8vd8iVIau9/75oQDLRD
X-Gm-Gg: AR+sD10cLPYZBv14e9pX8JdpmP77OWmh8qd4kCrBBUqbWIpgYu/mPa7QbyxzhYqyCy4
	SGw0I2F+PhcHL+WRkIpfc5tLU6voitElPiRUgedGMcxygrfm/M7PEsQeCzHE2XJuJj5Zn/ypWre
	nd9ZlBjvKiM515tNtcKb5J6t9LjGKEsY1+z7QMkk7haidrrH0VM7e+4qPh5wXhVk4OnmugFNvZM
	bobU0hzdsNpwfNGLY2iQgusL0ly/PIKX4d2MGA/XVaH1BsDHcW5PkZndyX1g5WkRmAkdbTmiPGi
	lqnhLGf00+6Eq74xuNI/iuqwimJ9iclTKMjxIdF9aNxuJ51JpPxfrRJjZyFaklaNX1Ut9GbKO71
	l1622LLxsgCZJoSeMohD8zQ7+geEDiB/msoP9ecdBivpMrD4WfHm0COPOyXMoATvf7XfDoaghPS
	NCStgn
X-Received: by 2002:a05:6a00:b93:b0:848:4754:28e4 with SMTP id d2e1a72fcca58-84e8cf4a7efmr910116b3a.15.1785184866495;
        Mon, 27 Jul 2026 13:41:06 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e533d1351sm3583338b3a.39.2026.07.27.13.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:41:05 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v2 57/64] dmaengine: edma: use dma_chan_kill_bh
Date: Mon, 27 Jul 2026 13:39:19 -0700
Message-ID: <e663065044a0e9f193cd621f89d082af99b005d0.1785183549.git.allen.lkml@gmail.com>
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
 drivers/dma/ti/edma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/ti/edma.c b/drivers/dma/ti/edma.c
index d97db5af3555..c0b16cd24752 100644
--- a/drivers/dma/ti/edma.c
+++ b/drivers/dma/ti/edma.c
@@ -2560,7 +2560,7 @@ static void edma_cleanupp_vchan(struct dma_device *dmadev)
 	list_for_each_entry_safe(echan, _echan,
 			&dmadev->channels, vchan.chan.device_node) {
 		list_del(&echan->vchan.chan.device_node);
-		tasklet_kill(&echan->vchan.task);
+		dma_chan_kill_bh(&echan->vchan.chan);
 	}
 }
 
-- 
2.43.0

