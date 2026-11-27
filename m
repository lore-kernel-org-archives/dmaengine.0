Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781946;
	b=L05tbejixbKZJFvo7l7Nap2RrzA18jEfRt1LmKo+CPNC9t3ARqrrJSeUOQWzOeY9pRGt
	 A64RghNHLdos0ZBhat0U0hNg5FtTzyJV0E9Rwy3vXttfEaaLqtd0azQdGNJlLBTxxvLC0
	 M46iC669RdsUEv5Fgjy8dNGbiC1qnAqy8jZyyaN9gQ3IZ6C4UOdzX/TlKAauE8o9w9HoV
	 RcwWJcA3LqlewM6BbtFd5sQOp2I4lZvWK7jebUMMbsaGbfX/Azys2fH0GpUsKBByvRXOv
	 5yVCsnUGUxODqlKA5clktCikbhWz4Ht/93PQ0evrFjygyfHnBzJLLeSRlHc0Vsj12Bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781946;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gcDUe7weJJYMrvTg7gVHHmg7tsUoApLJH7Q2bv9KvGA=;
	b=uzTFVoujrDUXCYYGbE57dDhpCRmZX40y3+zpLtqD1I+qnu9ez/Lb7cpzcIo+QpFmKvQX
	 KDwSh7bjVlQEIXc0ORnE34d024O4kijCrgiEeqq6urOqZJuI6XmuRre7c1fwOr0u5EW+G
	 DzvKb4VowqADBQ51kePlMEz7r9VyZ9egVKJaqqz44j78XL3Lv/5s7uYJmjeqCv8xbuvFh
	 Uk9xtyNRTAZP71XCdmOxqAWrrpL6M5udg4dNtLgN02sSulCkQcaCDCcrQiEE1dKst+N9m
	 Qk4Z0Pp37w9+zDkJ32CspBc6YydSx+Fau3k45PDxhDBKs58PF50rUL1GaKPq62hGLlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=LlfDG8Yy;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBAA460A2609
	for <dmaengine@vger.kernel.org>; Fri, 27 Nov 2026 12:19:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBAA460A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=LlfDG8Yy
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb9d8e8e90so51695345e9.3
        for <dmaengine@vger.kernel.org>; Fri, 27 Nov 2026 04:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781944; x=1796386744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gcDUe7weJJYMrvTg7gVHHmg7tsUoApLJH7Q2bv9KvGA=;
        b=LlfDG8Yybx7d37cHaAKtJuCuShAmNgy6eWz/R2KOTm7I9hXGIXKi0sotFty3knaimi
         HHrLuLUb5LzIr+Jds4OpxTFmx2Hd+YW1Q8x/F9l6mQrhRKaWy7JNHREl9cMkwfxvdk9R
         sypRCT9yjLx9cVwWn3LrI4/hdXhUbltxjBeEYeVINpc4Cpv7xOiyD8T1JgBbQXxXSdFg
         8vRKdVm+OsVMbrZXM/p9QWru4RkckRMx7uuR7znUSLyZpuyzyO8oJEd+wteYJ2N6mi0Q
         vcQ8jBTpOAMvCizu64UdHAT/AkLBPIulPoWJ4NUlm9BCX2cw5RfbKdXS4I4Wyfp9jOTp
         CHNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781944; x=1796386744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gcDUe7weJJYMrvTg7gVHHmg7tsUoApLJH7Q2bv9KvGA=;
        b=ZHo4L0zR+K1Il0XPDIjJFt9Xy731OzkBUJEbGcTdS//XUchi6fa3scyqzIscTYOIkm
         TOUraV8SQ17yvQ359jUZ0AOB7hQN6qqr31kKplas52aASK3EUjs7IqEGjUS3tggU4p5B
         W+VdEybnnmXpgMbrNf7kHCqtM0jBrGFq+bLTP6UMxJIEG/8JkDnuQxHw/NigZmXKM9tR
         EHVgolsW5XaaQo+A3d+EcqIVh/X2LeZ3jYaPO5N3+cNhRdddlc6MFi/viHoM5D/JqWIL
         5tV36cQaPvawbnwS/tNbBKao62tkYmQ1UTGe4VFle/4nZi9PsxKnoyfBwKZjb5Ev+lmo
         oK1A==
X-Forwarded-Encrypted: i=1; AL+hErFmYYy2pgpUMP/vo0Z9ZX3k4IuQSqji8V8Eu6+xyogdkUR7Bu85u9eQXqPiED1kTOYjBbgmAQ9KJPI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ti7pPExhIMkq3Y7r6ukh2UB2J2UxE5jdUBOqH2RIn0+O0t53a
	DRAvMtEExIHylaAfTlKgdVUZDOleWvPP7lWANkRjrCxfXsVb92Dh3GlTAbq+KdwoaeI=
