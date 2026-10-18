Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035C44CF489
	for <dmaengine@vger.kernel.org>; Sun, 18 Oct 2026 21:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792358231; cv=pass; b=lolBDI4MySGg28MikF55jqgUWDQI1Wsq+FYLRdzPwvBSGEugDqJB+kYB6PYURXP+WqW+M5nlazBfQwVHfD3B3LnqOk3UVX0rYox5Rqnrs7gnZZwUzXWwdRKzi6pN0VBMt0cJD2KeGjmb1qcjHi1LJzrm55fCS9I7j4EaXevMuvk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792358231; c=relaxed/simple;
	bh=PqtNMasepIO9YacdMGYuJbx13ovqIavjJ/qBmC4bwa8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pYDAfaENVa5Q4q7exVrcvcy2cIcLD9hpyepmDRzdUG3KYKILkcryXkWi/S/RmwKmQ5tVH51UicWe2y5dJ90HyYu6g8qdOEbG6wAoa2i+15rmdRc5VAz4H8vIAq97umJwoSmAzJGwJqvNsRVFci4q6iQ6Ff5ClbGugEdk2merqyQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eo15CoT+; arc=pass smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eo15CoT+"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-6767d92cde6so1568902d50.0
        for <dmaengine@vger.kernel.org>; Sun, 18 Oct 2026 14:17:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792358227; cv=none;
        d=google.com; s=arc-20260327;
        b=hKNQjBAZqg6j8ML9ajR3lsGxQ/qNl593lGhl2s05DnauG7J2TFnYAd5hFZtCi3L/0H
         d9Gc+0twBPRGaR0U5hKwqS55Uu1tw7tLf0kveeQD5pR/At8YWALQc2to/tsCMFLbMPxt
         iUggZXSK3lTEkgytnWMWb4iSc5kwCUE1gb4KncILuPmOhO7c2jxrFjAMuswN1RXjyvS+
         gLBdJRhjz81O12yhYaMgJGA2pdM9rwqXI5xzRwKFApbaQIojYnRgfWEMBAudYnqnrhpc
         A0RrwrywRm/CJnVc/+bD8Rd+Ow1gM3AUDLhqyxmcgCXfGLL5zPGKKBKkfZJd03mw+OUc
         7ImA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=KrNYnqPQ+SlBkmRO6PY6MJGq6BIBt5+rihjajz8ZlPk=;
        fh=w3MTS1gu0Sxd7udwvStr4RgOK19CEJKakXd9uYCBPbE=;
        b=C0m7cnueDeX0ubxhe7h4yWbGAEDkrj8kj7eaUeAZFVhr7XlfQiCkjxQrDo2uXNGcah
         h1vw66YVnT2sTTx+nykRmvGgJ85VH8SJB/adJ8Dx+H4p7cY+5pEj8vrB3kPOqeEwqFXK
         AwhVqjyMTUpfkrt3LwVXrJXeCvwl80kZU3mJTLa88BjCnjHIpEPqZh4h8KqVSBeXneFb
         9XxpVvw1Nb+lhZHoPTvHUZr8rSfkZqdbvcbNTSGPsWW9aOyKCbbB+ERlSE3piCgIHIDV
         mLf1NRneLcBW+NfhGzwik56aUYv+KpeQHVRYP9Bqmettqyo68SvDCjL/uvltsl3agzQH
         Da1w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792358227; x=1792963027; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KrNYnqPQ+SlBkmRO6PY6MJGq6BIBt5+rihjajz8ZlPk=;
        b=eo15CoT+8IcxsR8kel9x06kajdy4xcFXiwckdx5D5mhyI3zaRfdysjnjivgZN03SOJ
         fntRd7KRIjF7C2DE4MsDY7ecdtRSQgANlSDi8TXC0vCaIBU1n+rAmogjRD1RgY2SGWkb
         UlPO76aoi+xby3BAoW6Qh17sbvoRy5zp8mjpXJEAqrjmkC7d0Zq8eNq96p3qS2jv7pit
         1IRvIvlpSLv6Quif5btQd9rUFM3RlFCiJsdYW8p7hDc3XhGz6+vFYEcrLchSWjmLd7Ss
         +JAez0d100gGVh6HZ8zTOJiXV87Qu+8BXut/e7TuqspZcDDqxNKRovPu9aZ6a+Zu05bh
         5OKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792358227; x=1792963027;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KrNYnqPQ+SlBkmRO6PY6MJGq6BIBt5+rihjajz8ZlPk=;
        b=XCfpAJg5OHUQSR5KRaSivu1rgg7ahVxFd26mdsO+m+YocOkR2e5KVlOvRqOPwcgDj3
         2g0nfMOxCEtJNMCIIaEyHQwMBIaIr59sMSVU9biHoO4U6ZNx9E6SQlvpVoMJN3Gtno69
         4FtfQiTp4Me2N7gwAPNACfeUYav7H8E3okFQ1IEP6KP37eP/zcdXrR/1JWH2GoOQrxKx
         xTQYTrFG8U5RVOvjaQriQSbIVjyrQ9CipXJoXzL8Nu10U9EAWI8EONFbLCEC85OA5RCG
         Ql3+fXyRURSLGPhtYL/vrK9k2oUFZaDVuWhLCjYyNjeJTaRN0KxbCkYvkVUBQa+PVYQw
         lENg==
