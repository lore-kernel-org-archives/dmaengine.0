Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793730172;
	b=3KwwzYMaWbIcnGpLqDP2tfoAyt16iEq3raqj4Qr3XbDiU+CXzDM7sYrkvfoXRH5LSZwr
	 dOiSvQzn4Ttkp7677ixZwBzf55aSkT4y4yG8bFP4qCpqeUQeXyuS924rdNJjJnSIcKHuj
	 YktIvXyfqQQ7alu8PhNfZcGgKdmJXrgic1owc0U/cd368T3Pvq5G4Uy7DiQpSX2CXeb1C
	 qSecV6fXLye+cnxXV16UHkgSOeXdUUwt1ZyHfzO2ysHkhT14x7LVzTOOhQ6RQiGb2tuxm
	 tnwtw3VBfymljUIkh+II+Wio5SfKbHmU6A0QZ+aN2knVhGTuXKZyKV27+uQW+l0Mlcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793730172;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Ud7L2BHlOxXSkrDxIcOwnu6Rw0+dRUWE6yyL5rEtQsA=;
	b=X5ZLTuuf/tpXi+xyT5vLmctIB9XICzL6s5yyfsU1WBymd8yhi9VQ18STw8UObhJfOhwb
	 4lUxdIq10Q2Bm7dSV18NqeJcVLNmDZ7/PCC8EJaOi0n1C4hkHFJEF5wtRv0pms5a40ckh
	 2/4CdljqKKPlTABYajP92LTPsu6P9ESRwPmM/Vu3aIWyuvU2qW7x/S8ScnWKEfGniwlkK
	 +8UgK5yI3OAO2X15RoCrAibdN1aQxrWXIFj0f8uGMG458xuyj/LXXdEmHWyOs9x8WiCV7
	 564IkW0zX2LZQxAARLStNPhaEOq+8GuiIwKlP4wT1F46TYTia5+8VLAoe2ZbefV00Cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GYvOyYdK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B21606A324;
	Tue,  3 Nov 2026 18:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GYvOyYdK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AADFD1F000C1;
	Tue,  3 Nov 2026 18:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793730171;
	bh=Ud7L2BHlOxXSkrDxIcOwnu6Rw0+dRUWE6yyL5rEtQsA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GYvOyYdKFWOLPI/K/HSlCcLL+bwttjCQ2Vpvy+j5EkBZjrcB8bFJysEgqd/LtOlEa
	 9+011rq6kzLcEGOZtTMcQ4r8XIelCD+Q8Pj6SFZstUaXwNk7Mpw9hDgVg/oajwW8eJ
	 /BMcpHPjN/+lQ5ueXSXl/lTjhapv6A+LbZYuiHzDRUg4tD+dX7pocVJe6yWk9om716
	 3PN4GVD+teUK9un1i6USvIXkYqVg+Hq284TyUy3SP531MgcHZp7pqh1x/crpSzehYU
	 OMHa3Cyvnwd9aoBjWrzYVyjmilq88QOmyvyH0wcp16YGRl12LcyEmmzfnyE68UvgUm
	 5HaXpj/lbAxJQ==
Date: Tue, 3 Nov 2026 18:22:46 +0000
From: Conor Dooley <conor@kernel.org>
To: Peter Robinson <pbrobinson@gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
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
Message-ID: <20261103-fade-dweller-775b1ccbaf7b@spud>
References: <20261102090713.896324-1-pbrobinson@gmail.com>
 <20261102090713.896324-2-pbrobinson@gmail.com>
 <20261102-email-target-d3191584d234@spud>
 <CALeDE9Ncz=6jo_1VxdCJgSVV+fCTgkUvci-=e4MQYFYo_O9M0Q@mail.gmail.com>
 <5bd67c8d-41ee-40e7-ab75-031e1520758f@gmail.com>
 <CALeDE9NhPa3V4jJ-Lc1sOujdrSAtkOuoeLW98NBxUai2qZFoLw@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="OYy0OWd0C8mSK/JA"
Content-Disposition: inline
In-Reply-To: <CALeDE9NhPa3V4jJ-Lc1sOujdrSAtkOuoeLW98NBxUai2qZFoLw@mail.gmail.com>

