Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316579;
	b=QrVhBB3UFW29wbUOefB5bbsPSp52FcqC/j7wKTgD1+52DuPwqoc2ZIrjrOKmU3U9znYs
	 yWeGGzkaY7sf/m/ZOekAoCdrYyl1RA6P6Zf/Fu/Yxs3nMEQz75NCSKHFas6bk9/2oFYn9
	 Vu4XOpcTfCIZLAoBqkpgVgh/C8RLK5DQAh5ScL+mUzXtpsabhMPKivnV950jdetMfNQVt
	 V1jjEAhRrn6A7A2c15Qoo5JjgQkxw9jDN0f9xAF3VQPj8vopyyLCIKDjop10lvWuJ5cmC
	 QNdXsusNTHEPDII+ThfLIq7KlhQC3ghZ7Bmwj8T9XcePdV2O++eGizkM8jSOYO6MkzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316579;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+LrMmR+vkKu4p9kzNlmH8/RuG63V3SyOhjhj9/0YiBo=;
	b=jhsLfkowe339z1ucq9mS3UkFw7/+rvCNWK/NFqBCvFbsazrh8650F9ubLdkZrQL2XmH/
	 T715kwuZdnGrrn9MdwKsMXrcJa/0yYJuxXHRaVpMRlcMLVMlOESJyLwv4IWTAKxd4TSBq
	 XFkwNloocqV9yiHHR7zRBYVZriTkwZgQhu6GtgE2mAssRpbcJhw2aJb068PCux1wnXNWu
	 ykB5urQqc518Z8YNYEeWl8/g3cFMVnlG9MHNgHVDJeNBfhf0cfQ/SsQhhmAQ7KPQJAJp2
	 XIhPZjsk0hN+4NfyAZLr2X9IpfLZMABnDXOjR+XWHMcShHrjZQeheHo4eTzBbT4pFIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ujHf7F8v;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001C7606BFF9
	for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 13:16:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 001C7606BFF9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ujHf7F8v
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b16896b8ceso461163a91.1
        for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 05:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316578; x=1794921378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+LrMmR+vkKu4p9kzNlmH8/RuG63V3SyOhjhj9/0YiBo=;
        b=ujHf7F8vbBL9mJIIbCDBDy172NhqabWtc4jQ1OoIaP+P001lSlq10qIjBhKQq13AOf
         pDH2AfJz8b0xTnz66v6Gj5y6UIVXLM7zifrvXpNo4SREqE1WSoxZCDZmNnZI3nZ87+cn
         RFFR+SyLVI8dYr+Rm+mu7D7NiGPJGEdeOxrG5KeTT+DAiCYwWHujGHdMyNqXQmt+laIY
         AwiqzvUDwSbJwZ44SH6rAWFjyHUDkhYOreuBk6ex/6BJpsUeeb+8gsalHEt77L0NBZ6/
         GZP7gTWuZfwxxiL4JZH3V6iDKoAyRefhjYPU1ATRJ7ExP6dUlj5ZlApUcks8oE+7XtTs
         erjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316578; x=1794921378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+LrMmR+vkKu4p9kzNlmH8/RuG63V3SyOhjhj9/0YiBo=;
        b=gQstx7tds8JcSdA2O1+xWW8alOUvHfeJ1CsXGiqgaNhVfPYBGcob1Tsl1nPOwKq/w/
         UM8SSjpwU/J3wjMOS26fEeeHr+jSr40vbyoEK2zA2A8lbvLByNMEa/ZLca7Tyqoy7S2L
         3K/2IBxwfuKW1ZQcNxTTtSlUjvPvFvg55BxRx+uAOr/AXZLF6OvNDIuccnUJLN9guo8q
         aXxuQW+lquNkRaarkRFiB/HXhA+49XfaxiBqFlv9yGo2wCGAFV3ZFS+ZmrWAKeKQeZg8
         GWbWXXSKNJe+gf40rTGN7FCZPAcTaDYzhOkKQLlNuqpbTW7yjCIdr+LW44/0NQS8L2fO
         06HQ==
X-Forwarded-Encrypted: i=1; AL+hErHZ7E+pHAwHPZU8E9u2EenRE9QGQfNc3tHzXZNnXWx3dEHWIRbL6JyoW00lPimsxCAtLyqV1wJOS+A=@vger.kernel.org
X-Gm-Message-State: APuU4Z9GUBBJFTqR0BLNQfrEDNMcSjcpIQcO+spCBz8T9003ObXJ8yyL
	0NtZuw3JIb3rF+dXvBW0FnWy+L36JR6do+KG6CY2WGSWCI5rAGbqA5wq5uo/uw==
