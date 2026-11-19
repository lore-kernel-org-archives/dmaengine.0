Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.2.82.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795120718;
	b=T73a7qMS5TZnYMN6jaCKWe77S8H6wjYzpABh4Sb5z4KEn+JBOKGnuiVfo/aScBeRR+Bl
	 hRA47V/rledyeD/82YeITgc/NH5Bm85yosORcR2Mi1kJvLDvQDNOQfcqBZ8cMyGP/1IFN
	 6wC+LlfZvLhT7elIYj0JLnnWxabzpxtbi1bg+z94iQQvUtgmyOqdjOnVC5jfHYHvEzauY
	 klnaQQGLmBi8xEB1oM4iDIzc8hHvOYA4cEZjnTfeKkTU/HtCAeicO7Eo6AQbeCYAZ/dlv
	 V3VWiFLZ7RpywalCVqeZoOL20v0prGN7zIUSsQzCay7H/CU8ZWP+vcSW4IRyOI4IHcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795120718;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	bh=Db7Ss3Cr15CeYyFK6w7swFHBzGn4RNZFI+gEJh56ijA=;
	b=McZ6cvLeblAR/XbqdCg/IBpfMGCCmw2zzAilG7cFaaq5mFnUqcFdKvXSEJLklgre/FPo
	 hPTYUNM161r3kmU/+I9Y2yd/8egpmq9vqhPSH29LEK89mbiq0mCL8rmZjxDa7D5T3zRTm
	 sMmMnbtMCH0u79nNTzIaEVcdwt/lH7itEWxoybMssNbKQ6yeUc4rct9psmxZDfBtgozKb
	 Hkj/PGnYYfQQ+0Aqv3oUoHuecqNmGEKjxp+aYo6BJjVVUutxXAqsy1kQ+2MNCLFg25Fw9
	 h8UaBU3bHE9JgmMYVtgTiSsXnW6VYodzRx/wuov09bp+uL7G2+vykuYaA2gG9pJ7ZoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.pl;
	spf=pass smtp.mailfrom=yahoo.pl;
	dkim=pass header.d=yahoo.pl header.i=@yahoo.pl header.a=rsa-sha256 header.s=s2048 header.b=Bd8qoCY8;
	arc=none smtp.remote-ip=34.2.82.16
