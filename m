Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613332475F7;
	Wed, 26 Aug 2026 02:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787713040; cv=none; b=ApT0X+2RHQLxlY6I57T3/bWMM/Vn4UCpw7qnxSn+a7Hoz+TaIc4rDkIRG7nXvHXEyP9lJCp0y0C0Q8azPlcRrdDj6MbQEfDgLnhZLJzyTrU83fEDlTAwyePZIibTGvn/LHVfAqRU0RI5mfv5szN2YzYaKZhSeMrQOhLQfxjq2P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787713040; c=relaxed/simple;
	bh=HzoXLhpv88+e6DArySxtD3hpa6ZYEbiaxtb53KZ9zfI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DhCtEkXFu1SbuQaeN2dSyLmi7oxeDfCBQpOUpUkHaUYoeuTLuXpK+sZ7wCWABkUlfyIj6SH80FcQUmARAyoFTNuWm0pBo4Onoq92bz1G6WGJvO7Dc477XRUe1PyaxefWqM6NDMcW8xJjc5aUGtu8T90nT8VPtvwmYjLbr15bK5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RMwyXDnn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RMwyXDnn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BFB81F000E9;
	Wed, 26 Aug 2026 02:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787713037;
	bh=SQgVba5awJSvFnBRi53X6mD445bT/TKglLPLlOBNNBg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RMwyXDnnOznQI1/7cxZvwcTXoiHiM04yUEzNgPB8ZaAy24aqZDgkPn4sc4BTXx2tr
	 riqWI20Veq6ExnErJfw+YWSYY0sGB4Sho+fb2qQYZN+Cm9c/+asBnTO6vPZdCmarZZ
	 LpySDleQAi7hSjEXTjRQg017vwBDfrPLc//Ic/WAIfNkCc56ssxkrUq3wT1vtnwaws
	 0Nry46f0mcRfr93281B+RQBIn/YSYwJnAMOp5B89RdqMNQdQlbxwdqkoXHpGTxpnI0
	 MccHPuOc1K1CISbQnuyg/D/VdKNpuUP82UUTnRpmGp5yXAqvUhBUM2mbuk5fyAvtiI
	 63QH8CNQyXVIQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/5] dt-bindings: dmaengine: sun50i-a64-dma: Add
 allwinner,sun60i-a733-dma compatible string
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yuanshen Cao" <alex.caoys@gmail.com>
Cc: robh@kernel.org, dmaengine@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260826-sun60i-a733-dma-v5-4-abc5229b441e@gmail.com>
References: <20260826-sun60i-a733-dma-v5-0-abc5229b441e@gmail.com>
 <20260826-sun60i-a733-dma-v5-4-abc5229b441e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Aug 2026 02:57:16 +0000
Message-Id: <20260826025717.0BFB81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Loop bounds calculation in `sun6i_dma_interrupt` truncates unalign=
ed channel counts, causing interrupts for higher channels to be permanently=
 missed.
- [High] Incorrect indexing of the physical channel array in `sun6i_dma_int=
errupt` maps status bits from subsequent interrupt registers to the wrong p=
hysical channels.
--

commit 42af4e68ee14f82cbb1311fbd3ef28760a3616bc
Author: Yuanshen Cao <alex.caoys@gmail.com>

dt-bindings: dmaengine: sun50i-a64-dma: Add allwinner,sun60i-a733-dma compa=
tible string
   =20
Add allwinner,sun60i-a733-dma to the list of compatible strings for the
sun50i-a64-dma dtbinding documentation.

> diff --git a/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-d=
ma.yaml b/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.ya=
ml
> index c3e14eb6cfff9..1cc3304b74149 100644
> --- a/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml
> +++ b/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml
> @@ -25,6 +25,7 @@ properties:
>            - allwinner,sun50i-a64-dma
>            - allwinner,sun50i-a100-dma
>            - allwinner,sun50i-h6-dma
> +          - allwinner,sun60i-a733-dma

[Severity: High]
This isn't a bug introduced by this patch, but adding a new compatible
string here might expose existing issues in the driver if the A733 DMA
controller uses unaligned channel counts or more than 8 channels.

Looking at sun6i_dma_interrupt() in drivers/dma/sun6i-dma.c, does this loop
condition fail to round up unaligned channel counts?

drivers/dma/sun6i-dma.c:sun6i_dma_interrupt() {
...
	for (i =3D 0; i < sdev->num_pchans / sdev->cfg->num_channels_per_reg; i++)=
 {
		status =3D sun6i_read_irq_stat(sdev, i);
...
}

If a device tree specifies a dma-channels value that is not a multiple of
num_channels_per_reg (8), this loop bound evaluates incorrectly. For exampl=
e,
with 12 channels, it evaluates to 1 instead of 2.

Will this cause interrupts for the trailing physical channels (e.g., 8-11)
to be permanently ignored, resulting in DMA transfers on those channels
hanging? This pattern was fixed with DIV_ROUND_UP in
sun6i_dma_dump_com_regs(), but appears to be missed here.

[Severity: High]
This is a pre-existing issue, but I also noticed a potential problem with h=
ow
the physical channel array is indexed in the inner loop of the same functio=
n:

drivers/dma/sun6i-dma.c:sun6i_dma_interrupt() {
...
		for (j =3D 0; (j < sdev->cfg->num_channels_per_reg) && status; j++) {
			pchan =3D sdev->pchans + j;
...
}

Since this inner loop index 'j' is added directly to 'sdev->pchans' without
the '(i * sdev->cfg->num_channels_per_reg)' offset, will status bits from
subsequent interrupt registers (where i > 0) be mapped to the wrong physical
channels (0-7)?

Could this cause premature completion of DMA requests on low-numbered chann=
els
while the actual high-numbered channels hang forever?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826-sun60i-a73=
3-dma-v5-0-abc5229b441e@gmail.com?part=3D4
