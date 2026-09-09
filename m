Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7E037D124
	for <dmaengine@vger.kernel.org>; Wed,  9 Sep 2026 17:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788976444; cv=none; b=oY02I5OzdTbgktaFh4NG0xaKC9bJFtTTzj2w87ix95g2ZaxSoQLDYhFjHwqxDc/2rAnkdBGUdzqGnS2HgN+pce4l/AwLc9LQTDOR8HDJOA+I8EEa5y5FzAqggWOSJxG3th/ax1s6Lq9Rn5Wwz3jrxpeEuo9tPwlq5KFXCymLsIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788976444; c=relaxed/simple;
	bh=EMnT4kHchx2+P/lmChz1dpPEcXLACq2mnqCNT6dOulI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bk2BpoCXYce1prRc39imhbilKX7zad25McOx+XGbcvlLASiPV1zUeQxAvqpJ+aeffTev0CSxRQlCd1cwrCx2zeTxIoLPHlHPxlyubFggUdtC3rNEZtjIh6WjqbtoD5qGtZVND4nU+po3mtLbVFSMPfE2dFR1q7eGhBp6Q/oiJrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZXJLnFYf; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZXJLnFYf"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49ccfae359fso53142775e9.3
        for <dmaengine@vger.kernel.org>; Wed, 09 Sep 2026 10:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788976441; x=1789581241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O5n70PUZZye6R/YP7VdE8nN7+zey26ZUi2vpqGJsQtg=;
        b=ZXJLnFYf5AbyDEjAicmwiejoI3dQ3zCDZgX9pgqwIB3XybJB/YtPaVyfaYRbq/bxfG
         qPGBFeIPpyT6pKHEtEIqkP+Gu2tdhiKiKU1UlrD5IhjqHLeUmR0Baycz+km7tFgeFuwj
         v1ULEQsZf94kUetp9r9+L8pnEk2nyv6OFaIepdJt0fIrzFubYEoxAnjagu1cYcDhhSJA
         LFUUlAX5gdsviJUGAFTwCxRcVwAxouMAPnytckmm9O86r+bBLsaLcbzo8vXxL/bgjNRw
         BhGvltGkNwlKhE5QVwXQK5j44FkLmEKS8a/R5JbB3ItbzLMxDB1d7a25LDdkO4sbwjhQ
         dpBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788976441; x=1789581241;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O5n70PUZZye6R/YP7VdE8nN7+zey26ZUi2vpqGJsQtg=;
        b=RT1mBLdNBzLSi6R981aTY9MmOc8koQiH29O7pzYtr9vId4ri7SBDcC08QenRRBRA3i
         lPVEtFkCEWE/A37v9IS9G6Va/E2DZgz8U5By4fAv/d8GFmt+NqMYGJbezc2HCtzavWFd
         Vm+uRqF5y/l8Nvc0OBHc7RyGxTOozniLlaTFbtrMbmUqkk5sD7umIYSvQmKvNv9yMLlB
         3dwjcyQ2oymUvhiR+Jd7xZbX0VBnzFsH/gklapill9YnzE2fTrrGdSec0LMnrBIin6iI
         szw1LwLsQttr15h9TUDSyVRO8egiyAUFh7GZb7DGECpdnlF66oO+HvYVMCyiyuZezjFg
         /peQ==
X-Forwarded-Encrypted: i=1; AKwUvBwQrJje4dlrq/jq8cMXcwMI+JBQJS/quUZF1I12iDrAJe7KC7jaCeHRvhVW5k0RTCaED6x6+5HF6eo=@vger.kernel.org
X-Gm-Message-State: AFuF++mVrbn085DMb8YdS752FMfdTHlhPdaQ0UqTLv+EjDBj7rnR4U01
	OijaI4k3ayF4zcWAs5Ce3rXNd71NAjjxK20/3TzHjyZonbj9oIalcFsQ
X-Gm-Gg: AYBFou1yJMXJDnPigYeQPl4+VHttZXc1K7KQhdo2ylEyF9xRs4gYrszvHXwRxSco6Ar
	0E6Zb9oa7+6MuSs7AUXzUOkgldWhAN2wz8sXSfqg9ErO2xZgof93CLUUApADYkLPpJoyz+oZiMH
	9MlCzQZ7GsYWxXhujjv2fhMTvZ5NdLViVZz2sDbqqjmxWS5kGQhWcSs+KDf7uT3JVAndFx48YkC
	TGyNVYMZSCHpcYmi1VlaeP7L7CjBu991GrSZOvMwj9XftE4GE8dbePdZ2+6PDk7mWjCLHwy/ahf
	LnA6RwstEouleqAXAL4TzeqaI494bZJyzUhUXzhFNeV3wNg+aYq1WVNM5rcQAat0FswXk0wKIiK
	Qu1vRoBy00KqwcSexXr47oBsdFWqYtp8zOASlVaBl0iDNtHA76VWalHHSIEPrXFGRxjoNnytVzz
	lEik9ya6Ld4a3IMRKaRA0Wj5Q/fml4med1mmuMYIspNSqAg3D77wW9HOR0NcmfVDdFGXJfEVQL8
	FA=
