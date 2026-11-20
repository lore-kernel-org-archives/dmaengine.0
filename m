Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202048;
	b=dCU6DDzI+dM6B/LWH9rUN1qGWTPbx/38LRp53pwfk27rhh0gS9smYjPw0JDudX7KLtNv
	 Y+a+/e++KWFDHFo/rHyXAgOyzgr1a4ytxhSrSzsMxKEh9mtn7sKnjp3KJHh3koTXvo2FJ
	 HdfanDuhEl/iEaz5ZKty6dsUDHIS1KMGyDq44Ka2ftoN5Wh8iCE9ArNwm3XU7cmHbxNsY
	 QgQTVzObiu5ZtmQX7ycvjDiZVL1uhTRuI+SR0vsNaFbN2yJFd8HwCseSxv3BQAycD0tSj
	 6P0tbDAH9pnk8FOS2ylt1Du76kcjsn4155jFPtazTbWv7KMnEHXGqGslaQJYGowUwEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202048;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=rfsGoBQIbogwRnnVczPLtH8aeHkW23Do7VnMP/YAMt8=;
	b=vWgU/ArU8/DcApYlIiV+HAH4K/Am52x+zNQ3aGOJ1EjmlVTfJqUQk9ZVJxjz7kxHBvz0
	 CzNsyTmXO3l/NbJbevm0bMzqTwIwpOdsW2LJc5/98lqqu2gCb9qGHVIwcgyrg8VReILvp
	 6AoQacLPXdpetzG7J2kCBkeQ9TxcfOFPdoP38wdGHhX1TaWFDBmVlwcZeRz7UEh2aUuTY
	 f4n/mi8TGR2WzKXOhjdn1BANUhZZutDg5pz/YCsCGU/IDVjBn6WV2WdbwUrNMwBOTbr7V
	 eOGs0yh3TjGTMFKbQOx12pQwok4oXgfjz48RBOAiTxM7h1zrUCuTfMZ3FXDGkNHZjOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KP+ifNPU;
	arc=none smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC3F60A2629
	for <dmaengine@vger.kernel.org>; Fri, 20 Nov 2026 19:14:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEC3F60A2629
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KP+ifNPU
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-843b6f8e2c7so971462a34.1
        for <dmaengine@vger.kernel.org>; Fri, 20 Nov 2026 11:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795202047; x=1795806847; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rfsGoBQIbogwRnnVczPLtH8aeHkW23Do7VnMP/YAMt8=;
        b=KP+ifNPUzv2Pbh37CY1h3EmB3Vmc9pi3V3ao7N/0Ixk4zAwAnNkoqe4YpXaZJ7Ut6S
         Rr0N6nlehASltC9nC43jrbVHOJpliI7/TuKLI3G99MWY3wfDaHy5XnozrweSGTNdexw9
         z88exHrpJOmZygAzLNgxyaLxuxhceRXudSDtjgbgUopaZUD5EirIDiqidY04XFl4uBPo
         NEc0aMq3Z6mu8xIe0+f/TYYXr52RTW9mQFbZRK25ldMb9rAWqDg79YLnVEcVtNlEov/i
         wwnQoAlXeBGkIJJ2FWRbVUXfvW0ynpClkKtnn6LNLhoLGvUkHJnOLaozAn8OhWnUUg4B
         a1mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202047; x=1795806847;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rfsGoBQIbogwRnnVczPLtH8aeHkW23Do7VnMP/YAMt8=;
        b=dTtoWb6QO9yaEjL2pAB/ty54h81xWG1VzR7axVLfVGDD9fO07IwNhIIKntmzmtlcpu
         ERJ1jEOgme/0QMez98ohGUuCiAHAktNeviN59FHeP4i/Ws1FN+PfFPWBII+c5MVTwO0q
         tgPdShZOB4T9KjwNDcVxe2eXce4PmwebcLWINKD2/venCibn1LxcBNrxpaHjtGUKn8p1
         9YXj8zf6DFqjmCNY/UEUif3DCtAlwOe/Hqll+zhNO10pMHd/1vk2BmtMtITAFm54KRyM
         Y/Hf88bOYwvssVrNm2oE5484L2xUSCLBObk6EYvOwUKzp/tPZLjYTrIOarWp9Xa50IQ1
         aKfA==
X-Forwarded-Encrypted: i=1; AL+hErE3WQlldQNlDNZwgzM8sGchPlq4BLoLK4bhv8ukx9oJDogDR5E/0u3rZ563VG4B7pl2sIQ/81RGD0Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z94V3Hi5jyLf1ZIZrkrrxhTU/ysj/gvrdv0EQHoX+ahhB2NKoKv
	H5g4GZ1ChPQe5NM//Bdl9tzw2QETnZd3nX4CQPyIUkt4Ouz85/ztGsxk
