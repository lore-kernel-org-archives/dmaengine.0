Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80762376BEA;
	Tue, 13 Oct 2026 03:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791861807; cv=none; b=K6912cB/V/nswJcXjxYNy3j4w8+ygD7iHTTq48aamAq69c0Pn4zmvsgWL0lO7Zd7zrA03M5HRyjiK09/TdnwHtRRyh26KWMjE4bSHhUTSTQaldGqE124OGF1xx8VpvdDtmmpua1bdpoMVlNvOt2bmF+lrCqYXx7BS0AjTzMFUaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791861807; c=relaxed/simple;
	bh=K+j8dwpPG35a0Usc6U/QaOJKVFbDLgR7XlxGxVx6O6I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Yts7RoE/ZdhL70zW0aptQIVVPg3PXGtuLpMtqXPJTB8ZW5Xqkon6NsGtHtky3fci5hLhWFdHRq99YzUChHj4F6AWi50CU2hQTubfwMX7cjlxbkUBQ4gelHq25glCPg/pGy7Gwn+Sl4Pt5yDqS4Dc4d5JoXKrDHARWjL6YMCS5oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eZrmd7AE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eZrmd7AE"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D6D77C2BCC7;
	Tue, 13 Oct 2026 03:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791861806;
	bh=K+j8dwpPG35a0Usc6U/QaOJKVFbDLgR7XlxGxVx6O6I=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=eZrmd7AEuOtBXIiaAP19y1x1marNskQcpKoGoTt+tOu8Ym0Jr0jMwVIG18GEhuFIH
	 kQwPrPQU6qR2Ue6MUJrG5khBB9h3hDQJHFByTCEdyZJcxUfVovaniWwtKAKlkBhJSM
	 uqFSbQUcEbzGWyIWlHYKu1Kyh+A8gv+LmS8KC+0ZfoUdWaPDZl+y55MCBR5dFTIuhF
	 0scVG6DqnrYEtoCZ1Rz0vqFtL9Qtskjw6DroYLS1XzX+12Ot0ktqUbHMmdjCtuXLgP
	 DRKx568C3Fv1e3v8HK4uUSJWqDqrJ8bT7OnxsmnCDux5vSlcy2XJTSOh0hXePAyOIv
	 CbOE5riqym+fA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3517CC6B09;
	Tue, 13 Oct 2026 03:23:26 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 13 Oct 2026 03:21:11 +0000
Subject: [PATCH v2] dmaengine: amlogic: Fix little-endian variable
 operations issue
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-fix-a9-dma-v2-1-860146b2ef57@amlogic.com>
X-B4-Tracking: v=1; b=H4sIAKajzWoC/22Myw6CMBBFf4XM2jF9aEVX/odhUdoBJhFKWtNoS
 P/dytrluTfnbJAoMiW4NRtEypw4LBXUoQE32WUkZF8ZlFBGCqlw4DfaK/rZ4qmnCxnZW3PWUIU
 1Un332KOrPHF6hfjZ21n+1r+ZLFGi8q0Woh00aXW38zOM7I4uzNCVUr5HiWJypgAAAA==
X-Change-ID: 20261012-fix-a9-dma-4be7e61ba653
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: linux-amlogic@lists.infradead.org, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791861804; l=1372;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=OZigb4en2c93sg6DmkSHlPZQyczro7uHkaw6ZWL3yJI=;
 b=Opkm9CijTWMJQVlrV4DIhfX6pYsuf2M4OAlshy3Enz6HJKjzfIBIJ62flw8Gc8SXal7Xj+5BH
 r8xHqf/gSxqAri6a9j3i1w8NAOZ3F+NxWD62J5HERDOspwkr0wl1iJy
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

In dma_async_tx_descriptor function,fix the situation where the operation
processing of the little-endian variable requires corresponding conversion.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202610060235.PuCxWQdk-lkp@intel.com/
Fixes: b84b5197e344 ("dmaengine: amlogic: Add general DMA driver for A9")
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Fix the operation little-endian variable issue.
---
Changes in v2:
- Simplify processing and rename subject to 'dmaengine', suggested by Frank.
- Link to v1: https://lore.kernel.org/r/20261012-fix-a9-dma-v1-1-2d83008f3e32@amlogic.com
---
 drivers/dma/amlogic-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/amlogic-dma.c b/drivers/dma/amlogic-dma.c
index 78ee2337ae71..dbd23d29397d 100644
--- a/drivers/dma/amlogic-dma.c
+++ b/drivers/dma/amlogic-dma.c
@@ -321,7 +321,7 @@ static struct dma_async_tx_descriptor *aml_dma_prep_slave_sg
 
 	/* the last sg set eoc flag */
 	sg_link--;
-	sg_link->ctl |= LINK_EOC;
+	sg_link->ctl |= cpu_to_le32(LINK_EOC);
 
 	return vchan_tx_prep(&aml_chan->vchan, &aml_desc->vd, flags);
 }

---
base-commit: 42c31fec1ca76b8b5f7759def122d418dff2cd4b
change-id: 20261012-fix-a9-dma-4be7e61ba653

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>


