Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6918037DAC0;
	Sun, 20 Sep 2026 18:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789930797; cv=none; b=jdm3uwc/zY7/jqOwk9YU+7x7BchRQGHbiIhbCyi3+PlWTlece0oRoYP7TQPWWBpECkx3KqyeIj7xnS5ylaRsOj5MOGgeqQqKaOXbkGvtxg8WddwFE41MeqXGx5D1/OgSn28D/5tqWuHXoqU716YmA3R30fB7LE7sRsshBLc9gR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789930797; c=relaxed/simple;
	bh=isNS3tgfOhzGilN9kESx64+fVU8IirIhLMBOk5JxcQE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FkNqrl3xuXkTC19juUv/WGnm0oulC+UUQTBr/0z0+rP72JtndeFDRvZdC6rBZWxesgoeJQrP/Ah6NlZw0t3j9Zt9SjjTSafwXYvuKoGjDxZf2Da4c8TSdjB1HwVyQHiQIXtZgJ5SiqJBn6A99EbOFCdjW4nTHgvK/dFXKVv/3MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X9vLT+Y+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X9vLT+Y+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08E321F00893;
	Sun, 20 Sep 2026 18:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789930796;
	bh=ISLmLQX0o5Q+fFEs03rCVSIAu20v5XrKThHzcZX+Jg8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=X9vLT+Y+/7ZbtSnPdvzY0Dm3y8SDjJSRM0ITYLgH2RsW2pB9QWeiUkEZGkIPmEZgV
	 +bq9idXWeb42xvVoz52z6gwVNoTac78Vj9iRkue9WLu1pcQgJ412fu2ip6djzMGtkQ
	 5K0Hb5WaQLeTaG+0ZV0MD1FN4/RhLwGt60pTTIaD13iqxFKq/hI5xCMkO1TfT55mI1
	 eONu51h5PAQs2eQnBd5BjxXxGsvdbpKtmwMFqr/U0mkHHH+A2yRL+1BpEwVcmOM48V
	 mneDFZBsnfd+CMYj0dbu9M+1FwyyAdJ1Tl4UxFjubIcZG4iDYlaM15cmW1cpsmU0VW
	 qzrVobAaaNL3A==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 20 Sep 2026 20:59:43 +0200
Subject: [PATCH v5 08/23] dmaengine: ste_dma40: Return IRQ_NONE without
 interrupt status
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-dma40-fixes-v5-8-5c55cd7f92f9@kernel.org>
References: <20260920-dma40-fixes-v5-0-5c55cd7f92f9@kernel.org>
In-Reply-To: <20260920-dma40-fixes-v5-0-5c55cd7f92f9@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

d40_handle_interrupt() returns IRQ_HANDLED even when no terminal-count or
error status bit is set. If the line remains asserted without matching
status, reporting it as handled prevents the generic interrupt code from
detecting the stuck interrupt.

Track whether the handler observes any DMA40 status. Return IRQ_NONE only
when none is present, allowing the generic spurious interrupt detector to
disable a faulty status-less interrupt line.

DMA40 channels can be owned by other SoC cores. Their status still explains
why the interrupt fired, but Linux must not acknowledge it. Treat foreign
status as handled and leave its acknowledgment to the owning core, while
acknowledging and dispatching only registered Linux channels.

Fixes: 8d318a50b3d7 ("DMAENGINE: Support for ST-Ericssons DMA40 block v3")
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index bb052d3028cc..4380f9a1b035 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -1807,6 +1807,7 @@ static void dma_tasklet(struct tasklet_struct *t)
 
 static irqreturn_t d40_handle_interrupt(int irq, void *data)
 {
+	irqreturn_t handled = IRQ_NONE;
 	int i;
 	u32 idx;
 	u32 row;
@@ -1840,6 +1841,12 @@ static irqreturn_t d40_handle_interrupt(int irq, void *data)
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
@@ -1872,7 +1879,7 @@ static irqreturn_t d40_handle_interrupt(int irq, void *data)
 	if (ret > 0)
 		pm_runtime_put_autosuspend(base->dev);
 
-	return IRQ_HANDLED;
+	return handled;
 }
 
 static int d40_validate_conf(struct d40_chan *d40c,

-- 
2.55.0