X-Gm-Gg: AZFdTZeu0adO423oM5h+YOpKHeM46NWV9j9u98c9v4fPR6Xt5/hEm1ooLlujAH9KAF4
	bit2I7MNXwk3zrGI7XgY4QF/fOTSXC1xgOK5QDSus3VMpIE/eOIEGs8dSmQDGVHSgHK6JZ3wdZf
	ypqzUY2qsJw9nvMHZNmKdtXv6YFslfCOUPY8heD1hAIDHgdCiFP/stsoD2l89RqWmHLg15Re4L6
	ild/830z2qgMzuX0FA+B3dYIvigD8zk9gPOX2Jgzi2YDiBbop7xSOzhmoLOcloav9NpM5tItfyR
	C9SC6pS2s0zJImooFUDe+UtCOn29IV4D3f2YMSwSfMCcUe1HiXwjcEBVpMfYVV02Sai38PYt1ET
	nS+9tscHFvpmsF2gB08p/YCt5rIGACYeXFP7YYjnsXOuarC4opc2931Gul6JplQgN/+J9Yrt/Qu
	CKJnor+Wdv7PzL+AfnyGsUBrgaSwXNmsWLJfI+87+WCUVHWir9kQUShphZxkn1cW+bguGw8kwFN
	1ECaffx+/re93ouTkEQuLUGCgVEcTbJomdDbPiTABnEiXtuftfhtnY0HqC9kdj9ZM5wMZf60K4s
	UzvHh5OKI9M7CCnwk8JvhGJsBPvQ6g==
X-Received: by 2002:a05:600c:5246:b0:4a7:9006:b176 with SMTP id 5b1f17b1804b1-4bb887fe892mr524524725e9.7.1795781944276;
        Fri, 27 Nov 2026 04:19:04 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849247asm702530165e9.7.2026.11.27.04.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:19:02 -0800 (PST)
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
	Andrea della Porta <andrea.porta@suse.com>,
	Ulf Hansson <ulfh@kernel.org>,
	linux-mmc@vger.kernel.org
Subject: [PATCH v4 16/28] mmc: bcm2835: Pass the CPU physical address of SDDATA to the DMA engine
Date: Fri, 27 Nov 2026 13:22:06 +0100
Message-ID: <20261127122236.4976-17-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261127122236.4976-1-andrea.porta@suse.com>
References: <20261127122236.4976-1-andrea.porta@suse.com>
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

The addresses in struct dma_slave_config are CPU physical addresses, and
the DMA controller driver is responsible for translating them into its
own view of the bus. The driver instead reads the untranslated address
out of its reg property, which only happens to be what the BCM2835 DMA
controller expects because the DMA engine driver used the address
verbatim.

Now that the DMA engine driver translates slave addresses itself, use the
CPU physical address of the register resource, which also gets rid of
the open coded parsing of the DT node.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/mmc/host/bcm2835.c | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/drivers/mmc/host/bcm2835.c b/drivers/mmc/host/bcm2835.c
index efd1903c3ccd..cea7b2b6d2f0 100644
--- a/drivers/mmc/host/bcm2835.c
+++ b/drivers/mmc/host/bcm2835.c
@@ -38,7 +38,6 @@
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
-#include <linux/of_address.h>
 #include <linux/of_irq.h>
 #include <linux/platform_device.h>
 #include <linux/scatterlist.h>
@@ -147,7 +146,7 @@ struct bcm2835_host {
 	struct mutex		mutex;
 
 	void __iomem		*ioaddr;
-	u32			phys_addr;
+	phys_addr_t		phys_addr;
 
 	struct clk		*clk;
 	struct platform_device	*pdev;
@@ -1369,7 +1368,7 @@ static int bcm2835_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct bcm2835_host *host;
 	struct mmc_host *mmc;
-	const __be32 *regaddr_p;
+	struct resource *res;
 	int ret;
 
 	dev_dbg(dev, "%s\n", __func__);
@@ -1382,23 +1381,14 @@ static int bcm2835_probe(struct platform_device *pdev)
 	host->pdev = pdev;
 	spin_lock_init(&host->lock);
 
-	host->ioaddr = devm_platform_ioremap_resource(pdev, 0);
+	host->ioaddr = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(host->ioaddr)) {
 		ret = PTR_ERR(host->ioaddr);
 		goto err;
 	}
 
-	/* Parse OF address directly to get the physical address for
-	 * DMA to our registers.
-	 */
-	regaddr_p = of_get_address(pdev->dev.of_node, 0, NULL, NULL);
-	if (!regaddr_p) {
-		dev_err(dev, "Can't get phys address\n");
-		ret = -EINVAL;
-		goto err;
-	}
-
-	host->phys_addr = be32_to_cpup(regaddr_p);
+	/* the DMA engine translates the address into its own view of the bus */
+	host->phys_addr = res->start;
 
 	host->dma_chan = NULL;
 	host->dma_desc = NULL;
-- 
2.51.0

