Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E580B3E44EE
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 18:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786385523; cv=none; b=m8pb+B6m+rD14cBX8w2OxEGuuNw5pV+kH7TRgzq2vNANhuW7gPB8YT045FrGBd00HbFKN5oH601RKZCTc3corwhPDtR+DMnhmwux5RS2K5HKgIf0vp4BqYljX/oev3tSVgW/fFBWNdlaZ6iReNRWzLWMUUQSJ7BZPG/oW+LcIoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786385523; c=relaxed/simple;
	bh=CMjPhRzimXiJ4Ot2/V9TB1hstuEfE53UMzRmsp3oe+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YmJW39rlt5m0ZGGrmw4V9mFpivrX/tl1PAyKxTfJZtbMcHdijXeGKq1xQWuDx0jDli3Sbk3fotigLVBTafxoP1Jfhv9jkHFv+XdZEJFYCf40KcTa9+Jowft5HnujdFo1Rt2yBQkZG6VbGzZvS0lJUia6xkQUHdWYRqj17TpbRWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=esL4NvSq; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="esL4NvSq"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38e58034d05so2301728a91.2
        for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 11:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786385521; x=1786990321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=APzX/5lv2veYBVlKY7NW4DLHfap6IRfZSwMiuZKOhFM=;
        b=esL4NvSqpdY/TVde5vodONVOujRJUa17fEQHfbXqC+d+UJLVYZDIinJVa2fxAaQo2V
         wZqmNkFgrg9Zx5tq+ZeYcaRVbx2L9SYHrcRLDExnjW4HAQ0FNnTNYNwuylOK0j7ShE7P
         zOiqv+jH1WVFN5WS+0S4WnEmz+rPJETbqZeHPR3kI/imDEEypXTUK8cSM7CP6jMxJLhl
         gW9jOql+dQIAtwRpoKjYqk5jUOSrBw3KRoaCjaibkLtjizPre+cqjRbndp5UficuqoAr
         38dh7/D6RY5eLuZTpMo621MQMPJgnd0cHOVvs4CIq89yhf3vZballaEgbNDyYVEv+JYu
         M8aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786385521; x=1786990321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=APzX/5lv2veYBVlKY7NW4DLHfap6IRfZSwMiuZKOhFM=;
        b=EV5uH5P5KljSF4wsVhNIKCJautqPpaOUQPC/yZKoYgNjLSdVnHEYqf4IJRtDVXpYEo
         sKMzb+aaOZkT2RFNPRf9cgOe103IyYvPzTewgOs6MsQ+qWspVG2yhfs75d+towdj64Wc
         qC7ThYLHKAbDABtqJS5y8wV2BG/mCa/DrMBBMN400quoywanz8qKTc++MogGw+YjgXks
         YSWDLIel1IcY1yOsqbJWzH84lf2mAO72hMIyBYL4ewGADjIktyD6cmSaXXRa8un5MY7G
         Tc0Tnsr8J3srEI+oefJM9USpjmUwx/W8ExuH97cA+ja1EATs6p7speJmjkBNwyo3CkDi
         jefw==
X-Forwarded-Encrypted: i=1; AHgh+RoT5nV37/5HQSZFyhHcFkfqY1cgnk6sI+RYGe0b8dihK1NKLRPRjFLQpP+YB0M/3K3ySztG4xf7lK0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpjXVkTXISjfsmhiPH+/iZq3htm1fsz/hOB9hwI/nThl/OrOgp
	JxMaVPv+QRk0i9Q/PcDtCuv0NexFZwol+b11T8gCXV+qeQLk6/vHbYO8
