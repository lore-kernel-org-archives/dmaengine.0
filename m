Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F097F33B975;
	Mon, 22 Jun 2026 16:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782146557; cv=none; b=UyLBB6Je2ijRqv+Xc6wrLqiQ1kKC36T9Quq0PFtd7v3JQCoXNr/GdqtcSQpIKYAQABjKdTuT+yhUSrocbhQNa3MXcxfhe4rRqNJJgmkEzhSwIi9rGJVBJe4PcjdB2qCKPIAJaLLdIds/5IBX1g9zg5SscqUFWjQ4E5QhgTz50cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782146557; c=relaxed/simple;
	bh=bAnIhzXww4oTUlB3EZHF+A48TbUqWFDcVGyHrRnmLgI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LyFOd7zc0+PrpyttlUOA1C7d9vIFr7kIx3L9eu+U6y4nytNOiVOeBspAS7tpWqzNNnUibQLMjofCwx23d9hW2h8ju/qhJyZC1+lsbAgipaBCGsRvRHqJZzF93lVcP0YnUR4aDe2m9HqaqPs2Hzc+JhrRDmfsQ0cAetEo+vRGldk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mnCi4B8V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mnCi4B8V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF8BD1F000E9;
	Mon, 22 Jun 2026 16:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782146555;
	bh=jS5vzTWiFCVV3CCvTa86S3rAsEqBDW1fk6YNyU4jtpg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mnCi4B8VwCOumOVFdE2j3qraJ+BMRPUyrJLX+cqoIfqHyopKQI6tLQekmRsdKz5l2
	 ilk0NICDuqMs3c3zvNmCpv4/4+2yJtwSpWqHiqBgyFyIqt8W4qqIpLGsNaLE1KsY7x
	 qryAzD8JC4dl8lCdOquSuuNbl1lffu93AX0BFtqXnJhYCGxGjYe91Sr25ScFiqXszL
	 BV0X8eCrCUA1zX+lUB/UBK6hWED22CyK935uy2+IN0wVzvDj/uWdPPWko3caBOQqvs
	 m9jvSZG9IMlhtEFZuc0/jTVYoQUIdOePQgAM6jRNeGSr0fZqTO/SZZT27oxCDYdEll
	 K65MrslhGSJAA==
Date: Mon, 22 Jun 2026 17:42:30 +0100
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Yuanshen Cao <alex.caoys@gmail.com>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 4/5] dt-bindings: dma: sun50i-a64-dma: Add
 allwinner,sun60i-a733-dma compatible string
Message-ID: <20260622-line-underrate-af8018529dbe@spud>
References: <20260621-sun60i-a733-dma-v2-0-340f205891cc@gmail.com>
 <20260621-sun60i-a733-dma-v2-4-340f205891cc@gmail.com>
 <ajhjj7FLn136qMmt@SMW015318>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="peIRuF7CVWCE39IV"
Content-Disposition: inline
In-Reply-To: <ajhjj7FLn136qMmt@SMW015318>


--peIRuF7CVWCE39IV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 21, 2026 at 05:19:59PM -0500, Frank Li wrote:
> On Sun, Jun 21, 2026 at 09:40:57PM +0000, Yuanshen Cao wrote:
>=20
> subject dt-bindings: dmaengine: ....
>=20
> > Add `allwinner,sun60i-a733-dma` to the list of compatible strings for t=
he
> > `sun50i-a64-dma` dtbinding documentation.
> >
> > While the A733 DMA controller shares many similarities with the sun50i-=
a64
> > DMA controller, it requires a specific configuration due to differences=
 in:
> > - Interrupt register layout and mapping.
> > - Number of channels per interrupt register.
> > - Support for higher (32G) address widths in LLI parameters.
> >
> > Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
> > ---
>=20
> After fix subject tags,

Do not change this unless you're respinning for another reason. dma v
dmaengine is not worth resubmission, especially since dma is far more
commonly used and is the directory name.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

>=20
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>=20
> >  Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml | =
2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64=
-dma.yaml b/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.=
yaml
> > index c3e14eb6cfff..1cc3304b7414 100644
> > --- a/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.ya=
ml
> > +++ b/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.ya=
ml
> > @@ -25,6 +25,7 @@ properties:
> >            - allwinner,sun50i-a64-dma
> >            - allwinner,sun50i-a100-dma
> >            - allwinner,sun50i-h6-dma
> > +          - allwinner,sun60i-a733-dma
> >        - items:
> >            - const: allwinner,sun8i-r40-dma
> >            - const: allwinner,sun50i-a64-dma
> > @@ -70,6 +71,7 @@ if:
> >            - allwinner,sun20i-d1-dma
> >            - allwinner,sun50i-a100-dma
> >            - allwinner,sun50i-h6-dma
> > +          - allwinner,sun60i-a733-dma
> >
> >  then:
> >    properties:
> >
> > --
> > 2.54.0
> >

--peIRuF7CVWCE39IV
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajll9gAKCRB4tDGHoIJi
0l4hAP47PVrBv7GeDeVOvJgI2ZJy5w1r98XvDUdIdvTX634bFwD/aLHVuG6enEsl
VyC9c36IFrvNVMK1iB5+10sOdmY9vQU=
=O0oF
-----END PGP SIGNATURE-----

--peIRuF7CVWCE39IV--
