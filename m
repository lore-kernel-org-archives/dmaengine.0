Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642713E834B;
	Wed, 10 Jun 2026 10:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781086313; cv=none; b=Y9NufuykGK3CynW+yC8S3Pg6iSSklqCbx8RnK4gAhvG14z7nbblcP+l4BhtHIH52e0Jrr++WVx0JMpD4+wbk65ox9Ki3I8QpEcexRIbUa+9vojDlH3BQdL+cYzf7khINKRZ6rDQsj7ZEvWzbfaMiyiRJvaLFCFsN0kQo/P2Ibi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781086313; c=relaxed/simple;
	bh=TGppL9hDgW5mi5BZI2txZVKn4B8Bduk6VVtIfcRfxcU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WsPG+8R9kLW05mK98qCdZ9VfO1T5r5chJyHocPW7I08G0QJcqpVwmIktFGdvurissZPveO+2eGKm9WNzs+4xjPJ3QUCizzmhDUK6Pf2iUKGMg9tFRhRZWhV1mb4SCRDoYT9AA238mMyMjIYBwhQXYqTPPDgn1ja8OAKMmMb0nhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mThRrkQu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mThRrkQu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA1611F00893;
	Wed, 10 Jun 2026 10:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781086312;
	bh=w2L/TnCaqDd4KnTRIQ+TaHnC3QgS/VxXV74wjJWXoG4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mThRrkQusiGr8imwkIt5HOS7tZlAK8UwMj6FPIg9iAPFP3GvN1zrRtUbLN/07uPKo
	 KFScJG5xbtLlguGnyc7HGTvMXwNRu54MlEe8cCOVkV6BeaOP+Hu49Dhlku0k1hbE/t
	 X8IxNyArUuf6I8IE8OmVUlI3pYh142nnxX7dfSCBFGxSaeclD7bwt3M2ZSLjSJK2yf
	 wE/noCbSn109cGucbeMzbCuWObtn2bjiHHWfWqo3O6HDhCx/jAwBsLqnQhya5m1Oeh
	 m6kUSl6w1JsIAVMH56Rva12S08hcJwd2e3omZrFSKxyThxaLU0+7MJRJVlF6sn9mgO
	 XcLE+IHndrALg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: dmaengine: Add support for
 ATCDMAC300 DMA engine
Reply-To: sashiko-reviews@lists.linux.dev
To: "CL Wang" <cl634@andestech.com>
Cc: Frank.Li@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, robh@kernel.org, vkoul@kernel.org
In-Reply-To: <20260610095724.1980622-2-cl634@andestech.com>
References: <20260610095724.1980622-2-cl634@andestech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 10:11:50 +0000
Message-Id: <20260610101151.AA1611F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The schema uses `additionalProperties: false` instead of `unevaluat=
edProperties: false` while referencing a common subsystem schema.
--

commit 0c4fc28dab967baedae4dfdcb32dfa0eb77d45a5
Author: CL Wang <cl634@andestech.com>

dt-bindings: dmaengine: Add support for ATCDMAC300 DMA engine

This commit documents devicetree bindings for the Andes ATCDMAC300 DMA
engine, which is embedded in AndesCore-based platforms such as AE350 and
Qilai.

> diff --git a/Documentation/devicetree/bindings/dma/andestech,ae350-dma.ya=
ml b/Documentation/devicetree/bindings/dma/andestech,ae350-dma.yaml
> new file mode 100644
> index 0000000000000..f040a2bf7d4b9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/andestech,ae350-dma.yaml

[ ... ]

> +allOf:
> +  - $ref: dma-controller.yaml#

[ ... ]

> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - "#dma-cells"
> +
> +additionalProperties: false

[Severity: Low]
Does using additionalProperties: false here prevent the use of common DMA
properties defined in dma-controller.yaml (like dma-channels or
dma-requests)?=20

Since this binding includes another schema under allOf, should it use
unevaluatedProperties: false instead, so that dt-validate correctly
evaluates and permits those inherited properties?

> +
> +examples:
> +  - |

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610095724.1980=
622-1-cl634@andestech.com?part=3D1
