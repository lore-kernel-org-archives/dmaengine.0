Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A654C9E03;
	Mon, 12 Oct 2026 19:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791832074; cv=none; b=nBmLciTBPNgL6SjtMwdmwaaPkqKKTdQs81Jpj0W/yE34h7ul/1O7IV+40Vd0a86LwoIsapYL2zvICihLkO9R/oRKO7F5kD7YnadXboJ8HNrkCamuNK7ELPx/aJ8Gm9gQoECAl1E9Ikd0gOSfoEuiABYDnGycAM7mcxgvQaFurH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791832074; c=relaxed/simple;
	bh=Mn6D3gy9/w+bnfjcb6z26eaqqu098jbtRQKRwMp7XuE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kfDKfXMOhiY4RbUcSovPxYsJQOHh2y3PYyFRuyDpTnLkRS8F7fmSKsMmFhhgqcfl+rIxx0s0fV+ZuBN0I1c2k5xB+mabfm6x7+e/d94XUikrD07fA276twULSiwchzHmJKfQcq77j72v9jeW4koV7Y3a3SpAUewK5wppcFC+nGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BoLzz8Nu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BoLzz8Nu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 936811F0089B;
	Mon, 12 Oct 2026 19:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791832072;
	bh=fAUfWWTxjwqCeuukrWQxTgwGQa9QftroT/t4wDZYVVw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BoLzz8NuAjzMywAPstQCH3qnS5gIf3tWURdDM4XY1syXbT1LSQySctZ2fppM7RtHP
	 rLwcvb8DmcMBAi9bzzhDvyWJctQWBb5jK/GMi8ckeBx7ROBH4BreVfHRvBEYRCUPtZ
	 Yq5KVAauL+xGSkYdujPrKKiKfywCV1UrI4Lr9XSu12tAosK30XTbV+fWR4Q3Cu1TAr
	 3oq2oF34wQb5Z09u1hj2fueQtHI+nbRDxDm9ZvHdbDzP0QvnU6pZ3a8mctQVx+/xAd
	 letnpc5qmYQSbQXDeazBiMKGPpN62CT+RKhUOK82KzJDphDOoW0zdH73RH60m0byXo
	 guZc0TDwEdUqw==
Date: Mon, 12 Oct 2026 20:07:48 +0100
From: Conor Dooley <conor@kernel.org>
To: Jelly Jia <Jelly.Jia@cixtech.com>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, robin.murphy@arm.com,
	devicetree@vger.kernel.org, Frank.Li@kernel.org,
	cix-kernel-upstream@cixtech.com, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 6/6] arm64: dts: cix: Describe the Sky1 DMA-350 bus
 integration
Message-ID: <20261012-rural-undermost-b4817ebd4740@spud>
References: <20261012084155.2547480-1-Jelly.Jia@cixtech.com>
 <20261012084155.2547480-7-Jelly.Jia@cixtech.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eZMYkGYe2LFIW0E9"
Content-Disposition: inline
In-Reply-To: <20261012084155.2547480-7-Jelly.Jia@cixtech.com>

--eZMYkGYe2LFIW0E9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 04:41:55PM +0800, Jelly Jia wrote:
> The FCH DMA-350 controller sits behind an interconnect window, so the
> addresses its DMA master uses differ from the CPU physical addresses.
> Describe the integration as a bus node carrying the dma-ranges of that
> window, with the controller itself as a child, and give the controller
> the SoC compatible and the clock feeding it.
>=20
> The AUDSS DMA-350 controller is described the same way, with its clock
> and reset. It has no consumer in the SoC dtsi yet: the audio controllers
> that use it are not described upstream.
>=20
> The bus nodes are address domains, not devices: they have no reg, so
> they carry no unit-address in their node names.
>=20

> v1 -> v2:
> - The DMA-350 nodes are no longer wrappers with the generic controller
>   as a child: each Sky1 DMA-350 is a single device node with the
>   "cix,sky1-dma350", "arm,dma-350" compatible, its real MMIO region and
>   the integration resources (clock, reset) that v1 kept on the wrapper.
>   The integration and the block are one device, and the MMIO is the same
>   as the generic node it replaces.
> - The FCH and AUDSS DMA-350 masters sit behind SoC interconnect windows
>   in a static DMA address domain: the AUDSS masters see the audio
>   register and FIFO block at 0x20000000 and the DRAM window at
>   0x30000000, which the CPU sees at 0x07010000 and 0xc0000000, and the
>   FCH masters see the 0x040b0000 window at 0x040a0000. Their DMA view of
>   the address space is not the CPU physical view.
> - The windows are static hardware configuration, set up before Linux
>   starts by the boot firmware / secure world: they are not programmable
>   from Linux and must not be reconfigured by it. There is nothing for a
>   Linux interconnect provider to manage here, so the translation cannot
>   be modeled as one; it is a fixed property of the bus.
> - It is described the standard devicetree way instead: a generic
>   "simple-bus" parent with an identity "ranges;" and the "dma-ranges" of
>   the window. This is not the rejected v1 wrapper and not a separate DMA
>   wrapper/integration device: the parent has no device-specific or
>   vendor wrapper compatible, only the generic "simple-bus" compatible,
>   no reg, no clocks, no resets, no driver and no private address
>   translation. Its only job is to carry the static translation, so it is
>   only a generic bus/address-domain node.
> - The "dma-ranges" have to sit on that parent for the OF core to build
>   dev->dma_range_map: of_dma_configure_id() starts the lookup at the
>   device's parent (bus_np =3D __of_get_dma_parent(np) in
>   drivers/of/device.c), so a "dma-ranges" on the controller node itself
>   would be ignored. The translation is applied by the DMA API, not by
>   driver code: the driver maps slave resources with dma_map_resource()
>   and contains no address parser.
> - Mainline has similar bus nodes: the Agilex5 DMA bus (dma-bus@10db0000,
>   a simple-bus with dma-ranges whose controller carries
>   "altr,agilex5-axi-dma", "snps,axi-dma-1.01a") and the Marvell AC5
>   buses (bus@80500000 with "ranges;" and "dma-ranges", and
>   behind-32bit-controller@7f000000, whose only purpose is the DMA
>   mapping of the devices below it).
>=20
> v2 -> v3:
> - The AUDSS interrupt gate is set up by the boot firmware and is not
>   configured by Linux, so the cix,irq-router property is gone.
> - The bus nodes carry no unit-address in their names: they have no reg,
>   which made dtc warn (unit_address_vs_reg).

