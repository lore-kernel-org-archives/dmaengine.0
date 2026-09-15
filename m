Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B506423645D;
	Tue, 15 Sep 2026 17:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789493518; cv=none; b=WUjMVWOLZc37PomBS7nfXdKTGi1qT16+48imZ01usmq1cnkkaGbHDKf/YpiWL22ovtrEZ6eNxLfoADqaSn8wlX5vPd6cUQ6irY+I2EBmt7BY8UMXewpi2O5PXrYG2NVw+DN860WK6eiuadOWc6cunuAWLdG69MjjsAIMMdNEdSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789493518; c=relaxed/simple;
	bh=COL+eeLxqw5NTAJ2YIlB4B9vdfhxDmT/atOwnDq2bI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iJDlZFASfORkBXuBA9yk/Tv5KT1HnUvNyIrt7Q1WV0w+9b4rsZWQKEQIZhFfk5LOaw2Z+5ESXv0pbQMwg8+/azKKUl02YuCceuhlqUB8a+6G3SzSJWmsYyZ7g6SqbA/4j86u/tZZ2NApm0i3NPF5tStPlwUFIGVgoaXmynEXVfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lIQhufCg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lIQhufCg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E4E11F000FF;
	Tue, 15 Sep 2026 17:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789493517;
	bh=iFo2sfXq+Vmx91S6RId8JHf6RX8qogWnl0ZNBXPfgk8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lIQhufCgxDUfqD04F3wR0FvLT5Dp/oZd1f4za8hLykQV+EpTbG9q/nno/1zrqal+F
	 FJTxs9W0xcKDyG2kLT8kFseb4ZtoaKXC22h9tjUzrgPb89vjcSGuuYMvaIP+pAxXEz
	 CQ0iwwtoYWihNv1mt3QFlBkHYkLuHBw9EwFbxdnsINLBer1bPCJfkMf/BcGlZHNG2i
	 c9YyMbgesw/+3bFgD4ZaQpGx5WQya2ExLC3a2OqbfrSbJZ4Aea1fXU0Oha54nuZ8vq
	 jfLNfRtkO0McneH1VoqLa0oM76uFPfHImbXRy48gdahZqB3RfjfKOGAUY/KDbBG/IS
	 wlOFcFaasmHjA==
Date: Tue, 15 Sep 2026 23:01:52 +0530
From: Vinod Koul <vkoul@kernel.org>
To: =?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Frank Li <Frank.Li@kernel.org>, imx@lists.linux.dev,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 0/2] dmaengine: fsl-edma: Scatter/gather improvements
Message-ID: <aqmBCMb8JbYsjpTX@parshuram>
References: <20260911-fsl-edma-dyn-sg-v10-0-700eb72def57@bootlin.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260911-fsl-edma-dyn-sg-v10-0-700eb72def57@bootlin.com>

On 11-09-26, 15:11, Benoît Monin wrote:
> This series adds support for scatter/gather DMA transfers via dma_vec
> and dynamic descriptor chaining to the Freescale eDMA controller driver.
> 
> The first patch implements the .device_prep_peripheral_dma_vec() callback,
> enabling the DMA engine to accept an array of dma_vec structures. This
> callback supports both regular and cyclic transfer modes.
> 
> The second patch introduces dynamic scatter/gather chaining, which allows
> multiple DMA descriptors to be linked together without stopping the channel.
> This optimization eliminates idle periods when back-to-back transfers are
> submitted, improving throughput and reducing latency. The implementation
> carefully preserves cyclic transfer semantics and respects hardware
> constraints on platforms with split register layouts.
> 
> I tested it on the i.MX93. The dynamic scatter/gather chaining should
> work with other eDMA controller with split register layout.

This fails to build for me, needs bitfield header

drivers/dma/fsl-edma-common.c: In function ‘fsl_edma_tx_chan_handler’:
drivers/dma/fsl-edma-common.c:59:33: error: implicit declaration of function ‘FIELD_GET’ [-Wimplicit-function-declaration]
   59 |                 u8 link_sg_id = FIELD_GET(EDMA_TCD_CSR_LINKCH, csr);
      |                                 ^~~~~~~~~
drivers/dma/fsl-edma-common.c: In function ‘fsl_edma_prep_peripheral_dma_vec’:
drivers/dma/fsl-edma-common.c:784:55: error: implicit declaration of function ‘FIELD_MAX’ [-Wimplicit-function-declaration]
  784 |                 if (!nbytes || vecs[i].len / nbytes > FIELD_MAX(EDMA_TCD_ITER_MASK))
      |                                                       ^~~~~~~~~
drivers/dma/fsl-edma-common.c: In function ‘fsl_edma_link_sg’:
drivers/dma/fsl-edma-common.c:1015:24: error: implicit declaration of function ‘FIELD_PREP’ [-Wimplicit-function-declaration]
 1015 |                 csr |= FIELD_PREP(EDMA_TCD_CSR_LINKCH, fsl_chan->link_sg_id);
      |                        ^~~~~~~~~~

-- 
~Vinod
