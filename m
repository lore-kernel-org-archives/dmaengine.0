Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D048320CD3;
	Fri,  9 Oct 2026 05:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791523761; cv=none; b=mxJGb8kchXhzYz2b+O25qmAvUZQzOsHVaqSkA1sDWVbK/vo4asYD21xAA699iHvSoauTkuXa5tndzpv/NBqXNKJ4j9D3UjcXgRP06uHSbg+VWVksSR+u0jfBeQ8BM8ZSpCy80phxeY1gTeKU8rVnt3aM4flv6c5bZh00iDPrnkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791523761; c=relaxed/simple;
	bh=BhVEXecLHkJlr4CLW1M8J/mJZIt4CxSAtbRyr83thVQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=ZlWCewX4uu8dvwBMrNLnVD74mpa8lAlqxLcsMg58c9efKD0yHz54aTqP0dLyyM1IvTAU1mZKkg+4gze+t/M4SjlBLk7xrj3fOMcBlwCxyW86TOfBBZLMdhbfxLl53ANS/9ix0Qj5ovn2di/EzRTR/M+XxGjWfovyKULBOy3o9oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XkUbkhnT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XkUbkhnT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E764C1F000FF;
	Fri,  9 Oct 2026 05:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791523760;
	bh=4knVRljDUrxoWF8PuOl/OKNfpQriFhhOlmjb4Hd2/5Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XkUbkhnTv3HcAHUpkglQJBZwDOs7yFCH5czsA4MwR566By6WYqr5uPbR9zd5989wU
	 wdN2+/cW9S3qvekECVNVOud0vHC+ykXljs+daHDe073yU4Jf9alcLDjyDBSGA01NLU
	 ObnAVixcN5fO1BKwg/Z8WtwyFLBDHuZAKNuGw3mDVih8yAnsUw3+8l31HuyLpJ8PqY
	 y8TAIhoIKEi8JKM2/5ZbkbrMtVN6IH4jD6t1WUtlYADPFhhSCMUNyu3CoabxiumE0p
	 e6p0thlsl8ThuodQs6NXNknw1LWywEFgUpHFLbOBmVWcnBFQtYtu7tKbDaxAGjk5ZK
	 tP7p2Dxz5imQw==
Message-ID: <sashiko-outbox-164895@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/6] dt-bindings: dma: arm,dma-350: Document the CIX
 Sky1 integration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jelly Jia" <Jelly.Jia@cixtech.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20261009051846.1115962-5-Jelly.Jia@cixtech.com>
References: <20260907033404.596839-1-Jelly.Jia@cixtech.com>
 <20261009051846.1115962-1-Jelly.Jia@cixtech.com>
 <20261009051846.1115962-5-Jelly.Jia@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 05:29:19 +0000
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: missing conditionally required properties for CIX vari=
ant
--

commit eb2125af359ef3d09ef34a9e3764a921df335fef
Author: Jelly Jia <Jelly.Jia@cixtech.com>

dt-bindings: dma: arm,dma-350: Document the CIX Sky1 integration

The CIX Sky1 DMA-350 integration is the same device with SoC glue around
it, so it is described by the arm,dma-350 node itself with an additional
"cix,sky1-dma350" compatible rather than by a separate wrapper node.

> diff --git a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml b/Doc=
umentation/devicetree/bindings/dma/arm,dma-350.yaml
> index 429f682f15d81..3b991985c416a 100644
> --- a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
> +++ b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
> @@ -11,10 +11,23 @@ maintainers:
> =20
>  allOf:
>    - $ref: dma-controller.yaml#
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              const: cix,sky1-dma350
> +    then:
> +      properties:
> +        cix,irq-router: false

[Severity: Low]
Does the allOf block in Documentation/devicetree/bindings/dma/arm,dma-350.y=
aml
need an additional conditional block to enforce the required properties for=
 the
cix,sky1-dma350 compatible?

The commit message explicitly states that the CIX integration needs a clock,
a reset, and the syscon (cix,irq-router), contrasting them with the
memory-region which is described as optional.

However, while the block above successfully forbids cix,irq-router for the
generic compatible, the schema fails to include an additional block that ma=
kes
the newly added integration resources (cix,irq-router, clocks, resets)
mandatory for the cix,sky1-dma350 variant.

Incomplete device tree nodes using the CIX compatible could silently pass
schema validation despite missing these hardware resources.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009051846.1115=
962-1-Jelly.Jia@cixtech.com?part=3D4
