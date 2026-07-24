Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C51433936A;
	Fri, 24 Jul 2026 10:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784889977; cv=none; b=oSmIamTmw+5H/plBgQYJ+8oJxWltNJGC1davYD31q8R4yG2ww6rYH4SZoBGStc3+EihHp7Pn7cvb1tJO+hEb9D1r+bX0QG4GJU6uuLWX4mTaOQ82t51qcuHOVqzxc9NNXphbTLWSyuhSkmIdsw1H+VKn79m3ljZb7SJxyMihaVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784889977; c=relaxed/simple;
	bh=btvj1URf7qVPZlsaWfc3KC6lC2xUM12FLFzzj6V20bU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UgA7pBsOOFXN17KtLa0X9ufwtcPa2ctCOlVB5etUOHs8KLR+3kCZNM1u7UmjGCXYNCor9QYHfXh/UKNgjbqHrfjJ6n9iMfh4cxyRux5/kjCbj9E2HVQvoD+7ASZJefX5DMpyB/21SegFT5YShct/ZfBqe3BmiWg1R7nf8bM85sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gidMRu4i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gidMRu4i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3CA91F000E9;
	Fri, 24 Jul 2026 10:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784889976;
	bh=NcEtg4MUc+ptF5sUT54X9MH3FZGZN6He4/DEHmu1/sk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gidMRu4iqjgkBofEMMAnLCqAsZZLvt61bcdJoizHILRxKp9HbwwkZw0rIS+hpODOw
	 9JJZVsg2q6y0i8G3bn30DWkIAT4JPPxLOexmB0/m+6ec9SNXAHwScMGI7gfq9Yo5xp
	 +20GeRqai6oP5AJ317hxITVJtSPQ3YUAt0Z05fE45yOxKScMve5ccwujUMA6gSbmVs
	 Rh/ZxBZaQLDOzcgCfwwu23V9zAAbYJq/ptfQ79yHinmdNzcZdjTStmEjNuDYvYQzxR
	 O8TobK3wHImJRKJxUKki4sHF9HIEvwMLDQvgzCJZXGXWdxd7BI0KUtHelLJiQcNHf1
	 nuMC0jOdISr0g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 14/19] dt-bindings: dma: ti: Add K3 PKTDMA V2
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sai Sree Kartheek Adivi" <s-adivi@ti.com>
Cc: Frank.Li@kernel.org, conor+dt@kernel.org, robh@kernel.org, vkoul@kernel.org, devicetree@vger.kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260724102115.2854-15-s-adivi@ti.com>
References: <20260724102115.2854-1-s-adivi@ti.com>
 <20260724102115.2854-15-s-adivi@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 10:46:15 +0000
Message-Id: <20260724104615.D3CA91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `#dma-cells` documentation describing TX/RX flow index interlea=
ving directly contradicts the `interrupt-names` example.
--

--- Patch [14]: [PATCH v7 14/19] dt-bindings: dma: ti: Add K3 PKTDMA V2 ---
commit 1ae599a55fbde375545e0e61dca9e77cb2c44acc
Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>

dt-bindings: dma: ti: Add K3 PKTDMA V2

This commit adds a new device tree binding document for Texas Instruments
K3 Packet DMA (PKTDMA) V2. PKTDMA V2 is introduced as part of AM62L.

> diff --git a/Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-pktdm=
a.yaml b/Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-pktdma.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-pktdma.yaml
[ ... ]
> +  "#dma-cells":
> +    const: 2
> +    description: |
> +      cell 1: Flow ID for the peripheral
> +        This is the hardware flow index assigned to the peripheral. TX f=
lows
> +        use even indices and RX flows use odd indices in an interleaved
> +        manner. For XYMF peripherals (SPI, CRC32) each chip-select/FIFO =
has

[Severity: Low]
Is this description for the TX and RX flow indices correct? The text states
that TX flows use even indices and RX flows use odd indices in an
interleaved manner, but the example below contradicts this.

[ ... ]
> +        interrupt-names =3D "rflow0", "tflow1", "rflow2", "tflow3", "rfl=
ow4",
> +                          "tflow5", "rflow6", "tflow7", "rflow8", "tflow=
9",

[Severity: Low]
The example shows RX flows using even indices (e.g., rflow0, rflow2) and TX
flows using odd indices (e.g., tflow1, tflow3).

Additionally, the interleaving appears to be abandoned for higher indices
later in this array, which shows contiguous blocks for TX (flows 64-79) and
RX (flows 96-111).

Could the description for #dma-cells be updated to accurately reflect the
actual hardware flow mapping shown here?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724102115.2854=
-1-s-adivi@ti.com?part=3D14
