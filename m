Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794808886;
	b=euMP12Ct+q014z1Klod+izaq799qa/3aJbWORB65jqLQ8OHG0vo+UZlpiIHovlJBVi1i
	 HLS0oW6gjDPMW9Avf5vr19swiNP34+6qJ67zmJVU0eyRe1E+KNifft/MTOBmdFYLNJozS
	 roTgHxBDJ6HNrcuxVTZkZJJ3gOj8rhm6LYIMRlpyQBphn5QrDqYdmUaUlmMp3fX5nxZrL
	 LzbFhbhugNxsgZ8YRxFXRbynaapRXag1yM7qlxxKgz31lAu7GdZzHRzUgmYwY4nNn50WE
	 1hSWDEmRSyvrsQOy+LWkoIfqCqIvIFk2c9PcxpB4iC/4X+RoCuF9y3YE0fbAO8RpJbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794808886;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=fVtERnt1yagTDveFZiJK9CUhtwDO+IK5KagdoU7rqog=;
	b=oLR3O7D1APNEaHNdAR6rASB1Z61sHHsg2sSz2SaodgasT7swew5IRacg3h2MwcoWXaxo
	 oFZS+oiwWLA5HboXP623L0IUid723scaaeXiDCYdbMKKQmf//iuWfCO7aTRPXh94Sq7Pu
	 FYlE4FdJH9Di4FI050pYi32D1AKug8FsV9x0AORt5Kr1KlOJDXvYAYu6+DWtrl9YBBZBV
	 Q9rNxqQx0K3LrX/yz5+TlP2uAZXIzQfEnM5EixLXsDHl2ldd4yUfk9USP3ikNPpneAghv
	 +35SGPX+rrjR662TmI8aAgW+VoHyaLlT+e9sMQbN83I37AZtrk8ytBhHLoAs71GtcbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LmSqTiC4;
	arc=none smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688AC60A2623
	for <dmaengine@vger.kernel.org>; Mon, 16 Nov 2026 06:01:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 688AC60A2623
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LmSqTiC4
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-862b3938d98so547416a34.3
        for <dmaengine@vger.kernel.org>; Sun, 15 Nov 2026 22:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794808885; x=1795413685; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fVtERnt1yagTDveFZiJK9CUhtwDO+IK5KagdoU7rqog=;
        b=LmSqTiC4cska9/oQc3Wi5LiRvFjSaeINLbN+YU1JT9Ek6gWr4lar7DQOkNCLDqXyjc
         mwqbVO3wfQjfAgDwWLPY7GjIpmW7KkPIK4Vbkch2A+JSDmJOdNUEz9TTSmPgemu/NY9r
         T0Obk53A5k5rTVXnvgf5bKQl009BLwzHjV+G/pqccD9YsbBGcxLPsUpAqEa15j84eTMu
         0+3b0Eg5vpJwTorVFruQKBfLVlWlnNIUa6Pil9xsV1MqAnbe/53gM0Y/ZhkHgHkOVQRf
         ouEBpdJOuCq8qM88k1hQWjwDAOu5znqvNl91n4dnNHnAn2JVJFdCz9TsKdKWgh7UBsGy
         F2ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794808885; x=1795413685;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fVtERnt1yagTDveFZiJK9CUhtwDO+IK5KagdoU7rqog=;
        b=09LKWQDVB1uXHEYvWewQYxGY9wQ+QM9TGlCWjhzRrDRdgTWaCu7ZN0KeCZFTTPtLwz
         vTARbXQqYH/BCKBL8njujfRw7gPUVkSNQGSfDuJpYxYxVdN6nzUoA2gLgx9dLlaXjGyi
         /wJOzAHfqRHl9SB8yaVxY0Kq1zO0BnlLF9DLnDes6P0GYGTlGKinlx+F0erVxZwF6zqU
         qzlZkRX90eavlHqgOEf09SsMd5ID/bqQydrQkdU/e8w8Zp8N1/vE5liaQoUrsBs3fX1q
         g3xiAnU4PjyFkVe1jc5Vvm0lECxQkPBDVhJnb2XNEY5HgJaDbHV6nhZg5+yW0sn6gHZp
         fZrg==
