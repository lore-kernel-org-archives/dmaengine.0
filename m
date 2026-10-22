Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792707156;
	b=cg8VE6wDRBl1+pE8I7SPKW7MVnpxXQIztFbzAHHu2J9a6EOidXVtAJsC2TAwjd3+rzC1
	 ao/zpXsx1108bXXWgj1b3HrHo0IFoVkfSSftVeueoMOKu73t6cEYB6ezH4KdwzY7M45Gp
	 xo03bRdaZWtr0yuTeayEeTrlelRZb1Brt8cqlQd+T396T/J4k10MydJDsznwcpG3ZgWfc
	 /LQ1bQnkpdxWREC3fFItcpgxAEQ/sN59hwAgZTK27i0NcePbhAN9z8pe1WtjrjnhtjR+y
	 tcg3uHS5Cq1iJ0/0WD6Yn2sc/w5RqTXBkjScFxKwwWfdX2DJrpdkyTkHcJeSOVgQoUQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792707156;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=sHyXsqIdIkoUPa69/DyZNCtGS3kU9aq1n0Qvsmbypio=;
	b=PcfokchCZm+ZNH9rfc0TbHt7f8iec44hq8zvfvMA5BK8XxL1ZaIIBK2sBOoNkg6Q3qqC
	 pnFmZ/92NKPY59s297UMleJK/WxG+BvEObMO/4tGJwD7lf7NMQlvcjXDQ++jNljNnUb9j
	 il/pXpN4I2aCu6Kg31mu/nCtEveis6GNpKIeqZkrDccarmk4yTQdeximv1wM+/6asxIo8
	 dGTLiGDQ1jUSEZLa/AqanpGiccWoCiZtZlrgd+1NiOjjxt9Cnb4i8Fz1UD7/aqoY49FdR
	 mvSs5HVa6+qkiZaMVCe/SHOab9fSlNJ2eu2A+9rCHK5hFi1gib11SRVcB47aRgP8mlg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Uoc4UwmS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7806D606A326;
	Thu, 22 Oct 2026 22:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Uoc4UwmS
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792707156;
	b=tcfXW3s6b7MOnYus7i97N3eQIo1vTQQoLY3zrNH7mQt7BCRzloB5s9OgIuoOkQ0Z15aP
	 U3HRul14Lsq5oePSwnu1QCyDka+XRv24CcsNiILdKZREVfYbr/jLUc7OQoWQOcWAKB7St
	 Fnd6gKemNiX8/IaokxEAkbj1V0MR4hA8fFlYqrCfqG3RN1X/8K2nZh2hREnzn0cVUv6Lb
	 7BHGIrCxtg6aDJI8aF7MMsqKwr4LY1gXfpAjwcc7ESGDhlrhxXL0q26ZbOsJObEhrH09Z
	 2jjP98qp+kCAwdZ21n2zmb3UwZMiO9vPJIC23wni2Vwj9HzbhA9z6BxLcV7RrUeVO2g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792707156;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=sHyXsqIdIkoUPa69/DyZNCtGS3kU9aq1n0Qvsmbypio=;
	b=wsBEiR1gmaLHhGRHEkxUw/Fy4RB/F9ncBbZBexwSnTI4Tcx0A/wSaSCwawpD2dMbDW/5
	 t2M1DZ/aRbR/lyKBQr/3Q6g9AidYXcHTkppyGvJcMYi57UUrmbPGNrjfd7yyB7QQNdk76
	 ZiAmWJ9omWYOWEbeb9cfoVf0crr6gBvOgSdVApTo7gkG4wy3IXLWynbhRan24TZbK9tXy
	 77eD9RBmBQygbbmL+6sx1GR+Xq3pebCD/AvGJR3CJ+68PI6UaEGgQ1ja43lGjnh0wZteT
	 kbecWTvIU2CrMbrBQBkRQMKG/0Reud8jEGXzlbUOLtNqz33s8gLHAAIlO4gXM3UPCSQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3914A1F031E4;
	Thu, 22 Oct 2026 22:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792707156;
	bh=sHyXsqIdIkoUPa69/DyZNCtGS3kU9aq1n0Qvsmbypio=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Uoc4UwmStE5+8ZOw3U2Rkdyy8BCoVI73kwW2Yyw6MC+WW6FOzp/IoFpkySq0YQw6N
	 RDRF6+bvEAS27Cxnk+t0RC6DI9HK2/S//JvyyU9i12vB7h+QWfuBsgPTthW0m2FDQU
	 WZbwsu1FvFu/7XzcoKvbJrIMuGXzrjiEZBTOgpr+Ecoy7OsejeAY1eszMHsEyHdxd8
	 x4nm++scwpF8+jq5WZe4fiqR6lkoAa1KrXAmvdVtNEHVWuVF8noVD0k6fc9Pkfidah
	 h6G4o0GjKJaXKUrNJSlSkCpa0lElsDv3u3MdkMW5wto2YQVGyXbTcvXvKL8vIK4MpW
	 fnZxONLeRIzRg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A425A41FD2;
	Thu, 22 Oct 2026 22:12:33 +0000 (UTC)
