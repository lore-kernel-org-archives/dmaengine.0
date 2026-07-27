Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97ACE422542
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184261; cv=none; b=sO335I+GERYbJR3y3lZcOzvDqu32zpEwCtYDSwGv+vGeIDYLTQyUHnfWOPgDISIvS/1W7ZMgItwF/yUMA8IpMuuFzNzZsiG///QfN59duEM2ZM7UrnkiD2OCHxxnVraXvqioVDEtzSqYETF2dLm52dM7uyatYtXjxJgDELvGD28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184261; c=relaxed/simple;
	bh=0CGSHxUG/EztOZVs6CeCpz74sEzJTs20zCCjX8l5TMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HwvJxJeCMZDxaVQbeFM9VFYOKy2vgkABjdNpGeHxdeLU5JWkenB1/l+Tr5jWWQ6b6cfma9FAKPbZ5KhLbgvy2ksp9bhrWD/HyE79pNglxy/RkWz2FhkDWqj4+euc6wU4Q0lk8+T1gQbRrAT/as3TOhhM10IzrFkJYK3vQ2uJ2kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZKP5chDy; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZKP5chDy"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2caea3f742bso38310645ad.0
        for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 13:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184259; x=1785789059; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xTVOXPl0/oCOyKKbAiOIQKTDY/96qIEQMGNIQ40locU=;
        b=ZKP5chDy6Oo1eEyrWWi+gM26yuTpXVP/xEmKgXOYeXPtWcNRWhEK1JTx79zpci65Yc
         DUOikQPhRkE+oTi5ClIgQlFHjuCBlaN/7xxzkwC8G/8sr/a04Ec4F7dfxv3nBpoMhR1j
         TxF53BLAOZTfX9r3by56LkL/9cOBPLe4oGR+g/yvZZnR3J5DR4O1F2qU8oSFcCJTBS1J
         UZhSjbRsO0bwuQ9Nq0/+hiysntrOd59uiRU8324ikmCevjR5croTejaYM3TyW6gDBjHJ
         hW3wXuJ6O7SYSonopubZJ3h/Z9FRO1gB+Yui05H19FDBogD6BWFXBSYhZniYut6g+Ay9
         rhVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184259; x=1785789059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xTVOXPl0/oCOyKKbAiOIQKTDY/96qIEQMGNIQ40locU=;
        b=S7KS0kv9EF26PoLaSS9PM1B2eqRr/qvHKFqKRJ9j0Dgoht19H+btgDzUpDfApgMkR3
         JyDwnqlJjMGXtmNzrdOMGB7cF5L1a2ZYMbeH6LNoMHN8BbwnrJtkk9svfTK+D2Go0tkv
         2gH2C8/eiJPB+Vxly6gTVTnLQ9GbZkKvTiK4S3+NuW0+HVepqltl0aStqsGBeGZ1a127
         hPGkfPklEnLZdpqU6EpGgpWLAQT27+WpEXbWnAeiGF2AWV2eYMzxHEb9eo0/s/1NT3SU
         lb2F3c6F+Nf4IZBu+Sy6Z4WaIc8fgP2Uhal4pAEqLEmSejSFe/448CV1MP6Mjrhr5fVd
         UjGg==
X-Forwarded-Encrypted: i=1; AHgh+Rr5CHkkM3dbiI/6ZZppwRqMDnxFRQxZ4IWShqC+ehdcRwMNnguGYHA96G8+IeFoCCopFmI+tcAhq4k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3wnCSRNVcPo6t9PgOWcFrVQmPaKxATZ1Ed16no6cO+CNYlnLH
	O87ZYfAQ7tJ3umAdluNjyLkNXrMW5TuvsLKiag5MyjC9c/IRpVhkvZNA
