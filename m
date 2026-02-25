Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E756393DE7
	for <dmaengine@vger.kernel.org>; Wed, 25 Feb 2026 11:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772018146; cv=none; b=YH4MMrybTAOvdkrErrJg+tmDoNGuR/CqnVxSQg1sym7ZSZ+DsPQiI4LO6KuE9VtAxMIgMN0067O8Stb6BvLa2zKI0c2PzBUyxBNNCPjd1T3AeaW4KGBXdgjEiuy2gm8Th5Xmdvf40fG1h+JZIVVA2Whg5LWtcZgKmV5ophU6+kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772018146; c=relaxed/simple;
	bh=WyaJ2ZcmvK7t1w0wGS7im4tw2w5ym6S4jxoy0wCtosA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iM7P42UK7TRi0GhkOAt3GawPB/lh5Mkki0TzHSHa4G0oC9MPJ/kATz00i6GWxqr2hYvsQi7kMlP+0+zWNVdSMCqjm7FfLdu11CVG+KgHnp/TWJZvFdj9HY+L91pbonziE937EUa2/15ZJ8MyE8rvlntisW9bSWAY6gQ4ujpopEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CqvfD2+e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CqvfD2+e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7A17C116D0;
	Wed, 25 Feb 2026 11:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772018146;
	bh=WyaJ2ZcmvK7t1w0wGS7im4tw2w5ym6S4jxoy0wCtosA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CqvfD2+eAvwFruNrQ2MB4d6ny/3wxaCo3nfIUdeR+pVovqjiJKQyGra0JWVPOaCa/
	 CEQs4UK7qYfxphNi7afsDYQe7TKbAkLfEG3U/ftwediXWn8mGZP95EOltLr6jOD7jr
	 Gqf+5XzsOMzTBFyOKlRFSxT5mEJMht15LZGflE+YRGrB2mL9VhF1zyxfP47B8UHIlF
	 y23bgS/7KVA05uxiqEB42XSs60m0UWeKWArJ+rQMbhNf1xYa8KkIrRxffW3OP+iIbP
	 WhNTte7TJq7hkCXlqOf7nFF9fei6kP98DXNgJwMD0zsN0WNAdB8/j4dydzQtQPeOGB
	 bEeu8OROV/DjQ==
Date: Wed, 25 Feb 2026 16:45:43 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Logan Gunthorpe <logang@deltatee.com>
Cc: dmaengine@vger.kernel.org, Kelvin Cao <kelvin.cao@microchip.com>,
	George Ge <George.Ge@microchip.com>,
	Christoph Hellwig <hch@infradead.org>,
	Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v13 2/3] dmaengine: switchtec-dma: Implement hardware
 initialization and cleanup
Message-ID: <aZ7Z31c0SCvTmAp0@vaman>
References: <20260121051219.2409-1-logang@deltatee.com>
 <20260121051219.2409-3-logang@deltatee.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121051219.2409-3-logang@deltatee.com>

On 20-01-26, 22:12, Logan Gunthorpe wrote:
> From: Kelvin Cao <kelvin.cao@microchip.com>

> +	size = SWITCHTEC_DMA_CQ_SIZE * sizeof(*swdma_chan->hw_cq);
> +	swdma_chan->hw_cq = dma_alloc_coherent(swdma_dev->dma_dev.dev, size,
> +					       &swdma_chan->dma_addr_cq,
> +					       GFP_NOWAIT);
> +	if (!swdma_chan->hw_cq) {
> +		rc = -ENOMEM;
> +		goto free_and_exit;
> +	}
> +
> +	/* reset host phase tag */
> +	swdma_chan->phase_tag = 0;
> +
> +	for (i = 0; i < SWITCHTEC_DMA_RING_SIZE; i++) {
> +		desc = kzalloc(sizeof(*desc), GFP_NOWAIT);

Here as well, make sure you keep the flag as is here.

> +static int switchtec_dma_chan_init(struct switchtec_dma_dev *swdma_dev,
> +				   struct pci_dev *pdev, int i)
> +{
> +	struct dma_device *dma = &swdma_dev->dma_dev;
> +	struct switchtec_dma_chan *swdma_chan;
> +	u32 valid_en_se, thresh;
> +	int se_buf_len, irq, rc;
> +	struct dma_chan *chan;
> +
> +	swdma_chan = kzalloc(sizeof(*swdma_chan), GFP_KERNEL);

Here as well


-- 
~Vinod
