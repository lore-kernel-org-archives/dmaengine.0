Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82FB3D5C1D
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184729; cv=none; b=oEgVMfoFtQIFhdxNl3COhYL+ZjauewIA7C8YaWsQpQQoVuNStsqY1r7xvm/j8ozuPFRHhqp081noPutBm9YdgRZWQXuRaQfIK7axLFg+bH1A8xbHXIZyYWMKoZWwUSNzS0DxDnPf1dbzdoy5QCHcM5Td8LW8GsDb12L2WLPMYww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184729; c=relaxed/simple;
	bh=tsOV05TunS5OnTdsaKbTb4lMg50GNUf51Ryfq2syJms=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N8rgu7Evs9S7cglr12bsjyXqlj5KQPdJ1lD2Kqpv9ZIF05N5Uirx+nN+DI8kUAOdqJ6cgzdRH09ZoUE/a0vWHrrqBkKwhQAyZSzXOI+aLbpuffdoWJhKoL/9rywI5yTQ9PBGoWn7+/VCZGCPB1Yozb9ERnIc7tJD06RlGCW0a44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XXFT40/+; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XXFT40/+"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8487088510aso2575286b3a.0
        for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 13:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184728; x=1785789528; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IQUfL15au6uUXVbQCz9brQWDzEvsrZiPzLH8SIYjCQQ=;
        b=XXFT40/+Z+MmAzVzcdCn8G3P4vGd0okwPMfB7kap9C5dm97OZvOqLq3KVMjkdKmZUX
         M9SwB5C+sRPp/nlJyT3OHEsRJiQXZMMA9kVyq94jxQ4kJiwFt30p1a/G5GgeRiLdI1up
         1Fjx2IwtDNK8W3qLiCNc6z1Y+xvSHpMbBH3lVY+pojKRBfnxTL1WJ5hMbiRdskzvuw0W
         5sd405Kq1bY3jfNOIwZ+KpHuQG9yCtWv2r78q5wi5d7SdTfh/xi7CLVit5fYhoxcw12o
         hhZZAeWgUWUCCbrB7jGuvQ8+ohbeBr8C0N5ixYNLWTc7jKprKtGNEPtWjXh0rto71kBv
         16qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184728; x=1785789528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IQUfL15au6uUXVbQCz9brQWDzEvsrZiPzLH8SIYjCQQ=;
        b=DtrutUYwwYLCGICJwjn5A7yh5HHRTKXRxdsSXAx1hrdiKb7f06d1DKMMtbt+SStS9m
         j9RVborjHqEK7vb69aX/5gzYaCbcOgdGSSp0xYjRUmCWhf4kqYr5VoDefH6BoZ1craEa
         6TAOgSH00vv7Jt7GmTk40NJYu1vT9siqzu06WmHIA2n5JeAoe2HOK70reVz3kJj8pI5k
         3IiYQBMFVZoc2l1OvwozrJmODsBCMt4Rc+nbX6ftjv5Po18sNnP89xFcDlPAgVfq2K3F
         sWKUvK6gjLZZVNDqowv3rhGgC0P6abhS+C0qK5OFUtlS/iOwRjYep6Vhyvc0/ZsRIfi+
         4EZw==
X-Forwarded-Encrypted: i=1; AHgh+Rq0EYzJPrQuzEGHHuIKYDObgeGgH3nbqtaE78VAU6pG9MOdXKDwe5OFStN9RsdUjXL0EcWD8SclpHU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxzav9TKSsYR2QXPUJMKNFfHDEY2xRQffO3G9/21/HeToeLmSxM
	vQz/ZksDfVXAdEFTSfKGUIbuwG/7df7/6NTEWasmWl5VdVQvxQGyLX3c
X-Gm-Gg: AR+sD10y7NsBESst6ZJbt9UC5NyDSBvRbQbbvXc7l6tpwQhykePK03yHhzVhVKW1/ft
	b9tGsmtLSv+9WUFTxfmnE/02k5SspC2+MEcYtUEkAHMkgo5NaadhKHzxZj2aBpMgU3VLUwYEyam
	9Y1DTAYwI1ZDs58WIK52hq/EBWJJCjICx3e4is+oHE3hdeUjWyDglGk+EOxRq9l7uuiKM9OSZ4q
	fnk9Nis2YSCWYmhWQ6cPxbXNtbps5iJvG4AemOMNeW+dfdKuAsBibtqX62zNpGi0H6cf37G2t0A
	EDsu7zisDdUVX82C1uhlrr6KJJTiw2TT15az9Wgs/gxJ/TobFCtMsawPcQBQXv6Lvwl3dhZi8T0
	j+eGWH/9WGtu1NoOpODUjO86nTYcKXpjt45FirYbyV73P+ey50Mg4Gu0SFLM5xRQVG5HeV30XYC
	pAGw0L
X-Received: by 2002:a05:6a00:178f:b0:848:2f73:8ffd with SMTP id d2e1a72fcca58-84e8d4c5f77mr750987b3a.70.1785184727948;
        Mon, 27 Jul 2026 13:38:47 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e5344e583sm3472383b3a.57.2026.07.27.13.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:38:47 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 34/64] dmaengine: mtk-cqdma: kill vchan BH on teardown
Date: Mon, 27 Jul 2026 13:37:43 -0700
Message-ID: <b0f12f19d5ad706bb5dcb26cb0e573d78ca22e2f.1785183549.git.allen.lkml@gmail.com>
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

Use dma_chan_kill_bh() for virt-dma channel cleanup.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/mediatek/mtk-cqdma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/mediatek/mtk-cqdma.c b/drivers/dma/mediatek/mtk-cqdma.c
index 80791e30aec2..3b0f1d8fa205 100644
--- a/drivers/dma/mediatek/mtk-cqdma.c
+++ b/drivers/dma/mediatek/mtk-cqdma.c
@@ -895,7 +895,7 @@ static void mtk_cqdma_remove(struct platform_device *pdev)
 		vc = &cqdma->vc[i];
 
 		list_del(&vc->vc.chan.device_node);
-		tasklet_kill(&vc->vc.task);
+		dma_chan_kill_bh(&vc->vc.chan);
 	}
 
 	/* disable interrupt */
-- 
2.43.0

