Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C2E385D9D
	for <dmaengine@vger.kernel.org>; Wed, 17 Jun 2026 09:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781686951; cv=none; b=p8OVoG912MPNJgGZegjHMBIglR2LnSAczor71MNbgJIJGdNUFG9LLCx0XBV5SQxFPUDKpXJZtHCOavB//jER6DHERY8meuYSaSuCtnRFgKqtUowZCzfQLJpiZrEdth8r/e4Bvh4ycLlLXWrmvntBe7p+d28w4bsRbx8bwT6q+vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781686951; c=relaxed/simple;
	bh=LLFN13LicI9vlz+wYcGwFteqsUruSMCPIjA4jylG470=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ilgdLnLCUZzH4zEsRrtuVs0c9sHBaip932lOwSLy0nxKtwYAwLVULNxT4bYqteQXJwW4ASN+gkB2fY8M+F5bajTUrvf+p4qad4qKUG5HoI5Yi/L74d583V8GqeRoOf0JhfgfSktvSMEKv9f1/ICsIIhi5iZrHO755b+EeUDGq5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=anSqZEBV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="anSqZEBV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C51F91F000E9;
	Wed, 17 Jun 2026 09:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781686950;
	bh=c8kIXIT9k846pnm7dmlEJWF/wgPPvibSedPylf08n1w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=anSqZEBVxAlwPnN0nKiRoPTvI7MzEsGX2S6KfEAeW+10RbuOkOPxIvUiy8YyppyIj
	 c01htT6FzBEnlt6KrzVj9w11THJrb+4ZtUgBTv05GU3wmgAI+AtXuEGsyjMqD2wRsP
	 1vPQfO228uPeE/nOVkQ+/rPrUBgQ3w4wdZnomWruiBPnjpnw1gW/ic3YlMq6UzTaJJ
	 0FMWP2v2xBKprTISVwc4MTmGKFBGrLKBR7GdXAC1v0vb7mUzZ2PtLCiZTe83H0zylm
	 WOZpCdKW7Cgqz5PmP6Glbci+vVIBD+YYl57Nz7ZEMxDKTpacLjECe/33rOZTIUqMfj
	 NZwdYfV3lrQ5w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: dw-axi-dmac: fix __le32 on set of
 CH_CTL_H_LLI_VALID
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ben Dooks" <ben.dooks@codethink.co.uk>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260617084944.705266-1-ben.dooks@codethink.co.uk>
References: <20260617084944.705266-1-ben.dooks@codethink.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Jun 2026 09:02:29 +0000
Message-Id: <20260617090229.C51F91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The `status_lo` field of `struct axi_dma_lli` is a little-endian `=
__le32` value, but it is passed directly without byte-swapping to `axi_chan=
_irq_clear()`. Furthermore, `status_lo` contains block transfer status, not=
 an interrupt clear mask.
- [High] `axi_chan_block_xfer_complete` uses the global channel-wide alloca=
tion counter `chan->descs_allocated` to iterate over the local `desc->hw_de=
sc` array, leading to a slab out-of-bounds access.
- [High] `dw_axi_dma_chan_prep_cyclic` produces incorrect segment lengths i=
f `period_len` is not evenly divisible by `num_segments`, causing cyclic bu=
ffer overflows and missed callbacks.
--

commit 7955a4e962eae80371df48e83bbcd1b7445eaf76
Author: Ben Dooks <ben.dooks@codethink.co.uk>

dmaengine: dw-axi-dmac: fix __le32 on set of CH_CTL_H_LLI_VALID

This patch fixes an endianness issue in the dw-axi-dmac driver by using
cpu_to_le32() when setting the CH_CTL_H_LLI_VALID bit in the LLI control
high register.

> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma=
/dw-axi-dmac/dw-axi-dmac-platform.c
> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> @@ -1123,7 +1123,7 @@ static void axi_chan_block_xfer_complete(struct axi=
_dma_chan *chan)
>  				hw_desc =3D &desc->hw_desc[i];

[Severity: High]
This is a pre-existing issue, but since we are indexing desc->hw_desc
here, can this loop read out of bounds?

The loop limit count is derived from the global channel-wide allocation:

dw-axi-dmac-platform.c:axi_chan_block_xfer_complete()
    int count =3D atomic_read(&chan->descs_allocated);

However, the array desc->hw_desc is sized specifically for the current
transaction (desc->nr_hw_descs). If multiple descriptors are prepared on
the same channel, won't descs_allocated be larger than desc->nr_hw_descs
and cause this loop to access memory past the end of the array?

>  				if (hw_desc->llp =3D=3D llp) {
>  					axi_chan_irq_clear(chan, hw_desc->lli->status_lo);

[Severity: High]
This isn't a bug introduced by this patch, but addressing the question in
the commit message about whether passing lli->status_lo is a bug: yes,
is this writing garbage bits to the interrupt clear register?

The status_lo field is an __le32 value being passed directly to
axi_chan_irq_clear() which expects a CPU-endian u32. More importantly,
status_lo contains the hardware status writeback of the LLI, not an IRQ
bitmask.=20

Writing this to CH_INTCLEAR could clear unrelated interrupts, such as
critical error interrupts like DWAXIDMAC_IRQ_ALL_ERR, before they can
be handled.

> -					hw_desc->lli->ctl_hi |=3D CH_CTL_H_LLI_VALID;
> +					hw_desc->lli->ctl_hi |=3D cpu_to_le32(CH_CTL_H_LLI_VALID);
>  					desc->completed_blocks =3D i;
> =20
>  					if (((hw_desc->len * (i + 1)) % desc->period_len) =3D=3D 0)

[Severity: High]
This is a pre-existing issue, but does this modulo condition fail to trigger
callbacks if the period length isn't evenly divisible?

In dw_axi_dma_chan_prep_cyclic(), the segment length is calculated with
DIV_ROUND_UP():

dw-axi-dmac-platform.c:dw_axi_dma_chan_prep_cyclic()
    segment_len =3D DIV_ROUND_UP(period_len, num_segments);

If period_len is not a clean multiple of num_segments, the unconditionally
padded segment lengths mean the mathematical condition here will never
evaluate to 0, permanently breaking vchan_cyclic_callback() execution.

Additionally, would the padded segment lengths cause an out-of-bounds DMA
memory transfer exceeding the actual buffer length?

>  						vchan_cyclic_callback(vd);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260617084944.7052=
66-1-ben.dooks@codethink.co.uk?part=3D1