X-Gm-Gg: AYBFou0Q8MHmL/V5veQU8MwPWXON6Byh4zEmQWipF+L4xL+K0moytCtYIIV/E5Zo7VL
	G9781utRcPO75sHqhoKMMxRXub2dnNRgEJj0iDSaBCeJnzGnttkcQpZxh/nW3vjOgGTiqO8XKZb
	0EQpzcybPjcBtHAJmPHtNvy/Wp8/EKQtLupoiCWJaJMKQcyYtvdsXKYSWyPQ68o6pLKBpbuZtmR
	YfgoSF3dE27VQKOuD40EFQ//QUNwX19ORdkPidSDYN6kgs99cb7WbDbIYRIsx4pp+7gMbY5PfW0
	dadhrCR4n8MfebEhBEvBzapX3wBY+R4oFS4bwbB/gK4w/2r+ND7NBqUBLBCs/iLKlgGdunyMaol
	FLrvdHv6FlhYPvZs5XpxnZIGXZ30PJeBrjn0ixgdTdu/nyPv+AUr/cPsmMygZBvJFwvNqR0rqRj
	va+M8GpJ90aRcurU3lqy4s4l8waW04kVgSkTg8zo1wWdsVNTIrUJILCdHOTN6lLuG6yyiJfSsHa
	fxAIL4Y7DmojR8XqGDabF0gPWkq3mQqUmLsxRmC9v2ghX3q6/hgE3WVSmkzwENaeHJt0eXf6kBa
	P3v0XjfPkRw7k1vhQiDMV3qad0eOsrUKz6SGbmeuZ06eSDaljK80NKJV4DXi6cDtIpgbUMMkKgI
	8EbJQ/8ZX/TwszmIRyzZ4vUm5dy954uGmGcVt700tceq23fCOCuxvQQuJ6odFZBoXmdhp9hZYOZ
	0IWIUX6KAwckxGRQcZ5/HKc5WUy1if+8SaGmkpzX/yafX2OYtGEPMn
X-Received: by 2002:a05:6830:410a:b0:826:1ccc:8bb9 with SMTP id 46e09a7af769-8631593a2c2mr5315852a34.6.1795202046602;
        Fri, 20 Nov 2026 11:14:06 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168f3964sm2654782a34.14.2026.11.20.11.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:14:06 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 12:13:57 -0700
Subject: [PATCH v9 7/9] dmaengine: dw-axi-dmac: serialize interrupt status
 with channel reuse
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-submit-dw-axi-dma-stop-pause-v1-v9-7-48ab58961d6e@gmail.com>
References: <20261120-submit-dw-axi-dma-stop-pause-v1-v9-0-48ab58961d6e@gmail.com>
In-Reply-To: <20261120-submit-dw-axi-dma-stop-pause-v1-v9-0-48ab58961d6e@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sergey Khimich <serghox@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>, Baruch Siach <baruch@tkos.co.il>
Cc: Mitch Barnett <mitch@accuratesound.ca>, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.17-dev

The interrupt handler reads and acknowledges channel status before taking
the channel lock. Termination can finish and a new transfer can start
before the handler takes that lock. The saved completion or error status
then applies to the new descriptor, stopping it and completing its cookie
before its DMA transfer has finished.

Termination also leaves completion and error status pending. A subsequent
interrupt can consume that status after the channel has been reused, even
if no handler was running when the old transfer was stopped.

Read and acknowledge status under the channel lock and keep it held while
processing the event. Move locking out of the completion and error helpers
into their sole caller, and clear all channel status after a successful
stop. Status collection, descriptor ownership and channel reuse then share
the same serialization.

Initialize the virtual channels before requesting the shared IRQs so every
lock is ready before the interrupt handler can run.

Fixes: 1fe20f1b8454 ("dmaengine: Introduce DW AXI DMAC driver")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 31 ++++++++++++--------------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index 2547f9596ae6..2eeb902eaad3 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -21,6 +21,7 @@
 #include <linux/iopoll.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/kernel.h>
