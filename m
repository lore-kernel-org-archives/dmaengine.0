Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50A13EF66B
	for <dmaengine@vger.kernel.org>; Sun, 27 Sep 2026 13:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790514691; cv=none; b=s3LfaoGkD8nk8k4VJGNDVKQ7LqcZn8b8PBvTSGSgs3G9UyG5AXSNCjfNpXpQKVfUcdwZweTrUS6gDJ1F4P0yN4j68487QI0k58s104ZDOYf5EQj5gn6L6g256la2/l3WSy4MWrq4JkhuCosDpS6c5D9bTvJL0BzYdmfv4cBkeVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790514691; c=relaxed/simple;
	bh=HqmxqaFcjaW8dVsH6dq9iWXg4vsbd9ep12D9PWT+0gQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DsI6GkqKbTtoXvfeKmyihPyWqNnoq0wT/iVEI4gC9fSBRqghftMUKR1UWdmTgxWCVf6XvQuEu2mMXGYQhlBm1eo1/N8BCmTKIjdypxLhpJN0qyD9zwziooBw93zKXA61gusaZcC4xmYqQN7+eZfdSbS9ep2/XA9OYk/qaXKRbRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Y+OHHDMI; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Y+OHHDMI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Hqmx
	qaFcjaW8dVsH6dq9iWXg4vsbd9ep12D9PWT+0gQ=; b=Y+OHHDMIaZr5KoFuA1Uz
	slcQ+3RExcgEefqj6nmShUcI6fGVG7ARzMawJplccGuE1RmbXvu261CEvRZOJqGr
	GyUYgd+CkQ7fVrIczCg9ixNirFvajnChYVNPEo079mKA8GwhJYYAjzfbBNnxEkwF
	ZzYAxRkAZH/oUZgsyLa1IrMYZNHe7P4YTV59Kn8UmoG/de97FBNutzSt0FrIYJTr
	zuBcWeHwGP5dCH8FABN3CCd9mewwvAOG/umh1R4N8Sdxhox16RbUr7JtF+PjzeTW
	arxsU4jxE9LpzczNEwHd+C9Q914bdcl1O7G9xJqeJO6oaIfwAIJ0IRTdqDaUCtXr
	gA==
Received: (qmail 2618794 invoked from network); 27 Sep 2026 15:11:26 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Sep 2026 15:11:26 +0200
X-UD-Smtp-Session: l3s3148p1@3unXr3Zc5OYujnuD
Date: Sun, 27 Sep 2026 15:11:26 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Koichiro Den <den@valinux.co.jp>
Cc: Frank Li <Frank.li@oss.nxp.com>, linux-renesas-soc@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	dmaengine@vger.kernel.org
Subject: Re: [PATCH 2/3] dmaengine: rcar-dmac: Add missing
 dma_descriptor_unmap()
Message-ID: <arkV-ru3aNXDFawM@shikoro>
References: <20260917071208.36888-1-wsa+renesas@sang-engineering.com>
 <20260917071208.36888-3-wsa+renesas@sang-engineering.com>
 <aqwXwOiPgRDUQfp_@SMW015318>
 <3odvtlxs62ulw4obrzfy3xlf74k4wltjkj6k4axsmdx3hnyo3a@rx2pm422eozp>
 <arkPcxePb1G1vyZt@shikoro>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kfKRMEYJsowOOtOu"
Content-Disposition: inline
In-Reply-To: <arkPcxePb1G1vyZt@shikoro>

--kfKRMEYJsowOOtOu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I share this thought, and I guess, Laurent expressed this, too. This is
> a separate task to tackle, though. I still think your original patch
> here makes the situation better by making sure the cache gets
> invalidated and should be applied. Or am I missing something?

Okay, I got now that Sashiko's comment was related to cookie-completion
and not the callback. For me, its comment also makes sense because it is
basically the same argument which the commits I quoted to Frank used:
ensure cache completion. This is not only good before the callback but
also before cookie completion. Or am I missing something?

This is easy to fix. If we can agree on switching unmapping before
cookie completion, I can update this patch and then send a series to fix
other drivers, too.

Opinions?


--kfKRMEYJsowOOtOu
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmq5FfoACgkQFA3kzBSg
KbboqBAArClYuEyLNkGWdRkosLHFmpCs3RRXNrgtUd70azKx/Wq6lEXKlj0RGiK2
ARjl70KU2k7Gb1+M59VVsb6Tqq0WhR1NOgzSh3YYbmGQaLKM+DQlWJQkbOO5/fN1
Nkym8HiT6rFaByAttJrSOc+6fA2xvxqYbYBTYRQmKIyrM7Yq/Zi7ZXWNZiI4pRVe
QRT0gR71TiNv/kVS+q7ijzzlux73OtNGj1Ji10rne7ycZAnl1KrAQ1JRjO1BIDrl
xsFLo3PWr8v3VX/qM2WfewJGJnjGscKALDMNl1K27iR6QjR2RGi2wJ4iLFDj+cmp
8nNgdVhHAcwCfp0d4a2kXDkLHUWilrllPGmY9SlrPahJHzkuuExS9OOd+nLonfLX
HniUnMFo9Gehe+JdufmQ5qNF5zBF7AUBOVHs2W6XUCUyHmQfZ1ukVwcoahU4vVIz
Awm2BzARzEny+7bHwqW/EGdCCuViU7kj9mKVO+CS3TVNEDqVTXme6nLRz2K0OKvZ
m2XOqVpJIMLGk+33qhgtxpcTctXiBnqYd4nXesaB9b64FKB2q0d/LJ1NfEkdxHAO
mkHcffynXQL2uhMBlQHB5W+zdD/Ssj4OJzIqbcEMd8ZN8hp+998otXZpfcYYULoH
BlThE3tLxwXL6U3YHqaNltTUj4h6RpfBy/frcHyT0+V9FDz7Wz8=
=2C0U
-----END PGP SIGNATURE-----

--kfKRMEYJsowOOtOu--
