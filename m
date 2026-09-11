Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D113EFFD7
	for <dmaengine@vger.kernel.org>; Fri, 11 Sep 2026 18:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789152531; cv=none; b=tA+J6JKF/KEJOA9GAH77Nt8Wjaset3fOrJwkNTIqAig7I41JJ8m4jjbS6mdaXuL2cB10hHAp6T5ifJaX6ZlxrhLbQ/7kE1WaF88xqn9HsY/S77wbNo2gHg5fLQ9R2AqkiSQ3RZPxYEjCKUWMpirtsGoe+cSqlYT8EdhecW2kuHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789152531; c=relaxed/simple;
	bh=gZ5i0XgbuKsA6Uj95jN4pnPRMbKgY9tYTi/l34huXSA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FZHP24aHIt3oPrvsVgEsMcOQlpLjIrrjVXthqfNK3CUS3KdN8fVGQ3McqC4QMCpfWesCujeF86IL2HXRfh+RFnDuTVwWPTWRrilaINMfwoyQqvEWbKYUpNprFEmbYe0w2ATx5MLfdmkKuLP6yxrKNhdFnIbC1kuyrMTc0zHvR2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UCdVkWK4; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UCdVkWK4"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-52fa6005224so13434191cf.1
        for <dmaengine@vger.kernel.org>; Fri, 11 Sep 2026 11:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789152528; x=1789757328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TZZuyrKf50eYXDMR9/RtxPhzJQSYHI855hdGibW04Pg=;
        b=UCdVkWK4Hxy2ssWWsTfBdYeL+WVSZE5IVrV4ghqiepijBWx2m35e2/sG7eGNGZSruV
         FSnNbzCXgi8n0AWYPoYffqhxgdXU9szHC85yRaHaMKI04439xAfEgT4/IkPeaMUIYE6o
         autT5i8jiTl1nMSqZaXsJTssn7cmoTd/oIVVjLfCSb2ECOdD2CWIyavyMol1K4EdeCKe
         RkwhpyFB42oOpOTOVVD3zaq2dNoQVFbZm4ALM0UjcLEa+ZxH9J+npdGJD4V9LvEqBDG6
         AA6p3VQXi7rgHdkui3ga+8V8V+i522jztAlor08DRmV1i6rgJifP3Kug1+fJwnQDUs3a
         tQjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789152528; x=1789757328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TZZuyrKf50eYXDMR9/RtxPhzJQSYHI855hdGibW04Pg=;
        b=rrALVvCyJ9tEhHkaz8KlO3qOpVvC4dQGZoIzyyKHSCBNdfuizJNDI1VGSBTilQTTk3
         vUvQETWaZ6CJSqTfbSEiARlATZowtjFoQdb1ffzCqIauLjFE49b5HNf6f5RBYKGieb/Y
         OG8l3b6JTYN9gJ6rrslR6Bh5k6Ety/YNsTI13WopfKIciEEr1k7jlge3nqRkbPh/Q8DJ
         9ZE325TjvW4l3HQrTAcwiuAW9xyF9+4KQ3TzoqMsh2ea6UgPyvUXuu1RAwQZC2aLEYJE
         2MkKNQ94alTEjM7hukzKcOCosgYB68yYkhsa2/QGl2caB3/VKftH6RcbmtgjwCTI3HWs
         dEvg==
X-Forwarded-Encrypted: i=1; AKwUvBwvIUU/4mQzmWZFxqy2m85vHYUpxGdHoVYznxgshbVhJiUy8CwNF7dTc0Idh5RAnegSq+Fp9L4lQ+M=@vger.kernel.org
X-Gm-Message-State: AFuF++nfp4IwWBfUH/esEr9eImduIpWQmWyB+vtzB2tVgaMJl/rXbJaC
	VUQmC0Rns/rPJudo1qYAgKnBKz+/cFscUgEyMtvlQZrO37n0Er3Tu/0=
