Received: from imap5.colo.codethink.co.uk (imap5.colo.codethink.co.uk [78.40.148.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E39737F732;
	Wed, 17 Jun 2026 08:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.40.148.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781686194; cv=none; b=TQaDZkpDpx+lS/+bysqr9kvFOK+Y5MMHette0p2Ut2WhPxbldgLuQzTy10kBM2ZWeHc0pA6WO3oiepFC15C3HEbWe78iXPdVYj6wsvwPScps/E7IhtXI1cInbyKujAB+DQwsI3YK42zpzBNYXcMY3slRpuVsopzr+msPBULwvyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781686194; c=relaxed/simple;
	bh=xQPSdirsxv6ijUtoiDaS30xqu54Aw5zWX8fwQOuw0y0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=p70lfsXF7MetIMqrZ14Uc6nGCRIj0PBWt1mrt3ieeI1V53gILKhP2dmyfj1g6x4UV0D2nHEJho1nrLxYn1S+DguBF4RJpM7zabSXom0MPAxNfFtztylo/1xrl+zKPM8qAIBuLzDVZv7zSvU8TJwck0zfW2mz8osoxfNqhbfEoJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk; spf=pass smtp.mailfrom=codethink.com; dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b=AL5sK6QH; arc=none smtp.client-ip=78.40.148.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codethink.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="AL5sK6QH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:
	References; bh=BgoFfRHevUv2LavsVuNuyGpqu+MEvM7WfElqq2spw7Y=; b=AL5sK6QHvubTC4
	urlMTkGc7EbMWiJii6Er8UFL1NYCnh3ROfWg9iGLdroZ5zj0YP8ChfMjXzokAw87xkXPnc9NjMRMv
	g5zD616oxZlYs/OZZ/QHlJmQWyELMwGxd1DBCvvT/DvPDHT1vjaF9myNPwJME5IrWNHHfzk8182Lf
	XnV5W/hL+WvTzujObtpQB8JUzZSydOgyzTosbce7ypY0blZ4oCvC68pEWH9ujZbMgg9MQDv1wlCy9
	i8tBG3JgjdLY6Na2/cGesPN5rx1ehHcvPcBGj2sw8tFaIO+T5E+K5RkWnW7V4ihIQDQzRLonMsnJk
	kW+i4UvFtqUSLHLgqxVA==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1wZlxx-00ChOV-AY; Wed, 17 Jun 2026 09:49:45 +0100
Received: from ben by rainbowdash with local (Exim 4.99.4)
	(envelope-from <ben@rainbowdash>)
	id 1wZlxw-00000002xTT-46Cn;
	Wed, 17 Jun 2026 09:49:44 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH] dmaengine: dw-axi-dmac: fix __le32 on set of CH_CTL_H_LLI_VALID
Date: Wed, 17 Jun 2026 09:49:43 +0100
Message-Id: <20260617084944.705266-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: srv_ts003@codethink.com

When writing the lli->ctl_hi, this is an __le32 type so the
value being orred should be convered to __le32 by cpu_to_le32.

Fixes 1deb96c0fa58a ("dmaegine: dw-axi-dmac: Support device_prep_dma_cyclic()")
Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
--
Note, the call to axi_chan_irq_clear() is passing lli->status_lo
through which is also an __le32 but it does not seem to be set
anywhere. Is this also a bug?
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index 4d53f077e9d2..8311df2f11bb 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -1123,7 +1123,7 @@ static void axi_chan_block_xfer_complete(struct axi_dma_chan *chan)
 				hw_desc = &desc->hw_desc[i];
 				if (hw_desc->llp == llp) {
 					axi_chan_irq_clear(chan, hw_desc->lli->status_lo);
-					hw_desc->lli->ctl_hi |= CH_CTL_H_LLI_VALID;
+					hw_desc->lli->ctl_hi |= cpu_to_le32(CH_CTL_H_LLI_VALID);
 					desc->completed_blocks = i;
 
 					if (((hw_desc->len * (i + 1)) % desc->period_len) == 0)
-- 
2.37.2.352.g3c44437643

