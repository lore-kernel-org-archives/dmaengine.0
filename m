Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316560;
	b=3AlCMLuVbaX/AjiFWgJ8EEQ0FqQvLIpm+kxLhNFHLVNRhVOBenODPwTJniK94DAmUqUe
	 e9qa8qhYed2rfV1gJmhG5UYEHnDUyYdIfPnKcnpjX+7U8MDR8EhBQD2s7xwF8q0TtLgCR
	 jJWyAuX59NX58nd75in7V0XyNvF+4qpLSyS+P8vGw1IT9B8p0sARlpwt1vGe8ZGXaZDkP
	 WACBG8GziB8VanqTow5uj11YOnA7OlkeALO3HvZbxId6m3+ibPA+I7gZ35Umoimanh35n
	 +PPVH1QT6WCQInYO60Dx6WaBtb/qyBPrFL7HoTzFnagoYY+LtbHBSf5vJSCXdnDGZTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316560;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Aoy2iWfB7hqjW4B4DNGdsqEpTmVd+l4psP9CnQFUpAs=;
	b=pXgLTFnUKod5HgsSCl9/C0TUBHVxfjR7q18VCC/iHZlmCeeQY3bmcXIZNHbzS7R58w5x
	 yk+pHcueQavJQXW86eFb9nIpg2EFieg0RHG4qikafLm1Ge81QQtSERblgATTYclq66I6+
	 UX8A+x0DHPgZuEPhNx/oxGwZRRVXeVD4YGZDvIbJZtfncCQdxHHr2gaKMaLT0ropSI1r1
	 0dwxV/u6cfVab65vBnMRM1s08yPZY5dUAb6UqeFqAXM0R3ypXspqD0frVOEVZOoK9lVPS
	 4Pz5hVaS+iVwVpypEIjMPyaKghG5P9lGSDFnScN3xaIYriZEtpB1rtdB5MfJ6axQguQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S4G4eHWN;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DD4606BFD6
	for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 13:15:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02DD4606BFD6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S4G4eHWN
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ae2b7e1e17so1244479a91.3
        for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 05:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316559; x=1794921359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Aoy2iWfB7hqjW4B4DNGdsqEpTmVd+l4psP9CnQFUpAs=;
        b=S4G4eHWNhSfVg1jQj/xBgFkVxBYbeeoiaXJ5uFYwQQmOJBLmLXdnjs5YRzKwNkeLLW
         nJ1ZhbKslLfmsrE+sL/8hnRkmyexnjHVsbVIFZ4tHB6/oveAuPCgbVML/0kIiMbSt24Y
         bk0UvujzfeKoBMjGo7WyAsAWthBiitWH4Z1RDRNXlygQuOBpU5mRoKF7Em7pV1AYE2Qs
         zRxAjFKjg7PRDqLG0ZYqpVfZ+w4k5NpBNWtLMqXTxZguuQzWwY8yUohFgMHiMtZR6ghb
         E9PuaGVZn2MWZJx7bS7frB2mbavP/rKIQheXFWt55V8gIUjvfzxjaNxDc9JUsxljetr0
         Wqfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316559; x=1794921359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Aoy2iWfB7hqjW4B4DNGdsqEpTmVd+l4psP9CnQFUpAs=;
        b=vtG5CIUk5EHIvkmBDpB9unTJYq0zayuyRrGW+fo8yk07eWNLc0PV7Ezblt19rTGnDl
         JUBVHkX7nOwv5n3bCW4ZrAv1yoK0S8/zCCu31LvSJW6+Xixp8fFgJ1ivO8mJ9U22EABr
         A35T/qmpxm5xfjn1Wo9IrTAtTfOmW2fEJ7PnTXnYSBRpVR4nm11YSxdMLmvh8q5Lbu7i
         J+RY3TDNPlzvH0I5BaCjBqrKZZABmWNdUUBZN4A9xP77bBXSECLvPBn8dIAf2jL/IBjk
         ujQVUqptCqJ0YS/T0hf0pyP/gB2IM6Gj/p03xSwyv7MbxH8OCkEIN3cMbfKrtWm4WFjw
         XBXQ==
X-Forwarded-Encrypted: i=1; AL+hErG05NweeBPqGywA/72MLBweKvni6hMGoo6dZW5egTe/noywMmTFFCqgJH4LdvoD6xsalM4pSvWe/bI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mugbqf+xMmtrltH8t4gi++iUxqRv7Qqwq7HzN4fwNNOehlBsV
	x/OkL6TPrq5w0+WyvhYfJ2b/Q9E+R1Sw9+9AvaxRPhsCq//JsOZpzpO3
