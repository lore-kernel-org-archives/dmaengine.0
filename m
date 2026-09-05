Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26411DA60D
	for <dmaengine@vger.kernel.org>; Sat,  5 Sep 2026 06:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788590436; cv=none; b=bC15rVg4KlC6RtNq3HXFgZqGhMIGM8nX4QJ1D/ID1r0mro6DKrOGS7izx+eBM9qPuy2GId2wqyVcyoud53k4BQVRpTqRHi8Mv3UT42K2453N7Mg2bpQsaCeu0jzClExVPd2PaSDZbjZ81VG+DJEvXofYyQEGIrqBA5ArXblFT8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788590436; c=relaxed/simple;
	bh=FdnxAWzv/cTucAlEA9XZyzMn0iuCD70cenmI7Zk7NuI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JwAQgjKCogWd8lFpVtk9G93SbbDA81wvxJPOHLOqMSARfUnvzavX1e53oOv40hebjE04fZLF4fnf60gtL+Pl34vyXNaYQxx441W4FgaFGf7wjoDQv3ZZgDVHZ6Ne8dtMMUcEqdEYtMLBu/kZbQ2ups4ndnCbatnsiwzAwQonAkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cZ647zTV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cZ647zTV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58C061F00A3D;
	Sat,  5 Sep 2026 06:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788590434;
	bh=wkETPh2MCT2NZ7SSMun5L9tdG/1F5ch4oKXnyOBnzDk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cZ647zTVJTIvBWJcz6TkS8i3cr/qSl04XJwBUfGLnaxKHOZFJ/qyuDDMQCBlIsRJk
	 Y0T7XYEeAjyJphYIGYmrERJgiQG6QBiJ4WuJ58K2kiCVzxmp14y9Ce8+zIXNA3tetK
	 K+FX0SeqfoQuU1hWXNptydbUd4YtjtWdHXHxkx/kReT7jA6dHt/o+Tc+8s8Jg24OcD
	 yJiHRJOblIY8znEf3LOsufTjC51kWmj8uk4YT9mlcd4JGZ1uK+bV0FIlOTdi5CWmHa
	 k4Kv8x9uJziX32lj2XsSI/4sXKVGkgBRz9+4MRGpAFdP/NKeoVeY3WfGC6rzoD21UE
	 ejYjQ4uRT5xLw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: loongson2-apb-cmc: fix descriptor leak in
 prep_slave_sg()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Diego Fernando Mancera Gomez" <diegomancera.dev@gmail.com>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260905062833.272484-1-diegomancera.dev@gmail.com>
References: <20260905062833.272484-1-diegomancera.dev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 05 Sep 2026 06:40:33 +0000
Message-Id: <20260905064034.58C061F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

Pre-existing issues:
- [High] DMA engine prep functions return ERR_PTR instead of NULL on failur=
e, violating API contract.
- [High] Potential division by zero in `loongson2_cmc_dma_prep_dma_cyclic`.
- [High] Unaligned transfer lengths rounded up using `DIV_ROUND_UP`, causin=
g memory corruption.
- [High] NULL pointer dereference when calculating residue for pending desc=
riptors.
- [High] Multi-period cyclic transfers hang because CNDTR is not reloaded.
- [High] Interrupt handler returns IRQ_HANDLED unconditionally on shared IR=
Q line.
--

commit e41b57bccdb990f1d1319016c8e4a1cb0f109aaf
Author: Diego Fernando Mancera Gomez <diegomancera.dev@gmail.com>

    dmaengine: loongson2-apb-cmc: fix descriptor leak in prep_slave_sg()
   =20
    loongson2_cmc_dma_prep_slave_sg() allocates the descriptor with
    kzalloc_flex() before iterating over the scatterlist. If
    loongson2_cmc_dma_set_xfer_param() fails inside the loop, the function
    returns ERR_PTR(ret) without freeing the descriptor. At this point the
    descriptor has not been handed to vchan_tx_prep() yet, so nothing else
    will ever free it, leaking it on every failed ->device_prep_slave_sg()
    call (e.g. an unsupported transfer direction or bus width).
   =20
    The neighbouring error path for the num_items check already frees the
    descriptor before returning; do the same on the set_xfer_param() failure
    path.

    Link: https://lore.kernel.org/all/20260818094957.7D2221F000E9@smtp.kern=
el.org/

