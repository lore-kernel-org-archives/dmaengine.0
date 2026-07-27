Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EDF442F6FB
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184854; cv=none; b=JLaqcRpexoUBrUAXQS8+yFHrBi8gi9RSn/0AVqVNSwsxvBrZoQRzz0lQO3eKcmUoaW3EsH4cR46+uFcbryCoUets71K/7JtoWVrRveQUvPr9ME5L/2JmOsVa6BN1MzG4pGa1fI15fJlRJvAFExMo5Mxj2L5xMqKIkjVFC/896KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184854; c=relaxed/simple;
	bh=lW2wTUWm4tidVpmm3+uZx/iTD15ObO9+7VhX/Z19Sow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cUIFfDr3O3ygHvX311O3ggo+zsC8e0utz0QcS0wUDCq2uvEn3HWElczd8otF5p95uYzKBvSxA6cwMcOWgfQJMlaNHvlBDAh24d+qwcvvHYR5s2o0kdU7SjPw7C6529wWyr6xlo9qSa76iSCBB+AXXw3hqWk0HoK99NxgjvToHYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=djWu3k1m; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="djWu3k1m"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-84862b0d5f8so2521656b3a.3
        for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 13:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184853; x=1785789653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oxEgrcYSdI7cEIJ9P4xxs9hz1FTezV6PfyYhzf4HXk8=;
        b=djWu3k1mmIQ2k/9aVO83kT93tcOMQJwE9Ao10FAwBl1dl0/nlK+4HsRWB62aVHaVnB
         NF9GgrdcrP/1zrez4HEvrk4qVME5v9nPuAdbz35bpyFvAu1x8akPHesPaRjsvzFrKpr+
         buXwgcqQPFEiAklvejI9fyRRBhUWeMeryWtFJgyxKnwNCwxOAUurlZL67wYzaTa4KeNG
         eT0vEGz9EZgbCDixq4G5mh0xo0pzQGrS0x5yR5cMQW8rPuc4hMg2B3ZaS1xfA3X6xJa9
         lurz9EtoVoSGE+XsJDf3nVytUTom835rnC9FX4zcwK7blHD90V3DS/4td4Ou7xNAZZb+
         BEyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184853; x=1785789653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oxEgrcYSdI7cEIJ9P4xxs9hz1FTezV6PfyYhzf4HXk8=;
        b=UAa49vkEeLUqc6+j7itTlDaniDvu8yT8UVEjlWGGPmViANOQxe/JZHSJc2C3wetoVT
         AaG8DLVb+SGAL5rbtNQoXZXqSfrGTtAK7M3GVS+sjcUEbrUwDZU9NlwkZrvm9Mz5Fp85
         yaizNyx+hHEhAmtllRZqH7jj1ZZ2gd4fA5DzIcwrAJxJbTvAMpLrW5S1alXlaW+gIKgs
         c691wIeRHtInSZNHJhBf8Z/utFgkYAnArhL3AZqxuhuY/WMuavpKkoIeb6ts3lzuFszY
         R6cVifZJxwsCsIH9JXwPzdfOxaHetI/LCoi6Utsq8iMue4ZlX3452lvjjiBls66CN0Fd
         r5pA==
X-Forwarded-Encrypted: i=1; AHgh+Rq77LqSKw5SQRmba0GteOrpH8FCTB7RlPVRZB5qVw0SPg5cZPcxMGzaoAt7T3MNT86iUvqK9JK8sik=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+oRTiAo8X9+jsPjqhfbBDkGsov/ml98WQMl97ygVaraCPTeQw
	mI9JAGnZ4r4BFORUnbf8oiq2BVX0KNWBZRK/mFaR79dseFSxcwJcTn47VZ8jLQ==
X-Gm-Gg: AR+sD12TIUKBOCemTjDmqPrLIw25S3t6Y6MRRo2zBbOfA4iH3x/L2Ee3y6oigymJNr1
	po3DYx/wDdLN0+iVJEoijFNICNsap8gTqh+EHgCQHmUF0A3Vj3UetHt+lNZd6w8v6/qmopeHDdJ
	omK3sHKFBgqysLOq0ACFO1evBUCpwzlhzAznIBIwR/Pz+PTe7EeeSFDQ0dan8xSe275Martrhm4
	pgZoexd3b8k0ZekGPKJPlATbsJlnP4kV6Qthx1H9HDiNpoG0f4I2OAOUpga54FnrGnB0r+KgGaQ
	wLKwJv6Wzt/WCt3lVi/2cgCGlka2VvSfmkcL1snW9qR7r3idGlz1FKQy0QoSt/EVx5g6z3IE28e
	I/juoM09lPSWM94/mRm1VFBE6+EnpY71on5ttTmUtlqiPh6yaYLwMWjB8RFmWMJM2vUVmZDbhQp
	Gj2kmr
X-Received: by 2002:a05:6a00:8d2:b0:848:2e3c:9955 with SMTP id d2e1a72fcca58-84e5942dc8dmr7537539b3a.4.1785184852856;
        Mon, 27 Jul 2026 13:40:52 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e533d1351sm3583338b3a.39.2026.07.27.13.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:40:52 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>
Subject: [PATCH v2 53/64] dmaengine: fsl-qdma: use dma_chan_kill_bh
Date: Mon, 27 Jul 2026 13:39:15 -0700
Message-ID: <bfcda179429c502ce7633b7858f07f8050999d8b.1785183549.git.allen.lkml@gmail.com>
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
 drivers/dma/fsl-qdma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/fsl-qdma.c b/drivers/dma/fsl-qdma.c
index df843fad0ece..e0fb39fe821c 100644
--- a/drivers/dma/fsl-qdma.c
+++ b/drivers/dma/fsl-qdma.c
@@ -1255,7 +1255,7 @@ static void fsl_qdma_cleanup_vchan(struct dma_device *dmadev)
 	list_for_each_entry_safe(chan, _chan,
 				 &dmadev->channels, vchan.chan.device_node) {
 		list_del(&chan->vchan.chan.device_node);
-		tasklet_kill(&chan->vchan.task);
+		dma_chan_kill_bh(&chan->vchan.chan);
 	}
 }
 
-- 
2.43.0

