Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577B933F5BC
	for <dmaengine@vger.kernel.org>; Fri, 14 Aug 2026 05:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786684486; cv=none; b=lB0EZrKwmWzCpEU6MJRjT48q7EFXyL5EsPlr78+6pvWfDw60VSCWqBAJPOQdJcaP6bHkBDCz17AqQrHQ6Oy6qKSKhI+tcZjwDBZjS5O1cIU/6n8BKX6K0R69whSVnRXxMZ3h90RVXdXsQk5gLZpXHW+t/QXEtAF4J+nWhi0bBZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786684486; c=relaxed/simple;
	bh=fNsbuRoHpYZDSn5iUk8R4JWd2L2mI3N0KmfehScZfLA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NmUAeesnzlBl1/IKhsjqH3sOpCtHwk77+9rVzwVizqlEt3G00EPQWrlqyFXgub0QTOs1L8o+3MqfQ1k4BNvJl57GHF2rd+qGcuwv2MdjQ2jTJBaFFmKX6jt2RTG+ALkThaJnQHtGB8or5V1Ze1RjP8naPsrNycDM0YKN3nJSElY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KCShpNDX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KCShpNDX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A594A1F000E9;
	Fri, 14 Aug 2026 05:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786684484;
	bh=uUpRtmDwsMUW5vKcigP73V4qej8nw1KlVzCsvD12DUs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KCShpNDXE7oei/BxuKQAd7LMSik8PRnuHVBOCGzcZM2IZtEe273fSzmQIkPoblJcC
	 lvmAKB/MrXD1qWQvh0XAB+JmNEXaF3d4gCMsxLF58bXnGNsb85dcRv//OMvfW7VRz8
	 1LzxohBqchrjTLoJXQoGV0C7iyk/TKygqM1YYmjFDVljXpA8ZJ9QJJi24iSBuVy9NF
	 MiFWVa3IeOt46TRTwrhXJBmu71CIbCWiqOTxY+LJtXLGw1M7Y3r0QgK40Iz0qFoDTI
	 OfGAE36n84bCfPD/sWZ0uxI8ntQB/6QISc5qPZLWbj8DIJlrXlwgjReVphl5qatQNR
	 I9QOOfYuIgLww==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V2 2/8] dmaengine: zynqmp_dma: Free sw_desc_pool on
 desc_pool_v alloc failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Golla Nagendra" <nagendra.golla@amd.com>
Cc: dmaengine@vger.kernel.org, Frank.Li@kernel.org, vkoul@kernel.org
In-Reply-To: <20260814045616.1661199-3-nagendra.golla@amd.com>
References: <20260814045616.1661199-1-nagendra.golla@amd.com>
 <20260814045616.1661199-3-nagendra.golla@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 05:14:44 +0000
Message-Id: <20260814051444.A594A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The IRQ handler accesses hardware registers without checking if th=
e device is active, violating Runtime PM guidelines.
--

--- Patch [2]: [PATCH V2 2/8] dmaengine: zynqmp_dma: Free sw_desc_pool on d=
esc_pool_v alloc failure ---
commit fa41ac69883ca2ff4e5d238f73142e53f1ec3b68
Author: Golla Nagendra <nagendra.golla@amd.com>
Subject: dmaengine: zynqmp_dma: Free sw_desc_pool on desc_pool_v alloc fail=
ure

This commit fixes a memory leak in zynqmp_dma_alloc_chan_resources() by
freeing the allocated sw_desc_pool if the subsequent desc_pool_v coherent
allocation fails. It adds a dedicated error label to ensure the software
descriptor pool is cleaned up before falling through to the runtime PM
rollback path.

> diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_=
dma.c
> index 9f1e69700dd02..b7c5612806948 100644
> --- a/drivers/dma/xilinx/zynqmp_dma.c
> +++ b/drivers/dma/xilinx/zynqmp_dma.c

[ ... ]

> static irqreturn_t zynqmp_dma_irq_handler(int irq, void *data)
> {
> 	struct zynqmp_dma_chan *chan =3D (struct zynqmp_dma_chan *)data;
> 	u32 isr, imr, status;
> 	irqreturn_t ret =3D IRQ_NONE;
>=20
> 	isr =3D readl(chan->regs + ZYNQMP_DMA_ISR);
> 	imr =3D readl(chan->regs + ZYNQMP_DMA_IMR);

[Severity: High]
This isn't a bug introduced by this patch, but does this interrupt handler
need to check the device's power state before accessing hardware registers?

During runtime suspend, the APB clock is disabled. If a spurious or
unexpected interrupt fires while the device is in this suspended state,
the handler executes and immediately reads ZYNQMP_DMA_ISR without calling
pm_runtime_get_if_active() to verify or resume the power state.

Could reading these registers while the clock is disabled cause a
synchronous external abort and lead to a system crash?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260814045616.1661=
199-1-nagendra.golla@amd.com?part=3D2
