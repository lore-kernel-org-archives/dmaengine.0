Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0593ACA7C;
	Mon,  1 Jun 2026 09:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780307936; cv=none; b=JgANFZAiQFsYbGNIUDFgyIzYu4Xv/rzBt8yy8kSFBAesJYK0cpbdua4sokou5EolmOzF32NCdPMr/aXJvzZdYeszDeaGVF019CDxOhcZbGk98Kd28fmSqiTfn3TAedeD0OBpnghW/ZgPrlR9jOZvENefko+Wt86vHmHXKNhyk8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780307936; c=relaxed/simple;
	bh=bEazeAebAUV6jPXRuP9/77Msccaaz2doB/rXC+HZu+Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Jud8qF3Y3wxnArxTdT51987TwbpFQztwPSadCh7OhjaHOZ+oDw62mB9U5YMLHR8C242X+z1lwImi7bfmorYTU22VluLUnZf50R/iuS/N2SPRaIjBDBcWUBPRjKG84b2XhFoIHHSIeqKCxWXOGJdT+fFfaktSTc5dgLVHOhyMSIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ChVJcYWl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ChVJcYWl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B2431F00893;
	Mon,  1 Jun 2026 09:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780307926;
	bh=LePCTfN56H/WPSoRi3CkNytKD/M2TpSTQ0+ItJTWOX8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ChVJcYWl60GzBSMLP5RdrsNdGGnq8bd4wKkvO+5gJMV+q7q7W0MsezyDtyJo12gbI
	 jy3rdo18UaCGBLaKWJ7B9cBUF4jw2JXVQEI1bGObD+wXejXS3459pW2lsymxhB4QUB
	 4HUrRKniQC4Aa+B1IMkD8BcvS7NQpDVQmhCt1lRSuvsOXHzv0tnI8FzVuu84HGfEC4
	 ochNygN5AS5xwRmLK6GHY/Z1pgjD1nE8gSujmXH5ZNpaScy4BQCuVbBfdmliyPUDkt
	 DXz1MEOjvPKauLqEA8wXj3evnC6Be+Adcc5DEZ4e2Ev2mEf8XUIeSz+kh8MURe7d2P
	 WcivAssE29r2Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: dmaengine: Add support for
 ATCDMAC300 DMA engine
Reply-To: sashiko-reviews@lists.linux.dev
To: "CL Wang" <cl634@andestech.com>
Cc: vkoul@kernel.org, robh@kernel.org, conor+dt@kernel.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260601094846.1097678-2-cl634@andestech.com>
References: <20260601094846.1097678-2-cl634@andestech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 09:58:45 +0000
Message-Id: <20260601095846.3B2431F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The Device Tree schema uses `additionalProperties: false` alongside=
 an `allOf: [ { $ref: dma-controller.yaml# } ]` inclusion, which violates D=
T schema guidelines and prevents the use of standard generic DMA properties.
--

commit 65ee89a1dfc4e52aa6a4083163369bef3de2c374
Author: CL Wang <cl634@andestech.com>

dt-bindings: dmaengine: Add support for ATCDMAC300 DMA engine

This commit documents the devicetree bindings for the Andes ATCDMAC300
DMA engine. The IP is embedded in AndesCore-based platforms or SoCs
such as AE350 and Qilai.

> diff --git a/Documentation/devicetree/bindings/dma/andestech,ae350-dma.ya=
ml b/Documentation/devicetree/bindings/dma/andestech,ae350-dma.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/andestech,ae350-dma.yaml
[ ... ]
> +allOf:
> +  - $ref: dma-controller.yaml#
> +
> +properties:
[ ... ]
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - "#dma-cells"
> +
> +additionalProperties: false

[Severity: Low]
Does this cause a regression during schema validation when standard DMA
properties are used?

Since this binding references dma-controller.yaml# via an allOf block, using
additionalProperties: false will reject generic properties like dma-channels
or dma-requests if they are present in the device tree node.=20

Should this be unevaluatedProperties: false instead to properly allow the
inherited properties?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601094846.1097=
678-1-cl634@andestech.com?part=3D1
