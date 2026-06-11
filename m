Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB523806B6
	for <dmaengine@vger.kernel.org>; Thu, 11 Jun 2026 21:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781212071; cv=none; b=c3L9B3gSOoK5Xh64N8pGx9ZwXvvMuZ/Qp/oQwztafHGRM17FdNO0sBYQ0eDnV86BrGVtiPatQwoO/oAFBQPM/adt4lHzGvxy2vemIySHbFKctZYIisrNuu7rfVnDfkKQA16exG5yZpBXlHD4n9DWGshf1nJiMGxYwC4BKIQRW/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781212071; c=relaxed/simple;
	bh=jLPEef41Me4DDI5vEkM1r4e22JBWWaSGeJ69z2ZwqOY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i+LMuEmzeKhouS13umyT9UrvNo+PbEMnJMW520ytJ9F50wZBvSGqN+Ciuu9vB9dTkiNjXxotA9VY5LXvXNlGTIfpLiYF+cWiiQ/sRSJf9RkQdddJjc3jOHLJW29wUH3u73igHW1I0zGZggCzOZHgCfe3kPcr3upnXeWgmJ7pp40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ftwFWFMD; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ftwFWFMD"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2c0c1e0d00bso2706865ad.0
        for <dmaengine@vger.kernel.org>; Thu, 11 Jun 2026 14:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781212068; x=1781816868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BrgKTzyAU7bi0fcz93xKN+kfwyhbg/GkzGbf0bvAjl4=;
        b=ftwFWFMDPSLjWcEX1VCntPoeOIR27Ytkad66+/uFGRKj601iSXKu79/CtzNouyIoqO
         n12fYteeI92p+U8F8e+fgEGuF4//qHNIu/E5lnsp7YjtB/cmVhczzIgbAK2ZCwbpa/mv
         vlQhemysluJbhJoGJSCYmpkIl/mQpaRcOJR+Xca7jwz8BV4Unh/36/r7SVV45IG7UC0n
         lIEsXxnDgr9G4BqNHI6L5Imtmi6ACCSNb9miD+2i702eW8vVD0uJM4+rjgC3m1CQeZ8V
         YyvQIuz2e4j8Mm5zCWEzxqM/rCbDfHVvwkr4KZlMnRCrWmsHVerAINR/LJblcpKDFgYF
         Bn2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781212068; x=1781816868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BrgKTzyAU7bi0fcz93xKN+kfwyhbg/GkzGbf0bvAjl4=;
        b=NKQsMSwxWbyx2lzZ7BCYg188JDzDP4xRnAOTJ0uqh/4BJ9hzjVhFBSrlfbOd4S6maf
         TyBtxejiUelv85+RzeYsHBnJ3w3P4gNaSopxAny/bmvENZE5KmjdjJbn9VHbiQqgW8zm
         y2q0GQA51xyOMCu7Qzj28B7/jki03uS8fgd4nez5KOP0Hsty6Fd06nNZZLOKLA8TbAtp
         VGrW1zPeKgVq1U5YwtSXpbSUoyHWB1NewfRF6L0XbzfEMML6HtKi4bHn4q12N15S22MU
         zh1EuQ0tnYbANH+N49cOuxQoc6bp2tPjTmLM0EOxMz2XqWqd9lclS7OxDTRTuzieEQbX
         ST7g==
X-Gm-Message-State: AOJu0YwFeSDoD+FY7VHYKzNH0+kDNnQLVhY4fttjBUuzsd7YcRCIcESO
	Elro5mTlB+tnvcQ03naG+4Yu1bzvRKOnVp0WS0j14btZuG9CHpYnRg1EyjjkDg==
X-Gm-Gg: Acq92OGTROWQ6NhjSstcxFSRqEmI6noI1KCYF7BHYehdx6/FpBlvFzNLiv1daYfYWv1
	io56JJd6VouReTZH8hTgfdtPegaI7talj7CBlJgcqZUKPE/bt/eJIyLKFU/Sr6sNRsGzHfyTahY
	wOy7uMhXl7OEkxyaHD7LAEgqltF3lBMIbTfTaFl/3Onkr44M1XqMN7oovMgXvZFFlyCbVTj7/Vy
	hH6FZGOA3fcWRULr97lah3iquVsWkwfzzAcaAWQZ73E0HfAhWcKXokaN1AZoriffdLYHLEuaMsW
	aw7qMBu+2b3aQZYGtnTEDBhoIHveyLPStM1fFM4Lnn/O3bDLhYiuKXIMMZkl6sZ9pUFiQLk638a
	wF0O28H3bG7Xpo35TdE/iyMXSWasGIbxIatGpzwjony3MnwTNHGM7FomK7xPvoLeLg3IGJOR6Or
	Rjk1T/JZjRIqOB/iMtBegSYufO6RM1gYsQfGkaSEpCq5vRyZVUMiYnLWyIYyuDWUMgVa8klNBhJ
	N1I7sRMy4CJ+3CkhoVXTBz20aHgJCCgpvONQPI+88ggxw==
X-Received: by 2002:a17:902:e812:b0:2c1:b8af:18ab with SMTP id d9443c01a7336-2c411d7a10bmr1108035ad.19.1781212067873;
        Thu, 11 Jun 2026 14:07:47 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:6d3a:64fc:4ee8:9cc3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c411d79289sm389995ad.14.2026.06.11.14.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 14:07:47 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Marcin Wojtas <mw@semihalf.com>,
	Rob Herring <robh@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2 6/9] dmaengine: mv_xor: switch to of_irq_get()
Date: Thu, 11 Jun 2026 14:07:18 -0700
Message-ID: <20260611210721.81979-7-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260611210721.81979-1-rosenp@gmail.com>
References: <20260611210721.81979-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace irq_of_parse_and_map() + irq_dispose_mapping() with of_irq_get(),
which maps the IRQ and registers a devres action to automatically dispose
the mapping on driver removal or probe failure.  This allows dropping the
explicit irq_dispose_mapping() calls in the probe error path and remove
function.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/mv_xor.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/mv_xor.c b/drivers/dma/mv_xor.c
index d9403172ef59..eefc8f22bec6 100644
--- a/drivers/dma/mv_xor.c
+++ b/drivers/dma/mv_xor.c
@@ -1423,9 +1423,9 @@ static int mv_xor_probe(struct platform_device *pdev)
 			dma_cap_set(DMA_XOR, cap_mask);
 			dma_cap_set(DMA_INTERRUPT, cap_mask);
 
-			irq = irq_of_parse_and_map(np, 0);
-			if (!irq) {
-				ret = -ENODEV;
+			irq = of_irq_get(np, 0);
+			if (irq < 0) {
+				ret = irq;
 				goto err_channel_add;
 			}
 
@@ -1433,7 +1433,6 @@ static int mv_xor_probe(struct platform_device *pdev)
 						  cap_mask, irq);
 			if (IS_ERR(chan)) {
 				ret = PTR_ERR(chan);
-				irq_dispose_mapping(irq);
 				goto err_channel_add;
 			}
 
@@ -1468,11 +1467,8 @@ static int mv_xor_probe(struct platform_device *pdev)
 
 err_channel_add:
 	for (i = 0; i < MV_XOR_MAX_CHANNELS; i++)
-		if (xordev->channels[i]) {
+		if (xordev->channels[i])
 			mv_xor_channel_remove(xordev->channels[i]);
-			if (pdev->dev.of_node)
-				irq_dispose_mapping(xordev->channels[i]->irq);
-		}
 
 	return ret;
 }
-- 
2.54.0

