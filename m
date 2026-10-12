Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFE33537E8;
	Mon, 12 Oct 2026 08:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791795137; cv=none; b=AezfUwVdEC4Q4qWZTxpgTrwcraWRkEl7iosT8HZfWvuCPc3Bb5U1INWWhxW2bJiwuZNUmc2LRSpNJ0+ERC1pM8iDWU8ptvkqEFTIzRu7ABcvn37OU7jWb8/ICtYOFKt033t6t0HJ++PmxiihJNLEj4gMmqMTbTMtXJvEyL6ybGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791795137; c=relaxed/simple;
	bh=3NUENpFH3FouN2McquUElY5gUSXsmgZdfaw2/vECv2s=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=kGdPveXcDzPBkrMfqgFkxCVCkymcP6PRO30KZeAuze3sqKiDIIeXou24m/MClM9iOgitbzjzlwQvhAujXNznd4dvVMWqbxiR+h0FAtNG3sdSWJ/cihwBXADZJ8IsdzSjbYz9JqppTYLYPUNFrB50obq3NGNHa8Zu7JnaDl/dxd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VHk6FdJX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VHk6FdJX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CBCE1F0089B;
	Mon, 12 Oct 2026 08:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791795136;
	bh=0hqEXMZbyDrSVgp31592vZ/S/CbFRKyvhUFOFBh4Cnw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VHk6FdJXAOcGi5qp2HGcm7eOxje5Jp89dVN9hxCb+ODLtAgWAdyATfNzr7ZUFelQA
	 1sKcAD9OOWKdTUMwm7jHatj+ILgp6CmpxUM2z8YtbMod+jsaeHAjF7myW57jJZyFkn
	 pGYLWiBV7TU1NbD+PsV0cgLx+iS6bPBG9YtriiS5KfXtrxjnNVz/0I/K+ZP9YUSADQ
	 7sI+L20G0I1cXeRBducF+SirdXhsszdFQ5UXbpTlHADIPm3DPorX6hFcsxBgv/l32x
	 BeQu35Ec2CT2dJbAiClMtM9c/qmdtCDGwNkAq55hVJeAazbMZD0pVriN90JwFnMPBw
	 Ii6dlSv+sHmgQ==
Message-ID: <sashiko-outbox-167870@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 6/6] arm64: dts: cix: Describe the Sky1 DMA-350 bus
 integration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jelly Jia" <Jelly.Jia@cixtech.com>
Cc: Frank.Li@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, robh@kernel.org, vkoul@kernel.org
In-Reply-To: <20261012084155.2547480-7-Jelly.Jia@cixtech.com>
References: <20261012084155.2547480-1-Jelly.Jia@cixtech.com>
 <20261012084155.2547480-7-Jelly.Jia@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 08:52:15 +0000
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dts: cix: missing memory-region for restricted AUDSS DMA
--

commit bb152839bba0e4fcf17541cd1a7e5a05b3b33ae1
Author: Jelly Jia <Jelly.Jia@cixtech.com>

arm64: dts: cix: Describe the Sky1 DMA-350 bus integration

The FCH DMA-350 controller sits behind an interconnect window, so the
addresses its DMA master uses differ from the CPU physical addresses.
Describe the integration as a bus node carrying the dma-ranges of that
window, with the controller itself as a child, and give the controller
the SoC compatible and the clock feeding it.

> diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/=
sky1.dtsi
> index 0a820f45feb96..1262f34794d21 100644
> --- a/arch/arm64/boot/dts/cix/sky1.dtsi
> +++ b/arch/arm64/boot/dts/cix/sky1.dtsi

[ ... ]

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

[Severity: High]
Does this node need a memory-region property to provide a restricted DMA po=
ol?

The AUDSS DMA-350 controller restricts its DRAM access to a 512MB window at
0xc0000000 via its parent's dma-ranges. Since system RAM normally starts at
0x80000000, default allocations for descriptors will fall outside this reac=
hable
window.

When a driver calls generic routines to allocate and map these descriptors,
such as in drivers/dma/arm-dma350.c:d350_alloc_cmds():

    desc->cmds_dma =3D dma_map_single(dev, desc->cmds, desc->cmds_size,
                                    DMA_TO_DEVICE);
    if (dma_mapping_error(dev, desc->cmds_dma)) {

the mapping will fail because the generic allocation is out of bounds for t=
his
device's DMA ranges. The global SWIOTLB bounce buffer would also be
inaccessible for the same reason.

> +				reg =3D <0x0 0x07010000 0x0 0x10000>;
> +				clocks =3D <&audss_cru CLK_DMAC_AXI>;
> +				resets =3D <&audss_cru AUDSS_DMAC_SW_RST>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012084155.2547=
480-1-Jelly.Jia@cixtech.com?part=3D6
