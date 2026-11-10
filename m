Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316636;
	b=TevBAco6EU+x6y363oMPiH0j/npOol6DekfyFlQjExEl/rK09znw8l+oVblDPkA/mlNW
	 WrNqszJu0C4XsKxJkS5QKFzEtRqdS3U6J0xCkC8Zr1xas9/3bhCB6an8FVUKf1sf5nhrO
	 jOdVSPdqN043RkqZRL89N6kTPHllNqLOkQNH/+OlGbkBV0WI/l6y0ZIqikM0is5UUqmiB
	 iDQb3q/XiMsng73cufaEWM6XFYjUxyTdsq6FQlfUutCndSKVY4QMjOQK1iWz3xSYJrUgb
	 cHqLFj5BQs55t2yIk1hyOFBjLd2CbEnG5An9f/1TLEIv+6n8MTAElJA3fcpEk9FaVXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316636;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=l1pi1XUDschNZw5wd/NqRDLF/PgSvJCjkj/LDlLiJKI=;
	b=nDacngpjpZkaranxZZWmOcy4HZu++lkvFPwECQZTrbbjPVxFkwvDW5essJeKZWxxh80v
	 6fLF3bCOrsVKimfu4QaN6bJIvWFUzYs+Z3zrBJ1gayhULq+LmuRWyCqSyrzveR42YYhZT
	 816BsWmPUoYh5iAsWHv2irw3Zkfo3VVpsJpL/dLItwXLkON2QU2GhX4J6gPoXtpNk2EcT
	 J15dqBZQN0nc/Ra22+H9HrribIc7YRUuamZAdvOvmRaCapCoXkyJQZMfxqY922d9ada2U
	 NguGH80WP9gWU4XiIo+jVu4wAOD+Y4yzUb5YnR5V8Gi5FzafzXQmvR0g0p7IFp2cVCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mh3cCAsf;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F01606ACD6
	for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 13:17:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4F01606ACD6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mh3cCAsf
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ae7626d14aso1020976a91.2
        for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 05:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316635; x=1794921435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l1pi1XUDschNZw5wd/NqRDLF/PgSvJCjkj/LDlLiJKI=;
        b=Mh3cCAsfNJiZEfERkAPdueKxjidLed2is4jMSorEMT8iWHNviGCAjbPOmNc4+92vD1
         4HxIAaH87KC94BVFEOdeSDmVo4+5c0Ls6t34Z/LxDBvhorHB5a/Lw/XfkURu8WrZmY7/
         3W6yLIdNTkljMtm2IvPT3NSy6Zw5YSOJI1o+CUb3F4tVffGchMVS//f0KmJ0YSrJ9Wcw
         1+YRNJCH7xxNm2ubZ51tbJBlgbB5CIqTmgt/lqV9K6tBKEvBDXM+l6+UhpXd2+CDTJka
         jE8H+ooaLKf1T5E+nYBvpi4pePf7mxOdM7P+0pUHeoG91tBnHsVWaGYwvu/wbxqytsob
         KTtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316635; x=1794921435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l1pi1XUDschNZw5wd/NqRDLF/PgSvJCjkj/LDlLiJKI=;
        b=05Xv7yDPuzgdkDw1Ty1D9HNv8YefWoCV3uLCs9wykHhgRtnDRiCCcsXsbUFBda4PhU
         F1dCXgD6w1HlJRfX+ue9jwRGk94e/Q49vipcMNxo8DPsZKvdkeTxewcV1t13KC794wlJ
         JuWXlFezAFPiPZHcQvbxZhm4mZwNcsnR9V6H1sz4FQ8p3+ZQNgteF4GeRpcCNg6ZkTNT
         z6Gmav6haJroSdYNhzMGOQ9+OqKJyB2tllf4Acgj89qFCbGOJvz/AHiKTfiOjSLpyWSW
         WcbHlcnIocOMH/SrcOCwdxid/bsX4TVZPFNH9Z1TUv3JKYKnXlm48r8Z8JcsxBIAbxHB
         IGHw==
X-Forwarded-Encrypted: i=1; AL+hErF16yQY/KjprNJYORNE4361kQ0pQi+/5jHRJ9i5nP5NYiwG/GlxPLRlI4hAVn66M5wrQLLpmz7GYjo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+i3NFtxJTFkpAliyIViWPJtgom1SRDB5nybUkckeYwku+7rzLX
	Q7i0PMnqf10cZGhO3icYtzK3oW9XP/mggLfC0IBLlw/p7/g1Da08TR2Pu9CKgA==
