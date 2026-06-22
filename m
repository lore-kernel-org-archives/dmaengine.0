Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B90E1A9FB7;
	Mon, 22 Jun 2026 01:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782092974; cv=none; b=CSPndxg2R498AMCepY/OioUnn8K2hPKRCU8xvgRmHGsmMHFI7OP0nZfmXmxG7ZvVXsH1kGwuLHM4YWaNaiz/eJJ1iAfQfvEe4iTCS15B2/7v3x4tqkjSRXcfx5xnu2LEt3XRhz1NWD2uLv+6Ie7PyITS/msSSMUgr/iI6RGeTC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782092974; c=relaxed/simple;
	bh=6JIoYqWUxjfo3qLw6huDHU+liEIJ9TF2/6gFT0VQ8UY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UzR7/Ug+s5V2fEAicyfsCRwMD0wUg/30tKEg3hqN2URo2vAYlBUm3lbRPYcqht195icyOjDSRXFjT/Rl/3Jz21Vfg0QpHUi11mquNzWXww4eey0KzHqAg2n/P9CLNrmqok2hmGWfuaQqPD2ySopcRrmXxjAFI+/mVZnqvJtbyFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kvrWCJeB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kvrWCJeB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 550FB1F000E9;
	Mon, 22 Jun 2026 01:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782092972;
	bh=UIzUXjDSarwRPsMCRvdt/9hiOeZWccHQoCRPWGOZdmQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kvrWCJeBPQDdeyzqJXnOUZj8h6ndo3DMjBfPxda/OXdLVjbWYQgG5NIUUWAjr8gXt
	 KB7QlkcwleY0AKuXH9qmOtbomMHaT4PUW7FA/yzjWGcIQxoaol+5Gi1r9wHo6PPped
	 yRtKHNj5wRIvpSnml8dzCtI1KNgpQnYcqU21ywwG/rXv2KvIrr/KW3sKfIkXwT6VG8
	 uQYNLRDlsgQz9fcOGzmEWWd7y5G46cZb4B4ZzLRtL/2Q+LhAUXdL9a4NMBDYM8dGcu
	 FAcoWarDfeb1RVh04aHTrw3RW2R2gx444CGAgTCJwcySNlTfPNchfG7fnC49AW1/4d
	 ecMhcXgRHiegw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/5] dt-bindings: dmaengine: sun50i-a64-dma: Add
 allwinner,sun60i-a733-dma compatible string
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yuanshen Cao" <alex.caoys@gmail.com>
Cc: conor+dt@kernel.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, robh@kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260622-sun60i-a733-dma-v3-4-f697ef296cbc@gmail.com>
References: <20260622-sun60i-a733-dma-v3-0-f697ef296cbc@gmail.com>
 <20260622-sun60i-a733-dma-v3-4-f697ef296cbc@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 22 Jun 2026 01:49:31 +0000
Message-Id: <20260622014932.550FB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] The interrupt handler reads the status for higher physical cha=
nnels but incorrectly applies completions to channels 0-7, causing cross-ch=
annel corruption and dropping interrupts.
- [High] The interrupt handler loop bound truncates remainders, skipping th=
e last interrupt register for SoCs whose channel count is not a multiple of=
 `num_channels_per_reg`.
--

commit 949f13d1f9dc8ae54064e512fd45f644694422c7
Author: Yuanshen Cao <alex.caoys@gmail.com>

dt-bindings: dmaengine: sun50i-a64-dma: Add allwinner,sun60i-a733-dma compa=
tible string

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

[Severity: Critical]
This is a pre-existing issue, but does the interrupt handler in
sun6i_dma_interrupt() correctly handle the physical channel calculation?

Looking at drivers/dma/sun6i-dma.c:sun6i_dma_interrupt():

    pchan =3D sdev->pchans + j;

The physical channel is derived from the inner loop index j alone, complete=
ly
ignoring the outer loop register index i. For the newly added sun60i-a733
(where num_channels_per_reg is 1) or SoCs with more than 8 channels, an
interrupt on a higher channel will incorrectly apply the completion to chan=
nel
0.

Can this corrupt the state by signaling spurious completions for active
transfers on lower channels while permanently hanging the actual completing
channels?

[Severity: High]
This is also a pre-existing issue. Is the interrupt handler skipping regist=
ers
for SoCs whose channel count is not a multiple of num_channels_per_reg?

Looking at the loop condition in sun6i_dma_interrupt():

    for (i =3D 0; i < sdev->num_pchans / sdev->cfg->num_channels_per_reg; i=
++) {

The loop bound uses integer division. For SoCs like the H3 (which has 12
channels and 8 channels per register), 12 / 8 evaluates to 1.

Will this cause the loop to only check the first register (channels 0-7) and
completely skip the second register (channels 8-11), permanently dropping
interrupts for channels 8 and above? Would using DIV_ROUND_UP() be more
appropriate here?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260622-sun60i-a73=
3-dma-v3-0-f697ef296cbc@gmail.com?part=3D4
