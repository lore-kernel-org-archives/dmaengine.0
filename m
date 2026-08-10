Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6211437454
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 18:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786385601; cv=none; b=pogUU3RRE5KNMpDxpJCIoIzY2q8WXq7xaRHvCNp/eDqp/AtdQ40I2+Y0H7eluRxbuD+LeHY76vheS2KYFpLMXbGeZlEF0qyt2VFoCG2yGaztdNsnaMGVUbi/SezQvtZjsL/YoRwMN4tN4/H4IsxY7n6BpKpEFQFvF3Ffdc5GW3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786385601; c=relaxed/simple;
	bh=EppFRA+4UmcTGZnKZYK9FAbypj6sAWpbncg9JYXC4ws=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vERAymAgQjs11+nSaxoAGrUPTlEbjD7Aq+meDrAV/1FtNnPyoflYJw4cNpQftyIwlNiblT49gdVBe5KrOEzkhetLPm+Hkdy5KqPRXljBy89CKsCTI1GYhslw19vjeELfOl0l2A8PIn58/nl/8UljJLxqi8J7AX+mbfEXTJp0GNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NB+TQvX5; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NB+TQvX5"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cc61541f8cso2442625ad.0
        for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 11:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786385599; x=1786990399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RUMe+KZIIE0p4VSC/2SRazogG3ObTz60RXYC/ZPy2cE=;
        b=NB+TQvX5fxiPgrEcyvI/cGk8fHmwn0OZATDM6PKr/FfcL8qXnGCG6J1LzAOiOwH2ZD
         dMMSeXM/jEHCE0U9ofmWCnyOgZMTaiD7J+0J0NvKikguT1bVE4Oh7qyd8CGlL9rsPR/y
         p51cY85YTpRxjYcOR1NU7HyciAhGTdr6uFLW8jGk9HrFWTkGFBGQNdSgFS/NwOMgu5YL
         ktgBaR/tB0ePPHUI+zR/wCnLqhzJY5jng1lLx4uuL04POr4/z+qCB4s0IDqEx2YDTZSg
         gx7TCHwq3eDCoCX+U80672KYxSZoel+tRhBk6NOZAx0eY6mpmaCo0EZyjweiDohvpmz3
         L0Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786385599; x=1786990399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RUMe+KZIIE0p4VSC/2SRazogG3ObTz60RXYC/ZPy2cE=;
        b=ooLlbobAi8sLcHPm/NMZsxJAf9pU0ak52d+wPwyiomC/N4FYkTSWzpImz1Fp2AuloD
         R5R4uj1voW+ntxjN4Gla40C2Jn+vf2hgiwdr3wNsNEaJKZRNdZM3DdoGWjx9Ihs4Etlg
         rp7q1E5+ghdc4jmTwemWqKQgQmBs1im64AkzCvCj6+3Ds3CDyGyu2oYck+QPk2qBU7ii
         qQHLyUAIefnRLSxIYehjXpiw26Ypr86XL8ESPXj7IpWaHgqz3X+w7m+QOjXTSovuCXrV
         SkBPg5oUHziH6IkC1ihXOAQtzYuWf6mMswP8y68q0ygn+OvVnkgBO2MIC3MRGhEPpL6M
         aWAg==
X-Forwarded-Encrypted: i=1; AHgh+RrrJh+a07KO9MhKJ0JTR7Ek4SzHMUX6mJJDwsSpBCfWEW7vjmImWXquxlKi+A0q4Lf6/v/Z49/RnoQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5FmX8uNH3ItBE8ncl6lEdtJdRaSmrskAKgTEvzUtgHGk25491
	5od0z3geTbD09p7qm8fdvy9jT+ZpWkHr9GnWc44QNAdUQILxlaFRbJfBy3Y7Rg==
