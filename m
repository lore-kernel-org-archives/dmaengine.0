Received: from mail-m19731102.qiye.163.com (mail-m19731102.qiye.163.com [220.197.31.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F49360EEE;
	Thu,  3 Sep 2026 12:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788437424; cv=none; b=bNTTsT/DWkDL/CrYKVPQBS4CXesb3wPJR7/q91gcNvWacuUkOmQw+OgLe6o5Hb19Eg+teR1jr2lvTii2aAiuqrhWa4pBJ+ZcEVmw1aZHN8/8JRKmapLn7ZCH+THrHA/aswwKF8HhTNVla/MD0S7VLLZQWtPS2a7CGMPXIYNdPCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788437424; c=relaxed/simple;
	bh=FfBPBusyPLmGFgdXRNafUuuHJj7gPkA/1xGN/T62muk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JqID7Ldk7QcbPFnOTCmL1DSzV15OVAOpiYh7ofTSwM6/WDzFEDPmNmBlSQq5UHiy/SjaQLF3j5WZbt74HxnFuRD0x78GR309k6bVICyt75Rrzq9hWZwS/iLHMeYLB8CSLMy+8AO7Z8PhLEYYpvELhs6BEn+t+i8SlEdAosy9c9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnics.com; spf=pass smtp.mailfrom=resnics.com; arc=none smtp.client-ip=220.197.31.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnics.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnics.com
Received: from localhost.localdomain (unknown [115.220.204.6])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4c6c14956;
	Thu, 3 Sep 2026 19:54:49 +0800 (GMT+08:00)
From: Ruizhe Zhou <zhouruizhe@resnics.com>
To: Vinod Koul <vkoul@kernel.org>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Frank Li <Frank.Li@kernel.org>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ruizhe Zhou <zhouruizhe@resnics.com>
Subject: [PATCH 0/3] dmaengine: Remove obsolete 32-bit DMA mask fallbacks
Date: Thu,  3 Sep 2026 19:54:38 +0800
Message-Id: <20260903115441.912500-1-zhouruizhe@resnics.com>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa0671f25d403ackunma38d057f6ea63
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaSk9MVkNJHk8eSUkaH0sYTFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlKSk5VSUlLVUlLT1VNWVdZFhoPEhUdFFlBWU9LSFVKS0
	hKTkxOVUpLS1VKQktLWQY+

A few DMAengine drivers set a >32 bit DMA mask and retry with a 32-bit
mask if the first call fails. This treats the return value of
dma_set_mask_and_coherent() as an indication that the platform requires
a narrower DMA width.

That is not a correct interpretation of dma_set_mask_and_coherent().
The mask passed to the DMA API describes the highest address a device can
reach. It asks the DMA layer to keep mappings within that limit; it is not
a probe asking the platform which addressing mode the device should use.
A wider mask includes every address permitted by a 32-bit mask, including
addresses from a platform that only produces 32-bit DMA addresses.

Since commit 91ef26f914171 ("dma-direct: relax addressability checks in
dma_direct_supported"), the DMA API guarantees support for masks
of 32 bits or wider. A failed wider request is therefore not evidence that
the driver should advertise a smaller capability. Retrying with a 32-bit
mask cannot repair the underlying DMA setup failure. The DMA API HOWTO
explicitly identifies this fallback pattern as incorrect [1]. See [2] and
[3] for details.

This series removes the fallbacks from the AMD PTDMA, PLX and
Spreadtrum DMA drivers without changing the mask selected for each device.
The return-value checks are retained. DMA setup errors are still reported
and still abort device initialization.

Testing was compile-only. No hardware testing was performed.

[1] DMA API HOWTO, "DMA addressing capabilities"
https://docs.kernel.org/core-api/dma-api-howto.html#dma-addressing-capabilities

[2] commit 91ef26f914171 ("dma-direct: relax addressability checks in
dma_direct_supported")
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=91ef26f914171cf753330f13724fd9142b5b1640

[3] commit f7ae20f2fc4e ("docs: dma: correct dma_set_mask() sample code")
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f7ae20f2fc4e

Best regards,
Ruizhe Zhou

Ruizhe Zhou (3):
  dmaengine: ptdma: Remove obsolete 32-bit DMA mask fallback
  dmaengine: plx_dma: Remove obsolete 32-bit DMA mask fallback
  dmaengine: sprd: Remove obsolete 32-bit DMA mask fallback

 drivers/dma/amd/ptdma/ptdma-pci.c | 8 ++------
 drivers/dma/plx_dma.c             | 2 --
 drivers/dma/sprd-dma.c            | 7 ++-----
 3 files changed, 4 insertions(+), 13 deletions(-)


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
--
2.27.0
