Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793807842;
	b=DdT0a/O2CQiZV/RMBGKV4fmk1P6p2/dGSu9JulFvrW7x3hgD8moZQTsdq4odFq1kovWm
	 xf9slM59hLAirpJYE9ZD8KwWexTzCVvAduE2wtZ3ypt+ndKjQDSBZDIvzDk08aoyukjmj
	 FVBSyqqPRMltROZmjQ+UHykfuKgBRkZJnFs/0lNbUTytKac9rqyQRuZ4DoiMThxSsIblJ
	 rfvuhMDPRwETe4Zr6LSCB5XeZ9zmR3k9aVT5bNyJ0cUiG2cPNBC1l4+Tbw9K1ZPeL4Nrn
	 w/s3CWe9+kzNLAQx+aimVZLQJ29Yl6lQHhNF5d3WFZYL5hoCmUCxA33HiNeMgxWJB2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793807842;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=YI66q6t/dNZy2gnlUt10E9BRYN4n42tibXZNFqSuO7I=;
	b=vyo16wPYuoc6kmsRZmcu7tcsz/fp7OXKVmoDJlZ2Q95oz2dT0KedLy9w46ChhQqOoDqB
	 Q/b2D/z7ndqUPKJ0EQU50alUjR74sPfCe6SK0btuOw6dIi2ZbSPVPByUHD6YK71RFpTfA
	 rs9wJDXD1o7/EIfTTfs6uGXx/yzXmUHHJxkAOLvjHKtcplJ/cTJlgokbeRJqytZs8IQ/y
	 ZjZ4j7OFPKI90IpGp5k70zm6DjBO6LLPKkEGGyGwgQ4G/onokYjJ5EiQoQlS7SCMMLqID
	 UUeAgnRbxUR2gZtu/9cEjnTmTmo9KZublf0/46PwWYNrSOtFszlpLwqEvXHR46PpnJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eNfrZOwD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0032C6082BE4
	for <dmaengine@vger.kernel.org>; Wed,  4 Nov 2026 15:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eNfrZOwD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58E611F00A20;
	Wed,  4 Nov 2026 15:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793807841;
	bh=YI66q6t/dNZy2gnlUt10E9BRYN4n42tibXZNFqSuO7I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eNfrZOwDtEHnafWwrYg3kG4OWPbpROQYQe0El/94qbprAc1rC7CMd+WGphjAzKyQJ
	 gEj5NCpVA/iAYhyBntl/+falDDfp/WjZDITikVtRXzOJGJImyHrC6Mj0/u11tZ2Uam
	 oHTqyLUjMj4xFYfn+xdVqAtdSvUr0T9sSR68dc0eRpDumWG1Y2necbBB+LORW3ZOB/
	 ZIsOpq5rl63CHWUDOREA4dnWXjZzphD74ZYV9mrDTp1TdCpCv96+f2b0KX5MKymjGL
	 56EhqRMBItdeoqW8BIJ3Ed+NKsXH4BqVkMQFMT0np/vACr/asHXDzMgB5f484NYna3
	 rRXM52MUhqzSg==
Message-ID: <sashiko-outbox-197563@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] dmaengine: pl08x: Use the channel count from the
 device tree
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Yang" <mmyangfl@gmail.com>, dmaengine@vger.kernel.org
Cc: vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261104154542.3131916-3-mmyangfl@gmail.com>
References: <20261104154542.3131916-1-mmyangfl@gmail.com>
 <20261104154542.3131916-3-mmyangfl@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 15:57:20 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] dmaengine: pl08x: shared vendor_data channel count mutated in pl08=
x_probe()
- [High] dmaengine: pl08x: exclusive reset get in pl08x_probe() breaks shar=
ed resets
- [Medium] dmaengine: pl08x: ioremap() leak on reset error paths in pl08x_p=
robe()
--

commit 48a403ca064a8a26673e3514f98d52758e1a7164
Author: David Yang <mmyangfl@gmail.com>

dmaengine: pl08x: Use the channel count from the device tree

This series deasserts the reset control in pl08x_probe() before reading
hardware registers and updates the PL08x DMA driver to honor the
dma-channels property from the Device Tree node.

> diff --git a/drivers/dma/amba-pl08x.c b/drivers/dma/amba-pl08x.c
> index 543c2eb8cfa81..9bcb4a3cd5a05 100644
> --- a/drivers/dma/amba-pl08x.c
> +++ b/drivers/dma/amba-pl08x.c
[ ... ]
> @@ -2725,6 +2728,16 @@ static int pl08x_probe(struct amba_device *adev, c=
onst struct amba_id *id)
>  		goto out_no_ioremap;
>  	}
> =20
> +	/* Release the reset before reading registers */
> +	rst =3D devm_reset_control_get_optional_exclusive(&adev->dev, NULL);

