Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445624;
	b=JbCe9gwsjy3/oGbbMIrxfd4HpIYW4diZVkXruz+ezj61R10Yo+/JQ1Lzj7VafqKsdm1s
	 dEw/FqSx/jW3F35ur9D8SeShxLVT/ZW/Wrz8KGUTlKz9n1IsmHmSpNZo2yAprnaps1bTD
	 OrVn57bEW4IzXLC85ltrD2dp0YSl04HvW2u0zfRF1V+mSjaxMSaJCOPLHvIRm43PyigAL
	 mgECiZd2z/SXJFxXoEQol6fLmVpITPC/EHUpPxC2bli+kVTVkjgKQsHlD3J7jkWaoqmqi
	 Fhzh9GFlZIeaEUS5vc/+nvvvHbn2ZLPeRf9qlZOcpEDS/2WAYoBKFlgc98fWV0drnsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445624;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zrHCc76aLS6mD7wsfBCrlZZx8i9gK6gdpTx6g5oieAs=;
	b=Quaz+eDnaJ6gFKXaCeptD7XQCTGXepelIf22A4lwk0ZR5iZbwb16567u9xEnyvUuBaEK
	 wEjygYPqjFpY502/YiA5bXQxlQK4TiaHTC6ofpaD/b9HxSgUqKHjAajkfaQ++k5PAxEl0
	 muUoXYbtchmSQOMgTlObaBN3Rq8etsM/GIDlSAS9IJIQdTkjsi8lsUNriKYiDU1uxGLqX
	 F9ewjk2nlNrtkFR2RiUiIHOp6lCEGGGe411P096vpXd1nByRB9B0FoKNFESKBvt5ghGdk
	 52SiUvuKVWyAm0nFScWXje7uTnzew0TMzZmAlNMdIb5QKj9Qx6gSwTH5oziQZ33dumQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=NnumrRdf;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7108C60A2610
	for <dmaengine@vger.kernel.org>; Mon, 23 Nov 2026 14:53:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7108C60A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=NnumrRdf
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4ad6219f7d8so2696355f8f.0
        for <dmaengine@vger.kernel.org>; Mon, 23 Nov 2026 06:53:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445623; x=1796050423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zrHCc76aLS6mD7wsfBCrlZZx8i9gK6gdpTx6g5oieAs=;
        b=NnumrRdfEux5gfgyZcOFK95vPXTjkeGWjRPizY4vGc1oc5gkOETNYiNoq1fkUnl0dM
         oeCG0ZX3cxg/z85w+zxVEKRBmU3WmgXi3B9BTQ5fkrpjcd7MNdP34a5zOLYBlkUcet/8
         EcLgl3sHpfxQkNNp+hj6n36kcfu2g7uMgdzH7XQmYzXBXRU38b5THI3pX5QRsq/zIQ7s
         VhiG3OQWjRdwTRM96qdcBQiU5gWsWEH0l88FKXVtRmn9bvkKI1GCbvXpKshiiv1F6UCv
         oRhj+qm09zUUznmdSbNle/aasJ0oJdIwG9ihReM5dnKf0DvBgNUoa0/wFxjgtlFMwuCr
         Wx+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445623; x=1796050423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zrHCc76aLS6mD7wsfBCrlZZx8i9gK6gdpTx6g5oieAs=;
        b=wZDAdvfz/llfW6tNli6ls6wsJPw/ojQkdcfzavtgOhqWpeckPUujOZzUQJ28P+2qEf
         oxp3Bm4xcMFFeFsP7awTljnnW1sWqhnj9zk2JyC1kTuthPaZJjvwNUYL5IY5zXCghf7W
         ZrSiNbPP///ezXFD+Tv3su70EKigyRCokptNMlSG5oJuNlnP9BAeiM2VcIlSS8m9G9ka
         nhF8WjsUnhoxj5ED4bOvJhM0yfuKNp5VLA9Xe/yA/2EDvPDl4G/418cjU/U/J8RdAWPL
         +uzcTIWI6wIQD7s2hf3ZkSrGimIcqjQsnLe4BUa7kzHpcP0E5dc5Zhy13FyXkd2A1U9d
         dcQg==
