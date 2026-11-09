Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794200986;
	b=d8pLCPBzo8QEcIS6xgX9if2rizAA2RtXmtjESAeW+7MzbCHX2pMIMSear66MPqlh0a7C
	 4wGUBBMeulJ25NsbkMgphlY5Au4UBgj/RFN0E4B/lXH/cjEGWm6WSRORZI1hrx33d1Zbe
	 HzbDDJ5BWNkO0WTKUIseLWapHSm0khj+w2DfzPlT8fOguuQveXEZgkNOu2OR5sMPDjy/U
	 wiySWBz5V/sbz8LnUK2IHalI0KbP0rRCoS11miTSOqrAUVVej/zWlFdncL2DBEpanMPKS
	 if8l/poQni1zdiTnCLtwYGlW+ioKwjJ2Mbe3H2QgGXmEBJKw496fJYcfIjhMU6F3/sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794200986;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=HQH8N5NmXlt8AbGdle/BrNy6AknMpg2QnEbOlLsVEAo=;
	b=bNt0rcJ9FBFOv0CdoTYjqL4RMsQLv8tt5zynyyGZYq/4zr7phaIW7vtRCKYKSU8NApdO
	 D8B8s7UUb30aJsMS8rQ2dPGqypt6Lk2jM8Vcb3meIWcn4JCNxReigLPQRlRDEByZJbjf4
	 NN3vV2s0qVyw2IMCygXGdnv21fDPUCDhFNya7/VdpEZjld8uxDqxGwC8xMuIdjghwkNgh
	 q7YI9DZb3/hQzcblUbiM1LT0e5xXzcHA8lFyCkMpZH4tdAK1FIWiAt59I23LQrE50+vYU
	 ba2Cg9MC1DUO+HtbDNbZjrMj7ivLpo0thxBLIvyTGWK1rK+dQiRX6qEZUkObo/SLGoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D7kX0uRW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460B9606A321
	for <dmaengine@vger.kernel.org>; Mon,  9 Nov 2026 05:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D7kX0uRW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86B281F0089F;
	Mon,  9 Nov 2026 05:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794200985;
	bh=HQH8N5NmXlt8AbGdle/BrNy6AknMpg2QnEbOlLsVEAo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D7kX0uRWRKXJIfmh29fTKN5OQZRp+2WjMXryvu2JeUXn1AMCLyI0o7ay1R2S0XbC6
	 V6/MuvT9Vt1SQgsggqmQMoTfpV/GgQb4rfMpDt3Dg4EivPzEOcbkJsJRcPpZn0AuOf
	 5yni6J+5hj1UzBHkCXdHSXmZdcKPl5zJTaaT1pMA8kqwriTdwyboJqB8Q76iLDvroE
	 xHfmE8WkD+TJ/nLU5iQVFgYhTTGWeNwtOnhVcEB3XO4A3OmivBq0opiXUlkFpHuFQL
	 yvp7Ltok2lLQ7aCO1OC8nHo3QrL1OVmZWq+TmmfwDTprb9vP1dbuBm2s8XkFUki12W
	 94Nvlu1A6s+eg==
Message-ID: <sashiko-outbox-204415@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: tegra: only advertise supported pause
 operations
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Hilliard" <james.hilliard1@gmail.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261108-submit-tegra186-dma-pause-caps-v1-v1-1-9cc9b17a033d@gmail.com>
References: <20261108-submit-tegra186-dma-pause-caps-v1-v1-1-9cc9b17a033d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 05:09:45 +0000
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
- [Low] dmaengine: tegra: redundant pause checks in
  tegra_dma_device_pause()
--

commit 3ce960c2c1d14548e97fac4df9585c921b1d04e0
Author: James Hilliard <james.hilliard1@gmail.com>

dmaengine: tegra: only advertise supported pause operations

This commit registers the device_pause and device_resume callbacks in
tegra_dma_probe() only when cdata->hw_support_pause is set, preventing SoCs
such as Tegra186 from advertising unsupported pause capabilities.

> diff --git a/drivers/dma/tegra186-gpc-dma.c b/drivers/dma/tegra186-gpc-dm=
a.c
> index e76c58f213d84..72266f490e8a3 100644
> --- a/drivers/dma/tegra186-gpc-dma.c
> +++ b/drivers/dma/tegra186-gpc-dma.c
> @@ -1518,8 +1518,10 @@ static int tegra_dma_probe(struct platform_device =
*pdev)
>  	tdma->dma_dev.device_terminate_all =3D tegra_dma_terminate_all;
>  	tdma->dma_dev.device_tx_status =3D tegra_dma_tx_status;
>  	tdma->dma_dev.device_issue_pending =3D tegra_dma_issue_pending;
> -	tdma->dma_dev.device_pause =3D tegra_dma_device_pause;
> -	tdma->dma_dev.device_resume =3D tegra_dma_device_resume;
> +	if (cdata->hw_support_pause) {
> +		tdma->dma_dev.device_pause =3D tegra_dma_device_pause;
> +		tdma->dma_dev.device_resume =3D tegra_dma_device_resume;
> +	}

[Severity: Low]
Can the !tdc->tdma->chip_data->hw_support_pause checks in
tegra_dma_device_pause() and tegra_dma_device_resume() be dropped now that
both callbacks are only registered when cdata->hw_support_pause is true?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261108-submit-teg=
ra186-dma-pause-caps-v1-v1-1-9cc9b17a033d@gmail.com?part=3D1
