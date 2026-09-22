Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490264BD347;
	Tue, 22 Sep 2026 09:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790069645; cv=none; b=OW2krv+ufDJGa+QFXsGhIc8kBxPELb+z3sZNtm9M5/6U74NzbZKyGP4gVz0ac73WmQBl/j9omHOG89mVvoE7bkQw+uZKPaiZrolGYyr9lQ/e4tXkBk/WSaEyAx0nwjXlLOI8pkSkKOf2vzSnT6smJTR0yhm8HaT7bdqBOydxiH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790069645; c=relaxed/simple;
	bh=2TkFR5uB7VHGkSFx4DS807lKiViSUso0tMjwSRap4Cw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JEOoZf4UNtppK8ZAESCQn2hU9o3eg8jXOs9VQi6pl9Q7Bbh/qsbc74t9FrlmMbkzyC/+5tk3dA7rE6BWd62wGfHuiNDa/3jcwzuYE8rRDU0IiVpq/Gt7RqoonLJjFR8h9zaY1GM+4x7Dv5j7utwAZyMebEQS60my4QnVspR3kIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FxomlBVG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FxomlBVG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C62C1F00893;
	Tue, 22 Sep 2026 09:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790069642;
	bh=jLGQKf7Lc0edJu0XG+uPL3+zStcKlGy4BpeUjz7x6FQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FxomlBVGRhM5r3/mJboKSvEIzmh7VdPkKgpXzhzr6PPGRS/D3kEhyjaHcXZF3OTrT
	 cGMxOTbeSL2m3wGuGXTb+hbBNpwwKFb7GVb5m6nakQNqKLW9bB5A1jWbfmXT2JjaWq
	 gb51/GayXXB2cGmvYoNlH8h0UixkuclD40l/5TSuo1f0JgBEx7D39rcAOE8xvYLisM
	 es0bf48V4e2o2WIMtwbp6dTfVLzB1aLSiurjTJPheAomsLiHz6gtYvCjaRywKAzWRg
	 LSxqn4rYq/u4oFmDAbjYDR2hQXBB/WxoxcwYA2uhC44iBnNMblj1Q7JNGNnqjWmcln
	 PkGvzVc01tBfw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: dma: loongson: Add Loongson-2 DMA mux
 request IDs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Binbin Zhou" <zhoubinbin@loongson.cn>
Cc: vkoul@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <d8762c697fee7c2184f26968109162d59aef1514.1790068409.git.zhoubinbin@loongson.cn>
References: <cover.1790068409.git.zhoubinbin@loongson.cn>
 <d8762c697fee7c2184f26968109162d59aef1514.1790068409.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 09:34:01 +0000
Message-Id: <20260922093402.6C62C1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] dma: loongson: hardcoding physical DMA channel in device tree
- [Low] dma: loongson: expose LS2K0300_DMA_REQ_MAX in binding header
--

commit e4e9feb04bfe5cf0cae531423dc7021c3d20e99c
Author: Binbin Zhou <zhoubinbin@loongson.cn>

dt-bindings: dma: loongson: Add Loongson-2 DMA mux request IDs

Add DT binding constants for the Loongson-2 DMA mux. It covers UART,
I2C, SPI, I2S, ADC, and CAN peripherals for Loongson-2K0300. It also
documents channel-pair semantics for peripherals using paired channels.

> diff --git a/include/dt-bindings/dma/loongson,ls2k-dmamux.h b/include/dt-=
bindings/dma/loongson,ls2k-dmamux.h
> new file mode 100644
> index 0000000000000..dcc8df86befbb
> --- /dev/null
> +++ b/include/dt-bindings/dma/loongson,ls2k-dmamux.h
> @@ -0,0 +1,56 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Loongson-2 SoC DMA Mux dt-bindings
> + *
> + * DMA specifier format:
> + *   dmas =3D <&dma_mux <request> <channel> <flags>>;
> + *
> + * The <channel> cell selects a physical CMC DMA channel (0-7)

[Severity: Medium]
Does this design hardcode software resource allocation policy into the hard=
ware
description?

Device trees should describe immutable hardware wiring rather than software
policy. Since the Loongson DMA mux is flexible (e.g., UART0 can be mapped to
one of 4 channel pairs via a 2-bit register field), shouldn't the OS DMA
engine dynamically allocate an available channel from a pool and program the
mux accordingly?

Statically assigning the channel in the DT shifts this policy to the hardwa=
re
description, preventing dynamic allocation and risking runtime resource
conflicts if multiple peripherals concurrently request the same statically
assigned channel.

> + * For peripherals using channel pairs (UART, I2C, SPI2/3, I2S),
> + * the channel number selects the pair: 0/1 -> pair 0, 2/3 -> pair 1,
> + * 4/5 -> pair 2, 6/7 -> pair 3.
> + *
> + * Copyright (C) 2026 Loongson Technology Corporation Limited
> + */

[ ... ]

> +/* CAN-FD controllers */
> +#define LS2K0300_DMA_CAN0		18
> +#define LS2K0300_DMA_CAN1		19
> +#define LS2K0300_DMA_CAN2		20
> +#define LS2K0300_DMA_CAN3		21
> +
> +/* Total number of 2K0300 DMA requests */
> +#define LS2K0300_DMA_REQ_MAX		22

[Severity: Low]
Is it safe to expose LS2K0300_DMA_REQ_MAX in a device tree binding header?

Device tree binding headers define the stable ABI between the hardware
description and the operating system. Exposing a _MAX macro is a known DT
anti-pattern.

If future hardware revisions or bindings add new request IDs, updating the =
_MAX
macro breaks backward compatibility with older compiled device trees or dri=
vers
that rely on the previous value, potentially leading to out-of-bounds acces=
ses
or ABI mismatches.

Should this macro be removed from the ABI header to prevent misuse?

> +
> +#endif /* _DT_BINDINGS_DMA_LOONGSON_LS2K_DMAMUX_H */

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790068409.gi=
t.zhoubinbin@loongson.cn?part=3D1
