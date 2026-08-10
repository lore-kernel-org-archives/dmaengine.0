Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB1241168B
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 18:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786385536; cv=none; b=jf9maMgKxybY9l7BI2GYI83JjcuLim1IPFX4tInOUUuZ47bC/cLhnmWoUrGhE0PHhaTiHckua2LWA5foHjrIQroeo2icxKUaogNmeirxW+KATWE8InG0uLPG+EtHbsnLZKPiKCAV9GiPrVVBNkodzoYKqssCMVPZ+cvBoKiQNac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786385536; c=relaxed/simple;
	bh=Ig/1w3EhJGHkFtqnBVPKsssBgUok5xYMLMpIf8SMxu4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G6mGqVEmZKzH73gphGOyuvu+EVmGVpdc4kenUdHjOQoP1HZ2PdW2RpHQpZVuow/oJDGfNp/N0lkNu7eOZOatEphb4J0X9Qx7+HAfqcGKCyKcd8RfRht+J8hpJ++k6pUJcbmQNBib5GLHfo7MLMBCBcSr/BzD577ciGXDca+Hut0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aeNDYg7d; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aeNDYg7d"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso1563753a91.3
        for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 11:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786385534; x=1786990334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T/4gAs3IWqMAs/xTmYl6h6Ls6/U+dnIqpId4Zr1VebI=;
        b=aeNDYg7dbduNaaJJCqTfL8HCAzBZVDhjiKSPrWjc0eTVUDVSRNHwIXqsnvTeYCajfm
         hgzngL4rpJfGQNuKXj+nNVihw9nqg6g6oVY6BUU8fhJUBgniQRbX3O16htpVPSkCop+G
         DcPicZkE6tIkcJZoVOSkB7dN114iNLQJQ6vjPkdARv73Zt0CvjJdmhhtf13qn3WtvFfI
         RTrBS6Qr8Xxz1UYwcI43XWJDv59Jeu5NOstm+EK2dIV8kBWywUdqaa8nSdQFseQlwVOA
         LYHaHjhUiWNV3wr201tOBHwJQEWce1de44bs7kjYK0TQAvViYqUYktUq/nDuS/BxCX/E
         Dc6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786385534; x=1786990334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T/4gAs3IWqMAs/xTmYl6h6Ls6/U+dnIqpId4Zr1VebI=;
        b=fR80NFiuMkt/s6DXebMqBso9fFcIMJ8SQcj5TYiFSfdQ4l9cPs3qMZJnAMOLE2B7Md
         ZH5QO1w+Nf5ty3ZC7RCT/sx0UhCj9G0SM8CA6bXDEyZWld7hDKM1ihhcoMEMQTbU5Mjf
         5bvUyJhwjZwWm8TL7vGOM9ZWYy9aTCX2P6QI3vWB3n5kjvjrDVgL46+G5a8kH+p0VJRr
         aZqy346I9adBGZi7HS5XproWvJrhV5DbpZ+dT6NlM2jfCmgr/Xb5jD0OG+pFgbBOv3E6
         1np6uXQGJwACWd7IQxJboZrGV2MOBL32NNUil/r/lI+1fa4QnFXFMWfLDmnHRuSHLeYv
         IZ9g==
X-Forwarded-Encrypted: i=1; AHgh+Rq4Gsz2O23400ac2QRPcF/hPKLxSlr/SsXQnEVRTg9XiyVmotKRjwxloHGGpLgDorH4QCroqyXLmi4=@vger.kernel.org
X-Gm-Message-State: AOJu0YznEsmSo+vTVd8HPrYWF0baypGfeHkpXvUuFAdyhLNBOVcoe7I7
	oAYRupX2qV58Mw5HlozRRRfZwheGWrrex+1QMkF8K9SwaxS7M3C/czu1eo4TCA==
