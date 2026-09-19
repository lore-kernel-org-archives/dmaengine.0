Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C8E348C7B;
	Sat, 19 Sep 2026 22:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789856552; cv=none; b=vEFMNysK1yR5UkN3B7dkfLVeqGXBZ6X/6bsOgRioRLBW4elvzql2NyRX5o9v6CWOUGDSQtJqQGlpzlJmzXXQH0TuMXa6P54qcDABN4fPaI6bLYbO0hMBEszxO6a0wDWyAlGPJIC/DuDSRe/yIUfGbufG7uPmpdpUjwi2IQ9Eoh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789856552; c=relaxed/simple;
	bh=zFtjhNwRPwFQXmNR5/jyg0OqBe3s6lCNnPON7mj9Nws=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ST29Rqqa0gf1d4b760uvKqsKWj+vWDcr0IQdd2d7xkA8ESjZL3G9fuob+g5p9uA0YKq0AUd6s/h0CrJJmO8vhosHLnW7X3cLxJ0U3PqXu3G+Z6/Af/kx/Zp0VrA3nGO8y1+1MuGhjitE4xCUvpQy+lBtD2STetNjDrSVt3eoENY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FjUYTWWl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FjUYTWWl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 576FB1F000FF;
	Sat, 19 Sep 2026 22:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789856551;
	bh=5isw4Itoxel5UCZSy8D/om+YaVtxrooxO9h9gu6XEhE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=FjUYTWWlqc0PGu/bYv/wQGTjLThPYbtwR4sIdT30WHthqMxSB++QVXBHnDpeyRs6u
	 3zrGhsz7a7eOzI+zh3Oq1tWwBy7HDv7ODseKTvO277w4HF4mo558BAsyV32ugVrgpL
	 W28/PDiHjxvzqRUBGyNIX3VV7mYxzKTurvdg8UbYMRL1W0hjmg2L2lbNHVKKJ7FL4y
	 N7JjzizbXYjnC8qoH0yQ1GA1Amel8vKpcZTXq1RCVhmXALt4wyAocLzgT2VqnrAJYM
	 JAHBL/wpYNGahxo9xcSVyW3RIr6F7QJ3hWUOP4UIWiTHxdPhYAeqInTBqY+rg0Jd1X
	 fQgurTbDnU2aQ==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 20 Sep 2026 00:22:19 +0200
Subject: [PATCH v4 08/23] dmaengine: ste_dma40: Return IRQ_NONE without
 interrupt status
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-dma40-fixes-v4-8-d751b2d9c23f@kernel.org>
References: <20260920-dma40-fixes-v4-0-d751b2d9c23f@kernel.org>
In-Reply-To: <20260920-dma40-fixes-v4-0-d751b2d9c23f@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

d40_handle_interrupt() returns IRQ_HANDLED even when it does not find and
acknowledge an interrupt belonging to a registered DMA40 channel. If the
interrupt line remains asserted without any matching status bit, reporting
it as handled prevents the generic interrupt code from detecting the
stuck interrupt.

Track whether the handler acknowledges an interrupt and return IRQ_NONE
otherwise, allowing the generic spurious interrupt detector to disable a
faulty interrupt line.

Fixes: 8d318a50b3d7 ("DMAENGINE: Support for ST-Ericssons DMA40 block v3")
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 633f6a04fdc1..9f725369721b 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -1790,6 +1790,7 @@ static void dma_tasklet(struct tasklet_struct *t)
 
 static irqreturn_t d40_handle_interrupt(int irq, void *data)
 {
+	irqreturn_t handled = IRQ_NONE;
 	int i;
 	u32 idx;
 	u32 row;
@@ -1838,6 +1839,7 @@ static irqreturn_t d40_handle_interrupt(int irq, void *data)
 
 		/* ACK interrupt */
 		writel(BIT(idx), base->virtbase + il[row].clr);
+		handled = IRQ_HANDLED;
 
 		spin_lock(&d40c->lock);
 
@@ -1855,7 +1857,7 @@ static irqreturn_t d40_handle_interrupt(int irq, void *data)
 	if (ret > 0)
 		pm_runtime_put_autosuspend(base->dev);
 
-	return IRQ_HANDLED;
+	return handled;
 }
 
 static int d40_validate_conf(struct d40_chan *d40c,

-- 
2.55.0

