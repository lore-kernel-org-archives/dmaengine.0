Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE80435A9E
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 18:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786385620; cv=none; b=DXQ30/5C6u2kgXA4uDWwRZHqKxXa8aYOA2iBrGeCB9xWbRMA2mL1YjggM7PRP2DEo8kpDxKPpBh/wu2qlSIcYZJ2Z+Nsq1ErcOGJwkm91OPazXngHUvI/xMlyAR6kU0++r5hmNfFm6m1vi79CqyyA++a7jGl0VpuJnN83UGXt4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786385620; c=relaxed/simple;
	bh=LxqzrTJv5Eqx3zrr8cQAwC8hTp+RGnUBOHgB8lVvAQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=chQj1Gf+ZCHyP7LYxJwKJtoPL1uGBQohzLktww0qHbLjltUu82uzF+PAOhEb0yArMvbeTgMLS+ftffmiLYXJZ6/SFpqMaaTpM9LVQrLFY4YgNYjzqNL5M/KLS0I+B0VTKv1mrdeMWurG3vQu5ZD35FimAuiCg6r6hyaNFaBuNnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QVgnK1NT; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QVgnK1NT"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3810c5d691bso1893337a91.1
        for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 11:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786385618; x=1786990418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jUm5zg635IdCfrd8nRe9kr7IONoPkdCFzJRsBETaklg=;
        b=QVgnK1NTnbE75IvaAwReUBn/f7Wet+iX690147bgGdoPwm1Hq2oOkHpB02YPEjrP9I
         iTdx9WCRHBZmpk/kQBDT2zWmYj1fWjw/aLkTOsW4NIKXP7l2ZduMzStIyfKnjl5KcYuJ
         0+CgVjb7N9Rh9lsRyy0YJ0wb5NoOQ/6CvQCH2WFG1Q62RItrcvViha/twwURJOPXvt/A
         i5tzplxHtJwyFYNIm8kidFKhlun7O2NJeRv55uTn4sTD2N03WsBmvbGdq7L9yLd0lkmF
         VfVEZA3aHRNQ1RxBZf9v2m3Q0anEffhdEd5j8cLdcHUZRfuvz3njNxWNXdVwI9ens7WT
         +t4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786385618; x=1786990418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jUm5zg635IdCfrd8nRe9kr7IONoPkdCFzJRsBETaklg=;
        b=jkxwgi7ya4E/XLZtVzyRJIewG2bOfgC/X3kP3mXN9dogzr/K1UaUpq0wqv/2oS/SLw
         /ZEBZOIN27WUab1SxI9Ju8/rKR00zP+tj6r9Q41S96euYQagVsxTkjUgFbN1O5maExAQ
         RyTKW2CNAzd7HOsR7CgEw6z48LV+biJZpht3ZCGuepc+dz+FMNgAS/651/mC2ez6YAS7
         72g+V2CeasDjvh/AQnW5+1xjMdiJKLrS1Qha++cr7pBCYBYu9q0zQNZvKXpffA0SCz0u
         DMe4K78kvErumCZMwAiUegX95VRTg1S9rQpIs6FBf0FmYrBqTcfixe0z2WdTKc9uGSf2
         mhAA==
X-Forwarded-Encrypted: i=1; AHgh+RrnJ0/s5BSIrLSrFBeRxvWhbx92blC2WIsK7802ApUen3qRRZD6hGh+Fh5B/epW22ny5ZN6Brye3gs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw6N2VWQpyO9QofRWrjiTkk5Xj6/RvYr20v6ZQkfZKIAj67mTq
	e/GpGwv0Tg5Tg9vgG8X6BHhtfZztTY6aOwZkCVD8noT7Aj9cy1XKyCN7
