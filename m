Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D1237E5D2
	for <dmaengine@vger.kernel.org>; Sun, 27 Sep 2026 12:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790513016; cv=none; b=j/1gVkVeL2BDrBQKB8+p06p5FKAdj55i7GKu1/TOKb1piwurOKV9Rx7EMvvxcKKAy14kwnXtUzPmrurQxDgfKTJZBYGjdj/KIIkBys81lIHzy9vvmUmCcMEvQehMLf3kCuEh8lLMRzSAuN5I3aO+yr6EuXvjeglk3esRvm3Y5HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790513016; c=relaxed/simple;
	bh=RJxJYXaQJ4o571dsAf5kfmA0YEOSYHuN8V/EI6U6FR8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oHLn31XrnTV3Zxp6Qi0wQxiI7T/lGx38cTtBPP7vKeI9VI6oiiJTupxV6s8evhpV1vLfSTKHuk/nc8YgPFzKtlnjABF5bRV9dDZaffnBpOImWx2KSWRAurXRgZUevXQOa+nkSP3MV+QcuEOvzFa2U1k+o6hVqRl7WgoHWn/Hb1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=FBGNkhBy; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="FBGNkhBy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=O6pz
	eO2/1NUWoPcH0yvHjuJycDHC8pFB6mw00p27a7k=; b=FBGNkhByNvRBLzcDVEZN
	e6yHkKXr7cNkLsrOx393efd9rssQzoUoxaVCCbwHXg3IUf/R7+pozak5AnvEDVRN
	oSeYz4p5p4iT6dyOQ7ZefRRKoZeGmaDJ4fZd+vmU+XFzT/sHwLosZs051Ldfkp5Z
	O+jsTiVXE/rp7XfNsVkBEgmF8Lj0sn5NlDQPJu9nFhXWo089Jw9dMxd2PGXuc3lq
	/mOBMqavjHU8PcWIkKB1tnrjeldsaxisPjuo9BmXhe1R/SOSvua9pSZSE3ZWYBDk
	vylVL2aR/M87vIWdyOjPsYfRto3n9HnsQLIeSLok5tMH1EWlnr+yZkVHDmFPa8cj
	YQ==
Received: (qmail 2606946 invoked from network); 27 Sep 2026 14:43:31 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Sep 2026 14:43:31 +0200
X-UD-Smtp-Session: l3s3148p1@9kYFTHZcBsoujnuD
Date: Sun, 27 Sep 2026 14:43:31 +0200
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
Message-ID: <arkPcxePb1G1vyZt@shikoro>
References: <20260917071208.36888-1-wsa+renesas@sang-engineering.com>
 <20260917071208.36888-3-wsa+renesas@sang-engineering.com>
 <aqwXwOiPgRDUQfp_@SMW015318>
 <3odvtlxs62ulw4obrzfy3xlf74k4wltjkj6k4axsmdx3hnyo3a@rx2pm422eozp>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4bgaCHnQSGDw6wak"
Content-Disposition: inline
In-Reply-To: <3odvtlxs62ulw4obrzfy3xlf74k4wltjkj6k4axsmdx3hnyo3a@rx2pm422eozp>

--4bgaCHnQSGDw6wak
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Koichiro-san,

> actually fine, but in any case, I personally feel the unmap infrastructure could
> use some cleanup.)

I share this thought, and I guess, Laurent expressed this, too. This is
a separate task to tackle, though. I still think your original patch
here makes the situation better by making sure the cache gets
invalidated and should be applied. Or am I missing something?

Happy hacking,

   Wolfram


--4bgaCHnQSGDw6wak
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmq5D3MACgkQFA3kzBSg
KbYhAQ//VA2nnaFKR847DEFKEgRBILdXZbZcUuDOkVXJjLNj6F3yDXHeRNlBiPUn
EptAYSXL4D+uzU9x4guWs5yt7FbeyseKPBW5EWF2i7JCOzKqyRcJwpjC2PbTXTbX
EHuIDRCDuLEu2n2v7qatOxnq3aEsfO699Bn7JiL+x6FicX+mJa90tD+GdpQHiMX7
RsBmxLLI/83pgG1ZwItZtoCRcIX8f3478XnmYhGdhuARsuQ+6UcbPxX7mUwZZauE
KIpkkG6wKyCAx+dMrxDPFHj0d10RKMbaCTkjDJv+8dB+IURpuO7uWe/HVKum8FBf
WufPPa/phA3n9EtTnPHbDU8+uQLqwaGuOPYXUfgqPbqE0LJQilRXPRsdLBGbDZuP
NZmGHIwIVxpOkriR/TQSO5KJjzwMQWt7cAJsnX/+Tnu4oPdo1a2yNTeOvpvlIEtQ
VuW8yRCzmpvPYWQkBHETLGqZC7+vGlcwf5FzCGouE9Cfu7srn4mK9G+ykvurbD2O
cYseKQwV3lb/p97OdHED5UcpF9QUGw6EEuy4pXDFgW7pnGsllqUpmSQ41Jtf+8f9
9htk3ILskGxKn6KhFaSkFLuEFuzH/ZtVpN++WySM+6z0kaqEJdhRiD5ENADWJLfJ
nGqgXR4ljcIAgEkhYTMGdV6CudbA0TXzLNRw2hAF2qFK3GZQNlo=
=pS8K
-----END PGP SIGNATURE-----

--4bgaCHnQSGDw6wak--