X-Forwarded-Encrypted: i=1; AL+hErHx6K9CDIUUfVMnMb+iTq1AaDsXOI3Z1v6UA2MzelHp+mdd9psRu0C4nLILYUM8n6PLR/IZ3Gldc64=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0X3BWI2fXuazjv0Tdni/Xa7sNtYSKDC37S7MSqc63Kdq/c+NI
	VLtR3nUXlsoe5Qnl4b3hhRdtE6HrlcFkcP2o0Ok4sJhWQmQEnmGzVwoL
X-Gm-Gg: AYBFou3NwLZHk6kojjcov447tfJsMxbELnbLronlWtg2R8+yUlc/67kse5EsnCssuAU
	1lss4hXk7enflAR+BNY6ER9+NUrLQyV9YVD1YPO/MNOF4kx6DhOdAnO1gkhRjemGcErIOoqjScT
	FXXpvTnz/EoxC76QLeJj+wMUgLOEijx2pcouoWpExXnOXRoVRFatzWM4KC+PqFYRegg6yYvXP9y
	UzAYY4vgq+LKLIuyX6v7xEsuAdUR+0L7kB4aKoiYgaHv1g8Lo1Gef28WqX8EczlSw+D9yaTPws6
	qsoAdhgzo0/y9H4qpLr3YFb3pmwvAe5eS2XK+tXeWvVNebt1Xr70i+anhkSQ0nZzdWUlb3e8vS4
	FJv7H7FigTTmyKCu7fXcVUVu1iCBAVVVtqFcB6QMiP7yu2eUbBk5s4UDoqmzq+zeVBApdtVt7S6
	0/sw2G4iTlgaUSQ4z0fGbsklqVrvCFrPGr4Qj+IJmWV4hh4TFtcRIU6PN62YRppahTv73GVHAoJ
	ptaW/DRVc9AD7t6IQth2wtG2KOklvUsAD+THEjfFa0o9fmnMRAyB+Drn8H29gtMn6yEcGnK6W7w
	undguVGFi+Y3OoHoWz/uykCrVuTgNZkbfb7KqogrlcZx5MSHi7ItvxTLjrIBi7k88hwe7yaDhrH
	RaxYlj57bkpcFTHbuMyEazsR+Q7oVzv81b78uwf3b9qkBYIsSdOEIrC2YVnUthZyS1FkRb8NEsg
	nVSRSlScC8x/xVu0VTNrD15aEOwxHCIRMk7DY7BBubsh4h8dDsQWw=
X-Received: by 2002:a05:6820:3404:10b0:6cd:3ffc:acf7 with SMTP id 006d021491bc7-71ab50916f1mr3874435eaf.71.1794808885251;
        Sun, 15 Nov 2026 22:01:25 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862881a965esm9375160a34.25.2026.11.15.22.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:01:24 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:00:48 -0700
Subject: [PATCH v6 7/7] dmaengine: dw-axi-dmac: serialize interrupt status
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
Message-Id: <20261115-submit-dw-axi-dma-stop-pause-v1-v6-7-bcb23d1e7029@gmail.com>
References: <20261115-submit-dw-axi-dma-stop-pause-v1-v6-0-bcb23d1e7029@gmail.com>
In-Reply-To: <20261115-submit-dw-axi-dma-stop-pause-v1-v6-0-bcb23d1e7029@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sergey Khimich <serghox@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>
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
index 97098367535f..0116c44d3bef 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -20,6 +20,7 @@
 #include <linux/iopoll.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/kernel.h>
