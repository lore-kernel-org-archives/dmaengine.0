Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246AA43550C
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 18:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786385454; cv=none; b=NKv8zEzwrXWNIVEPpVLud8DVsNrTgWrUF4JG3n7iwx06SuzOd48iliX8OgDkRiDER8KACHAFjLuxsGoX6QhbMlDh2stZFVwJiSYzHCavdo8ZBa8ITmPP4k9flN5unJ1/S0U6peZpe+N7btFaCohw1dVJVDwhwPOxr5Fcrw1DvGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786385454; c=relaxed/simple;
	bh=U5y6SkObFEniPm0/c0xw3PoJNtvFXujy69+i9fgNrX0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hi5SATeGC3CvcfywYkQnVmtzOZTtEykXucuXiXcHLFTae9FWq4YFXP3GyvTy3ASHWjnI/FyxY6D3yan3Ifwe/QbP5HQsS5awvRzC/sI1vv1SWRe3GRQ18NbXkG6cdKdWEzi0c3vFyVk/uiXKFiUK1lBmEhwnG2y8ity9RzBg8JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iZ7fNcCZ; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iZ7fNcCZ"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so2202023a91.0
        for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 11:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786385452; x=1786990252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UfT5nXtz7QJAxH/V+XFcEAtAU7N3vM6QuE5YSxFWcEg=;
        b=iZ7fNcCZ/ma4fprbPw/c2L0vxqL4B/KdBERBis8YJ1JThHlh370CQP60oT91cwRx61
         QGRKiW8z5DoutGDrEM9WsWGdORczt5iiKXNo5RvgOQdpAXXCZpd+TyqiwapLzelTiSV7
         BaWx9SxlyqIhfqOCOT05L6TOhxEcqg1UYi4UvcgcDl0LrmbdfPYNPQQiqVFfo3mXbSxp
         R616OA+DbJtQ5GatOPaMeOy5OhrNIwXPB1lMvtbwjRzYy8dstLyOVvkgslvWnWQO/LZy
         TOuA15uVMByABeU/Kma5rJrySdAn6YOjrN/L4ClTLh6eVvr40gHr8Q2YCy2D/7ydp8uL
         Fe0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786385452; x=1786990252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UfT5nXtz7QJAxH/V+XFcEAtAU7N3vM6QuE5YSxFWcEg=;
        b=nP/Vmj5OtVQ2qCcDc9FTbvEJ/pqv6ASCtYrxOvOw2WH1d/PVJtnCiFgzYzTa5fHmlu
         4dO2iS43OAJMfDZD/6TKOzTyAjBrRwXeUG4z3QLRnBEhfXqHOzjEHtTwcS97dekN97YR
         LAsUn2TpFdJQkUtfxbt/X497qtGbkB6o8dYT726OkRqnNP/1UsMrd3LdA7PRR/6Rlmzl
         Ujj2WvaCYKMXw0j49y3Optcx5lsqf6damgudrJ46slOXbw7rS6CgWcq/DpcwGqtA7996
         9RiG3MdcK05UPZfbX53RZmz125AYg91RtUZgepFACz5qxhYxPQG8gOaFC0GbLph2ONNU
         A+5A==
X-Forwarded-Encrypted: i=1; AHgh+RpRSMeAFIABKn7x37EU5dMIgisV40MJRZ17qYOMcak3VerzoIssOPErUh1L/ZpXxvuByHb+MAs+Tpw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxOEnlwAenSxLNs109Ifmt6rGRR9VdxK+d7gYIk9M12EIff7zN
	Y9afwPq0dJ1udNbicdBQ1H9CppaLAB+JdVHUnbSYttttYhE75isR2AOf
X-Gm-Gg: AR+sD116c0y9ZtaXB82r00alN6L7tMXN8TLtrC8X82TtdnXx/lOBW3swzQM34+abADv
	lmoxYzZj9fVFOhfHm1DnSybOZA3FWetoHExThJ99fHyGVb0FIIzITJXnq6PUzwba8qwncyMT7M4
	8aHDuNJ+t0fFojZhAeP/ewIMasZ8pRQbzkaxNQ2yQTICWO9JXdxRFQqb7EMmCodeX+v9M42Jzat
	waslIdGq26m1GViz10chKCCYePeW10vu+2By3QsMrkuEawMXT+kYXefbbBkvuQrZkYJsn20W5oq
	Luq6RrYmOCR4PK8+firO4kR45ufFh9W04HRlA2N9wel7ckVaJp8TDRumiy2N6kwS3G4RQ0s69OX
	T+fzEzeT1VEwOc4pOcHJDHOmGNqN23123Aa4iEoP2yUblE6gF/fzCLb+upZizNYH79TN70JUXXD
	etA644k5Q5NBdojQp+wF1AZXEmP2T4hx+W5vYiltQJgGRbowYHRZ3aKyU3vh74eRM=