X-Gm-Gg: AR+sD12H5hNu2N8zEAtBa7JIFQwUx/Iw9araY8eyaPrWkPGfGo1x+YQmRNZVw+FkBxc
	uDbTXmBFxQ7PsUEss3Aso6j2BTDusCWreHumH2aaaiL+WbpplM8cgSKF5/8ZU5/EdBRFJjIf/fY
	pJ57sO217onk+ABK3La537e088rT21x797fXBj3brgGqoTzylr1JztNQuCR8bzCDRBcXarAIQCW
	nyvCv03dKWD9foZ08r9rXpBzvERqvyVkhmAAW9hR1lYP+/hwiH1nkq2dqQZuThUhqO8YLS2Tny1
	sq/aWZzzZY/TaeqId7qLkwgvM+IpT1Wn/HxMKf99+szmFd6ZPMg0pwc5X+Znh4D6S8EQpGgIas7
	8KehZ93RWMiVnd6u2P5gqLtfQ20hWafT22IhcEmBgn+ffHhVpFzbhlAP00O8lDv+mgsQJwp73gI
	RWbBgR
X-Received: by 2002:a17:902:f542:b0:2ca:ca48:c36a with SMTP id d9443c01a7336-2d00f2cb2a8mr6863955ad.18.1785184258797;
        Mon, 27 Jul 2026 13:30:58 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde59b768sm41551805ad.4.2026.07.27.13.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:30:58 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>
Subject: [PATCH v2 00/64] dmaengine: migrate channel tasklets to WQ_BH
Date: Mon, 27 Jul 2026 13:28:28 -0700
Message-ID: <cover.1785183549.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260108080332.2341725-1-allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Arnd, Vinod and Frank,

This series moves DMAengine client completion bottom halves from private
tasklets to a common per-channel API backed by WQ_BH.

The first patch introduces the dma_chan_*_bh() API with a tasklet backend
and converts virt-dma to it. This separates the driver-facing API from its
implementation without changing callback context.

The second patch switches that backend to a dedicated WQ_BH | WQ_PERCPU
workqueue. WQ_BH keeps callbacks in softirq context, while the common API
centralizes initialization, scheduling, and synchronization. The
workqueue helpers remain internal to DMAengine, and dma_chan_kill_bh()
drains scheduled callbacks to preserve tasklet_kill() semantics.

The remaining patches convert driver-owned channel completion tasklets
and update virt-dma teardown paths. Tasklets used for controller-level
processing, recovery, or other non-client-callback work are deliberately
left alone because the appropriate replacement may differ by driver.

As agreed in the RFC discussion, selecting hardirq callback delivery is a
separate API change and is not part of this series.

Earlier discussion:
https://lore.kernel.org/all/20260108080332.2341725-1-allen.lkml@gmail.com/

Changes since RFC v1:
- split the tasklet-backed channel API from the WQ_BH backend change
- keep the low-level workqueue helpers private to DMAengine
- preserve tasklet teardown semantics by draining scheduled BH work
- convert the remaining driver client-completion tasklets
- retain unrelated controller and recovery tasklets
- route SF-PDMA terminal errors through virt-dma completion handling
- add missing callback synchronization and teardown handling
- fix the build failures reported by the kernel test robot
- rebase onto the current Linus tree

Testing:
- x86_64 allmodconfig
- make -j$(nproc) W=1 drivers/dma/
- scripts/checkpatch.pl --strict --git origin/master..HEAD
- git diff --check origin/master..HEAD

