Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D333D5C1D
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184804; cv=none; b=PMWz507nzrDcs7nCbjWEFfqc2cPK1l11S8wbhuKJMjIZZy0npB508n05dA2cWEIqKbW9tMMLD/CCk6tqCQX1nwVRCgLH4ZCkE5RmNTrZVGkoELiQQR+zZ+e7qiXiRln6gFs1m0yxyVWm6SCdSs6TO1H2EvYpOPPkXuBStsqgTQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184804; c=relaxed/simple;
	bh=1teiPrAJGH7Qc6QLMDbnjFIL2wwc7YO5qoX2jwbyBsg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sCvREQOyKrJGNAdQmW7Ro2PawVAg5cPO5bIZwvfVWgi4zJDP68zcVpo0L0/93/yZwvLglXabeYM7gtx/jkP2fhb0MDI7+i68CoFxP2K2C3c4mdEoqdsNnnx0UUpCVCbENcW/cGBtrs8qJsPkUJYT7BuYAqx8VLebUD/aTkbjMxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ezH7c1yZ; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ezH7c1yZ"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-848479c9bd5so2411298b3a.3
        for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 13:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184802; x=1785789602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KjTDB6dFMh2VCm/n5EM5YppgxL5Awlz6CgTQEw/hGbU=;
        b=ezH7c1yZDWQ//o9KoBIQjH718J4CejoDqY1GVbU9sFb56FkRyjpOg6Ktzk8KjiJUM/
         ANNNpq3RJqeS2bd8eA9XrNY50/akqWpuy+DdiOsfoeOyDXdWEv0OAGDzjz84bO5MT+fp
         GhOciU6zIXfR9G5ZdQe4ICBC3OVRkMAFFshbst8fn19jYChGGt6vpQ06F/xNDjyzqY4X
         JZSpQzulM1O1++Wzs1tC+p9jzjswN/SzZ24M9j5sAYqqGJTawBYIM3tYU0gyL25H/Unv
         tc0yzFowbbNq9vjczMBR4wcc0peP1lBm6w8pFdi/Equ2y8Yd2LGUVudjsEk6vNR5Ih8U
         9ZPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184802; x=1785789602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KjTDB6dFMh2VCm/n5EM5YppgxL5Awlz6CgTQEw/hGbU=;
        b=sWuOMtaitccNNey2C0zLUd+Cp10yenEq0ov0a44q32zvcBop1FDOmHgJ/cvRRrojaD
         /pfA8EZNVIH41UQbz81um8uUa4Ng44by8jxzQF51YUJWp1BDx9gPbSdsoGO6/tYTem9N
         zBW4mbRewQ6MvPkOc0ll2scMU/Nd/Tl1k7hrrpFXzzNkPKw2fCuS6lfiOU82W4GpWiL1
         cvFoOz8TGDZaP0/GLkSvjJsH/EMHF79NZFtzLOLGHkQvVHhvu59ReBAcSYAfpBo8tJCp
         Tvgc3rDGtvDQqlHtosbkEysoSFT0PQDng5y5lNcCZmYgDiIZoJBt0xFLBdSYq6w9l12B
         gCPw==
X-Forwarded-Encrypted: i=1; AHgh+Roco+N1IaQoijsCPkzfalhA7tC5Kzb5mBRO28hvJgZ/MdsHpcChuqZcO2yUqqDV06MBLLWhPnZtuiM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm6r71ckSVQnsGIUDwZ/5IqVracg7N4YIUCvFH4iKorFyguk34
	uoRFrzHuVMlZnAWnHuuGYJFGlYyUJgTgihL6l1uqfg/dSTZgpubgHd2O
X-Gm-Gg: AR+sD11Fn9TLtwTrStLxSxGZHS6E5F5Om11dn0wILVUjpXrd1G9WqaRVr8gT9fOSPna
	B8XPmotGZ//ag6xaAz9zid0c0DgizlNrn5fVt+7Vh8OLd64mT+T3DVDf6koIDGMrV6smVhDxZZX
	4aOP59ot2rpC7Nju5eGWn/UqMpsGrlFUMKYnAlgkTeSoGysJs+oUUr30dn++/BwafecRoJ68jSY
	nFdEdIjfFSdnfEUnhhOunaI6PQ6DSFdroWE0AvPVmbUCh2jPkgGnUZ+Ma8/cdxP2zots85xf+hq
	dylb3I6Pw+2qzSlJ5nkJ7sfumydcYoWtoFJcVwOyehvJW0JaK/stNJk/x+Q6qcgVBHEAYMTNv2H
	3CaHKCYU7d7mJF12nJ5SOI0fiY4st+QMG26NeNnKwdDRGrTo0T5XXs5cPkJFaPAHKdRAb8KsmDC
	xYmi1h7HBGNGlL5/w=
X-Received: by 2002:a05:6a00:2d29:b0:84a:2dcb:5ace with SMTP id d2e1a72fcca58-84e59598e65mr8060511b3a.62.1785184802070;
        Mon, 27 Jul 2026 13:40:02 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e533d1351sm3583338b3a.39.2026.07.27.13.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:40:01 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>
Subject: [PATCH v2 36/64] dmaengine: sprd-dma: kill vchan BH on teardown
Date: Mon, 27 Jul 2026 13:38:58 -0700
Message-ID: <6b93116a29794e917499ab4f84caf7138ee810b0.1785183549.git.allen.lkml@gmail.com>
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
 drivers/dma/sprd-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/sprd-dma.c b/drivers/dma/sprd-dma.c
index 087fea3af2e4..42a0c1c34337 100644
--- a/drivers/dma/sprd-dma.c
+++ b/drivers/dma/sprd-dma.c
@@ -1253,7 +1253,7 @@ static void sprd_dma_remove(struct platform_device *pdev)
 	list_for_each_entry_safe(c, cn, &sdev->dma_dev.channels,
 				 vc.chan.device_node) {
 		list_del(&c->vc.chan.device_node);
-		tasklet_kill(&c->vc.task);
+		dma_chan_kill_bh(&c->vc.chan);
 	}
 
 	of_dma_controller_free(pdev->dev.of_node);
-- 
2.43.0

