Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0AC84E06D2;
	Fri, 25 Sep 2026 16:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790352689; cv=none; b=Of2j7jOoKCCRcfKo1DPalMf31iPfFBjbiJHcqgaD2BSw8mSLe7hR3IV1nG4MnBjo3pH1nc4zUeFrZjSr+dy1XckCclEEtFeLDsaK+KJA67EwKpps8megOPN7VnTT5MfFdMED+FWRXA7H33mc94qdl/Ze1OmURcWmXhru1PJU3W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790352689; c=relaxed/simple;
	bh=0Ep5/yJcQkQR/amNx9lZmRYzt6UcSlwacpPo8zAo+Ig=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ODGM4CIEEHE/NrnUHjIeJdBsq/Tcvq/p6LfGZ7vFjqdpFfnw+C5/VqPC0UeZFbICMKhwGcK86KI8fnGKoOGdYyOVkQwmqpM685gcxMLiu9E/N/CI188fXFuUBSeTSYxTQWKMS//2o9SNmmcsU2zDw8ZJuku59pkcIJ6Q/xHm0o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mpgTlH2w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mpgTlH2w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 151221F00893;
	Fri, 25 Sep 2026 16:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790352687;
	bh=iIV0HYVUOvjoEsNB3F2jlX26Iny1jwqmfjKvpE6BGYU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mpgTlH2w2Cnf5SvtPlU9Hbg/VEsJdPMggnV7KSxJaF9C6hhWayB9CIH3wH9L1prD8
	 a3gAuCDTZaJ42mbL/X+BNlWQQX9LQ3N5Bb5tF/8bjVTLMoNPCypXUSd5XMCT38Y0SR
	 Mr2S3errYAFXVEO656JwEwFTlxjIO++kyxqEuJqMrDVuaZoIGFAbLpKBUGkHOheT26
	 Z0lRgP7ykSqXMB82VbMJ4e8H+EBi++BH4dhomjp3E3SW5jRGfSp5L8lAMWL81CnQef
	 atDG12R30YgYA6NXxKvTFhE1igN0IJzUqjTsAR46kEaGs9/cMGSJ8ozTyw+R/f3iju
	 xRnNP+UBp5hBw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: dma: Convert hisilicon,k3-dma-1.0 to DT
 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Um9iIEhlcnJpbmcgKEFybSk=?= <robh@kernel.org>
Cc: robh@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260925160354.1722583-1-robh@kernel.org>
References: <20260925160354.1722583-1-robh@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 16:11:26 +0000
Message-Id: <20260925161127.151221F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: invalid node name in example failing dma-controller.ya=
ml schema
--

commit e8e749663f823d5245b7a4660ed5a57fe7046856
Author: Rob Herring (Arm) <robh@kernel.org>

dt-bindings: dma: Convert hisilicon,k3-dma-1.0 to DT schema

Convert the hisilicon,k3-dma-1.0 binding to DT schema format. Add undocumen=
ted
properties and make clocks optional for the hisilicon,hisi-pcm-asp-dma-1.0
hardware.

> diff --git a/Documentation/devicetree/bindings/dma/hisilicon,k3-dma-1.0.y=
aml b/Documentation/devicetree/bindings/dma/hisilicon,k3-dma-1.0.yaml
> new file mode 100644
> index 0000000000000..7a7aab5f4c66c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/hisilicon,k3-dma-1.0.yaml

[ ... ]

> +additionalProperties: false
> +
> +examples:
> +  - |
> +    dma@fcd02000 {

[Severity: Low]
The dma-controller.yaml schema referenced in the allOf block enforces that
the node name matches the regex pattern ^dma-controller(@.*)?$.

Since this example node is named dma@fcd02000, will it fail validation duri=
ng
make dt_binding_check? Could this be updated to dma-controller@fcd02000 to
satisfy the schema requirements?

> +        compatible =3D "hisilicon,k3-dma-1.0";
> +        reg =3D <0xfcd02000 0x1000>;
> +        #dma-cells =3D <1>;
> +        dma-channels =3D <16>;
> +        dma-requests =3D <27>;
> +        interrupts =3D <0 12 4>;
> +        clocks =3D <&pclk>;
> +    };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925160354.1722=
583-1-robh@kernel.org?part=3D1
