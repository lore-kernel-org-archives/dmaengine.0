Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9726D43553D
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 18:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786385582; cv=none; b=lQvYw9rQoWliMQeY0e/EAlhtBQL9hDblJCn3WRfRfIljrtd3giEisZ7V3J/zQ1xC45AEhV7NRA77l40HziYtD9bCyfZXqzhwyT73zIcDy67bg6eaab0qRmpjCdn8CSU93Ot9T5+ZO7j+rLfQiAqrhPys9b2NdSa9f1j4oP0u/gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786385582; c=relaxed/simple;
	bh=E2tVVahiEfiSwa0DcP4d1RfJxRDEhPgKD8HLYsgugx4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GaK8s1vZmzuuVbu8V/LPlNCTmuCRVPVW4zm5NKhHE2XvBJ6CgHB9MBPKQrhywFfk/Wr6iWBl7yiNYAnUnGwWeWCeVJMolu+bdnqFTM/hLJh6gx0B6uozSOGi3a/7o+v8TH3gJAYyqe18nJWgiOpHWP+CkCDUJFnKB0CFL9AyMaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LHpiw8Os; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LHpiw8Os"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cf52d15d88so19429265ad.2
        for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 11:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786385579; x=1786990379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NJJYd1UvvpYlQGN46E9GIRgAsLwA3hYqM6XgiHJz9nQ=;
        b=LHpiw8Os1NrpRQLvwTrPTx03Ptucq5PTxV8mZ7JxFeinPL0+nNOlHm2YpOQ5IGjjLv
         A59RooxhSeTWOZ5j77wwmyu7tjxBwkUjzdN/O1Avo5RIAVFCsG/G4KW8BUBU87Ai6B4Z
         VaM7nlpYkQrbYmlQWgY/qUuLIGOLHT7ihtI11GzbZVfz0rw8UHih1zRpBmwYYKs/zTNB
         8V6SW9J2HBJJuwwuR83AngPOMOXJqdOyS+JEB4Ubcd2QVS9M7iVaoYkuAq/V7LmKT5ED
         6/sXn8ASeExiqHeoNZw7bMzwU6OKQgwa+B/gkmNo7AnIWqO10S2xPsPR+O364H2lX0ZP
         Z1Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786385579; x=1786990379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NJJYd1UvvpYlQGN46E9GIRgAsLwA3hYqM6XgiHJz9nQ=;
        b=KkPJLT2B21RPaF/fh3YGbN8oZfA7InglF6w0LowKm96x2zrxaFDm3TPh5IqDBpzGq2
         VqSZqaOJF9D5z59bRMaHTWTbumWUbdMguXJnywqkm1OioLMux5kZKnpSveHabYcGBZvG
         q423/yCnzPwxdpGsQ7HGmBLavi0avUevjWpGzRCSDr4HPteRNUkozsHqq4tzruzBOtjO
         COfhSGBc4sQyvKtqpkftCvbdnNv4VMl541NmImgvipGwPN43EXifFf70c+RQOTPGS80S
         +WpVGWqR1AbUIVbLgkGqm2HsYai4WgyOpzytRqwrrwyh1LVisINpv+7NvG6AGjdUYK/q
         zyYg==
X-Forwarded-Encrypted: i=1; AHgh+RrjHI/fZOiggSIn8VXCc8mAhBb5pRDR91EK6KM+uQjNcBXQtRhWrYjwPJVPzVytXzMidFZAMj/nIC8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyoDdEzn7hqEwjiekIyVWUHDABZ11YLcw5s4/TN4ebq8MkB/AQ
	CFtKCJAkXi6EX0c8PLDt5dtimaB+efXF/I9zIUwf8cSjOGOy7TbTewVXAGad1A==
X-Gm-Gg: AR+sD11pOAmR6tZfQCapiKardT7bU/RCxneZl/ucqQKKurPy94vbh4xxHPDn8ZVbBLQ
	zkpsGo/AuXhYktxFgo9XaLXCuZaN7XgWQNhMwQguNGHFNqjD6rc1irnOJZJ5EupECl/B2h7b9uq
	Y2b2rsJFa82rvt5kSjkiNTCI+rZKL5wo4jwrUQlDKsv36lIkne5xXP2V8tb0lDJ0sJ+aFDnHpRH
	4ozHRPzYR2UGTEjlgaYiJYaMRGX7aSa4MxTNSmGwY7OKvSn23CwPU9zCzoLze/q9vru/wCsZcha
	GdtuHZr4yh3+trzMEO+6Inp6Y7au2WQt91G0wJWqWwJB9lO0507gWw0alc+Pz/UXOQS1Xo8jeuN
	TTqFWHGK9vVuoQ0vV5EHhav6HQ51GDzTlPW+yW7Cl8PWN/hVxT2t42CziWBj/WjFCncmyVKBDLw
	h29UR7Bt7/AQ7u0xQUYY/RQZoIBHlivJgnLa105lOrlag91+CDGlMh318U0xkXyGY=
X-Received: by 2002:a17:90b:5350:b0:38f:1a2e:6e56 with SMTP id 98e67ed59e1d1-392822dcc89mr21756290a91.9.1786385579551;
        Mon, 10 Aug 2026 11:12:59 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fa9:fa00:b1a9:6513:83c6:1d23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d53b873asm472795a91.17.2026.08.10.11.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 11:12:58 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>
Subject: [PATCH v3 23/34] dmaengine: timb_dma: route callbacks via channel BH
Date: Mon, 10 Aug 2026 11:09:24 -0700
Message-ID: <0950412c2bdfac1b4014903dada42f4aec055bb8.1786384169.git.allen.lkml@gmail.com>
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

Schedule per-channel BH work for completions so callbacks run through
the dma_chan deferral mechanism while keeping the controller tasklet for
IRQ handling.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/timb_dma.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/timb_dma.c b/drivers/dma/timb_dma.c
index 4fc5119854ec..5a2374aab02a 100644
--- a/drivers/dma/timb_dma.c
+++ b/drivers/dma/timb_dma.c
@@ -438,6 +438,8 @@ static void td_free_chan_resources(struct dma_chan *chan)
 
 	dev_dbg(chan2dev(chan), "%s: Entry\n", __func__);
 
+	dmaengine_kill_bh(&td_chan->chan);
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
+			dmaengine_schedule_bh(&td_chan->chan);
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
+		dmaengine_init_bh(&td_chan->chan, timb_dma_chan_bh);
 
 		td_chan->descs = pchan->descriptors;
 		td_chan->desc_elems = pchan->descriptor_elements;
-- 
2.43.0

