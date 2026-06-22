Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09D1372EEE;
	Mon, 22 Jun 2026 10:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782124901; cv=none; b=V29YK/NlKNVW5FJI4fgF9BNAFiC7M1CUYlYNApg3692ujlkn7Y5mgAXO4Ew7nCTFp6QsqapnINDaPl0G2GkHsIEH3FXvZsGrjCZMSGRxtR49V2qLxa9R+GUBHdE6VBFP7F0Kozn11NH0ZevaGc051me1bjtndaYwjiskSLCLVV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782124901; c=relaxed/simple;
	bh=u7j5UXKSzbuKih/WfpiZo/CAarErkz+RknTjZbV8nuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tfzMas3vFBHZkvzNtQfNZgd+iYYfEgL2Zt69vh4fmku6CnwN68vXMOUxLR3ImNvzq/zfBIC+eBzo3wiVFHrNVapspLjtx5Jf4zKmGAfvdmpaV3+2Me0HfjQiianDEbDLVnxg5B9Hlh6NkaFa6g/cuI7I0sPd7RIJMb5CtzZyTAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a05AeJ2P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a05AeJ2P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BC591F000E9;
	Mon, 22 Jun 2026 10:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782124900;
	bh=UiliuuOVjwYb2973zyov9AYHPa1hvkQkF2eaAVJrrMk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a05AeJ2P5OTFGfve6EbbPxM5WUlF9yDZGZasSRH7idEdKv7LonTJwuOxaQKO/G8sU
	 FXW0FUDlgUCllct3Qv/WsefJcj5Q/eyB+3Z+RWD0WTXOFHz9ihTHU5KX+v+LROfSiT
	 G8gVyYfo45YxbyJvS4zITqMGN7jQDsSZrb6MBdCKM2YxqW/3WGMdEu4XPzAPkiRLjW
	 IoIfP/NnnL+YHjXUNq2VgUMX5reMy9ZOlVrNEc2xvEkTgqX+Un9CBTECh+Z3IMFzlB
	 pvozdIcjO7pMyo4lgflnXLL8BedQAtKeimsmKj2dLkFMROSxb69km9fGn/MSTJgKw7
	 XSJZMXQwBjSmg==
Date: Mon, 22 Jun 2026 12:41:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yuanshen Cao <alex.caoys@gmail.com>
Cc: conor+dt@kernel.org, mripard@kernel.org, krzk+dt@kernel.org, 
	robh@kernel.org, samuel@sholland.org, wens@kernel.org, jernej.skrabec@gmail.com, 
	Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 4/5] dt-bindings: dmaengine: sun50i-a64-dma: Add
 allwinner,sun60i-a733-dma compatible string
Message-ID: <20260622-fragrant-aquamarine-porcupine-4a3ebf@quoll>
References: <20260622-sun60i-a733-dma-v3-0-f697ef296cbc@gmail.com>
 <20260622-sun60i-a733-dma-v3-4-f697ef296cbc@gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260622-sun60i-a733-dma-v3-4-f697ef296cbc@gmail.com>

On Mon, Jun 22, 2026 at 01:36:26AM +0000, Yuanshen Cao wrote:
> Add `allwinner,sun60i-a733-dma` to the list of compatible strings for the
> `sun50i-a64-dma` dtbinding documentation.
> 
> While the A733 DMA controller shares many similarities with the sun50i-a64
> DMA controller, it requires a specific configuration due to differences in:
> - Interrupt register layout and mapping.
> - Number of channels per interrupt register.
> - Support for higher (32G) address widths in LLI parameters.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
> ---
>  Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

