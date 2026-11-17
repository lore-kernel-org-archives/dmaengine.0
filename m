Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=204.191.154.188
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794934355;
	b=CCwffmiKEs/5/68MAhQblDrCidS9r3hfXcJBZhnGI+8ZLki+I+ZnUMaCTy20bGsVEoXd
	 6D2mXs1yuFCXWgZZWIcWLwHnNPTmf3mIteLw57aMTZuPPRAZ63VO+FrVcA+j5OAhM5Mhc
	 VUdCTBq9F0wSQYebK10u4EzwUue74YOr7XEp6WIR219uYtQAxTFjExh0lCZiKTp3/u31d
	 Yy7jtkOKsNeLJD8On8C9SzpxvQdl4MjKOcm8NMwWEwoSci+eRtBA+xArvKa0Un6t8EAWk
	 L9kYROYr04OLPQQxnfcjpg78bFotHNrk4BMgT26N1JSIhXnORJeqAJZaKLfsatV7svw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794934355;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-SA-Exim-Connect-IP:X-SA-Exim-Rcpt-To:
	 X-SA-Exim-Mail-From:X-Spam-Checker-Version:X-Spam-Level:X-Spam-Status:
	 Subject:X-SA-Exim-Version:X-SA-Exim-Scanned;
	bh=80BwZLAixAs3aWxi4XtZgCv2NQ5zxOV25FshTLRLmzE=;
	b=R9lJ/AlGvBmzOhYuiS12sl5kmhF1B+RqaF2DiNcFoHOwDR7WY8/ObNb9IbrZbuK9Wge/
	 88ErfGBn6z8mXxQmkItBSOkqx2ISFDEUHvfAxcnU8Eb5TNA724j1izzfv9DBjPBzxD/LY
	 X/HTtmlcE1W/2J0QxqVVEep21+F0ZT6YglYzexHLZL7BODoS93X7+t4U97aZGAQA53Cb3
	 1YIvsdqcYHCLxkwMrbyiQAMnztE7RzAuQvnh69nY9KO1nZuR0klgXt9Ugo70dGbd9q3k4
	 jMFunPzyTfUCMzBsxsWzbwkci4PCzWXQDfwzloBTyXk5cCBBmph6FrVWIA8xGpWETwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deltatee.com;
	spf=pass smtp.mailfrom=deltatee.com;
	dkim=pass header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=gjqBJDrV;
	arc=none smtp.remote-ip=204.191.154.188
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683E2606A336;
	Tue, 17 Nov 2026 16:52:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 683E2606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deltatee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=gjqBJDrV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Cc:To:From:content-disposition;
	bh=80BwZLAixAs3aWxi4XtZgCv2NQ5zxOV25FshTLRLmzE=; b=gjqBJDrVBslBj0n2/JPCqJpiag
	Z/t8ja1zIhdoA8t0Z+CXzbkIAwkneNTUEv7gHzeZVNrRqFQs9jLhCSOaQb8UGc+E1ptzKqy6v4bZU
	ZMAnydW9CK9ipdIPBbe7QxbOdrycJJR+XCGL3B4Olgeznk+FvHUiVCwSPc8ulpLM68I3GxEkcDCRf
	5BAOndpS16aeZyU0qzS4FL1dQguq8ioTlp/MsGBll5/T0PYcsD7VwSz1ZW6CPJ4fRs2wR42OzjS/w
	tQZeoGDmcuMCFrMRwwRkgs0TKwVNW3C8qKt1873/gsReCtPShN+3qo1bZuIahlnN4ch+DA8v3s7Py
	Kljr5s1g==;
Received: from donard.priv.deltatee.com ([172.16.1.31])
	by ale.deltatee.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1xTMQ5-00000001RAL-2xrh;
	Tue, 17 Nov 2026 10:52:34 -0600
Received: from logang by donard.priv.deltatee.com with local (Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1xTMPB-0000000388i-3smP;
	Tue, 17 Nov 2026 10:51:37 -0600
From: Logan Gunthorpe <logang@deltatee.com>
To: dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.li@nxp.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Sashiko <sashiko-bot@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Date: Tue, 17 Nov 2026 10:51:34 -0600
Message-ID: <20261117165135.746241-6-logang@deltatee.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117165135.746241-1-logang@deltatee.com>
References: <20261117165135.746241-1-logang@deltatee.com>
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, logang@deltatee.com, vkoul@kernel.org, sashiko-bot@kernel.org, Frank.li@nxp.com, Frank.Li@nxp.com
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Level: 
Subject: [PATCH v3 5/6] dmaengine: plx_dma: use spin_lock_bh() in plx_dma_process_desc()
X-SA-Exim-Version: 4.2.1 (built Sun, 23 Feb 2025 07:57:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)

plx_dma_process_desc() is also called from plx_dma_tx_status() in
process context. With a plain spin_lock(), the desc_task tasklet can
run on the same CPU while the lock is held, and spin on it forever.

Fixes: 1d05a0bdb420 ("dmaengine: plx_dma: Move spin_lock_bh() to spin_lock()")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/dmaengine/20260717223217.B6FBF1F000E9@smtp.kernel.org
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
---
 drivers/dma/plx_dma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/plx_dma.c b/drivers/dma/plx_dma.c
index 7af29b901bd5..725df770d5de 100644
--- a/drivers/dma/plx_dma.c
+++ b/drivers/dma/plx_dma.c
@@ -138,7 +138,7 @@ static void plx_dma_process_desc(struct plx_dma_dev *plxdev)
 	struct plx_dma_desc *desc;
 	u32 flags;
 
-	spin_lock(&plxdev->ring_lock);
+	spin_lock_bh(&plxdev->ring_lock);
 
 	while (plxdev->tail != plxdev->head) {
 		desc = plx_dma_get_desc(plxdev, plxdev->tail);
@@ -173,7 +173,7 @@ static void plx_dma_process_desc(struct plx_dma_dev *plxdev)
 		plxdev->tail++;
 	}
 
-	spin_unlock(&plxdev->ring_lock);
+	spin_unlock_bh(&plxdev->ring_lock);
 }
 
 static void plx_dma_abort_desc(struct plx_dma_dev *plxdev)
-- 
2.47.3