X-Received: by 2002:a05:600c:4684:b0:49c:fc6c:be14 with SMTP id 5b1f17b1804b1-49cfc6cc10bmr334315895e9.26.1788976441025;
        Wed, 09 Sep 2026 10:54:01 -0700 (PDT)
Received: from Empers0n ([193.23.219.104])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d1fd532dcsm68031755e9.1.2026.09.09.10.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 10:54:00 -0700 (PDT)
From: Vsevolod Nevorotov <sevanevorotov29@gmail.com>
To: vkoul@kernel.org,
	dmaengine@vger.kernel.org
Cc: Frank.Li@kernel.org,
	andi.shyti@kernel.org,
	mukesh.savaliya@oss.qualcomm.com,
	naresh.maramaina@oss.qualcomm.com,
	aniket.randive@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vsevolod Nevorotov <sevanevorotov29@gmail.com>
Subject: [PATCH] dmaengine: qcom: gpi: Set IEOB on linked I2C GO TRE to retire TX descriptor
Date: Thu, 10 Sep 2026 00:53:32 +0700
Message-ID: <20260909175332.304767-1-sevanevorotov29@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In GPI mode, an I2C read transaction consists of a command phase on the
TX channel (issuing CONFIG0 and GO TREs) linked to a data phase on the RX
channel (issuing the DMA TRE to receive data).

Commit 656147fb1d4c ("i2c: qcom-geni: Avoid extra TX DMA TRE for single
read message in GPI mode") avoided programming a dummy TX DMA TRE for read
messages, leaving only the GO TRE on the TX channel with the TRE_FLAGS_LINK
flag set.

However, gpi_create_i2c_tre() did not set TRE_FLAGS_IEOB (Interrupt on End
of Block) on the linked GO TRE. Because no TRE on the TX channel has an
interrupt flag set, GSI hardware never generates a completion event on
the TX channel when the GO command finishes. As a result, the TX transfer
ring read pointer is never advanced and TX descriptors are never retired.

Under sustained or high-frequency traffic (such as touchscreen controllers
operating at 120-240 Hz), the TX transfer ring quickly runs out of slots:
  gpi 900000.dma-controller: not enough space in ring, avail:1 required:3
  geni_i2c 990000.i2c: prep_slave_sg failed
  geni_i2c 990000.i2c: GPI transfer failed: -5

Fix this properly by setting TRE_FLAGS_IEOB on the GO TRE when multi_msg
is true (matching Qualcomm's hardware specification and the existing SPI
implementation in gpi_create_spi_tre). When the hardware finishes executing
the GO command block, it generates an MSM_GPI_TCE_EOB event on the TX
channel. In gpi_process_xfer_compl_event(), handle MSM_GPI_TCE_EOB for
linked I2C command descriptors without a subsequent TX DMA TRE by
retiring the descriptor and updating the cookie without invoking the
client callback, allowing the linked RX channel's DMA completion
(MSM_GPI_TCE_EOT) to signal final transfer completion to the client.
Other EOB events fall through to the default transfer completion path.

Fixes: 656147fb1d4c ("i2c: qcom-geni: Avoid extra TX DMA TRE for single read message in GPI mode")
Signed-off-by: Vsevolod Nevorotov <sevanevorotov29@gmail.com>
---
 drivers/dma/qcom/gpi.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
index a5055a6273a..a1ab63bf9f6 100644
--- a/drivers/dma/qcom/gpi.c
+++ b/drivers/dma/qcom/gpi.c
@@ -1050,6 +1050,13 @@ static void gpi_process_xfer_compl_event(struct gchan *gchan,
 			return;
 	}
 
+	if (compl_event->code == MSM_GPI_TCE_EOB &&
+	    gchan->protocol == QCOM_GPI_I2C &&
+	    (gpi_desc->tre[gpi_desc->num_tre - 1].dword[3] & TRE_FLAGS_LINK)) {
+		dma_cookie_complete(&vd->tx);
+		goto gpi_free_desc;
+	}
+
 	if (compl_event->code == MSM_GPI_TCE_UNEXP_ERR) {
 		dev_err(gpii->gpi_dev->dev, "Error in Transaction\n");
 		result.result = DMA_TRANS_ABORTED;
@@ -1668,10 +1675,12 @@ static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
 
 		tre->dword[3] = u32_encode_bits(TRE_TYPE_GO, TRE_FLAGS_TYPE);
 
-		if (i2c->multi_msg)
+		if (i2c->multi_msg) {
+			tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_IEOB);
 			tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_LINK);
-		else
+		} else {
 			tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_CHAIN);
+		}
 	}
 
 	if (i2c->op == I2C_READ || i2c->multi_msg == false) {
-- 
2.55.0

