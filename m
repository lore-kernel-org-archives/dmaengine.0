Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CC6345745
	for <dmaengine@vger.kernel.org>; Mon,  8 Jun 2026 11:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780919042; cv=none; b=hUwoLibALk+M9NZ9LjeQtfwrKEFrJHTC0MRpV6AgN4s0OqBsBG6m7H9eakiackqCIinWGO72I3akX9AzX8g7GKPFMSNUAQ8asimBmeF261gHlhZzqG4KxQh/tDxHkrla7ebSZwoJJt1ruHAOHJ9dKmZ9Ghl21BmFT5pxutKtt8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780919042; c=relaxed/simple;
	bh=QMY4/vo0AUV8SgaJJrnB92NlkPT1MS//JAV0eSXliLA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BHnm3b50L1W8csYrd9UV/9r47ZFhvq0BEuiR8NeHnxZcpQO6uOl6eg4Eb/LTIsQxW8Qj8JCVV8gWtOXM/bUBemoPhc2/Q6mRz4CWtfq4wXqgarfmOmHATf+BFZvqst4VNaXWHEOpE8GdtjXt6BPlhE2hnVj68sYfq/GX5f0wJ+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gM85wLRe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gM85wLRe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AFC81F00893;
	Mon,  8 Jun 2026 11:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780919041;
	bh=B5pS86L0lRjXK1zQdn48R2hPJSbKEGqiYK/g+8ksOi8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gM85wLRerWSFxqCvAlxZQaqMavoZ6W23wYh3wRjRvP0XxV93QE2YF54GQ0s/e05lr
	 UbmMO2vkslqrecFy9LnlPr6qnlCpUDA2D4O0uoweTrKBrt270r0N+79U0+xM2TOo/F
	 BHbo+Aiv0N/t7ow1SIJXPGQTH2phxgwVgX87xGGO3RkDlW+RIcp/RNXeSRlSDdDuYN
	 pbOklOnvJtyOcc2WAcT5ihmZ6jhaZHijMjrJ4fRfoPkscptR8AOL1+K4xMR/Tr2AXi
	 sF+Gh6IEL19Xark4ko3U0/fFgGCluDGZTeaqE+MBSntRf9rc4yHanl3g8+xDIp1cKG
	 zogP+a9aHUsJw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] dmaengine: dw-edma: Enable HDMA 64R/W Channels
Reply-To: sashiko-reviews@lists.linux.dev
To: "Devendra K Verma" <devendra.verma@amd.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260608112011.3289409-1-devendra.verma@amd.com>
References: <20260608112011.3289409-1-devendra.verma@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 11:44:00 +0000
Message-Id: <20260608114401.5AFC81F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] The DesignWare PCIe controller driver (`pcie-designware.c`) was no=
t updated to reflect the new 64-channel limits for HDMA, breaking configura=
tions that declare more than 8 channels.

Pre-existing issues:
- [High] The function `dw_hdma_v0_core_ch_status()` calls `GET_CH_32` with =
swapped `dir` and `ch` parameters, resulting in incorrect channel status re=
ads.
--

commit 49f2923c673f70626e15a62547f82ae4f0d06439
Author: Devendra K Verma <devendra.verma@amd.com>

dmaengine: dw-edma: Enable HDMA 64R/W Channels

As per 'Designware Cores PCI Express Controller Databook',
Section 7.1 - Overview, HDMA supports 64 Read and 64 Write
channels. Current controller driver supports up to 8 read and
write channels only. In order to utilize all the channels the
controller driver need to have the channel related structs
and variables as per the number of channels supported by IP.

[ ... ]

> diff --git a/drivers/dma/dw-edma/dw-hdma-v0-core.c b/drivers/dma/dw-edma/=
dw-hdma-v0-core.c
> index 632abb8b481cf..84b0076f78bf0 100644
> --- a/drivers/dma/dw-edma/dw-hdma-v0-core.c
> +++ b/drivers/dma/dw-edma/dw-hdma-v0-core.c

[Severity: High]
This is a pre-existing issue, but there appears to be a parameter ordering
bug in dw_hdma_v0_core_ch_status() in this file that breaks channel status
reads:

drivers/dma/dw-edma/dw-hdma-v0-core.c:dw_hdma_v0_core_ch_status() {
	...
	tmp =3D FIELD_GET(HDMA_V0_CH_STATUS_MASK,
			GET_CH_32(dw, chan->id, chan->dir, ch_stat));
	...
}

The GET_CH_32 macro expects arguments in the order (dw, dir, ch, name).
Because it is called with chan->id as the direction and chan->dir as the
channel ID, does this cause the driver to read the DMA status of the wrong
channel, potentially leading to missing completions or data corruption?

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

[Severity: High]
Does this patch miss updating the bounds checking in the PCIe controller
driver to use the new HDMA channel limits?

In drivers/pci/controller/dwc/pcie-designware.c:dw_pcie_edma_find_channels(=
),
there is a hardcoded sanity check against EDMA_MAX_WR_CH:

	if (!pci->edma.ll_wr_cnt || pci->edma.ll_wr_cnt > EDMA_MAX_WR_CH ||
	    !pci->edma.ll_rd_cnt || pci->edma.ll_rd_cnt > EDMA_MAX_RD_CH)
		return -EINVAL;

And in dw_pcie_edma_irq_vector(), it limits IRQ allocation to the old maxim=
um:

	if (nr >=3D EDMA_MAX_WR_CH + EDMA_MAX_RD_CH)
		return -EINVAL;

Will this cause any native HDMA PCIe controller declaring more than 8
channels to fail instantiation or IRQ allocation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608112011.3289=
409-1-devendra.verma@amd.com?part=3D1