[Severity: High]
Does requesting an exclusive reset control here break platforms where the
PL080 DMA controller shares its reset line with other peripherals?

In drivers/amba/bus.c, amba_read_periphid() uses
of_reset_control_array_get_optional_shared() to deassert shared resets. On
StarFive JH7110 (arch/riscv/boot/dts/starfive/jh7110.dtsi), the PL080 node
sdma (which sets arm,primecell-periphid) shares the JH7110_STGRST_SEC_AHB
reset line with the crypto and rng devices:

    sdma: dma-controller@16008000 {
        compatible =3D "arm,pl080", "arm,primecell";
        arm,primecell-periphid =3D <0x00041080>;
        ...
        resets =3D <&stgcrg JH7110_STGRST_SEC_AHB>;

In drivers/char/hw_random/jh7110-trng.c, starfive_trng_probe() acquires this
same reset line via devm_reset_control_get_shared(). When one driver reques=
ts
the reset line as exclusive and another requests it as shared,
__reset_control_get_internal() in drivers/reset/core.c triggers a WARN_ON
and fails with -EBUSY:

    if (WARN_ON(!rstc->shared || !shared))
        return ERR_PTR(-EBUSY);

> +	if (IS_ERR(rst)) {
> +		ret =3D PTR_ERR(rst);
> +		goto out_no_ioremap;
> +	}
> +	ret =3D reset_control_deassert(rst);
> +	if (ret)
> +		goto out_no_ioremap;

[Severity: Medium]
Does jumping to out_no_ioremap here leak the pl08x->base MMIO mapping when
devm_reset_control_get_optional_exclusive() or reset_control_deassert()
fails?

pl08x->base is mapped via ioremap() just above this block, whereas the
cleanup labels at the bottom of pl08x_probe() place iounmap(pl08x->base)
under out_no_platdata:

    out_no_platdata:
        iounmap(pl08x->base);
    out_no_ioremap:
        kfree(pl08x);

> +
>  	if (vd->ftdmac020) {
>  		u32 val;
> =20
> @@ -2747,6 +2760,16 @@ static int pl08x_probe(struct amba_device *adev, c=
onst struct amba_id *id)
>  		vd->dualmaster =3D !!(val & BIT(9));
>  	}
> =20
> +	/* Read the channel number from the node if specified */
> +	if (!of_property_read_u32(np, "dma-channels", &channels) && channels) {
> +		if (channels > vd->channels)
> +			dev_warn(&adev->dev,
> +				 "using %u channels, instead of %u from the node\n",
> +				 vd->channels, channels);
> +		else
> +			vd->channels =3D channels;
> +	}

[Severity: High]
Since vd =3D id->data points directly to the shared static struct vendor_da=
ta
entry in pl08x_ids[] (such as vendor_pl080), doesn't mutating vd->channels
in-place corrupt the channel count across controller instances or across
driver unbind and re-probe?

In pl08x_probe(), each device stores a pointer to the shared structure:

    struct vendor_data *vd =3D id->data;
    ...
    pl08x->vd =3D vd;

At runtime, pl08x_get_phy_channel(), pl08x_irq(), and pl08x_debugfs_show()
all read pl08x->vd->channels dynamically:

    for (i =3D 0; i < pl08x->vd->channels; i++) {
        if ((BIT(i) & err) || (BIT(i) & tc)) {
            /* Locate physical channel */
            struct pl08x_phy_chan *phychan =3D &pl08x->phy_chans[i];

If a 4-channel controller probes before an 8-channel controller matching the
same AMBA ID, vendor_pl080.channels is overwritten with 4, clamping the
second controller to 4 channels as well. Conversely, if an 8-channel
controller probes first and a 4-channel controller probes second, shrinking
vd->channels from 8 to 4 causes the already-active first controller to stop
allocating physical channels 4..7 in pl08x_get_phy_channel() and to stop
servicing their interrupts in pl08x_irq() after clearing their bits in
PL080_ERR_CLEAR and PL080_TC_CLEAR.

On ftdmac020, where vd->channels is populated from FTDMAC020_FEATURE on each
probe before checking dma-channels, if a first instance overrides
vd->channels to 4 (allocating 4 elements in pl08x->phy_chans) and a second
instance later probes with 8 channels, pl08x->vd->channels on the first
instance becomes 8 and pl08x_get_phy_channel(), pl08x_irq(), and
pl08x_debugfs_show() can index pl08x->phy_chans[] out of bounds.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104154542.3131=
916-1-mmyangfl@gmail.com?part=3D2