X-Forwarded-Encrypted: i=1; AKwUvBxKAffv0AUeUfre8Jpl/BPRT1+p37YTlU8Yc8GIHfOb0QCKn2O1/sf1IfMG+Qx1luFPIa24UcSCy/4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIjdxAlYiMZN5oWk9Mv93s1gKdZEWejEBJ3VRzzZBb+fuhujRGX
	rSnO3cJsG7bRBtMCYZQjinoCS4kDbvGX+E12fu9yKljw+K/3CTVVxIACP4fhSSktSTzgS3cR/e9
	TcOsjUYnRd57AEtA3wuv53HxYeQNEDAo=
X-Gm-Gg: AYBFou1jVyc6JvKiR/yAni1CkuIgJ8Q4/lLpBDudoYuEvrrpnYeqhnozFd4Ez6kWFvQ
	G3uz7Jjhpf2smk6DC4M0CYsPnG+GHEAMpzG1JmEo6LosTsYVn7bkizpoPqtWP+PcAPb3mJ4YCVk
	S8SgrcjHGns7g89lqwfqlEV4HAWkWVt4JDmbm5EWPu1zTXgsgJQrUUIEijw+/Y5QX/jXwWz9WRB
	vMUvXZ1eR612O/Onv4e+Ko/2+8uJ6u30SeFkBDfMoDs37U7l41e4m5k1pmt0v+4SVwA0ovjhQmD
	r71qPufINnJKy/O1gKTH+DJe711EypfgN3Nr97KqVcocXGQRmNLM8BgneaOj9bNh8wqgwJxYglm
	2HURCNzBT8rPL
X-Received: by 2002:a05:690e:1448:b0:671:4cca:b8ce with SMTP id
 956f58d0204a3-679ca832860mr1864709d50.61.1792358226608; Sun, 18 Oct 2026
 14:17:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1785183549.git.allen.lkml@gmail.com> <cover.1786384168.git.allen.lkml@gmail.com>
 <aphFhDMOmtTtmoeY@lizhi-Precision-Tower-5810>
