Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C66215F42
	for <dmaengine@vger.kernel.org>; Wed, 16 Sep 2026 18:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789583080; cv=none; b=b1HHbexjC2NruvLlaxzdhlA+WzWwCnbkXE1OADGiQuGdDUVfb3SbUY4QG/iu1Q7UMIDar/L3//+ZhgDMxllcB8KvDIJb/fLY5B4PO8MnOVXI+yfJ6BxW29Do6frbcsBPt/V3Zq13mIdB5FyxV4B8uWSkpCQqHyKikj+QgrL9oxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789583080; c=relaxed/simple;
	bh=8HtTJeU88HThKsi1C7V+j5o933cAt01T3GynIseGe58=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QjjTWQ1jC9L/6ZJQdQLLJaRZIwSSuvh2zXLVIGOQWu4K+jm6tW4GWm+JypHTIjmdeulr+VKb+m9nYhL0a2ju2P693208LuDRF3lLEyybyfr+iQ/q6gG2fydniINeDJuL7CYhtvLhmuYkZnZQEwLCEDv8zWETsb2fRYB4YUcVy3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z8wjm85R; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z8wjm85R"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747ed6d6eso42215ad.2
        for <dmaengine@vger.kernel.org>; Wed, 16 Sep 2026 11:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789583048; x=1790187848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YmO3+nodqgtKsEQYssHFME7NIr2jEmv+K74o2X5CQHc=;
        b=Z8wjm85R5bjElUyD7Ym2g5pph1juZIa3AQFRhev3WbgSofD5DY/zAz8PsvVaFQnI85
         +p0ctVEmErpc3E2446iuYgs6fkCB7zaZJe1QbiJqi7jphCUib/Cp//cSbml14VWbjSAP
         KiJ+Xx9KSpneeTGJsaUri0apLXqLw4ibnWydEl4Dk0rAmZTUHd/EkjeVLibtAeE7Stfn
         TuHmcUJzBiBY5D4/8+713ByJRuNeH3ddGRa1TEU8dFWY1W17mfN6UwtR9noIc1oV8f3O
         rXtpYHrDihs2vY+9MUsUTAjE+BI+48kgXEMn4YmSQxC44IERXT0GS9TomCGzrTJKFjIV
         Ykog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789583048; x=1790187848;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YmO3+nodqgtKsEQYssHFME7NIr2jEmv+K74o2X5CQHc=;
        b=noodrdD/L48xpRAkVkiMUDmuYaUbqEdXwWryXrcwSnLZClHqfkE6sHFb6dRZ2YcNTp
         o0KsL4W8imhXBRgvV18+s4l+8bpLLWk23SyDcPHJfxdBKCbndLsQahkUO+TSd1k8TPfH
         82bg7WgctnDts4PZp+p2++65Z6bQuz1V2xeHCeVmPzHy/9iAgDcvmRLU8n6c0IBxFGGK
         /cP9SVC08Za5TpgJzHDQUSwcaZ4gnaq+vKXg49VenaPJiMINOR+wwX0Yzu5LgFcZyQzX
         Zx2oZzeVd2imhOKSZq4Z13VXTe3Srv3yuJ3GJU4gP4Xa50Hk4f+T8u/TFoRDf9QEL02E
         IfBA==
X-Gm-Message-State: AFuF++n1PluLzKwcGzo9wN9wSSe6FYIWEGwi/KaWjJzwpAgX3UcL2U81
	FnQb/xhUrbQ8498EJzmpdWr9NP2VIRqSiQ7z3X+Fhd1GSGnJKSRMWIG7yJEsCdxT
