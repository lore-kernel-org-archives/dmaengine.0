Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57114F4D11
	for <dmaengine@vger.kernel.org>; Thu,  8 Oct 2026 18:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791485217; cv=none; b=c2uQZJW4vNImZDlLnfNtxsSn20KKCYn6rB0e3s2cdkuH0vB4MOgxLS7WlJshs9JMOh5kR12ixXXblcBPAj9Z9x2kJN0r+z5AKJsvgoy1fRsRVxjc8W3Ui+0zNAG3WM/jAYJ93FRWx7dMf4sZuCQPDH7BRAz11i67kRTx4kZKaVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791485217; c=relaxed/simple;
	bh=WqUMFMPWZ746lMssxYdDiHwYphMtVzEwwCmluHImrxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SGFNz/ZTOwMj4Fw4MF83Rnq/dlg4Bh47O89VrwzIjIApj95MTIvLYLWVlhfhuxrXFu/YImfC6B+F1dFGjiSLtlDcHWcBsxUHuVtcMvthWtyOpyAGVNBCo/yogD/NhVyK8CsJk4r+BWv0TrecY0XFv2HgvDIRcUzjmqlIOXaCodE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=fym3bOV5; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="fym3bOV5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=WqUM
	FMPWZ746lMssxYdDiHwYphMtVzEwwCmluHImrxE=; b=fym3bOV5SNdgJdg5WnnA
	3R4Aw8nE/L3VuD1g9ikUnccSIC6ox0UVfUCFJ5kmsoSVvpKMwunqNy0bHw/I4aRA
	fJeqyXyFbBVYyUbnzu5FpCVqdmLkZSnoGVze+jDgIhOinwupAKs5CmQpwscB2f8y
	PhRSv/vH1xBs9aPkYfJoCOCyMrW3eO6bFRbNKeojAkUOwPdFti8yoGTw/pSsWqzs
	U6NW2lBZaBGCcHqY+Gm41YTQLsT4YFhTvEDAa4VaegmdHPU/LhNOBcuIKcFofUcs
	WO3U49iXOasp8EjqKck8UD6MOiiq2xNDmCxExM3vBXPwIx3GWPjglt4posoM4JtB
	Og==
Received: (qmail 862361 invoked from network); 8 Oct 2026 20:40:07 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Oct 2026 20:40:07 +0200
X-UD-Smtp-Session: l3s3148p1@YqeNj1hdwLXDesiu
Date: Thu, 8 Oct 2026 20:40:07 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	dmaengine@vger.kernel.org, Frank Li <Frank.Li@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH v2 0/4] dmaengine: sh: rcar-dmac: add R-Car Gen5 X5H
 support
Message-ID: <asfjhlIEVX2P1xya@shikoro>
References: <20260909094009.2167-6-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fjv2SOTvqNyKNWTR"
Content-Disposition: inline
In-Reply-To: <20260909094009.2167-6-wsa+renesas@sang-engineering.com>

--fjv2SOTvqNyKNWTR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2026 at 11:40:09AM +0200, Wolfram Sang wrote:
> Here is a small series with the needed driver updates to support R-Car
> Gen5 and X5H for the SYSC-DMAC. Details are in the patch descriptions,
> but it is all small stuff.
>=20
> It has been tested on an Ironhide board (X5H) and a SparrowHawk (V4H)
> for regression testing. The testing branch can be found here:
>=20
> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/x5h/i=
2c-experimental
>=20
> The patches here are based on linux-next as of 20260908. DT checks have
> also been passed.
>=20
> Looking forward to comments or approval!

Every patch reviewed and tagged twice (thank you, guys!), no complaints
=66rom Sashiko even - can we have this in 7.4 pretty please?


--fjv2SOTvqNyKNWTR
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmrH44YACgkQFA3kzBSg
KbYuPQ/+M5/jRv3uKEzc2vj5XCf0ehBO4E/vr01TuDrEhOAu6EnIyQKMUcTiSSEA
+6jv9iTq5GIK7bKBaQZ9MwuYe5Ed46CLbywxV4qErtFPD/Cr8p+KDjvFul+gu+cI
Yvvy3PJmz2k0zE4VWZqR+8dnBykNP3CRhvc2+yKO1YwiES+nfATAYfAUaxRiBqNV
sfDF7Q+Ct5DPAB3j10pJufKdTDoYwCJ3CFCb07BIkZ8YHYCyLqtxsx4HAvap59SL
KrPeB/Z1xYt6SMyiGON69L2zWZS/VrQtM7ZUXgvnRPjugC8tLx+qpU69wjl8tppV
8sRcXUrso0IguwqcbTKZ5tXDTEkJVZS85uMLBXF2RtMrvI4NLgh5vRnI1urjQV/I
Z+7/A5aJfoVABS6R6iLEw2KVGMAN51WU5WTRmpMzWNoAxfmVzH12z89TsAKf22ij
FKGXCQ7AZFVXJZXjVE170Qq3GqGZdVNPR6rrzmPq7N2jolCUYcjHEPIRMOG8hIoV
h+TtRxNXwacskIg1FC7UPMspFXezoJkuy//6HaHBayAZerST/DxrCurmr4+cO/NM
ZSVNtU4jXPz8/eyxFWnIBsdx7RwI1WzFIwIjbIXs0UMyPL69fI2m0iLBCW+Jg6qZ
IFeDE/QCRPv/ikiWAFpInPqiRSeVftQZInLKPD05HCNmSMT3nWw=
=/9FF
-----END PGP SIGNATURE-----

--fjv2SOTvqNyKNWTR--
