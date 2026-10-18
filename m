Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8F339A815;
	Sun, 18 Oct 2026 04:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792296669; cv=none; b=Kf66tGbmRMZcJw7qXXauCMHUEo4Jp4/CKDLAyzVbIMpGPnCzhnLgbWn6O4khcB/t1U8xcjWjm7jyyAXOTzgxP5amQxJRZVU2mwotWGpNYLcxoq1gutEvH6HwiVms3lMFzXavfjmhHPJ9LeMl3doxq5WqnSFIoyeeeH6kFBp0FPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792296669; c=relaxed/simple;
	bh=G6YCQUWoTfdoR9sjUuiGCFgf7yaWwuioxagRevsh1y4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CXksnHpM2xhedAmjoeqPoCnre4iqxBiqfH6S20pzH021VLZ3aEyCy2Vc+OlS1F399xXeRrLWNxZ9eMo7GuWBafYW8GV/vdoTHMDxN7zvsnMWD5PeTSYrr5KcZkJWaj5d2veGr3bzViVIBJ9HzN2Y7cU+5DIHmPUoMrK8/MZQqeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=j5t9eGMW; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="j5t9eGMW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=SX
	ugwLdUOyNBCr4mpnAsSBw9bY2S7YZs8qkchEaRL6o=; b=j5t9eGMWH1jEU6vcmH
	hJ0BG0o+xoJB80HfRxMDs2+x4Qq9zVweFxIEgWil8IrJNRupqs3935+LnJB+aLuc
	Xd8IZhB7TkDjCWThydVOXpzkuavJEx90aPyVEfIgRN9Rf7ENzqe0lho3P07kCGFw
	DipcWlKdUtE8p7PuR61jOIX+Y=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3n6n9RdRqdUaGAw--.28247S2;
	Sun, 18 Oct 2026 12:07:27 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Zhang Wei <zw@zh-kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	Ryan Mallon <rmallon@gmail.com>,
	Mika Westerberg <mika.westerberg@iki.fi>,
	Ebony Zhu <ebony.zhu@freescale.com>,
	Kumar Gala <galak@gate.crashing.org>,
	Dan Williams <djbw@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Zhangfei Gao <zhangfei.gao@marvell.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Qiao Zhou <zhouqiao@marvell.com>,
	Leo Yan <leoy@marvell.com>,
	Lennert Buytenhek <buytenh@marvell.com>,
	Nicolas Pitre <nico@marvell.com>,
	Saeed Bishara <saeed@marvell.com>,
	Maciej Sosnowski <maciej.sosnowski@intel.com>,
	Shawn Guo <shawn.guo@freescale.com>,
	Srinidh Kasagar <srinidhi.kasagar@stericsson.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 0/7] dmaengine: drain completion tasklets during teardown
Date: Sun, 18 Oct 2026 12:07:16 +0800
Message-Id: <20261018040724.534641-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3n6n9RdRqdUaGAw--.28247S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZrWDJF18Xw4rGry3XF4kXrb_yoW8GFykpF
	WfG3yY9rW8tF4Yk3WkJa12vFyrX393J3yYkwsxtw15ua15ZF9Yqr1rK3WYgF4jyr4xZF4j
	qa1DtF1rur1kAFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0z_l1vfUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzR9gmmrURf+2FwAA3N

Several DMAengine drivers defer interrupt completion processing to
tasklets, but release channel resources without draining tasklets that
were already queued. Stopping or releasing an IRQ prevents new hard IRQ
handlers, but does not synchronize the deferred tasklet.

Depending on the driver, a late tasklet can access freed descriptor
storage or invoke a completion callback after its client data has been
released. Ensure each producer is stopped before killing the tasklet and
freeing the resources it can access.

Each patch is independent and keeps the synchronization local to one
driver's channel or device teardown path.

Jiale Yao (7):
  dmaengine: ep93xx: drain tasklet before freeing channel resources
  dmaengine: fsldma: drain channel tasklet during removal
  dmaengine: mmp_pdma: drain channel tasklets during removal
  dmaengine: mmp_tdma: synchronize tasklet when freeing a channel
  dmaengine: mv_xor: drain IRQ tasklet before freeing channel memory
  dmaengine: mxs-dma: synchronize tasklet when freeing a channel
  dmaengine: ste_dma40: synchronize tasklet when releasing a channel

 drivers/dma/ep93xx_dma.c | 4 +++-
 drivers/dma/fsldma.c     | 1 +
 drivers/dma/mmp_pdma.c   | 4 ++++
 drivers/dma/mmp_tdma.c   | 2 ++
 drivers/dma/mv_xor.c     | 6 ++++--
 drivers/dma/mxs-dma.c    | 1 +
 drivers/dma/ste_dma40.c  | 2 ++
 7 files changed, 17 insertions(+), 3 deletions(-)

-- 
2.34.1