+#include <linux/lockdep.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_dma.h>
@@ -1071,9 +1072,8 @@ static void axi_chan_list_dump_lli(struct axi_dma_chan *chan,
 static noinline void axi_chan_handle_err(struct axi_dma_chan *chan, u32 status)
 {
 	struct virt_dma_desc *vd;
-	unsigned long flags;
 
-	spin_lock_irqsave(&chan->vc.lock, flags);
+	lockdep_assert_held(&chan->vc.lock);
 
 	axi_chan_disable(chan);
 
@@ -1082,7 +1082,7 @@ static noinline void axi_chan_handle_err(struct axi_dma_chan *chan, u32 status)
 	if (!vd) {
 		dev_err(vchan_chan_dev(&chan->vc), "BUG: %s, IRQ with no descriptors\n",
 			axi_chan_name(chan));
-		goto out;
+		return;
 	}
 	/* Remove the completed descriptor from issued list */
 	list_del(&vd->node);
@@ -1099,9 +1099,6 @@ static noinline void axi_chan_handle_err(struct axi_dma_chan *chan, u32 status)
 	chan->desc = NULL;
 	chan->cyclic_restart = false;
 	axi_chan_start_first_queued(chan);
-
-out:
-	spin_unlock_irqrestore(&chan->vc.lock, flags);
 }
 
 static void axi_chan_block_xfer_complete(struct axi_dma_chan *chan)
@@ -1110,11 +1107,11 @@ static void axi_chan_block_xfer_complete(struct axi_dma_chan *chan)
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
@@ -1126,7 +1123,7 @@ static void axi_chan_block_xfer_complete(struct axi_dma_chan *chan)
 	if (!vd) {
 		dev_err(vchan_chan_dev(&chan->vc), "BUG: %s, IRQ with no descriptors\n",
 			axi_chan_name(chan));
-		goto out;
+		return;
 	}
 
 	desc = vd_to_axi_desc(vd);
@@ -1158,9 +1155,6 @@ static void axi_chan_block_xfer_complete(struct axi_dma_chan *chan)
 		chan->desc = NULL;
 		axi_chan_start_first_queued(chan);
 	}
-
-out:
-	spin_unlock_irqrestore(&chan->vc.lock, flags);
 }
 
 static irqreturn_t dw_axi_dma_interrupt(int irq, void *dev_id)
@@ -1168,6 +1162,7 @@ static irqreturn_t dw_axi_dma_interrupt(int irq, void *dev_id)
 	struct axi_dma_chip *chip = dev_id;
 	struct dw_axi_dma *dw = chip->dw;
 	struct axi_dma_chan *chan;
+	unsigned long flags;
 
 	u32 status, i;
 
@@ -1177,6 +1172,7 @@ static irqreturn_t dw_axi_dma_interrupt(int irq, void *dev_id)
 	/* Poll, clear and process every channel interrupt status */
 	for (i = 0; i < dw->hdata->nr_channels; i++) {
 		chan = &dw->chan[i];
+		spin_lock_irqsave(&chan->vc.lock, flags);
 		status = axi_chan_irq_read(chan);
 		/* Leave suspension status for the pause and resume paths. */
 		status &= ~DWAXIDMAC_IRQ_SUSPENDED;
@@ -1189,6 +1185,7 @@ static irqreturn_t dw_axi_dma_interrupt(int irq, void *dev_id)
 			axi_chan_handle_err(chan, status);
 		else if (status & DWAXIDMAC_IRQ_DMA_TRF)
 			axi_chan_block_xfer_complete(chan);
+		spin_unlock_irqrestore(&chan->vc.lock, flags);
 	}
 
 	/* Re-enable interrupts */
@@ -1225,7 +1222,7 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
 
 	vchan_terminate_all(&chan->vc);
 
-	axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
+	axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_ALL);
 	chan->desc = NULL;
 	chan->pause_requested = false;
 	chan->is_paused = false;
@@ -1599,10 +1596,6 @@ static int dw_probe(struct platform_device *pdev)
 	if (!dw->chan)
 		return -ENOMEM;
 
-	ret = axi_req_irqs(pdev, chip);
-	if (ret)
-		return ret;
-
 	INIT_LIST_HEAD(&dw->dma.channels);
 	for (i = 0; i < hdata->nr_channels; i++) {
 		struct axi_dma_chan *chan = &dw->chan[i];
@@ -1616,6 +1609,10 @@ static int dw_probe(struct platform_device *pdev)
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

