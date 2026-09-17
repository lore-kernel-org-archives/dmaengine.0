Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276D2429CFB
	for <dmaengine@vger.kernel.org>; Thu, 17 Sep 2026 08:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789633409; cv=none; b=I0+RlNrUSLOX+9rjnrnTBC0niKXaIEcnfAB5igSBD1PDC09T2f0beoIANvz/qCDNKcK1fU4nJXfVCoyOCYMmCpBZIJ64y/wGfaNFSBAVXb1iForUZVEasEqpuesKTKJ6RHnpEVpokzbuY6Dquor5S3d8lIFejTuSiS2JVVGc0Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789633409; c=relaxed/simple;
	bh=ozlPasX8P+4BiqJfuQBxSkRBNiQCjbUcr+uITbfRvTY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UFfPSEJAXuGJ+tn8tHi/dd+vFfBt/SDwQuql7NE1X3GPzrXGSTAY+HH5gtiGP13nIp4KrM4CBhmr4R+59f8byQJK1QfgwV743Gzs1T00PnlIqybG78EPkIhTr4qHMd+jKurQJ9R46589TxhHMk8c4JmOEbat2d9Y5B5LfVyz3kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=BuXV+9U5; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="BuXV+9U5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=ozlP
	asX8P+4BiqJfuQBxSkRBNiQCjbUcr+uITbfRvTY=; b=BuXV+9U5IJAKFZYD15Vp
	iQucFX+GKXVvy/ydgP7/7YTPfIlDW9m9N344Cbr0tjdQKxGd9OEVpIBlgNnehmGP
	BDTvA4ZaiPu4Xb7pT6spKXRFG+gJGk6duuzB9/6YhmsxLE/ZqMi0CKAh5Vyw85Iw
	Zpcul+FG7YdprmMn3MHh1oCLlws/e7yPcUbIlRXBWINSR/XGy/4KoBHnELmO9zdQ
	1qPGd2SEAKu+usGuvHDJZZXIWDcLXfWs5K0w95/+E8DIa3KHTLWicAlzBxL4kWPf
	qd90xqvzYKxZmtdXiO/pww/Josvwyg2aIg/+4VsOAtNfAL0VZUmClMYxQA/qpQOO
	Wg==
Received: (qmail 1915165 invoked from network); 17 Sep 2026 10:23:08 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Sep 2026 10:23:08 +0200
X-UD-Smtp-Session: l3s3148p1@cWVmfqlbAMAujnsL
Date: Thu, 17 Sep 2026 10:23:07 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, Koichiro Den <den@valinux.co.jp>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, dmaengine@vger.kernel.org
Subject: Re: [PATCH 2/3] dmaengine: rcar-dmac: Add missing
 dma_descriptor_unmap()
Message-ID: <aqujV8TrgdiZJdEM@ninjato>
References: <20260917071208.36888-1-wsa+renesas@sang-engineering.com>
 <20260917071208.36888-3-wsa+renesas@sang-engineering.com>
 <20260917073825.GB4019@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vOsYjcL/nMUoWmob"
Content-Disposition: inline
In-Reply-To: <20260917073825.GB4019@killaraus.ideasonboard.com>

--vOsYjcL/nMUoWmob
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 10:38:25AM +0300, Laurent Pinchart wrote:
> On Thu, Sep 17, 2026 at 09:12:07AM +0200, Wolfram Sang wrote:
> > From: Koichiro Den <den@valinux.co.jp>
> >=20
> > Call dma_descriptor_unmap() right after dma_cookie_complete() in the
> > threaded IRQ completion path. Without this, streaming DMA mappings
> > attached to the descriptor are never released and may eventually exhaust
> > DMA mapping resources (e.g. IOVA with an IOMMU or bounce-buffer slots
> > with SWIOTLB), leading to dma_map_* failures.
>=20
> That looks like a horrible API. It pushes a requirement onto drivers to
> clean up something done by clients, and is completely undocumented.
> Can't those calls be moved somewhere in the DMA engine core ?

In general, I agree. No bandwidth for an API cleanup here, though. It
affects multiple drivers.


--vOsYjcL/nMUoWmob
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmqro2YACgkQFA3kzBSg
KbZNexAAmZt9mbpeCoHldVgrF/NB1pFMNq5jk3km/CVfcjeik4xXCZrcq1VkCf0O
uYvX5dJ3aAiTKgkcj2OxeVyb4MSTW/p1L4SLtVLqG4EV1uNbmF7sWg8R0AcFNExj
zdB6tZ4aRxze42ViwOhHQfUexlpTTUFJxQsq2e+Hkb1Hv9eIbIUgP6h9U/4JcSh2
C3Wni/Ddv1exsmqWAa1x8cyMYfJUJOqHPjzeIWyqyFDVf0Pu4CSBi0g5kEPC43U4
XCCT1OJrwlYNnRIm/jt/eFJHdw4t4yVGg9pNs/fsePu4MNgTLtDLZ7crMeTf0+Op
vih+w1CbBcx+rzlQY3mHB+cpJNC9SUQKhZIQ21pvZvXCVPhK0aD8qjrczmHY4NFC
KdAYKCnWwGENOwEZK9YgcrXcZCaoarTKEP6cZ6dHug1aEU+2x7dAf+k3wUshF5bb
27vqO8my5PX9HkNs0mHBiE6/qrwsux0BbpOupxr+WGxc8n+OivhS11v84QyIvoCo
Ea8+XimlsV9EXyLG66zHdyMZVPmmO6yVBAc6RwgY68cxo/f3GxdwHTpm9TwdOOax
7sFXuN2I16pBmXhkvApiiUcwfzUdhKjNnmUQj1qIji/X+2Z8JKgwc4duY7rWK19F
JGLEUOEoHr8kMZgeP/ZxKwv5E1T0FUko5JvxhoXrHGbmKl9Pskk=
=+Ojj
-----END PGP SIGNATURE-----

--vOsYjcL/nMUoWmob--
