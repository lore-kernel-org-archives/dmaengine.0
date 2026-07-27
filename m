Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CDB42E8E4
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184845; cv=none; b=EWksXVEZnUfxiGHzlEMoT28ETJxJcQe137aFz0H7onva7LrYFcZtRWefz7baW+jaT8OllXY2Q1i+LuXuBPGmW976xABujNiy4LyaOYV6R6emG5EinIacHksXmbiyC7ZlGfIn0sbsivn7X4AKG7luo1ZsMV7aoVHyC52nLW/Al8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184845; c=relaxed/simple;
	bh=HBTFVCnzvaQtfHLiYc2I7D+PvR5lvwQVlMqg4m4SvYM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nq9MiIgU9OH1cR3PnvGNNIkkQ4w3pYW/E0/kvx20Ma4qz1eomEKaVROY4EJs0YIHf0NRB+8/XknTaCvhx1uiTAnUDOnW9hW6B22LOZi6LERubvJZkCmIisY2nSrNbkAd6zjaJJuOtccMcL2iAMY7jausUsm8CVhTzYto5QkcSmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a2ZDkcs4; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a2ZDkcs4"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-84874b52eabso4242272b3a.0
        for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 13:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184844; x=1785789644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LhLEJFdpMw0gAVLIc7yZF5Xw5t9QaA7cXZ3k942ajy0=;
        b=a2ZDkcs4dGehC64j6KCiIrhTBGWzsJDXAjfX/xDsb4qV1Wk2LujoLflOj2kLBbIAsJ
         7U9iyjY3YYOOb/leYwPk/LIJQK4n0MJl/jqckvZ1yw38rD/eZhhGCqxaqzfiu2rKpVbk
         brDit1y/aNVGJFw8qv+cFEhtMo2rnOD011zUtmgdJ/k1YXj2FCfutm8oHpDTX7/0OMB3
         bqf8ouQKaqfarUTqFu3mvci9bt/i+RSIQ3ZkvSQ8G4QXYFD3DCuc0GoPm+uRovXy4TOe
         CBYplX9BqLtXyxgtLYzJ/Ez1zIt3cEc+Yv3Hd7CdbHaSpKrmsXgIpVpamrvBtmMku454
         kY5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184844; x=1785789644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LhLEJFdpMw0gAVLIc7yZF5Xw5t9QaA7cXZ3k942ajy0=;
        b=pM9yzA0IjX/VBIEchzMKmYyqAjVOcQnCCZQFQEzi1aTKRhVYvYPdfqiJaarZRddZa6
         V/uRvBxj/sVJkKYeAM6XGuAqtTDC9FZgCtwFvzzjUeAM+jknD10P1Z5vQkySXNI3stSM
         3J2bnLFccoSEDnY6ATtl67FDmeZIckS5O2oEIsJib/ELWEhtDt27GA8nvVmxgv17G99J
         RnYCTLTwmoyMYX+Mf0eOwZnNjzePGb2Ed2iwXkKXywZIdi8bsBBqHl4KRD5FbCJQ+5r0
         u7wKplE/pKIOSdMtvOrPTtdGGEpZ/aYmOtfd/bnkyCx5MtPkyRGMLzIzg0DLRuusiRDt
         alng==
X-Forwarded-Encrypted: i=1; AHgh+RqznzbYC7JOwWUdxedwehLB+N79fNaolfaY7jn0N+tBabOG1H18urvaDQNTs5a33hsMZpOwDLJfnlY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUGJehj3fkak8zecK8SU0Kd2JeUOF7yI31vZrQS6YcbCVbpZdZ
	bomr8M/HZmpihEtYpOzZp7m4o3qgmAm7kbsbJRh7ij6s4SA/6y3MuW+k
X-Gm-Gg: AR+sD112dKFUiFiq9LZ3P35D+hUQ+nQDxdzCm545GmbbjFvQRBmZwF5+xcyex8Tzle+
	i9WrKTMjmkVEFt0w+RHzuXNBcMV8aIN9twlokdbV/TK/xGlXkQOyruYnQLdM4CGIPbjOvTb6NmE
	6AwJ0I4svGK6O3EwQecIEP6bWpbg1BFK6TWfon4YpTD0TyveUF/QYKKoRTAkQtwIad/dbdoml3m
	BoVgXdb2mS4dq2oJTzIDWs5IxhHb1ollyBUoTyIQeDVySIWYcYEDznk+29Gv3VCPYhwMdP5ghYf
	PJx6wk8yrfp5zWF4RP2ooULryrfoutGo3Ns5ks9UwPEblBtFDMaspOs1jij7sdTNA49HFyI+AN5
	oTlKn3nogCDWnOqF5aV0TScGXoHOBWew7PvafF7IfuzS+KbPWY1ddLmCNjenY48IaSE5aFuCkil
	tbG76T
X-Received: by 2002:a05:6a00:3d12:b0:848:60a2:4e9b with SMTP id d2e1a72fcca58-84e59564c3fmr7912087b3a.42.1785184843732;
        Mon, 27 Jul 2026 13:40:43 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e533d1351sm3583338b3a.39.2026.07.27.13.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:40:43 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH v2 50/64] dmaengine: dw-edma: kill vchan BH on teardown
Date: Mon, 27 Jul 2026 13:39:12 -0700
Message-ID: <61d619b14a5eead4edf6876afaf165a0c0ceec5c.1785183549.git.allen.lkml@gmail.com>
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
 drivers/dma/dw-edma/dw-edma-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 89a4c498a17b..a47a4674df83 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -1170,7 +1170,7 @@ int dw_edma_remove(struct dw_edma_chip *chip)
 	dma_async_device_unregister(&dw->dma);
 	list_for_each_entry_safe(chan, _chan, &dw->dma.channels,
 				 vc.chan.device_node) {
-		tasklet_kill(&chan->vc.task);
+		dma_chan_kill_bh(&chan->vc.chan);
 		list_del(&chan->vc.chan.device_node);
 	}
 
-- 
2.43.0