X-Gm-Gg: AYBFou2xxwPV6uz1XJ+S1wgDD7/8eToOJsDZY8JMq59B/asljNCyrWdXmCbRYM3qTm8
	qPwVE2y7D42D2DDMtH+tuTvmNUrJA/dkc8t9+QeUfgkOb04LzH0JoxUAd87VjitOCy0yeLMNvGE
	vQEI5xJBM8TmfOLsfgxqHjA6GO/iFJlHDbOznYKKPOUyhS8pBOQ+E9mph7i5reX5CFWmkF+16a8
	TVDGM4HJv39Y3lKr5CY7xtI2hkoWonFtgWxAafj1cFqf+hbfKhy0zsjL38yJvCAeJoviKNx/16S
	cUKyu9ctN4X93f2YrqssoHz8R0Urr4wLWFQTMRJAcyleiybBAAiS/DBaUQGd9hA6L00M0el0vij
	uAWfNU0xP8pX2K/91OsSj3RN+EyxKjEvq4T0DrXatLuVO/C/z6F2rmV7bxebqJISswsUtZnS6gD
	ATxg3F4m0oC3S/1ZB8VEcSbAFH7UvpjxDjMaI3ynRdti3gvThGhh5DN9/hSkgx7osG7XRXBUJ9A
	mTwiGIwwcnKQyN10Okml097johwWdX2jZK7sO+M9shpWNlX1HxyjfWNvt55KOE2qNFOUYsZsbuj
	WmtdULfHIvhjAYpAHuMe6xdrz2nk9JJW
X-Received: by 2002:a17:90b:3ec1:b0:3ab:189b:6981 with SMTP id 98e67ed59e1d1-3b166cde7b8mr2780267a91.48.1794316634965;
        Tue, 10 Nov 2026 05:17:14 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:17:14 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>
Subject: [PATCH v4 25/33] dmaengine: mv_xor_v2: use channel BH helpers
Date: Tue, 10 Nov 2026 05:13:25 -0800
Message-ID: <4ea53128f001eba3e96a6e0ecebc0651d918a155.1794315350.git.allen.lkml@gmail.com>
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

Replace the device tasklet with the per-channel BH helper so descriptor
callbacks run through dmaengine_*_bh.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/mv_xor_v2.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/dma/mv_xor_v2.c b/drivers/dma/mv_xor_v2.c
index 1920dcd5886e..3c8d7b065d3f 100644
--- a/drivers/dma/mv_xor_v2.c
+++ b/drivers/dma/mv_xor_v2.c
@@ -139,7 +139,6 @@ struct mv_xor_v2_descriptor {
  * @reg_clk: reference to the 'reg' clock
  * @dma_base: memory mapped DMA register base
  * @glob_base: memory mapped global register base
- * @irq_tasklet: tasklet used for IRQ handling call-backs
  * @free_sw_desc: linked list of free SW descriptors
  * @dmadev: dma device
  * @dmachan: dma channel
@@ -158,7 +157,6 @@ struct mv_xor_v2_device {
 	void __iomem *glob_base;
 	struct clk *clk;
 	struct clk *reg_clk;
-	struct tasklet_struct irq_tasklet;
 	struct list_head free_sw_desc;
 	struct dma_device dmadev;
 	struct dma_chan	dmachan;
@@ -290,8 +288,8 @@ static irqreturn_t mv_xor_v2_interrupt_handler(int irq, void *data)
 	if (!ndescs)
 		return IRQ_NONE;
 
-	/* schedule a tasklet to handle descriptors callbacks */
-	tasklet_schedule(&xor_dev->irq_tasklet);
+	/* schedule a bottom half to handle descriptors callbacks */
+	dmaengine_schedule_bh(&xor_dev->dmachan);
 
 	return IRQ_HANDLED;
 }
@@ -346,8 +344,8 @@ mv_xor_v2_prep_sw_desc(struct mv_xor_v2_device *xor_dev)
 
 	if (list_empty(&xor_dev->free_sw_desc)) {
 		spin_unlock_bh(&xor_dev->lock);
-		/* schedule tasklet to free some descriptors */
-		tasklet_schedule(&xor_dev->irq_tasklet);
+		/* schedule bottom half to free some descriptors */
+		dmaengine_schedule_bh(&xor_dev->dmachan);
 		return NULL;
 	}
 
@@ -553,10 +551,10 @@ int mv_xor_v2_get_pending_params(struct mv_xor_v2_device *xor_dev,
 /*
  * handle the descriptors after HW process
  */
-static void mv_xor_v2_tasklet(struct tasklet_struct *t)
+static void mv_xor_v2_tasklet(struct dma_chan *chan)
 {
-	struct mv_xor_v2_device *xor_dev = from_tasklet(xor_dev, t,
-							irq_tasklet);
+	struct mv_xor_v2_device *xor_dev =
+		container_of(chan, struct mv_xor_v2_device, dmachan);
 	int pending_ptr, num_of_pending, i;
 	struct mv_xor_v2_sw_desc *next_pending_sw_desc = NULL;
 
@@ -760,7 +758,7 @@ static int mv_xor_v2_probe(struct platform_device *pdev)
 	if (ret)
 		goto free_msi_irqs;
 
-	tasklet_setup(&xor_dev->irq_tasklet, mv_xor_v2_tasklet);
+	dmaengine_init_bh(&xor_dev->dmachan, mv_xor_v2_tasklet);
 
 	xor_dev->desc_size = mv_xor_v2_set_desc_size(xor_dev);
 
@@ -868,7 +866,7 @@ static void mv_xor_v2_remove(struct platform_device *pdev)
 
 	platform_device_msi_free_irqs_all(&pdev->dev);
 
-	tasklet_kill(&xor_dev->irq_tasklet);
+	dmaengine_kill_bh(&xor_dev->dmachan);
 }
 
 #ifdef CONFIG_OF
-- 
2.43.0

