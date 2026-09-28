Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877AD3B841D;
	Mon, 28 Sep 2026 19:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790624683; cv=none; b=cn/e8fjpVgSrNv/S8z2Lxam7K6u4ovkItmBCd24TOK8mHICyIONhaKncuATpET0XDY+t8zRSq3jZPT+255Ow0fpoYwZ5zv1YEWVH/bbt2Zkss4e6wqOri74vr49GW8N17gIslCeA8FDNIUfkLXrnzP0lBYKrYG6P8+lWrUi/77w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790624683; c=relaxed/simple;
	bh=WeaA8NBlvBC/UG/Kpw+k2Tulm0LYGFvuZA+GkVjvwvo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ltIoox3rs0XO1+zbSQ4xr4i0uTJkzRnYVBZdtwvc7ugrC2j0u6Y2ZcbyPBGR/buouiK4bLeP+un3zf0/haOOWuqVSV11DtfRhUDfgyn/nAuX/6yS+Dub98VLPaQ5xHqXqP7bl32fydsTBNQJ3nEnQ3FsQtOAu03KVUfNO7zquts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HcQisCwV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HcQisCwV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0994E1F000FF;
	Mon, 28 Sep 2026 19:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790624682;
	bh=69EJUF4pWM6dnN+l88QzHhnBhm4evf/H41/QXLxdlHE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HcQisCwViTNlPHY9jL8e9hHzDiw9Y0zdEn/5TZ8hBIsa3aW+MyB64PRh3WYWk6CAQ
	 Aiiql11WQM2KhwWNFVA8PM2bdhVVwPiiMc1yh7ZHVUN9ZbuyEu5ID8imXfQWJfSH/Q
	 VAW8wZyajaxibjnDfBzMkUDZprIaz/SeE5GolfIVXnK8K7jBolf9KH6V7wBr1Hzz+p
	 nD4IjJJVvsBwH6wCaemaoHUA2rr8HTvY19ydjGX+P6dpXuQIwahYMgO/FayUHNWIVH
	 T+6ivtKHaEnbq1W9ihARu3nHX+3cJKJvFH+4DvSFLyLZWoBh3poG0xcVO/cd4suXHM
	 39glQ1wDRjjDA==
Date: Mon, 28 Sep 2026 14:44:40 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: dma: dma40: Restore disabled-channels
Message-ID: <179062467960.446201.16508814908321142205.robh@kernel.org>
References: <20260918-dma40-dt-disabled-channels-v1-1-0f691109d8d3@kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918-dma40-dt-disabled-channels-v1-1-0f691109d8d3@kernel.org>


On Fri, 18 Sep 2026 17:46:45 +0200, Linus Walleij wrote:
> The conversion of the DMA40 binding to YAML omitted the optional
> disabled-channels property from the original text binding. The driver still
> parses this property, but additionalProperties: false rejects any device
> tree using it.
> 
> Restore disabled-channels and constrain it to the physical channel range.
> Also constrain memcpy-channels to the limits enforced by the driver and
> reject duplicate channel entries in both properties.
> 
> Fixes: 23fbc87c8ae6 ("dt-bindings: dma: Rewrite ST-Ericsson DMA40 to YAML")
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  .../devicetree/bindings/dma/stericsson,dma40.yaml          | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

