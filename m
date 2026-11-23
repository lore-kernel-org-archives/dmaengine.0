Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795396659;
	b=yaWOsmwM+gQT+4Np6OFJ9lqScCnlZnka04D498HsizBY2CPGf3UD8MaLDx0yFvlbixdA
	 M8yNF78CAV2AcOBcUdlqEgRd/7//pJpphN2EvHa2/aQWyLcUilGwcvGVI+JChk89ICRGv
	 acLSI3HNimJQ91K4WvcXZLAaq7K370v1QWpzNDBnr6HT/HSblMI0JEEl3Aeh4wwrFWqQK
	 +xKlqCFdmenft1ptINxbzVIysWi5zQbpyXKjMRuv498j8koE2h3xFCpgJMKSIjPn+f0x/
	 BTH0KJhqJ0E4xNhIAilaYjflufcSlfEBjbtL60RX8em8uvSK1y0QR7lRT+LEtz/XtHw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795396659;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=4B36WbMifke7+O2AJIQ+hm2Rk03uKtR2vzfH5UQsqfg=;
	b=IM17FH+X93fn4WHpxeWogldCYmcEL38xXI16aWgaLqa1ufe911AT/WaLVoM3vfXdvBpF
	 yvB7pjw25iGW1ddOrtY+ztVlswUxqnoCeeR2ZnG0e4Td2zNqstByeQLWevgszgN07vbrJ
	 shgISplf8ijLw11SFP/kTF5txsoaJiDCtqrVbac06QvLIxx/oR9dtOO+lfaKGpge5HBz+
	 67KnFjHxR7UTNzxS8TcEupQlPmjtJdlhFmN9YGCc9fsY15z4OFM0Uu0QyJeFWjA47Xa0t
	 feXw07KjguHCILW/7T3vDujaq+DOXd1MjxQOvYxe5l0xa05klq5IDyWEMg3T2rHja+w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="VXz0/ij6";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54693606A334;
	Mon, 23 Nov 2026 01:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VXz0/ij6
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795396659;
	b=b/VvX1KUEugZVjTe1n3JiHC7O78Avsn8WjdHgSyiI2jYjw4VFAG9pZr9hn5T6wOQgOT1
	 +PyGOgd7PoffFC4nOS5ysYCSISi/hYPuVSqPM95mRSodqHEuVXabWN1JEh6snVcoKGEh9
	 E8qfv27x7/f7qvZrAIH9/Rl1CK8aNpPyyj0bH60Bpj/gb+H4KaDTob9zpC7DwRcmqczO7
	 eoERR+Ce7QavnopY12VRNT4W/QLKBPxWQjuECyOckKyzz8DRiK0ZE5UnJp/xVlKvJcCq5
	 qavP6Sd7oIcVpq9u3+wXlfQXwLGy4y7x2suZtDPkG45jcCd5Yo132x3GviRBqCWoQYg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795396659;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=4B36WbMifke7+O2AJIQ+hm2Rk03uKtR2vzfH5UQsqfg=;
	b=xOVWOGP2Ed5OUUr1WZHHP/Rh20JNr/sZeLpmvm6lxXxHPjJ9Wvo0yWuk3J8ySYaoeQnw
	 U0Lqkjd2mirtq3o7lwpnKHElx7AUj8p+6jT3oX84ZuSwZtIrUHor0wTmHfGaGUvCaLNdo
	 m0wwZ2vOOzQ+5bNDnWGrbEE4L9YE4XLu1VIpvBuXPS3OS+bbhI6obOdcNo8S5kA1wl2kA
	 Rc37wR+X606GFSjsbMZVNy+vXHSK7CAEzzD4s01ngx8pYZFeCExTo8Qrd7VSUtx9TXZ6E
	 NYWIBHzjKpm7dYdD3iooETPTUjKaq+/tYnL1EvrVxeHJ9TM3no7K1fxTKTR0XqmaNDA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 90DC71F000C4;
	Mon, 23 Nov 2026 01:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795396659;
	bh=4B36WbMifke7+O2AJIQ+hm2Rk03uKtR2vzfH5UQsqfg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=VXz0/ij6zrNgfGTuKKVRNSVAZqB75F4iuEcPh6yc+SpHJg9ANTqwKFvMFgfI1paQo
	 +C6UiM20Ick79CyJl9O6zmNGBRuHQ1x92laGk666FI6oGJfqgDBbwQuVRmdqpy4rNt
	 rv86eQbwj7E0J5KsxaUHEMjni4OsID26m5NKngeHjqXm4BLrBjB0yhVXG7iwEXyd/J
	 7+gCVSoW4GeNh0F24fnFtAiBIKxLlMHn3bGzB2zQ7NidVKuNLEpXVAAqwjzEh+e2Ku
	 Zn3TvpJ3SL/7iWEFY1BqsQzX5OySIuvuVL/B47ksQElmUl4MxepKFSVeoKZ0EnsSmS
	 X+awfoX1SF5jg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1211D4C2A1;
	Mon, 23 Nov 2026 01:17:38 +0000 (UTC)