+#include <linux/lockdep.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_dma.h>
@@ -1072,9 +1073,8 @@ static void axi_chan_list_dump_lli(struct axi_dma_chan *chan,
 static noinline void axi_chan_handle_err(struct axi_dma_chan *chan, u32 status)
 {
 	struct virt_dma_desc *vd;
-	unsigned long flags;
 
-	spin_lock_irqsave(&chan->vc.lock, flags);
+	lockdep_assert_held(&chan->vc.lock);
 
 	axi_chan_disable(chan);
 
@@ -1083,7 +1083,7 @@ static noinline void axi_chan_handle_err(struct axi_dma_chan *chan, u32 status)
 	if (!vd) {
 		dev_err(vchan_chan_dev(&chan->vc), "BUG: %s, IRQ with no descriptors\n",
 			axi_chan_name(chan));
-		goto out;
+		return;
 	}
 	/* Remove the completed descriptor from issued list */
 	list_del(&vd->node);
@@ -1100,9 +1100,6 @@ static noinline void axi_chan_handle_err(struct axi_dma_chan *chan, u32 status)
 	chan->desc = NULL;
 	chan->cyclic_restart = false;
 	axi_chan_start_first_queued(chan);
-
-out:
-	spin_unlock_irqrestore(&chan->vc.lock, flags);
 }
 
 static void axi_chan_block_xfer_complete(struct axi_dma_chan *chan)
@@ -1111,11 +1108,11 @@ static void axi_chan_block_xfer_complete(struct axi_dma_chan *chan)
 	struct axi_dma_hw_desc *hw_desc;
 	struct axi_dma_desc *desc;
 	struct virt_dma_desc *vd;
-	unsigned long flags;
 	u64 llp;
 	int i;
 
-	spin_lock_irqsave(&chan->vc.lock, flags);
+	lockdep_assert_held(&chan->vc.lock);
+
 	if (unlikely(axi_chan_is_hw_enable(chan))) {
 		dev_err(vchan_chan_dev(&chan->vc), "BUG: %s caught DWAXIDMAC_IRQ_DMA_TRF, but channel not idle!\n",
 			axi_chan_name(chan));
@@ -1127,7 +1124,7 @@ static void axi_chan_block_xfer_complete(struct axi_dma_chan *chan)
 	if (!vd) {
 		dev_err(vchan_chan_dev(&chan->vc), "BUG: %s, IRQ with no descriptors\n",
 			axi_chan_name(chan));
-		goto out;
+		return;
 	}
 
 	desc = vd_to_axi_desc(vd);
@@ -1159,9 +1156,6 @@ static void axi_chan_block_xfer_complete(struct axi_dma_chan *chan)
 		chan->desc = NULL;
 		axi_chan_start_first_queued(chan);
 	}
-
-out:
-	spin_unlock_irqrestore(&chan->vc.lock, flags);
 }
 
 static irqreturn_t dw_axi_dma_interrupt(int irq, void *dev_id)
@@ -1169,6 +1163,7 @@ static irqreturn_t dw_axi_dma_interrupt(int irq, void *dev_id)
 	struct axi_dma_chip *chip = dev_id;
 	struct dw_axi_dma *dw = chip->dw;
 	struct axi_dma_chan *chan;
+	unsigned long flags;
 
 	u32 status, i;
 
@@ -1178,6 +1173,7 @@ static irqreturn_t dw_axi_dma_interrupt(int irq, void *dev_id)
 	/* Poll, clear and process every channel interrupt status */
 	for (i = 0; i < dw->hdata->nr_channels; i++) {
 		chan = &dw->chan[i];
+		spin_lock_irqsave(&chan->vc.lock, flags);
 		status = axi_chan_irq_read(chan);
 		/* Leave suspension status for the pause and resume paths. */
 		status &= ~DWAXIDMAC_IRQ_SUSPENDED;
@@ -1190,6 +1186,7 @@ static irqreturn_t dw_axi_dma_interrupt(int irq, void *dev_id)
 			axi_chan_handle_err(chan, status);
 		else if (status & DWAXIDMAC_IRQ_DMA_TRF)
 			axi_chan_block_xfer_complete(chan);
+		spin_unlock_irqrestore(&chan->vc.lock, flags);
 	}
 
 	/* Re-enable interrupts */
@@ -1220,7 +1217,7 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
 
 		vchan_terminate_all(&chan->vc);
 
-		axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
+		axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_ALL);
 		chan->desc = NULL;
 		chan->pause_requested = false;
 		chan->is_paused = false;
@@ -1600,10 +1597,6 @@ static int dw_probe(struct platform_device *pdev)
 	if (!dw->chan)
 		return -ENOMEM;
 
-	ret = axi_req_irqs(pdev, chip);
-	if (ret)
-		return ret;
-
 	INIT_LIST_HEAD(&dw->dma.channels);
 	for (i = 0; i < hdata->nr_channels; i++) {
 		struct axi_dma_chan *chan = &dw->chan[i];
@@ -1617,6 +1610,10 @@ static int dw_probe(struct platform_device *pdev)
 		vchan_init(&chan->vc, &dw->dma);
 	}
 
+	ret = axi_req_irqs(pdev, chip);
+	if (ret)
+		return ret;
+
 	/* Set capabilities */
 	dma_cap_set(DMA_MEMCPY, dw->dma.cap_mask);
 	dma_cap_set(DMA_SLAVE, dw->dma.cap_mask);

-- 
2.53.0

