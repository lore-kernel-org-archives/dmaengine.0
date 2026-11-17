Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794895334;
	b=Tb/YZZZ9aSR6jAldpBZu5mkuq0VApcTr5XRGD75rCrpzof9iynwYZYVbtpAtSUL07kak
	 KXlDScvFIzHtiQ98IJPlXoyZH0dC7YdkXN14FLExvSTdn450i9gepWavhSoopbDu0dyNc
	 tOt5/tuHUiscn6yztdN1+tyYitLo3cjZ/JpF2qpcB7qGhPFVUBbYhAq5lNmPqRIPsHIRG
	 XD7ZriuTNNtVw9H2+Zu1croGu4BgBIhI9jeAlLVBscH9ZzydP3lqKSQRcxq1Xk0wAv/HQ
	 II7JaJESGSYC1eU2aR8JpxLHRoi6RohLrWPGKdYYxD2VMf7EJXT2ujdPKbBFaoPN/3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794895334;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=lvQmTnPidiEnzeOrZUvLLHxYBSJgQymGBmIbkQCkFQM=;
	b=QXGUN52Bcibm0sVpwp4qN9x68Ievz3LUB03ZhQ7PbWXCntEAkktdvFHWZtpwFX98Bvvo
	 qZp2dTqT6bNrrJPrpA3lZyEh8OGtFS23puC+36sX0rh+kftqqMPtIlL1byo9j8aKzm49z
	 Bspp2C6mvNRF30uedJ2UgoACoMo839gx7s0aykbH5hhlH3r8EjzyIGytIVHJw8fJW4vp6
	 8VmPO2m+e05itDnRRvGBP02RBrYI/esv9OMgbZPVX/14AOEi5S98scvCkRvX6yeumqag0
	 95rdvzoQN0yxnkFAVnU5iQ7vuOjaTUKlADO0aoH64M0yiLNss56edZm0tX/4VeTNa8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CKA+An72;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC82606A31C
	for <dmaengine@vger.kernel.org>; Tue, 17 Nov 2026 06:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CKA+An72
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51F3B1F000C4;
	Tue, 17 Nov 2026 06:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794895333;
	bh=lvQmTnPidiEnzeOrZUvLLHxYBSJgQymGBmIbkQCkFQM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CKA+An72dOiOOmHE3igcJAXWnFsz774+BoMkh/q8670TLHGzM3gRXSQQ3gGXaZS8O
	 w0SZ3QRMmLnKdPtVbHLZvhERhMUJynnqmeiNhlTe7I9o+eAIQaqw4lbNISN5ZVmZZi
	 i99zHbgAmmxW5EO8MBEUFsGzxgx23nNJP0e2L5pYt2sV1kqLq2/XOanJKVhQFLe526
	 Vmfv3/oOL6PSpcweShU8vay1dEb1VSeFZnqc8lhvR+LmvUpJKQMvdTuTNmHjLL7c8u
	 jBCOeHa7uZK/1GSS290GvxKH1mEuBDTZnPLrDtRR/c1WbososAguqu4CI5JAqm0Yda
	 fvx68Bw4XOtJQ==
Message-ID: <sashiko-outbox-218236@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/1] dmaengine: axi-dmac: fix incorrect segment size
 calculation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sergey Matsievskiy" <matsievskiysv@gmail.com>, dmaengine@vger.kernel.org
Cc: vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261117054054.22409-2-matsievskiysv@gmail.com>
References: <20261117054054.22409-1-matsievskiysv@gmail.com>
 <20261117054054.22409-2-matsievskiysv@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 06:02:12 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [High] dmaengine: axi-dmac: 32-bit overflow in
  axi_dmac_prep_slave_sg()
- [Medium] dmaengine: axi-dmac: 32-bit overflow in
  axi_dmac_fill_linear_sg()
- [Low] dmaengine: axi-dmac: missing Fixes trailers in commit message
--

commit f72f25e5b5e585f311e3609163b81e15ebf9fa27
Author: Sergey Matsievskiy <matsievskiysv@gmail.com>

> dmaengine: axi-dmac: fix incorrect segment size calculation
>
> When chan->max_length has a value of 0xffffffff (which is a possible IP
> configuration), DIV_ROUND_UP returns 0, resulting in incorrect number of
> segments calculation. Fix this by using DIV_ROUND_UP_ULL division
> function.
>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Sergey Matsievskiy <matsievskiysv@gmail.com>

