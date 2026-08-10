Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427C443787E
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 18:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786385610; cv=none; b=ekL5Dl1UoxQrSza7Eh6nPII/uS+JxcxKTmTKYnPsS08JoClBdvBeloJFnB2PWaC5RJ3vQ1/IVVS2uRasRAw3xUWJGH00gpmtEaCq692wOXjEfDy/jsDmxSA3uH+1hZqmTxovGWX2sxxYX5zGtlePVAn2C3Vnp9Z9zE9Nq1yoEFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786385610; c=relaxed/simple;
	bh=Teowlr4/u6lyEOcd604ePNCUpZdWP27hfF+FWpOCIL8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j26dy6mH2DNvHyQxzi55eTZqr4FrIJeQpoVSkKv0xRJ/7buptcV6Tuf7YHCliIC4RQoi20TG0CCPNqhmkZne+WENOwrbaNXedUZlTt1SdwSpbexI5/58Fr8qsIUB/DfBqpb4VmBE9cCo4fnSIBTh0NItFuE6nlLIYWiSdOjUweM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KCUEeHAC; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KCUEeHAC"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38759bcd877so2462488a91.2
        for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 11:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786385608; x=1786990408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ktKzbp32MXWrTZU+90t9ztCvKSRHsn84A1RdvU/j9tM=;
        b=KCUEeHACPGLcgj4g3POsQ65EccWzMXjMblKecFdGdH9pZt9gzeeuKF/1LX5ZMX2kCf
         yXAUdN/kMu92h3uuAzRmWlJ/YqfSseASvEoSyvOhOUeU0yyemQg9XkkMT9OzynTv0CbV
         PySqOwCj/ZzD7mz8cHBovqzanR/8aNARN0qKTPukmaudnhR6nxq4JARDyMGw/cZJ1dx2
         7JRNQ0O/foZBF2uBRqOr2nfhIE8Z9/bQ/sMDQ9rEXcnbDdA0oFLIypw+YcDlYkXsNrUa
         lduvsgBLsJ3Skyii7nKxLdOzV2muXgJ9QCN874VP/pird3eEAPXe3MNOawwv5mNrw0dm
         sChg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786385608; x=1786990408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ktKzbp32MXWrTZU+90t9ztCvKSRHsn84A1RdvU/j9tM=;
        b=Jvz1Bb6GgJdORY8IoZiZdOk2t83FuAgHx3AnSVLuifiOhMdpR0A6Pjc8gpLdd91Uri
         NMZNXPkOEA4vkhFjIbugL+pNCFTXdtjVZP90WgWJmplxW4QZYQYgKms8+Q1Qdbem4N41
         Mst2o66US7DFj4X9lGoOGDN+m0z7Zxrdv2azMIOBhY1+Ba5iUEiTYibjuYw2UQGK9IGJ
         QmMG7XLrz2iT/AgOrR8bRufqFNAJsJLGh2Xz6Z2h5xB3x3SAS9FPBX7Ak577ig0f7O0B
         ktiDYxxldT306u6eaYTeq65vDuq8A0EN675hvZlGtV2kfhncw7bj4p1I6DX7YyXLjiyt
         ULbw==
X-Forwarded-Encrypted: i=1; AHgh+RrRiK3V7b3B9Z7Jv4ofQuXLwGJdS7Scq8LaOuCLUKHK8F8f0a7z6eKOatePm1IO+9buqwheO0q8tP8=@vger.kernel.org
X-Gm-Message-State: AOJu0YySumoNCt/knF3CldkyjKQVMBLBkazMlgBFk/Si+DUQCymqW7BB
	vzWj0k+6fFBr1pjMBv+Tye6sWIOHY11tM/ZP0X+mWqiWvIDSj72jCCF7
X-Gm-Gg: AR+sD10ic8KDI60E8yW4F8dgLahpDtkvCVKLGK7nzLvMJlk8+etKjcvm6iyGlunfu58
	H18spijEX1tNifZU/0pmM1CUMFhaqR0eyuzOejaJV+RJqvAev6gEeF8Yig6fn5q156O3E3oVw4Q
	LdCoaQ6kJVLW9afcY5yWAQ5VsIf1XkTSkRYAsTzEHnZSDxdpsQg7i2Gp4I9eBJTa7qxvdYQy7tX
	/ZoeJTIb1pz5VHEWk6PpPQt6Q6VHMSFNmKUKH+i/0dBDcAPG6Zk1OGuhvqb6hGjnfyQFNunYNUz
	PufmfhIvxnhx5q7sEDUtZLL+23RxttuV3skTp+L2iRvxqaquHB8HYhPEKoIuSDXlAgu2gHdX43Q
	cM8/XPc1oekTooZZ4IXm4GzZv5JRA/SDMqCsvsoxEr9ZMDuliK1o4+gyMTm6uO9uf8yzzgh4Qxg
	1BV9zx1GbRLasSsbIzuB9KXEG6AaUUf5i5tklOpF74DbFggQDGgCP54XiLgd4Wq9Ic
X-Received: by 2002:a17:90b:58eb:b0:38f:18f9:785 with SMTP id 98e67ed59e1d1-392cc961aa6mr3605566a91.8.1786385608488;
        Mon, 10 Aug 2026 11:13:28 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fa9:fa00:b1a9:6513:83c6:1d23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d53b873asm472795a91.17.2026.08.10.11.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 11:13:27 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v3 31/34] dmaengine: dw: defer callbacks via channel BH
