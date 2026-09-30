Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11363D6CA3;
	Wed, 30 Sep 2026 10:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790763734; cv=none; b=Nc9J91iYphH/qdkoXgn9Rg74C+tpAmcJWjRaSAhLZUwKNEl7G8KiifT/uHVXDeQgM+iwIEMiO5LCJpI8sO/VVrpCGlj42cklq4T64VInoGyN7tGdJum/AoNZz1duvznYwdC69QsIdD5F4QX1BG7NxpNtNcyfYYEpbw37HtDI2vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790763734; c=relaxed/simple;
	bh=fn+6JkbI/dBm1vUqHGCvnuSIX4G+50pN5naJvI6aUrk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oawLI4pKrsxJqnQnEUm3It/l8dEYH3Ih7fOnaKBFJnPdftI2LBEqdCKwO0uoNyrm7+imXa86R4Oz9rjjXc6gpc0YjBhFc8LzNEJWDHI2IBIBAF/urt5fHKT4fe1stxAZ/f8xHcVKiKKQ9WT7ZhiVmWaHI6eeBwcL9Qw+ttQJYc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N1E8EkoI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N1E8EkoI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67D7F1F0089D;
	Wed, 30 Sep 2026 10:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790763732;
	bh=EiSeSFm/kvhrLzh49a4fyoEhiJlFq4d9oEzzedhJddY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=N1E8EkoI0GGLlh0efxN+9NG47E0OkIxtsBgMxqAi+aviD+YvVKadlqMSpkJPzVMlD
	 h5RVFJ/fCY6vzN7ybGnMpz23Gz+ytXgUqEZW2hwwPXeeGak/bHkVYPtlbZcOEM1vPo
	 zYrwIqnJNFzUJkc50gQ+09EjE7nTuCcwkt3ODbxjlq6hNb1ArLwzGwhlaKeZgJMcCj
	 GsnYzm8uLZP3Z5vr3sqJ+AgXqNqJPndhPjp2Kk8z3BlRpYBP9wgUB/bwml+wCtBNY6
	 6djCPwjkOekD1mhAxyr9ZY9Tpf9Jydp3YlY/eFEODDoAIc2UpojC/bV1GngcTLp6z0
	 T6bK5IHMHWTTw==
Date: Wed, 30 Sep 2026 12:22:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>
Cc: peter.ujfalusi@gmail.com, vkoul@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com, ssantosh@kernel.org, 
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, vigneshr@ti.com, Frank.li@nxp.com, r-sharma3@ti.com, 
	gehariprasath@ti.com
Subject: Re: [PATCH v10 14/19] dt-bindings: dma: ti: Add K3 PKTDMA V2
Message-ID: <20260930-reasonable-lemon-salamander-c23e99@quoll>
References: <20260928025749.1055383-1-s-adivi@ti.com>
 <20260928025749.1055383-15-s-adivi@ti.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260928025749.1055383-15-s-adivi@ti.com>

On Mon, Sep 28, 2026 at 08:26:20AM +0530, Sai Sree Kartheek Adivi wrote:
> New binding document for Texas Instruments K3 Packet DMA (PKTDMA) V2.
> 
> PKTDMA V2 is introduced as part of AM62L.
> 
> Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
> ---
>  .../bindings/dma/ti/ti,am62l-dmss-pktdma.yaml | 189 ++++++++++++++++++
>  1 file changed, 189 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-pktdma.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