X-Gm-Gg: AR+sD11mfDcmUE3XclGF40kC+F3wNGEq2+7U7yd0ZbAlg7T7mLPub/6NCK7ex2Id+Yg
	VDUDmOTzD5eq5sNXaUUywv51KkGw5YV20NU3utRq0yp0UcJcgNl3ofCGFtVkhldIKRg5XkvoF0x
	kKCXCDA6TT3ECmQSPWatOcr+BN5lc81rJuj4hd2wQ5VtVKirPHfLetjMbkEUdlZZmQ2VTDyvYWA
	e5AgHyakmDVPJ85BJ9BvhzYQ/fMSWVeKX6LdFURdv3kIlXqotTasGgksNaD3x3qbjcqcsNecZug
	O9b+B69nPYk7uXgEw4rsbEJuwv8xE7FkUjlPnCJq8rMqqbZ86tqI98CDxrc8cQOqWGseoRRh8eh
	QTP40S2WQhE7gBaoySUsgex9uBSDqnNrgMJOOM68T1D5yqwv8VosLyjJb0ZuFplHwwMm8vbORx/
	GysscVFV4ya9vVZCyVoYbKvKBLKYcrfCnPKlwvdzkNYZYfgHIwsgazFqIbSTFGcmIWOEzxUfGZp
	uc=
X-Received: by 2002:a17:90b:2242:b0:37f:c28a:de61 with SMTP id 98e67ed59e1d1-3909d8e4c62mr27811550a91.17.1786385534137;
        Mon, 10 Aug 2026 11:12:14 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fa9:fa00:b1a9:6513:83c6:1d23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d53b873asm472795a91.17.2026.08.10.11.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 11:12:13 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>
Subject: [PATCH v3 14/34] dmaengine: nbpfaxi: switch callbacks to dmaengine BH
Date: Mon, 10 Aug 2026 11:09:15 -0700
Message-ID: <c4331588c6ee8f4c73a49b5cdc262fba72042d23.1786384168.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1786384168.git.allen.lkml@gmail.com>
References: <cover.1785183549.git.allen.lkml@gmail.com> <cover.1786384168.git.allen.lkml@gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the per-channel tasklet with the shared dmaengine BH helper.
The handler continues to run in softirq context while dmaengine owns
the common scheduling and teardown mechanism.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/nbpfaxi.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/nbpfaxi.c b/drivers/dma/nbpfaxi.c
index 05d7321629cc..7dd5fc55228d 100644
--- a/drivers/dma/nbpfaxi.c
+++ b/drivers/dma/nbpfaxi.c
@@ -174,7 +174,6 @@ struct nbpf_desc_page {
 /**
  * struct nbpf_channel - one DMAC channel
  * @dma_chan:	standard dmaengine channel object
- * @tasklet:	channel specific tasklet used for callbacks
  * @base:	register address base
  * @nbpf:	DMAC
  * @name:	IRQ name
@@ -200,7 +199,6 @@ struct nbpf_desc_page {
  */
 struct nbpf_channel {
 	struct dma_chan dma_chan;
-	struct tasklet_struct tasklet;
 	void __iomem *base;
 	struct nbpf_device *nbpf;
 	char name[16];
@@ -1125,9 +1123,10 @@ static struct dma_chan *nbpf_of_xlate(struct of_phandle_args *dma_spec,
 	return dchan;
 }
 
-static void nbpf_chan_tasklet(struct tasklet_struct *t)
+static void nbpf_chan_tasklet(struct dma_chan *c)
 {
-	struct nbpf_channel *chan = from_tasklet(chan, t, tasklet);
+	struct nbpf_channel *chan = container_of(c, struct nbpf_channel,
+						 dma_chan);
 	struct nbpf_desc *desc, *tmp;
 	struct dmaengine_desc_callback cb;
 
@@ -1228,7 +1227,7 @@ static irqreturn_t nbpf_chan_irq(int irq, void *dev)
 	spin_unlock(&chan->lock);
 
 	if (bh)
-		tasklet_schedule(&chan->tasklet);
+		dmaengine_schedule_bh(&chan->dma_chan);
 
 	return ret;
 }
@@ -1272,7 +1271,7 @@ static int nbpf_chan_probe(struct nbpf_device *nbpf, int n)
 
 	snprintf(chan->name, sizeof(chan->name), "nbpf %d", n);
 
-	tasklet_setup(&chan->tasklet, nbpf_chan_tasklet);
+	dmaengine_init_bh(&chan->dma_chan, nbpf_chan_tasklet);
 	ret = devm_request_irq(dma_dev->dev, chan->irq,
 			nbpf_chan_irq, IRQF_SHARED,
 			chan->name, chan);
@@ -1478,7 +1477,7 @@ static void nbpf_remove(struct platform_device *pdev)
 
 		devm_free_irq(&pdev->dev, chan->irq, chan);
 
-		tasklet_kill(&chan->tasklet);
+		dmaengine_kill_bh(&chan->dma_chan);
 	}
 
 	of_dma_controller_free(pdev->dev.of_node);
-- 
2.43.0

