Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9494AEBD4;
	Mon,  5 Oct 2026 15:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791214787; cv=none; b=ijE6B2hDJhZNxn/PTmHjqmbI4Di2MymarI5wF/CkOTAys6urFtdD4vhgMjkdvP5LtBUtDOwavu+9fhzqQSmhzRNocuTUPClQvI028HLxdgEN174GMur2FokzltXTNsxmguzWYZ7hPL99ewLExZ6V70MljNl0MgAyX3K/dyKvhoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791214787; c=relaxed/simple;
	bh=1tcdq40VCHEBsE92wXv5rVseBtMmp+4TmylwZhJr7Hg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SBIJguReALshUodLdGqg7NEH7ypGEHZ6doLB1hKhGVDF5HFdRGzDX6yabMNzRZpeAFSW7Pl4Fbd8kPEPY5WOHKo8WPUUpq3ghAiXsBsnQSKoHOQKji+TuGSycCksA8W8XY1DIdPwOZ/CV654y7Snl83dazLia75jeeZtMpVuspY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mswDsWWi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mswDsWWi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E67F1F000FF;
	Mon,  5 Oct 2026 15:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791214786;
	bh=MAB0w+SPt8/frgP+ogeZgftgq+o4maNl70fGx44ZOEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mswDsWWi8qhLa4BSMYOtdzReUOqAp0GaCrEe/LSamA9dlOLdvWRz4PnAW9VOgX5Zh
	 bEw5kBmfU35vXDQJRlPhWZDDhd2EoVzSEg5dYyKVk6lVdzrvF6Q6Ey/BDj8FmOUINH
	 m8PyvB6SA1Lg8/WWRN1Rmkwq0L1MnxkcLPcvC676R4RmTi50XxXJ5FH/M1ct8uM8aE
	 GW3q/qGCklK1cdGYi1p3yRoW1s/dR5uR/d9Nk0qTYQKnK/qQddwyq5OlTJzsnTEunE
	 zJ+eNgBAiyZIFEiixjfP51xgcOh11WRaSX8qA01M7k2D/GpG3N0xy19H+yYL9RMMCg
	 sAr0YvRRgPzsQ==
Date: Mon, 5 Oct 2026 17:39:42 +0200
From: Vinod Koul <vkoul@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org,
	phone-devel@vger.kernel.org, sashiko-bot@kernel.org,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v7 22/24] dmaengine: ste_dma40: Search all blocks for
 fixed logical channels
Message-ID: <asPEvh3O1ysaeeGs@parshuram>
References: <20260927-dma40-fixes-v7-0-89f595e8851d@kernel.org>
 <20260927-dma40-fixes-v7-22-89f595e8851d@kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260927-dma40-fixes-v7-22-89f595e8851d@kernel.org>

On 27-09-26, 11:03, Linus Walleij wrote:
> Fixed logical channel allocation scans physical channels in blocks of
> eight. When the requested physical channel does not belong to the first
> block, d40_allocate_channel() returns -EINVAL instead of checking later
> blocks.
> 
> Skip nonmatching blocks so controllers with more than eight physical
> channels can allocate fixed logical channels from the later blocks.

This failed to apply for me, I have skipped and applied the rest

> 
> Fixes: 5cd326fd27da ("dmaengine/ste_dma40: allow fixed physical channel")
> Reported-by: sashiko-bot@kernel.org
> Closes: https://lore.kernel.org/dmaengine/20260819225008.5F9651F000E9@smtp.kernel.org/
> Assisted-by: LLM
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  drivers/dma/ste_dma40.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index a5471a9157cd..fe9539138549 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
> @@ -2124,11 +2124,8 @@ static int d40_allocate_channel(struct d40_chan *d40c, bool *first_phy_user)
>  		if (d40c->dma_cfg.use_fixed_channel) {
>  			i = d40c->dma_cfg.phy_channel;
>  
> -			if ((i != phy_num) && (i != phy_num + 1)) {
> -				dev_err(chan2dev(d40c),
> -					"invalid fixed phy channel %d\n", i);
> -				return -EINVAL;
> -			}
> +			if (i != phy_num && i != phy_num + 1)
> +				continue;
>  
>  			if (d40_alloc_mask_set(&phys[i], is_src, event_line,
>  					       is_log, first_phy_user))
> 
> -- 
> 2.55.0

-- 
~Vinod
