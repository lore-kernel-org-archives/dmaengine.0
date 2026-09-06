Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86DF3597B
	for <dmaengine@vger.kernel.org>; Sun,  6 Sep 2026 21:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788731270; cv=none; b=YUPUf/LOoYSWx0AB5ntRcLfKvT0MsYrmnC+3U/SxowTuvG05KClN0jB2ADj0oALI+gl5SkzmyLcEnjXoqKn+4fCH9abQ50g82LzBGZ6h57wTBGorU26RlPX5EtlPVM7NUxUA00viYGBnPQuhPA8ftIP55tDQM/sElT8VXO6Qk0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788731270; c=relaxed/simple;
	bh=/ASiuCLhx8taDgMoGPR7hVop36+d0awzwOyU1otQXz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GQAm8WpX8hT79yDF3M1+iZhT1RGc57pX/m05brrkjxnNF5a6TicGD+YgBS4n1kzAl2UWBSyLsVEdtsmr1v/0bcc2hJHSxmqYczhA7SiXLWQDd4oYFv2GQlCLFwQaDPiXVQv4G5OxURQVlUaXJJZhPlkbACOxyEdAuho2Obu3Rd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=gtimDFqZ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="gtimDFqZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=+DZJ
	ux177TeOk+hcN4tjGnJsE/wITD2AfYYf5i9Pj4A=; b=gtimDFqZ3/89G+DOK2Jt
	zBOS1KmhuKnRFlHi9trUMr80xo5bzrXBgtI/i2dVYg3AHa84/MygxTtVOdywGlr7
	E98iI4mUNdv8FSP0yOA1GC9hoIMGH3zASZWtr2OYc47hoL63TUBr2KfyQRpOmCW4
	QFBB4Jg04U4VRrhBX8ViHZTeFPdQEnAoNIq4WjJkiUP5JWfwIQzf4m0x6oKdxsPg
	QWSPuln0+fHNL7f9VrVioyk87AHsSZ3NT3Cbs4n3bJn6OhAAEHn3A8qVg8ZjHwiD
	v9XT/LaTVBQuRgkFMzCuxJ+Z5FEYKUXRnNk+aEIyqkIoJ9IFylkH9zF15p+gY9Gt
	+A==
Received: (qmail 2157021 invoked from network); 6 Sep 2026 23:47:37 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Sep 2026 23:47:37 +0200
X-UD-Smtp-Session: l3s3148p1@yc82c9da0tgujnu8
Date: Sun, 6 Sep 2026 23:47:37 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, dmaengine@vger.kernel.org
Subject: Re: [PATCH 2/4] dmaengine: sh: rcar-dmac: SMMU doesn't need IPMMU
 workaround
Message-ID: <ap3fdT-0J3TUalMQ@shikoro>
References: <20260825141542.30901-6-wsa+renesas@sang-engineering.com>
 <20260825141542.30901-8-wsa+renesas@sang-engineering.com>
 <CAMuHMdXj14sZXrcPhNA7HZ8+nB9FYypcOhNEYpkhYj7YZsMQhg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/UtlQnJ93rNKSKX1"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXj14sZXrcPhNA7HZ8+nB9FYypcOhNEYpkhYj7YZsMQhg@mail.gmail.com>

--/UtlQnJ93rNKSKX1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> >  struct rcar_dmac_of_data {
> >         u32 chan_offset_base;
> >         u32 chan_offset_stride;
> > +       unsigned int has_ipmmu:1;
>=20
> broken_ipmmu_microTLB_0?

Yes, that's a better name.

> > @@ -2000,11 +2003,13 @@ static void rcar_dmac_shutdown(struct platform_=
device *pdev)
> >  static const struct rcar_dmac_of_data rcar_dmac_data =3D {
> >         .chan_offset_base =3D 0x8000,
> >         .chan_offset_stride =3D 0x80,
> > +       .has_ipmmu =3D 1,
>=20
> The issue this fixes was seen on R-Car H2 and M2-W.
> R-Car H3 ES1.0 already existed at that time, so R-Car Gen3 might be
> affected or not.

Yes...

>=20
> >  };
> >
> >  static const struct rcar_dmac_of_data rcar_gen4_dmac_data =3D {
> >         .chan_offset_base =3D 0x0,
> >         .chan_offset_stride =3D 0x1000,
> > +       .has_ipmmu =3D 1,
>=20
> Let's hope this issue was fixed in R-Car Gen4.  Perhaps someone can
> verify this using the test Laurent shared[1] a long time ago?

=2E.. I also envisioned future updates once we find out if Gen3/4 are
affected. But for now, enabling Gen5 has priority and this is what this
series does. Rest can be done incrementally.

> >  static const struct of_device_id rcar_dmac_of_ids[] =3D {
>=20
> [1] https://lore.kernel.org/1422137953-30156-1-git-send-email-laurent.pin=
chart+renesas@ideasonboard.com

Ah, I didn't find this one. The commit/branch still exists today :)

https://git.linuxtv.org/pinchartl/media.git/commit/?h=3Ddma/iommu/debug&id=
=3D86db1ee12532f8de2bca02c0bab77ad7619ef7f2

Unsurprisingly, cherry-picking it (10 years old) to v7.3-rc1 is a mess.
I suggest to postpone this...


--/UtlQnJ93rNKSKX1
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmqd33UACgkQFA3kzBSg
KbaKJQ/+PTQkn+zk0bXclJpdLuWN8N3lA0mYQUnCMtCd2uPVt8o6uI6QObmVF4sG
wxr9pPHogrAnZ4Fn/S77HJ5yXNdUwV2hrBEMA7fwboe013Wyt7QfqhMQICzNfotO
Otm48EtcWhMRkeE2yhseME33c2pBucNnJilMjT2Dl+Vi9b2/f9LoDVQLX5eZqHts
0+hJrXZ7SdSRjvzziPGsLDhHnQd+jGO8FSh1HU9XQ7C+Fg89R+SXDWQpFtRZP0SQ
ToNdzI71BIa6l68QwypWlHgqp8nR747/6vVwiFphWW4+RANDpICmeJRv/PWeN5fD
gRZZkW/NSJlPH7Nqptj0VSG9auObAw7v85AS2SnmLH0eCoDZu1aFJTbFEmjbZvvQ
VvwzblXAqTupwhvlZoVG8WJW0QVJFbq7zAfwr31DesKwzxt5tLQ40dvZ00yTQgD5
Nz8SENoSEJzpP2xD+VkAhD6ETdGNf2l03uUNO8IcdqvUvrHx7EnfHuplVPlDF4Ez
vpWroclF7LfYcIlc3o82E0hTHcCI++R8fY1HMuOFpyBaRE72nNzX7FLrp9BEMAOm
YveV2vX239pbM7501YM2L7m+H48yEceL0vzfmQARdPoilslXjM82rxbjY75y84rX
V4L/oOSB8UwR1FOo0Q1lm1l5I8fwxGw9mZS2xPFBFXvQzyoKdbs=
=oRAU
-----END PGP SIGNATURE-----

--/UtlQnJ93rNKSKX1--
