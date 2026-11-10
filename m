Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794333522;
	b=GbLVO9BltV7mCq50h0U4VBHneYyYPokvgZbcOs/v7XGa831ORdGvPrO6zPh21gm5hRJx
	 2kF+ylQealkI7gvsQpKOofs+C6tcRNkrP3SRADsy2tt3/XNFhN2pI6EArGsEy4QOPoIc1
	 CZ5I57tu0sCYDb9cWTnA7FocrjkNE4hpdCGo8kiJXuYQqTFO8FZzBL6MYpsnT7tAtJgtj
	 Pw+fMy/zsSlTuTU8fcwGGP9hDcuBBwFXjVEuNcllug8UYXELS8MkSh8fyBH6nhjV/oafw
	 3G/wvuEBJem1ykCglFhAtM4odQJhG9w9CKM7ZTVkVW+Qlxu2V8SCftW366fZgrbaKWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794333522;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=OoZpsZ3RAC4wZtWOM/mA+ByKJRpvwubjorCJS1L/xuw=;
	b=dGzlvaVA/bgrzbCMGkSm85RIZaWp9czgmiJbv/17ksjLLuSNqV0LLjzXd9Ie6rqWjqKj
	 Gtwp0rFv34u6P5LbXS8qyDKPuoEDmPTux62dpHqs3Tq8FdEb5gmIREEFHpL8mPxHTAmC7
	 H0H23M/aPniuBcQWVoRA7dnABSdDeylpLCxqe+tRO1Z3cOUdxSR2GalScMPvsnBHprT3T
	 wy1x1WJlQ9zNZ2OI99o38EXiCAhfDneRFQSK2/CJvOxF4ilQq6zVEcvGcYzgBeguP4LtL
	 T3vxyW9PGYHu8YVgh8NjjKn7tdF0g4DhWKLu2N58Bp966p8qEQ2XK2Gg0+cBlW+kXUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="AlN/ykR5";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD39E606A320
	for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 17:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AlN/ykR5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57BBA1F0089F;
	Tue, 10 Nov 2026 17:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794333521;
	bh=OoZpsZ3RAC4wZtWOM/mA+ByKJRpvwubjorCJS1L/xuw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AlN/ykR5i63zUNv8vxMANI7tDEXeSxxfWIbWdsaajHuPNU2mvMJdQ8L04KSn0YZJX
	 9Z+u5ZhIcizDGvA6k+BT+JI56LAFH6zvKclvXa9R3mPeQkkKSdYnE9xDdlcENXMEew
	 Qi0HgrNLxFIYh3CorBWUZneSeFm38wpppRXotSzTuvihNZH16Csr+xlL3FIxR4MPeh
	 x0r9eYruhUwInVIxKQH8ZiBZvbJpG/SYtbT9i3OnGnvN/f3NLa02HVxj8fyC0hispb
	 dM3CZwWiUBELa5Y8ViFIz5P7zHFaqR6NSPq2Tqh0mscVAePVWhRjaSmPRYydMkUyIV
	 ZOaxYYZ+wZeNw==
Message-ID: <sashiko-outbox-207537@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/6] dmaengine: plx_dma: fix descriptor ring leak in
 alloc_chan_resources()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Logan Gunthorpe" <logang@deltatee.com>, dmaengine@vger.kernel.org
Cc: vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261110173927.624629-3-logang@deltatee.com>
References: <20261110173927.624629-1-logang@deltatee.com>
 <20261110173927.624629-3-logang@deltatee.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 17:58:40 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Low] dmaengine: plx_dma: missing Fixes trailer for
  alloc_chan_resources() leak fix
- [Low] dmaengine: plx_dma: duplicate cleanup in plx_dma_free_desc()
--

commit db658b0054bd97de26e837fb78fec5b170b3aad1
Author: Logan Gunthorpe <logang@deltatee.com>

> dmaengine: plx_dma: fix descriptor ring leak in alloc_chan_resources()
>
> If the device is removed between plx_dma_alloc_desc() and the pdev
> check, the error path frees hw_ring but leaks desc_ring and every
> descriptor in it.
>
> Add plx_dma_free_desc() and use it here and in
> plx_dma_free_chan_resources().
>
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Link: https://lore.kernel.org/dmaengine/20260717223217.B6FBF1F000E9@smtp.=
kernel.org
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Logan Gunthorpe <logang@deltatee.com>

[Severity: Low]
Should this include a Fixes tag for the commit that introduced the leak in
plx_dma_alloc_chan_resources():

  Fixes: c2dbcaa8c672 ("dmaengine: plx-dma: Implement hardware initializati=
on and cleanup")

> diff --git a/drivers/dma/plx_dma.c b/drivers/dma/plx_dma.c
> index 0a7ad2473cb13..bfccbb0c70e84 100644
> --- a/drivers/dma/plx_dma.c
> +++ b/drivers/dma/plx_dma.c
> @@ -404,6 +404,16 @@ static int plx_dma_alloc_desc(struct plx_dma_dev *pl=
xdev)
>  	return -ENOMEM;
>  }
> =20
> +static void plx_dma_free_desc(struct plx_dma_dev *plxdev)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < PLX_DMA_RING_COUNT; i++)
> +		kfree(plxdev->desc_ring[i]);
> +
> +	kfree(plxdev->desc_ring);
> +}

[Severity: Low]
This isn't a bug, but plx_dma_free_desc() duplicates the free_and_exit
cleanup at the end of plx_dma_alloc_desc() right above it:

drivers/dma/plx_dma.c:plx_dma_alloc_desc() {
    ...
free_and_exit:
	for (i =3D 0; i < PLX_DMA_RING_COUNT; i++)
		kfree(plxdev->desc_ring[i]);
	kfree(plxdev->desc_ring);
	return -ENOMEM;
}

Moving plx_dma_free_desc() above plx_dma_alloc_desc() would allow
free_and_exit to call plx_dma_free_desc(plxdev) as well.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110173927.6246=
29-1-logang@deltatee.com?part=3D2
