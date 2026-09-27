Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49AEC3BB689;
	Sun, 27 Sep 2026 09:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790499819; cv=none; b=H66DXaG3fiAtREpeOOlF3cIiqqGSSxfRE15995RzfAhnN2xX3Zase8oWRxgYAUsDv3SE/aWxAq0N9Hgsku/pcYtrQwQFrby8YxnWaez2Q7FjEYbRu/gYxpHL8JYqHDZwaJefen6Jhd1Y57yMuI6zZzEX/dsnvJXZef8ULCsmB0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790499819; c=relaxed/simple;
	bh=QK0ZLYOD3MAb91ksgiqImOr9vG05hFibTXeyUEXPyiQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B9Jvka5CmNLgoFK/8Q0mw7/0S6nfRczKuY3kVo9YD7lBbHbkBTk7soJlWdRNaQpSIeQ2HLfBZs0Quc30ZtCeaI+FXfGRBv7Vizkbc8OP3A1p75VHV4UILBtoDUiJVb1OOmObEAiZsVTcs1ji5eeqYwe5BK6edDSX7NcE+6K/g6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KhVsn5Ox; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KhVsn5Ox"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C8E51F00893;
	Sun, 27 Sep 2026 09:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790499817;
	bh=Ag7YxwQVq0OvklEpLYVxtKjyKQUQv+ThcoKdAvdegNY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=KhVsn5OxLWhLsKcF4FrOPN7j7zH8cCwabTV9Nmx4zdJ4FKiUmq2Lxw6ZgVwtLO0dH
	 PjnqxR/0rHwTSfaax4PZsXFp9PD2WDRx+0Buw5GqW1y1reCO1CJnrjoHZhSomZ57ZR
	 TJK1iuy6xdWI95Bb2VJOFbdOGpQS/BbfDlG9osldjKxbYd6Gzp+jqmnTDw++h+N5df
	 fjVI9/9Ghe+4SfkQceGXXHmbsTYyUqNPTwIVYp+6hxDWvIrVqPgynZiK9fsFBhB7E+
	 LVZittR4lgazxnQH1bvs2GDkES2JNO231EjPvHh/wc8GzMX0e8O974QNUukW+dmQtl
	 SZ1kZFj0mCeZw==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 27 Sep 2026 11:03:21 +0200
Subject: [PATCH v7 08/24] dmaengine: ste_dma40: Return IRQ_NONE when no
 interrupt is pending
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-dma40-fixes-v7-8-89f595e8851d@kernel.org>
References: <20260927-dma40-fixes-v7-0-89f595e8851d@kernel.org>
In-Reply-To: <20260927-dma40-fixes-v7-0-89f595e8851d@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, Frank Li <Frank.Li@nxp.com>
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 80780f76dff0..86efe2149be9 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -1816,6 +1816,7 @@ static void dma_tasklet(struct tasklet_struct *t)
 
 static irqreturn_t d40_handle_interrupt(int irq, void *data)
 {
+	irqreturn_t handled = IRQ_NONE;
 	int i;
 	u32 idx;
 	u32 row;
@@ -1849,6 +1850,12 @@ static irqreturn_t d40_handle_interrupt(int irq, void *data)
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
@@ -1881,7 +1888,7 @@ static irqreturn_t d40_handle_interrupt(int irq, void *data)
 	if (ret > 0)
 		pm_runtime_put_autosuspend(base->dev);
 
-	return IRQ_HANDLED;
+	return handled;
 }
 
 static int d40_validate_conf(struct d40_chan *d40c,

-- 
2.55.0

