Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2EF46AED8;
	Tue, 28 Jul 2026 14:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785250432; cv=none; b=i7b3iVsq7lyP1OqhEbDAIDkFOuYkcTj6MgvtFXRdkrPSItmAI33U4RZ5sqyXFrdwVYXsSiDy3nsKedAcbDMIsb+0HwBWKV0icupG/98x1AhOY2sPxGnZ9HQMGLBgTpySLL/IDoSlUj8Un587Lhbqth/GHV1+LDRziPEMVeEBJNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785250432; c=relaxed/simple;
	bh=oBaHWlQnrILHPa0mO7+mFvkraHd6ieCzXYoDJv6wum0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C4aX5gb2a+twA6gw+H7T1NeS7MMyKVtw0OUVGDzPkg6WCvtRr/jKAXa+8Z0bgv5zf1jMm0GKABAKwFF4z+xMTSiWB1Cu89HjD4A3yjrF2YpzlD1vFK9rnhyeuxl3vMLfuBDQfPRAHihFaKL+6DjV80WFl4TPySYw9rW4K6koJAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=miPWVnWc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="miPWVnWc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A0D51F000E9;
	Tue, 28 Jul 2026 14:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785250430;
	bh=SS1cRxp3/KB3KUKGAVE1kSpfoXM4gnIaChKSHHucERo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=miPWVnWcsOI+OuNBKOe4LlBOuDXxFG2B4Hki5HzLByaM13R4ARO1zLIFtw2aqS3UP
	 pfhxuZ4DP56m0cQTQ5PuRz9S4kJs9AKETtLOID0js076IbSzWsZYHeVAO99JjB1vI2
	 brtIOJUk2w4aswMWyBG7g4+eoaktAKGlnGhzIbCzofLfyAmYsFJWmNfqgcRZQRvfHD
	 30qNO7JnIHWrGNlGeuvfc+++BNzbwoZGgY9vLBmXHyVi7zhovPFoN7cEZbcsaoc5eW
	 RCbxtkgU0J/jkfAiYPl+E9GhNQDWOm3qDm7AX4+4bfFXCHEhO2MJVYIH3bsBFAU4xx
	 ZUTCkwGqkcqdg==
Date: Tue, 28 Jul 2026 09:53:49 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Janne Grunau <j@jannau.net>, Frank Li <Frank.Li@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
	devicetree@vger.kernel.org, asahi@lists.linux.dev,
	dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: dma: apple,admac: Add M3 generation
 ADMACs
Message-ID: <178525042882.2159707.3534959855317111869.robh@kernel.org>
References: <20260725-t603x-admac-v1-0-6a4dec023f02@chaosmail.tech>
 <20260725-t603x-admac-v1-1-6a4dec023f02@chaosmail.tech>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260725-t603x-admac-v1-1-6a4dec023f02@chaosmail.tech>


On Sat, 25 Jul 2026 14:25:56 +0200, Sasha Finkelstein wrote:
> The admacs seen in M3-generation SoCs (t603x, t8122) need additional
> configuration writes and so are getting a new compatible chain.
> 
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
>  Documentation/devicetree/bindings/dma/apple,admac.yaml | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