X-Gm-Gg: AR+sD101NctZll0ehCwlSXLAXE1o3E1QrMcEcsn7YTMrRpOITEg+qaIkP6Yw29Igh0E
	C3dbCH0x+kKSxMdUAul4MfCTWzyIJvVtlXqUXMqHfMdYhLic0Bv7mVmpC20RY5UjNmf+td90MpQ
	IDpIPC49R3VrQrkzAqh9NPzzIm+aCNwCeexXAlLBh/oNIJ8SAUEKh2ra++87wcxSLHQhJdYrYKz
	0YsQYT2Q67aWEohRRy2dbcASUD9+TzVjKB4ofVugIlSgClkm3kR78NjvrRxrmnYO3G75SLTsW1J
	hfzWwh0YviTf+eTqSMIgUo4/EUZyAfCSF8uGYS1X3T8NIBvnMFID7yx3TJnCmrCQXsAIgjZ4xCo
	F+iJpQCjogsrsBHuR0akhG+ylEywGmoEJz4SsY2YfuuoLKafDjjxQELlJjFG5Oy3So17ZFzPynQ
	tiLM6UvEAK2abU9OxI1qTRDWHlYU5vJs6l4VzszlRbSF7gn68H3z4qfzwG/3RFcWE=
X-Received: by 2002:a17:90b:2b45:b0:386:ca4b:16a9 with SMTP id 98e67ed59e1d1-392d61ce454mr128606a91.16.1786385598984;
        Mon, 10 Aug 2026 11:13:18 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fa9:fa00:b1a9:6513:83c6:1d23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d53b873asm472795a91.17.2026.08.10.11.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 11:13:18 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 28/34] dmaengine: sf-pdma: route error callbacks through channel BH
Date: Mon, 10 Aug 2026 11:09:29 -0700
Message-ID: <8538eed11abe0c92b1a5b2830baf7a3f06ac698c.1786384169.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1786384168.git.allen.lkml@gmail.com>
References: <cover.1785183549.git.allen.lkml@gmail.com> <cover.1786384168.git.allen.lkml@gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

virt-dma now dispatches completion callbacks through per-channel BH work,
but SF-PDMA invokes the client callback directly from its error tasklet
after exhausting its retries.

Complete failed descriptors through virt-dma with an aborted result and
the remaining transfer size, then start the next pending transfer. During
removal, kill the producer tasklets before the channel BH so they cannot
enqueue callback work after it has been canceled.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/sf-pdma/sf-pdma.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/sf-pdma/sf-pdma.c b/drivers/dma/sf-pdma/sf-pdma.c
index a08ca355dadb..ab2029af0c0c 100644
--- a/drivers/dma/sf-pdma/sf-pdma.c
+++ b/drivers/dma/sf-pdma/sf-pdma.c
@@ -328,7 +328,17 @@ static void sf_pdma_errbh_tasklet(struct tasklet_struct *t)
 	if (chan->retries <= 0) {
 		/* fail to recover */
 		spin_unlock_irqrestore(&chan->lock, flags);
-		dmaengine_desc_get_callback_invoke(desc->async_tx, NULL);
+
+		spin_lock_irqsave(&chan->vchan.lock, flags);
+		list_del(&desc->vdesc.node);
+		desc->vdesc.tx_result.result = DMA_TRANS_ABORTED;
+		desc->vdesc.tx_result.residue = desc->xfer_size;
+		vchan_cookie_complete(&desc->vdesc);
+
+		chan->desc = sf_pdma_get_first_pending_desc(chan);
+		if (chan->desc)
+			sf_pdma_xfer_desc(chan);
+		spin_unlock_irqrestore(&chan->vchan.lock, flags);
 	} else {
 		/* retry */
 		chan->retries--;
@@ -602,9 +612,9 @@ static void sf_pdma_remove(struct platform_device *pdev)
 		devm_free_irq(&pdev->dev, ch->txirq, ch);
 		devm_free_irq(&pdev->dev, ch->errirq, ch);
 		list_del(&ch->vchan.chan.device_node);
-		dmaengine_kill_bh(&ch->vchan.chan);
 		tasklet_kill(&ch->done_tasklet);
 		tasklet_kill(&ch->err_tasklet);
+		dmaengine_kill_bh(&ch->vchan.chan);
 	}
 
 	if (pdev->dev.of_node)
-- 
2.43.0

