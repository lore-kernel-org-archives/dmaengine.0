Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793084452;
	b=Kc40ylpF2mCq2+45xi+5Hy72xgCcHmsWsiM7VPrSSs7S1cU/+2PreJAgglccoJmUfZke
	 7CaBwXUrrf6c9FSu+45yYtloqav/7IvzxTW6xVGAvROLcSTPqYnCFN9EsRBPF+z41hK8N
	 qsMTSVAcv0fjfVAlX2v2wEzTCMm6sSumDG0wlFpuUmdvehWe3vYVjFzr43TcmxAnDqMPR
	 yMik5JLzxPtKczEJYVU2EnsBWPlx+a4H6LUaqA7BDodNHLWwKWDRS0MdSH6RhOr08MU41
	 2IHWGPOfTFguQBnNJGw/YozNGwEHwFdKiQZx9Cb+T4hB2V7yRpO09GBkmUQbniisMbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793084452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cGATTdkdECjcBWxNbblz5Map/VJxFsYs+1/o7jtM7Y4=;
	b=cuLzpA7i9nCMT6DqQEpuHPo/ZsaWFL7aZgh4EAm749T4oVKzmeRy06TwnmT7lvldb8lj
	 QZUu8ua0efc8dnExw5JxIM4Tl8aXtikmtJnbnl6Ds2NQgLrwFAuu0rnIAWk56L/WbqB0v
	 u5xMUvTe20l52GsqbRIZN5hJDe8+BW/B24AOyhXInMvlpFcDRwFwKYyS5Oni4/d6LgjW8
	 ZmJX9As+Zy5GMAqiSiakFh4ag9usQZ3YbGUeF/8eqDab/djd8T7fprIC4UiK59CzyCvZi
	 MQDtpCuzLYECoo7OTtPylNZYlePRwa0ZU/J31RypWol2grSHvqwBtaxNcgaDyfWav1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BaBobvxM;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2FE8606A31A
	for <dmaengine@vger.kernel.org>; Tue, 27 Oct 2026 07:00:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2FE8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BaBobvxM
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e0d1da913so571274f8f.1
        for <dmaengine@vger.kernel.org>; Tue, 27 Oct 2026 00:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793084450; x=1793689250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cGATTdkdECjcBWxNbblz5Map/VJxFsYs+1/o7jtM7Y4=;
        b=BaBobvxMsAvvi0DFhbcLtLgfU0Y/8bb8HS7Yk4YGK/byyIwtPmEGG6IyURf4EbuhxH
         pp0Vw/eVRZb/rnstVd6UP/ZYF/H9pWxsyA0oZF39NYsjNwg1+X9TidofS9cPLBR44Ijr
         mr57urbpSYlor+h/IdtrJ/BNIwYdQgkP0g9fbytdiYQY/QOIot4Rwdjq6Yp+dYGI3zYE
         ohcppaD3qOZce+3T8/1sy46+Ah5yp49TIjSYspOMS/6TAVbGLU4I4htShdAxmgN56F+6
         qrTv/mPeh2kE76mUw6NARL1toS6lB6QN66L/ks6sIZk82vgo7QRL3bstXJVeEZDBGPMv
         paJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793084450; x=1793689250;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cGATTdkdECjcBWxNbblz5Map/VJxFsYs+1/o7jtM7Y4=;
        b=jocdHOA5lKtZ6MRn82X0vgkTGgYjRpkjRkyzuYaztACfPwX0sq70zqZfHw/s2UP2T0
         LsfTw7GKJK+0PSbT6NyB5LywI1AGsYBmgNjMcMej/J5g3iFk3gBwx5iU4c3m+irGD8px
         xHPXvmT70SoA8nCqeYJLs1/WtzXSFGKLGdwd+6rBbIVW9qGgNmU8NdI/6V61YVNSEJEP
         oTq3YGXkLYDUKouVNl7TBmH5vxZRArF9Hf49nsQOHPFZClLdljK8/eJslZM+HFhi5F36
         R9nEyjSwlVq+zTrFFF8BcYKCh6OzrSP/9pzc1YjEVxRDQI2GUsq8C0mNmZ7YlhqgRCUA
         20iA==
X-Forwarded-Encrypted: i=1; AKwUvBzoHSdCsbKmNS98VBcjej0pitHq3mj8qtE786yJpvIjdBid+8edQPELjiaabLUiaTpA8vF5gm1ffjQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzWzkvOnHbO2xaqy2Fw2NF2/x5jxGcenE0hKd/nCP3EGdUW9du
	BImin9whlWTbrW/cO9OGerAF4WwtjV5WyOdyCjNd7L4kRhExfY92N1Im
