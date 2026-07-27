Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18961433BB8
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184387; cv=none; b=G58xwurHCT+r9QnL+G+voUhh6t7LPOqz0LjZ7ybTv52rhSk+qL1Kvzwnknz4ym6vHUU8XQSb0XMoXXoQdgL2UhJI8bV8FF+zDH15VMEnR+qm4f0Bm7qD+IkRNIS8lhkFb0eTuS72wY6miSrltMuzTsNvK6WjaqZJsVCTbtwT6Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184387; c=relaxed/simple;
	bh=H3smzW/5zOFUhSnnk2wDhy0bhFOaHPAC69w5Lyu/Duc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TmCh9wQVUm4+Fcd5ui5o9D+RYqpU4fTaCeSYXC2I6dou/EcJsFrY8OXdZfW8UjaosaJau8YzNYTE64yw6Kw41L77+U2o4Gd0apCbTr05S/HEWiGmzW/NvZm4xxGcapgvGTWu0dKqcPB63J71vDOxqBVUUu9t+eicnejpiaJ4WjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P24g9soA; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P24g9soA"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cab973140bso42254285ad.3
        for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 13:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184385; x=1785789185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uj7JXucTWk1RlzdeooGpQiz1Xu9WUQokbk55k/nbKRo=;
        b=P24g9soA4yqiVaHZ07pS+z3E2dvoDfcmtR26lmplAnqibkz//zG+iAlpRvds8Pufsq
         TjpRLvkL/9mM9AGC8iCkqNM/Nn8H6WiJx+oKxVByycx5FMw+ey/SV6QfYmWwieKM7mii
         HjQocqmR1gdKMebtd7V0xI1qfQC0Fp4tuGLxzSnRTQHQ+X15hFZrKMAA1cKFGEn5NxRA
         xLDF2U3Mfb2ZjnbGsimkb/2vW1v8DAwAYQehVEGORo6iAuRRWsQBeQY3iU6ppYnxgc8o
         44Kq+mjWciKhLBdVToDhFlX/EObFbe4L47qrYObW+YmDSG1u1Y29yThKwGxAiK8LGOHQ
         p0xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184385; x=1785789185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uj7JXucTWk1RlzdeooGpQiz1Xu9WUQokbk55k/nbKRo=;
        b=MwZPGefvlEDS7T59KYrnbeo7eTdj7GiQQYZvYG6oywphwU6bpZgKKWaBxZ4/djntR0
         P5gKDuRGCMlUXm9A8UeipNGvjB0gqYURq1KB//zEprQeRfuQjjdmGqE+CEqZ7y0diaKl
         Xhf/4gR6sC36wwNEgX4kfdoStTHekkxgzhlLT6297HNnfUeeFsEt9rchKwkNH5+gShHw
         oIc8KZ5iDZq4ZDbdXo73weza9o6FHW7s9n8PeZ0UHLWZrwVf/PeWHE1ogSeEeKJTRd/f
         AIzjA/aYbH3zO9AWdK5tnUM4XQxD3Pxt79lQd3mOMWiLCUZr5jG99+JDW5GmflWf3uUL
         D/HA==
X-Forwarded-Encrypted: i=1; AHgh+Rojq5T3WCIegFBidf/gQn4tkE0/toDCka7/6uPjvslm8T/wIo+lwHP1/n+bUBpXlfIjfcGoB1HCVFE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwS4g4isiDOrVMutghz7FHXav1BCGBAW6AhwwYLNxzEe+UXHEL
	07EhXNof+JvmxL8ruPmj2nlKb8O3Vu2G4s1hGclA5e9ctnM7SK53wuKi
X-Gm-Gg: AR+sD10Ua3jk2VJt2xuJhpwYM1PpmRHwQFLNfZLoxv9Ovq6eNEgU0kXI1ekvgRJgkST
	ZrcwpHGEPY0rjrdxzf3f/ZODzWZcxRFOVC1DHFdkEZB6zuLhwPt7qlne4CiOhpigX9JByD3w8MU
	LD5V2by0jDlBX0OasbYIDiXT9Ok3kn4saE3p/ToKFiZFDGAbfscPWJJB901v6Qlr6qTPRm36v1Y
	4MObLRhg2pLXzsSHegpUMFd0Ekxm+Rp4kHjX9az+Z4Go0gchq0xHXHkkzh/SOAkG/KpFRVX0e38
	SIvOEXjhua2OmpOaMopQifVY0Wn4nJ5WjXVl1jYwje+BjTM3Ys9AC0tpA1lRFxmCCRcJ7t7aB64
	eMR5cvqRFNX3D3uWq2H5YppZDYAHw1SI+54W1lzDwRzsd5VTVpU1BtstMZ1DETxNTP/RkvExE50
	ipRIKVeP7PKEHgMqQ=
X-Received: by 2002:a17:902:f549:b0:2cc:f7c6:8320 with SMTP id d9443c01a7336-2cfde8af530mr96971205ad.46.1785184385338;
        Mon, 27 Jul 2026 13:33:05 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde59b768sm41551805ad.4.2026.07.27.13.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:33:03 -0700 (PDT)
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
Subject: [PATCH v2 29/64] dmaengine: sf-pdma: route error callbacks through channel BH
Date: Mon, 27 Jul 2026 13:28:57 -0700
Message-ID: <cb95b5e1f0970fde25ab542047d3aecbb41ce653.1785183549.git.allen.lkml@gmail.com>
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
index 6f79cc28703e..a6c2f53f005e 100644
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
-		tasklet_kill(&ch->vchan.task);
 		tasklet_kill(&ch->done_tasklet);
 		tasklet_kill(&ch->err_tasklet);
+		dma_chan_kill_bh(&ch->vchan.chan);
 	}
 
 	if (pdev->dev.of_node)
-- 
2.43.0

