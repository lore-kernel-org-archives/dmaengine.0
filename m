Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41AAD34676F;
	Fri,  6 Feb 2026 09:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770368481; cv=none; b=il1//2Hu5yY3EG9xeLvOoEsrqudVdgiSjb4Bu2dl/dC9WwEgeirIE08Q4xFiEUELJA4JEfEjvEfET8dPmVHmLmPmWbxsf68BNxIyaiyRH1KRZwwGJDwojh7Xe77E2mGs4Fvi+W1AKtnjd30NoNwUag7jPHzfZIu4SxROoaiNwh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770368481; c=relaxed/simple;
	bh=pLXghc8uFnO7SeL1Vmgd+/JVszklvENUyK7hmF2bN6M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LBxvo3lsMbV8gF220tPaN1h9qYSPYSnUvVX7zpJNI7i2Po+u8zW9L3eUAuwL0LALOSVVY/qWnw4ZqSns94FN0bH0cgYZCv2m5hX9+UQsIySXg+x93qqTZ/u8EULEWzD147KrUnSjMARq9l9PcPcPtZKUXCyYKrJvfr2j8ch3554=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=likewhatevs.io; spf=pass smtp.mailfrom=likewhatevs.io; dkim=pass (2048-bit key) header.d=likewhatevs.io header.i=@likewhatevs.io header.b=muCY4ikr; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ZJYWuWtR; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=likewhatevs.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=likewhatevs.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=likewhatevs.io header.i=@likewhatevs.io header.b="muCY4ikr";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZJYWuWtR"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 12C2D7A0132;
	Fri,  6 Feb 2026 04:01:19 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Fri, 06 Feb 2026 04:01:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=likewhatevs.io;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm2; t=1770368479; x=1770454879; bh=4lJZcVMC3t
	tIxIoHzgNX5NHnl+JHnA/EuzQUX9mPrbM=; b=muCY4ikrw7DP73JYfOujEvCuQr
	HUcI3He5KouxB3q0She/t7g9k2ptohlxH1MLx9gDza0p6+106idPT+hifuPRDjdV
	a2s+MWFJRUBg/q9R92upp2Th5of2H5r+T2rAIIJ0wJGKkJdRQuuMm7rGqkattzWP
	ryHbCfAJ/8D7AX0Uyaahp+IlxcT4+OLN3sjyj50uh/QrvOGQsKhFJKU4qI1S+mNh
	NRZ4YuBgX2HP/P8I08uACLNYoWEV89J5pUpDTFCBlcKn4O0a5Ar1BizXcdFJa9+X
	T6kOFF7/8gt/MOaSXPRs+hlSKaLJWixf+QuBiepBhB4BGmr3rgLdGIneDNwA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1770368479; x=1770454879; bh=4lJZcVMC3ttIxIoHzgNX5NHnl+JHnA/EuzQ
	UX9mPrbM=; b=ZJYWuWtR4PIBI3+zodlmxSiitDpJpAp3SyY/joCPTvfqpuqryYd
	ka/+hzujVxwbiiaajblALW/EsEeaU5LmpEqMh+E/8mw7Nvrf2IAGZC+mzB1sWGS4
	hvcrn5UmwIe4gnVn9UjglsC2HIeoJZyVOLuHE2czXaD5u9Yg4s3Nagr08DSSvGCK
	zvvtgScr9ZeuWN0vdd+5GhXHXNi9572+s3Zu0sfuGT0owT1X1U8cuvLfqDdujHyf
	VBloCfdOyLtyf/JQNewIpSLsZi/d44vUC+bzYFwSb7EecVJvCwolti9VjNFf5vZo
	/1qkSxN6gHerVgxxT8HYIta918qjuqsKEDQ==
X-ME-Sender: <xms:362FaeCokojmOLstf1-wSMIvnTIgHTl-jCOuX6ThrgNhpRU-bC67wA>
    <xme:362FaR2XmLzRw8gvbEwvlVpSTu_POC7oNVoUzN_bUpUVv4N70swOMngLB4TfuDhst
    lyecz6VIfVf_dV3r9t09mUE5ygdbeSw5RVwNjeNCobaC5W2SFVQG_ZV>
X-ME-Received: <xmr:362FaY007j91MHWYkjEMG4miaOL7vR8riocM8vmYcmk1oq-ZH9XmQ5hNr08jIPuBFyBym_ZTCnFGTg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddukeejjeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomheprfgrthcuufhomhgr
    rhhuuceophgrthhsoheslhhikhgvfihhrghtvghvshdrihhoqeenucggtffrrghtthgvrh
    hnpeefveeiveeijefgueettdejleelieefvddtkeekudduveetveeutdehffeiueehuden
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtsh
    hosehlihhkvgifhhgrthgvvhhsrdhiohdpnhgspghrtghpthhtohepiedpmhhouggvpehs
    mhhtphhouhhtpdhrtghpthhtohepthhjsehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    hlohhgrghnghesuggvlhhtrghtvggvrdgtohhmpdhrtghpthhtohepvhhkohhulheskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepughmrggvnhhgihhnvgesvhhgvghrrdhkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehprghtshhosehlihhkvgifhhgrthgvvhhsrdhioh