X-Forwarded-Encrypted: i=1; AL+hErH8rKXyc71Qp7F+05H6J0KJbEFmfaU2R9kbnuAuEvMuH6rUhPvzkls1yrqZfPOw4A8UW50ssIebMUE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/rI/He0YIfvTVSSO65vQsBhxja4VP5khilENGv5N74PvD/iHK+
	56TI5puwjJCheDaYNRjDiwmW5g+dYZU3cK+Ly+1wArSUWwbj60PGyEfh6ZbiNpqFQJM=
X-Gm-Gg: AZFdTZfUYIF6yN243sEsmGml0Uyid361+iJHD7Pe4r34ps7hKZs8FjEZ7BvFb8JVutM
	wchNaaSaoV8W+PxQTBc6gTUBskl1T+rgnNCa60Jn6+5jDzCMWAosTCEncG6Ppq5WeHg4fQKXCTd
	DNsiitzGiAB9f4J2lCwnF/mbAoMlkvFPpbtPsJI6KxGM4pgNu2QVBZ+JQQXGp63ZZMOx7mnBS1k
	epfT8t7PoC9H2UXJWjI5iV82CeDzJfH7btfp0JhioN7rDMX6lpyqij5ts32wj9R8jQtaC41e9m1
	2UWeOJRMRgUc1sy/voer82RxmCcsc0bITwI3eJWh8NUSwuNV5z8Ptrggs1q1zdUoA3XG0fOMA/I
	MyK9ukb7QR/R3CEmVxpEOuZ+7bWKgixabPy85eFGUcUiq3i46CV/PSMBitXBPiG59331sJcRcQG
	wxY3QfchNBBJfbGdMBSNENR+B50Pm1Vv5e8EOMoOz6CYytmcTphURWFo59bIBhbgkfxrSJenx+6
	MfwGu6Ka2Qkt5PhnQqNg+qGJ8ATrBny6Mf1+Ivf3w698cmcVEujDmyR0fPCFFgTB5xa6R+irTex
	HSNdvKEci9trgDDC7pCLAEDH87Tv/ScEZ50ibaUoIRNyDm3W
X-Received: by 2002:a05:6000:22c2:b0:4ad:5e91:8fcb with SMTP id ffacd0b85a97d-4ad5e918ff5mr23600375f8f.25.1795445622898;
        Mon, 23 Nov 2026 06:53:42 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b2050f1sm22447029f8f.38.2026.11.23.06.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:53:42 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Saenz Julienne <nsaenz@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dom Cobley <popcornmix@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH v3 07/28] dmaengine: bcm2835: Support common dma-channel-mask
Date: Mon, 23 Nov 2026 15:56:45 +0100
Message-ID: <20261123145728.29082-8-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261123145728.29082-1-andrea.porta@suse.com>
References: <20261123145728.29082-1-andrea.porta@suse.com>
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

Nowadays there is a generic property for dma-channel-mask in the DMA
controller binding. So prefer this one instead of the old vendor specific
one. Print a warning in case the old one is used. Btw use the result of
of_property_read_u32() as return code in error case.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/dma/bcm2835-dma.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 51e3a40dbaec..1087157fb242 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -991,12 +991,19 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
 	}
 
 	/* Request DMA channel mask from device tree */
-	if (of_property_read_u32(pdev->dev.of_node,
-				 "brcm,dma-channel-mask",
-				 &chans_available)) {
-		dev_err(&pdev->dev, "Failed to get channel mask\n");
-		rc = -EINVAL;
-		goto err_no_dma;
+	rc = of_property_read_u32(pdev->dev.of_node, "dma-channel-mask",
+				  &chans_available);
+
+	if (rc) {
+		/* Try deprecated property */
+		if (of_property_read_u32(pdev->dev.of_node,
+					 "brcm,dma-channel-mask",
+					 &chans_available)) {
+			dev_err(&pdev->dev, "Failed to get channel mask\n");
+			goto err_no_dma;
+		}
+
+		dev_warn(&pdev->dev, "Please update DT blob\n");
 	}
 
 	/* get irqs for each channel that we support */
-- 
2.51.0