Received: from sonic.asd.mail.yahoo.com (sonic-euwe1-0017.asd.mail.yahoo.com [34.2.82.16])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31404606A907
	for <dmaengine@vger.kernel.org>; Thu, 19 Nov 2026 20:38:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31404606A907
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=yahoo.pl header.i=@yahoo.pl header.a=rsa-sha256 header.s=s2048 header.b=Bd8qoCY8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1795120716; bh=Db7Ss3Cr15CeYyFK6w7swFHBzGn4RNZFI+gEJh56ijA=; h=From:To:Cc:Subject:Date:In-Reply-To:References:Content-Type:From:Subject:Reply-To:Content-Type; b=Bd8qoCY84Bm4Oj98Q3XAcklNbYFpgdQq7KB6ENvy2w8Qpr6BQcTEDvkwQYyzDVXsBRkkcK5DnG80ZK8+alpGKITtUJ7VN8ufW+iPn+vqSNkqhmyFo5WsKFwmRJGAySpB3Da5hSBKqiPMw7TJK603ThXZvREG06piPe59g6Vbx1nm5vUFjl2Uf3721NGBhqxxrv+MrIdEfUJgEUwce1dnJjBzMJMSnW6BE9LVIwcKXQlSwKvjqVibPyX7V2R72yE7BsJpH5t1gUeC1a9ZEshM2Ykx/AiHUlKPsBtMnxeL4bptO9yVH0R18cWEtsY896gqucjzhlKp8ssEIiWylDD8jg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795120716; bh=XJ7v54xEFt1AZnl5aHtcNw69o7ybpn0/8AscWdOyQtg=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=TfFK8n+z8sbYQ7MrEZ+SbR/u4RkTqiFQQ1k+O4lBKJpa18d+LwV1doJV6aa9rjs/TwaS9Y9OrMJ+4IvX/a6UQizXUev8jFJa1M65uB3AZaHdIjrU4bBZYYqc81oZA8kT2j1KCqZp+hTO40H56nSnJOAAMILvzHRaOHjNM4YT4oqbZFM/uSiSiS3G5dfkdx0PfsYCckb3u9BrL6EFk9m54//bImRzh3pO4ABjMfIhJ1HixzlLD9ETW6OuLkkz2Qv97GHTXOo8Ypw/XAZVGT87YRoFL5PrTH0L+7epQaNE3OKC76Y8H4eY6n6ltnPZZ0vT8e4oOlyZ/eczdy1opo0QQg==
X-YMail-OSG: xcrqf7cVM1kGJkRh6qDjQMe1X9pvu2Gj9mHHRaCFVC8kcOTffn6vnh5vurUyYqi
 AkNMrFJaXEOh1sw7ClkSlh8Bh4hVnEKkyaVratXj843_v2hzKzVUriamCIElClu_vKt7Fssbra7J
 PFmYNaI9edyRvsNx9hsTyoTmEaz2GHBS0jOtanGqIgpV1.hdUMwaWADP8Vt4vi2Z15KoxeASoFpT
 cxfdRffQRUe49BvLEt7WBgtNkdEZ1Auy5qnzXgp8ZdpQpzgSPxatWrapNCRPztSnFeflOElXs8Lf
 QeBmGnIUz0VggQn4nr4p3B7gdFWkgsSrH2AJ_ulLyIVi1o967aMNh.XyqQGjq8.v3TVuUKVXnvMO
 Rc0Rsq8_1jgbOTJYl_aEokC5P9e210xPz5E2V7FXgVir3C8jnyciVgSNu.MJT4HTgMuofFatK3P0
 LS6ZqhdLpNfGZIiHrP2mcdI7DAhuVZMmR6j55gjhNoXhDiAJS5Hdk8Xjhbeh8WVs821ZMsEe6.tr
 tzw07i6U0z8MZWzDLGlT92pWa5S60bzD3nLuHjqkTVRi3bL3ST9G7lSWbuOY0xI36ed07KmzpYTT
 LVr98gg4UFSpn9pyruJWyasJA8wzq.LAgsrazr3tZjal..LhBHuJL_Dqx4bjCI8XhSV9Chz95omX
 axslfrivwmfrcPTwcRC_3isbhyE183dMEqOMPzcTxArtiCppMei6un5JcevzIRXqp.Bl.vgiu0ih
 J0Ukn3w_Ywg1YSq_8tSh17ON1SGqFiYgEFExrRdE._tY56Hv8DA1pd9zMyON3AWOJyXlhmSjNhEQ
 09GXgHN05luYRi_92HxpilcjCz327ROh8p1G6uCKaOxNEZ0MNCCLn7d2IyfAWO6P41jD0mRTySZ8
 ddzJX.lGuj90_Y957YPDcWpw2xyIZ6LPMFCcBg92yjDSnzHMOFWT4K2PvRKsd9h9NyeLjly5uot1
 ZNup1rVjxJIZIb7JH1iTNy0fYcy6fKa7CEot1bb7z4vkBa0bPmoACEit335gQNMJW8u9EEV0aM4W
 VCakks4Pdio8ZzpWnuMJkhf8e92c88LeasYDNH8v5xJfyBSUA3oCx380.2yzEWW6xNejI.njIyEw
 ZRtlPJng8qnEDPEUs8PbA7CoS486675tiUkoFSrpupHhs3VhWpxLx6Hfmz43Lkq9LMkKKkKzGEcG
 RiUZySHl2_w1W.SyxCuCwj8jBrCKfaj30IlgY221JFzwRPMsFP5IMSprbeWcYO2jEyHOVlOQqYdz
 fVTb3sogNl60YHydpyBTSeYV4sInuGm6Aq0LVssUKk6TsMZWOZb8O64M6b2nI.rvAjxGollCr2yP
 gRYXNBTGY_vvRdB8W4uD5VLCOayF_x5MJ0Z2a0ItKvUbXUo8h5WBdiROQwbjv.FhedCnvD88wyAu
 y4yVgG.oONCmOqwwE9L2OOw5YHKRrUye._2O7ycn524_FXCbklr4.MXMjPYMzk8lpdD0go7JCx2v
 Hl2HuSqawtF.bK0HCg57dfgmEXmCcNltnMu7jlp.d6xyYiMnTVHMQDr2ItpGVzMuuYXLWDTYglVG
 GwaRrytHroklXR77VgFvDYyRt_Crr16HnWJFCPYqcQSlL6UVXmP9dvpjY6smge3YrnljU6VAjYsc
 rXD_X9OqiH26MSfaIZKqJaeTb.gnuZZDYuepcH7f7md3dJKMpsPqFle3m_xYQOoEq33mw_nmlto5
 wkf5pbqgDZrTJQFbjbvIQ9tCG1b.MdhaEp.unK8vNRS9wT9_voPQWVhR5TaAzXof9iGwMHnoPY9q
 ccnd0XAH9_Wdp15hUbpbnkRUYH16QeYMDQPBQb9R8V0kpKIj7pjrbANvVuFiS5y9YWrh0INKJr8q
 AT.oSYaUFk_oMcu22EyKAM0xVZ6XrAcOLfEy8llaqAWmNd9SRqFOl1DqpnFGL8w9A20.PjJFDkvs
 jr5CrwfIyBaQSlB4qjN1I7DhOR.KmwECNSttpNJDoJevGM_SYaAoskpYg7WMZpo4k7JJLDzu880i
 X2tx02PDr6um8wNd5qHLBvgur1eRMrP.edRDOetZLh9onY2oumA--
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 21ed1a9f-44f8-440a-a761-f8890e36031d
Received: from sonic.gate.mail.ne1.yahoo.com by mail-asdoutdeli-p-cin-euwe1-prod-sonicconsumer-svc-101 with HTTP; Thu, 19 Nov 2026 20:38:36 +0000
Received: from dip109.lsn.ir2.yahoo.com ([87.248.99.118])
          by hello (SMTP) with SMTP ID 9b9502ffa2d81b1ac9891a09564e31e6;
          Thu, 19 Nov 2026 20:38:33 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
