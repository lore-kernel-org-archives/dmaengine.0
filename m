Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E3548FF81;
	Thu, 15 Oct 2026 20:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792095647; cv=none; b=cRcNGHPq3xC9gcghhpCQNPO6Vd7DyV+VO02fK87G9blThhPEtzQJCaZjTQrHNECwcctrdkk07M8uhe+Mzu8M2FnlVq5jb0dfkdXvDeZI4ijr1gSzCnuvZo+HU6tGS2kkh9Rieias5lli+wnf5qheClJy8g3i+l43YEXJ1ew8R+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792095647; c=relaxed/simple;
	bh=CVeyxX25w3K/cWfKjOftd/8zHgKTC+R2+G5yGZVSaiU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kO8o2FmWc2API4owmsrudfBy0YwZhJ62UUfZzAQCTD/EP1K+O5gg2iEZMlZurCYiGlFlgKb3LElcWxdX4o/uN6k74cua5iSTIxo6228IiE5YhwCWNVUpH+zMYnQwDJ12bbiioF8I16Uv3nHWneUYM47v8PN7QxOt1ix3YfhOW6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UBn4y+d6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UBn4y+d6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28B0F1F000C4;
	Thu, 15 Oct 2026 20:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792095646;
	bh=7YOUVUAuDJ+LB8A54CxgLAZstJTxkbUW426eqIMaE68=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UBn4y+d6m2uaC4Bq6UF8Iq5w9WgO7AHVyBnXal7TulBgMIBec1PV8r+m+Uly2Ahyu
	 9HAGREL01rwbBVjC350IYOUF5Tpf231E28hxdD+/HReudYDAXae3qm0La+c5xE7r2F
	 xGx7JlEKmY7SDz3P0HLquOcUHraDsfev6ZoNSnte2oKoqp1djm93L0hWsxvA5QSt2H
	 kSuF+iSiT1fUXvbfSF0IUkoz5E+u+1rVvHM3wkTY0hQSxyaQ/slWT9HnfGkrSedz+6
	 i4G4Hy6msS5qrdyhmeikRAVkTAOHK5Q3C9TCirMgzrdmIwB5q8Nf79jYVIYFyBz68/
	 wsA44DDaJQbrw==
Date: Thu, 15 Oct 2026 15:20:44 -0500
From: Rob Herring <robh@kernel.org>
To: Jelly Jia <Jelly.Jia@cixtech.com>
Cc: vkoul@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	robin.murphy@arm.com, devicetree@vger.kernel.org,
	Frank.Li@kernel.org, cix-kernel-upstream@cixtech.com,
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/6] dt-bindings: dma: arm,dma-350: Document the CIX
 Sky1 integration
Message-ID: <20261015202044.GA2956742-robh@kernel.org>
References: <20261012084155.2547480-1-Jelly.Jia@cixtech.com>
 <20261012084155.2547480-5-Jelly.Jia@cixtech.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012084155.2547480-5-Jelly.Jia@cixtech.com>

On Mon, Oct 12, 2026 at 04:41:53PM +0800, Jelly Jia wrote:
> The CIX Sky1 DMA-350 integration is the same device with SoC glue around
> it, so it is described by the arm,dma-350 node itself with an additional
> "cix,sky1-dma350" compatible rather than by a separate wrapper node.
> 
> Extend the binding with the CIX compatible and the resources the
> integration needs: a clock, which the CIX variant requires, an optional
> reset, and an optional reserved memory region used when the controller
> cannot reach all of system memory.
> 
> v2 -> v3:
> - Drop the cix,irq-router property and its conditional: the Sky1
>   interrupt gate it described is set up by the boot firmware and is not
>   configured by Linux, so no property describes it.
> - The CIX compatible now requires a clock.
> 
> Assisted-by: LLM checkpatch sparse dt_binding_check dtbs_check
> Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
> ---
>  .../devicetree/bindings/dma/arm,dma-350.yaml  | 26 ++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
> index 429f682f15d8..4e0f9ffb0039 100644
> --- a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
> +++ b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
> @@ -11,10 +11,22 @@ maintainers:
>  
>  allOf:
>    - $ref: dma-controller.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: cix,sky1-dma350
> +    then:
> +      required:
> +        - clocks
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
> @@ -36,6 +48,18 @@ properties:
>      const: 1
>      description: The cell is the trigger input number
>  
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  memory-region:
> +    maxItems: 1
> +    description:
> +      Reserved memory region used for DMA allocations when the controller
> +      cannot reach all of system memory.

That's what dma-ranges is for.

Rob
