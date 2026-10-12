Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575133C276E
	for <dmaengine@vger.kernel.org>; Mon, 12 Oct 2026 10:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791801747; cv=none; b=HYHNiLxjCTxC4weKOZ3IjV0fM+xpMQph6lJwuP7EVxo5Lo4TYHY8k0P1z7ZXiua9O/3XqU+trlQQhGKNZ2ZSWl+amhAI4/+iiEVqFrtGdh8JpwVPrL4z7I5fzj8YXgQxeou6M8npebZ+oZccEZs2YUTFeNbwvAlPp5M+LfdMqxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791801747; c=relaxed/simple;
	bh=28Yx66NjZP5xzk20OUiMpkRXEDNf1lueGuVxCuGpePg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YjGzgPRTfG+qrw1q1XpMnMBHBLCK9NpKZRozoYXoRlx+rtguZqKs2CP6azEp5cQRojXpkBnarvp1dF/yEJtuvgSIBQToYIwxAdrYNxy0lwebnEElZBa7i10fb3tTlNERt3S1i8GsTmgTtFX5ee4Ip8Irjr7U62KCuEZHKCIJV9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Qy9VvlWD; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Qy9VvlWD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=28Yx
	66NjZP5xzk20OUiMpkRXEDNf1lueGuVxCuGpePg=; b=Qy9VvlWDm8isC1bObrWG
	SA7+vRows5/Po3Gpp7oCU1OyJJDVRDUHSEDSphpqy2pMEtDkDLQ3PkJGAag4/rNH
	KtKJZQoJcJHKZ0cMZJyrz8JGv99owFdXmjMiE7wn8A+T2qmC6nOFu+tOyZCCY0cC
	lQ+aXamKl60IJotDtSOCptXGkyJ6DnQog2+ZmiA1xH+K88KDCfqAJPW21HSYMn3f
	p/ZXl46Poq7oOWjB+XuCTSFqh3EuZMzh0yjqoEcPyw9Sko4XzHnsvCzafH38xT/E
	x8RP+cAXUgdM4ExFblAqpLVaRdwIiNeoKjjwhegS2ANhXNKLdT6y6elLXEIjf3zx
	sA==
Received: (qmail 2216045 invoked from network); 12 Oct 2026 12:42:12 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Oct 2026 12:42:12 +0200
X-UD-Smtp-Session: l3s3148p1@WRTEWaJdzK4ujnuu
Date: Mon, 12 Oct 2026 12:42:12 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: dmaengine@vger.kernel.org
Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	Dave Jiang <dave.jiang@intel.com>, Frank Li <Frank.Li@kernel.org>,
	Kelvin Cao <kelvin.cao@microchip.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Vinicius Costa Gomes <vinicius.gomes@intel.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH 0/8] dmaengine: unmap descriptor before completing cookie
Message-ID: <asy5hLkzZARvkKyD@shikoro>
References: <20261010124348.19055-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qReZEPt7jmvXPKts"
Content-Disposition: inline
In-Reply-To: <20261010124348.19055-1-wsa+renesas@sang-engineering.com>

--qReZEPt7jmvXPKts
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> We found out that we need to unmap descriptors before completing a
> cookie [1]. Fix the drivers for which this is a no-brainer and just
> switches those two function calls.

Okay, according to Sashiko, patches 1+5+6+7 are no no-brainers but need
a deeper analysis which I am not able to provide.

So, we could drop this series entirely because it seems more trustworthy
to let people with actual hardware fix these issues. Maybe a FIXME could
be added instead to these drivers.

Or, we can apply at least patches 2+3+4+8 where Sashiko found no issues.

I tend to use the first option but am open to whatever maintainers think
about it.


--qReZEPt7jmvXPKts
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmrMuYQACgkQFA3kzBSg
KbboYhAAsC1OwNrLEWb964Z1mC5KIzmafkgw2xWyV6npkoU2Odw9cSO0QrvCgIOA
fSUXs7g4iuntwNPX2e4Al2GsBoyu1E21mIwb2Hn8iK/jfpMD6qydtpA0+WBOfaVO
1KjCuCBbrSavdps5XTq0EVac9558OV6RPMbufGGwrYRw0C09euLfhrTJ4Oq89lpe
mgnTyeLQjNcU9/kKuE4sMPwus3AKUKYPrNt2kw7JQuKsfpTBLxgC7C2R6s4QbEQm
/acygK5fuXsrXvWu1CSwZyKNnkcIidF3OH4+2qrgU6dWCHk7BlTwUDKUuwckgcfg
562d9IpTLMejyAqH6/Vuc6nYcj8gwo1TR5uriRo/MzXqddSfAcaS6jGvTtn7ScFk
4Gw0h43g8B3vgEwP3CK7MdELlE9W0L3d5cwzpwIEpJTtksz9kr59J2B9dhrIA99x
32ep3xqbUhqUPF/t6Aw+JPweOPA3hrPQ/4UeZVoN1BxiWPpkI004Oz3Bse2pZNB0
1r3ow70SGj8HCafOZRn0OM8Im9RmOiDo4L75KbhIODwFHEc4GVhNQ6RR1P5CQkmt
LmK4GSde/Lfjob0y5xQE7lR/RqjxEn72JTMycR26pW3SxyDzhRQq0aZEHw7MznBA
hPzIIutYe/0jlrg00SJO/UaMhuJsQGMDBTjOgA9xy4q/PS11bvE=
=V3D/
-----END PGP SIGNATURE-----

--qReZEPt7jmvXPKts--