X-Gm-Gg: AYBFou2WYRbistLX5cUc8YOriFo21Z2jMY87rGhnYargGf0TaovX7EhVzACF3SnOLgG
	VILdmrmBV3Mz4v3AOp5Z8JSGRjlC8xwdRBqCL5ARjS3PPxr7ypbcMQwofwIec8UCNCPbZovacnj
	S0/Nu7cdD75nDxvuUA6k27MGBm4lyT3pxuWtTxnjgQfH0QJxESimkv1yUqsFG9RDC+MnEv0DylW
	3zHBZoNmpEu+72MDLbO7vlS1DufGV/+OcbsBvpXKwshRDwl4fdAyMonmgoCo5r19TMGjt++CI4j
	2kYM8kFwCog7HYMS9FkTj4gUzAz4j4DMN9dUR/+2g8jidRs8Wal9tc8tmK39mtkXYwdONXJNbCk
	uwsG0jfVuX2PzcD+LF6lO6adde6TabFsMT/EN9paihZRUZZvob21b24Vyh84PNvQytN6xDfyPGP
	1gjXfTZXuAf7C0Fahud8xWpq/o6gQwub14rC5JJZYal/HGyass8daHIHPZvswWz0KqqveeGz373
	MfR+QwCVmQX4ReWMBSnDSgXEb9ZKvVlYHS5XL0UOpSRMp5TUwgDtu6rtzq/4GERZV8W9sug60E9
	HjDPykW7f7eh1sMxlOAtoku6wXsstKz3OlQ=
X-Received: by 2002:a05:622a:4006:b0:530:b2e4:d598 with SMTP id d75a77b69052e-530c8754c05mr79942701cf.51.1789152528459;
        Fri, 11 Sep 2026 11:48:48 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f4d389esm26707086d6.42.2026.09.11.11.48.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 11 Sep 2026 11:48:47 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>,
	Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	dmaengine@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] dmaengine: stm32-dma3: disable the active clock on removal
Date: Fri, 11 Sep 2026 14:48:41 -0400
Message-ID: <20260911184841.34222-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Probe enables the controller clock and runtime suspend disables it.
The remove callback only disables runtime PM, which does not itself
invoke runtime suspend. If the controller is still active, its clock
prepare and enable references therefore remain held after removal.

Remove the OF DMA provider and disable runtime PM, then release the
channel IRQs before disabling the clock. The IRQ handler reads controller
registers, so wait for it to finish rather than leaving IRQ release to
the managed cleanup that runs after remove returns.

Disable the clock only if the device is not already suspended, then mark
it suspended. This avoids a second clock disable for a runtime-suspended
device and also covers CONFIG_PM=n.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: f561ec8b2b33 ("dmaengine: Add STM32 DMA3 support")
Assisted-by: OpenAI:GPT-5.6
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/dma/stm32/stm32-dma3.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/dma/stm32/stm32-dma3.c b/drivers/dma/stm32/stm32-dma3.c
index 4724e7fa0008e177160d085172cb89d6bc483c4f..b4d68be5a46b8aa1751dd32234d42f6e6b470335 100644
--- a/drivers/dma/stm32/stm32-dma3.c
+++ b/drivers/dma/stm32/stm32-dma3.c
@@ -1926,7 +1926,21 @@ static int stm32_dma3_probe(struct platform_device *pdev)
 
 static void stm32_dma3_remove(struct platform_device *pdev)
 {
+	struct stm32_dma3_ddata *ddata = platform_get_drvdata(pdev);
+	struct dma_chan *c;
+
+	of_dma_controller_free(pdev->dev.of_node);
 	pm_runtime_disable(&pdev->dev);
+
+	list_for_each_entry(c, &ddata->dma_dev.channels, device_node) {
+		struct stm32_dma3_chan *chan = to_stm32_dma3_chan(c);
+
+		devm_free_irq(&pdev->dev, chan->irq, chan);
+	}
+
+	if (!pm_runtime_status_suspended(&pdev->dev))
+		clk_disable_unprepare(ddata->clk);
+	pm_runtime_set_suspended(&pdev->dev);
 }
 
 static int stm32_dma3_runtime_suspend(struct device *dev)
-- 
2.53.0
