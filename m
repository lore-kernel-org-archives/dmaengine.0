Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202052;
	b=yZve77/jrhmd5sqA2exs5vpnnzizQVMuvR9XzH156a+kEVIJ62zGG7a8tDxm2Djbf/vv
	 pzvCnh45FIs2ByU2yl08s49+EROZjrgQJuUEdDH/SDhRXoOUQU3/2gHZcoFfPoiWERXOc
	 P677jxFF4bZ7zn10Pk/jzsck8XMR1n/sG4j9xDL8tLD08QtoePzt8o5Xir5vMrtK1hhys
	 NoPZ2HRFnr/X8Nq0pR/LsqMXNe72xQAS3mOA7otCDqhhNTptrFRmp6RqyimM2P61MJ1R+
	 RJYOCdOLnldL/2i7Iv/vtzHS+hg7WS38ef9TwZqX+Xf9AgvQPDDPEc3LRCe/ucWV8fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202052;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=9XmdIKDNqOq1IqNyOaH9sp5VFW9+Oyqd3k96RmqKjnE=;
	b=TUyi05CeDbw88MccAHxwScLfKwshqWLauQpVhTSLVX14sUPdUx+3MS2cepXMx453ktPb
	 aGbc+RlLABbJ5uB7LU6ZNDJr8ytzKt//WgZgkguVVo/LYtiXv5/6mYy+IMugYqw2HCqEW
	 vOdFOPFxm1bJoXW3Sy1pG/pyIUUkKCfQCEwvS5Qqr7v31ZUINxm88sAH48GKEcSnqngUm
	 nJm5759+5xWEWS3yvN2SzpdJNCCkumYynBMoQFOysDihjdkL9Wgt+qdT+hST9USi6PkoY
	 cCyObcwDVRmwQ41BP3Nrx5Dbh9xORfiJd0JBiLx7Iw0vz6LyGjlXO+N3uG95DH8UJkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=USCAZclK;
	arc=none smtp.remote-ip=209.85.210.47
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58AA60A3813
	for <dmaengine@vger.kernel.org>; Fri, 20 Nov 2026 19:14:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B58AA60A3813
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=USCAZclK
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-862aca1ed4dso609704a34.0
        for <dmaengine@vger.kernel.org>; Fri, 20 Nov 2026 11:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795202049; x=1795806849; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9XmdIKDNqOq1IqNyOaH9sp5VFW9+Oyqd3k96RmqKjnE=;
        b=USCAZclKpTAGAq772/HU3Xz81Eg5tL3nv/vGaFsUbt9Vaw+3SGs4v6Nf4VfDh60iqK
         gr7kDSmTj0H8PxyxjsgdkB691dJ180xtqBkCWyI/IggJsycfLNEDU8tl3Oo/9KCy1N3n
         XIm1/9qFB15saRRsKIxK8z9fQK7RYbFsWde2OOaoliYL5sC4j+BtPZeVMqS6rSZbwp7K
         BAN6CPzBzf9B/kcP7EGmx9D5kc41nlYrNSrYQy/1VcbG+7my4FnU3EE7Y+bsTAzYEgSs
         Qjkuvuju6DqND8StWjj3J+cp4kqWc06H8Nx4NDoRqS6PikZdWKSN1sUrZbeQB6rmVa7W
         h61A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202049; x=1795806849;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9XmdIKDNqOq1IqNyOaH9sp5VFW9+Oyqd3k96RmqKjnE=;
        b=Coy+aEUn4HyQip250eMM1zrMgiFFdYCjiYkzLYDE5K+I60vx6zgQPAnxIRQIvS6Pqg
         Pppu7R3D9uREWhYJToEBzsSjAqDRZJRtZJ1JeNKIyz8l17ZXnx66Z73g8ZNy/0gYv3+6
         0Pa0VA6sUJID2EcwakcEgBsiAhBlzwFELYPUSZJ9L9YKCBMBTLAZ2mt+PKvYu3n3215g
         vKBNM1W8d+aWK8lHRWXE4KtdQPOgXIr3VM7UhTbZgkxV6TluWQjT4c8anXVh8WFKwvYo
         ln/xBJC47vBR16Oq8K4dHUXn7zCbQE+m1SdJORrdrrpc1MLrZDu8/ksyAVqVOmypMJEx
         Zbbg==
