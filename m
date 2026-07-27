Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1EF422542
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184277; cv=none; b=BK/whqsjkxzEdBEwhbAqPS0koqjZXAMFtjkG+FnY8tTMAaA9Lnlknc7LF2/OKssw+u0woESf8cFtYw1ElFJNBjACiMq9hlwwNq8lPFYmyzNiHtDYlXR51AI4LbYsIGv3a4q1ywVoyyIE5eJHtTElppl4j0q0kWsEmqg/NkKal2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184277; c=relaxed/simple;
	bh=mOlGoJZBkCROI27aYnV5VfBJmM1T4IxgDbGolClMypY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XrROW43dHWA9ngRX3zss5uy+pLnANWlGvUmdWE3ZroeHmWdfVQ4JYe+3/u5cwgXkZXnUv0BxhmFfVvajUgQkywwlKjQiRfxdCXZCAP2vfYLOYkWBrafadrin4aFchLsn310ztbe+9fcM8ayqh+45/ARP833X9usD+Azpr0DprqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ewSVibUA; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ewSVibUA"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso35146705ad.2
        for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 13:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184276; x=1785789076; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DQRhM3rT7FoTMhNOjiuobMB557pHWoxuWR/j4jNacaU=;
        b=ewSVibUAH9s+rz4AqB9eJrISdWs0pV4VLuMmcpFEFeoxNXs2X180vJVACwYuR8DzOm
         MwnnZFJv1W0pAl533EXW7iJaQaKGHYixpHStwyZl/bgnipgsqpAz3yMVIILsXzB4Gs7E
         1+YL9tzB3I5SOP36X23hF5hJ5sd89V3NVOJtBXUEUzxMKH0f/PjrzoifTeW4dDw0YJaB
         wlIzXwsi8bX+BazX1+1l3l65BvQXpVW/J7GvwiJa3g15qTRn2QKkjAcDGL9sbjSXqXI2
         xDxtjbQoGMSkFUJGJ4VFLFzFsZzW33Q/VXtHfY5o/IohfdCR2DK7x+6FzFKIG2QUHuS4
         R12w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184276; x=1785789076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DQRhM3rT7FoTMhNOjiuobMB557pHWoxuWR/j4jNacaU=;
        b=gWejTA2wmq3ZzJcWeO08uggvNW815TmUihO3NpIm6Mry8pEYcvz/h0FGRmWrLDfrzB
         yqQdhgwosMiLT6rh5IWErsciXa4NZIvgcYLlCE4aKXTtBLKOzNSdhj1/oQIdYwc+M3Km
         XcDPa4yqD3kWlmYNC5y+4R6EY5ON9a5Ac1Q5wegi3Nz/CWr69G3spGNPqERZdFdgwxgl
         VYTc717fo/Qr4iwiE83Wlo56pPWmHV7CDHgmCT4Qn9Al/tpsWl7bG8J/sopwwmvaGYs0
         YQVA7aXloAUiAtaDSXx5tCIMN75pq9CWsBh32gWiAjgrf78Y8cNUrKqyZiGVYyyiP1+k
         SnPA==
X-Forwarded-Encrypted: i=1; AHgh+RqQKfomPZqNHmmysKLJkovNrqAs7esoOyYZgsUN6coeCoZwpanuVMAaXr2ebNcLRfKaZ7gv361FYmc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxpal9ANuYM1nCsS6bXBTNP09TCa2z/WNn49h73wiDheEukuuRa
	WY9FKokGuRvlZ8w7PLpzX9ZX1M4y7dcLwZ+49eU06uICQ5c0/2ks7gWN
