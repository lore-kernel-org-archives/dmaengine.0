Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447063;
	b=qtfI8y3khyzkTGYwrVQYtxTktemq3EuNvVOVzOCEkRYXNKG4fR0DuMD6nDIyBzE3q15H
	 wNUTIgTJ2c1Q0alj2kk/bATNJfQZ+2YqI7yT8R4fErxDO3wbN6YJIjhC+b9zIhcednQjb
	 H02WW9ddwyXsLd65MTc/lXJxuZwdr5Z9fXynC6OCcZWvGSawCQ8R+XR+LVq1JCivJykNH
	 2yCkVvm6d7OJ4Yf3fvFjls3jJ3SK+oLVXjIfA+eN7Ih8Y2pxECGafpVTt7BPcJOHo40Yh
	 2JK3PcFP5c24YferCIUiA3T/o4k+icVsufhD41zzQBOvfcluyjLWneBLDvhR4oTk2fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447063;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=L+1aNlR8N9ev23TU3qk1mgOBZ4wK1YtUe8fD4Xnup7Y=;
	b=lv9c8ZLgKYGjeiq2CWRknIu8CeQVQfS/LHbQjvH3wHIhOi8CTIKO5IYSj59pn0nFt0Jw
	 7tdG0x4c/dDtHRhMW5HsNCpmB4Me7WU0PocXkjwVsvOk0YpRtMY7Z/micXT+MszRH7kmH
	 JIbrnbMhugbJAHjGTXzh/FDVReXmNakEmuO5AcgtADDfneSqeLmThz0nux1aD8BsVHcE5
	 Ug8sxWm3m77mMxoZ1EpbFzkaBFM3MuPV76QjeRe8zny03bpj9vyLZqFWZZPk+97/7I75i
	 TjIlVnHLEM39rYxKVh3RsPwvIce4jaA2ufZtB/xlrLka4DbEj1JSgGRskl+hag9SuVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F1MzZxEG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D33606A332;
	Mon, 23 Nov 2026 15:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F1MzZxEG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D9661F00A00;
	Mon, 23 Nov 2026 15:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795447062;
	bh=L+1aNlR8N9ev23TU3qk1mgOBZ4wK1YtUe8fD4Xnup7Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F1MzZxEGLbunHV/QQD3AfQ7OZPqVEs6gEiK8qS3ZasZdCAlZM002FPuIFFOY8pm9p
	 Gzu2I5OVZEoidhdXBAgJhkHibZRXLk4dS7fp8DHH9Luqtb+weYN7dH1bhJTIKMKCx9
	 QWecZIO7v5kwmtweXwbfCZWjIThEvzBabU3Y/v1ofZOrpmb+N9ZmJ5AXPNOPJAPuOd
	 j58fQgvdAhurYABYhfWSrEZT/exyerIb3W0NwJoIKC/CJDXW2L3bn5Vyni9tovXQrl
	 lNBmmXFgazzkBdLftbAleZK9H9xcoatXrKlStF+ZPQU2x7E9kV/mOxyyJ524Rea2AI
	 S11IBayDhLARQ==
Message-ID: <sashiko-outbox-229521@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 19/28] ARM: dts: broadcom: Describe the peripheral
 window in dma-ranges
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrea della Porta" <andrea.porta@suse.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261123145728.29082-20-andrea.porta@suse.com>
References: <20261123145728.29082-1-andrea.porta@suse.com>
 <20261123145728.29082-20-andrea.porta@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 15:17:41 +0000
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
- [High] ARM: dts: broadcom: bcm2711 /soc dma-ranges breaks arm64
  ZONE_DMA limit
--

commit 62f5c2b6b29c90da76685d8a93502df302796458
Author: Andrea della Porta <andrea.porta@suse.com>

ARM: dts: broadcom: Describe the peripheral window in dma-ranges

This commit adds the VideoCore peripheral address windows to the /soc
dma-ranges properties on BCM2835, BCM2836, BCM2837, and BCM2711 so that
dma_map_resource() can translate peripheral FIFO physical addresses to
DMA bus addresses.

> diff --git a/arch/arm/boot/dts/broadcom/bcm2711.dtsi b/arch/arm/boot/dts/=
broadcom/bcm2711.dtsi
> index 5e3b4bb393967..f475422796d8e 100644
> --- a/arch/arm/boot/dts/broadcom/bcm2711.dtsi
> +++ b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
> @@ -41,8 +41,12 @@ soc {
>  		ranges =3D <0x7e000000  0x0 0xfe000000  0x01800000>,
>  			 <0x7c000000  0x0 0xfc000000  0x02000000>,
>  			 <0x40000000  0x0 0xff800000  0x00800000>;
> -		/* Emulate a contiguous 30-bit address range for DMA */
> -		dma-ranges =3D <0xc0000000  0x0 0x00000000  0x40000000>;
> +		/*
> +		 * Emulate a contiguous 30-bit address range for DMA, and
> +		 * let the DMA controllers reach the peripherals
> +		 */
> +		dma-ranges =3D <0xc0000000  0x0 0x00000000  0x40000000>,
> +			     <0x7c000000  0x0 0xfc000000  0x03800000>;

[Severity: High]
Does adding the 0xfc000000 peripheral window to /soc dma-ranges raise
the arm64 ZONE_DMA limit above the 1 GiB RAM window that /soc devices
can actually reach?

On arm64, dma_limits_init() sizes ZONE_DMA and sets arm64_dma_phys_limit
from of_dma_get_max_cpu_address(NULL), which takes the highest
cpu_addr + size - 1 across all entries in a node's dma-ranges before
taking the minimum across nodes:

drivers/of/address.c:of_dma_get_max_cpu_address() {
    ...
		for_each_of_range(&parser, &range)
			if (range.cpu_addr + range.size > cpu_end)
				cpu_end =3D range.cpu_addr + range.size - 1;

		if (max_cpu_addr > cpu_end)
			max_cpu_addr =3D cpu_end;
    ...
}

This raises /soc's cpu_end from 0x3fffffff (1 GiB - 1) to 0xff7fffff.
Because the Raspberry Pi firmware rewrites emmc2bus dma-ranges on newer
BCM2711 revisions, /soc is the only node keeping the system-wide limit
at 1 GiB.  On boards with more than 1 GiB of RAM, ZONE_DMA and the
SWIOTLB bounce pool expand up to 3 GiB (0xbfffffff, from pcie0), so
GFP_DMA allocations and SWIOTLB bounce buffers can be placed above 1 GiB
where /soc devices have no RAM dma-ranges translation and fail DMA
mapping.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123145728.2908=
2-1-andrea.porta@suse.com?part=3D19
