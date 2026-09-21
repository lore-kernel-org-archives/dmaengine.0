Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7340E47B408
	for <dmaengine@vger.kernel.org>; Mon, 21 Sep 2026 15:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790003597; cv=none; b=PwkHPMXq1+LdVY+nfuxSoPjrvtbMesipidN7RVGa8PVb/bITp13aJQElZ2FEXUZ5IFCMjklMu37EDwyLEhf6xMA8/b/mVPRhGwEP6wLLb7kS8ywMGkZ5MwA7+5Eq4J5E09doKjrBXA39ttfEOTqHRImwfKAdZSTR9ov+kx2dZK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790003597; c=relaxed/simple;
	bh=awIc167H3jFCJSzb5JoS+p0ISGy4AqPZXQ/j951wenE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ihOuvQ0widjNtqEMLFHXlDOmncj31LSBmvovwCnrBQGiLZ5g0zonoz/J00guTqQCwCSbpEv8nLK0E6e2Yy2VTqfeX5wo0RzJ2M70xOIYNsS/FKUY167bQqRNJqMKw6nwJT0rSqiBkVl0h19LrMugx+cgeKfZtWJTnnXX3vNRV2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=z+Fue2io; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=lSwzV/OV; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="z+Fue2io";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="lSwzV/OV"
Date: Mon, 21 Sep 2026 17:13:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790003593;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qAknz8u9glpBKIo8sn5RrnC76fUxjK+Y7tQMvAsFoyk=;
	b=z+Fue2ioYaZ0tukBYlRzQJnbxGI8cwxarPIMbqtiNml33PwNyVM/qYbqBD55Y5amyAwYAq
	R/00vy7wv3rwptY+f4T6PJCsdbJMEZ/NjjyFQzDyKQRDLaaZ8vhyGw8qQ+kKvUw77IcT68
	LxO65F685+H5uXOhXzH4dmsfYpJOT4GvkfIYlcuEdbMx3GoT86hF5UrR/+LKTMS+PkMA8g
	SXPV6jxfIDUPDonCVSCMEFmCSYonf3oojxe4yPbZkny2RySARP/F87farz9JKthhUPj2Wx
	cgsat6ONKCq4NbtubUD3WOfmxnbMYz/W3sAvqO4w0YPjcCyQKSrIUQInNTge5A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790003593;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qAknz8u9glpBKIo8sn5RrnC76fUxjK+Y7tQMvAsFoyk=;
	b=lSwzV/OV45fIKJOVamA0D17Uzo7Ed/ZmCLhSFfkIj3KZOQqLsloBMjlsSRxsMN+nXwGuin
	BQL01fobIipcixDA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: dmaengine@vger.kernel.org, Binbin Zhou <zhoubinbin@loongson.cn>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Subject: [PATCH v3] dmaengine: loongson: Remove the dev_dbg() output
Message-ID: <20260921151312.I8Q8NLnx@linutronix.de>
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

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---

On 2026-09-18 16:44:59 [-0500], Frank Li wrote:
>=20
> please careful,
>=20
> remove whole dev_dbg() when vchan_issue_pending() failure.
>=20
> commit messesge should show why it is okay to remove dev_dbg() here.

Is the arguing now reasonable?

> Frank

v2=E2=80=A6v3: https://lore.kernel.org/all/20260918201714.eFNI3VMq@linutron=
ix.de/
  - Reword part of the commit message.

v1=E2=80=A6v2: https://lore.kernel.org/all/20260918103409.UV4g2ON7@linutron=
ix.de/
  - Update subject line (it is removed, not replaced).

 drivers/dma/loongson/loongson2-apb-cmc-dma.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/dma/loongson/loongson2-apb-cmc-dma.c b/drivers/dma/loo=
ngson/loongson2-apb-cmc-dma.c
index 1c9a542edc859..27f8f7a5738d9 100644
--- a/drivers/dma/loongson/loongson2-apb-cmc-dma.c
+++ b/drivers/dma/loongson/loongson2-apb-cmc-dma.c
@@ -337,7 +337,6 @@ static void loongson2_cmc_dma_issue_pending(struct dma_=
chan *chan)
 	guard(spinlock_irqsave)(&lchan->vchan.lock);
=20
 	if (vchan_issue_pending(&lchan->vchan) && !lchan->desc) {
-		dev_dbg(chan2dev(lchan), "vchan %pK: issued\n", &lchan->vchan);
 		loongson2_cmc_dma_start_transfer(lchan);
 	}
 }
--=20
2.55.0

