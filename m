Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0D73F20E3
	for <dmaengine@vger.kernel.org>; Mon, 24 Aug 2026 11:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787571415; cv=none; b=TXuuSHVxPavX5zCqC3DB3yPdBo76T0ZOhF9CiqLUvuOqKNUnlLGVDQpBu+ycxHJ1+oln5ncK0u0BDQdWTUidVQ+qiIkksu4BmMYmpfv8VUrdZK0TaroIi+ttcCa6D2oFY+yEgL5t3HcNDNBPUCosgGiyC6xtPboxY3VRZfAf6C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787571415; c=relaxed/simple;
	bh=Su21DUR3HU1/POQ3M5R+9cYiVRE8Qf34ysqtm0wrmHY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iadTHIia3j+QY8kyrkRvnA+RugEQzSnA35ABCWsCKZREAFQrSecWlX9k6XajHaV/2Kz/lb8wusKjCiyxGGrK0r6jDy0nxlCpRc3hfNnmTHjaYVPqs9qusA2oPoqZ8htem5sNV0t3qDRQGA/kVcIwAUVw6NV64YsevI+b1LG8n3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N47WyhrN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N47WyhrN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 402771F000E9;
	Mon, 24 Aug 2026 11:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787571413;
	bh=ewciombkuMIyiS3paJhRlsLT2XeA0rPbrltaM7luwh8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=N47WyhrN6ml4GNef92qYs1BK04iAPkv2Tjxl3LYhEWm12JQ0Uh7wV1V7EA2tr6rdq
	 4r+rXuqxYYIwSj9Ic6v4gyEsb/Ksj/gANPoFuGIG8dK+Iea33afHI1RMcgKJZdRFqL
	 cjdEB67D9b0OzdRE0GFKou7k6wvMlQfoM0jRaRo6H2PKGaYDAS64AMrHAZ3r0Xcrb6
	 +thFyd9knCeZqq5sVvDret/X7cQc1FF1nCW3PFgMceRZPpRv4XiqTkwfY/ft5XVm06
	 I7atZVGgxIfBtmByjI5dGxUm08KgxIokShCYEg2GxsCPyM2CdtuKMnN7QJ+Sdo41FV
	 iUR5+AS8x0Olw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dmaengine: qcom-gpi: Add I2C High-Speed mode
 configuration support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jyothi Kumar Seerapu" <jyothi.seerapu@oss.qualcomm.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260824-i2c-hs-v1-1-8dd94e5c6113@oss.qualcomm.com>
References: <20260824-i2c-hs-v1-0-8dd94e5c6113@oss.qualcomm.com>
 <20260824-i2c-hs-v1-1-8dd94e5c6113@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 11:36:52 +0000
Message-Id: <20260824113653.402771F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Heap Buffer Overflow and DMA Address Corruption in I2C High-Speed =
mode due to insufficient MAX_TRE
--

--- Patch [1]: [PATCH 1/2] dmaengine: qcom-gpi: Add I2C High-Speed mode con=
figuration support ---
commit 0c2b77de6fa90756115b4394bd0db3e62bed9d2a
Author: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>

dmaengine: qcom-gpi: Add I2C High-Speed mode configuration support

Add support in the Qualcomm GPI DMA engine to configure I2C High-Speed (HS)
mode transfers. This introduces support for the CONFIG1 Transfer Ring Eleme=
nt
(TRE) to convey HS-specific timing parameters.

> --- a/drivers/dma/qcom/gpi.c
> +++ b/drivers/dma/qcom/gpi.c
[ ... ]
> @@ -1631,7 +1637,7 @@ static int gpi_create_i2c_tre(struct gchan *chan, s=
truct gpi_desc *desc,
>  	struct gpi_tre *tre;
>  	unsigned int i;
> =20
> -	/* first create config tre if applicable */
> +	/* first create config0 tre if applicable */
>  	if (i2c->set_config) {
>  		tre =3D &desc->tre[tre_idx];
>  		tre_idx++;
[ ... ]
> +	/* Create CONFIG1 TRE if requested */
> +	if (i2c->set_config1) {
> +		tre =3D &desc->tre[tre_idx];
> +		tre_idx++;
[ ... ]
>  	/* create the GO tre for Tx */
> -	if (i2c->op =3D=3D I2C_WRITE) {
> +	if (i2c->op =3D=3D I2C_WRITE || i2c->op =3D=3D I2C_HS_WRITE) {
[ ... ]
>  		tre =3D &desc->tre[tre_idx];
>  		tre_idx++;
[ ... ]
> -	if (i2c->op =3D=3D I2C_READ || i2c->multi_msg =3D=3D false) {
> +	if (i2c->op =3D=3D I2C_READ || i2c->op =3D=3D I2C_HS_READ || i2c->multi=
_msg =3D=3D false) {
>  		/* create the DMA TRE */
>  		tre =3D &desc->tre[tre_idx];
>  		tre_idx++;
>
>  		address =3D sg_dma_address(sgl);
>  		tre->dword[0] =3D lower_32_bits(address);

[Severity: High]
When I2C High-Speed mode is used with both set_config and set_config1,
can this cause an out-of-bounds write to the tre array?

Looking at struct gpi_desc, the tre array is statically sized by MAX_TRE,
which is defined as 3:

#define MAX_TRE 3

struct gpi_desc {
        ...
        struct gpi_tre tre[MAX_TRE];
        u32 num_tre;
};

If we generate CONFIG0, CONFIG1, GO, and DMA TREs, tre_idx will reach 3
here. Writing to desc->tre[3] would overflow the array and overwrite the
adjacent num_tre field.

Later, gpi_prep_slave_sg() sets gpi_desc->num_tre =3D 4, which would
overwrite the first 4 bytes of the newly written DMA TRE, potentially
causing an IOMMU fault or bus error when the hardware attempts the transfer.

Should MAX_TRE be increased to accommodate the new CONFIG1 TRE?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824-i2c-hs-v1-=
0-8dd94e5c6113@oss.qualcomm.com?part=3D1
