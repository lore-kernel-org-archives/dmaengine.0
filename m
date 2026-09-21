Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8273DD51C
	for <dmaengine@vger.kernel.org>; Mon, 21 Sep 2026 19:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790020671; cv=none; b=F2HM2onV5posHgamL8TZlpl40Cie6OSIcLD6jpyc69MJTwzLQKnaVM1eJxD3np+IcHrLPwGZChV4wUnpp35WzDiutzIDgzd8RQ+c9JjQHg6QNPe5QfedtVvVph9EjZzHYvn8+bpqP/Yu+EQh/lyTMUJXMGaPcz62+R9ie3/2J+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790020671; c=relaxed/simple;
	bh=OmtRewMlRWIRQcpBk0ZwSVjAUiKODG92WWR7LMgNZss=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pl4ujk59m50JUIb/JnwcnOuIeQYhbdUk0Y/quZF5cICBdPSRj5roxUV1ocU4dbO+0doKbP7VjiKMNwK1l+mkn7wdVlY7x2ZSfPt/2pN3tSSCsgCyETuV/o/YyWAoP/5POnmBPL3eMYK0eG4z0iikqN03djuK1mWVYka3yWfo7FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=lGM7rKP8; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=AEM0xsMd; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="lGM7rKP8";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="AEM0xsMd"
Date: Mon, 21 Sep 2026 21:57:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790020666;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xIIyg1KYK0D0UycPFUCGVVyPYBT//2naq8J5xVWOIpc=;
	b=lGM7rKP8s/AemlIdJmHSrYbVrZrNxQny46j9q478pimR7Etq4C3a+zwDCxspOtWUhrRRTs
	TGQjqgebRfeG/Qgg59YSGmE3DRMTwESvJlNNyrtVOeYBGVLiKv9Rk/Rp0EIjvj+TY4FC7M
	5HI+xgbgppE/wicwBZqKdlC/9OAMW7PIDJvW6nMZfzDygD6pp93RiXYpkaaNx6b5vNm+hU
	EgavvLt9oWt49LEX6lJRHiY5xHfuZwgKYQl3WJxAfZqY1+oxGpE9natWM/5jzUnLh8c/wp
	2B2XuSAWNJY1kMJKdDrGjKomVXifdZ4RTMH+YVTqQE1I/3pz4p3hsXuL3vBHxw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790020666;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xIIyg1KYK0D0UycPFUCGVVyPYBT//2naq8J5xVWOIpc=;
	b=AEM0xsMdF+Q5n68NFwV8lBIRJyRZ3xVUeNAMcijxL3yGf48n96bAIPlvg0rqMnCYo8lV4t
	4Xqu2iIgmusAXICw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: dmaengine@vger.kernel.org, Binbin Zhou <zhoubinbin@loongson.cn>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Subject: [PATCH v4] dmaengine: loongson: Remove the dev_dbg() output
Message-ID: <20260921195745.gY25rf4P@linutronix.de>
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
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
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
index 1c9a542edc859..93727ae972ae2 100644
--- a/drivers/dma/loongson/loongson2-apb-cmc-dma.c
+++ b/drivers/dma/loongson/loongson2-apb-cmc-dma.c
@@ -336,10 +336,8 @@ static void loongson2_cmc_dma_issue_pending(struct dma=
_chan *chan)
=20
 	guard(spinlock_irqsave)(&lchan->vchan.lock);
=20
-	if (vchan_issue_pending(&lchan->vchan) && !lchan->desc) {
-		dev_dbg(chan2dev(lchan), "vchan %pK: issued\n", &lchan->vchan);
+	if (vchan_issue_pending(&lchan->vchan) && !lchan->desc)
 		loongson2_cmc_dma_start_transfer(lchan);
-	}
 }
=20
 static int loongson2_cmc_dma_set_xfer_param(struct loongson2_cmc_dma_chan =
*lchan,
--=20
2.55.0

