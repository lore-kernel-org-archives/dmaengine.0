Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42DE23DB330;
	Fri, 26 Jun 2026 08:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782461094; cv=none; b=Qy4y6xI/P5oPmODn1XZt3gOjQ5XgaeRYTG4RC9gOVdGONW783AD2lidjk2KVaRMYIdpVg+g/qui7vJ1GhgWMOEzRWpDVv6UHYqqre1Qs7TKiYACg8uM2On7WF3j5t+PfZGB7Ia8suJxc6cCUEDSVJ3OmxYoIKRaK/s5SrDnhINk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782461094; c=relaxed/simple;
	bh=Bw/RJ2z9s3NYhnGepxI3RDI98k0HoIx/UjlAtf/9xc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sueI5z3tlxJ5VnaCoHvdTJl5JCCYWqR6ybGgwrW8QvL77Z+g5YGR3034wGiSpW2/i/r4urOoKczU8CWdgI8PQuhHKoTdn353MD68/mJSJOMe894JdlWUs6JIrMBjF9E5jjN5Hbg3SYScEMjCu+xaU8HlpTibeQ4h+hP5IGhj274=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F++xT6rk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F++xT6rk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B0981F00A3E;
	Fri, 26 Jun 2026 08:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782461092;
	bh=Sk7CWkvXC8D8N45tPv22wE83pLMkYTSkRNxQDotlMwA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F++xT6rksaeS/VJab8BjQNNa+HvQhPy0lTov3XUjYULif5N1yPYr15U7B6cLCpdsD
	 ierIUq8UTvtc4a0wRvvLvXe1rPQA+JI/Ar3wVFonkMVtpkulGl01ZL5ZK39CkrHUNy
	 Ql9WdlNlVDTY93SW5noabNueoydtNsSZ7W6X0mxCFBQx9D98a/ePWIBu5hXIMklJeJ
	 Ei7iFV8gon9ttpyuOy67z62io19x5vzPFRKH6f4C+N6QVf5lbk7armchxO0mqN5Rt6
	 cjluFHuvW1mqQMqiY+bjl4H42jJKZyNz2r5xNXvHlvuSYmmjXFrRszFfOtuniV8TJW
	 3Qgr6aVCnHkMw==
Date: Fri, 26 Jun 2026 10:04:49 +0200
From: Vinod Koul <vkoul@kernel.org>
To: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Cc: Olivier Dautricourt <olivierdautricourt@gmail.com>,
	Stefan Roese <sr@denx.de>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: altera-msgdma: replace maintainer
Message-ID: <aj4yodoqp-ZWQVEs@vaman>
References: <065e447dc41ea149c900338e64f047575ca6c348.1782279704.git.adrian.ho.yin.ng@altera.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <065e447dc41ea149c900338e64f047575ca6c348.1782279704.git.adrian.ho.yin.ng@altera.com>

On 24-06-26, 13:49, Adrian Ng Ho Yin wrote:
> Olivier Dautricourt has stepped down as maintainer of the Altera
> msgDMA driver as he no longer has access to the hardware. Add
> Adrian Ng Ho Yin as the new maintainer and update the status to
> Maintained.

Olivier okay with this?

> 
> Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
> ---
>  MAINTAINERS | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9b787bc2855f..1f515256412b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -952,10 +952,10 @@ S:	Maintained
>  F:	drivers/mailbox/mailbox-altera.c
>  
>  ALTERA MSGDMA IP CORE DRIVER
> -M:	Olivier Dautricourt <olivierdautricourt@gmail.com>
> +M:	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
>  R:	Stefan Roese <sr@denx.de>
>  L:	dmaengine@vger.kernel.org
> -S:	Odd Fixes
> +S:	Maintained
>  F:	Documentation/devicetree/bindings/dma/altr,msgdma.yaml
>  F:	drivers/dma/altera-msgdma.c
>  
> -- 
> 2.49.GIT

-- 
~Vinod
