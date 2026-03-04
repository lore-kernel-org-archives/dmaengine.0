Received: from www522.your-server.de (www522.your-server.de [195.201.215.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA613A6EF1;
	Wed,  4 Mar 2026 14:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.201.215.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772635784; cv=none; b=oKHaZO+MKqJcsXnUjNNJQgIJaey4n6WVYQM9IsCAQdz/XaSa1aTTTE3RNS96Qcp6+BqTGlXPnw3ciTlfJK1tPkw7l1YUMuxJyDuN5susMKABXoWHUQhDuteg7a6cxsZ3kwLVHIlshmpXkctTAXJLw6HmiuZ2pIf23zevyfMMqGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772635784; c=relaxed/simple;
	bh=ZKpxmFIqJZBWtAAmdnVABEDXdw9Gpnt4yabeSXMiy68=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Subject:Cc:From:
	 References:In-Reply-To; b=mft+isfMJ57HsfDoHswbPYb7CDjVJfvwpsQCGw2Rnw5DVDpuenAVQgd6xU+Lmx/RWLWvVeKRRNA/0CwR073BFQPJsQly2HA70z496RxFfOojdXVXLTXQPk0d4Wa30DPkgyKACsam94vYWzRaAyXtbR9B6T3y4ntCHDnkB7uH3co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=folker-schwesinger.de; spf=pass smtp.mailfrom=folker-schwesinger.de; dkim=pass (2048-bit key) header.d=folker-schwesinger.de header.i=@folker-schwesinger.de header.b=ITjcx0+q; arc=none smtp.client-ip=195.201.215.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=folker-schwesinger.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=folker-schwesinger.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=folker-schwesinger.de header.i=@folker-schwesinger.de header.b="ITjcx0+q"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=folker-schwesinger.de; s=default2212; h=In-Reply-To:References:From:Cc:
	Subject:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=RV482GBP0cHHNRSOX9MuKnZkoH0dpIU2WIF8NIXXJig=; b=ITjcx0+qmFTwmWy/dm8QuBoNv4
	3A2vBfpS8l1qJhhdw7eRtfU8yyTT4rutqEFjSXEeQJWLqYX9YFviyE/73T9Pl5Bd+ttCXYUL/87dd
	ElcXlRd4Hj5Rerg5gAbsTRjvj+N328SG6pKsoZDSwmvUHW//4RdAmvq+PCEJmTQLIIdm9lEtMDsUO
	ABsK9d5IwXuuW3HqzYI7uqseB+zIjh19p5rka0pgdzIiv0jH0zoMQd8EMkrn1eE/eMAZBLWcXBFZQ
	/303aw/Z4gI0zR05S3qf0HtIDwQLztS2XmcQUmAueGqavD7M+wsU4YT8nZE6mwVjuZtBSNujX/yQn
	iYsc9cdg==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www522.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <dev@folker-schwesinger.de>)
	id 1vxnXY-000F46-11;
	Wed, 04 Mar 2026 15:49:32 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <dev@folker-schwesinger.de>)
	id 1vxnXX-0007p3-1S;
	Wed, 04 Mar 2026 15:49:31 +0100
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Mar 2026 14:49:27 +0000
Message-Id: <DGU2XPNWG24U.3V3TMZQLO1CNM@folker-schwesinger.de>
To: "Rahul Navale" <rahulnavale04@gmail.com>
Subject: Re: [RFC PATCH] dmaengine: xilinx_dma: Fix per-channel direction
 reporting via device_caps
Cc: "Rahul Navale" <rahul.navale@ifm.com>, <dmaengine@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <vkoul@kernel.org>, <Frank.Li@kernel.org>, <michal.simek@amd.com>,
 <suraj.gupta2@amd.com>, <thomas.gessler@brueckmann-gmbh.de>,
 <radhey.shyam.pandey@amd.com>, <tomi.valkeinen@ideasonboard.com>,
 <marex@nabladev.com>, <marex@denx.de>
From: "Folker Schwesinger" <dev@folker-schwesinger.de>
X-Mailer: aerc 0.21.0-119-g0a449d4a7ff3
References: <DGHGTCJRRZCW.9TGXQW44V6RR@folker-schwesinger.de>
 <20260304083544.4678-1-rahulnavale04@gmail.com>
In-Reply-To: <20260304083544.4678-1-rahulnavale04@gmail.com>
X-Virus-Scanned: Clear (ClamAV 1.4.3/27930/Wed Mar  4 08:24:08 2026)

