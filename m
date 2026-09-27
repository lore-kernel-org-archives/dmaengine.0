Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A52D3B9937
	for <dmaengine@vger.kernel.org>; Sun, 27 Sep 2026 12:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790512752; cv=none; b=TUdU5oOnlpUCG3bi/M0J6owmc8DAH51D3/OJUgAVeB4ZRUg7m5bLE8aCaFHJtFvbNS+p3P8eKpvrwtBmTEG/0yCG0qVais8XbJzlpKk7uPWnzR13vC9DHpWMcejRIEkM5v/B33ke6TsgdoNoRjh9tb0JaN+AbLbRXh1Vz3hPRWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790512752; c=relaxed/simple;
	bh=lXbT1gZhgqNf0U2ew8DjoPDaP0YHcP00vx/CO5CatQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cqniAtdcaeZBQ3892o6xcr/7eiBXdhWWTBuVXRliNNwBy6K3AYYREpffyaCJfkYOYUXDuisPOejWNYIdeg7C7pFlIik9poILVJ8tXpC/xrw8l7HA5NVNvg65RHQARgv+LBpym+oyM1AVNkGKUoV9JporOmI+OvbxCJxzdx+pkzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=d/L3FmcP; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="d/L3FmcP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=EGu3
	ySMBI4Cxu/RSZ4du9HGuqYJcCtw8FGtZc9o7vkQ=; b=d/L3FmcPugBwWs+dFLb7
	7Bh6c7l5I3L8F+Ti24S/Zqzx/hc2bELaRBjzKCWDg0nlgNxYmJI+B3gBHSihdkAH
	wKciSB0KwbI2yBhU5uZynMTsZJzJ2HvNUJLldSrt+guiISYjlaLTviFZVxLRhS8m
	N6LjRpRLwsyrZ6Hk8OCVPfGpoS+MCAjXbAKd2MfUR45HCUbbI3XS6yD2HiKXbM8x
	OqU3R1X9weq/E38lMQ+20XH74QlmgiHhZJStJSlJ4+IHdgM52i63EjhK6VwfPfil
	cun31o57slwzhvJHsQ6RYB+pklGxiGBS5hPeYpTFdg99wnafqDTawL8ClqSyIR2C
	tQ==
Received: (qmail 2605296 invoked from network); 27 Sep 2026 14:38:59 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Sep 2026 14:38:59 +0200
X-UD-Smtp-Session: l3s3148p1@D2nGO3ZcduQujnuD
Date: Sun, 27 Sep 2026 14:38:58 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: linux-renesas-soc@vger.kernel.org, Koichiro Den <den@valinux.co.jp>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	dmaengine@vger.kernel.org
Subject: Re: [PATCH 2/3] dmaengine: rcar-dmac: Add missing
 dma_descriptor_unmap()
Message-ID: <arkOX14nZOIlrVnD@shikoro>
References: <20260917071208.36888-1-wsa+renesas@sang-engineering.com>
 <20260917071208.36888-3-wsa+renesas@sang-engineering.com>
 <aqwXwOiPgRDUQfp_@SMW015318>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4xQfaWpUBZwoadhw"
Content-Disposition: inline
In-Reply-To: <aqwXwOiPgRDUQfp_@SMW015318>

--4xQfaWpUBZwoadhw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> > +		dma_descriptor_unmap(&desc->async_tx);
>
> Does callback function still use these data? suppose should unmap after
> callback return.

Actually, the opposite is true. Drivers have been fixed to use this
order. One example:

commit 9b335978f7081cd4fe264709599a18073e12fee2
Author: Dave Jiang <dave.jiang@intel.com>
Date:   Mon Jul 25 10:33:57 2016 -0700

    dmaengine: fsldma: move unmap to before callback

    Completion callback should happen after dma_descriptor_unmap() has
    happened. This allow the cache invalidate to happen and ensure that
    the data accessed by the upper layer is in memory that was from DMA
    rather than stale data. On some architecture this is done by the
    hardware, however we should make the code consistent to not cause
    confusion.

    Signed-off-by: Dave Jiang <dave.jiang@intel.com>
    Acked-by: Li Yang <leoyang.li@nxp.com>
    Signed-off-by: Vinod Koul <vinod.koul@intel.com>

--4xQfaWpUBZwoadhw
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmq5Dl8ACgkQFA3kzBSg
Kbb0Hg/5ASvSmkgLfceckvBzpWFx5LMb29upy8SuTNv+0gwJ1I6nOIXRKT//C1If
B44GbwNyVKu77fCxoj7XkogoNZZowe4VfXmxQrALkOXh0BJRSvV1ixWeyQJ5Ojc0
40du86xdFqoHuCy/wWEukTV4E5n+xUWQp0yuxOfVepMuYL7ElPjuLFYRX7kInbhs
lb6DujdN5DFQQ/MtQtipm71j0FuIknx3z2vRdVi27pZCWzPksXMG2bdMq3NXQpco
q8Do0HSMpWdfO/6kGwh6WzIT0H74bq5HUyZr5WGZzzkqJBrdC+gpyYqVyos6Lo+K
Crh9mEBJ538BB+wwlAXTpR+Ar0IWAMsvBd30q/YNLPFBrONRZ3Yr/z2GRD6XLdzv
9Us5E9x7qmC/dh+CzBrbYkvnhQ9nXkmusDjrccVr67cQypVtXHPm+3Q7mRe5usl7
1zOjpTsLTdGYe81qIY2Bzl9tblg8KMV/8Mz9YWaCDG4T6/tsubmwr3U8cKxpDFTp
DHYDlrSHmnyeixF0f0vy651KoQ0HNJafM7BSYmGBU3GcbBuEMGEsRcANq20XBi6S
v3FgPIRo/Agf21/Zwg+6yE4dPjUHaHH4iMqcZXK5oCNywIlGs6+zKp7mA8PnVtny
X67AU9//AFKdrxJMuNqCFKcbXmmilv8tHTTOi79Zipv1Y+3boik=
=erPL
-----END PGP SIGNATURE-----

--4xQfaWpUBZwoadhw--
