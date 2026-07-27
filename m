Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B166942FCC2
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184391; cv=none; b=fDpzj/CphYfn1b4UeLF04f2uEAWllpqLx2J8SqGoZ+1SIWdQJHwGdIzRmtVVdhFEGDGlIzfa+OTl68kBdabo9t6uOsQdzGMpaMPaXVoWa+TtxsSjdbU/PRAiaj9vJbl/U6XIi3kLs9OVv2VYr60dSyiVaSSRuvCy6GeSuu/FO6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184391; c=relaxed/simple;
	bh=rwpkv3U4oxlJnzkaiO4BXPV8Z4PCynKPn3PjP6Afv2I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H87yBHlKFP8G6k3vgOh7GbrwALNPOHGxVCt/9QPAa4ZNgyYop4+i3vN7QBCe/Ie5RR9QADZKiG0fbd4wW1NrtUGEaqPIvCZuhbIFPME6Jch+ueYTNCZs6jYO24aBbzq58Ffii4LOBMpbxEAD+CFparcYCoSxmywWjg/73oCezT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZEyqyJjE; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZEyqyJjE"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ceaf8a1265so38150865ad.2
        for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 13:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184389; x=1785789189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XalOy749noF7U/PkVHpodOoYcCuV0B+dPZogs4Uvtlo=;
        b=ZEyqyJjEH/uhSQQvNYfpMxMQGepBRbvfA2RmQB5AwBPbDPoTdCT8wHAgaBGqogL2k1
         0IDUF2M1ByfAQ+uPQL84klb5BLyLE/FEUXM9I/uhJ5MbDzDXaaoePXTrv/7FS/OBYbfC
         3ePG507MuhfsEbniMgoxg4tCQ9Jlo1qV/xxF/54D0F0QrvFR6ArcCw1l+ShRz9QpS35+
         IPiDQtuZReFqUdOTlg/O/pXKoGBKXbchiZ76/QAocIwgPjEnGXwEI89V6Fhbz2zsLA6w
         HOEcNeHB2VEZwQYiNJftG5nn/dzRG4yOnhslecPaccK9SLoeTSY1ICcJL0FjRtIyn7XE
         AsLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184389; x=1785789189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XalOy749noF7U/PkVHpodOoYcCuV0B+dPZogs4Uvtlo=;
        b=Urj7yyeIvustd+0cer0gtnFRknk48fUekTXi7YcCbgcOgx1L4KuGzzan9J3QZPZlkR
         Hy/bIEyTN/m2e+vwjGvB46DLJXE1DyaMtWdnXLQa+uzE6HyF8Oz6XxXne0mrBHboAk8D
         /lJ/oMIHSvywmVmHXJb2DA+slAzgVPSaX9JVI2McHYZzBeSQ1fAKW/m3N8e2uVrtR8Kk
         zBOvQswblg4+wIrSNYfYA9tQpIrB+q7eQuKhxKzhnkH6V4uEs9nmANX4wVemrzfQjE6u
         W//zBOwTsjgztkJi097rAmjy+urwlMyfIIUo5W/VTXNh8eSzNqOtg2Fz+jJg+lniHaI1
         fydw==
X-Forwarded-Encrypted: i=1; AHgh+RosC3EdGkeYumvj6tHG3eV3iTK5PXOoKeS+7iuXWw2d0plMpYU+zcyn7/GX2SFQPaPzkPPmSj0f+II=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1lfpzCrPFz0klxW1IRIyivaobwXfwu1ZFemCHNv+dFqYdtiax
	eMeZg1Va7i0lLBVvrIns67ZDKVSn5vTwy2a1Wz1u71Bj3QUhnlG9z2l9
