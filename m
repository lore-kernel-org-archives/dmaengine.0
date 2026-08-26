Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549ED3B7749
	for <dmaengine@vger.kernel.org>; Wed, 26 Aug 2026 08:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787732236; cv=none; b=CsH2bGPrJD2w7+DqrhTuUeKbOXC8CGfGFWnn2/VLzpHOwSW7knMnT22/HJ8RkiKLUHzGDAh29k5n6inMfXyD3YLxP8qVwiI606qWMqPSqoKbP3Q4M5D7osANsEypV7906uSeY81BTgwS1qUuXtAjl4eFn9u9SB772KVIFxbFA74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787732236; c=relaxed/simple;
	bh=dolQ+NxnTMGvu2+rDr1RovRCe+B8rA2GHf9opkg2RMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=StzYyiQhCQ+wSgTGJgKUmgVZSy+vo+MHdoUyxZYAw9+w0lxzSFZf7g5Gp04UsKcLv9FHAp9TD1767oIrdUOvStoOOG9XjmoSn6cFdIV12V1jp4V8W0v1imRo8OEvQCApyZElnQwlmSZq/Q+K6c7Y7H6IcY2+uY0Xu1M7Hkplcz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=OrR4qnO0; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="OrR4qnO0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=6ceR
	PPwj1L/dPBiUekP+t6gKiYZWtbROs+D3sx3/n/s=; b=OrR4qnO0TtpzNDAU3nMc
	vWY94v4Ud/GMtnX2S72m0sGJ1E8P38pcZwjWWA4NkuvA7Ryxe14U0BWIJuGfGJuh
	bsdSGkaY0fSHPcJj5dCJn3eeL9ghOAGeATgYc/BsHwQmDcsSqthqKSZfA0yOCZuZ
	da8pTpiVzLlXmcudHbeQtyLWm0xIpVWvlh9a5dT+5H3ZtVdpWPa2zTNPCrKj9yhi
	nY9F2MfGPNv6BuUZK4tKXX1Ikdb19OkZE3c2K/1Bwp/HIVodHNPecbIwzSqRbufa
	XW9usgqG4ZCumHNgREtqDrlaIMJRgXN+tRu827ik2KppqBj+46wPlqtDyCQa2+RJ
	9A==
Received: (qmail 783305 invoked from network); 26 Aug 2026 10:17:09 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Aug 2026 10:17:09 +0200
X-UD-Smtp-Session: l3s3148p1@rrZz2O5ZPJEujnsh
Date: Wed, 26 Aug 2026 10:17:08 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: linux-renesas-soc@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, dmaengine@vger.kernel.org
Subject: Re: [PATCH 4/4] dmaengine: sh: rcar-dmac: Add support for R-Car Gen5
 SoCs
Message-ID: <ao6hBDGWgekG04Pf@ninjato>
References: <20260825141542.30901-6-wsa+renesas@sang-engineering.com>
 <20260825141542.30901-10-wsa+renesas@sang-engineering.com>
 <ao23b5sx-YAlii4y@SMW015318>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4JcUrI4pNrAC7weG"
Content-Disposition: inline
In-Reply-To: <ao23b5sx-YAlii4y@SMW015318>


--4JcUrI4pNrAC7weG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2026 at 10:40:31AM -0500, Frank Li wrote:
> On Tue, Aug 25, 2026 at 04:15:46PM +0200, Wolfram Sang wrote:
> > Gen5 is very similar to Gen4. Of interest here is that it has a SMMU
> > instead of an IPMMU, so we don't need to set the flag for a workaround.
>=20
> Generally, needn't "we",  simple said
>=20
> needn't to set ...

Can do, will wait a bit more for more comments before resending.


--4JcUrI4pNrAC7weG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmqOoQQACgkQFA3kzBSg
Kbaz8g/+KTyITC/CRLrUGeQaCT5KuJv0M4yCbpXSXxSvY/AzH2Dsy/c7WIdbXWgv
13ngzM1fYKoCm3dySF1ejIFMkwtzJkvXtOjhFjYcjdhrVZ9Mr/uMVjQ+8m+PZoNP
spuCL3DwCDdngVfLtamqfmiRbnDqC+9hPWD8h5LEFMq42LRqnx11GJ2lCrI8i+xj
CoAOulEAJe1faYCZyGJd65+6e5RxrjaA4Tj4eAw466FisPRi0NsvNH7gsjCHxSjo
e06PJx/L5kOo2FyCAmI6oSNl+HLFE4qqBkDpRWIoqAuIgbPSHrRnFtCTEPsf3i+Z
t1r1EMwronswvl0VlOrEIequHZmH32dT0H2lw3l6YlQ43gRJcUpAQG1L2PWYtYkA
ABMOszu3qec3UAbMZ5T8mRQPNJ856ZRHay48Bv9t1xGnveI8WEsp+UTJERh2BKUd
nLyW97f9eMqMTqtNaq1dVVXTrTlR9/qmq3xxry5ywIOw5TDLYgK708g20u0d8NZ1
VQS8kkV0TbOSfEeldRLJRySkrZKO7vIHqhcEJroRrLeaPcwLCl2MyhpZGnT2DGIG
xFZRaCIG+iWTP7RbCIz4v6Llo9ooKDwJxlksg9v395/G07I6iGFsHmPJfA2ktyo1
cPD5K9YhyWrmYW70RT71l+MoZTZu3LrdIxL7bSmli2CMRyShcrM=
=sXlg
-----END PGP SIGNATURE-----

--4JcUrI4pNrAC7weG--