> diff --git a/drivers/dma/loongson/loongson2-apb-cmc-dma.c b/drivers/dma/l=
oongson/loongson2-apb-cmc-dma.c
> index 1c9a542edc859..60eb4d9616103 100644
> --- a/drivers/dma/loongson/loongson2-apb-cmc-dma.c
> +++ b/drivers/dma/loongson/loongson2-apb-cmc-dma.c
> @@ -404,8 +404,10 @@ loongson2_cmc_dma_prep_slave_sg(struct dma_chan *cha=
n, struct scatterlist *sgl,
> =20
>  	for_each_sg(sgl, sg, sg_len, i) {
>  		ret =3D loongson2_cmc_dma_set_xfer_param(lchan, direction, &buswidth, =
sg_dma_len(sg));
> -		if (ret)
> +		if (ret) {
> +			kfree(desc);
>  			return ERR_PTR(ret);

[Severity: High]
This isn't a bug introduced by this patch, but does returning ERR_PTR()
instead of NULL violate the DMA engine API contract?

If memory allocation fails or invalid parameters are provided,
device_prep_slave_sg() returns ERR_PTR(...). Client drivers expect NULL on
failure and use if (!desc) to check for errors. Since ERR_PTR evaluates to
true, could clients pass the invalid pointer to dmaengine_submit() and caus=
e a
kernel panic?

> +		}
> =20
>  		num_items =3D DIV_ROUND_UP(sg_dma_len(sg), buswidth);

[Severity: High]
This is a pre-existing issue, but can this unaligned transfer length calcul=
ation
corrupt memory?

The driver calculates hardware transfer count using
DIV_ROUND_UP(length, buswidth). If a client requests a transfer length not
aligned to the bus width (e.g., 3 bytes on a 4-byte bus), DIV_ROUND_UP roun=
ds
the count up to 1 item. The hardware will then transfer 4 bytes. Could this
cause the DMA controller to write past the end of the client's allocated
buffer?

>  		if (num_items >=3D LOONSON2_CMCDMA_MAX_DATA_ITEMS) {
>  			dev_err(chan2dev(lchan), "Number of items not supported\n");
>  			kfree(desc);
>  			return ERR_PTR(-EINVAL);
>  		}

While reviewing this code, I noticed a few other pre-existing issues in this
file:

In loongson2_cmc_dma_prep_dma_cyclic():

> 	if (unlikely(buf_len % period_len))

[Severity: High]
This is a pre-existing issue, but can this modulo operation cause a
divide-by-zero crash?

The function accepts period_len from external callers and performs
buf_len % period_len without validating that period_len is non-zero. Could
this be reached via ALSA or other cyclic DMA clients if misconfigured to pa=
ss
a 0 period length?

[ ... ]

> 	ret =3D loongson2_cmc_dma_set_xfer_param(lchan, direction, &buswidth, pe=
riod_len);
> 	if (ret)
> 		return ERR_PTR(ret);

[Severity: High]
This is a pre-existing issue, but does returning ERR_PTR() here also violate
the API contract?

Similar to loongson2_cmc_dma_prep_slave_sg(), this returns ERR_PTR instead =
of
NULL on failure, which could cause a client panic.

[ ... ]

> 	num_items =3D DIV_ROUND_UP(period_len, buswidth);

[Severity: High]
This is a pre-existing issue, but can this also cause an out-of-bounds DMA
transfer for cyclic transfers?

Like with loongson2_cmc_dma_prep_slave_sg(), rounding up unaligned transfer
lengths could write past the end of the destination buffer.


In loongson2_cmc_dma_desc_residue():

> 	if (lchan->desc->cyclic && next_sg =3D=3D 0)

[Severity: High]
This is a pre-existing issue, but can this cause a NULL pointer dereference?

If a client driver queries the transfer status using dmaengine_tx_status()
after submitting a descriptor but before it is issued (or while the channel=
 is
idle), lchan->desc will be NULL. The code unconditionally dereferences
lchan->desc->cyclic.


In loongson2_cmc_dma_configure_next_sg():

> 	/* Start transition */
> 	ccr |=3D LOONGSON2_CMCDMA_CCR_EN;
> 	loongson2_cmc_dma_write(lddev, LOONGSON2_CMCDMA_CCR, id, ccr);

[Severity: High]
This is a pre-existing issue, but will multi-period cyclic transfers hang
because CNDTR is not reloaded?

For multi-period cyclic transfers, hardware circular mode is not enabled. At
the end of each period, the driver reconfigures the next scatterlist elemen=
t,
but fails to write the transfer count to the CNDTR register. Since CNDTR is=
 0
from the completed period, will re-enabling the channel result in an immedi=
ate
stall?


In loongson2_cmc_dma_chan_irq():

> 	return IRQ_HANDLED;
> }

[Severity: High]
This is a pre-existing issue, but does unconditionally claiming the interru=
pt
break shared IRQ semantics?

The interrupt is requested with IRQF_SHARED. If another device on the same
line triggers an interrupt, status will be 0. The handler skips processing =
but
still returns IRQ_HANDLED instead of IRQ_NONE. Could this defeat the kernel=
's
spurious interrupt detection layer and prevent it from disabling a faulty I=
RQ
line?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260905062833.2724=
84-1-diegomancera.dev@gmail.com?part=3D1
