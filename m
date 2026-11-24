Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=204.191.154.188
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795543348;
	b=iH4hfBhexVTiolqsZlbiy+oB4cfzPHnf0HhnTKcb91YBf7X0sibay1QiVtLeS2w01Nju
	 LtNweWVwKoUtVL4VKB+tA0QbMOLiFH/3/zoJQwmQP02Nx7aJBAAlJH1a/ALjZLsBCLvVE
	 ijy1TZ3uP473flh8ssfHe7BeKBsT2leTTGg6NI6o9qpbpqio1fW571U8NIs4XuvgQqV3l
	 u9/jGT7UNV0pq/VkY/94YFW0CYF2bvdGPOjNY+f9oIqnEToWAnZBBGMKrrks0LHk+SBI0
	 lfMw0sGSxa0Jfv+VnUeyKxN84eW4+uzONws7f57lT67uiSH4b73z7iDHYhRm6qcv+Lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795543348;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-SA-Exim-Connect-IP:X-SA-Exim-Rcpt-To:
	 X-SA-Exim-Mail-From:X-Spam-Checker-Version:X-Spam-Level:X-Spam-Status:
	 Subject:X-SA-Exim-Version:X-SA-Exim-Scanned;
	bh=cb47iL65oswQ8WLZQVWKYoJyz09JI7YusvkLIU90heE=;
	b=J5cSJF4vxYdVK4MsADQ8Yc8fYy/KR+5mwwyZe6cvEs2hA+0IzihcNiygC7rvERrmGNvS
	 9TulGPQBba7pFgjoFv809nYGWSEQ21YRqyG0TOvDmsO2EH8jyK9Ofmsa9+P7Sz1xRmfVu
	 3BGiwZwnkJCKcHsfOkCDhKHPKc9zEG243qcCxfua0UUWfREl1MLVAP9lHuYUUggjzt+h9
	 VJBQfo+lSxe00zPXNOSBzZ1nqiW+2H/U8IzjO9qLYZK2KLOcLi0HC/dFrz9h7rSnbocqH
	 f0Qie5bPZzBjDU8q/Jq33vE9HJmFdjvki7y/XmDdULwZVbjxPEplsqxE320WpKgwjtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deltatee.com;
	spf=pass smtp.mailfrom=deltatee.com;
	dkim=pass header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=FwsTB5yg;
	arc=none smtp.remote-ip=204.191.154.188
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD16606A336;
	Tue, 24 Nov 2026 18:02:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDD16606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deltatee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=FwsTB5yg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Cc:To:From:content-disposition;
	bh=cb47iL65oswQ8WLZQVWKYoJyz09JI7YusvkLIU90heE=; b=FwsTB5ygvjGpqiGynNE82XMpoR
	wSBzmXdXRcWtYo7LWLMGiYyy5i6i40xhY8EdbwugZvOdav4nKc9oAiv0GoGXavkPpj25lyg5sAcw6
	HNDwwXAj6itU6P5cbe+vn6WkZ9GVbpI1pFIWBRgiCtXfkHy1sPo/uDzI/bQ1WfBle83cIRl97F83q
	QiL+San30wP19CRs9JtXkQ0IPgRs7zxZu/R+Ut9Wp30QAbe6tsYEpF3y5vtSSakgrdebdDTQN1zW/
	6b74KTMAzZphAHIBex78prTy3tzE40co6hDZ1mQeWWxeD36hDMIl19ZLF7z8OZdhxkYYiFUcC5Z6w
	34mNycCA==;
Received: from donard.priv.deltatee.com ([172.16.1.31])
	by ale.deltatee.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1xVuqY-00000000oKl-0ML5;
	Tue, 24 Nov 2026 12:02:26 -0600
