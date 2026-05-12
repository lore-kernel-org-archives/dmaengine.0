Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8095B4D8D9D;
	Tue, 12 May 2026 12:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778588008; cv=none; b=qdP8+hsMg5j/xtJsvVjOwajbtHvNUBouXGZXrX9hbdIAWrtTLsP1WaLSYT5eJg+6FbdZeateLEBxUQ3OfFlxl3TYmbaY032pvIl1XIpqc67md3BQlYncIx91TPoyFWzVn5vF3MjrncmRTCTaPekmjROi2tJGnS5k02SSaJVdk4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778588008; c=relaxed/simple;
	bh=C1uzurnunbaZHN2hjU/EdY8OcHRWiCmz2+SqJSoaMQs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C0yteYWToQqt/Jc3KFCQiSuzTZHTItW1UNSLhfVSiTfmlwD8eAoQfmMuJ4oXa3GvMLA6fH4Oo7Y6x6SayOFhqED/CPVKY2Z6fWSVyFM/qOvt6y2jleKpZCJ8wBSd6YPqJpz2CeZZbm1vi2NkEb0iHYYirrK9uoHyjbpG9QstPqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77BB8C2BCF5;
	Tue, 12 May 2026 12:13:23 +0000 (UTC)
From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
To: vkoul@kernel.org,
	Frank.Li@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	fabrizio.castro.jz@renesas.com,
	kuninori.morimoto.gx@renesas.com,
	long.luu.ur@renesas.com
Cc: claudiu.beznea@kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v5 13/17] dmaengine: sh: rz-dmac: Add runtime PM support
Date: Tue, 12 May 2026 15:12:14 +0300
Message-ID: <20260512121219.216159-14-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260512121219.216159-1-claudiu.beznea.uj@bp.renesas.com>
References: <20260512121219.216159-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Protect the driver exposed APIs with runtime PM suspend/resume calls
before accessing HW registers. As the current driver leaves runtime PM
enabled in probe, the purpose of the changes in this patch is to avoid
accessing HW registers after a failed system suspend leaves the runtime
PM state of the device improperly reinitialized.

In that case, the driver remains bound to the device, the APIs are still
exposed, and any access to HW registers without runtime resuming the
device may lead to synchronous aborts.

This patch prepares the driver for suspend-to-RAM support.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v5:
- none, this patch is new

 drivers/dma/sh/rz-dmac.c | 48 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
index d6ad070be705..df91657fd5e3 100644
--- a/drivers/dma/sh/rz-dmac.c
+++ b/drivers/dma/sh/rz-dmac.c
@@ -488,7 +488,15 @@ static void rz_dmac_prepare_descs_for_cyclic(struct rz_dmac_chan *channel)
 
 static void rz_dmac_xfer_desc(struct rz_dmac_chan *chan)
 {
+	struct dma_chan *ch = &chan->vc.chan;
+	struct rz_dmac *dmac = to_rz_dmac(ch->device);
 	struct virt_dma_desc *vd;
+	int ret;
+
+	PM_RUNTIME_ACQUIRE_IF_ENABLED(dmac->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return;
 
 	vd = vchan_next_desc(&chan->vc);
 	if (!vd) {
@@ -549,6 +557,12 @@ static void rz_dmac_free_chan_resources(struct dma_chan *chan)
 	struct rz_dmac *dmac = to_rz_dmac(chan->device);
 	struct rz_dmac_desc *desc, *_desc;
 	unsigned long flags;
+	int ret;
+
+	PM_RUNTIME_ACQUIRE_IF_ENABLED(dmac->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return;
 
 	spin_lock_irqsave(&channel->vc.lock, flags);
 
@@ -697,8 +711,15 @@ rz_dmac_prep_dma_cyclic(struct dma_chan *chan, dma_addr_t buf_addr,
 static int rz_dmac_terminate_all(struct dma_chan *chan)
 {
 	struct rz_dmac_chan *channel = to_rz_dmac_chan(chan);
+	struct rz_dmac *dmac = to_rz_dmac(chan->device);
 	unsigned long flags;
 	LIST_HEAD(head);
+	int ret;
+
+	PM_RUNTIME_ACQUIRE_IF_ENABLED(dmac->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
 
 	spin_lock_irqsave(&channel->vc.lock, flags);
 	rz_dmac_disable_hw(channel);
@@ -807,6 +828,11 @@ static void rz_dmac_device_synchronize(struct dma_chan *chan)
 
 	vchan_synchronize(&channel->vc);
 
+	PM_RUNTIME_ACQUIRE_IF_ENABLED(dmac->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return;
+
 	ret = read_poll_timeout(rz_dmac_ch_readl, chstat, !(chstat & CHSTAT_EN),
 				100, 100000, false, channel, CHSTAT, 1);
 	if (ret < 0)
@@ -909,8 +935,15 @@ static enum dma_status rz_dmac_tx_status(struct dma_chan *chan,
 					 struct dma_tx_state *txstate)
 {
 	struct rz_dmac_chan *channel = to_rz_dmac_chan(chan);
+	struct rz_dmac *dmac = to_rz_dmac(chan->device);
 	enum dma_status status;
 	u32 residue;
+	int ret;
+
+	PM_RUNTIME_ACQUIRE_IF_ENABLED(dmac->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
 
 	scoped_guard(spinlock_irqsave, &channel->vc.lock) {
 		status = dma_cookie_status(chan, cookie, txstate);
@@ -956,6 +989,13 @@ static int rz_dmac_device_pause_set(struct rz_dmac_chan *channel,
 static int rz_dmac_device_pause(struct dma_chan *chan)
 {
 	struct rz_dmac_chan *channel = to_rz_dmac_chan(chan);
+	struct rz_dmac *dmac = to_rz_dmac(chan->device);
+	int ret;
+
+	PM_RUNTIME_ACQUIRE_IF_ENABLED(dmac->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
 
 	guard(spinlock_irqsave)(&channel->vc.lock);
 
@@ -985,6 +1025,13 @@ static int rz_dmac_device_resume_set(struct rz_dmac_chan *channel,
 static int rz_dmac_device_resume(struct dma_chan *chan)
 {
 	struct rz_dmac_chan *channel = to_rz_dmac_chan(chan);
+	struct rz_dmac *dmac = to_rz_dmac(chan->device);
+	int ret;
+
+	PM_RUNTIME_ACQUIRE_IF_ENABLED(dmac->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
 
 	guard(spinlock_irqsave)(&channel->vc.lock);
 
@@ -1265,6 +1312,7 @@ static int rz_dmac_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, PTR_ERR(dmac->rstc),
 				     "failed to get resets\n");
 
+	pm_runtime_irq_safe(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
 	ret = pm_runtime_resume_and_get(&pdev->dev);
 	if (ret < 0) {
-- 
2.43.0

