Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9745B44E675;
	Sun, 20 Sep 2026 18:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789930785; cv=none; b=eqfCE2N+aownk+Xrx/x5KV+OHnUgp0PdsYFEIH2FMJ59Vj5xeg8AuRV3fqqiLj+vJp7H4Q8WiMXtWiCqNgZ54JAu4eFXu5rjR7c9QF4BPUe1mxVtrSg/BwaRMbewL0YrsTFmwwfO066Scho8/rEnMCfG4bQB/a5e607TDfMI7E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789930785; c=relaxed/simple;
	bh=6Ew79j6hMvJCjmqap1EEUitXbIbL7CxWBT0atyFYuBg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TQZJSVjrvzTiSxci4IWVSMyVeN6MNVVHP7Ca2a03KdPoc7Z2ovAEGiBpI95vdeh31GWQnOEzPGhV2z90wX7/ZkeJb6z26XmoW70mNz4KW30Z7TktYItXxxrSL1Sm5xFoGazs5oGkE+ck0LMUl8ECHm5wEs7DDZx/5mQzWgzL9b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M9ivyIdi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M9ivyIdi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1794E1F00893;
	Sun, 20 Sep 2026 18:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789930784;
	bh=/09QadBHomxpcxK74miqEkVw76R4Y2u+0IXs891ae5Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=M9ivyIdifavtuMz/kHdmgadMM0pLv29FhK7O07fKUd0s1LIWlPmIPo9Skrv9uOQye
	 g1KhRM9apKeMHCHnho2t2fH+9SqToHrjyl0Yt3rJid/8GfF2GY778+H/xb0sE3z61z
	 LkBv6vW2DVC7qeYfOwtS+YJHUmgBTZXJblL7nPany2IgKkhkt0HxvEEE1d5M3hedWC
	 gEvsetE0tCIwrft/AGq98S9d7vDN+XbzsZSlHb8AuhzLvQyHwosIuguVKlvkUWh7Xk
	 xEmY848z/0BspZXKogOcgGgAC2/5mnX0QKtYw3F7QI5suKW+yzxSUFRNlgW0O1/Sbz
	 Hzx5VmzH7chTw==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 20 Sep 2026 20:59:36 +0200
Subject: [PATCH v5 01/23] dmaengine: ste_dma40: Fix physical cyclic
 capability
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-dma40-fixes-v5-1-5c55cd7f92f9@kernel.org>
References: <20260920-dma40-fixes-v5-0-5c55cd7f92f9@kernel.org>
In-Reply-To: <20260920-dma40-fixes-v5-0-5c55cd7f92f9@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

d40_dmaengine_init() configures dma_both for physical channels that can
handle both slave and memcpy transfers. Physical DMA40 channel setup has
supported cyclic LLIs since cyclic transfer support was added, but the
DMA_CYCLIC capability is set on dma_slave a second time instead of
dma_both.

Set DMA_CYCLIC on dma_both so d40_ops_init() installs
device_prep_dma_cyclic and physical channels advertise cyclic support.

Fixes: 0c842b551063 ("dma40: cyclic xfer support")
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 0d9ffa3e2663..e4d689c9eba8 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -2897,7 +2897,7 @@ static int __init d40_dmaengine_init(struct d40_base *base,
 	dma_cap_zero(base->dma_both.cap_mask);
 	dma_cap_set(DMA_SLAVE, base->dma_both.cap_mask);
 	dma_cap_set(DMA_MEMCPY, base->dma_both.cap_mask);
-	dma_cap_set(DMA_CYCLIC, base->dma_slave.cap_mask);
+	dma_cap_set(DMA_CYCLIC, base->dma_both.cap_mask);
 
 	d40_ops_init(base, &base->dma_both);
 	err = dmaenginem_async_device_register(&base->dma_both);

-- 
2.55.0