None of this should be in the commit message.

>=20
> Assisted-by: LLM checkpatch sparse dt_binding_check dtbs_check
> Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
> ---
>  arch/arm64/boot/dts/cix/sky1.dtsi | 68 +++++++++++++++++++++++++------
>  1 file changed, 56 insertions(+), 12 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/=
sky1.dtsi
> index 0a820f45feb9..1262f34794d2 100644
> --- a/arch/arm64/boot/dts/cix/sky1.dtsi
> +++ b/arch/arm64/boot/dts/cix/sky1.dtsi
> @@ -518,18 +518,33 @@ iomuxc: pinctrl@4170000 {
>  			reg =3D <0x0 0x04170000 0x0 0x1000>;
>  		};
> =20
> -		fch_dmac: dma-controller@4190000 {
> -			compatible =3D "arm,dma-350";
> -			reg =3D <0x0 0x4190000 0x0 0x10000>;
> -			interrupts =3D <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
> -				     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
> -				     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
> -				     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
> -				     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
> -				     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
> -				     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
> -				     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>;
> -			#dma-cells =3D <1>;
> +		/*
> +		 * The FCH DMA-350 master sits behind an interconnect window;
> +		 * the dma-ranges below are its view of the address space.
> +		 */
> +		fch-dma-bus {
> +			compatible =3D "simple-bus";
> +			#address-cells =3D <2>;
> +			#size-cells =3D <2>;
> +			ranges;
> +			dma-ranges =3D <0x0 0x040a0000 0x0 0x040b0000 0x0 0x00040000>,
> +				     <0x0 0x80000000 0x0 0x80000000 0x8 0x00000000>,
> +				     <0x80 0x00000000 0x80 0x00000000 0x80 0x00000000>;
> +
> +			fch_dmac: dma-controller@4190000 {
> +				compatible =3D "cix,sky1-dma350", "arm,dma-350";
> +				reg =3D <0x0 0x04190000 0x0 0x10000>;
> +				clocks =3D <&scmi_clk CLK_TREE_FCH_DMA_ACLK>;
> +				interrupts =3D <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
> +					     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
> +					     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
> +					     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
> +					     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
> +					     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
> +					     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
> +					     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>;

As I said on v2 an hour or so ago, I don't think this is correct, and
you should put an interrupt-map node into the syscon that contains the
irq routing registers, and have the syscon be the interrupt parent for
this node.

Thanks,
Conor.

> +				#dma-cells =3D <1>;
> +			};
>  		};
> =20
>  		mbox_ap2se: mailbox@5060000 {
> @@ -576,6 +591,35 @@ mbox_pm2ap: mailbox@65a0080 {
>  			cix,mbox-dir =3D "rx";
>  		};
> =20
> +		/*
> +		 * The AUDSS DMA-350 master sits behind an interconnect window;
> +		 * the dma-ranges below are its view of the address space.
> +		 */
> +		audss-dma-bus {
> +			compatible =3D "simple-bus";
> +			#address-cells =3D <2>;
> +			#size-cells =3D <2>;
> +			ranges;
> +			dma-ranges =3D <0x0 0x20000000 0x0 0x07010000 0x0 0x00100000>,
> +				     <0x0 0x30000000 0x0 0xc0000000 0x0 0x20000000>;
> +
> +			audss_dmac: dma-controller@7010000 {
> +				compatible =3D "cix,sky1-dma350", "arm,dma-350";
> +				reg =3D <0x0 0x07010000 0x0 0x10000>;
> +				clocks =3D <&audss_cru CLK_DMAC_AXI>;
> +				resets =3D <&audss_cru AUDSS_DMAC_SW_RST>;
> +				interrupts =3D <GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH 0>,
> +					     <GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH 0>,
> +					     <GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH 0>,
> +					     <GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH 0>,
> +					     <GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH 0>,
> +					     <GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH 0>,
> +					     <GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH 0>,
> +					     <GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH 0>;
> +				#dma-cells =3D <1>;
> +			};
> +		};
> +
>  		audss_cru: clock-controller@7110000 {
>  			compatible =3D "cix,sky1-audss-cru";
>  			reg =3D <0x0 0x07110000 0x0 0x10000>;
> --=20
> 2.54.0
>=20

--eZMYkGYe2LFIW0E9
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCas0wBAAKCRB4tDGHoIJi
0tZvAQCSHmcnTV6jgT2PsmPzk+KiLw1d4u3fGARAiQ3YfXvDuwEA8WYfrMKQNIA4
jHJrD7aA6U3SwLq7B48xBdfJ5ZPT8wA=
=zOqj
-----END PGP SIGNATURE-----

--eZMYkGYe2LFIW0E9--
