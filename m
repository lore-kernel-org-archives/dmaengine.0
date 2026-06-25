Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB573E2751;
	Thu, 25 Jun 2026 16:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782404523; cv=none; b=mlLtzOwNFQNpg1a07rOjR5TWtvUf7uyaI0wsXxaHJ+Cp6qIAD8CqKdQDNJzzedMltslWlXMT4rJEumpoIx6NQRU61JLL77hALxyK0/rCyWTuU5bzYbqnDs5lxWUs371XUUhOVdnckrCocKyqTN3mhghq57VCF1aIYBwxix5S56c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782404523; c=relaxed/simple;
	bh=5F4KQo/LXvQMJy9qOTC9S3grc/gHruRxFqZpg6KBf04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n3XnusCT9MMjptJ4EPj74i5CejMxn6Jdw+EWZN6fVNjttHO76gsw2r1qMcq/PKswaidmlW/flR+oQL0ZsQdXlPgjKuiE39ygEAMopiXwYL68AdTya5NGMn+LXPX2YB8lYpL0/wllgBVSxXZg4ISr51FYj5rkgKaGT/DRfA66VLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CPb2stxq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CPb2stxq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41F871F000E9;
	Thu, 25 Jun 2026 16:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782404522;
	bh=5F4KQo/LXvQMJy9qOTC9S3grc/gHruRxFqZpg6KBf04=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CPb2stxq2fbb5nyx10ATYrdvRljtwQNBjpQPpbtK+MDdx5+qmjvZi3vjTeKoRNsDf
	 U5nEbMn4qJKg3LoBsM1BLKS1hLFOrn+QaOM0vf3ESt1y3Rvryi+JK/oTCoJNX0bkVF
	 hZKGcF5KwypW+/Bs9zKlYxLP4D5e4UYCUQb6t5al4mZ0vMUnUV3Zxb6IScXf2OD1p8
	 e16imCYj9iYV/76yz312gV9GocAk/EO86j7p+3JiW4i1haku3JoeLoNSkK17yBIoqW
	 3awiBgZTF/0ee0CcGpUrzr2ZeoU52jpjL9SNdmNEzhzRYGOQwhcM/+JU3zRb/CSYqz
	 4kKCi2MeX95Sg==
Date: Thu, 25 Jun 2026 17:21:58 +0100
From: Conor Dooley <conor@kernel.org>
To: Suraj Gupta <suraj.gupta2@amd.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, michal.simek@amd.com,
	radhey.shyam.pandey@amd.com, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: dma: xlnx,axi-dma: Restore xlnx,flush-fsync
 as u32
Message-ID: <20260625-deviator-wobble-61d333ac6f49@spud>
References: <20260625161016.1249570-1-suraj.gupta2@amd.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xYKvzKvso3jUBxOS"
Content-Disposition: inline
In-Reply-To: <20260625161016.1249570-1-suraj.gupta2@amd.com>


--xYKvzKvso3jUBxOS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--xYKvzKvso3jUBxOS
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaj1VpgAKCRB4tDGHoIJi
0hBYAQCNVVgdgCzxxO2gAoULpvUyskuiTrcqKn/RmNfGzVdb9QEA5Ne9VcnFMY3O
ywb2Y78gEz2yNU+2gRTJlDk/4KUtfg0=
=4B50
-----END PGP SIGNATURE-----

--xYKvzKvso3jUBxOS--
