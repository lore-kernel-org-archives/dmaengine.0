Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CFC3191D6;
	Tue, 11 Aug 2026 18:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786472928; cv=none; b=rAC9C48RoDQSEzWYyPZYWTIUfn63rRxJ+DMAyt1C75rR0MKmC42G4dx/YbgTHgboDDNMwXw424GNd8oTy4vxwx6DrulgNShQNnc1Zf0oMrgtXtcJsw8STtmB44Yt0DckiulkW5UYE7zN01axy9Cpj4pErjX30HN0m9BGWpou+1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786472928; c=relaxed/simple;
	bh=DcGeEs3Hc8FIyqubjnhTxYn+huNvKxHhROHkaOAgpZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lDepmSw9S6JpzDRTx2OCoxIFnNZk+ptzHDwRuvurRe3xR/pb2Jmk1dgW9D4Wl4ewPOMbN4+jA7CIN0GpyYsUur7fdkom8INViLp+RfdMawb7/qAiAKomCios4v5x6r2XRDkCXEatTnty4kM+y+YQ2m0sR0F4PAKKasgayqSVbGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UKvMqOph; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UKvMqOph"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D31D1F000E9;
	Tue, 11 Aug 2026 18:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786472927;
	bh=ya+4xAk3b9GRJKT32eLs8eaWcWBhkgMfQFx7wWWN/IU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UKvMqOphbiJUNaa5ts+Y9am/XwtJ6dwfPziuh/XKgmo+HzPYCO6jWaGM7LObGDotM
	 as05F1nNxlEzhRNPsrml2O9DW7aCx0l63XqmdOm86dXfK6uVCA8cf5O0G2s9hbCILE
	 WD98v0JjAc7gdEogrPGXUGnU1zeVTXU9LN8uJduEPAB4KYJbPSOlUfgIlFPQ8YFCEL
	 G3ZGYoxqaggsXxoxfe+sTQaia5MtFDPflsPuiS/E/McEm65q3Om1lzEMNG4Kjim2AE
	 joLmQVTjg4+3X7+q2zRG3ZMJVOCFOKxF44XX1NiWduV686ujwCybBEdpNZlfUDkSZP
	 RqTaZA9OwKmQQ==
Date: Tue, 11 Aug 2026 23:58:42 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dmaengine: apple-admac: Add M3 generation ADMACs
Message-ID: <antp2mWv6ZvK-4Qg@vaman>
References: <20260729-t603x-admac-v2-0-e4b2bb6ca45e@chaosmail.tech>
 <20260729-t603x-admac-v2-2-e4b2bb6ca45e@chaosmail.tech>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729-t603x-admac-v2-2-e4b2bb6ca45e@chaosmail.tech>

On 29-07-26, 13:46, Sasha Finkelstein wrote:
> The admacs present on t8122 and t603x SoCs need additional writes in
> order to operate correctly. The exact purpose of this register
> is unknown
> 
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
>  drivers/dma/apple-admac.c | 32 ++++++++++++++++++++++++++++++--
>  1 file changed, 30 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/dma/apple-admac.c b/drivers/dma/apple-admac.c
> index 14a5ee14a481..72ff677c8ce5 100644
> --- a/drivers/dma/apple-admac.c
> +++ b/drivers/dma/apple-admac.c
> @@ -39,10 +39,14 @@
>  
>  #define FLAG_DESC_NOTIFY	BIT(16)
>  
> +#define T8122_UNK_28_VAL	0x200000
> +
>  #define REG_TX_START		0x0000
>  #define REG_TX_STOP		0x0004
>  #define REG_RX_START		0x0008
>  #define REG_RX_STOP		0x000c
> +#define REG_UNK_28		0x0028
> +#define REG_UNK_2C		0x002c
>  #define REG_IMPRINT		0x0090
>  #define REG_TX_SRAM_SIZE	0x0094
>  #define REG_RX_SRAM_SIZE	0x0098
> @@ -127,6 +131,7 @@ struct admac_data {
>  	struct mutex cache_alloc_lock;
>  	struct admac_sram txcache, rxcache;
>  
> +	bool set_unk28;
>  	int irq;
>  	int irq_index;
>  	int nchannels;
> @@ -147,6 +152,10 @@ struct admac_tx {
>  	struct list_head node;
>  };
>  
> +struct admac_hw {
> +	bool set_unk28;
> +};
> +
>  static int admac_alloc_sram_carveout(struct admac_data *ad,
>  				     enum dma_transfer_direction dir,
>  				     u32 *out)
> @@ -747,6 +756,11 @@ static int admac_device_config(struct dma_chan *chan,
>  	u32 bus_width = readl_relaxed(ad->base + REG_BUS_WIDTH(adchan->no)) &
>  		~(BUS_WIDTH_WORD_SIZE | BUS_WIDTH_FRAME_SIZE);
>  
> +	if (ad->set_unk28) {
> +		writel_relaxed(T8122_UNK_28_VAL, ad->base + REG_UNK_28);
> +		writel_relaxed(T8122_UNK_28_VAL, ad->base + REG_UNK_2C);
> +	}
> +
>  	switch (is_tx ? config->dst_addr_width : config->src_addr_width) {
>  	case DMA_SLAVE_BUSWIDTH_1_BYTE:
>  		wordsize = 1;
> @@ -805,6 +819,7 @@ static int admac_probe(struct platform_device *pdev)
>  	struct device_node *np = pdev->dev.of_node;
>  	struct admac_data *ad;
>  	struct dma_device *dma;
> +	const struct admac_hw *hw;
>  	int nchannels;
>  	int err, irq, i;
>  
> @@ -813,6 +828,9 @@ static int admac_probe(struct platform_device *pdev)
>  		dev_err(&pdev->dev, "missing or invalid dma-channels property\n");
>  		return -EINVAL;
>  	}
> +	hw = of_device_get_match_data(&pdev->dev);
> +	if (!hw)
> +		return -EINVAL;
>  
>  	ad = devm_kzalloc(&pdev->dev, struct_size(ad, channels, nchannels), GFP_KERNEL);
>  	if (!ad)
> @@ -821,6 +839,7 @@ static int admac_probe(struct platform_device *pdev)
>  	platform_set_drvdata(pdev, ad);
>  	ad->dev = &pdev->dev;
>  	ad->nchannels = nchannels;
> +	ad->set_unk28 = hw->set_unk28;
>  	mutex_init(&ad->cache_alloc_lock);
>  
>  	/*
> @@ -935,9 +954,18 @@ static void admac_remove(struct platform_device *pdev)
>  	reset_control_rearm(ad->rstc);
>  }
>  
> +static const struct admac_hw admac_t8103_hw = {
> +	.set_unk28 = false,
> +};

This is dummy, why not this be default

> +
> +static const struct admac_hw admac_t8122_hw = {
> +	.set_unk28 = true,

and we set this

> +};
> +
>  static const struct of_device_id admac_of_match[] = {
> -	{ .compatible = "apple,t8103-admac", },
> -	{ .compatible = "apple,admac", },
> +	{ .compatible = "apple,t8122-admac", .data = &admac_t8122_hw },
> +	{ .compatible = "apple,t8103-admac", .data = &admac_t8103_hw },
> +	{ .compatible = "apple,admac", .data = &admac_t8103_hw },

so only change would be adding this for admac_t8122_hw. If driver data
is not defined (older and whereever not used), we dont set these..

>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, admac_of_match);
> 
> -- 
> 2.55.0

-- 
~Vinod
