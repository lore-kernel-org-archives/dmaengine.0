Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701333783B6;
	Sat, 31 Jan 2026 20:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769891227; cv=none; b=mJzXyMkDTnuPQr9C5eSHcIKann+jBJrWfyh/8F1QPJC/6AfXuuRhomu1CNO/kZ2XxRRWCaXrSCLGMRbGNWTAs3ttro545TsiT/YE5x44M0BTOCOOoklqOl/O4kFMlBlviCzsvatozzt/ZmlX3i5gPqFRqr3Ih6GaJEvh4HzwKoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769891227; c=relaxed/simple;
	bh=CDgRm36EUq0CocOGCQ7R89LdOQTptLSRwd5aeLsc1EU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E2ysMwEi7d0YtJd6GNK1JPIim7cjfRNWpfvAybgUQS9hn/sxAKWsEYENWpPzGFmCbsZWuETEoK6TKPnTHlQ4ofG1J7NFziJzumn4ENLo9BuhJbGeprISvoVGCbktRTJz5QFgKMtxwW/qA84bM2TzCaT6wldhVjn8xjO0zdraGL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u0kQKbDY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u0kQKbDY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 733AFC4CEF1;
	Sat, 31 Jan 2026 20:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769891227;
	bh=CDgRm36EUq0CocOGCQ7R89LdOQTptLSRwd5aeLsc1EU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u0kQKbDYGrDVBRlFazJMrJWhLC5iULxzrDsVeiYiPveT1T/CJ1rVIvZkjF3tOsas4
	 Y1gCXqBgPqjVTcgj5RgGcjKhSGfAAq13o6uQQbAkIIuId+Hzi9O8oJs+v4sFV0S0/r
	 Nws2wUkB9BXO/Mpb8yfEMpec8tkOc8Vpulfl20XdoimdiER8bWqrkvjLQkZ5NTJv+3
	 N7LjOX82T47VPJUO1Rp5YUt2KBinhpKwC1Dfxh+dkxNezsak9AYPWTElcLMUfChEGo
	 5dsKlDy0+dXZLRPQoLl9TUMP/RWfeu24/ax2eSJ+gAoXFPwv95BYNl9MiBzH8/qd9L
	 q+gYkWuCEM9Xw==
Date: Sat, 31 Jan 2026 20:27:03 +0000
From: Conor Dooley <conor@kernel.org>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: Eugeniy.Paltsev@synopsys.com, vkoul@kernel.org,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Khairul Anuar Romli <khairul.anuar.romli@altera.com>,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: dma: snps,dw-axi-dmac: add dma-coherent
 property
Message-ID: <20260131-subtly-education-e13320fe0486@spud>
References: <20260131172856.29227-1-dinguyen@kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Rp3BASSQTT0TeGSl"
Content-Disposition: inline
In-Reply-To: <20260131172856.29227-1-dinguyen@kernel.org>


--Rp3BASSQTT0TeGSl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 31, 2026 at 11:28:56AM -0600, Dinh Nguyen wrote:
> From: Khairul Anuar Romli <khairul.anuar.romli@altera.com>
>=20
> The Synopsys DesignWare AXI DMA Controller on Agilex5, the controller
> operates on a cache-coherent AXI interface, where DMA transactions are
> automatically kept coherent with the CPU caches. In previous generations
> SoC (Stratix10 and Agilex) the interconnect was non-coherent, hence there
> is no need for dma-coherent property to be presence. In Agilex 5, the
> architecture has changed. It  introduced a coherent interconnect that
> supports cache-coherent DMA.
>=20
> Signed-off-by: Khairul Anuar Romli <khairul.anuar.romli@altera.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Why does this v1 have an ack?

> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
> ---
>  Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml =
b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> index 216cda21c538..e12a48a12ea4 100644
> --- a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> +++ b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> @@ -68,6 +68,8 @@ properties:
> =20
>    dma-noncoherent: true
> =20
> +  dma-coherent: true
> +
>    resets:
>      minItems: 1
>      maxItems: 2
> --=20
> 2.42.0.411.g813d9a9188
>=20
>=20

--Rp3BASSQTT0TeGSl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaX5llwAKCRB4tDGHoIJi
0uMZAQCg7i9k1xXsciMd67gAFFDYk07DED/QWtRml7eJWCvTowD9FCpalgSSpWhV
EM1OuiWi8G0wRBa41pTDW/QLzeAn6wg=
=aA6T
-----END PGP SIGNATURE-----

--Rp3BASSQTT0TeGSl--
