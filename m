Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0860B42BE9E
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184889; cv=none; b=EnW+at30+r/h3+K7We1S0NXp/oJ7yUYY/InpXoSI7E4DlqgCHHVXgYZIDSD9KqcVdkzYydPPzQ1l9CifTwe+NHwAwmq5iBlGhGz+uprBvgFiLdliyEsbH1vLS3N14u+eYL9JZgOawfic+niBRcGZgI1DyWH+d9/rUKnNWp9Kocc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184889; c=relaxed/simple;
	bh=csZmG/QQd9RZsCilaK/kTmTTDK/yeFglGk5V6PZWL5M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AyD6xwzEliwhTH6lB0NRVR/8Ikdozmpt2JJLQ1hJ3khk9+IDbi3MXi0w3mydUWj6ddlOhqiQ3oBevgb0528LrTdaRCzzCuCTcT0gPESLnDLoDacoJPSL2UoCPQEB1k6cBsoZkmFpKqK/Xj2eHa0Kla8t7yXtTwdEpFB/DFZJ4rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VXxBieTx; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VXxBieTx"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8485bd28dd0so3198292b3a.2
        for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 13:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184887; x=1785789687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mlYzshcUuqeXbSVd1G0xYE71JjWKlgpwKVLPDuR4LcQ=;
        b=VXxBieTxMhzgADMZBOaVRgJzFWR58I+NJQRoyk2TGCSFkMuvwJTgoTQxTk13LYZ96l
         5Uya5N9S/B1mRy2xsToG8wBWaxiYberC5k2nXPbFxwY4b/d30mq7OIlTWofyL562OX6P
         PizmJ+67azAUX7RfOD1Y8MdEmEWOZYmMGo/1qKDAO7mTBCqiCIJyac8CGUVSdB68CZJV
         GxrtOExtscNjRaAcFOojl/37w30+BYp5vPj+ksyZz/ruVGgi0NSZ8Kq49JjH9Pu0hEtR
         dt49mp5yVJmCEdep9TsTiMp80PNA4oRDMDNIe7TuF2mGfoPS2zVPAgUIFAD+Ykwod3fI
         MQgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184887; x=1785789687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mlYzshcUuqeXbSVd1G0xYE71JjWKlgpwKVLPDuR4LcQ=;
        b=tYvu7a9kNjaR412ugAjb+c1R3GrQTZvkx/yS0pkIw31aBgh/ubwdGsIESgMF/ZxQ7Q
         l81KhyMwGgOuoZnlajUq5rgqyutOBq7QwgbG1aYZLN4AOv2Jr8TbFsQmGVhF+L6TGulN
         txkuNa6evZ8PtoxwmJXz9yNNYoAIgTN4cOzMHCViuhaXZaYn0WSCukpW4ffKyE3NrPuw
         qkAEXnilhCyq6WuzTGUg5JmnCRZJbkqk1FcIsr2o+kI/y29mJUN8eJBZfGguNzwGLou7
         cDZaVtR2SzlDm3u3VS+F7gLzveoaPPyRi6uM5fBKuwIKyFNuvoTKG2R3FrTqNwK6G26n
         v+yA==
X-Forwarded-Encrypted: i=1; AHgh+Ro0MFrOrUDoE3VgUSoOe9UOU3pP1BFtDTVwM9Vl7KUVyuSTwkZBUckfObt60gM739qsmIr720tZlU0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2iqcdHp10Sq86wpdybCdsEmFCepekQRE8IzKruEyxR91jkiAK
	H62/FZ0ICuusmRmFEUr8qdHo4QuWFa0jRrq8r1RzEV/V6cIV5PM86YDX
X-Gm-Gg: AR+sD13vVD818coW4+MxnhXGDI3QaFl3ddgCwhXtZjoUMQirKdU5NBzrCB/81hdEw/K
	+RfmQeT0cD98L5dFJTt9pDkKKUDdB6IQk3d6g3LU15oAItP4gWhB/q/PkBimovJRcsHATwGHMJb
	dJYhv4K1mBupKVfkNF29tHqgp5fnJODPhhdXQd4WdEmWsTk31nMsQ6SGLC+pDLr8gbnSkLY4dN0
	8Lro7Hcnl5hPjJRZAm8iF0y/P7k4bmVhweWvwIBCHgCjGoLPt5Ko+rpbiop9yRQeHgHBtUGZpNk
	skMXc3eqRfk1hojaezHfsXj06grLzgQyoh8b3Or3WBt4Wwdwg8212RmxyDLqo9QiMm9jWP7ZkBy
	WnTPo5ebko5cFN/I7vKZNOLQMhuaau4wT01QeTjopOfGBY3A8MBCvflnAbpusxiqab66TOjdeXr
	HVyZrj
X-Received: by 2002:a05:6a00:1bc6:b0:84a:6726:62f9 with SMTP id d2e1a72fcca58-84e8d0ec187mr868586b3a.9.1785184887318;
        Mon, 27 Jul 2026 13:41:27 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e533d1351sm3583338b3a.39.2026.07.27.13.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:41:26 -0700 (PDT)
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
Subject: [PATCH v2 61/64] dmaengine: dw: defer callbacks via channel BH
Date: Mon, 27 Jul 2026 13:39:23 -0700
Message-ID: <4399a85a5ffe0dcbace462217f15c682c5f8d28a.1785183549.git.allen.lkml@gmail.com>
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
index dd75f97a33b3..e780116a944b 100644
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
+		dma_chan_schedule_bh(&dwc->chan);
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
+	dma_chan_kill_bh(chan);
+}
+
 static struct dw_desc *dwc_find_desc(struct dw_dma_chan *dwc, dma_cookie_t c)
 {
 	struct dw_desc *desc;
@@ -1256,6 +1278,8 @@ int do_dma_probe(struct dw_dma_chip *chip)
 
 		INIT_LIST_HEAD(&dwc->active_list);
 		INIT_LIST_HEAD(&dwc->queue);
+		INIT_LIST_HEAD(&dwc->completed_list);
+		dma_chan_init_bh(&dwc->chan, dwc_chan_bh);
 
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
+		dma_chan_kill_bh(&dwc->chan);
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