From: "Jeff C. Jensen via B4 Relay" <devnull+kernel.nullptr.com@kernel.org>
Date: Thu, 22 Oct 2026 15:11:34 -0700
Subject: [PATCH 5/5] dmaengine: xilinx_dma: Recover a withheld AXI DMA
 channel
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
Message-Id: <20261022-xilinx-dma-work-v1-5-20faea2e7a80@nullptr.com>
References: <20261022-xilinx-dma-work-v1-0-20faea2e7a80@nullptr.com>
In-Reply-To: <20261022-xilinx-dma-work-v1-0-20faea2e7a80@nullptr.com>
To: Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org
Cc: Frank Li <Frank.Li@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 Suraj Gupta <suraj.gupta2@amd.com>, 
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, 
 Alex Bereza <alex@bereza.email>, 
 Folker Schwesinger <dev@folker-schwesinger.de>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 "Jeff C. Jensen" <kernel@nullptr.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7679; i=kernel@nullptr.com;
 s=openpgp-2026; h=from:subject:message-id;
 bh=xlPzA8YaYP6zTl1aM/8+oHxlsSaaMtEj6m2Ol3kOyIY=;
 b=owGbwMvMwCV2439B4wpuQQ7G02pJDFm3ugIMRP8+vGK5f3+CzLZlXAemde4SdpLKvnGRSZcvS
 fDTms82HaUsDGJcDLJiiizHj03bmW/rX1dUfb8KZg4rE8gQBi5OAZhIow3Df2eHSf2qG1bKTWS2
 XTe/49xjn/3LNGSvF1XGCp9K+3X5rQAjw6qEH6L8b2e97bE+/spx4cycG96OzdNfHenQsnws+Gi
 NAgsA
X-Developer-Key: i=kernel@nullptr.com; a=openpgp;
 fpr=C7C696B96F3D4F7E727BDF7AD8FF7081A80B1108
X-Endpoint-Received: by B4 Relay for kernel@nullptr.com/openpgp-2026 with
 auth_id=1265
X-Original-From: "Jeff C. Jensen" <kernel@nullptr.com>
Reply-To: kernel@nullptr.com
Content-Transfer-Encoding: 7bit

From: "Jeff C. Jensen" <kernel@nullptr.com>

A channel withheld by the previous patch keeps its descriptors, segment
reservations and descriptor memory for as long as it exists, because
nothing has shown that the engine stopped.

Recover it in the two steps the dmaengine API already separates. A
terminate halts and resets the channel, and a reset that completes is
taken as proof that the engine no longer fetches descriptors or writes
data. The withheld descriptors are freed later, from
xilinx_dma_synchronize() after the completion tasklet has been killed,
because a completion pass may be running a callback with the lock
dropped while the terminate runs, and a cyclic completion keeps its
descriptor on the list for the whole callback. Until then the channel
stays withheld and refuses new work.

The two steps have to stay apart because xilinx_dma_chan_reset() is not
purely a hardware operation: on success it clears chan->err, marks the
channel idle and enables interrupts. It is chan->quarantined, not
chan->err, that keeps every start path closed until synchronize,
including the one in the interrupt handler.

After synchronize the quarantine list is empty, the error and cyclic
state are cleared, the counters are zero and the channel is idle. The
ownership bitmap keeps only the reservations of descriptors that still
exist, and chan->seg_next keeps its position, since the engine fetches
next from wherever the last tail pointed. A client that terminates with
dmaengine_terminate_async() and never synchronizes leaves the channel
reset but still withheld.

