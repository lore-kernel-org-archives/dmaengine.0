Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519A75372DB;
	Tue, 22 Sep 2026 23:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790119867; cv=none; b=s7CV/9a8qoj0808BgooByRHOzLRG7G+FghJeFzb1cRWHlZF8AyIkj70oq4B3OFkQl6IiJ54r+FVQ3Tmcf0+6rhHb72ywTPxX1PZkOKlSx4/pqlJl9ydEBJoZ1Ftj7rXh0wG/SAW33Ww1fu1a79QbL6wNXaqMUeJEVDcxPwPWWhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790119867; c=relaxed/simple;
	bh=3eualWqeWEeGQYJHhM43PRWUBto5oGkEeIobsGHx0jc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y6aHGmyX2wcDvIsyJStS4IrPaZqfk2QoHp0VNvG6LAohB/Fz2iUYHwAW6hz3ZEDgne83Tk5/E7FNyjBFsbNJp+kvRgLVJ56qbmnQ47uWBiaDOmUWTcE27nAXWPovuBIzD5SD1AuPar0lomHQqcME/+mtVMcW2YuOCZ1UU9NdvuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=csOh2ECK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="csOh2ECK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE2E71F000FF;
	Tue, 22 Sep 2026 23:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790119865;
	bh=nQpfxlWaJ47IrTsYMS2zdQkxTkP9Nxnh+AnElYRmiJs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=csOh2ECKiZ/PjUZG3/l3O46swec+Llv/34sxriiE5O9w3/fRxdZu9wwUKi/qWibpA
	 d/aln/XfbZP5sZhlfOw2CD4TMlNV9t30QoDOl/SmGB1pbhQ8XGF92QyxrS30QwJKWo
	 wFvYrRHUdHpb3IIR+hNYG28NHsM3j9pQ443THvSSLmd7GWRkfw/AbJ7WsJ5vozmBjV
	 +t60Vs9KfULgZ8rTgAeyqbGY+oQFlSzYI6/DvwR8/Xwuzwu77XkKF513LPXtQnE9OZ
	 1qbqc26t81TVJSMNQK7N87Y4t3lGI/y4NwRRp/HaF6Eu2ezxFth5gtaGylD0GDP9ui
	 10unFVCxu0t2w==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 23 Sep 2026 01:30:53 +0200
Subject: [PATCH v5 08/23] dmaengine: ste_dma40: Return IRQ_NONE when no
 interrupt is pending
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-dma40-fixes-v5-8-709d160cde76@kernel.org>
References: <20260923-dma40-fixes-v5-0-709d160cde76@kernel.org>
In-Reply-To: <20260923-dma40-fixes-v5-0-709d160cde76@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

d40_handle_interrupt() returns IRQ_HANDLED even when no terminal-count or
error status bit is pending.

IRQ_NONE is not only used to identify a device on a shared interrupt.
The generic IRQ core also counts it as unhandled for spurious IRQ
detection. DMA40 does not request this IRQ with IRQF_SHARED, so interrupt
sharing is not the purpose of this change.

If the line remains asserted without matching DMA40 status, returning
IRQ_HANDLED hides the stuck interrupt and can leave the CPU servicing it
indefinitely. Track whether any DMA40 status is pending and return IRQ_NONE
when none is present, allowing the generic IRQ core to diagnose and
eventually disable the faulty line.

DMA40 channels can be owned by other SoC cores. Their status means that
the interrupt is real, but Linux must not acknowledge it. Treat foreign
status as handled and leave its acknowledgment to the owning core, while
acknowledging and dispatching only registered Linux channels.

Fixes: 8d318a50b3d7 ("DMAENGINE: Support for ST-Ericssons DMA40 block v3")
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 9e8879e3e8d1..0c3f837fe586 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -1819,6 +1819,7 @@ static void dma_tasklet(struct tasklet_struct *t)
 
 static irqreturn_t d40_handle_interrupt(int irq, void *data)
 {
+	irqreturn_t handled = IRQ_NONE;
 	int i;
 	u32 idx;
 	u32 row;
@@ -1852,6 +1853,12 @@ static irqreturn_t d40_handle_interrupt(int irq, void *data)
 		row = chan / BITS_PER_LONG;
 		idx = chan & (BITS_PER_LONG - 1);
 
+		/*
+		 * Status for a channel owned by another core still explains
+		 * the interrupt, but only ACK Linux-owned channels below.
+		 */
+		handled = IRQ_HANDLED;
+
 		if (il[row].offset == D40_PHY_CHAN)
 			d40c = base->lookup_phy_chans[idx];
 		else
@@ -1884,7 +1891,7 @@ static irqreturn_t d40_handle_interrupt(int irq, void *data)
 	if (ret > 0)
 		pm_runtime_put_autosuspend(base->dev);
 
-	return IRQ_HANDLED;
+	return handled;
 }
 
 static int d40_validate_conf(struct d40_chan *d40c,

-- 
2.55.0

