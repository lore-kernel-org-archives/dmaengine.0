Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316645;
	b=HsPUas6I6acKuQHJbYM9ufY5tV+RVakq9QOoVJNvjD2DF5y+03cgYUqAAfkbnfB2+Ztl
	 vCvEEqn6HnZeyqdCelAUgx42RACSq+3WsNNLSsXZXnpRWSKVVhfokMBCsP7ve4gvjm0Cn
	 8p4lomEqSixPoQeLxo8E8K4emj2VAa6Ekj6ijmdBHzN1x7bF4SbEXyd+krIMis31cEtVS
	 WtCHKlwFto/RcWyUBPoUoWlnwIndFjEv6GMFrPNy0exkOCx4YR15v2WxQ7kiKut3fTLiC
	 xWPi04z/f6BjSIEITk3S63n2Bk/MN6jsywhlTx7iVdq/fcQLnTdBHEk7UuOWK30JKng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316645;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=amYKu9Mlu4ZUHnYh3zoqDs5n/EBYvfKM0p/VC3iZw/s=;
	b=LJqZT2O7/4EsU8UYdJEmwEOQatPq4ojkY5oHOf5BAz6nG3LfFXZeii1Q/uSL/8V0nii8
	 8g7IrVuWJRH58LyzVSS+9lK0+T8HydScqmQcUsa2Ty0kViUZ9CyK87luZ8pv3KmnbZmmu
	 rTU7vpjPyVt2F1d6Iem0OA3Z9fvaExmGuDjrsLj5uwXcQ0sb7lHku6OO/DVaBn0umdfoN
	 5M4LTzRiuSc87MZjQRQeS7Lv1vc21PcbOsgREq/Y41gZxKLdqqcAW23k2nYZQtNEmX/B7
	 poQdByLKRJpHnL3YPxS2ZVLPE49PlTgUbw803lZA3/U3nI7OT9Vsk6bWB/8itFb2/zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MrXf8wWm;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BCD6071E4B
	for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 13:17:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90BCD6071E4B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MrXf8wWm
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so911506a12.0
        for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 05:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316645; x=1794921445; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=amYKu9Mlu4ZUHnYh3zoqDs5n/EBYvfKM0p/VC3iZw/s=;
        b=MrXf8wWm4iXgPVf0ei/9iKm3ujIo9AFWMrhwj29tFnKI1mmLIEFlXjP/1YH8S/xjmS
         zxB9Mgu4BvYCkCzLLmHZUnNv8B8NLGhZUK0NjPxiKrjOHRPKhTwM2eMcLJbaoU0kT2n+
         DLgepPgo/Ey390mn/I3PmZNRE/okJgzTVRnWAOQP7HQdX7rH80ynykHaDfbLNiXtQm+r
         Qb3CGyUXDsKdjb8sscBvef8EkBw/qHwU9FtFQnHKMb7lIgTGs3w0cWq/91ihcye5Z7HF
         PuLssEcZks6LItj5quTqwp/6C83BCCYnhGJZrVFgsHLGnBEdAGbtB60JVU+a3ot8Ydl8
         Oa5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316645; x=1794921445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=amYKu9Mlu4ZUHnYh3zoqDs5n/EBYvfKM0p/VC3iZw/s=;
        b=tqC27Xx3TEwbBhfxx6mh4rDISz0KhAAPhTaUu9X8jQ3lTCQt1Lw1hg7ezjmURbNmU8
         dmnJnVSw9rUjixY225r8jRtKjCQJTbI8LV0YoZNw9PqyFWGos9Q/WcyGOt4vAeTB9uI3
         JiRjIhzzhATMdLnLL138PjyEYEx9lj/BobVaDfYMkeMLpy6oqgsaM5kEdYQ+bEnrtvhH
         D0/VjgxIXfBfnM62uCdGz/i4j7A7u+QYgZgBVLufe0ZwVzn1UtAuhEv4gFZgTeGmlRyf
         Ti0lAg4QZvBMCk0qtPKtdazhNoCSPUSnT5W6GHR3pwTO1W9p9RkRQITGxAY2kQ/qYlAI
         rCSQ==
X-Forwarded-Encrypted: i=1; AL+hErGjYeCOtI3ei6gl52KJdgW9yF3VaRhp7ocs+2PSKZiA0mevaV4dl5wr4w1f1t9hYvBKGIourXFQoRo=@vger.kernel.org
X-Gm-Message-State: APuU4Z85C/w3RNsaFYlG3pcudF46+VDEJdgin4ibbff0Xaf4cnWpOYsW
	+zIQCkXDW3vKQNiAYdDfG6Iwv2svlCYsN4ACXGsxCFe1zKKXx3Z6lod7
