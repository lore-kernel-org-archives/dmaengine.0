Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73407343D66;
	Wed,  8 Apr 2026 17:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775669627; cv=none; b=Yg3a0l172jhqhnjvuxjLEesWfkvf9CRyyS1NWs1pk7o2eWUt/7NTeZ95FXTAuF3QssDzx8d1Qdnow1tjBdLcmoVDMiSVUbir3O1HPyf6owYXWPLOobbRPETxOFDahJHNV4K9T6W+L3DZlOu2aE28TTp3ZSc3HsHPfclWtXHDHAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775669627; c=relaxed/simple;
	bh=LjGr5F1V5Cx/qgfNKOdZveyRkEHHjaaXE6UxV4kmyqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uSlSU2PdbZmkUo7zYXJXDt4mlmvEUyCu75d6pBUDSa2kn9tDmoHgQf6B3DwaOeXq33qKmCP215ojPveigX2njzUZGABP7soXTPt1JdwSAnZVRPhpkDPvWv2JIwY+95TemS84m9nO3WoCvE+fgee0N+dSrGZvXhfRXp6xkhP9mMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LCThjV5b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LCThjV5b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6964FC2BC87;
	Wed,  8 Apr 2026 17:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775669627;
	bh=LjGr5F1V5Cx/qgfNKOdZveyRkEHHjaaXE6UxV4kmyqA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LCThjV5bU57n2KIA/aV1pR0QMeyW+yXcys9zyBtzZdP9BQSYqfZQZ2V1UD8whg4Q8
	 m6Xd3F7FpHO6f3UkI0jXQXoVVWsxDJoRhpFiymAPdmBtVZ0Y42Q+OKfHi1CmwCkoO6
	 LJ96YS3xSPjseOpHiAOSsl4YCeHvEJho9kVVZPIkOO/dt+mCu+swmvV29uzwMmYeZR
	 2fp208jrxgCFtpbBITBXgLSzSWWe503J1BoATIvzUPCdczdHGU2USevzf9//OUSC8Y
	 kFA9/wROxNflZdZaz8MozhKM/VGDbxAE4hBJJmadzvZh9DaHRXvShm+DSNYKGkk3zc
	 MOB2V2O7s6kgw==
Date: Wed, 8 Apr 2026 18:33:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, lgirdwood@gmail.com,
	perex@perex.cz, tiwai@suse.com, biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com, p.zabel@pengutronix.de,
	geert+renesas@glider.be, fabrizio.castro.jz@renesas.com,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v3 13/15] ASoC: renesas: rz-ssi: Add pause support
Message-ID: <b380ecf9-8013-4feb-bf36-bbaa17bd18fa@sirena.org.uk>
References: <20260407133507.887404-1-claudiu.beznea.uj@bp.renesas.com>
 <20260407133507.887404-14-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Z1jxOkx7Y4Jt2H3/"
Content-Disposition: inline
In-Reply-To: <20260407133507.887404-14-claudiu.beznea.uj@bp.renesas.com>
X-Cookie: Often things ARE as bad as they seem!


--Z1jxOkx7Y4Jt2H3/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 07, 2026 at 04:35:05PM +0300, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> Add pause support as a preparatory step to switch to PCM dmaengine APIs.

Acked-by: Mark Brown <broonie@kernel.org>

--Z1jxOkx7Y4Jt2H3/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnWkXUACgkQJNaLcl1U
h9DbIwf+OXVIqrae+gbXJIVxMp+cQs76KCeGaF5slJuallJnd4r0HOwMZvKMij++
7QLG1pBuy5oInlCq/GI1/l7/7RM8817e1yPwowCzn/xbGBMOSA7Yz2T9gAK5Mbr8
ie6a3AZdmVEv/q4gYwm//n/qwva3u5u47BxCI+Q9y5M16nydWUC4tAbB++LHwvL1
qScvkgZDyjxR7jX2xM82XARgZyE4bgluyxFWNHesZQuy5pmRwuS6hKlEjUIPX61o
Sj0IJhqGdGJlMs0ytM3nGq2DC0YTMLLt+F8CuDjB4xR5qLVnNFc2cjBz1JtPa85Q
i8nZnczJAoUY0LrYnSkIYBrb3ryj6Q==
=HPfT
-----END PGP SIGNATURE-----

--Z1jxOkx7Y4Jt2H3/--