[Severity: Low]
Should this bug fix include Fixes tags for the commits that introduced
these calculations?

  Fixes: 921234e0c5d7 ("dmaengine: axi-dmac: Split too large segments")
  Fixes: 74609e568670 ("dmaengine: dma-axi-dmac: Implement device_prep_peri=
pheral_dma_vec")

> diff --git a/drivers/dma/dma-axi-dmac.c b/drivers/dma/dma-axi-dmac.c
> index dbc31b185c4d4..30ea905840fe2 100644
> --- a/drivers/dma/dma-axi-dmac.c
> +++ b/drivers/dma/dma-axi-dmac.c
> @@ -706,7 +706,7 @@ static struct axi_dmac_sg *axi_dmac_fill_linear_sg(st=
ruct axi_dmac_chan *chan,
>  	unsigned int len;
> =20
>  	/* Split into multiple equally sized segments if necessary */
> -	num_segments =3D DIV_ROUND_UP(period_len, chan->max_length);
> +	num_segments =3D DIV_ROUND_UP_ULL(period_len, chan->max_length);
>  	segment_size =3D DIV_ROUND_UP(period_len, num_segments);
>  	/* Take care of alignment */
>  	segment_size =3D ((segment_size - 1) | chan->length_align_mask) + 1;

[Severity: Medium]
Can segment_size still overflow 32-bit unsigned arithmetic here when
chan->max_length is smaller than UINT_MAX (for example, 0x01000000 for a
24-bit X_LENGTH configuration) and period_len is within num_segments - 1
of UINT_MAX?

In that case, period_len + num_segments - 1 wraps around in 32-bit
DIV_ROUND_UP(), making segment_size evaluate to 0 before and after the
alignment adjustment.  The loop below then subtracts 0 from len on each
iteration and advances sg past the end of desc->sg[].  Using
DIV_ROUND_UP_ULL(period_len, num_segments) avoids the overflow.

> @@ -752,7 +752,7 @@ axi_dmac_prep_peripheral_dma_vec(struct dma_chan *c, =
const struct dma_vec *vecs,
>  		return NULL;
> =20
>  	for (i =3D 0; i < nb; i++)
> -		num_sgs +=3D DIV_ROUND_UP(vecs[i].len, chan->max_length);
> +		num_sgs +=3D DIV_ROUND_UP_ULL(vecs[i].len, chan->max_length);
> =20
>  	desc =3D axi_dmac_alloc_desc(chan, num_sgs);
>  	if (!desc)
> @@ -839,7 +839,7 @@ static struct dma_async_tx_descriptor *axi_dmac_prep_=
dma_cyclic(
>  		return NULL;
> =20
>  	num_periods =3D buf_len / period_len;
> -	num_segments =3D DIV_ROUND_UP(period_len, chan->max_length);
> +	num_segments =3D DIV_ROUND_UP_ULL(period_len, chan->max_length);
>  	num_sgs =3D num_periods * num_segments;
> =20
>  	desc =3D axi_dmac_alloc_desc(chan, num_sgs);

[Severity: High]
Does axi_dmac_prep_slave_sg() still hit the same 32-bit overflow on
32-bit architectures when chan->max_length is 0xffffffff?

drivers/dma/dma-axi-dmac.c:axi_dmac_prep_slave_sg() {
	...
	num_sgs =3D sg_nents_for_dma(sgl, sg_len, chan->max_length);
	desc =3D axi_dmac_alloc_desc(chan, num_sgs);
	...
	for_each_sg(sgl, sg, sg_len, i) {
		...
		dsg =3D axi_dmac_fill_linear_sg(chan, direction, sg_dma_address(sg), 1,
			sg_dma_len(sg), dsg);
	}
}

sg_nents_for_dma() computes DIV_ROUND_UP(sg_dma_len(sg), len) with an
unsigned int dividend and a size_t divisor.  On 32-bit platforms with
chan->max_length =3D=3D 0xffffffff, that addition wraps and counts 0 segmen=
ts
for every scatterlist entry with length >=3D 2, causing
axi_dmac_alloc_desc() to index desc->sg[num_sgs - 1] out of bounds when
num_sgs is 0 or axi_dmac_fill_linear_sg() to write past the end of
desc->sg[].

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117054054.2240=
9-1-matsievskiysv@gmail.com?part=3D1
