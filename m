Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE3637B000
	for <dmaengine@vger.kernel.org>; Tue, 23 Jun 2026 11:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782214921; cv=none; b=hs5agnPGz5APqroc9tscdSLOXIibSCV5VXv26x9SKJ71Zec4hxxSczG2Q9th8x7q/M5sPwlXvnmCqL4XsvwOlKMNmR/vQUlYcoWbfSofjMQRkLt450T5tCZDkbfIqoKYKfkvyhdp0RVUzN5gkgU73Q3FRZ3sFDATaTUDfZcBSSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782214921; c=relaxed/simple;
	bh=GyP14kNMHb3stHatNESeJaTunpSAqcBe2SpiWtd8Q/o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=T/2Kr3mf2L5tK6kYsPuMYY7SbVuD81oNZ6LO54aDuNE89L34xCkhc79CYlPS4YEkQA3rsexDvnWYvuQQbmNX0auBR1y9EY4J0Iwf8pfLtkdL/Okz7Xc6sgSim7vl4xhhMD7m47I0+gB8icGjYjFQp1tAuClnvSFaHzkQbSD55Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Iw5inzWi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Iw5inzWi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2003E1F000E9;
	Tue, 23 Jun 2026 11:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782214919;
	bh=fkznw+yNplv4vpiwjCXeqnxB+6sr1R4BHtSNMdAwMao=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Iw5inzWiaPWcUvdvjmoj+OTp4Ht86CxxdIeilD4lWf9TxqdZviB5vnwfYjKzMvNot
	 3f0SsHc3iHWUh1uME2i7mTaRUVied9NKMcNodAlVNPhiCra5GQ6Kwy8LiuYyFlAF3W
	 hBQCDuD3u22zbtez4IGSJUdiJYADUpwOWR8TG+eBz0Nee2ptxTTfNNINWqxC/A9S+p
	 2pEl5glX0IRxMp0QTHohKxJDlQXuXYTZhi361CybgIX14c0keuAqUFppSQth8Pd585
	 R+21JU3rwqBu4ukDoqXTDMT0ckYeO7xdglsdc/HfAvRLZ3nWjFjmrL2eZabuxK7rrb
	 2GW6vF9iZ0DuA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v4] dmaengine: dw-edma: Enable HDMA 64R/W
 Channels
Reply-To: sashiko-reviews@lists.linux.dev
To: "Devendra K Verma" <devendra.verma@amd.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260623112647.3379581-1-devendra.verma@amd.com>
References: <20260623112647.3379581-1-devendra.verma@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jun 2026 11:41:57 +0000
Message-Id: <20260623114159.2003E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] The 64-channel HDMA feature is unreachable due to hardcoded lega=
cy limits in the driver bindings.

Pre-existing issues:
- [High] Potential NULL pointer dereference if a shared IRQ fires before `d=
w_irq->dw` is initialized.
--

commit ae4f94060e0e6e5d4419cd4f95926541afa41dd0
Author: Devendra K Verma <devendra.verma@amd.com>

dmaengine: dw-edma: Enable HDMA 64R/W Channels

This patch expands the designware eDMA driver to support up to 64 read and
64 write channels for the HDMA controller, aligning with the hardware
databook. It introduces new macros for the HDMA channel counts, expands
the layout of the channel-related structures, updates channel masks to 64-b=
it,
and updates the probe sequence to configure the core based on the controller
type.

> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-=
edma-core.c
> index c2feb3adc79fa..adf1b3939f96c 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c
> @@ -925,9 +925,9 @@ static int dw_edma_channel_setup(struct dw_edma *dw, =
u32 wr_alloc, u32 rd_alloc)
>  		irq =3D &dw->irq[pos];
> =20
>  		if (chan->dir =3D=3D EDMA_DIR_WRITE)
> -			irq->wr_mask |=3D BIT(chan->id);
> +			irq->wr_mask |=3D BIT_ULL(chan->id);
>  		else
> -			irq->rd_mask |=3D BIT(chan->id);
> +			irq->rd_mask |=3D BIT_ULL(chan->id);
> =20
>  		irq->dw =3D dw;

[Severity: High]
This is a pre-existing issue, but could a shared interrupt fire before
irq->dw is initialized here?

In dw_edma_probe(), dw_edma_irq_request() is called before
dw_edma_channel_setup(). The IRQs are requested with IRQF_SHARED:

dw_edma_probe() {
    ...
    err =3D dw_edma_irq_request(dw, &wr_alloc, &rd_alloc);
    ...
    err =3D dw_edma_channel_setup(dw, wr_alloc, rd_alloc);
}

If the shared IRQ fires immediately after registration, the interrupt handl=
er
might dereference a NULL dw_irq->dw:

dw_edma_interrupt_write()
   dw_edma_core_handle_int()
       return dw_irq->dw->core->handle_int(dw_irq, dir, done, abort);

Should irq->dw be initialized prior to calling request_irq()?

[ ... ]

> diff --git a/include/linux/dma/edma.h b/include/linux/dma/edma.h
> index 1fafd5b0e3153..da7a5cc93ad43 100644
> --- a/include/linux/dma/edma.h
> +++ b/include/linux/dma/edma.h
> @@ -14,6 +14,8 @@
> =20
>  #define EDMA_MAX_WR_CH                                  8
>  #define EDMA_MAX_RD_CH                                  8
> +#define HDMA_MAX_WR_CH                                  64
> +#define HDMA_MAX_RD_CH                                  64

[Severity: Medium]
Will these expanded 64-channel limits actually be reachable with the current
driver bindings?

Looking at drivers/pci/controller/dwc/pcie-designware.c,
dw_pcie_edma_find_channels() still explicitly enforces the legacy 8-channel
limit and returns -EINVAL if the configuration exceeds it:

    if (!pci->edma.ll_wr_cnt || pci->edma.ll_wr_cnt > EDMA_MAX_WR_CH ||
        !pci->edma.ll_rd_cnt || pci->edma.ll_rd_cnt > EDMA_MAX_RD_CH)
        return -EINVAL;

Similarly, in drivers/dma/dw-edma/dw-edma-pcie.c, the Xilinx MDB HDMA data
statically declares 8 channels and dw_edma_pcie_get_xilinx_dma_data() caps
the write channels:

    pdata->wr_ch_cnt =3D min(pdata->wr_ch_cnt,
                   FIELD_GET(DW_PCIE_XILINX_MDB_VSEC_DMA_WR_CH, val));

Do the hardcoded legacy limits in the driver bindings prevent the new
64-channel feature from being fully utilized?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260623112647.3379=
581-1-devendra.verma@amd.com?part=3D1
