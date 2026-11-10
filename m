Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316591;
	b=A69wcVB3qDNOh4ukfoI32HvAsG4xpY+IVANmlkU8SjLXXjM/Gew9s88aEFrCqng5bpDW
	 lGGVg3rXHriHp4dfd0DZZd5FxCFe+I8wleKqag9v7xpSuQNlWE+X0xnozLu0RdswiDK3p
	 VycVHrZq9sDMRNkkOpK82nuvIG8EE/DpE+SFzvu+7BSst4iVH5c7k1rCuyo8BHTegtrpt
	 aACr3yi66hPwgICJpIsvbmLg+dksgMPPSakdykF5ftGfrkDW2mW55iPPfHm2MWwlXJUkS
	 lm+RyTcWZWg4XRfbCSpO3gJgzkqHNBQKgN4rAFXNVOY812e54kEH4agSQT3FErFlEpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316591;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Cbtqy4auIRvKLrmPW0JIKtBfHxWyyh4zCU0f/Dy9WUw=;
	b=0bgjv92V6CnVfsHmwTwjs1T/YUF4QOPg+RdbvZEkqrIi/b9NkFsSTN2/0ZeHp1c5FUOj
	 LqQU62+y0E5wCZMXTrzQnb75ncUgYmhvK6oX894ZgOG4yH4S1HS6nHaaoEuBC+rMLxp8r
	 it8cJgQO6folgqNWGOrm6jrdPcdWIZC8WPnUmac8xM6o7/D+LEMEE2wud1qq46bLIaokR
	 RtmrQqlSjeCLlczMPEG6ShPrziPCHTtFLhR6sm+6DFt0sUkA0pmXKEL2HDrtm0yornhlz
	 2UzIQXxMPJFAQt7xeemqmQl2bBNu3+8xNWfmMUIlg6a2Mx1749/ovZgLilhHf7k3ptw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="KLUHh5m/";
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C643460A5BC2
	for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 13:16:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C643460A5BC2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KLUHh5m/
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cdba1bbde0bso732781a12.2
        for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 05:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316590; x=1794921390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cbtqy4auIRvKLrmPW0JIKtBfHxWyyh4zCU0f/Dy9WUw=;
        b=KLUHh5m/tm62c5WEfHBibvmKyuE+io3kSsYeVTE7wiy6chwZNdOCplsGyWSiZ1zxSr
         98XFrRrkIU2oeXPeqegrrOW1jDgloERa7iG5d71t2jA3b0+Zhch7RJi8m3gqFIz/VJOv
         uE/DX3XTqfNhiepEGw7hEtcuatUcvx3N5SH3cP5aW+iBma4dzpNXN9z4UntLEnzeHO0Z
         f1JkNmYydacoBxbbGeqquJKUpe1HNGOEWYa4FoqKatJrLPPXpo3ENFhRnAx9Qs7UGtJ0
         c6OmtL7dI5u28Oa2L82a9YxpSC2MCaHIun/WbAyhAFnNQXkfWMZ7bTnEigJ/70wgkRJI
         ZDPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316590; x=1794921390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cbtqy4auIRvKLrmPW0JIKtBfHxWyyh4zCU0f/Dy9WUw=;
        b=cIafJUeHP8qVLs5eHQ5ec5wIItuZcgH2Leg/HgUaLe4wNHfqLeYSWOSO6HWp9ulLyO
         5//uGyWch+buv+EWgTb9nBLt6oZXqS3SDf3F+OLXAwQi8jcllsGdwZ65cKUtijRCC06b
         ql9Np9q5EioVj1RZmG2ZM/gcqy4EnYVumm+HeLT+Lpbewc5ELI+PdRD+RV1KvMCZ3dQy
         Sn1qOHOo8J6vmSktb7rK4tAWMERCap76mKHih2UJF2DzGiNLUq5evfURFjatT+jbN3Wp
         aHCuZrNQjwf90V0KBMzxLYR2N1tlFgFIxkRc2jrlaCrGLfenGb4KyPxNpsGiRuTQlOav
         b3Ww==
X-Forwarded-Encrypted: i=1; AL+hErFJ42Rf2J9ztNoASfpyok60XZmBZVh9QbaZEMwP+mO0OKE7RnGdZYkVFl2wQBm9faVogFJ1UmyiIh8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9UQUgPDM6jIHhI/8+rSkRZiyH2PHkZAPVTDL8ethMlwcG4XJcq
	C/4gL4L8KCkyVUiDEIIFjzaA0W1/uGRe8QxExP1OHQM/zJVUFEjNUqu8o531tg==
X-Gm-Gg: AYBFou1HuHXjFZ57rP20hcmW2tQuljqdU1m4Epm63ymbxKz9bA3pyRDaD+zTATOI+ow
	qDJj5nqDHVhktMeqgwgZx27Ny6WrLaO3j0n4BDRolzQXzZPvKDLgcmdqDTcyFNI5bdN+xP46Y8M
	GBOLbA+wdcSmYYIpJm0+XkDiK7sP4jK6Wwr5EEDOvTDTHpDCqiSLQhW4JAamN+v4zggnTZIYdWf
	Wz6B8r8yad2k5mCPuXGqNM025eYNj6iFp4qJbfpk17eMenNlS5HCcO3i7e/Wq8QMOFsnKautSSl
	olrSj2W9l6thgPzMxzjSjv/vCM5lsC4u6fMQr5CI71kkaaxZKV9f//oFSR+1XXYvl2x2yBf9wdm
	tt5nsMpCT2TxVou6YWlOmSLVolqS7EynWJQtkhXka+nfOJKV1SyXMldFVVTgPDYJTWS7mxAeUzi
	Ff7r4QEG6ga/CSIlHJPt4ptig6UY8++//6COmUtVOkHl5oCXQuGZv5xlhkqcD1+gXTc1zIyTK5w
	qjBOJL3P0395lFGzo6hpygjvLxI44ZzWwC9n1afUTLZkKl1TZxoFGi+/PUbz9HZMZJRd2E69Iqb
	5ftB6RPwkEvV+3j8i+uL10ToPAjTx4Mp
X-Received: by 2002:a17:90b:55c5:b0:39e:6a80:dd9d with SMTP id 98e67ed59e1d1-3b166d05104mr2597242a91.36.1794316590191;
        Tue, 10 Nov 2026 05:16:30 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:16:29 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>
Subject: [PATCH v4 14/33] dmaengine: nbpfaxi: switch callbacks to dmaengine BH
Date: Tue, 10 Nov 2026 05:13:14 -0800
Message-ID: <5e516217bad9982d82e820ea2d837a5512340e16.1794315350.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794315350.git.allen.lkml@gmail.com>
References: <cover.1794315350.git.allen.lkml@gmail.com>
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

Replace the per-channel tasklet with the shared dmaengine BH helper.
The handler continues to run in softirq context while dmaengine owns
the common scheduling and teardown mechanism.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/nbpfaxi.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/nbpfaxi.c b/drivers/dma/nbpfaxi.c
index c9010938c30f..80e607065e8e 100644
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
@@ -1477,7 +1476,7 @@ static void nbpf_remove(struct platform_device *pdev)
 
 		devm_free_irq(&pdev->dev, chan->irq, chan);
 
-		tasklet_kill(&chan->tasklet);
+		dmaengine_kill_bh(&chan->dma_chan);
 	}
 
 	of_dma_controller_free(pdev->dev.of_node);
-- 
2.43.0

