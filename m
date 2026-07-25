Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7942571D7;
	Sat, 25 Jul 2026 15:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784993275; cv=none; b=QDOSsWWGcltyMDfx1tMYGA2723pGZ7/7oK0vOng4yCkIpVjISZVs4a6W9D6sy+CAslUB2DYvrj1uphA9XTY4Efiu1KKnq+wsq5f66jq7SMunxw1fK19uU4D0eEuyWYJf6h0tqezrrr9k0Y99VUHossG3+qCO/f3edW9fUW3ZAcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784993275; c=relaxed/simple;
	bh=FoU+5XiqKHR92vLRd+xjHoG+5pArlDe8WaiU9BmlsLM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NdeyiL5fTvBnIHmRtqsrZ0olSBBFix4E8OyyLga1lYeEyIDZloPO0+Wl3IzSmythLH4kkoU1ZTv9HC3hUOKF/vlt2PEK0naqNSw/GvlPofQgPK/8Y1bilzu3pu7ZfU7916DNsNs9xIigO9CxoI7zJ+xMempvn8oM1PdTi2S1HTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P+P0rPlq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P+P0rPlq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D23F61F000E9;
	Sat, 25 Jul 2026 15:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784993273;
	bh=DoGEFV9W8VcfITu4HQVE0hQUFylWMzhgH6YtxdV5TFY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P+P0rPlq9J7moW6oZrKzpl0OkghAB/d/MPzcY7VwjuxKRY6QXyxEKv83oSiNcUiYI
	 hObpIvzZO8OWOqxJjhQPoOHCrAcaLok3GzuDJMHrwow0pYGjeujc3uXg5aaW+xVJBd
	 FkXXB94B7IIrxNUYH6BDeNW4xQ0GCwHo2vzV36wjP8V8XpP7dzNtZ8hIwtXvluTI1+
	 LpJ634Ud0gFeSrYZk8LXVOHLs2aolJI0dGbM2AbRpa1Cnc7bSr2MpoA2nHEoT7MDh/
	 KZoxpUxdfcg/vVInU9f3+yDtEeT/Eq39M5fgRmfFUox9rl6p52K/EA5jIdUaJW5tGY
	 mMNqT8KRk34Kg==
Date: Sat, 25 Jul 2026 17:27:50 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>
Cc: peter.ujfalusi@gmail.com, vkoul@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com, ssantosh@kernel.org, 
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, vigneshr@ti.com, Frank.li@nxp.com, r-sharma3@ti.com, 
	gehariprasath@ti.com
Subject: Re: [PATCH v7 14/19] dt-bindings: dma: ti: Add K3 PKTDMA V2
Message-ID: <20260725-massive-meteoric-guppy-70569b@quoll>
References: <20260724102115.2854-1-s-adivi@ti.com>
 <20260724102115.2854-15-s-adivi@ti.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260724102115.2854-15-s-adivi@ti.com>

On Fri, Jul 24, 2026 at 03:50:47PM +0530, Sai Sree Kartheek Adivi wrote:
> +      cell 2: ASEL value for the channel
> +
> +  interrupts:
> +    minItems: 78

Drop

> +    maxItems: 78
> +    description:
> +      Interrupts for DMA channels.
> +
> +  interrupt-names:
> +    minItems: 78

Drop

> +    maxItems: 78
> +    items:
> +      pattern: "^(t|r)flow([0-9]|1[0-3]|1[6-9]|2[0-9]|3[0-9]|4[0-7]|6[4-9]|7[0-9]|9[6-9]|10[0-9]|11[01])$"
> +    description:
> +      The name of the interrupt corresponding to the DMA flow.
> +      TX flows use the "tflow" prefix, RX flows use the "rflow" prefix.a

This could be tx-123, instead of tflow123 (and same for rx- instead of
rflow), feels more readable, but not really important.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

