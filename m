Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB8F43712C
	for <dmaengine@vger.kernel.org>; Fri,  9 Oct 2026 13:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791553093; cv=none; b=V5HpQEVxtf0cq/0cvvMEx55b0dqUWYqbntiD3B3zJ/RBQJSwD4m2Uun48gPXYbGi353HgwLbaN61Ff6a8+8PBkaOWHDzcv8cDeckykXIoRyAkJv+We8QmLTFtw67gHgttSywbJnDaqKfwCIOsWlq9yHZndTLkpgLqzfNli/o7I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791553093; c=relaxed/simple;
	bh=nW+ttAH1HDFjgIqrMjZ/WFb/2ac1TN0rjknDAUOkX5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H+yCLmnkzuXPFF2s+imOKfmEgGtRGw+lW+ok7P2Wl28wvt2FrVzEy4bBfkY5hXc91sqax8E28N7M5914FfLtEKf2AQ5ulUwtntU5EX9ujAjvIZv6WbCD/DvHn65Frb+PtegMUn1fWYdZQNIxWm/gRwjBvRAy2mw99FOL2YGE4NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=FZmRbA/B; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="FZmRbA/B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=nW+t
	tAH1HDFjgIqrMjZ/WFb/2ac1TN0rjknDAUOkX5c=; b=FZmRbA/BD40qOxoA9pPe
	Qngh35M8bzkQb7zCvP23EX88KCYbL8uvNPVxcaYV9UL8YfKHOuwBlZ7S2ZF2jfqh
	/OCRESN5abnUz4ayTt5Un5tjMWqjy+E5jDF2N1vwsj/bYcD8uLixE4YXrWnuNTC4
	FyZpO5Ow8K4xlcl6w+YdCAto699D5edXaDn622m3vGSpNS+btU+MwSp8sogidOp6
	6ykr13NqlSCYbmpO54PN68vD/xk57XFwMHk5rbvssh/OpWwYYfazIZzFhs8fhHHU
	WsokddYKGT9zB4ovcPxN4tYw0W96n/Nyp+vbCJJ7NV2AVLgK6yuaIUoy9ueW0sY7
	ww==
Received: (qmail 1205793 invoked from network); 9 Oct 2026 15:38:05 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Oct 2026 15:38:05 +0200
X-UD-Smtp-Session: l3s3148p1@V1NGdWhdPu3Desiu
Date: Fri, 9 Oct 2026 15:38:05 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Koichiro Den <den@valinux.co.jp>, Frank Li <Frank.li@oss.nxp.com>,
	linux-renesas-soc@vger.kernel.org, Frank Li <Frank.Li@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	dmaengine@vger.kernel.org
Subject: Re: [PATCH 2/3] dmaengine: rcar-dmac: Add missing
 dma_descriptor_unmap()
Message-ID: <asjuOagHYZUsgg7D@shikoro>
References: <20260917071208.36888-1-wsa+renesas@sang-engineering.com>
 <20260917071208.36888-3-wsa+renesas@sang-engineering.com>
 <aqwXwOiPgRDUQfp_@SMW015318>
 <3odvtlxs62ulw4obrzfy3xlf74k4wltjkj6k4axsmdx3hnyo3a@rx2pm422eozp>
 <arkPcxePb1G1vyZt@shikoro>
 <arkV-ru3aNXDFawM@shikoro>
 <ezlwzpaq54573ewlofeep3zqqajj7ycpanv24ogujtm3alc23l@ehq5obt3bnfn>
 <asizUWUuEdkyKodN@parshuram>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OuIWNwfBYmB2fg6C"
Content-Disposition: inline
In-Reply-To: <asizUWUuEdkyKodN@parshuram>

--OuIWNwfBYmB2fg6C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > > This is easy to fix. If we can agree on switching unmapping before
> > > cookie completion, I can update this patch and then send a series to =
fix
> > > other drivers, too.
> >=20
> > I agree with changing {cookie -> unmap}** to {unmap -> cookie} in this =
patch.
> > It looks like an improvement, I don't see any obvious downside to doing=
 so.
> >=20
> > Many drivers do {cookie -> unmap}, so it may be worth making the same c=
hange
> > there too. I haven't found a specific reason for that order in the hist=
ory I
> > checked, but I'd also like to hear Frank's thoughts.
>=20
> I cna chime in. I think Shashiko is correct here. We should ideally
> unmap first and then call complete. This would ensure anyone seeing the
> completion would get the right data buffer and chances of stale data are
> eliminated.
>=20
> So Wolfram, can you please reverse the order.
> Also, lets document this.

Thanks for chiming in, Vinod. It seems we have consensus now, so I will
work on such a series next week. Thank you, everyone!


--OuIWNwfBYmB2fg6C
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmrI7jkACgkQFA3kzBSg
KbZhWQ/9G+AZEIswluUtbWdW87IO4KmZ786FAgT89CkE1KqJe7xsRjnr1SYgBTvG
3K9AdPwHyBFdNOS3d03Yr6+44fjdIXoAVT29TAw7DLuAqA//223afMGzfgUb7fWR
S2yAdwjO9dIuYvPUIGwra8YEVCtTnTzqSwbGbZ+lqvDSWNap3rZESet3K+lKnTi1
rmqEqEhhtql/6XQOKfRlta6X2xSXJQwZDDVpi/gxG5PmsuhXJ55uHIW81aojFDLo
UBQAY0inosiQxqLf3S+kgJ1v0yGmOTkqh6Twm5ZW3qx/IJtjvY7z/+5Eg/YUyILo
J4sr+siJ940F1sRLLpNm/ZfX9brRuCw1I6bx7V8n4eJPtdZyJMrLQj7lFXRr4E6u
ZjDprA6Xxri6olYh0/7rp/6zHS0O3yRJ1hjEiyIQLXvy4qmhP+otAUJMwA2k0alm
pqQ2cU+CqqibQ0Rej9BpaTQ3RMUSRiafxH6xLpxRr14kELy5+0AnCU+0WtYmcY5J
A4PTSmjcqSdSuEiOdTE0yaiLhx5A83rbDoe+gSa5l5bdb8hDhagDI6jb0HSiOxrh
c/2ZWe8BrWXnheMYLWcAgJFXpbkKU35ZOgspDHBxQBe2I98/wSuCkLrdsEfgu8sT
g89zrcIkJbaV775rJCMrz5sZU6U2mni7Cq7KFiH7g/HE5WhZlN8=
=m/wG
-----END PGP SIGNATURE-----

--OuIWNwfBYmB2fg6C--
