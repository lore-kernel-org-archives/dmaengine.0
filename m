Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE233783B4;
	Fri, 28 Aug 2026 10:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787911935; cv=none; b=oZaRJtFwTu2Nlvs7Zh7XVBVnf0xGsORmarFFHtMxhlbJ0Y0lBOzSL0+EZJz3AB/vf0fUYfNmPnBFijR80HZ+cTqpJVJd9lcXIdPiEKg/xgYycxHYcmKcrljVVZxl3g0LuQY0iMPZvMTcQGyQMnvgIB3diJs8BaxZYpnmFOCySok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787911935; c=relaxed/simple;
	bh=l6Cs1HqLMja34fVqSpG8q2hb6XHTfmt70otBo7dZnrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SfNMRPCvf8VCX4AzJwmSrT88R3l8VmfFCeXDhHmL5rvADzZQSstKodWxPEHoIIn5xjgFnXWahe/hL8mXdLqe4oE8v8Rw9irPE1/qMeX8HgEU1zVitBl2ZLFm4w5jDbd8C1EeyiLJ21ZxTg+tQAzH4ybINd7OdKyzMQ1OezbJLxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gs5e8ctH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gs5e8ctH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E0191F000E9;
	Fri, 28 Aug 2026 10:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787911934;
	bh=pTqaHcxSoMIpsNUS2kJWMDjPrtB98h8ByxoQCkcbefs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Gs5e8ctHzFUf+nIZDJQqMETXg2b/nAqcqoWJNvAVNnrrlbThEfjwG0TP9UaN9ovgC
	 x0er9romxmMu+pAusk4nHMiyP5EgarNcZUZstayAncRHDJh1aH+pDAY/xtmNVTPwGN
	 dIlc9506j6fdyzbN4E0Sw1vnvBxkyJhNMHje/JJs2R0umTjMvlr6M0bQ+0nxlO1qvU
	 2k4fx2reJNyEs8fxlDbyGtEWe5UOl+pNFOrcIWqquIYgsX4EF0L69z1d9KuJ5kHbr7
	 DuKt2OJLWdxzLYc5cCm8MvurXSMf0klHcsOisB2y2TZvdew7tGe0fPQNAo/+/n+Xjb
	 iyksKbdAVKQYw==
Date: Fri, 28 Aug 2026 12:12:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: renesas,rcar-dmac: Add support for
 R-Car X5H SoC
Message-ID: <20260828-proficient-tasteful-shrimp-0bf503@quoll>
References: <20260825141542.30901-6-wsa+renesas@sang-engineering.com>
 <20260825141542.30901-9-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260825141542.30901-9-wsa+renesas@sang-engineering.com>

On Tue, Aug 25, 2026 at 04:15:45PM +0200, Wolfram Sang wrote:
> Also add the familiy compatible because X5H is the first R-Car Gen5 SoC.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  .../devicetree/bindings/dma/renesas,rcar-dmac.yaml          | 6 ++++++
>  1 file changed, 6 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

