Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF733EC69F;
	Tue, 22 Sep 2026 17:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790096668; cv=none; b=AgAzELGkU0rXMy+qCx4xnc4OfFE19V6aNn7zzfAaEPUFZyqPJaGHKbxYnJFJtTZVauhrAdAfQVIXcln8pILrq/qo/Uy4udRiJVAKgtVIGF9a+TGM6uNtt2ubXhBqDw5ulNj+U3lSpbCnUsQCb5MJ8o4vVzS8nLT/G3HPP2ZIdbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790096668; c=relaxed/simple;
	bh=ryw1ckC0LyGtXZnUSGqqdSw6vPzJYJA+e+eu0aiWzDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hkq7Vh3U/QfPKTY7K++ZuuWtzt/Fxlo9hvvaXds2OFIaysNUX8kUzmabKljt1HR7rjyXzHypviD1SZJwPPq1JAJCLePLJCKenBvQnGvnzkxuQi9KFTsejGyLWxKf1KiqtdLpyDFjr1JXmS+9rMTHBlfCm7KBOAy8+jWN4Qw7GTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LK58FBno; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LK58FBno"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81CFC1F000FF;
	Tue, 22 Sep 2026 17:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790096666;
	bh=ryw1ckC0LyGtXZnUSGqqdSw6vPzJYJA+e+eu0aiWzDk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LK58FBnokT4BZd7z9MJoSe+sT22fZ4uH11pNVyD5Mnf8sptKicd3R4Zy+yyywjppT
	 J90leobk6npQIuX5A0tV/IzBrkt4ZNNTa243Me6IPtmqpiqe6ofOajL93TiDPqXRX0
	 2OnMiHswX+S0rOndPrdHpznYnCEDLgnxjfZSFEBlEXgEMM1dUVsFti5Xm0slJ2lrgd
	 HxAdDBlD5XtmyX2jQ5+ln5rKRBYM28oPRj6AViczIoSJd9L9szwCYaGRYxxWhP8+De
	 I63x0txaW69cubtyDEF1Hd9JBWsiGVKOjk/J8WgRotBkoq/Xv/hjdFDWO5/y0wMGkD
	 LE6F0fBW7CD3g==
Date: Tue, 22 Sep 2026 18:04:22 +0100
From: Conor Dooley <conor@kernel.org>
To: Jelly Jia <Jelly.Jia@cixtech.com>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	Frank.Li@kernel.org, robin.murphy@arm.com,
	cix-kernel-upstream@cixtech.com, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/5] dt-bindings: dma: Add CIX Sky1 DMA-350 integration
Message-ID: <20260922-perky-absently-2590fe901176@spud>
References: <aqE42NzerAiD2U1E@squawk>
 <20260920051501.3620794-1-Jelly.Jia@cixtech.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5dgaYu8dXVKiJatw"
Content-Disposition: inline
In-Reply-To: <20260920051501.3620794-1-Jelly.Jia@cixtech.com>

--5dgaYu8dXVKiJatw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 20, 2026 at 01:15:01PM +0800, Jelly Jia wrote:
> Hi Conor,
>=20
> Thanks, understood: with the SoC-specific compatible scoping the
> integration code, other platforms are unaffected either way.
>=20
> For v2 my preference is to keep the wrapper, since it leaves the
> generic arm-dma350 driver and its binding untouched. Does that work
> for you, or would you rather see the dma-350 node itself carry a
> device-specific compatible, with the clocks, resets and
> memory-region described on it? I'd also like Robin's take on the
> arm-dma350 side before restructuring that far.

The latter, since that's what we do for almost every other device under
the sun. Robin's take would probably be worth hearing, but you removed
all the context while replying which makes that more difficult...

>=20
> Best regards,
> Jelly

--5dgaYu8dXVKiJatw
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCarK1FgAKCRB4tDGHoIJi
0lGvAP4lmnDtOzTWLgbDhWbJVyNZ2BlGz/EtLftum4ZCqwvKLgEAgauaEkmh9CkC
pA8yWGCGYUl0y/3PxtT6G5PsRZq1Agw=
=X7Es
-----END PGP SIGNATURE-----

--5dgaYu8dXVKiJatw--
