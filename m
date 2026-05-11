Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B89423A87;
	Mon, 11 May 2026 16:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778515268; cv=none; b=dO7xwHsTzzcHwaHw1f17OCA5pQHPUTEBOdTPr7zizIHc269Bi1HMc0NGWvFrVfIgsewYVN19Wmf2+o3pB0yS4KjwYaGagdC2/sW9PfNHJxVZN13CBA7vAzomF6auSS37OCdmln39Rcj+5IhjE7vVr6byA74K5uO1j4QxYl0hHeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778515268; c=relaxed/simple;
	bh=2HuFrmcqmrOVVVEJLWAsX3GcJ54PviZDnJzTCse+KvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bt9AA+dXpiXqFN8kYCXqDwHc+/vkLkjxbDPoxWTqgjqmjt1QVGXzWMKOvbe87gHw6OjrDJAj56bQl6V7TtSdy9TI6fJa9BOQXhNJgcabCsTlXLVdQUNN56lo5P5FTJihVXKWG1wwbGSEOmSS1oOtXw28nP7TYrWhRmyIInhWtaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OIw+P1WJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OIw+P1WJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B91CC4AF10;
	Mon, 11 May 2026 16:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778515268;
	bh=2HuFrmcqmrOVVVEJLWAsX3GcJ54PviZDnJzTCse+KvM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OIw+P1WJ139ZdeZh18cFAJgEPOzYZKXkq5NY9vuGIONy0I0bVmS+1zNOZxc6axGm7
	 FrR1h4nW2Fsnx7z1AYAKyeFwn79bR9r9qLB7CYkfm64KAoqTi5Ar8+HLbMQX53brIe
	 UJK8AvCuglU3Hb4nfKUzSk27r0HPln9hLX1zoWqzLGXXjLGwMuXootMyMoPedBBi2w
	 acZTlgmkAOo3Wg3RfmP+J4hGWajuifA1VDy1zqyOMgdFXn0ZUXdpe7laLp6K85S3Zg
	 D4PPXd31yz6JkoY/gQBO/r7KZppkYvimHrCEI5nDsQLLxHJpF+2G87woLrEeGp8xol
	 NiP5DzGgUk1LA==
Date: Mon, 11 May 2026 17:01:01 +0100
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Longbin Li <looong.bin@gmail.com>, Yixun Lan <dlan@kernel.org>,
	"Anton D. Stavinskii" <stavinsky@gmail.com>,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>
Subject: Re: [PATCH v6 1/2] dt-bindings: dma: snps,dw-axi-dmac: Add fallback
 compatible for CV1800B
Message-ID: <20260511-crave-sworn-3b43371ce11a@spud>
References: <20260511063818.463877-1-inochiama@gmail.com>
 <20260511063818.463877-2-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c2fbZeqJoc29vaDy"
Content-Disposition: inline
In-Reply-To: <20260511063818.463877-2-inochiama@gmail.com>


--c2fbZeqJoc29vaDy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 02:38:16PM +0800, Inochi Amaoto wrote:
> The previous version of the binding change only add compatible
> string without adding the fallback compatible, this breaks
> backward compatibility. Add the needed fallback compatible to
> fix this.

I don't understand how adding a specific comaptible affected backwards
compatibility. Did the dts originally use the snps compatible before the
device specific one was added?

>=20
> Fixes: be3e2a0419c6 ("dt-bindings: dma: snps,dw-axi-dmac: Add CV1800B com=
patible")
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml =
b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> index 804514732dbe..0a30a455b0ee 100644
> --- a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> +++ b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> @@ -21,11 +21,12 @@ properties:
>        - enum:
>            - snps,axi-dma-1.01a
>            - intel,kmb-axi-dma
> -          - sophgo,cv1800b-axi-dma
>            - starfive,jh7110-axi-dma
>            - starfive,jh8100-axi-dma
>        - items:
> -          - const: altr,agilex5-axi-dma
> +          - enum:
> +              - altr,agilex5-axi-dma
> +              - sophgo,cv1800b-axi-dma
>            - const: snps,axi-dma-1.01a
> =20
>    reg:
> --=20
> 2.54.0
>=20

--c2fbZeqJoc29vaDy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagH9PQAKCRB4tDGHoIJi
0n/6APwOg5niWfMpu4WYU6LySqCZ3EEoA3wCehMsY5KQ/dRYEAD/TfNSikQqeftQ
UpdvGLy8bfVYXPoeZ5291/4e3aIz7gQ=
=fW1f
-----END PGP SIGNATURE-----

--c2fbZeqJoc29vaDy--
