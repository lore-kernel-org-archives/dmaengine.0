Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB5D46D09B;
	Mon, 12 Oct 2026 08:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791795062; cv=none; b=n/u2MN7U/rMVT2g4TJqvNKEiDdUR2IQuv++QvONurtj8kHpX12KTcn7+ytedmN22lSvKZu+8dFZcmPfzpH/9kkyyOYHsjeHyHeEMSsqmYvE3FMRXt9PhGYRU/xo03nN0a7f94QO1wHwYqYRX+ebwajs6N5HvE7h1zhbP4cWb3LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791795062; c=relaxed/simple;
	bh=reiBIdHoLCLchV16rS2mUhkqhpuQr52DAA5xPqT8FCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VLgqqDV4L5VKr6RZSnr2Mct6zqE2n0yaIJAd2uvSzQaf29dn3iPxOGkGSlxb116Z4QSsnyC0DTXpfNTZx5QuA4BT/ESzx3Z20bi953eheYd9KwMFxqDafD/CxWDo+jPDJlc0+o6lfwHbSkP/w7nTsTAQjY34UDHShrq8JEp36aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a98O/BCq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a98O/BCq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C95661F0089B;
	Mon, 12 Oct 2026 08:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791795060;
	bh=Oo77ofVgiaIxk7/HrKuQfjrMk2AzM4yZPId3+7w7fvk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a98O/BCqbhHG2B1sOa/v0bIuNQWRfDrKDF+LKT5WJDfjFQuFAhmADi3OaIuCg7g05
	 FE3TzyQYdv9tVBix7xQdchnWrvdNrXW2UPUdkw+CNm0iNoycyRu7npZ1zvMzzvWWyC
	 OU5TzZfqJgU14HdjCeBaOpDvbThSdoNYpXskij0webDBwdCmQLEIbhQ2iMSkOiZFtY
	 rgNFRJ2axy5nVPM9HACbGCWxmljvLHPhMjxzUJCmMDNNDjm/NNfIxVsUcnyEd++dzB
	 /Uqx87F/5dqH4XN2vOeUWIA5qU6TuncVYXoeKFDcS8M+jNbEa27NGnN/7r+Z+Fy4q8
	 hhRULsAqye2/g==
Date: Mon, 12 Oct 2026 10:50:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jelly Jia <Jelly.Jia@cixtech.com>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, robin.murphy@arm.com, devicetree@vger.kernel.org, 
	Frank.Li@kernel.org, cix-kernel-upstream@cixtech.com, dmaengine@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/6] dt-bindings: dma: arm,dma-350: Document the CIX
 Sky1 integration
Message-ID: <20261012-velociraptor-of-improbable-upgrade-bfe14a@quoll>
References: <20260907033404.596839-1-Jelly.Jia@cixtech.com>
 <20261009051846.1115962-1-Jelly.Jia@cixtech.com>
 <20261009051846.1115962-5-Jelly.Jia@cixtech.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261009051846.1115962-5-Jelly.Jia@cixtech.com>

On Fri, Oct 09, 2026 at 01:18:44PM +0800, Jelly Jia wrote:
> The CIX Sky1 DMA-350 integration is the same device with SoC glue around
> it, so it is described by the arm,dma-350 node itself with an additional
> "cix,sky1-dma350" compatible rather than by a separate wrapper node.
> 
> Extend the binding with the CIX compatible and the resources the
> integration needs: a clock, a reset, an optional reserved memory region
> used when the controller cannot reach all of system memory, and the
> syscon that routes the channel interrupts to the AP interrupt
> controller on Sky1. The cix,irq-router property is only valid together
> with the CIX compatible.
> 
> Assisted-by: LLM checkpatch sparse dt_binding_check dtbs_check

Only LLM. Drop all other tools, which guidance asked you to put here
build process tools?

How is it even possible to assist here with sparse? And really,
mentioning checkpatch is just wrong. EVERY patch must run through
checkpatch, with no exceptions.

Do not attach (thread) your patchsets to some other threads (unrelated
or older versions). This buries them deep in the mailbox and might
interfere with applying entire sets. See also:
https://elixir.bootlin.com/linux/v6.16-rc2/source/Documentation/process/submitting-patches.rst#L830

> Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
> ---
> v1 -> v2:
> - Folded the integration into arm,dma-350.yaml: the Sky1 DMA-350 is the
>   same device, so it keeps the generic compatible plus a device
>   specific "cix,sky1-dma350" compatible, and the integration resources
>   are described on the controller node.
> - Dropped the separate cix,sky1-dma350.yaml wrapper binding.
>  .../devicetree/bindings/dma/arm,dma-350.yaml  | 33 ++++++++++++++++++-
>  1 file changed, 32 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
> index 429f682f15d8..3b991985c416 100644
> --- a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
> +++ b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
> @@ -11,10 +11,23 @@ maintainers:
>  
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

Entire allOf block goes after required: part.

>  
>  properties:
>    compatible:
> -    const: arm,dma-350
> +    oneOf:
> +      - const: arm,dma-350
> +      - items:
> +          - const: cix,sky1-dma350
> +          - const: arm,dma-350
>  
>    reg:
>      items:
> @@ -36,6 +49,24 @@ properties:
>      const: 1
>      description: The cell is the trigger input number
>  
> +  clocks:
> +    maxItems: 1

So all devices have clocks and resets?

> +
> +  resets:
> +    maxItems: 1
> +
> +  memory-region:
> +    maxItems: 1

and memory-region?

> +    description:
> +      Reserved memory region used for DMA allocations when the controller
> +      cannot reach all of system memory.
> +
> +  cix,irq-router:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Syscon phandle for the CIX Sky1 subsystem register block that routes
> +      DMA-350 channel interrupts to the AP interrupt controller.

Best regards,
Krzysztof