X-Gm-Gg: AYBFou0jdjCRM0N3Absgo2gfmOilfm/RSce/91Tpj32dW5D2f92pTMU6Ugeq7Th6I8b
	EkIs7rK1TI+HdduBhk8JVU+8SEIHXFvA+pJ+CiUR4jfkyj/RNC0WsWlgy8JQnFAxGiZA+JGb8al
	3hx6+v1D+Qv1/9L0h2lsRvZx5QCJBVQHw4AhHvpbOd+XfRmTQPYTTT9NdcKiohb8uY9pjUdv6hp
	dRm4BvtKXiDIfLf4TW28qBMnP5ONUUzynX1vkE0kOZDGJC372KLybpqrxWuprEclIvwbwt4IyF4
	azDE0H/n2L6uH8OgIGFLF09LEU9K9y2AzT6rwMJtkkPK3Q1lg9LqPtctA9wP0S1OisskrDktaZJ
	XeKoaftolgNYz/CPuezs5uNlc2v+zX21e6tuXClphXjfGADhGAVV22x00hfYDh2T0JZ8Go0Bte1
	5aK492ZJsYhLJyyrLzTBlksJY3jN+3qdG6/PH5mZt4ByV6Ud1ppa0LLHcETrg7geIS3Uk8ZqgDp
	HVjFiw+HniIAHSmpvHVcISurDJOnUGy52H8D7RfzFmvVi1GCOWwsPjDIfRKKhqPifLOQOc3kz65
	JlzggA+A0OtDztAQ8L2mFVqSs7Yjfo4=
X-Received: by 2002:a17:90a:e2c6:b0:3b1:6cab:f68b with SMTP id 98e67ed59e1d1-3b16cabf8fcmr1224865a91.11.1794316644780;
        Tue, 10 Nov 2026 05:17:24 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:17:24 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>
Subject: [PATCH v4 29/33] dmaengine: pl330: route callbacks via channel BH
Date: Tue, 10 Nov 2026 05:13:29 -0800
Message-ID: <e9d076ea58ba3701e0f9287ce2fa3ccae4c8df0a.1794315350.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794315350.git.allen.lkml@gmail.com>
References: <cover.1794315350.git.allen.lkml@gmail.com>
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

Convert the per-channel tasklet to dmaengine_*_bh while keeping the
controller tasklet for non-callback events.

Initialize the channel BH once at probe time, alongside the other
per-channel state, rather than in pl330_alloc_chan_resources(). Unlike
tasklet_setup(), dmaengine_init_bh() must not be called again on an
already initialized channel, and a channel can be released and
re-requested many times. pl330_free_chan_resources() still drains the BH
when the channel is released.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/pl330.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
index 977a9fde80ad..6e88f5b45fb4 100644
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
 
@@ -1575,7 +1572,7 @@ static void dma_pl330_rqcb(struct dma_pl330_desc *desc, enum pl330_op_err err)
 
 	spin_unlock_irqrestore(&pch->lock, flags);
 
-	tasklet_schedule(&pch->task);
+	dmaengine_schedule_bh(&pch->chan);
 }
 
 static void pl330_dotask(struct tasklet_struct *t)
@@ -2061,14 +2058,15 @@ static inline void fill_queue(struct dma_pl330_chan *pch)
 			desc->status = DONE;
 			dev_err(pch->dmac->ddma.dev, "%s:%d Bad Desc(%d)\n",
 					__func__, __LINE__, desc->txd.cookie);
-			tasklet_schedule(&pch->task);
+			dmaengine_schedule_bh(&pch->chan);
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
@@ -2174,8 +2172,6 @@ static int pl330_alloc_chan_resources(struct dma_chan *chan)
 		return -ENOMEM;
 	}
 
-	tasklet_setup(&pch->task, pl330_tasklet);
-
 	spin_unlock_irqrestore(&pl330->lock, flags);
 
 	return 1;
@@ -2355,7 +2351,7 @@ static void pl330_free_chan_resources(struct dma_chan *chan)
 	struct pl330_dmac *pl330 = pch->dmac;
 	unsigned long flags;
 
-	tasklet_kill(&pch->task);
+	dmaengine_kill_bh(&pch->chan);
 
 	pm_runtime_get_sync(pch->dmac->ddma.dev);
 	spin_lock_irqsave(&pl330->lock, flags);
@@ -2491,7 +2487,7 @@ static void pl330_issue_pending(struct dma_chan *chan)
 	list_splice_tail_init(&pch->submitted_list, &pch->work_list);
 	spin_unlock_irqrestore(&pch->lock, flags);
 
-	pl330_tasklet(&pch->task);
+	pl330_tasklet(&pch->chan);
 }
 
 /*
@@ -3121,6 +3117,7 @@ pl330_probe(struct amba_device *adev, const struct amba_id *id)
 		pch->chan.device = pd;
 		pch->dmac = pl330;
 		pch->dir = DMA_NONE;
+		dmaengine_init_bh(&pch->chan, pl330_tasklet);
 
 		/* Add the channel to the DMAC list */
 		list_add_tail(&pch->chan.device_node, &pd->channels);
-- 
2.43.0