Date: Mon, 10 Aug 2026 11:09:32 -0700
Message-ID: <51d53a46331dd58a67e71cb8c53c6e67f4b5503e.1786384169.git.allen.lkml@gmail.com>
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

Queue completed descriptors on the channel and invoke their callbacks
from per-channel BH work instead of the controller tasklet. Add a
synchronize hook so termination can wait for deferred callbacks before
their descriptor storage is released.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/dw/core.c | 42 ++++++++++++++++++++++++++++++++++--------
 drivers/dma/dw/regs.h |  1 +
 2 files changed, 35 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index dd75f97a33b3..2765acfe5644 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -236,25 +236,24 @@ dwc_descriptor_complete(struct dw_dma_chan *dwc, struct dw_desc *desc,
 	struct dma_async_tx_descriptor	*txd = &desc->txd;
 	struct dw_desc			*child;
 	unsigned long			flags;
-	struct dmaengine_desc_callback	cb;
 
 	dev_vdbg(chan2dev(&dwc->chan), "descriptor %u complete\n", txd->cookie);
 
 	spin_lock_irqsave(&dwc->lock, flags);
 	dma_cookie_complete(txd);
-	if (callback_required)
-		dmaengine_desc_get_callback(txd, &cb);
-	else
-		memset(&cb, 0, sizeof(cb));
+	list_del_init(&desc->desc_node);
 
 	/* async_tx_ack */
 	list_for_each_entry(child, &desc->tx_list, desc_node)
 		async_tx_ack(&child->txd);
 	async_tx_ack(&desc->txd);
-	dwc_desc_put(dwc, desc);
+	if (callback_required) {
+		list_add_tail(&desc->desc_node, &dwc->completed_list);
+		dmaengine_schedule_bh(&dwc->chan);
+	} else {
+		dwc_desc_put(dwc, desc);
+	}
 	spin_unlock_irqrestore(&dwc->lock, flags);
-
-	dmaengine_desc_callback_invoke(&cb, NULL);
 }
 
 static void dwc_complete_all(struct dw_dma *dw, struct dw_dma_chan *dwc)
@@ -285,6 +284,24 @@ static void dwc_complete_all(struct dw_dma *dw, struct dw_dma_chan *dwc)
 		dwc_descriptor_complete(dwc, desc, true);
 }
 
+static void dwc_chan_bh(struct dma_chan *chan)
+{
+	struct dw_dma_chan *dwc = to_dw_dma_chan(chan);
+	struct dw_desc *desc, *_desc;
+	struct dmaengine_desc_callback cb;
+	LIST_HEAD(list);
+
+	spin_lock_irq(&dwc->lock);
+	list_splice_init(&dwc->completed_list, &list);
+	spin_unlock_irq(&dwc->lock);
+
+	list_for_each_entry_safe(desc, _desc, &list, desc_node) {
+		dmaengine_desc_get_callback(&desc->txd, &cb);
+		dmaengine_desc_callback_invoke(&cb, NULL);
+		dwc_desc_put(dwc, desc);
+	}
+}
+
 /* Returns how many bytes were already received from source */
 static inline u32 dwc_get_sent(struct dw_dma_chan *dwc)
 {
@@ -965,6 +982,11 @@ static int dwc_terminate_all(struct dma_chan *chan)
 	return 0;
 }
 
+static void dwc_synchronize(struct dma_chan *chan)
+{
+	dmaengine_kill_bh(chan);
+}
+
 static struct dw_desc *dwc_find_desc(struct dw_dma_chan *dwc, dma_cookie_t c)
 {
 	struct dw_desc *desc;
@@ -1256,6 +1278,8 @@ int do_dma_probe(struct dw_dma_chip *chip)
 
 		INIT_LIST_HEAD(&dwc->active_list);
 		INIT_LIST_HEAD(&dwc->queue);
+		INIT_LIST_HEAD(&dwc->completed_list);
+		dmaengine_init_bh(&dwc->chan, dwc_chan_bh);
 
 		channel_clear_bit(dw, CH_EN, dwc->mask);
 
@@ -1321,6 +1345,7 @@ int do_dma_probe(struct dw_dma_chip *chip)
 	dw->dma.device_pause = dwc_pause;
 	dw->dma.device_resume = dwc_resume;
 	dw->dma.device_terminate_all = dwc_terminate_all;
+	dw->dma.device_synchronize = dwc_synchronize;
 
 	dw->dma.device_tx_status = dwc_tx_status;
 	dw->dma.device_issue_pending = dwc_issue_pending;
@@ -1374,6 +1399,7 @@ int do_dma_remove(struct dw_dma_chip *chip)
 
 	list_for_each_entry_safe(dwc, _dwc, &dw->dma.channels,
 			chan.device_node) {
+		dmaengine_kill_bh(&dwc->chan);
 		list_del(&dwc->chan.device_node);
 		channel_clear_bit(dw, CH_EN, dwc->mask);
 	}
diff --git a/drivers/dma/dw/regs.h b/drivers/dma/dw/regs.h
index 5969d9cc8d7a..c9e32bd6110a 100644
--- a/drivers/dma/dw/regs.h
+++ b/drivers/dma/dw/regs.h
@@ -279,6 +279,7 @@ struct dw_dma_chan {
 	unsigned long		flags;
 	struct list_head	active_list;
 	struct list_head	queue;
+	struct list_head	completed_list;
 
 	unsigned int		descs_allocated;
 
-- 
2.43.0

