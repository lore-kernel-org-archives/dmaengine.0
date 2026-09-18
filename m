Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0CC518123
	for <dmaengine@vger.kernel.org>; Fri, 18 Sep 2026 20:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789762641; cv=none; b=khPEi+nY6ak8m0uPs0PBYW/BypRKAcBJJN8a0CSOraQQ6gshyJz6RvCLMgTNcFWkFzIaorhWGkXbxMW5Td2yIm5mRCHD6oPwZS5QYXD3trjRF2/ZM1xcvuel89PNE1m4XHLYNaH+5p9+aCdQ6TRCoWmGGnXUll3leuWHXUF2v/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789762641; c=relaxed/simple;
	bh=ze4Ln6CqPRf0+mMUi1Hhbad5zsflmM0XF4X5+SsiByA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P4StN+3jLedI0+MwFXOSOMXujP2nZcbPIXhX0mEDOv58NDRTJMqS0l8wkrRf8hKuRjZ/EGrwnk5RGoOSD79+UIOQfrIjGIpaDXdFqy+CxcS1SWv6WedwXxn8d3LRZeiJBkS9oQBPl18wYo8EhSiFHP9LHJpzkrvHImcvV7mgnSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=gpy+fgOf; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=o7VoKuXk; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="gpy+fgOf";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="o7VoKuXk"
Date: Fri, 18 Sep 2026 22:17:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789762636;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PRf34116XUsCPRZHvuv2h2j6eDmjMmQ6RJxAtO3j4gw=;
	b=gpy+fgOf0Tp78+xb46elY5oaprpduHBOEO6x4rx4jtKaJhtrBMxnWIfsc/jr93abpt/QET
	2iOcS2Y2VRdDiTqU3q7vuEN+OAOKBH08KBV4fzVXNzn5ISa8JLVOBLLfaHiCUDB+rxjaX1
	JEsMwafDfLvSzYjdanYwaHkKPOyQVabRRIYGHUhIdKOvo2w5trCdpG3VR0uWKDu1ewSjqz
	64hRu84QU7KAzBc+Oh9WbOAUwCrlzDbhjOeNCzMjZ5yc0uy3UwfYQdmJDxt9FcXuV3RGOm
	rWvMM5ZURvTOAk2/ZQEeiVEsD1oaj5XfTpAwrrw59BwhCvtjI5pRm4k6m6iF7A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789762636;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PRf34116XUsCPRZHvuv2h2j6eDmjMmQ6RJxAtO3j4gw=;
	b=o7VoKuXksWTsokLI44Mr/UhLoahaP49C6p1CG7AO/fCed3WPMMCGtlsnfsgasRAb9+hdry
	bk6YZR3ZdDQSrIBQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: dmaengine@vger.kernel.org
Cc: Frank Li <Frank.li@oss.nxp.com>, dmaengine@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Subject: [PATCH v2] dmaengine: loongson: Remove the %p pointer output
Message-ID: <20260918201714.eFNI3VMq@linutronix.de>
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
The policy on %p is to not introduce new ones. This is the only pointer
output in the driver.

Remove the pointer formating from debug output.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
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

