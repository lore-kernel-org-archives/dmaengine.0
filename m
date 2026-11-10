Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316552;
	b=fVfXLJpv38IpELk5qU7bBYURBUsiUALj5E0Yl8a8XJ47ivVdnUsWv3w6sWZouXKqPHmN
	 nLA/n8hJ3S1bOX14kcI3aPPa7JeccizHafwvvW4LLBm+UrIBmMWTgrwjXiLGU8osdrjyt
	 WAZwh6Q5sCH5pdRY6zKOPiuwan6Fh+Ag1bwAqqzSUEoXVuwUyq0l7YDgNE2R0UiSW/1Pw
	 iqbgWAoLi/g7k2Eiw43e2W3NGJ0L77cGkffnNmonNQqNgQxpMMfd6c/O3rE74gMF+uiTB
	 UbR/5OULxKP+JrxDOqrxyE9EzDCeSe+w/EqGITXDpietygHtJy6ct4tbpE349t9bzPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316552;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0P8WydTp3FMq5jOmu5TOWCdQW00c3EBUBRA4Y9UXlr0=;
	b=oqVmWfjmMu5e7ZBlrkCPiWEvXs6+o0uTDWRUoYp07+XQqe16RY1aF1VKMYc5Xw/i0Fcu
	 RoDkhGNW8ASAFqx40NpNmiknMCaPSe4ZsKNs3vxtdjqW0oOLRXCZ1+y1BjrG8ZgPiuZA1
	 /jVf/awwuQk2B9UVFqYh9adNKkc35SwiY2POCoIAIE6sXVXR/3wvwc1SPRaYXlycI4Lg2
	 YhyDE1c+/frSo8fibfyUKkU0uQLXPtemKRLap3QdlOLqgbhAabSFGMMrlf6xr8QBEkLIb
	 mL5vdWOR1oSCgfHCPqIJ0xkHBWJqTy4LLPe70RKqfDR40oJo8numOG4tGVP7Twr4KKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m98KuahA;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D06F606E47C
	for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 13:15:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D06F606E47C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m98KuahA
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ada4c06b7bso1038950a91.2
        for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 05:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316551; x=1794921351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0P8WydTp3FMq5jOmu5TOWCdQW00c3EBUBRA4Y9UXlr0=;
        b=m98KuahARQ1XF9RSU0cRNYwhBEiDATZMGlK5zz9OZxKq97jurznAKC/RepoMebmZ1q
         2OaCPcoU/NRMDWdJEBr3ttZ5kU5yB7y0FqHRoCfFPF2IMTtzM2IA8ooKm3jcThgOKDzE
         9o2lurDBzl6VS22cHV26osO2dZIa8CmRzxDMjFOBknFWioBoKgb0+j5yoPW7xruV4G1b
         ObUGWCqMmbh69OBysdFffz58FKlaCSuMrJGVjNPrJ+CbtPQi5goyomAJ2pRrrNG+kOGu
         L6ybQp6oNYeKQ9qMyQBPVu6+4RS9Rtmj4g/TGobpSg8RYOXV92LCJdrqBROcYvIcl6W8
         IJWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316551; x=1794921351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0P8WydTp3FMq5jOmu5TOWCdQW00c3EBUBRA4Y9UXlr0=;
        b=UZZCxNZnr2RHbQmN9X9ELhzcJxrIhLaW+TItcccKFHQlRj04qpnmbEUyY3YfJ6RbWt
         yWzeOFVpHy+DkjRoLTgii2dXYokhhbWn/4oFnxeG1DYiHaZPCjNU4bNUSH1HS6a65MpD
         9UjGO/24cgeNzAhf8xkxuFVLNn5SA8UQ1jV5PV6UrZA+ObGAnKczHfT3r3YeilrV4Zg4
         9EgSeZ3fexZnTkHmOQNpWS+YlQmtFUmIeJZ4yDUbwq3q4amAYRGwFEH3hlF/KsYB9egD
         9G6TyzQhaFUDivL5Ap8ECsig0u7Y/I3hf/KK2uL4RBWRyLcwli7gZYZtEIRzgOeLfxm6
         NZew==
X-Forwarded-Encrypted: i=1; AL+hErECVVLOXj54jD9EnqguEj2mQZRo28cntUMjEJzGhOoKrgboAW2t4G6Tz1zRYBid2ry2TiUWV72Iz2Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/B+MwQVXUs00CKKEt43C8BcF8k7NLmhV/omRDUGF8qnHoiCXJK
	dSFU9XRIORxDiGW1rJsvquYeehrpiOzUksd9sybne1g1fpCGe9o38vKO
