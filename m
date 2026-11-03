Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793673369;
	b=Ra10eYVhRNM2q2ApM7y5qeoqUTYwCigvDvp8ckDpwPvnxys9b1aF1AtNDQNlTeWmMlJa
	 O5Sh2bDeNfLEQnWxCNa+XqlumlJF57EpYCz9NuW8A457pM1E0oobAVbAeHAzh7MHR/Vu9
	 8O6zj+hYk775nap1svfOuQkyJ5pPcunfSQItPeqr/ZfkrIZ9FSpGvrXO+mZXio7gEo2qv
	 E4c39JWB38u1MA8o5hsV++FgujUJGaA4heMWaGB1zIHEd+GQF81ZbMr4dwoerU9QmOI6X
	 luNv2wPIaPpBGEvzu4WlQjEBZbdrT1OzW6X0APx393u7m6KJDj97f9DW47m8uc2CC6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793673369;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=EOY7lKQ2343iKZVXjbGxKQTPMo/zIAHZ2MfL3CmeO/A=;
	b=Ej9Kb4xZE8lvJh5cseKfso78GeZM31HewvWaQUFvx9jLMjB+j2L1uoJpnUiz0gls1L51
	 LhnBwXpn7Wo74lrDX/U1jNnbS+DpoZbm/r/po0BHoRh3EgnR+draHKB+lAuTJYDdhkECR
	 3hL8bs3WjT9v831mN46NjVFTttFgsIYj9yGL/RiG67S1JPFL4zW6MfVgsm97GUGIn4aWg
	 fdKrgWisgQ8mN9zf27IVENPd5MinKPB5pQqZJS+aegBr9PRnmATXl8Hrnv72c7N9dGvjP
	 LrHFHm8JLpogcSq4B0hLvr7UZcTdbeQnTmV+DD4tc634B/JKo4tiiarx0JaWHLSPikg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZkHHpg4m;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1D5606A324;
	Tue,  3 Nov 2026 02:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZkHHpg4m
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F373B1F000C1;
	Tue,  3 Nov 2026 02:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793673369;
	bh=EOY7lKQ2343iKZVXjbGxKQTPMo/zIAHZ2MfL3CmeO/A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZkHHpg4m2lTbN626X2fvYE78IXUqvVVkdraaRL3Be3Fu93XaYSk0UjxonC7p6Pa52
	 86ljyTytSbuVFOvfiJcnjHmA94bptgw32nTMrTkXF6qkovsvP6MIWTi54qJ2itPLFE
	 JsTMT1xDjKsr+QKR5nEmY84AK85EAIXB55Skt0tRRJN1OQ17RQFZFeV8C/6aaS59no
	 kYjaJ9693dda2Jqj4n78bT4NQykhIgSRynCjLdBbimoVRcE8aHMx4aatkt6bB9ozfQ
	 +0lCd/tNU7u77hrOozN1gZv8N5hv/n55Wp5vuW3KD7HWmPYqIzzTYHsSGQ8MljzPNR
	 BDJhTd0rnQhog==
Message-ID: <sashiko-outbox-194464@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: dma: nuvoton,ma35d1-pdma: Document
 MA35D1 PDMA controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shan-Chun Hung" <shanchun1218@gmail.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261103022202.2139674-2-shanchun1218@gmail.com>
References: <20261103022202.2139674-1-shanchun1218@gmail.com>
 <20261103022202.2139674-2-shanchun1218@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 02:36:08 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] dt-bindings: dma: nuvoton,ma35d1-pdma: additionalProperties blocks =
common props
- [Low] dt-bindings: dma: nuvoton,ma35d1-pdma: missing resets property in s=
chema
--

commit 5c880c71a9c2f4fa473d23c5e2bcf77d9794575d
Author: Shan-Chun Hung <shanchun1218@gmail.com>

dt-bindings: dma: nuvoton,ma35d1-pdma: Document MA35D1 PDMA controller

This commit adds the devicetree binding schema and request source header for
the Nuvoton MA35D1 PDMA controller.

> diff --git a/Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.ya=
ml b/Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml
> new file mode 100644
> index 0000000000000..cd752571242c6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml
> @@ -0,0 +1,72 @@

[ ... ]

> +allOf:
> +  - $ref: dma-controller.yaml#
> +
> +properties:
> +  compatible:
> +    const: nuvoton,ma35d1-pdma
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1

[Severity: Low]
Should this binding also document the resets property?

The MA35D1 reset binding and driver define dedicated hardware reset lines f=
or
the four PDMA controllers:

include/dt-bindings/reset/nuvoton,ma35d1-reset.h:
    #define MA35D1_RESET_PDMA0	4
    #define MA35D1_RESET_PDMA1	5
    #define MA35D1_RESET_PDMA2	6
    #define MA35D1_RESET_PDMA3	7

drivers/reset/reset-ma35d1.c:
    static const struct ma35d1_reset_map ma35d1_resets[] =3D {
        ...
        [MA35D1_RESET_PDMA0] =3D   {0x20, 4},
        [MA35D1_RESET_PDMA1] =3D   {0x20, 5},
        [MA35D1_RESET_PDMA2] =3D   {0x20, 6},
        [MA35D1_RESET_PDMA3] =3D   {0x20, 7},

Without resets in the properties block, describing the controller's hardware
reset line in a devicetree node will fail dtbs_check validation.

> +
> +  "#dma-cells":
> +    const: 2
> +    description:
> +      The first cell is the channel number. The second cell is the
> +      peripheral request source (REQSRC) selection, which defines which
> +      peripheral is connected to that PDMA channel.
> +
> +  dma-channels:
> +    const: 10
> +
> +additionalProperties: false

[Severity: Low]
Since this schema references dma-controller.yaml# under allOf, shouldn't it
use unevaluatedProperties: false instead of additionalProperties: false?

Using additionalProperties: false causes dtbs_check to reject standard DMA
controller properties inherited from dma-controller.yaml# and
dma-common.yaml# (such as dma-channel-mask or dma-requests) unless they are
duplicated in the local properties block.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103022202.2139=
674-1-shanchun1218@gmail.com?part=3D1