Recovery is refused when this driver instance also manages the other
channel of the engine. An AXI DMA soft reset acts on the whole engine,
so it would reset that channel too and clear its interrupt enables,
which the driver does not coordinate, as
commit a17ce4bc6f4f ("dmaengine: xilinx_dma: Fix reset related timeout
with two-channel AXIDMA") describes. This patch handles single-channel
controllers; a withheld two-channel controller stays withheld.

A failed halt before a reset that completes is ignored, since the reset
is what stops the engine. If the reset fails again, the channel stays
withheld with all its reservations.

Assisted-by: Claude:claude-fable-5-1
Signed-off-by: Jeff C. Jensen <kernel@nullptr.com>
---
 drivers/dma/xilinx/xilinx_dma.c | 106 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 105 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index 0316c6e7881f..c72c0fc985c5 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -394,6 +394,8 @@ struct xilinx_dma_tx_descriptor {
  * @quarantine_list: Descriptors withheld after a reset that did not complete
  * @quarantined: The reset did not complete; the channel is withheld and takes
  *	no work
+ * @quiesced: The engine completed a reset while the channel was withheld;
+ *	xilinx_dma_synchronize() reclaims the descriptors
  * @free_seg_list: Free AXI MCDMA descriptors
  * @seg_used: AXI DMA segments in use, indexed by ring position
  * @seg_next: Ring position the next AXI DMA reservation starts at
@@ -437,6 +439,7 @@ struct xilinx_dma_chan {
 	struct list_head done_list;
 	struct list_head quarantine_list;
 	bool quarantined;
+	bool quiesced;
 	struct list_head free_seg_list;
 	DECLARE_BITMAP(seg_used, XILINX_DMA_NUM_DESCS);
 	u32 seg_next;
@@ -2917,12 +2920,109 @@ xilinx_mcdma_prep_slave_sg(struct dma_chan *dchan, struct scatterlist *sgl,
 	return NULL;
 }
 
+/**
+ * xilinx_dma_reset_is_isolated - Report whether a reset disturbs only this channel
+ * @chan: Driver specific DMA channel
+ *
+ * An AXI DMA soft reset acts on the whole engine, so resetting one channel of a
+ * two-channel controller also resets the other and clears its interrupt enables.
+ *
+ * Return: true when this driver instance manages no other channel of the
+ * engine.
+ */
+static bool xilinx_dma_reset_is_isolated(struct xilinx_dma_chan *chan)
+{
+	struct xilinx_dma_device *xdev = chan->xdev;
+	int i;
+
+	for (i = 0; i < xdev->dma_config->max_channels; i++) {
+		if (xdev->chan[i] && xdev->chan[i] != chan)
+			return false;
+	}
+
+	return true;
+}
+
+/**
+ * xilinx_dma_reset_withheld_channel - Stop the engine behind a withheld channel
+ * @chan: Driver specific DMA channel
+ *
+ * A completed reset shows that the engine no longer fetches descriptors or
+ * writes payload. The channel stays withheld until xilinx_dma_recover_channel()
+ * reclaims its descriptors. A failure leaves the channel withheld with its
+ * reservations intact.
+ *
+ * Return: 0 when the reset completed, negative otherwise.
+ */
+static int xilinx_dma_reset_withheld_channel(struct xilinx_dma_chan *chan)
+{
+	unsigned long flags;
+	int err;
+
+	if (!xilinx_dma_reset_is_isolated(chan)) {
+		dev_err(chan->dev,
+			"channel %p stays withheld: a reset would disturb the other channel\n",
+			chan);
+		return -EBUSY;
+	}
+
+	err = chan->stop_transfer(chan);
+	if (err)
+		dev_dbg(chan->dev, "channel %p did not halt before its reset\n", chan);
+
+	err = xilinx_dma_chan_reset(chan);
+	if (err) {
+		dev_err(chan->dev, "channel %p stays withheld: reset failed again\n", chan);
+		return err;
+	}
+
+	spin_lock_irqsave(&chan->lock, flags);
+	chan->quiesced = true;
+	spin_unlock_irqrestore(&chan->lock, flags);
+
+	return 0;
+}
+
+/**
+ * xilinx_dma_recover_channel - Return a withheld channel to service
+ * @chan: Driver specific DMA channel
+ *
+ * Must run after the completion tasklet has been killed, so that no completion
+ * pass holds a withheld descriptor. Frees the withheld descriptors, which
+ * restores their segment links and releases their reservations, and returns
+ * the channel to idle with no error, so it takes work again. Does nothing
+ * unless the engine was reset after the channel was withheld.
+ */
+static void xilinx_dma_recover_channel(struct xilinx_dma_chan *chan)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&chan->lock, flags);
+	if (!chan->quarantined || !chan->quiesced) {
+		spin_unlock_irqrestore(&chan->lock, flags);
+		return;
+	}
+	xilinx_dma_free_desc_list(chan, &chan->quarantine_list);
+	chan->quarantined = false;
+	chan->quiesced = false;
+	chan->cyclic = false;
+	chan->err = false;
+	chan->idle = true;
+	chan->desc_pendingcount = 0;
+	chan->desc_submitcount = 0;
+	spin_unlock_irqrestore(&chan->lock, flags);
+
+	dev_info(chan->dev, "channel %p recovered\n", chan);
+}
+
 /**
  * xilinx_dma_terminate_all - Halt the channel and free descriptors
  * @dchan: Driver specific DMA Channel pointer
  *
  * Return: 0, or the reset error when an AXI DMA reset does not complete, in
- * which case every channel of the engine is withheld with its descriptors.
+ * which case every channel of the engine is withheld with its descriptors. On
+ * a channel that is already withheld, the result of resetting the engine;
+ * xilinx_dma_synchronize() then reclaims the descriptors.
  */
 static int xilinx_dma_terminate_all(struct dma_chan *dchan)
 {
@@ -2930,6 +3030,9 @@ static int xilinx_dma_terminate_all(struct dma_chan *dchan)
 	u32 reg;
 	int err;
 
+	if (xilinx_dma_chan_quarantined(chan))
+		return xilinx_dma_reset_withheld_channel(chan);
+
 	if (!chan->cyclic) {
 		err = chan->stop_transfer(chan);
 		if (err) {
@@ -2970,6 +3073,7 @@ static void xilinx_dma_synchronize(struct dma_chan *dchan)
 	struct xilinx_dma_chan *chan = to_xilinx_chan(dchan);
 
 	tasklet_kill(&chan->tasklet);
+	xilinx_dma_recover_channel(chan);
 }
 
 /**

-- 
2.43.0


