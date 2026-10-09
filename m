Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0CC364058;
	Fri,  9 Oct 2026 15:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791559896; cv=none; b=CPymmMNSTFa8gwquHmm91RI2w5DI19VHuYErVKO6R6Zx+dsXpgxXlaodHcMmrUxlhfSQr22xrle2jnO1hRRS9NTKnlKTQfe/YrR6o9j9qAwZvCsDUQaQvv+oM2Vp8z+pvPpZvA28busn8TbjZDye2N56ftoJUQfpHCr78t3n49c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791559896; c=relaxed/simple;
	bh=Y5N/0O6nDi4muKsmXGW77S7TdYMrnCCJgAjavRT9flM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sH/01fcoFmr66aYsH7rL4iaL1LKUwvt0XYU00WKE9+nrawkKhQljtzDvBK4Jn6JmpgMZz6a73DCqq+K585nH2vUD2IZZrkBSdG5L+81OV7X4BKG8GsMKzYtUV91sZsYFgYtQLGgxxR5PNMQIapW3OR4f7KD/2QMKx5aLJP617iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R533SftO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R533SftO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45A3E1F000FF;
	Fri,  9 Oct 2026 15:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791559894;
	bh=uzN4CB+A0HAdRCT2F/Svd9zdUa6iTetFlzv03wkDw5E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=R533SftOEk1e2agMf6GN47JaFth1UmEJ8PxwvEKze8o2BCUeI3+uE7DjP23vLV52R
	 DChBvnUySPFvtxmqEtx21vq0RxLBnV49PU6CZdd5EJTBgqejDOMgbGox+ebwgaftDg
	 s7R1T8htqmopYsrG2LGlh00D96R73fPZyXFhf99f/XBuvN/Yi7NxqEulA/0zcTbNFs
	 fs3LdyhRbOxxeVwiGaqP3LpF09DkP2au90Z/TmRH+RKIX1Yhdz5HukO4jDb1lWBv+b
	 XwiCRHq1402dIwR6w+DmlWHVd6JgyMPwlm+Ksog12I9tTnyp8L8jI5ru5uvMvXoOgb
	 WI4IIyqq0kX3w==
Date: Fri, 9 Oct 2026 16:31:26 +0100
From: Conor Dooley <conor@kernel.org>
To: Jelly Jia <Jelly.Jia@cixtech.com>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, robin.murphy@arm.com,
	devicetree@vger.kernel.org, Frank.Li@kernel.org,
	cix-kernel-upstream@cixtech.com, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/6] dt-bindings: dma: arm,dma-350: Document the CIX
 Sky1 integration
Message-ID: <20261009-e284e1844269292657604ec7@squawk>
References: <20260907033404.596839-1-Jelly.Jia@cixtech.com>
 <20261009051846.1115962-1-Jelly.Jia@cixtech.com>
 <20261009051846.1115962-5-Jelly.Jia@cixtech.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="F6ICfzGMXDwCSKuy"
Content-Disposition: inline
In-Reply-To: <20261009051846.1115962-5-Jelly.Jia@cixtech.com>

--F6ICfzGMXDwCSKuy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 09, 2026 at 01:18:44PM +0800, Jelly Jia wrote:
> The CIX Sky1 DMA-350 integration is the same device with SoC glue around
> it, so it is described by the arm,dma-350 node itself with an additional
> "cix,sky1-dma350" compatible rather than by a separate wrapper node.
>=20
> Extend the binding with the CIX compatible and the resources the
> integration needs: a clock, a reset, an optional reserved memory region
> used when the controller cannot reach all of system memory, and the
> syscon that routes the channel interrupts to the AP interrupt
> controller on Sky1. The cix,irq-router property is only valid together
> with the CIX compatible.
>=20
> Assisted-by: LLM checkpatch sparse dt_binding_check dtbs_check
> Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
> ---
> v1 -> v2:
> - Folded the integration into arm,dma-350.yaml: the Sky1 DMA-350 is the
>   same device, so it keeps the generic compatible plus a device
>   specific "cix,sky1-dma350" compatible, and the integration resources
>   are described on the controller node.
> - Dropped the separate cix,sky1-dma350.yaml wrapper binding.
>  .../devicetree/bindings/dma/arm,dma-350.yaml  | 33 ++++++++++++++++++-
>  1 file changed, 32 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml b/Doc=
umentation/devicetree/bindings/dma/arm,dma-350.yaml
> index 429f682f15d8..3b991985c416 100644
> --- a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
> +++ b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
> @@ -11,10 +11,23 @@ maintainers:
> =20
>  allOf:
>    - $ref: dma-controller.yaml#
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              const: cix,sky1-dma350
> +    then:
> +      properties:
> +        cix,irq-router: false
> =20
>  properties:
>    compatible:
> -    const: arm,dma-350
> +    oneOf:
> +      - const: arm,dma-350
> +      - items:
> +          - const: cix,sky1-dma350
> +          - const: arm,dma-350
> =20
>    reg:
>      items:
> @@ -36,6 +49,24 @@ properties:
>      const: 1
>      description: The cell is the trigger input number
> =20
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  memory-region:
> +    maxItems: 1
> +    description:
> +      Reserved memory region used for DMA allocations when the controller
> +      cannot reach all of system memory.
> +
> +  cix,irq-router:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Syscon phandle for the CIX Sky1 subsystem register block that rout=
es
> +      DMA-350 channel interrupts to the AP interrupt controller.

See comments on the driver for more on this, but I'm not convinced that
this should be in this node - especially if this thing controls other
device's routing too.

Thanks,
Conor.

> +
>  required:
>    - compatible
>    - reg
> --=20
> 2.54.0
>=20

--F6ICfzGMXDwCSKuy
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaskIzgAKCRB4tDGHoIJi
0onYAP4yCAErULolgU18TX/15DolYA6bb5xPSN6uypp8TiIi6gEAi7eNathXzHwJ
aqeYLo23GAW24JOwI2TzAyK7dXRu5gk=
=TyQ6
-----END PGP SIGNATURE-----

--F6ICfzGMXDwCSKuy--
