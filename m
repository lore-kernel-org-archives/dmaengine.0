Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E1E46EF86
	for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 19:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784663667; cv=none; b=MHTIfObQPY0X+FSHr5v999qEP9N62nZs/fOB70ejDJAyXb93mgIVh5Rd2sj/cUOpfl4ry1yu4EobIKLLwmH704uMq2zX/1MmRm57XMs/imfYT7KY4Y8ZIMXHtYsAgYUfSIUX/B1a6orFAZoR+NlrsABBMQYvNgSGtXK2jpFPUAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784663667; c=relaxed/simple;
	bh=6chWT//EiHmRzm9dvXjy2qQlZrSlVGNqk09yDsGfixg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k6BpXID3oHVzgfonvhegT2ZfJlHI4twRb8UnJsXDaQ0SwEAvRx3QKdep4+4obP0dXpMzUBAOV/OilSD2ZUb3lubSEphWq4m99bL3vj+pykTWjpE4EIJEOppIHtQiBVw8eKP5xCjGbLQTOs8XSbgl8qbFEsogdxyMb5ByCZolea8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IupK9N1H; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IupK9N1H"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c9b373d5af0so8911676a12.2
        for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 12:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784663666; x=1785268466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CrdCIr5mF1z8edkamNWR8sTD36Gz/H8xH912kFMyymA=;
        b=IupK9N1HeMcF/ULkoxeoOsZqmVkRb/jtEVuwUtfFgnUSGg2GhhpfwWlq1BiDBk0t2s
         BZ/aF3QPZ2gHLhYsE0/FKY97cuqjt+XLH+VZdtyyM+hWDocTMz9sTl8MnJXjbiQDQZ4P
         X4su27CRpxkTkp7MZEhm9Y7Kbn9JUKRSVj+RxMGG/qh3r9A2utCriE1Aeq0SZ1ALcB4x
         skqohcX2wU1UHs+i238hbuI2LFui5ECAIoVwG89ch/NCLmW2Vo1lzYE+7h+c3kEwmh6f
         CvZVgFMoNnSocQ2+VpRTDwlJExJddGiKvV7pU2PhCz7Y4idR4SAR1LSKVijpbmZVfc4z
         b9eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784663666; x=1785268466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CrdCIr5mF1z8edkamNWR8sTD36Gz/H8xH912kFMyymA=;
        b=Fd2bGyBLj0syKziqyKFiKY8xDYy3OPm2fQ8We9lPzaWgVL308JpkQI1+ejmFLh7fKR
         Jd/awZH6qVdXay0sQjL+ze4ekVPPonV9VORC3OMBLqUAVB+w8M2QTayytDWjdUhQX7pb
         OfUMBKSL9A8o6/tq7CeetzHI+3ZekwYlFLg46aNjjOTTsvN7suARZqLdzr8z5mpJmocl
         OMec9ReXOphEfIJ0VFh3smWYqR6SVjLoeMy5ElbfhtgAj2xX1nwRNGnSVXKRjJU0yMZT
         lfnrGCvjYqxucggoeHqZ84r1up3uvIqoo4SmR6apRwSBPg7y+l2t3wc/nz/xZaEVnW1q
         o47Q==
X-Gm-Message-State: AOJu0YwixloqxvlEsBlS3ggbdXll3nu6dn4A6vzetMcUxeWFCStdrqFL
	VfRBIzc4MkJ5nLc0QzrPFvObMoeE2W7qhXbKMnGq4An7KtVX+cy+WKtP+a2NBw==
X-Gm-Gg: AR+sD12ei+sMoWsD80z1YCSXV9r8EGuH+D1ThgX5pHbbe7O1nQzal0xfi+OnTLSUPRy
	xcA/z2jKkC7w8vi0w83KaPA1H+fiLswu07Bj6OXbdqtznvpmY9l9f9VB3jNSybBH8KAmvguBvDx
	xBVEqywLxBXCBDy2MTgS6lI26Gd04vAfHwd/Oq68kwmSCilodolWUknBJBmKgkek3adzzOZeWIB
	me1yDR0lp4u2yh7pq8wNFJvjryel6Lj7QBhw6q8KHStt9SAv6b1DUE6ijn6VhAPlw7XiUzoeciA
	6YPIa/wgN7RshiIZNzn4mzWtY4B6qp0+ROuKuEN8Sj5RxmOBFDU2Ihd1ep8JZgVGhQXt14zFFK2
	/n6NyPIfT7R3O/6S5kR0aBfH5Fn0aokl3vel9qNBgdIkMn+zjWqDmPU6/1mSt0t1Z+sF8i/ajq2
	u5T/cSQBkdt/YSMDdQOekSO5LEONg+YSioWDQyH9UTtq8/Ywc3NactTHBk4AO8RMVTRlCC2oekH
	jGnfIMSbaQpqAIeVPISQkVOE7P9M304+LtohamzyKfyR8rCFB7SxLU=
