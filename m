Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794470122;
	b=iCpxTYPcGeaBznpeQZfaqbicZJnssGiMPWvE155tmrB1kvlA6EjwmN+YtZqnE2GJ4b5i
	 fvDctS7rK0D7WIw6fOdsKUh3lSoOd4NIyIQHF0rXTR3I1YXHKn61DJxlgGfFhn79WZyMf
	 mnLaXhKQwMfk9E8uOjA1LdWCzaxaL6nUWmqjaMF2tXFdjziKm5G+3itgyCqXMrzRuYdJP
	 NjWp3popA9o0R3jVal4sD0VPE3CDDSASvOlSIhW7+Kay8lKFOipjwgJT+/9rEPEW7L7vA
	 /JQ2jWhakNJ+ccVrHtkpWWH6hLlzX44nijgpNYIaYG5y2N4Stuxm7AlxWFXVCtiXiUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794470122;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=81xfIh8mFmYaziN7aWxJKAJK8cTCPu/MA8Ptkc7GqFo=;
	b=GzVbSqmwzgGXWMWQM7/0pmYedhM6oeQWlDOkId8KGYHG2G5pBWsAAFgm3y3j4ELpFuwn
	 nwoWVaXoH0sdestC5q2qUIEEXxVYMsSdWrhfYpdsPHWO12txJh/+pw/rcDJ4wuJOxEbbx
	 xBCUWFunwzLLxgJxPfMrYYDEnYjjkOJTe1uXa8iB0UBiRkNGU0wEIj3YHh+J7m9M+ilpo
	 Gau9xcjcURIPsof/2hgKah3ViiG7WkpVR/s5nfktdd6HWFrDDNSF3Kdy5KpEA6WmFIwfy
	 yMmATrCzl6q8gNFLJ7gnrrDk9WQzYRI2+tv0Fg/qoEUmyX0IXVVEYfUs8KtqksydXOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="QaJb/cBn";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B99606A323;
	Thu, 12 Nov 2026 07:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QaJb/cBn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70D9A1F00A05;
	Thu, 12 Nov 2026 07:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794470121;
	bh=81xfIh8mFmYaziN7aWxJKAJK8cTCPu/MA8Ptkc7GqFo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QaJb/cBnn9/sfJk0cgrDcYkvD6mnLxPQODdmTf0m2R+Of6AXCraMa3PBly2lTpiju
	 IWB9364XpRSmuW3u3Y2f50XaUS9GnrU/EIm2tfzvCqOSzvBxA946vf098bbNKyD+Qj
	 8Puia8yP57UMDvY2zGkiYRJsAQI6hTxM5+cSpcht77gvXUeTerzZ6OHWOo0k+Ja3Kw
	 5B+bezoI9WiEixX/Sl4R/oc0CjH9iwGtNFzAtOw8jeNRKzJ2dNLwrd84/NX/15cMr3
	 e0jeOg3L5V3V0cvY40LJEfIWAh80su1ohOg2HGVr1ejVeUhb4GiESMG/NumjvKaHJH
	 nBGbESfoP8OIQ==
Message-ID: <sashiko-outbox-210649@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 6/9] dmaengine: fsl-edma: use BIT_ULL for 64-bit
 channel mask
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: imx@lists.linux.dev, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261112-edma-iommu-v3-v6-6-b038edb8ce6f@nxp.com>
References: <20261112-edma-iommu-v3-v6-0-b038edb8ce6f@nxp.com>
 <20261112-edma-iommu-v3-v6-6-b038edb8ce6f@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 07:55:21 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] dmaengine: fsl-edma: missing Fixes trailer for chan_masked
  BIT_ULL() fix
--

commit 8e06ee65c51430e49223083e2d47b18afdf396c8
Author: Peng Fan <peng.fan@nxp.com>

> dmaengine: fsl-edma: use BIT_ULL for 64-bit channel mask
>
> chan_masked is a u64 bitmap, but several checks use BIT(), which uses
> unsigned long and overflows on 32-bit architectures for channels >=3D 32.
> Use BIT_ULL() so the upper channels are tested correctly.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

[Severity: Low]
Should this commit include a Fixes: tag for the commit that introduced the
64-bit chan_masked bitmap and the initial BIT() checks (and optionally the
follow-up commits that added the remaining checks)?

  Fixes: 72f5801a4e2b ("dmaengine: fsl-edma: integrate v3 support")
  Fixes: 2838a897654c ("dmaengine: fsl-edma: Do not suspend and resume the =
masked dma channel when the system is sleeping")
  Fixes: ccfa3131d4a0 ("dmaengine: fsl-edma: implement the cleanup path of =
fsl_edma3_attach_pd()")
  Fixes: d175222f5e90 ("dmaegnine: fsl-edma: add edma error interrupt handl=
er")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112-edma-iommu=
-v3-v6-0-b038edb8ce6f@nxp.com?part=3D6