--OYy0OWd0C8mSK/JA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 02, 2026 at 09:35:48PM +0000, Peter Robinson wrote:
> On Mon, 2 Nov 2026 at 20:38, Florian Fainelli <f.fainelli@gmail.com> wrot=
e:
> >
> > On 11/2/26 12:18, Peter Robinson wrote:
> > > On Mon, 2 Nov 2026 at 19:39, Conor Dooley <conor@kernel.org> wrote:
> > >>
> > >> On Mon, Nov 02, 2026 at 09:06:51AM +0000, Peter Robinson wrote:
> > >>> Add compatibles for the BCM2711 40-bit DMA4 channels, which are
> > >>> described by a separate node covering channels 11-14, and for the
> > >>> BCM2712 DMA controllers. The register address of a node identifies =
its
> > >>> first channel, allowing a controller to be split across nodes.
> > >>>
> > >>> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> > >>> Cc: Rob Herring <robh@kernel.org>
> > >>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > >>> Cc: Conor Dooley <conor+dt@kernel.org>
> > >>>
> > >>> ---
> > >>>   .../bindings/dma/brcm,bcm2835-dma.yaml        | 31 ++++++++++++++=
+++--
> > >>>   1 file changed, 29 insertions(+), 2 deletions(-)
> > >>>
> > >>> diff --git a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma=
=2Eyaml b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
> > >>> index c9b9a5490826c..31d97a10a0ea9 100644
> > >>> --- a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
> > >>> +++ b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
> > >>> @@ -9,18 +9,27 @@ title: BCM2835 DMA controller
> > >>>   maintainers:
> > >>>     - Nicolas Saenz Julienne <nsaenz@kernel.org>
> > >>>
> > >>> -description:
> > >>> +description: |
> > >>>     The BCM2835 DMA controller has 16 channels in total. Only the l=
ower
> > >>>     13 channels have an associated IRQ. Some arbitrary channels are=
 used by the
> > >>>     VideoCore firmware (1,3,6,7 in the current firmware version). T=
he channels
> > >>>     0, 2 and 3 have special functionality and should not be used by=
 the driver.
> > >>>
> > >>> +  BCM2711 channels 11 to 14 are 40-bit capable DMA4 channels, desc=
ribed by a
> > >>> +  separate brcm,bcm2711-dma node. BCM2712 has 40-bit addressing on=
 all
> > >>> +  channels, with channels 6 to 11 being DMA4 channels. A controlle=
r may be
> > >>> +  split across several nodes, the register address identifies the =
first
> > >>> +  channel of a node.
> > >>
> > >> Uh no, a device should not be split across different nodes. This sho=
uld
> > >> not be needed, why can't your driver handle the upper channels having
> > >> different capabilities?
> > >
> > > This is the way it's done in the downstream kernel, unfortunately
> > > Broadcom doesn't publish the HW details so either they'd need to
> > > contribute the support (which they've not done since the RPi4 was
> > > available) or I'm not sure what the other options would be. Open to
> > > suggestions.
> >
> > Neither here nor there, IMHO, yes it would be nice if documentation was
> > published (and a customer like Raspberry Pi is probably one of the few
> > that can get the needle to move there).
> >
> > You have the bcm2711 and bcm2712 compatible strings which should be
> > enough for you to know which channels are 40-bit capable and which are
> > not, yet keep the same Device Tree node.
>=20
> From reading the downstream commits though it reads like the different
> channels have different capabilities? Or am I reading that wrong and
> it's the different generations of the HW that have different
> capabilities?

That I cannot answer, but it should make no difference right? Can the
DMA core not cope with different channels having different capabilities?
If it can't, the correct thing to do is extend the DMA core, not make
two nodes.

Cheers,
Conor.

--OYy0OWd0C8mSK/JA
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCauomdgAKCRB4tDGHoIJi
0pGwAQDRU1UwJJQoJg1NDelCs/EW0G+wfNCTMkVRloenYHuQsgD/dEcCdXvNLxuf
gjn3c350LhclHq3pPf9RbJA9UdGWagw=
=s7oi
-----END PGP SIGNATURE-----

--OYy0OWd0C8mSK/JA--
