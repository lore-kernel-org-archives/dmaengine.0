Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20CE40DB3A
	for <dmaengine@vger.kernel.org>; Mon, 12 Oct 2026 10:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791802509; cv=none; b=ViCNMHeJF0Gpw04ffDvZ7Jkx4CHLPhVpOFJU0oChYcHjbs3eKOVEEbtSa5GFSlnQcMbqrGn299AD+XmFX58L5mnr8HZrhm4K3Syilq5kIn1sRz7m2AfA+E+EiHGqwAQreo/h/fo7CwFk8NeEZoUAxyy9nLKsrcooe8Ih5+iHeQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791802509; c=relaxed/simple;
	bh=44xPJlXh9UJSlRlc5e1yqOnCC+8+D/VLtyZM+3cLoME=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nuon8jzr7GzpDyXtlPVGk/UzOMCHsvGXDungSkTM9wIfbA+LRkvLwnvKb4cOJB1xMs+z1KIF8WP4vDuaFLAs+ElPJc9Ho6fHyQxCjs8kXJgv3fwGFopV4L5Kp0MxWDBMCJW046H8bLJ1p4Gq51/SRY3dpUW8TUbVUrFmuILOLlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=wZhzya0q; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ZR+7l1TD; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="wZhzya0q";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ZR+7l1TD"
Date: Mon, 12 Oct 2026 12:55:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1791802505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wsjsYJRMgJSQ64/w70sHoFRTbXxDv3hUZ3rH4kfJqiw=;
	b=wZhzya0qxF6zV4ZBUpwnQyXIa6XS6Um2HC9hgI1l4wvJ8iLRoaBNkRG/EnV5ZWd/UmY9J4
	X4TcPNSRn3FTZA4R+uPD+qVGv/rcYHkPh3I9KzZvxzsHHQ8cwh5j9Qe9C5g8V+XgyNZoZT
	W7YdjaIqT2unAUa3rrKAFIgP6EbVpZ6g7cKvVEa+9plnVSkSvpnMz4N/jEtHmVCBAWVwt0
	bf6qG/QGpSXAKnSmyaqwBukQqK5ryzliEIuLdeWp1Hy44ztt7VNvh9AnH3dxuNeYSTeIh4
	T7WAWeBgiveLTQR64aRhzB8fO3Qys1CNM6ZMr43dG0jYigAeArJGNmPS/j/vBA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1791802505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wsjsYJRMgJSQ64/w70sHoFRTbXxDv3hUZ3rH4kfJqiw=;
	b=ZR+7l1TDnDPL5JqsKfXo4z9vztlif25eugWv4OjGnC50OfSBo2LukupXCzZ4XbAkvJrX63
	NhXAUErXEv3PXkCw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: dmaengine@vger.kernel.org
Cc: Frank Li <Frank.li@oss.nxp.com>, Binbin Zhou <zhoubinbin@loongson.cn>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Subject: [PATCH v5] dmaengine: loongson: Remove the dev_dbg() output
Message-ID: <20261012105503.KKtfqhzi@linutronix.de>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The %pK format modifier was meant for /proc kind of output, not general
printk output. Since commit ad67b74d2469d ("printk: hash addresses
printed with %p") pointers are hashed by default and the behaviour can
be controller by `hash_pointers' boot argument.
The policy on %p is to not introduce new ones.

The output in loongson2_cmc_dma_issue_pending() is the only dev_dbg()
output in the driver and is only output once the transfer is started.
There is no output issued by the driver if the transfer is completed, if
a follow-up transfer is started or if any of the other callbacks (such
as loongson2_cmc_dma_tx_status()) are invoked. This output does not look
essential.

Instead removing just the %pK output, remove the complete dev_dbg()
output from the driver.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Binbin Zhou <zhoubinbin@loongson.cn>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
v4=E2=80=A6v5: https://lore.kernel.org/all/20260921195745.gY25rf4P@linutron=
ix.de/
  - Rebase on top of next-20261009

v3=E2=80=A6v4: https://lore.kernel.org/all/20260921151312.I8Q8NLnx@linutron=
ix.de/
  - Drop the braces now that there is a single statement left.

v2=E2=80=A6v3: https://lore.kernel.org/all/20260918201714.eFNI3VMq@linutron=
ix.de/
  - Reword part of the commit message.

v1=E2=80=A6v2: https://lore.kernel.org/all/20260918103409.UV4g2ON7@linutron=
ix.de/
  - Update subject line (it is removed, not replaced).

 drivers/dma/loongson/loongson2-apb-cmc-dma.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/dma/loongson/loongson2-apb-cmc-dma.c b/drivers/dma/loo=
ngson/loongson2-apb-cmc-dma.c
index 2037120b23caa..72587abaec994 100644
--- a/drivers/dma/loongson/loongson2-apb-cmc-dma.c
+++ b/drivers/dma/loongson/loongson2-apb-cmc-dma.c
@@ -331,10 +331,8 @@ static void loongson2_cmc_dma_issue_pending(struct dma=
_chan *chan)
=20
 	guard(spinlock_irqsave)(&lchan->vchan.lock);
=20
-	if (vchan_issue_pending(&lchan->vchan) && !lchan->desc) {
-		dev_dbg(vchan_chan_dev(&lchan->vchan), "vchan %pK: issued\n", &lchan->vc=
han);
+	if (vchan_issue_pending(&lchan->vchan) && !lchan->desc)
 		loongson2_cmc_dma_start_transfer(lchan);
-	}
 }
=20
 static int loongson2_cmc_dma_set_xfer_param(struct loongson2_cmc_dma_chan =
*lchan,
--=20
2.55.0