X-Gm-Gg: AYBFou04BZe/TO9BMArEwVdlvvpjCZwNmk1FPp0jmi9S0Lkf8/n7e+HWBgKJCfn3rVA
	zc+wSA3Debue+yppV1cn/idCmkb6nFUeBw2G5T3CIlwLu5lvZP22KXFvL+Wq+2YTWhEABT5Th71
	id1owVo0JU1jY0585LVZksl4e42x0bLVn69pVx3gtcXIwYQ63HqEUYyGbWfo9D3R8s/RuNf8TeH
	z1ChDzdc2JnZkv3PuUxfsT5kEqTolzaX11iIK9MWAL+RwDatt/DH4oyh+dDY1AMpsFdCeK7NGxR
	Yfpqr5/4h4Gsgu0gg0ziQrwkAGHEVK8ceYoRjntasCEBnGObZU40XS8eJbf+rtWCV5Re8TDNF3V
	9IBHQJzhRsQcd4Q3fal7Qcyk6fY0IhsrG0D9DsIDw6oT0ifR9f3GEb+nwuEdLVBumg7SNc590hz
	5tCv+DhnfIfVZQHbOIwSlZJ+8WCQ5U83WOFEfSXoZqZGepljmz7BqgDWKjikezkcG/dVXQoYhBN
	l4ubejnZcra0k9W0p5Fo6EouvKy5dN+/asQJYuZwLLv2UAysTmgYBMS1tMCqWcbS+d5GC1GMOh4
	QBa7qoMPPnPZwd72Jj1gm99V0x/es+1IHRsYfGKuKMe1zkFz7gTG
X-Received: by 2002:a17:90b:35c6:b0:3b0:9e2c:9b60 with SMTP id 98e67ed59e1d1-3b166cd47b6mr2411498a91.21.1794316578225;
        Tue, 10 Nov 2026 05:16:18 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:16:17 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>
Subject: [PATCH v4 10/33] dmaengine: mmp_pdma: replace per-chan tasklet with dmaengine BH
Date: Tue, 10 Nov 2026 05:13:10 -0800
Message-ID: <e0e306bdccfa7c8da6e9bed0bab9f8848db3bc64.1794315350.git.allen.lkml@gmail.com>
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
 drivers/dma/mmp_pdma.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/mmp_pdma.c b/drivers/dma/mmp_pdma.c
index 6045d6d1cc79..abea70dea890 100644
--- a/drivers/dma/mmp_pdma.c
+++ b/drivers/dma/mmp_pdma.c
@@ -115,7 +115,6 @@ struct mmp_pdma_chan {
 						 * is in cyclic mode */
 
 	/* channel's basic info */
-	struct tasklet_struct tasklet;
 	u32 dcmd;
 	u32 drcmr;
 	u32 dev_addr;
@@ -373,7 +372,7 @@ static irqreturn_t mmp_pdma_chan_handler(int irq, void *dev_id)
 	if (clear_chan_irq(phy) != 0)
 		return IRQ_NONE;
 
-	tasklet_schedule(&phy->vchan->tasklet);
+	dmaengine_schedule_bh(&phy->vchan->chan);
 	return IRQ_HANDLED;
 }
 
@@ -1045,13 +1044,11 @@ static void mmp_pdma_issue_pending(struct dma_chan *dchan)
 }
 
 /*
- * dma_do_tasklet
- * Do call back
- * Start pending list
+ * dma_do_tasklet - BH worker to process completions and kick pending work
  */
-static void dma_do_tasklet(struct tasklet_struct *t)
+static void dma_do_tasklet(struct dma_chan *c)
 {
-	struct mmp_pdma_chan *chan = from_tasklet(chan, t, tasklet);
+	struct mmp_pdma_chan *chan = container_of(c, struct mmp_pdma_chan, chan);
 	struct mmp_pdma_desc_sw *desc, *_desc;
 	LIST_HEAD(chain_cleanup);
 	unsigned long flags;
@@ -1168,7 +1165,7 @@ static int mmp_pdma_chan_init(struct mmp_pdma_device *pdev, int idx, int irq)
 	spin_lock_init(&chan->desc_lock);
 	chan->dev = pdev->dev;
 	chan->chan.device = &pdev->device;
-	tasklet_setup(&chan->tasklet, dma_do_tasklet);
+	dmaengine_init_bh(&chan->chan, dma_do_tasklet);
 	INIT_LIST_HEAD(&chan->chain_pending);
 	INIT_LIST_HEAD(&chan->chain_running);
 
-- 
2.43.0

