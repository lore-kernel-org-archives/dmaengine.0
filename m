Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657C342F6FB
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184361; cv=none; b=M3N6oz8BnT6Xxib6x5Hv0RkyHxjnF8QKUiDno4pBGCJno20fIXtlprhur3Pav3N03C6O7R4RINQKfuLQf4lWsXndVoTjUqi6zxwIAWGiNixcvH6kKVXli0phYhiM7/MFUH+RubhhfoBm1fwlTViMSOBr6Df+wNmjsuYFxay0OPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184361; c=relaxed/simple;
	bh=9h1WpnMMycnSCejIuRJlaPM4Z48gnE43H/LZqcPVlEU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iWERXb0dZHmUX8fOtDWiAFYRWpDwiPwHTEGuh77ydOAgaw5dwwjhrmMZNmoVKcNTsGjV0dRC4YUSpVjzByrI+aWd15mTlT7QITfHeRlnP540FV5FjYDZb6/HPGN3Is3lqUq5vp4pwQetX8jVyMyEYJI8oIh3TWUZJbsI06L0qkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R+AKlCIh; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R+AKlCIh"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cab973140bso42249065ad.3
        for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 13:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184360; x=1785789160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jJ/36eTHsHmAdDJttLKoiCJF2Rw+8DDm9hk8CTzgL2Y=;
        b=R+AKlCIh8gXT4aQH6NRy0FBWD4KqaufanF5CDajIMBZqYCaIybHyEjXXWWMNZ/3IH1
         k7TWoeyZoPangjZfoDT0i6geJc2EkuHG9dLjsvFp43gUWuZUBNB1ZdgPwPYv60+xthkL
         86PO4vvRRxqSIXtMEawSDok8lqWckhiRrdYlhIZVRgKLakx0434pieKvk6+QozdTES4C
         0SOu+nGN1BCl7Cu91IDUHfqnYGuyCUncS43ibF+cSiK/iinrg3ErjDER1C2lkl7ns/Z5
         ZB5L54iP63gt9ElEtlnijCvGBt+pl+5jP2Oo81WxZ7KNWp9bfEvgTWe0xutAWw+qK6UF
         bg5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184360; x=1785789160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jJ/36eTHsHmAdDJttLKoiCJF2Rw+8DDm9hk8CTzgL2Y=;
        b=sf9PCcw6O4itcuESUUHu9Nt5dHLOXhHy6ZJohWT7NH2NjPommb+PSCo4+3OErNYRWI
         SBr1TiWK3fBaQILRmFEBfdZ9rPTeAwHYDlJfPBul1f4pzFV+mzRa6pcRAjr0Jbm4Uv2j
         TEosf5nqZn5SJhkqCLLxdMeS9H4j1FKcv3PC1U2T55+0Z0eec/fzO8ilpWTozRwn5jnv
         4FhXK40ysdwCtLPCefSOo/Xhh8AyYYT43VNOO+njQb6wCxO2z7uAtTiQ147MrbpIP1oI
         XPGtjkbzARCdbXQEpImSw2MRcm+IUgHeqIprodhRqpzOKr/cZqXr/stcjItk8B33315Q
         PMNA==
X-Forwarded-Encrypted: i=1; AHgh+Rq07PhZ6LMNubhKEcdLe+RtB/+Yf2K2WHFmKAiPBiyCCP7keOJ7BRMlHsbeOR7RzZI0z+LUe5+RQ4g=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywrea0FtmWH/pCtzau4qU64TBVyhuVLk+VGszxC5HU1biCOISzp
	KAjQgtMKfFIJtmcY+lHVNfPCZLN4Lkru0Vwfo12MkkKa7XE8cNdeUGGB