From: Suyuan Wang via B4 Relay <devnull+shyckless.gmail.com@kernel.org>
Date: Mon, 23 Nov 2026 01:17:37 +0000
Subject: [PATCH v2 1/2] dmaengine: at_xdmac: Kill the channel tasklets
 before unregistering
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
Message-Id: <20261123-dma-chancnt-v2-1-241b1672883e@gmail.com>
References: <20261123-dma-chancnt-v2-0-241b1672883e@gmail.com>
In-Reply-To: <20261123-dma-chancnt-v2-0-241b1672883e@gmail.com>
To: ludovic.desroches@microchip.com, vkoul@kernel.org
Cc: Frank.Li@kernel.org, dave.jiang@intel.com, linux-kernel@vger.kernel.org, 
 andriy.shevchenko@linux.intel.com, dmaengine@vger.kernel.org, 
 allen.lkml@gmail.com, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795396657; l=2983;
 i=shyckless@gmail.com; s=default; h=from:subject:message-id;
 bh=37CrXOmHngl8hduNk3ISIljXPc21J8blRcQ8FE7hl2Y=;
 b=xRJ6Jxg/MhAl8yKoKVPpMjDP/LVLwP5ZpBd/diE5bv3dkjKDbpzQCVIlWfz7HhwBjyX63FBkB
 /MZbutFOEfxCVN5Mx/JaIOV72KLvp6HbenUm+7kfvvRMGTQwAVNw7pH
X-Developer-Key: i=shyckless@gmail.com; a=ed25519;
 pk=pMtccVGiWES3bV+7YBFuBclkvq2n2HBHQ5azaBrK2lY=
X-Endpoint-Received: by B4 Relay for shyckless@gmail.com/default with
 auth_id=1498
X-Original-From: Suyuan Wang <shyckless@gmail.com>
Reply-To: shyckless@gmail.com

From: Suyuan Wang <stevewong@hust.edu.cn>

at_xdmac_remove() unregisters the DMA device and disables the clock,
and only then frees the IRQ and kills the channel tasklets in a loop
over dma.chancnt:

	dma_async_device_unregister(&atxdmac->dma);
	...
	clk_disable_unprepare(atxdmac->clk);

	free_irq(atxdmac->irq, atxdmac);

	for (i = 0; i < atxdmac->dma.chancnt; i++) {
		...
		tasklet_kill(&atchan->tasklet);
		at_xdmac_free_chan_resources(&atchan->chan);
	}

Since commit e81274cd6b52 ("dmaengine: add support to dynamic
register/unregister of channels"), dma_async_device_unregister()
unregisters each channel and decrements dma.chancnt for it, so the
loop does nothing and a tasklet scheduled by an interrupt can run after
the devm-allocated atxdmac has been freed. Even when the loop ran,
tasklet_kill() let a pending tasklet run after the channel devices
were freed and the clock was disabled, and the tasklet reads the
channel registers and logs through the channel device.

Free the IRQ, kill the tasklets and free the channel resources right
after at_xdmac_off(), before the channels are unregistered and the
clock is disabled.

Found with a static analysis tool and checked by hand.

Fixes: e1f7c9eee707 ("dmaengine: at_xdmac: creation of the atmel eXtended DMA Controller driver")
Fixes: e81274cd6b52 ("dmaengine: add support to dynamic register/unregister of channels")
Cc: stable@vger.kernel.org
Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>
---
 drivers/dma/at_xdmac.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/at_xdmac.c b/drivers/dma/at_xdmac.c
index ef0dfe9d37ba..d5d60f3d3543 100644
--- a/drivers/dma/at_xdmac.c
+++ b/drivers/dma/at_xdmac.c
@@ -2439,21 +2439,26 @@ static void at_xdmac_remove(struct platform_device *pdev)
 	int		i;
 
 	at_xdmac_off(atxdmac, true);
-	of_dma_controller_free(pdev->dev.of_node);
-	dma_async_device_unregister(&atxdmac->dma);
-	pm_runtime_disable(atxdmac->dev);
-	pm_runtime_set_suspended(&pdev->dev);
-	pm_runtime_dont_use_autosuspend(&pdev->dev);
-	clk_disable_unprepare(atxdmac->clk);
-
 	free_irq(atxdmac->irq, atxdmac);
 
+	/*
+	 * Do this before dma_async_device_unregister(): it frees the channel
+	 * devices and decrements dma.chancnt, and the tasklets also need the
+	 * clock.
+	 */
 	for (i = 0; i < atxdmac->dma.chancnt; i++) {
 		struct at_xdmac_chan *atchan = &atxdmac->chan[i];
 
 		tasklet_kill(&atchan->tasklet);
 		at_xdmac_free_chan_resources(&atchan->chan);
 	}
+
+	of_dma_controller_free(pdev->dev.of_node);
+	dma_async_device_unregister(&atxdmac->dma);
+	pm_runtime_disable(atxdmac->dev);
+	pm_runtime_set_suspended(&pdev->dev);
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
+	clk_disable_unprepare(atxdmac->clk);
 }
 
 static const struct dev_pm_ops __maybe_unused atmel_xdmac_dev_pm_ops = {

-- 
2.34.1


