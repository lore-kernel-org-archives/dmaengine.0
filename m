Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794960483;
	b=4SbEpAWFgjR9DG3qudEITTz6LFVo3L5hX6Tf65hcnSElkWd1Sxv6ImP/dGVElK+0UtD7
	 k7zW/3zaSBCkWDBes4HtTNS/2pD1AOv70pDQ7xM797kov3+xuITlHiZNw/J+29jKSTyXu
	 EQah6/yT0eFU4W49NxXU6N/bwAgY0XEAA+EDOgGDTGcw9GtYWgUDZQ/KnqiqsbY2YMb+o
	 vecIj921fLOpg8xitIYuw/qeZdqqcXg+e1L7y6dZ7Z2sZ/5E/zdGgKj3OqJ//Eq1+H6ic
	 vgHfLugOBzeMtsGZWLfMoNKaNOUVvmZKB3JrArlpZtfhTI7i5bs1skSRN7nzwAP5kJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794960483;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=fVtERnt1yagTDveFZiJK9CUhtwDO+IK5KagdoU7rqog=;
	b=wtrZI8Mg4PdM0Z0uiyrfcOyNiJIAvb9kWHaLt9NjaqbsXzuSnu7cB8cVZ+S/EZllvJTB
	 KYRuj8YHvpyZx/dYqyNotB5Kcxsc6wycF9WouCHNm6hIaFfns17qzD4gFCLei9kPYeAQ/
	 aR8ayPa47Ibjb2ao79N5bPEd+lbaMdVuRzz4mxEkxxhiKaeY5AJnvx/K79aMw22edfa+k
	 rMFlKdquF6Tc0W1oTVzVR3CE2AJrbgh7f7rqDBMwLd63BudByMDJ3xQOXHer24EVJiF60
	 ECwCfDKML/34FPzvNYmAotKxVWWssOoYDUx1u3jcF3KG1+wlWPRHLDaECVQBQCe1/Lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Twnn6oHg;
	arc=none smtp.remote-ip=209.85.160.47
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B05606A334
	for <dmaengine@vger.kernel.org>; Wed, 18 Nov 2026 00:08:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85B05606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Twnn6oHg
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-48e2d5a69c4so215072fac.3
        for <dmaengine@vger.kernel.org>; Tue, 17 Nov 2026 16:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794960482; x=1795565282; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fVtERnt1yagTDveFZiJK9CUhtwDO+IK5KagdoU7rqog=;
        b=Twnn6oHgLVr/9lhxumEC2LkQUw+5sp0zsbcRYQJsTybDl4RE7N+asuBKqbuBxXnRV8
         L3bMr1IO/JLbr3UVYAokFpl8l/wHDdPmERgtHFDFCofpniTBag9H5XK7mhmDuIqraX1N
         CtSKhKFVeJbc0iOorbYDWWLifQnxA0Lmk4v/90lZRGo48aoiM2WMmrAO+a19VxoD7f8e
         8sB994kABifSAZHmYawOOPu0UjYpMEVeSCbHTXb9Vjo9ehq123mZ2vryL+WI4llw6GJG
         tYMHNHTOckhsUDTV51s0JS7w9vW1A8yfdFJJbss6Fcrs4ZdZvbySxTJX9aUOWgmNjkIf
         6HrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794960482; x=1795565282;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fVtERnt1yagTDveFZiJK9CUhtwDO+IK5KagdoU7rqog=;
        b=BaO83couqmWjOwyY/dsYgizDZNnUrdVB1ChoVswLGALzdhT0It3NteECZwRvqXtGAX
         RpBcKTdiJ9P/qnjKe4oDJ1yRlivJIoIj+WZS2YDJUMbpai63QY0vfCU5gqmap+r6FeVC
         ExJr9CpFziD0ousFdE+1FqflF9pF/8wEMBXB8/u38BGnW6FXdukpOY/kB9sfAS2wf9CK
         SBCLhepH5uriX7liD295teF4T/CD4aLOyR2Jppnl1uKLPGe/4I9qNoYRFesnIceU+n+W
         nkFfGHUISY/jSDT+7hFp9C0VHwbdWa2U+d5Z2yQ98g5HFQ20G/1R5b9J22QiW+ICE242
         lmZg==
X-Forwarded-Encrypted: i=1; AL+hErGvYYhjiei51LSpTEial7mKaIAl+BIzfxOvM2EaECVlEBUq20wRdlpv7yXvlhHmF+mzMBMzHi594KA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qKDxFaFC5JtvVDpZ+zAAtz67rXSEb1cV7Ht6ciQpxdWdkGOwm
	3kji7myJ+ScIhr4hnePZe6jLH9q7Bz/i2bDIezTaMVKTyf5hUUuNzEcs
X-Gm-Gg: AYBFou1sVc4TOOnMvuSpp/6BBZpGrd8AsuztzbpjtIiB150T0RzZlsNw/I9sqsVlhDk
	s6O5FVUq9AcI1EjZMxLnepIzjSlauoIDSlPXkkICBlqaDj5OIbNYcrFPexTRV0BfvANYN/b76DF
	7UYgOmObrC/Kdb9rRFIgwOrpsvzzH14r9e7FiqVTiLoy04vSGvF67tPkFx33l9ZPVNObQR8AMUM
	WRNKHijtXb+3Y/H5D3vvwMzJGlxOm49TL9vdNxUR5B82mbISuTho4X4BK+pSKCmQejtxCIZeLTk
	K3touRI8lGQhUHem7TgC6my2IHwvSqOfUQKTSSaoQb6EkttTI7/1xwINQ3ERLw2JEQhpOiulMGa
	oD/hhDSk/OFMDsKrrjUcZM8yChO2YBYBaHJdcXY1Ajaoz6EMQVqWx2QiVmd0fD7lkH7TgzgwFnt
	jz32wL9QTIOZo+wJIiX6AoGj4RAq0bRT62tozlN3IbtqcyzklQ1OgCcTMEJ8My3OZCKB114WHgK
	TtTYKKugjczcqTwa7+Ze+AJLvIDE/AzmJolNggjBHZUnhReTYoHoa4GUUEAVUoXoPhfbpYUDnX7
	/EXP60EmkEPMUc3WBiINSucARYPqRBIIztomxIPtwAC0fGzEtu039oOxkbc42WOZccRlHzRATi2
	TZKFWrxTMW4v74SAS8mUnaWrBsi9TRpi4RjKoldXlaGZssBEUnN1F26VKgZT6ZG11sCsf3STh23
	ko5/2a0b6KvG59SKd3wENUx+idOrQslYvVbMA/0rEIcXXQ8Ft19+0=
X-Received: by 2002:a05:6808:3a19:b0:571:d998:332a with SMTP id 5614622812f47-5773e848cfemr1518599b6e.47.1794960482162;
        Tue, 17 Nov 2026 16:08:02 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5777b393d40sm434954b6e.17.2026.11.17.16.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 16:08:01 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 17 Nov 2026 17:07:46 -0700
Subject: [PATCH v7 7/8] dmaengine: dw-axi-dmac: serialize interrupt status
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
Message-Id: <20261117-submit-dw-axi-dma-stop-pause-v1-v7-7-d5f2309afd72@gmail.com>
References: <20261117-submit-dw-axi-dma-stop-pause-v1-v7-0-d5f2309afd72@gmail.com>
In-Reply-To: <20261117-submit-dw-axi-dma-stop-pause-v1-v7-0-d5f2309afd72@gmail.com>
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

