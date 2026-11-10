Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316610;
	b=ftwpQ0LfN1gMlW3p1jDNNoPCj5kBTqqDo+L9d4aVkmJWpyYe/K1pHlBolMpI+nAe9ug4
	 +oFeSIWKlTembgcZ40xoc2WZADy4oDhnChs057rwSgTjHKRsp4Qvwac8PMCbc6H+UcdmX
	 kKr1s4aTf8fQCARiHpYqlPtCowGwbTkQKXvkGzHiMRPsGcS9+rThNYah81EGCv7vgSK07
	 4u5CZfvbk/7Az/SA1Y86AQk6dspq5Okj2Vp3YM6usfi5GmNLmlaGInGzgfdVXcQ6uhECR
	 qLxgLgDRO+yHr0S/WJu+fMNXjdiRMoMYdxoOnrVQ/JrOwKjurUwiuGvcK1V0gjUiAFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316610;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8qSxPIJXGmZS6SvVTVsFVDiQtnJa1ZzyZtQ6kW4/PMI=;
	b=qTnMn10NxgFAgOL+ah5Av+jF1X4r7C0IxPTPrWsH7OPdDPdyquILsKA4Nu1Otv7ST4x7
	 9MvkEWkh5c5wk2khS4MFsRQ/U11hJZKtWhS+hQthlU5oAA4QXk+Nddkk6WdeUUaNqqOd5
	 y7vg/QFMD+oW6j75GhjtxBXyrlIR+ikfm0Iqxh/Ti5C/iBTzyFNEQzUGjoVrlipC1x8dd
	 fwHUYpu43EfYy3wdzwvJ+39iqTXckMvf0L5nbBjq+yI5k2o2vn34jCXr2AvxVyvwOnm53
	 A3hE7WOVH7x/2w3Abrft3FAnsCNOgf7+H75UL4e2ZBrjoH8ll1ceYd9VLPORBCgwJ1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TVyzpUgW;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4092260A6F7C
	for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 13:16:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4092260A6F7C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TVyzpUgW
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cdb9f760337so986005a12.0
        for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 05:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316610; x=1794921410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8qSxPIJXGmZS6SvVTVsFVDiQtnJa1ZzyZtQ6kW4/PMI=;
        b=TVyzpUgWfv/BXNZsfbzPF45RML6viOGXtfGz+T12krB8pckShd8XGdJmSPwMxZkaQS
         XWaAGSPEEmwg5J5blqv9OGzP4Qrest+0jpKvfXVmbxskTWNDX2ItjCn8kg4uHTNIQhp4
         NiZPminUYZKl43lqdthkVAbz+EmJiP5QymOt0iLnph5c6nnX5D1abxH0uNtvyIQNh4JX
         AU4lfLD7mfjBK4FzjsGWtQar3wEMR9Hm7wpPDinUGda3LUrg11/biDhii/TCbtn4ij55
         LNsOjFD5srPwH2haoU3vumsyby6xi9qvxrmgNFjkigV7Mxkf3OMnh9qXKWtAvOCEnpDa
         a0Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316610; x=1794921410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8qSxPIJXGmZS6SvVTVsFVDiQtnJa1ZzyZtQ6kW4/PMI=;
        b=uRvycITmG/rFF4eC0R1ACSCInceSBwK0ZFos86gvH1eYgiE2Hexy9JpRVkCgYJLpzJ
         U/AuO3S6wQBw55kUc9X25qm3BygPtHHp2VKb/WOjiEQtMZVKwXlXJNJd73yrm2PF9mhm
         j9XgH6Ay8YVIPHPXdeApn9kMPVGdSN7+ycvjK+uOUMyAO+fsz9NWHhr4YBrUO/QMe+aS
         27b+hBDXYqHgKXevO/rWUyZpKDaDrlIxKXuTNW+i01M9iBbS2TRgHK0vjOFBjheBKwRK
         YLwaoj9E/TM5aRxinVAiczum6na0bdtSqIkJbi8pT8pYUWtDP/q65QLY7OSTYrl1e1ZO
         kE8g==
X-Forwarded-Encrypted: i=1; AL+hErEYdZIwGLYAzHPUaou5XaevzpytErNa0YlQ7I1lluZRgpnuaqfsiCaDvkj3RPK51ZjisVez6h7PFS0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+MNOUnm5s44C1yVeRzpq9Sc9kvagOUe22gek0MeRF7s5QY7MN9
	5sB+dobLz9Ywk9zBTYwX9XQsqwgqVhm03kxjl00CpOXPJSt3zL/h4rrV
X-Gm-Gg: AYBFou0DrVXBJEPmXKsF/+lKDZiXbfFOu4+R6Mro1AKZwhniAmJDRt6e4XOyjJ9ZUda
	q1ypmnSUWHIJnLlH3A52DbgXDEQXXXS3NpxI5quguKzliV/3sfX5vSmfgzALda2/s6OK8xo7+da
	zi+Hv1r6y6AbncSRlOQ3/aMnC+saVr8a4GFjracgw8/cIOFfD1mT4vLFUuBLydbKsLpb4EH+8cs
	H8FNfB1lTK9mbVwXnV+mrs7osBWpbvqdZe4K3sFOaUB/RBGn9L2OVFeoe9qd6DnpjUoK0k79FKJ
	dZxuQKCe7u+o2uimnOFb8cTBOHAzrZjuElaXuogbjVbKrp+fjTS4l7Q7l0oVoVANpH+rPQQB7t8
	MvtwBy27yHy6p6tQlu5PD1y4f9jv1DkOVXu0FxPOMFcmt6OH+oGf/BwMtL5VpsvS6KMX881OP1m
	cEUhkP6j3yomdV+JEtuKWry8NimjqYn5zhEviLSKidwaEzGm/jNMynxFciXA1+jUVfBl7iShmTb
	biDgIbiM7XbaXTxzoMXa46ZonniOwzkkuhg7if1pjv9lH/l0LTLd2ImcbnhRGcW6gwFK/29rGyq
	HEhLp19vn8St6TEJ7j62MJKOWMBRzlQ=
