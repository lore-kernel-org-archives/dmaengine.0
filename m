Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E0D363086;
	Mon, 12 Oct 2026 18:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791828925; cv=none; b=KGvtqG+etpqzJqhK6o7Hymwyjg7XzWH7ngokx0x2a4xlkNVOvWUYGncrq/WLnYxfKxdMJ0q6e4XUYsYRYufzNcOQjrGaRCk/jE9xrC7YMLBh22xRA+wQfIcIokFqapL35mp8Y/7eXNDaVh+6LazcG4yVGXyGN+j9+mcplfCrh9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791828925; c=relaxed/simple;
	bh=nUjuSbrZaN64WJgvYr2jmyN4E5eYvUamc6TkEzJhogo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jugcj0bf1mHPgXocygpZ6cCrvicgBru6b4umeJYKP1lA755HTMtp8lTeKPAAN19lXyqtW8rLNZ5jUOAMIlMq4VnviXvfsCn3/GEqgqIixw+NSjMgYfKjiHdjTbsndTb3GpUAlrh1NZ4CTCJ9DkDe5ChoIHt8XH+dxNxOvAwEqAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kmSGLKHT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kmSGLKHT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 251301F0089B;
	Mon, 12 Oct 2026 18:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791828924;
	bh=sJ7Cz9cE5jYmh9i7+7gt+I7tJt8elW65y25IztcbqK8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kmSGLKHTM0Xvrvi2qmfl59/BADJyznbG+bzb0bGwHPkZV/MCemLPQtRRvfKMc1SCK
	 EIZRGiHj6qCGSoZR2+EP2wEkB4cYuLid2h42DFhMeCFHqR7/B8jfuFT5HGbkajB2w+
	 AdKCsHPEOFUGlPpzZ5gJLIm0V3evijWTJIuZh9QrFmfbR888KHH0utNWOuYh3jBHdh
	 mCLhiQaFkh+fFUnitd+g8EGWCxESqozjK312zWZ4n5xNr/Plg2su41m/T4P31o4zeo
	 k9yjNS4IL8Z7dZnXWSji7b/T1BwxouuxWIogksUxwOhHeDaN+IZ5KIgXWR8MaRJ+ZG
	 tx0K8SJL6aYxw==
Date: Mon, 12 Oct 2026 19:15:19 +0100
From: Conor Dooley <conor@kernel.org>
To: Jelly Jia <Jelly.Jia@cixtech.com>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, robin.murphy@arm.com,
	devicetree@vger.kernel.org, Frank.Li@kernel.org,
	cix-kernel-upstream@cixtech.com, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/6] dt-bindings: dma: arm,dma-350: Document the CIX
 Sky1 integration
Message-ID: <20261012-trailing-makeover-daf4d62ac2b9@spud>
References: <20260907033404.596839-1-Jelly.Jia@cixtech.com>
 <20261009051846.1115962-1-Jelly.Jia@cixtech.com>
 <20261009051846.1115962-5-Jelly.Jia@cixtech.com>
 <20261009-e284e1844269292657604ec7@squawk>
 <asoSH0CLbi7xmjP8@ubuntu>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Vbao+CsgOn8rBfQO"
Content-Disposition: inline
In-Reply-To: <asoSH0CLbi7xmjP8@ubuntu>

--Vbao+CsgOn8rBfQO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 10, 2026 at 06:23:27PM +0800, Jelly Jia wrote:
> On Fri, Oct 09, 2026 at 04:31:26PM +0100, Conor Dooley wrote:
> > > +  cix,irq-router:
> > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > +    description:
> > > +      Syscon phandle for the CIX Sky1 subsystem register block that =
routes
> > > +      DMA-350 channel interrupts to the AP interrupt controller.
> >
> > See comments on the driver for more on this, but I'm not convinced that
> > this should be in this node - especially if this thing controls other
> > device's routing too.
> >
> > Thanks,
> > Conor.
>=20
> Agreed - v3 drops cix,irq-router from the binding completely. We plan
> to handle the interrupt gate as firmware/pre-Linux platform setup for
> v3, so the DMA node should not describe it. With the property gone, the
> CIX-specific conditional in allOf goes away as well, and the binding is
> back to the generic controller properties plus the CIX compatible. The
> corresponding driver changes are in my reply on the driver patch.

For correctness, I think you still need to model this by using interrupt-map
in the syscon node, with the syscon as the interrupt parent. If firmware
will program it, you don't need to actually implement anything in a
linux driver (unlike the Microchip and Renesas devices that I linked),
you just need to put the interrupt-map property in the syscon and common
code will do the rest.

--Vbao+CsgOn8rBfQO
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCas0jtwAKCRB4tDGHoIJi
0rvzAP45h5Dn2C+Y02Q/vohB7N99QpMoe5knRjpH10VLH4udPwD9GSoyu1o41xQ3
1XdkvyTiiRgLHfky9uIGfJ5uVfboRgY=
=jyIs
-----END PGP SIGNATURE-----

--Vbao+CsgOn8rBfQO--
