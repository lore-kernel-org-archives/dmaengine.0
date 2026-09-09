Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01232492E32
	for <dmaengine@vger.kernel.org>; Wed,  9 Sep 2026 23:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788997610; cv=none; b=MovDfzHFsj4t5gZMo38vJKGTwGXi+Ka+w4OdCwjEtfEwhgmgC1iOou33OxniXpzF3dDaxHo85XX/6LqPkVURDTdXyzeQByzwuFk4B/MMgnqjG2WQkcfTL37Zhy+UvI3we8CmFag/bfztZHxZUJBw10m09dC04fI+USYM22goKPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788997610; c=relaxed/simple;
	bh=Sscmd3mS4LasaTyJ4M41HjM04N+ZXT2HpQr3bsigrUE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L4FIPBAxAk4VusSMqWY7LaLWRp3zk89Ds0UWcyhHiYJdtxWWfzVAnbyqYc9BJZgnFog1X9EbW8yTpQonAMcdZx7PB2o36WpZP6u81pmy+E9prhI2BCM6hJ2WkqPXBvSm8tujy45Ptv0X8/IvKQJWFJQW/glxSK0DNTNw5sIrKtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FYkZqpcR; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FYkZqpcR"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-398c066106cso692230a91.1
        for <dmaengine@vger.kernel.org>; Wed, 09 Sep 2026 16:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788997608; x=1789602408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7JUqDOxqGhCJmzOn0HWNBT33LeSwOGc990LCLjInaIo=;
        b=FYkZqpcRQ/HimpdS/vP5PFXtv5f9GLv9v+CbaHRrObxaNbkToX3kw2Z4p4F9wb64AH
         cDoEIHui6odtW/e+V+OICl88vMd5qurGk+dP3SxDNEEuimN6fKo59C7GsH0QVduaxm+H
         omxGGkPw1ivZd5T4gbyi5kRs6ZQ7oGbh9ynJX2LDPkqapUSU+ouIvi50Ps/SZS6Z7ksW
         MS55PW5q8/yHXJVbXH6ttKX3BJHy4QmCJj2tC0bGYs358czGhMA+di4kVQzK1k3VNcWv
         HTxLgWi4x43FELUKpEQEd+9Vjny63uI+Zdt/fvfpcQ6JxXbEfCL652nIJyynjsD87DFT
         cegg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788997608; x=1789602408;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7JUqDOxqGhCJmzOn0HWNBT33LeSwOGc990LCLjInaIo=;
        b=XhLjsAGFRXv7u/BBKZlbgI71gg4zA8XvcUQorKiJ5Hzaq41iavsqKGMGrPV9J89xTI
         jirsoT0xv4if+HWLDmgxv/af8GhAAJM/cqTlT2rlIuvwCtSIi1VR/mIAM1+WoWg/0DoD
         NT8TnKEAoImTvIN51BUwDEizUtSejGOR+zxBTwoAy4V3WzIMC4VZeEPigwlPO1poTGok
         r9iVSiaR98ksHTIRN6Bg69xV4tE1u34YAkhQ+1Yhwz9wtIXfCqK9l2hdQllAMT65k0UF
         5hjZ/bg5aHeK6EUoZIa6htqNZ4iH87Xv2q9rHI0uYEIOC61i9znwbTF91Ddruf91clkK
         HD1A==
X-Gm-Message-State: AFuF++n+YGG3lwqo5SDXyYk8B70xXLHr/u6kpXuPOQWBB2jlCIrA66mA
	1Z687A7IueWdyASBKAf74zDBORPAlffeBmQ7Zcd4ao8XewzYle+9Lwd7P4TIfw==
X-Gm-Gg: AYBFou3sCvFinGACaoGSo9yIR1NoZ+G8VWRnGKO0/MmWzzpXupQdQy8ST9yEU9SMRrI
	gTo9qeMnQmeVF1FpVSVGZt88UygReTXhlw+K3+gg+7nY07Kzv+ekjt7G9kPcfxKUlCVSrDh9OlF
	dBkkyhwR+tFCYdRpBbUAFWaKroqwPRiaOmyVvniAvMOh1HVV7y9uGHEc0/G93T4AsSzkOPMhtV5
	SrxytpiOaOlTxSH87QDHAqAFM3TShowSe6Y95FucTF5UTC8eodurwA5+Q2+nYO3CrXhCxV44fyF
	1It0XJ2WWM/ZylASmQ+m0jGsgVcIBBnYS+6sg7dWi2ckVF48zLfZZDyIOMYJxlkmgtv0hcTbwoH
	J20xclHtK7qzl7daU5wBm7+omIt1FfR+//PDj1MNyUK5LyZxaho3KEH2kACjdAPvIbXjaWpMtvl
	74lgDmQ0xg25OMnzu1CmI4UmA6aEzctdQZUF/dpQuHbMEEUmsXCEZ9CR+cA4nPDNlegMzlnClYR
	A0mqO4hap5WW8tMDtRYWEH275u6Pf4jkk7phbz5iszGAFG9C5+kf3wnCln3L0XnJnEA4p6kVhCO
	6PzB+PG/s0AOAtKhOG/t8fgTYM2Da95+6ow6mISw8uOHgfqa
X-Received: by 2002:a17:90b:3c06:b0:398:e6b6:acc1 with SMTP id 98e67ed59e1d1-39d70b4a2b6mr6049609a91.15.1788997608266;
        Wed, 09 Sep 2026 16:46:48 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e92b776sm512885a91.17.2026.09.09.16.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 16:46:47 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Maciej Sosnowski <maciej.sosnowski@intel.com>,
	Lennert Buytenhek <buytenh@marvell.com>,
	Dan Williams <djbw@kernel.org>,
	Saeed Bishara <saeed@marvell.com>,
	Nicolas Pitre <nico@marvell.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] dmaengine: mv_xor: add missing dma_wmb() barriers before descriptor chain start
Date: Wed,  9 Sep 2026 16:46:46 -0700
Message-ID: <20260909234646.102344-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The descriptor data written to coherent memory must be visible to the
DMA engine before the HW registers that trigger processing are written.

Add a dma_wmb() before mv_chan_set_next_descriptor() in
mv_chan_start_new_chain() to order descriptor fields before the
descriptor-pointer write.

Add a dma_wmb() after mv_desc_set_next_desc() in
mv_chan_handle_chain_append() to order the chain link write before
the subsequent check of the current-descriptor register. Without the
barrier the hardware may observe stale descriptor data.

Fixes: ff7b04796d98 ("DMA engine driver for Marvell XOR engine")
Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/mv_xor.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/dma/mv_xor.c b/drivers/dma/mv_xor.c
index 24f22db5dfa1..6db7dafac9c8 100644
--- a/drivers/dma/mv_xor.c
+++ b/drivers/dma/mv_xor.c
@@ -181,6 +181,7 @@ static void mv_chan_start_new_chain(struct mv_xor_chan *mv_chan,
 	dev_dbg(mv_chan_to_devp(mv_chan), "%s %d: sw_desc %p\n",
 		__func__, __LINE__, sw_desc);
 
+	dma_wmb();
 	/* set the hardware chain */
 	mv_chan_set_next_descriptor(mv_chan, sw_desc->async_tx.phys);
 
@@ -409,6 +410,7 @@ mv_xor_tx_submit(struct dma_async_tx_descriptor *tx)
 
 		/* fix up the hardware chain */
 		mv_desc_set_next_desc(old_chain_tail, sw_desc->async_tx.phys);
+		dma_wmb();
 
 		/* if the channel is not busy */
 		if (!mv_chan_is_busy(mv_chan)) {
-- 
2.55.0