X-Gm-Gg: AYBFou3TRc9lKC0h5jdB51FN8jSzyMRnuHRxjgrcMTCv0r4doNpYUvb31VtaIeuRKkH
	YChgW2ST3gFJXAyPmu/HTQb4sXmfcaPY/4UTtwoZPKKtCNUIghAg+Pti8JWpCuXxhtWKwR1f6sJ
	VjKzWTzfVDJmY1w0cdd4dhb3bjLJkrPPUzV7+kHI3+PeD9uLNerj+j9x3aceS173aktkJ3l1AO/
	5lt+VxIeZa4FRpvPq4o55zB9yYCNAu+Hb4t8p0gqIsUtGvjIqi1t32R+qau+PXHI8qupnqjfnbn
	vsZ2Yiq1JM1hEL78+IvWcbOhlxvpDvJGdDQUabsSP9bcPb2Z8ULRvw2QOjKq7NR7CbIH3HwBA05
	B9NANjmXaEHoTK8U4qVAFucYHGt+4bc340fLXHbaMOH+HV+njhlp0oleBXwZBtvL/ShmpzA8BZ1
	58EDuWraUp1KEHLpEqwka4F541B+2Ay5hnHTMqA8DdRyPHhwRUGDs+rfi5b6gAYaSlMsKkxxIv7
	Up//UWbb6urnf5nrjzeppV71deR59LMRoHcImDc+kxhsBazXWiMpmEi4Bc+ymJxQ3UEND8O/tqp
	yBJejmTHVr9O9ou6s41bpOkYsZ04UoY=
X-Received: by 2002:a17:90b:578f:b0:3b0:91ce:672e with SMTP id 98e67ed59e1d1-3b166c92430mr2883561a91.17.1794316550818;
        Tue, 10 Nov 2026 05:15:50 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:15:50 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Frank Li <Frank.Li@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 04/33] dmaengine: at_xdmac: move irq bottom half to dmaengine BH
Date: Tue, 10 Nov 2026 05:13:04 -0800
Message-ID: <373d4fa23c4c5b9898a02ad7a0568ce1d828081d.1794315350.git.allen.lkml@gmail.com>
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/at_xdmac.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/at_xdmac.c b/drivers/dma/at_xdmac.c
index ef0dfe9d37ba..ae2ff7c0bd56 100644
--- a/drivers/dma/at_xdmac.c
+++ b/drivers/dma/at_xdmac.c
@@ -228,7 +228,6 @@ struct at_xdmac_chan {
 	u32				save_cndc;
 	u32				irq_status;
 	unsigned long			status;
-	struct tasklet_struct		tasklet;
 	struct dma_slave_config		sconfig;
 
 	spinlock_t			lock;
@@ -1754,9 +1753,9 @@ static void at_xdmac_handle_error(struct at_xdmac_chan *atchan)
 	/* Then continue with usual descriptor management */
 }
 
-static void at_xdmac_tasklet(struct tasklet_struct *t)
+static void at_xdmac_tasklet(struct dma_chan *chan)
 {
-	struct at_xdmac_chan	*atchan = from_tasklet(atchan, t, tasklet);
+	struct at_xdmac_chan	*atchan = to_at_xdmac_chan(chan);
 	struct at_xdmac		*atxdmac = to_at_xdmac(atchan->chan.device);
 	struct at_xdmac_desc	*desc;
 	struct dma_async_tx_descriptor *txd;
@@ -1860,7 +1859,7 @@ static irqreturn_t at_xdmac_interrupt(int irq, void *dev_id)
 			if (atchan->irq_status & (AT_XDMAC_CIS_RBEIS | AT_XDMAC_CIS_WBEIS))
 				at_xdmac_write(atxdmac, AT_XDMAC_GD, atchan->mask);
 
-			tasklet_schedule(&atchan->tasklet);
+			dmaengine_schedule_bh(&atchan->chan);
 			ret = IRQ_HANDLED;
 		}
 
@@ -2310,7 +2309,7 @@ static int at_xdmac_probe(struct platform_device *pdev)
 		return PTR_ERR(atxdmac->clk);
 	}
 
-	/* Do not use dev res to prevent races with tasklet */
+	/* Do not use devm resources to prevent races with the BH worker */
 	ret = request_irq(atxdmac->irq, at_xdmac_interrupt, 0, "at_xdmac", atxdmac);
 	if (ret) {
 		dev_err(&pdev->dev, "can't request irq\n");
@@ -2390,7 +2389,7 @@ static int at_xdmac_probe(struct platform_device *pdev)
 		spin_lock_init(&atchan->lock);
 		INIT_LIST_HEAD(&atchan->xfers_list);
 		INIT_LIST_HEAD(&atchan->free_descs_list);
-		tasklet_setup(&atchan->tasklet, at_xdmac_tasklet);
+		dmaengine_init_bh(&atchan->chan, at_xdmac_tasklet);
 
 		/* Clear pending interrupts. */
 		while (at_xdmac_chan_read(atchan, AT_XDMAC_CIS))
@@ -2451,7 +2450,7 @@ static void at_xdmac_remove(struct platform_device *pdev)
 	for (i = 0; i < atxdmac->dma.chancnt; i++) {
 		struct at_xdmac_chan *atchan = &atxdmac->chan[i];
 
-		tasklet_kill(&atchan->tasklet);
+		dmaengine_kill_bh(&atchan->chan);
 		at_xdmac_free_chan_resources(&atchan->chan);
 	}
 }
-- 
2.43.0

