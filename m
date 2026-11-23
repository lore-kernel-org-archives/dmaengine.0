Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446088;
	b=kcxtFnPsf1jlMQBfRQmLrUfopvae/F8KxT2hG+PXOcrlHKJwkMFfiPBy/c06/5xpxM/B
	 Wlw91bv0syCORPWg4PApbPZtABAObG0OEO/DVhytbeyd5RPkkzXq/iypRKdTib6YC2LAE
	 ICfOlVNtslWkkV0I9Y6/ee/I4AxIcV7qSyp3AIQGGbVSNMbv7jcZ+h9gToBkcNLxn791k
	 dO087e4aXurP4wg2MvPRyv955ze9gIR3xuzU4XP5/Ox0tM5W5C8zS0hbL5w36uyAUlhid
	 vZYShDnxV2z8hTFH0qzcSZUkvBMx2Bewd53A8MdjAOWHB2EnRK0jZwq6H7NVNExU+Ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446088;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=MFvh4rmcHXnQYvO6gky6hEG3hWqjJt1AXbdJI2AQvKo=;
	b=jK3RQm3gzllnKy1cTYNu7Q9WWTVcv4riXfWaJO3xZvLnwqSUYHwdU6dcv9elfFUx93pL
	 QWVTy4RMQ8NqUVYJ78AhdpAtmlTbeezYKs0VUv0sOQdmell+vzgAOE6IHxWzSvEn3ngF6
	 ZZkJ1tAoHj6a4TwZDUfnN1NAJX2qvVOmPpzhrobNee5sn+DbmU7u8hhr5qfw5UaK8+NYf
	 CUI3N0+vvbX/8vSlaz1JnpcYW1zN2Gnpaw5t73aOL68xjDuM5Tj8qbCnbX0ufdhl+AJML
	 ZohLSw55O7rpo2I3pMqxxR2qC+mBWmMuwfFMDwairNH68llP0Nw3WZMUIHTxSpgUIgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WIH67fKx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B105A606A31A;
	Mon, 23 Nov 2026 15:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WIH67fKx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF5021F000D0;
	Mon, 23 Nov 2026 15:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795446088;
	bh=MFvh4rmcHXnQYvO6gky6hEG3hWqjJt1AXbdJI2AQvKo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WIH67fKxTYrPwi04KnKPUA+hibrbIE6+wvCZrk4Y6Xac0NeVwC3BJbBdbNIfexRnX
	 2LQfv6eeMd5H+hPMUGKYoVYmbSIGZobNCuHueK3UH3ogZpuqltRxi3ZOYzhQvMX4M/
	 iKUL2BdmJuOhW4v5hVH2CmHJ20hz8/XfATYRUtcQZzFGVy2rGHLf7owV2PPj8wxaEg
	 pNccSTIlnOcf0P22YjXvK4bL92wGVdvw5aCl860pntanDxqVslqJE8O97FlkWN5Lvr
	 NxbYPXyZBXQ4B0Ec6Dm98Ib92ryZCEqrc5bjAfxQnk31Vps2i0EVYx5ZBTyFHmrbBF
	 zQBnWKKYHhUIw==
Message-ID: <sashiko-outbox-229462@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 09/28] dmaengine: bcm2835: move CB final extra info
 generation into function
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrea della Porta" <andrea.porta@suse.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261123145728.29082-10-andrea.porta@suse.com>
References: <20261123145728.29082-1-andrea.porta@suse.com>
 <20261123145728.29082-10-andrea.porta@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 15:01:27 +0000
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
- [High] dmaengine: bcm2835: missing flags in
  bcm2835_dma_prep_dma_cyclic()
--

commit 1144e8bbc4cd12d7e2def4ac967c328f6f4a0c4f
Author: Andrea della Porta <andrea.porta@suse.com>

dmaengine: bcm2835: move CB final extra info generation into function

This commit moves the generation of the final control block extra info
bits into a new helper function, bcm2835_dma_prepare_cb_extra().

> diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
> index adf3508246ec3..77b3e2f58ac50 100644
> --- a/drivers/dma/bcm2835-dma.c
> +++ b/drivers/dma/bcm2835-dma.c
> @@ -253,6 +253,26 @@ static u32 bcm2835_dma_prepare_cb_info(struct bcm283=
5_chan *c,
>  	return result;
>  }
> =20
> +static u32 bcm2835_dma_prepare_cb_extra(struct bcm2835_chan *c,
> +					enum dma_transfer_direction direction,
> +					bool cyclic, bool final,
> +					unsigned long flags)
> +{
> +	u32 result =3D 0;
> +
> +	if (cyclic) {
> +		if (flags & DMA_PREP_INTERRUPT)
> +			result |=3D BCM2835_DMA_INT_EN;
> +	} else {
> +		if (!final)
> +			return 0;
> +
> +		result |=3D BCM2835_DMA_INT_EN;
> +	}
> +
> +	return result;
> +}

[ ... ]

> @@ -747,7 +768,7 @@ static struct dma_async_tx_descriptor *bcm2835_dma_pr=
ep_dma_cyclic(
>  	dma_addr_t src, dst;
>  	u32 info =3D bcm2835_dma_prepare_cb_info(c, direction,
>  					       buf_addr =3D=3D od->zero_page);
> -	u32 extra =3D 0;
> +	u32 extra =3D bcm2835_dma_prepare_cb_extra(c, direction, true, true, 0);
>  	size_t max_len =3D bcm2835_dma_max_frame_length(c);
>  	size_t frames;
> =20
> @@ -763,9 +784,7 @@ static struct dma_async_tx_descriptor *bcm2835_dma_pr=
ep_dma_cyclic(
>  		return NULL;
>  	}
> =20
> -	if (flags & DMA_PREP_INTERRUPT)
> -		extra |=3D BCM2835_DMA_INT_EN;
> -	else
> +	if (!(flags & DMA_PREP_INTERRUPT))
>  		period_len =3D buf_len;

[Severity: High]
Should bcm2835_dma_prep_dma_cyclic() pass flags instead of 0 to
bcm2835_dma_prepare_cb_extra()?  Passing 0 prevents BCM2835_DMA_INT_EN
from ever being set on cyclic transfers when DMA_PREP_INTERRUPT is
requested, so cyclic period interrupts never fire.

This regression is resolved later in the series by commit "dmaengine:
bcm2835: drop info parameters", which moves the
bcm2835_dma_prepare_cb_extra() call into bcm2835_dma_create_cb_chain()
and passes flags, but cyclic DMA remains broken at this commit during
git bisection.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123145728.2908=
2-1-andrea.porta@suse.com?part=3D9