X-Received: by 2002:a05:6a21:828c:b0:3c3:9ed1:2563 with SMTP id adf61e73a8af0-3c3ad9d5b60mr21266945637.42.1784663665912;
        Tue, 21 Jul 2026 12:54:25 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc7d8fbsm1664595eec.10.2026.07.21.12.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 12:54:25 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Xuelin Shi <xuelin.shi@freescale.com>,
	Harninder Rai <harninder.rai@freescale.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2 1/2] dmaengine: fsl_raid: pass platform_device to drvdata
Date: Tue, 21 Jul 2026 12:54:21 -0700
Message-ID: <20260721195422.353794-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260721195422.353794-1-rosenp@gmail.com>
References: <20260721195422.353794-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplifies code slightly and avoids having to take pointer of a platform
device member. A platform device is always used.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/fsl_raid.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
index da5228e121d1..2d54879cd6e1 100644
--- a/drivers/dma/fsl_raid.c
+++ b/drivers/dma/fsl_raid.c
@@ -219,10 +219,11 @@ static void fsl_re_dequeue(struct tasklet_struct *t)
 /* Per Job Ring interrupt handler */
 static irqreturn_t fsl_re_isr(int irq, void *data)
 {
+	struct platform_device *pdev = data;
 	struct fsl_re_chan *re_chan;
 	u32 irqstate, status;
 
-	re_chan = dev_get_drvdata((struct device *)data);
+	re_chan = platform_get_drvdata(pdev);
 
 	irqstate = in_be32(&re_chan->jrregs->jr_interrupt_status);
 	if (!irqstate)
@@ -649,7 +650,7 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
 	struct platform_device *chan_ofdev;
 
 	dev = &ofdev->dev;
-	re_priv = dev_get_drvdata(dev);
+	re_priv = platform_get_drvdata(ofdev);
 	dma_dev = &re_priv->dma_dev;
 
 	chan = devm_kzalloc(dev, sizeof(*chan), GFP_KERNEL);
@@ -687,7 +688,7 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
 	chandev = &chan_ofdev->dev;
 	tasklet_setup(&chan->irqtask, fsl_re_dequeue);
 
-	ret = request_irq(chan->irq, fsl_re_isr, 0, chan->name, chandev);
+	ret = request_irq(chan->irq, fsl_re_isr, 0, chan->name, chan_ofdev);
 	if (ret) {
 		dev_err(dev, "Unable to register interrupt for JR %d\n", q);
 		ret = -EINVAL;
@@ -743,7 +744,7 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
 	out_be32(&chan->jrregs->jr_config_1,
 		 FSL_RE_CFG1_CBSI | FSL_RE_CFG1_CBS0 | status);
 
-	dev_set_drvdata(chandev, chan);
+	platform_set_drvdata(chan_ofdev, chan);
 
 	/* Enable RE/CHAN */
 	out_be32(&chan->jrregs->jr_command, FSL_RE_ENABLE);
@@ -834,7 +835,7 @@ static int fsl_re_probe(struct platform_device *ofdev)
 		return -ENOMEM;
 	}
 
-	dev_set_drvdata(dev, re_priv);
+	platform_set_drvdata(ofdev, re_priv);
 
 	/* Parse Device tree to find out the total number of JQs present */
 	for_each_compatible_node_scoped(np, NULL, "fsl,raideng-v1.0-job-queue") {
@@ -903,11 +904,9 @@ static void fsl_re_remove_chan(struct fsl_re_chan *chan)
 static void fsl_re_remove(struct platform_device *ofdev)
 {
 	struct fsl_re_drv_private *re_priv;
-	struct device *dev;
 	int i;
 
-	dev = &ofdev->dev;
-	re_priv = dev_get_drvdata(dev);
+	re_priv = platform_get_drvdata(ofdev);
 
 	/* Unregister the DMA device first so no client can still hold a
 	 * channel and submit new work while the channel rings are torn
-- 
2.55.0

