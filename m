Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3E547DFAA;
	Tue, 15 Sep 2026 11:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789470269; cv=none; b=aMtAKpavx0hRmgIIvdOgnXiPeih0qr9s7ohb7i1bX94KJeQJHpjmtB1ezqhHAXY6UO3csKfBSbSOgncPo7uJgGKE3rqHn0JWAwgivOPMTdkSVjtPo1suVrqSSPs35JrOy/7Abc6JTveJ4CdeJeWCe/Z9C+7ue6hhFDt4gk7wjCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789470269; c=relaxed/simple;
	bh=G1CITcUL4rUIe4CdJPwrnTqS/EgUaciMFnlMyII8MYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=InUfch4U3ne9j1oyemQ9x/jZ/Y62XjR18stNIDUsAgkGjhEDiclRM8/TMrPVzsT5g7TG1KkF4K33PVJYyinAOMacAp1RG5zFyEBPVcl6RUuOGY4mSMWYAMFJvUcGcLEG1zKODxIbW1ARoWqLpfIQI/cyUsBjIAL4g07FWL+CSc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=agQpVdAy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="agQpVdAy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D74371F000FF;
	Tue, 15 Sep 2026 11:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789470268;
	bh=5/BU56m5hr+nm7qNN9JPWRw98TsKltQXZGfNDmvsteg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=agQpVdAyPlrOzRNUeA2HX0orWbarSld1v4ZzsMU8rIcdrPi5UMOzPLP6oOVhyfq/a
	 We3beQlKAK2dqH1FRxcGUdsduFCYTj/cEiWOx8PLUmiN3iUyQx398DqwPaFniYbJAx
	 L73ffSM2SnXQharscpxn34D2YxhMzuNS8TUG+lxermF+8fZRQvsl56WcRCdUVmpZJO
	 S3akshazZRo1M58vUotkJmSJUNNl5FkMUnmezjwy1DhwV8Z6aIlVWXdhqySRHrltAu
	 ASVqYJgodELE5fXf4IEM0ZvYb+nsoDJVjZjTqNp9t/OnBCp1r7J4oJ62l2Fx5KwYv9
	 uXuvw6N5QCaJg==
Date: Tue, 15 Sep 2026 13:04:24 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Roman Vivchar <rva333@protonmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Long Cheng <long.cheng@mediatek.com>, dmaengine@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: dma: mediatek,uart-dma: add mt6572
Message-ID: <20260915-valiant-indigo-potoo-e15ed8@quoll>
References: <20260914-6572-dt-uartdma-v1-1-b26b429ab68c@protonmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260914-6572-dt-uartdma-v1-1-b26b429ab68c@protonmail.com>

On Mon, Sep 14, 2026 at 03:10:52PM +0300, Roman Vivchar wrote:
> Add a compatible string for the mt6572 APDMA, that is compatible with
> mt6577 IP.
> 
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

