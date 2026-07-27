Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9EB842CAF2
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184378; cv=none; b=XSjGNROPcEtS/6KkxPAVYPPFmLXf4ScqO/D2CJGnZsoCsQH+lMXAqgvsl2Ve8HhKWic/R5eN4vvqK2THyr/s8OS9BLyrSCNoX6oVRjWs1c/0emxMNP3dkv3ao4aBWwpeSZaLmfLr+28RfLBkyDrK8CmMGUXuwfwdG0T04sNptf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184378; c=relaxed/simple;
	bh=AwtCMKhYWjk7FNq+UXvK6b4gn/lTsmpvM1DCtmnhQQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b1Udw+1zGt5Q4W0JbhXmmn6xtLbds4TSyGXN9d1X18QKSHVWgsairR2TP2aTxNaaggb5Qlg75lzGcjML6shSMyID3fvg3PZ9lv8fzzxEYfgUxNUdLgGIcAFSaf7uWP5YwtzeXEbxI0mTwyXuO/deo9VQaDswx5c76YB4RgwDq4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CqLW114x; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CqLW114x"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ce7d2adef4so38133575ad.3
        for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 13:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184376; x=1785789176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TUEfh1YfzH/g1gSKZ2j7YBPZmKasUvhzyUdxuz5k4q8=;
        b=CqLW114x6Df20YGRcS9eGgTR05Ouva9/bA7cAuIH7bJ1z+zMTKORqMV/d3007VONo/
         cjAh68R8obDhjAgMG5IoMkYU89e0uEXMLFlDcQHfjrF+julXutdaTj9jdIp7nKvKOvTL
         FtXccO1hfPyJGtcfZgXt9bBLKp0BAlminIpwDu4IkkWWiaZZ4NHUocJrwyTUvfmHLCmp
         6ZVAJogIOuHIoyG4lwapFGaAHvRX340W/ju5U28rzJr7u71fJ+NVFH7834JG2DOQNret
         foJWrmimbFg/DmMktao5uVqYFf+kb//ukRqw6Gta180+aeziLWNjDgORnfuUykclApzZ
         m5Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184376; x=1785789176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TUEfh1YfzH/g1gSKZ2j7YBPZmKasUvhzyUdxuz5k4q8=;
        b=TPidPBd2MXzqYA/SjSP1qBCNsAWfiyIh03jXvLHEiFBjmBwyiS6jpgdmguOdFCDm0k
         ylr0D227kxAScKkqw4YxBfwGvLSiDM2m/c+e72d5BkLcFftcsA2hHaRbjTOrR7NWfT37
         jSewCL6fDfI44khGBwijOm7RV2u7ij9PZb8lopCdG7MIr3hPN8Pn9L9XXI672LeF1bev
         /ZzyIFvi4esLtN+rT6lMbSfd4KfR9TF0j0lm06yxl5nAX1ky3+CfYmYNbaczNRZfF0S3
         qRQQ5Jmqev9ecpvnobToW1hMVUU3Yh4Fni9/IwxOoP6q4VISx+NP7EkqS6PLScknDzrB
         uHYA==
X-Forwarded-Encrypted: i=1; AHgh+RpuJybuXhj2cTIqXYVnVA0uXQ7N1jvUpiCdHK+erGKAPUbktCP3+9LOSz8TaJRwKrhXjKoVlOOigUc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxF6ECTJz8+9quP5cjXeG3d+GOWAuXUrZrZUQkYAcEc1gg1NPbm
	seCwoZUqU7xxzBa86dlaahFNI2acSuXOKiQkMSFah7AwZs+iGMysTcaa
X-Gm-Gg: AR+sD13XTRnMO04yhJHgAb8PwD2Z2TDrCpAHLpKCjyZLgz38B6vCmkdnsB1z4vSRn0R
	d6l82BNpCDFoWqcodP5CU4XDMd0HwqHkF+OiqAEKho/8s4OTHqsPRIDlvPaQb8YbZSKZsqxqIcL
	a1WgrWkjt/Mf/CPTFQxq0D8bjTSu9cWFTF9TXClx/roLSKrYcuewkKGxoK/T5b5giuNAR2YsfKE
	68pqXLetVYJ+cxWWf3DT2SZXFOxtip5Onk1G1JHfZAdsvSKNWMqYKjAAGo+T+m7HLfkzMwm/hzb
	LWMBxaND2F8jxGpRFbhwSW/AKTehsgkzEGlc4J5bmuHP/elpGsAIWqixEHjvtAH/w6z7G39XFMl
	sU5yv/4o6XXqgQz8PmBtqMk6tM3+a48al+0tSWt4T4PjxYAS2YTQ2L5i7sMV5osPhHTtXcTh+On
	K5OzGo
X-Received: by 2002:a17:902:e945:b0:2cc:ee78:3236 with SMTP id d9443c01a7336-2cfde86ce67mr93014405ad.33.1785184376464;
        Mon, 27 Jul 2026 13:32:56 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde59b768sm41551805ad.4.2026.07.27.13.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:32:53 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>
Subject: [PATCH v2 27/64] dmaengine: k3dma: kill vchan BH on remove
Date: Mon, 27 Jul 2026 13:28:55 -0700
Message-ID: <f0b555313c656381ca201c86de3f8e09d5f9fe0f.1785183549.git.allen.lkml@gmail.com>
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

Use dma_chan_kill_bh() for virt-dma cleanup now that vchan uses the
per-channel BH helper.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/k3dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/k3dma.c b/drivers/dma/k3dma.c
index e84f197fea76..99a70b90a02b 100644
--- a/drivers/dma/k3dma.c
+++ b/drivers/dma/k3dma.c
@@ -976,7 +976,7 @@ static void k3_dma_remove(struct platform_device *op)
 
 	list_for_each_entry_safe(c, cn, &d->slave.channels, vc.chan.device_node) {
 		list_del(&c->vc.chan.device_node);
-		tasklet_kill(&c->vc.task);
+		dma_chan_kill_bh(&c->vc.chan);
 	}
 	tasklet_kill(&d->task);
 	clk_disable_unprepare(d->clk);
-- 
2.43.0