X-Gm-Gg: AR+sD12hOUBcNb8vzlfOXs+aJMH2J9RkzyBS5EaKatCfEftDp3vwLKHQb4+UH4bGqwB
	ON27eLOFViEL8qtTfm8Tgi2SeaQbVPxu9lSyXvqxaS1hOYfL/bSGACeIKApK4SGGO2nJzFeyLVm
	rBQCyN/MDh/ZGZVqYqCNhc/8sTThMrddQEgmztNcvgK4RBdMTRIB79ZX8MtRwRaDgENHp7UXkI6
	YD0r5WETbdCz+k3ypcVl2Ikk1XtSXK7iorwJNLvhgasyrxze572ZzN75CQp8ZqHu7rTHywPx2/u
	Cm9dWYEv8v5CaYzuZ6XMFN0I1cJOzHqAUCGiQak4tTTO2E6NAaicN2Q/T13BPQSlvrfAX6NA1Hj
	OtEkQJwOpdaQIh836CVDImCdZUfraFFLaWXR9RMhAM98p1qRZr/YKGsXi2XX6EOw1MCqtsXAXgV
	OLm4soMOQKioUn9KP925POr/oB7iQ+ntdH6s+7rPSYJtv3qBy6xJGMtqdmAqT3Nd0ZXlzbaeAHf
	Q==
X-Received: by 2002:a17:90b:2785:b0:38e:bbf1:de3f with SMTP id 98e67ed59e1d1-3903c5d2f29mr48647797a91.12.1786385618336;
        Mon, 10 Aug 2026 11:13:38 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fa9:fa00:b1a9:6513:83c6:1d23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d53b873asm472795a91.17.2026.08.10.11.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 11:13:37 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Miaoqian Lin <linmq006@gmail.com>,
	Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 33/34] dmaengine: qcom-gpi: defer callbacks via vchan
Date: Mon, 10 Aug 2026 11:09:34 -0700
Message-ID: <c575a24c789317a5ec330a4be0a6ea1ece60b5ae.1786384169.git.allen.lkml@gmail.com>
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

Complete descriptors through virt-dma instead of invoking callbacks
directly from event processing. This preserves the transfer result for
the shared vchan BH, which invokes the callback and frees the descriptor;
drain that BH before releasing channel resources.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/qcom/gpi.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
index a5055a6273af..2bc3a07ef092 100644
--- a/drivers/dma/qcom/gpi.c
+++ b/drivers/dma/qcom/gpi.c
@@ -981,8 +981,12 @@ static void gpi_process_imed_data_event(struct gchan *gchan,
 		result.result = DMA_TRANS_NOERROR;
 	result.residue = gpi_desc->len - imed_event->length;
 
-	dma_cookie_complete(&vd->tx);
-	dmaengine_desc_get_callback_invoke(&vd->tx, &result);
+	spin_lock_irqsave(&gchan->vc.lock, flags);
+	list_del(&vd->node);
+	vd->tx_result = result;
+	vchan_cookie_complete(vd);
+	spin_unlock_irqrestore(&gchan->vc.lock, flags);
+	return;
 
 gpi_free_desc:
 	spin_lock_irqsave(&gchan->vc.lock, flags);
@@ -1060,8 +1064,12 @@ static void gpi_process_xfer_compl_event(struct gchan *gchan,
 	result.residue = gpi_desc->len - compl_event->length;
 	dev_dbg(gpii->gpi_dev->dev, "Residue %d\n", result.residue);
 
-	dma_cookie_complete(&vd->tx);
-	dmaengine_desc_get_callback_invoke(&vd->tx, &result);
+	spin_lock_irqsave(&gchan->vc.lock, flags);
+	list_del(&vd->node);
+	vd->tx_result = result;
+	vchan_cookie_complete(vd);
+	spin_unlock_irqrestore(&gchan->vc.lock, flags);
+	return;
 
 gpi_free_desc:
 	spin_lock_irqsave(&gchan->vc.lock, flags);
@@ -2009,6 +2017,7 @@ static void gpi_free_chan_resources(struct dma_chan *chan)
 
 	/* free all allocated memory */
 	gpi_free_ring(&gchan->ch_ring, gpii);
+	dmaengine_kill_bh(&gchan->vc.chan);
 	vchan_free_chan_resources(&gchan->vc);
 	kfree(gchan->config);
 
-- 
2.43.0

