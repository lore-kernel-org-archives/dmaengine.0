Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF6637475B;
	Wed,  1 Jul 2026 07:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782891418; cv=none; b=THvV5hEcTzHMELrjHDl6bcdTCWJh2DLUyQBpv0jj57zfePhM/wcDfmjOA16/zvGDu3+0HyDVVnrVtF8T1+vgFr/Q/KW5HIgEI5N4PHbL4r2C3Lva/Y+a92LaRJIkF33GQ+QuVxrZiBGWBUf+JjOy8GEAfaH1UgTxbRlzpyrLg10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782891418; c=relaxed/simple;
	bh=sb7MtjAPvN4H8CvDnNzFLVettlgxFgu3xYo1XaigWyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hm6hC2Q+BDXF2zUSYptYknJNJxWmim3PKYJ5rp4lUzU8XS+Gdg4jvjJBWlGD341lV2P0BMjPGjT236+cKD96TzamaeHU5ZtRGgppyNCgvhwyQiO3hdZupnEnWU7XyhfAoN9W6ZZt1gqACX91dHVZ9Aae3fsk5MA5BwERzdNCgFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a5zjPmjf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a5zjPmjf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDC701F000E9;
	Wed,  1 Jul 2026 07:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782891417;
	bh=DljkT19cUqE3l4MrFgOZ8ywoQMMd4Lg1hWzeciZWhcE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a5zjPmjf4riyt5ohCPNx+za/l1ZUbdqiuzElNLxvPRQHMpZU5+Daj8IZFtHIP94UB
	 MmVDSteuTVAd1A9EVhgxTY1Zqva+4Cevv5cSJ6pNJbggmHVKmvHFHQTC17ujHsFkul
	 tey8qV1M2p3mIiU8yQnE2UUzHRckXpbd20Yg647mixIsbcAm2UWxd2ZTyBID1z0bnq
	 HYgWEjEgBZCup+S6BRXR8lb2/OdY6RdzPEHBMjlWh1crmAZF7PFaRUKZpzwe9MyUbi
	 UH/z1QEAAtpiea0v3pU2FZOrtq2dadLJgLZ5P++idq23H5RRWBlHBYMRSf3UDpVaP8
	 5JnHCkeo3upNQ==
Date: Wed, 1 Jul 2026 09:36:53 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Cc: Olivier Dautricourt <olivierdautricourt@gmail.com>, 
	Stefan Roese <sr@denx.de>, Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: altr,msgdma: update maintainer
Message-ID: <20260701-tactful-viridian-horse-3fa1f5@quoll>
References: <20260701023455.36330-1-adrian.ho.yin.ng@altera.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260701023455.36330-1-adrian.ho.yin.ng@altera.com>

On Wed, Jul 01, 2026 at 10:34:55AM +0800, Adrian Ng Ho Yin wrote:
> Olivier Dautricourt has stepped down as maintainer of the Altera
> msgDMA driver as he no longer has access to the hardware. Replace him
> with Adrian Ng Ho Yin as the new maintainer.
> 
> Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
> ---
>  Documentation/devicetree/bindings/dma/altr,msgdma.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

And maintainers file? Don't send such commits separately.

Also, subject is too generic - "update maintainer" can be any update...

Best regards,
Krzysztof

