Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B2A3FDC06;
	Thu, 24 Sep 2026 08:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790238932; cv=none; b=RJX1gbNaxcAoLAlVzPqm95ZnuONWokStXayuZMejsHApgB9ntR67w1rNsZo52ACExD+JX8/F3SWxnP9Ys7JyhaNgFxM1/NAS8o2juQZMUg9F3A5Sb+zcBmMcWUagyVf3+nygS6cgn3Aftyg5VjH3afRfOmIYTD3ea+gKeJnJJ3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790238932; c=relaxed/simple;
	bh=VHJ2oHHu9QcPYeL5VgQ4QTby1R9uyS79SKkRzIs2idc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=asJLJjRzlfpWO0x+w1w/r0gZZn2wdcm8BUeqbrpUSwSiT793PWPQLss4ywD081hRswTqlCRvzw4XgOA+KWU2SNcETaFN7k/q3bNYoiiAgrbqx7a4L0D9s/FxrfdMslOh1P5N6ecQCIe9XpIRdU23Hn4Rs12de3WvkiwQi9RM/w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jkHAzabx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jkHAzabx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1C851F00893;
	Thu, 24 Sep 2026 08:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790238930;
	bh=qzyIlE/SHRVG4ZLjqvrCAgDajrDSsqJqSj5IQBVgKj8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=jkHAzabxk1n1zrAxNkBdLjhP2zRDjB2v5eJhQ1Bc5UpXsO564cLFxO6p1mDQTr8zD
	 zA61wmNRxM9FoKWXIDl0JxhGTbixOIp46HN+PvKMt8iRNh1VYHuuCCm+BXSfAZZvWi
	 QDR317yTm7TP8Z3UdBxvfFV+gz2qk+bYUB/04dbqetR/DVYp0/0qFsnGRhYADtodor
	 SecoU94N6xjUwN4nvVnBzjWnYvl2BVv/YBUhSu/8P/BoSaTDmyV06JPrvYKckkFkxC
	 zEE/whLkyw9GqgvDeb9lSwC8Wj9dPBYUDusx1ZrIo3c5EmMsWd3jO0Z48Um6Z57Ce9
	 nhK3YqWp6TumA==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 24 Sep 2026 10:35:20 +0200
Subject: [PATCH v6 08/23] dmaengine: ste_dma40: Return IRQ_NONE when no
 interrupt is pending
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-dma40-fixes-v6-8-fdb6755020a2@kernel.org>
References: <20260924-dma40-fixes-v6-0-fdb6755020a2@kernel.org>
In-Reply-To: <20260924-dma40-fixes-v6-0-fdb6755020a2@kernel.org>
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
index 712719f0c4cf..271f653a15c4 100644
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

