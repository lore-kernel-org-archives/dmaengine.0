Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACA141DDF6;
	Fri, 24 Jul 2026 10:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784889901; cv=none; b=mqVcje8wG1Lg0L6+Vq3NrWxgC214gSn0M69bXLsfuJnMU/bN4UvKnbRj7mV665YUzOk7eWSqiDPnUgZ0ytj1t3c4DWJNlNH6siSm5nvo1TpxFF0AMtDt0kIgJNTzCMhNallmpAP7mswrkqk+je5iiLjUP/VZ0ohtCX9edoDTawM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784889901; c=relaxed/simple;
	bh=AVzt7UkRxLLPLdkPQOU72xA1EajeqzzI/GKslgjQeTg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JVGfpuM3+BXKizug2th0CjhxC9rvwTum19bF0zHatp/gQGh6cqXpjY5BEu68knEm+JXf5ZVcTa3Oo3avCB5+TICsFMLWCQjNYzk7MrzgBI9UX2wvxwOpi7uNjY661pkY42NXia+wi1Rwf2mUb9hTowgAoRY+5bbW8yaThxG3ox0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OmN3ES/r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OmN3ES/r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B25201F000E9;
	Fri, 24 Jul 2026 10:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784889900;
	bh=I9nvbyycG4huU86hLYlNNOTL+P44tTl9GG8JhAxB2ds=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OmN3ES/rNlkW+27LM+WO60B9Li1CJFwbuHA20rQM3btmohtBtz73BotENZjZhH9Oj
	 zGajvTSF5T2HGuUKZBJMdIYwsJekkCySW7Z5un5oEEa1LFzbpUGMfTEMml6BRnyoA2
	 1hvHvPsECw71HgNZpAhhmiRNijZFvgwUYUGkwBZD5UYNfnNX1B84EYL2BLpJe1NJpp
	 9ZTFeWaKwWpNu+uaa4CVz1VRGM1an8gZJfwCvEMpbA9So4JU9j3g02zUgbBepO9yNa
	 RCe+8iAgkWtZ5x7YWlD/gFAxJSGGbnvQbySrQOqy6/17lfT/4LilWZR4dUHbfbjbt6
	 /4j0xLRHL9A3A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 05/19] dmaengine: ti: k3-udma: move descriptor
 management to k3-udma-common.c
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sai Sree Kartheek Adivi" <s-adivi@ti.com>
Cc: Frank.Li@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260724102115.2854-6-s-adivi@ti.com>
References: <20260724102115.2854-1-s-adivi@ti.com>
 <20260724102115.2854-6-s-adivi@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 10:44:59 +0000
Message-Id: <20260724104459.B25201F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Low] Global namespace pollution due to missing `static` keyword on `meta=
data_ops`.

Pre-existing issues:
- [Critical] Signed 32-bit integer overflow during multi-TR DMA address cal=
culation causes massive negative offset.
- [High] Buffer underallocation and out-of-bounds write due to swapped argu=
ments in `cppi5_trdesc_calc_size`.
--

--- Patch [5]: [PATCH v7 05/19] dmaengine: ti: k3-udma: move descriptor man=
agement to k3-udma-common.c ---
commit bdc5f8902724dd8a4b2dc695e0b04524fbd51779
Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>

dmaengine: ti: k3-udma: move descriptor management to k3-udma-common.c

Refactor the K3 UDMA driver by moving all DMA descriptor handling
functions from k3-udma.c to a new common library, k3-udma-common.c.
This prepares the driver for supporting new K3 UDMA v2 variant
(used in AM62L) that can reuse the same descriptor handling logic.

> diff --git a/drivers/dma/ti/k3-udma-common.c b/drivers/dma/ti/k3-udma-com=
mon.c
> new file mode 100644
> index 0000000000000..daf5f19dfb3ab
> --- /dev/null
> +++ b/drivers/dma/ti/k3-udma-common.c
> @@ -0,0 +1,1243 @@
[ ... ]
> +
> +const struct dma_descriptor_metadata_ops metadata_ops =3D {
> +	.attach =3D udma_attach_metadata,
> +	.get_ptr =3D udma_get_metadata_ptr,
> +	.set_len =3D udma_set_metadata_len,
> +};

[Severity: Low]
Does this struct need to be exported to the global namespace? The static
keyword seems to have been dropped during the code move. Leaving such a
generic name in the global namespace might cause linker collisions with oth=
er
subsystems.