Received: from logang by donard.priv.deltatee.com with local (Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1xVupj-00000003ruy-46zM;
	Tue, 24 Nov 2026 12:01:36 -0600
From: Logan Gunthorpe <logang@deltatee.com>
To: dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.li@nxp.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Frank Li <Frank.Li@nxp.com>
Date: Tue, 24 Nov 2026 12:01:27 -0600
Message-ID: <20261124180132.922222-2-logang@deltatee.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261124180132.922222-1-logang@deltatee.com>
References: <20261124180132.922222-1-logang@deltatee.com>
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
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, vkoul@kernel.org, logang@deltatee.com, Frank.li@nxp.com, Frank.Li@nxp.com
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Level: 
Subject: [PATCH v4 1/6] dmaengine: plx_dma: don't call pci_irq_vector() under rcu_read_lock()
X-SA-Exim-Version: 4.2.1 (built Sun, 23 Feb 2025 07:57:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)

plx_dma_free_chan_resources() calls pci_irq_vector() inside an RCU
read-side section, but msi_domain_get_virq() takes the mutex that
protects the device's MSI descriptors. Releasing a channel, for example
at the end of a dmatest run, triggers:

  BUG: sleeping function called from invalid context at kernel/locking/mutex.c:623
  ...
  RCU nest depth: 1, expected: 0
  Call Trace:
   __mutex_lock+0x113/0x2350
   msi_domain_get_virq+0x227/0x2f0
   pci_irq_vector+0x9a/0xc0
   plx_dma_free_chan_resources+0x178/0x58f [plx_dma]
   dma_chan_put+0x157/0x380
   dma_release_channel+0xac/0x2e0

Store the IRQ number at probe time and use it everywhere
pci_irq_vector() was called, so the teardown path no longer needs to
look it up.

Fixes: c2dbcaa8c672 ("dmaengine: plx-dma: Implement hardware initialization and cleanup")
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
---
 drivers/dma/plx_dma.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/plx_dma.c b/drivers/dma/plx_dma.c
index 409898e92c32..0a7ad2473cb1 100644
--- a/drivers/dma/plx_dma.c
+++ b/drivers/dma/plx_dma.c
@@ -104,6 +104,7 @@ struct plx_dma_dev {
 	struct dma_device dma_dev;
 	struct dma_chan dma_chan;
 	struct pci_dev __rcu *pdev;
+	int irq;
 	void __iomem *bar;
 	struct tasklet_struct desc_task;
 
@@ -452,7 +453,6 @@ static void plx_dma_free_chan_resources(struct dma_chan *chan)
 {
 	struct plx_dma_dev *plxdev = chan_to_plx_dma_dev(chan);
 	size_t ring_sz = PLX_DMA_RING_COUNT * sizeof(*plxdev->hw_ring);
-	struct pci_dev *pdev;
 	int irq = -1;
 	int i;
 
@@ -463,9 +463,8 @@ static void plx_dma_free_chan_resources(struct dma_chan *chan)
 	plx_dma_stop(plxdev);
 
 	rcu_read_lock();
-	pdev = rcu_dereference(plxdev->pdev);
-	if (pdev)
-		irq = pci_irq_vector(pdev, 0);
+	if (rcu_dereference(plxdev->pdev))
+		irq = plxdev->irq;
 	rcu_read_unlock();
 
 	if (irq > 0)
@@ -510,8 +509,9 @@ static int plx_dma_create(struct pci_dev *pdev)
 	RCU_INIT_POINTER(plxdev->pdev, pdev);
 	plxdev->bar = pcim_iomap_table(pdev)[0];
 
-	rc = request_irq(pci_irq_vector(pdev, 0), plx_dma_isr, 0,
-			 KBUILD_MODNAME, plxdev);
+	plxdev->irq = pci_irq_vector(pdev, 0);
+
+	rc = request_irq(plxdev->irq, plx_dma_isr, 0, KBUILD_MODNAME, plxdev);
 	if (rc)
 		goto free_plx;
 
@@ -545,7 +545,7 @@ static int plx_dma_create(struct pci_dev *pdev)
 
 put_device:
 	put_device(&pdev->dev);
-	free_irq(pci_irq_vector(pdev, 0),  plxdev);
+	free_irq(plxdev->irq, plxdev);
 free_plx:
 	kfree(plxdev);
 
@@ -594,7 +594,7 @@ static void plx_dma_remove(struct pci_dev *pdev)
 {
 	struct plx_dma_dev *plxdev = pci_get_drvdata(pdev);
 
-	free_irq(pci_irq_vector(pdev, 0),  plxdev);
+	free_irq(plxdev->irq, plxdev);
 
 	rcu_assign_pointer(plxdev->pdev, NULL);
 	synchronize_rcu();
-- 
2.47.3