X-Gm-Gg: AYBFou0JbH2WhERXKkV82iPY7RhDrCNoP1j5JbVgSwlBEIMiCrqnDJSPT4RLoo0nlXR
	gcO+YaVkGFM1Dgjh05TjdUFUwg/lpnoxF0btUqDIfnrbVNylhcQgmlPTDkB19bxMXBuMHfbaFcN
	FDUfbdNw2IzVFSadz5UrZzo97PrV2V3Zw76XO/a0muIisIcNCsmamyTjt13GIl9Jk015GYFJXmE
	1Zk4o0oa6ePjMB/kdt8+UFDilp/SSUKKaW6SAktugrXn4ONmBL8s+3Sul7Qe0A2T78Qg+p3qKmC
	oNLLrXkpfUzo92XNuCSbeDIcixZtyImzUf6iKfD7NV6dH3d6K4QeC/1d8CuuWDnttqxM60VBGti
	72vlDQtSzOk2VbAhcKeGxoTBynjIAzs3fbAFbhty0LPHz+sOymMXrWklESDg9+oBirbtxVOEokd
	0Jc2E5cNTFV0UEKnndNkEfAWYlZ7o86F7Xzm5MCBVkUyNLynHnuzp8BcoRIvJMLgN3QmDCY5EQK
	u1pnfKtRKKRRqbh1cRInTcCf9E7ldGr5XWEahPd6yru2KgC3LXttz7HCllqmt2JDmyN01IGG/nN
	/Xzs+RY+RP3TvHVybiSQftG1qqcohDQhkMgGXNGMdU3mSB1U
X-Received: by 2002:a17:90b:2252:b0:39d:ec42:df69 with SMTP id 98e67ed59e1d1-39e1e4d3ff4mr7967613a91.20.1789583047620;
        Wed, 16 Sep 2026 11:24:07 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e35df6112sm641299a91.7.2026.09.16.11.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 11:24:06 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Saeed Bishara <saeed@marvell.com>,
	Lennert Buytenhek <buytenh@marvell.com>,
	Maciej Sosnowski <maciej.sosnowski@intel.com>,
	Dan Williams <djbw@kernel.org>,
	Nicolas Pitre <nico@marvell.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] dmaengine: mv_xor: use writel() instead of relaxed variant
Date: Wed, 16 Sep 2026 11:24:05 -0700
Message-ID: <20260916182405.12985-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the ordering guarantees between descriptor memory writes and the
MMIO accesses that expose them to the engine. The descriptor pool is
allocated with dma_alloc_wc(), so writes sit in the CPU write buffers
and must be drained before the engine is allowed to read them.

Program the next-descriptor pointer with writel() instead of
writel_relaxed(); the full accessor drains prior memory writes before
the MMIO write.

In mv_xor_tx_submit() the appended chain link must be visible before the
busy-status register is read. Use a full mb() so the engine cannot fetch a
stale chain link and stall the channel after the CPU decides it is still
busy.

Fixes: ff7b04796d98 ("dmaengine: DMA engine driver for Marvell XOR engine")
Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/mv_xor.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/mv_xor.c b/drivers/dma/mv_xor.c
index c4e0dce3ca64..0de2b1ad5c30 100644
--- a/drivers/dma/mv_xor.c
+++ b/drivers/dma/mv_xor.c
@@ -103,7 +103,10 @@ static u32 mv_chan_get_current_desc(struct mv_xor_chan *chan)
 static void mv_chan_set_next_descriptor(struct mv_xor_chan *chan,
 					u32 next_desc_addr)
 {
-	writel_relaxed(next_desc_addr, XOR_NEXT_DESC(chan));
+	/* writel drains descriptor writes to DRAM before the engine
+	 * is pointed at them
+	 */
+	writel(next_desc_addr, XOR_NEXT_DESC(chan));
 }
 
 static void mv_chan_unmask_interrupts(struct mv_xor_chan *chan)
@@ -410,6 +413,11 @@ mv_xor_tx_submit(struct dma_async_tx_descriptor *tx)
 		/* fix up the hardware chain */
 		mv_desc_set_next_desc(old_chain_tail, sw_desc->async_tx.phys);
 
+		/* make the new link visible to the engine before we read
+		 * the channel state, the device may fetch it at any point
+		 */
+		mb();
+
 		/* if the channel is not busy */
 		if (!mv_chan_is_busy(mv_chan)) {
 			u32 current_desc = mv_chan_get_current_desc(mv_chan);
-- 
2.55.0

