Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793648395;
	b=HUiOF6oFt9dk8TVtwPgqr4QCDIVop9yr1hdu53mdzdSisa9RfF8UwJrIsdpxvZfpW0tg
	 ZjZw0jrhQouxSTmjKe7IDEGzhbWXVayXProznn4G3qFpsB0YjU0bf07eZ8AY6Jnk+cij/
	 YkNOGA56R7lZj3nqQGdBSA/zesiCAaNHk688s34ll5/vu7tPPpTdHaxTbl7Y3OegfW0sJ
	 6KDPWw5vxXUjznPws8FdLdokqBPjKJMEhDdlecpLzOy6Tlx1WD1N0BTEvpCuhqH1j4M01
	 Rnw9SGDoaGP5gfCOHIGvTIG5qbBRluByREQCxuHGIySuzfFoLGk9XxrTUL7OcuhICxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793648395;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ei1PcyW2bvlCuqWOURcTSE3dLB/l5Xm1TRmGcUX2JW4=;
	b=dcggcyL3pQSNZcd0PjmFGC4hpXymIUTUb5YlnvAyMY8cdB2RFD8QEjWIVhw9yCeCaKuj
	 a8zueOXN5Ma8Oy+7QjR8uGR57FcczbQqJFAxgiyFGr139e9lb8tJo0b/dwazTlcCUAWtn
	 YuHLcvaUJLgCTubrAzm+UNiemOoPUoJjL9PIAXbR+2YFOZu1xvA8BMn+Jl3HrPKayKTS8
	 btnRIu/r4hh4tf2sPV7UL2MgRXP8/rgrpIIJ4RF8j2ggDNsbwebLWUlfF0ybj99FAET4u
	 mC7rYKfoo54fPVeeNPeKA6jhc5gOOUEQYkOjZvbeJFGuOa/RzPLyAjKM4VsmPl0PDkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aKUSJkHE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3693606A326;
	Mon,  2 Nov 2026 19:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aKUSJkHE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 886AC1F00A16;
	Mon,  2 Nov 2026 19:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793648394;
	bh=ei1PcyW2bvlCuqWOURcTSE3dLB/l5Xm1TRmGcUX2JW4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aKUSJkHEjeliqo1dMG/1lWPIuVnBz8f7hQ4tTFS0ZU1ycTsBnlhsolsmLWwL/uWb2
	 u08mtLopleSjzGsdEEe5RzYgqeAOdwbW7d/yBT8UkDk0oT5f2NFzo5l7hiI1vsXtYV
	 +lXDxbtOkQKLT7QwPd5ylTPBZ/nak7MzgZuRMYjpYomrQ3w9hg1A4xH1KZB6jUxQ7M
	 0QKCVIgPI7pz0yLLZyCQvzLPtDEwP4pRx14wjotbFV922AN2yaJlCMyPgaBgXjIyr3
	 BCSuMu36L3NHPHzhcPR1XtQ+QK6jxYPktgdLoshoZnGEu5FoFqzvprNQG20wluoEJx
	 sDW+Wp63urkOg==
Date: Mon, 2 Nov 2026 19:39:49 +0000
From: Conor Dooley <conor@kernel.org>
To: Peter Robinson <pbrobinson@gmail.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 1/9] dt-bindings: dma: brcm,bcm2835-dma: Add BCM2711 and
 BCM2712
Message-ID: <20261102-email-target-d3191584d234@spud>
References: <20261102090713.896324-1-pbrobinson@gmail.com>
 <20261102090713.896324-2-pbrobinson@gmail.com>
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HziPGci4IN+2yC0c"
Content-Disposition: inline
In-Reply-To: <20261102090713.896324-2-pbrobinson@gmail.com>

--HziPGci4IN+2yC0c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 02, 2026 at 09:06:51AM +0000, Peter Robinson wrote:
> Add compatibles for the BCM2711 40-bit DMA4 channels, which are
> described by a separate node covering channels 11-14, and for the
> BCM2712 DMA controllers. The register address of a node identifies its
> first channel, allowing a controller to be split across nodes.
>=20
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
>=20
> ---
>  .../bindings/dma/brcm,bcm2835-dma.yaml        | 31 +++++++++++++++++--
>  1 file changed, 29 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml =
b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
> index c9b9a5490826c..31d97a10a0ea9 100644
> --- a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
> +++ b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
> @@ -9,18 +9,27 @@ title: BCM2835 DMA controller
>  maintainers:
>    - Nicolas Saenz Julienne <nsaenz@kernel.org>
> =20
> -description:
> +description: |
>    The BCM2835 DMA controller has 16 channels in total. Only the lower
>    13 channels have an associated IRQ. Some arbitrary channels are used b=
y the
>    VideoCore firmware (1,3,6,7 in the current firmware version). The chan=
nels
>    0, 2 and 3 have special functionality and should not be used by the dr=
iver.
> =20
> +  BCM2711 channels 11 to 14 are 40-bit capable DMA4 channels, described =
by a
> +  separate brcm,bcm2711-dma node. BCM2712 has 40-bit addressing on all
> +  channels, with channels 6 to 11 being DMA4 channels. A controller may =
be
> +  split across several nodes, the register address identifies the first
> +  channel of a node.

Uh no, a device should not be split across different nodes. This should
not be needed, why can't your driver handle the upper channels having
different capabilities?

Thanks,
Conor.

> +
>  allOf:
>    - $ref: dma-controller.yaml#
> =20
>  properties:
>    compatible:
> -    const: brcm,bcm2835-dma
> +    enum:
> +      - brcm,bcm2835-dma
> +      - brcm,bcm2711-dma
> +      - brcm,bcm2712-dma
> =20
>    reg:
>      maxItems: 1
> @@ -99,4 +108,22 @@ examples:
>          brcm,dma-channel-mask =3D <0x7f35>;
>      };
> =20
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    dma-controller@7e007b00 {
> +      compatible =3D "brcm,bcm2711-dma";
> +      reg =3D <0x7e007b00 0x400>;
> +      interrupts =3D <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
> +      interrupt-names =3D "dma11",
> +                        "dma12",
> +                        "dma13",
> +                        "dma14";
> +      #dma-cells =3D <1>;
> +      brcm,dma-channel-mask =3D <0x7000>;
> +    };
> +
>  ...
> --=20
> 2.56.0
>=20

--HziPGci4IN+2yC0c
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaujnBQAKCRB4tDGHoIJi
0hRLAP0RLHp9wKJWp9KZvKHugGEw7nv+l/NCctuBP0UpDcirAQEA5THbx5eORWZq
KfVxUSY81BazlR4FE+rstFss+HAzyA0=
=gXCA
-----END PGP SIGNATURE-----

--HziPGci4IN+2yC0c--
