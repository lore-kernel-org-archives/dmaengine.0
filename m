Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCCA23B71D4;
	Mon, 12 Oct 2026 19:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791831994; cv=none; b=BIoAjMNJCe9REYb0+foiDaFMNkzf0biR9G1UG+CSnsyp3QfVw0OvG14etfplNx1061OcZHW9wmVywZaCia5wlGf96D8hWy7EqyPruLPcfy6XYZgBQFj5lA7+ng8A4eRJEWXmvtguUSCCvRm+E+yb/8ehvwsEggz1jTHtaoWkBZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791831994; c=relaxed/simple;
	bh=rBg66MgKskVg9KVd/lwZV92mZ+DOAeNKyT1uZoYbVhE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KSyy/OoOYM8EqeYKjKvLt50SEYxuVy8EH2zol6ufJ1EPh01B+6CsKhDHEm0fli33vejC6GXKXVTOo9o1At1lVhIkCHxxhp049unhag69JtSrAv4FGOJWzRtRJ5vV/NQt2FJCecXyuxq03Aa23X9+plW73+mCWI1Tw0oVdU21sOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MlI4FjyE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MlI4FjyE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D65E1F0089B;
	Mon, 12 Oct 2026 19:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791831993;
	bh=V1qJC9FEBLStLZYadjJB0z73Wt4b9XJZv0+3sG4ijwk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MlI4FjyE5ljwjZrb5hrekRS2ygoFn1xYSJeVgPuCBBQ/L+VQJBDcdaaKHzLq8udjB
	 7C7Zqwo5qA10b0N8+zo/3WFhTXbw6InEzCqF6XUpiCOTcUKHvfQNWbV6dV3BhYMeNL
	 iwVciTYvYfCvTS26VRHYWYhEudBeXwRlYFtpMUwCX9AITvR3EY4OyVNmeT8OA+ktAX
	 la4SofIIcl2N+6A1BPKRoBOgYSvJb4I/91g3qngRinat2L9nLbEWu/5vRCQvvUqNky
	 1C9oEpqItY2jPU7yCQdRokC7Peqrr6r/f6q9kkqFj2chcgewJ/ZZs3M+oltc6Ip+mb
	 S2NcM0bA6Exkg==
Date: Mon, 12 Oct 2026 20:06:29 +0100
From: Conor Dooley <conor@kernel.org>
To: Jelly Jia <Jelly.Jia@cixtech.com>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, robin.murphy@arm.com,
	devicetree@vger.kernel.org, Frank.Li@kernel.org,
	cix-kernel-upstream@cixtech.com, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/6] dt-bindings: dma: arm,dma-350: Document the CIX
 Sky1 integration
Message-ID: <20261012-twisted-cavalry-b52b5043fd5d@spud>
References: <20261012084155.2547480-1-Jelly.Jia@cixtech.com>
 <20261012084155.2547480-5-Jelly.Jia@cixtech.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LbBYOngj9q7cuBu2"
Content-Disposition: inline
In-Reply-To: <20261012084155.2547480-5-Jelly.Jia@cixtech.com>

--LbBYOngj9q7cuBu2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 04:41:53PM +0800, Jelly Jia wrote:
> The CIX Sky1 DMA-350 integration is the same device with SoC glue around
> it, so it is described by the arm,dma-350 node itself with an additional
> "cix,sky1-dma350" compatible rather than by a separate wrapper node.
>=20
> Extend the binding with the CIX compatible and the resources the
> integration needs: a clock, which the CIX variant requires, an optional
> reset, and an optional reserved memory region used when the controller
> cannot reach all of system memory.
>=20
> v2 -> v3:
> - Drop the cix,irq-router property and its conditional: the Sky1
>   interrupt gate it described is set up by the boot firmware and is not
>   configured by Linux, so no property describes it.
> - The CIX compatible now requires a clock.
>=20
> Assisted-by: LLM checkpatch sparse dt_binding_check dtbs_check
> Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
> ---
>  .../devicetree/bindings/dma/arm,dma-350.yaml  | 26 ++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml b/Doc=
umentation/devicetree/bindings/dma/arm,dma-350.yaml
> index 429f682f15d8..4e0f9ffb0039 100644
> --- a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
> +++ b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
> @@ -11,10 +11,22 @@ maintainers:
> =20
>  allOf:
>    - $ref: dma-controller.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: cix,sky1-dma350
> +    then:
> +      required:
> +        - clocks
> =20
>  properties:
>    compatible:
> -    const: arm,dma-350
> +    oneOf:
> +      - const: arm,dma-350
> +      - items:
> +          - const: cix,sky1-dma350
> +          - const: arm,dma-350

Provided the device is actually functional if the fallback compatible is
used, this patch is fine. Otherwise, please drop the fallback from here.

Thanks,
Conor.

> =20
>    reg:
>      items:
> @@ -36,6 +48,18 @@ properties:
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
>  required:
>    - compatible
>    - reg
> --=20
> 2.54.0
>=20

--LbBYOngj9q7cuBu2
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCas0vtQAKCRB4tDGHoIJi
0nx0AQDB5r7oymsF6TAu0ttlEHIJipo6PrYdifW37NZxxwRGFgEAxKFlJzEToRQY
OfEGN5uC5Lzaagf0eTACGFQ70vFmFwk=
=mNaw
-----END PGP SIGNATURE-----

--LbBYOngj9q7cuBu2--