To: Vinod Koul <vkoul@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Tomasz Unger <tomasz.unger@yahoo.pl>,
	Frank Li <Frank.Li@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	dmaengine@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] dmaengine: bcm2835-dma: Convert to managed resources
Date: Thu, 19 Nov 2026 21:38:30 +0100
Message-ID: <20261119-bcm2835-dma-of-dma-free-v2-2-ebde4846d206@yahoo.pl>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119-bcm2835-dma-of-dma-free-v2-0-ebde4846d206@yahoo.pl>
References: <20261119-bcm2835-dma-of-dma-free-v2-0-ebde4846d206@yahoo.pl>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795120634; l=4678; i=tomasz.unger@yahoo.pl; s=20260311; h=from:subject:message-id; bh=m+WcUAhroCpbF7RLJZNn4GaRp4h33oJoCj0OO0J0pSc=; b=2XTHn+l3BlW11RFtz+/LxK+qBVmCPiIzcWl/xu2YXvVx276/SkterMrWikAS/MhaPgFr7qWgp FBnS5UHyArCCHY8XTuPToqV2VlYeuE9HElJ5x5I2DbwHyLJ53sQ6QJm
X-Developer-Key: i=tomasz.unger@yahoo.pl; a=ed25519; pk=EPPsO91uz/0J2cTQ6ol+dgxYaieEc9dKSXWUb51n46c=
Content-Transfer-Encoding: 8bit

bcm2835_dma_probe() registers the OF DMA controller before the DMA
device. A client probing on another CPU can therefore reach
bcm2835_dma_xlate() and dma_get_any_slave_channel() while the device
is not registered yet, and if dma_async_device_register() then fails,
the driver data is freed while that client may still hold a channel.

Convert the driver to managed resources and register the OF controller
last, after the DMA device. As devres releases resources in reverse
order, the OF controller is now also freed first, before the DMA
device is unregistered, both on remove and on the probe error path.
This makes bcm2835_dma_remove() and the error labels unnecessary.

Channel teardown and the zero page unmap become two separate devres
actions. The channels are devm-allocated after the zero page is
mapped, so a single action registered at that point would run after
the channel memory has already been freed and walk freed list entries.
The tasklet teardown is therefore registered after the channels are
initialized.

The bug was found and the fix drafted with the help of an AI coding
assistant (Claude).

