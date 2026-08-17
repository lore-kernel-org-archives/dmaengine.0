Received: from fsn-vps-1.bereza.email (fsn-vps-1.bereza.email [162.55.44.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1763E3142;
	Mon, 17 Aug 2026 09:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.55.44.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786959040; cv=none; b=XaaGcw3llLBWRTvJZArfe+8PuSi7w5lXTiJH5BVgh7yZKWr8CvIplA5ga1ip7Jke+VjFhnUnw+6+kW6nSICKSUaJ8qhR1nmIaRO/KUF2s0X4khSBHVqWtTnjfcl+heaGqle/CXvpQnnJ4KkBeapB/zVLrmkh4f/AY6VSO8L+swA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786959040; c=relaxed/simple;
	bh=PXTc+4SpRoVNyuwYVp+0QlMWXywXx28HywPyEUqB3S0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Pmo/aCgRsu3HR4osvy1pYuLvxRKqw6kwGkP8/rcbtDjYFfOzMK78pemuCMf3kQYCpEpqxRheSuMsyteuWJno/OY1SVZjy0Yt2yQB4AVL02Dc7OldEAdqwdzv8SuHkGVvQOaExMECbFZlnKQpHgw2sfkz5i+ctT6jMvxntqFh/Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bereza.email; spf=pass smtp.mailfrom=bereza.email; dkim=pass (2048-bit key) header.d=bereza.email header.i=@bereza.email header.b=p6jGhXET; arc=none smtp.client-ip=162.55.44.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bereza.email
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bereza.email
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bereza.email header.i=@bereza.email header.b="p6jGhXET"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bereza.email; s=mail;
	t=1786958636; bh=PXTc+4SpRoVNyuwYVp+0QlMWXywXx28HywPyEUqB3S0=;
	h=From:Date:Subject:To:Cc:From;
	b=p6jGhXETMS1cRTppbmuMT4buwFB6COIuAw5xsqHLgZNP+M8GgSHBCBQ5u7771dwE3
	 y4bcYKeToxI/QSQfL0cK3pUJuFsCjhQdk92s7aGxwcW/6SL+WzU6yZ8eQq9ffusYy2
	 QVMn7u+iZHo6NzWxLhcJPPS80upW6QTpoEryPOwwAFAIdcwjrb+T1niBggj1sYiVid
	 7XLvy/h7VOyhrkwrEqMEoYvXCZFRvhiwKyMcB3kmgvvbqpKQB1SCqAMbm/DpVRsPyn
	 A6noeMbP74wjTsTWGQ/b+Xx/4XUb2AwlEc2Yob8yNSaotCTwYC8z1tl68LD+G3odwa
	 SJD0xvIuX6Tlg==
Received: from [127.0.1.1] (pd95bbad8.dip0.t-ipconnect.de [217.91.186.216])
	by fsn-vps-1.bereza.email (Postfix) with ESMTPSA id 0162360279;
	Mon, 17 Aug 2026 11:23:55 +0200 (CEST)
From: Alex Bereza <alex@bereza.email>
Date: Mon, 17 Aug 2026 11:23:55 +0200
Subject: [PATCH] dmaengine: xilinx_dma: Fix hardware buffer descriptor
 reuse order
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260817-fix-hw-buf-desc-reuse-v1-1-d79827a844c7@bereza.email>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQ6CMBCE4Vche2aTtgQBX4V4sGWQ9QCmS5WE8
 O5UPX7JzL+TIgqUrsVOEW9RWeYMWxYUpvv8AMuQTc64i2ltw6NsPH3Yp5EHaOCIpGDfVAYdjLN
 tTfn7isjDX7e//a3JPxHWb4yO4wTNuhjWeQAAAA==
X-Change-ID: 20260817-fix-hw-buf-desc-reuse-b730e9e02185
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Michal Simek <michal.simek@amd.com>, 
 Kedareswara rao Appana <appana.durga.rao@xilinx.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Alex Bereza <alex@bereza.email>
X-Mailer: b4 0.16.0

xilinx_dma_alloc_chan_resources() builds a static ring of hardware
buffer descriptors once and the driver uses this ring throughout the
lifetime of a channel. This requires the allocation order of hardware
buffer descriptors from chan->free_seg_list to stay in sync with the
hardware buffer descriptor ring built at channel allocation time by
returning oldest descriptors to chan->free_seg_list first.

When chan->pending_list is not empty e.g. during
xilinx_dma_terminate_all() the chan->free_seg_list and the order of the
static hardware buffer descriptor ring get out of sync. Descriptors age
in this order: pending -> active -> done. So freeing pending_list first
returns the newest buffer descriptors to the chan->free_seg_list first
and thus breaks the order required by the static hardware buffer
descriptor ring. Then when the channel is reused, after a wrap around of
the free_seg_list the DMA will find a hardware buffer descriptor with a
length field that is still zeroed and stop with something like this:

  xilinx-vdma 86000000.dma: Channel 000000003a21d7b8 has errors 10, cdr 6de4c000 tdr 6de4c000

After this no more descriptors are completed and a consumer potentially
blocks and waits forever. The only way to get out of this error state is
to rebuild the static hardware buffer descriptor ring and the
free_seg_list by releasing and re-acquiring the channel.

Fix the order in which hardware buffer descriptors are returned to
free_seg_list to ensure the mentioned requirement holds.

Fixes: 23059408b6a3 ("dmaengine: xilinx_dma: Fix race condition in the driver for multiple descriptor scenario")
Signed-off-by: Alex Bereza <alex@bereza.email>
---
 drivers/dma/xilinx/xilinx_dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index bef2b031dba1..0817b74f7450 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -920,9 +920,9 @@ static void xilinx_dma_free_descriptors(struct xilinx_dma_chan *chan)
 
 	spin_lock_irqsave(&chan->lock, flags);
 
-	xilinx_dma_free_desc_list(chan, &chan->pending_list);
 	xilinx_dma_free_desc_list(chan, &chan->done_list);
 	xilinx_dma_free_desc_list(chan, &chan->active_list);
+	xilinx_dma_free_desc_list(chan, &chan->pending_list);
 
 	spin_unlock_irqrestore(&chan->lock, flags);
 }

---
base-commit: 0d995da5fb97e8c312834575604d4423eb6225b7
change-id: 20260817-fix-hw-buf-desc-reuse-b730e9e02185

Best regards,
--  
Alex Bereza <alex@bereza.email>