X-Gm-Gg: AR+sD10755m52hTWJFd1H5fLqHVi2747Cai0fbpvixEdDaMWf3dYdKVhsOeCQwqVz4l
	TCSCeZXqbyBlcoXVb+uVs/in283Bq/s5EHjjxyGe7F1gjVAFCakId+izBeZ0x7y7KrPIojhZvdZ
	ibgqVsD+jlHx2SCoFR9IRTcElfmrpbOCwj49kLDGvUPDuf6w2fDarEU50vn5fgREUGlMqC289uY
	fyzgmtTnz+DSRITdpwwDeID5U+f+PXQFg8jVNePYQgir/q8ueLaimrYDJfgpkttBOr//ri5d4kS
	YSf9ooRCrQljrfbV8BFEDSk70Rl5A9Y9yRHk+O6JjUsQohRYgqWJdflMN8RzsTAAOxSbYbi8VGc
	7nFQ8i/Q4GRsAIisr16EFgcR6z2aIrjNJBKx53L+ifQ6sNo6qmZN45DxZxhp9h67bwdMrqF+eUh
	p/eueM
X-Received: by 2002:a17:902:e945:b0:2cf:30a9:93fb with SMTP id d9443c01a7336-2cfde880c9emr98123395ad.34.1785184359730;
        Mon, 27 Jul 2026 13:32:39 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde59b768sm41551805ad.4.2026.07.27.13.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:32:38 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>
Subject: [PATCH v2 23/64] dmaengine: timb_dma: route callbacks via channel BH
Date: Mon, 27 Jul 2026 13:28:51 -0700
Message-ID: <b13242b2b3e1ea01e6c1b7b2daa32836b8ea5398.1785183549.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com> <cover.1785183549.git.allen.lkml@gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Schedule per-channel BH work for completions so callbacks run through
the dma_chan deferral mechanism while keeping the controller tasklet for
IRQ handling.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/timb_dma.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/timb_dma.c b/drivers/dma/timb_dma.c
index 4fc5119854ec..7d43e5712ffe 100644
--- a/drivers/dma/timb_dma.c
+++ b/drivers/dma/timb_dma.c
@@ -438,6 +438,8 @@ static void td_free_chan_resources(struct dma_chan *chan)
 
 	dev_dbg(chan2dev(chan), "%s: Entry\n", __func__);
 
+	dma_chan_kill_bh(&td_chan->chan);
+
 	/* check that all descriptors are free */
 	BUG_ON(!list_empty(&td_chan->active_list));
 	BUG_ON(!list_empty(&td_chan->queue));
@@ -580,17 +582,25 @@ static void td_tasklet(struct tasklet_struct *t)
 	for (i = 0; i < td->dma.chancnt; i++)
 		if (ipr & (1 << i)) {
 			struct timb_dma_chan *td_chan = td->channels + i;
-			spin_lock(&td_chan->lock);
-			__td_finish(td_chan);
-			if (!list_empty(&td_chan->queue))
-				__td_start_next(td_chan);
-			spin_unlock(&td_chan->lock);
+			dma_chan_schedule_bh(&td_chan->chan);
 		}
 
 	ier = __td_ier_mask(td);
 	iowrite32(ier, td->membase + TIMBDMA_IER);
 }
 
+static void timb_dma_chan_bh(struct dma_chan *chan)
+{
+	struct timb_dma_chan *td_chan = container_of(chan, struct timb_dma_chan,
+						     chan);
+
+	spin_lock(&td_chan->lock);
+	__td_finish(td_chan);
+	if (!list_empty(&td_chan->queue))
+		__td_start_next(td_chan);
+	spin_unlock(&td_chan->lock);
+}
+
 
 static irqreturn_t td_irq(int irq, void *devid)
 {
@@ -697,6 +707,7 @@ static int td_probe(struct platform_device *pdev)
 		INIT_LIST_HEAD(&td_chan->active_list);
 		INIT_LIST_HEAD(&td_chan->queue);
 		INIT_LIST_HEAD(&td_chan->free_list);
+		dma_chan_init_bh(&td_chan->chan, timb_dma_chan_bh);
 
 		td_chan->descs = pchan->descriptors;
 		td_chan->desc_elems = pchan->descriptor_elements;
-- 
2.43.0

