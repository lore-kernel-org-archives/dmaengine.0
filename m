Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC5B4E0B93
	for <dmaengine@vger.kernel.org>; Fri,  9 Oct 2026 13:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791553273; cv=none; b=tSuLo19wUgguYNU4zqZhPcwVND4NOfT5OrA6uKYJVBxzRQ2u4BUnsZBHF3IddWrd6bOY3/m5qsKT+d8PqpCmmPOfP3NHENsPDw3LGIrym+V2CeyXlSjLMO7OfUBxjzTEsk1HABmTWXsrGydqup25pXl5il7QLpuSN+z4ia9e0XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791553273; c=relaxed/simple;
	bh=wkHlt8+rosU40H08aV1VWYqgPcfGbNWcxFh8fLQWhQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=myjvLRDDgOG0WlspvwdHzSKf2nfNxPgJYhSGbSCgvDd/qD0tYh6vx/8td60m91kbKe2g7RUHbB6QwP69hzfzav8YP3Q+OAiQg9fa9puycll63ZjJC9D6T92FaxIoTZ+qB6L6YtvXFlbu0zHUFrk7WNIkWiFgTOZ+GKzpryKEEDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=EI8BF8oZ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="EI8BF8oZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=wkHl
	t8+rosU40H08aV1VWYqgPcfGbNWcxFh8fLQWhQo=; b=EI8BF8oZAci7vEYY0+wn
	Nztw9gt1i3Uiutz3WWLbOjpdAwPWzyENcom2rbppeLVGsQ3s2GxLDRbHR3u0KH/Y
	N3Hr15FsPSk0vPh4a1wdYDijOrygXdYY778+CyT/TLmF7WFBM54y6eHPV4RGliSQ
	4BFMRPzZ9rz7+i+DllTuZBJ3CbbLDsko+Ao2A9TnO2Hn5wgkwvSnkxU2bw7YVEiH
	+yHJ0JGbPfm5yZTnNTwlkzpvf1xhprZy8uO52zgNTbDmWDTZ/23Rbs1OQsSxUHbm
	uMFByk6flLHhFruKGWcqW1vcuQhLqwBh0r7A1gDdGA/uJb4d29ApPT1xWOkK9rl/
	nA==
Received: (qmail 1206804 invoked from network); 9 Oct 2026 15:40:57 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Oct 2026 15:40:57 +0200
X-UD-Smtp-Session: l3s3148p1@WCd7f2hdCO3Desiu
Date: Fri, 9 Oct 2026 15:40:57 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: dmaengine@vger.kernel.org, Frank Li <Frank.Li@kernel.org>,
	Koichiro Den <den@valinux.co.jp>
Subject: Re: [PATCH] docs: dmaengine: clarify ordering rules around cookie
 completion
Message-ID: <asju6IYOe5BHcslj@shikoro>
References: <20261009093745.539924-1-vkoul@kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5WETxe7mqkSjZbOz"
Content-Disposition: inline
In-Reply-To: <20261009093745.539924-1-vkoul@kernel.org>

--5WETxe7mqkSjZbOz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 09, 2026 at 11:37:44AM +0200, Vinod Koul wrote:
> Sashiko pointed in [1] about the cookie completion order. It is good to
> Document that for ensuring that dma buffer is flushed and no stale data
> is seeing by consumer, we need to make sure such action is taken before
> drivers invoke dma cookie completion.
>=20
> [1]: https://lore.kernel.org/r/20260917072507.5BDB61F000FF@smtp.kernel.org
>=20
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--5WETxe7mqkSjZbOz
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmrI7ugACgkQFA3kzBSg
KbbVJg/5AaUp/Eu8TwbqSUGdF7onO3Q5JstaGxeA/ds/uv24RG6GTvvJYEMvO8ga
6J2u/17+87wr4ut7hdLmNvt2tb1wxghysRzzyUdgNvJXWWmzQRh+lVLD9J8dv6r9
Y4M9qUWQm6eTkLMbTmJf21dJ8GvePPs3vVnOjz5JaifwlNrE0ZGqmJEXe9T6YLJl
yIsp4surcyB5oPYXpmdzeDSBcvQvVA/SkuAXXJTJgF1dQJnP/Xft5JsPyTpi1xGe
+tfJ7/j1VrubuOzyJjKLG7XCHfPHjhMHdHGKcbn0Ix2NWfxBffCD5ukUOHV8glv0
RSWZIWow5X2+ogkjYVmI5IqRczBBNHLJBV4Vx3kqWZI+uaqbWPLdMigPDoMxy4Vc
CEXt218fszxoVTiJ/dWRg/lOne7HnS3g9p5CskF703IXxCSYRI2pcdk3kxixbcJi
c/m0fOyCmwRVDq+7H0uDuhGbyzaLDfBx2T/qluPUbIWJJ57ZhRqzoqIQEovt+lrG
cEusRkGAOVQd7mhAK8gxQXcM6HZ7biAJoymd6COyjzhKg5AMnGmWRZ8JJtkhlkdH
E9AesnurdvxsEOp3u1ICDeCGYkVjT95Zc15BUvxJkHbzILgTv+VTFRdERPuKNQSe
Phtp6Nnp1xhnMabbtvzt5rOHFUOX6ZAwyqkum+vo8ZNYGO3LjB0=
=mree
-----END PGP SIGNATURE-----

--5WETxe7mqkSjZbOz--
