Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795166694;
	b=YRnZd26n6soMj25yGBmu1ssv/TlczMVPZiwwWkRvPHfB34dmRuuI3/DzhEj5qgAmBGkB
	 EUbSU1oSZhsjuDJu9QbZIDkqEOZKgADtwdtkxxTxKlgxCju7unGBFDkyNXThNQbYwOykc
	 u9MW+WF22cRWKS9Bz7SaEHP/0L/0Ob78ysmY460Xl1hb4EnhkP6yAcmwhEUa9YJscZZNE
	 dCXuEY+6/kBZl6xdrKOVeZtaHfK4Tt2K+ae3vAm9qHCkU+rSodlWWw7Mey8QwHdtM/ZN5
	 f51+OIMFwrqBUSU5ysOh7uGEn09BqQA9DyfoxH/39B2BjEs3JVyVh6vgWRM3OrGV1yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795166694;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=uVMudn76MvzJPJY09TAng/utlP3Ra1ab/CyPECyTv5Y=;
	b=uUZlbuehZt3Dw8CXijOrnPsbklFqpdQes8y0CAFACPvLdt7PDXUCfqdjwAT7aiMVLCOZ
	 YoLPxEI6Ndt05SLH5lbnfdRaNWitVbABXNhRC2DX3q6AycY/ntF7Zw6usf5UYjFeLX4/W
	 fRo+YTq1GTJCiGiv4ONGCnSkOThn+t97E+3vQEoIV3J6zW1MoPRmb7rWxMed+WC5/2G8h
	 oA/zAC9hHrfI2B+fv+37LhRBZTE9fh+UtvnCv4ruC3fDg1anxnIUs7zKFlXq9zCBDGlsQ
	 US1avLgTeCRm5drAvD8EPv7NqjXbg4e3dyKt7AEdj4Bl9UMmR9JvbT6uRaXilL6XdxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Vao+C5/i";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D815606A320
	for <dmaengine@vger.kernel.org>; Fri, 20 Nov 2026 09:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vao+C5/i
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D9E01F000CF;
	Fri, 20 Nov 2026 09:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795166693;
	bh=uVMudn76MvzJPJY09TAng/utlP3Ra1ab/CyPECyTv5Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Vao+C5/iMz5DEoOcW70O/mKmXbS7H0dnnBJdVS/jEjmdVuHc2QkT9heyyz6pf7oB9
	 wiXKKtOK+bwN4adt1t+Do5rOzg5YxD0r01swEYzdSKGDdeJwhl9j9ENp70HxGh50iz
	 eoLxvAQnHfg2Cgk9aurBKpVi4mvXU2P+3WFUGDN2mXiRFAs8pj2+nYxKl2/EtlbOHa
	 ZOQ/2MW+CQwzPTGKcF/05Qgq3vgMl+sPqoawStBX4Lf4Wpu+VS+7pRXAsjjxwnSBBz
	 mPjlb7uYAzK0OckQ7ZcVnq8GEAlMz0fNCqXU9WR6PYxIH/TCPyhlPHLGfJQhMPFHTU
	 BPWdusLUvcmmQ==
Message-ID: <sashiko-outbox-224842@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] dmaengine: stm32-dma3: validate LLI pool
 allocations and fix cleanup
Reply-To: sashiko-reviews@lists.linux.dev
To: "Amelie Delaunay" <amelie.delaunay@foss.st.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261120-dma3-fixes-v1-3-f29c1f437399@foss.st.com>
References: <20261120-dma3-fixes-v1-0-f29c1f437399@foss.st.com>
 <20261120-dma3-fixes-v1-3-f29c1f437399@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 09:24:53 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] dmaengine: stm32-dma3: LIFO free order in
  stm32_dma3_chan_desc_alloc() wedges pool
--

commit 59d36dd2cf6d4c14f9f6d6159b6dc9354dffd965
Author: Amelie Delaunay <amelie.delaunay@foss.st.com>

dmaengine: stm32-dma3: validate LLI pool allocations and fix cleanup

