Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9BF2332EBB;
	Tue,  7 Apr 2026 17:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775582416; cv=none; b=LQcmVnwKO1Qn4H49N+S3dCePGcuHIlXZhorEIoTgikNioUzcyo7YCJ6cVDjAZDBDR/bsNVcIEZWn8aGFFjHMUYYN398CJXX5ZVc+h26pmSw9f2VkOCAnMncrN1F2+4th32HXwINM4UEvKlmC1cUMbPp1ohJdUYqIOQEDRUvIQrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775582416; c=relaxed/simple;
	bh=BcFJ2putys3P6/zGB23SL08fXAgv8v1CEym5nRQpouk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Es5wT6j9boiNBJrMOj6kgdk51iM0cHHSBH0I7Qop6W7mfmYNNa/K0EAHXihXLWllfsW7JrESmlhkSNYg0TXmNEb5SQLahORxPY8ls6PyJNu/34WG6cibFqjvsShiWaOBVublbG5Lgpe7ZyxfIvAj09tdLW7ei9avq3zlgGHZiew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kuGsitZG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kuGsitZG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B560C116C6;
	Tue,  7 Apr 2026 17:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775582416;
	bh=BcFJ2putys3P6/zGB23SL08fXAgv8v1CEym5nRQpouk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kuGsitZGzFfVbHuQLwYEGw4RMCkz7e9rMLWeqHBYYouyYEZX5YSi+EfHu5jpkUVgL
	 kijgJNJl3WUt34t11eXze1dC3LZ+wMlk7HlKz7K3+epoHvubJjEwUDQv9L1jEGkedP
	 dU5qhYrOe7g/2p9Jdm+2ZSs8XZ2a1Wi+MmxbHJxCxUmdp9eU2i5Tv+n5qh9JN/iCRZ
	 ygIRT3Tn0MGWjhTK0wpVqf2DqNjCq+wdD/GX6nUZPZbiwG8kvkOlps5HriGJ/J4+Sd
	 GqWpwV9Y4XVeswwq9QwfEZzWjA8czQW4S3guo9tFQG8AFzi1APhKp704ClmK6pAIcP
	 KfmLfSUKakTYQ==
Date: Tue, 7 Apr 2026 12:20:14 -0500
From: Rob Herring <robh@kernel.org>
To: Jun Guo <jun.guo@cixtech.com>
Cc: peter.chen@cixtech.com, fugang.duan@cixtech.com, krzk+dt@kernel.org,
	conor+dt@kernel.org, vkoul@kernel.org, ychuang3@nuvoton.com,
	schung@nuvoton.com, robin.murphy@arm.com, Frank.Li@kernel.org,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 1/3] dt-bindings: dma: arm-dma350: document combined
 and per-channel IRQ topologies
Message-ID: <20260407172014.GA3090142-robh@kernel.org>
References: <20260324120113.3681830-1-jun.guo@cixtech.com>
 <20260324120113.3681830-2-jun.guo@cixtech.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324120113.3681830-2-jun.guo@cixtech.com>

On Tue, Mar 24, 2026 at 08:01:11PM +0800, Jun Guo wrote:
> Document the interrupt topologies supported by DMA-350 integration:
> - one combined interrupt for all channels, or
> - one interrupt per channel (up to 8 channels).
> 
> Assisted-by: Cursor:GPT-5.3-Codex
> Signed-off-by: Jun Guo <jun.guo@cixtech.com>
> ---
>  .../devicetree/bindings/dma/arm,dma-350.yaml  | 25 ++++++++++++-------
>  1 file changed, 16 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
> index 429f682f15d8..bec9dc32541b 100644
> --- a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
> +++ b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
> @@ -22,15 +22,22 @@ properties:
>  
>    interrupts:
>      minItems: 1
> -    items:
> -      - description: Channel 0 interrupt
> -      - description: Channel 1 interrupt
> -      - description: Channel 2 interrupt
> -      - description: Channel 3 interrupt
> -      - description: Channel 4 interrupt
> -      - description: Channel 5 interrupt
> -      - description: Channel 6 interrupt
> -      - description: Channel 7 interrupt
> +    maxItems: 8

Don't need maxItems

> +    description:
> +      Either one interrupt per channel (8 interrupts), or one
> +      combined interrupt for all channels.
> +    oneOf:
> +      - items:
> +          - description: Channel 0 interrupt
> +          - description: Channel 1 interrupt
> +          - description: Channel 2 interrupt
> +          - description: Channel 3 interrupt
> +          - description: Channel 4 interrupt
> +          - description: Channel 5 interrupt
> +          - description: Channel 6 interrupt
> +          - description: Channel 7 interrupt
> +      - items:
> +          - description: Combined interrupt shared by all channels
>  
>    "#dma-cells":
>      const: 1
> -- 
> 2.34.1
> 
