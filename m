Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.136.65.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795593338;
	b=tEg7lWpM+DP8LN8X68NyG9kaX3Km7UbuhcvDBgKhKXayoLuJtVtIuvQs415haXiRvZHX
	 OFfajjchVu0+J6InLQS/K+BsrFGn97SIsDllwCzIXlQGO+QFmFVYF0j3hu98OY1OcRnnQ
	 kkBSwlNII7JsHFDGBTlheEcQx0w9l242kGuTZP6525Tx7lQ56+qYxujWpQ6gfbxw+0A13
	 W1ftha8XygqQ4b5t1uURpEFEEvFDN/OCHejE4ghQJaG52jTTWP18RR1IZeGVn/rSdkLVq
	 gB/88fJBj/34p7Q4e37hyzu8L/lJY+IeV5YIpaIlpDvJ7Yfa8n+yTFz9s6B69/4nxpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795593338;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding:
	 X-Flowmailer-Platform:Feedback-ID;
	bh=3TTqrvGLbHBqP1YUi+0AwZv0HDH1EAefXi4rL26IN/M=;
	b=Vk/fzLoamDVrJndnlSYYgDX1/2zaFHpX4BNzh59o6ZsChEQzPcr/a2OUl2TeKQby31jT
	 3ZLDhHonDSQ9XhtHitCj6wgJHbrtIBRGKxYIRYEISpiIDNLl9yo2tSGde5sp4YJs7JRw9
	 gTF0tenWGDRrmMs4yZkRW5D+4U744UVQH1b4RNxBqk3VQKaUzBH8Xiedp/JVI8RGQlppO
	 FPNJ+4m5n8vNj80JlyvAM+52sMj6tK/p2uVGBiujgHe8f1EXR8YPnhg5EBkle0FYWeCHb
	 o+LEncI6ccCofZ9cuubbTmyPLJJeMglCr8b/hK18IlZzCYc1rQgzZvbq+jHjzP/MLMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siemens.com;
	spf=pass smtp.mailfrom=rts-flowmailer.siemens.com;
	dkim=pass header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.a=rsa-sha256 header.s=fm1 header.b=CaU98iu4;
	arc=none smtp.remote-ip=185.136.65.227
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE8F606A321
	for <dmaengine@vger.kernel.org>; Wed, 25 Nov 2026 07:55:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAE8F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.a=rsa-sha256 header.s=fm1 header.b=CaU98iu4
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20261125075533d8b0d389f80002075b
        for <dmaengine@vger.kernel.org>;
        Wed, 25 Nov 2026 08:55:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=3TTqrvGLbHBqP1YUi+0AwZv0HDH1EAefXi4rL26IN/M=;
 b=CaU98iu43HqPZNX0crdrW46aUtVYj1nHLjiZybZl/O0QcL6ZB6Myf+wOvKDNEnnuYkPaUS
 UC/jU6rNuIj5oTX1JIGyHV9Zdy6qqtN0G/rcAAoLRhEoHk9EzHHVxEb1/aXaAPOL0DTFHvY3
 4yBLH1jG8KSuUajSVkJL/OQ6LInFTvU2z7LR6428FFaEJDrUDe+mLaMDyfd+iYTqpoHcBEKJ
 qucrpJd0MhS0oQwpcHDRDHCGIYI4sB0mC53dIBIxU5PQeIyqG2UWM5n33EeaRsuFW9nwW1yY
 tEfa90ek8tVmM+4imomLlBFZRmF5U11ggevnBBb4GXtrGEpAFmXtZUAQ==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: dmaengine@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Frank Li <Frank.Li@nxp.com>,
	Vinod Koul <vkoul@kernel.org>,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Alessandro Zini <alessandro.zini@siemens.com>
Subject: [PATCH] dmaengine: fsl-edma: don't call pm_runtime_allow() from terminate_all()
Date: Wed, 25 Nov 2026 08:55:17 +0100
Message-ID: <20261125075525.2640884-1-alexander.sverdlin@siemens.com>
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
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

fsl_edma_terminate_all() may be called from atomic context via
dmaengine_terminate_async(), which the dmaengine API explicitly allows
(Documentation/driver-api/dmaengine/client.rst). pm_runtime_allow() must
not be called from there, because it uses unconditional
spin_{un,}lock_irq() and therefore re-enables interrupts.

Calling dmaengine_terminate_async() from a UART interrupt handler on an
i.MX8QXP triggers:

  DEBUG_LOCKS_WARN_ON(lockdep_hardirq_context())
  WARNING: CPU: 0 PID: 0 at kernel/locking/lockdep.c:4404 lockdep_hardirqs_on_prepare+0x1a8/0x210
  Call trace:
   lockdep_hardirqs_on_prepare+0x1a8/0x210 (P)
   trace_hardirqs_on+0x58/0xf8
   _raw_spin_unlock_irq+0x38/0x80
   pm_runtime_allow+0x34/0x140
   fsl_edma_terminate_all+0x1d0/0x1e0
   ...

followed by the IRQ core warning that the handler enabled interrupts
(kernel/irq/handle.c). Both warnings are one-shot, so this is only
visible once per boot.

In-tree, fsl_lpuart's lpuart_flush_buffer() calls
dmaengine_terminate_async() with the port lock held and interrupts
disabled, so the port interrupt can then deadlock on that lock.

The call has no counterpart: pm_runtime_forbid() is never called in
fsl-edma, so runtime_auto is always already true and pm_runtime_allow()
does nothing except the illegal unlock. Just remove it.

Fixes: 72f5801a4e2b ("dmaengine: fsl-edma: integrate v3 support")
Cc: stable@vger.kernel.org
Co-developed-by: Alessandro Zini <alessandro.zini@siemens.com>
Signed-off-by: Alessandro Zini <alessandro.zini@siemens.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
 drivers/dma/fsl-edma-common.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/dma/fsl-edma-common.c b/drivers/dma/fsl-edma-common.c
index 513b0f4e5be21..1f1f5fb353cc8 100644
--- a/drivers/dma/fsl-edma-common.c
+++ b/drivers/dma/fsl-edma-common.c
@@ -10,7 +10,6 @@
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/dma-mapping.h>
-#include <linux/pm_runtime.h>
 #include <linux/pm_domain.h>
 
 #include "fsl-edma-common.h"
@@ -274,9 +273,6 @@ int fsl_edma_terminate_all(struct dma_chan *chan)
 	spin_unlock_irqrestore(&fsl_chan->vchan.lock, flags);
 	vchan_dma_desc_free_list(&fsl_chan->vchan, &head);
 
-	if (fsl_edma_drvflags(fsl_chan) & FSL_EDMA_DRV_HAS_PD)
-		pm_runtime_allow(fsl_chan->pd_dev);
-
 	return 0;
 }
 

base-commit: 2e02fb103be058cf8b2fb24112a74a2715e090f0
-- 
2.56.1