> +
> +struct udma_desc *udma_udma_desc_from_paddr(struct udma_chan *uc,
[ ... ]
> +struct udma_desc *udma_alloc_tr_desc(struct udma_chan *uc,
> +				     size_t tr_size, int tr_count,
> +				     enum dma_transfer_direction dir)
> +{
[ ... ]
> +	/* Allocate memory for DMA ring descriptor */
> +	if (uc->use_dma_pool) {
> +		hwdesc->cppi5_desc_size =3D uc->config.hdesc_size;
> +		hwdesc->cppi5_desc_vaddr =3D dma_pool_zalloc(uc->hdesc_pool,
> +							   GFP_NOWAIT,
> +							   &hwdesc->cppi5_desc_paddr);
> +	} else {
> +		hwdesc->cppi5_desc_size =3D cppi5_trdesc_calc_size(tr_size,
> +								 tr_count);

[Severity: High]
This is a pre-existing issue, but does this call to cppi5_trdesc_calc_size()
pass the arguments in the correct order? The function expects tr_count first
and tr_size second.

Passing them in reverse order calculates a smaller size than needed when
the scatterlist has a large number of entries (e.g., tr_count > 64). As a
result, when the hardware writes the 4-byte responses, does it write past t=
he
allocated buffer size and corrupt adjacent coherent DMA memory?

> +		hwdesc->cppi5_desc_size =3D ALIGN(hwdesc->cppi5_desc_size,
> +						uc->ud->desc_align);
> +		hwdesc->cppi5_desc_vaddr =3D dma_alloc_coherent(uc->ud->dev,
[ ... ]
> +struct udma_desc *
> +udma_prep_slave_sg_tr(struct udma_chan *uc, struct scatterlist *sgl,
> +		      unsigned int sglen, enum dma_transfer_direction dir,
> +		      unsigned long tx_flags, void *context)
> +{
[ ... ]
> +		if (num_tr =3D=3D 2) {
> +			cppi5_tr_init(&tr_req[tr_idx].flags, CPPI5_TR_TYPE1,
> +				      false, false,
> +				      CPPI5_TR_EVENT_SIZE_COMPLETION, 0);
> +			cppi5_tr_csf_set(&tr_req[tr_idx].flags,
> +					 CPPI5_TR_CSF_SUPR_EVT);
> +
> +			tr_req[tr_idx].addr =3D sg_addr + tr0_cnt1 * tr0_cnt0;

[Severity: Critical]
This is a pre-existing issue, but can this address calculation overflow and
result in a massive negative offset?

When processing a DMA buffer larger than 2GB, the variables tr0_cnt0 and
tr0_cnt1 (both u16) can have a product that exceeds 2^31. Multiplying two u=
16
values in C promotes them to a signed 32-bit int, so the product can become
negative.

When this negative 32-bit int is added to sg_addr (a 64-bit dma_addr_t), it
is sign-extended to a massive 64-bit negative offset, calculating a backward
DMA address. Could this bypass memory isolation and corrupt arbitrary kernel
memory?

> +			tr_req[tr_idx].icnt0 =3D tr1_cnt0;
> +			tr_req[tr_idx].icnt1 =3D 1;
> +			tr_req[tr_idx].dim1 =3D tr1_cnt0;
> +			tr_idx++;
> +		}
> +
> +		d->residue +=3D sg_dma_len(sgent);
> +	}
[ ... ]
> +struct udma_desc *
> +udma_prep_dma_cyclic_tr(struct udma_chan *uc, dma_addr_t buf_addr,
> +			size_t buf_len, size_t period_len,
> +			enum dma_transfer_direction dir, unsigned long flags)
> +{
[ ... ]
> +		if (num_tr =3D=3D 2) {
> +			cppi5_tr_csf_set(&tr_req[tr_idx].flags,
> +					 CPPI5_TR_CSF_SUPR_EVT);
> +			tr_idx++;
> +
> +			cppi5_tr_init(&tr_req[tr_idx].flags, CPPI5_TR_TYPE1,
> +				      false, false,
> +				      CPPI5_TR_EVENT_SIZE_COMPLETION, 0);
> +
> +			tr_req[tr_idx].addr =3D period_addr + tr0_cnt1 * tr0_cnt0;

[Severity: Critical]
This is a pre-existing issue, but can this run into the same signed 32-bit
integer overflow regression during the cyclic descriptor preparation path?

> +			tr_req[tr_idx].icnt0 =3D tr1_cnt0;
> +			tr_req[tr_idx].icnt1 =3D 1;
> +			tr_req[tr_idx].dim1 =3D tr1_cnt0;
> +		}
[ ... ]
> +struct dma_async_tx_descriptor *
> +udma_prep_dma_memcpy(struct dma_chan *chan, dma_addr_t dest, dma_addr_t =
src,
> +		     size_t len, unsigned long tx_flags)
> +{
[ ... ]
> +	if (num_tr =3D=3D 2) {
> +		cppi5_tr_init(&tr_req[1].flags, CPPI5_TR_TYPE15, false, true,
> +			      CPPI5_TR_EVENT_SIZE_COMPLETION, 0);
> +		cppi5_tr_csf_set(&tr_req[1].flags, csf);
> +
> +		tr_req[1].addr =3D src + tr0_cnt1 * tr0_cnt0;
> +		tr_req[1].icnt0 =3D tr1_cnt0;
> +		tr_req[1].icnt1 =3D 1;
> +		tr_req[1].icnt2 =3D 1;
> +		tr_req[1].icnt3 =3D 1;
> +
> +		tr_req[1].daddr =3D dest + tr0_cnt1 * tr0_cnt0;

[Severity: Critical]
This is a pre-existing issue, but does the same vulnerable 32-bit integer
promotion and overflow occur here when calculating both the source and
destination addresses for the second TR?

> +		tr_req[1].dicnt0 =3D tr1_cnt0;
> +		tr_req[1].dicnt1 =3D 1;
> +		tr_req[1].dicnt2 =3D 1;
> +		tr_req[1].dicnt3 =3D 1;
> +	}
> +
> +	cppi5_tr_csf_set(&tr_req[num_tr - 1].flags, csf | CPPI5_TR_CSF_EOP);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724102115.2854=
-1-s-adivi@ti.com?part=3D5