X-Gm-Gg: AR+sD108NuOGGQy5JqgKHuO7ol4Ub0L2MzJk1/InA45lT/wbe8zv4ryYATlgcuh9JgF
	Ua6gnjpNVOA1nE4JuE3lu9jj3RIl+HBCmZK9la/W7rFgnvWxmX6rF+ugi9hyHa1MHW/8qQi9jXz
	dMknJ7kIuAgCd9yuXNp1kzgWdzqTLxdB+hzT/t98XFr47pRg4vwdOC2pDM8SQ0YHOV+EjSieUfT
	XCegsp9jzLxYudxHx9GUBlxi9319+/UROB2iqSsV/du13KIX39vFU+q56WlmAYIb8j4QC30su2m
	FvZeAwRuvii+kIpKtyNVnNcI5sHqw8dPraXh+8idiPw36VWHlXQnAX/pJNPgM4BUxZEBUXbkbuP
	UZ4996fWy4lwoImJOIxNe2q9n/8gnFe7pdRv8dXeaN3fg3pVKB/DOlqKhS1pj6QafRTODkdsSTR
	6AveKw
X-Received: by 2002:a17:903:3883:b0:2c6:9f66:d573 with SMTP id d9443c01a7336-2d00f269a27mr8646415ad.2.1785184388895;
        Mon, 27 Jul 2026 13:33:08 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde59b768sm41551805ad.4.2026.07.27.13.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:33:08 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>
Subject: [PATCH v2 31/64] dmaengine: pl330: route callbacks via channel BH
Date: Mon, 27 Jul 2026 13:28:59 -0700
Message-ID: <6043500b5b32bf53eb0cfc4d68e82d5822ac8f60.1785183549.git.allen.lkml@gmail.com>
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

Convert the per-channel tasklet to dma_chan_*_bh while keeping the
controller tasklet for non-callback events.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/pl330.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
index 25ba84b18704..f4940bd1ab84 100644
--- a/drivers/dma/pl330.c
+++ b/drivers/dma/pl330.c
@@ -417,9 +417,6 @@ enum desc_status {
 };
 
 struct dma_pl330_chan {
-	/* Schedule desc completion */
-	struct tasklet_struct task;
-
 	/* DMA-Engine Channel */
 	struct dma_chan chan;
 
@@ -1574,7 +1571,7 @@ static void dma_pl330_rqcb(struct dma_pl330_desc *desc, enum pl330_op_err err)
 
 	spin_unlock_irqrestore(&pch->lock, flags);
 
-	tasklet_schedule(&pch->task);
+	dma_chan_schedule_bh(&pch->chan);
 }
 
 static void pl330_dotask(struct tasklet_struct *t)
@@ -2060,14 +2057,15 @@ static inline void fill_queue(struct dma_pl330_chan *pch)
 			desc->status = DONE;
 			dev_err(pch->dmac->ddma.dev, "%s:%d Bad Desc(%d)\n",
 					__func__, __LINE__, desc->txd.cookie);
-			tasklet_schedule(&pch->task);
+			dma_chan_schedule_bh(&pch->chan);
 		}
 	}
 }
 
-static void pl330_tasklet(struct tasklet_struct *t)
+static void pl330_tasklet(struct dma_chan *chan)
 {
-	struct dma_pl330_chan *pch = from_tasklet(pch, t, task);
+	struct dma_pl330_chan *pch = container_of(chan, struct dma_pl330_chan,
+						  chan);
 	struct dma_pl330_desc *desc, *_dt;
 	unsigned long flags;
 	bool power_down = false;
@@ -2173,7 +2171,7 @@ static int pl330_alloc_chan_resources(struct dma_chan *chan)
 		return -ENOMEM;
 	}
 
-	tasklet_setup(&pch->task, pl330_tasklet);
+	dma_chan_init_bh(&pch->chan, pl330_tasklet);
 
 	spin_unlock_irqrestore(&pl330->lock, flags);
 
@@ -2354,7 +2352,7 @@ static void pl330_free_chan_resources(struct dma_chan *chan)
 	struct pl330_dmac *pl330 = pch->dmac;
 	unsigned long flags;
 
-	tasklet_kill(&pch->task);
+	dma_chan_kill_bh(&pch->chan);
 
 	pm_runtime_get_sync(pch->dmac->ddma.dev);
 	spin_lock_irqsave(&pl330->lock, flags);
@@ -2490,7 +2488,7 @@ static void pl330_issue_pending(struct dma_chan *chan)
 	list_splice_tail_init(&pch->submitted_list, &pch->work_list);
 	spin_unlock_irqrestore(&pch->lock, flags);
 
-	pl330_tasklet(&pch->task);
+	pl330_tasklet(&pch->chan);
 }
 
 /*
-- 
2.43.0