X-Gm-Gg: AYBFou3pTtw9DPF+TE+weY8Vnwc6aAqCyJDzMptxWhXhJJHbo8YS4WJaQ/MXGPesas3
	kHzW94+0pY7pskCXqgoKLzArfSG23H08V/9XRWzxvm+2IjdXq6aPnBIpu7Vrqn4kGoHa0q83b8w
	iZ619d20daMKq1K8NDEOFCDDC+OLel+IdogF0RPA90dDEM7Ei1K+5waFNhzIIS0bbqbbVgKQ+ar
	vncekqne1yyTYtwXU957ssNdWEYRN3ZDVF1mbEuLnyfCGMluZitcF3NJo/cANQlrx8CiHXSWXR8
	66d3ixpVnWF6GXfkN57vdXAnHCjAgbx/aK54UrhtHfZNg25E47Dy/9YCAG8nSiA+NCvDtuZvdfi
	PLBzZ9oCNrm2g5SE9il7JosrhtbOxRrRaszVgKZbtkg5+aVLbGj7Ub4L0sGD4LXHb7FjFjqMr6D
	fQ1ogK8anbl/dBU72U+bVE15hN9rC4UChxKun+rbCkeBu24+Dl6k1TKiddHxvasv6r4+DCBgQnu
	pxDxRivdm/1CLAS1qGNKrkAkCtez9XdV8BOO3NaE/FFf7SFMq6RYWcdUflLLgoNOScWNnz1AyNp
	JmZZKq6zf94lkhyKwbVbi1Mn+2Og7Jcf+tlM/9IYxhh/CnwMDJl3VX3xXo7PbxGEgMJexrDZ16J
	/AiLx5PvWdgJ41osLJRlh
X-Received: by 2002:a5d:6105:0:b0:48c:58b9:f17c with SMTP id ffacd0b85a97d-48e55a3ee4amr2846576f8f.12.1793084449747;
        Tue, 27 Oct 2026 00:00:49 -0700 (PDT)
Received: from localhost.localdomain (193-154-207-67.adsl.highway.telekom.at. [193.154.207.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f25fsm20270127f8f.2.2026.10.27.00.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 00:00:49 -0700 (PDT)
From: Andreas Gabriel-Platschek <andi.platschek@gmail.com>
To: vkoul@kernel.org
Cc: Frank.Li@kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andreas Gabriel-Platschek <andi.platschek@gmail.com>
Subject: [PATCH] dmaengine: pl08x: mark slave channels as DMA_PRIVATE
Date: Tue, 27 Oct 2026 08:00:37 +0100
Message-ID: <20261027070037.1809112-1-andi.platschek@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pl08x slave engine channels are only ever handed out through
explicit requests: DT clients go via pl08x_of_xlate() and the
platform-data path uses dma_request_channel() with a filter, both of
which end up in dma_get_slave_channel(). They are not meant to be
published in the general-purpose channel table.

Mark the slave device with DMA_PRIVATE at probe time so the dmaengine
core treats it as always-private. Without this, if a dmaengine client
is already active when the device is registered,
dma_async_device_register() takes a reference on every channel, and
the subsequent dma_get_slave_channel() from pl08x_of_xlate() fails
because the channel is no longer free (client_count != 0), leaving DT
slave clients unable to acquire channels.

The memcpy engine stays public as it is intended to be shared through
the per-CPU channel table.

Signed-off-by: Andreas Gabriel-Platschek <andi.platschek@gmail.com>
---
 drivers/dma/amba-pl08x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/amba-pl08x.c b/drivers/dma/amba-pl08x.c
index 543c2eb8cfa8..06881d3f29a9 100644
--- a/drivers/dma/amba-pl08x.c
+++ b/drivers/dma/amba-pl08x.c
@@ -2775,6 +2775,7 @@ static int pl08x_probe(struct amba_device *adev, const struct amba_id *id)
 		pl08x->has_slave = true;
 		dma_cap_set(DMA_SLAVE, pl08x->slave.cap_mask);
 		dma_cap_set(DMA_CYCLIC, pl08x->slave.cap_mask);
+		dma_cap_set(DMA_PRIVATE, pl08x->slave.cap_mask);
 		pl08x->slave.dev = &adev->dev;
 		pl08x->slave.device_free_chan_resources =
 			pl08x_free_chan_resources;
-- 
2.47.3

