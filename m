Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0F538E8D0;
	Mon, 10 Aug 2026 10:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786357212; cv=none; b=IwYs4wn82EM+UUYCd6o4zBlDifeW4bDRL3hw6tBTHl8WNnzRV9tgJs7gubno3E7XBnjt6VKHTGR+OuwLfSxCxdzRJ20o+8q5HnaKjvuk09nXBnobjrZ5Hw/5KIbn+NIkhvdFXsbnsmzmp7F1WlB3+VbADradTuWetVYPjkXZQKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786357212; c=relaxed/simple;
	bh=XKssdbTQCH1FzQYx0lXeAWxT4Pqf0FSdbfBQNtGeqD8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uIE+bh1BS7EDLysa/xVPHtDAR/8B82kOcNK9/LNlQ2ahCJNkuIWcAn1I/pXDYe/LM6oRBOZCmCwaa1ptc8HSm6rsARgzMFKV2yF0/lAgvByyDGpQqkMeueb4rchn5dxYWlF8ugNI6cqgX+8gLZfhZcDXO3Y+ihBNI4sc/YKFYxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oH8OSHDj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oH8OSHDj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 215D71F00A3A;
	Mon, 10 Aug 2026 10:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786357210;
	bh=oGnV1xvyBeDkFbNjgwX9YtXHJBlnX1o1IQ5gyH1pjMg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oH8OSHDjy1FqjUOIAIb2PVoK5mHbE8qUhUS007QGMERuJ0ta97itrbV49c3SnAmZN
	 xnUmizW+0gLA817GzbhIWjr7yGOxiLUU0/VcQQFaUl+Z4bGM1W9aAc8y0W8m3aEylJ
	 fhmWSFzOzY0GUyEApPsRR6nOKTd9XQpAHgw9JJOvJQ7rdb20zCvW1Ym4a0L7A1yGWj
	 SIhp9SBeybTBem/NE/s6bZfqRE02yrauApMZrD6P7WeIt83jkqyrZXr9FHht0Et+8N
	 jgGI0CjKWp7ZAtqEMZMBafOfA5f+4n+qTH+Hq6plJAAv5MVRj0iC/uPy3VUlOoVzgu
	 B0c1PCn+XmHsA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V3 4/6] dt-bindings: dma: xlnx,zynqmp-dma: Add Versal
 Net compatible support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Golla Nagendra" <nagendra.golla@amd.com>
Cc: conor+dt@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260810100452.426320-5-nagendra.golla@amd.com>
References: <20260810100452.426320-1-nagendra.golla@amd.com>
 <20260810100452.426320-5-nagendra.golla@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 10:20:09 +0000
Message-Id: <20260810102010.215D71F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Invalid fallback compatible string `xlnx,zynqmp-dma-1.0` for `am=
d,versal-net-dma-1.0`.
--

--- Patch [4]: [PATCH V3 4/6] dt-bindings: dma: xlnx,zynqmp-dma: Add Versal=
 Net compatible support ---
commit c94f71cbb3b4d274afbe8968d6bb108158803292
Author: Jay Buddhabhatti <jay.buddhabhatti@amd.com>

dt-bindings: dma: xlnx,zynqmp-dma: Add Versal Net compatible support

This commit introduces the amd,versal-net-dma-1.0 compatible string with a
fallback to xlnx,zynqmp-dma-1.0. It also adds a required per-channel reset
property for Versal Gen2 and Versal Net because the DMA channel must be
reset to clear the state left by firmware.

> diff --git a/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dma=
-1.0.yaml b/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dma-1.=
0.yaml
> index 2da86037ad79e..87c65aef5c7d3 100644
> --- a/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.ya=
ml
> +++ b/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.ya=
ml

[ ... ]

> @@ -18,15 +18,31 @@ maintainers:
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
Is this fallback compatible string appropriate here?

The commit message explicitly states that a DMA channel reset is essential
because the device is left in a bad state by firmware, and DMA functionality
fails without it.=20

If a device tree is parsed by an older OS using the fallback
xlnx,zynqmp-dma-1.0 driver, it will attempt to operate the hardware without
knowing about the new resets property. Since the older driver cannot perform
the required channel reset, won't the DMA functionality fail just as
described?

Should the fallback be removed if the older driver cannot reliably operate
the device?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810100452.4263=
20-1-nagendra.golla@amd.com?part=3D4