X-Received: by 2002:a17:90a:e7c7:b0:37d:f983:7b5 with SMTP id 98e67ed59e1d1-392cc961c23mr2925926a91.9.1786385452365;
        Mon, 10 Aug 2026 11:10:52 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fa9:fa00:b1a9:6513:83c6:1d23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d53b873asm472795a91.17.2026.08.10.11.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 11:10:51 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v3 00/34] dmaengine: migrate channel tasklets to WQ_BH
Date: Mon, 10 Aug 2026 11:09:01 -0700
Message-ID: <cover.1786384168.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1785183549.git.allen.lkml@gmail.com>
References: <cover.1785183549.git.allen.lkml@gmail.com>
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

The first patch introduces the dmaengine_*_bh() API with a tasklet backend
and converts virt-dma to it. It also updates every driver that directly
accesses the removed virt_dma_chan tasklet, keeping the patch buildable on
its own. This separates the driver-facing API from its implementation
without changing callback context.

The second patch switches that backend to a dedicated WQ_BH | WQ_PERCPU
workqueue. WQ_BH keeps callbacks in softirq context, while the common API
centralizes initialization, scheduling, and synchronization. The
workqueue helpers remain internal to DMAengine, and dmaengine_kill_bh()
drains scheduled callbacks to preserve tasklet_kill() semantics.

The remaining patches convert driver-owned channel completion tasklets.
Tasklets used for controller-level processing, recovery, or other
non-client-callback work are deliberately left alone because the
appropriate replacement may differ by driver.

As agreed in the RFC discussion, selecting hardirq callback delivery is a
separate API change and is not part of this series.

Earlier discussion:
https://lore.kernel.org/all/20260108080332.2341725-1-allen.lkml@gmail.com/

v2:
https://lore.kernel.org/all/cover.1785183549.git.allen.lkml@gmail.com/

Changes since v2:
- rename the new public helpers and callback type from dma_chan_* to
  dmaengine_* as requested by Vinod
- update all direct virt_dma_chan tasklet users in patch 1, fixing the
  intermediate build failures reported by Sashiko
- fold the resulting 30 empty teardown patches, reducing the series from
  64 to 34 patches without dropping any driver changes
- rebase from Linux 7.2-rc5 to d58772d8520c (latest Linus master)

Review tags retained on unchanged standalone patches:
- 09/34 IOAT: Acked-by Dave Jiang
- 17/34 STE DMA40: Reviewed-by Linus Walleij
- 27/34 PLX DMA and 34/34 Switchtec: Reviewed-by Logan Gunthorpe

Review tags received on v2 patches now folded into 01/34:
- v2 41/64 HSU: Reviewed-by Andy Shevchenko
- v2 60/64 BAM DMA: Acked-by Bartosz Golaszewski

The HSU and BAM DMA changes remain in 01/34, but those patch-specific
trailers are not attached to the substantially broader 35-file patch.
Andy and Bartosz are copied here and on 01/34 for visibility.

Testing:
- x86_64 olddefconfig, make -j$(nproc) W=1 drivers/dma/
- the same DMA build with patch 1 applied independently
- scripts/checkpatch.pl --strict on all 34 patches

Allen Pais (34):
  dmaengine: add tasklet-backed channel BH helpers
  dmaengine: back channel BH helpers with WQ_BH
  dmaengine: apple-admac: use dmaengine BH callback
  dmaengine: at_xdmac: move irq bottom half to dmaengine BH
  dmaengine: ep93xx: hook callbacks via dmaengine BH
  dmaengine: fsldma: migrate tasklet to dmaengine BH
  dmaengine: fsl_raid: run completions via dmaengine BH
  dmaengine: imx-dma: flip per-chan tasklet to dmaengine BH
  dmaengine: ioat: convert cleanup tasklet to dmaengine BH
  dmaengine: mmp_pdma: replace per-chan tasklet with dmaengine BH
  dmaengine: mmp_tdma: hook completions to dmaengine BH
  dmaengine: mv_xor: convert irq tasklet to dmaengine BH
  dmaengine: mxs-dma: use dmaengine BH scheduling
  dmaengine: nbpfaxi: switch callbacks to dmaengine BH
  dmaengine: pch_dma: convert tasklet to dmaengine BH
  dmaengine: ppc4xx: replace irq tasklet with dmaengine BH
  dmaengine: ste_dma40: convert per-channel tasklet to dmaengine BH
  dmaengine: xgene-dma: wire descriptor cleanup to dmaengine BH
  dmaengine: xilinx-dma: use dmaengine BH instead of tasklets
  dmaengine: xilinx-dpdma: kill vchan BH on remove
  dmaengine: zynqmp-dma: switch completion tasklet to dmaengine BH
  dmaengine: tegra20-apb: use channel BH helpers
  dmaengine: timb_dma: route callbacks via channel BH
  dmaengine: txx9dmac: route callbacks via channel BH
  dmaengine: mv_xor_v2: use channel BH helpers
  dmaengine: mpc512x: route callbacks via channel BH
  dmaengine: plx_dma: use channel BH helpers
  dmaengine: sf-pdma: route error callbacks through channel BH
  dmaengine: pl330: route callbacks via channel BH
  dmaengine: altera-msgdma: use channel BH helpers
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

-- 
2.43.0
