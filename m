Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445637;
	b=B5v6Wm2k00CxLom4qBlgI5hKRsSqIpeVTZk2bVp5lUTNrMjGK77EYw5VXTnUziSrwmfs
	 P5dvukcr/uG5R3WdbfK8bm85sfIW1FdLMQ1ZLr9u2U5iu7FRg0odTXuwFgpQqadZ67jLT
	 gavXfVrkD3XWAaSHitQnsX2zIivbMF2zHG0CTddRXBGjZmirQpb9SE+t76iSBgHB//ccL
	 DtLl5iv+DegMRPzcL4CxF7Ad+cmskOAOWb3D7BJRDCqiQwC9DiPQJ4yRrUnyn92MbMG9H
	 h+BwfzO6W4XHJ0rca/xlCOrcDmvMTP1HDdupSFjZHelyp+uhNyx7mn7qI8QA9bw6sfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445637;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gcDUe7weJJYMrvTg7gVHHmg7tsUoApLJH7Q2bv9KvGA=;
	b=ulmM3JSTpF5Pa+At+6ZrwgJqKWuT43dMbY3BFvGsz3khpRJ6DT8rIz7pNq+atFRsBL/a
	 7ROnG3iOiKxPLNXnPECqcGdA91IKTHMs7GBxxQG220K5N/Ft7mKtNa6NljCduwkhte2bl
	 ZmkKvSdjny2s2fNLAX34DpCcM324g01lrSyxSBkzGvoTnpvErpuOATI8q+EeP14ETvQhx
	 k4Nqod+EaE+f7KdP8XI0vI5iW+44oZq+/Fz+Wb4sMgPmcsnLuDE7QXbWVTJnyhA6tTw8y
	 3mjY2wIfJ4880l9MvQVaCohOtUYf6ft96jwbg0Z9iO6pvLXFnBOgI5EOQ1KtsEjJ5wQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=CDqXCh9g;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD9060A6F51
	for <dmaengine@vger.kernel.org>; Mon, 23 Nov 2026 14:53:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AD9060A6F51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=CDqXCh9g
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so26694825e9.3
        for <dmaengine@vger.kernel.org>; Mon, 23 Nov 2026 06:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445635; x=1796050435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gcDUe7weJJYMrvTg7gVHHmg7tsUoApLJH7Q2bv9KvGA=;
        b=CDqXCh9g3gBn7Gqu7xnGzzahRm9GSKxuyxZ6SM9HRNndQ1marzSteyv9gBCp+opb88
         HgZXD+ENDEWRoaevbhwd8sePn8YCn9cIpKL74Vn9lG0vWUde6lQq8dffrKtyuQoIY7h2
         Lgvj9aMfhJMriO4fyWX5nHqygFAr1qCiygqgwJzbw2NAx3lY6HBBXX0anWHxSrjnFt5J
         8NDRGwZ2cDjME4rPp+tPaUwZUdNf8qndp5tfZnI5HM77ZOenh3ZoNQ3iKJDNLcVOPSvZ
         DwuRkG9TIgX67/6L58XuzqkB8So/KHrLKEw/kHbp+CEpNZarHD/NfHKqrf/OK5dJ2D1M
         /i3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445635; x=1796050435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gcDUe7weJJYMrvTg7gVHHmg7tsUoApLJH7Q2bv9KvGA=;
        b=RZ9yHiM67mXAlUA/bPyhVhFqdGaud3ZBFgDS6IM62Amd2BOIv0bk02inqIETTSYboX
         y5O9eN6ZmLimUhX/iGVn7WlcZ0uxHeGNWtz46446CHbXEuqTBrqwXC+PIyrsafhYsUa4
         C5Zz5kgVVay93eUiMf84xtKxtdQ4GwZ60KjU/TPkqCJALUukMnIARLyC72okWC1PGcNL
         crN0dMEUqgBw+VprgLxXkt7xqoVjezysUeC3IyTp+GbvIQhLFXe7dj2QAj8r3gDWILzG
         i+oxpYx5Wt0KRqnlE7yOtEDmWyT398NLif4HsGQk7yc3bigCTkQHyrY7aFG8FvYo8n3d
         9zYg==
X-Forwarded-Encrypted: i=1; AL+hErFwcKyEnZmNGYFqVAgguoOQiytO2x6Y9go+XFy9spzl/W+fsnHoIRTwADNcED1fNXJDnBSc0UtKQAY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8jGM7Se3CxRp/asNnhG+2AJux5Xj1RObVFlIP07pMmr1bXBQBs
	moKsMhta+6SDagdCPe/k3PjM+l7muswwbkjHZdb4i/7AxdBrlvvrOFolchcjOEimnJg=
X-Gm-Gg: AZFdTZcKQbu8KYOdMM053MH0Fktzx9LBiJleRw06wwS1p8M3wV9JgTUmzi/aibgx927
	uzuevdln9dq4BqP7xv0udRGFVFbr63nKOHwOvOJXU7JhWCegMQHdwtRNuC6iWhUBVPfl9wdgWki
	vnmKiZWlKuH+wX32bm+muoghKVPoz89vvpKOHZyx8WdpDb+VFiVkp5y+6D1HT6Wj+Cb00MWQx5O
	GI57PxJhpOB6jU7sDc4Gc9J6u1EyMojqgKx+tVg09NFDDtlmmCIfJ/zcxVl8vubfsC20tpH5U8y
	RZs45WIwjNdVwx7OXzq0qE0yN15S+91hRGHJLRvagUCm6zShd8/1Qr7hSa7GD8kwx1LNsYdnp0c
	6kCBmCHZWyDFuAZmYQjHiFfyFH4JQlilD6UMwHHvd6MVr1p8qrvXlSZHkcYTOZ+q6l7gX+/VSqd
	RIujVJYJtGO1Gr6o8Ss9/jqK6ffFqiFRgcTwDuD2ay3OLr8gCNR1kFz+UfpXm7R7bljwIAhT+3T
	cVMFYHIAGcH1uF9y5v3kjISLSPxuToAwhbzeam6AOcy8gwqyeCiLY3cp2WP2y1LUkyWYzgDVf8N
	VmaM+CPATFlGmM3fFK5v3xX01A4=
X-Received: by 2002:a05:600c:1c1b:b0:4bb:87be:c138 with SMTP id 5b1f17b1804b1-4bb8893e021mr265842135e9.32.1795445635536;
        Mon, 23 Nov 2026 06:53:55 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a3a3dsm340088765e9.10.2026.11.23.06.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:53:55 -0800 (PST)
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
Subject: [PATCH v3 16/28] mmc: bcm2835: Pass the CPU physical address of SDDATA to the DMA engine
Date: Mon, 23 Nov 2026 15:56:54 +0100
Message-ID: <20261123145728.29082-17-andrea.porta@suse.com>
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