This commit validates that all hardware descriptors in a linked list share
the same 64 KiB address window and frees all allocated descriptors on failu=
re.

> diff --git a/drivers/dma/stm32/stm32-dma3.c b/drivers/dma/stm32/stm32-dma=
3.c
> index a056f73fbe025..7c509a69f5e54 100644
> --- a/drivers/dma/stm32/stm32-dma3.c
> +++ b/drivers/dma/stm32/stm32-dma3.c
> @@ -397,7 +397,8 @@ static void stm32_dma3_chan_dump_hwdesc(struct stm32_=
dma3_chan *chan,
>  static struct stm32_dma3_swdesc *stm32_dma3_chan_desc_alloc(struct stm32=
_dma3_chan *chan, u32 count)
>  {
>  	struct stm32_dma3_swdesc *swdesc;
> -	int i;
> +	int i, last_alloc_idx =3D -1;
> +	dma_addr_t base_addr =3D 0;
> =20
>  	/*
>  	 * If the memory to be allocated for the number of hwdesc (6 u32 member=
s but 32-bytes
> @@ -419,18 +420,38 @@ static struct stm32_dma3_swdesc *stm32_dma3_chan_de=
sc_alloc(struct stm32_dma3_ch
>  							&swdesc->lli[i].hwdesc_addr);
>  		if (!swdesc->lli[i].hwdesc)
>  			goto err_pool_free;
> +
> +		last_alloc_idx =3D i;
> +
> +		if (i =3D=3D 0) {
> +			base_addr =3D swdesc->lli[0].hwdesc_addr & CLBAR_LBA;
> +			continue;
> +		}
> +
> +		/*
> +		 * dma_pool boundary=3DSZ_64K only guarantees that one allocation does=
 not span a 64KB
> +		 * boundary. It does not guarantee that all allocations of a given lin=
ked-list land
> +		 * in the same 64KB address window required by CLBAR/CLLR addressing.
> +		 */
> +		if (base_addr !=3D (swdesc->lli[i].hwdesc_addr & CLBAR_LBA)) {
> +			dev_err(vchan_chan_dev(&chan->vchan), "LLI crosses a 64KB window (%pa=
d)\n",
> +				&swdesc->lli[i].hwdesc_addr);
> +			goto err_pool_free;
> +		}
>  	}
> -	swdesc->ccr =3D 0;
> =20
>  	/* Set LL allocated port */
> -	swdesc->ccr &=3D ~CCR_LAP;
> +	swdesc->ccr =3D FIELD_PREP(CCR_LAP, 0);
> =20
>  	return swdesc;
> =20
>  err_pool_free:
>  	dev_err(vchan_chan_dev(&chan->vchan), "Failed to alloc descriptors\n");
> -	while (--i >=3D 0)
> -		dma_pool_free(chan->lli_pool, swdesc->lli[i].hwdesc, swdesc->lli[i].hw=
desc_addr);
> +	while (last_alloc_idx >=3D 0) {
> +		dma_pool_free(chan->lli_pool, swdesc->lli[last_alloc_idx].hwdesc,
> +			      swdesc->lli[last_alloc_idx].hwdesc_addr);
> +		last_alloc_idx--;
> +	}

[Severity: Medium]
Does freeing swdesc->lli[] in reverse order restore chan->lli_pool to the
exact same state after a 64KB window mismatch?

dma_pool keeps a LIFO free list (pool->next_block in mm/dmapool.c), where
dma_pool_alloc() pops from the head and dma_pool_free() pushes back onto the
head.  When a page in chan->lli_pool runs out and a newly allocated page la=
nds
in a different 64KB address window, freeing from last_alloc_idx down to 0
pushes the descriptors from the old window back onto the head ahead of the =
new
page in the exact order they were popped.  Any subsequent call to
stm32_dma3_chan_desc_alloc() with count > i will pop the same sequence of
descriptors and fail at the same boundary check forever.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120-dma3-fixes=
-v1-0-f29c1f437399@foss.st.com?part=3D3