Allen Pais (64):
  dmaengine: add tasklet-backed channel BH helpers
  dmaengine: back channel BH helpers with WQ_BH
  dmaengine: apple-admac: use dma_chan BH callback
  dmaengine: at_xdmac: move irq bottom half to dma_chan BH
  dmaengine: ep93xx: hook callbacks via dma_chan BH
  dmaengine: fsldma: migrate tasklet to dma_chan BH
  dmaengine: fsl_raid: run completions via dma_chan BH
  dmaengine: imx-dma: flip per-chan tasklet to dma_chan BH
  dmaengine: ioat: convert cleanup tasklet to dma_chan BH
  dmaengine: mmp_pdma: replace per-chan tasklet with dma_chan BH
  dmaengine: mmp_tdma: hook completions to dma_chan BH
  dmaengine: mv_xor: convert irq tasklet to dma_chan BH
  dmaengine: mxs-dma: use dma_chan BH scheduling
  dmaengine: nbpfaxi: switch callbacks to dma_chan BH
  dmaengine: pch_dma: convert tasklet to dma_chan BH
  dmaengine: ppc4xx: replace irq tasklet with dma_chan BH
  dmaengine: ste_dma40: convert per-channel tasklet to dma_chan BH
  dmaengine: xgene-dma: wire descriptor cleanup to dma_chan BH
  dmaengine: xilinx-dma: use dma_chan BH instead of tasklets
  dmaengine: xilinx-dpdma: kill vchan BH on remove
  dmaengine: zynqmp-dma: switch completion tasklet to dma_chan BH
  dmaengine: tegra20-apb: use channel BH helpers
  dmaengine: timb_dma: route callbacks via channel BH
  dmaengine: txx9dmac: route callbacks via channel BH
  dmaengine: mv_xor_v2: use channel BH helpers
  dmaengine: mpc512x: route callbacks via channel BH
  dmaengine: k3dma: kill vchan BH on remove
  dmaengine: plx_dma: use channel BH helpers
  dmaengine: sf-pdma: route error callbacks through channel BH
  dmaengine: sa11x0-dma: kill vchan BH on remove
  dmaengine: pl330: route callbacks via channel BH
  dmaengine: k3-udma: use channel BH for vchan completions
  dmaengine: sun6i: kill vchan BH on teardown
  dmaengine: mtk-cqdma: kill vchan BH on teardown
  dmaengine: altera-msgdma: use channel BH helpers
  dmaengine: sprd-dma: kill vchan BH on teardown
  dmaengine: idma64: kill vchan BH on teardown
  dmaengine: img-mdc-dma: kill vchan BH on teardown
  dmaengine: fsl-edma-common: kill vchan BH on teardown
  dmaengine: dw-axi-dmac: kill vchan BH on teardown
  dmaengine: hsu: kill vchan BH on teardown
  dmaengine: jz4780: kill vchan BH on teardown
  dmaengine: pxa_dma: kill vchan BH on teardown
  dmaengine: mtk-hsdma: kill vchan BH on teardown
  dmaengine: mtk-uart-apdma: kill vchan BH on teardown
  dmaengine: imx-sdma: kill vchan BH on teardown
  dmaengine: loongson1-apb: kill vchan BH on teardown
  dmaengine: owl-dma: kill vchan BH on teardown
  dmaengine: hisi: kill vchan BH on teardown
  dmaengine: dw-edma: kill vchan BH on teardown
  dmaengine: bcm2835: kill vchan BH on teardown
  dmaengine: tegra210-adma: kill vchan BH on teardown
  dmaengine: fsl-qdma: use dma_chan_kill_bh
  dmaengine: st_fdma: use dma_chan_kill_bh
  dmaengine: dma-axi-dmac: use dma_chan_kill_bh
  dmaengine: omap-dma: use dma_chan_kill_bh
  dmaengine: edma: use dma_chan_kill_bh
  dmaengine: qcom-adm: use dma_chan_kill_bh
  dmaengine: tegra186-gpc: use dma_chan_kill_bh
  dmaengine: bam-dma: use dma_chan_kill_bh
  dmaengine: dw: defer callbacks via channel BH
  dmaengine: hidma: defer callbacks via channel BH
  dmaengine: qcom-gpi: defer callbacks via vchan
  dmaengine: switchtec: use channel BH helpers

 drivers/dma/altera-msgdma.c                   | 14 +--
 drivers/dma/apple-admac.c                     | 16 ++--
 drivers/dma/at_xdmac.c                        | 13 ++-
 drivers/dma/bcm2835-dma.c                     |  2 +-
 drivers/dma/dma-axi-dmac.c                    | 10 ++-
 drivers/dma/dma-jz4780.c                      |  2 +-
 drivers/dma/dmaengine.c                       | 89 ++++++++++++++++++-
 .../dma/dw-axi-dmac/dw-axi-dmac-platform.c    |  2 +-
 drivers/dma/dw-edma/dw-edma-core.c            |  2 +-
 drivers/dma/dw/core.c                         | 42 +++++++--
 drivers/dma/dw/regs.h                         |  1 +
 drivers/dma/ep93xx_dma.c                      | 12 ++-
 drivers/dma/fsl-edma-common.c                 |  2 +-
 drivers/dma/fsl-qdma.c                        |  2 +-
 drivers/dma/fsl_raid.c                        | 11 +--
 drivers/dma/fsl_raid.h                        |  1 -
 drivers/dma/fsldma.c                          | 10 +--
 drivers/dma/fsldma.h                          |  1 -
 drivers/dma/hisi_dma.c                        |  2 +-
 drivers/dma/hsu/hsu.c                         |  2 +-
 drivers/dma/idma64.c                          |  4 +-
 drivers/dma/img-mdc-dma.c                     |  2 +-
 drivers/dma/imx-dma.c                         | 26 +++---
 drivers/dma/imx-sdma.c                        |  4 +-
 drivers/dma/ioat/dma.c                        | 14 +--
 drivers/dma/ioat/dma.h                        |  3 +-
 drivers/dma/ioat/init.c                       |  2 +-
 drivers/dma/k3dma.c                           |  2 +-
 drivers/dma/loongson/loongson1-apb-dma.c      |  2 +-
 drivers/dma/mediatek/mtk-cqdma.c              |  2 +-
 drivers/dma/mediatek/mtk-hsdma.c              |  2 +-
 drivers/dma/mediatek/mtk-uart-apdma.c         |  4 +-
 drivers/dma/mmp_pdma.c                        | 13 ++-
 drivers/dma/mmp_tdma.c                        |  9 +-
 drivers/dma/mpc512x_dma.c                     | 74 +++++++++------
 drivers/dma/mv_xor.c                          | 12 +--
 drivers/dma/mv_xor.h                          |  2 -
 drivers/dma/mv_xor_v2.c                       | 20 ++---
 drivers/dma/mxs-dma.c                         | 11 ++-
 drivers/dma/nbpfaxi.c                         | 13 ++-
 drivers/dma/owl-dma.c                         |  2 +-
 drivers/dma/pch_dma.c                         | 14 +--
 drivers/dma/pl330.c                           | 18 ++--
 drivers/dma/plx_dma.c                         | 12 +--
 drivers/dma/ppc4xx/adma.c                     | 14 +--
 drivers/dma/ppc4xx/adma.h                     |  2 -
 drivers/dma/pxa_dma.c                         |  2 +-
 drivers/dma/qcom/bam_dma.c                    |  4 +-
 drivers/dma/qcom/gpi.c                        | 17 +++-
 drivers/dma/qcom/hidma.c                      | 18 +++-
 drivers/dma/qcom/qcom_adm.c                   |  4 +-
 drivers/dma/sa11x0-dma.c                      |  2 +-
 drivers/dma/sf-pdma/sf-pdma.c                 | 14 ++-
 drivers/dma/sprd-dma.c                        |  2 +-
 drivers/dma/st_fdma.c                         |  2 +-
 drivers/dma/ste_dma40.c                       | 13 ++-
 drivers/dma/sun6i-dma.c                       |  2 +-
 drivers/dma/switchtec_dma.c                   | 16 ++--
 drivers/dma/tegra186-gpc-dma.c                |  2 +-
 drivers/dma/tegra20-apb-dma.c                 | 18 ++--
 drivers/dma/tegra210-adma.c                   |  2 +-
 drivers/dma/ti/edma.c                         |  2 +-
 drivers/dma/ti/k3-udma.c                      | 12 +--
 drivers/dma/ti/omap-dma.c                     |  2 +-
 drivers/dma/timb_dma.c                        | 21 +++--
 drivers/dma/txx9dmac.c                        | 12 +--
 drivers/dma/txx9dmac.h                        |  1 -
 drivers/dma/virt-dma.c                        | 12 +--
 drivers/dma/virt-dma.h                        |  7 +-
 drivers/dma/xgene-dma.c                       | 19 ++--
 drivers/dma/xilinx/xilinx_dma.c               | 20 ++---
 drivers/dma/xilinx/xilinx_dpdma.c             |  1 +
 drivers/dma/xilinx/zynqmp_dma.c               | 19 ++--
 include/linux/dmaengine.h                     | 28 ++++++
 74 files changed, 482 insertions(+), 311 deletions(-)


base-commit: f5098b6bae761e346ebcd9da7f95622c04733cff
-- 
2.43.0