In-Reply-To: <aphFhDMOmtTtmoeY@lizhi-Precision-Tower-5810>
From: Allen <allen.lkml@gmail.com>
Date: Sun, 18 Oct 2026 14:16:53 -0700
X-Gm-Features: AclHuK-x4hxzrQZEDbbZc-GV1CxSgGshJEe0XYvDToXQDGG1IVSHwec79vUQUzg
Message-ID: <CAOMdWSJ_yUR2TVgqvn1O_6vzs9EsWqYrL--fF7D8ipQSGP204w@mail.gmail.com>
Subject: Re: [PATCH v3 00/34] dmaengine: migrate channel tasklets to WQ_BH
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

> >
> > This series moves DMAengine client completion bottom halves from private
> > tasklets to a common per-channel API backed by WQ_BH.
> >
> > The first patch introduces the dmaengine_*_bh() API with a tasklet backend
> > and converts virt-dma to it. It also updates every driver that directly
> > accesses the removed virt_dma_chan tasklet, keeping the patch buildable on
> > its own. This separates the driver-facing API from its implementation
> > without changing callback context.
> >
> > The second patch switches that backend to a dedicated WQ_BH | WQ_PERCPU
> > workqueue. WQ_BH keeps callbacks in softirq context, while the common API
> > centralizes initialization, scheduling, and synchronization. The
> > workqueue helpers remain internal to DMAengine, and dmaengine_kill_bh()
> > drains scheduled callbacks to preserve tasklet_kill() semantics.
> >
> > The remaining patches convert driver-owned channel completion tasklets.
> > Tasklets used for controller-level processing, recovery, or other
> > non-client-callback work are deliberately left alone because the
> > appropriate replacement may differ by driver.
> >
> > As agreed in the RFC discussion, selecting hardirq callback delivery is a
> > separate API change and is not part of this series.
> >
> > Earlier discussion:
> > https://lore.kernel.org/all/20260108080332.2341725-1-allen.lkml@gmail.com/
> >
> > v2:
> > https://lore.kernel.org/all/cover.1785183549.git.allen.lkml@gmail.com/
> >
> > Changes since v2:
> > - rename the new public helpers and callback type from dma_chan_* to
> >   dmaengine_* as requested by Vinod
> > - update all direct virt_dma_chan tasklet users in patch 1, fixing the
> >   intermediate build failures reported by Sashiko
> > - fold the resulting 30 empty teardown patches, reducing the series from
> >   64 to 34 patches without dropping any driver changes
> > - rebase from Linux 7.2-rc5 to d58772d8520c (latest Linus master)
> >
> > Review tags retained on unchanged standalone patches:
> > - 09/34 IOAT: Acked-by Dave Jiang
> > - 17/34 STE DMA40: Reviewed-by Linus Walleij
> > - 27/34 PLX DMA and 34/34 Switchtec: Reviewed-by Logan Gunthorpe
> >
> > Review tags received on v2 patches now folded into 01/34:
> > - v2 41/64 HSU: Reviewed-by Andy Shevchenko
> > - v2 60/64 BAM DMA: Acked-by Bartosz Golaszewski
> >
> > The HSU and BAM DMA changes remain in 01/34, but those patch-specific
> > trailers are not attached to the substantially broader 35-file patch.
> > Andy and Bartosz are copied here and on 01/34 for visibility.
> >
> > Testing:
> > - x86_64 olddefconfig, make -j$(nproc) W=1 drivers/dma/
> > - the same DMA build with patch 1 applied independently
> > - scripts/checkpatch.pl --strict on all 34 patches
> >
> > Allen Pais (34):
> >   dmaengine: add tasklet-backed channel BH helpers
> >   dmaengine: back channel BH helpers with WQ_BH
> >   dmaengine: apple-admac: use dmaengine BH callback
> >   dmaengine: at_xdmac: move irq bottom half to dmaengine BH
> >   dmaengine: ep93xx: hook callbacks via dmaengine BH
> >   dmaengine: fsldma: migrate tasklet to dmaengine BH
> >   dmaengine: fsl_raid: run completions via dmaengine BH
> >   dmaengine: imx-dma: flip per-chan tasklet to dmaengine BH
> >   dmaengine: ioat: convert cleanup tasklet to dmaengine BH
> >   dmaengine: mmp_pdma: replace per-chan tasklet with dmaengine BH
> >   dmaengine: mmp_tdma: hook completions to dmaengine BH
> >   dmaengine: mv_xor: convert irq tasklet to dmaengine BH
> >   dmaengine: mxs-dma: use dmaengine BH scheduling
> >   dmaengine: nbpfaxi: switch callbacks to dmaengine BH
> >   dmaengine: pch_dma: convert tasklet to dmaengine BH
> >   dmaengine: ppc4xx: replace irq tasklet with dmaengine BH
> >   dmaengine: ste_dma40: convert per-channel tasklet to dmaengine BH
> >   dmaengine: xgene-dma: wire descriptor cleanup to dmaengine BH
> >   dmaengine: xilinx-dma: use dmaengine BH instead of tasklets
> >   dmaengine: xilinx-dpdma: kill vchan BH on remove
> >   dmaengine: zynqmp-dma: switch completion tasklet to dmaengine BH
> >   dmaengine: tegra20-apb: use channel BH helpers
> >   dmaengine: timb_dma: route callbacks via channel BH
> >   dmaengine: txx9dmac: route callbacks via channel BH
> >   dmaengine: mv_xor_v2: use channel BH helpers
> >   dmaengine: mpc512x: route callbacks via channel BH
> >   dmaengine: plx_dma: use channel BH helpers
> >   dmaengine: sf-pdma: route error callbacks through channel BH
> >   dmaengine: pl330: route callbacks via channel BH
> >   dmaengine: altera-msgdma: use channel BH helpers
> >   dmaengine: dw: defer callbacks via channel BH
> >   dmaengine: hidma: defer callbacks via channel BH
> >   dmaengine: qcom-gpi: defer callbacks via vchan
> >   dmaengine: switchtec: use channel BH helpers
> >
> >  drivers/dma/altera-msgdma.c                   | 14 +--
> >  drivers/dma/apple-admac.c                     | 16 ++--
> >  drivers/dma/at_xdmac.c                        | 13 ++-
> >  drivers/dma/bcm2835-dma.c                     |  2 +-
> >  drivers/dma/dma-axi-dmac.c                    | 10 ++-
> >  drivers/dma/dma-jz4780.c                      |  2 +-
> >  drivers/dma/dmaengine.c                       | 89 ++++++++++++++++++-
> >  .../dma/dw-axi-dmac/dw-axi-dmac-platform.c    |  2 +-
> >  drivers/dma/dw-edma/dw-edma-core.c            |  2 +-
> >  drivers/dma/dw/core.c                         | 42 +++++++--
> >  drivers/dma/dw/regs.h                         |  1 +
> >  drivers/dma/ep93xx_dma.c                      | 12 ++-
> >  drivers/dma/fsl-edma-common.c                 |  2 +-
> >  drivers/dma/fsl-qdma.c                        |  2 +-
> >  drivers/dma/fsl_raid.c                        | 11 +--
> >  drivers/dma/fsl_raid.h                        |  1 -
> >  drivers/dma/fsldma.c                          | 10 +--
> >  drivers/dma/fsldma.h                          |  1 -
> >  drivers/dma/hisi_dma.c                        |  2 +-
> >  drivers/dma/hsu/hsu.c                         |  2 +-
> >  drivers/dma/idma64.c                          |  4 +-
> >  drivers/dma/img-mdc-dma.c                     |  2 +-
> >  drivers/dma/imx-dma.c                         | 26 +++---
> >  drivers/dma/imx-sdma.c                        |  4 +-
> >  drivers/dma/ioat/dma.c                        | 14 +--
> >  drivers/dma/ioat/dma.h                        |  3 +-
> >  drivers/dma/ioat/init.c                       |  2 +-
> >  drivers/dma/k3dma.c                           |  2 +-
> >  drivers/dma/loongson/loongson1-apb-dma.c      |  2 +-
> >  drivers/dma/mediatek/mtk-cqdma.c              |  2 +-
> >  drivers/dma/mediatek/mtk-hsdma.c              |  2 +-
> >  drivers/dma/mediatek/mtk-uart-apdma.c         |  4 +-
> >  drivers/dma/mmp_pdma.c                        | 13 ++-
> >  drivers/dma/mmp_tdma.c                        |  9 +-
> >  drivers/dma/mpc512x_dma.c                     | 74 +++++++++------
> >  drivers/dma/mv_xor.c                          | 12 +--
> >  drivers/dma/mv_xor.h                          |  2 -
> >  drivers/dma/mv_xor_v2.c                       | 20 ++---
> >  drivers/dma/mxs-dma.c                         | 11 ++-
> >  drivers/dma/nbpfaxi.c                         | 13 ++-
> >  drivers/dma/owl-dma.c                         |  2 +-
> >  drivers/dma/pch_dma.c                         | 14 +--
> >  drivers/dma/pl330.c                           | 18 ++--
> >  drivers/dma/plx_dma.c                         | 12 +--
> >  drivers/dma/ppc4xx/adma.c                     | 14 +--
> >  drivers/dma/ppc4xx/adma.h                     |  2 -
> >  drivers/dma/pxa_dma.c                         |  2 +-
> >  drivers/dma/qcom/bam_dma.c                    |  4 +-
> >  drivers/dma/qcom/gpi.c                        | 17 +++-
> >  drivers/dma/qcom/hidma.c                      | 18 +++-
> >  drivers/dma/qcom/qcom_adm.c                   |  4 +-
> >  drivers/dma/sa11x0-dma.c                      |  2 +-
> >  drivers/dma/sf-pdma/sf-pdma.c                 | 14 ++-
> >  drivers/dma/sprd-dma.c                        |  2 +-
> >  drivers/dma/st_fdma.c                         |  2 +-
> >  drivers/dma/ste_dma40.c                       | 13 ++-
> >  drivers/dma/sun6i-dma.c                       |  2 +-
> >  drivers/dma/switchtec_dma.c                   | 16 ++--
> >  drivers/dma/tegra186-gpc-dma.c                |  2 +-
> >  drivers/dma/tegra20-apb-dma.c                 | 18 ++--
> >  drivers/dma/tegra210-adma.c                   |  2 +-
> >  drivers/dma/ti/edma.c                         |  2 +-
> >  drivers/dma/ti/k3-udma.c                      | 12 +--
> >  drivers/dma/ti/omap-dma.c                     |  2 +-
> >  drivers/dma/timb_dma.c                        | 21 +++--
> >  drivers/dma/txx9dmac.c                        | 12 +--
> >  drivers/dma/txx9dmac.h                        |  1 -
> >  drivers/dma/virt-dma.c                        | 12 +--
> >  drivers/dma/virt-dma.h                        |  7 +-
> >  drivers/dma/xgene-dma.c                       | 19 ++--
> >  drivers/dma/xilinx/xilinx_dma.c               | 20 ++---
> >  drivers/dma/xilinx/xilinx_dpdma.c             |  1 +
> >  drivers/dma/xilinx/zynqmp_dma.c               | 19 ++--
>
> There are some dmaengine code out of drivers/dma tree. Do you plan to
> convert it also
>
> Frank

  Apologies for the delayed response. yes. There's a handful of
dmaengine client-completion
tasklets outside drivers/dma/ as well. Since this series is already
queued, I'd rather not grow
it further at this point. I'll send conversions for those as a
follow-up series once this lands.

Thanks,
Allen

>
> >  include/linux/dmaengine.h                     | 28 ++++++
> >  74 files changed, 482 insertions(+), 311 deletions(-)
> >
> > --
> > 2.43.0



-- 
       - Allen
