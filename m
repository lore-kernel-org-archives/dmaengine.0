Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED38372064;
	Wed,  1 Jul 2026 16:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782925167; cv=none; b=OpxtkbhBl5ynkocIGN8lSFgYvuYthOgtF41G0/EHJFgUUvLU1qrQd28K8MxKh81Y4wHqjtzViEYTWL7EtwtkmGVGqhfLpFP5DFaw987Ojw+C39fNjbGG8N0lIG/TGqvIy/1GxvFxNvER8x+v9c1ybUw5L6Y8TrIfpWoKno+rcNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782925167; c=relaxed/simple;
	bh=IrFZsnUmW0yIArlQLTrgfC5aQins48K9v6hYbAT2Tl0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MVTs2ac5Bsp92a79YPzIhbhmqzLoLnhsPwb54eLIeP1VbJ3LYd7SIp8yq0gRhtdcChgmXZ+1X0vPBGMOlgsk+jdgGxpWsXRiT+kaliOOWGnMqrX6HNevaAg1eI09xIt/SsqzBMdTunlpbUv5Ck7vtMVqgyp4ozz/XxFfZichKpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f/w4hSph; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f/w4hSph"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EA861F000E9;
	Wed,  1 Jul 2026 16:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782925166;
	bh=IrFZsnUmW0yIArlQLTrgfC5aQins48K9v6hYbAT2Tl0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=f/w4hSphSkhrF275HYBKpE3cR+xWiEZ6Grf+3aTfW9XXs7R0IzjxQdU0iZc9POURe
	 I4//UBTHXLfdBFJ1R1WNUouug6IAbNvaAkfdt4hqzriT3dtdeZW+CBASufQCich8/U
	 iix2Y1E+qWlNTh3oR8ag9en4qbl70CYHtavF2Xqp3l5g9ZySLDqjLzm86/W0k6UlpM
	 kBna67CTm73CFdyaZQOCIk1c8OWQ5VwXLys/qw2iHzAQZByoYacrUvjP3PAqtdRBTT
	 /D6XlIe/T/UuzEZ+t6s91f1oDe3E0ftrJ6kRHSgwJSjS68V5WGLi3jNgf0O2sDPij9
	 ZpJqFtEeJOabg==
Date: Wed, 1 Jul 2026 17:59:21 +0100
From: Conor Dooley <conor@kernel.org>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Long Cheng <long.cheng@mediatek.com>, kernel@collabora.com,
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: dma: mediatek,uart-dma: add support for
 MT8189 SoC
Message-ID: <20260701-escargot-unearth-233b3f1da093@spud>
References: <20260701-mt8189-dt-bindings-uart-dma-v1-1-c7106216a40d@collabora.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LiqYd8uyhb+nmNno"
Content-Disposition: inline
In-Reply-To: <20260701-mt8189-dt-bindings-uart-dma-v1-1-c7106216a40d@collabora.com>

--LiqYd8uyhb+nmNno
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--LiqYd8uyhb+nmNno
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakVHaQAKCRB4tDGHoIJi
0iAeAQDw8UZ2gVBadrMgzz0CFwnC6zMw9K3G93fmyHt5QjKqawD8CT22JOXLwJgl
07e428SiKjL2teJ4dkqvY5MIihGKSgQ=
=8VBS
-----END PGP SIGNATURE-----

--LiqYd8uyhb+nmNno--