X-Gm-Gg: AYBFou2fz3JxwglipQ1eHyzxgUoVCw0BcvSABQwICQrS4+II/H7A42J3LgkU/uPprEZ
	xwi0nJ2c5m7/WImS4jJj3vjGIFMwK7AjxXnopKuTfgV6lOpRHSihdUF3CW069PNpdSvoTg1RfGO
	NNF65YkIrsTPX+6RgL60983XNLPMnt5fhShU2he8SfNBlhEisZz7+9OQ/OpRocS522DnADjxR2e
	jym+6Mvs1EgQCW5MnGyywp1G1/R/057v9wtwVGfHrFAD6IuqXYecp3WCQ4Rh4x82rFl1g6wsJt3
	30bq6E45FX/5iKPmFIdRe/APbXEi/lMBEiZIKXgPCzjVAqH12uxw32yYRyaxt+BQvqfnWe2iBXA
	ek2c47+W/uAvd8nvm8lgpL5aJcUEcMmM9+kfn2jSosqDWz8kXXcpkIBG8VsXNV2pLCobk/vl+1s
	6J/CTh0yr0A/wDw4NO/DQxS/4V8QgkMyHPlEyT62PAdj+AZbBsQldFst6+cZKbEIzWfVqHqE0Vp
	N8arSVvgsszZhlziGEwZDHlxhn23WibsHXMDl+wQ2yCCMBcYlwCPrFMcm2CcsZpdtoy0sJh9W6c
	Goc4wljkzB75Sg2koEdnMt+m/9LjqhI=
X-Received: by 2002:a17:90a:e7c8:b0:3ac:da41:ef7e with SMTP id 98e67ed59e1d1-3b166d1a008mr2743472a91.52.1794316559290;
        Tue, 10 Nov 2026 05:15:59 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:15:59 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>
Subject: [PATCH v4 07/33] dmaengine: fsl_raid: run completions via dmaengine BH
Date: Tue, 10 Nov 2026 05:13:07 -0800
Message-ID: <f4a0692d25545a81a8f47f9fef1661ed4013c7f0.1794315350.git.allen.lkml@gmail.com>
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
 drivers/dma/fsl_raid.c | 11 ++++++-----
 drivers/dma/fsl_raid.h |  1 -
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
index fbfd3b6fa586..26c6c84619ec 100644
--- a/drivers/dma/fsl_raid.c
+++ b/drivers/dma/fsl_raid.c
@@ -155,9 +155,10 @@ static void fsl_re_cleanup_descs(struct fsl_re_chan *re_chan)
 	fsl_re_issue_pending(&re_chan->chan);
 }
 
-static void fsl_re_dequeue(struct tasklet_struct *t)
+static void fsl_re_dequeue(struct dma_chan *chan)
 {
-	struct fsl_re_chan *re_chan = from_tasklet(re_chan, t, irqtask);
+	struct fsl_re_chan *re_chan = container_of(chan, struct fsl_re_chan,
+						   chan);
 	struct fsl_re_desc *desc, *_desc;
 	struct fsl_re_hw_desc *hwdesc;
 	unsigned long flags;
@@ -235,7 +236,7 @@ static irqreturn_t fsl_re_isr(int irq, void *data)
 	/* Clear interrupt */
 	out_be32(&re_chan->jrregs->jr_interrupt_status, FSL_RE_CLR_INTR);
 
-	tasklet_schedule(&re_chan->irqtask);
+	dmaengine_schedule_bh(&re_chan->chan);
 
 	return IRQ_HANDLED;
 }
@@ -678,7 +679,7 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
 	snprintf(chan->name, sizeof(chan->name), "re_jr%02d", q);
 
 	chandev = &chan_ofdev->dev;
-	tasklet_setup(&chan->irqtask, fsl_re_dequeue);
+	dmaengine_init_bh(&chan->chan, fsl_re_dequeue);
 
 	ret = request_irq(chan->irq, fsl_re_isr, 0, chan->name, chandev);
 	if (ret) {
@@ -852,7 +853,7 @@ static int fsl_re_probe(struct platform_device *ofdev)
 
 static void fsl_re_remove_chan(struct fsl_re_chan *chan)
 {
-	tasklet_kill(&chan->irqtask);
+	dmaengine_kill_bh(&chan->chan);
 
 	dma_pool_free(chan->re_dev->hw_desc_pool, chan->inb_ring_virt_addr,
 		      chan->inb_phys_addr);
diff --git a/drivers/dma/fsl_raid.h b/drivers/dma/fsl_raid.h
index adbfede330a7..3bc11b12fa37 100644
--- a/drivers/dma/fsl_raid.h
+++ b/drivers/dma/fsl_raid.h
@@ -275,7 +275,6 @@ struct fsl_re_chan {
 	struct dma_chan chan;
 	struct fsl_re_chan_cfg __iomem *jrregs;
 	int irq;
-	struct tasklet_struct irqtask;
 	u32 alloc_count;
 
 	/* hw descriptor ring for inbound queue*/
-- 
2.43.0

