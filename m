Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E78D253B58
	for <dmaengine@vger.kernel.org>; Thu, 24 Sep 2026 03:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790219909; cv=none; b=MU4Xun0HAUuS1XOuymD/dfMvyl1FUAH+0iezqwCc6vaMCUo3GJAFgQNB0bkJG2GOp0PZlfMI0Y3J3ugU2Z0iASfavZf0J9HmiBUVFBC1Dj46z9AhVtUfq7WcWwNupi6skwi75ufuuW/daPy7dNLKewrKjpr2HU9p6nvVOnVV7Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790219909; c=relaxed/simple;
	bh=c5x1RFIWJwTTlqO0Q/agufrszpy5fDr6F1CPlfmrsH0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gYynsk97H4K5wJzVSasXJV0+7AYXVMW7IIepS039g4CUXoxVRue0r6VobgmniOa1jKolV4d1/wmIZO9yVO/uvZpti2vn3DVne/pbEXRlw9kuveZP9uYpxfxox8nrs3Mw8nVgXdb43CcqtpujZlJd72ali2dc+wkR3SXigtLBhsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VG6b6ESr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VG6b6ESr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC6351F000FF;
	Thu, 24 Sep 2026 03:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790219908;
	bh=YD9UOSG4qEyZZwUdU/UfOpZOYAprl1jKrafjV4Q1TH4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VG6b6ESr4g176ao5NF/iKDhJAbEDMOIhyIzU9pf2WSrGnwxt4nWhh/TTycfnvM4a0
	 1cxo5pN7+BCkCzt7vaf8bQNnXckpaJVwab4HsoyaW5zub4G9GUR33YKrmm1s7Pnk5+
	 pIowO7Fyr8xPwsBpEP48f7tm243aA52j76opAsibj8L0xsXt0FoLSjDEWxJyBimLUS
	 mFvf+2Is8DoVPK71CSF60DZv+zu5RUPOPLrquid7MjlkaOKMW+86MJTDktTiQuq4G8
	 XgryBZ1twaXWcUG6q+DQ//ndJWRbQ7a9NfXQtA3fl1Ix5mMhHoKIz8E281ZI+uGsAF
	 SOFbcQlTXEdow==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5] dmaengine: dw-axi-dmac: report paused state and
 residue in tx_status
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rui Wang" <wr574332525@163.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260924025739.844-1-wr574332525@163.com>
References: <20260924025739.844-1-wr574332525@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 03:18:27 +0000
Message-Id: <20260924031827.DC6351F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] dmaengine: dw-axi-dmac: stale hardware pointer race on buffer reuse
- [Medium] dmaengine: dw-axi-dmac: incorrect residue for overlapping SG reg=
ions
--

commit 51268a3a8963bcf17968d0065986bd47e9b6a2a8
Author: Rui Wang <wr574332525@163.com>
dmaengine: dw-axi-dmac: report paused state and residue in tx_status

The driver implements device_pause/device_resume, but device_tx_status
keeps reporting DMA_IN_PROGRESS for a paused channel. This commit updates
the reporting to handle paused state and calculates actual byte residue.

> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma=
/dw-axi-dmac/dw-axi-dmac-platform.c
> index eebed2474210d..f0cb3c7956629 100644
> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c

[ ... ]

> @@ -352,33 +352,110 @@ static void vchan_desc_put(struct virt_dma_desc *v=
desc)
>  	axi_desc_put(vd_to_axi_desc(vdesc));
>  }
> =20
> +/*
> + * Read a 64-bit channel address register while the transfer may be
> + * running. The two 32-bit halves cannot be read atomically on all

[ ... ]

> +static u32 axi_chan_get_xferred(struct axi_dma_chan *chan,
> +				struct axi_dma_desc *desc)
> +{
> +	struct axi_dma_hw_desc *hw_desc;
> +	bool dst =3D chan->direction =3D=3D DMA_DEV_TO_MEM;
> +	u64 pos, start;
> +	u32 xferred =3D 0;
> +	int i;
> +
> +	pos =3D axi_chan_readq(chan, dst ? CH_DAR : CH_SAR);
> +
> +	for (i =3D 0; i < desc->nr_hw_descs; i++) {
> +		hw_desc =3D &desc->hw_desc[i];
> +		start =3D le64_to_cpu(dst ? hw_desc->lli->dar : hw_desc->lli->sar);
> +
> +		/* Current position is inside this block: partial progress */
> +		if (pos >=3D start && pos <=3D start + hw_desc->len)
> +			return xferred + (u32)(pos - start);

[Severity: Medium]
Will this logic correctly handle scatter-gather lists that contain
overlapping or repeating physical memory addresses?

If a DMA client submits an SG list using a common memory region for padding
across multiple elements, pos could match an earlier block while the DMA
engine is actually processing a subsequent block reusing the same physical
address.

Could this cause the residue to jump backwards and report an artificially
high remaining byte count to clients that rely on a monotonically
decreasing residue?

> +
> +		xferred +=3D hw_desc->len;
> +	}
> +
> +	/* Position doesn't match any block, be conservative */
> +	return 0;
> +}

[ ... ]

> @@ -468,6 +545,9 @@ static void axi_chan_block_xfer_start(struct axi_dma_=
chan *chan,
>  	}
>  	axi_chan_config_write(chan, &config);
> =20
> +	/* The hardware pointer registers now belong to this descriptor */
> +	chan->desc =3D first;
> +
>  	write_chan_llp(chan, first->hw_desc[0].llp | lms);
> =20
>  	irq_mask =3D DWAXIDMAC_IRQ_DMA_TRF | DWAXIDMAC_IRQ_ALL_ERR;
>  	axi_chan_irq_sig_set(chan, irq_mask);
> =20
>  	/* Generate 'suspend' status but don't generate interrupt */
>  	irq_mask |=3D DWAXIDMAC_IRQ_SUSPENDED;
>  	axi_chan_irq_set(chan, irq_mask);
> =20
>  	axi_chan_enable(chan);
>  }

[Severity: High]
Is there a race condition between setting the descriptor as active and the
hardware actually updating its pointer registers?

If a client reuses a previously completed buffer for a new transfer,
axi_chan_block_xfer_start() assigns chan->desc =3D first and enables the
channel.

If dma_chan_tx_status() is called to check the status before the DMA engine
fetches the first LLI, it might evaluate a stale hardware pointer.

Since the buffer is identical to the previous run, could the stale pointer
match the end of the new transfer's memory range, causing
axi_chan_get_xferred() to erroneously return the full block length and
report a 0 residue for a newly started transfer?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924025739.844-=
1-wr574332525@163.com?part=3D1
