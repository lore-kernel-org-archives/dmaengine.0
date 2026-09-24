Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE3830C618;
	Thu, 24 Sep 2026 08:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790238953; cv=none; b=QeWtT9J493fxYUSUgSL92tzaUq4H2nGHGGSby3xlE3ijJ8zxOZNxr8t33TnC9y2u9OKU1K8rawMMuxlO5XI2EGST4GSczNwLV6PvbKJi2k6WR67SzrHEL9wYKVOqTfTw1rues6u4lj7+oL0YF/DbSCRjIfMb0JdWEvZUsXSR6QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790238953; c=relaxed/simple;
	bh=Lgbu4QASUShM0ABzk6mw0HYn72QE9tOPFVFRrJudzGI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iDWkl2hEE34y6KMl0To9BpKYEF+Rd30SO7N3HwfcBD+/BzCQL6NBlx4nv8By/ORv+ed/HQ+xD5mkfecSMAIb71N9Ynt+Hcczm3Q9p1m5ZVbbU2T6ZqqsMBAK8eT3n7CWemVF/kpu2BLgQ04yFlsB8JE8qPxHjX9TQpCtYID3+uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gPNP7/JM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gPNP7/JM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8C661F000FF;
	Thu, 24 Sep 2026 08:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790238951;
	bh=OCqBIg9gOGuJYcpE2luzNmF0p8saT0sa1jPdZc8fnAY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=gPNP7/JMQlTM27UHv0/OBDUU+lTregSDVJCVUlG9glIl6+LrvJVmxpnvHwcL58NSt
	 DisIoK7tCjFTpDBCmzULESTt+9hwztFGxeiYqbLxpsKiwql5gKjghF/O0g2olI4u/H
	 uakuYX1kr55tfBpC/qIXkiVxaxeDllJNnr02afzpBd/4ttIy0got+5AA+uyCV4DWhl
	 jUu3FphFA5Vpw4EAgEn5LsVeC2K6oGUyRFppFk+aUj4KldTte4ePitsEbJWruHDf3f
	 D1jin4X5eH8aZyt8768Lv0soay8eji2JusEultjmLcJO9j7FawXfLGlkRhfyrRezZj
	 691fSD9IVrs7w==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 24 Sep 2026 10:35:33 +0200
Subject: [PATCH v6 21/23] dmaengine: ste_dma40: Search all blocks for fixed
 logical channels
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-dma40-fixes-v6-21-fdb6755020a2@kernel.org>
References: <20260924-dma40-fixes-v6-0-fdb6755020a2@kernel.org>
In-Reply-To: <20260924-dma40-fixes-v6-0-fdb6755020a2@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, sashiko-bot@kernel.org
X-Mailer: b4 0.14.3

Fixed logical channel allocation scans physical channels in blocks of
eight. When the requested physical channel does not belong to the first
block, d40_allocate_channel() returns -EINVAL instead of checking later
blocks.

Skip nonmatching blocks so controllers with more than eight physical
channels can allocate fixed logical channels from the later blocks.

Fixes: 5cd326fd27da ("dmaengine/ste_dma40: allow fixed physical channel")
Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/dmaengine/20260819225008.5F9651F000E9@smtp.kernel.org/
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index d3d79e394d02..def2416fb1d0 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -2111,11 +2111,8 @@ static int d40_allocate_channel(struct d40_chan *d40c, bool *first_phy_user)
 		if (d40c->dma_cfg.use_fixed_channel) {
 			i = d40c->dma_cfg.phy_channel;
 
-			if ((i != phy_num) && (i != phy_num + 1)) {
-				dev_err(chan2dev(d40c),
-					"invalid fixed phy channel %d\n", i);
-				return -EINVAL;
-			}
+			if (i != phy_num && i != phy_num + 1)
+				continue;
 
 			if (d40_alloc_mask_set(&phys[i], is_src, event_line,
 					       is_log, first_phy_user))

-- 
2.55.0