X-Forwarded-Encrypted: i=1; AL+hErFq+TaZKVJ3dhUPl5bLnzYKWwbH+rELWX+oyR5gK6XRONFvz5C4xsilDNHJFO9s8wwLHoQBqNCs4i4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cz0dxACZHgCfqgxWvgDrRXfNfK+Kq0dtyAm86+sBWM1DOnZyD
	h2nspAST/MbdNnBQ3+wpP+sQ6cMXEL7/x8OZnzJGu6d7S4LyQ2OebQ9R
X-Gm-Gg: AYBFou38L9H9xvgmJAV80WBUlFNA3VQ98w57YF64Fl0kTYTxKcbQKkWp/1BsKca/7xc
	TeRWomloff6uv94g8oAhEE0CvYtByxbvImKoIf9qvxJIpuky18PNEnANx952YIMYChcDyzkqFv8
	AuhWgG25AWW4fRAEOB9KAqFqnJZ07RZMl9smcEx2DYg38YcdLCvGMrpHKEyZGex7cYprIZa1FA2
	E+wAAf79AodIg6h4Yd205WA6OZbIISNt3mcoc/2prE/rmDHm9t5uKtOOYOFV1io4S5HbHRhXHLJ
	RHfeqGjCCPrpHwNYr4SqrmlCBOVcp45/3yhjKGFY/+qfYOnWw87sZdyAQBCj7xqlqzn2keeQGmv
	ZprxpQiDkfBxpnRiWXDaLM2DucEnuTm1UjSDeazFrIWFkoFuW+wP5wlYGe3TgmLmfgas9lfZwRP
	bW94JpnZDr0G3b7avWk9muwn1d6VpLmktzLz7SgMWlSIoZY6c4WgIRyY2d/VEm3Mi23AlXpS/1y
	I3ZAuu/lJHsNViZYnUii4UiWRGuz7cDuLfT4YeZyMpZToJSbkp9EdSmbkeq1Nnx0xaR9U9ggrt5
	FS66mwY/DXuB/Y4VYTrN3LMrvVzVU+8iyqcBmvRLHeLeW61sbG8UtXEf3YbeWAvwAdmECBsU5c2
	qIooNc9hBapCjobVvFIWmLWdG+wGIXjYHvpC8cnVSxLCyCBFuGFvsnxU+cuF3WoJoMjF9ThQmud
	Rggy4a15kLLKfugQO0vrd2El2+q2lidMRRBPKgD/xTtcYIylCO2bBa
X-Received: by 2002:a05:6830:2705:b0:862:9bc5:5c24 with SMTP id 46e09a7af769-8631596f074mr4518795a34.31.1795202048618;
        Fri, 20 Nov 2026 11:14:08 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168f3964sm2654782a34.14.2026.11.20.11.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:14:07 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 12:13:58 -0700
Subject: [PATCH v9 8/9] dmaengine: dw-axi-dmac: require an IRQ before
 registering the controller
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-submit-dw-axi-dma-stop-pause-v1-v9-8-48ab58961d6e@gmail.com>
References: <20261120-submit-dw-axi-dma-stop-pause-v1-v9-0-48ab58961d6e@gmail.com>
In-Reply-To: <20261120-submit-dw-axi-dma-stop-pause-v1-v9-0-48ab58961d6e@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sergey Khimich <serghox@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>, Baruch Siach <baruch@tkos.co.il>
Cc: Mitch Barnett <mitch@accuratesound.ca>, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.17-dev

If the interrupt controller is not ready, the DMA driver can bind
without an IRQ handler. Clients can then submit transfers but never
receive completion callbacks. platform_irq_count() returns -EPROBE_DEFER
in this case, which skips the IRQ request loop just like a zero count.

Propagate the error so the driver core retries probe when the IRQ
provider is ready. Return -ENXIO if there are no IRQs.

Fixes: e32634f466a9 ("dma: dw-axi-dmac: support per channel interrupt")
Cc: stable@vger.kernel.org
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index 2eeb902eaad3..531705f8f89b 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -1518,6 +1518,10 @@ static int axi_req_irqs(struct platform_device *pdev, struct axi_dma_chip *chip)
 	int irq_count = platform_irq_count(pdev);
 	int ret;
 
+	if (irq_count <= 0)
+		return dev_err_probe(chip->dev, irq_count ?: -ENXIO,
+				     "failed to get controller IRQs\n");
+
 	for (int i = 0; i < irq_count; i++) {
 		chip->irq[i] = platform_get_irq(pdev, i);
 		if (chip->irq[i] < 0)

-- 
2.53.0

