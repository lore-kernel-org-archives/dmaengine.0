Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04432E7375
	for <dmaengine@vger.kernel.org>; Sun,  6 Sep 2026 21:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788731319; cv=none; b=jwiVoAYEu/p/7rBsN5Bdh8R56XtI3xNpWkwA29OGHEU/PcTUY0m6V/BVkW9gFC+Ky75wzPPzloIcuEQ2a1GtjmhLoFXp5jvlqRS+TaA+lHMjWr4AqHUbLzQoFfkOxcBfyxLhk6mVyfjulP8frtDk5sm2eqZSXyt1eI1XBBoQuSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788731319; c=relaxed/simple;
	bh=Vt8+b4CrBnDK3FFuMVxLq+n6lJLsKcj83miOmfU+uM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l0A3FKOgtS/z7qQQB6937C7CO1QdZy32cJFolYi0N2Tst45Ku28IqZLGm2imI8NRtSjtSHLU8Z8Iqwv6LRMFuOjVF8lh+MRDc+YOBbQbrX8HXke9WVXl60pHnrPX+2mBbfuSjyn2faEHtvCH/s7baJsuuepvIbZJ5bgNNSeeuBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Q0m74V3l; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Q0m74V3l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Nn5M
	+4yRhrHkyVDGUFX+j8pRgNMyilsX89zdUOaN3SY=; b=Q0m74V3lfiY+MAaNuL0h
	b6gVx0H9MltswoEnOSiqJRFu+6ciwaRQ9qMXmwIQKXA1MUBrln+jPLlDXWJtHb9n
	7KwykYOOf0u2wVsby3zoGWB5MiTGGQoFqgWX3uFt/OuFe/SsxUMPK1Z4SfUPqLmt
	Yl7Jpz1ApvuplNGzxDbpIsFu18umiDsdKY+mflh8LRFUbjSatsXRYOAQmKFCx/yr
	knxEHf25fxNSZf6QJrB3qZgSbDn5QiAUJKy9RZwx8gbuzuUj3Ozob94PyJkoBiAX
	I4ZAAPPKEufAx4aqaaHaR//2sBp2BohcDEeemUEDiMRH79VwI9mNfr6hKzCUR6cI
	qQ==
Received: (qmail 2157231 invoked from network); 6 Sep 2026 23:48:35 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Sep 2026 23:48:35 +0200
X-UD-Smtp-Session: l3s3148p1@P0ildtdafKsujnu8
Date: Sun, 6 Sep 2026 23:48:35 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
	dmaengine@vger.kernel.org
Subject: Re: [PATCH 4/4] dmaengine: sh: rcar-dmac: Add support for R-Car Gen5
 SoCs
Message-ID: <ap3fs0Ay25nRxCzF@shikoro>
References: <20260825141542.30901-6-wsa+renesas@sang-engineering.com>
 <20260825141542.30901-10-wsa+renesas@sang-engineering.com>
 <CAMuHMdWAL+B7RchaV+PMDT7XbQvXz1WZ82B0EZXcH8VLBEbL+w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="De/5wyT/cXd7G6wX"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWAL+B7RchaV+PMDT7XbQvXz1WZ82B0EZXcH8VLBEbL+w@mail.gmail.com>

--De/5wyT/cXd7G6wX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > +               .compatible =3D "renesas,rcar-gen5-dmac",
> > +               .data =3D &rcar_gen5_dmac_data,
>=20
> I expect this can just point to rcar_gen4_dmac_data, once we have
> confirmed the IPMMU issue does not impact R-Car Gen4.

I'd be more than happy if this is the case somewhen.


--De/5wyT/cXd7G6wX
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmqd37MACgkQFA3kzBSg
KbZGgA//TWQWQ8iUaaWULUL/+xGeApDYYy88weiOuOJzLVe87Z3MF5KPNjUnA2UU
d5//IcMMfco4/JdqrEXTJZ57E5UG06hJc2E+kqlmWzx8TNRltpsOIvr3qKJLitJ9
QczZMKPIno7ML/v4e10h3dtk/c3FpeU+X4QxRucJwno25kko0LUvMOZahH8zVlFo
Ou/xpCJKva9gomNUTsqFN6rsnMYx7Ud2qy1paxk3fjB9AgdHdxVK1cC1iVScUIdW
ZUHQN/NKwGuDhMzFP3H+yn/Kq8HP634ILCxBD8SboImY0XJVcB+qz0LQdNQwwBjq
r533r+8ferGvtdy+C3JnBZfVlnsrEkF+MF3al8QuuG37G8+vBCdjoOdJTsSI/e5T
u6UuZDMpUtYivEtUcXVU3x2XhvHGQB2mXnRap9N24nVOZQai4neTS2LluynXW2ix
yTYgyOKrgB+XV9c0an2qzzh4k+XC35cbALSlgEjtz49ttcAAo16B4kuda9/JsP36
0x8037f9A4RybpBbzhA/EeOmH37MVRfU7jlMPQEyGTfgvXLJy3JSc/yKC4RoZMI4
OL9Rhjyh6ulmIsodZBD6qWLpZYdmlL0tHT4Xs8FglIsmut7/SmI8DvpmR142NRIp
x1fmLj4D+VUu3NMjgul9h/1qWD2o0lI6JtYS46NuM1XSBuDSw3g=
=sBaX
-----END PGP SIGNATURE-----

--De/5wyT/cXd7G6wX--
