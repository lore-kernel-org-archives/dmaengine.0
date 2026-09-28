Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18EB73546DE
	for <dmaengine@vger.kernel.org>; Mon, 28 Sep 2026 04:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790568170; cv=none; b=CP95T5Qbzv7AxN5u2wWdIn00qTTlm8ja+fjggSFJrzKSL5cZ+aOjWkkMHC2TrDi+KQT/tfK1XZfsdUYY2DTwmeGsCI0trG5tkz/EzlTBlkNOWfw8Ve7J+BBomQmEoQ0Z9eGQ4Errpe8gg2R3QGjyvETTuAbUs4FBx6KpJcgLdXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790568170; c=relaxed/simple;
	bh=PUoKyFqK7iy2oC+H0CFngGsVY6SyKjxeTOVipURG6DE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XwmVlsfATxSANNgXhNgqdseqmwPPGC2l8AvXDuy3gDaTTt+z9isaPo8w1aqgylOM8RWn4zpVESWZVbsRvE5fcB6v18c5PJ80bVTxxYABDoazR4FdFgWFfqH9nYUl6jyUnHkIhQV0MR+z04tN6wnk6J2WUYFFe9gYeFEFd6Sc6OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=encVKbdK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="encVKbdK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6809E1F000FF;
	Mon, 28 Sep 2026 04:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790568168;
	bh=CVGbrWzUfBBATfW9Ckrez4gDhVGqejf1Ro9f5F0xK/8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=encVKbdKCS5Kyq8fTH00nseeKeUtp5Of18uDaN5QoCJXmIT7T1yPUK5IJnCz4Fr9v
	 TencTvAGaTQJhPZZM2OfS12ikRZvkEOz1En3BVel1GNoGy1emE/p1cfFNX3QxRKa0R
	 ePOhCowoTlOIPKjc+EQ7crDAMBqtuWWlxhpVMZXw/yq6ebxfB1hsvJBiJD8f2LTsoX
	 f+RG+RlGqsuNKT7dhjiPs/59hgSk+I8zr3Ek4dy0/NOXZasDXG44cu3Fhb3crTgA+s
	 b2md//vi2NSX0zyLCpSKqq8U1pSAHknvrA6UUpzDhTxYTSkAQ4XJXYQofuRWCKVXSE
	 eZoIVCS/Pd06w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6] dmaengine: dw-axi-dmac: report paused state and
 residue in tx_status
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rui Wang" <wr574332525@163.com>
Cc: dmaengine@vger.kernel.org, Frank.Li@kernel.org, vkoul@kernel.org
In-Reply-To: <20260928035133.2046-1-wr574332525@163.com>
References: <20260928035133.2046-1-wr574332525@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 04:02:47 +0000
Message-Id: <20260928040248.6809E1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dmaengine: false block matching on overlapping physical memory
--

commit 401af67dfb5740614a39aa65705b156a731bba3f
Author: Rui Wang <wr574332525@163.com>
Subject: dmaengine: dw-axi-dmac: report paused state and residue in tx_stat=
us

This commit updates device_tx_status to report the paused state when
appropriate. It also improves the residue computation for in-flight
transfers by reading the current hardware pointer to calculate the
transferred bytes, rather than relying solely on completed block counts.

> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma=
/dw-axi-dmac/dw-axi-dmac-platform.c
> index eebed2474210d..0fa97b83be828 100644
> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c

[ ... ]

> @@ -352,33 +352,110 @@ static void vchan_desc_put(struct virt_dma_desc *v=
desc)

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
Will this condition falsely match the wrong block if a scatter-gather list
maps the same physical address multiple times?

If a client driver submits a multi-block scatter-gather list with overlappi=
ng
physical memory regions (such as repeating a single dummy zero-page for SPI
TX/RX), this linear scan could match an earlier block in the list while the
hardware is actually executing a later block.

Does this mask actual progress and cause the reported transferred byte count
to repeatedly loop back to 0, corrupting the residue computation when queri=
ed
via dmaengine_tx_status()?

> +
> +		xferred +=3D hw_desc->len;
> +	}
> +
> +	/* Position doesn't match any block, be conservative */
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928035133.2046=
-1-wr574332525@163.com?part=3D1