X-Received: by 2002:a17:90a:da8c:b0:3a8:337d:228a with SMTP id 98e67ed59e1d1-3b1678cee19mr1766766a91.6.1794316609428;
        Tue, 10 Nov 2026 05:16:49 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:16:49 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>
Subject: [PATCH v4 18/33] dmaengine: xgene-dma: wire descriptor cleanup to dmaengine BH
Date: Tue, 10 Nov 2026 05:13:18 -0800
Message-ID: <9195a9c6df38ec4e883db2aa271c8c178af98d3d.1794315350.git.allen.lkml@gmail.com>
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
 drivers/dma/xgene-dma.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/dma/xgene-dma.c b/drivers/dma/xgene-dma.c
index 3714099aef07..a10db8623f46 100644
--- a/drivers/dma/xgene-dma.c
+++ b/drivers/dma/xgene-dma.c
@@ -260,7 +260,6 @@ struct xgene_dma_desc_sw {
  *	These descriptors have already had their cleanup actions run. They
  *	are waiting for the ACK bit to be set by the async tx API.
  * @desc_pool: descriptor pool for DMA operations
- * @tasklet: bottom half where all completed descriptors cleans
  * @tx_ring: transmit ring descriptor that we use to prepare actual
  *	descriptors for further executions
  * @rx_ring: receive ring descriptor that we use to get completed DMA
@@ -280,7 +279,6 @@ struct xgene_dma_chan {
 	struct list_head ld_running;
 	struct list_head ld_completed;
 	struct dma_pool *desc_pool;
-	struct tasklet_struct tasklet;
 	struct xgene_dma_ring tx_ring;
 	struct xgene_dma_ring rx_ring;
 };
@@ -975,9 +973,10 @@ static enum dma_status xgene_dma_tx_status(struct dma_chan *dchan,
 	return dma_cookie_status(dchan, cookie, txstate);
 }
 
-static void xgene_dma_tasklet_cb(struct tasklet_struct *t)
+static void xgene_dma_tasklet_cb(struct dma_chan *c)
 {
-	struct xgene_dma_chan *chan = from_tasklet(chan, t, tasklet);
+	struct xgene_dma_chan *chan = container_of(c, struct xgene_dma_chan,
+						   dma_chan);
 
 	/* Run all cleanup for descriptors which have been completed */
 	xgene_dma_cleanup_descriptors(chan);
@@ -999,11 +998,11 @@ static irqreturn_t xgene_dma_chan_ring_isr(int irq, void *id)
 	disable_irq_nosync(chan->rx_irq);
 
 	/*
-	 * Schedule the tasklet to handle all cleanup of the current
+	 * Schedule the bottom half to handle all cleanup of the current
 	 * transaction. It will start a new transaction if there is
 	 * one pending.
 	 */
-	tasklet_schedule(&chan->tasklet);
+	dmaengine_schedule_bh(&chan->dma_chan);
 
 	return IRQ_HANDLED;
 }
@@ -1539,7 +1538,7 @@ static int xgene_dma_async_register(struct xgene_dma *pdma, int id)
 	INIT_LIST_HEAD(&chan->ld_pending);
 	INIT_LIST_HEAD(&chan->ld_running);
 	INIT_LIST_HEAD(&chan->ld_completed);
-	tasklet_setup(&chan->tasklet, xgene_dma_tasklet_cb);
+	dmaengine_init_bh(&chan->dma_chan, xgene_dma_tasklet_cb);
 
 	chan->pending = 0;
 	chan->desc_pool = NULL;
@@ -1556,7 +1555,7 @@ static int xgene_dma_async_register(struct xgene_dma *pdma, int id)
 	ret = dma_async_device_register(dma_dev);
 	if (ret) {
 		chan_err(chan, "Failed to register async device %d", ret);
-		tasklet_kill(&chan->tasklet);
+		dmaengine_kill_bh(&chan->dma_chan);
 
 		return ret;
 	}
@@ -1579,7 +1578,7 @@ static int xgene_dma_init_async(struct xgene_dma *pdma)
 		if (ret) {
 			for (j = 0; j < i; j++) {
 				dma_async_device_unregister(&pdma->dma_dev[j]);
-				tasklet_kill(&pdma->chan[j].tasklet);
+				dmaengine_kill_bh(&pdma->chan[j].dma_chan);
 			}
 
 			return ret;
@@ -1790,7 +1789,7 @@ static void xgene_dma_remove(struct platform_device *pdev)
 
 	for (i = 0; i < XGENE_DMA_MAX_CHANNEL; i++) {
 		chan = &pdma->chan[i];
-		tasklet_kill(&chan->tasklet);
+		dmaengine_kill_bh(&chan->dma_chan);
 		xgene_dma_delete_chan_rings(chan);
 	}
 
-- 
2.43.0