On Wed Mar 4, 2026 at 9:35 AM CET, Rahul Navale wrote:
>
> <4>[    0.302360] dma_slave_caps:
> <4>[    0.302364]   src_addr_widths    =3D 0x00000000
> <4>[    0.302368]   dst_addr_widths    =3D 0x00000000
> <4>[    0.302371]   directions         =3D 0x00000000
> <4>[    0.302374]   min_burst          =3D 0x00000000
> <4>[    0.302377]   max_burst          =3D 0x00000000
> <4>[    0.302380]   max_sg_burst       =3D 0x00000000
> <4>[    0.302383]   cmd_pause          =3D 0x00
> <4>[    0.302386]   cmd_resume         =3D 0x00
> <4>[    0.302388]   cmd_terminate      =3D 0x00
> <4>[    0.302391]   residue_granularity=3D 0x00000000
> <4>[    0.302394]   descriptor_reuse   =3D 0x00
> <4>[    0.302398] xilinx_dma_device_caps: caps->directions =3D 0x00000001
> <4>[    0.302401] xilinx_dma_device_caps: caps->directions =3D 0x00000001
> <4>[    0.302404] dma_slave_caps:
> <4>[    0.302406]   src_addr_widths    =3D 0x00000000
> <4>[    0.302409]   dst_addr_widths    =3D 0x00000000
> <4>[    0.302412]   directions         =3D 0x00000001
> <4>[    0.302415]   min_burst          =3D 0x00000000
> <4>[    0.302418]   max_burst          =3D 0x00000000
> <4>[    0.302421]   max_sg_burst       =3D 0x00000000
> <4>[    0.302423]   cmd_pause          =3D 0x00
> <4>[    0.302426]   cmd_resume         =3D 0x00
> <4>[    0.302429]   cmd_terminate      =3D 0x01
> <4>[    0.302431]   residue_granularity=3D 0x00000001
> <4>[    0.302434]   descriptor_reuse   =3D 0x00

I think the issue stems from the difference in residue_granularity
(directions is set in xilinx_dma_device_caps and playback is still fixed
and cmd_terminate is only referenced in the code by some unrelated
driver).

From a quick trace through the code I found that in the Xilinx DMA
residue_granularity is set for AXIDMA independently from the SG setting
of the DMA core [1].
However, in xilinx_dma_tx_status() one of the conditions for residue
calculations is that SG mode is enabled [2].

Here's a quick patch that defers setting residue_granularity for the
device into channel probe until chan->has_sg is available. Could you
test if this fixes your issue (and of course re-activate all the caps->
assignments in dma_get_slave_caps(), keep the debug stuff for now)?

<-->8-->

diff --git i/drivers/dma/xilinx/xilinx_dma.c w/drivers/dma/xilinx/xilinx_dm=
a.c
index fabff602065f..adae1b37b533 100644
--- i/drivers/dma/xilinx/xilinx_dma.c
+++ w/drivers/dma/xilinx/xilinx_dma.c
@@ -3039,6 +3039,14 @@ static int xilinx_dma_chan_probe(struct xilinx_dma_d=
evice *xdev,
 			str_enabled_disabled(chan->has_sg));
 	}

+	/* Residue calculation is supported by only AXI DMA and CDMA */
+	if(chan->has_sg && (
+	   xdev->dma_config->dmatype =3D=3D XDMA_TYPE_AXIDMA ||
+	   xdev->dma_config->dmatype =3D=3D XDMA_TYPE_CDMA)) {
+		xdev->common.residue_granularity =3D
+					  DMA_RESIDUE_GRANULARITY_SEGMENT;
+	}
+
 	/* Initialize the tasklet */
 	tasklet_setup(&chan->tasklet, xilinx_dma_do_tasklet);

@@ -3277,15 +3285,9 @@ static int xilinx_dma_probe(struct platform_device *=
pdev)
 		xdev->common.device_prep_slave_sg =3D xilinx_dma_prep_slave_sg;
 		xdev->common.device_prep_dma_cyclic =3D
 					  xilinx_dma_prep_dma_cyclic;
-		/* Residue calculation is supported by only AXI DMA and CDMA */
-		xdev->common.residue_granularity =3D
-					  DMA_RESIDUE_GRANULARITY_SEGMENT;
 	} else if (xdev->dma_config->dmatype =3D=3D XDMA_TYPE_CDMA) {
 		dma_cap_set(DMA_MEMCPY, xdev->common.cap_mask);
 		xdev->common.device_prep_dma_memcpy =3D xilinx_cdma_prep_memcpy;
-		/* Residue calculation is supported by only AXI DMA and CDMA */
-		xdev->common.residue_granularity =3D
-					  DMA_RESIDUE_GRANULARITY_SEGMENT;
 	} else if (xdev->dma_config->dmatype =3D=3D XDMA_TYPE_AXIMCDMA) {
 		xdev->common.device_prep_slave_sg =3D xilinx_mcdma_prep_slave_sg;
 	} else {

<--8<-->

[1]: https://elixir.bootlin.com/linux/v6.19.3/source/drivers/dma/xilinx/xil=
inx_dma.c#L3284
[2]: https://elixir.bootlin.com/linux/v6.19.3/source/drivers/dma/xilinx/xil=
inx_dma.c#L1293