Suggested-by: Frank Li <Frank.Li@kernel.org>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
 drivers/dma/bcm2835-dma.c | 56 +++++++++++++++++++++++------------------------
 1 file changed, 27 insertions(+), 29 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index cf29d897450e..b2da706d2e16 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -822,8 +822,9 @@ static int bcm2835_dma_chan_init(struct bcm2835_dmadev *d, int chan_id,
 	return 0;
 }
 
-static void bcm2835_dma_free(struct bcm2835_dmadev *od)
+static void bcm2835_dma_free(void *data)
 {
+	struct bcm2835_dmadev *od = data;
 	struct bcm2835_chan *c, *next;
 
 	list_for_each_entry_safe(c, next, &od->ddev.channels,
@@ -831,6 +832,11 @@ static void bcm2835_dma_free(struct bcm2835_dmadev *od)
 		list_del(&c->vc.chan.device_node);
 		tasklet_kill(&c->vc.task);
 	}
+}
+
+static void bcm2835_dma_unmap_zero_page(void *data)
+{
+	struct bcm2835_dmadev *od = data;
 
 	dma_unmap_page_attrs(od->ddev.dev, od->zero_page, PAGE_SIZE,
 			     DMA_TO_DEVICE, DMA_ATTR_SKIP_CPU_SYNC);
@@ -944,13 +950,17 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 
+	rc = devm_add_action_or_reset(&pdev->dev, bcm2835_dma_unmap_zero_page,
+				      od);
+	if (rc)
+		return rc;
+
 	/* Request DMA channel mask from device tree */
 	if (of_property_read_u32(pdev->dev.of_node,
 			"brcm,dma-channel-mask",
 			&chans_available)) {
 		dev_err(&pdev->dev, "Failed to get channel mask\n");
-		rc = -EINVAL;
-		goto err_no_dma;
+		return -EINVAL;
 	}
 
 	/* get irqs for each channel that we support */
@@ -994,49 +1004,37 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
 		/* initialize the channel */
 		rc = bcm2835_dma_chan_init(od, i, irq[i], irq_flags);
 		if (rc)
-			goto err_no_dma;
+			return rc;
 	}
 
 	dev_dbg(&pdev->dev, "Initialized %i DMA channels\n", i);
 
-	/* Device-tree DMA controller registration */
-	rc = of_dma_controller_register(pdev->dev.of_node,
-			bcm2835_dma_xlate, od);
-	if (rc) {
-		dev_err(&pdev->dev, "Failed to register DMA controller\n");
-		goto err_no_dma;
-	}
+	rc = devm_add_action_or_reset(&pdev->dev, bcm2835_dma_free, od);
+	if (rc)
+		return rc;
 
-	rc = dma_async_device_register(&od->ddev);
+	rc = dmaenginem_async_device_register(&od->ddev);
 	if (rc) {
 		dev_err(&pdev->dev,
 			"Failed to register slave DMA engine device: %d\n", rc);
-		goto err_of_dma;
+		return rc;
+	}
+
+	/* Device-tree DMA controller registration */
+	rc = devm_of_dma_controller_register(&pdev->dev, pdev->dev.of_node,
+					     bcm2835_dma_xlate, od);
+	if (rc) {
+		dev_err(&pdev->dev, "Failed to register DMA controller\n");
+		return rc;
 	}
 
 	dev_dbg(&pdev->dev, "Load BCM2835 DMA engine driver\n");
 
 	return 0;
-
-err_of_dma:
-	of_dma_controller_free(pdev->dev.of_node);
-err_no_dma:
-	bcm2835_dma_free(od);
-	return rc;
-}
-
-static void bcm2835_dma_remove(struct platform_device *pdev)
-{
-	struct bcm2835_dmadev *od = platform_get_drvdata(pdev);
-
-	of_dma_controller_free(pdev->dev.of_node);
-	dma_async_device_unregister(&od->ddev);
-	bcm2835_dma_free(od);
 }
 
 static struct platform_driver bcm2835_dma_driver = {
 	.probe	= bcm2835_dma_probe,
-	.remove = bcm2835_dma_remove,
 	.driver = {
 		.name = "bcm2835-dma",
 		.of_match_table = of_match_ptr(bcm2835_dma_of_match),

-- 
2.56.1

