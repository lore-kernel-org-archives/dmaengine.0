Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9363B3BE6;
	Fri,  9 Oct 2026 04:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791519367; cv=none; b=uK8BsnzZRx+8ML1XtYJgSpXEy3VWU983WGGu9TmZbTH7h75aaIoBM1cPQ2x/zYLCcEI5fAkVb409bUtEX1VQROZjycooxLssvyL/TFGullBEEk6M2WxpJ15JzySx0ALNFB+mwfMnYTXFh5bxVfp1kaIYAhl11T6a+HfDi7FWIIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791519367; c=relaxed/simple;
	bh=7nsQ/CFr2bRdGrvFMR9gIyZePQV20O8yWgXqVLlG89o=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=dlo+Kur/fEWuX0s8lo/kMKqijE3sfuIDFsVZK4DCpYsmJDzkiHyKdpdwT6pViAXKikD+WJ3xUmspMLXMHCQ7Qz4Zs3oBiQrH5+MfWbyzDe0CqbrjR41bpjuXMow3KvoHYB3thhejP/n504q6r/UfJIE/bQe41Fv2CUyA/ekQfMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=THuBOByt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="THuBOByt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2951E1F000FF;
	Fri,  9 Oct 2026 04:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791519356;
	bh=WOSlKJokm5q8MmaFR+/WdqLseMu/Qg1iN5om2TLnJcw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=THuBOByt596dDpQh17H5A43Ch4534GpapcN9rh/P+NXlorLZbrSIR+ap28HlAe3a2
	 13JDjcirCwXe2oeaoCDupFnKVYcmsWZvbiYtKcQ8dF82X8YiduNVbdJ03Fs9PscDW1
	 RPvZNVj94l+7ysBjk5RGZnYFAXRLC9ZE4E9lbzsl1Poct7mqD3Aot2+tHlKSWHEhdF
	 ZSmlGoTWodbURlew1hGkdhbiFePs7Vs6V/d7qSDmoZHR8gMg7BhVj0y7LGhuQ1mWjV
	 tPOuH0C/mTI93edIbmDQ9SqFO2gvvzGrncE2wpOZLBlvJXk+bP6UvYszcyLg48+Mnl
	 V0nHxZdljoG0g==
Message-ID: <sashiko-outbox-164818@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/6] dt-bindings: dma: xlnx,zynqmp-dma: Add Versal
 Net compatible support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Golla Nagendra" <nagendra.golla@amd.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261009-adma-pm-fix-and-per-channel-reset-v4-4-55f5fe409c55@amd.com>
References: <20261009-adma-pm-fix-and-per-channel-reset-v4-0-55f5fe409c55@amd.com>
 <20261009-adma-pm-fix-and-per-channel-reset-v4-4-55f5fe409c55@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 04:15:55 +0000
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: invalid fallback compatible due to mandatory reset =
requirement
--

commit 9c2ab7ce56ba7e0b6e011ec582d150236f1eafe6
Author: Jay Buddhabhatti <jay.buddhabhatti@amd.com>

dt-bindings: dma: xlnx,zynqmp-dma: Add Versal Net compatible support

This commit adds a new compatible string amd,versal-net-dma-1.0 and marks
the resets property as required for Versal Net. It also configures
xlnx,zynqmp-dma-1.0 as a fallback for the new compatible.

> diff --git a/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dma=
-1.0.yaml b/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dma-1.=
0.yaml
> index 2da86037ad79e..ff8c9a0e5559a 100644
> --- a/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.ya=
ml
> +++ b/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.ya=
ml
[ ... ]
> @@ -16,17 +16,17 @@ maintainers:
>    - Harini Katakam <harini.katakam@amd.com>
>    - Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> =20
> -allOf:
> -  - $ref: ../dma-controller.yaml#
> -
>  properties:
>    "#dma-cells":
>      const: 1
> =20
>    compatible:
> -    enum:
> -      - amd,versal2-dma-1.0
> -      - xlnx,zynqmp-dma-1.0
> +    oneOf:
> +      - const: amd,versal2-dma-1.0
> +      - const: xlnx,zynqmp-dma-1.0
> +      - items:
> +          - const: amd,versal-net-dma-1.0
> +          - const: xlnx,zynqmp-dma-1.0
[Severity: Medium]
Is it safe to provide a fallback compatible string here when the hardware
requires a mandatory reset?

If an older kernel encounters a device tree using this fallback, it will bi=
nd
to xlnx,zynqmp-dma-1.0. The older driver will then attempt to operate the
hardware without parsing or asserting the newly mandated resets property.

Since the commit message explicitly states the reset is essential to recover
from a bad firmware state, providing this fallback allows older drivers to
attempt to use the hardware in an unrecoverable state, contradicting the
purpose of the ABI break.

(Notice that amd,versal2-dma-1.0, which shares the same reset requirement,
correctly omits the fallback.)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009-adma-pm-fi=
x-and-per-channel-reset-v4-0-55f5fe409c55@amd.com?part=3D4