X-Gm-Gg: AR+sD10BFrTN6UMXXCQgK0YnE80q+Y/c3IU01etf0kzJzoCzdrqesbp/K5JnmzxFaPc
	GSYf1CmP+MPfs12gGkmkT58qv/T4ZUYXjflNSjgqN7iW4ZLvxsfseJ7d5iEzt+Fgcb8hyaLG2V5
	STKRimd0jwbl26KKKzR6DCDBCumZ4mEAFf9w1A5aQ0h3hiamONStjUHtjS3Oe4Y13IvEDiVqST0
	8W4MCwcbygmTHBOm0mQ6dOnScyjY1bQH8DgNpJv8mc3bmN0WmR81rXF9Y2+y+eclxLdhStDi0pf
	saZMlen/HexGIegKLJiOHRE7/liBTHtZKDyemU2tYKz7ZEg+Pgq7VL/vEPGgO8ZLNcXoL/Nx6Nd
	YCSoS14f0vxhO6g7Ssy1Oz9kin1uH3+t7nlmCTbLuHFpQhiTqdYd9YvL7fFE3qi9IUwMkuCY/ou
	ZZg6Uy
X-Received: by 2002:a17:903:234e:b0:2c8:f34c:82c0 with SMTP id d9443c01a7336-2cfde683786mr92287575ad.2.1785184275736;
        Mon, 27 Jul 2026 13:31:15 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde59b768sm41551805ad.4.2026.07.27.13.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:31:12 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Zhang Wei <zw@zh-kernel.org>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 06/64] dmaengine: fsldma: migrate tasklet to dma_chan BH
Date: Mon, 27 Jul 2026 13:28:34 -0700
Message-ID: <8a4883ce4557e4cc5804b9d29ee56e6a2570af6b.1785183549.git.allen.lkml@gmail.com>
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

Replace the per-channel tasklet with the shared dma_chan BH helper.
The handler continues to run in softirq context while dmaengine owns
the common scheduling and teardown mechanism.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/fsldma.c | 10 +++++-----
 drivers/dma/fsldma.h |  1 -
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index 22d62d958abd..1cb6ce327078 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -968,18 +968,18 @@ static irqreturn_t fsldma_chan_irq(int irq, void *data)
 		chan_err(chan, "irq: unhandled sr 0x%08x\n", stat);
 
 	/*
-	 * Schedule the tasklet to handle all cleanup of the current
+	 * Queue the BH worker to handle all cleanup of the current
 	 * transaction. It will start a new transaction if there is
 	 * one pending.
 	 */
-	tasklet_schedule(&chan->tasklet);
+	dma_chan_schedule_bh(&chan->common);
 	chan_dbg(chan, "irq: Exit\n");
 	return IRQ_HANDLED;
 }
 
-static void dma_do_tasklet(struct tasklet_struct *t)
+static void dma_do_tasklet(struct dma_chan *c)
 {
-	struct fsldma_chan *chan = from_tasklet(chan, t, tasklet);
+	struct fsldma_chan *chan = to_fsl_chan(c);
 
 	chan_dbg(chan, "tasklet entry\n");
 
@@ -1152,7 +1152,7 @@ static int fsl_dma_chan_probe(struct fsldma_device *fdev,
 	}
 
 	fdev->chan[chan->id] = chan;
-	tasklet_setup(&chan->tasklet, dma_do_tasklet);
+	dma_chan_init_bh(&chan->common, dma_do_tasklet);
 	snprintf(chan->name, sizeof(chan->name), "chan%d", chan->id);
 
 	/* Initialize the channel */
diff --git a/drivers/dma/fsldma.h b/drivers/dma/fsldma.h
index d7b7a3138b85..cab33d010d51 100644
--- a/drivers/dma/fsldma.h
+++ b/drivers/dma/fsldma.h
@@ -173,7 +173,6 @@ struct fsldma_chan {
 	struct device *dev;		/* Channel device */
 	int irq;			/* Channel IRQ */
 	int id;				/* Raw id of this channel */
-	struct tasklet_struct tasklet;
 	u32 feature;
 	bool idle;			/* DMA controller is idle */
 #ifdef CONFIG_PM
-- 
2.43.0

