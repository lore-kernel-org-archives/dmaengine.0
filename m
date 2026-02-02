Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BB221CA13;
	Mon,  2 Feb 2026 18:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770057953; cv=none; b=DFUBU0TGVKQi+5F8IrRB7Fe8Met5kzc+6xWOBggUju1aW8pSrB4Kg08P5J6yOk2ix3/h/Tkuu4juoSD4EFnz8AnS2hc/22K/9yBYId4BtJnu7SmfC+KhpatfzKw+SCdaFtBv2niotHPnUWiGtVteD1LdKkBlE8zxJlUTqopE6wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770057953; c=relaxed/simple;
	bh=w9fEMFRuXt4bLoNYBgu84vspuJCQeNFA4lzpt8PqkZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rpsrUXF3SRvIgS+Nja8UIq4Du89VySCIHU1zU1FM0aXAekzqabpkJ3Ra0m8yvyI0DTTLNtM71T1AMsRBH2uMx4PgjE/VV/KirL4gwnDKJWnUB0rGoPG+rkDigrOvXVaOZ1Lm96e8olAJM62WEhKSJhKnFrWdy9i17gbtTdXsf2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LaBWYj6R; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LaBWYj6R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEE7EC116C6;
	Mon,  2 Feb 2026 18:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770057953;
	bh=w9fEMFRuXt4bLoNYBgu84vspuJCQeNFA4lzpt8PqkZA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LaBWYj6Rb9it+LCAcZlOiR71LI7iqfKflVNOp4sCQRrfCkCQ8XoCzTnixteUsSo4y
	 8T3uKT6FhNCp3U2AG/D4r+DRmeyXEbO8aU5CKqpjkNsMCUZ2asBprgcjFbt620UQM9
	 bp2yr3bgfRPXW2FS7BUe8GcOHx3+FyMsnC3iGMr9VmPB1uTMC/0v0LVhzyAvTUu293
	 f78BUS5n4pKeHNcg+VfEjLnQhpiBICate68M9Dsb7BZoWgJdFymtik4Nwq0Wx6c3sx
	 IN2WO0oac0USXLXtA66bp0/r0h5Svdyh1bNXd0xf2oRVq4kMxRt+39sKopqAwpPsaQ
	 BGCFM4SLJkKGw==
Date: Mon, 2 Feb 2026 18:45:49 +0000
From: Conor Dooley <conor@kernel.org>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: Eugeniy.Paltsev@synopsys.com, vkoul@kernel.org,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Khairul Anuar Romli <khairul.anuar.romli@altera.com>,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: dma: snps,dw-axi-dmac: add dma-coherent
 property
Message-ID: <20260202-stylishly-chaffing-0aab46b244d8@spud>
References: <20260131172856.29227-1-dinguyen@kernel.org>
 <20260131-subtly-education-e13320fe0486@spud>
 <f5183a72-6ea4-4d68-b136-f6d83a36493d@kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ONpJDlJfgSt/Ps0o"
Content-Disposition: inline
In-Reply-To: <f5183a72-6ea4-4d68-b136-f6d83a36493d@kernel.org>


--ONpJDlJfgSt/Ps0o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 01, 2026 at 01:30:59PM -0600, Dinh Nguyen wrote:
>=20
>=20
> On 1/31/26 14:27, Conor Dooley wrote:
> > On Sat, Jan 31, 2026 at 11:28:56AM -0600, Dinh Nguyen wrote:
> > > From: Khairul Anuar Romli <khairul.anuar.romli@altera.com>
> > >=20
> > > The Synopsys DesignWare AXI DMA Controller on Agilex5, the controller
> > > operates on a cache-coherent AXI interface, where DMA transactions are
> > > automatically kept coherent with the CPU caches. In previous generati=
ons
> > > SoC (Stratix10 and Agilex) the interconnect was non-coherent, hence t=
here
> > > is no need for dma-coherent property to be presence. In Agilex 5, the
> > > architecture has changed. It  introduced a coherent interconnect that
> > > supports cache-coherent DMA.
> > >=20
> > > Signed-off-by: Khairul Anuar Romli <khairul.anuar.romli@altera.com>
> > > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> >=20
> > Why does this v1 have an ack?
> >=20
>=20
> I respun this patch based on the dmaengine tree so that the dma engine
> maintainer can take it. I had originally applied it to my tree, but avoid
> potential merge conflicts, I'm going to submit it through dma. This patch=
 is
> the same as this[1].

In the future, please note this or carry on the version number from the
series it was originally in.

>=20
> Sorry for any confusion.
>=20
> Dinh
> [1] https://lore.kernel.org/linux-devicetree/176488420978.2206697.1120129=
2177123636920.robh@kernel.org/

--ONpJDlJfgSt/Ps0o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaYDw1wAKCRB4tDGHoIJi
0tCqAQC0i9L1Cd7mMCdezz1op2+KtP+pK5Pb+1clPCRLMSktSQD+IY9/aLpmGtyP
kt/9CjLjlnRhEvNsTQyp9M9xx+e+3gc=
=ocQH
-----END PGP SIGNATURE-----

--ONpJDlJfgSt/Ps0o--