X-Gm-Gg: AR+sD10foB8vsMeIPWSz6oAkeL2MtutHG6832lUfFuDnJ+j7CfvT5MiZcbjbycxQkUz
	q3rHxOhvo86i9ZOrY9RxD/TEh1QXTABaw2te1vxurdXgwgquG9CjfqjBe2Bc66NjfK9KNPNbLTX
	LPMdFBotTJlRgvK1bsl5Y2JE8hbSq9QByeRjUmvMO154IBfq676bDmO2hYkuVKpRXV6/UDcs5XR
	IlYivgVens2QR0RoH6lbs5XKhLeFs1QOvPAWwIKqdMROmTJDGzXJOOLcvL47XYrw1/RQRuvHH71
	sbgWy5d1fXxZFEwYMxYxO5obyN4+AN7Ex+eMOkO+btx4ukvXxpgEWdfK9AH/Wf8YJzNWC1eoaGR
	buDNDvDAjsFoIYJiWTiDD+gqMqhcSc3fM8UfudETN5tKEGdv64C97w6+7q95rYaeKmlUttdcHQf
	dd/RcgJKuNv83BqDBsoPtfX9iZMUsVXsnU04uoWAJ9T/D+2uSsxx9cB0QERMvk0Dtr
X-Received: by 2002:a17:90b:1d02:b0:37f:fdc8:71b4 with SMTP id 98e67ed59e1d1-3903c599356mr46360025a91.2.1786385521315;
        Mon, 10 Aug 2026 11:12:01 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fa9:fa00:b1a9:6513:83c6:1d23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d53b873asm472795a91.17.2026.08.10.11.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 11:12:00 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>
Subject: [PATCH v3 11/34] dmaengine: mmp_tdma: hook completions to dmaengine BH
Date: Mon, 10 Aug 2026 11:09:12 -0700
Message-ID: <3cd07c8bcab908e352bf1570fb7a3c24cc0fe516.1786384168.git.allen.lkml@gmail.com>
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

Replace the per-channel tasklet with the shared dmaengine BH helper.
The handler continues to run in softirq context while dmaengine owns
the common scheduling and teardown mechanism.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/mmp_tdma.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/mmp_tdma.c b/drivers/dma/mmp_tdma.c
index ba03321eeff7..d20aaa7567a6 100644
--- a/drivers/dma/mmp_tdma.c
+++ b/drivers/dma/mmp_tdma.c
@@ -102,7 +102,6 @@ struct mmp_tdma_chan {
 	struct device			*dev;
 	struct dma_chan			chan;
 	struct dma_async_tx_descriptor	desc;
-	struct tasklet_struct		tasklet;
 
 	struct mmp_tdma_desc		*desc_arr;
 	dma_addr_t			desc_arr_phys;
@@ -320,7 +319,7 @@ static irqreturn_t mmp_tdma_chan_handler(int irq, void *dev_id)
 	struct mmp_tdma_chan *tdmac = dev_id;
 
 	if (mmp_tdma_clear_chan_irq(tdmac) == 0) {
-		tasklet_schedule(&tdmac->tasklet);
+		dmaengine_schedule_bh(&tdmac->chan);
 		return IRQ_HANDLED;
 	} else
 		return IRQ_NONE;
@@ -346,9 +345,9 @@ static irqreturn_t mmp_tdma_int_handler(int irq, void *dev_id)
 		return IRQ_NONE;
 }
 
-static void dma_do_tasklet(struct tasklet_struct *t)
+static void dma_do_tasklet(struct dma_chan *c)
 {
-	struct mmp_tdma_chan *tdmac = from_tasklet(tdmac, t, tasklet);
+	struct mmp_tdma_chan *tdmac = container_of(c, struct mmp_tdma_chan, chan);
 
 	dmaengine_desc_get_callback_invoke(&tdmac->desc, NULL);
 }
@@ -583,7 +582,7 @@ static int mmp_tdma_chan_init(struct mmp_tdma_device *tdev,
 	tdmac->pool	   = pool;
 	tdmac->status = DMA_COMPLETE;
 	tdev->tdmac[tdmac->idx] = tdmac;
-	tasklet_setup(&tdmac->tasklet, dma_do_tasklet);
+	dmaengine_init_bh(&tdmac->chan, dma_do_tasklet);
 
 	/* add the channel to tdma_chan list */
 	list_add_tail(&tdmac->chan.device_node,
-- 
2.43.0

