Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425938;
	b=AtL0sMV3YS6SHUlQlv7G3ORA3aqnBFttJt6C1e5Lw1lZ+y+lp48EprnicKEk5Lw6kwxt
	 +k6r0LKYTSQlQikUckHTithqKFQ4j/Rh9BkRx+/hVMRykKJIu06GAS2ZpWGPqCijL5E1N
	 bX1VqM+PZz3Yc5xaVB7cPJ9D9b/EdlnlPtJWh0Y4+9opILBUQftz6K7P4MMp7vp8X4TIW
	 wwhudROfcururwR+avCaX6bhPYzN4KjZMjx8j7WPpTsfq/WpmhvU3dYUEW50QcD3yOsxE
	 GnCFNA9NsB/TN42fWsq1N0GvE6PkiW9MLgBe3V+a0XW1ouXTwYYsGnICtMCiTNsCU2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425938;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+PD+ibUavZOtp/up37teS6anAje29Zi8y4HWzlnCJEM=;
	b=TGnFpR40/4g7zly8owsc+BUXuoZh6R0H53Cu4RRGlmK6eZ4wfmYi0tMxXCrau+K9UxdI
	 yas1Pbrp+1SoIP8roIbJYF/QL1WrUc86SBw8tIwEyv1Q2M1hpWArmNcpQYWAiblnNmpnp
	 0Pc3sR9LU2uCFAVd1KCE9uudApzFSOuH/Lxj7WMcFLM8g79zRa+fTD2mPvNZndnPuw11O
	 ig+wLolzZwfK6CWXdKI9GWnHrzjmANYxIdVP6nl8B66qqbsEB8RYjIT0WrYlwTyKz/eZa
	 Ju1CetujzQhuudvCbLMrY1rSBpVVdwzSWiRGq/XVocrVGE7NZDS2HS4wLi4lH74U+4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KOAHLY8v;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD02606A31E
	for <dmaengine@vger.kernel.org>; Mon, 23 Nov 2026 09:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KOAHLY8v
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D71CF1F000CF;
	Mon, 23 Nov 2026 09:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795425938;
	bh=+PD+ibUavZOtp/up37teS6anAje29Zi8y4HWzlnCJEM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KOAHLY8vZlL1ah2hnIS4df34UzPKVakn0/VMHOOiYLVWbW1wDgNFj7EC+oztCPaKR
	 v1p4IZeW2U92pmcY9EUukJbb+IRIYnUtUA/SZvAS6zW86Nmq9MeAc5Ralj2WW5EYRD
	 LIwq8jTFwfr/vwz6s0gjl4lAiPddBP2DI7DE2sjUyXmHX0dEZEIp6+pgXOQyt+5Jnm
	 ZiCnnDGQ06rFFDulds5MX6nio43NXFijBGInMQxp8nZ3FzHm7NafDkpVTyVJDQZfOj
	 5VpZcRC/1C9Vb4iiZdc9XUs667ZEGq4WISSNr4hyojSFYtkA6/lDLANG9ABG0qxLF2
	 eHEBf86Redq0Q==
Message-ID: <sashiko-outbox-228966@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] dmaengine: stm32-dma3: validate LLI pool
 allocations and fix cleanup
Reply-To: sashiko-reviews@lists.linux.dev
To: "Amelie Delaunay" <amelie.delaunay@foss.st.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261123-dma3-fixes-v2-3-0a5b013f79d2@foss.st.com>
References: <20261123-dma3-fixes-v2-0-0a5b013f79d2@foss.st.com>
 <20261123-dma3-fixes-v2-3-0a5b013f79d2@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 09:25:36 +0000
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
- [Medium] dmaengine: stm32-dma3: LIFO free in
  stm32_dma3_chan_desc_alloc() wedges pool
--

commit b1f0a54731f5c1a2b29b4e522069ca1bedc6096e
Author: Amelie Delaunay <amelie.delaunay@foss.st.com>

dmaengine: stm32-dma3: validate LLI pool allocations and fix cleanup

This commit checks that all LLI descriptors in a list share the same 64 KiB
CLBAR address window and frees every allocated descriptor on error.

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
>  	kfree(swdesc);
> =20
>  	return NULL;

[Severity: Medium]
Can freeing descriptors in reverse order wedge chan->lli_pool after a 64 KiB
window mismatch?

dma_pool keeps free blocks on a LIFO stack (pool->next_block in
mm/dmapool.c), and each backing pool page holds 4 KiB (128 descriptors)
unless a larger pool page is allocated.  When descriptors 0..k-1 come from
one 64 KiB window and descriptor k comes from a newly allocated pool page in
another window, freeing from last_alloc_idx (k) down to 0 pushes descriptor
k and then descriptors k-1..0 back onto the head of pool->next_block in the
exact order they were popped.  Every subsequent call to
stm32_dma3_chan_desc_alloc() with count > k will pop the same k + 1
descriptors and fail at the window check until smaller allocations drain the
k blocks at the head.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-dma3-fixes=
-v2-0-0a5b013f79d2@foss.st.com?part=3D3