X-ME-Proxy: <xmx:362FaeAsz4JZWDLh5bMt_izLdG7ckrIG85p0tRPK4b3ysodIOQpNxw>
    <xmx:362Faf7RD4FbFKt_J6m9l9S0Z6yfDyxb41XJG6b1x7IrCW3W2EBazA>
    <xmx:362FaXKhXAN4_o8nOLcvkLun_Pursxhg3ZQGhbUnaRiyHPHw3TkLNA>
    <xmx:362FaYsF2UNVjJwNy-3TkXtZ1Z7EvoOj817mXvfcOMuKjxMbcP-vQw>
    <xmx:362FaabZuZ9Y7dcEhPhb0569MWcB2zow6UBv209-cmhZfVgvwLgPozTe>
Feedback-ID: i7f194913:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Feb 2026 04:01:18 -0500 (EST)
From: Pat Somaru <patso@likewhatevs.io>
To: Tejun Heo <tj@kernel.org>,
	Logan Gunthorpe <logang@deltatee.com>,
	Vinod Koul <vkoul@kernel.org>
Cc: dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pat Somaru <patso@likewhatevs.io>
Subject: [PATCH] dma: plx_dma: Convert from tasklet to BH workqueue
Date: Fri,  6 Feb 2026 04:00:58 -0500
Message-ID: <20260206090058.1127675-1-patso@likewhatevs.io>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The only generic interface to execute asynchronously in the BH context
is tasklet; however, it's marked deprecated and has some design flaws
such as the execution code accessing the tasklet item after the
execution is complete which can lead to subtle use-after-free in certain
usage scenarios and less-developed flush and cancel mechanisms.

To replace tasklets, BH workqueue support was recently added. A BH
workqueue behaves similarly to regular workqueues except that the queued
work items are executed in the BH context.

This patch converts drivers/dma/plx_dma.c from tasklet to BH workqueue.

The PLX DMA driver uses a single tasklet to process completed DMA
descriptors in BH context after an interrupt signals descriptor
completion. This conversion maintains the same execution semantics while
using the modern BH workqueue infrastructure.

This patch was tested by:
    - Building with allmodconfig: no new warnings (compared to v6.18)
    - Building with allyesconfig: no new warnings (compared to v6.18)
    - Booting defconfig kernel via vng and running `uname -a`:
    Linux virtme-ng 6.18.0-virtme #1 SMP PREEMPT_DYNAMIC 0 x86_64 GNU/Linux

Semantically, this is an equivalent conversion and there shouldn't be
any user-visible behavior changes. The BH workqueue implementation uses
the same softirq infrastructure, and performance-critical networking
conversions have shown no measurable performance impact.

Maintainers can apply this directly to the DMA subsystem tree or ack it
for the workqueue tree to carry.

Signed-off-by: Pat Somaru <patso@likewhatevs.io>
---
 drivers/dma/plx_dma.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/plx_dma.c b/drivers/dma/plx_dma.c
index 34b6416c3287..be13a7fa5763 100644
--- a/drivers/dma/plx_dma.c
+++ b/drivers/dma/plx_dma.c
@@ -13,6 +13,7 @@
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/workqueue.h>
 
 MODULE_DESCRIPTION("PLX ExpressLane PEX PCI Switch DMA Engine");
 MODULE_VERSION("0.1");
@@ -105,7 +106,7 @@ struct plx_dma_dev {
 	struct dma_chan dma_chan;
 	struct pci_dev __rcu *pdev;
 	void __iomem *bar;
-	struct tasklet_struct desc_task;
+	struct work_struct desc_task;
 
 	spinlock_t ring_lock;
 	bool ring_active;
@@ -241,9 +242,9 @@ static void plx_dma_stop(struct plx_dma_dev *plxdev)
 	rcu_read_unlock();
 }
 
-static void plx_dma_desc_task(struct tasklet_struct *t)
+static void plx_dma_desc_task(struct work_struct *work)
 {
-	struct plx_dma_dev *plxdev = from_tasklet(plxdev, t, desc_task);
+	struct plx_dma_dev *plxdev = from_work(plxdev, work, desc_task);
 
 	plx_dma_process_desc(plxdev);
 }
@@ -366,7 +367,7 @@ static irqreturn_t plx_dma_isr(int irq, void *devid)
 		return IRQ_NONE;
 
 	if (status & PLX_REG_INTR_STATUS_DESC_DONE && plxdev->ring_active)
-		tasklet_schedule(&plxdev->desc_task);
+		queue_work(system_bh_wq, &plxdev->desc_task);
 
 	writew(status, plxdev->bar + PLX_REG_INTR_STATUS);
 
@@ -472,7 +473,7 @@ static void plx_dma_free_chan_resources(struct dma_chan *chan)
 	if (irq > 0)
 		synchronize_irq(irq);
 
-	tasklet_kill(&plxdev->desc_task);
+	cancel_work_sync(&plxdev->desc_task);
 
 	plx_dma_abort_desc(plxdev);
 
@@ -511,7 +512,7 @@ static int plx_dma_create(struct pci_dev *pdev)
 		goto free_plx;
 
 	spin_lock_init(&plxdev->ring_lock);
-	tasklet_setup(&plxdev->desc_task, plx_dma_desc_task);
+	INIT_WORK(&plxdev->desc_task, plx_dma_desc_task);
 
 	RCU_INIT_POINTER(plxdev->pdev, pdev);
 	plxdev->bar = pcim_iomap_table(pdev)[0];
-- 
2.52.0

